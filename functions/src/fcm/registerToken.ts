import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

import { getFirestore, serverTimestamp } from '../utils/firestore';

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
export const registerToken = functions.https.onCall(
  {
    enforceAppCheck: true,
    maxInstances: 10,
  },
  async (request) => {
    if (!request.auth) {
      throw new functions.https.HttpsError(
        'unauthenticated',
        'Authentication required. Please sign in.',
      );
    }

    const { token, platform } = request.data as {
      token: string;
      platform?: string;
    };

    if (!token || typeof token !== 'string') {
      throw new functions.https.HttpsError(
        'invalid-argument',
        'FCM token is required.',
      );
    }

    const db = getFirestore();
    const uid = request.auth.uid;
    const messaging = admin.messaging();

    // Store token in Firestore
    await db.collection('fcm_tokens').doc(uid).set(
      {
        userId: uid,
        token,
        platform: platform || 'unknown',
        updatedAt: serverTimestamp(),
      },
      { merge: true },
    );

    // Get user role for topic subscription
    let role = 'student';
    try {
      const userDoc = await db.collection('users').doc(uid).get();
      if (userDoc.exists) {
        role = (userDoc.data()?.role as string) || 'student';
      }
    } catch (e) {
      console.warn(`registerToken: Could not read user profile for ${uid}: ${e}`);
    }

    // Subscribe to role-based FCM topics via Admin SDK
    const topics = ['all_users', role];
    try {
      await messaging.subscribeToTopic([token], topics);
    } catch (e) {
      console.warn(`registerToken: FCM topic subscription warning: ${e}`);
      // Don't fail - token is still stored for later sync
    }

    return {
      success: true,
      message: 'FCM token registered successfully',
      topics,
    };
  }
);
