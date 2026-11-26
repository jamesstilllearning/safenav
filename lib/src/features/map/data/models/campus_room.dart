/// SAFENAV CAVITE - Campus Room/Facility Model
///
/// Parsed from EARIST_Cavite_Interactive_Campus_Map.html DATA array.
/// Represents individual rooms, facilities, and spaces within campus buildings.
library;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'campus_room.freezed.dart';
part 'campus_room.g.dart';

/// Category of campus rooms/facilities for filtering and styling
@freezed
abstract class RoomCategory with _$RoomCategory {
  const factory RoomCategory.room() = _Room;
  const factory RoomCategory.restroom() = _Restroom;
  const factory RoomCategory.office() = _Office;
  const factory RoomCategory.facility() = _Facility;
  const factory RoomCategory.canteen() = _Canteen;
  const factory RoomCategory.hallway() = _Hallway;
  const factory RoomCategory.laboratory() = _Laboratory;
  const factory RoomCategory.library() = _Library;
  const factory RoomCategory.parking() = _Parking;
  const factory RoomCategory.sportsFacility() = _SportsFacility;
  const factory RoomCategory.stage() = _Stage;
  const factory RoomCategory.staircase() = _Staircase;
  const factory RoomCategory.storage() = _Storage;
  const factory RoomCategory.unresolvedMapAnnotation() = _UnresolvedMapAnnotation;
  const factory RoomCategory.unresolvedSpace() = _UnresolvedSpace;
  const factory RoomCategory.other() = _Other;
  // Safety & Emergency categories
  const factory RoomCategory.emergencyExit() = _EmergencyExit;
  const factory RoomCategory.assemblyPoint() = _AssemblyPoint;
  const factory RoomCategory.medicalFacility() = _MedicalFacility;
  const factory RoomCategory.securityOffice() = _SecurityOffice;
}

/// JSON converter for RoomCategory (freezed union - tagged format)
class RoomCategoryConverter implements JsonConverter<RoomCategory, Object> {
  const RoomCategoryConverter();

  @override
  RoomCategory fromJson(Object json) {
    if (json is Map<String, dynamic>) {
      if (json.containsKey('room')) return RoomCategory.room();
      if (json.containsKey('restroom')) return RoomCategory.restroom();
      if (json.containsKey('office')) return RoomCategory.office();
      if (json.containsKey('facility')) return RoomCategory.facility();
      if (json.containsKey('canteen')) return RoomCategory.canteen();
      if (json.containsKey('hallway')) return RoomCategory.hallway();
      if (json.containsKey('laboratory')) return RoomCategory.laboratory();
      if (json.containsKey('library')) return RoomCategory.library();
      if (json.containsKey('parking')) return RoomCategory.parking();
      if (json.containsKey('sportsFacility')) return RoomCategory.sportsFacility();
      if (json.containsKey('stage')) return RoomCategory.stage();
      if (json.containsKey('staircase')) return RoomCategory.staircase();
      if (json.containsKey('storage')) return RoomCategory.storage();
      if (json.containsKey('unresolvedMapAnnotation')) return RoomCategory.unresolvedMapAnnotation();
      if (json.containsKey('unresolvedSpace')) return RoomCategory.unresolvedSpace();
      if (json.containsKey('other')) return RoomCategory.other();
      // Safety & Emergency categories
      if (json.containsKey('emergencyExit')) return RoomCategory.emergencyExit();
      if (json.containsKey('assemblyPoint')) return RoomCategory.assemblyPoint();
      if (json.containsKey('medicalFacility')) return RoomCategory.medicalFacility();
      if (json.containsKey('securityOffice')) return RoomCategory.securityOffice();
    }
    // Fallback for string format (legacy)
    if (json is String) {
      return json.toRoomCategory();
    }
    return RoomCategory.other();
  }

  @override
  Object toJson(RoomCategory object) {
    return object.when(
      room: () => {'room': {}},
      restroom: () => {'restroom': {}},
      office: () => {'office': {}},
      facility: () => {'facility': {}},
      canteen: () => {'canteen': {}},
      hallway: () => {'hallway': {}},
      laboratory: () => {'laboratory': {}},
      library: () => {'library': {}},
      parking: () => {'parking': {}},
      sportsFacility: () => {'sportsFacility': {}},
      stage: () => {'stage': {}},
      staircase: () => {'staircase': {}},
      storage: () => {'storage': {}},
      unresolvedMapAnnotation: () => {'unresolvedMapAnnotation': {}},
      unresolvedSpace: () => {'unresolvedSpace': {}},
      other: () => {'other': {}},
      // Safety & Emergency categories
      emergencyExit: () => {'emergencyExit': {}},
      assemblyPoint: () => {'assemblyPoint': {}},
      medicalFacility: () => {'medicalFacility': {}},
      securityOffice: () => {'securityOffice': {}},
    );
  }
}

/// Confidence level for room data
@freezed
abstract class DataConfidence with _$DataConfidence {
  const factory DataConfidence.high() = _High;
  const factory DataConfidence.medium() = _Medium;
  const factory DataConfidence.low() = _Low;
}

/// JSON converter for DataConfidence (freezed union - tagged format)
class DataConfidenceConverter implements JsonConverter<DataConfidence, Object> {
  const DataConfidenceConverter();

  @override
  DataConfidence fromJson(Object json) {
    if (json is Map<String, dynamic>) {
      if (json.containsKey('high')) return DataConfidence.high();
      if (json.containsKey('medium')) return DataConfidence.medium();
      if (json.containsKey('low')) return DataConfidence.low();
    }
    // Fallback for string format (legacy)
    if (json is String) {
      switch (json.toLowerCase()) {
        case 'high':
          return DataConfidence.high();
        case 'medium':
          return DataConfidence.medium();
        case 'low':
          return DataConfidence.low();
        default:
          return DataConfidence.medium();
      }
    }
    return DataConfidence.medium();
  }

  @override
  Object toJson(DataConfidence object) {
    return object.when(
      high: () => {'high': {}},
      medium: () => {'medium': {}},
      low: () => {'low': {}},
    );
  }
}

/// Geometry confidence level
@freezed
abstract class GeometryConfidence with _$GeometryConfidence {
  const factory GeometryConfidence.geoHigh() = _GeometryConfidenceGeoHigh;
  const factory GeometryConfidence.geoMedium() = _GeometryConfidenceGeoMedium;
  const factory GeometryConfidence.geoLow() = _GeometryConfidenceGeoLow;
}

/// JSON converter for GeometryConfidence (freezed union - tagged format)
class GeometryConfidenceConverter implements JsonConverter<GeometryConfidence, Object> {
  const GeometryConfidenceConverter();

  @override
  GeometryConfidence fromJson(Object json) {
    if (json is Map<String, dynamic>) {
      if (json.containsKey('geoHigh')) return GeometryConfidence.geoHigh();
      if (json.containsKey('geoMedium')) return GeometryConfidence.geoMedium();
      if (json.containsKey('geoLow')) return GeometryConfidence.geoLow();
    }
    // Fallback for string format (legacy)
    if (json is String) {
      switch (json.toLowerCase()) {
        case 'high':
          return GeometryConfidence.geoHigh();
        case 'medium':
          return GeometryConfidence.geoMedium();
        case 'low':
          return GeometryConfidence.geoLow();
        default:
          return GeometryConfidence.geoMedium();
      }
    }
    return GeometryConfidence.geoMedium();
  }

  @override
  Object toJson(GeometryConfidence object) {
    return object.when(
      geoHigh: () => {'geoHigh': {}},
      geoMedium: () => {'geoMedium': {}},
      geoLow: () => {'geoLow': {}},
    );
  }
}

/// Floor level indicator
@freezed
abstract class FloorLevel with _$FloorLevel {
  const factory FloorLevel.ground() = _Ground;
  const factory FloorLevel.first() = _First;
  const factory FloorLevel.second() = _Second;
  const factory FloorLevel.third() = _Third;
  const factory FloorLevel.notIndicated() = _NotIndicated;
}

/// JSON converter for FloorLevel (handles both tagged union and simple string format)
class FloorLevelConverter implements JsonConverter<FloorLevel, Object?> {
  const FloorLevelConverter();

  @override
  FloorLevel fromJson(Object? json) {
    if (json is Map<String, dynamic>) {
      // Tagged union format: {"ground": {}} or {"first": {}}
      if (json.containsKey('ground')) return FloorLevel.ground();
      if (json.containsKey('first')) return FloorLevel.first();
      if (json.containsKey('second')) return FloorLevel.second();
      if (json.containsKey('third')) return FloorLevel.third();
      if (json.containsKey('notIndicated')) return FloorLevel.notIndicated();
      return FloorLevel.notIndicated();
    } else if (json is String) {
      // Simple string format: "ground_floor", "first_floor", etc.
      switch (json.toLowerCase()) {
        case 'ground_floor':
        case 'ground':
          return FloorLevel.ground();
        case 'first_floor':
        case 'first':
          return FloorLevel.first();
        case 'second_floor':
        case 'second':
          return FloorLevel.second();
        case 'third_floor':
        case 'third':
          return FloorLevel.third();
        case 'floor_not_indicated':
        case 'not_indicated':
        default:
          return FloorLevel.notIndicated();
      }
    }
    return FloorLevel.notIndicated();
  }

  @override
  Object toJson(FloorLevel object) {
    return object.when(
      ground: () => {'ground': {}},
      first: () => {'first': {}},
      second: () => {'second': {}},
      third: () => {'third': {}},
      notIndicated: () => {'notIndicated': {}},
    );
  }
}

/// Polygon geometry in normalized image coordinates
@freezed
abstract class NormalizedPolygon with _$NormalizedPolygon {
  const NormalizedPolygon._();

  const factory NormalizedPolygon({
    required List<List<double>> coordinates, // [[x, y], ...] in 0-1 range
    required double centerX,
    required double centerY,
    required double x, // top-left x
    required double y, // top-left y
    required double width,
    required double height,
    @Default('normalized_image') String coordinateSpace,
    @Default('Polygon') String type,
  }) = _NormalizedPolygon;

  factory NormalizedPolygon.fromJson(Map<String, dynamic> json) =>
      _$NormalizedPolygonFromJson(json);

  /// Get bounding box
  NormalizedBounds get bounds => NormalizedBounds(
        minX: x,
        minY: y,
        maxX: x + width,
        maxY: y + height,
      );
}

/// Normalized bounding box
@freezed
abstract class NormalizedBounds with _$NormalizedBounds {
  const NormalizedBounds._();

  const factory NormalizedBounds({
    required double minX,
    required double minY,
    required double maxX,
    required double maxY,
  }) = _NormalizedBounds;

  factory NormalizedBounds.fromJson(Map<String, dynamic> json) =>
      _$NormalizedBoundsFromJson(json);

  double get centerX => (minX + maxX) / 2;
  double get centerY => (minY + maxY) / 2;
  double get width => maxX - minX;
  double get height => maxY - minY;
}

/// Source pixel bounding box from original image
@freezed
abstract class SourcePixelBBox with _$SourcePixelBBox {
  const factory SourcePixelBBox({
    required int x,
    required int y,
    required int width,
    required int height,
  }) = _SourcePixelBBox;

  factory SourcePixelBBox.fromJson(Map<String, dynamic> json) =>
      _$SourcePixelBBoxFromJson(json);
}

/// Room geometry with both normalized and real-world coordinates
@freezed
abstract class RoomGeometry with _$RoomGeometry {
  const RoomGeometry._();

  const factory RoomGeometry({
    required NormalizedPolygon normalized,
    LatLng? latLng, // Real-world coordinates (after transformation)
    LatLng? centroid, // Real-world centroid
    List<LatLng>? polygon, // Real-world polygon vertices
  }) = _RoomGeometry;

  factory RoomGeometry.fromJson(Map<String, dynamic> json) =>
      _$RoomGeometryFromJson(json);

  /// Check if real-world coordinates are available
  bool get hasRealWorldCoords => latLng != null || centroid != null;
}

/// Campus room/facility model
@freezed
abstract class CampusRoom with _$CampusRoom {
  const CampusRoom._();

  const factory CampusRoom({
    required String id,
    required String name,
    required String originalLabel,
    @RoomCategoryConverter() required RoomCategory category,
    required String buildingId,
    required String floorId,
    @FloorLevelConverter() required FloorLevel floorLevel,
    @DataConfidenceConverter() required DataConfidence confidence,
    String? notes,
    required RoomGeometry geometry,
    required SourcePixelBBox sourcePixelBBox,
    @Default(true) bool approximate,
    @GeometryConfidenceConverter() required GeometryConfidence geometryConfidence,
    Map<String, dynamic>? metadata,
  }) = _CampusRoom;

  factory CampusRoom.fromJson(Map<String, dynamic> json) =>
      _$CampusRoomFromJson(json);

  /// Get display name (fallback to original label)
  String get displayName => name.isNotEmpty ? name : originalLabel;

  /// Get category display name
  String get categoryDisplayName => category.label;

  /// Get floor display name
  String get floorDisplayName => floorLevel.label;

  /// Check if this is a navigable space (room, office, etc.)
  bool get isNavigableSpace => category.when(
        room: () => true,
        office: () => true,
        laboratory: () => true,
        library: () => true,
        canteen: () => true,
        hallway: () => true,
        staircase: () => true,
        facility: () => true,
        restroom: () => false,
        parking: () => false,
        sportsFacility: () => true,
        stage: () => true,
        storage: () => false,
        unresolvedMapAnnotation: () => false,
        unresolvedSpace: () => false,
        other: () => false,
        // Safety & Emergency categories - navigable
        emergencyExit: () => true,
        assemblyPoint: () => true,
        medicalFacility: () => true,
        securityOffice: () => true,
      );

  /// Check if this is a facility/amenity
  bool get isFacility => category.when(
        room: () => false,
        restroom: () => true,
        office: () => false,
        facility: () => false,
        canteen: () => true,
        hallway: () => false,
        laboratory: () => false,
        library: () => false,
        parking: () => true,
        sportsFacility: () => true,
        stage: () => true,
        staircase: () => true,
        storage: () => false,
        unresolvedMapAnnotation: () => false,
        unresolvedSpace: () => false,
        other: () => false,
        // Safety & Emergency categories - facilities
        emergencyExit: () => true,
        assemblyPoint: () => true,
        medicalFacility: () => true,
        securityOffice: () => true,
      );

  /// Get category color for map rendering
  int get categoryColor => category.when(
        room: () => 0xFF2196F3, // Blue
        restroom: () => 0xFF9C27B0, // Purple
        office: () => 0xFF4CAF50, // Green
        facility: () => 0xFFFF9800, // Orange
        canteen: () => 0xFF795548, // Brown
        hallway: () => 0xFF607D8B, // Blue Grey
        laboratory: () => 0xFFE91E63, // Pink
        library: () => 0xFF3F51B5, // Indigo
        parking: () => 0xFF757575, // Grey
        sportsFacility: () => 0xFF009688, // Teal
        stage: () => 0xFF673AB7, // Deep Purple
        staircase: () => 0xFF5C6BC0, // Indigo accent
        storage: () => 0xFF8D6E63, // Brown grey
        unresolvedMapAnnotation: () => 0xFFBDBDBD, // Light grey
        unresolvedSpace: () => 0xFFE0E0E0, // Lighter grey
        other: () => 0xFF9E9E9E, // Grey
        // Safety & Emergency categories
        emergencyExit: () => 0xFFF44336, // Red
        assemblyPoint: () => 0xFFFFEB3B, // Yellow
        medicalFacility: () => 0xFFE91E63, // Pink
        securityOffice: () => 0xFF3F51B5, // Indigo
      );
}

/// Campus building reference (summary info for building list)
@freezed
abstract class CampusBuildingReference with _$CampusBuildingReference {
  const CampusBuildingReference._();

  const factory CampusBuildingReference({
    required String id,
    required String name,
    required List<CampusFloor> floors,
    required int roomCount,
    Map<String, int>? roomsByCategory,
    LatLng? centroid,
  }) = _CampusBuildingReference;

  factory CampusBuildingReference.fromJson(Map<String, dynamic> json) =>
      _$CampusBuildingReferenceFromJson(json);
}

/// Campus floor model
@freezed
abstract class CampusFloor with _$CampusFloor {
  const CampusFloor._();

  const factory CampusFloor({
    required String id,
    required String name,
    @FloorLevelConverter() required FloorLevel level,
    required int roomCount,
    List<String>? roomIds,
  }) = _CampusFloor;

  factory CampusFloor.fromJson(Map<String, dynamic> json) =>
      _$CampusFloorFromJson(json);
}

/// Extension for RoomCategory to provide label and color
extension RoomCategoryX on RoomCategory {
  String get label {
    return when(
      room: () => 'Room',
      restroom: () => 'Restroom',
      office: () => 'Office',
      facility: () => 'Facility',
      canteen: () => 'Canteen',
      hallway: () => 'Hallway',
      laboratory: () => 'Laboratory',
      library: () => 'Library',
      parking: () => 'Parking',
      sportsFacility: () => 'Sports Facility',
      stage: () => 'Stage',
      staircase: () => 'Staircase',
      storage: () => 'Storage',
      unresolvedMapAnnotation: () => 'Unresolved Annotation',
      unresolvedSpace: () => 'Unresolved Space',
      other: () => 'Other',
      // Safety & Emergency categories
      emergencyExit: () => 'Emergency Exit',
      assemblyPoint: () => 'Assembly Point',
      medicalFacility: () => 'Medical Facility',
      securityOffice: () => 'Security Office',
    );
  }

  int get colorValue {
    return when(
      room: () => 0xFF2196F3,
      restroom: () => 0xFF9C27B0,
      office: () => 0xFF4CAF50,
      facility: () => 0xFFFF9800,
      canteen: () => 0xFF795548,
      hallway: () => 0xFF607D8B,
      laboratory: () => 0xFFE91E63,
      library: () => 0xFF3F51B5,
      parking: () => 0xFF757575,
      sportsFacility: () => 0xFF009688,
      stage: () => 0xFF673AB7,
      staircase: () => 0xFF5C6BC0,
      storage: () => 0xFF8D6E63,
      unresolvedMapAnnotation: () => 0xFFBDBDBD,
      unresolvedSpace: () => 0xFFE0E0E0,
      other: () => 0xFF9E9E9E,
      // Safety & Emergency categories
      emergencyExit: () => 0xFFF44336, // Red
      assemblyPoint: () => 0xFFFFEB3B, // Yellow
      medicalFacility: () => 0xFFE91E63, // Pink
      securityOffice: () => 0xFF3F51B5, // Indigo
    );
  }
}

/// Extension for parsing RoomCategory from String
extension RoomCategoryStringX on String {
  RoomCategory toRoomCategory() {
    switch (toLowerCase()) {
      case 'room':
        return RoomCategory.room();
      case 'restroom':
        return RoomCategory.restroom();
      case 'office':
        return RoomCategory.office();
      case 'facility':
        return RoomCategory.facility();
      case 'canteen':
        return RoomCategory.canteen();
      case 'hallway':
        return RoomCategory.hallway();
      case 'laboratory':
        return RoomCategory.laboratory();
      case 'library':
        return RoomCategory.library();
      case 'parking':
        return RoomCategory.parking();
      case 'sportsfacility':
      case 'sports_facility':
        return RoomCategory.sportsFacility();
      case 'stage':
        return RoomCategory.stage();
      case 'staircase':
        return RoomCategory.staircase();
      case 'storage':
        return RoomCategory.storage();
      case 'unresolvedmapannotation':
      case 'unresolved_map_annotation':
        return RoomCategory.unresolvedMapAnnotation();
      case 'unresolvedspace':
      case 'unresolved_space':
        return RoomCategory.unresolvedSpace();
      // Safety & Emergency categories
      case 'emergencyexit':
      case 'emergency_exit':
        return RoomCategory.emergencyExit();
      case 'assemblypoint':
      case 'assembly_point':
        return RoomCategory.assemblyPoint();
      case 'medicalfacility':
      case 'medical_facility':
        return RoomCategory.medicalFacility();
      case 'securityoffice':
      case 'security_office':
        return RoomCategory.securityOffice();
      default:
        return RoomCategory.other();
    }
  }
}

/// Extension for FloorLevel to provide label
extension FloorLevelX on FloorLevel {
  String get label {
    return when(
      ground: () => 'Ground Floor',
      first: () => 'First Floor',
      second: () => 'Second Floor',
      third: () => 'Third Floor',
      notIndicated: () => 'Floor Not Indicated',
    );
  }

  int get levelIndex {
    return when(
      ground: () => 0,
      first: () => 1,
      second: () => 2,
      third: () => 3,
      notIndicated: () => -1,
    );
  }

  String get floorId {
    return when(
      ground: () => 'ground_floor',
      first: () => 'first_floor',
      second: () => 'second_floor',
      third: () => 'third_floor',
      notIndicated: () => 'floor_not_indicated',
    );
  }
}

/// Static method to parse FloorLevel from floorId string
FloorLevel floorLevelFromFloorId(String floorId) {
  switch (floorId) {
    case 'ground_floor':
      return FloorLevel.ground();
    case 'first_floor':
      return FloorLevel.first();
    case 'second_floor':
      return FloorLevel.second();
    case 'third_floor':
      return FloorLevel.third();
    case 'floor_not_indicated':
    default:
      return FloorLevel.notIndicated();
  }
}

/// Extension for DataConfidence to provide label
extension DataConfidenceX on DataConfidence {
  String get label {
    return when(
      high: () => 'High',
      medium: () => 'Medium',
      low: () => 'Low',
    );
  }

  int get priority {
    return when(
      high: () => 3,
      medium: () => 2,
      low: () => 1,
    );
  }
}

/// Extension for GeometryConfidence to provide label
extension GeometryConfidenceX on GeometryConfidence {
  String get label {
    return when(
      geoHigh: () => 'High',
      geoMedium: () => 'Medium',
      geoLow: () => 'Low',
    );
  }
}