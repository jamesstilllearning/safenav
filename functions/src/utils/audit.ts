import * as admin from 'firebase-admin';
import { getFirestore, serverTimestamp } from './firestore';

export interface AuditLogEntry {
  actorId: string;
  actorRole: string;
  action: string;
  targetType: 'user' | 'alert' | 'emergency_report' | 'evacuation_graph' |
            'building' | 'pathway' | 'settings' | 'auth' | 'campus_data';
  targetId: string;
  before?: Record<string, unknown>;
  after?: Record<string, unknown>;
  metadata?: Record<string, unknown>;
}

/** Write an audit log entry */
export async function writeAuditLog(entry: AuditLogEntry): Promise<void> {
  try {
    await getFirestore().collection('audit_logs').add({
      ...entry,
      timestamp: serverTimestamp(),
    });
  } catch (error) {
    // Log error but don't throw - audit logging should not break main flow
    console.error('Failed to write audit log:', error);
  }
}

/** Write multiple audit log entries in a batch */
export async function writeAuditLogBatch(entries: AuditLogEntry[]): Promise<void> {
  if (entries.length === 0) return;

  try {
    const batch = getFirestore().batch();
    const collection = getFirestore().collection('audit_logs');

    for (const entry of entries) {
      const docRef = collection.doc();
      batch.set(docRef, {
        ...entry,
        timestamp: serverTimestamp(),
      });
    }

    await batch.commit();
  } catch (error) {
    console.error('Failed to write audit log batch:', error);
  }
}

/** Create audit log for campus data import */
export async function writeCampusDataImportAudit(
  actorId: string,
  actorRole: string,
  counts: { buildings: number; pathways: number; boundary: boolean }
): Promise<void> {
  await writeAuditLog({
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
  actorId: string,
  targetUid: string,
  oldRole: string,
  newRole: string
): Promise<void> {
  await writeAuditLog({
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
  actorId: string,
  actorRole: string,
  alertId: string,
  alertData: Record<string, unknown>
): Promise<void> {
  await writeAuditLog({
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
  actorId: string,
  actorRole: string,
  alertId: string,
  topics: string[],
  successCount: number,
  failureCount: number
): Promise<void> {
  await writeAuditLog({
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