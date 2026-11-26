// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency_contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmergencyContact _$EmergencyContactFromJson(Map<String, dynamic> json) =>
    _EmergencyContact(
      id: json['id'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String,
      relationship: const EmergencyContactRelationshipConverter().fromJson(
        json['relationship'] as String,
      ),
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String?,
      address: json['address'] as String?,
      isPrimary: json['isPrimary'] as bool? ?? true,
      notifyOnEmergency: json['notifyOnEmergency'] as bool? ?? false,
      notifyOnDrill: json['notifyOnDrill'] as bool? ?? false,
      canReceiveLocation: json['canReceiveLocation'] as bool? ?? false,
      notes: json['notes'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$EmergencyContactToJson(_EmergencyContact instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'relationship': const EmergencyContactRelationshipConverter().toJson(
        instance.relationship,
      ),
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'address': instance.address,
      'isPrimary': instance.isPrimary,
      'notifyOnEmergency': instance.notifyOnEmergency,
      'notifyOnDrill': instance.notifyOnDrill,
      'canReceiveLocation': instance.canReceiveLocation,
      'notes': instance.notes,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_MedicalInfo _$MedicalInfoFromJson(Map<String, dynamic> json) => _MedicalInfo(
  userId: json['userId'] as String,
  bloodType: json['bloodType'] as String?,
  allergies:
      (json['allergies'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  medications:
      (json['medications'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  conditions:
      (json['conditions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  implants:
      (json['implants'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  physicianName: json['physicianName'] as String?,
  physicianPhone: json['physicianPhone'] as String?,
  insuranceProvider: json['insuranceProvider'] as String?,
  insurancePolicyNumber: json['insurancePolicyNumber'] as String?,
  organDonorStatus: json['organDonorStatus'] as String?,
  advanceDirective: json['advanceDirective'] as String?,
  hasMedicalAlert: json['hasMedicalAlert'] as bool? ?? false,
  medicalAlertDetails: json['medicalAlertDetails'] as String?,
  emergencyNotes: json['emergencyNotes'] as String?,
  primaryPhysician: json['primaryPhysician'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$MedicalInfoToJson(_MedicalInfo instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'bloodType': instance.bloodType,
      'allergies': instance.allergies,
      'medications': instance.medications,
      'conditions': instance.conditions,
      'implants': instance.implants,
      'physicianName': instance.physicianName,
      'physicianPhone': instance.physicianPhone,
      'insuranceProvider': instance.insuranceProvider,
      'insurancePolicyNumber': instance.insurancePolicyNumber,
      'organDonorStatus': instance.organDonorStatus,
      'advanceDirective': instance.advanceDirective,
      'hasMedicalAlert': instance.hasMedicalAlert,
      'medicalAlertDetails': instance.medicalAlertDetails,
      'emergencyNotes': instance.emergencyNotes,
      'primaryPhysician': instance.primaryPhysician,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
