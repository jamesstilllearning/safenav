/// SAFENAV CAVITE - Map Data Service
///
/// Service for loading and parsing campus map data from GeoJSON assets.
library;

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
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

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Collection names used when loading map data from Firestore
  static const String _boundaryCollection = 'campus_boundary';
  static const String _buildingsCollection = 'buildings';
  static const String _pathwaysCollection = 'pathways';

  /// Load campus boundary from Firestore with asset fallback
  Future<CampusBoundary> loadCampusBoundary() async {
    if (_boundary != null) return _boundary!;

    // Try Firestore first
    try {
      final snapshot = await _firestore.collection(_boundaryCollection).limit(1).get();
      if (snapshot.docs.isNotEmpty) {
        final boundary = _parseBoundaryDoc(snapshot.docs.first);
        if (boundary != null) {
          _boundary = boundary;
          return _boundary!;
        }
      }
    } catch (_) {
      // Fall through to asset fallback
    }

    // Asset fallback (GeoJSON)
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
      // GeoJSON stores coordinates as [lng, lat]
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

  /// Parses a campus boundary document from Firestore
  CampusBoundary? _parseBoundaryDoc(QueryDocumentSnapshot doc) {
    try {
      final data = doc.data() as Map<String, dynamic>;
      final polygon = _latLngListFrom(data['polygon']);
      if (polygon.isEmpty) return null;

      LatLng? centroid;
      final centroidRaw = data['centroid'];
      if (centroidRaw != null) {
        centroid = _latLngFrom(centroidRaw);
      }
      if (centroid == null && polygon.isNotEmpty) {
        double sumLat = 0, sumLng = 0;
        for (final p in polygon) {
          sumLat += p.latitude;
          sumLng += p.longitude;
        }
        centroid = LatLng(sumLat / polygon.length, sumLng / polygon.length);
      }

      return CampusBoundary(
        id: data['id'] as String? ?? doc.id,
        name: data['name'] as String? ?? '',
        shortName: data['short_name'] as String? ?? data['name'] as String? ?? '',
        amenity: data['amenity'] as String? ?? 'college',
        city: data['addr:city'] as String? ?? '',
        street: data['addr:street'] as String? ?? '',
        wikidata: data['wikidata'] as String?,
        osmRelationId: data['osm_relation_id'] as int? ?? 0,
        source: data['source'] as String? ?? 'OpenStreetMap',
        sourceDate: data['source_date'] as String? ?? '',
        verificationStatus: data['verification_status'] as String? ?? 'verified_osm',
        description: data['description'] as String? ?? '',
        polygon: polygon,
        centroid: centroid!,
        additionalTags: data,
      );
    } catch (_) {
      return null;
    }
  }

  /// Converts a Firestore GeoPoint / {latitude, longitude} / [lat, lng] value to a LatLng.
  ///
  /// Coordinates stored in Firestore are expected as [latitude, longitude] (not GeoJSON's
  /// [longitude, latitude]) when supplied as a list.
  LatLng _latLngFrom(dynamic value) {
    if (value is GeoPoint) {
      return LatLng(value.latitude, value.longitude);
    }
    if (value is Map<String, dynamic>) {
      final lat = (value['latitude'] ?? value['lat']) as num;
      final lng = (value['longitude'] ?? value['lng']) as num;
      return LatLng(lat.toDouble(), lng.toDouble());
    }
    if (value is List) {
      return LatLng((value[0] as num).toDouble(), (value[1] as num).toDouble());
    }
    throw FormatException('Unable to parse LatLng from: $value');
  }

  /// Converts a list of coordinate representations to a list of LatLng
  List<LatLng> _latLngListFrom(dynamic value) {
    if (value == null || value is! List) return <LatLng>[];
    return value.map((e) => _latLngFrom(e)).toList();
  }

  /// Load campus buildings from Firestore with asset fallback
  Future<List<CampusBuilding>> loadCampusBuildings() async {
    if (_buildings != null) return _buildings!;

    // Try Firestore first
    try {
      final snapshot = await _firestore.collection(_buildingsCollection).get();
      if (snapshot.docs.isNotEmpty) {
        final buildings = <CampusBuilding>[];
        for (final doc in snapshot.docs) {
          final building = _parseBuildingDoc(doc);
          if (building != null) buildings.add(building);
        }
        if (buildings.isNotEmpty) {
          _buildings = buildings;
          return _buildings!;
        }
      }
    } catch (_) {
      // Fall through to asset fallback
    }

    // Asset fallback (GeoJSON)
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

  /// Parses a campus building document from Firestore
  CampusBuilding? _parseBuildingDoc(QueryDocumentSnapshot doc) {
    try {
      final data = doc.data() as Map<String, dynamic>;
      final polygon = _latLngListFrom(data['polygon']);
      if (polygon.isEmpty) return null;

      LatLng? centroid;
      final centroidRaw = data['centroid'];
      if (centroidRaw != null) {
        centroid = _latLngFrom(centroidRaw);
      } else if (data['centroid_lat'] != null && data['centroid_lng'] != null) {
        centroid = LatLng(data['centroid_lat'] as double, data['centroid_lng'] as double);
      }
      if (centroid == null && polygon.isNotEmpty) {
        double sumLat = 0, sumLng = 0;
        for (final p in polygon) {
          sumLat += p.latitude;
          sumLng += p.longitude;
        }
        centroid = LatLng(sumLat / polygon.length, sumLng / polygon.length);
      }
      if (centroid == null) return null;

      return CampusBuilding(
        id: data['id'] as String? ?? doc.id,
        osmWayId: data['osm_way_id'] as int? ?? 0,
        name: data['name'] as String? ?? '',
        buildingType: data['building'] as String? ?? 'college',
        category: (data['category'] as String? ?? 'academic').toBuildingCategory(),
        description: data['description'] as String? ?? '',
        source: data['source'] as String? ?? 'OpenStreetMap',
        sourceDate: data['source_date'] as String? ?? '',
        verificationStatus: data['verification_status'] as String? ?? 'verified_osm',
        polygon: polygon,
        centroid: centroid,
        additionalTags: data,
      );
    } catch (_) {
      return null;
    }
  }

  /// Load campus pathways from Firestore with asset fallback
  Future<List<CampusPathway>> loadCampusPathways() async {
    if (_pathways != null) return _pathways!;

    // Try Firestore first
    try {
      final snapshot = await _firestore.collection(_pathwaysCollection).get();
      if (snapshot.docs.isNotEmpty) {
        final pathways = <CampusPathway>[];
        for (final doc in snapshot.docs) {
          final pathway = _parsePathwayDoc(doc);
          if (pathway != null) pathways.add(pathway);
        }
        if (pathways.isNotEmpty) {
          _pathways = pathways;
          return _pathways!;
        }
      }
    } catch (_) {
      // Fall through to asset fallback
    }

    // Asset fallback (GeoJSON)
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

  /// Parses a campus pathway document from Firestore
  CampusPathway? _parsePathwayDoc(QueryDocumentSnapshot doc) {
    try {
      final data = doc.data() as Map<String, dynamic>;
      final coordinates = _latLngListFrom(data['coordinates']);
      if (coordinates.isEmpty) return null;

      return CampusPathway(
        id: data['id'] as String? ?? doc.id,
        name: data['name'] as String? ?? '',
        highway: data['highway'] as String? ?? 'footway',
        surface: data['surface'] as String? ?? 'concrete',
        width: (data['width'] as num?)?.toDouble() ?? 2.0,
        category: (data['category'] as String? ?? 'other').toPathwayCategory(),
        description: data['description'] as String? ?? '',
        source: data['source'] as String? ?? 'OpenStreetMap',
        verificationStatus: data['verification_status'] as String? ?? 'verified_osm',
        coordinates: coordinates,
        geometryType: data['geometry_type'] as String? ?? 'LineString',
        capacity: data['capacity'] as int?,
        additionalTags: data,
      );
    } catch (_) {
      return null;
    }
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