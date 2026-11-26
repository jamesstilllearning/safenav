"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.writeAuditLog = writeAuditLog;
exports.writeAuditLogBatch = writeAuditLogBatch;
exports.writeCampusDataImportAudit = writeCampusDataImportAudit;
exports.writeRoleChangeAudit = writeRoleChangeAudit;
exports.writeAlertCreationAudit = writeAlertCreationAudit;
exports.writeAlertSentAudit = writeAlertSentAudit;
const firestore_1 = require("./firestore");
/** Write an audit log entry */
async function writeAuditLog(entry) {
    try {
        await (0, firestore_1.getFirestore)().collection('audit_logs').add({
            ...entry,
            timestamp: (0, firestore_1.serverTimestamp)(),
        });
    }
    catch (error) {
        // Log error but don't throw - audit logging should not break main flow
        console.error('Failed to write audit log:', error);
    }
}
/** Write multiple audit log entries in a batch */
async function writeAuditLogBatch(entries) {
    if (entries.length === 0)
        return;
    try {
        const batch = (0, firestore_1.getFirestore)().batch();
        const collection = (0, firestore_1.getFirestore)().collection('audit_logs');
        for (const entry of entries) {
            const docRef = collection.doc();
            batch.set(docRef, {
                ...entry,
                timestamp: (0, firestore_1.serverTimestamp)(),
            });
        }
        await batch.commit();
    }
    catch (error) {
        console.error('Failed to write audit log batch:', error);
    }
}
/** Create audit log for campus data import */
async function writeCampusDataImportAudit(actorId, actorRole, counts) {
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
async function writeRoleChangeAudit(actorId, targetUid, oldRole, newRole) {
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
async function writeAlertCreationAudit(actorId, actorRole, alertId, alertData) {
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
async function writeAlertSentAudit(actorId, actorRole, alertId, topics, successCount, failureCount) {
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
//# sourceMappingURL=audit.js.map