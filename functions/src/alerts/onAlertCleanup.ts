import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

import { getFirestore } from '../utils/firestore';

/**
 * Scheduled Trigger: onAlertCleanup
 *
 * Runs once daily. Expires any alert document whose `expiresAt` is in the
 * past and whose `status` is still `active`, marking it `expired` so it is
 * no longer treated as actionable.
 *
 * Notes:
 * - `expiresAt` is stored in Firestore as an ISO 8601 string (the Dart
 *   `Alert` model serializes via `toIso8601String()`), so each candidate's
 *   `expiresAt` is parsed into a `Date` and compared numerically rather than
 *   relying on a Firestore Timestamp comparison.
 * - A single equality filter on `status` is used, so no composite Firestore
 *   index is required (single-field equality queries are auto-indexed).
 */
export const onAlertCleanup = functions.pubsub
  .schedule('every 24 hours')
  .onRun(async () => {
    const db = getFirestore();
    const now = new Date();

    const snapshot = await db.collection('alerts').where('status', '==', 'active').get();

    if (snapshot.empty) {
      console.log('onAlertCleanup: No active alerts to evaluate.');
      return null;
    }

    const batch = db.batch();
    let expiredCount = 0;

    for (const doc of snapshot.docs) {
      const data = doc.data();
      const raw = data['expiresAt'];

      let expiresDate: Date | null = null;
      if (typeof raw === 'string') {
        expiresDate = new Date(raw);
      } else if (raw && typeof (raw as any).toDate === 'function') {
        // Defensive: handle Firestore Timestamp values if ever present.
        expiresDate = (raw as any).toDate();
      }

      if (
        expiresDate &&
        !isNaN(expiresDate.getTime()) &&
        expiresDate.getTime() <= now.getTime()
      ) {
        batch.update(doc.ref, {
          status: 'expired',
          expiredAt: admin.firestore.FieldValue.serverTimestamp(),
          updatedAt: admin.firestore.FieldValue.serverTimestamp(),
        });
        expiredCount += 1;
      }
    }

    if (expiredCount > 0) {
      await batch.commit();
    }

    console.log(
      `onAlertCleanup: Evaluated ${snapshot.size} active alert(s), expired ${expiredCount}.`,
    );
    return null;
  });
