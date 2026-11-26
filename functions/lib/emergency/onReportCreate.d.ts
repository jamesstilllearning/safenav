import * as functions from 'firebase-functions';
/**
 * Background Trigger: onEmergencyReportCreate
 *
 * Fires when an emergency report document is created in Firestore. Sends an
 * FCM notification to the `security` topic so campus security staff are
 * immediately alerted, and writes an audit log.
 */
export declare const onEmergencyReportCreate: functions.CloudFunction<functions.firestore.QueryDocumentSnapshot>;
//# sourceMappingURL=onReportCreate.d.ts.map