/// SAFENAV CAVITE - Coordinate Transformer Service
///
/// Handles coordinate transformations between:
/// - WGS84 (EPSG:4326) latitude/longitude
/// - UTM Zone 51N (EPSG:32651)
/// - Campus Local Cartesian (meters from origin)
/// - Affine transformations (for georeferencing calibration)
/// - Projective transformations (for perspective correction)
library;

import 'dart:math';

import 'package:latlong2/latlong.dart';

import '../../shared/models/coordinate.dart';

/// Coordinate transformation service
class CoordinateTransformer {
  CoordinateTransformer._();

  static final CoordinateTransformer _instance = CoordinateTransformer._();
  static CoordinateTransformer get instance => _instance;

  // WGS84 ellipsoid constants (used by UTM)
  static const double _wgs84A = 6378137.0; // Semi-major axis
  static const double _wgs84F = 1 / 298.257223563; // Flattening
  static const double _wgs84E2 =
      2 * _wgs84F - _wgs84F * _wgs84F; // Eccentricity squared

  // UTM constants
  static const double _utmK0 = 0.9996; // Scale factor
  static const double _utmFalseEasting = 500000.0;
  static const double _utmFalseNorthing = 0.0; // Northern hemisphere

  // UTM Zone 51N central meridian
  static const int _utmZone51 = 51;
  static const double _utmCentralMeridian51 = 123.0; // 51 * 6 - 183 = 123°E

  /// Converts WGS84 (lat/lon) to UTM Zone 51N
  ///
  /// Uses standard UTM projection formulas (EPSG:32651)
  /// Input: latitude in degrees, longitude in degrees
  /// Output: UtmCoordinate with easting, northing in meters
  static UtmCoordinate wgs84ToUtm51n(LatLngCoordinate coord) {
    final lat = coord.latitude;
    final lon = coord.longitude;

    // Convert to radians
    final latRad = lat * pi / 180.0;
    final lonRad = lon * pi / 180.0;
    final centralMeridianRad = _utmCentralMeridian51 * pi / 180.0;

    // Trigonometric values
    final sinLat = sin(latRad);
    final cosLat = cos(latRad);
    final tanLat = tan(latRad);
    final tan2Lat = tanLat * tanLat;

    // Meridional arc
    final n = _wgs84A / sqrt(1 - _wgs84E2 * sinLat * sinLat);
    final t = tan2Lat;
    final c = _wgs84E2 * cosLat * cosLat / (1 - _wgs84E2);
    final a = (lonRad - centralMeridianRad) * cosLat;

    // Calculate M (meridional arc)
    final e2 = _wgs84E2;
    final e4 = e2 * e2;
    final e6 = e4 * e2;
    final m =
        _wgs84A *
        ((1 - e2 / 4 - 3 * e4 / 64 - 5 * e6 / 256) * latRad -
            (3 * e2 / 8 + 3 * e4 / 32 + 45 * e6 / 1024) * sin(2 * latRad) +
            (15 * e4 / 256 + 45 * e6 / 1024) * sin(4 * latRad) -
            (35 * e6 / 3072) * sin(6 * latRad));

    // Easting
    final a2 = a * a;
    final a3 = a2 * a;
    final a4 = a3 * a;
    final a5 = a4 * a;
    final a6 = a5 * a;

    final easting =
        _utmK0 *
            n *
            (a +
                (1 - t + c) * a3 / 6 +
                (5 - 18 * t + t * t + 72 * c - 58 * _wgs84E2) * a5 / 120) +
        _utmFalseEasting;

    // Northing
    final northing =
        _utmK0 *
            (m +
                n *
                    tanLat *
                    (a2 / 2 +
                        (5 - t + 9 * c + 4 * c * c) * a4 / 24 +
                        (61 - 58 * t + t * t + 600 * c - 330 * _wgs84E2) *
                            a6 /
                            720)) +
        _utmFalseNorthing;

    return UtmCoordinate(
      easting: easting,
      northing: northing,
      zoneNumber: _utmZone51,
      zoneLetter: 'N',
    );
  }

  /// Converts UTM Zone 51N to WGS84 (lat/lon)
  ///
  /// Inverse of wgs84ToUtm51n using iterative method
  static LatLngCoordinate utm51nToWgs84(UtmCoordinate coord) {
    final easting = coord.easting - _utmFalseEasting;
    final northing = coord.northing - _utmFalseNorthing;
    final centralMeridianRad = _utmCentralMeridian51 * pi / 180.0;

    // Footpoint latitude (initial approximation)
    final m = northing / _utmK0;
    final mu =
        m /
        (_wgs84A *
            (1 -
                _wgs84E2 / 4 -
                3 * _wgs84E2 * _wgs84E2 / 64 -
                5 * _wgs84E2 * _wgs84E2 * _wgs84E2 / 256));

    // Series expansion for footpoint latitude
    final e1 = (1 - sqrt(1 - _wgs84E2)) / (1 + sqrt(1 - _wgs84E2));
    final e1_2 = e1 * e1;
    final e1_3 = e1_2 * e1;
    final e1_4 = e1_3 * e1;

    final latRad =
        mu +
        (3 * e1 / 2 - 27 * e1_3 / 32) * sin(2 * mu) +
        (21 * e1_2 / 16 - 55 * e1_4 / 32) * sin(4 * mu) +
        (151 * e1_3 / 96) * sin(6 * mu) +
        (1097 * e1_4 / 512) * sin(8 * mu);

    // Iterative refinement
    final sinLat = sin(latRad);
    final cosLat = cos(latRad);
    final tanLat = tan(latRad);
    final tan2Lat = tanLat * tanLat;
    final tan4Lat = tan2Lat * tan2Lat;

    final n = _wgs84A / sqrt(1 - _wgs84E2 * sinLat * sinLat);
    final r =
        _wgs84A * (1 - _wgs84E2) / pow(1 - _wgs84E2 * sinLat * sinLat, 1.5);
    final c = _wgs84E2 * cosLat * cosLat / (1 - _wgs84E2);

    final d = easting / (n * _utmK0);
    final d2 = d * d;
    final d3 = d2 * d;
    final d4 = d3 * d;
    final d5 = d4 * d;
    final d6 = d5 * d;

    // Latitude
    final lat =
        latRad -
        (n * tanLat / r) *
            (d2 / 2 -
                (5 + 3 * tan2Lat + 10 * c - 4 * c * c - 9 * _wgs84E2) *
                    d4 /
                    24 +
                (61 +
                        90 * tan2Lat +
                        298 * c +
                        45 * tan4Lat -
                        252 * _wgs84E2 -
                        3 * c * c) *
                    d6 /
                    720);

    // Longitude
    final lon =
        centralMeridianRad +
        (d -
                (1 + 2 * tan2Lat + c) * d3 / 6 +
                (5 -
                        2 * c +
                        28 * tan2Lat -
                        3 * c * c +
                        8 * _wgs84E2 +
                        24 * tan4Lat) *
                    d5 /
                    120) /
            cosLat;

    return LatLngCoordinate(
      latitude: lat * 180.0 / pi,
      longitude: lon * 180.0 / pi,
    );
  }

  /// Converts WGS84 to Local Cartesian (meters from campus origin)
  ///
  /// Uses the campus georeference for transformation.
  /// If georeference has affine/projective transforms, applies them.
  /// Otherwise uses simple equirectangular projection from origin.
  static LocalCartesianCoordinate wgs84ToLocal(
    LatLngCoordinate coord,
    CampusGeoreference georef,
  ) {
    // If projective transform is available, use it
    if (georef.projectiveWgs84ToLocal != null) {
      return georef.projectiveWgs84ToLocal!.applyLocal(
        LocalCartesianCoordinate(x: coord.longitude, y: coord.latitude),
      );
    }

    // If affine transform is available, use it
    if (!georef.wgs84ToLocal.isIdentity) {
      return georef.wgs84ToLocal.applyLocal(
        LocalCartesianCoordinate(x: coord.longitude, y: coord.latitude),
      );
    }

    // Fallback: simple equirectangular projection from campus origin
    final origin = georef.wgs84Origin;
    final originLatRad = origin.latitude * pi / 180.0;

    // Meters per degree at this latitude
    final metersPerDegLat = 111319.49; // ~111.32 km/degree
    final metersPerDegLon = 111319.49 * cos(originLatRad);

    final x = (coord.longitude - origin.longitude) * metersPerDegLon;
    final y = (coord.latitude - origin.latitude) * metersPerDegLat;

    return LocalCartesianCoordinate(x: x, y: y, floor: null);
  }

  /// Converts Local Cartesian to WGS84
  ///
  /// Inverse of wgs84ToLocal
  static LatLngCoordinate localToWgs84(
    LocalCartesianCoordinate coord,
    CampusGeoreference georef,
  ) {
    // If projective transform is available, use it
    if (georef.projectiveLocalToWgs84 != null) {
      return georef.projectiveLocalToWgs84!.applyLatLng(
        LatLngCoordinate(latitude: coord.y, longitude: coord.x),
      );
    }

    // If affine transform is available, use it
    if (!georef.localToWgs84.isIdentity) {
      return georef.localToWgs84.applyLatLng(
        LatLngCoordinate(latitude: coord.y, longitude: coord.x),
      );
    }

    // Fallback: simple equirectangular projection from campus origin
    final origin = georef.wgs84Origin;
    final originLatRad = origin.latitude * pi / 180.0;

    final metersPerDegLat = 111319.49;
    final metersPerDegLon = 111319.49 * cos(originLatRad);

    final lat = origin.latitude + coord.y / metersPerDegLat;
    final lon = origin.longitude + coord.x / metersPerDegLon;

    return LatLngCoordinate(latitude: lat, longitude: lon);
  }

  /// Converts Local Cartesian to UTM 51N
  static UtmCoordinate localToUtm51n(
    LocalCartesianCoordinate coord,
    CampusGeoreference georef,
  ) {
    // If affine transform is available, use it
    if (!georef.localToUtm.isIdentity) {
      final p = georef.localToUtm.apply(coord.x, coord.y);
      return UtmCoordinate(
        easting: p.$1,
        northing: p.$2,
        zoneNumber: _utmZone51,
        zoneLetter: 'N',
      );
    }

    // Otherwise convert via WGS84
    final wgs84 = localToWgs84(coord, georef);
    return wgs84ToUtm51n(wgs84);
  }

  /// Converts UTM 51N to Local Cartesian
  static LocalCartesianCoordinate utm51nToLocal(
    UtmCoordinate coord,
    CampusGeoreference georef,
  ) {
    // If affine transform is available, use it
    if (!georef.utmToLocal.isIdentity) {
      return georef.utmToLocal.applyLocal(
        LocalCartesianCoordinate(x: coord.easting, y: coord.northing),
      );
    }

    // Otherwise convert via WGS84
    final wgs84 = utm51nToWgs84(coord);
    return wgs84ToLocal(wgs84, georef);
  }

  /// Calculates Haversine distance between two WGS84 coordinates in meters
  static double haversineDistance(LatLngCoordinate a, LatLngCoordinate b) {
    const double earthRadius = 6371000.0; // meters

    final lat1Rad = a.latitude * pi / 180.0;
    final lat2Rad = b.latitude * pi / 180.0;
    final dLatRad = (b.latitude - a.latitude) * pi / 180.0;
    final dLonRad = (b.longitude - a.longitude) * pi / 180.0;

    final sinDLat = sin(dLatRad / 2);
    final sinDLon = sin(dLonRad / 2);

    final h =
        sinDLat * sinDLat + cos(lat1Rad) * cos(lat2Rad) * sinDLon * sinDLon;

    return 2 * earthRadius * asin(sqrt(h));
  }

  /// Calculates bearing from point A to point B in degrees (0-360)
  static double bearing(LatLngCoordinate from, LatLngCoordinate to) {
    final lat1Rad = from.latitude * pi / 180.0;
    final lat2Rad = to.latitude * pi / 180.0;
    final dLonRad = (to.longitude - from.longitude) * pi / 180.0;

    final y = sin(dLonRad) * cos(lat2Rad);
    final x =
        cos(lat1Rad) * sin(lat2Rad) -
        sin(lat1Rad) * cos(lat2Rad) * cos(dLonRad);

    final bearingRad = atan2(y, x);
    final bearingDeg = bearingRad * 180.0 / pi;

    return (bearingDeg + 360.0) % 360.0;
  }

  /// Computes affine transform from control point pairs (least squares)
  ///
  /// Given N pairs of (source -> destination) points, computes the best-fit
  /// affine transformation using least squares.
  /// Minimum 3 non-collinear points required.
  static AffineTransform computeAffineTransform({
    required List<(double x, double y)> srcPoints,
    required List<(double x, double y)> dstPoints,
  }) {
    if (srcPoints.length != dstPoints.length) {
      throw ArgumentError('Source and destination point counts must match');
    }
    if (srcPoints.length < 3) {
      throw ArgumentError(
        'At least 3 control points required for affine transform',
      );
    }

    final n = srcPoints.length;

    // Build matrix for least squares: [X Y 1 0 0 0; 0 0 0 X Y 1] * [a b c d e f] = [x' y']
    // We solve: A^T A x = A^T b
    final int numEq = n * 2;
    final int numUnk = 6;

    final A = List.generate(numEq, (_) => List<double>.filled(numUnk, 0));
    final b = List<double>.filled(numEq, 0);

    for (int i = 0; i < n; i++) {
      final (sx, sy) = srcPoints[i];
      final (dx, dy) = dstPoints[i];

      // X equation
      A[i * 2][0] = sx;
      A[i * 2][1] = sy;
      A[i * 2][2] = 1.0;
      b[i * 2] = dx;

      // Y equation
      A[i * 2 + 1][3] = sx;
      A[i * 2 + 1][4] = sy;
      A[i * 2 + 1][5] = 1.0;
      b[i * 2 + 1] = dy;
    }

    // Normal equations: (A^T A) x = A^T b
    final ata = List.generate(numUnk, (_) => List<double>.filled(numUnk, 0));
    final atb = List<double>.filled(numUnk, 0);

    for (int i = 0; i < numEq; i++) {
      for (int j = 0; j < numUnk; j++) {
        atb[j] += A[i][j] * b[i];
        for (int k = 0; k < numUnk; k++) {
          ata[j][k] += A[i][j] * A[i][k];
        }
      }
    }

    // Solve using Gaussian elimination
    final x = _solveLinearSystem(ata, atb);

    return AffineTransform(
      a: x[0],
      b: x[1],
      c: x[2],
      d: x[3],
      e: x[4],
      f: x[5],
    );
  }

  /// Computes projective (homography) transform from 4+ control point pairs
  ///
  /// Uses DLT (Direct Linear Transform) algorithm.
  /// Minimum 4 point pairs required (8 DOF).
  static ProjectiveTransform computeProjectiveTransform({
    required List<(double x, double y)> srcPoints,
    required List<(double x, double y)> dstPoints,
  }) {
    if (srcPoints.length != dstPoints.length) {
      throw ArgumentError('Source and destination point counts must match');
    }
    if (srcPoints.length < 4) {
      throw ArgumentError(
        'At least 4 control points required for projective transform',
      );
    }

    final n = srcPoints.length;
    final numEq = n * 2;
    final numUnk = 8; // m00, m01, m02, m10, m11, m12, m20, m21 (m22 = 1)

    final A = List.generate(numEq, (_) => List<double>.filled(numUnk, 0));
    final b = List<double>.filled(numEq, 0);

    for (int i = 0; i < n; i++) {
      final (x, y) = srcPoints[i];
      final (xp, yp) = dstPoints[i];

      // x' equation: x' = (m00*x + m01*y + m02) / (m20*x + m21*y + 1)
      // Rearranged: x'*(m20*x + m21*y + 1) = m00*x + m01*y + m02
      // x'*m20*x + x'*m21*y + x' = m00*x + m01*y + m02
      // 0 = m00*x + m01*y + m02 - x'*m20*x - x'*m21*y - x'
      A[i * 2][0] = x;
      A[i * 2][1] = y;
      A[i * 2][2] = 1.0;
      A[i * 2][6] = -xp * x;
      A[i * 2][7] = -xp * y;
      b[i * 2] = xp;

      // y' equation: y' = (m10*x + m11*y + m12) / (m20*x + m21*y + 1)
      A[i * 2 + 1][3] = x;
      A[i * 2 + 1][4] = y;
      A[i * 2 + 1][5] = 1.0;
      A[i * 2 + 1][6] = -yp * x;
      A[i * 2 + 1][7] = -yp * y;
      b[i * 2 + 1] = yp;
    }

    // Normal equations
    final ata = List.generate(numUnk, (_) => List<double>.filled(numUnk, 0));
    final atb = List<double>.filled(numUnk, 0);

    for (int i = 0; i < numEq; i++) {
      for (int j = 0; j < numUnk; j++) {
        atb[j] += A[i][j] * b[i];
        for (int k = 0; k < numUnk; k++) {
          ata[j][k] += A[i][j] * A[i][k];
        }
      }
    }

    final x = _solveLinearSystem(ata, atb);

    return ProjectiveTransform(
      m00: x[0],
      m01: x[1],
      m02: x[2],
      m10: x[3],
      m11: x[4],
      m12: x[5],
      m20: x[6],
      m21: x[7],
    );
  }

  /// Calculates transformation accuracy statistics
  static TransformAccuracy calculateAccuracy({
    required List<(double x, double y)> srcPoints,
    required List<(double x, double y)> dstPoints,
    required AffineTransform transform,
  }) {
    if (srcPoints.length != dstPoints.length) {
      throw ArgumentError('Point counts must match');
    }

    double sumError = 0;
    double maxError = 0;
    double sumSqError = 0;

    for (int i = 0; i < srcPoints.length; i++) {
      final (sx, sy) = srcPoints[i];
      final (dx, dy) = dstPoints[i];
      final (tx, ty) = transform.apply(sx, sy);

      final error = sqrt((tx - dx) * (tx - dx) + (ty - dy) * (ty - dy));
      sumError += error;
      sumSqError += error * error;
      if (error > maxError) maxError = error;
    }

    final n = srcPoints.length;
    final meanError = sumError / n;
    final rmse = sqrt(sumSqError / n);

    return TransformAccuracy(
      meanError: meanError,
      rmse: rmse,
      maxError: maxError,
      pointCount: n,
    );
  }

  /// Creates a CampusGeoreference from ground control points
  ///
  /// Fits both affine and projective transforms from GCP pairs.
  /// GCP pairs: (WGS84 coordinate, Local Cartesian coordinate)
  static CampusGeoreference calibrateFromGCPs({
    required String campusId,
    required String campusName,
    required LatLngCoordinate wgs84Origin,
    required UtmCoordinate utmOrigin,
    required List<LatLngCoordinate> gcpWgs84,
    required List<LocalCartesianCoordinate> gcpLocal,
    String? calibrationMethod,
  }) {
    if (gcpWgs84.length != gcpLocal.length) {
      throw ArgumentError('GCP coordinate counts must match');
    }
    if (gcpWgs84.length < 3) {
      throw ArgumentError('At least 3 GCPs required for calibration');
    }

    // Convert to point pairs for affine fitting
    // Source: WGS84 (lon, lat), Destination: Local (x, y)
    final srcPoints = gcpWgs84.map((c) => (c.longitude, c.latitude)).toList();
    final dstPoints = gcpLocal.map((c) => (c.x, c.y)).toList();

    // Fit affine transform (WGS84 -> Local)
    final affineWgs84ToLocal = computeAffineTransform(
      srcPoints: srcPoints,
      dstPoints: dstPoints,
    );

    // Fit inverse affine transform (Local -> WGS84)
    final srcPointsInv = gcpLocal.map((c) => (c.x, c.y)).toList();
    final dstPointsInv = gcpWgs84
        .map((c) => (c.longitude, c.latitude))
        .toList();
    final affineLocalToWgs84 = computeAffineTransform(
      srcPoints: srcPointsInv,
      dstPoints: dstPointsInv,
    );

    // Fit UTM <-> Local transforms
    final utmPoints = gcpWgs84.map(wgs84ToUtm51n).toList();
    final utmSrcPoints = utmPoints.map((u) => (u.easting, u.northing)).toList();
    final affineUtmToLocal = computeAffineTransform(
      srcPoints: utmSrcPoints,
      dstPoints: dstPoints,
    );
    final affineLocalToUtm = computeAffineTransform(
      srcPoints: dstPoints,
      dstPoints: utmSrcPoints,
    );

    // Fit projective transforms if enough points (4+)
    ProjectiveTransform? projectiveWgs84ToLocal;
    ProjectiveTransform? projectiveLocalToWgs84;

    if (gcpWgs84.length >= 4) {
      projectiveWgs84ToLocal = computeProjectiveTransform(
        srcPoints: srcPoints,
        dstPoints: dstPoints,
      );
      projectiveLocalToWgs84 = computeProjectiveTransform(
        srcPoints: dstPoints,
        dstPoints: srcPoints,
      );
    }

    return CampusGeoreference(
      campusId: campusId,
      campusName: campusName,
      wgs84Origin: wgs84Origin,
      utmOrigin: utmOrigin,
      localOrigin: const LocalCartesianCoordinate(x: 0, y: 0),
      wgs84ToLocal: affineWgs84ToLocal,
      localToWgs84: affineLocalToWgs84,
      utmToLocal: affineUtmToLocal,
      localToUtm: affineLocalToUtm,
      projectiveWgs84ToLocal: projectiveWgs84ToLocal,
      projectiveLocalToWgs84: projectiveLocalToWgs84,
      calibratedAt: DateTime.now(),
      calibrationMethod: calibrationMethod ?? 'gcp_fit',
      groundControlPointsWgs84: gcpWgs84,
      groundControlPointsLocal: gcpLocal,
    );
  }

  // Gaussian elimination for linear system Ax = b
  static List<double> _solveLinearSystem(List<List<double>> A, List<double> b) {
    final n = A.length;
    final aug = List.generate(n, (i) => List<double>.from(A[i])..add(b[i]));

    // Forward elimination
    for (int i = 0; i < n; i++) {
      // Find pivot
      int maxRow = i;
      for (int k = i + 1; k < n; k++) {
        if (aug[k][i].abs() > aug[maxRow][i].abs()) maxRow = k;
      }
      if (aug[maxRow][i].abs() < 1e-12) {
        // Singular or near-singular matrix
        // Return identity-like solution
        return List.generate(n, (i) => i < 6 && i % 3 == 0 ? 1.0 : 0.0);
      }
      if (maxRow != i) {
        final tmp = aug[i];
        aug[i] = aug[maxRow];
        aug[maxRow] = tmp;
      }

      // Normalize pivot row
      final piv = aug[i][i];
      for (int j = i; j <= n; j++) {
        aug[i][j] /= piv;
      }

      // Eliminate below and above
      for (int k = 0; k < n; k++) {
        if (k == i) continue;
        final factor = aug[k][i];
        for (int j = i; j <= n; j++) {
          aug[k][j] -= factor * aug[i][j];
        }
      }
    }

    // Extract solution
    return List.generate(n, (i) => aug[i][n]);
  }
}

/// Transformation accuracy metrics
class TransformAccuracy {
  const TransformAccuracy({
    required this.meanError,
    required this.rmse,
    required this.maxError,
    required this.pointCount,
  });

  final double meanError;
  final double rmse;
  final double maxError;
  final int pointCount;

  @override
  String toString() =>
      'TransformAccuracy(meanError: ${meanError.toStringAsFixed(3)}m, '
      'rmse: ${rmse.toStringAsFixed(3)}m, maxError: ${maxError.toStringAsFixed(3)}m, '
      'pointCount: $pointCount)';

  Map<String, dynamic> toJson() => {
    'meanError': meanError,
    'rmse': rmse,
    'maxError': maxError,
    'pointCount': pointCount,
  };

  factory TransformAccuracy.fromJson(Map<String, dynamic> json) =>
      TransformAccuracy(
        meanError: json['meanError'] as double,
        rmse: json['rmse'] as double,
        maxError: json['maxError'] as double,
        pointCount: json['pointCount'] as int,
      );
}
