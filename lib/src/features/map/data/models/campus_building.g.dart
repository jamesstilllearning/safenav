// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campus_building.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CampusBuilding _$CampusBuildingFromJson(Map<String, dynamic> json) =>
    _CampusBuilding(
      id: json['id'] as String,
      osmWayId: (json['osmWayId'] as num).toInt(),
      name: json['name'] as String,
      buildingType: json['buildingType'] as String,
      category: const BuildingCategoryConverter().fromJson(
        json['category'] as String,
      ),
      description: json['description'] as String,
      source: json['source'] as String,
      sourceDate: json['sourceDate'] as String,
      verificationStatus: json['verificationStatus'] as String,
      polygon: (json['polygon'] as List<dynamic>)
          .map((e) => LatLng.fromJson(e as Map<String, dynamic>))
          .toList(),
      centroid: LatLng.fromJson(json['centroid'] as Map<String, dynamic>),
      areaSqMeters: (json['areaSqMeters'] as num?)?.toDouble(),
      floors: (json['floors'] as num?)?.toInt(),
      address: json['address'] as String?,
      additionalTags: json['additionalTags'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CampusBuildingToJson(_CampusBuilding instance) =>
    <String, dynamic>{
      'id': instance.id,
      'osmWayId': instance.osmWayId,
      'name': instance.name,
      'buildingType': instance.buildingType,
      'category': const BuildingCategoryConverter().toJson(instance.category),
      'description': instance.description,
      'source': instance.source,
      'sourceDate': instance.sourceDate,
      'verificationStatus': instance.verificationStatus,
      'polygon': instance.polygon,
      'centroid': instance.centroid,
      'areaSqMeters': instance.areaSqMeters,
      'floors': instance.floors,
      'address': instance.address,
      'additionalTags': instance.additionalTags,
    };
