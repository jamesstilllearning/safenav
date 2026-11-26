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
exports.registerToken = void 0;
const functions = __importStar(require("firebase-functions"));
const admin = __importStar(require("firebase-admin"));
const firestore_1 = require("../utils/firestore");
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
exports.registerToken = functions.https.onCall({
    enforceAppCheck: true,
    maxInstances: 10,
}, async (request) => {
    if (!request.auth) {
        throw new functions.https.HttpsError('unauthenticated', 'Authentication required. Please sign in.');
    }
    const { token, platform } = request.data;
    if (!token || typeof token !== 'string') {
        throw new functions.https.HttpsError('invalid-argument', 'FCM token is required.');
    }
    const db = (0, firestore_1.getFirestore)();
    const uid = request.auth.uid;
    const messaging = admin.messaging();
    // Store token in Firestore
    await db.collection('fcm_tokens').doc(uid).set({
        userId: uid,
        token,
        platform: platform || 'unknown',
        updatedAt: (0, firestore_1.serverTimestamp)(),
    }, { merge: true });
    // Get user role for topic subscription
    let role = 'student';
    try {
        const userDoc = await db.collection('users').doc(uid).get();
        if (userDoc.exists) {
            role = userDoc.data()?.role || 'student';
        }
    }
    catch (e) {
        console.warn(`registerToken: Could not read user profile for ${uid}: ${e}`);
    }
    // Subscribe to role-based FCM topics via Admin SDK
    const topics = ['all_users', role];
    try {
        await messaging.subscribeToTopic([token], topics);
    }
    catch (e) {
        console.warn(`registerToken: FCM topic subscription warning: ${e}`);
        // Don't fail - token is still stored for later sync
    }
    return {
        success: true,
        message: 'FCM token registered successfully',
        topics,
    };
});
//# sourceMappingURL=registerToken.js.map