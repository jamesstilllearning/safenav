import * as functions from 'firebase-functions';
/**
 * Background Trigger: onUserProfileCreate
 *
 * Fires when a user's Firestore profile document is created. Updates the
 * user's `role` custom claim to match the profile. This handles the case
 * where the profile is created after the Auth user (onUserCreate defaults
 * to 'student' until the profile exists).
 */
export declare const onUserProfileCreate: functions.CloudFunction<functions.firestore.QueryDocumentSnapshot>;
//# sourceMappingURL=onUserProfileCreate.d.ts.map