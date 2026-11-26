/// SAFENAV CAVITE - Tile Cache Service
///
/// Custom offline map tile caching implementation for OpenStreetMap tiles.
/// Replaces flutter_map_tile_caching to avoid Android build issues with objectbox.
/// Caches tiles for the EARIST Cavite campus bounds for offline navigation.
library;

import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:path_provider/path_provider.dart';

import '../../data/models/campus_boundary.dart' as campus_boundary;
import 'custom_tile_provider.dart';

/// Service for managing offline map tile caching
class TileCacheService {
  TileCacheService._();

  static final TileCacheService _instance = TileCacheService._();
  static TileCacheService get instance => _instance;

  static const String _cacheDirName = 'safenav_campus_tiles';

  CustomTileProvider? _tileProvider;
  TileDownloader? _tileDownloader;
  Directory? _cacheDirectory;

  CustomTileProvider get tileProvider {
    if (_tileProvider == null) {
      throw StateError('Tile cache not initialized. Call initialize() first.');
    }
    return _tileProvider!;
  }

  TileDownloader get tileDownloader {
    if (_tileDownloader == null) {
      throw StateError('Tile cache not initialized. Call initialize() first.');
    }
    return _tileDownloader!;
  }

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  /// Initialize the tile cache store
  Future<void> initialize() async {
    if (_isInitialized) {
      developer.log('[TILE_CACHE] Already initialized', name: 'TileCacheService');
      return;
    }

    developer.log('[TILE_CACHE] Initializing custom tile cache...', name: 'TileCacheService');

    try {
      // Get app documents directory for cache storage
      _cacheDirectory = await getApplicationDocumentsDirectory();
      final cacheDir = Directory('${_cacheDirectory!.path}/$_cacheDirName');

      if (!await cacheDir.exists()) {
        await cacheDir.create(recursive: true);
      }

      // Create custom tile provider
      _tileProvider = CustomTileProvider(cacheDirectory: cacheDir);

      // Create tile downloader
      _tileDownloader = TileDownloader(tileProvider: _tileProvider!);

      _isInitialized = true;
      developer.log('[TILE_CACHE] Custom tile cache initialized successfully at ${cacheDir.path}', name: 'TileCacheService');
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
      // Use our custom tile provider for caching
      tileProvider: tileProvider,
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

      // Start the download
      final result = await tileDownloader.downloadRegion(
        bounds: fmBounds,
        minZoom: minZoom,
        maxZoom: maxZoom,
        onProgress: onProgress,
      );

      if (result.success) {
        developer.log('[TILE_CACHE] Campus tiles cached successfully: ${result.downloaded}/${result.totalTiles}', name: 'TileCacheService');
      } else {
        developer.log('[TILE_CACHE] Campus tiles cached with failures: ${result.downloaded}/${result.totalTiles} (${result.failed} failed)', name: 'TileCacheService');
      }
    } catch (e) {
      developer.log('[TILE_CACHE] ERROR caching campus tiles: $e', name: 'TileCacheService', error: e);
      rethrow;
    }
  }

  /// Get the cache size in bytes
  Future<int> getCacheSize() async {
    if (!_isInitialized) return 0;

    try {
      return await tileProvider.getCacheSize();
    } catch (e) {
      developer.log('[TILE_CACHE] ERROR getting cache size: $e', name: 'TileCacheService', error: e);
      return 0;
    }
  }

  /// Clear all cached tiles
  Future<void> clearCache() async {
    if (!_isInitialized) return;

    try {
      await tileProvider.clearCache();
      _isInitialized = false;
      _tileProvider = null;
      _tileDownloader = null;
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
      if (_cacheDirectory == null) return false;
      return await _cacheDirectory!.exists();
    } catch (e) {
      return false;
    }
  }

  /// Get list of cached tile coordinates (for debugging)
  Future<List<TileCoordinates>> getCachedTiles() async {
    if (!_isInitialized) return [];
    return await tileProvider.getCachedTiles();
  }

  /// Dispose the service
  void dispose() {
    _tileProvider = null;
    _tileDownloader = null;
    _cacheDirectory = null;
    _isInitialized = false;
  }
}