import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

import { getFirestore, serverTimestamp } from '../utils/firestore';
import { writeAuditLog } from '../utils/audit';

/**
 * Background Trigger: onUserCreate
 *
 * Fires when a Firebase Auth user is created. Sets the `role` custom claim
 * based on the user's Firestore profile (defaulting to 'student') and
 * initializes their FCM tokens document.
 */
export const onUserCreate = functions.auth.user().onCreate(async (user) => {
  const { uid, email } = user;

  try {
    const db = getFirestore();

    // Read the user's Firestore profile to get their role.
    // The profile may not exist yet if it is created after the Auth user,
    // in which case onUserProfileCreate handles claim assignment.
    const userDoc = await db.collection('users').doc(uid).get();

    let role = 'student';
    if (userDoc.exists) {
      role = (userDoc.data()?.role as string) || 'student';
    }

    // Set custom claims for role-based access control (enforced by Firestore rules)
    await admin.auth().setCustomUserClaims(uid, { role });

    // Initialize FCM tokens document (token will be filled by registerToken)
    await db.collection('fcm_tokens').doc(uid).set(
      {
        userId: uid,
        token: '',
        platform: 'unknown',
        updatedAt: serverTimestamp(),
      },
      { merge: true },
    );

    // Write audit log
    await writeAuditLog({
      actorId: uid,
      actorRole: role,
      action: 'user.created',
      targetType: 'auth',
      targetId: uid,
      after: { email, role },
    });

    console.log(`onUserCreate: User ${uid} created with role ${role}`);
  } catch (error) {
    console.error('onUserCreate error:', error);
  }
});
