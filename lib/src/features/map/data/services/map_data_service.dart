/// SAFENAV CAVITE - Map Data Service
///
/// Service for loading and parsing campus map data from GeoJSON assets.
library;

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:latlong2/latlong.dart';

import '../models/campus_boundary.dart';
import '../models/campus_building.dart';
import '../models/campus_pathway.dart';

/// Service for loading campus map data from GeoJSON files
class MapDataService {
  MapDataService._();

  static final MapDataService _instance = MapDataService._();
  static MapDataService get instance => _instance;

  // Cache for loaded data
  CampusBoundary? _boundary;
  List<CampusBuilding>? _buildings;
  List<CampusPathway>? _pathways;

  /// Load campus boundary from GeoJSON asset
  Future<CampusBoundary> loadCampusBoundary() async {
    if (_boundary != null) return _boundary!;

    final String jsonString = await rootBundle.loadString(
      'lib/src/features/map/data/campus_boundary.geojson',
    );
    final Map<String, dynamic> json = jsonDecode(jsonString);

    final features = json['features'] as List<dynamic>;
    if (features.isEmpty) {
      throw StateError('No features found in campus boundary GeoJSON');
    }

    final feature = features.first as Map<String, dynamic>;
    final properties = feature['properties'] as Map<String, dynamic>;
    final geometry = feature['geometry'] as Map<String, dynamic>;
    final coordinates = geometry['coordinates'] as List<dynamic>;

    // Parse polygon coordinates (first ring of MultiPolygon or Polygon)
    final List<LatLng> polygon = [];
    final rings = coordinates.first as List<dynamic>;
    for (final coord in rings) {
      final point = coord as List<dynamic>;
      polygon.add(LatLng(point[1] as double, point[0] as double));
    }

    // Calculate centroid
    LatLng? centroid;
    if (polygon.isNotEmpty) {
      double sumLat = 0, sumLng = 0;
      for (final p in polygon) {
        sumLat += p.latitude;
        sumLng += p.longitude;
      }
      centroid = LatLng(sumLat / polygon.length, sumLng / polygon.length);
    }

    _boundary = CampusBoundary(
      id: properties['id'] as String,
      name: properties['name'] as String,
      shortName: properties['short_name'] as String? ?? properties['name'] as String,
      amenity: properties['amenity'] as String? ?? 'college',
      city: properties['addr:city'] as String? ?? '',
      street: properties['addr:street'] as String? ?? '',
      wikidata: properties['wikidata'] as String?,
      osmRelationId: properties['osm_relation_id'] as int? ?? 0,
      source: properties['source'] as String? ?? 'OpenStreetMap',
      sourceDate: properties['source_date'] as String? ?? '',
      verificationStatus: properties['verification_status'] as String? ?? 'verified_osm',
      description: properties['description'] as String? ?? '',
      polygon: polygon,
      centroid: centroid,
      additionalTags: properties,
    );

    return _boundary!;
  }

  /// Load campus buildings from GeoJSON asset
  Future<List<CampusBuilding>> loadCampusBuildings() async {
    if (_buildings != null) return _buildings!;

    final String jsonString = await rootBundle.loadString(
      'lib/src/features/map/data/campus_buildings.geojson',
    );
    final Map<String, dynamic> json = jsonDecode(jsonString);

    final features = json['features'] as List<dynamic>;
    final List<CampusBuilding> buildings = [];

    for (final feature in features) {
      final f = feature as Map<String, dynamic>;
      final properties = f['properties'] as Map<String, dynamic>;
      final geometry = f['geometry'] as Map<String, dynamic>;
      final coordinates = geometry['coordinates'] as List<dynamic>;

      // Parse polygon coordinates
      final List<LatLng> polygon = [];
      final rings = coordinates.first as List<dynamic>;
      for (final coord in rings) {
        final point = coord as List<dynamic>;
        polygon.add(LatLng(point[1] as double, point[0] as double));
      }

      // Parse centroid
      final centroidLat = properties['centroid_lat'] as double?;
      final centroidLng = properties['centroid_lng'] as double?;
      final LatLng? centroidProps = (centroidLat != null && centroidLng != null)
          ? LatLng(centroidLat, centroidLng)
          : null;

      // Calculate centroid if not provided
      LatLng? centroid = centroidProps;
      if (centroid == null && polygon.isNotEmpty) {
        double sumLat = 0, sumLng = 0;
        for (final p in polygon) {
          sumLat += p.latitude;
          sumLng += p.longitude;
        }
        centroid = LatLng(sumLat / polygon.length, sumLng / polygon.length);
      }

      final building = CampusBuilding(
        id: properties['id'] as String,
        osmWayId: properties['osm_way_id'] as int,
        name: properties['name'] as String,
        buildingType: properties['building'] as String? ?? 'college',
        category: (properties['category'] as String? ?? 'academic').toBuildingCategory(),
        description: properties['description'] as String? ?? '',
        source: properties['source'] as String? ?? 'OpenStreetMap',
        sourceDate: properties['source_date'] as String? ?? '',
        verificationStatus: properties['verification_status'] as String? ?? 'verified_osm',
        polygon: polygon,
        centroid: centroid!,
        additionalTags: properties,
      );

      buildings.add(building);
    }

    _buildings = buildings;
    return _buildings!;
  }

  /// Load campus pathways from GeoJSON asset
  Future<List<CampusPathway>> loadCampusPathways() async {
    if (_pathways != null) return _pathways!;

    final String jsonString = await rootBundle.loadString(
      'lib/src/features/map/data/campus_pathways.geojson',
    );
    final Map<String, dynamic> json = jsonDecode(jsonString);

    final features = json['features'] as List<dynamic>;
    final List<CampusPathway> pathways = [];

    for (final feature in features) {
      final f = feature as Map<String, dynamic>;
      final properties = f['properties'] as Map<String, dynamic>;
      final geometry = f['geometry'] as Map<String, dynamic>;
      final coordinates = geometry['coordinates'] as List<dynamic>;
      final geometryType = geometry['type'] as String;

      // Parse coordinates
      final List<LatLng> coords = [];
      if (geometryType == 'LineString') {
        for (final coord in coordinates) {
          final point = coord as List<dynamic>;
          coords.add(LatLng(point[1] as double, point[0] as double));
        }
      } else if (geometryType == 'Polygon') {
        final rings = coordinates.first as List<dynamic>;
        for (final coord in rings) {
          final point = coord as List<dynamic>;
          coords.add(LatLng(point[1] as double, point[0] as double));
        }
      }

      final pathway = CampusPathway(
        id: properties['id'] as String,
        name: properties['name'] as String,
        highway: properties['highway'] as String? ?? 'footway',
        surface: properties['surface'] as String? ?? 'concrete',
        width: (properties['width'] as num?)?.toDouble() ?? 2.0,
        category: (properties['category'] as String? ?? 'other').toPathwayCategory(),
        description: properties['description'] as String? ?? '',
        source: properties['source'] as String? ?? 'OpenStreetMap',
        verificationStatus: properties['verification_status'] as String? ?? 'verified_osm',
        coordinates: coords,
        geometryType: geometryType,
        capacity: properties['capacity'] as int?,
        additionalTags: properties,
      );

      pathways.add(pathway);
    }

    _pathways = pathways;
    return _pathways!;
  }

  /// Load all map data
  Future<void> loadAllData() async {
    await Future.wait([
      loadCampusBoundary(),
      loadCampusBuildings(),
      loadCampusPathways(),
    ]);
  }

  /// Get cached boundary
  CampusBoundary? get boundary => _boundary;

  /// Get cached buildings
  List<CampusBuilding>? get buildings => _buildings;

  /// Get cached pathways
  List<CampusPathway>? get pathways => _pathways;

  /// Clear cache (useful for testing)
  void clearCache() {
    _boundary = null;
    _buildings = null;
    _pathways = null;
  }
}