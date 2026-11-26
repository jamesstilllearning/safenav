/// SAFENAV CAVITE - User Activity Repository
///
/// Repository for tracking user navigation history, places visited,
/// routes taken, and safety scores in Firestore.
library;

import 'dart:async';
import 'dart:math' as math;

import 'package:cloud_firestore/cloud_firestore.dart' as fs;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/failures.dart' hide FirebaseException;
import '../../../../core/errors/result.dart';

/// User activity repository provider
final userActivityRepositoryProvider = Provider<UserActivityRepository>((ref) => UserActivityRepository.instance);

/// Type of user activity
enum ActivityType {
  /// User navigated to a location
  navigation,

  /// User visited a room/facility
  placeVisit,

  /// User took a route
  routeTaken,

  /// User triggered an emergency
  emergencyTriggered,

  /// User acknowledged an alert
  alertAcknowledged,

  /// User searched for a location
  search,

  /// User viewed map
  mapView,

  /// User completed a safety check
  safetyCheck,
}

/// User activity record
class UserActivity {
  const UserActivity({
    required this.id,
    required this.userId,
    required this.type,
    required this.timestamp,
    this.buildingId,
    this.floorId,
    this.roomId,
    this.routeId,
    this.destinationId,
    this.distanceMeters,
    this.durationSeconds,
    this.safetyScore,
    this.metadata,
  });

  final String id;
  final String userId;
  final ActivityType type;
  final DateTime timestamp;
  final String? buildingId;
  final String? floorId;
  final String? roomId;
  final String? routeId;
  final String? destinationId;
  final double? distanceMeters;
  final int? durationSeconds;
  final double? safetyScore; // 0.0 - 1.0
  final Map<String, dynamic>? metadata;

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'type': type.name,
        'timestamp': Timestamp.fromDate(timestamp),
        'buildingId': buildingId,
        'floorId': floorId,
        'roomId': roomId,
        'routeId': routeId,
        'destinationId': destinationId,
        'distanceMeters': distanceMeters,
        'durationSeconds': durationSeconds,
        'safetyScore': safetyScore,
        'metadata': metadata ?? {},
      };

  factory UserActivity.fromJson(Map<String, dynamic> json) => UserActivity(
        id: json['id'] as String,
        userId: json['userId'] as String,
        type: ActivityType.values.firstWhere(
          (e) => e.name == json['type'],
          orElse: () => ActivityType.navigation,
        ),
        timestamp: (json['timestamp'] as Timestamp).toDate(),
        buildingId: json['buildingId'] as String?,
        floorId: json['floorId'] as String?,
        roomId: json['roomId'] as String?,
        routeId: json['routeId'] as String?,
        destinationId: json['destinationId'] as String?,
        distanceMeters: (json['distanceMeters'] as num?)?.toDouble(),
        durationSeconds: json['durationSeconds'] as int?,
        safetyScore: (json['safetyScore'] as num?)?.toDouble(),
        metadata: json['metadata'] as Map<String, dynamic>?,
      );
}

/// User safety score summary
class UserSafetyScore {
  const UserSafetyScore({
    required this.userId,
    required this.overallScore,
    required this.navigationScore,
    required this.emergencyPreparednessScore,
    required this.placeAwarenessScore,
    required this.totalActivities,
    required this.lastCalculated,
    this.breakdown,
  });

  final String userId;
  final double overallScore; // 0.0 - 1.0
  final double navigationScore;
  final double emergencyPreparednessScore;
  final double placeAwarenessScore;
  final int totalActivities;
  final DateTime lastCalculated;
  final Map<String, dynamic>? breakdown;

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'overallScore': overallScore,
        'navigationScore': navigationScore,
        'emergencyPreparednessScore': emergencyPreparednessScore,
        'placeAwarenessScore': placeAwarenessScore,
        'totalActivities': totalActivities,
        'lastCalculated': Timestamp.fromDate(lastCalculated),
        'breakdown': breakdown ?? {},
      };

  factory UserSafetyScore.fromJson(Map<String, dynamic> json) => UserSafetyScore(
        userId: json['userId'] as String,
        overallScore: (json['overallScore'] as num).toDouble(),
        navigationScore: (json['navigationScore'] as num).toDouble(),
        emergencyPreparednessScore: (json['emergencyPreparednessScore'] as num).toDouble(),
        placeAwarenessScore: (json['placeAwarenessScore'] as num).toDouble(),
        totalActivities: json['totalActivities'] as int,
        lastCalculated: (json['lastCalculated'] as Timestamp).toDate(),
        breakdown: json['breakdown'] as Map<String, dynamic>?,
      );
}

/// Repository for user activity operations
class UserActivityRepository {
  UserActivityRepository._() {
    debugPrint('[USER_ACTIVITY_REPO] UserActivityRepository: Constructor called');
  }

  static final UserActivityRepository _instance = UserActivityRepository._();
  static UserActivityRepository get instance => _instance;

  final fs.FirebaseFirestore _firestore = fs.FirebaseFirestore.instance;

  /// Collection reference for user activities
  fs.CollectionReference<Map<String, dynamic>> get _activitiesCollection =>
      _firestore.collection('user_activities');

  /// Collection reference for user safety scores
  fs.CollectionReference<Map<String, dynamic>> get _safetyScoresCollection =>
      _firestore.collection('user_safety_scores');

  /// Records a user activity
  Future<Result<UserActivity>> recordActivity(UserActivity activity) async {
    try {
      debugPrint('[USER_ACTIVITY_REPO] recordActivity: Recording activity ${activity.id} for user ${activity.userId}');
      final docRef = _activitiesCollection.doc(activity.id);
      await docRef.set(activity.toJson());
      debugPrint('[USER_ACTIVITY_REPO] recordActivity: Successfully recorded activity ${activity.id}');
      return Success(activity);
    } on fs.FirebaseException catch (e) {
      debugPrint('[USER_ACTIVITY_REPO] recordActivity: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[USER_ACTIVITY_REPO] recordActivity: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to record activity',
        code: 'RECORD_ACTIVITY_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Records a navigation activity
  Future<Result<UserActivity>> recordNavigation({
    required String userId,
    required String buildingId,
    required String floorId,
    String? roomId,
    String? routeId,
    String? destinationId,
    double? distanceMeters,
    int? durationSeconds,
    double? safetyScore,
    Map<String, dynamic>? metadata,
  }) async {
    final activity = UserActivity(
      id: '${userId}_nav_${DateTime.now().millisecondsSinceEpoch}',
      userId: userId,
      type: ActivityType.navigation,
      timestamp: DateTime.now(),
      buildingId: buildingId,
      floorId: floorId,
      roomId: roomId,
      routeId: routeId,
      destinationId: destinationId,
      distanceMeters: distanceMeters,
      durationSeconds: durationSeconds,
      safetyScore: safetyScore,
      metadata: metadata,
    );
    return recordActivity(activity);
  }

  /// Records a place visit
  Future<Result<UserActivity>> recordPlaceVisit({
    required String userId,
    required String buildingId,
    required String floorId,
    required String roomId,
    double? safetyScore,
    Map<String, dynamic>? metadata,
  }) async {
    final activity = UserActivity(
      id: '${userId}_visit_${DateTime.now().millisecondsSinceEpoch}',
      userId: userId,
      type: ActivityType.placeVisit,
      timestamp: DateTime.now(),
      buildingId: buildingId,
      floorId: floorId,
      roomId: roomId,
      safetyScore: safetyScore,
      metadata: metadata,
    );
    return recordActivity(activity);
  }

  /// Records a route taken
  Future<Result<UserActivity>> recordRouteTaken({
    required String userId,
    required String routeId,
    required String destinationId,
    required double distanceMeters,
    required int durationSeconds,
    double? safetyScore,
    Map<String, dynamic>? metadata,
  }) async {
    final activity = UserActivity(
      id: '${userId}_route_${DateTime.now().millisecondsSinceEpoch}',
      userId: userId,
      type: ActivityType.routeTaken,
      timestamp: DateTime.now(),
      routeId: routeId,
      destinationId: destinationId,
      distanceMeters: distanceMeters,
      durationSeconds: durationSeconds,
      safetyScore: safetyScore,
      metadata: metadata,
    );
    return recordActivity(activity);
  }

  /// Records an emergency trigger
  Future<Result<UserActivity>> recordEmergencyTriggered({
    required String userId,
    String? buildingId,
    String? floorId,
    String? roomId,
    Map<String, dynamic>? metadata,
  }) async {
    final activity = UserActivity(
      id: '${userId}_emergency_${DateTime.now().millisecondsSinceEpoch}',
      userId: userId,
      type: ActivityType.emergencyTriggered,
      timestamp: DateTime.now(),
      buildingId: buildingId,
      floorId: floorId,
      roomId: roomId,
      metadata: metadata,
    );
    return recordActivity(activity);
  }

  /// Gets user activities with filtering and pagination
  Future<Result<List<UserActivity>>> getUserActivities({
    required String userId,
    ActivityType? type,
    String? buildingId,
    DateTime? startDate,
    DateTime? endDate,
    int limit = 50,
    DocumentSnapshot? startAfter,
  }) async {
    try {
      debugPrint('[USER_ACTIVITY_REPO] getUserActivities: Fetching activities for user $userId');
      fs.Query<Map<String, dynamic>> query = _activitiesCollection
          .where('userId', isEqualTo: userId)
          .orderBy('timestamp', descending: true)
          .limit(limit);

      if (type != null) {
        query = query.where('type', isEqualTo: type.name);
      }
      if (buildingId != null) {
        query = query.where('buildingId', isEqualTo: buildingId);
      }
      if (startDate != null) {
        query = query.where('timestamp', isGreaterThanOrEqualTo: Timestamp.fromDate(startDate));
      }
      if (endDate != null) {
        query = query.where('timestamp', isLessThanOrEqualTo: Timestamp.fromDate(endDate));
      }
      if (startAfter != null) {
        query = query.startAfterDocument(startAfter);
      }

      final snapshot = await query.get();
      final activities = snapshot.docs
          .map((doc) => UserActivity.fromJson(doc.data()))
          .toList();

      debugPrint('[USER_ACTIVITY_REPO] getUserActivities: Fetched ${activities.length} activities');
      return Success(activities);
    } on fs.FirebaseException catch (e) {
      debugPrint('[USER_ACTIVITY_REPO] getUserActivities: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[USER_ACTIVITY_REPO] getUserActivities: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to get user activities',
        code: 'GET_ACTIVITIES_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Stream of user activities for real-time updates
  Stream<List<UserActivity>> watchUserActivities({
    required String userId,
    ActivityType? type,
    int limit = 50,
  }) {
    fs.Query<Map<String, dynamic>> query = _activitiesCollection
        .where('userId', isEqualTo: userId)
        .orderBy('timestamp', descending: true)
        .limit(limit);

    if (type != null) {
      query = query.where('type', isEqualTo: type.name);
    }

    return query.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => UserActivity.fromJson(doc.data()))
          .toList();
    });
  }

  /// Gets user's places visited (unique rooms)
  Future<Result<List<String>>> getVisitedPlaces(String userId) async {
    try {
      final snapshot = await _activitiesCollection
          .where('userId', isEqualTo: userId)
          .where('type', isEqualTo: ActivityType.placeVisit.name)
          .get();

      final roomIds = snapshot.docs
          .map((doc) => doc.data()['roomId'] as String?)
          .where((id) => id != null)
          .cast<String>()
          .toSet()
          .toList();

      return Success(roomIds);
    } on fs.FirebaseException catch (e) {
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
      ));
    } catch (e) {
      return FailureResult(FirestoreFailure(
        message: 'Failed to get visited places',
        code: 'GET_VISITED_PLACES_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Gets user's routes taken
  Future<Result<List<String>>> getRoutesTaken(String userId) async {
    try {
      final snapshot = await _activitiesCollection
          .where('userId', isEqualTo: userId)
          .where('type', isEqualTo: ActivityType.routeTaken.name)
          .get();

      final routeIds = snapshot.docs
          .map((doc) => doc.data()['routeId'] as String?)
          .where((id) => id != null)
          .cast<String>()
          .toSet()
          .toList();

      return Success(routeIds);
    } on fs.FirebaseException catch (e) {
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
      ));
    } catch (e) {
      return FailureResult(FirestoreFailure(
        message: 'Failed to get routes taken',
        code: 'GET_ROUTES_TAKEN_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Calculates and updates user safety score
  Future<Result<UserSafetyScore>> calculateSafetyScore(String userId) async {
    try {
      debugPrint('[USER_ACTIVITY_REPO] calculateSafetyScore: Calculating for user $userId');

      // Get all activities for the user
      final activitiesResult = await getUserActivities(userId: userId, limit: 1000);
      if (activitiesResult.isFailure) {
        return FailureResult(activitiesResult.failure);
      }

      final activities = activitiesResult.value;
      if (activities.isEmpty) {
        // Return default score for new users
        final score = UserSafetyScore(
          userId: userId,
          overallScore: 0.5,
          navigationScore: 0.5,
          emergencyPreparednessScore: 0.5,
          placeAwarenessScore: 0.5,
          totalActivities: 0,
          lastCalculated: DateTime.now(),
        );
        await _saveSafetyScore(score);
        return Success(score);
      }

      // Calculate scores based on activities
      final navigationActivities = activities.where((a) => a.type == ActivityType.navigation).toList();
      final placeVisitActivities = activities.where((a) => a.type == ActivityType.placeVisit).toList();
      final routeActivities = activities.where((a) => a.type == ActivityType.routeTaken).toList();
      final emergencyActivities = activities.where((a) => a.type == ActivityType.emergencyTriggered).toList();

      // Navigation score: based on distance covered, safety scores, variety of buildings
      double navigationScore = 0.3; // Base score
      if (navigationActivities.isNotEmpty) {
        final safetyActivities = navigationActivities.where((a) => a.safetyScore != null).toList();
        if (safetyActivities.isNotEmpty) {
          final avgSafety = safetyActivities
              .map((a) => a.safetyScore!)
              .reduce((a, b) => a + b) / safetyActivities.length;
          navigationScore = math.max(0.3, math.min(1.0, avgSafety + 0.2));
        }

        // Bonus for variety of buildings visited
        final uniqueBuildings = navigationActivities
            .where((a) => a.buildingId != null)
            .map((a) => a.buildingId!)
            .toSet()
            .length;
        navigationScore = math.min(1.0, navigationScore + uniqueBuildings * 0.05);
      }

      // Place awareness score: based on unique places visited
      double placeAwarenessScore = 0.2;
      if (placeVisitActivities.isNotEmpty) {
        final uniquePlaces = placeVisitActivities
            .where((a) => a.roomId != null)
            .map((a) => a.roomId!)
            .toSet()
            .length;
        placeAwarenessScore = math.min(1.0, 0.2 + uniquePlaces * 0.03);
      }

      // Emergency preparedness: based on emergency triggers, safety checks
      double emergencyPreparednessScore = 0.4;
      if (emergencyActivities.isNotEmpty) {
        // Having triggered emergency (even in drills) shows awareness
        emergencyPreparednessScore = math.min(1.0, 0.4 + emergencyActivities.length * 0.15);
      }
      final safetyCheckActivities = activities.where((a) => a.type == ActivityType.safetyCheck).toList();
      if (safetyCheckActivities.isNotEmpty) {
        emergencyPreparednessScore = math.min(1.0, emergencyPreparednessScore + safetyCheckActivities.length * 0.1);
      }

      // Overall score (weighted average)
      final overallScore = (navigationScore * 0.4) +
          (placeAwarenessScore * 0.2) +
          (emergencyPreparednessScore * 0.4);

      final score = UserSafetyScore(
        userId: userId,
        overallScore: overallScore,
        navigationScore: navigationScore,
        emergencyPreparednessScore: emergencyPreparednessScore,
        placeAwarenessScore: placeAwarenessScore,
        totalActivities: activities.length,
        lastCalculated: DateTime.now(),
        breakdown: {
          'navigationCount': navigationActivities.length,
          'placeVisitCount': placeVisitActivities.length,
          'routeCount': routeActivities.length,
          'emergencyCount': emergencyActivities.length,
          'safetyCheckCount': safetyCheckActivities.length,
        },
      );

      await _saveSafetyScore(score);
      debugPrint('[USER_ACTIVITY_REPO] calculateSafetyScore: Calculated score ${overallScore.toStringAsFixed(2)} for user $userId');
      return Success(score);
    } on fs.FirebaseException catch (e) {
      debugPrint('[USER_ACTIVITY_REPO] calculateSafetyScore: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
      ));
    } catch (e) {
      debugPrint('[USER_ACTIVITY_REPO] calculateSafetyScore: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to calculate safety score',
        code: 'CALCULATE_SAFETY_SCORE_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Gets user's current safety score
  Future<Result<UserSafetyScore>> getSafetyScore(String userId) async {
    try {
      final docSnapshot = await _safetyScoresCollection.doc(userId).get();

      if (!docSnapshot.exists) {
        // Calculate if not exists
        return await calculateSafetyScore(userId);
      }

      final score = UserSafetyScore.fromJson(docSnapshot.data()!);
      return Success(score);
    } on fs.FirebaseException catch (e) {
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
      ));
    } catch (e) {
      return FailureResult(FirestoreFailure(
        message: 'Failed to get safety score',
        code: 'GET_SAFETY_SCORE_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Stream of safety score for real-time updates
  Stream<UserSafetyScore?> watchSafetyScore(String userId) {
    return _safetyScoresCollection.doc(userId).snapshots().map((snapshot) {
      if (!snapshot.exists) return null;
      return UserSafetyScore.fromJson(snapshot.data()!);
    });
  }

  /// Saves safety score to Firestore
  Future<void> _saveSafetyScore(UserSafetyScore score) async {
    await _safetyScoresCollection.doc(score.userId).set(score.toJson());
  }

  /// Gets activity statistics for a user
  Future<Result<Map<String, dynamic>>> getActivityStats(String userId) async {
    try {
      final activitiesResult = await getUserActivities(userId: userId, limit: 5000);
      if (activitiesResult.isFailure) {
        return FailureResult(activitiesResult.failure);
      }

      final activities = activitiesResult.value;
      final stats = <String, dynamic>{
        'totalActivities': activities.length,
        'byType': <String, int>{},
        'byBuilding': <String, int>{},
        'totalDistance': 0.0,
        'totalDuration': 0,
        'averageSafetyScore': 0.0,
        'firstActivity': activities.isNotEmpty ? activities.last.timestamp.toIso8601String() : null,
        'lastActivity': activities.isNotEmpty ? activities.first.timestamp.toIso8601String() : null,
      };

      double totalSafety = 0;
      int safetyCount = 0;

      for (final activity in activities) {
        // By type
        final typeKey = activity.type.name;
        stats['byType'][typeKey] = (stats['byType'][typeKey] ?? 0) + 1;

        // By building
        if (activity.buildingId != null) {
          stats['byBuilding'][activity.buildingId!] = (stats['byBuilding'][activity.buildingId!] ?? 0) + 1;
        }

        // Distance
        if (activity.distanceMeters != null) {
          stats['totalDistance'] = (stats['totalDistance'] as double) + activity.distanceMeters!;
        }

        // Duration
        if (activity.durationSeconds != null) {
          stats['totalDuration'] = (stats['totalDuration'] as int) + activity.durationSeconds!;
        }

        // Safety score
        if (activity.safetyScore != null) {
          totalSafety += activity.safetyScore!;
          safetyCount++;
        }
      }

      if (safetyCount > 0) {
        stats['averageSafetyScore'] = totalSafety / safetyCount;
      }

      return Success(stats);
    } on fs.FirebaseException catch (e) {
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
      ));
    } catch (e) {
      return FailureResult(FirestoreFailure(
        message: 'Failed to get activity stats',
        code: 'GET_ACTIVITY_STATS_FAILED',
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