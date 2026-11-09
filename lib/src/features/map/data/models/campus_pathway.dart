/// SAFENAV CAVITE - Campus Pathway Model
///
/// Represents pathways, walkways, and infrastructure on the EARIST Cavite Campus
/// from OpenStreetMap data.
library;

import 'dart:math' as math;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'campus_pathway.freezed.dart';
part 'campus_pathway.g.dart';

/// Category of campus pathways for filtering and styling
@freezed
abstract class PathwayCategory with _$PathwayCategory {
  const factory PathwayCategory.mainPath() = _MainPath;
  const factory PathwayCategory.connector() = _Connector;
  const factory PathwayCategory.perimeter() = _Perimeter;
  const factory PathwayCategory.emergency() = _Emergency;
  const factory PathwayCategory.parking() = _Parking;
  const factory PathwayCategory.openSpace() = _OpenSpace;
  const factory PathwayCategory.other() = _Other;
}

/// JSON converter for PathwayCategory
class PathwayCategoryConverter implements JsonConverter<PathwayCategory, String> {
  const PathwayCategoryConverter();

  @override
  PathwayCategory fromJson(String json) {
    return json.toPathwayCategory();
  }

  @override
  String toJson(PathwayCategory object) {
    return object.label.toLowerCase().replaceAll(' ', '_');
  }
}

/// Campus pathway model with LineString or Polygon geometry
@freezed
abstract class CampusPathway with _$CampusPathway {
  const CampusPathway._();

  const factory CampusPathway({
    required String id,
    required String name,
    required String highway,
    required String surface,
    required double width,
    @PathwayCategoryConverter() required PathwayCategory category,
    required String description,
    required String source,
    required String verificationStatus,
    required List<LatLng> coordinates,
    String? geometryType, // 'LineString' or 'Polygon'
    int? capacity,
    Map<String, dynamic>? additionalTags,
  }) = _CampusPathway;

  factory CampusPathway.fromJson(Map<String, dynamic> json) =>
      _$CampusPathwayFromJson(json);

  /// Get center point for label placement
  LatLng get center {
    if (coordinates.isEmpty) return LatLng(0, 0);
    if (coordinates.length == 1) return coordinates.first;

    // For LineString, return midpoint
    final midIndex = coordinates.length ~/ 2;
    return coordinates[midIndex];
  }

  /// Calculate approximate length in meters (for LineString)
  double get lengthMeters {
    if (coordinates.length < 2) return 0.0;
    double length = 0.0;
    for (int i = 0; i < coordinates.length - 1; i++) {
      length += _distance(coordinates[i], coordinates[i + 1]);
    }
    return length;
  }

  /// Check if this is a polygon (area) rather than a line
  bool get isPolygon => geometryType == 'Polygon' ||
      (coordinates.length >= 4 &&
          coordinates.first.latitude == coordinates.last.latitude &&
          coordinates.first.longitude == coordinates.last.longitude);

  /// Calculate approximate area in square meters (for Polygon)
  double get areaSqMeters {
    if (!isPolygon || coordinates.length < 3) return 0.0;

    double area = 0.0;
    for (int i = 0; i < coordinates.length - 1; i++) {
      final p1 = coordinates[i];
      final p2 = coordinates[i + 1];
      area += (p2.longitude - p1.longitude) *
          (2 + (p1.latitude + p2.latitude) / 90.0);
    }
    return (area * 111320.0 * 111320.0).abs() / 2.0;
  }

  /// Haversine distance between two points in meters
  double _distance(LatLng p1, LatLng p2) {
    const double earthRadius = 6371000.0; // meters
    final dLat = _toRadians(p2.latitude - p1.latitude);
    final dLon = _toRadians(p2.longitude - p1.longitude);
    final lat1 = _toRadians(p1.latitude);
    final lat2 = _toRadians(p2.latitude);

    final sinDLat = math.sin(dLat / 2);
    final sinDLon = math.sin(dLon / 2);
    final cosLat1 = math.cos(lat1);
    final cosLat2 = math.cos(lat2);

    final a = sinDLat * sinDLat + sinDLon * sinDLon * cosLat1 * cosLat2;
    final c = 2 * math.asin(math.sqrt(a));
    return earthRadius * c;
  }

  double _toRadians(double degrees) => degrees * math.pi / 180.0;
}

/// Extension to parse PathwayCategory from string
extension PathwayCategoryX on String {
  PathwayCategory toPathwayCategory() {
    switch (toLowerCase()) {
      case 'main_path':
      case 'mainpath':
        return PathwayCategory.mainPath();
      case 'connector':
        return PathwayCategory.connector();
      case 'perimeter':
        return PathwayCategory.perimeter();
      case 'emergency':
        return PathwayCategory.emergency();
      case 'parking':
        return PathwayCategory.parking();
      case 'open_space':
      case 'openspace':
        return PathwayCategory.openSpace();
      default:
        return PathwayCategory.other();
    }
  }
}

/// Color mapping for pathway categories
extension PathwayCategoryColor on PathwayCategory {
  int get colorValue {
    return when(
      mainPath: () => 0xFF2196F3, // Blue
      connector: () => 0xFF4CAF50, // Green
      perimeter: () => 0xFF9E9E9E, // Grey
      emergency: () => 0xFFF44336, // Red
      parking: () => 0xFF607D8B, // Blue Grey
      openSpace: () => 0xFF8BC34A, // Light Green
      other: () => 0xFF757575, // Grey
    );
  }

  String get label {
    return when(
      mainPath: () => 'Main Path',
      connector: () => 'Connector',
      perimeter: () => 'Perimeter',
      emergency: () => 'Emergency',
      parking: () => 'Parking',
      openSpace: () => 'Open Space',
      other: () => 'Other',
    );
  }

  double get defaultWidth {
    return when(
      mainPath: () => 4.0,
      connector: () => 2.5,
      perimeter: () => 2.0,
      emergency: () => 4.0,
      parking: () => 0.0, // Polygon
      openSpace: () => 0.0, // Polygon
      other: () => 2.0,
    );
  }
}