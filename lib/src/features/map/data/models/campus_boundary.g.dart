// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campus_boundary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CampusBoundaryImpl _$$CampusBoundaryImplFromJson(Map<String, dynamic> json) =>
    _$CampusBoundaryImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      shortName: json['shortName'] as String,
      amenity: json['amenity'] as String,
      city: json['city'] as String,
      street: json['street'] as String,
      wikidata: json['wikidata'] as String?,
      osmRelationId: (json['osmRelationId'] as num).toInt(),
      source: json['source'] as String,
      sourceDate: json['sourceDate'] as String,
      verificationStatus: json['verificationStatus'] as String,
      description: json['description'] as String,
      polygon: (json['polygon'] as List<dynamic>)
          .map((e) => LatLng.fromJson(e as Map<String, dynamic>))
          .toList(),
      centroid: json['centroid'] == null
          ? null
          : LatLng.fromJson(json['centroid'] as Map<String, dynamic>),
      areaSqMeters: (json['areaSqMeters'] as num?)?.toDouble(),
      additionalTags: json['additionalTags'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$CampusBoundaryImplToJson(
        _$CampusBoundaryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'shortName': instance.shortName,
      'amenity': instance.amenity,
      'city': instance.city,
      'street': instance.street,
      'wikidata': instance.wikidata,
      'osmRelationId': instance.osmRelationId,
      'source': instance.source,
      'sourceDate': instance.sourceDate,
      'verificationStatus': instance.verificationStatus,
      'description': instance.description,
      'polygon': instance.polygon,
      'centroid': instance.centroid,
      'areaSqMeters': instance.areaSqMeters,
      'additionalTags': instance.additionalTags,
    };
