import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

import { getFirestore } from '../utils/firestore';
import { writeAuditLog } from '../utils/audit';

/**
 * Background Trigger: onEmergencyReportCreate
 *
 * Fires when an emergency report document is created in Firestore. Sends an
 * FCM notification to the `security` topic so campus security staff are
 * immediately alerted, and writes an audit log.
 */
export const onEmergencyReportCreate = functions.firestore
  .document('emergency_reports/{reportId}')
  .onCreate(async (snapshot, context) => {
    const reportId = context.params.reportId;
    const data = snapshot.data();

    if (!data) {
      console.log(`onEmergencyReportCreate: No data for report ${reportId}`);
      return;
    }

    const {
      userId,
      userName,
      type,
      description,
      userLocation,
      createdAt,
    } = data;

    try {
      const messaging = admin.messaging();
      const db = getFirestore();
      const location = userLocation && typeof userLocation === 'object' ? userLocation : {};

      // Send FCM notification to the security topic
      await messaging.sendToTopic('security', {
        notification: {
          title: `🚨 EMERGENCY: ${type}`,
          body: `${userName || 'Someone'} needs help at ${location.address || 'Location unknown'}`,
        },
        data: {
          type: 'emergency_report',
          reportId,
          userId: userId || '',
          emergencyType: type || 'other',
          latitude: String(location.latitude || 0),
          longitude: String(location.longitude || 0),
          timestamp: createdAt || new Date().toISOString(),
        },
      });

      // Write audit log
      await writeAuditLog({
        actorId: userId,
        actorRole: 'student',
        action: 'emergency_report.created',
        targetType: 'emergency_report',
        targetId: reportId,
        after: {
          type,
          description,
          userLocation: location,
          createdAt,
        },
      });

      console.log(`onEmergencyReportCreate: Report ${reportId} processed, security notified`);
    } catch (error) {
      console.error('onEmergencyReportCreate error:', error);
    }
  });
