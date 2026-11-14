/** Cloudflare Worker: Refresh FCM Topic Subscriptions (Scheduled - Hourly) */

import { FirestoreRESTClient, FieldValue } from '../utils/firestore-rest';
import { FCMRESTClient } from '../utils/fcm-rest';
import { writeAuditLog } from '../utils/audit';
import { createOAuthCache } from '../utils/oauth';

let firestoreClient: FirestoreRESTClient | null = null;
let fcmClient: FCMRESTClient | null = null;

function getClients(env: { FIREBASE_PROJECT_ID: string; KV: KVNamespace }) {
  if (!firestoreClient) {
    const oauthCache = createOAuthCache(env.KV, 'https://www.googleapis.com/auth/datastore');
    firestoreClient = new FirestoreRESTClient(env.FIREBASE_PROJECT_ID, oauthCache);
  }
  if (!fcmClient) {
    const oauthCache = createOAuthCache(env.KV, 'https://www.googleapis.com/auth/firebase.messaging');
    fcmClient = new FCMRESTClient(env.FIREBASE_PROJECT_ID, oauthCache);
  }
  return { firestoreClient, fcmClient };
}

/**
 * Scheduled handler for refreshFCMTopics
 * Runs hourly via Cloudflare Workers Cron Trigger
 *
 * Syncs user roles to FCM topic subscriptions:
 * - All users -> 'all' topic
 * - Students -> 'students' topic
 * - Faculty -> 'faculty' topic
 * - Security -> 'security' topic
 * - Admins -> 'admins' topic
 */
export async function refreshFCMTopics(env: { FIREBASE_PROJECT_ID: string; KV: KVNamespace }): Promise<{ success: boolean; subscribedCount: number; unsubscribedCount: number }> {
  console.log('[Scheduled] Running refreshFCMTopics...');

  const { firestoreClient, fcmClient } = getClients(env);

  let subscribedCount = 0;
  let unsubscribedCount = 0;

  try {
    // Get all users with their roles
    const usersSnapshot = await firestoreClient.listDocuments('users', { pageSize: 10000 });

    for (const userDoc of usersSnapshot.documents) {
      const userData = FirestoreRESTClient.documentToObject(userDoc);
      const uid = userDoc.name.split('/').pop() || '';
      const role = (userData.role as string) || 'student';

      // Determine topics for this user
      const topics = getTopicsForRole(role);

      // Get user's FCM token
      const tokenDoc = await firestoreClient.getDocument('fcm_tokens', uid);
      if (!tokenDoc) continue;

      const tokenData = FirestoreRESTClient.documentToObject(tokenDoc);
      if (!tokenData?.token) continue;

      const token = tokenData.token as string;

      try {
        // Subscribe to all relevant topics
        for (const topic of topics) {
          await fcmClient.subscribeToTopic([token], topic);
          subscribedCount++;
        }

        // Note: Unsubscribing from old topics would require tracking previous topics
        // For simplicity, we only add subscriptions. Old subscriptions naturally expire
        // when tokens are cleaned up.

      } catch (error) {
        console.error(`[Scheduled] Failed to subscribe user ${uid} to topics:`, error);
      }
    }

    // Write audit log
    await writeAuditLog(firestoreClient, {
      actorId: 'system',
      actorRole: 'system',
      action: 'fcm_topics.refreshed',
      targetType: 'auth',
      targetId: 'bulk',
      after: {
        subscribedCount,
        processedUsers: usersSnapshot.documents.length,
        refreshedAt: new Date().toISOString(),
      },
    });

    console.log(`[Scheduled] Refreshed FCM topics for ${usersSnapshot.documents.length} users (${subscribedCount} subscriptions)`);
    return { success: true, subscribedCount, unsubscribedCount };
  } catch (error) {
    console.error('[Scheduled] refreshFCMTopics error:', error);
    return { success: false, subscribedCount: 0, unsubscribedCount: 0 };
  }
}

/** Get FCM topics for a user role */
function getTopicsForRole(role: string): string[] {
  const baseTopics = ['all'];
  const roleTopics: Record<string, string[]> = {
    student: ['students'],
    faculty: ['faculty'],
    security: ['security'],
    admin: ['admins'],
  };

  return [...baseTopics, ...(roleTopics[role] || [])];
}

// For testing via HTTP
export const handler = async (c: any) => refreshFCMTopics(c.env);