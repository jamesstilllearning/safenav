/// SAFENAV CAVITE - Tile Cache Service
///
/// Offline map tile caching using flutter_map_tile_caching for OpenStreetMap tiles.
/// Caches tiles for the EARIST Cavite campus bounds for offline navigation.
library;

import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';
import 'package:latlong2/latlong.dart';

import '../../data/models/campus_boundary.dart' as campus_boundary;

/// Service for managing offline map tile caching
class TileCacheService {
  TileCacheService._();

  static final TileCacheService _instance = TileCacheService._();
  static TileCacheService get instance => _instance;

  static const String _cacheStoreName = 'safenav_campus_tiles';

  FMTCStore? _store;
  FMTCStore get store {
    if (_store == null) {
      throw StateError('Tile cache store not initialized. Call initialize() first.');
    }
    return _store!;
  }

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  /// Initialize the tile cache store
  Future<void> initialize() async {
    if (_isInitialized) {
      developer.log('[TILE_CACHE] Already initialized', name: 'TileCacheService');
      return;
    }

    developer.log('[TILE_CACHE] Initializing tile cache store...', name: 'TileCacheService');

    try {
      // Create the cache store
      _store = FMTCStore(_cacheStoreName);

      // Initialize the store
      await _store!.manage.create();

      _isInitialized = true;
      developer.log('[TILE_CACHE] Tile cache store initialized successfully', name: 'TileCacheService');
    } catch (e) {
      developer.log('[TILE_CACHE] ERROR initializing tile cache: $e', name: 'TileCacheService', error: e);
      rethrow;
    }
  }

  /// Get the tile layer with caching support
  TileLayer getCachedTileLayer() {
    return TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      maxZoom: 19,
      subdomains: const ['a', 'b', 'c'],
      userAgentPackageName: 'com.earist.safenav',
      // Use the cache store for tile loading
      tileProvider: store.getTileProvider(),
    );
  }

  /// Download/cache tiles for the campus bounds
  ///
  /// [boundary] The campus boundary to cache tiles for
  /// [minZoom] Minimum zoom level to cache (default: 14)
  /// [maxZoom] Maximum zoom level to cache (default: 19)
  /// [onProgress] Optional callback for progress updates (0.0 to 1.0)
  Future<void> cacheCampusTiles({
    required campus_boundary.CampusBoundary boundary,
    int minZoom = 14,
    int maxZoom = 19,
    void Function(double progress)? onProgress,
  }) async {
    if (!_isInitialized) {
      await initialize();
    }

    final bounds = boundary.bounds;
    final southWest = bounds.southWest;
    final northEast = bounds.northEast;

    // Add a small padding around the campus bounds
    const double padding = 0.002; // ~200m padding
    final LatLng paddedSouthWest = LatLng(southWest.latitude - padding, southWest.longitude - padding);
    final LatLng paddedNorthEast = LatLng(northEast.latitude + padding, northEast.longitude + padding);

    developer.log('[TILE_CACHE] Caching tiles for campus bounds: '
        '${paddedSouthWest.latitude},${paddedSouthWest.longitude} - '
        '${paddedNorthEast.latitude},${paddedNorthEast.longitude} '
        'Zoom: $minZoom-$maxZoom', name: 'TileCacheService');

    try {
      // Create flutter_map LatLngBounds from padded corners
      final fmBounds = LatLngBounds(paddedSouthWest, paddedNorthEast);

      // Create the region for downloading
      final region = RectangleRegion(fmBounds).toDownloadable(
        minZoom: minZoom,
        maxZoom: maxZoom,
        options: TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          maxZoom: maxZoom.toDouble(),
          subdomains: const ['a', 'b', 'c'],
          userAgentPackageName: 'com.earist.safenav',
        ),
      );

      // Start the download
      await for (final progress in store.download.startForeground(region: region)) {
        if (onProgress != null) {
          // Use percentageProgress (0-100) converted to 0.0-1.0
          onProgress(progress.percentageProgress / 100.0);
        }
        developer.log('[TILE_CACHE] Caching progress: ${progress.percentageProgress.toStringAsFixed(1)}%', name: 'TileCacheService');
      }

      developer.log('[TILE_CACHE] Campus tiles cached successfully', name: 'TileCacheService');
    } catch (e) {
      developer.log('[TILE_CACHE] ERROR caching campus tiles: $e', name: 'TileCacheService', error: e);
      rethrow;
    }
  }

  /// Get the cache size in bytes
  Future<int> getCacheSize() async {
    if (!_isInitialized) return 0;

    try {
      final sizeKiB = await store.stats.size;
      // Convert KiB to bytes
      return (sizeKiB * 1024).round();
    } catch (e) {
      developer.log('[TILE_CACHE] ERROR getting cache size: $e', name: 'TileCacheService', error: e);
      return 0;
    }
  }

  /// Clear all cached tiles
  Future<void> clearCache() async {
    if (!_isInitialized) return;

    try {
      await store.manage.delete();
      _isInitialized = false;
      _store = null;
      developer.log('[TILE_CACHE] Cache cleared', name: 'TileCacheService');
    } catch (e) {
      developer.log('[TILE_CACHE] ERROR clearing cache: $e', name: 'TileCacheService', error: e);
      rethrow;
    }
  }

  /// Check if store exists
  Future<bool> storeExists() async {
    if (!_isInitialized) return false;
    try {
      return await store.manage.ready;
    } catch (e) {
      return false;
    }
  }

  /// Dispose the service
  void dispose() {
    _store = null;
    _isInitialized = false;
  }
}