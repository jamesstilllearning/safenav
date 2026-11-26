import * as functions from 'firebase-functions';
/**
 * Callable Function: setUserRole
 *
 * Sets or updates a user's role via custom claims and Firestore profile.
 * Only callable by users with 'admin' custom claim.
 *
 * Usage from Flutter:
 * ```dart
 * final setUserRole = FirebaseFunctions.instance.httpsCallable('setUserRole');
 * await setUserRole.call({
 *   targetUid: 'user_uid_here',
 *   newRole: 'admin', // 'student', 'faculty', 'security', 'admin'
 * });
 * ```
 */
export declare const setUserRole: functions.HttpsFunction & functions.Runnable<any>;
//# sourceMappingURL=setUserRole.d.ts.map