import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

import { getFirestore, serverTimestamp } from '../utils/firestore';
import { writeRoleChangeAudit } from '../utils/audit';

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
export const setUserRole = functions.https.onCall(
  {
    enforceAppCheck: true,
    maxInstances: 10,
  },
  async (request) => {
    // 1. Verify authentication and admin role
    if (!request.auth) {
      throw new functions.https.HttpsError(
        'unauthenticated',
        'Authentication required. Please sign in as an admin.'
      );
    }

    if (request.auth.token.role !== 'admin') {
      throw new functions.https.HttpsError(
        'permission-denied',
        'Admin role required to change user roles.'
      );
    }

    const adminUid = request.auth.uid;

    try {
      // 2. Validate input
      const { targetUid, newRole } = request.data as {
        targetUid: string;
        newRole: string;
      };

      if (!targetUid || !newRole) {
        throw new functions.https.HttpsError(
          'invalid-argument',
          'Missing required fields: targetUid and newRole'
        );
      }

      const validRoles = ['student', 'faculty', 'security', 'admin'];
      if (!validRoles.includes(newRole)) {
        throw new functions.https.HttpsError(
          'invalid-argument',
          `Invalid role. Must be one of: ${validRoles.join(', ')}`
        );
      }

      // Prevent admin from removing their own admin role (safety check)
      if (targetUid === adminUid && newRole !== 'admin') {
        throw new functions.https.HttpsError(
          'failed-precondition',
          'Cannot remove your own admin role.'
        );
      }

      // 3. Get Firestore and Auth instances
      const db = getFirestore();
      const auth = admin.auth();

      // 4. Get current user profile to capture old role
      const userDocRef = db.collection('users').doc(targetUid);
      const userDoc = await userDocRef.get();

      let oldRole = 'student'; // default
      if (userDoc.exists) {
        oldRole = userDoc.data()?.role || 'student';
      }

      // If role hasn't changed, return early
      if (oldRole === newRole) {
        return {
          success: true,
          message: 'Role unchanged',
          targetUid,
          role: newRole,
        };
      }

      // 5. Update custom claims in Firebase Auth
      await auth.setCustomUserClaims(targetUid, { role: newRole });

      // 6. Update Firestore user profile
      await userDocRef.update({
        role: newRole,
        updatedAt: serverTimestamp(),
        updatedBy: adminUid,
      });

      // 7. Write audit log
      await writeRoleChangeAudit(adminUid, targetUid, oldRole, newRole);

      // 8. Return success response
      return {
        success: true,
        message: `User role updated to ${newRole}`,
        targetUid,
        oldRole,
        newRole,
      };
    } catch (error) {
      console.error('setUserRole error:', error);

      if (error instanceof functions.https.HttpsError) {
        throw error;
      }

      if (error instanceof admin.auth.AuthError) {
        if (error.code === 'auth/user-not-found') {
          throw new functions.https.HttpsError(
            'not-found',
            'Target user not found.'
          );
        }
      }

      throw new functions.https.HttpsError(
        'internal',
        `Failed to set user role: ${error instanceof Error ? error.message : 'Unknown error'}`
      );
    }
  }
);