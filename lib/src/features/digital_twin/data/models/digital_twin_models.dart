// Copyright 2025 SAFENAV CAVITE
// Digital Twin data models for 3D campus representation

import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'digital_twin_models.freezed.dart';
part 'digital_twin_models.g.dart';

/// Represents a 3D building in the digital twin
@freezed
sealed class Building3D with _$Building3D {
  const factory Building3D({
    required String id,
    required String name,
    required String displayName,
    required int floorCount,
    required List<Floor3D> floors,
    required BuildingBounds3D bounds,
    required String modelPath, // Path to GLB file
    required String metadataPath, // Path to metadata JSON
    required BuildingType type,
    required Map<String, dynamic> properties,
    required DateTime lastUpdated,
  }) = _Building3D;

  factory Building3D.fromJson(Map<String, dynamic> json) => _$Building3DFromJson(json);
}

/// Types of buildings in the campus
@freezed
sealed class BuildingType with _$BuildingType {
  const factory BuildingType.academic() = AcademicBuilding;
  const factory BuildingType.administrative() = AdministrativeBuilding;
  const factory BuildingType.laboratory() = LaboratoryBuilding;
  const factory BuildingType.library() = LibraryBuilding;
  const factory BuildingType.gymnasium() = GymnasiumBuilding;
  const factory BuildingType.auditorium() = AuditoriumBuilding;
  const factory BuildingType.cafeteria() = CafeteriaBuilding;
  const factory BuildingType.dormitory() = DormitoryBuilding;
  const factory BuildingType.other(String label) = OtherBuilding;

  factory BuildingType.fromJson(Map<String, dynamic> json) => _$BuildingTypeFromJson(json);
}

/// Bounding box for a 3D building
@freezed
sealed class BuildingBounds3D with _$BuildingBounds3D {
  const factory BuildingBounds3D({
    required double minX,
    required double minY,
    required double minZ,
    required double maxX,
    required double maxY,
    required double maxZ,
  }) = _BuildingBounds3D;

  factory BuildingBounds3D.fromJson(Map<String, dynamic> json) => _$BuildingBounds3DFromJson(json);

  const BuildingBounds3D._();

  /// Center point of the bounds
  Vector3D get center => Vector3D(
    x: (minX + maxX) / 2,
    y: (minY + maxY) / 2,
    z: (minZ + maxZ) / 2,
  );

  /// Size of the bounds
  Vector3D get size => Vector3D(
    x: maxX - minX,
    y: maxY - minY,
    z: maxZ - minZ,
  );
}

/// 3D vector for positions and sizes
@freezed
sealed class Vector3D with _$Vector3D {
  const factory Vector3D({required double x, required double y, required double z}) = _Vector3D;

  factory Vector3D.fromJson(Map<String, dynamic> json) => _$Vector3DFromJson(json);

  const Vector3D._();

  /// Add two vectors
  Vector3D operator +(Vector3D other) => Vector3D(
    x: x + other.x,
    y: y + other.y,
    z: z + other.z,
  );

  /// Subtract two vectors
  Vector3D operator -(Vector3D other) => Vector3D(
    x: x - other.x,
    y: y - other.y,
    z: z - other.z,
  );

  /// Multiply by scalar
  Vector3D operator *(double scalar) => Vector3D(
    x: x * scalar,
    y: y * scalar,
    z: z * scalar,
  );

  /// Distance to another vector
  double distanceTo(Vector3D other) => sqrt(
    (x - other.x) * (x - other.x) +
    (y - other.y) * (y - other.y) +
    (z - other.z) * (z - other.z),
  );

  /// Convert to List for JSON serialization
  List<double> toList() => [x, y, z];

  /// Create from List
  static Vector3D fromList(List<double> list) => Vector3D(
    x: list[0],
    y: list[1],
    z: list[2],
  );
}

/// Represents a floor in a 3D building
@freezed
sealed class Floor3D with _$Floor3D {
  const factory Floor3D({
    required int index, // 0 = ground, 1 = 2nd, etc.
    required String name, // "Ground Floor", "2nd Floor", etc.
    required double elevation, // Height in meters from ground
    required double height, // Floor-to-ceiling height in meters
    required List<Room3D> rooms,
    required FloorBounds3D bounds,
    required String modelNodeName, // Node name in GLB scene graph
    required bool hasInterior, // Whether interior is modeled
    required Map<String, dynamic> properties,
  }) = _Floor3D;

  factory Floor3D.fromJson(Map<String, dynamic> json) => _$Floor3DFromJson(json);
}

/// Bounding box for a floor
@freezed
sealed class FloorBounds3D with _$FloorBounds3D {
  const factory FloorBounds3D({
    required double minX,
    required double minY,
    required double maxX,
    required double maxY,
    required double minZ,
    required double maxZ,
  }) = _FloorBounds3D;

  factory FloorBounds3D.fromJson(Map<String, dynamic> json) => _$FloorBounds3DFromJson(json);

  const FloorBounds3D._();

  Vector3D get center => Vector3D(
    x: (minX + maxX) / 2,
    y: (minY + maxY) / 2,
    z: (minZ + maxZ) / 2,
  );

  Vector3D get size => Vector3D(
    x: maxX - minX,
    y: maxY - minY,
    z: maxZ - minZ,
  );
}

/// Represents a room in the 3D digital twin
@freezed
sealed class Room3D with _$Room3D {
  const factory Room3D({
    required String id, // Matches room_id from earist_cavite_campus.json
    required String buildingId,
    required int floorIndex,
    required String name,
    required String number,
    required RoomCategory category,
    required RoomBounds3D bounds,
    required String meshName, // Name of mesh in GLB (e.g., "room_main_building_ground_floor_room_101")
    required Vector3D centroid, // Center point for navigation/fly-to
    required List<Vector3D> polygon, // 2D polygon vertices (for raycasting)
    required Map<String, dynamic> properties, // Additional data from source
    required bool isAccessible, // For emergency/navigation
    required bool isEmergencyExit,
    required bool isAssemblyPoint,
  }) = _Room3D;

  factory Room3D.fromJson(Map<String, dynamic> json) => _$Room3DFromJson(json);

  const Room3D._();

  /// Get display label for UI
  String get displayLabel => '$number - $name';

  /// Short label for tooltips
  String get shortLabel => number;
}

/// Room categories from the source data
@freezed
sealed class RoomCategory with _$RoomCategory {
  const factory RoomCategory.classroom() = Classroom;
  const factory RoomCategory.laboratory() = Laboratory;
  const factory RoomCategory.office() = Office;
  const factory RoomCategory.library() = Library;
  const factory RoomCategory.auditorium() = Auditorium;
  const factory RoomCategory.gymnasium() = Gymnasium;
  const factory RoomCategory.cafeteria() = Cafeteria;
  const factory RoomCategory.restroom() = Restroom;
  const factory RoomCategory.corridor() = Corridor;
  const factory RoomCategory.stairs() = Stairs;
  const factory RoomCategory.elevator() = Elevator;
  const factory RoomCategory.utility() = Utility;
  const factory RoomCategory.storage() = Storage;
  const factory RoomCategory.other(String label) = Other;

  factory RoomCategory.fromJson(Map<String, dynamic> json) => _$RoomCategoryFromJson(json);

  const RoomCategory._();

  /// Color for visualization
  int get color {
    return switch (this) {
      Classroom() => 0x42A5F5,       // Blue
      Laboratory() => 0xAB47BC,      // Purple
      Office() => 0x66BB6A,          // Green
      Library() => 0xFFA726,         // Orange
      Auditorium() => 0xEF5350,      // Red
      Gymnasium() => 0x26C6DA,       // Cyan
      Cafeteria() => 0xFFCA28,       // Yellow
      Restroom() => 0x9E9E9E,        // Grey
      Corridor() => 0xBDBDBD,        // Light Grey
      Stairs() => 0x8D6E63,          // Brown
      Elevator() => 0x78909C,        // Blue Grey
      Utility() => 0xA1887F,         // Light Brown
      Storage() => 0x90A4AE,         // Blue Grey Light
      Other(label: _) => 0x757575,   // Default Grey
    };
  }

  /// Icon for UI
  String get icon {
    return switch (this) {
      Classroom() => '🏫',
      Laboratory() => '🔬',
      Office() => '🏢',
      Library() => '📚',
      Auditorium() => '🎭',
      Gymnasium() => '🏀',
      Cafeteria() => '🍽️',
      Restroom() => '🚻',
      Corridor() => '🚪',
      Stairs() => '🪜',
      Elevator() => '🛗',
      Utility() => '🔧',
      Storage() => '📦',
      Other(label: _) => '📍',
    };
  }
}

/// Bounding box for a room
@freezed
sealed class RoomBounds3D with _$RoomBounds3D {
  const factory RoomBounds3D({
    required double minX,
    required double minY,
    required double minZ,
    required double maxX,
    required double maxY,
    required double maxZ,
  }) = _RoomBounds3D;

  factory RoomBounds3D.fromJson(Map<String, dynamic> json) => _$RoomBounds3DFromJson(json);

  const RoomBounds3D._();

  Vector3D get center => Vector3D(
    x: (minX + maxX) / 2,
    y: (minY + maxY) / 2,
    z: (minZ + maxZ) / 2,
  );

  Vector3D get size => Vector3D(
    x: maxX - minX,
    y: maxY - minY,
    z: maxZ - minZ,
  );

  /// Check if a point is inside the bounds
  bool contains(Vector3D point) {
    return point.x >= minX && point.x <= maxX &&
           point.y >= minY && point.y <= maxY &&
           point.z >= minZ && point.z <= maxZ;
  }
}

/// Complete digital twin state for a building
@freezed
sealed class DigitalTwinState with _$DigitalTwinState {
  const factory DigitalTwinState.loading() = _Loading;
  const factory DigitalTwinState.loaded({
    required Building3D building,
    required int currentFloor,
    required Set<String> highlightedRooms,
    required String? selectedRoomId,
    required DigitalTwinTheme theme,
    required bool isExplodedView,
    required CameraState camera,
  }) = _Loaded;
  const factory DigitalTwinState.error({
    required String message,
    required Object? error,
    @JsonKey(includeFromJson: false, includeToJson: false) StackTrace? stackTrace,
  }) = _Error;

  factory DigitalTwinState.fromJson(Map<String, dynamic> json) => _$DigitalTwinStateFromJson(json);
}

/// Camera state for saving/restoring view
@freezed
sealed class CameraState with _$CameraState {
  const factory CameraState({
    required Vector3D position,
    required Vector3D target,
    required double zoom,
    required double polarAngle,
    required double azimuthAngle,
  }) = _CameraState;

  factory CameraState.fromJson(Map<String, dynamic> json) => _$CameraStateFromJson(json);

  const CameraState._();

  static CameraState defaultView() => CameraState(
    position: Vector3D(x: 50, y: 50, z: 50),
    target: Vector3D(x: 0, y: 0, z: 0),
    zoom: 1.0,
    polarAngle: 0.785, // 45 degrees
    azimuthAngle: 0.785,
  );
}

/// Theme for the digital twin
@freezed
sealed class DigitalTwinTheme with _$DigitalTwinTheme {
  const factory DigitalTwinTheme.light() = LightTheme;
  const factory DigitalTwinTheme.dark() = DarkTheme;
  const factory DigitalTwinTheme.emergency() = EmergencyTheme;

  factory DigitalTwinTheme.fromJson(Map<String, dynamic> json) => _$DigitalTwinThemeFromJson(json);

  const DigitalTwinTheme._();

  /// Convert to Three.js theme name
  String get threeJsName => switch (this) {
    LightTheme() => 'light',
    DarkTheme() => 'dark',
    EmergencyTheme() => 'emergency',
  };

  /// Next theme in cycle
  DigitalTwinTheme get next => switch (this) {
    LightTheme() => DarkTheme(),
    DarkTheme() => EmergencyTheme(),
    EmergencyTheme() => LightTheme(),
  };

  /// Human-readable name
  String get name => switch (this) {
    LightTheme() => 'Light',
    DarkTheme() => 'Dark',
    EmergencyTheme() => 'Emergency',
  };
}

/// Search result for room search
@freezed
sealed class RoomSearchResult with _$RoomSearchResult {
  const factory RoomSearchResult({
    required Room3D room,
    required double relevanceScore,
    required SearchMatchType matchType,
    required String matchedField,
  }) = _RoomSearchResult;

  factory RoomSearchResult.fromJson(Map<String, dynamic> json) => _$RoomSearchResultFromJson(json);
}

/// Type of search match
@freezed
sealed class SearchMatchType with _$SearchMatchType {
  const factory SearchMatchType.exact() = ExactMatch;
  const factory SearchMatchType.prefix() = PrefixMatch;
  const factory SearchMatchType.contains() = ContainsMatch;
  const factory SearchMatchType.fuzzy() = FuzzyMatch;

  factory SearchMatchType.fromJson(Map<String, dynamic> json) => _$SearchMatchTypeFromJson(json);
}

/// Message types for Flutter ↔ Three.js communication
@freezed
sealed class DigitalTwinMessage with _$DigitalTwinMessage {
  const factory DigitalTwinMessage.loadBuilding({required String buildingId}) = _LoadBuilding;
  const factory DigitalTwinMessage.showFloor({required int floorIndex}) = _ShowFloor;
  const factory DigitalTwinMessage.setFloorVisibility({required int floorIndex, required bool visible, @Default(1.0) double opacity}) = _SetFloorVisibility;
  const factory DigitalTwinMessage.highlightRoom({required String roomId, int? color}) = _HighlightRoom;
  const factory DigitalTwinMessage.clearHighlight({required String roomId}) = _ClearHighlight;
  const factory DigitalTwinMessage.flyToRoom({required String roomId, @Default(1000) int duration}) = _FlyToRoom;
  const factory DigitalTwinMessage.setTheme({required String theme}) = _SetTheme;
  const factory DigitalTwinMessage.setExplodedView({required bool enabled, @Default(5.0) double separation}) = _SetExplodedView;
  const factory DigitalTwinMessage.setCameraPosition({required double x, required double y, required double z}) = _SetCameraPosition;
  const factory DigitalTwinMessage.requestState() = _RequestState;

  factory DigitalTwinMessage.fromJson(Map<String, dynamic> json) => _$DigitalTwinMessageFromJson(json);
}

/// Incoming messages from Three.js
@freezed
sealed class ThreeJsEvent with _$ThreeJsEvent {
  const factory ThreeJsEvent.modelLoaded({required String buildingId}) = _ModelLoaded;
  const factory ThreeJsEvent.floorChanged({required int floorIndex}) = _FloorChanged;
  const factory ThreeJsEvent.roomHovered({required String roomId}) = _RoomHovered;
  const factory ThreeJsEvent.roomSelected({required String roomId}) = _RoomSelected;
  const factory ThreeJsEvent.cameraChanged({required CameraState camera}) = _CameraChanged;
  const factory ThreeJsEvent.threeJsError({required String message}) = _ThreeJsError;

  factory ThreeJsEvent.fromJson(Map<String, dynamic> json) => _$ThreeJsEventFromJson(json);
}

/// Coordinate system transformation data
@freezed
sealed class CoordinateTransform with _$CoordinateTransform {
  const factory CoordinateTransform({
    required String buildingId,
    required String sourceCrs, // e.g., "normalized_image", "EPSG:4326", "local_cartesian"
    required String targetCrs,
    required Matrix4x4 transformMatrix,
    required Vector3D translation,
    required Vector3D scale,
    required double rotation, // Radians around Z axis
    required BoundingBox2D sourceBounds,
    required BoundingBox2D targetBounds,
  }) = _CoordinateTransform;

  factory CoordinateTransform.fromJson(Map<String, dynamic> json) => _$CoordinateTransformFromJson(json);
}

/// 4x4 transformation matrix
@freezed
sealed class Matrix4x4 with _$Matrix4x4 {
  const factory Matrix4x4({required List<List<double>> values}) = _Matrix4x4;

  factory Matrix4x4.fromJson(Map<String, dynamic> json) => _$Matrix4x4FromJson(json);

  const Matrix4x4._();

  /// Identity matrix
  static Matrix4x4 identity() => Matrix4x4(values: [
    [1, 0, 0, 0],
    [0, 1, 0, 0],
    [0, 0, 1, 0],
    [0, 0, 0, 1],
  ]);

  /// Multiply matrix by vector
  Vector3D transform(Vector3D v) {
    final x = values[0][0] * v.x + values[0][1] * v.y + values[0][2] * v.z + values[0][3];
    final y = values[1][0] * v.x + values[1][1] * v.y + values[1][2] * v.z + values[1][3];
    final z = values[2][0] * v.x + values[2][1] * v.y + values[2][2] * v.z + values[2][3];
    final w = values[3][0] * v.x + values[3][1] * v.y + values[3][2] * v.z + values[3][3];
    return w != 0 ? Vector3D(x: x / w, y: y / w, z: z / w) : Vector3D(x: x, y: y, z: z);
  }
}

/// 2D bounding box
@freezed
sealed class BoundingBox2D with _$BoundingBox2D {
  const factory BoundingBox2D({required double minX, required double minY, required double maxX, required double maxY}) = _BoundingBox2D;

  factory BoundingBox2D.fromJson(Map<String, dynamic> json) => _$BoundingBox2DFromJson(json);

  const BoundingBox2D._();

  double get width => maxX - minX;
  double get height => maxY - minY;
  Vector3D get center => Vector3D(x: (minX + maxX) / 2, y: (minY + maxY) / 2, z: 0);
}

/// Export metadata for a GLB model
@freezed
sealed class ModelMetadata with _$ModelMetadata {
  const factory ModelMetadata({
    required String buildingId,
    required String version,
    required DateTime generatedAt,
    required String sourceDataHash, // Hash of earist_cavite_campus.json
    required CoordinateTransform coordinateTransform,
    required Map<String, RoomMetadata> rooms,
    required Map<int, FloorMetadata> floors,
    required BuildingBounds3D bounds,
    required Map<String, dynamic> exportSettings,
  }) = _ModelMetadata;

  factory ModelMetadata.fromJson(Map<String, dynamic> json) => _$ModelMetadataFromJson(json);
}

/// Room metadata for GLB export
@freezed
sealed class RoomMetadata with _$RoomMetadata {
  const factory RoomMetadata({
    required String roomId,
    required String meshName,
    required int floorIndex,
    required String name,
    required String number,
    required String category,
    required RoomBounds3D bounds,
    required Vector3D centroid,
    required List<Vector3D> polygon,
    required Map<String, dynamic> properties,
  }) = _RoomMetadata;

  factory RoomMetadata.fromJson(Map<String, dynamic> json) => _$RoomMetadataFromJson(json);
}

/// Floor metadata for GLB export
@freezed
sealed class FloorMetadata with _$FloorMetadata {
  const factory FloorMetadata({
    required int index,
    required String name,
    required double elevation,
    required double height,
    required FloorBounds3D bounds,
    required String nodeName,
    required int roomCount,
  }) = _FloorMetadata;

  factory FloorMetadata.fromJson(Map<String, dynamic> json) => _$FloorMetadataFromJson(json);
}