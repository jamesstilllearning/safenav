import * as admin from 'firebase-admin';
/** Get Firestore instance with settings */
export declare const getFirestore: () => admin.firestore.Firestore;
/** Convert Firestore GeoPoint to [lat, lng] tuple */
export declare const geoPointToTuple: (gp: admin.firestore.GeoPoint) => [number, number];
/** Convert [lat, lng] tuple to Firestore GeoPoint */
export declare const tupleToGeoPoint: ([lat, lng]: [number, number]) => admin.firestore.GeoPoint;
/** Convert array of [lat, lng] to GeoPoint array */
export declare const coordinatesToGeoPoints: (coords: [number, number][]) => admin.firestore.GeoPoint[];
/** Convert array of GeoPoint to [lat, lng] tuples */
export declare const geoPointsToCoordinates: (points: admin.firestore.GeoPoint[]) => [number, number][];
/** Batch write helper - splits into chunks of 500 (Firestore limit) */
export declare function batchWrite<T>(collection: admin.firestore.CollectionReference, docs: Array<{
    id?: string;
    data: T;
}>): Promise<void>;
/** Delete documents in batches */
export declare function batchDelete(collection: admin.firestore.CollectionReference, docIds: string[]): Promise<void>;
/** Get server timestamp */
export declare const serverTimestamp: () => admin.firestore.FieldValue;
/** Increment value */
export declare const increment: (n: number) => admin.firestore.FieldValue;
/** Array union */
export declare const arrayUnion: (...elements: unknown[]) => admin.firestore.FieldValue;
/** Array remove */
export declare const arrayRemove: (...elements: unknown[]) => admin.firestore.FieldValue;
//# sourceMappingURL=firestore.d.ts.map