// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evacuation_graph.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EvacuationEdge _$EvacuationEdgeFromJson(Map<String, dynamic> json) =>
    _EvacuationEdge(
      id: json['id'] as String,
      fromNodeId: json['fromNodeId'] as String,
      toNodeId: json['toNodeId'] as String,
      distance: (json['distance'] as num).toDouble(),
      estimatedTimeSeconds: (json['estimatedTimeSeconds'] as num).toInt(),
      isWheelchairAccessible: json['isWheelchairAccessible'] as bool? ?? true,
      isEmergencyRoute: json['isEmergencyRoute'] as bool? ?? false,
      floor: (json['floor'] as num?)?.toInt(),
      description: json['description'] as String?,
      hazards:
          (json['hazards'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isBlocked: json['isBlocked'] as bool? ?? false,
      blockReason: json['blockReason'] as String?,
      blockedAt: json['blockedAt'] == null
          ? null
          : DateTime.parse(json['blockedAt'] as String),
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$EvacuationEdgeToJson(_EvacuationEdge instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fromNodeId': instance.fromNodeId,
      'toNodeId': instance.toNodeId,
      'distance': instance.distance,
      'estimatedTimeSeconds': instance.estimatedTimeSeconds,
      'isWheelchairAccessible': instance.isWheelchairAccessible,
      'isEmergencyRoute': instance.isEmergencyRoute,
      'floor': instance.floor,
      'description': instance.description,
      'hazards': instance.hazards,
      'isBlocked': instance.isBlocked,
      'blockReason': instance.blockReason,
      'blockedAt': instance.blockedAt?.toIso8601String(),
      'metadata': instance.metadata,
    };

_EvacuationNode _$EvacuationNodeFromJson(Map<String, dynamic> json) =>
    _EvacuationNode(
      id: json['id'] as String,
      label: json['label'] as String,
      type: $enumDecode(_$EvacuationNodeTypeEnumMap, json['type']),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      floor: (json['floor'] as num?)?.toInt(),
      buildingId: json['buildingId'] as String?,
      roomId: json['roomId'] as String?,
      isExit: json['isExit'] as bool? ?? false,
      isAssemblyPoint: json['isAssemblyPoint'] as bool? ?? false,
      isShelter: json['isShelter'] as bool? ?? false,
      capacity: (json['capacity'] as num?)?.toInt(),
      currentOccupancy: (json['currentOccupancy'] as num?)?.toInt() ?? 0,
      accessibilityFeatures:
          (json['accessibilityFeatures'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      emergencyEquipment:
          (json['emergencyEquipment'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      connectedEdgeIds:
          (json['connectedEdgeIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$EvacuationNodeToJson(_EvacuationNode instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'type': _$EvacuationNodeTypeEnumMap[instance.type]!,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'floor': instance.floor,
      'buildingId': instance.buildingId,
      'roomId': instance.roomId,
      'isExit': instance.isExit,
      'isAssemblyPoint': instance.isAssemblyPoint,
      'isShelter': instance.isShelter,
      'capacity': instance.capacity,
      'currentOccupancy': instance.currentOccupancy,
      'accessibilityFeatures': instance.accessibilityFeatures,
      'emergencyEquipment': instance.emergencyEquipment,
      'connectedEdgeIds': instance.connectedEdgeIds,
      'metadata': instance.metadata,
    };

const _$EvacuationNodeTypeEnumMap = {
  EvacuationNodeType.entrance: 'entrance',
  EvacuationNodeType.stairwell: 'stairwell',
  EvacuationNodeType.corridor: 'corridor',
  EvacuationNodeType.intersection: 'intersection',
  EvacuationNodeType.assemblyPoint: 'assembly_point',
  EvacuationNodeType.shelter: 'shelter',
  EvacuationNodeType.emergencyExit: 'emergency_exit',
  EvacuationNodeType.fireExtinguisher: 'fire_extinguisher',
  EvacuationNodeType.firstAid: 'first_aid',
  EvacuationNodeType.other: 'other',
};

_EvacuationGraph _$EvacuationGraphFromJson(Map<String, dynamic> json) =>
    _EvacuationGraph(
      id: json['id'] as String,
      name: json['name'] as String,
      buildingId: json['buildingId'] as String?,
      version: (json['version'] as num).toInt(),
      nodes: (json['nodes'] as List<dynamic>)
          .map((e) => EvacuationNode.fromJson(e as Map<String, dynamic>))
          .toList(),
      edges: (json['edges'] as List<dynamic>)
          .map((e) => EvacuationEdge.fromJson(e as Map<String, dynamic>))
          .toList(),
      defaultAssemblyPointIds:
          (json['defaultAssemblyPointIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      defaultShelterIds:
          (json['defaultShelterIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      bounds: (json['bounds'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      dataSource: json['dataSource'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$EvacuationGraphToJson(_EvacuationGraph instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'buildingId': instance.buildingId,
      'version': instance.version,
      'nodes': instance.nodes,
      'edges': instance.edges,
      'defaultAssemblyPointIds': instance.defaultAssemblyPointIds,
      'defaultShelterIds': instance.defaultShelterIds,
      'bounds': instance.bounds,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'dataSource': instance.dataSource,
      'metadata': instance.metadata,
    };
