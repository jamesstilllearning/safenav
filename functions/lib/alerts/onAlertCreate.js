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
exports.onAlertCreate = void 0;
const functions = __importStar(require("firebase-functions"));
const admin = __importStar(require("firebase-admin"));
const firestore_1 = require("../utils/firestore");
const audit_1 = require("../utils/audit");
/**
 * Background Trigger: onAlertCreate
 *
 * Fires when an alert document is created in Firestore. Determines the
 * targeted FCM topics from the alert's `targetRoles` and `targetBuildingIds`,
 * sends the notification to those topics, and writes audit logs.
 */
exports.onAlertCreate = functions.firestore
    .document('alerts/{alertId}')
    .onCreate(async (snapshot, context) => {
    const alertId = context.params.alertId;
    const data = snapshot.data();
    if (!data) {
        console.log(`onAlertCreate: No data for alert ${alertId}`);
        return;
    }
    const { title, message, severity, targetRoles = [], targetBuildingIds = [], createdBy, createdByRole, isTest, } = data;
    try {
        const messaging = admin.messaging();
        const db = (0, firestore_1.getFirestore)();
        // Determine FCM topics from alert targeting
        const topics = new Set(['all_users']);
        if (Array.isArray(targetRoles)) {
            targetRoles.forEach((role) => topics.add(role));
        }
        if (Array.isArray(targetBuildingIds)) {
            targetBuildingIds.forEach((bid) => {
                if (bid && bid !== 'all') {
                    topics.add(`building_${bid}`);
                }
            });
        }
        const topicList = Array.from(topics);
        // Send FCM notification to all targeted topics
        const messages = topicList.map((topic) => ({
            topic,
            notification: {
                title: title || 'SAFENAV Alert',
                body: message || '',
            },
            data: {
                type: 'alert',
                alertId,
                severity: severity || 'info',
                isTest: isTest ? 'true' : 'false',
                ...(createdBy ? { createdBy } : {}),
            },
        }));
        if (messages.length > 0) {
            const response = await messaging.sendAll(messages);
            console.log(`onAlertCreate: Alert ${alertId} sent to ${response.successCount} topics, ${response.failureCount} failures`);
            // Write audit log for alert delivery
            await (0, audit_1.writeAlertSentAudit)(createdBy, createdByRole || 'system', alertId, topicList, response.successCount, response.failureCount);
        }
        // Write creation audit log
        await (0, audit_1.writeAlertCreationAudit)(createdBy, createdByRole || 'system', alertId, data);
        console.log(`onAlertCreate: Alert ${alertId} processed, topics: ${topicList.join(', ')}`);
    }
    catch (error) {
        console.error('onAlertCreate error:', error);
    }
});
//# sourceMappingURL=onAlertCreate.js.map