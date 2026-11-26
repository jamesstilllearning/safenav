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
exports.onUserCreate = void 0;
const functions = __importStar(require("firebase-functions"));
const admin = __importStar(require("firebase-admin"));
const firestore_1 = require("../utils/firestore");
const audit_1 = require("../utils/audit");
/**
 * Background Trigger: onUserCreate
 *
 * Fires when a Firebase Auth user is created. Sets the `role` custom claim
 * based on the user's Firestore profile (defaulting to 'student') and
 * initializes their FCM tokens document.
 */
exports.onUserCreate = functions.auth.user().onCreate(async (user) => {
    const { uid, email } = user;
    try {
        const db = (0, firestore_1.getFirestore)();
        // Read the user's Firestore profile to get their role.
        // The profile may not exist yet if it is created after the Auth user,
        // in which case onUserProfileCreate handles claim assignment.
        const userDoc = await db.collection('users').doc(uid).get();
        let role = 'student';
        if (userDoc.exists) {
            role = userDoc.data()?.role || 'student';
        }
        // Set custom claims for role-based access control (enforced by Firestore rules)
        await admin.auth().setCustomUserClaims(uid, { role });
        // Initialize FCM tokens document (token will be filled by registerToken)
        await db.collection('fcm_tokens').doc(uid).set({
            userId: uid,
            token: '',
            platform: 'unknown',
            updatedAt: (0, firestore_1.serverTimestamp)(),
        }, { merge: true });
        // Write audit log
        await (0, audit_1.writeAuditLog)({
            actorId: uid,
            actorRole: role,
            action: 'user.created',
            targetType: 'auth',
            targetId: uid,
            after: { email, role },
        });
        console.log(`onUserCreate: User ${uid} created with role ${role}`);
    }
    catch (error) {
        console.error('onUserCreate error:', error);
    }
});
//# sourceMappingURL=onUserCreate.js.map