/// SAFENAV CAVITE - Coordinate Models
///
/// Data models for coordinate reference systems and transformations.
library;

import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

import '../../core/services/coordinate_transformer.dart';

part 'coordinate.freezed.dart';
part 'coordinate.g.dart';

/// Coordinate Reference System (CRS) enumeration
enum CoordinateReferenceSystem {
  /// WGS 84 / EPSG:4326 (Latitude/Longitude)
  @JsonValue('wgs84')
  wgs84,

  /// UTM Zone 51N / EPSG:32651
  @JsonValue('utm51n')
  utm51n,

  /// Campus Local Cartesian (meters from origin, custom CRS)
  @JsonValue('local_cartesian')
  localCartesian;

  /// EPSG code for this CRS
  int get epsgCode => switch (this) {
    CoordinateReferenceSystem.wgs84 => 4326,
    CoordinateReferenceSystem.utm51n => 32651,
    CoordinateReferenceSystem.localCartesian => -1, // Custom, no EPSG
  };

  /// Human-readable name
  String get displayName => switch (this) {
    CoordinateReferenceSystem.wgs84 => 'WGS 84 (Lat/Lon)',
    CoordinateReferenceSystem.utm51n => 'UTM Zone 51N (EPSG:32651)',
    CoordinateReferenceSystem.localCartesian => 'Campus Local Cartesian',
  };
}

/// Latitude/Longitude coordinate (WGS84 / EPSG:4326)
@freezed
abstract class LatLngCoordinate with _$LatLngCoordinate {
  const factory LatLngCoordinate({
    required double latitude,
    required double longitude,
    double? altitude,
  }) = _LatLngCoordinate;

  factory LatLngCoordinate.fromJson(Map<String, dynamic> json) =>
      _$LatLngCoordinateFromJson(json);
}

/// UTM Zone 51N coordinate (EPSG:32651)
@freezed
abstract class UtmCoordinate with _$UtmCoordinate {
  const factory UtmCoordinate({
    required double easting,
    required double northing,
    required int zoneNumber,
    required String zoneLetter,
  }) = _UtmCoordinate;

  factory UtmCoordinate.fromJson(Map<String, dynamic> json) =>
      _$UtmCoordinateFromJson(json);
}

/// Local Cartesian coordinate (meters from campus origin)
@freezed
abstract class LocalCartesianCoordinate with _$LocalCartesianCoordinate {
  const factory LocalCartesianCoordinate({
    required double x, // Easting in meters from origin
    required double y, // Northing in meters from origin
    int? floor, // Building floor level
  }) = _LocalCartesianCoordinate;

  factory LocalCartesianCoordinate.fromJson(Map<String, dynamic> json) =>
      _$LocalCartesianCoordinateFromJson(json);
}

/// Affine transformation parameters (6 parameters)
@freezed
abstract class AffineTransform with _$AffineTransform {
  const factory AffineTransform({
    required double a, // Scale X + rotation
    required double b, // Shear Y
    required double c, // Shear X
    required double d, // Scale Y + rotation
    required double e, // Translation X
    required double f, // Translation Y
  }) = _AffineTransform;

  factory AffineTransform.fromJson(Map<String, dynamic> json) =>
      _$AffineTransformFromJson(json);
}

/// Projective transformation parameters (8 parameters / 3x3 matrix homogeneous)
@freezed
abstract class ProjectiveTransform with _$ProjectiveTransform {
  const factory ProjectiveTransform({
    required double m00,
    required double m01,
    required double m02,
    required double m10,
    required double m11,
    required double m12,
    required double m20,
    required double m21,
  }) = _ProjectiveTransform;

  factory ProjectiveTransform.fromJson(Map<String, dynamic> json) =>
      _$ProjectiveTransformFromJson(json);
}

/// Campus georeferencing configuration
@freezed
abstract class CampusGeoreference with _$CampusGeoreference {
  const factory CampusGeoreference({
    required String campusId,
    required String campusName,
    required LatLngCoordinate wgs84Origin, // Campus origin in WGS84
    required UtmCoordinate utmOrigin, // Campus origin in UTM 51N
    required LocalCartesianCoordinate localOrigin, // Should be (0,0)
    @Default(AffineTransform(a: 1.0, b: 0.0, c: 0.0, d: 1.0, e: 0.0, f: 0.0))
    AffineTransform wgs84ToLocal,
    @Default(AffineTransform(a: 1.0, b: 0.0, c: 0.0, d: 1.0, e: 0.0, f: 0.0))
    AffineTransform localToWgs84,
    @Default(AffineTransform(a: 1.0, b: 0.0, c: 0.0, d: 1.0, e: 0.0, f: 0.0))
    AffineTransform utmToLocal,
    @Default(AffineTransform(a: 1.0, b: 0.0, c: 0.0, d: 1.0, e: 0.0, f: 0.0))
    AffineTransform localToUtm,
    ProjectiveTransform? projectiveWgs84ToLocal,
    ProjectiveTransform? projectiveLocalToWgs84,
    required DateTime calibratedAt,
    String? calibrationMethod, // 'gcp', 'affine_fit', 'projective_fit'
    List<LatLngCoordinate>? groundControlPointsWgs84,
    List<LocalCartesianCoordinate>? groundControlPointsLocal,
    Map<String, dynamic>? metadata,
  }) = _CampusGeoreference;

  factory CampusGeoreference.fromJson(Map<String, dynamic> json) =>
      _$CampusGeoreferenceFromJson(json);
}

/// Transformation result with accuracy info
@freezed
abstract class TransformResult with _$TransformResult {
  const factory TransformResult.success({
    required dynamic value,
    double? accuracyMeters,
    String? method,
  }) = _TransformSuccess;

  const factory TransformResult.failure({
    required String error,
    String? code,
    Map<String, dynamic>? details,
  }) = _TransformFailure;

  factory TransformResult.fromJson(Map<String, dynamic> json) =>
      _$TransformResultFromJson(json);
}

/// Transformation accuracy metrics
@freezed
abstract class TransformAccuracy with _$TransformAccuracy {
  const factory TransformAccuracy({
    required double meanError,
    required double rmse,
    required double maxError,
    required int pointCount,
  }) = _TransformAccuracy;

  factory TransformAccuracy.fromJson(Map<String, dynamic> json) =>
      _$TransformAccuracyFromJson(json);
}

/// Extension for coordinate conversions
extension LatLngCoordinateExtensions on LatLngCoordinate {
  /// Creates from latlong2 LatLng
  static LatLngCoordinate fromLatLng(LatLng latLng) =>
      LatLngCoordinate(latitude: latLng.latitude, longitude: latLng.longitude);

  /// Converts to latlong2 LatLng
  LatLng toLatLng() => LatLng(latitude, longitude);

  /// Convert to UTM Zone 51N
  UtmCoordinate toUtm51n() => CoordinateTransformer.wgs84ToUtm51n(this);

  /// Convert to local Cartesian (requires calibrated georeference)
  LocalCartesianCoordinate toLocalCartesian(CampusGeoreference georef) =>
      CoordinateTransformer.wgs84ToLocal(this, georef);

  /// Distance to another coordinate in meters (Haversine)
  double distanceTo(LatLngCoordinate other) =>
      CoordinateTransformer.haversineDistance(this, other);
}

/// Extension for LocalCartesianCoordinate
extension LocalCartesianCoordinateExtensions on LocalCartesianCoordinate {
  /// Distance to another local coordinate in meters
  double distanceTo(LocalCartesianCoordinate other) {
    final dx = other.x - x;
    final dy = other.y - y;
    return sqrt(dx * dx + dy * dy);
  }

  /// Convert to WGS84 (requires calibrated georeference)
  LatLngCoordinate toWgs84(CampusGeoreference georef) =>
      CoordinateTransformer.localToWgs84(this, georef);

  /// Convert to UTM 51N (requires calibrated georeference)
  UtmCoordinate toUtm51n(CampusGeoreference georef) =>
      CoordinateTransformer.localToUtm51n(this, georef);
}

/// Extension for AffineTransform helper methods
extension AffineTransformExtensions on AffineTransform {
  /// Identity transform
  static AffineTransform identity() =>
      const AffineTransform(a: 1.0, b: 0.0, c: 0.0, d: 1.0, e: 0.0, f: 0.0);

  /// Creates from scale, rotation, translation
  static AffineTransform fromComponents({
    required double scaleX,
    required double scaleY,
    required double rotationRad,
    required double translateX,
    required double translateY,
    double shearX = 0.0,
    double shearY = 0.0,
  }) {
    final cosR = cos(rotationRad);
    final sinR = sin(rotationRad);
    return AffineTransform(
      a: scaleX * cosR + shearY * sinR,
      b: scaleX * sinR - shearY * cosR,
      c: shearX * cosR + scaleY * sinR,
      d: -shearX * sinR + scaleY * cosR,
      e: translateX,
      f: translateY,
    );
  }

  /// Apply transform to a point
  (double x, double y) apply(double x, double y) {
    return (a * x + b * y + e, c * x + d * y + f);
  }

  /// Apply transform to LatLngCoordinate
  LatLngCoordinate applyLatLng(LatLngCoordinate coord) {
    final (newX, newY) = apply(coord.longitude, coord.latitude);
    return LatLngCoordinate(latitude: newY, longitude: newX);
  }

  /// Apply transform to LocalCartesianCoordinate
  LocalCartesianCoordinate applyLocal(LocalCartesianCoordinate coord) {
    final (newX, newY) = apply(coord.x, coord.y);
    return LocalCartesianCoordinate(x: newX, y: newY, floor: coord.floor);
  }

  /// Inverse transform (if invertible)
  AffineTransform? inverse() {
    final det = a * d - b * c;
    if (det.abs() < 1e-10) return null; // Singular

    final invDet = 1.0 / det;
    return AffineTransform(
      a: d * invDet,
      b: -b * invDet,
      c: -c * invDet,
      d: a * invDet,
      e: (c * f - d * e) * invDet,
      f: (b * e - a * f) * invDet,
    );
  }

  /// Compose with another transform (this ∘ other)
  AffineTransform compose(AffineTransform other) {
    return AffineTransform(
      a: a * other.a + b * other.c,
      b: a * other.b + b * other.d,
      c: c * other.a + d * other.c,
      d: c * other.b + d * other.d,
      e: a * other.e + b * other.f + e,
      f: c * other.e + d * other.f + f,
    );
  }

  /// Checks if transform is identity
  bool get isIdentity {
    return (a - 1.0).abs() < 1e-10 &&
        b.abs() < 1e-10 &&
        c.abs() < 1e-10 &&
        (d - 1.0).abs() < 1e-10 &&
        e.abs() < 1e-10 &&
        f.abs() < 1e-10;
  }
}

/// Extension for ProjectiveTransform helper methods
extension ProjectiveTransformExtensions on ProjectiveTransform {
  /// Identity projective transform
  static ProjectiveTransform identity() => const ProjectiveTransform(
    m00: 1.0,
    m01: 0.0,
    m02: 0.0,
    m10: 0.0,
    m11: 1.0,
    m12: 0.0,
    m20: 0.0,
    m21: 0.0,
  );

  /// Creates from 4 control point pairs (source -> destination)
  /// Solves for homography using DLT algorithm
  static ProjectiveTransform fromControlPoints({
    required List<(double x, double y)> srcPoints,
    required List<(double x, double y)> dstPoints,
  }) {
    if (srcPoints.length != 4 || dstPoints.length != 4) {
      throw ArgumentError(
        'Projective transform requires exactly 4 control point pairs',
      );
    }

    // Build matrix A for Ax = 0 (DLT)
    final List<List<double>> A = [];
    for (int i = 0; i < 4; i++) {
      final (x, y) = srcPoints[i];
      final (xp, yp) = dstPoints[i];
      A.add([-x, -y, -1, 0, 0, 0, x * xp, y * xp, xp]);
      A.add([0, 0, 0, -x, -y, -1, x * yp, y * yp, yp]);
    }

    // Solve using SVD (simplified - use least squares)
    final h = _solveHomography(A);
    return ProjectiveTransform(
      m00: h[0],
      m01: h[1],
      m02: h[2],
      m10: h[3],
      m11: h[4],
      m12: h[5],
      m20: h[6],
      m21: h[7],
    );
  }

  /// Apply projective transform to point
  (double x, double y) apply(double x, double y) {
    final w = m20 * x + m21 * y + 1.0;
    if (w.abs() < 1e-10) {
      return (double.infinity, double.infinity);
    }
    final newX = (m00 * x + m01 * y + m02) / w;
    final newY = (m10 * x + m11 * y + m12) / w;
    return (newX, newY);
  }

  /// Apply to LatLngCoordinate
  LatLngCoordinate applyLatLng(LatLngCoordinate coord) {
    final (newX, newY) = apply(coord.longitude, coord.latitude);
    return LatLngCoordinate(latitude: newY, longitude: newX);
  }

  /// Apply to LocalCartesianCoordinate
  LocalCartesianCoordinate applyLocal(LocalCartesianCoordinate coord) {
    final (newX, newY) = apply(coord.x, coord.y);
    return LocalCartesianCoordinate(x: newX, y: newY, floor: coord.floor);
  }

  // Simplified homography solver (8 DOF)
  static List<double> _solveHomography(List<List<double>> A) {
    // Use simple Gaussian elimination for 8x8 system
    // In production, consider using a proper linear algebra library
    final n = 8;
    final m = List.generate(n, (i) => List<double>.from(A[i]));

    // Forward elimination
    for (int i = 0; i < n; i++) {
      // Find pivot
      int maxRow = i;
      for (int k = i + 1; k < n; k++) {
        if (m[k][i].abs() > m[maxRow][i].abs()) maxRow = k;
      }
      if (m[maxRow][i].abs() < 1e-10) continue;
      if (maxRow != i) {
        final tmp = m[i];
        m[i] = m[maxRow];
        m[maxRow] = tmp;
      }

      // Normalize pivot row
      final piv = m[i][i];
      for (int j = i; j <= n; j++) {
        m[i][j] /= piv;
      }

      // Eliminate below
      for (int k = i + 1; k < n; k++) {
        final factor = m[k][i];
        for (int j = i; j <= n; j++) {
          m[k][j] -= factor * m[i][j];
        }
      }
    }

    // Back substitution
    final x = List<double>.filled(n, 0);
    for (int i = n - 1; i >= 0; i--) {
      x[i] = m[i][n];
      for (int j = i + 1; j < n; j++) {
        x[i] -= m[i][j] * x[j];
      }
    }
    return x;
  }
}

/// Extension for CampusGeoreference helper methods
extension CampusGeoreferenceExtensions on CampusGeoreference {
  /// Default EARIST Cavite campus georeference (approximate)
  static CampusGeoreference earistCaviteDefault() {
    // EARIST Cavite approximate center: 14.375°N, 120.887°E
    const originLat = 14.375;
    const originLng = 120.887;

    return CampusGeoreference(
      campusId: 'earist-cavite',
      campusName: 'EARIST Cavite Campus',
      wgs84Origin: LatLngCoordinate(latitude: originLat, longitude: originLng),
      utmOrigin: UtmCoordinate(
        easting: 265000,
        northing: 1592000,
        zoneNumber: 51,
        zoneLetter: 'N',
      ),
      localOrigin: const LocalCartesianCoordinate(x: 0, y: 0),
      calibratedAt: DateTime.now(),
      calibrationMethod: 'approximate',
      metadata: {
        'note': 'Approximate - needs GPS survey for accurate calibration',
      },
    );
  }
}
