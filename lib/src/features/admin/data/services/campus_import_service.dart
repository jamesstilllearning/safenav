/// SAFENAV CAVITE - Campus Import Service
///
/// Service for importing campus GeoJSON data to Firestore via Cloud Functions.
/// Used by admin panel for one-time data migration.
library;

import 'dart:convert';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/services.dart' show rootBundle;

/// Service for importing campus data to Firestore
class CampusImportService {
  CampusImportService._();

  static final CampusImportService _instance = CampusImportService._();
  static CampusImportService get instance => _instance;

  final FirebaseFunctions _functions = FirebaseFunctions.instanceFor(region: 'us-central1');

  /// Import campus data from GeoJSON assets to Firestore
  ///
  /// This calls the `importCampusData` Cloud Function which:
  /// - Validates GeoJSON structure
  /// - Imports buildings, pathways, and boundary
  /// - Optionally clears existing data first
  /// - Requires admin role (enforced by Function)
  Future<CampusImportResult> importFromAssets({
    bool clearExisting = false,
  }) async {
    try {
      // Load GeoJSON from assets
      final buildingsJson = await _loadAsset('lib/src/features/map/data/campus_buildings.geojson');
      final pathwaysJson = await _loadAsset('lib/src/features/map/data/campus_pathways.geojson');
      final boundaryJson = await _loadAsset('lib/src/features/map/data/campus_boundary.geojson');

      // Parse to verify valid JSON
      final buildingsData = jsonDecode(buildingsJson) as Map<String, dynamic>;
      final pathwaysData = jsonDecode(pathwaysJson) as Map<String, dynamic>;
      final boundaryData = jsonDecode(boundaryJson) as Map<String, dynamic>;

      // Call Cloud Function
      final callable = _functions.httpsCallable('importCampusData');
      final result = await callable.call({
        'buildings': buildingsData,
        'pathways': pathwaysData,
        'boundary': boundaryData,
        'clearExisting': clearExisting,
      });

      final data = result.data as Map<String, dynamic>;
      return CampusImportResult(
        success: data['success'] as bool,
        message: data['message'] as String,
        buildingsImported: data['counts']['buildings'] as int,
        pathwaysImported: data['counts']['pathways'] as int,
        boundaryImported: data['counts']['boundary'] as int,
      );
    } on FirebaseFunctionsException catch (e) {
      return CampusImportResult(
        success: false,
        message: 'Function error: ${e.code} - ${e.message}',
        buildingsImported: 0,
        pathwaysImported: 0,
        boundaryImported: 0,
      );
    } catch (e) {
      return CampusImportResult(
        success: false,
        message: 'Import failed: $e',
        buildingsImported: 0,
        pathwaysImported: 0,
        boundaryImported: 0,
      );
    }
  }

  /// Import campus data from custom GeoJSON (for admin editor)
  Future<CampusImportResult> importFromGeoJSON({
    required Map<String, dynamic> buildings,
    required Map<String, dynamic> pathways,
    required Map<String, dynamic> boundary,
    bool clearExisting = false,
  }) async {
    try {
      final callable = _functions.httpsCallable('importCampusData');
      final result = await callable.call({
        'buildings': buildings,
        'pathways': pathways,
        'boundary': boundary,
        'clearExisting': clearExisting,
      });

      final data = result.data as Map<String, dynamic>;
      return CampusImportResult(
        success: data['success'] as bool,
        message: data['message'] as String,
        buildingsImported: data['counts']['buildings'] as int,
        pathwaysImported: data['counts']['pathways'] as int,
        boundaryImported: data['counts']['boundary'] as int,
      );
    } on FirebaseFunctionsException catch (e) {
      return CampusImportResult(
        success: false,
        message: 'Function error: ${e.code} - ${e.message}',
        buildingsImported: 0,
        pathwaysImported: 0,
        boundaryImported: 0,
      );
    } catch (e) {
      return CampusImportResult(
        success: false,
        message: 'Import failed: $e',
        buildingsImported: 0,
        pathwaysImported: 0,
        boundaryImported: 0,
      );
    }
  }

  /// Load asset as string
  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}

/// Result of campus data import
class CampusImportResult {
  const CampusImportResult({
    required this.success,
    required this.message,
    required this.buildingsImported,
    required this.pathwaysImported,
    required this.boundaryImported,
  });

  final bool success;
  final String message;
  final int buildingsImported;
  final int pathwaysImported;
  final int boundaryImported;

  @override
  String toString() {
    return 'CampusImportResult(success: $success, message: $message, '
        'buildings: $buildingsImported, pathways: $pathwaysImported, boundary: $boundaryImported)';
  }
}