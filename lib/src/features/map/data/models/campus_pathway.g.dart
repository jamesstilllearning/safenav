// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campus_pathway.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CampusPathway _$CampusPathwayFromJson(Map<String, dynamic> json) =>
    _CampusPathway(
      id: json['id'] as String,
      name: json['name'] as String,
      highway: json['highway'] as String,
      surface: json['surface'] as String,
      width: (json['width'] as num).toDouble(),
      category: const PathwayCategoryConverter().fromJson(
        json['category'] as String,
      ),
      description: json['description'] as String,
      source: json['source'] as String,
      verificationStatus: json['verificationStatus'] as String,
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => LatLng.fromJson(e as Map<String, dynamic>))
          .toList(),
      geometryType: json['geometryType'] as String?,
      capacity: (json['capacity'] as num?)?.toInt(),
      additionalTags: json['additionalTags'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CampusPathwayToJson(_CampusPathway instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'highway': instance.highway,
      'surface': instance.surface,
      'width': instance.width,
      'category': const PathwayCategoryConverter().toJson(instance.category),
      'description': instance.description,
      'source': instance.source,
      'verificationStatus': instance.verificationStatus,
      'coordinates': instance.coordinates,
      'geometryType': instance.geometryType,
      'capacity': instance.capacity,
      'additionalTags': instance.additionalTags,
    };
