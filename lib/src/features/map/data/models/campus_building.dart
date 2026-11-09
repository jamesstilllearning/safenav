/// SAFENAV CAVITE - Campus Building Model
///
/// Represents a building on the EARIST Cavite Campus with polygon geometry
/// and metadata from OpenStreetMap.
library;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'campus_building.freezed.dart';
part 'campus_building.g.dart';

/// Category of campus buildings for filtering and styling
@freezed
abstract class BuildingCategory with _$BuildingCategory {
  const factory BuildingCategory.academic() = _Academic;
  const factory BuildingCategory.administrative() = _Administrative;
  const factory BuildingCategory.library() = _Library;
  const factory BuildingCategory.laboratory() = _Laboratory;
  const factory BuildingCategory.gymnasium() = _Gymnasium;
  const factory BuildingCategory.cafeteria() = _Cafeteria;
  const factory BuildingCategory.dormitory() = _Dormitory;
  const factory BuildingCategory.parking() = _Parking;
  const factory BuildingCategory.other() = _Other;
}

/// JSON converter for BuildingCategory
class BuildingCategoryConverter implements JsonConverter<BuildingCategory, String> {
  const BuildingCategoryConverter();

  @override
  BuildingCategory fromJson(String json) {
    return json.toBuildingCategory();
  }

  @override
  String toJson(BuildingCategory object) {
    return object.label.toLowerCase();
  }
}

/// Campus building model with polygon geometry
@freezed
abstract class CampusBuilding with _$CampusBuilding {
  const CampusBuilding._();

  const factory CampusBuilding({
    required String id,
    required int osmWayId,
    required String name,
    required String buildingType,
    @BuildingCategoryConverter() required BuildingCategory category,
    required String description,
    required String source,
    required String sourceDate,
    required String verificationStatus,
    required List<LatLng> polygon,
    required LatLng centroid,
    double? areaSqMeters,
    int? floors,
    String? address,
    Map<String, dynamic>? additionalTags,
  }) = _CampusBuilding;

  factory CampusBuilding.fromJson(Map<String, dynamic> json) =>
      _$CampusBuildingFromJson(json);

  /// Calculate approximate area in square meters using Haversine formula
  double calculateArea() {
    if (polygon.length < 3) return 0.0;
    if (areaSqMeters != null) return areaSqMeters!;

    double area = 0.0;
    for (int i = 0; i < polygon.length - 1; i++) {
      final p1 = polygon[i];
      final p2 = polygon[i + 1];
      area += (p2.longitude - p1.longitude) *
          (2 + (p1.latitude + p2.latitude) / 90.0);
    }
    // Convert to approximate square meters (rough approximation)
    return (area * 111320.0 * 111320.0).abs() / 2.0;
  }

  /// Get center point for marker placement
  LatLng get center => centroid;

  /// Check if a point is inside the building polygon
  bool containsPoint(LatLng point) {
    if (polygon.length < 3) return false;
    bool inside = false;
    for (int i = 0, j = polygon.length - 1; i < polygon.length; j = i++) {
      final pi = polygon[i];
      final pj = polygon[j];
      if (((pi.latitude > point.latitude) != (pj.latitude > point.latitude)) &&
          (point.longitude <
              (pj.longitude - pi.longitude) *
                      (point.latitude - pi.latitude) /
                      (pj.latitude - pi.latitude) +
                  pi.longitude)) {
        inside = !inside;
      }
    }
    return inside;
  }
}

/// Extension to parse BuildingCategory from string
extension BuildingCategoryX on String {
  BuildingCategory toBuildingCategory() {
    switch (toLowerCase()) {
      case 'academic':
        return BuildingCategory.academic();
      case 'administrative':
        return BuildingCategory.administrative();
      case 'library':
        return BuildingCategory.library();
      case 'laboratory':
        return BuildingCategory.laboratory();
      case 'gymnasium':
        return BuildingCategory.gymnasium();
      case 'cafeteria':
        return BuildingCategory.cafeteria();
      case 'dormitory':
        return BuildingCategory.dormitory();
      case 'parking':
        return BuildingCategory.parking();
      default:
        return BuildingCategory.other();
    }
  }
}

/// Color mapping for building categories
extension BuildingCategoryColor on BuildingCategory {
  int get colorValue {
    return when(
      academic: () => 0xFF2196F3, // Blue
      administrative: () => 0xFF9C27B0, // Purple
      library: () => 0xFF4CAF50, // Green
      laboratory: () => 0xFFFF9800, // Orange
      gymnasium: () => 0xFFE91E63, // Pink
      cafeteria: () => 0xFF795548, // Brown
      dormitory: () => 0xFF3F51B5, // Indigo
      parking: () => 0xFF607D8B, // Blue Grey
      other: () => 0xFF757575, // Grey
    );
  }

  String get label {
    return when(
      academic: () => 'Academic',
      administrative: () => 'Administrative',
      library: () => 'Library',
      laboratory: () => 'Laboratory',
      gymnasium: () => 'Gymnasium',
      cafeteria: () => 'Cafeteria',
      dormitory: () => 'Dormitory',
      parking: () => 'Parking',
      other: () => 'Other',
    );
  }
}