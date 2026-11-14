import { z } from 'zod';

/** Coordinate tuple [longitude, latitude] - GeoJSON order */
export const CoordinateSchema = z.tuple([z.number(), z.number()]);

/** GeoJSON Point geometry */
export const PointGeometrySchema = z.object({
  type: z.literal('Point'),
  coordinates: CoordinateSchema,
});

/** GeoJSON LineString geometry */
export const LineStringGeometrySchema = z.object({
  type: z.literal('LineString'),
  coordinates: z.array(CoordinateSchema).min(2),
});

/** GeoJSON Polygon geometry */
export const PolygonGeometrySchema = z.object({
  type: z.literal('Polygon'),
  coordinates: z.array(z.array(CoordinateSchema)).min(1),
});

/** GeoJSON Geometry (union) */
export const GeometrySchema = z.union([
  PointGeometrySchema,
  LineStringGeometrySchema,
  PolygonGeometrySchema,
]);

/** GeoJSON Feature properties */
export const FeaturePropertiesSchema = z.record(z.unknown());

/** GeoJSON Feature */
export const FeatureSchema = z.object({
  type: z.literal('Feature'),
  properties: FeaturePropertiesSchema,
  geometry: GeometrySchema,
  id: z.union([z.string(), z.number()]).optional(),
});

/** GeoJSON FeatureCollection */
export const FeatureCollectionSchema = z.object({
  type: z.literal('FeatureCollection'),
  features: z.array(FeatureSchema),
  name: z.string().optional(),
  crs: z.object({
    type: z.literal('name'),
    properties: z.object({
      name: z.string(),
    }),
  }).optional(),
});

/** Building properties from GeoJSON */
export const BuildingPropertiesSchema = z.object({
  id: z.string(),
  osm_way_id: z.number().optional(),
  name: z.string(),
  building: z.string().optional(),
  category: z.string().optional(),
  description: z.string().optional(),
  source: z.string().optional(),
  source_date: z.string().optional(),
  verification_status: z.string().optional(),
  centroid_lat: z.number().optional(),
  centroid_lng: z.number().optional(),
}).passthrough();

/** Pathway properties from GeoJSON */
export const PathwayPropertiesSchema = z.object({
  id: z.string(),
  name: z.string(),
  highway: z.string().optional(),
  surface: z.string().optional(),
  width: z.number().optional(),
  category: z.string().optional(),
  description: z.string().optional(),
  source: z.string().optional(),
  verification_status: z.string().optional(),
  capacity: z.number().optional(),
}).passthrough();

/** Campus boundary properties from GeoJSON */
export const BoundaryPropertiesSchema = z.object({
  id: z.string(),
  name: z.string(),
  short_name: z.string().optional(),
  amenity: z.string().optional(),
  'addr:city': z.string().optional(),
  'addr:street': z.string().optional(),
  wikidata: z.string().optional(),
  osm_relation_id: z.number().optional(),
  source: z.string().optional(),
  source_date: z.string().optional(),
  verification_status: z.string().optional(),
  description: z.string().optional(),
}).passthrough();

/** Validate FeatureCollection for buildings */
export const validateBuildingsGeoJSON = (data: unknown) => {
  const result = FeatureCollectionSchema.safeParse(data);
  if (!result.success) {
    throw new Error(`Invalid GeoJSON: ${result.error.message}`);
  }

  // Validate each feature has building properties
  for (const feature of result.data.features) {
    const propsResult = BuildingPropertiesSchema.safeParse(feature.properties);
    if (!propsResult.success) {
      throw new Error(`Invalid building properties: ${propsResult.error.message}`);
    }

    if (feature.geometry.type !== 'Polygon') {
      throw new Error(`Building ${feature.properties.id} must have Polygon geometry`);
    }
  }

  return result.data;
};

/** Validate FeatureCollection for pathways */
export const validatePathwaysGeoJSON = (data: unknown) => {
  const result = FeatureCollectionSchema.safeParse(data);
  if (!result.success) {
    throw new Error(`Invalid GeoJSON: ${result.error.message}`);
  }

  for (const feature of result.data.features) {
    const propsResult = PathwayPropertiesSchema.safeParse(feature.properties);
    if (!propsResult.success) {
      throw new Error(`Invalid pathway properties: ${propsResult.error.message}`);
    }

    if (feature.geometry.type !== 'LineString' && feature.geometry.type !== 'Polygon') {
      throw new Error(`Pathway ${feature.properties.id} must have LineString or Polygon geometry`);
    }
  }

  return result.data;
};

/** Validate FeatureCollection for campus boundary */
export const validateBoundaryGeoJSON = (data: unknown) => {
  const result = FeatureCollectionSchema.safeParse(data);
  if (!result.success) {
    throw new Error(`Invalid GeoJSON: ${result.error.message}`);
  }

  if (result.data.features.length === 0) {
    throw new Error('Boundary GeoJSON must have at least one feature');
  }

  const feature = result.data.features[0];
  const propsResult = BoundaryPropertiesSchema.safeParse(feature.properties);
  if (!propsResult.success) {
    throw new Error(`Invalid boundary properties: ${propsResult.error.message}`);
  }

  if (feature.geometry.type !== 'Polygon') {
    throw new Error('Boundary must have Polygon geometry');
  }

  return result.data;
};

/** Callable function input schema for importCampusData */
export const ImportCampusDataInputSchema = z.object({
  buildings: FeatureCollectionSchema.optional(),
  pathways: FeatureCollectionSchema.optional(),
  boundary: FeatureCollectionSchema.optional(),
  clearExisting: z.boolean().default(false),
});

export type ImportCampusDataInput = z.infer<typeof ImportCampusDataInputSchema>;

/** Validate callable function input */
export const validateImportCampusDataInput = (data: unknown): ImportCampusDataInput => {
  const result = ImportCampusDataInputSchema.safeParse(data);
  if (!result.success) {
    throw new Error(`Invalid input: ${result.error.message}`);
  }
  return result.data;
};