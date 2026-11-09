/// SAFENAV CAVITE - Navigation Models
///
/// Data models for navigation and routing features.
library;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'navigation_models.freezed.dart';
part 'navigation_models.g.dart';

/// JSON converter for DestinationType freezed union
class DestinationTypeConverter implements JsonConverter<DestinationType, Map<String, dynamic>> {
  const DestinationTypeConverter();

  @override
  DestinationType fromJson(Map<String, dynamic> json) => _destinationTypeFromJson(json);

  @override
  Map<String, dynamic> toJson(DestinationType object) => _destinationTypeToJson(object);

  static DestinationType _destinationTypeFromJson(Map<String, dynamic> json) {
    if (json.containsKey('building')) return const DestinationType.building();
    if (json.containsKey('location')) return const DestinationType.location();
    if (json.containsKey('coordinates')) return const DestinationType.coordinates();
    if (json.containsKey('emergencyExit')) return const DestinationType.emergencyExit();
    if (json.containsKey('assemblyPoint')) return const DestinationType.assemblyPoint();
    throw FormatException('Unknown DestinationType: $json');
  }

  static Map<String, dynamic> _destinationTypeToJson(DestinationType object) {
    return object.when(
      building: () => {'building': {}},
      location: () => {'location': {}},
      coordinates: () => {'coordinates': {}},
      emergencyExit: () => {'emergencyExit': {}},
      assemblyPoint: () => {'assemblyPoint': {}},
    );
  }
}

/// JSON converter for RouteStatus freezed union
class RouteStatusConverter implements JsonConverter<RouteStatus?, Map<String, dynamic>?> {
  const RouteStatusConverter();

  @override
  RouteStatus? fromJson(Map<String, dynamic>? json) => _routeStatusFromJson(json);

  @override
  Map<String, dynamic>? toJson(RouteStatus? object) => _routeStatusToJson(object);

  static RouteStatus? _routeStatusFromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    if (json.containsKey('planned')) return const RouteStatus.planned();
    if (json.containsKey('active')) return const RouteStatus.active();
    if (json.containsKey('paused')) return const RouteStatus.paused();
    if (json.containsKey('completed')) return const RouteStatus.completed();
    if (json.containsKey('cancelled')) return const RouteStatus.cancelled();
    throw FormatException('Unknown RouteStatus: $json');
  }

  static Map<String, dynamic>? _routeStatusToJson(RouteStatus? object) {
    if (object == null) return null;
    return object.when(
      planned: () => {'planned': {}},
      active: () => {'active': {}},
      paused: () => {'paused': {}},
      completed: () => {'completed': {}},
      cancelled: () => {'cancelled': {}},
    );
  }
}

/// JSON converter for InstructionType freezed union
class InstructionTypeConverter implements JsonConverter<InstructionType, Map<String, dynamic>> {
  const InstructionTypeConverter();

  @override
  InstructionType fromJson(Map<String, dynamic> json) => _instructionTypeFromJson(json);

  @override
  Map<String, dynamic> toJson(InstructionType object) => _instructionTypeToJson(object);

  static InstructionType _instructionTypeFromJson(Map<String, dynamic> json) {
    if (json.containsKey('start')) return const InstructionType.start();
    if (json.containsKey('continueStraight')) return const InstructionType.continueStraight();
    if (json.containsKey('turnLeft')) return const InstructionType.turnLeft();
    if (json.containsKey('turnRight')) return const InstructionType.turnRight();
    if (json.containsKey('turnSlightLeft')) return const InstructionType.turnSlightLeft();
    if (json.containsKey('turnSlightRight')) return const InstructionType.turnSlightRight();
    if (json.containsKey('uturn')) return const InstructionType.uturn();
    if (json.containsKey('arrive')) return const InstructionType.arrive();
    if (json.containsKey('enterBuilding')) return const InstructionType.enterBuilding();
    if (json.containsKey('exitBuilding')) return const InstructionType.exitBuilding();
    throw FormatException('Unknown InstructionType: $json');
  }

  static Map<String, dynamic> _instructionTypeToJson(InstructionType object) {
    return object.when(
      start: () => {'start': {}},
      continueStraight: () => {'continueStraight': {}},
      turnLeft: () => {'turnLeft': {}},
      turnRight: () => {'turnRight': {}},
      turnSlightLeft: () => {'turnSlightLeft': {}},
      turnSlightRight: () => {'turnSlightRight': {}},
      uturn: () => {'uturn': {}},
      arrive: () => {'arrive': {}},
      enterBuilding: () => {'enterBuilding': {}},
      exitBuilding: () => {'exitBuilding': {}},
    );
  }
}

/// Type of navigation destination
@freezed
abstract class DestinationType with _$DestinationType {
  const factory DestinationType.building() = _Building;
  const factory DestinationType.location() = _Location;
  const factory DestinationType.coordinates() = _Coordinates;
  const factory DestinationType.emergencyExit() = _EmergencyExit;
  const factory DestinationType.assemblyPoint() = _AssemblyPoint;
}

/// Navigation destination model
@freezed
abstract class NavigationDestination with _$NavigationDestination {
  const NavigationDestination._();

  const factory NavigationDestination({
    required String id,
    required String name,
    // ignore: invalid_annotation_target
    @JsonKey(
      fromJson: DestinationTypeConverter._destinationTypeFromJson,
      toJson: DestinationTypeConverter._destinationTypeToJson,
    )
    required DestinationType type,
    required LatLng coordinates,
    String? buildingId,
    String? description,
    String? address,
    Map<String, dynamic>? metadata,
  }) = _NavigationDestination;

  factory NavigationDestination.fromJson(Map<String, dynamic> json) =>
      _$NavigationDestinationFromJson(json);
}

/// Navigation route model with full geometry and instructions
@freezed
abstract class NavigationRoute with _$NavigationRoute {
  const NavigationRoute._();

  const factory NavigationRoute({
    required String id,
    required NavigationDestination start,
    required NavigationDestination end,
    required List<LatLng> geometry,
    required double totalDistance,
    required Duration estimatedDuration,
    required List<NavigationInstruction> instructions,
    required DateTime createdAt,
    String? pathwayIds,
    // ignore: invalid_annotation_target
    @JsonKey(
      fromJson: RouteStatusConverter._routeStatusFromJson,
      toJson: RouteStatusConverter._routeStatusToJson,
    )
    RouteStatus? status,
  }) = _NavigationRoute;

  factory NavigationRoute.fromJson(Map<String, dynamic> json) =>
      _$NavigationRouteFromJson(json);

  /// Format distance for display
  String get formattedDistance {
    if (totalDistance < 1000) {
      return '${totalDistance.round()} m';
    } else {
      return '${(totalDistance / 1000).toStringAsFixed(1)} km';
    }
  }

  /// Format duration for display
  String get formattedDuration {
    final hours = estimatedDuration.inHours;
    final minutes = estimatedDuration.inMinutes.remainder(60);
    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
}

/// Turn-by-turn navigation instruction
@freezed
abstract class NavigationInstruction with _$NavigationInstruction {
  const NavigationInstruction._();

  const factory NavigationInstruction({
    required String instruction,
    required double latitude,
    required double longitude,
    required double distanceToNext,
    // ignore: invalid_annotation_target
    @JsonKey(
      fromJson: InstructionTypeConverter._instructionTypeFromJson,
      toJson: InstructionTypeConverter._instructionTypeToJson,
    )
    required InstructionType type,
    String? roadName,
    String? landmark,
  }) = _NavigationInstruction;

  factory NavigationInstruction.fromJson(Map<String, dynamic> json) =>
      _$NavigationInstructionFromJson(json);

  LatLng get position => LatLng(latitude, longitude);

  /// Get icon for instruction type
  String get iconName {
    switch (type) {
      case InstructionType.start:
        return 'navigation';
      case InstructionType.continueStraight:
        return 'arrow_upward';
      case InstructionType.turnLeft:
        return 'turn_left';
      case InstructionType.turnRight:
        return 'turn_right';
      case InstructionType.turnSlightLeft:
        return 'turn_slight_left';
      case InstructionType.turnSlightRight:
        return 'turn_slight_right';
      case InstructionType.uturn:
        return 'u_turn_left';
      case InstructionType.arrive:
        return 'location_on';
      case InstructionType.enterBuilding:
        return 'door_front_door';
      case InstructionType.exitBuilding:
        return 'exit_to_app';
    }
    throw StateError('Unknown InstructionType: $type');
  }
}

/// Instruction types for turn-by-turn navigation
@freezed
abstract class InstructionType with _$InstructionType {
  const factory InstructionType.start() = _Start;
  const factory InstructionType.continueStraight() = _ContinueStraight;
  const factory InstructionType.turnLeft() = _TurnLeft;
  const factory InstructionType.turnRight() = _TurnRight;
  const factory InstructionType.turnSlightLeft() = _TurnSlightLeft;
  const factory InstructionType.turnSlightRight() = _TurnSlightRight;
  const factory InstructionType.uturn() = _Uturn;
  const factory InstructionType.arrive() = _Arrive;
  const factory InstructionType.enterBuilding() = _EnterBuilding;
  const factory InstructionType.exitBuilding() = _ExitBuilding;
}

/// Route status
@freezed
abstract class RouteStatus with _$RouteStatus {
  const factory RouteStatus.planned() = _Planned;
  const factory RouteStatus.active() = _Active;
  const factory RouteStatus.paused() = _Paused;
  const factory RouteStatus.completed() = _Completed;
  const factory RouteStatus.cancelled() = _Cancelled;
}

/// Active navigation session
@freezed
abstract class NavigationSession with _$NavigationSession {
  const NavigationSession._();

  const factory NavigationSession({
    required String id,
    required NavigationRoute route,
    required int currentInstructionIndex,
    required LatLng currentPosition,
    required DateTime startedAt,
    DateTime? completedAt,
    double? remainingDistance,
    Duration? remainingTime,
    @Default(false) bool isVoiceGuidanceEnabled,
    @Default(false) bool isRerouting,
  }) = _NavigationSession;

  factory NavigationSession.fromJson(Map<String, dynamic> json) =>
      _$NavigationSessionFromJson(json);

  NavigationInstruction get currentInstruction =>
      route.instructions[currentInstructionIndex];

  bool get isAtDestination =>
      currentInstructionIndex >= route.instructions.length - 1;

  double get progress {
    if (route.instructions.isEmpty) return 0.0;
    return currentInstructionIndex / (route.instructions.length - 1);
  }
}

/// Saved route for history/favorites
@freezed
abstract class SavedRoute with _$SavedRoute {
  const factory SavedRoute({
    required String id,
    required String name,
    required NavigationRoute route,
    required DateTime savedAt,
    @Default(false) bool isFavorite,
    @Default(0) int useCount,
  }) = _SavedRoute;

  factory SavedRoute.fromJson(Map<String, dynamic> json) =>
      _$SavedRouteFromJson(json);
}