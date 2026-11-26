import * as functions from 'firebase-functions';
/**
 * Background Trigger: onUserCreate
 *
 * Fires when a Firebase Auth user is created. Sets the `role` custom claim
 * based on the user's Firestore profile (defaulting to 'student') and
 * initializes their FCM tokens document.
 */
export declare const onUserCreate: functions.CloudFunction<import("firebase-admin/auth").UserRecord>;
//# sourceMappingURL=onUserCreate.d.ts.map