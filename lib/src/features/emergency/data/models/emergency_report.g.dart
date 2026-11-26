// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResponderInfo _$ResponderInfoFromJson(Map<String, dynamic> json) =>
    _ResponderInfo(
      id: json['id'] as String,
      name: json['name'] as String,
      role: json['role'] as String,
      phone: json['phone'] as String,
      vehicleId: json['vehicleId'] as String?,
      vehicleType: json['vehicleType'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      etaMinutes: (json['etaMinutes'] as num?)?.toInt(),
      notes: json['notes'] as String?,
      assignedAt: DateTime.parse(json['assignedAt'] as String),
      arrivedAt: json['arrivedAt'] == null
          ? null
          : DateTime.parse(json['arrivedAt'] as String),
    );

Map<String, dynamic> _$ResponderInfoToJson(_ResponderInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'role': instance.role,
      'phone': instance.phone,
      'vehicleId': instance.vehicleId,
      'vehicleType': instance.vehicleType,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'etaMinutes': instance.etaMinutes,
      'notes': instance.notes,
      'assignedAt': instance.assignedAt.toIso8601String(),
      'arrivedAt': instance.arrivedAt?.toIso8601String(),
    };

_EmergencyLocation _$EmergencyLocationFromJson(Map<String, dynamic> json) =>
    _EmergencyLocation(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      altitude: (json['altitude'] as num?)?.toDouble(),
      accuracy: (json['accuracy'] as num?)?.toDouble(),
      heading: (json['heading'] as num?)?.toDouble(),
      speed: (json['speed'] as num?)?.toDouble(),
      address: json['address'] as String?,
      buildingId: json['buildingId'] as String?,
      floorId: json['floorId'] as String?,
      roomId: json['roomId'] as String?,
      isIndoor: json['isIndoor'] as bool? ?? false,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$EmergencyLocationToJson(_EmergencyLocation instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'altitude': instance.altitude,
      'accuracy': instance.accuracy,
      'heading': instance.heading,
      'speed': instance.speed,
      'address': instance.address,
      'buildingId': instance.buildingId,
      'floorId': instance.floorId,
      'roomId': instance.roomId,
      'isIndoor': instance.isIndoor,
      'timestamp': instance.timestamp.toIso8601String(),
    };

_EmergencyReport _$EmergencyReportFromJson(Map<String, dynamic> json) =>
    _EmergencyReport(
      id: json['id'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      userPhone: json['userPhone'] as String,
      userLocation: EmergencyLocation.fromJson(
        json['userLocation'] as Map<String, dynamic>,
      ),
      type: emergencyTypeConverter.fromJson(json['type'] as String),
      status: emergencyStatusConverter.fromJson(json['status'] as String),
      description: json['description'] as String?,
      responder: json['responder'] == null
          ? null
          : ResponderInfo.fromJson(json['responder'] as Map<String, dynamic>),
      notes: (json['notes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      acknowledgedAt: json['acknowledgedAt'] == null
          ? null
          : DateTime.parse(json['acknowledgedAt'] as String),
      dispatchedAt: json['dispatchedAt'] == null
          ? null
          : DateTime.parse(json['dispatchedAt'] as String),
      arrivedAt: json['arrivedAt'] == null
          ? null
          : DateTime.parse(json['arrivedAt'] as String),
      resolvedAt: json['resolvedAt'] == null
          ? null
          : DateTime.parse(json['resolvedAt'] as String),
      cancelledAt: json['cancelledAt'] == null
          ? null
          : DateTime.parse(json['cancelledAt'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$EmergencyReportToJson(_EmergencyReport instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'userName': instance.userName,
      'userPhone': instance.userPhone,
      'userLocation': instance.userLocation,
      'type': emergencyTypeConverter.toJson(instance.type),
      'status': emergencyStatusConverter.toJson(instance.status),
      'description': instance.description,
      'responder': instance.responder,
      'notes': instance.notes,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'acknowledgedAt': instance.acknowledgedAt?.toIso8601String(),
      'dispatchedAt': instance.dispatchedAt?.toIso8601String(),
      'arrivedAt': instance.arrivedAt?.toIso8601String(),
      'resolvedAt': instance.resolvedAt?.toIso8601String(),
      'cancelledAt': instance.cancelledAt?.toIso8601String(),
      'metadata': instance.metadata,
    };

_CampusEmergencyContact _$CampusEmergencyContactFromJson(
  Map<String, dynamic> json,
) => _CampusEmergencyContact(
  id: json['id'] as String,
  name: json['name'] as String,
  phone: json['phone'] as String,
  role: json['role'] as String,
  department: json['department'] as String,
  location: json['location'] as String?,
  hours: json['hours'] as String?,
  priority: (json['priority'] as num?)?.toInt() ?? 0,
  isActive: json['isActive'] as bool? ?? true,
  isCampusSecurity: json['isCampusSecurity'] as bool? ?? true,
  services: (json['services'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  metadata: json['metadata'] as Map<String, dynamic>?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$CampusEmergencyContactToJson(
  _CampusEmergencyContact instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'phone': instance.phone,
  'role': instance.role,
  'department': instance.department,
  'location': instance.location,
  'hours': instance.hours,
  'priority': instance.priority,
  'isActive': instance.isActive,
  'isCampusSecurity': instance.isCampusSecurity,
  'services': instance.services,
  'metadata': instance.metadata,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};

_AssemblyPoint _$AssemblyPointFromJson(Map<String, dynamic> json) =>
    _AssemblyPoint(
      id: json['id'] as String,
      name: json['name'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      buildingId: json['buildingId'] as String?,
      capacity: (json['capacity'] as num?)?.toInt(),
      currentOccupancy: (json['currentOccupancy'] as num?)?.toInt() ?? 0,
      description: json['description'] as String?,
      accessibilityFeatures: (json['accessibilityFeatures'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isActive: json['isActive'] as bool? ?? true,
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$AssemblyPointToJson(_AssemblyPoint instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'buildingId': instance.buildingId,
      'capacity': instance.capacity,
      'currentOccupancy': instance.currentOccupancy,
      'description': instance.description,
      'accessibilityFeatures': instance.accessibilityFeatures,
      'isActive': instance.isActive,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_EvacuationRouteSummary _$EvacuationRouteSummaryFromJson(
  Map<String, dynamic> json,
) => _EvacuationRouteSummary(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  distanceMeters: (json['distanceMeters'] as num).toDouble(),
  estimatedTimeMinutes: (json['estimatedTimeMinutes'] as num).toInt(),
  pathCoordinates: latLngListConverter.fromJson(
    json['pathCoordinates'] as List<Map<String, dynamic>>,
  ),
  assemblyPointId: json['assemblyPointId'] as String,
  assemblyPointName: json['assemblyPointName'] as String?,
  isWheelchairAccessible: json['isWheelchairAccessible'] as bool? ?? true,
  isEmergencyRoute: json['isEmergencyRoute'] as bool? ?? false,
  hazards: (json['hazards'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$EvacuationRouteSummaryToJson(
  _EvacuationRouteSummary instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'distanceMeters': instance.distanceMeters,
  'estimatedTimeMinutes': instance.estimatedTimeMinutes,
  'pathCoordinates': latLngListConverter.toJson(instance.pathCoordinates),
  'assemblyPointId': instance.assemblyPointId,
  'assemblyPointName': instance.assemblyPointName,
  'isWheelchairAccessible': instance.isWheelchairAccessible,
  'isEmergencyRoute': instance.isEmergencyRoute,
  'hazards': instance.hazards,
  'metadata': instance.metadata,
};
