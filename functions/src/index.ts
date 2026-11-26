import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

import { importCampusData } from './admin/importCampusData';
import { setUserRole } from './admin/setUserRole';
import { onUserCreate } from './auth/onUserCreate';
import { onUserProfileCreate } from './auth/onUserProfileCreate';
import { registerToken } from './fcm/registerToken';
import { onAlertCreate } from './alerts/onAlertCreate';
import { onAlertCleanup } from './alerts/onAlertCleanup';
import { onEmergencyReportCreate } from './emergency/onReportCreate';

admin.initializeApp();

// Export all callable functions
export { importCampusData, setUserRole, registerToken };

// Export all background triggers
export { onUserCreate, onUserProfileCreate, onAlertCreate, onAlertCleanup, onEmergencyReportCreate };