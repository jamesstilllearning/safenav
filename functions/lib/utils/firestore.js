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
exports.arrayRemove = exports.arrayUnion = exports.increment = exports.serverTimestamp = exports.geoPointsToCoordinates = exports.coordinatesToGeoPoints = exports.tupleToGeoPoint = exports.geoPointToTuple = exports.getFirestore = void 0;
exports.batchWrite = batchWrite;
exports.batchDelete = batchDelete;
const admin = __importStar(require("firebase-admin"));
/** Get Firestore instance with settings */
const getFirestore = () => admin.firestore();
exports.getFirestore = getFirestore;
/** Convert Firestore GeoPoint to [lat, lng] tuple */
const geoPointToTuple = (gp) => [gp.latitude, gp.longitude];
exports.geoPointToTuple = geoPointToTuple;
/** Convert [lat, lng] tuple to Firestore GeoPoint */
const tupleToGeoPoint = ([lat, lng]) => new admin.firestore.GeoPoint(lat, lng);
exports.tupleToGeoPoint = tupleToGeoPoint;
/** Convert array of [lat, lng] to GeoPoint array */
const coordinatesToGeoPoints = (coords) => coords.map(exports.tupleToGeoPoint);
exports.coordinatesToGeoPoints = coordinatesToGeoPoints;
/** Convert array of GeoPoint to [lat, lng] tuples */
const geoPointsToCoordinates = (points) => points.map(exports.geoPointToTuple);
exports.geoPointsToCoordinates = geoPointsToCoordinates;
/** Batch write helper - splits into chunks of 500 (Firestore limit) */
async function batchWrite(collection, docs) {
    const batchSize = 500;
    for (let i = 0; i < docs.length; i += batchSize) {
        const batch = (0, exports.getFirestore)().batch();
        const chunk = docs.slice(i, i + batchSize);
        for (const doc of chunk) {
            const ref = doc.id ? collection.doc(doc.id) : collection.doc();
            batch.set(ref, doc.data);
        }
        await batch.commit();
    }
}
/** Delete documents in batches */
async function batchDelete(collection, docIds) {
    const batchSize = 500;
    for (let i = 0; i < docIds.length; i += batchSize) {
        const batch = (0, exports.getFirestore)().batch();
        const chunk = docIds.slice(i, i + batchSize);
        for (const id of chunk) {
            batch.delete(collection.doc(id));
        }
        await batch.commit();
    }
}
/** Get server timestamp */
const serverTimestamp = () => admin.firestore.FieldValue.serverTimestamp();
exports.serverTimestamp = serverTimestamp;
/** Increment value */
const increment = (n) => admin.firestore.FieldValue.increment(n);
exports.increment = increment;
/** Array union */
const arrayUnion = (...elements) => admin.firestore.FieldValue.arrayUnion(...elements);
exports.arrayUnion = arrayUnion;
/** Array remove */
const arrayRemove = (...elements) => admin.firestore.FieldValue.arrayRemove(...elements);
exports.arrayRemove = arrayRemove;
//# sourceMappingURL=firestore.js.map