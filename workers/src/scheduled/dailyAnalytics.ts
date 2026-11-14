/** Cloudflare Worker: Daily Analytics Aggregation (Scheduled - Daily 03:00 UTC) */

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
 * Scheduled handler for dailyAnalytics
 * Runs daily at 03:00 UTC via Cloudflare Workers Cron Trigger
 *
 * Aggregates daily statistics and stores in analytics/{date} collection
 */
export async function dailyAnalytics(env: { FIREBASE_PROJECT_ID: string; KV: KVNamespace }): Promise<{ success: boolean; date: string }> {
  console.log('[Scheduled] Running dailyAnalytics...');

  const db = getClient(env);
  const now = new Date();
  const dateStr = now.toISOString().split('T')[0]; // YYYY-MM-DD
  const startOfDay = new Date(dateStr + 'T00:00:00.000Z').toISOString();
  const endOfDay = new Date(dateStr + 'T23:59:59.999Z').toISOString();

  try {
    // Aggregate various metrics using queries
    const [
      usersSnapshot,
      activeUsersSnapshot,
      alertsSnapshot,
      reportsSnapshot,
      buildingsSnapshot,
      pathwaysSnapshot,
    ] = await Promise.all([
      // Total users
      db.listDocuments('users', { pageSize: 10000 }),
      // Active users today (signed in)
      db.queryDocuments('users', {
        structuredQuery: {
          where: {
            compositeFilter: {
              op: 'AND' as const,
              filters: [
                { fieldFilter: { field: { fieldPath: 'lastSignInAt' }, op: 'GREATER_THAN_OR_EQUAL' as const, value: { timestampValue: startOfDay } } },
                { fieldFilter: { field: { fieldPath: 'lastSignInAt' }, op: 'LESS_THAN_OR_EQUAL' as const, value: { timestampValue: endOfDay } } },
              ],
            },
          },
        },
      }),
      // Alerts created today
      db.queryDocuments('alerts', {
        structuredQuery: {
          where: {
            compositeFilter: {
              op: 'AND' as const,
              filters: [
                { fieldFilter: { field: { fieldPath: 'createdAt' }, op: 'GREATER_THAN_OR_EQUAL' as const, value: { timestampValue: startOfDay } } },
                { fieldFilter: { field: { fieldPath: 'createdAt' }, op: 'LESS_THAN_OR_EQUAL' as const, value: { timestampValue: endOfDay } } },
              ],
            },
          },
        },
      }),
      // Emergency reports created today
      db.queryDocuments('emergency_reports', {
        structuredQuery: {
          where: {
            compositeFilter: {
              op: 'AND' as const,
              filters: [
                { fieldFilter: { field: { fieldPath: 'createdAt' }, op: 'GREATER_THAN_OR_EQUAL' as const, value: { timestampValue: startOfDay } } },
                { fieldFilter: { field: { fieldPath: 'createdAt' }, op: 'LESS_THAN_OR_EQUAL' as const, value: { timestampValue: endOfDay } } },
              ],
            },
          },
        },
      }),
      // Total buildings
      db.listDocuments('buildings', { pageSize: 10000 }),
      // Total pathways
      db.listDocuments('pathways', { pageSize: 10000 }),
    ]);

    // Count alerts by type and severity
    const alertsByType: Record<string, number> = {};
    const alertsBySeverity: Record<string, number> = {};

    for (const doc of alertsSnapshot) {
      const data = FirestoreRESTClient.documentToObject(doc);
      const type = (data.type as string) || 'unknown';
      const severity = (data.severity as string) || 'unknown';
      alertsByType[type] = (alertsByType[type] || 0) + 1;
      alertsBySeverity[severity] = (alertsBySeverity[severity] || 0) + 1;
    }

    // Count reports by type and priority
    const reportsByType: Record<string, number> = {};
    const reportsByPriority: Record<string, number> = {};

    for (const doc of reportsSnapshot) {
      const data = FirestoreRESTClient.documentToObject(doc);
      const type = (data.type as string) || 'unknown';
      const priority = (data.priority as number) || 0;
      reportsByType[type] = (reportsByType[type] || 0) + 1;
      const priorityBucket = priority >= 8 ? 'critical' : priority >= 5 ? 'high' : 'low';
      reportsByPriority[priorityBucket] = (reportsByPriority[priorityBucket] || 0) + 1;
    }

    // Count users by role
    const usersByRole: Record<string, number> = {};
    for (const doc of usersSnapshot.documents) {
      const data = FirestoreRESTClient.documentToObject(doc);
      const role = (data.role as string) || 'student';
      usersByRole[role] = (usersByRole[role] || 0) + 1;
    }

    // Prepare analytics document
    const analyticsData = {
      date: dateStr,
      timestamp: FieldValue.serverTimestamp(),
      users: {
        total: usersSnapshot.documents.length,
        activeToday: activeUsersSnapshot.length,
        byRole: usersByRole,
      },
      alerts: {
        total: alertsSnapshot.length,
        byType: alertsByType,
        bySeverity: alertsBySeverity,
      },
      emergencyReports: {
        total: reportsSnapshot.length,
        byType: reportsByType,
        byPriority: reportsByPriority,
      },
      campusData: {
        buildings: buildingsSnapshot.documents.length,
        pathways: pathwaysSnapshot.documents.length,
      },
    };

    // Save to analytics collection
    await db.createDocument('analytics', analyticsData, dateStr);

    // Write audit log
    await writeAuditLog(db, {
      actorId: 'system',
      actorRole: 'system',
      action: 'analytics.daily_aggregated',
      targetType: 'analytics',
      targetId: dateStr,
      after: {
        date: dateStr,
        usersTotal: usersSnapshot.documents.length,
        alertsTotal: alertsSnapshot.length,
        reportsTotal: reportsSnapshot.length,
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
export const handler = async (c: any) => dailyAnalytics(c.env);