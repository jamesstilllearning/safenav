/// SAFENAV CAVITE - Campus Map Parser Service
///
/// Parses the embedded JavaScript DATA array from EARIST_Cavite_Interactive_Campus_Map.html
/// and converts normalized image coordinates to LatLng using campus boundary reference points.
library;

import 'dart:convert';
import 'package:latlong2/latlong.dart';

import 'package:flutter/services.dart' show rootBundle;

import '../models/campus_room.dart';
import '../models/campus_map_parser_models.dart';


/// Campus Map Parser Service
class CampusMapParser {
  CampusMapParser._();

  static final CampusMapParser _instance = CampusMapParser._();
  static CampusMapParser get instance => _instance;

  List<CampusRoom>? _cachedRooms;
  CampusReferencePoints? _referencePoints;

  /// Initialize the parser with reference points
  Future<void> initialize({CampusReferencePoints? referencePoints}) async {
    _referencePoints = referencePoints;
    await _parseHtmlData();
  }

  /// Parse the HTML file and extract DATA array
  Future<void> _parseHtmlData() async {
    try {
      // Load the HTML file from assets
      final htmlContent = await rootBundle.loadString('assets/maps/EARIST_Cavite_Interactive_Campus_Map.html');

      // Extract the DATA array from the script tag
      final dataJson = _extractDataArray(htmlContent);
      if (dataJson == null) {
        throw StateError('Could not extract DATA array from HTML');
      }

      // Parse JSON array
      final List<dynamic> dataList = jsonDecode(dataJson);

      // Convert to CampusRoom models
      _cachedRooms = dataList
          .map((item) => _parseRoomItem(item as Map<String, dynamic>))
          .whereType<CampusRoom>()
          .toList();

      // Apply coordinate transformation
    } catch (e) {
      // Fallback: create empty list
      _cachedRooms = [];
      rethrow;
    }
  }

  /// Extract DATA array JSON from HTML content
  String? _extractDataArray(String html) {
    // Pattern: const DATA=[...];
    final regex = RegExp(r'const DATA=(\[.*?\]);', dotAll: true);
    final match = regex.firstMatch(html);
    if (match != null) {
      return match.group(1);
    }
    return null;
  }

  /// Parse a single room item from the DATA array
  CampusRoom? _parseRoomItem(Map<String, dynamic> json) {
    try {
      // Parse category
      final categoryStr = json['category'] as String? ?? 'other';
      final category = _parseCategory(categoryStr);

      // Parse confidence
      final confidenceStr = json['confidence'] as String? ?? 'medium';
      final confidence = _parseConfidence(confidenceStr);

      // Parse geometry confidence
      final geomConfidenceStr = json['geometry_confidence'] as String? ?? 'medium';
      final geometryConfidence = _parseGeometryConfidence(geomConfidenceStr);

      // Parse floor level
      final floorId = json['floor_id'] as String? ?? 'floor_not_indicated';
      final floorLevel = floorLevelFromFloorId(floorId);

      // Parse geometry
      final geometryJson = json['geometry'] as Map<String, dynamic>?;
      if (geometryJson == null) return null;

      final normalized = NormalizedPolygon.fromJson(geometryJson);

      // Parse source pixel bbox
      final bboxJson = json['source_pixel_bbox'] as Map<String, dynamic>?;
      final sourcePixelBBox = bboxJson != null
          ? SourcePixelBBox.fromJson(bboxJson)
          : SourcePixelBBox(x: 0, y: 0, width: 0, height: 0);

      // Create room (without real-world coords yet)
      return CampusRoom(
        id: json['id'] as String,
        name: json['name'] as String? ?? '',
        originalLabel: json['original_label'] as String? ?? '',
        category: category,
        buildingId: json['building_id'] as String? ?? '',
        floorId: floorId,
        floorLevel: floorLevel,
        confidence: confidence,
        notes: json['notes'] as String?,
        geometry: RoomGeometry(normalized: normalized),
        sourcePixelBBox: sourcePixelBBox,
        approximate: json['approximate'] as bool? ?? true,
        geometryConfidence: geometryConfidence,
      );
    } catch (e) {
      // Skip invalid items
      return null;
    }
  }

  /// Apply coordinate transformation to a room

  /// Parse category string to RoomCategory
  RoomCategory _parseCategory(String category) {
    switch (category.toLowerCase()) {
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
      case 'sports_facility':
        return RoomCategory.sportsFacility();
      case 'stage':
        return RoomCategory.stage();
      case 'staircase':
        return RoomCategory.staircase();
      case 'storage':
        return RoomCategory.storage();
      case 'unresolved_map_annotation':
        return RoomCategory.unresolvedMapAnnotation();
      case 'unresolved_space':
        return RoomCategory.unresolvedSpace();
      // Safety & Emergency categories
      case 'emergency_exit':
        return RoomCategory.emergencyExit();
      case 'assembly_point':
        return RoomCategory.assemblyPoint();
      case 'medical_facility':
        return RoomCategory.medicalFacility();
      case 'security_office':
        return RoomCategory.securityOffice();
      case 'other':
      default:
        return RoomCategory.other();
    }
  }

  /// Parse confidence string
  DataConfidence _parseConfidence(String confidence) {
    switch (confidence.toLowerCase()) {
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

  /// Parse geometry confidence string
  GeometryConfidence _parseGeometryConfidence(String confidence) {
    switch (confidence.toLowerCase()) {
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

  /// Get all parsed rooms
  List<CampusRoom> get rooms => _cachedRooms ?? [];

  /// Get rooms with filtering
  RoomSearchResult search(RoomSearchFilter filter) {
    var results = rooms;

    // Apply filters
    if (filter.query != null && filter.query!.isNotEmpty) {
      final query = filter.query!.toLowerCase();
      results = results.where((r) =>
          r.name.toLowerCase().contains(query) ||
          r.originalLabel.toLowerCase().contains(query) ||
          r.buildingId.toLowerCase().contains(query)).toList();
    }

    if (filter.buildingId != null) {
      results = results.where((r) => r.buildingId == filter.buildingId).toList();
    }

    if (filter.floorId != null) {
      results = results.where((r) => r.floorId == filter.floorId).toList();
    }

    if (filter.category != null) {
      results = results.where((r) => r.category == filter.category).toList();
    }

    if (filter.minConfidence != null) {
      final minPriority = filter.minConfidence!.priority;
      results = results.where((r) => r.confidence.priority >= minPriority).toList();
    }

    if (filter.navigableOnly == true) {
      results = results.where((r) => r.isNavigableSpace).toList();
    }

    if (filter.facilityOnly == true) {
      results = results.where((r) => r.isFacility).toList();
    }

    return RoomSearchResult(
      rooms: results,
      totalCount: results.length,
      filter: filter,
    );
  }

  /// Get rooms by building
  List<CampusRoom> getRoomsByBuilding(String buildingId) {
    return rooms.where((r) => r.buildingId == buildingId).toList();
  }

  /// Get rooms by floor
  List<CampusRoom> getRoomsByFloor(String floorId) {
    return rooms.where((r) => r.floorId == floorId).toList();
  }

  /// Get rooms by category
  List<CampusRoom> getRoomsByCategory(RoomCategory category) {
    return rooms.where((r) => r.category == category).toList();
  }

  /// Get room by ID
  CampusRoom? getRoomById(String id) {
    try {
      return rooms.firstWhere((r) => r.id == id);
    } catch (_) {
      return null;
    }
  }

  /// Get unique buildings with floor info
  List<CampusBuildingReference> getBuildingReferences() {
    final buildingMap = <String, List<CampusRoom>>{};
    for (final room in rooms) {
      buildingMap.putIfAbsent(room.buildingId, () => []).add(room);
    }

    return buildingMap.entries.map((entry) {
      final buildingRooms = entry.value;
      final floorMap = <String, List<CampusRoom>>{};
      for (final room in buildingRooms) {
        floorMap.putIfAbsent(room.floorId, () => []).add(room);
      }

      final floors = floorMap.entries.map((floorEntry) {
        return CampusFloor(
          id: floorEntry.key,
          name: floorLevelFromFloorId(floorEntry.key).label,
          level: floorLevelFromFloorId(floorEntry.key),
          roomCount: floorEntry.value.length,
          roomIds: floorEntry.value.map((r) => r.id).toList(),
        );
      }).toList();

      // Sort floors by level
      floors.sort((a, b) => a.level.levelIndex.compareTo(b.level.levelIndex));

      // Calculate centroid from rooms with real-world coords
      final roomsWithCoords = buildingRooms.where((r) => r.geometry.hasRealWorldCoords).toList();
      LatLng? centroid;
      if (roomsWithCoords.isNotEmpty) {
        final avgLat = roomsWithCoords.map((r) => r.geometry.centroid!.latitude).reduce((a, b) => a + b) / roomsWithCoords.length;
        final avgLng = roomsWithCoords.map((r) => r.geometry.centroid!.longitude).reduce((a, b) => a + b) / roomsWithCoords.length;
        centroid = LatLng(avgLat, avgLng);
      }

      // Count by category
      final categoryCounts = <String, int>{};
      for (final room in buildingRooms) {
        final catLabel = room.category.label;
        categoryCounts[catLabel] = (categoryCounts[catLabel] ?? 0) + 1;
      }

      return CampusBuildingReference(
        id: entry.key,
        name: _formatBuildingName(entry.key),
        floors: floors,
        roomCount: buildingRooms.length,
        roomsByCategory: categoryCounts,
        centroid: centroid,
      );
    }).toList();
  }

  /// Get unique floors across all buildings
  List<CampusFloor> getAllFloors() {
    final floorMap = <String, List<CampusRoom>>{};
    for (final room in rooms) {
      floorMap.putIfAbsent(room.floorId, () => []).add(room);
    }

    return floorMap.entries.map((entry) {
      return CampusFloor(
        id: entry.key,
        name: floorLevelFromFloorId(entry.key).label,
        level: floorLevelFromFloorId(entry.key),
        roomCount: entry.value.length,
        roomIds: entry.value.map((r) => r.id).toList(),
      );
    }).toList()..sort((a, b) => a.level.levelIndex.compareTo(b.level.levelIndex));
  }

  /// Format building ID to display name
  String _formatBuildingName(String id) {
    switch (id) {
      case 'main_building':
        return 'Main Building';
      case 'annex_building':
        return 'Annex Building';
      case 'canteen_building':
        return 'Canteen Building';
      case 'clinic_building':
        return 'Clinic Building';
      case 'unidentified_office_block':
        return 'Unidentified Office Block';
      default:
        return id.split('_').map((w) => w[0].toUpperCase() + w.substring(1)).join(' ');
    }
  }

  /// Set custom reference points for coordinate calibration.
  ///
  /// Reference points are stored, but no pixel-to-GPS transform is applied.
  /// Coordinates remain in image-pixel space until surveyed.
  void setReferencePoints(CampusReferencePoints points) {
    _referencePoints = points;
  }

  /// Get current reference points
  CampusReferencePoints? get referencePoints => _referencePoints;

  /// Check if parser is initialized
  bool get isInitialized => _cachedRooms != null;

  /// Get total room count
  int get totalRoomCount => _cachedRooms?.length ?? 0;

  /// Clear cache (for re-initialization)
  void clearCache() {
    _cachedRooms = null;
    _referencePoints = null;
  }
}

/// Extension for easy access to parser
extension CampusMapParserExtension on CampusMapParser {
  /// Quick search by name
  List<CampusRoom> findByName(String name) {
    return search(RoomSearchFilter(query: name)).rooms;
  }

  /// Get all navigable rooms
  List<CampusRoom> get navigableRooms =>
      search(RoomSearchFilter(navigableOnly: true)).rooms;

  /// Get all facilities
  List<CampusRoom> get facilities =>
      search(RoomSearchFilter(facilityOnly: true)).rooms;

  /// Get rooms on specific floor of a building
  List<CampusRoom> getRoomsInBuildingOnFloor(String buildingId, String floorId) {
    return rooms
        .where((r) => r.buildingId == buildingId && r.floorId == floorId)
        .toList();
  }
}