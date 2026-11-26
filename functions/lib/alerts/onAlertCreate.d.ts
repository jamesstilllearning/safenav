import * as functions from 'firebase-functions';
/**
 * Background Trigger: onAlertCreate
 *
 * Fires when an alert document is created in Firestore. Determines the
 * targeted FCM topics from the alert's `targetRoles` and `targetBuildingIds`,
 * sends the notification to those topics, and writes audit logs.
 */
export declare const onAlertCreate: functions.CloudFunction<functions.firestore.QueryDocumentSnapshot>;
//# sourceMappingURL=onAlertCreate.d.ts.map