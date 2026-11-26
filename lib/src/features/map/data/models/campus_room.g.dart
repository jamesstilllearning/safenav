// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campus_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NormalizedPolygon _$NormalizedPolygonFromJson(Map<String, dynamic> json) =>
    _NormalizedPolygon(
      coordinates: (json['coordinates'] as List<dynamic>)
          .map(
            (e) =>
                (e as List<dynamic>).map((e) => (e as num).toDouble()).toList(),
          )
          .toList(),
      centerX: (json['centerX'] as num).toDouble(),
      centerY: (json['centerY'] as num).toDouble(),
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      coordinateSpace: json['coordinateSpace'] as String? ?? 'normalized_image',
      type: json['type'] as String? ?? 'Polygon',
    );

Map<String, dynamic> _$NormalizedPolygonToJson(_NormalizedPolygon instance) =>
    <String, dynamic>{
      'coordinates': instance.coordinates,
      'centerX': instance.centerX,
      'centerY': instance.centerY,
      'x': instance.x,
      'y': instance.y,
      'width': instance.width,
      'height': instance.height,
      'coordinateSpace': instance.coordinateSpace,
      'type': instance.type,
    };

_NormalizedBounds _$NormalizedBoundsFromJson(Map<String, dynamic> json) =>
    _NormalizedBounds(
      minX: (json['minX'] as num).toDouble(),
      minY: (json['minY'] as num).toDouble(),
      maxX: (json['maxX'] as num).toDouble(),
      maxY: (json['maxY'] as num).toDouble(),
    );

Map<String, dynamic> _$NormalizedBoundsToJson(_NormalizedBounds instance) =>
    <String, dynamic>{
      'minX': instance.minX,
      'minY': instance.minY,
      'maxX': instance.maxX,
      'maxY': instance.maxY,
    };

_SourcePixelBBox _$SourcePixelBBoxFromJson(Map<String, dynamic> json) =>
    _SourcePixelBBox(
      x: (json['x'] as num).toInt(),
      y: (json['y'] as num).toInt(),
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
    );

Map<String, dynamic> _$SourcePixelBBoxToJson(_SourcePixelBBox instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'width': instance.width,
      'height': instance.height,
    };

_RoomGeometry _$RoomGeometryFromJson(Map<String, dynamic> json) =>
    _RoomGeometry(
      normalized: NormalizedPolygon.fromJson(
        json['normalized'] as Map<String, dynamic>,
      ),
      latLng: json['latLng'] == null
          ? null
          : LatLng.fromJson(json['latLng'] as Map<String, dynamic>),
      centroid: json['centroid'] == null
          ? null
          : LatLng.fromJson(json['centroid'] as Map<String, dynamic>),
      polygon: (json['polygon'] as List<dynamic>?)
          ?.map((e) => LatLng.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoomGeometryToJson(_RoomGeometry instance) =>
    <String, dynamic>{
      'normalized': instance.normalized,
      'latLng': instance.latLng,
      'centroid': instance.centroid,
      'polygon': instance.polygon,
    };

_CampusRoom _$CampusRoomFromJson(Map<String, dynamic> json) => _CampusRoom(
  id: json['id'] as String,
  name: json['name'] as String,
  originalLabel: json['originalLabel'] as String,
  category: const RoomCategoryConverter().fromJson(json['category'] as Object),
  buildingId: json['buildingId'] as String,
  floorId: json['floorId'] as String,
  floorLevel: const FloorLevelConverter().fromJson(json['floorLevel']),
  confidence: const DataConfidenceConverter().fromJson(
    json['confidence'] as Object,
  ),
  notes: json['notes'] as String?,
  geometry: RoomGeometry.fromJson(json['geometry'] as Map<String, dynamic>),
  sourcePixelBBox: SourcePixelBBox.fromJson(
    json['sourcePixelBBox'] as Map<String, dynamic>,
  ),
  approximate: json['approximate'] as bool? ?? true,
  geometryConfidence: const GeometryConfidenceConverter().fromJson(
    json['geometryConfidence'] as Object,
  ),
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$CampusRoomToJson(_CampusRoom instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'originalLabel': instance.originalLabel,
      'category': const RoomCategoryConverter().toJson(instance.category),
      'buildingId': instance.buildingId,
      'floorId': instance.floorId,
      'floorLevel': const FloorLevelConverter().toJson(instance.floorLevel),
      'confidence': const DataConfidenceConverter().toJson(instance.confidence),
      'notes': instance.notes,
      'geometry': instance.geometry,
      'sourcePixelBBox': instance.sourcePixelBBox,
      'approximate': instance.approximate,
      'geometryConfidence': const GeometryConfidenceConverter().toJson(
        instance.geometryConfidence,
      ),
      'metadata': instance.metadata,
    };

_CampusBuildingReference _$CampusBuildingReferenceFromJson(
  Map<String, dynamic> json,
) => _CampusBuildingReference(
  id: json['id'] as String,
  name: json['name'] as String,
  floors: (json['floors'] as List<dynamic>)
      .map((e) => CampusFloor.fromJson(e as Map<String, dynamic>))
      .toList(),
  roomCount: (json['roomCount'] as num).toInt(),
  roomsByCategory: (json['roomsByCategory'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, (e as num).toInt()),
  ),
  centroid: json['centroid'] == null
      ? null
      : LatLng.fromJson(json['centroid'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CampusBuildingReferenceToJson(
  _CampusBuildingReference instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'floors': instance.floors,
  'roomCount': instance.roomCount,
  'roomsByCategory': instance.roomsByCategory,
  'centroid': instance.centroid,
};

_CampusFloor _$CampusFloorFromJson(Map<String, dynamic> json) => _CampusFloor(
  id: json['id'] as String,
  name: json['name'] as String,
  level: const FloorLevelConverter().fromJson(json['level']),
  roomCount: (json['roomCount'] as num).toInt(),
  roomIds: (json['roomIds'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$CampusFloorToJson(_CampusFloor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'level': const FloorLevelConverter().toJson(instance.level),
      'roomCount': instance.roomCount,
      'roomIds': instance.roomIds,
    };
