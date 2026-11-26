"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || (function () {
    var ownKeys = function(o) {
        ownKeys = Object.getOwnPropertyNames || function (o) {
            var ar = [];
            for (var k in o) if (Object.prototype.hasOwnProperty.call(o, k)) ar[ar.length] = k;
            return ar;
        };
        return ownKeys(o);
    };
    return function (mod) {
        if (mod && mod.__esModule) return mod;
        var result = {};
        if (mod != null) for (var k = ownKeys(mod), i = 0; i < k.length; i++) if (k[i] !== "default") __createBinding(result, mod, k[i]);
        __setModuleDefault(result, mod);
        return result;
    };
})();
Object.defineProperty(exports, "__esModule", { value: true });
exports.setUserRole = void 0;
const functions = __importStar(require("firebase-functions"));
const admin = __importStar(require("firebase-admin"));
const firestore_1 = require("../utils/firestore");
const audit_1 = require("../utils/audit");
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
exports.setUserRole = functions.https.onCall({
    enforceAppCheck: true,
    maxInstances: 10,
}, async (request) => {
    // 1. Verify authentication and admin role
    if (!request.auth) {
        throw new functions.https.HttpsError('unauthenticated', 'Authentication required. Please sign in as an admin.');
    }
    if (request.auth.token.role !== 'admin') {
        throw new functions.https.HttpsError('permission-denied', 'Admin role required to change user roles.');
    }
    const adminUid = request.auth.uid;
    try {
        // 2. Validate input
        const { targetUid, newRole } = request.data;
        if (!targetUid || !newRole) {
            throw new functions.https.HttpsError('invalid-argument', 'Missing required fields: targetUid and newRole');
        }
        const validRoles = ['student', 'faculty', 'security', 'admin'];
        if (!validRoles.includes(newRole)) {
            throw new functions.https.HttpsError('invalid-argument', `Invalid role. Must be one of: ${validRoles.join(', ')}`);
        }
        // Prevent admin from removing their own admin role (safety check)
        if (targetUid === adminUid && newRole !== 'admin') {
            throw new functions.https.HttpsError('failed-precondition', 'Cannot remove your own admin role.');
        }
        // 3. Get Firestore and Auth instances
        const db = (0, firestore_1.getFirestore)();
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
            updatedAt: (0, firestore_1.serverTimestamp)(),
            updatedBy: adminUid,
        });
        // 7. Write audit log
        await (0, audit_1.writeRoleChangeAudit)(adminUid, targetUid, oldRole, newRole);
        // 8. Return success response
        return {
            success: true,
            message: `User role updated to ${newRole}`,
            targetUid,
            oldRole,
            newRole,
        };
    }
    catch (error) {
        console.error('setUserRole error:', error);
        if (error instanceof functions.https.HttpsError) {
            throw error;
        }
        if (error instanceof admin.auth.AuthError) {
            if (error.code === 'auth/user-not-found') {
                throw new functions.https.HttpsError('not-found', 'Target user not found.');
            }
        }
        throw new functions.https.HttpsError('internal', `Failed to set user role: ${error instanceof Error ? error.message : 'Unknown error'}`);
    }
});
//# sourceMappingURL=setUserRole.js.map