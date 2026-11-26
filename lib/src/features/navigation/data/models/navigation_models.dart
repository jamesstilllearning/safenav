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
    if (json.containsKey('room')) return const DestinationType.room();
    if (json.containsKey('facility')) return const DestinationType.facility();
    throw FormatException('Unknown DestinationType: $json');
  }

  static Map<String, dynamic> _destinationTypeToJson(DestinationType object) {
    return object.when(
      building: () => {'building': {}},
      location: () => {'location': {}},
      coordinates: () => {'coordinates': {}},
      emergencyExit: () => {'emergencyExit': {}},
      assemblyPoint: () => {'assemblyPoint': {}},
      room: () => {'room': {}},
      facility: () => {'facility': {}},
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
    if (json.containsKey('enterFloor')) return const InstructionType.enterFloor();
    if (json.containsKey('exitFloor')) return const InstructionType.exitFloor();
    if (json.containsKey('useElevator')) return const InstructionType.useElevator();
    if (json.containsKey('useStairs')) return const InstructionType.useStairs();
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
      enterFloor: () => {'enterFloor': {}},
      exitFloor: () => {'exitFloor': {}},
      useElevator: () => {'useElevator': {}},
      useStairs: () => {'useStairs': {}},
    );
  }
}

/// JSON converter for StartPointType freezed union
class StartPointTypeConverter implements JsonConverter<StartPointType, Map<String, dynamic>> {
  const StartPointTypeConverter();

  @override
  StartPointType fromJson(Map<String, dynamic> json) => _startPointTypeFromJson(json);

  @override
  Map<String, dynamic> toJson(StartPointType object) => _startPointTypeToJson(object);

  static StartPointType _startPointTypeFromJson(Map<String, dynamic> json) {
    if (json.containsKey('indoor')) return const StartPointType.indoor();
    if (json.containsKey('outdoor')) return const StartPointType.outdoor();
    if (json.containsKey('currentLocation')) return const StartPointType.currentLocation();
    throw FormatException('Unknown StartPointType: $json');
  }

  static Map<String, dynamic> _startPointTypeToJson(StartPointType object) {
    return object.when(
      indoor: () => {'indoor': {}},
      outdoor: () => {'outdoor': {}},
      currentLocation: () => {'currentLocation': {}},
    );
  }
}

/// Type of navigation start point
@freezed
abstract class StartPointType with _$StartPointType {
  const factory StartPointType.indoor() = _Indoor;
  const factory StartPointType.outdoor() = _Outdoor;
  const factory StartPointType.currentLocation() = _CurrentLocation;
}

/// Indoor start point for manual indoor starting positions
@freezed
abstract class IndoorStartPoint with _$IndoorStartPoint {
  const IndoorStartPoint._();

  const factory IndoorStartPoint({
    required String buildingId,
    required String floorId,
    String? roomId,
    String? roomName,
    LatLng? coordinates, // Real-world coordinates if available
    String? description,
    Map<String, dynamic>? metadata,
  }) = _IndoorStartPoint;

  factory IndoorStartPoint.fromJson(Map<String, dynamic> json) =>
      _$IndoorStartPointFromJson(json);

  /// Create a display name for the start point
  String get displayName {
    final parts = <String>[];
    if (roomName != null && roomName!.isNotEmpty) {
      parts.add(roomName!);
    } else if (roomId != null && roomId!.isNotEmpty) {
      parts.add('Room $roomId');
    }
    parts.add('Floor $floorId');
    parts.add('Building $buildingId');
    return parts.join(', ');
  }

  /// Check if this start point has specific room coordinates
  bool get hasRoomCoordinates => roomId != null && coordinates != null;
}

/// Outdoor start point for GPS-based outdoor positions
@freezed
abstract class OutdoorStartPoint with _$OutdoorStartPoint {
  const OutdoorStartPoint._();

  const factory OutdoorStartPoint({
    required LatLng coordinates,
    double? accuracy,
    double? altitude,
    double? heading,
    double? speed,
    String? address,
    String? placeName,
    DateTime? timestamp,
    Map<String, dynamic>? metadata,
  }) = _OutdoorStartPoint;

  factory OutdoorStartPoint.fromJson(Map<String, dynamic> json) =>
      _$OutdoorStartPointFromJson(json);

  /// Create a display name for the start point
  String get displayName {
    if (placeName != null && placeName!.isNotEmpty) {
      return placeName!;
    }
    if (address != null && address!.isNotEmpty) {
      return address!;
    }
    return 'Outdoor (${coordinates.latitude.toStringAsFixed(6)}, ${coordinates.longitude.toStringAsFixed(6)})';
  }

  /// Check if GPS accuracy is sufficient for navigation
  bool get isAccurateEnough => accuracy != null && accuracy! <= 50.0; // 50 meters threshold
}

/// Unified start point that can be indoor, outdoor, or current location
@freezed
abstract class NavigationStartPoint with _$NavigationStartPoint {
  const NavigationStartPoint._();

  const factory NavigationStartPoint.indoor(IndoorStartPoint indoor) = _IndoorStartPointWrapper;
  const factory NavigationStartPoint.outdoor(OutdoorStartPoint outdoor) = _OutdoorStartPointWrapper;
  const factory NavigationStartPoint.currentLocation(LatLng coordinates, {double? accuracy}) = _CurrentLocationStartPoint;

  factory NavigationStartPoint.fromJson(Map<String, dynamic> json) =>
      _$NavigationStartPointFromJson(json);

  /// Get the display name
  String get displayName => when(
    indoor: (point) => point.displayName,
    outdoor: (point) => point.displayName,
    currentLocation: (coordinates, accuracy) => 'Current Location (${coordinates.latitude.toStringAsFixed(6)}, ${coordinates.longitude.toStringAsFixed(6)})',
  );

  /// Get the coordinates if available
  LatLng? get coordinates => when(
    indoor: (point) => point.coordinates,
    outdoor: (point) => point.coordinates,
    currentLocation: (coordinates, _) => coordinates,
  );

  /// Get the start point type
  StartPointType get type => when(
    indoor: (_) => StartPointType.indoor(),
    outdoor: (_) => StartPointType.outdoor(),
    currentLocation: (_, _) => StartPointType.currentLocation(),
  );

  /// Get building ID if indoor
  String? get buildingId => when(
    indoor: (point) => point.buildingId,
    outdoor: (_) => null,
    currentLocation: (_, _) => null,
  );

  /// Get floor ID if indoor
  String? get floorId => when(
    indoor: (point) => point.floorId,
    outdoor: (_) => null,
    currentLocation: (_, _) => null,
  );

  /// Get room ID if indoor
  String? get roomId => when(
    indoor: (point) => point.roomId,
    outdoor: (_) => null,
    currentLocation: (_, _) => null,
  );
}

/// Type of navigation destination
@freezed
abstract class DestinationType with _$DestinationType {
  const factory DestinationType.building() = _Building;
  const factory DestinationType.location() = _Location;
  const factory DestinationType.coordinates() = _Coordinates;
  const factory DestinationType.emergencyExit() = _EmergencyExit;
  const factory DestinationType.assemblyPoint() = _AssemblyPoint;
  const factory DestinationType.room() = _Room;
  const factory DestinationType.facility() = _Facility;
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
    String? floorId,
    String? roomId,
    String? roomName,
    String? description,
    String? address,
    Map<String, dynamic>? metadata,
    // Navigation-specific fields
    @Default(false) bool isEmergencyExit,
    @Default(false) bool isAssemblyPoint,
    @Default(false) bool isAccessible,
    @Default(false) bool isRoutable,
    String? evacuationRouteId,
  }) = _NavigationDestination;

  factory NavigationDestination.fromJson(Map<String, dynamic> json) =>
      _$NavigationDestinationFromJson(json);

  /// Create a display name for the destination
  String get displayName {
    final parts = <String>[name];
    if (roomName != null && roomName!.isNotEmpty) {
      parts.add('($roomName)');
    }
    if (buildingId != null && buildingId!.isNotEmpty) {
      parts.add('Building $buildingId');
    }
    if (floorId != null && floorId!.isNotEmpty) {
      parts.add('Floor $floorId');
    }
    return parts.join(', ');
  }

  /// Check if this is an indoor destination (has building/floor/room)
  bool get isIndoor => buildingId != null && buildingId!.isNotEmpty;

  /// Check if this is a room destination
  bool get isRoom => type == DestinationType.room();

  /// Check if this is a facility destination
  bool get isFacility => type == DestinationType.facility();

  /// Check if this is an emergency-related destination
  bool get isEmergencyRelated => isEmergencyExit || isAssemblyPoint || type == DestinationType.emergencyExit() || type == DestinationType.assemblyPoint();

  /// Get the indoor location description
  String? get indoorDescription {
    if (!isIndoor) return null;
    final parts = <String>[];
    if (roomName != null) parts.add(roomName!);
    if (floorId != null) parts.add('Floor $floorId');
    if (buildingId != null) parts.add('Building $buildingId');
    return parts.join(' > ');
  }
}

/// Navigation route model with full geometry and instructions
@freezed
abstract class NavigationRoute with _$NavigationRoute {
  const NavigationRoute._();

  const factory NavigationRoute({
    required String id,
    required NavigationStartPoint start,
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
    // Indoor navigation specific
    List<String>? buildingTransitions,
    List<String>? floorTransitions,
    double? indoorDistance,
    double? outdoorDistance,
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

  /// Check if route has indoor segments
  bool get hasIndoorSegments => buildingTransitions != null && buildingTransitions!.isNotEmpty;

  /// Check if route has floor transitions
  bool get hasFloorTransitions => floorTransitions != null && floorTransitions!.isNotEmpty;

  /// Get indoor distance percentage
  double get indoorDistancePercentage {
    if (indoorDistance == null || totalDistance == 0) return 0.0;
    return (indoorDistance! / totalDistance) * 100;
  }

  /// Get outdoor distance percentage
  double get outdoorDistancePercentage {
    if (outdoorDistance == null || totalDistance == 0) return 0.0;
    return (outdoorDistance! / totalDistance) * 100;
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
    // Indoor-specific fields
    String? buildingId,
    String? floorId,
    String? roomId,
    String? levelChange, // e.g., "Go up to Floor 2", "Take elevator down"
    double? elevationChange,
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
      case InstructionType.enterFloor:
        return 'floor';
      case InstructionType.exitFloor:
        return 'floor';
      case InstructionType.useElevator:
        return 'elevator';
      case InstructionType.useStairs:
        return 'stairs';
    }
    throw StateError('Unknown InstructionType: $type');
  }

  /// Check if this is an indoor-specific instruction
  bool get isIndoorInstruction => type == InstructionType.enterBuilding() ||
      type == InstructionType.exitBuilding() ||
      type == InstructionType.enterFloor() ||
      type == InstructionType.exitFloor() ||
      type == InstructionType.useElevator() ||
      type == InstructionType.useStairs();

  /// Get formatted instruction with indoor context
  String get formattedInstruction {
    String base = instruction;
    if (levelChange != null && levelChange!.isNotEmpty) {
      base = '$base ($levelChange)';
    }
    if (buildingId != null) {
      base = '[Building $buildingId] $base';
    }
    if (floorId != null) {
      base = '[Floor $floorId] $base';
    }
    return base;
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
  const factory InstructionType.enterFloor() = _EnterFloor;
  const factory InstructionType.exitFloor() = _ExitFloor;
  const factory InstructionType.useElevator() = _UseElevator;
  const factory InstructionType.useStairs() = _UseStairs;
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
    // Indoor tracking
    String? currentBuildingId,
    String? currentFloorId,
    String? currentRoomId,
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

  /// Get current indoor context
  String? get indoorContext {
    final parts = <String>[];
    if (currentBuildingId != null) parts.add('Building $currentBuildingId');
    if (currentFloorId != null) parts.add('Floor $currentFloorId');
    if (currentRoomId != null) parts.add('Room $currentRoomId');
    return parts.isEmpty ? null : parts.join(' > ');
  }
}

/// Saved route for history/favorites
@freezed
abstract class SavedRoute with _$SavedRoute {
  const SavedRoute._();

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

/// Navigation preferences for routing
@freezed
abstract class NavigationPreferences with _$NavigationPreferences {
  const NavigationPreferences._();

  const factory NavigationPreferences({
    @Default(true) bool avoidStairs,
    @Default(true) bool preferElevators,
    @Default(true) bool accessibleRoute,
    @Default(false) bool avoidIndoor,
    @Default(false) bool preferShortestPath,
    @Default(false) bool preferSafestPath,
    @Default({}) Map<String, dynamic> customWeights,
  }) = _NavigationPreferences;

  factory NavigationPreferences.fromJson(Map<String, dynamic> json) =>
      _$NavigationPreferencesFromJson(json);
}

/// Extension for DestinationType display
extension DestinationTypeDisplay on DestinationType {
  String get displayName {
    return when(
      building: () => 'Building',
      location: () => 'Location',
      coordinates: () => 'Coordinates',
      emergencyExit: () => 'Emergency Exit',
      assemblyPoint: () => 'Assembly Point',
      room: () => 'Room',
      facility: () => 'Facility',
    );
  }
}

/// Extension for StartPointType display
extension StartPointTypeDisplay on StartPointType {
  String get displayName {
    return when(
      indoor: () => 'Indoor',
      outdoor: () => 'Outdoor',
      currentLocation: () => 'Current Location',
    );
  }
}

/// Indoor location with building, floor, room, and precise coordinates
@freezed
abstract class IndoorLocation with _$IndoorLocation {
  const IndoorLocation._();

  const factory IndoorLocation({
    required String buildingId,
    required String floorId,
    String? roomId,
    String? roomName,
    required LatLng coordinates, // Real-world coordinates (entrance or room center)
    double? accuracy,
    String? description,
    Map<String, dynamic>? metadata,
  }) = _IndoorLocation;

  factory IndoorLocation.fromJson(Map<String, dynamic> json) =>
      _$IndoorLocationFromJson(json);

  /// Create a display name for the location
  String get displayName {
    final parts = <String>[];
    if (roomName != null && roomName!.isNotEmpty) {
      parts.add(roomName!);
    } else if (roomId != null && roomId!.isNotEmpty) {
      parts.add('Room $roomId');
    }
    parts.add('Floor $floorId');
    parts.add('Building $buildingId');
    return parts.join(', ');
  }

  /// Check if this location has specific room coordinates
  bool get hasRoomCoordinates => roomId != null;
}

/// Outdoor location with GPS coordinates and accuracy
@freezed
abstract class OutdoorLocation with _$OutdoorLocation {
  const OutdoorLocation._();

  const factory OutdoorLocation({
    required LatLng coordinates,
    double? accuracy,
    double? altitude,
    double? heading,
    double? speed,
    String? address,
    String? placeName,
    DateTime? timestamp,
    Map<String, dynamic>? metadata,
  }) = _OutdoorLocation;

  factory OutdoorLocation.fromJson(Map<String, dynamic> json) =>
      _$OutdoorLocationFromJson(json);

  /// Create a display name for the location
  String get displayName {
    if (placeName != null && placeName!.isNotEmpty) {
      return placeName!;
    }
    if (address != null && address!.isNotEmpty) {
      return address!;
    }
    return 'Outdoor (${coordinates.latitude.toStringAsFixed(6)}, ${coordinates.longitude.toStringAsFixed(6)})';
  }

  /// Check if GPS accuracy is sufficient for navigation
  bool get isAccurateEnough => accuracy != null && accuracy! <= 50.0; // 50 meters threshold
}

/// Map mode for indoor/outdoor navigation
@freezed
abstract class MapMode with _$MapMode {
  const factory MapMode.outdoor() = _OutdoorMode;
  const factory MapMode.indoor({required String buildingId, required String floorId}) = _IndoorMode;
}