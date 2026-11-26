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
exports.onUserProfileCreate = void 0;
const functions = __importStar(require("firebase-functions"));
const admin = __importStar(require("firebase-admin"));
const audit_1 = require("../utils/audit");
/**
 * Background Trigger: onUserProfileCreate
 *
 * Fires when a user's Firestore profile document is created. Updates the
 * user's `role` custom claim to match the profile. This handles the case
 * where the profile is created after the Auth user (onUserCreate defaults
 * to 'student' until the profile exists).
 */
exports.onUserProfileCreate = functions.firestore
    .document('users/{userId}')
    .onCreate(async (snapshot, context) => {
    const userId = context.params.userId;
    const data = snapshot.data();
    if (!data?.role) {
        console.log(`onUserProfileCreate: No role in profile for ${userId}, skipping`);
        return;
    }
    try {
        const role = data.role;
        // Set custom claims based on profile role
        await admin.auth().setCustomUserClaims(userId, { role });
        // Write audit log
        await (0, audit_1.writeAuditLog)({
            actorId: userId,
            actorRole: role,
            action: 'user.profile_created',
            targetType: 'user',
            targetId: userId,
            after: { role },
        });
        console.log(`onUserProfileCreate: Custom claims set for ${userId} to ${role}`);
    }
    catch (error) {
        console.error('onUserProfileCreate error:', error);
    }
});
//# sourceMappingURL=onUserProfileCreate.js.map