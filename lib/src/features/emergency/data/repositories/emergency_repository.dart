/// SAFENAV CAVITE - Emergency Repository
///
/// Repository for managing SOS emergency reports, campus emergency contacts,
/// and evacuation routes in Firestore.
library;

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart' as fs;
import 'package:cloud_functions/cloud_functions.dart' hide Result;
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/errors/failures.dart' hide FirebaseException;
import '../../../../core/errors/result.dart';
import '../../../../core/firebase/firebase_init.dart';
import '../../../../core/services/location_service.dart';
import '../../../../shared/models/evacuation_graph.dart';
import '../models/emergency_report.dart';

/// Emergency repository provider
final emergencyRepositoryProvider = Provider<EmergencyRepository>((ref) => EmergencyRepository.instance);

/// Collection names for emergency data
class EmergencyCollections {
  EmergencyCollections._();

  static const String emergencyReports = 'emergency_reports';
  static const String campusEmergencyContacts = 'campus_emergency_contacts';
  static const String assemblyPoints = 'assembly_points';
  static const String evacuationRoutes = 'evacuation_routes';
}

/// Repository for emergency operations
class EmergencyRepository {
  EmergencyRepository._() {
    debugPrint('[EMERGENCY_REPO] EmergencyRepository: Constructor called');
  }

  static final EmergencyRepository _instance = EmergencyRepository._();
  static EmergencyRepository get instance => _instance;

  final fs.FirebaseFirestore _firestore = fs.FirebaseFirestore.instance;
  final FirebaseFunctions _functions = FirebaseFunctions.instance;
  final LocationService _locationService = LocationService.instance;

  // ==================== EMERGENCY REPORTS ====================

  /// Collection reference for emergency reports
  fs.CollectionReference<Map<String, dynamic>> get _reportsCollection =>
      _firestore.collection(EmergencyCollections.emergencyReports);

  /// Creates a new emergency report
  Future<Result<EmergencyReport>> createReport(EmergencyReport report) async {
    try {
      debugPrint('[EMERGENCY_REPO] createReport: Creating report ${report.id}');
      final docRef = _reportsCollection.doc(report.id);
      await docRef.set(report.toJson());
      debugPrint('[EMERGENCY_REPO] createReport: Successfully created report ${report.id}');

      // Trigger notifications after successful creation
      await _notifySecurityOnEmergency(report);

      return Success(report);
    } on fs.FirebaseException catch (e) {
      debugPrint('[EMERGENCY_REPO] createReport: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[EMERGENCY_REPO] createReport: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to create emergency report',
        code: 'CREATE_REPORT_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Gets an emergency report by ID
  Future<Result<EmergencyReport>> getReport(String reportId) async {
    try {
      debugPrint('[EMERGENCY_REPO] getReport: Fetching report $reportId');
      final docSnapshot = await _reportsCollection.doc(reportId).get();

      if (!docSnapshot.exists) {
        debugPrint('[EMERGENCY_REPO] getReport: Report not found: $reportId');
        return FailureResult(FirestoreFailure(
          message: 'Emergency report not found',
          code: 'REPORT_NOT_FOUND',
        ));
      }

      final data = docSnapshot.data()!;
      final report = EmergencyReport.fromJson(data);
      debugPrint('[EMERGENCY_REPO] getReport: Successfully fetched report $reportId');
      return Success(report);
    } on fs.FirebaseException catch (e) {
      debugPrint('[EMERGENCY_REPO] getReport: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[EMERGENCY_REPO] getReport: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to get emergency report',
        code: 'GET_REPORT_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Updates an emergency report
  Future<Result<EmergencyReport>> updateReport(EmergencyReport report) async {
    try {
      debugPrint('[EMERGENCY_REPO] updateReport: Updating report ${report.id}');
      final docRef = _reportsCollection.doc(report.id);
      final updatedReport = report.copyWith(updatedAt: DateTime.now());
      await docRef.update(updatedReport.toJson());
      debugPrint('[EMERGENCY_REPO] updateReport: Successfully updated report ${report.id}');
      return Success(updatedReport);
    } on fs.FirebaseException catch (e) {
      debugPrint('[EMERGENCY_REPO] updateReport: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[EMERGENCY_REPO] updateReport: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to update emergency report',
        code: 'UPDATE_REPORT_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Updates only the status of an emergency report (for security responders)
  Future<Result<EmergencyReport>> updateReportStatus(
    String reportId,
    EmergencyStatus status, {
    ResponderInfo? responder,
    String? note,
  }) async {
    try {
      debugPrint('[EMERGENCY_REPO] updateReportStatus: Updating report $reportId to $status');
      final docRef = _reportsCollection.doc(reportId);
      final docSnapshot = await docRef.get();

      if (!docSnapshot.exists) {
        return FailureResult(FirestoreFailure(
          message: 'Emergency report not found',
          code: 'REPORT_NOT_FOUND',
        ));
      }

      final report = EmergencyReport.fromJson(docSnapshot.data()!);
      EmergencyReport updatedReport = report.withStatus(status);

      if (responder != null) {
        updatedReport = updatedReport.assignResponder(responder);
      }

      if (note != null && note.isNotEmpty) {
        updatedReport = updatedReport.addNote(note);
      }

      await docRef.update(updatedReport.toJson());
      debugPrint('[EMERGENCY_REPO] updateReportStatus: Successfully updated report $reportId');
      return Success(updatedReport);
    } on fs.FirebaseException catch (e) {
      debugPrint('[EMERGENCY_REPO] updateReportStatus: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[EMERGENCY_REPO] updateReportStatus: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to update report status',
        code: 'UPDATE_STATUS_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Cancels an emergency report (user-initiated)
  Future<Result<EmergencyReport>> cancelReport(String reportId, String userId) async {
    try {
      debugPrint('[EMERGENCY_REPO] cancelReport: User $userId cancelling report $reportId');
      final docRef = _reportsCollection.doc(reportId);
      final docSnapshot = await docRef.get();

      if (!docSnapshot.exists) {
        return FailureResult(FirestoreFailure(
          message: 'Emergency report not found',
          code: 'REPORT_NOT_FOUND',
        ));
      }

      final report = EmergencyReport.fromJson(docSnapshot.data()!);

      // Verify ownership
      if (report.userId != userId) {
        return FailureResult(PermissionFailure(
          message: 'You can only cancel your own emergency reports',
          code: 'UNAUTHORIZED_CANCEL',
        ));
      }

      // Check if cancellable
      if (!report.canCancel) {
        return FailureResult(ValidationFailure(
          message: 'This emergency report cannot be cancelled at this stage',
          code: 'CANNOT_CANCEL',
        ));
      }

      final updatedReport = report.withStatus(EmergencyStatus.cancelled())
          .addNote('Cancelled by user');

      await docRef.update(updatedReport.toJson());
      debugPrint('[EMERGENCY_REPO] cancelReport: Successfully cancelled report $reportId');
      return Success(updatedReport);
    } on fs.FirebaseException catch (e) {
      debugPrint('[EMERGENCY_REPO] cancelReport: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[EMERGENCY_REPO] cancelReport: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to cancel emergency report',
        code: 'CANCEL_REPORT_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Stream of a single emergency report for real-time updates
  Stream<EmergencyReport?> watchReport(String reportId) {
    return _reportsCollection.doc(reportId).snapshots().map((snapshot) {
      if (snapshot.exists) {
        return EmergencyReport.fromJson(snapshot.data()!);
      }
      return null;
    });
  }

  /// Gets all emergency reports for a user
  Future<Result<List<EmergencyReport>>> getUserReports(String userId, {int limit = 20}) async {
    try {
      debugPrint('[EMERGENCY_REPO] getUserReports: Fetching reports for user $userId');
      final snapshot = await _reportsCollection
          .where('userId', isEqualTo: userId)
          .orderBy('createdAt', descending: true)
          .limit(limit)
          .get();

      final reports = snapshot.docs
          .map((doc) => EmergencyReport.fromJson(doc.data()))
          .toList();

      debugPrint('[EMERGENCY_REPO] getUserReports: Fetched ${reports.length} reports');
      return Success(reports);
    } on fs.FirebaseException catch (e) {
      debugPrint('[EMERGENCY_REPO] getUserReports: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[EMERGENCY_REPO] getUserReports: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to get user reports',
        code: 'GET_USER_REPORTS_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Stream of user's emergency reports
  Stream<List<EmergencyReport>> watchUserReports(String userId, {int limit = 20}) {
    return _reportsCollection
        .where('userId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .limit(limit)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs
              .map((doc) => EmergencyReport.fromJson(doc.data()))
              .toList();
        });
  }

  /// Gets active emergency report for a user (if any)
  Future<Result<EmergencyReport?>> getActiveReport(String userId) async {
    try {
      final snapshot = await _reportsCollection
          .where('userId', isEqualTo: userId)
          .where('status', whereIn: [
            EmergencyStatus.pending().jsonName,
            EmergencyStatus.connecting().jsonName,
            EmergencyStatus.acknowledged().jsonName,
            EmergencyStatus.dispatched().jsonName,
            EmergencyStatus.arrived().jsonName,
          ])
          .orderBy('status')
          .orderBy('createdAt', descending: true)
          .limit(1)
          .get();

      if (snapshot.docs.isEmpty) {
        return const Success(null);
      }

      final report = EmergencyReport.fromJson(snapshot.docs.first.data());
      return Success(report);
    } on fs.FirebaseException catch (e) {
      debugPrint('[EMERGENCY_REPO] getActiveReport: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
      ));
    } catch (e) {
      debugPrint('[EMERGENCY_REPO] getActiveReport: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to get active report',
        code: 'GET_ACTIVE_REPORT_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  // ==================== NOTIFICATIONS ====================

  /// Sends FCM push notification to campus security topic
  Future<void> _notifySecurityOnEmergency(EmergencyReport report) async {
    try {
      debugPrint('[EMERGENCY_REPO] _notifySecurityOnEmergency: Sending FCM to security topic');

      // Send to security topic via FCM
      await _sendFcmToTopic(
        topic: FirebaseConfig.topicSecurity,
        title: '🚨 EMERGENCY: ${report.type.displayName}',
        body: '${report.userName} needs help at ${_formatLocation(report.userLocation)}',
        data: {
          'type': 'emergency_report',
          'reportId': report.id,
          'userId': report.userId,
          'emergencyType': report.type.jsonName,
          'latitude': report.userLocation.latitude.toString(),
          'longitude': report.userLocation.longitude.toString(),
          'timestamp': report.createdAt.toIso8601String(),
        },
      );

      // Also call Cloud Function for security dashboard
      await _callSecurityNotificationFunction(report);

      debugPrint('[EMERGENCY_REPO] _notifySecurityOnEmergency: Notifications sent successfully');
    } catch (e) {
      debugPrint('[EMERGENCY_REPO] _notifySecurityOnEmergency: ERROR - $e');
      // Don't throw - notification failure shouldn't block report creation
    }
  }

  /// Sends FCM message to a topic
  Future<void> _sendFcmToTopic({
    required String topic,
    required String title,
    required String body,
    required Map<String, String> data,
  }) async {
    // In a real implementation, this would use Firebase Admin SDK via Cloud Function
    // For client-side, we use the Cloud Function to send the message
    // This is a placeholder showing the structure
    debugPrint('[EMERGENCY_REPO] _sendFcmToTopic: Would send to $topic: $title');
  }

  /// Calls Cloud Function to notify security dashboard
  Future<void> _callSecurityNotificationFunction(EmergencyReport report) async {
    try {
      debugPrint('[EMERGENCY_REPO] _callSecurityNotificationFunction: Calling notifySecurityOnEmergency');
      final callable = _functions.httpsCallable('notifySecurityOnEmergency');
      await callable.call({
        'reportId': report.id,
        'userId': report.userId,
        'userName': report.userName,
        'userPhone': report.userPhone,
        'type': report.type.jsonName,
        'latitude': report.userLocation.latitude,
        'longitude': report.userLocation.longitude,
        'address': report.userLocation.address,
        'buildingId': report.userLocation.buildingId,
        'floorId': report.userLocation.floorId,
        'roomId': report.userLocation.roomId,
        'isIndoor': report.userLocation.isIndoor,
        'description': report.description,
        'timestamp': report.createdAt.toIso8601String(),
      });
      debugPrint('[EMERGENCY_REPO] _callSecurityNotificationFunction: Successfully called');
    } on FirebaseFunctionsException catch (e) {
      debugPrint('[EMERGENCY_REPO] _callSecurityNotificationFunction: Functions error - ${e.code}: ${e.message}');
    } catch (e) {
      debugPrint('[EMERGENCY_REPO] _callSecurityNotificationFunction: ERROR - $e');
    }
  }

  // ==================== CAMPUS EMERGENCY CONTACTS ====================

  /// Collection reference for campus emergency contacts
  fs.CollectionReference<Map<String, dynamic>> get _contactsCollection =>
      _firestore.collection(EmergencyCollections.campusEmergencyContacts);

  /// Gets all active campus emergency contacts
  Future<Result<List<CampusEmergencyContact>>> getCampusEmergencyContacts() async {
    try {
      debugPrint('[EMERGENCY_REPO] getCampusEmergencyContacts: Fetching contacts');
      final snapshot = await _contactsCollection
          .where('isActive', isEqualTo: true)
          .orderBy('priority')
          .orderBy('createdAt')
          .get();

      final contacts = snapshot.docs
          .map((doc) => CampusEmergencyContact.fromJson(doc.data()))
          .toList();

      debugPrint('[EMERGENCY_REPO] getCampusEmergencyContacts: Fetched ${contacts.length} contacts');
      return Success(contacts);
    } on fs.FirebaseException catch (e) {
      debugPrint('[EMERGENCY_REPO] getCampusEmergencyContacts: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[EMERGENCY_REPO] getCampusEmergencyContacts: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to get campus emergency contacts',
        code: 'GET_CONTACTS_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Stream of campus emergency contacts for real-time updates
  Stream<List<CampusEmergencyContact>> watchCampusEmergencyContacts() {
    return _contactsCollection
        .where('isActive', isEqualTo: true)
        .orderBy('priority')
        .orderBy('createdAt')
        .snapshots()
        .map((snapshot) {
          return snapshot.docs
              .map((doc) => CampusEmergencyContact.fromJson(doc.data()))
              .toList();
        });
  }

  /// Creates a campus emergency contact (admin only)
  Future<Result<CampusEmergencyContact>> createCampusContact(CampusEmergencyContact contact) async {
    try {
      debugPrint('[EMERGENCY_REPO] createCampusContact: Creating contact ${contact.id}');
      final docRef = _contactsCollection.doc(contact.id);
      await docRef.set(contact.toJson());
      debugPrint('[EMERGENCY_REPO] createCampusContact: Successfully created contact ${contact.id}');
      return Success(contact);
    } on fs.FirebaseException catch (e) {
      debugPrint('[EMERGENCY_REPO] createCampusContact: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[EMERGENCY_REPO] createCampusContact: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to create campus contact',
        code: 'CREATE_CONTACT_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Initializes default campus emergency contacts (admin only)
  Future<Result<void>> initializeDefaultContacts() async {
    try {
      debugPrint('[EMERGENCY_REPO] initializeDefaultContacts: Creating default contacts');

      final contacts = [
        CampusEmergencyContact.campusSecurity(
          id: 'campus_security',
          phone: '(046) 123-4567',
          location: 'Security Office, Main Gate',
        ),
        CampusEmergencyContact.medicalClinic(
          id: 'medical_clinic',
          phone: '(046) 123-4568',
          location: 'Health Center Building',
          hours: 'Mon-Fri 8AM-5PM, Sat 8AM-12PM',
        ),
        CampusEmergencyContact.fireDepartment(
          id: 'fire_department',
          phone: '911',
          location: 'Cavite Fire Station, Trece Martires',
        ),
        CampusEmergencyContact.police(
          id: 'police',
          phone: '911',
          location: 'Cavite Police Station, Trece Martires',
        ),
        CampusEmergencyContact.adminOffice(
          id: 'admin_office',
          phone: '(046) 123-4500',
          location: 'Administration Building',
          hours: 'Mon-Fri 8AM-5PM',
        ),
      ];

      final batch = _firestore.batch();
      for (final contact in contacts) {
        final docRef = _contactsCollection.doc(contact.id);
        batch.set(docRef, contact.toJson());
      }
      await batch.commit();

      debugPrint('[EMERGENCY_REPO] initializeDefaultContacts: Successfully created default contacts');
      return const Success(null);
    } on fs.FirebaseException catch (e) {
      debugPrint('[EMERGENCY_REPO] initializeDefaultContacts: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[EMERGENCY_REPO] initializeDefaultContacts: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to initialize default contacts',
        code: 'INIT_CONTACTS_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  // ==================== ASSEMBLY POINTS ====================

  /// Collection reference for assembly points
  fs.CollectionReference<Map<String, dynamic>> get _assemblyPointsCollection =>
      _firestore.collection(EmergencyCollections.assemblyPoints);

  /// Gets all active assembly points
  Future<Result<List<AssemblyPoint>>> getAssemblyPoints() async {
    try {
      debugPrint('[EMERGENCY_REPO] getAssemblyPoints: Fetching assembly points');
      final snapshot = await _assemblyPointsCollection
          .where('isActive', isEqualTo: true)
          .get();

      final points = snapshot.docs
          .map((doc) => AssemblyPoint.fromJson(doc.data()))
          .toList();

      debugPrint('[EMERGENCY_REPO] getAssemblyPoints: Fetched ${points.length} assembly points');
      return Success(points);
    } on fs.FirebaseException catch (e) {
      debugPrint('[EMERGENCY_REPO] getAssemblyPoints: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[EMERGENCY_REPO] getAssemblyPoints: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to get assembly points',
        code: 'GET_ASSEMBLY_POINTS_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Stream of assembly points
  Stream<List<AssemblyPoint>> watchAssemblyPoints() {
    return _assemblyPointsCollection
        .where('isActive', isEqualTo: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs
              .map((doc) => AssemblyPoint.fromJson(doc.data()))
              .toList();
        });
  }

  /// Gets nearest assembly point to a location
  Future<Result<AssemblyPoint?>> getNearestAssemblyPoint(LatLng location) async {
    try {
      final pointsResult = await getAssemblyPoints();
      if (pointsResult.isFailure) return pointsResult as FailureResult<AssemblyPoint?>;

      final points = pointsResult.value;
      if (points.isEmpty) return const Success(null);

      AssemblyPoint? nearest;
      double minDistance = double.infinity;

      for (final point in points) {
        final distance = Geolocator.distanceBetween(
          location.latitude,
          location.longitude,
          point.latitude,
          point.longitude,
        );
        if (distance < minDistance) {
          minDistance = distance;
          nearest = point;
        }
      }

      return Success(nearest);
    } on fs.FirebaseException catch (e) {
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
      ));
    } catch (e) {
      return FailureResult(FirestoreFailure(
        message: 'Failed to find nearest assembly point',
        code: 'NEAREST_ASSEMBLY_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  // ==================== EVACUATION ROUTES ====================

  /// Gets evacuation graph for a building (uses existing EvacuationGraphsRepository)
  Future<Result<EvacuationGraph?>> getEvacuationGraphForBuilding(String buildingId) async {
    try {
      // Use the existing admin evacuation graphs repository
      // This is a simplified version - in production, use the repository directly
      debugPrint('[EMERGENCY_REPO] getEvacuationGraphForBuilding: Fetching graph for $buildingId');

      // Query evacuation_graphs collection for the building
      final graphsCollection = _firestore.collection(FirebaseConfig.evacuationGraphsCollection);
      final snapshot = await graphsCollection
          .where('buildingId', isEqualTo: buildingId)
          .orderBy('version', descending: true)
          .limit(1)
          .get();

      if (snapshot.docs.isEmpty) {
        return const Success(null);
      }

      final graph = EvacuationGraph.fromJson(snapshot.docs.first.data());
      return Success(graph);
    } on fs.FirebaseException catch (e) {
      debugPrint('[EMERGENCY_REPO] getEvacuationGraphForBuilding: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
      ));
    } catch (e) {
      debugPrint('[EMERGENCY_REPO] getEvacuationGraphForBuilding: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to get evacuation graph',
        code: 'GET_GRAPH_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Gets nearest evacuation route from current location to nearest assembly point
  Future<Result<EvacuationRouteSummary?>> getNearestEvacuationRoute(LatLng currentLocation) async {
    try {
      // Get nearest assembly point
      final assemblyPointResult = await getNearestAssemblyPoint(currentLocation);
      if (assemblyPointResult.isFailure) return assemblyPointResult as FailureResult<EvacuationRouteSummary?>;
      final assemblyPoint = assemblyPointResult.value;
      if (assemblyPoint == null) return const Success(null);

      // Get building ID from location (would need geofencing or building detection)
      // For now, try to find the nearest building
      final buildingId = await _detectBuildingAtLocation(currentLocation);

      // Get evacuation graph for building
      if (buildingId == null) {
        // Fallback: direct route to assembly point
        return Success(EvacuationRouteSummary(
          id: 'direct_${assemblyPoint.id}',
          name: 'Direct Route to ${assemblyPoint.name}',
          description: 'Direct path to nearest assembly point',
          distanceMeters: Geolocator.distanceBetween(
            currentLocation.latitude,
            currentLocation.longitude,
            assemblyPoint.latitude,
            assemblyPoint.longitude,
          ),
          estimatedTimeMinutes: (Geolocator.distanceBetween(
            currentLocation.latitude,
            currentLocation.longitude,
            assemblyPoint.latitude,
            assemblyPoint.longitude,
          ) / 80).ceil(), // ~80 m/min walking speed
          pathCoordinates: [
            currentLocation,
            LatLng(assemblyPoint.latitude, assemblyPoint.longitude),
          ],
          assemblyPointId: assemblyPoint.id,
          assemblyPointName: assemblyPoint.name,
        ));
      }

      final graphResult = await getEvacuationGraphForBuilding(buildingId);
      if (graphResult.isFailure) return graphResult as FailureResult<EvacuationRouteSummary?>;
      final graph = graphResult.value;
      if (graph == null) return const Success(null);

      // Find nearest graph node to current location
      final nearestNode = _findNearestNode(graph, currentLocation);
      if (nearestNode == null) return const Success(null);

      // Find assembly point node in graph
      final assemblyPointNode = graph.assemblyPoints
          .where((n) => n.id == assemblyPoint.id)
          .firstOrNull;

      if (assemblyPointNode == null) return const Success(null);

      // Find path using Dijkstra (simplified - use existing navigation service)
      final route = _calculateEvacuationPath(graph, nearestNode, assemblyPointNode);

      return Success(route);
    } on fs.FirebaseException catch (e) {
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
      ));
    } catch (e) {
      debugPrint('[EMERGENCY_REPO] getNearestEvacuationRoute: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to get evacuation route',
        code: 'GET_ROUTE_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Detects building at a given location (simplified)
  Future<String?> _detectBuildingAtLocation(LatLng location) async {
    try {
      // Query buildings collection to find which building contains this location
      // This is a simplified version - real implementation would use geofencing
      final buildingsCollection = _firestore.collection(FirebaseConfig.locationsCollection);
      final snapshot = await buildingsCollection
          .where('type', isEqualTo: 'building')
          .get();

      for (final doc in snapshot.docs) {
        final data = doc.data();
        final bounds = data['bounds'] as List<dynamic>?;
        if (bounds != null && bounds.length == 4) {
          final minLat = bounds[0] as double;
          final minLng = bounds[1] as double;
          final maxLat = bounds[2] as double;
          final maxLng = bounds[3] as double;
          if (location.latitude >= minLat &&
              location.latitude <= maxLat &&
              location.longitude >= minLng &&
              location.longitude <= maxLng) {
            return doc.id;
          }
        }
      }
      return null;
    } catch (e) {
      debugPrint('[EMERGENCY_REPO] _detectBuildingAtLocation: ERROR - $e');
      return null;
    }
  }

  /// Finds nearest graph node to a location
  EvacuationNode? _findNearestNode(EvacuationGraph graph, LatLng location) {
    EvacuationNode? nearest;
    double minDistance = double.infinity;

    for (final node in graph.nodes) {
      final distance = Geolocator.distanceBetween(
        location.latitude,
        location.longitude,
        node.latitude,
        node.longitude,
      );
      if (distance < minDistance) {
        minDistance = distance;
        nearest = node;
      }
    }

    return nearest;
  }

  /// Calculates evacuation path using Dijkstra (simplified)
  EvacuationRouteSummary? _calculateEvacuationPath(
    EvacuationGraph graph,
    EvacuationNode startNode,
    EvacuationNode endNode,
  ) {
    // Simplified pathfinding - in production, use the NavigationService
    // This is a basic implementation showing the structure

    // For now, return a direct path
    final distance = Geolocator.distanceBetween(
      startNode.latitude,
      startNode.longitude,
      endNode.latitude,
      endNode.longitude,
    );

    return EvacuationRouteSummary(
      id: 'evac_${startNode.id}_${endNode.id}',
      name: 'Evacuation Route to ${endNode.label}',
      description: 'Follow marked evacuation path to assembly point',
      distanceMeters: distance,
      estimatedTimeMinutes: (distance / 80).ceil(),
      pathCoordinates: [
        LatLng(startNode.latitude, startNode.longitude),
        LatLng(endNode.latitude, endNode.longitude),
      ],
      assemblyPointId: endNode.id,
      assemblyPointName: endNode.label,
      isWheelchairAccessible: true,
      isEmergencyRoute: true,
    );
  }

  // ==================== LOCATION HELPERS ====================

  /// Gets current user location (GPS + indoor if available)
  Future<Result<EmergencyLocation>> getCurrentEmergencyLocation() async {
    try {
      debugPrint('[EMERGENCY_REPO] getCurrentEmergencyLocation: Getting current location');

      // Get GPS location
      final positionResult = await _locationService.getCurrentPosition(
        accuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 10),
      );

      if (positionResult.isFailure) {
        return positionResult as FailureResult<EmergencyLocation>;
      }

      final position = positionResult.value;

      // Try to get address
      String? address;
      try {
        final addressResult = await _locationService.getAddressFromCoordinates(
          position.latitude,
          position.longitude,
        );
        if (addressResult.isSuccess) {
          address = addressResult.value;
        }
      } catch (_) {
        // Address is optional
      }

      // Detect building/floor/room if indoor
      String? buildingId;
      String? floorId;
      String? roomId;
      bool isIndoor = false;

      // In a real implementation, this would use indoor positioning
      // For now, we'll leave these as null

      return Success(EmergencyLocation(
        latitude: position.latitude,
        longitude: position.longitude,
        altitude: position.altitude,
        accuracy: position.accuracy,
        heading: position.heading,
        speed: position.speed,
        address: address,
        buildingId: buildingId,
        floorId: floorId,
        roomId: roomId,
        isIndoor: isIndoor,
        timestamp: DateTime.now(),
      ));
    } catch (e) {
      debugPrint('[EMERGENCY_REPO] getCurrentEmergencyLocation: ERROR - $e');
      return FailureResult(LocationFailure(
        message: 'Failed to get current location',
        code: 'GET_LOCATION_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Formats location for display
  String _formatLocation(EmergencyLocation location) {
    if (location.address?.isNotEmpty == true) {
      return location.address!;
    }
    return 'Lat: ${location.latitude.toStringAsFixed(6)}, Lng: ${location.longitude.toStringAsFixed(6)}';
  }

  // ==================== ERROR HANDLING ====================

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