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
exports.onAlertCleanup = void 0;
const functions = __importStar(require("firebase-functions"));
const admin = __importStar(require("firebase-admin"));
const firestore_1 = require("../utils/firestore");
/**
 * Scheduled Trigger: onAlertCleanup
 *
 * Runs once daily. Expires any alert document whose `expiresAt` is in the
 * past and whose `status` is still `active`, marking it `expired` so it is
 * no longer treated as actionable.
 */
exports.onAlertCleanup = functions.pubsub
    .schedule('every 24 hours')
    .onRun(async () => {
    const db = (0, firestore_1.getFirestore)();
    const now = new Date();
    const snapshot = await db
        .collection('alerts')
        .where('expiresAt', '<=', now)
        .where('status', '==', 'active')
        .get();
    if (snapshot.empty) {
        console.log('onAlertCleanup: No active alerts to expire.');
        return null;
    }
    const batch = db.batch();
    for (const doc of snapshot.docs) {
        batch.update(doc.ref, {
            status: 'expired',
            expiredAt: admin.firestore.FieldValue.serverTimestamp(),
            updatedAt: admin.firestore.FieldValue.serverTimestamp(),
        });
    }
    await batch.commit();
    console.log(`onAlertCleanup: Expired ${snapshot.size} active alert(s).`);
    return null;
});
//# sourceMappingURL=onAlertCleanup.js.map