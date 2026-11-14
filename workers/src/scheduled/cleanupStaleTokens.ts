/** Cloudflare Worker: Cleanup Stale FCM Tokens (Scheduled - Daily 04:00 UTC) */

import { FirestoreRESTClient, FieldValue } from '../utils/firestore-rest';
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
 * Scheduled handler for cleanupStaleTokens
 * Runs daily at 04:00 UTC via Cloudflare Workers Cron Trigger
 *
 * Removes FCM tokens that haven't been updated in 90 days
 */
export async function cleanupStaleTokens(env: { FIREBASE_PROJECT_ID: string; KV: KVNamespace }): Promise<{ success: boolean; deletedCount: number }> {
  console.log('[Scheduled] Running cleanupStaleTokens...');

  const db = getClient(env);
  const cutoffDate = new Date();
  cutoffDate.setDate(cutoffDate.getDate() - 90); // 90 days ago
  const cutoffISO = cutoffDate.toISOString();

  try {
    // Query tokens older than 90 days
    const query = {
      structuredQuery: {
        where: {
          fieldFilter: {
            field: { fieldPath: 'updatedAt' },
            op: 'LESS_THAN_OR_EQUAL',
            value: { timestampValue: cutoffISO },
          },
        },
      },
    };

    const snapshot = await db.queryDocuments('fcm_tokens', query);

    if (snapshot.length === 0) {
      console.log('[Scheduled] No stale tokens found');
      return { success: true, deletedCount: 0 };
    }

    // Batch delete stale tokens
    const documentIds = snapshot.map(doc => doc.name.split('/').pop()!);
    await db.batchDelete('fcm_tokens', documentIds);
    const deletedCount = documentIds.length;

    // Write audit log
    await writeAuditLog(db, {
      actorId: 'system',
      actorRole: 'system',
      action: 'fcm_tokens.cleanup_stale',
      targetType: 'auth',
      targetId: 'bulk',
      after: {
        deletedCount,
        cutoffDate: cutoffISO,
        cleanedAt: new Date().toISOString(),
      },
    });

    console.log(`[Scheduled] Deleted ${deletedCount} stale FCM tokens`);
    return { success: true, deletedCount };
  } catch (error) {
    console.error('[Scheduled] cleanupStaleTokens error:', error);
    return { success: false, deletedCount: 0 };
  }
}

// For testing via HTTP
export const handler = async (c: any) => cleanupStaleTokens(c.env);