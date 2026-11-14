/** Cloudflare Worker: Refresh FCM Topic Subscriptions (Scheduled - Hourly) */

import { getFirestore, getMessaging, serverTimestamp } from '../utils/firestore';
import { writeAuditLog } from '../utils/audit';

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
export async function refreshFCMTopics(): Promise<{ success: boolean; subscribedCount: number; unsubscribedCount: number }> {
  console.log('[Scheduled] Running refreshFCMTopics...');

  const db = getFirestore();
  const messaging = getMessaging();
  const usersCol = db.collection('users');
  const tokensCol = db.collection('fcm_tokens');

  let subscribedCount = 0;
  let unsubscribedCount = 0;

  try {
    // Get all users with their roles
    const usersSnapshot = await usersCol.get();

    for (const userDoc of usersSnapshot.docs) {
      const userData = userDoc.data();
      const uid = userDoc.id;
      const role = userData.role || 'student';

      // Determine topics for this user
      const topics = getTopicsForRole(role);

      // Get user's FCM token
      const tokenDoc = await tokensCol.doc(uid).get();
      if (!tokenDoc.exists) continue;

      const tokenData = tokenDoc.data();
      if (!tokenData?.token) continue;

      const token = tokenData.token;

      try {
        // Subscribe to all relevant topics
        for (const topic of topics) {
          await messaging.subscribeToTopic([token], topic);
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
    await writeAuditLog({
      actorId: 'system',
      actorRole: 'system',
      action: 'fcm_topics.refreshed',
      targetType: 'auth',
      targetId: 'bulk',
      after: {
        subscribedCount,
        processedUsers: usersSnapshot.size,
        refreshedAt: new Date().toISOString(),
      },
    });

    console.log(`[Scheduled] Refreshed FCM topics for ${usersSnapshot.size} users (${subscribedCount} subscriptions)`);
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
export const handler = async () => refreshFCMTopics();