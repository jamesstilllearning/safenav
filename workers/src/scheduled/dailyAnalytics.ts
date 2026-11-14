/** Cloudflare Worker: Daily Analytics Aggregation (Scheduled - Daily 03:00 UTC) */

import { getFirestore, serverTimestamp } from '../utils/firestore';
import { writeAuditLog } from '../utils/audit';

/**
 * Scheduled handler for dailyAnalytics
 * Runs daily at 03:00 UTC via Cloudflare Workers Cron Trigger
 *
 * Aggregates daily statistics and stores in analytics/{date} collection
 */
export async function dailyAnalytics(): Promise<{ success: boolean; date: string }> {
  console.log('[Scheduled] Running dailyAnalytics...');

  const db = getFirestore();
  const now = new Date();
  const dateStr = now.toISOString().split('T')[0]; // YYYY-MM-DD
  const startOfDay = new Date(dateStr + 'T00:00:00.000Z');
  const endOfDay = new Date(dateStr + 'T23:59:59.999Z');

  try {
    // Aggregate various metrics
    const [
      usersSnapshot,
      activeUsersSnapshot,
      alertsSnapshot,
      reportsSnapshot,
      buildingsSnapshot,
      pathwaysSnapshot,
    ] = await Promise.all([
      // Total users
      db.collection('users').get(),
      // Active users today (signed in)
      db.collection('users')
        .where('lastSignInAt', '>=', startOfDay)
        .where('lastSignInAt', '<=', endOfDay)
        .get(),
      // Alerts created today
      db.collection('alerts')
        .where('createdAt', '>=', startOfDay)
        .where('createdAt', '<=', endOfDay)
        .get(),
      // Emergency reports created today
      db.collection('emergency_reports')
        .where('createdAt', '>=', startOfDay)
        .where('createdAt', '<=', endOfDay)
        .get(),
      // Total buildings
      db.collection('buildings').get(),
      // Total pathways
      db.collection('pathways').get(),
    ]);

    // Count alerts by type and severity
    const alertsByType: Record<string, number> = {};
    const alertsBySeverity: Record<string, number> = {};

    for (const doc of alertsSnapshot.docs) {
      const data = doc.data();
      const type = data.type || 'unknown';
      const severity = data.severity || 'unknown';
      alertsByType[type] = (alertsByType[type] || 0) + 1;
      alertsBySeverity[severity] = (alertsBySeverity[severity] || 0) + 1;
    }

    // Count reports by type and priority
    const reportsByType: Record<string, number> = {};
    const reportsByPriority: Record<string, number> = {};

    for (const doc of reportsSnapshot.docs) {
      const data = doc.data();
      const type = data.type || 'unknown';
      const priority = data.priority || 0;
      reportsByType[type] = (reportsByType[type] || 0) + 1;
      const priorityBucket = priority >= 8 ? 'critical' : priority >= 5 ? 'high' : 'low';
      reportsByPriority[priorityBucket] = (reportsByPriority[priorityBucket] || 0) + 1;
    }

    // Count users by role
    const usersByRole: Record<string, number> = {};
    for (const doc of usersSnapshot.docs) {
      const data = doc.data();
      const role = data.role || 'student';
      usersByRole[role] = (usersByRole[role] || 0) + 1;
    }

    // Prepare analytics document
    const analyticsData = {
      date: dateStr,
      timestamp: serverTimestamp(),
      users: {
        total: usersSnapshot.size,
        activeToday: activeUsersSnapshot.size,
        byRole: usersByRole,
      },
      alerts: {
        total: alertsSnapshot.size,
        byType: alertsByType,
        bySeverity: alertsBySeverity,
      },
      emergencyReports: {
        total: reportsSnapshot.size,
        byType: reportsByType,
        byPriority: reportsByPriority,
      },
      campusData: {
        buildings: buildingsSnapshot.size,
        pathways: pathwaysSnapshot.size,
      },
    };

    // Save to analytics collection
    await db.collection('analytics').doc(dateStr).set(analyticsData);

    // Write audit log
    await writeAuditLog({
      actorId: 'system',
      actorRole: 'system',
      action: 'analytics.daily_aggregated',
      targetType: 'analytics',
      targetId: dateStr,
      after: {
        date: dateStr,
        usersTotal: usersSnapshot.size,
        alertsTotal: alertsSnapshot.size,
        reportsTotal: reportsSnapshot.size,
      },
    });

    console.log(`[Scheduled] Daily analytics saved for ${dateStr}`);
    return { success: true, date: dateStr };
  } catch (error) {
    console.error('[Scheduled] dailyAnalytics error:', error);
    return { success: false, date: dateStr };
  }
}

// For testing via HTTP
export const handler = async () => dailyAnalytics();