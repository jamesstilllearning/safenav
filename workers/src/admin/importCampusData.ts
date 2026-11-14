/** Cloudflare Worker: Import Campus Data HTTP Endpoint */

import { Hono } from 'hono';
import { cors } from 'hono/cors';
import * as admin from 'firebase-admin';

import {
  getFirestore,
  batchWrite,
  batchDelete,
  serverTimestamp,
  nowISO,
} from '../utils/firestore';
import { writeCampusDataImportAudit } from '../utils/audit';
import {
  validateBuildingsGeoJSON,
  validatePathwaysGeoJSON,
  validateBoundaryGeoJSON,
  validateImportCampusDataInput,
  ImportCampusDataInput,
} from '../utils/validation';
import { verifyAdminToken } from '../utils/firebase';

const app = new Hono();

// Enable CORS for all routes
app.use('*', cors({
  origin: ['https://safenav-cavite.web.app', 'https://safenav-cavite-staging.web.app', 'http://localhost:*'],
  allowHeaders: ['Content-Type', 'Authorization'],
  allowMethods: ['POST', 'OPTIONS'],
}));

/**
 * POST /importCampusData
 *
 * Imports campus GeoJSON data (buildings, pathways, boundary) into Firestore.
 * Requires admin role (verified via Firebase ID token in Authorization header).
 *
 * Request:
 *   Authorization: Bearer <Firebase ID Token>
 *   Content-Type: application/json
 *   Body: {
 *     buildings?: GeoJSON.FeatureCollection,
 *     pathways?: GeoJSON.FeatureCollection,
 *     boundary?: GeoJSON.FeatureCollection,
 *     clearExisting?: boolean
 *   }
 *
 * Response:
 *   {
 *     success: boolean,
 *     message: string,
 *     counts: { buildings: number, pathways: number, boundary: number }
 *   }
 */
app.post('/importCampusData', async (c) => {
  // 1. Verify authentication and admin role via ID token
  const authHeader = c.req.header('Authorization');
  const idToken = authHeader?.replace('Bearer ', '');

  if (!idToken) {
    return c.json(
      { success: false, message: 'Authentication required. Please provide Firebase ID token.' },
      401
    );
  }

  let decodedToken: admin.auth.DecodedIdToken;
  try {
    decodedToken = await verifyAdminToken(idToken);
  } catch (error) {
    return c.json(
      { success: false, message: error instanceof Error ? error.message : 'Invalid or expired token' },
      403
    );
  }

  const adminUid = decodedToken.uid;

  try {
    // 2. Validate input
    const body = await c.req.json();
    const input = validateImportCampusDataInput(body);

    // 3. Get Firestore instance
    const db = getFirestore();
    const buildingsCol = db.collection('buildings');
    const pathwaysCol = db.collection('pathways');
    const boundaryCol = db.collection('campus_boundary');

    let buildingsCount = 0;
    let pathwaysCount = 0;
    let boundaryImported = false;

    // 4. Clear existing data if requested
    if (input.clearExisting) {
      console.log('Clearing existing campus data...');

      // Delete all buildings
      const buildingsSnapshot = await buildingsCol.get();
      if (!buildingsSnapshot.empty) {
        await batchDelete(buildingsCol, buildingsSnapshot.docs.map(d => d.id));
      }

      // Delete all pathways
      const pathwaysSnapshot = await pathwaysCol.get();
      if (!pathwaysSnapshot.empty) {
        await batchDelete(pathwaysCol, pathwaysSnapshot.docs.map(d => d.id));
      }

      // Delete boundary
      const boundarySnapshot = await boundaryCol.get();
      if (!boundarySnapshot.empty) {
        await batchDelete(boundaryCol, boundarySnapshot.docs.map(d => d.id));
      }
    }

    // 5. Import Campus Boundary
    if (input.boundary) {
      console.log('Importing campus boundary...');
      const boundaryData = validateBoundaryGeoJSON(input.boundary);
      const feature = boundaryData.features[0];
      const props = feature.properties;
      const geometry = feature.geometry as { type: 'Polygon'; coordinates: number[][][] };

      // Parse polygon coordinates (GeoJSON: [lng, lat] -> Firestore: GeoPoint(lat, lng))
      const polygon = geometry.coordinates[0].map(
        (coord: number[]) => new admin.firestore.GeoPoint(coord[1], coord[0])
      );

      // Calculate centroid
      let centroid: admin.firestore.GeoPoint | null = null;
      if (polygon.length > 0) {
        const avgLat = polygon.reduce((sum, p) => sum + p.latitude, 0) / polygon.length;
        const avgLng = polygon.reduce((sum, p) => sum + p.longitude, 0) / polygon.length;
        centroid = new admin.firestore.GeoPoint(avgLat, avgLng);
      }

      // Calculate approximate area
      let areaSqMeters: number | null = null;
      if (polygon.length >= 3) {
        let area = 0;
        for (let i = 0; i < polygon.length - 1; i++) {
          const p1 = polygon[i];
          const p2 = polygon[i + 1];
          area += (p2.longitude - p1.longitude) * (2 + (p1.latitude + p2.latitude) / 90.0);
        }
        areaSqMeters = Math.abs(area * 111320 * 111320) / 2;
      }

      await boundaryCol.doc('main').set({
        id: 'main',
        name: props.name as string,
        shortName: (props.short_name as string) || (props.name as string),
        amenity: (props.amenity as string) || 'college',
        city: (props['addr:city'] as string) || '',
        street: (props['addr:street'] as string) || '',
        wikidata: props.wikidata as string | null,
        osmRelationId: (props.osm_relation_id as number) || 0,
        source: (props.source as string) || 'OpenStreetMap',
        sourceDate: (props.source_date as string) || new Date().toISOString().split('T')[0],
        verificationStatus: (props.verification_status as string) || 'verified_osm',
        description: (props.description as string) || '',
        polygon,
        centroid,
        areaSqMeters,
        additionalTags: props,
        createdAt: serverTimestamp(),
        updatedAt: serverTimestamp(),
        updatedBy: adminUid,
      });

      boundaryImported = true;
      console.log('Campus boundary imported successfully');
    }

    // 6. Import Buildings
    if (input.buildings) {
      console.log('Importing buildings...');
      const buildingsData = validateBuildingsGeoJSON(input.buildings);

      const buildingDocs = buildingsData.features.map((feature) => {
        const props = feature.properties;
        const geometry = feature.geometry as { type: 'Polygon'; coordinates: number[][][] };

        // Parse polygon
        const polygon = geometry.coordinates[0].map(
          (coord: number[]) => new admin.firestore.GeoPoint(coord[1], coord[0])
        );

        // Parse centroid (from properties or calculate)
        let centroid: admin.firestore.GeoPoint;
        if (props.centroid_lat !== undefined && props.centroid_lng !== undefined) {
          centroid = new admin.firestore.GeoPoint(props.centroid_lat as number, props.centroid_lng as number);
        } else if (polygon.length > 0) {
          const avgLat = polygon.reduce((sum, p) => sum + p.latitude, 0) / polygon.length;
          const avgLng = polygon.reduce((sum, p) => sum + p.longitude, 0) / polygon.length;
          centroid = new admin.firestore.GeoPoint(avgLat, avgLng);
        } else {
          centroid = new admin.firestore.GeoPoint(0, 0);
        }

        // Calculate area
        let areaSqMeters: number | null = null;
        if (polygon.length >= 3) {
          let area = 0;
          for (let i = 0; i < polygon.length - 1; i++) {
            const p1 = polygon[i];
            const p2 = polygon[i + 1];
            area += (p2.longitude - p1.longitude) * (2 + (p1.latitude + p2.latitude) / 90.0);
          }
          areaSqMeters = Math.abs(area * 111320 * 111320) / 2;
        }

        const buildingId = props.id as string;

        return {
          id: buildingId,
          data: {
            id: buildingId,
            osmWayId: (props.osm_way_id as number) || null,
            name: props.name as string,
            buildingType: (props.building as string) || 'college',
            category: (props.category as string) || 'academic',
            description: (props.description as string) || '',
            source: (props.source as string) || 'OpenStreetMap',
            sourceDate: (props.source_date as string) || new Date().toISOString().split('T')[0],
            verificationStatus: (props.verification_status as string) || 'verified_osm',
            polygon,
            centroid,
            areaSqMeters,
            floors: null,
            address: null,
            additionalTags: props,
            createdAt: serverTimestamp(),
            updatedAt: serverTimestamp(),
            updatedBy: adminUid,
          },
        };
      });

      await batchWrite(buildingsCol, buildingDocs);
      buildingsCount = buildingDocs.length;
      console.log(`Imported ${buildingsCount} buildings`);
    }

    // 7. Import Pathways
    if (input.pathways) {
      console.log('Importing pathways...');
      const pathwaysData = validatePathwaysGeoJSON(input.pathways);

      const pathwayDocs = pathwaysData.features.map((feature) => {
        const props = feature.properties;
        const geometry = feature.geometry as { type: 'LineString' | 'Polygon'; coordinates: number[][] };

        // Parse coordinates
        let coordinates: admin.firestore.GeoPoint[];
        let geometryType: 'LineString' | 'Polygon';

        if (geometry.type === 'LineString') {
          // LineString coordinates: number[][] (array of [lng, lat] pairs)
          coordinates = (geometry.coordinates as unknown as number[][]).map(
            (coord: number[]) => new admin.firestore.GeoPoint(coord[1], coord[0])
          );
          geometryType = 'LineString';
        } else {
          // Polygon - use first ring: coordinates[0] is number[][]
          coordinates = (geometry.coordinates[0] as unknown as number[][]).map(
            (coord: number[]) => new admin.firestore.GeoPoint(coord[1], coord[0])
          );
          geometryType = 'Polygon';
        }

        const pathwayId = props.id as string;

        return {
          id: pathwayId,
          data: {
            id: pathwayId,
            name: props.name as string,
            highway: (props.highway as string) || 'footway',
            surface: (props.surface as string) || 'concrete',
            width: (props.width as number) || 2.0,
            category: (props.category as string) || 'other',
            description: (props.description as string) || '',
            source: (props.source as string) || 'OpenStreetMap',
            verificationStatus: (props.verification_status as string) || 'verified_osm',
            coordinates,
            geometryType,
            capacity: (props.capacity as number) || null,
            additionalTags: props,
            createdAt: serverTimestamp(),
            updatedAt: serverTimestamp(),
            updatedBy: adminUid,
          },
        };
      });

      await batchWrite(pathwaysCol, pathwayDocs);
      pathwaysCount = pathwayDocs.length;
      console.log(`Imported ${pathwaysCount} pathways`);
    }

    // 8. Write audit log
    await writeCampusDataImportAudit(adminUid, 'admin', {
      buildings: buildingsCount,
      pathways: pathwaysCount,
      boundary: boundaryImported,
    });

    // 9. Return success response
    return c.json({
      success: true,
      message: 'Campus data imported successfully',
      counts: {
        buildings: buildingsCount,
        pathways: pathwaysCount,
        boundary: boundaryImported ? 1 : 0,
      },
    });
  } catch (error) {
    console.error('importCampusData error:', error);

    if (error instanceof Error && error.message.includes('Invalid')) {
      return c.json({ success: false, message: error.message }, 400);
    }

    return c.json(
      {
        success: false,
        message: `Failed to import campus data: ${error instanceof Error ? error.message : 'Unknown error'}`,
      },
      500
    );
  }
});

export default app;