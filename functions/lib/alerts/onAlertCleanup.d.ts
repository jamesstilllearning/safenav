import * as functions from 'firebase-functions';
/**
 * Scheduled Trigger: onAlertCleanup
 *
 * Runs once daily. Expires any alert document whose `expiresAt` is in the
 * past and whose `status` is still `active`, marking it `expired` so it is
 * no longer treated as actionable.
 */
export declare const onAlertCleanup: functions.CloudFunction<unknown>;
//# sourceMappingURL=onAlertCleanup.d.ts.map