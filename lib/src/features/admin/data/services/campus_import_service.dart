/// SAFENAV CAVITE - Campus Import Service
///
/// Service for importing campus GeoJSON data to Firestore via Cloudflare Workers.
/// Used by admin panel for one-time data migration.
library;

import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/services/cloudflare_worker_client.dart';
import '../../../../core/services/auth_service.dart';

/// Service for importing campus data to Firestore
class CampusImportService {
  CampusImportService._();

  static final CampusImportService _instance = CampusImportService._();
  static CampusImportService get instance => _instance;

  final CloudflareWorkerClient _workerClient = CloudflareWorkerClient.instance;

  /// Initialize the service with auth token getter
  /// Call this from your app initialization (e.g., in main.dart after AuthService is initialized)
  void initialize(Ref ref) {
    _workerClient.setAuthTokenGetter(() async {
      final authService = ref.read(authServiceProvider);
      return authService.getIdToken(forceRefresh: true).then((result) {
        return result.isSuccess ? result.value : null;
      });
    });
  }

  /// Import campus data from GeoJSON assets to Firestore
  ///
  /// This calls the Cloudflare Worker endpoint `/api/importCampusData` which:
  /// - Validates GeoJSON structure
  /// - Imports buildings, pathways, and boundary
  /// - Optionally clears existing data first
  /// - Requires admin role (enforced by Worker)
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

      // Call Cloudflare Worker
      final result = await _workerClient.importCampusData(
        buildings: buildingsData,
        pathways: pathwaysData,
        boundary: boundaryData,
        clearExisting: clearExisting,
      );

      if (result.isSuccess) {
        return result.value;
      } else {
        return CampusImportResult(
          success: false,
          message: result.failure.message,
          buildingsImported: 0,
          pathwaysImported: 0,
          boundaryImported: 0,
        );
      }
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
      final result = await _workerClient.importCampusData(
        buildings: buildings,
        pathways: pathways,
        boundary: boundary,
        clearExisting: clearExisting,
      );

      if (result.isSuccess) {
        return result.value;
      } else {
        return CampusImportResult(
          success: false,
          message: result.failure.message,
          buildingsImported: 0,
          pathwaysImported: 0,
          boundaryImported: 0,
        );
      }
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