import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

import { importCampusData } from './admin/importCampusData';

admin.initializeApp();

// Export all callable functions
export { importCampusData };

// Export all background triggers (to be implemented in later phases)
// export { onUserCreate } from './auth/onUserCreate';
// export { onUserDelete } from './auth/onUserDelete';
// export { onAlertCreate } from './alerts/onAlertCreate';
// export { onAlertUpdate } from './alerts/onAlertUpdate';
// export { onReportCreate } from './emergency/onReportCreate';
// export { onReportUpdate } from './emergency/onReportUpdate';
// export { registerToken } from './fcm/registerToken';
// export { cleanupTokens } from './fcm/cleanupTokens';
// export { cleanupExpiredAlerts } from './scheduled/cleanupExpiredAlerts';
// export { dailyAnalytics } from './scheduled/dailyAnalytics';