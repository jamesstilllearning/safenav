/** Cloudflare Worker: Cleanup Stale FCM Tokens (Scheduled - Daily 04:00 UTC) */

import { getFirestore, serverTimestamp } from '../utils/firestore';
import { writeAuditLog } from '../utils/audit';

/**
 * Scheduled handler for cleanupStaleTokens
 * Runs daily at 04:00 UTC via Cloudflare Workers Cron Trigger
 *
 * Removes FCM tokens that haven't been updated in 90 days
 */
export async function cleanupStaleTokens(): Promise<{ success: boolean; deletedCount: number }> {
  console.log('[Scheduled] Running cleanupStaleTokens...');

  const db = getFirestore();
  const tokensCol = db.collection('fcm_tokens');
  const cutoffDate = new Date();
  cutoffDate.setDate(cutoffDate.getDate() - 90); // 90 days ago

  try {
    // Query tokens older than 90 days
    const snapshot = await tokensCol
      .where('updatedAt', '<=', cutoffDate)
      .get();

    if (snapshot.empty) {
      console.log('[Scheduled] No stale tokens found');
      return { success: true, deletedCount: 0 };
    }

    // Batch delete stale tokens
    const batch = db.batch();
    let deletedCount = 0;

    for (const doc of snapshot.docs) {
      batch.delete(doc.ref);
      deletedCount++;
    }

    await batch.commit();

    // Write audit log
    await writeAuditLog({
      actorId: 'system',
      actorRole: 'system',
      action: 'fcm_tokens.cleanup_stale',
      targetType: 'auth',
      targetId: 'bulk',
      after: {
        deletedCount,
        cutoffDate: cutoffDate.toISOString(),
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
export const handler = async () => cleanupStaleTokens();