import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

import { writeAuditLog } from '../utils/audit';

/**
 * Background Trigger: onUserProfileCreate
 *
 * Fires when a user's Firestore profile document is created. Updates the
 * user's `role` custom claim to match the profile. This handles the case
 * where the profile is created after the Auth user (onUserCreate defaults
 * to 'student' until the profile exists).
 */
export const onUserProfileCreate = functions.firestore
  .document('users/{userId}')
  .onCreate(async (snapshot, context) => {
    const userId = context.params.userId;
    const data = snapshot.data();

    if (!data?.role) {
      console.log(`onUserProfileCreate: No role in profile for ${userId}, skipping`);
      return;
    }

    try {
      const role = data.role as string;

      // Set custom claims based on profile role
      await admin.auth().setCustomUserClaims(userId, { role });

      // Write audit log
      await writeAuditLog({
        actorId: userId,
        actorRole: role,
        action: 'user.profile_created',
        targetType: 'user',
        targetId: userId,
        after: { role },
      });

      console.log(`onUserProfileCreate: Custom claims set for ${userId} to ${role}`);
    } catch (error) {
      console.error('onUserProfileCreate error:', error);
    }
  });
