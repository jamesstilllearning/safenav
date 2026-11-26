// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campus_map_parser_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CampusReferencePoints _$CampusReferencePointsFromJson(
  Map<String, dynamic> json,
) => _CampusReferencePoints(
  topLeftLat: (json['topLeftLat'] as num).toDouble(),
  topLeftLng: (json['topLeftLng'] as num).toDouble(),
  topRightLat: (json['topRightLat'] as num).toDouble(),
  topRightLng: (json['topRightLng'] as num).toDouble(),
  bottomLeftLat: (json['bottomLeftLat'] as num).toDouble(),
  bottomLeftLng: (json['bottomLeftLng'] as num).toDouble(),
  bottomRightLat: (json['bottomRightLat'] as num).toDouble(),
  bottomRightLng: (json['bottomRightLng'] as num).toDouble(),
  imageWidth: (json['imageWidth'] as num).toDouble(),
  imageHeight: (json['imageHeight'] as num).toDouble(),
  source: json['source'] as String? ?? 'EARIST Cavite Campus Map',
  calibratedAt: json['calibratedAt'] == null
      ? null
      : DateTime.parse(json['calibratedAt'] as String),
);

Map<String, dynamic> _$CampusReferencePointsToJson(
  _CampusReferencePoints instance,
) => <String, dynamic>{
  'topLeftLat': instance.topLeftLat,
  'topLeftLng': instance.topLeftLng,
  'topRightLat': instance.topRightLat,
  'topRightLng': instance.topRightLng,
  'bottomLeftLat': instance.bottomLeftLat,
  'bottomLeftLng': instance.bottomLeftLng,
  'bottomRightLat': instance.bottomRightLat,
  'bottomRightLng': instance.bottomRightLng,
  'imageWidth': instance.imageWidth,
  'imageHeight': instance.imageHeight,
  'source': instance.source,
  'calibratedAt': instance.calibratedAt?.toIso8601String(),
};

_RoomSearchFilter _$RoomSearchFilterFromJson(Map<String, dynamic> json) =>
    _RoomSearchFilter(
      query: json['query'] as String?,
      buildingId: json['buildingId'] as String?,
      floorId: json['floorId'] as String?,
      category: _$JsonConverterFromJson<Object, RoomCategory>(
        json['category'],
        const RoomCategoryConverter().fromJson,
      ),
      minConfidence: _$JsonConverterFromJson<Object, DataConfidence>(
        json['minConfidence'],
        const DataConfidenceConverter().fromJson,
      ),
      navigableOnly: json['navigableOnly'] as bool?,
      facilityOnly: json['facilityOnly'] as bool?,
    );

Map<String, dynamic> _$RoomSearchFilterToJson(_RoomSearchFilter instance) =>
    <String, dynamic>{
      'query': instance.query,
      'buildingId': instance.buildingId,
      'floorId': instance.floorId,
      'category': _$JsonConverterToJson<Object, RoomCategory>(
        instance.category,
        const RoomCategoryConverter().toJson,
      ),
      'minConfidence': _$JsonConverterToJson<Object, DataConfidence>(
        instance.minConfidence,
        const DataConfidenceConverter().toJson,
      ),
      'navigableOnly': instance.navigableOnly,
      'facilityOnly': instance.facilityOnly,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);

_RoomSearchResult _$RoomSearchResultFromJson(Map<String, dynamic> json) =>
    _RoomSearchResult(
      rooms: (json['rooms'] as List<dynamic>)
          .map((e) => CampusRoom.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: (json['totalCount'] as num).toInt(),
      filter: RoomSearchFilter.fromJson(json['filter'] as Map<String, dynamic>),
      page: (json['page'] as num?)?.toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RoomSearchResultToJson(_RoomSearchResult instance) =>
    <String, dynamic>{
      'rooms': instance.rooms,
      'totalCount': instance.totalCount,
      'filter': instance.filter,
      'page': instance.page,
      'pageSize': instance.pageSize,
    };
