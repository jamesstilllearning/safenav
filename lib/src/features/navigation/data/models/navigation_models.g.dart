// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IndoorStartPoint _$IndoorStartPointFromJson(Map<String, dynamic> json) =>
    _IndoorStartPoint(
      buildingId: json['buildingId'] as String,
      floorId: json['floorId'] as String,
      roomId: json['roomId'] as String?,
      roomName: json['roomName'] as String?,
      coordinates: json['coordinates'] == null
          ? null
          : LatLng.fromJson(json['coordinates'] as Map<String, dynamic>),
      description: json['description'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$IndoorStartPointToJson(_IndoorStartPoint instance) =>
    <String, dynamic>{
      'buildingId': instance.buildingId,
      'floorId': instance.floorId,
      'roomId': instance.roomId,
      'roomName': instance.roomName,
      'coordinates': instance.coordinates,
      'description': instance.description,
      'metadata': instance.metadata,
    };

_OutdoorStartPoint _$OutdoorStartPointFromJson(Map<String, dynamic> json) =>
    _OutdoorStartPoint(
      coordinates: LatLng.fromJson(json['coordinates'] as Map<String, dynamic>),
      accuracy: (json['accuracy'] as num?)?.toDouble(),
      altitude: (json['altitude'] as num?)?.toDouble(),
      heading: (json['heading'] as num?)?.toDouble(),
      speed: (json['speed'] as num?)?.toDouble(),
      address: json['address'] as String?,
      placeName: json['placeName'] as String?,
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$OutdoorStartPointToJson(_OutdoorStartPoint instance) =>
    <String, dynamic>{
      'coordinates': instance.coordinates,
      'accuracy': instance.accuracy,
      'altitude': instance.altitude,
      'heading': instance.heading,
      'speed': instance.speed,
      'address': instance.address,
      'placeName': instance.placeName,
      'timestamp': instance.timestamp?.toIso8601String(),
      'metadata': instance.metadata,
    };

_IndoorStartPointWrapper _$IndoorStartPointWrapperFromJson(
  Map<String, dynamic> json,
) => _IndoorStartPointWrapper(
  IndoorStartPoint.fromJson(json['indoor'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$IndoorStartPointWrapperToJson(
  _IndoorStartPointWrapper instance,
) => <String, dynamic>{
  'indoor': instance.indoor,
  'runtimeType': instance.$type,
};

_OutdoorStartPointWrapper _$OutdoorStartPointWrapperFromJson(
  Map<String, dynamic> json,
) => _OutdoorStartPointWrapper(
  OutdoorStartPoint.fromJson(json['outdoor'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$OutdoorStartPointWrapperToJson(
  _OutdoorStartPointWrapper instance,
) => <String, dynamic>{
  'outdoor': instance.outdoor,
  'runtimeType': instance.$type,
};

_CurrentLocationStartPoint _$CurrentLocationStartPointFromJson(
  Map<String, dynamic> json,
) => _CurrentLocationStartPoint(
  LatLng.fromJson(json['coordinates'] as Map<String, dynamic>),
  accuracy: (json['accuracy'] as num?)?.toDouble(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$CurrentLocationStartPointToJson(
  _CurrentLocationStartPoint instance,
) => <String, dynamic>{
  'coordinates': instance.coordinates,
  'accuracy': instance.accuracy,
  'runtimeType': instance.$type,
};

_NavigationDestination _$NavigationDestinationFromJson(
  Map<String, dynamic> json,
) => _NavigationDestination(
  id: json['id'] as String,
  name: json['name'] as String,
  type: DestinationTypeConverter._destinationTypeFromJson(
    json['type'] as Map<String, dynamic>,
  ),
  coordinates: LatLng.fromJson(json['coordinates'] as Map<String, dynamic>),
  buildingId: json['buildingId'] as String?,
  floorId: json['floorId'] as String?,
  roomId: json['roomId'] as String?,
  roomName: json['roomName'] as String?,
  description: json['description'] as String?,
  address: json['address'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
  isEmergencyExit: json['isEmergencyExit'] as bool? ?? false,
  isAssemblyPoint: json['isAssemblyPoint'] as bool? ?? false,
  isAccessible: json['isAccessible'] as bool? ?? false,
  isRoutable: json['isRoutable'] as bool? ?? false,
  evacuationRouteId: json['evacuationRouteId'] as String?,
);

Map<String, dynamic> _$NavigationDestinationToJson(
  _NavigationDestination instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': DestinationTypeConverter._destinationTypeToJson(instance.type),
  'coordinates': instance.coordinates,
  'buildingId': instance.buildingId,
  'floorId': instance.floorId,
  'roomId': instance.roomId,
  'roomName': instance.roomName,
  'description': instance.description,
  'address': instance.address,
  'metadata': instance.metadata,
  'isEmergencyExit': instance.isEmergencyExit,
  'isAssemblyPoint': instance.isAssemblyPoint,
  'isAccessible': instance.isAccessible,
  'isRoutable': instance.isRoutable,
  'evacuationRouteId': instance.evacuationRouteId,
};

_NavigationRoute _$NavigationRouteFromJson(Map<String, dynamic> json) =>
    _NavigationRoute(
      id: json['id'] as String,
      start: NavigationStartPoint.fromJson(
        json['start'] as Map<String, dynamic>,
      ),
      end: NavigationDestination.fromJson(json['end'] as Map<String, dynamic>),
      geometry: (json['geometry'] as List<dynamic>)
          .map((e) => LatLng.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalDistance: (json['totalDistance'] as num).toDouble(),
      estimatedDuration: Duration(
        microseconds: (json['estimatedDuration'] as num).toInt(),
      ),
      instructions: (json['instructions'] as List<dynamic>)
          .map((e) => NavigationInstruction.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      pathwayIds: json['pathwayIds'] as String?,
      status: RouteStatusConverter._routeStatusFromJson(
        json['status'] as Map<String, dynamic>?,
      ),
      buildingTransitions: (json['buildingTransitions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      floorTransitions: (json['floorTransitions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      indoorDistance: (json['indoorDistance'] as num?)?.toDouble(),
      outdoorDistance: (json['outdoorDistance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$NavigationRouteToJson(_NavigationRoute instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start': instance.start,
      'end': instance.end,
      'geometry': instance.geometry,
      'totalDistance': instance.totalDistance,
      'estimatedDuration': instance.estimatedDuration.inMicroseconds,
      'instructions': instance.instructions,
      'createdAt': instance.createdAt.toIso8601String(),
      'pathwayIds': instance.pathwayIds,
      'status': RouteStatusConverter._routeStatusToJson(instance.status),
      'buildingTransitions': instance.buildingTransitions,
      'floorTransitions': instance.floorTransitions,
      'indoorDistance': instance.indoorDistance,
      'outdoorDistance': instance.outdoorDistance,
    };

_NavigationInstruction _$NavigationInstructionFromJson(
  Map<String, dynamic> json,
) => _NavigationInstruction(
  instruction: json['instruction'] as String,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  distanceToNext: (json['distanceToNext'] as num).toDouble(),
  type: InstructionTypeConverter._instructionTypeFromJson(
    json['type'] as Map<String, dynamic>,
  ),
  roadName: json['roadName'] as String?,
  landmark: json['landmark'] as String?,
  buildingId: json['buildingId'] as String?,
  floorId: json['floorId'] as String?,
  roomId: json['roomId'] as String?,
  levelChange: json['levelChange'] as String?,
  elevationChange: (json['elevationChange'] as num?)?.toDouble(),
);

Map<String, dynamic> _$NavigationInstructionToJson(
  _NavigationInstruction instance,
) => <String, dynamic>{
  'instruction': instance.instruction,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'distanceToNext': instance.distanceToNext,
  'type': InstructionTypeConverter._instructionTypeToJson(instance.type),
  'roadName': instance.roadName,
  'landmark': instance.landmark,
  'buildingId': instance.buildingId,
  'floorId': instance.floorId,
  'roomId': instance.roomId,
  'levelChange': instance.levelChange,
  'elevationChange': instance.elevationChange,
};

_NavigationSession _$NavigationSessionFromJson(Map<String, dynamic> json) =>
    _NavigationSession(
      id: json['id'] as String,
      route: NavigationRoute.fromJson(json['route'] as Map<String, dynamic>),
      currentInstructionIndex: (json['currentInstructionIndex'] as num).toInt(),
      currentPosition: LatLng.fromJson(
        json['currentPosition'] as Map<String, dynamic>,
      ),
      startedAt: DateTime.parse(json['startedAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      remainingDistance: (json['remainingDistance'] as num?)?.toDouble(),
      remainingTime: json['remainingTime'] == null
          ? null
          : Duration(microseconds: (json['remainingTime'] as num).toInt()),
      isVoiceGuidanceEnabled: json['isVoiceGuidanceEnabled'] as bool? ?? false,
      isRerouting: json['isRerouting'] as bool? ?? false,
      currentBuildingId: json['currentBuildingId'] as String?,
      currentFloorId: json['currentFloorId'] as String?,
      currentRoomId: json['currentRoomId'] as String?,
    );

Map<String, dynamic> _$NavigationSessionToJson(_NavigationSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'route': instance.route,
      'currentInstructionIndex': instance.currentInstructionIndex,
      'currentPosition': instance.currentPosition,
      'startedAt': instance.startedAt.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
      'remainingDistance': instance.remainingDistance,
      'remainingTime': instance.remainingTime?.inMicroseconds,
      'isVoiceGuidanceEnabled': instance.isVoiceGuidanceEnabled,
      'isRerouting': instance.isRerouting,
      'currentBuildingId': instance.currentBuildingId,
      'currentFloorId': instance.currentFloorId,
      'currentRoomId': instance.currentRoomId,
    };

_SavedRoute _$SavedRouteFromJson(Map<String, dynamic> json) => _SavedRoute(
  id: json['id'] as String,
  name: json['name'] as String,
  route: NavigationRoute.fromJson(json['route'] as Map<String, dynamic>),
  savedAt: DateTime.parse(json['savedAt'] as String),
  isFavorite: json['isFavorite'] as bool? ?? false,
  useCount: (json['useCount'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$SavedRouteToJson(_SavedRoute instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'route': instance.route,
      'savedAt': instance.savedAt.toIso8601String(),
      'isFavorite': instance.isFavorite,
      'useCount': instance.useCount,
    };

_NavigationPreferences _$NavigationPreferencesFromJson(
  Map<String, dynamic> json,
) => _NavigationPreferences(
  avoidStairs: json['avoidStairs'] as bool? ?? true,
  preferElevators: json['preferElevators'] as bool? ?? true,
  accessibleRoute: json['accessibleRoute'] as bool? ?? true,
  avoidIndoor: json['avoidIndoor'] as bool? ?? false,
  preferShortestPath: json['preferShortestPath'] as bool? ?? false,
  preferSafestPath: json['preferSafestPath'] as bool? ?? false,
  customWeights: json['customWeights'] as Map<String, dynamic>? ?? const {},
);

Map<String, dynamic> _$NavigationPreferencesToJson(
  _NavigationPreferences instance,
) => <String, dynamic>{
  'avoidStairs': instance.avoidStairs,
  'preferElevators': instance.preferElevators,
  'accessibleRoute': instance.accessibleRoute,
  'avoidIndoor': instance.avoidIndoor,
  'preferShortestPath': instance.preferShortestPath,
  'preferSafestPath': instance.preferSafestPath,
  'customWeights': instance.customWeights,
};

_IndoorLocation _$IndoorLocationFromJson(Map<String, dynamic> json) =>
    _IndoorLocation(
      buildingId: json['buildingId'] as String,
      floorId: json['floorId'] as String,
      roomId: json['roomId'] as String?,
      roomName: json['roomName'] as String?,
      coordinates: LatLng.fromJson(json['coordinates'] as Map<String, dynamic>),
      accuracy: (json['accuracy'] as num?)?.toDouble(),
      description: json['description'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$IndoorLocationToJson(_IndoorLocation instance) =>
    <String, dynamic>{
      'buildingId': instance.buildingId,
      'floorId': instance.floorId,
      'roomId': instance.roomId,
      'roomName': instance.roomName,
      'coordinates': instance.coordinates,
      'accuracy': instance.accuracy,
      'description': instance.description,
      'metadata': instance.metadata,
    };

_OutdoorLocation _$OutdoorLocationFromJson(Map<String, dynamic> json) =>
    _OutdoorLocation(
      coordinates: LatLng.fromJson(json['coordinates'] as Map<String, dynamic>),
      accuracy: (json['accuracy'] as num?)?.toDouble(),
      altitude: (json['altitude'] as num?)?.toDouble(),
      heading: (json['heading'] as num?)?.toDouble(),
      speed: (json['speed'] as num?)?.toDouble(),
      address: json['address'] as String?,
      placeName: json['placeName'] as String?,
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$OutdoorLocationToJson(_OutdoorLocation instance) =>
    <String, dynamic>{
      'coordinates': instance.coordinates,
      'accuracy': instance.accuracy,
      'altitude': instance.altitude,
      'heading': instance.heading,
      'speed': instance.speed,
      'address': instance.address,
      'placeName': instance.placeName,
      'timestamp': instance.timestamp?.toIso8601String(),
      'metadata': instance.metadata,
    };
