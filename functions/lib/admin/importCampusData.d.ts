import * as functions from 'firebase-functions';
/**
 * Callable Function: importCampusData
 *
 * Imports campus GeoJSON data (buildings, pathways, boundary) into Firestore.
 * Only callable by users with 'admin' custom claim.
 *
 * Usage from Flutter:
 * ```dart
 * final importCampusData = FirebaseFunctions.instance.httpsCallable('importCampusData');
 * await importCampusData.call({
 *   buildings: buildingsGeoJSON,
 *   pathways: pathwaysGeoJSON,
 *   boundary: boundaryGeoJSON,
 *   clearExisting: true,
 * });
 * ```
 */
export declare const importCampusData: functions.HttpsFunction & functions.Runnable<any>;
//# sourceMappingURL=importCampusData.d.ts.map