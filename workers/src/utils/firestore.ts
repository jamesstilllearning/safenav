/** Firestore utility functions for Cloudflare Workers */

import {
  getFirestore as getFirestoreInstance,
  getAuth,
  getMessaging,
  getFirebaseAdmin,
  verifyIdToken,
  verifyAdminToken
} from './firebase';
import * as admin from 'firebase-admin';

/** Re-export Firebase Admin SDK getters */
export {
  getFirestoreInstance as getFirestore,
  getAuth,
  getMessaging,
  getFirebaseAdmin,
  verifyIdToken,
  verifyAdminToken
};

/** Convert Firestore GeoPoint to [lat, lng] tuple */
export const geoPointToTuple = (gp: admin.firestore.GeoPoint): [number, number] => [gp.latitude, gp.longitude];

/** Convert [lat, lng] tuple to Firestore GeoPoint */
export const tupleToGeoPoint = ([lat, lng]: [number, number]) => new admin.firestore.GeoPoint(lat, lng);

/** Convert array of [lat, lng] to GeoPoint array */
export const coordinatesToGeoPoints = (coords: [number, number][]): admin.firestore.GeoPoint[] =>
  coords.map(tupleToGeoPoint);

/** Convert array of GeoPoint to [lat, lng] tuples */
export const geoPointsToCoordinates = (points: admin.firestore.GeoPoint[]): [number, number][] =>
  points.map(geoPointToTuple);

/** Batch write helper - splits into chunks of 500 (Firestore limit) */
export async function batchWrite<T extends admin.firestore.DocumentData>(
  collection: admin.firestore.CollectionReference,
  docs: Array<{ id?: string; data: T }>
): Promise<void> {
  const batchSize = 500;
  for (let i = 0; i < docs.length; i += batchSize) {
    const batch = getFirestoreInstance().batch();
    const chunk = docs.slice(i, i + batchSize);

    for (const doc of chunk) {
      const ref = doc.id ? collection.doc(doc.id) : collection.doc();
      batch.set(ref, doc.data);
    }

    await batch.commit();
  }
}

/** Delete documents in batches */
export async function batchDelete(
  collection: admin.firestore.CollectionReference,
  docIds: string[]
): Promise<void> {
  const batchSize = 500;
  for (let i = 0; i < docIds.length; i += batchSize) {
    const batch = getFirestoreInstance().batch();
    const chunk = docIds.slice(i, i + batchSize);

    for (const id of chunk) {
      batch.delete(collection.doc(id));
    }

    await batch.commit();
  }
}

/** Get server timestamp */
export const serverTimestamp = () => admin.firestore.FieldValue.serverTimestamp();

/** Increment value */
export const increment = (n: number) => admin.firestore.FieldValue.increment(n);

/** Array union */
export const arrayUnion = (...elements: unknown[]) => admin.firestore.FieldValue.arrayUnion(...elements);

/** Array remove */
export const arrayRemove = (...elements: unknown[]) => admin.firestore.FieldValue.arrayRemove(...elements);

/** Get current timestamp as ISO string */
export const nowISO = () => new Date().toISOString();

/** Query helpers */
export const where = admin.firestore.Filter.where;
export const orderBy = (field: string, direction: 'asc' | 'desc' = 'asc') =>
  admin.firestore.FieldPath.documentId(); // placeholder for orderBy

/** Cursor helpers - these are instance methods on Query, not static */
/** Use query.startAt(...), query.startAfter(...), etc. directly */