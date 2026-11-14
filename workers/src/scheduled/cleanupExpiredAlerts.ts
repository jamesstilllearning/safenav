/** Cloudflare Worker: Cleanup Expired Alerts (Scheduled - Daily 02:00 UTC) */

import { FirestoreRESTClient, FieldValue, FirestoreRESTClient as FirestoreClient } from '../utils/firestore-rest';
import { writeAuditLog } from '../utils/audit';
import { createOAuthCache } from '../utils/oauth';

let firestoreClient: FirestoreRESTClient | null = null;

function getClient(env: { FIREBASE_PROJECT_ID: string; KV: KVNamespace }): FirestoreRESTClient {
  if (!firestoreClient) {
    const oauthCache = createOAuthCache(env.KV, 'https://www.googleapis.com/auth/datastore');
    firestoreClient = new FirestoreRESTClient(env.FIREBASE_PROJECT_ID, oauthCache);
  }
  return firestoreClient;
}

/**
 * Scheduled handler for cleanupExpiredAlerts
 * Runs daily at 02:00 UTC via Cloudflare Workers Cron Trigger
 *
 * Sets status=expired for alerts past their expiresAt timestamp
 */
export async function cleanupExpiredAlerts(env: { FIREBASE_PROJECT_ID: string; KV: KVNamespace }): Promise<{ success: boolean; updatedCount: number }> {
  console.log('[Scheduled] Running cleanupExpiredAlerts...');

  const db = getClient(env);
  const now = new Date().toISOString();

  try {
    // Query alerts that are active and have expired
    // Firestore REST API query for alerts where status == 'active' AND expiresAt <= now
    const query = {
      structuredQuery: {
        where: {
          compositeFilter: {
            op: 'AND' as const,
            filters: [
              { fieldFilter: { field: { fieldPath: 'status' }, op: 'EQUAL' as const, value: { stringValue: 'active' } } },
              { fieldFilter: { field: { fieldPath: 'expiresAt' }, op: 'LESS_THAN_OR_EQUAL' as const, value: { timestampValue: now } } },
            ],
          },
        },
      },
    };

    const snapshot = await db.queryDocuments('alerts', query);

    if (snapshot.length === 0) {
      console.log('[Scheduled] No expired alerts found');
      return { success: true, updatedCount: 0 };
    }

    // Batch update expired alerts (max 500 per batch)
    const batchSize = 500;
    let updatedCount = 0;
    const nowISO = new Date().toISOString();

    for (let i = 0; i < snapshot.length; i += batchSize) {
      const batch = snapshot.slice(i, i + batchSize);
      const writes = batch.map(doc => ({
        update: {
          name: doc.name,
          fields: {
            status: { stringValue: 'expired' },
            updatedAt: { timestampValue: nowISO },
          },
          createTime: nowISO,
          updateTime: nowISO,
        },
      }));

      await db.batchWrite(writes);
      updatedCount += batch.length;
    }

    // Write audit log
    await writeAuditLog(db, {
      actorId: 'system',
      actorRole: 'system',
      action: 'alerts.expired_cleanup',
      targetType: 'alert',
      targetId: 'bulk',
      after: {
        updatedCount,
        cleanedAt: now,
      },
    });

    console.log(`[Scheduled] Marked ${updatedCount} alerts as expired`);
    return { success: true, updatedCount };
  } catch (error) {
    console.error('[Scheduled] cleanupExpiredAlerts error:', error);
    return { success: false, updatedCount: 0 };
  }
}

// For testing via HTTP
export const handler = async (c: any) => cleanupExpiredAlerts(c.env);