/// SAFENAV CAVITE - Location Model
///
/// Location data model for campus buildings, facilities, and points of interest.
library;

import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';
part 'location.g.dart';

/// Location category
enum LocationCategory {
  /// Academic building
  @JsonValue('building')
  building,

  /// Administrative office
  @JsonValue('office')
  office,

  /// General facility
  @JsonValue('facility')
  facility,

  /// Evacuation assembly zone
  @JsonValue('evacuation_zone')
  evacuationZone,

  /// Security guard post
  @JsonValue('guard_post')
  guardPost,

  /// Medical clinic
  @JsonValue('clinic')
  clinic,

  /// Library
  @JsonValue('library')
  library,

  /// Canteen/cafeteria
  @JsonValue('canteen')
  canteen,

  /// Campus entrance/exit
  @JsonValue('entrance')
  entrance,

  /// Stairwell
  @JsonValue('stairwell')
  stairwell,

  /// Elevator
  @JsonValue('elevator')
  elevator,

  /// Parking area
  @JsonValue('parking')
  parking,

  /// Open space/field
  @JsonValue('open_space')
  openSpace,

  /// Other
  @JsonValue('other')
  other;

  /// Display name
  String get displayName {
    switch (this) {
      case LocationCategory.building:
        return 'Building';
      case LocationCategory.office:
        return 'Office';
      case LocationCategory.facility:
        return 'Facility';
      case LocationCategory.evacuationZone:
        return 'Evacuation Zone';
      case LocationCategory.guardPost:
        return 'Guard Post';
      case LocationCategory.clinic:
        return 'Clinic';
      case LocationCategory.library:
        return 'Library';
      case LocationCategory.canteen:
        return 'Canteen';
      case LocationCategory.entrance:
        return 'Entrance';
      case LocationCategory.stairwell:
        return 'Stairwell';
      case LocationCategory.elevator:
        return 'Elevator';
      case LocationCategory.parking:
        return 'Parking';
      case LocationCategory.openSpace:
        return 'Open Space';
      case LocationCategory.other:
        return 'Other';
    }
  }

  /// Checks if this is an evacuation-related location
  bool get isEvacuationRelated =>
      this == LocationCategory.evacuationZone ||
      this == LocationCategory.guardPost ||
      this == LocationCategory.entrance ||
      this == LocationCategory.stairwell;

  /// Checks if this is a building
  bool get isBuilding =>
      this == LocationCategory.building ||
      this == LocationCategory.office ||
      this == LocationCategory.facility;
}

/// Location model representing a campus location
@freezed
abstract class Location with _$Location {
  const factory Location({
    /// Unique location ID
    required String id,

    /// Location name
    required String name,

    /// Location code (e.g., BLDG-A, BLDG-B)
    required String code,

    /// Category
    required LocationCategory category,

    /// Description
    String? description,

    /// Latitude
    required double latitude,

    /// Longitude
    required double longitude,

    /// Building floor (for multi-floor buildings)
    int? floor,

    /// Room number (for specific rooms)
    String? roomNumber,

    /// Whether this is an evacuation assembly point
    @Default(false) bool isEvacuationPoint,

    /// Whether this is a shelter location
    @Default(false) bool isShelter,

    /// Whether location has wheelchair access
    @Default(false) bool hasWheelchairAccess,

    /// Whether location has emergency equipment
    @Default(false) bool hasEmergencyEquipment,

    /// Emergency equipment details
    String? emergencyEquipmentDetails,

    /// Contact phone for this location
    String? contactPhone,

    /// Operating hours
    String? operatingHours,

    /// Image URL
    String? imageUrl,

    /// Tags for search/filtering
    @Default([]) List<String> tags,

    /// Creation timestamp
    required DateTime createdAt,

    /// Last update timestamp
    required DateTime updatedAt,

    /// Additional metadata
    @Default({}) Map<String, dynamic> metadata,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}

extension LocationExtensions on Location {
  /// Checks if location is on a specific floor
  bool isOnFloor(int floor) => this.floor == floor;

  /// Gets coordinates as a tuple
  (double lat, double lng) get coordinates => (latitude, longitude);

  /// Creates a copy with updated timestamp
  Location withUpdatedTimestamp(DateTime timestamp) {
    return copyWith(updatedAt: timestamp);
  }

  /// Distance to another location in meters
  double distanceTo(Location other) {
    // Using Haversine formula approximation
    const double earthRadius = 6371000; // meters
    final dLat = _toRadians(other.latitude - latitude);
    final dLng = _toRadians(other.longitude - longitude);
    final a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_toRadians(latitude)) *
            cos(_toRadians(other.latitude)) *
            sin(dLng / 2) *
            sin(dLng / 2);
    final c = 2 * asin(sqrt(a));
    return earthRadius * c;
  }

  double _toRadians(double degrees) => degrees * pi / 180;
}