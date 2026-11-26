/// SAFENAV CAVITE - Campus Boundary Model
///
/// Represents the campus boundary polygon from OpenStreetMap.
library;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'campus_boundary.freezed.dart';
part 'campus_boundary.g.dart';

/// Simple bounding box
class LatLngBounds {
  final LatLng southWest;
  final LatLng northEast;

  const LatLngBounds({
    required this.southWest,
    required this.northEast,
  });

  LatLng get center => LatLng(
    (southWest.latitude + northEast.latitude) / 2,
    (southWest.longitude + northEast.longitude) / 2,
  );
}

/// Campus boundary model with polygon geometry
@freezed
abstract class CampusBoundary with _$CampusBoundary {
  const CampusBoundary._();

  const factory CampusBoundary({
    required String id,
    required String name,
    required String shortName,
    required String amenity,
    required String city,
    required String street,
    String? wikidata,
    required int osmRelationId,
    required String source,
    required String sourceDate,
    required String verificationStatus,
    required String description,
    required List<LatLng> polygon,
    LatLng? centroid,
    double? areaSqMeters,
    Map<String, dynamic>? additionalTags,
  }) = _CampusBoundary;

  factory CampusBoundary.fromJson(Map<String, dynamic> json) =>
      _$CampusBoundaryFromJson(json);

  /// Get bounding box for map fitting
  LatLngBounds get bounds {
    if (polygon.isEmpty) {
      return LatLngBounds(
        southWest: LatLng(0, 0),
        northEast: LatLng(0, 0),
      );
    }
    double minLat = polygon.first.latitude;
    double maxLat = polygon.first.latitude;
    double minLng = polygon.first.longitude;
    double maxLng = polygon.first.longitude;

    for (final point in polygon) {
      if (point.latitude < minLat) minLat = point.latitude;
      if (point.latitude > maxLat) maxLat = point.latitude;
      if (point.longitude < minLng) minLng = point.longitude;
      if (point.longitude > maxLng) maxLng = point.longitude;
    }
    return LatLngBounds(
      southWest: LatLng(minLat, minLng),
      northEast: LatLng(maxLat, maxLng),
    );
  }

  /// Calculate approximate area in square meters
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
    return (area * 111320.0 * 111320.0).abs() / 2.0;
  }

  /// Get approximate center for initial map positioning
  LatLng get center {
    if (centroid != null) return centroid!;
    return bounds.center;
  }

  /// Check if a point is inside the campus boundary
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