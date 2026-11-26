// Copyright 2025 SAFENAV CAVITE
// Model loader service for digital twin 3D assets

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safenav_cavite/src/features/digital_twin/data/models/digital_twin_models.dart';
import 'package:safenav_cavite/src/features/digital_twin/data/services/coordinate_transform_service.dart';

/// Service for loading 3D models and campus data for the digital twin
class ModelLoaderService {
  final CoordinateTransformService _transformService;

  ModelLoaderService(this._transformService);

  /// Load building metadata from asset
  Future<ModelMetadata?> loadBuildingMetadata(String buildingId) async {
    try {
      final jsonString = await rootBundle.loadString('assets/3d/${buildingId}_metadata.json');
      final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
      return ModelMetadata.fromJson(jsonMap);
    } catch (e) {
      debugPrint('Failed to load metadata for $buildingId: $e');
      return null;
    }
  }

  /// Load building GLB model as bytes
  Future<Uint8List?> loadBuildingModel(String buildingId) async {
    try {
      final bytes = await rootBundle.load('assets/3d/$buildingId.glb');
      return bytes.buffer.asUint8List();
    } catch (e) {
      debugPrint('Failed to load model for $buildingId: $e');
      return null;
    }
  }

  /// Parse earist_cavite_campus.json and extract building data for 3D conversion
  Future<CampusDataFor3D> parseCampusDataFor3D() async {
    try {
      final jsonString = await rootBundle.loadString('assets/data/earist_cavite_campus.json');
      final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
      return _parseCampusData(jsonMap);
    } catch (e) {
      debugPrint('Failed to parse campus data: $e');
      rethrow;
    }
  }

  /// Build Building3D from parsed campus data
  Building3D buildBuilding3D({
    required String buildingId,
    required CampusDataFor3D campusData,
    required String modelPath,
    required String metadataPath,
  }) {
    final buildingData = campusData.buildings[buildingId];
    if (buildingData == null) {
      throw ArgumentError('Building $buildingId not found in campus data');
    }

    final floors = <Floor3D>[];
    for (int i = 0; i < buildingData.floorCount; i++) {
      final floorData = buildingData.floors[i];
      floors.add(Floor3D(
        index: i,
        name: floorData.name,
        elevation: i * buildingData.floorHeight,
        height: buildingData.floorHeight,
        rooms: floorData.rooms,
        bounds: floorData.bounds,
        modelNodeName: 'floor_$i',
        hasInterior: floorData.rooms.isNotEmpty,
        properties: floorData.properties,
      ));
    }

    // Compute building bounds from all rooms
    final allRooms = floors.expand((f) => f.rooms).toList();
    final buildingBounds = _computeBuildingBounds(allRooms);

    return Building3D(
      id: buildingId,
      name: buildingData.name,
      displayName: buildingData.displayName,
      floorCount: buildingData.floorCount,
      floors: floors,
      bounds: buildingBounds,
      modelPath: modelPath,
      metadataPath: metadataPath,
      type: buildingData.type,
      properties: buildingData.properties,
      lastUpdated: DateTime.now(),
    );
  }

  /// Convert a room from campus JSON to Room3D
  Room3D convertRoomTo3D({
    required String roomId,
    required String buildingId,
    required int floorIndex,
    required Map<String, dynamic> roomData,
    required double buildingWidthMeters,
    required double buildingHeightMeters,
    required double floorHeight,
    required double originOffsetX,
    required double originOffsetY,
  }) {
    // Extract normalized polygon from room data
    final normalizedPolygon = _extractNormalizedPolygon(roomData);

    // Transform to local Cartesian
    final localPolygon = _transformService.transformRoomPolygon(
      normalizedPolygon: normalizedPolygon,
      buildingWidthMeters: buildingWidthMeters,
      buildingHeightMeters: buildingHeightMeters,
      floorIndex: floorIndex,
      floorHeight: floorHeight,
      originOffsetX: originOffsetX,
      originOffsetY: originOffsetY,
    );

    // Compute centroid and bounds
    final centroid = _transformService.computeCentroid(localPolygon);
    final bounds = _transformService.computeBounds(localPolygon);

    // Parse category
    final category = _parseRoomCategory(roomData['category'] as String?);

    // Extract properties
    final properties = Map<String, dynamic>.from(roomData);
    properties.remove('polygon');
    properties.remove('normalized_polygon');

    return Room3D(
      id: roomId,
      buildingId: buildingId,
      floorIndex: floorIndex,
      name: roomData['name'] as String? ?? 'Unknown',
      number: roomData['room_number'] as String? ?? roomId,
      category: category,
      bounds: bounds,
      meshName: 'room_${buildingId}_${_floorIndexToString(floorIndex)}_room_${roomData['room_number'] ?? roomId}',
      centroid: centroid,
      polygon: localPolygon,
      properties: properties,
      isAccessible: roomData['accessible'] as bool? ?? true,
      isEmergencyExit: roomData['is_emergency_exit'] as bool? ?? false,
      isAssemblyPoint: roomData['is_assembly_point'] as bool? ?? false,
    );
  }

  /// Generate metadata for GLB export
  Future<ModelMetadata> generateModelMetadata({
    required String buildingId,
    required Building3D building,
    required CoordinateTransform coordinateTransform,
    required String sourceDataHash,
  }) async {
    final roomsMetadata = <String, RoomMetadata>{};
    final floorsMetadata = <int, FloorMetadata>{};

    for (final floor in building.floors) {
      for (final room in floor.rooms) {
        roomsMetadata[room.id] = RoomMetadata(
          roomId: room.id,
          meshName: room.meshName,
          floorIndex: room.floorIndex,
          name: room.name,
          number: room.number,
          category: room.category.runtimeType.toString(),
          bounds: room.bounds,
          centroid: room.centroid,
          polygon: room.polygon,
          properties: room.properties,
        );
      }

      floorsMetadata[floor.index] = FloorMetadata(
        index: floor.index,
        name: floor.name,
        elevation: floor.elevation,
        height: floor.height,
        bounds: floor.bounds,
        nodeName: floor.modelNodeName,
        roomCount: floor.rooms.length,
      );
    }

    return ModelMetadata(
      buildingId: buildingId,
      version: '1.0.0',
      generatedAt: DateTime.now(),
      sourceDataHash: sourceDataHash,
      coordinateTransform: coordinateTransform,
      rooms: roomsMetadata,
      floors: floorsMetadata,
      bounds: building.bounds,
      exportSettings: {
        'includeInteriors': true,
        'includeExteriors': true,
        'compression': 'draco',
        'textureQuality': 'medium',
      },
    );
  }

  CampusDataFor3D _parseCampusData(Map<String, dynamic> json) {
    final buildings = <String, BuildingDataFor3D>{};
    final buildingData = json['buildings'] as Map<String, dynamic>?;

    if (buildingData != null) {
      for (final entry in buildingData.entries) {
        final bData = entry.value as Map<String, dynamic>;
        buildings[entry.key] = _parseBuildingData(entry.key, bData);
      }
    }

    return CampusDataFor3D(
      buildings: buildings,
      campusBounds: _parseBounds(json['bounds'] as Map<String, dynamic>?),
      campusCenterLat: (json['center_lat'] as num?)?.toDouble() ?? 14.375,
      campusCenterLon: (json['center_lon'] as num?)?.toDouble() ?? 120.887,
    );
  }

  BuildingDataFor3D _parseBuildingData(String id, Map<String, dynamic> data) {
    final floorsData = data['floors'] as List<dynamic>? ?? [];
    final floors = <FloorDataFor3D>[];

    for (int i = 0; i < floorsData.length; i++) {
      final floorData = floorsData[i] as Map<String, dynamic>;
      final roomsData = floorData['rooms'] as List<dynamic>? ?? [];
      final rooms = <Room3D>[];

      // We'll convert rooms later when we have building dimensions
      // For now, store raw data
      for (final roomData in roomsData) {
        final rData = roomData as Map<String, dynamic>;
        rooms.add(Room3D(
          id: rData['room_id'] as String? ?? '${id}_floor_${i}_room_${rooms.length}',
          buildingId: id,
          floorIndex: i,
          name: rData['name'] as String? ?? 'Room',
          number: rData['room_number'] as String? ?? '',
          category: _parseRoomCategory(rData['category'] as String?),
          bounds: RoomBounds3D(minX: 0, minY: 0, minZ: 0, maxX: 0, maxY: 0, maxZ: 0),
          meshName: '',
          centroid: Vector3D(x: 0, y: 0, z: 0),
          polygon: [],
          properties: rData,
          isAccessible: rData['accessible'] as bool? ?? true,
          isEmergencyExit: rData['is_emergency_exit'] as bool? ?? false,
          isAssemblyPoint: rData['is_assembly_point'] as bool? ?? false,
        ));
      }

      floors.add(FloorDataFor3D(
        index: i,
        name: floorData['name'] as String? ?? _floorIndexToString(i),
        rooms: rooms,
        bounds: FloorBounds3D(minX: 0, minY: 0, maxX: 0, maxY: 0, minZ: 0, maxZ: 0),
        properties: floorData,
      ));
    }

    return BuildingDataFor3D(
      id: id,
      name: data['name'] as String? ?? id,
      displayName: data['display_name'] as String? ?? data['name'] as String? ?? id,
      floorCount: floors.length,
      floorHeight: (data['floor_height'] as num?)?.toDouble() ?? 3.5,
      floors: floors,
      type: _parseBuildingType(data['type'] as String?),
      properties: data,
    );
  }

  BuildingBounds3D _computeBuildingBounds(List<Room3D> rooms) {
    if (rooms.isEmpty) {
      return BuildingBounds3D(minX: 0, minY: 0, minZ: 0, maxX: 0, maxY: 0, maxZ: 0);
    }

    double minX = double.infinity, minY = double.infinity, minZ = double.infinity;
    double maxX = -double.infinity, maxY = -double.infinity, maxZ = -double.infinity;

    for (final room in rooms) {
      if (room.bounds.minX < minX) minX = room.bounds.minX;
      if (room.bounds.minY < minY) minY = room.bounds.minY;
      if (room.bounds.minZ < minZ) minZ = room.bounds.minZ;
      if (room.bounds.maxX > maxX) maxX = room.bounds.maxX;
      if (room.bounds.maxY > maxY) maxY = room.bounds.maxY;
      if (room.bounds.maxZ > maxZ) maxZ = room.bounds.maxZ;
    }

    return BuildingBounds3D(
      minX: minX,
      minY: minY,
      minZ: minZ,
      maxX: maxX,
      maxY: maxY,
      maxZ: maxZ,
    );
  }

  List<Vector3D> _extractNormalizedPolygon(Map<String, dynamic> roomData) {
    // Try multiple possible keys for polygon data
    final polygonData = roomData['polygon'] ?? roomData['normalized_polygon'] ?? roomData['geometry'];

    if (polygonData is List) {
      return polygonData.map((v) {
        if (v is List && v.length >= 2) {
          return Vector3D(x: (v[0] as num).toDouble(), y: (v[1] as num).toDouble(), z: 0);
        } else if (v is Map) {
          return Vector3D(
            x: (v['x'] as num?)?.toDouble() ?? 0,
            y: (v['y'] as num?)?.toDouble() ?? 0,
            z: 0,
          );
        }
        return Vector3D(x: 0, y: 0, z: 0);
      }).toList();
    }

    // Default: return a unit square if no polygon data
    return [
      Vector3D(x: 0, y: 0, z: 0),
      Vector3D(x: 1, y: 0, z: 0),
      Vector3D(x: 1, y: 1, z: 0),
      Vector3D(x: 0, y: 1, z: 0),
    ];
  }

  RoomCategory _parseRoomCategory(String? category) {
    if (category == null) return RoomCategory.other('Unknown');

    return switch (category.toLowerCase()) {
      'classroom' => RoomCategory.classroom(),
      'laboratory' || 'lab' => RoomCategory.laboratory(),
      'office' => RoomCategory.office(),
      'library' => RoomCategory.library(),
      'auditorium' => RoomCategory.auditorium(),
      'gymnasium' || 'gym' => RoomCategory.gymnasium(),
      'cafeteria' || 'canteen' => RoomCategory.cafeteria(),
      'restroom' || 'toilet' => RoomCategory.restroom(),
      'corridor' || 'hallway' => RoomCategory.corridor(),
      'stairs' => RoomCategory.stairs(),
      'elevator' => RoomCategory.elevator(),
      'utility' => RoomCategory.utility(),
      'storage' => RoomCategory.storage(),
      _ => RoomCategory.other(category),
    };
  }

  BuildingType _parseBuildingType(String? type) {
    if (type == null) return BuildingType.other('Unknown');

    return switch (type.toLowerCase()) {
      'academic' => BuildingType.academic(),
      'administrative' => BuildingType.administrative(),
      'laboratory' => BuildingType.laboratory(),
      'library' => BuildingType.library(),
      'gymnasium' => BuildingType.gymnasium(),
      'auditorium' => BuildingType.auditorium(),
      'cafeteria' => BuildingType.cafeteria(),
      'dormitory' => BuildingType.dormitory(),
      _ => BuildingType.other(type),
    };
  }

  BoundingBox2D _parseBounds(Map<String, dynamic>? bounds) {
    if (bounds == null) {
      return BoundingBox2D(minX: 0, minY: 0, maxX: 1, maxY: 1);
    }
    return BoundingBox2D(
      minX: (bounds['min_x'] as num?)?.toDouble() ?? 0,
      minY: (bounds['min_y'] as num?)?.toDouble() ?? 0,
      maxX: (bounds['max_x'] as num?)?.toDouble() ?? 1,
      maxY: (bounds['max_y'] as num?)?.toDouble() ?? 1,
    );
  }

  String _floorIndexToString(int index) {
    return switch (index) {
      0 => 'ground_floor',
      1 => '2nd_floor',
      2 => '3rd_floor',
      _ => '${index + 1}th_floor',
    };
  }
}

/// Data structures for parsing campus JSON
class CampusDataFor3D {
  final Map<String, BuildingDataFor3D> buildings;
  final BoundingBox2D campusBounds;
  final double campusCenterLat;
  final double campusCenterLon;

  CampusDataFor3D({
    required this.buildings,
    required this.campusBounds,
    required this.campusCenterLat,
    required this.campusCenterLon,
  });
}

class BuildingDataFor3D {
  final String id;
  final String name;
  final String displayName;
  final int floorCount;
  final double floorHeight;
  final List<FloorDataFor3D> floors;
  final BuildingType type;
  final Map<String, dynamic> properties;

  BuildingDataFor3D({
    required this.id,
    required this.name,
    required this.displayName,
    required this.floorCount,
    required this.floorHeight,
    required this.floors,
    required this.type,
    required this.properties,
  });
}

class FloorDataFor3D {
  final int index;
  final String name;
  final List<Room3D> rooms;
  final FloorBounds3D bounds;
  final Map<String, dynamic> properties;

  FloorDataFor3D({
    required this.index,
    required this.name,
    required this.rooms,
    required this.bounds,
    required this.properties,
  });
}

/// Provider for the model loader service
final modelLoaderServiceProvider = Provider<ModelLoaderService>((ref) {
  final transformService = ref.watch(coordinateTransformServiceProvider);
  return ModelLoaderService(transformService);
});