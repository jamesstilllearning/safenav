// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
  description: json['description'] as String?,
  address: json['address'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$NavigationDestinationToJson(
  _NavigationDestination instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': DestinationTypeConverter._destinationTypeToJson(instance.type),
  'coordinates': instance.coordinates,
  'buildingId': instance.buildingId,
  'description': instance.description,
  'address': instance.address,
  'metadata': instance.metadata,
};

_NavigationRoute _$NavigationRouteFromJson(Map<String, dynamic> json) =>
    _NavigationRoute(
      id: json['id'] as String,
      start: NavigationDestination.fromJson(
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
