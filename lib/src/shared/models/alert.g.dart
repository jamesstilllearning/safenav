// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Alert _$AlertFromJson(Map<String, dynamic> json) => _Alert(
      id: json['id'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      type: $enumDecode(_$AlertTypeEnumMap, json['type']),
      severity: $enumDecode(_$AlertSeverityEnumMap, json['severity']),
      status: $enumDecodeNullable(_$AlertStatusEnumMap, json['status']) ??
          AlertStatus.active,
      locationId: json['locationId'] as String?,
      locationName: json['locationName'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      buildingId: json['buildingId'] as String?,
      floor: (json['floor'] as num?)?.toInt(),
      affectedArea: json['affectedArea'] as String?,
      createdBy: json['createdBy'] as String?,
      createdByRole: json['createdByRole'] as String?,
      isSystemGenerated: json['isSystemGenerated'] as bool? ?? false,
      isTest: json['isTest'] as bool? ?? false,
      instructions: json['instructions'] as String?,
      evacuationRouteId: json['evacuationRouteId'] as String?,
      assemblyPointId: json['assemblyPointId'] as String?,
      shelterId: json['shelterId'] as String?,
      relatedAlertIds: (json['relatedAlertIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      attachmentUrls: (json['attachmentUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      targetRoles: (json['targetRoles'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      targetBuildingIds: (json['targetBuildingIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
      acknowledgedBy: (json['acknowledgedBy'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      resolvedBy: json['resolvedBy'] as String?,
      resolutionNotes: json['resolutionNotes'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$AlertToJson(_Alert instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'message': instance.message,
      'type': _$AlertTypeEnumMap[instance.type]!,
      'severity': _$AlertSeverityEnumMap[instance.severity]!,
      'status': _$AlertStatusEnumMap[instance.status]!,
      'locationId': instance.locationId,
      'locationName': instance.locationName,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'buildingId': instance.buildingId,
      'floor': instance.floor,
      'affectedArea': instance.affectedArea,
      'createdBy': instance.createdBy,
      'createdByRole': instance.createdByRole,
      'isSystemGenerated': instance.isSystemGenerated,
      'isTest': instance.isTest,
      'instructions': instance.instructions,
      'evacuationRouteId': instance.evacuationRouteId,
      'assemblyPointId': instance.assemblyPointId,
      'shelterId': instance.shelterId,
      'relatedAlertIds': instance.relatedAlertIds,
      'attachmentUrls': instance.attachmentUrls,
      'tags': instance.tags,
      'targetRoles': instance.targetRoles,
      'targetBuildingIds': instance.targetBuildingIds,
      'expiresAt': instance.expiresAt?.toIso8601String(),
      'acknowledgedBy': instance.acknowledgedBy,
      'resolvedBy': instance.resolvedBy,
      'resolutionNotes': instance.resolutionNotes,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'metadata': instance.metadata,
    };

const _$AlertTypeEnumMap = {
  AlertType.fire: 'fire',
  AlertType.earthquake: 'earthquake',
  AlertType.flood: 'flood',
  AlertType.security: 'security',
  AlertType.medical: 'medical',
  AlertType.weather: 'weather',
  AlertType.infrastructure: 'infrastructure',
  AlertType.suspiciousActivity: 'suspicious_activity',
  AlertType.evacuation: 'evacuation',
  AlertType.lockdown: 'lockdown',
  AlertType.allClear: 'all_clear',
  AlertType.test: 'test',
  AlertType.other: 'other',
};

const _$AlertSeverityEnumMap = {
  AlertSeverity.info: 'info',
  AlertSeverity.warning: 'warning',
  AlertSeverity.critical: 'critical',
  AlertSeverity.emergency: 'emergency',
};

const _$AlertStatusEnumMap = {
  AlertStatus.active: 'active',
  AlertStatus.acknowledged: 'acknowledged',
  AlertStatus.resolved: 'resolved',
  AlertStatus.expired: 'expired',
};
