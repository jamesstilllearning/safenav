// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserActivity _$UserActivityFromJson(Map<String, dynamic> json) =>
    _UserActivity(
      id: json['id'] as String,
      userId: json['userId'] as String,
      type: const ActivityTypeConverter().fromJson(json['type'] as Object),
      description: json['description'] as String,
      buildingId: json['buildingId'] as String?,
      floorId: json['floorId'] as String?,
      roomId: json['roomId'] as String?,
      location: json['location'] == null
          ? null
          : LatLng.fromJson(json['location'] as Map<String, dynamic>),
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$UserActivityToJson(_UserActivity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'type': const ActivityTypeConverter().toJson(instance.type),
      'description': instance.description,
      'buildingId': instance.buildingId,
      'floorId': instance.floorId,
      'roomId': instance.roomId,
      'location': instance.location,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_UserVisit _$UserVisitFromJson(Map<String, dynamic> json) => _UserVisit(
  id: json['id'] as String,
  userId: json['userId'] as String,
  buildingId: json['buildingId'] as String,
  floorId: json['floorId'] as String?,
  roomId: json['roomId'] as String?,
  roomName: json['roomName'] as String?,
  visitedAt: DateTime.parse(json['visitedAt'] as String),
  duration: Duration(microseconds: (json['duration'] as num).toInt()),
  visitCount: (json['visitCount'] as num?)?.toInt(),
  entryLocation: json['entryLocation'] == null
      ? null
      : LatLng.fromJson(json['entryLocation'] as Map<String, dynamic>),
  exitLocation: json['exitLocation'] == null
      ? null
      : LatLng.fromJson(json['exitLocation'] as Map<String, dynamic>),
  metadata: json['metadata'] as Map<String, dynamic>?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$UserVisitToJson(_UserVisit instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'buildingId': instance.buildingId,
      'floorId': instance.floorId,
      'roomId': instance.roomId,
      'roomName': instance.roomName,
      'visitedAt': instance.visitedAt.toIso8601String(),
      'duration': instance.duration.inMicroseconds,
      'visitCount': instance.visitCount,
      'entryLocation': instance.entryLocation,
      'exitLocation': instance.exitLocation,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_UserRoute _$UserRouteFromJson(Map<String, dynamic> json) => _UserRoute(
  id: json['id'] as String,
  userId: json['userId'] as String,
  type: const RouteTypeConverter().fromJson(json['type'] as Object),
  startBuildingId: json['startBuildingId'] as String,
  startFloorId: json['startFloorId'] as String?,
  startRoomId: json['startRoomId'] as String?,
  endBuildingId: json['endBuildingId'] as String,
  endFloorId: json['endFloorId'] as String?,
  endRoomId: json['endRoomId'] as String?,
  geometry: (json['geometry'] as List<dynamic>)
      .map((e) => LatLng.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalDistance: (json['totalDistance'] as num).toDouble(),
  estimatedDuration: Duration(
    microseconds: (json['estimatedDuration'] as num).toInt(),
  ),
  actualDuration: Duration(
    microseconds: (json['actualDuration'] as num).toInt(),
  ),
  startedAt: DateTime.parse(json['startedAt'] as String),
  completedAt: json['completedAt'] == null
      ? null
      : DateTime.parse(json['completedAt'] as String),
  status: json['status'] == null
      ? const RouteStatus.planned()
      : const RouteStatusConverter().fromJson(
          json['status'] as Map<String, dynamic>,
        ),
  metadata: json['metadata'] as Map<String, dynamic>?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$UserRouteToJson(_UserRoute instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'type': const RouteTypeConverter().toJson(instance.type),
      'startBuildingId': instance.startBuildingId,
      'startFloorId': instance.startFloorId,
      'startRoomId': instance.startRoomId,
      'endBuildingId': instance.endBuildingId,
      'endFloorId': instance.endFloorId,
      'endRoomId': instance.endRoomId,
      'geometry': instance.geometry,
      'totalDistance': instance.totalDistance,
      'estimatedDuration': instance.estimatedDuration.inMicroseconds,
      'actualDuration': instance.actualDuration.inMicroseconds,
      'startedAt': instance.startedAt.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
      'status': const RouteStatusConverter().toJson(instance.status),
      'metadata': instance.metadata,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_SafetyScore _$SafetyScoreFromJson(Map<String, dynamic> json) => _SafetyScore(
  userId: json['userId'] as String,
  userName: json['userName'] as String,
  totalScore: (json['totalScore'] as num).toInt(),
  navigationScore: (json['navigationScore'] as num?)?.toInt() ?? 0,
  emergencyPreparednessScore:
      (json['emergencyPreparednessScore'] as num?)?.toInt() ?? 0,
  buildingFamiliarityScore:
      (json['buildingFamiliarityScore'] as num?)?.toInt() ?? 0,
  drillParticipationScore:
      (json['drillParticipationScore'] as num?)?.toInt() ?? 0,
  alertResponsivenessScore:
      (json['alertResponsivenessScore'] as num?)?.toInt() ?? 0,
  buildingScores:
      (json['buildingScores'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ) ??
      const {},
  completedDrills:
      (json['completedDrills'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  visitedBuildings:
      (json['visitedBuildings'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  totalRoutesCompleted: (json['totalRoutesCompleted'] as num?)?.toInt() ?? 0,
  totalDistanceMeters: (json['totalDistanceMeters'] as num?)?.toInt() ?? 0,
  totalVisits: (json['totalVisits'] as num?)?.toInt() ?? 0,
  lastActivityAt: json['lastActivityAt'] == null
      ? null
      : DateTime.parse(json['lastActivityAt'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$SafetyScoreToJson(_SafetyScore instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'totalScore': instance.totalScore,
      'navigationScore': instance.navigationScore,
      'emergencyPreparednessScore': instance.emergencyPreparednessScore,
      'buildingFamiliarityScore': instance.buildingFamiliarityScore,
      'drillParticipationScore': instance.drillParticipationScore,
      'alertResponsivenessScore': instance.alertResponsivenessScore,
      'buildingScores': instance.buildingScores,
      'completedDrills': instance.completedDrills,
      'visitedBuildings': instance.visitedBuildings,
      'totalRoutesCompleted': instance.totalRoutesCompleted,
      'totalDistanceMeters': instance.totalDistanceMeters,
      'totalVisits': instance.totalVisits,
      'lastActivityAt': instance.lastActivityAt?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'metadata': instance.metadata,
    };
