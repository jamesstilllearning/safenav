"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || (function () {
    var ownKeys = function(o) {
        ownKeys = Object.getOwnPropertyNames || function (o) {
            var ar = [];
            for (var k in o) if (Object.prototype.hasOwnProperty.call(o, k)) ar[ar.length] = k;
            return ar;
        };
        return ownKeys(o);
    };
    return function (mod) {
        if (mod && mod.__esModule) return mod;
        var result = {};
        if (mod != null) for (var k = ownKeys(mod), i = 0; i < k.length; i++) if (k[i] !== "default") __createBinding(result, mod, k[i]);
        __setModuleDefault(result, mod);
        return result;
    };
})();
Object.defineProperty(exports, "__esModule", { value: true });
exports.importCampusData = void 0;
const functions = __importStar(require("firebase-functions"));
const admin = __importStar(require("firebase-admin"));
const firestore_1 = require("../utils/firestore");
const audit_1 = require("../utils/audit");
const validation_1 = require("../utils/validation");
/**
 * Callable Function: importCampusData
 *
 * Imports campus GeoJSON data (buildings, pathways, boundary) into Firestore.
 * Only callable by users with 'admin' custom claim.
 *
 * Usage from Flutter:
 * ```dart
 * final importCampusData = FirebaseFunctions.instance.httpsCallable('importCampusData');
 * await importCampusData.call({
 *   buildings: buildingsGeoJSON,
 *   pathways: pathwaysGeoJSON,
 *   boundary: boundaryGeoJSON,
 *   clearExisting: true,
 * });
 * ```
 */
exports.importCampusData = functions.https.onCall({
    enforceAppCheck: true,
    maxInstances: 1,
}, async (request) => {
    // 1. Verify authentication and admin role
    if (!request.auth) {
        throw new functions.https.HttpsError('unauthenticated', 'Authentication required. Please sign in as an admin.');
    }
    if (request.auth.token.role !== 'admin') {
        throw new functions.https.HttpsError('permission-denied', 'Admin role required to import campus data.');
    }
    const adminUid = request.auth.uid;
    try {
        // 2. Validate input
        const input = (0, validation_1.validateImportCampusDataInput)(request.data);
        // 3. Get Firestore instance
        const db = (0, firestore_1.getFirestore)();
        const buildingsCol = db.collection('buildings');
        const pathwaysCol = db.collection('pathways');
        const boundaryCol = db.collection('campus_boundary');
        let buildingsCount = 0;
        let pathwaysCount = 0;
        let boundaryImported = false;
        // 4. Clear existing data if requested (admin only operation)
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
            const boundaryData = (0, validation_1.validateBoundaryGeoJSON)(input.boundary);
            const feature = boundaryData.features[0];
            const props = feature.properties;
            const geometry = feature.geometry;
            // Parse polygon coordinates (GeoJSON: [lng, lat] -> Firestore: GeoPoint(lat, lng))
            const polygon = geometry.coordinates[0].map((coord) => new admin.firestore.GeoPoint(coord[1], coord[0]));
            // Calculate centroid
            let centroid = null;
            if (polygon.length > 0) {
                const avgLat = polygon.reduce((sum, p) => sum + p.latitude, 0) / polygon.length;
                const avgLng = polygon.reduce((sum, p) => sum + p.longitude, 0) / polygon.length;
                centroid = new admin.firestore.GeoPoint(avgLat, avgLng);
            }
            // Calculate approximate area
            let areaSqMeters = null;
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
                name: props.name,
                shortName: props.short_name || props.name,
                amenity: props.amenity || 'college',
                city: props['addr:city'] || '',
                street: props['addr:street'] || '',
                wikidata: props.wikidata,
                osmRelationId: props.osm_relation_id || 0,
                source: props.source || 'OpenStreetMap',
                sourceDate: props.source_date || new Date().toISOString().split('T')[0],
                verificationStatus: props.verification_status || 'verified_osm',
                description: props.description || '',
                polygon,
                centroid,
                areaSqMeters,
                additionalTags: props,
                createdAt: (0, firestore_1.serverTimestamp)(),
                updatedAt: (0, firestore_1.serverTimestamp)(),
                updatedBy: adminUid,
            });
            boundaryImported = true;
            console.log('Campus boundary imported successfully');
        }
        // 6. Import Buildings
        if (input.buildings) {
            console.log('Importing buildings...');
            const buildingsData = (0, validation_1.validateBuildingsGeoJSON)(input.buildings);
            const buildingDocs = buildingsData.features.map((feature) => {
                const props = feature.properties;
                const geometry = feature.geometry;
                // Parse polygon
                const polygon = geometry.coordinates[0].map((coord) => new admin.firestore.GeoPoint(coord[1], coord[0]));
                // Parse centroid (from properties or calculate)
                let centroid;
                if (props.centroid_lat !== undefined && props.centroid_lng !== undefined) {
                    centroid = new admin.firestore.GeoPoint(props.centroid_lat, props.centroid_lng);
                }
                else if (polygon.length > 0) {
                    const avgLat = polygon.reduce((sum, p) => sum + p.latitude, 0) / polygon.length;
                    const avgLng = polygon.reduce((sum, p) => sum + p.longitude, 0) / polygon.length;
                    centroid = new admin.firestore.GeoPoint(avgLat, avgLng);
                }
                else {
                    centroid = new admin.firestore.GeoPoint(0, 0);
                }
                // Calculate area
                let areaSqMeters = null;
                if (polygon.length >= 3) {
                    let area = 0;
                    for (let i = 0; i < polygon.length - 1; i++) {
                        const p1 = polygon[i];
                        const p2 = polygon[i + 1];
                        area += (p2.longitude - p1.longitude) * (2 + (p1.latitude + p2.latitude) / 90.0);
                    }
                    areaSqMeters = Math.abs(area * 111320 * 111320) / 2;
                }
                const buildingId = props.id;
                return {
                    id: buildingId,
                    data: {
                        id: buildingId,
                        osmWayId: props.osm_way_id || null,
                        name: props.name,
                        buildingType: props.building || 'college',
                        category: props.category || 'academic',
                        description: props.description || '',
                        source: props.source || 'OpenStreetMap',
                        sourceDate: props.source_date || new Date().toISOString().split('T')[0],
                        verificationStatus: props.verification_status || 'verified_osm',
                        polygon,
                        centroid,
                        areaSqMeters,
                        floors: null, // Not in GeoJSON, can be added manually
                        address: null,
                        additionalTags: props,
                        createdAt: (0, firestore_1.serverTimestamp)(),
                        updatedAt: (0, firestore_1.serverTimestamp)(),
                        updatedBy: adminUid,
                    },
                };
            });
            await (0, firestore_1.batchWrite)(buildingsCol, buildingDocs);
            buildingsCount = buildingDocs.length;
            console.log(`Imported ${buildingsCount} buildings`);
        }
        // 7. Import Pathways
        if (input.pathways) {
            console.log('Importing pathways...');
            const pathwaysData = (0, validation_1.validatePathwaysGeoJSON)(input.pathways);
            const pathwayDocs = pathwaysData.features.map((feature) => {
                const props = feature.properties;
                const geometry = feature.geometry;
                // Parse coordinates
                let coordinates;
                let geometryType;
                if (geometry.type === 'LineString') {
                    coordinates = geometry.coordinates.map((coord) => new admin.firestore.GeoPoint(coord[1], coord[0]));
                    geometryType = 'LineString';
                }
                else {
                    // Polygon - use first ring
                    coordinates = geometry.coordinates[0].map((coord) => new admin.firestore.GeoPoint(coord[1], coord[0]));
                    geometryType = 'Polygon';
                }
                const pathwayId = props.id;
                return {
                    id: pathwayId,
                    data: {
                        id: pathwayId,
                        name: props.name,
                        highway: props.highway || 'footway',
                        surface: props.surface || 'concrete',
                        width: props.width || 2.0,
                        category: props.category || 'other',
                        description: props.description || '',
                        source: props.source || 'OpenStreetMap',
                        verificationStatus: props.verification_status || 'verified_osm',
                        coordinates,
                        geometryType,
                        capacity: props.capacity || null,
                        additionalTags: props,
                        createdAt: (0, firestore_1.serverTimestamp)(),
                        updatedAt: (0, firestore_1.serverTimestamp)(),
                        updatedBy: adminUid,
                    },
                };
            });
            await (0, firestore_1.batchWrite)(pathwaysCol, pathwayDocs);
            pathwaysCount = pathwayDocs.length;
            console.log(`Imported ${pathwaysCount} pathways`);
        }
        // 8. Write audit log
        await (0, audit_1.writeCampusDataImportAudit)(adminUid, 'admin', {
            buildings: buildingsCount,
            pathways: pathwaysCount,
            boundary: boundaryImported,
        });
        // 9. Return success response
        return {
            success: true,
            message: 'Campus data imported successfully',
            counts: {
                buildings: buildingsCount,
                pathways: pathwaysCount,
                boundary: boundaryImported ? 1 : 0,
            },
        };
    }
    catch (error) {
        console.error('importCampusData error:', error);
        if (error instanceof functions.https.HttpsError) {
            throw error;
        }
        throw new functions.https.HttpsError('internal', `Failed to import campus data: ${error instanceof Error ? error.message : 'Unknown error'}`);
    }
});
/** Helper: Batch delete documents */
async function batchDelete(collection, docIds) {
    const batchSize = 500;
    for (let i = 0; i < docIds.length; i += batchSize) {
        const batch = (0, firestore_1.getFirestore)().batch();
        const chunk = docIds.slice(i, i + batchSize);
        for (const id of chunk) {
            batch.delete(collection.doc(id));
        }
        await batch.commit();
    }
}
//# sourceMappingURL=importCampusData.js.map