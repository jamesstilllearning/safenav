import * as functions from 'firebase-functions';
/**
 * Callable Function: registerToken
 *
 * Allows an authenticated user to register their FCM device token. The token
 * is stored in `fcm_tokens/{uid}` and the device is subscribed to role-based
 * FCM topics (all_users + role).
 *
 * Usage from Flutter:
 * ```dart
 * final registerToken = FirebaseFunctions.instance.httpsCallable('registerToken');
 * await registerToken.call({'token': fcmToken, 'platform': Platform.operatingSystem});
 * ```
 */
export declare const registerToken: functions.HttpsFunction & functions.Runnable<any>;
//# sourceMappingURL=registerToken.d.ts.map