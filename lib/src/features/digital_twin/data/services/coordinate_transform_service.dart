// Copyright 2025 SAFENAV CAVITE
// Coordinate transformation service for digital twin

import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safenav_cavite/src/features/digital_twin/data/models/digital_twin_models.dart';

/// Service for transforming coordinates between different coordinate systems
class CoordinateTransformService {
  /// Transform normalized image coordinates (0-1) to local Cartesian meters
  ///
  /// [normalizedX] - X coordinate in normalized image space (0-1)
  /// [normalizedY] - Y coordinate in normalized image space (0-1)
  /// [buildingWidthMeters] - Building width in meters
  /// [buildingHeightMeters] - Building height in meters
  /// [buildingDepthMeters] - Building depth in meters (for 3D)
  /// [originOffsetX] - X offset of building origin in local Cartesian
  /// [originOffsetY] - Y offset of building origin in local Cartesian
  /// [originOffsetZ] - Z offset of building origin in local Cartesian
  /// [flipY] - Whether to flip Y axis (image coords have Y down, 3D has Y up)
  Vector3D normalizedToLocalCartesian({
    required double normalizedX,
    required double normalizedY,
    required double buildingWidthMeters,
    required double buildingHeightMeters,
    required double buildingDepthMeters,
    double originOffsetX = 0,
    double originOffsetY = 0,
    double originOffsetZ = 0,
    bool flipY = true,
  }) {
    // Convert normalized (0-1) to meters from building origin
    double x = normalizedX * buildingWidthMeters;
    double y = flipY ? (1.0 - normalizedY) * buildingHeightMeters : normalizedY * buildingHeightMeters;
    double z = 0; // Ground floor base

    // Apply building origin offset
    x += originOffsetX;
    y += originOffsetY;
    z += originOffsetZ;

    return Vector3D(x: x, y: y, z: z);
  }

  /// Transform local Cartesian coordinates to normalized image coordinates
  Vector3D localCartesianToNormalized({
    required Vector3D local,
    required double buildingWidthMeters,
    required double buildingHeightMeters,
    required double buildingDepthMeters,
    double originOffsetX = 0,
    double originOffsetY = 0,
    double originOffsetZ = 0,
    bool flipY = true,
  }) {
    double x = (local.x - originOffsetX) / buildingWidthMeters;
    double y = flipY
      ? 1.0 - (local.y - originOffsetY) / buildingHeightMeters
      : (local.y - originOffsetY) / buildingHeightMeters;
    double z = (local.z - originOffsetZ) / buildingDepthMeters;

    return Vector3D(x: x.clamp(0.0, 1.0), y: y.clamp(0.0, 1.0), z: z.clamp(0.0, 1.0));
  }

  /// Transform EPSG:4326 (lat/lon) to local Cartesian meters
  ///
  /// Uses simple equirectangular projection centered on campus
  /// For campus-scale, this is accurate enough (< 1m error)
  Vector3D wgs84ToLocalCartesian({
    required double latitude,
    required double longitude,
    required double campusCenterLat,
    required double campusCenterLon,
    required double metersPerDegreeLat,
    required double metersPerDegreeLon,
  }) {
    // Latitude to Y (meters north of campus center)
    final double y = (latitude - campusCenterLat) * metersPerDegreeLat;

    // Longitude to X (meters east of campus center)
    final double x = (longitude - campusCenterLon) * metersPerDegreeLon;

    return Vector3D(x: x, y: y, z: 0);
  }

  /// Transform local Cartesian to EPSG:4326
  Vector3D localCartesianToWgs84({
    required Vector3D local,
    required double campusCenterLat,
    required double campusCenterLon,
    required double metersPerDegreeLat,
    required double metersPerDegreeLon,
  }) {
    final double latitude = campusCenterLat + local.y / metersPerDegreeLat;
    final double longitude = campusCenterLon + local.x / metersPerDegreeLon;
    return Vector3D(x: longitude, y: latitude, z: local.z);
  }

  /// Create a coordinate transform for a building from source data
  CoordinateTransform createBuildingTransform({
    required String buildingId,
    required String sourceCrs,
    required String targetCrs,
    required BoundingBox2D sourceBounds,
    required BoundingBox2D targetBounds,
    double rotation = 0.0,
  }) {
    // Calculate scale factors
    final scaleX = targetBounds.width / sourceBounds.width;
    final scaleY = targetBounds.height / sourceBounds.height;
    final scale = Vector3D(x: scaleX, y: scaleY, z: 1.0);

    // Calculate translation to align origins
    final translation = Vector3D(
      x: targetBounds.minX - sourceBounds.minX * scaleX,
      y: targetBounds.minY - sourceBounds.minY * scaleY,
      z: 0,
    );

    // Create transformation matrix
    final cosR = cos(rotation);
    final sinR = sin(rotation);

    final matrix = Matrix4x4(values: [
      [scaleX * cosR, -scaleY * sinR, 0, translation.x],
      [scaleX * sinR, scaleY * cosR, 0, translation.y],
      [0, 0, 1, 0],
      [0, 0, 0, 1],
    ]);

    return CoordinateTransform(
      buildingId: buildingId,
      sourceCrs: sourceCrs,
      targetCrs: targetCrs,
      transformMatrix: matrix,
      translation: translation,
      scale: scale,
      rotation: rotation,
      sourceBounds: sourceBounds,
      targetBounds: targetBounds,
    );
  }

  /// Apply a coordinate transform to a point
  Vector3D applyTransform(CoordinateTransform transform, Vector3D point) {
    return transform.transformMatrix.transform(point);
  }

  /// Transform room polygon from normalized to local Cartesian
  List<Vector3D> transformRoomPolygon({
    required List<Vector3D> normalizedPolygon,
    required double buildingWidthMeters,
    required double buildingHeightMeters,
    required int floorIndex,
    required double floorHeight,
    double originOffsetX = 0,
    double originOffsetY = 0,
    bool flipY = true,
  }) {
    return normalizedPolygon.map((vertex) {
      final local = normalizedToLocalCartesian(
        normalizedX: vertex.x,
        normalizedY: vertex.y,
        buildingWidthMeters: buildingWidthMeters,
        buildingHeightMeters: buildingHeightMeters,
        buildingDepthMeters: floorHeight,
        originOffsetX: originOffsetX,
        originOffsetY: originOffsetY,
        originOffsetZ: floorIndex * floorHeight,
        flipY: flipY,
      );
      return local;
    }).toList();
  }

  /// Compute room centroid from polygon
  Vector3D computeCentroid(List<Vector3D> polygon) {
    if (polygon.isEmpty) return Vector3D(x: 0, y: 0, z: 0);

    double sumX = 0, sumY = 0, sumZ = 0;
    for (final v in polygon) {
      sumX += v.x;
      sumY += v.y;
      sumZ += v.z;
    }
    return Vector3D(
      x: sumX / polygon.length,
      y: sumY / polygon.length,
      z: sumZ / polygon.length,
    );
  }

  /// Compute bounding box from polygon
  RoomBounds3D computeBounds(List<Vector3D> polygon) {
    if (polygon.isEmpty) {
      return RoomBounds3D(minX: 0, minY: 0, minZ: 0, maxX: 0, maxY: 0, maxZ: 0);
    }

    double minX = polygon.first.x;
    double minY = polygon.first.y;
    double minZ = polygon.first.z;
    double maxX = polygon.first.x;
    double maxY = polygon.first.y;
    double maxZ = polygon.first.z;

    for (final v in polygon) {
      if (v.x < minX) minX = v.x;
      if (v.x > maxX) maxX = v.x;
      if (v.y < minY) minY = v.y;
      if (v.y > maxY) maxY = v.y;
      if (v.z < minZ) minZ = v.z;
      if (v.z > maxZ) maxZ = v.z;
    }

    return RoomBounds3D(
      minX: minX,
      minY: minY,
      minZ: minZ,
      maxX: maxX,
      maxY: maxY,
      maxZ: maxZ,
    );
  }
}

/// Provider for the coordinate transform service
final coordinateTransformServiceProvider = Provider<CoordinateTransformService>((ref) {
  return CoordinateTransformService();
});