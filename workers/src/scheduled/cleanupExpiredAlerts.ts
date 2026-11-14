/** Cloudflare Worker: Cleanup Expired Alerts (Scheduled - Daily 02:00 UTC) */

import { getFirestore, serverTimestamp } from '../utils/firestore';
import { writeAuditLog } from '../utils/audit';

/**
 * Scheduled handler for cleanupExpiredAlerts
 * Runs daily at 02:00 UTC via Cloudflare Workers Cron Trigger
 *
 * Sets status=expired for alerts past their expiresAt timestamp
 */
export async function cleanupExpiredAlerts(): Promise<{ success: boolean; updatedCount: number }> {
  console.log('[Scheduled] Running cleanupExpiredAlerts...');

  const db = getFirestore();
  const alertsCol = db.collection('alerts');
  const now = new Date();

  try {
    // Query alerts that are active and have expired
    const snapshot = await alertsCol
      .where('status', '==', 'active')
      .where('expiresAt', '<=', now)
      .get();

    if (snapshot.empty) {
      console.log('[Scheduled] No expired alerts found');
      return { success: true, updatedCount: 0 };
    }

    // Batch update expired alerts
    const batch = db.batch();
    let updatedCount = 0;

    for (const doc of snapshot.docs) {
      batch.update(doc.ref, {
        status: 'expired',
        updatedAt: serverTimestamp(),
      });
      updatedCount++;
    }

    await batch.commit();

    // Write audit log
    await writeAuditLog({
      actorId: 'system',
      actorRole: 'system',
      action: 'alerts.expired_cleanup',
      targetType: 'alert',
      targetId: 'bulk',
      after: {
        updatedCount,
        cleanedAt: now.toISOString(),
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
export const handler = async () => cleanupExpiredAlerts();