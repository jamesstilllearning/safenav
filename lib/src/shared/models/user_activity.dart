/// SAFENAV CAVITE - User Activity Models
///
/// Data models for tracking user navigation history, places visited, routes taken, and safety scores.
library;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'user_activity.freezed.dart';
part 'user_activity.g.dart';

/// Type of user activity
@freezed
abstract class ActivityType with _$ActivityType {
  const factory ActivityType.navigation() = _Navigation;
  const factory ActivityType.search() = _Search;
  const factory ActivityType.viewMap() = _ViewMap;
  const factory ActivityType.viewAlert() = _ViewAlert;
  const factory ActivityType.emergencyAction() = _EmergencyAction;
  const factory ActivityType.profileUpdate() = _ProfileUpdate;
  const factory ActivityType.settingsChange() = _SettingsChange;
  const factory ActivityType.login() = _Login;
  const factory ActivityType.logout() = _Logout;
  const factory ActivityType.other() = _Other;
}

/// JSON converter for ActivityType (freezed union - tagged format)
class ActivityTypeConverter implements JsonConverter<ActivityType, Object> {
  const ActivityTypeConverter();

  @override
  ActivityType fromJson(Object json) {
    if (json is Map<String, dynamic>) {
      if (json.containsKey('navigation')) return ActivityType.navigation();
      if (json.containsKey('search')) return ActivityType.search();
      if (json.containsKey('viewMap')) return ActivityType.viewMap();
      if (json.containsKey('viewAlert')) return ActivityType.viewAlert();
      if (json.containsKey('emergencyAction')) return ActivityType.emergencyAction();
      if (json.containsKey('profileUpdate')) return ActivityType.profileUpdate();
      if (json.containsKey('settingsChange')) return ActivityType.settingsChange();
      if (json.containsKey('login')) return ActivityType.login();
      if (json.containsKey('logout')) return ActivityType.logout();
      if (json.containsKey('other')) return ActivityType.other();
      // If it's an object with string keys but not matching, try to parse as string
      if (json.keys.length == 1 && json.values.first is Map && (json.values.first as Map).isEmpty) {
        final key = json.keys.first.toLowerCase();
        switch (key) {
          case 'navigation': return ActivityType.navigation();
          case 'search': return ActivityType.search();
          case 'viewmap': return ActivityType.viewMap();
          case 'viewalert': return ActivityType.viewAlert();
          case 'emergencyaction': return ActivityType.emergencyAction();
          case 'profileupdate': return ActivityType.profileUpdate();
          case 'settingschange': return ActivityType.settingsChange();
          case 'login': return ActivityType.login();
          case 'logout': return ActivityType.logout();
          case 'other': return ActivityType.other();
        }
      }
    }
    // Fallback for string format (legacy)
    if (json is String) {
      return json.toActivityType();
    }
    return ActivityType.other();
  }

  @override
  Object toJson(ActivityType object) {
    return object.when(
      navigation: () => {'navigation': {}},
      search: () => {'search': {}},
      viewMap: () => {'viewMap': {}},
      viewAlert: () => {'viewAlert': {}},
      emergencyAction: () => {'emergencyAction': {}},
      profileUpdate: () => {'profileUpdate': {}},
      settingsChange: () => {'settingsChange': {}},
      login: () => {'login': {}},
      logout: () => {'logout': {}},
      other: () => {'other': {}},
    );
  }
}

/// User activity model
@freezed
abstract class UserActivity with _$UserActivity {
  const factory UserActivity({
    required String id,
    required String userId,
    @ActivityTypeConverter() required ActivityType type,
    required String description,
    String? buildingId,
    String? floorId,
    String? roomId,
    LatLng? location,
    Map<String, dynamic>? metadata,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserActivity;

  factory UserActivity.fromJson(Map<String, dynamic> json) =>
      _$UserActivityFromJson(json);
}

/// User visit model (tracking places visited)
@freezed
abstract class UserVisit with _$UserVisit {
  const factory UserVisit({
    required String id,
    required String userId,
    required String buildingId,
    String? floorId,
    String? roomId,
    String? roomName,
    required DateTime visitedAt,
    required Duration duration,
    int? visitCount,
    LatLng? entryLocation,
    LatLng? exitLocation,
    Map<String, dynamic>? metadata,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserVisit;

  factory UserVisit.fromJson(Map<String, dynamic> json) =>
      _$UserVisitFromJson(json);
}

/// Route type for user routes
@freezed
abstract class RouteType with _$RouteType {
  const factory RouteType.walking() = _Walking;
  const factory RouteType.evacuation() = _Evacuation;
  const factory RouteType.emergency() = _Emergency;
  const factory RouteType.practice() = _Practice;
  const factory RouteType.custom() = _Custom;
}

/// JSON converter for RouteType (freezed union - tagged format)
class RouteTypeConverter implements JsonConverter<RouteType, Object> {
  const RouteTypeConverter();

  @override
  RouteType fromJson(Object json) {
    if (json is Map<String, dynamic>) {
      if (json.containsKey('walking')) return RouteType.walking();
      if (json.containsKey('evacuation')) return RouteType.evacuation();
      if (json.containsKey('emergency')) return RouteType.emergency();
      if (json.containsKey('practice')) return RouteType.practice();
      if (json.containsKey('custom')) return RouteType.custom();
      // If it's an object with string keys but not matching, try to parse as string
      if (json.keys.length == 1 && json.values.first is Map && (json.values.first as Map).isEmpty) {
        final key = json.keys.first.toLowerCase();
        switch (key) {
          case 'walking': return RouteType.walking();
          case 'evacuation': return RouteType.evacuation();
          case 'emergency': return RouteType.emergency();
          case 'practice': return RouteType.practice();
          case 'custom': return RouteType.custom();
        }
      }
    }
    // Fallback for string format (legacy)
    if (json is String) {
      return json.toRouteType();
    }
    return RouteType.walking();
  }

  @override
  Object toJson(RouteType object) {
    return object.when(
      walking: () => {'walking': {}},
      evacuation: () => {'evacuation': {}},
      emergency: () => {'emergency': {}},
      practice: () => {'practice': {}},
      custom: () => {'custom': {}},
    );
  }
}

/// User route model (tracking routes taken)
@freezed
abstract class UserRoute with _$UserRoute {
  const UserRoute._();

  const factory UserRoute({
    required String id,
    required String userId,
    @RouteTypeConverter() required RouteType type,
    required String startBuildingId,
    String? startFloorId,
    String? startRoomId,
    required String endBuildingId,
    String? endFloorId,
    String? endRoomId,
    required List<LatLng> geometry,
    required double totalDistance,
    required Duration estimatedDuration,
    required Duration actualDuration,
    required DateTime startedAt,
    DateTime? completedAt,
    @RouteStatusConverter() @Default(RouteStatus.planned()) RouteStatus status,
    Map<String, dynamic>? metadata,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserRoute;

  factory UserRoute.fromJson(Map<String, dynamic> json) =>
      _$UserRouteFromJson(json);

  /// Check if route is completed
  bool get isCompleted => status == RouteStatus.completed();

  /// Get route efficiency (estimated vs actual)
  double get efficiency {
    if (actualDuration.inSeconds == 0) return 1.0;
    return estimatedDuration.inSeconds / actualDuration.inSeconds;
  }
}

/// Route status
@freezed
abstract class RouteStatus with _$RouteStatus {
  const factory RouteStatus.planned() = _Planned;
  const factory RouteStatus.active() = _Active;
  const factory RouteStatus.paused() = _Paused;
  const factory RouteStatus.completed() = _Completed;
  const factory RouteStatus.cancelled() = _Cancelled;
  const factory RouteStatus.failed() = _Failed;
}

/// JSON converter for RouteStatus (freezed union - tagged format)
class RouteStatusConverter implements JsonConverter<RouteStatus, Map<String, dynamic>> {
  const RouteStatusConverter();

  @override
  RouteStatus fromJson(Map<String, dynamic> json) {
    if (json.containsKey('planned')) return RouteStatus.planned();
    if (json.containsKey('active')) return RouteStatus.active();
    if (json.containsKey('paused')) return RouteStatus.paused();
    if (json.containsKey('completed')) return RouteStatus.completed();
    if (json.containsKey('cancelled')) return RouteStatus.cancelled();
    if (json.containsKey('failed')) return RouteStatus.failed();
    // If it's an object with string keys but not matching, try to parse as string
    if (json.keys.length == 1 && json.values.first is Map && (json.values.first as Map).isEmpty) {
      final key = json.keys.first.toLowerCase();
      switch (key) {
        case 'planned': return RouteStatus.planned();
        case 'active': return RouteStatus.active();
        case 'paused': return RouteStatus.paused();
        case 'completed': return RouteStatus.completed();
        case 'cancelled': return RouteStatus.cancelled();
        case 'failed': return RouteStatus.failed();
      }
    }
    return RouteStatus.planned();
  }

  @override
  Map<String, dynamic> toJson(RouteStatus object) {
    return object.when(
      planned: () => {'planned': {}},
      active: () => {'active': {}},
      paused: () => {'paused': {}},
      completed: () => {'completed': {}},
      cancelled: () => {'cancelled': {}},
      failed: () => {'failed': {}},
    );
  }
}

/// Safety score model
@freezed
abstract class SafetyScore with _$SafetyScore {
  const SafetyScore._();

  const factory SafetyScore({
    required String userId,
    required String userName,
    required int totalScore,
    @Default(0) int navigationScore,
    @Default(0) int emergencyPreparednessScore,
    @Default(0) int buildingFamiliarityScore,
    @Default(0) int drillParticipationScore,
    @Default(0) int alertResponsivenessScore,
    @Default({}) Map<String, int> buildingScores,
    @Default([]) List<String> completedDrills,
    @Default([]) List<String> visitedBuildings,
    @Default(0) int totalRoutesCompleted,
    @Default(0) int totalDistanceMeters,
    @Default(0) int totalVisits,
    DateTime? lastActivityAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    Map<String, dynamic>? metadata,
  }) = _SafetyScore;

  factory SafetyScore.fromJson(Map<String, dynamic> json) =>
      _$SafetyScoreFromJson(json);

  /// Create default safety score for a user
  factory SafetyScore.defaultScore(String userId, {String? userName}) {
    final now = DateTime.now();
    return SafetyScore(
      userId: userId,
      userName: userName ?? 'Unknown',
      totalScore: 0,
      createdAt: now,
      updatedAt: now,
    );
  }

  /// Calculate total score from components
  int calculateTotalScore() {
    return navigationScore +
        emergencyPreparednessScore +
        buildingFamiliarityScore +
        drillParticipationScore +
        alertResponsivenessScore;
  }

  /// Get score breakdown
  Map<String, int> get scoreBreakdown => {
        'navigation': navigationScore,
        'emergencyPreparedness': emergencyPreparednessScore,
        'buildingFamiliarity': buildingFamiliarityScore,
        'drillParticipation': drillParticipationScore,
        'alertResponsiveness': alertResponsivenessScore,
      };

  /// Get rank tier based on total score
  String get rankTier {
    if (totalScore >= 1000) return 'Safety Champion';
    if (totalScore >= 750) return 'Safety Expert';
    if (totalScore >= 500) return 'Safety Pro';
    if (totalScore >= 250) return 'Safety Aware';
    if (totalScore >= 100) return 'Safety Beginner';
    return 'New User';
  }
}

/// Extension methods for string parsing
extension ActivityTypeX on String {
  ActivityType toActivityType() {
    switch (toLowerCase()) {
      case 'navigation':
        return ActivityType.navigation();
      case 'search':
        return ActivityType.search();
      case 'viewmap':
      case 'view_map':
        return ActivityType.viewMap();
      case 'viewalert':
      case 'view_alert':
        return ActivityType.viewAlert();
      case 'emergencyaction':
      case 'emergency_action':
        return ActivityType.emergencyAction();
      case 'profileupdate':
      case 'profile_update':
        return ActivityType.profileUpdate();
      case 'settingschange':
      case 'settings_change':
        return ActivityType.settingsChange();
      case 'login':
        return ActivityType.login();
      case 'logout':
        return ActivityType.logout();
      default:
        return ActivityType.other();
    }
  }
}

extension RouteTypeX on String {
  RouteType toRouteType() {
    switch (toLowerCase()) {
      case 'walking':
        return RouteType.walking();
      case 'evacuation':
        return RouteType.evacuation();
      case 'emergency':
        return RouteType.emergency();
      case 'practice':
        return RouteType.practice();
      case 'custom':
        return RouteType.custom();
      default:
        return RouteType.walking();
    }
  }
}

extension RouteStatusX on String {
  RouteStatus toRouteStatus() {
    switch (toLowerCase()) {
      case 'planned':
        return RouteStatus.planned();
      case 'active':
        return RouteStatus.active();
      case 'paused':
        return RouteStatus.paused();
      case 'completed':
        return RouteStatus.completed();
      case 'cancelled':
        return RouteStatus.cancelled();
      case 'failed':
        return RouteStatus.failed();
      default:
        return RouteStatus.planned();
    }
  }
}

/// Extension for ActivityType display
extension ActivityTypeDisplay on ActivityType {
  String get displayName {
    return when(
      navigation: () => 'Navigation',
      search: () => 'Search',
      viewMap: () => 'View Map',
      viewAlert: () => 'View Alert',
      emergencyAction: () => 'Emergency Action',
      profileUpdate: () => 'Profile Update',
      settingsChange: () => 'Settings Change',
      login: () => 'Login',
      logout: () => 'Logout',
      other: () => 'Other',
    );
  }

  String get iconName {
    return when(
      navigation: () => 'navigation',
      search: () => 'search',
      viewMap: () => 'map',
      viewAlert: () => 'notifications',
      emergencyAction: () => 'emergency',
      profileUpdate: () => 'person',
      settingsChange: () => 'settings',
      login: () => 'login',
      logout: () => 'logout',
      other: () => 'info',
    );
  }
}

/// Extension for RouteType display
extension RouteTypeDisplay on RouteType {
  String get displayName {
    return when(
      walking: () => 'Walking',
      evacuation: () => 'Evacuation',
      emergency: () => 'Emergency',
      practice: () => 'Practice',
      custom: () => 'Custom',
    );
  }
}

/// Extension for RouteStatus display
extension RouteStatusDisplay on RouteStatus {
  String get displayName {
    return when(
      planned: () => 'Planned',
      active: () => 'Active',
      paused: () => 'Paused',
      completed: () => 'Completed',
      cancelled: () => 'Cancelled',
      failed: () => 'Failed',
    );
  }

  bool get isFinal => this == RouteStatus.completed() || this == RouteStatus.cancelled() || this == RouteStatus.failed();
}