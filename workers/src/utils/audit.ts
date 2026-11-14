/** Audit logging utilities for Cloudflare Workers */

import { FirestoreRESTClient, FieldValue } from './firestore-rest';

export interface AuditLogEntry {
  actorId: string;
  actorRole: string;
  action: string;
  targetType: 'user' | 'alert' | 'emergency_report' | 'evacuation_graph' |
            'building' | 'pathway' | 'settings' | 'auth' | 'campus_data' | 'analytics';
  targetId: string;
  before?: Record<string, unknown>;
  after?: Record<string, unknown>;
  metadata?: Record<string, unknown>;
}

/** Write an audit log entry */
export async function writeAuditLog(
  client: FirestoreRESTClient,
  entry: AuditLogEntry
): Promise<void> {
  try {
    await client.createDocument('audit_logs', {
      ...entry,
      timestamp: FieldValue.serverTimestamp(),
    });
  } catch (error) {
    // Log error but don't throw - audit logging should not break main flow
    console.error('Failed to write audit log:', error);
  }
}

/** Write multiple audit log entries in a batch */
export async function writeAuditLogBatch(
  client: FirestoreRESTClient,
  entries: AuditLogEntry[]
): Promise<void> {
  if (entries.length === 0) return;

  try {
    const now = new Date().toISOString();
    const writes = entries.map(entry => ({
      update: {
        name: `${client['baseUrl']}/documents/audit_logs`,
        fields: Object.fromEntries(
          Object.entries({
            ...entry,
            timestamp: FieldValue.serverTimestamp(),
          }).map(([k, v]) => [k, FirestoreRESTClient.toFirestoreValue(v)])
        ),
        createTime: now,
        updateTime: now,
      },
    }));

    await client.batchWrite(writes);
  } catch (error) {
    console.error('Failed to write audit log batch:', error);
  }
}

/** Create audit log for campus data import */
export async function writeCampusDataImportAudit(
  client: FirestoreRESTClient,
  actorId: string,
  actorRole: string,
  counts: { buildings: number; pathways: number; boundary: boolean }
): Promise<void> {
  await writeAuditLog(client, {
    actorId,
    actorRole,
    action: 'campus_data.imported',
    targetType: 'campus_data',
    targetId: 'bulk_import',
    after: {
      buildingsImported: counts.buildings,
      pathwaysImported: counts.pathways,
      boundaryImported: counts.boundary,
      importedAt: new Date().toISOString(),
    },
  });
}

/** Create audit log for user role change */
export async function writeRoleChangeAudit(
  client: FirestoreRESTClient,
  actorId: string,
  targetUid: string,
  oldRole: string,
  newRole: string
): Promise<void> {
  await writeAuditLog(client, {
    actorId,
    actorRole: 'admin',
    action: 'user.role_changed',
    targetType: 'user',
    targetId: targetUid,
    before: { role: oldRole },
    after: { role: newRole },
  });
}

/** Create audit log for alert creation */
export async function writeAlertCreationAudit(
  client: FirestoreRESTClient,
  actorId: string,
  actorRole: string,
  alertId: string,
  alertData: Record<string, unknown>
): Promise<void> {
  await writeAuditLog(client, {
    actorId,
    actorRole,
    action: 'alert.created',
    targetType: 'alert',
    targetId: alertId,
    after: alertData,
  });
}

/** Create audit log for alert sent via FCM */
export async function writeAlertSentAudit(
  client: FirestoreRESTClient,
  actorId: string,
  actorRole: string,
  alertId: string,
  topics: string[],
  successCount: number,
  failureCount: number
): Promise<void> {
  await writeAuditLog(client, {
    actorId,
    actorRole,
    action: 'alert.sent',
    targetType: 'alert',
    targetId: alertId,
    after: {
      topics,
      successCount,
      failureCount,
      sentAt: new Date().toISOString(),
    },
  });
}

/** Create audit log for emergency report */
export async function writeEmergencyReportAudit(
  client: FirestoreRESTClient,
  actorId: string,
  actorRole: string,
  reportId: string,
  action: 'created' | 'updated' | 'resolved' | 'escalated',
  data: Record<string, unknown>
): Promise<void> {
  await writeAuditLog(client, {
    actorId,
    actorRole,
    action: `emergency_report.${action}`,
    targetType: 'emergency_report',
    targetId: reportId,
    after: data,
  });
}

/** Create audit log for token registration */
export async function writeTokenRegistrationAudit(
  client: FirestoreRESTClient,
  actorId: string,
  platform: string,
  success: boolean
): Promise<void> {
  await writeAuditLog(client, {
    actorId,
    actorRole: 'user',
    action: 'fcm_token.registered',
    targetType: 'auth',
    targetId: actorId,
    after: {
      platform,
      success,
      registeredAt: new Date().toISOString(),
    },
  });
}