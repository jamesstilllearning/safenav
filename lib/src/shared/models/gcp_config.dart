/// SAFENAV CAVITE - Ground Control Points Configuration
///
/// Models for Ground Control Points (GCPs) used in campus georeferencing.
/// GCPs are known coordinate pairs linking image/plan coordinates to real-world
/// geographic coordinates (WGS84/EPSG:4326 and UTM Zone 51N/EPSG:32651).
library;

import 'package:freezed_annotation/freezed_annotation.dart';

import 'coordinate.dart';

part 'gcp_config.freezed.dart';
part 'gcp_config.g.dart';

/// A single Ground Control Point linking image/plan coordinates to geographic coordinates.
@freezed
abstract class GroundControlPoint with _$GroundControlPoint {
  const factory GroundControlPoint({
    /// Unique identifier for this GCP
    required String id,

    /// Human-readable label (e.g., "Building A NW Corner")
    required String label,

    /// Image/plan coordinates (normalized 0-1 or pixel coordinates)
    required GcpImageCoordinate imageCoordinate,

    /// Real-world WGS84 coordinate (EPSG:4326)
    required LatLngCoordinate wgs84Coordinate,

    /// Real-world UTM Zone 51N coordinate (EPSG:32651)
    required UtmCoordinate utmCoordinate,

    /// Optional local Cartesian coordinate (meters from campus origin)
    LocalCartesianCoordinate? localCoordinate,

    /// GCP quality/grade
    @Default(GcpGrade.unverified)
    GcpGrade grade,

    /// Source of this GCP
    @Default(GcpSource.manualSurvey)
    GcpSource source,

    /// Date this GCP was collected/verified
    DateTime? collectedAt,

    /// Surveyor/collector name
    String? collectedBy,

    /// Estimated horizontal accuracy in meters
    double? accuracyMeters,

    /// Notes about this GCP
    String? notes,

    /// Metadata for extensibility
    @Default({})
    Map<String, dynamic> metadata,
  }) = _GroundControlPoint;

  factory GroundControlPoint.fromJson(Map<String, dynamic> json) =>
      _$GroundControlPointFromJson(json);
}

/// Image/plan coordinate for a GCP
@freezed
abstract class GcpImageCoordinate with _$GcpImageCoordinate {
  const factory GcpImageCoordinate({
    /// X coordinate (normalized 0-1 or pixels)
    required double x,

    /// Y coordinate (normalized 0-1 or pixels)
    required double y,

    /// Coordinate system type
    @Default(GcpCoordinateSystem.normalized)
    GcpCoordinateSystem coordinateSystem,

    /// Image/plan width (if pixel coordinates)
    int? imageWidth,

    /// Image/plan height (if pixel coordinates)
    int? imageHeight,

    /// Floor level (for multi-floor plans)
    int? floor,
  }) = _GcpImageCoordinate;

  factory GcpImageCoordinate.fromJson(Map<String, dynamic> json) =>
      _$GcpImageCoordinateFromJson(json);
}

/// Coordinate system used for image/plan coordinates
enum GcpCoordinateSystem {
  /// Normalized coordinates (0.0 to 1.0) from top-left
  @JsonValue('normalized')
  normalized,

  /// Pixel coordinates from top-left
  @JsonValue('pixels')
  pixels,

  /// Local Cartesian meters from plan origin
  @JsonValue('local_meters')
  localMeters,
}

/// GCP quality grade
enum GcpGrade {
  /// Survey-grade (< 0.05m accuracy)
  @JsonValue('survey')
  survey,

  /// High-grade GPS (0.05-0.1m accuracy)
  @JsonValue('high')
  high,

  /// Standard GPS (0.1-0.5m accuracy)
  @JsonValue('standard')
  standard,

  /// Approximate/estimated (> 0.5m accuracy)
  @JsonValue('approximate')
  approximate,

  /// Not yet verified
  @JsonValue('unverified')
  unverified,
}

/// Source of GCP data
enum GcpSource {
  /// Professional land survey
  @JsonValue('survey')
  survey,

  /// Manual GPS survey with handheld device
  @JsonValue('manual_survey')
  manualSurvey,

  /// RTK/PPK GPS survey
  @JsonValue('rtk')
  rtk,

  /// Digitized from georeferenced imagery
  @JsonValue('georeferenced_image')
  georeferencedImage,

  /// Extracted from existing GIS data
  @JsonValue('gis_extraction')
  gisExtraction,

  /// Manually identified on campus map
  @JsonValue('manual_digitization')
  manualDigitization,
}

/// Complete GCP configuration for a campus
@freezed
abstract class GcpConfig with _$GcpConfig {
  const factory GcpConfig({
    /// Campus identifier
    required String campusId,

    /// Campus name
    required String campusName,

    /// Coordinate Reference System for the campus (should be UTM 51N)
    @Default(CoordinateReferenceSystem.utm51n)
    CoordinateReferenceSystem targetCrs,

    /// Campus origin in WGS84 (used for local Cartesian)
    required LatLngCoordinate campusOriginWgs84,

    /// Campus origin in UTM 51N
    required UtmCoordinate campusOriginUtm,

    /// All Ground Control Points
    @Default([])
    List<GroundControlPoint> groundControlPoints,

    /// Image/plan reference (e.g., campus map image)
    GcpImageReference? imageReference,

    /// Calibration method used
    @Default(CalibrationMethod.affine)
    CalibrationMethod calibrationMethod,

    /// Affine transform (WGS84 -> Local) - computed from GCPs
    AffineTransform? affineWgs84ToLocal,

    /// Affine transform (Local -> WGS84) - computed from GCPs
    AffineTransform? affineLocalToWgs84,

    /// Projective transform (WGS84 -> Local) - if using 4+ GCPs
    ProjectiveTransform? projectiveWgs84ToLocal,

    /// Projective transform (Local -> WGS84) - if using 4+ GCPs
    ProjectiveTransform? projectiveLocalToWgs84,

    /// Transformation accuracy metrics
    TransformAccuracy? accuracy,

    /// Configuration version
    @Default(1)
    int version,

    /// Last calibration timestamp
    DateTime? calibratedAt,

    /// Calibrated by
    String? calibratedBy,

    /// Notes
    String? notes,

    /// Metadata
    @Default({})
    Map<String, dynamic> metadata,
  }) = _GcpConfig;

  factory GcpConfig.fromJson(Map<String, dynamic> json) => _$GcpConfigFromJson(json);
}

/// Reference to the campus map image/plan used for GCP digitization
@freezed
abstract class GcpImageReference with _$GcpImageReference {
  const factory GcpImageReference({
    /// Image file path (asset or local file)
    required String imagePath,

    /// Image width in pixels
    required int width,

    /// Image height in pixels
    required int height,

    /// Image format (png, jpg, tiff, pdf)
    required String format,

    /// Description of the image (e.g., "Campus master plan 2024")
    String? description,

    /// Source of the image
    String? source,

    /// Date of the image
    DateTime? imageDate,

    /// Coordinate system of the image coordinates
    @Default(GcpCoordinateSystem.pixels)
    GcpCoordinateSystem coordinateSystem,
  }) = _GcpImageReference;

  factory GcpImageReference.fromJson(Map<String, dynamic> json) =>
      _$GcpImageReferenceFromJson(json);
}

/// Calibration method for computing transforms from GCPs
enum CalibrationMethod {
  /// 2-point affine (translation + rotation + uniform scale)
  @JsonValue('similarity')
  similarity,

  /// 3-point affine (translation + rotation + non-uniform scale + shear)
  @JsonValue('affine')
  affine,

  /// 4+ point projective/homography
  @JsonValue('projective')
  projective,

  /// Least squares affine (uses all GCPs)
  @JsonValue('affine_lstsq')
  affineLstsq,

  /// Least squares projective (uses all GCPs)
  @JsonValue('projective_lstsq')
  projectiveLstsq,
}

/// GCP Configuration for different environments
@freezed
abstract class GcpEnvironmentConfig with _$GcpEnvironmentConfig {
  const factory GcpEnvironmentConfig({
    /// Environment name (development, staging, production)
    required String environment,

    /// GCP configuration
    required GcpConfig gcpConfig,

    /// Whether to use mock GPS for testing
    @Default(false)
    bool useMockGps,

    /// Mock GPS location (if useMockGps is true)
    LatLngCoordinate? mockGpsLocation,

    /// Whether to enable debug logging for coordinate transforms
    @Default(false)
    bool debugTransforms,
  }) = _GcpEnvironmentConfig;

  factory GcpEnvironmentConfig.fromJson(Map<String, dynamic> json) =>
      _$GcpEnvironmentConfigFromJson(json);
}

/// Extension methods for GroundControlPoint
extension GroundControlPointExtensions on GroundControlPoint {
  /// Get the image coordinate as normalized (0-1)
  GcpImageCoordinate get normalizedImageCoordinate {
    if (imageCoordinate.coordinateSystem == GcpCoordinateSystem.normalized) {
      return imageCoordinate;
    }
    if (imageCoordinate.coordinateSystem == GcpCoordinateSystem.pixels &&
        imageCoordinate.imageWidth != null &&
        imageCoordinate.imageHeight != null) {
      return GcpImageCoordinate(
        x: imageCoordinate.x / imageCoordinate.imageWidth!,
        y: imageCoordinate.y / imageCoordinate.imageHeight!,
        coordinateSystem: GcpCoordinateSystem.normalized,
        imageWidth: imageCoordinate.imageWidth,
        imageHeight: imageCoordinate.imageHeight,
        floor: imageCoordinate.floor,
      );
    }
    return imageCoordinate;
  }

  /// Check if this GCP has valid coordinates
  bool get isValid {
    return wgs84Coordinate.latitude.abs() <= 90 &&
        wgs84Coordinate.longitude.abs() <= 180 &&
        utmCoordinate.easting > 0 &&
        utmCoordinate.northing > 0 &&
        utmCoordinate.zoneNumber == 51 &&
        utmCoordinate.zoneLetter == 'N';
  }

  /// Get accuracy category as string
  String get accuracyCategory {
    if (accuracyMeters == null) return 'Unknown';
    if (accuracyMeters! < 0.05) return 'Survey Grade';
    if (accuracyMeters! < 0.1) return 'High Precision';
    if (accuracyMeters! < 0.5) return 'Standard';
    return 'Approximate';
  }
}

/// Extension methods for GcpConfig
extension GcpConfigExtensions on GcpConfig {
  /// Get GCPs by grade
  List<GroundControlPoint> getGCPsByGrade(GcpGrade grade) =>
      groundControlPoints.where((gcp) => gcp.grade == grade).toList();

  /// Get verified GCPs (survey, high, standard)
  List<GroundControlPoint> get verifiedGCPs => groundControlPoints
      .where((gcp) =>
          gcp.grade == GcpGrade.survey ||
          gcp.grade == GcpGrade.high ||
          gcp.grade == GcpGrade.standard)
      .toList();

  /// Get GCPs for a specific floor
  List<GroundControlPoint> getGCPsForFloor(int floor) => groundControlPoints
      .where((gcp) => gcp.imageCoordinate.floor == floor)
      .toList();

  /// Check if we have enough GCPs for the calibration method
  bool get hasEnoughGCPs {
    final verified = verifiedGCPs.length;
    switch (calibrationMethod) {
      case CalibrationMethod.similarity:
        return verified >= 2;
      case CalibrationMethod.affine:
      case CalibrationMethod.affineLstsq:
        return verified >= 3;
      case CalibrationMethod.projective:
      case CalibrationMethod.projectiveLstsq:
        return verified >= 4;
    }
  }

  /// Get minimum GCPs required for current calibration method
  int get minGCPsRequired {
    switch (calibrationMethod) {
      case CalibrationMethod.similarity:
        return 2;
      case CalibrationMethod.affine:
      case CalibrationMethod.affineLstsq:
        return 3;
      case CalibrationMethod.projective:
      case CalibrationMethod.projectiveLstsq:
        return 4;
    }
  }

  /// Get transformation accuracy summary
  String get accuracySummary {
    if (accuracy == null) return 'Not calibrated';
    return 'RMSE: ${accuracy!.rmse.toStringAsFixed(3)}m, '
        'Max: ${accuracy!.maxError.toStringAsFixed(3)}m, '
        'Points: ${accuracy!.pointCount}';
  }

  /// Check if configuration is valid for use
  bool get isValidForUse {
    if (!hasEnoughGCPs) return false;
    if (affineWgs84ToLocal == null && projectiveWgs84ToLocal == null) {
      return false;
    }
    if (accuracy != null && accuracy!.rmse > 5.0) return false; // >5m RMSE is too high
    return true;
  }

  /// Get the active transform (projective preferred if available)
  AffineTransform get activeAffineTransform => affineWgs84ToLocal ??
      const AffineTransform(a: 1.0, b: 0.0, c: 0.0, d: 1.0, e: 0.0, f: 0.0);

  ProjectiveTransform? get activeProjectiveTransform =>
      projectiveWgs84ToLocal;
}

/// Default EARIST Cavite GCP configuration template
GcpConfig earistCaviteGcpTemplate() {
  return GcpConfig(
    campusId: 'earist-cavite',
    campusName: 'EARIST Cavite Campus',
    targetCrs: CoordinateReferenceSystem.utm51n,
    campusOriginWgs84: const LatLngCoordinate(
      latitude: 14.375,
      longitude: 120.887,
    ),
    campusOriginUtm: const UtmCoordinate(
      easting: 265000,
      northing: 1592000,
      zoneNumber: 51,
      zoneLetter: 'N',
    ),
    groundControlPoints: [],
    calibrationMethod: CalibrationMethod.affineLstsq,
    version: 1,
    calibratedAt: DateTime.now(),
    notes:
        'Template - add GCPs from field survey. Minimum 3 verified GCPs required for affine calibration.',
    metadata: {
      'utmZone': '51N',
      'epsgCode': 32651,
      'campusBounds': {
        'minLat': 14.370,
        'maxLat': 14.380,
        'minLng': 120.880,
        'maxLng': 120.895,
      },
      'expectedGcpCount': 10,
      'surveyMethod': 'RTK_GPS',
    },
  );
}

/// Environment-specific configurations
extension GcpEnvironmentConfigTemplates on GcpEnvironmentConfig {
  /// Development environment with mock GPS
  static GcpEnvironmentConfig development() {
    return GcpEnvironmentConfig(
      environment: 'development',
      gcpConfig: earistCaviteGcpTemplate(),
      useMockGps: true,
      mockGpsLocation: const LatLngCoordinate(
        latitude: 14.375,
        longitude: 120.887,
      ),
      debugTransforms: true,
    );
  }

  /// Staging environment with real GPS
  static GcpEnvironmentConfig staging() {
    return GcpEnvironmentConfig(
      environment: 'staging',
      gcpConfig: earistCaviteGcpTemplate(),
      useMockGps: false,
      debugTransforms: true,
    );
  }

  /// Production environment
  static GcpEnvironmentConfig production() {
    return GcpEnvironmentConfig(
      environment: 'production',
      gcpConfig: earistCaviteGcpTemplate(),
      useMockGps: false,
      debugTransforms: false,
    );
  }
}