// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      category: $enumDecode(_$LocationCategoryEnumMap, json['category']),
      description: json['description'] as String?,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      floor: (json['floor'] as num?)?.toInt(),
      roomNumber: json['roomNumber'] as String?,
      isEvacuationPoint: json['isEvacuationPoint'] as bool? ?? false,
      isShelter: json['isShelter'] as bool? ?? false,
      hasWheelchairAccess: json['hasWheelchairAccess'] as bool? ?? false,
      hasEmergencyEquipment: json['hasEmergencyEquipment'] as bool? ?? false,
      emergencyEquipmentDetails: json['emergencyEquipmentDetails'] as String?,
      contactPhone: json['contactPhone'] as String?,
      operatingHours: json['operatingHours'] as String?,
      imageUrl: json['imageUrl'] as String?,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'category': _$LocationCategoryEnumMap[instance.category]!,
      'description': instance.description,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'floor': instance.floor,
      'roomNumber': instance.roomNumber,
      'isEvacuationPoint': instance.isEvacuationPoint,
      'isShelter': instance.isShelter,
      'hasWheelchairAccess': instance.hasWheelchairAccess,
      'hasEmergencyEquipment': instance.hasEmergencyEquipment,
      'emergencyEquipmentDetails': instance.emergencyEquipmentDetails,
      'contactPhone': instance.contactPhone,
      'operatingHours': instance.operatingHours,
      'imageUrl': instance.imageUrl,
      'tags': instance.tags,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'metadata': instance.metadata,
    };

const _$LocationCategoryEnumMap = {
  LocationCategory.building: 'building',
  LocationCategory.office: 'office',
  LocationCategory.facility: 'facility',
  LocationCategory.evacuationZone: 'evacuation_zone',
  LocationCategory.guardPost: 'guard_post',
  LocationCategory.clinic: 'clinic',
  LocationCategory.library: 'library',
  LocationCategory.canteen: 'canteen',
  LocationCategory.entrance: 'entrance',
  LocationCategory.stairwell: 'stairwell',
  LocationCategory.elevator: 'elevator',
  LocationCategory.parking: 'parking',
  LocationCategory.openSpace: 'open_space',
  LocationCategory.other: 'other',
};
