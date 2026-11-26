/// SAFENAV CAVITE - Emergency Contact Models
///
/// Data models for ICE (In Case of Emergency) contacts and medical information.
library;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'emergency_contact.freezed.dart';
part 'emergency_contact.g.dart';

/// Relationship type for emergency contacts
@freezed
abstract class EmergencyContactRelationship with _$EmergencyContactRelationship {
  const factory EmergencyContactRelationship.parent() = _Parent;
  const factory EmergencyContactRelationship.spouse() = _Spouse;
  const factory EmergencyContactRelationship.sibling() = _Sibling;
  const factory EmergencyContactRelationship.child() = _Child;
  const factory EmergencyContactRelationship.friend() = _Friend;
  const factory EmergencyContactRelationship.guardian() = _Guardian;
  const factory EmergencyContactRelationship.relative() = _Relative;
  const factory EmergencyContactRelationship.coworker() = _Coworker;
  const factory EmergencyContactRelationship.other() = _Other;
}

/// JSON converter for EmergencyContactRelationship
class EmergencyContactRelationshipConverter implements JsonConverter<EmergencyContactRelationship, String> {
  const EmergencyContactRelationshipConverter();

  @override
  EmergencyContactRelationship fromJson(String json) {
    return json.toEmergencyContactRelationship();
  }

  @override
  String toJson(EmergencyContactRelationship object) {
    return object.jsonName;
  }
}

/// Extension for EmergencyContactRelationship to provide JSON name
extension EmergencyContactRelationshipJsonName on EmergencyContactRelationship {
  String get jsonName {
    return when(
      parent: () => 'parent',
      spouse: () => 'spouse',
      sibling: () => 'sibling',
      child: () => 'child',
      friend: () => 'friend',
      guardian: () => 'guardian',
      relative: () => 'relative',
      coworker: () => 'coworker',
      other: () => 'other',
    );
  }
}

/// Emergency contact model (ICE contact)
@freezed
abstract class EmergencyContact with _$EmergencyContact {
  const EmergencyContact._();

  const factory EmergencyContact({
    required String id,
    required String userId,
    required String name,
    @EmergencyContactRelationshipConverter() required EmergencyContactRelationship relationship,
    required String phoneNumber,
    String? email,
    String? address,
    @Default(true) bool isPrimary,
    @Default(false) bool notifyOnEmergency,
    @Default(false) bool notifyOnDrill,
    @Default(false) bool canReceiveLocation,
    String? notes,
    Map<String, dynamic>? metadata,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _EmergencyContact;

  factory EmergencyContact.fromJson(Map<String, dynamic> json) =>
      _$EmergencyContactFromJson(json);

  /// Get display name with relationship
  String get displayName => '$name (${relationship.displayName})';

  /// Check if this contact should be notified for emergencies
  bool shouldNotifyForEmergency() => notifyOnEmergency;

  /// Check if this contact should be notified for drills
  bool shouldNotifyForDrill() => notifyOnDrill;
}

/// Medical information model
@freezed
abstract class MedicalInfo with _$MedicalInfo {
  const MedicalInfo._();

  const factory MedicalInfo({
    required String userId,
    String? bloodType,
    @Default([]) List<String> allergies,
    @Default([]) List<String> medications,
    @Default([]) List<String> conditions,
    @Default([]) List<String> implants,
    String? physicianName,
    String? physicianPhone,
    String? insuranceProvider,
    String? insurancePolicyNumber,
    String? organDonorStatus,
    String? advanceDirective,
    @Default(false) bool hasMedicalAlert,
    String? medicalAlertDetails,
    String? emergencyNotes,
    String? primaryPhysician,
    Map<String, dynamic>? metadata,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _MedicalInfo;

  factory MedicalInfo.fromJson(Map<String, dynamic> json) =>
      _$MedicalInfoFromJson(json);

  /// Create empty medical info for a user
  factory MedicalInfo.empty(String userId) {
    final now = DateTime.now();
    return MedicalInfo(
      userId: userId,
      createdAt: now,
      updatedAt: now,
      emergencyNotes: '',
      primaryPhysician: '',
      bloodType: null,
      allergies: [],
      medications: [],
      conditions: [],
      implants: [],
      physicianName: null,
      physicianPhone: null,
      insuranceProvider: null,
      insurancePolicyNumber: null,
      organDonorStatus: null,
      advanceDirective: null,
      hasMedicalAlert: false,
      medicalAlertDetails: null,
      metadata: null,
    );
  }

  /// Check if user has any medical conditions
  bool get hasConditions => conditions.isNotEmpty;

  /// Check if user has any allergies
  bool get hasAllergies => allergies.isNotEmpty;

  /// Check if user has any medications
  bool get hasMedications => medications.isNotEmpty;

  /// Get summary for emergency responders
  String get emergencySummary {
    final parts = <String>[];
    if (bloodType != null && bloodType!.isNotEmpty) {
      parts.add('Blood: $bloodType');
    }
    if (allergies.isNotEmpty) {
      parts.add('Allergies: ${allergies.join(', ')}');
    }
    if (conditions.isNotEmpty) {
      parts.add('Conditions: ${conditions.join(', ')}');
    }
    if (medications.isNotEmpty) {
      parts.add('Meds: ${medications.join(', ')}');
    }
    if (hasMedicalAlert && medicalAlertDetails != null) {
      parts.add('ALERT: $medicalAlertDetails');
    }
    return parts.join('; ');
  }
}

/// Extension for relationship display
extension EmergencyContactRelationshipDisplay on EmergencyContactRelationship {
  String get displayName {
    return when(
      parent: () => 'Parent',
      spouse: () => 'Spouse',
      sibling: () => 'Sibling',
      child: () => 'Child',
      friend: () => 'Friend',
      guardian: () => 'Guardian',
      relative: () => 'Relative',
      coworker: () => 'Coworker',
      other: () => 'Other',
    );
  }
}

/// Extension for string parsing
extension EmergencyContactRelationshipX on String {
  EmergencyContactRelationship toEmergencyContactRelationship() {
    switch (toLowerCase()) {
      case 'parent':
        return EmergencyContactRelationship.parent();
      case 'spouse':
        return EmergencyContactRelationship.spouse();
      case 'sibling':
        return EmergencyContactRelationship.sibling();
      case 'child':
        return EmergencyContactRelationship.child();
      case 'friend':
        return EmergencyContactRelationship.friend();
      case 'guardian':
        return EmergencyContactRelationship.guardian();
      case 'relative':
        return EmergencyContactRelationship.relative();
      case 'coworker':
        return EmergencyContactRelationship.coworker();
      default:
        return EmergencyContactRelationship.other();
    }
  }
}