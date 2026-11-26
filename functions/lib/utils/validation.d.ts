import { z } from 'zod';
/** Coordinate tuple [longitude, latitude] - GeoJSON order */
export declare const CoordinateSchema: z.ZodTuple<[z.ZodNumber, z.ZodNumber], null>;
/** GeoJSON Point geometry */
export declare const PointGeometrySchema: z.ZodObject<{
    type: z.ZodLiteral<"Point">;
    coordinates: z.ZodTuple<[z.ZodNumber, z.ZodNumber], null>;
}, "strip", z.ZodTypeAny, {
    type: "Point";
    coordinates: [number, number];
}, {
    type: "Point";
    coordinates: [number, number];
}>;
/** GeoJSON LineString geometry */
export declare const LineStringGeometrySchema: z.ZodObject<{
    type: z.ZodLiteral<"LineString">;
    coordinates: z.ZodArray<z.ZodTuple<[z.ZodNumber, z.ZodNumber], null>, "many">;
}, "strip", z.ZodTypeAny, {
    type: "LineString";
    coordinates: [number, number][];
}, {
    type: "LineString";
    coordinates: [number, number][];
}>;
/** GeoJSON Polygon geometry */
export declare const PolygonGeometrySchema: z.ZodObject<{
    type: z.ZodLiteral<"Polygon">;
    coordinates: z.ZodArray<z.ZodArray<z.ZodTuple<[z.ZodNumber, z.ZodNumber], null>, "many">, "many">;
}, "strip", z.ZodTypeAny, {
    type: "Polygon";
    coordinates: [number, number][][];
}, {
    type: "Polygon";
    coordinates: [number, number][][];
}>;
/** GeoJSON Geometry (union) */
export declare const GeometrySchema: z.ZodUnion<[z.ZodObject<{
    type: z.ZodLiteral<"Point">;
    coordinates: z.ZodTuple<[z.ZodNumber, z.ZodNumber], null>;
}, "strip", z.ZodTypeAny, {
    type: "Point";
    coordinates: [number, number];
}, {
    type: "Point";
    coordinates: [number, number];
}>, z.ZodObject<{
    type: z.ZodLiteral<"LineString">;
    coordinates: z.ZodArray<z.ZodTuple<[z.ZodNumber, z.ZodNumber], null>, "many">;
}, "strip", z.ZodTypeAny, {
    type: "LineString";
    coordinates: [number, number][];
}, {
    type: "LineString";
    coordinates: [number, number][];
}>, z.ZodObject<{
    type: z.ZodLiteral<"Polygon">;
    coordinates: z.ZodArray<z.ZodArray<z.ZodTuple<[z.ZodNumber, z.ZodNumber], null>, "many">, "many">;
}, "strip", z.ZodTypeAny, {
    type: "Polygon";
    coordinates: [number, number][][];
}, {
    type: "Polygon";
    coordinates: [number, number][][];
}>]>;
/** GeoJSON Feature properties */
export declare const FeaturePropertiesSchema: z.ZodRecord<z.ZodString, z.ZodUnknown>;
/** GeoJSON Feature */
export declare const FeatureSchema: z.ZodObject<{
    type: z.ZodLiteral<"Feature">;
    properties: z.ZodRecord<z.ZodString, z.ZodUnknown>;
    geometry: z.ZodUnion<[z.ZodObject<{
        type: z.ZodLiteral<"Point">;
        coordinates: z.ZodTuple<[z.ZodNumber, z.ZodNumber], null>;
    }, "strip", z.ZodTypeAny, {
        type: "Point";
        coordinates: [number, number];
    }, {
        type: "Point";
        coordinates: [number, number];
    }>, z.ZodObject<{
        type: z.ZodLiteral<"LineString">;
        coordinates: z.ZodArray<z.ZodTuple<[z.ZodNumber, z.ZodNumber], null>, "many">;
    }, "strip", z.ZodTypeAny, {
        type: "LineString";
        coordinates: [number, number][];
    }, {
        type: "LineString";
        coordinates: [number, number][];
    }>, z.ZodObject<{
        type: z.ZodLiteral<"Polygon">;
        coordinates: z.ZodArray<z.ZodArray<z.ZodTuple<[z.ZodNumber, z.ZodNumber], null>, "many">, "many">;
    }, "strip", z.ZodTypeAny, {
        type: "Polygon";
        coordinates: [number, number][][];
    }, {
        type: "Polygon";
        coordinates: [number, number][][];
    }>]>;
    id: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodNumber]>>;
}, "strip", z.ZodTypeAny, {
    type: "Feature";
    properties: Record<string, unknown>;
    geometry: {
        type: "Point";
        coordinates: [number, number];
    } | {
        type: "LineString";
        coordinates: [number, number][];
    } | {
        type: "Polygon";
        coordinates: [number, number][][];
    };
    id?: string | number | undefined;
}, {
    type: "Feature";
    properties: Record<string, unknown>;
    geometry: {
        type: "Point";
        coordinates: [number, number];
    } | {
        type: "LineString";
        coordinates: [number, number][];
    } | {
        type: "Polygon";
        coordinates: [number, number][][];
    };
    id?: string | number | undefined;
}>;
/** GeoJSON FeatureCollection */
export declare const FeatureCollectionSchema: z.ZodObject<{
    type: z.ZodLiteral<"FeatureCollection">;
    features: z.ZodArray<z.ZodObject<{
        type: z.ZodLiteral<"Feature">;
        properties: z.ZodRecord<z.ZodString, z.ZodUnknown>;
        geometry: z.ZodUnion<[z.ZodObject<{
            type: z.ZodLiteral<"Point">;
            coordinates: z.ZodTuple<[z.ZodNumber, z.ZodNumber], null>;
        }, "strip", z.ZodTypeAny, {
            type: "Point";
            coordinates: [number, number];
        }, {
            type: "Point";
            coordinates: [number, number];
        }>, z.ZodObject<{
            type: z.ZodLiteral<"LineString">;
            coordinates: z.ZodArray<z.ZodTuple<[z.ZodNumber, z.ZodNumber], null>, "many">;
        }, "strip", z.ZodTypeAny, {
            type: "LineString";
            coordinates: [number, number][];
        }, {
            type: "LineString";
            coordinates: [number, number][];
        }>, z.ZodObject<{
            type: z.ZodLiteral<"Polygon">;
            coordinates: z.ZodArray<z.ZodArray<z.ZodTuple<[z.ZodNumber, z.ZodNumber], null>, "many">, "many">;
        }, "strip", z.ZodTypeAny, {
            type: "Polygon";
            coordinates: [number, number][][];
        }, {
            type: "Polygon";
            coordinates: [number, number][][];
        }>]>;
        id: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodNumber]>>;
    }, "strip", z.ZodTypeAny, {
        type: "Feature";
        properties: Record<string, unknown>;
        geometry: {
            type: "Point";
            coordinates: [number, number];
        } | {
            type: "LineString";
            coordinates: [number, number][];
        } | {
            type: "Polygon";
            coordinates: [number, number][][];
        };
        id?: string | number | undefined;
    }, {
        type: "Feature";
        properties: Record<string, unknown>;
        geometry: {
            type: "Point";
            coordinates: [number, number];
        } | {
            type: "LineString";
            coordinates: [number, number][];
        } | {
            type: "Polygon";
            coordinates: [number, number][][];
        };
        id?: string | number | undefined;
    }>, "many">;
    name: z.ZodOptional<z.ZodString>;
    crs: z.ZodOptional<z.ZodObject<{
        type: z.ZodLiteral<"name">;
        properties: z.ZodObject<{
            name: z.ZodString;
        }, "strip", z.ZodTypeAny, {
            name: string;
        }, {
            name: string;
        }>;
    }, "strip", z.ZodTypeAny, {
        type: "name";
        properties: {
            name: string;
        };
    }, {
        type: "name";
        properties: {
            name: string;
        };
    }>>;
}, "strip", z.ZodTypeAny, {
    type: "FeatureCollection";
    features: {
        type: "Feature";
        properties: Record<string, unknown>;
        geometry: {
            type: "Point";
            coordinates: [number, number];
        } | {
            type: "LineString";
            coordinates: [number, number][];
        } | {
            type: "Polygon";
            coordinates: [number, number][][];
        };
        id?: string | number | undefined;
    }[];
    name?: string | undefined;
    crs?: {
        type: "name";
        properties: {
            name: string;
        };
    } | undefined;
}, {
    type: "FeatureCollection";
    features: {
        type: "Feature";
        properties: Record<string, unknown>;
        geometry: {
            type: "Point";
            coordinates: [number, number];
        } | {
            type: "LineString";
            coordinates: [number, number][];
        } | {
            type: "Polygon";
            coordinates: [number, number][][];
        };
        id?: string | number | undefined;
    }[];
    name?: string | undefined;
    crs?: {
        type: "name";
        properties: {
            name: string;
        };
    } | undefined;
}>;
/** Building properties from GeoJSON */
export declare const BuildingPropertiesSchema: z.ZodObject<{
    id: z.ZodString;
    osm_way_id: z.ZodOptional<z.ZodNumber>;
    name: z.ZodString;
    building: z.ZodOptional<z.ZodString>;
    category: z.ZodOptional<z.ZodString>;
    description: z.ZodOptional<z.ZodString>;
    source: z.ZodOptional<z.ZodString>;
    source_date: z.ZodOptional<z.ZodString>;
    verification_status: z.ZodOptional<z.ZodString>;
    centroid_lat: z.ZodOptional<z.ZodNumber>;
    centroid_lng: z.ZodOptional<z.ZodNumber>;
}, "passthrough", z.ZodTypeAny, z.objectOutputType<{
    id: z.ZodString;
    osm_way_id: z.ZodOptional<z.ZodNumber>;
    name: z.ZodString;
    building: z.ZodOptional<z.ZodString>;
    category: z.ZodOptional<z.ZodString>;
    description: z.ZodOptional<z.ZodString>;
    source: z.ZodOptional<z.ZodString>;
    source_date: z.ZodOptional<z.ZodString>;
    verification_status: z.ZodOptional<z.ZodString>;
    centroid_lat: z.ZodOptional<z.ZodNumber>;
    centroid_lng: z.ZodOptional<z.ZodNumber>;
}, z.ZodTypeAny, "passthrough">, z.objectInputType<{
    id: z.ZodString;
    osm_way_id: z.ZodOptional<z.ZodNumber>;
    name: z.ZodString;
    building: z.ZodOptional<z.ZodString>;
    category: z.ZodOptional<z.ZodString>;
    description: z.ZodOptional<z.ZodString>;
    source: z.ZodOptional<z.ZodString>;
    source_date: z.ZodOptional<z.ZodString>;
    verification_status: z.ZodOptional<z.ZodString>;
    centroid_lat: z.ZodOptional<z.ZodNumber>;
    centroid_lng: z.ZodOptional<z.ZodNumber>;
}, z.ZodTypeAny, "passthrough">>;
/** Pathway properties from GeoJSON */
export declare const PathwayPropertiesSchema: z.ZodObject<{
    id: z.ZodString;
    name: z.ZodString;
    highway: z.ZodOptional<z.ZodString>;
    surface: z.ZodOptional<z.ZodString>;
    width: z.ZodOptional<z.ZodNumber>;
    category: z.ZodOptional<z.ZodString>;
    description: z.ZodOptional<z.ZodString>;
    source: z.ZodOptional<z.ZodString>;
    verification_status: z.ZodOptional<z.ZodString>;
    capacity: z.ZodOptional<z.ZodNumber>;
}, "passthrough", z.ZodTypeAny, z.objectOutputType<{
    id: z.ZodString;
    name: z.ZodString;
    highway: z.ZodOptional<z.ZodString>;
    surface: z.ZodOptional<z.ZodString>;
    width: z.ZodOptional<z.ZodNumber>;
    category: z.ZodOptional<z.ZodString>;
    description: z.ZodOptional<z.ZodString>;
    source: z.ZodOptional<z.ZodString>;
    verification_status: z.ZodOptional<z.ZodString>;
    capacity: z.ZodOptional<z.ZodNumber>;
}, z.ZodTypeAny, "passthrough">, z.objectInputType<{
    id: z.ZodString;
    name: z.ZodString;
    highway: z.ZodOptional<z.ZodString>;
    surface: z.ZodOptional<z.ZodString>;
    width: z.ZodOptional<z.ZodNumber>;
    category: z.ZodOptional<z.ZodString>;
    description: z.ZodOptional<z.ZodString>;
    source: z.ZodOptional<z.ZodString>;
    verification_status: z.ZodOptional<z.ZodString>;
    capacity: z.ZodOptional<z.ZodNumber>;
}, z.ZodTypeAny, "passthrough">>;
/** Campus boundary properties from GeoJSON */
export declare const BoundaryPropertiesSchema: z.ZodObject<{
    id: z.ZodString;
    name: z.ZodString;
    short_name: z.ZodOptional<z.ZodString>;
    amenity: z.ZodOptional<z.ZodString>;
    'addr:city': z.ZodOptional<z.ZodString>;
    'addr:street': z.ZodOptional<z.ZodString>;
    wikidata: z.ZodOptional<z.ZodString>;
    osm_relation_id: z.ZodOptional<z.ZodNumber>;
    source: z.ZodOptional<z.ZodString>;
    source_date: z.ZodOptional<z.ZodString>;
    verification_status: z.ZodOptional<z.ZodString>;
    description: z.ZodOptional<z.ZodString>;
}, "passthrough", z.ZodTypeAny, z.objectOutputType<{
    id: z.ZodString;
    name: z.ZodString;
    short_name: z.ZodOptional<z.ZodString>;
    amenity: z.ZodOptional<z.ZodString>;
    'addr:city': z.ZodOptional<z.ZodString>;
    'addr:street': z.ZodOptional<z.ZodString>;
    wikidata: z.ZodOptional<z.ZodString>;
    osm_relation_id: z.ZodOptional<z.ZodNumber>;
    source: z.ZodOptional<z.ZodString>;
    source_date: z.ZodOptional<z.ZodString>;
    verification_status: z.ZodOptional<z.ZodString>;
    description: z.ZodOptional<z.ZodString>;
}, z.ZodTypeAny, "passthrough">, z.objectInputType<{
    id: z.ZodString;
    name: z.ZodString;
    short_name: z.ZodOptional<z.ZodString>;
    amenity: z.ZodOptional<z.ZodString>;
    'addr:city': z.ZodOptional<z.ZodString>;
    'addr:street': z.ZodOptional<z.ZodString>;
    wikidata: z.ZodOptional<z.ZodString>;
    osm_relation_id: z.ZodOptional<z.ZodNumber>;
    source: z.ZodOptional<z.ZodString>;
    source_date: z.ZodOptional<z.ZodString>;
    verification_status: z.ZodOptional<z.ZodString>;
    description: z.ZodOptional<z.ZodString>;
}, z.ZodTypeAny, "passthrough">>;
/** Validate FeatureCollection for buildings */
export declare const validateBuildingsGeoJSON: (data: unknown) => {
    type: "FeatureCollection";
    features: {
        type: "Feature";
        properties: Record<string, unknown>;
        geometry: {
            type: "Point";
            coordinates: [number, number];
        } | {
            type: "LineString";
            coordinates: [number, number][];
        } | {
            type: "Polygon";
            coordinates: [number, number][][];
        };
        id?: string | number | undefined;
    }[];
    name?: string | undefined;
    crs?: {
        type: "name";
        properties: {
            name: string;
        };
    } | undefined;
};
/** Validate FeatureCollection for pathways */
export declare const validatePathwaysGeoJSON: (data: unknown) => {
    type: "FeatureCollection";
    features: {
        type: "Feature";
        properties: Record<string, unknown>;
        geometry: {
            type: "Point";
            coordinates: [number, number];
        } | {
            type: "LineString";
            coordinates: [number, number][];
        } | {
            type: "Polygon";
            coordinates: [number, number][][];
        };
        id?: string | number | undefined;
    }[];
    name?: string | undefined;
    crs?: {
        type: "name";
        properties: {
            name: string;
        };
    } | undefined;
};
/** Validate FeatureCollection for campus boundary */
export declare const validateBoundaryGeoJSON: (data: unknown) => {
    type: "FeatureCollection";
    features: {
        type: "Feature";
        properties: Record<string, unknown>;
        geometry: {
            type: "Point";
            coordinates: [number, number];
        } | {
            type: "LineString";
            coordinates: [number, number][];
        } | {
            type: "Polygon";
            coordinates: [number, number][][];
        };
        id?: string | number | undefined;
    }[];
    name?: string | undefined;
    crs?: {
        type: "name";
        properties: {
            name: string;
        };
    } | undefined;
};
/** Callable function input schema for importCampusData */
export declare const ImportCampusDataInputSchema: z.ZodObject<{
    buildings: z.ZodOptional<z.ZodObject<{
        type: z.ZodLiteral<"FeatureCollection">;
        features: z.ZodArray<z.ZodObject<{
            type: z.ZodLiteral<"Feature">;
            properties: z.ZodRecord<z.ZodString, z.ZodUnknown>;
            geometry: z.ZodUnion<[z.ZodObject<{
                type: z.ZodLiteral<"Point">;
                coordinates: z.ZodTuple<[z.ZodNumber, z.ZodNumber], null>;
            }, "strip", z.ZodTypeAny, {
                type: "Point";
                coordinates: [number, number];
            }, {
                type: "Point";
                coordinates: [number, number];
            }>, z.ZodObject<{
                type: z.ZodLiteral<"LineString">;
                coordinates: z.ZodArray<z.ZodTuple<[z.ZodNumber, z.ZodNumber], null>, "many">;
            }, "strip", z.ZodTypeAny, {
                type: "LineString";
                coordinates: [number, number][];
            }, {
                type: "LineString";
                coordinates: [number, number][];
            }>, z.ZodObject<{
                type: z.ZodLiteral<"Polygon">;
                coordinates: z.ZodArray<z.ZodArray<z.ZodTuple<[z.ZodNumber, z.ZodNumber], null>, "many">, "many">;
            }, "strip", z.ZodTypeAny, {
                type: "Polygon";
                coordinates: [number, number][][];
            }, {
                type: "Polygon";
                coordinates: [number, number][][];
            }>]>;
            id: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodNumber]>>;
        }, "strip", z.ZodTypeAny, {
            type: "Feature";
            properties: Record<string, unknown>;
            geometry: {
                type: "Point";
                coordinates: [number, number];
            } | {
                type: "LineString";
                coordinates: [number, number][];
            } | {
                type: "Polygon";
                coordinates: [number, number][][];
            };
            id?: string | number | undefined;
        }, {
            type: "Feature";
            properties: Record<string, unknown>;
            geometry: {
                type: "Point";
                coordinates: [number, number];
            } | {
                type: "LineString";
                coordinates: [number, number][];
            } | {
                type: "Polygon";
                coordinates: [number, number][][];
            };
            id?: string | number | undefined;
        }>, "many">;
        name: z.ZodOptional<z.ZodString>;
        crs: z.ZodOptional<z.ZodObject<{
            type: z.ZodLiteral<"name">;
            properties: z.ZodObject<{
                name: z.ZodString;
            }, "strip", z.ZodTypeAny, {
                name: string;
            }, {
                name: string;
            }>;
        }, "strip", z.ZodTypeAny, {
            type: "name";
            properties: {
                name: string;
            };
        }, {
            type: "name";
            properties: {
                name: string;
            };
        }>>;
    }, "strip", z.ZodTypeAny, {
        type: "FeatureCollection";
        features: {
            type: "Feature";
            properties: Record<string, unknown>;
            geometry: {
                type: "Point";
                coordinates: [number, number];
            } | {
                type: "LineString";
                coordinates: [number, number][];
            } | {
                type: "Polygon";
                coordinates: [number, number][][];
            };
            id?: string | number | undefined;
        }[];
        name?: string | undefined;
        crs?: {
            type: "name";
            properties: {
                name: string;
            };
        } | undefined;
    }, {
        type: "FeatureCollection";
        features: {
            type: "Feature";
            properties: Record<string, unknown>;
            geometry: {
                type: "Point";
                coordinates: [number, number];
            } | {
                type: "LineString";
                coordinates: [number, number][];
            } | {
                type: "Polygon";
                coordinates: [number, number][][];
            };
            id?: string | number | undefined;
        }[];
        name?: string | undefined;
        crs?: {
            type: "name";
            properties: {
                name: string;
            };
        } | undefined;
    }>>;
    pathways: z.ZodOptional<z.ZodObject<{
        type: z.ZodLiteral<"FeatureCollection">;
        features: z.ZodArray<z.ZodObject<{
            type: z.ZodLiteral<"Feature">;
            properties: z.ZodRecord<z.ZodString, z.ZodUnknown>;
            geometry: z.ZodUnion<[z.ZodObject<{
                type: z.ZodLiteral<"Point">;
                coordinates: z.ZodTuple<[z.ZodNumber, z.ZodNumber], null>;
            }, "strip", z.ZodTypeAny, {
                type: "Point";
                coordinates: [number, number];
            }, {
                type: "Point";
                coordinates: [number, number];
            }>, z.ZodObject<{
                type: z.ZodLiteral<"LineString">;
                coordinates: z.ZodArray<z.ZodTuple<[z.ZodNumber, z.ZodNumber], null>, "many">;
            }, "strip", z.ZodTypeAny, {
                type: "LineString";
                coordinates: [number, number][];
            }, {
                type: "LineString";
                coordinates: [number, number][];
            }>, z.ZodObject<{
                type: z.ZodLiteral<"Polygon">;
                coordinates: z.ZodArray<z.ZodArray<z.ZodTuple<[z.ZodNumber, z.ZodNumber], null>, "many">, "many">;
            }, "strip", z.ZodTypeAny, {
                type: "Polygon";
                coordinates: [number, number][][];
            }, {
                type: "Polygon";
                coordinates: [number, number][][];
            }>]>;
            id: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodNumber]>>;
        }, "strip", z.ZodTypeAny, {
            type: "Feature";
            properties: Record<string, unknown>;
            geometry: {
                type: "Point";
                coordinates: [number, number];
            } | {
                type: "LineString";
                coordinates: [number, number][];
            } | {
                type: "Polygon";
                coordinates: [number, number][][];
            };
            id?: string | number | undefined;
        }, {
            type: "Feature";
            properties: Record<string, unknown>;
            geometry: {
                type: "Point";
                coordinates: [number, number];
            } | {
                type: "LineString";
                coordinates: [number, number][];
            } | {
                type: "Polygon";
                coordinates: [number, number][][];
            };
            id?: string | number | undefined;
        }>, "many">;
        name: z.ZodOptional<z.ZodString>;
        crs: z.ZodOptional<z.ZodObject<{
            type: z.ZodLiteral<"name">;
            properties: z.ZodObject<{
                name: z.ZodString;
            }, "strip", z.ZodTypeAny, {
                name: string;
            }, {
                name: string;
            }>;
        }, "strip", z.ZodTypeAny, {
            type: "name";
            properties: {
                name: string;
            };
        }, {
            type: "name";
            properties: {
                name: string;
            };
        }>>;
    }, "strip", z.ZodTypeAny, {
        type: "FeatureCollection";
        features: {
            type: "Feature";
            properties: Record<string, unknown>;
            geometry: {
                type: "Point";
                coordinates: [number, number];
            } | {
                type: "LineString";
                coordinates: [number, number][];
            } | {
                type: "Polygon";
                coordinates: [number, number][][];
            };
            id?: string | number | undefined;
        }[];
        name?: string | undefined;
        crs?: {
            type: "name";
            properties: {
                name: string;
            };
        } | undefined;
    }, {
        type: "FeatureCollection";
        features: {
            type: "Feature";
            properties: Record<string, unknown>;
            geometry: {
                type: "Point";
                coordinates: [number, number];
            } | {
                type: "LineString";
                coordinates: [number, number][];
            } | {
                type: "Polygon";
                coordinates: [number, number][][];
            };
            id?: string | number | undefined;
        }[];
        name?: string | undefined;
        crs?: {
            type: "name";
            properties: {
                name: string;
            };
        } | undefined;
    }>>;
    boundary: z.ZodOptional<z.ZodObject<{
        type: z.ZodLiteral<"FeatureCollection">;
        features: z.ZodArray<z.ZodObject<{
            type: z.ZodLiteral<"Feature">;
            properties: z.ZodRecord<z.ZodString, z.ZodUnknown>;
            geometry: z.ZodUnion<[z.ZodObject<{
                type: z.ZodLiteral<"Point">;
                coordinates: z.ZodTuple<[z.ZodNumber, z.ZodNumber], null>;
            }, "strip", z.ZodTypeAny, {
                type: "Point";
                coordinates: [number, number];
            }, {
                type: "Point";
                coordinates: [number, number];
            }>, z.ZodObject<{
                type: z.ZodLiteral<"LineString">;
                coordinates: z.ZodArray<z.ZodTuple<[z.ZodNumber, z.ZodNumber], null>, "many">;
            }, "strip", z.ZodTypeAny, {
                type: "LineString";
                coordinates: [number, number][];
            }, {
                type: "LineString";
                coordinates: [number, number][];
            }>, z.ZodObject<{
                type: z.ZodLiteral<"Polygon">;
                coordinates: z.ZodArray<z.ZodArray<z.ZodTuple<[z.ZodNumber, z.ZodNumber], null>, "many">, "many">;
            }, "strip", z.ZodTypeAny, {
                type: "Polygon";
                coordinates: [number, number][][];
            }, {
                type: "Polygon";
                coordinates: [number, number][][];
            }>]>;
            id: z.ZodOptional<z.ZodUnion<[z.ZodString, z.ZodNumber]>>;
        }, "strip", z.ZodTypeAny, {
            type: "Feature";
            properties: Record<string, unknown>;
            geometry: {
                type: "Point";
                coordinates: [number, number];
            } | {
                type: "LineString";
                coordinates: [number, number][];
            } | {
                type: "Polygon";
                coordinates: [number, number][][];
            };
            id?: string | number | undefined;
        }, {
            type: "Feature";
            properties: Record<string, unknown>;
            geometry: {
                type: "Point";
                coordinates: [number, number];
            } | {
                type: "LineString";
                coordinates: [number, number][];
            } | {
                type: "Polygon";
                coordinates: [number, number][][];
            };
            id?: string | number | undefined;
        }>, "many">;
        name: z.ZodOptional<z.ZodString>;
        crs: z.ZodOptional<z.ZodObject<{
            type: z.ZodLiteral<"name">;
            properties: z.ZodObject<{
                name: z.ZodString;
            }, "strip", z.ZodTypeAny, {
                name: string;
            }, {
                name: string;
            }>;
        }, "strip", z.ZodTypeAny, {
            type: "name";
            properties: {
                name: string;
            };
        }, {
            type: "name";
            properties: {
                name: string;
            };
        }>>;
    }, "strip", z.ZodTypeAny, {
        type: "FeatureCollection";
        features: {
            type: "Feature";
            properties: Record<string, unknown>;
            geometry: {
                type: "Point";
                coordinates: [number, number];
            } | {
                type: "LineString";
                coordinates: [number, number][];
            } | {
                type: "Polygon";
                coordinates: [number, number][][];
            };
            id?: string | number | undefined;
        }[];
        name?: string | undefined;
        crs?: {
            type: "name";
            properties: {
                name: string;
            };
        } | undefined;
    }, {
        type: "FeatureCollection";
        features: {
            type: "Feature";
            properties: Record<string, unknown>;
            geometry: {
                type: "Point";
                coordinates: [number, number];
            } | {
                type: "LineString";
                coordinates: [number, number][];
            } | {
                type: "Polygon";
                coordinates: [number, number][][];
            };
            id?: string | number | undefined;
        }[];
        name?: string | undefined;
        crs?: {
            type: "name";
            properties: {
                name: string;
            };
        } | undefined;
    }>>;
    clearExisting: z.ZodDefault<z.ZodBoolean>;
}, "strip", z.ZodTypeAny, {
    clearExisting: boolean;
    buildings?: {
        type: "FeatureCollection";
        features: {
            type: "Feature";
            properties: Record<string, unknown>;
            geometry: {
                type: "Point";
                coordinates: [number, number];
            } | {
                type: "LineString";
                coordinates: [number, number][];
            } | {
                type: "Polygon";
                coordinates: [number, number][][];
            };
            id?: string | number | undefined;
        }[];
        name?: string | undefined;
        crs?: {
            type: "name";
            properties: {
                name: string;
            };
        } | undefined;
    } | undefined;
    pathways?: {
        type: "FeatureCollection";
        features: {
            type: "Feature";
            properties: Record<string, unknown>;
            geometry: {
                type: "Point";
                coordinates: [number, number];
            } | {
                type: "LineString";
                coordinates: [number, number][];
            } | {
                type: "Polygon";
                coordinates: [number, number][][];
            };
            id?: string | number | undefined;
        }[];
        name?: string | undefined;
        crs?: {
            type: "name";
            properties: {
                name: string;
            };
        } | undefined;
    } | undefined;
    boundary?: {
        type: "FeatureCollection";
        features: {
            type: "Feature";
            properties: Record<string, unknown>;
            geometry: {
                type: "Point";
                coordinates: [number, number];
            } | {
                type: "LineString";
                coordinates: [number, number][];
            } | {
                type: "Polygon";
                coordinates: [number, number][][];
            };
            id?: string | number | undefined;
        }[];
        name?: string | undefined;
        crs?: {
            type: "name";
            properties: {
                name: string;
            };
        } | undefined;
    } | undefined;
}, {
    buildings?: {
        type: "FeatureCollection";
        features: {
            type: "Feature";
            properties: Record<string, unknown>;
            geometry: {
                type: "Point";
                coordinates: [number, number];
            } | {
                type: "LineString";
                coordinates: [number, number][];
            } | {
                type: "Polygon";
                coordinates: [number, number][][];
            };
            id?: string | number | undefined;
        }[];
        name?: string | undefined;
        crs?: {
            type: "name";
            properties: {
                name: string;
            };
        } | undefined;
    } | undefined;
    pathways?: {
        type: "FeatureCollection";
        features: {
            type: "Feature";
            properties: Record<string, unknown>;
            geometry: {
                type: "Point";
                coordinates: [number, number];
            } | {
                type: "LineString";
                coordinates: [number, number][];
            } | {
                type: "Polygon";
                coordinates: [number, number][][];
            };
            id?: string | number | undefined;
        }[];
        name?: string | undefined;
        crs?: {
            type: "name";
            properties: {
                name: string;
            };
        } | undefined;
    } | undefined;
    boundary?: {
        type: "FeatureCollection";
        features: {
            type: "Feature";
            properties: Record<string, unknown>;
            geometry: {
                type: "Point";
                coordinates: [number, number];
            } | {
                type: "LineString";
                coordinates: [number, number][];
            } | {
                type: "Polygon";
                coordinates: [number, number][][];
            };
            id?: string | number | undefined;
        }[];
        name?: string | undefined;
        crs?: {
            type: "name";
            properties: {
                name: string;
            };
        } | undefined;
    } | undefined;
    clearExisting?: boolean | undefined;
}>;
export type ImportCampusDataInput = z.infer<typeof ImportCampusDataInputSchema>;
/** Validate callable function input */
export declare const validateImportCampusDataInput: (data: unknown) => ImportCampusDataInput;
//# sourceMappingURL=validation.d.ts.map