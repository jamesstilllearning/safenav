import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

import { getFirestore } from '../utils/firestore';
import { writeAlertCreationAudit, writeAlertSentAudit } from '../utils/audit';

/**
 * Background Trigger: onAlertCreate
 *
 * Fires when an alert document is created in Firestore. Determines the
 * targeted FCM topics from the alert's `targetRoles` and `targetBuildingIds`,
 * sends the notification to those topics, and writes audit logs.
 */
export const onAlertCreate = functions.firestore
  .document('alerts/{alertId}')
  .onCreate(async (snapshot, context) => {
    const alertId = context.params.alertId;
    const data = snapshot.data();

    if (!data) {
      console.log(`onAlertCreate: No data for alert ${alertId}`);
      return;
    }

    const {
      title,
      message,
      severity,
      targetRoles = [],
      targetBuildingIds = [],
      createdBy,
      createdByRole,
      isTest,
    } = data;

    try {
      const messaging = admin.messaging();
      const db = getFirestore();

      // Determine FCM topics from alert targeting
      const topics = new Set<string>(['all_users']);

      if (Array.isArray(targetRoles)) {
        targetRoles.forEach((role: string) => topics.add(role));
      }

      if (Array.isArray(targetBuildingIds)) {
        targetBuildingIds.forEach((bid: string) => {
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
        console.log(
          `onAlertCreate: Alert ${alertId} sent to ${response.successCount} topics, ${response.failureCount} failures`,
        );

        // Write audit log for alert delivery
        await writeAlertSentAudit(
          createdBy,
          createdByRole || 'system',
          alertId,
          topicList,
          response.successCount,
          response.failureCount,
        );
      }

      // Write creation audit log
      await writeAlertCreationAudit(createdBy, createdByRole || 'system', alertId, data);

      console.log(`onAlertCreate: Alert ${alertId} processed, topics: ${topicList.join(', ')}`);
    } catch (error) {
      console.error('onAlertCreate error:', error);
    }
  });
