/// SAFENAV CAVITE - Alerts Repository
///
/// Repository for managing alerts in Firestore.
library;

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart' as fs;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/failures.dart' hide FirebaseException;
import '../../../../core/errors/result.dart';
import '../../../../core/firebase/firebase_init.dart';
import '../../../../shared/models/alert.dart';

/// Alerts repository provider
final alertsRepositoryProvider = Provider<AlertsRepository>((ref) => AlertsRepository.instance);

/// Repository for alert operations
class AlertsRepository {
  AlertsRepository._() {
    debugPrint('[ALERTS_REPO] AlertsRepository: Constructor called');
  }

  static final AlertsRepository _instance = AlertsRepository._();
  static AlertsRepository get instance => _instance;

  final fs.FirebaseFirestore _firestore = fs.FirebaseFirestore.instance;

  /// Collection reference for alerts
  fs.CollectionReference<Map<String, dynamic>> get _alertsCollection =>
      _firestore.collection(FirebaseConfig.alertsCollection);

  /// Creates a new alert
  Future<Result<Alert>> createAlert(Alert alert) async {
    try {
      debugPrint('[ALERTS_REPO] createAlert: Creating alert ${alert.id}');
      final docRef = _alertsCollection.doc(alert.id);
      await docRef.set(alert.toJson());
      debugPrint('[ALERTS_REPO] createAlert: Successfully created alert ${alert.id}');
      return Success(alert);
    } on fs.FirebaseException catch (e) {
      debugPrint('[ALERTS_REPO] createAlert: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[ALERTS_REPO] createAlert: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to create alert',
        code: 'CREATE_ALERT_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Gets an alert by ID
  Future<Result<Alert>> getAlert(String alertId) async {
    try {
      debugPrint('[ALERTS_REPO] getAlert: Fetching alert $alertId');
      final docSnapshot = await _alertsCollection.doc(alertId).get();

      if (!docSnapshot.exists) {
        debugPrint('[ALERTS_REPO] getAlert: Alert not found: $alertId');
        return FailureResult(FirestoreFailure(
          message: 'Alert not found',
          code: 'ALERT_NOT_FOUND',
        ));
      }

      final data = docSnapshot.data()!;
      final alert = Alert.fromJson(data);
      debugPrint('[ALERTS_REPO] getAlert: Successfully fetched alert $alertId');
      return Success(alert);
    } on fs.FirebaseException catch (e) {
      debugPrint('[ALERTS_REPO] getAlert: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[ALERTS_REPO] getAlert: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to get alert',
        code: 'GET_ALERT_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Updates an alert
  Future<Result<Alert>> updateAlert(Alert alert) async {
    try {
      debugPrint('[ALERTS_REPO] updateAlert: Updating alert ${alert.id}');
      final docRef = _alertsCollection.doc(alert.id);
      final updatedAlert = alert.copyWith(updatedAt: DateTime.now());
      await docRef.update(updatedAlert.toJson());
      debugPrint('[ALERTS_REPO] updateAlert: Successfully updated alert ${alert.id}');
      return Success(updatedAlert);
    } on fs.FirebaseException catch (e) {
      debugPrint('[ALERTS_REPO] updateAlert: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[ALERTS_REPO] updateAlert: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to update alert',
        code: 'UPDATE_ALERT_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Deletes an alert (admin only)
  Future<Result<void>> deleteAlert(String alertId) async {
    try {
      debugPrint('[ALERTS_REPO] deleteAlert: Deleting alert $alertId');
      await _alertsCollection.doc(alertId).delete();
      debugPrint('[ALERTS_REPO] deleteAlert: Successfully deleted alert $alertId');
      return const Success(null);
    } on fs.FirebaseException catch (e) {
      debugPrint('[ALERTS_REPO] deleteAlert: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[ALERTS_REPO] deleteAlert: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to delete alert',
        code: 'DELETE_ALERT_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Gets alerts with filtering and pagination
  Future<Result<List<Alert>>> getAlerts({
    AlertStatus? status,
    AlertSeverity? severity,
    String? buildingId,
    List<String>? targetRoles,
    int limit = 50,
    DocumentSnapshot? startAfter,
  }) async {
    try {
      debugPrint('[ALERTS_REPO] getAlerts: Fetching alerts with filters');
      fs.Query<Map<String, dynamic>> query = _alertsCollection
          .orderBy('createdAt', descending: true)
          .limit(limit);

      if (status != null) {
        query = query.where('status', isEqualTo: status.name);
      }
      if (severity != null) {
        query = query.where('severity', isEqualTo: severity.name);
      }
      if (buildingId != null) {
        query = query.where('buildingId', isEqualTo: buildingId);
      }
      if (targetRoles != null && targetRoles.isNotEmpty) {
        query = query.where('targetRoles', arrayContainsAny: targetRoles);
      }
      if (startAfter != null) {
        query = query.startAfterDocument(startAfter);
      }

      final snapshot = await query.get();
      final alerts = snapshot.docs
          .map((doc) => Alert.fromJson(doc.data()))
          .toList();

      debugPrint('[ALERTS_REPO] getAlerts: Fetched ${alerts.length} alerts');
      return Success(alerts);
    } on fs.FirebaseException catch (e) {
      debugPrint('[ALERTS_REPO] getAlerts: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[ALERTS_REPO] getAlerts: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to get alerts',
        code: 'GET_ALERTS_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Stream of alerts for real-time updates
  Stream<List<Alert>> watchAlerts({
    AlertStatus? status,
    AlertSeverity? severity,
    String? buildingId,
    List<String>? targetRoles,
    int limit = 50,
  }) {
    fs.Query<Map<String, dynamic>> query = _alertsCollection
        .orderBy('createdAt', descending: true)
        .limit(limit);

    if (status != null) {
      query = query.where('status', isEqualTo: status.name);
    }
    if (severity != null) {
      query = query.where('severity', isEqualTo: severity.name);
    }
    if (buildingId != null) {
      query = query.where('buildingId', isEqualTo: buildingId);
    }
    if (targetRoles != null && targetRoles.isNotEmpty) {
      query = query.where('targetRoles', arrayContainsAny: targetRoles);
    }

    return query.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Alert.fromJson(doc.data()))
          .toList();
    });
  }

  /// Gets active alerts count for a user's roles
  Future<Result<int>> getActiveAlertsCount(List<String> userRoles) async {
    try {
      final snapshot = await _alertsCollection
          .where('status', isEqualTo: AlertStatus.active.name)
          .where('targetRoles', arrayContainsAny: userRoles)
          .count()
          .get();
      return Success(snapshot.count ?? 0);
    } on fs.FirebaseException catch (e) {
      debugPrint('[ALERTS_REPO] getActiveAlertsCount: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
      ));
    } catch (e) {
      return FailureResult(FirestoreFailure(
        message: 'Failed to get active alerts count',
        code: 'GET_COUNT_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Acknowledges an alert by adding user to acknowledgedBy list
  Future<Result<Alert>> acknowledgeAlert(String alertId, String userId) async {
    try {
      debugPrint('[ALERTS_REPO] acknowledgeAlert: User $userId acknowledging alert $alertId');
      final docRef = _alertsCollection.doc(alertId);
      final docSnapshot = await docRef.get();

      if (!docSnapshot.exists) {
        return FailureResult(FirestoreFailure(
          message: 'Alert not found',
          code: 'ALERT_NOT_FOUND',
        ));
      }

      final alert = Alert.fromJson(docSnapshot.data()!);
      if (alert.acknowledgedBy.contains(userId)) {
        return Success(alert); // Already acknowledged
      }

      final updatedAlert = alert.copyWith(
        status: AlertStatus.acknowledged,
        acknowledgedBy: [...alert.acknowledgedBy, userId],
        updatedAt: DateTime.now(),
      );

      await docRef.update(updatedAlert.toJson());
      debugPrint('[ALERTS_REPO] acknowledgeAlert: Successfully acknowledged alert $alertId');
      return Success(updatedAlert);
    } on fs.FirebaseException catch (e) {
      debugPrint('[ALERTS_REPO] acknowledgeAlert: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
      ));
    } catch (e) {
      debugPrint('[ALERTS_REPO] acknowledgeAlert: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to acknowledge alert',
        code: 'ACKNOWLEDGE_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Resolves an alert
  Future<Result<Alert>> resolveAlert(String alertId, String userId, {String? notes}) async {
    try {
      debugPrint('[ALERTS_REPO] resolveAlert: User $userId resolving alert $alertId');
      final docRef = _alertsCollection.doc(alertId);
      final docSnapshot = await docRef.get();

      if (!docSnapshot.exists) {
        return FailureResult(FirestoreFailure(
          message: 'Alert not found',
          code: 'ALERT_NOT_FOUND',
        ));
      }

      final alert = Alert.fromJson(docSnapshot.data()!);
      final updatedAlert = alert.copyWith(
        status: AlertStatus.resolved,
        resolvedBy: userId,
        resolutionNotes: notes,
        updatedAt: DateTime.now(),
      );

      await docRef.update(updatedAlert.toJson());
      debugPrint('[ALERTS_REPO] resolveAlert: Successfully resolved alert $alertId');
      return Success(updatedAlert);
    } on fs.FirebaseException catch (e) {
      debugPrint('[ALERTS_REPO] resolveAlert: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
      ));
    } catch (e) {
      debugPrint('[ALERTS_REPO] resolveAlert: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to resolve alert',
        code: 'RESOLVE_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Maps Firestore error codes to user-friendly messages
  String _getFirestoreErrorMessage(String code) {
    switch (code) {
      case 'permission-denied':
        return 'Permission denied. You do not have access to this resource.';
      case 'not-found':
        return 'The requested document was not found.';
      case 'already-exists':
        return 'A document with this ID already exists.';
      case 'resource-exhausted':
        return 'Too many requests. Please try again later.';
      case 'failed-precondition':
        return 'Operation failed due to a precondition.';
      case 'aborted':
        return 'Operation was aborted. Please try again.';
      case 'out-of-range':
        return 'Operation was out of range.';
      case 'unimplemented':
        return 'Operation is not implemented.';
      case 'internal':
        return 'Internal server error. Please try again later.';
      case 'unavailable':
        return 'Service unavailable. Please check your connection.';
      case 'data-loss':
        return 'Data loss occurred. Please contact support.';
      case 'unauthenticated':
        return 'Authentication required. Please sign in again.';
      default:
        return 'Database error: $code';
    }
  }
}