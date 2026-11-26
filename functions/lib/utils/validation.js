"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.validateImportCampusDataInput = exports.ImportCampusDataInputSchema = exports.validateBoundaryGeoJSON = exports.validatePathwaysGeoJSON = exports.validateBuildingsGeoJSON = exports.BoundaryPropertiesSchema = exports.PathwayPropertiesSchema = exports.BuildingPropertiesSchema = exports.FeatureCollectionSchema = exports.FeatureSchema = exports.FeaturePropertiesSchema = exports.GeometrySchema = exports.PolygonGeometrySchema = exports.LineStringGeometrySchema = exports.PointGeometrySchema = exports.CoordinateSchema = void 0;
const zod_1 = require("zod");
/** Coordinate tuple [longitude, latitude] - GeoJSON order */
exports.CoordinateSchema = zod_1.z.tuple([zod_1.z.number(), zod_1.z.number()]);
/** GeoJSON Point geometry */
exports.PointGeometrySchema = zod_1.z.object({
    type: zod_1.z.literal('Point'),
    coordinates: exports.CoordinateSchema,
});
/** GeoJSON LineString geometry */
exports.LineStringGeometrySchema = zod_1.z.object({
    type: zod_1.z.literal('LineString'),
    coordinates: zod_1.z.array(exports.CoordinateSchema).min(2),
});
/** GeoJSON Polygon geometry */
exports.PolygonGeometrySchema = zod_1.z.object({
    type: zod_1.z.literal('Polygon'),
    coordinates: zod_1.z.array(zod_1.z.array(exports.CoordinateSchema)).min(1),
});
/** GeoJSON Geometry (union) */
exports.GeometrySchema = zod_1.z.union([
    exports.PointGeometrySchema,
    exports.LineStringGeometrySchema,
    exports.PolygonGeometrySchema,
]);
/** GeoJSON Feature properties */
exports.FeaturePropertiesSchema = zod_1.z.record(zod_1.z.unknown());
/** GeoJSON Feature */
exports.FeatureSchema = zod_1.z.object({
    type: zod_1.z.literal('Feature'),
    properties: exports.FeaturePropertiesSchema,
    geometry: exports.GeometrySchema,
    id: zod_1.z.union([zod_1.z.string(), zod_1.z.number()]).optional(),
});
/** GeoJSON FeatureCollection */
exports.FeatureCollectionSchema = zod_1.z.object({
    type: zod_1.z.literal('FeatureCollection'),
    features: zod_1.z.array(exports.FeatureSchema),
    name: zod_1.z.string().optional(),
    crs: zod_1.z.object({
        type: zod_1.z.literal('name'),
        properties: zod_1.z.object({
            name: zod_1.z.string(),
        }),
    }).optional(),
});
/** Building properties from GeoJSON */
exports.BuildingPropertiesSchema = zod_1.z.object({
    id: zod_1.z.string(),
    osm_way_id: zod_1.z.number().optional(),
    name: zod_1.z.string(),
    building: zod_1.z.string().optional(),
    category: zod_1.z.string().optional(),
    description: zod_1.z.string().optional(),
    source: zod_1.z.string().optional(),
    source_date: zod_1.z.string().optional(),
    verification_status: zod_1.z.string().optional(),
    centroid_lat: zod_1.z.number().optional(),
    centroid_lng: zod_1.z.number().optional(),
}).passthrough();
/** Pathway properties from GeoJSON */
exports.PathwayPropertiesSchema = zod_1.z.object({
    id: zod_1.z.string(),
    name: zod_1.z.string(),
    highway: zod_1.z.string().optional(),
    surface: zod_1.z.string().optional(),
    width: zod_1.z.number().optional(),
    category: zod_1.z.string().optional(),
    description: zod_1.z.string().optional(),
    source: zod_1.z.string().optional(),
    verification_status: zod_1.z.string().optional(),
    capacity: zod_1.z.number().optional(),
}).passthrough();
/** Campus boundary properties from GeoJSON */
exports.BoundaryPropertiesSchema = zod_1.z.object({
    id: zod_1.z.string(),
    name: zod_1.z.string(),
    short_name: zod_1.z.string().optional(),
    amenity: zod_1.z.string().optional(),
    'addr:city': zod_1.z.string().optional(),
    'addr:street': zod_1.z.string().optional(),
    wikidata: zod_1.z.string().optional(),
    osm_relation_id: zod_1.z.number().optional(),
    source: zod_1.z.string().optional(),
    source_date: zod_1.z.string().optional(),
    verification_status: zod_1.z.string().optional(),
    description: zod_1.z.string().optional(),
}).passthrough();
/** Validate FeatureCollection for buildings */
const validateBuildingsGeoJSON = (data) => {
    const result = exports.FeatureCollectionSchema.safeParse(data);
    if (!result.success) {
        throw new Error(`Invalid GeoJSON: ${result.error.message}`);
    }
    // Validate each feature has building properties
    for (const feature of result.data.features) {
        const propsResult = exports.BuildingPropertiesSchema.safeParse(feature.properties);
        if (!propsResult.success) {
            throw new Error(`Invalid building properties: ${propsResult.error.message}`);
        }
        if (feature.geometry.type !== 'Polygon') {
            throw new Error(`Building ${feature.properties.id} must have Polygon geometry`);
        }
    }
    return result.data;
};
exports.validateBuildingsGeoJSON = validateBuildingsGeoJSON;
/** Validate FeatureCollection for pathways */
const validatePathwaysGeoJSON = (data) => {
    const result = exports.FeatureCollectionSchema.safeParse(data);
    if (!result.success) {
        throw new Error(`Invalid GeoJSON: ${result.error.message}`);
    }
    for (const feature of result.data.features) {
        const propsResult = exports.PathwayPropertiesSchema.safeParse(feature.properties);
        if (!propsResult.success) {
            throw new Error(`Invalid pathway properties: ${propsResult.error.message}`);
        }
        if (feature.geometry.type !== 'LineString' && feature.geometry.type !== 'Polygon') {
            throw new Error(`Pathway ${feature.properties.id} must have LineString or Polygon geometry`);
        }
    }
    return result.data;
};
exports.validatePathwaysGeoJSON = validatePathwaysGeoJSON;
/** Validate FeatureCollection for campus boundary */
const validateBoundaryGeoJSON = (data) => {
    const result = exports.FeatureCollectionSchema.safeParse(data);
    if (!result.success) {
        throw new Error(`Invalid GeoJSON: ${result.error.message}`);
    }
    if (result.data.features.length === 0) {
        throw new Error('Boundary GeoJSON must have at least one feature');
    }
    const feature = result.data.features[0];
    const propsResult = exports.BoundaryPropertiesSchema.safeParse(feature.properties);
    if (!propsResult.success) {
        throw new Error(`Invalid boundary properties: ${propsResult.error.message}`);
    }
    if (feature.geometry.type !== 'Polygon') {
        throw new Error('Boundary must have Polygon geometry');
    }
    return result.data;
};
exports.validateBoundaryGeoJSON = validateBoundaryGeoJSON;
/** Callable function input schema for importCampusData */
exports.ImportCampusDataInputSchema = zod_1.z.object({
    buildings: exports.FeatureCollectionSchema.optional(),
    pathways: exports.FeatureCollectionSchema.optional(),
    boundary: exports.FeatureCollectionSchema.optional(),
    clearExisting: zod_1.z.boolean().default(false),
});
/** Validate callable function input */
const validateImportCampusDataInput = (data) => {
    const result = exports.ImportCampusDataInputSchema.safeParse(data);
    if (!result.success) {
        throw new Error(`Invalid input: ${result.error.message}`);
    }
    return result.data;
};
exports.validateImportCampusDataInput = validateImportCampusDataInput;
//# sourceMappingURL=validation.js.map