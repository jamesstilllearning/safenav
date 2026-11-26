/// SAFENAV CAVITE - Emergency Report Models
///
/// Data models for SOS emergency reports and responder tracking.
library;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'emergency_report.freezed.dart';
part 'emergency_report.g.dart';

/// JSON converter for LatLng
class LatLngConverter implements JsonConverter<LatLng, Map<String, dynamic>> {
  const LatLngConverter();

  @override
  LatLng fromJson(Map<String, dynamic> json) {
    return LatLng(
      (json['latitude'] as num).toDouble(),
      (json['longitude'] as num).toDouble(),
    );
  }

  @override
  Map<String, dynamic> toJson(LatLng object) {
    return {
      'latitude': object.latitude,
      'longitude': object.longitude,
    };
  }
}

/// JSON converter for optional LatLng
class OptionalLatLngConverter implements JsonConverter<LatLng?, Map<String, dynamic>?> {
  const OptionalLatLngConverter();

  @override
  LatLng? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    return LatLng(
      (json['latitude'] as num).toDouble(),
      (json['longitude'] as num).toDouble(),
    );
  }

  @override
  Map<String, dynamic>? toJson(LatLng? object) {
    if (object == null) return null;
    return {
      'latitude': object.latitude,
      'longitude': object.longitude,
    };
  }
}

class LatLngListConverter implements JsonConverter<List<LatLng>, List<Map<String, dynamic>>> {
  const LatLngListConverter();

  @override
  List<LatLng> fromJson(List<Map<String, dynamic>> json) {
    return json.map((e) => LatLng(
      (e['latitude'] as num).toDouble(),
      (e['longitude'] as num).toDouble(),
    )).toList();
  }

  @override
  List<Map<String, dynamic>> toJson(List<LatLng> object) {
    return object.map((e) => {
      'latitude': e.latitude,
      'longitude': e.longitude,
    }).toList();
  }
}

/// JSON converter for EmergencyType
class EmergencyTypeConverter implements JsonConverter<EmergencyType, String> {
  const EmergencyTypeConverter();

  @override
  EmergencyType fromJson(String json) {
    switch (json) {
      case 'fire':
        return EmergencyType.fire();
      case 'medical':
        return EmergencyType.medical();
      case 'security':
        return EmergencyType.security();
      default:
        return EmergencyType.other();
    }
  }

  @override
  String toJson(EmergencyType object) => object.jsonName;
}

/// JSON converter for EmergencyStatus
class EmergencyStatusConverter implements JsonConverter<EmergencyStatus, String> {
  const EmergencyStatusConverter();

  @override
  EmergencyStatus fromJson(String json) {
    switch (json) {
      case 'pending':
        return EmergencyStatus.pending();
      case 'connecting':
        return EmergencyStatus.connecting();
      case 'acknowledged':
        return EmergencyStatus.acknowledged();
      case 'dispatched':
        return EmergencyStatus.dispatched();
      case 'arrived':
        return EmergencyStatus.arrived();
      case 'resolved':
        return EmergencyStatus.resolved();
      case 'cancelled':
        return EmergencyStatus.cancelled();
      case 'failed':
        return EmergencyStatus.failed();
      default:
        return EmergencyStatus.pending();
    }
  }

  @override
  String toJson(EmergencyStatus object) => object.jsonName;
}

/// Constant converter instances for use in @JsonKey
const emergencyTypeConverter = EmergencyTypeConverter();
const emergencyStatusConverter = EmergencyStatusConverter();
const latLngConverter = LatLngConverter();
const optionalLatLngConverter = OptionalLatLngConverter();
const latLngListConverter = LatLngListConverter();

/// Emergency type categories
@freezed
abstract class EmergencyType with _$EmergencyType {
  const factory EmergencyType.fire() = _Fire;
  const factory EmergencyType.medical() = _Medical;
  const factory EmergencyType.security() = _Security;
  const factory EmergencyType.other() = _Other;

  const EmergencyType._();

  String get displayName {
    return when(
      fire: () => 'Fire Emergency',
      medical: () => 'Medical Emergency',
      security: () => 'Security Incident',
      other: () => 'Other Emergency',
    );
  }

  String get jsonName {
    return when(
      fire: () => 'fire',
      medical: () => 'medical',
      security: () => 'security',
      other: () => 'other',
    );
  }
}

/// Emergency report status
@freezed
abstract class EmergencyStatus with _$EmergencyStatus {
  const factory EmergencyStatus.pending() = _Pending;
  const factory EmergencyStatus.connecting() = _Connecting;
  const factory EmergencyStatus.acknowledged() = _Acknowledged;
  const factory EmergencyStatus.dispatched() = _Dispatched;
  const factory EmergencyStatus.arrived() = _Arrived;
  const factory EmergencyStatus.resolved() = _Resolved;
  const factory EmergencyStatus.cancelled() = _Cancelled;
  const factory EmergencyStatus.failed() = _Failed;

  const EmergencyStatus._();

  String get displayName {
    return when(
      pending: () => 'Pending',
      connecting: () => 'Connecting...',
      acknowledged: () => 'Security Acknowledged',
      dispatched: () => 'Help Dispatched',
      arrived: () => 'Responder Arrived',
      resolved: () => 'Resolved',
      cancelled: () => 'Cancelled',
      failed: () => 'Failed',
    );
  }

  String get jsonName {
    return when(
      pending: () => 'pending',
      connecting: () => 'connecting',
      acknowledged: () => 'acknowledged',
      dispatched: () => 'dispatched',
      arrived: () => 'arrived',
      resolved: () => 'resolved',
      cancelled: () => 'cancelled',
      failed: () => 'failed',
    );
  }

  int get priority {
    return when(
      pending: () => 0,
      connecting: () => 1,
      acknowledged: () => 2,
      dispatched: () => 3,
      arrived: () => 4,
      resolved: () => 5,
      cancelled: () => -1,
      failed: () => -2,
    );
  }

  bool get isActive {
    return when(
      pending: () => true,
      connecting: () => true,
      acknowledged: () => true,
      dispatched: () => true,
      arrived: () => true,
      resolved: () => false,
      cancelled: () => false,
      failed: () => false,
    );
  }

  bool get canCancel {
    return when(
      pending: () => true,
      connecting: () => true,
      acknowledged: () => false,
      dispatched: () => false,
      arrived: () => false,
      resolved: () => false,
      cancelled: () => false,
      failed: () => true,
    );
  }

  factory EmergencyStatus.fromJson(String json) {
    switch (json) {
      case 'pending':
        return EmergencyStatus.pending();
      case 'connecting':
        return EmergencyStatus.connecting();
      case 'acknowledged':
        return EmergencyStatus.acknowledged();
      case 'dispatched':
        return EmergencyStatus.dispatched();
      case 'arrived':
        return EmergencyStatus.arrived();
      case 'resolved':
        return EmergencyStatus.resolved();
      case 'cancelled':
        return EmergencyStatus.cancelled();
      case 'failed':
        return EmergencyStatus.failed();
      default:
        return EmergencyStatus.pending();
    }
  }
}

/// Responder information
@freezed
abstract class ResponderInfo with _$ResponderInfo {
  const ResponderInfo._();

  const factory ResponderInfo({
    required String id,
    required String name,
    required String role,
    required String phone,
    String? vehicleId,
    String? vehicleType,
    // Using separate lat/lng fields for JSON serialization compatibility
    double? latitude,
    double? longitude,
    int? etaMinutes,
    String? notes,
    required DateTime assignedAt,
    DateTime? arrivedAt,
  }) = _ResponderInfo;

  factory ResponderInfo.fromJson(Map<String, dynamic> json) =>
      _$ResponderInfoFromJson(json);

  /// Get location as LatLng if available
  LatLng? get currentLocation {
    if (latitude != null && longitude != null) {
      return LatLng(latitude!, longitude!);
    }
    return null;
  }
}

/// User location at time of emergency
@freezed
abstract class EmergencyLocation with _$EmergencyLocation {
  const EmergencyLocation._();

  const factory EmergencyLocation({
    required double latitude,
    required double longitude,
    double? altitude,
    double? accuracy,
    double? heading,
    double? speed,
    String? address,
    String? buildingId,
    String? floorId,
    String? roomId,
    @Default(false) bool isIndoor,
    required DateTime timestamp,
  }) = _EmergencyLocation;

  factory EmergencyLocation.fromJson(Map<String, dynamic> json) =>
      _$EmergencyLocationFromJson(json);

  LatLng get latLng => LatLng(latitude, longitude);
}

/// Emergency report model
@freezed
abstract class EmergencyReport with _$EmergencyReport {
  const EmergencyReport._();

  const factory EmergencyReport({
    required String id,
    required String userId,
    required String userName,
    required String userPhone,
    required EmergencyLocation userLocation,
    @emergencyTypeConverter required EmergencyType type,
    @emergencyStatusConverter required EmergencyStatus status,
    String? description,
    ResponderInfo? responder,
    List<String>? notes,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? acknowledgedAt,
    DateTime? dispatchedAt,
    DateTime? arrivedAt,
    DateTime? resolvedAt,
    DateTime? cancelledAt,
    Map<String, dynamic>? metadata,
  }) = _EmergencyReport;

  factory EmergencyReport.fromJson(Map<String, dynamic> json) =>
      _$EmergencyReportFromJson(json);

  /// Creates a new emergency report with default values
  factory EmergencyReport.create({
    required String id,
    required String userId,
    required String userName,
    required String userPhone,
    required EmergencyLocation userLocation,
    required EmergencyType type,
    String? description,
  }) {
    final now = DateTime.now();
    return EmergencyReport(
      id: id,
      userId: userId,
      userName: userName,
      userPhone: userPhone,
      userLocation: userLocation,
      type: type,
      status: EmergencyStatus.pending(),
      description: description,
      notes: [],
      createdAt: now,
      updatedAt: now,
    );
  }

  /// Updates status with timestamp
  EmergencyReport withStatus(EmergencyStatus newStatus) {
    final now = DateTime.now();
    return copyWith(
      status: newStatus,
      updatedAt: now,
      acknowledgedAt: newStatus == EmergencyStatus.acknowledged() ? now : acknowledgedAt,
      dispatchedAt: newStatus == EmergencyStatus.dispatched() ? now : dispatchedAt,
      arrivedAt: newStatus == EmergencyStatus.arrived() ? now : arrivedAt,
      resolvedAt: newStatus == EmergencyStatus.resolved() ? now : resolvedAt,
      cancelledAt: newStatus == EmergencyStatus.cancelled() ? now : cancelledAt,
    );
  }

  /// Adds a note to the report
  EmergencyReport addNote(String note) {
    final updatedNotes = <String>[...(notes ?? []), note];
    return copyWith(notes: updatedNotes, updatedAt: DateTime.now());
  }

  /// Assigns a responder
  EmergencyReport assignResponder(ResponderInfo responder) {
    return copyWith(
      responder: responder,
      status: EmergencyStatus.dispatched(),
      updatedAt: DateTime.now(),
    );
  }

  /// Checks if report is in active state
  bool get isActive => status.isActive;

  /// Checks if report can be cancelled by user
  bool get canCancel => status.canCancel;

  /// Gets elapsed time since creation
  Duration get elapsedTime => DateTime.now().difference(createdAt);

  /// Gets estimated time until responder arrival
  Duration? get estimatedArrivalTime {
    if (responder?.etaMinutes != null) {
      return Duration(minutes: responder!.etaMinutes!);
    }
    return null;
  }
}

/// Emergency contact for campus services (not ICE contacts)
@freezed
abstract class CampusEmergencyContact with _$CampusEmergencyContact {
  const factory CampusEmergencyContact({
    required String id,
    required String name,
    required String phone,
    required String role,
    required String department,
    String? location,
    String? hours,
    @Default(0) int priority,
    @Default(true) bool isActive,
    @Default(true) bool isCampusSecurity,
    List<String>? services,
    Map<String, dynamic>? metadata,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _CampusEmergencyContact;

  factory CampusEmergencyContact.fromJson(Map<String, dynamic> json) =>
      _$CampusEmergencyContactFromJson(json);

  /// Creates a default campus security contact
  factory CampusEmergencyContact.campusSecurity({
    required String id,
    required String phone,
    String? location,
  }) {
    final now = DateTime.now();
    return CampusEmergencyContact(
      id: id,
      name: 'Campus Security',
      phone: phone,
      role: '24/7 Campus Security',
      department: 'Security Office',
      location: location,
      hours: '24/7',
      priority: 1,
      isCampusSecurity: true,
      services: ['Emergency Response', 'Patrol', 'Incident Reporting'],
      createdAt: now,
      updatedAt: now,
    );
  }

  /// Creates a default medical clinic contact
  factory CampusEmergencyContact.medicalClinic({
    required String id,
    required String phone,
    String? location,
    String? hours,
  }) {
    final now = DateTime.now();
    return CampusEmergencyContact(
      id: id,
      name: 'Medical Clinic',
      phone: phone,
      role: 'Campus Health Center',
      department: 'Health Services',
      location: location,
      hours: hours ?? 'Mon-Fri 8AM-5PM',
      priority: 2,
      services: ['First Aid', 'Medical Consultation', 'Emergency Care'],
      createdAt: now,
      updatedAt: now,
    );
  }

  /// Creates a default fire department contact
  factory CampusEmergencyContact.fireDepartment({
    required String id,
    required String phone,
    String? location,
  }) {
    final now = DateTime.now();
    return CampusEmergencyContact(
      id: id,
      name: 'Fire Department',
      phone: phone,
      role: 'Cavite Fire Station',
      department: 'Fire Protection',
      location: location,
      hours: '24/7',
      priority: 3,
      services: ['Fire Suppression', 'Rescue', 'Hazmat Response'],
      createdAt: now,
      updatedAt: now,
    );
  }

  /// Creates a default police contact
  factory CampusEmergencyContact.police({
    required String id,
    required String phone,
    String? location,
  }) {
    final now = DateTime.now();
    return CampusEmergencyContact(
      id: id,
      name: 'Police',
      phone: phone,
      role: 'Cavite Police Station',
      department: 'Law Enforcement',
      location: location,
      hours: '24/7',
      priority: 4,
      services: ['Law Enforcement', 'Crime Response', 'Traffic Control'],
      createdAt: now,
      updatedAt: now,
    );
  }

  /// Creates a default admin office contact
  factory CampusEmergencyContact.adminOffice({
    required String id,
    required String phone,
    String? location,
    String? hours,
  }) {
    final now = DateTime.now();
    return CampusEmergencyContact(
      id: id,
      name: 'Admin Office',
      phone: phone,
      role: 'Campus Administration',
      department: 'Administration',
      location: location,
      hours: hours ?? 'Mon-Fri 8AM-5PM',
      priority: 5,
      services: ['General Inquiries', 'Administrative Support'],
      createdAt: now,
      updatedAt: now,
    );
  }
}

/// Assembly point with location and capacity
@freezed
abstract class AssemblyPoint with _$AssemblyPoint {
  const AssemblyPoint._();

  const factory AssemblyPoint({
    required String id,
    required String name,
    required double latitude,
    required double longitude,
    String? buildingId,
    int? capacity,
    @Default(0) int currentOccupancy,
    String? description,
    List<String>? accessibilityFeatures,
    @Default(true) bool isActive,
    Map<String, dynamic>? metadata,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _AssemblyPoint;

  factory AssemblyPoint.fromJson(Map<String, dynamic> json) =>
      _$AssemblyPointFromJson(json);

  LatLng get latLng => LatLng(latitude, longitude);

  int get availableCapacity => (capacity ?? 0) - currentOccupancy;

  bool get hasCapacity => availableCapacity > 0;
}

/// Evacuation route summary for display
@freezed
abstract class EvacuationRouteSummary with _$EvacuationRouteSummary {
  const EvacuationRouteSummary._();

  const factory EvacuationRouteSummary({
    required String id,
    required String name,
    required String description,
    required double distanceMeters,
    required int estimatedTimeMinutes,
    @latLngListConverter required List<LatLng> pathCoordinates,
    required String assemblyPointId,
    String? assemblyPointName,
    @Default(true) bool isWheelchairAccessible,
    @Default(false) bool isEmergencyRoute,
    List<String>? hazards,
    Map<String, dynamic>? metadata,
  }) = _EvacuationRouteSummary;

  factory EvacuationRouteSummary.fromJson(Map<String, dynamic> json) =>
      _$EvacuationRouteSummaryFromJson(json);
}