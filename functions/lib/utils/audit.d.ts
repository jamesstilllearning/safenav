export interface AuditLogEntry {
    actorId: string;
    actorRole: string;
    action: string;
    targetType: 'user' | 'alert' | 'emergency_report' | 'evacuation_graph' | 'building' | 'pathway' | 'settings' | 'auth' | 'campus_data';
    targetId: string;
    before?: Record<string, unknown>;
    after?: Record<string, unknown>;
    metadata?: Record<string, unknown>;
}
/** Write an audit log entry */
export declare function writeAuditLog(entry: AuditLogEntry): Promise<void>;
/** Write multiple audit log entries in a batch */
export declare function writeAuditLogBatch(entries: AuditLogEntry[]): Promise<void>;
/** Create audit log for campus data import */
export declare function writeCampusDataImportAudit(actorId: string, actorRole: string, counts: {
    buildings: number;
    pathways: number;
    boundary: boolean;
}): Promise<void>;
/** Create audit log for user role change */
export declare function writeRoleChangeAudit(actorId: string, targetUid: string, oldRole: string, newRole: string): Promise<void>;
/** Create audit log for alert creation */
export declare function writeAlertCreationAudit(actorId: string, actorRole: string, alertId: string, alertData: Record<string, unknown>): Promise<void>;
/** Create audit log for alert sent via FCM */
export declare function writeAlertSentAudit(actorId: string, actorRole: string, alertId: string, topics: string[], successCount: number, failureCount: number): Promise<void>;
//# sourceMappingURL=audit.d.ts.map