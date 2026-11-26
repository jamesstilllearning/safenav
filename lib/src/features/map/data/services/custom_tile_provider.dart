/// SAFENAV CAVITE - Custom Tile Provider
///
/// Custom tile caching implementation to replace flutter_map_tile_caching.
/// Downloads and stores OSM tiles locally using http + file storage.
/// Organizes tiles by z/x/y in app documents directory.
library;

import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;

/// Custom tile provider that reads tiles from local storage and downloads if needed
class CustomTileProvider extends TileProvider {
  CustomTileProvider({
    required this.cacheDirectory,
    this.subdomains = const ['a', 'b', 'c'],
    this.urlTemplate = 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
    this.userAgentPackageName = 'com.earist.safenav',
    this.requestTimeout = const Duration(seconds: 15),
  }) : super(headers: {
         'User-Agent': userAgentPackageName,
       });

  final Directory cacheDirectory;
  final List<String> subdomains;
  final String urlTemplate;
  final String userAgentPackageName;
  final Duration requestTimeout;

  int _subdomainIndex = 0;

  String _getSubdomain() {
    final subdomain = subdomains[_subdomainIndex];
    _subdomainIndex = (_subdomainIndex + 1) % subdomains.length;
    return subdomain;
  }

  @override
  String getTileUrl(TileCoordinates coordinates, TileLayer options) {
    final subdomain = _getSubdomain();
    final url = options.urlTemplate ?? urlTemplate;

    // Replace placeholders manually
    return url
        .replaceAll('{z}', coordinates.z.toString())
        .replaceAll('{x}', coordinates.x.toString())
        .replaceAll('{y}', coordinates.y.toString())
        .replaceAll('{s}', subdomain);
  }

  Future<File> _getTileFile(TileCoordinates coordinates) async {
    final z = coordinates.z;
    final x = coordinates.x;
    final y = coordinates.y;

    final tileDir = Directory('${cacheDirectory.path}/tiles/$z/$x');
    if (!await tileDir.exists()) {
      await tileDir.create(recursive: true);
    }
    return File('${tileDir.path}/$y.png');
  }

  @override
  ImageProvider getImage(TileCoordinates coordinates, TileLayer options) {
    return _CachedTileImageProvider(
      tileProvider: this,
      coordinates: coordinates,
      options: options,
    );
  }

  /// Clear all cached tiles
  Future<void> clearCache() async {
    if (await cacheDirectory.exists()) {
      await cacheDirectory.delete(recursive: true);
      developer.log('[CUSTOM_TILE] Cache cleared', name: 'CustomTileProvider');
    }
  }

  /// Get cache size in bytes
  Future<int> getCacheSize() async {
    if (!await cacheDirectory.exists()) return 0;

    int totalSize = 0;
    await for (final entity in cacheDirectory.list(recursive: true)) {
      if (entity is File) {
        final stat = await entity.stat();
        totalSize += stat.size;
      }
    }
    return totalSize;
  }

  /// Get list of cached tile coordinates
  Future<List<TileCoordinates>> getCachedTiles() async {
    final tiles = <TileCoordinates>[];
    if (!await cacheDirectory.exists()) return tiles;

    final tilesDir = Directory('${cacheDirectory.path}/tiles');
    if (!await tilesDir.exists()) return tiles;

    await for (final entity in tilesDir.list(recursive: true)) {
      if (entity is File && entity.path.endsWith('.png')) {
        final path = entity.path;
        final parts = path.split(Platform.pathSeparator);
        // Expected: .../tiles/z/x/y.png
        if (parts.length >= 4) {
          final yStr = parts.last.replaceAll('.png', '');
          final xStr = parts[parts.length - 2];
          final zStr = parts[parts.length - 3];
          final z = int.tryParse(zStr);
          final x = int.tryParse(xStr);
          final y = int.tryParse(yStr);
          if (z != null && x != null && y != null) {
            tiles.add(TileCoordinates(z, x, y));
          }
        }
      }
    }
    return tiles;
  }
}

/// Image provider that handles local caching with network fallback
class _CachedTileImageProvider extends ImageProvider<_CachedTileImageProvider> {
  const _CachedTileImageProvider({
    required this.tileProvider,
    required this.coordinates,
    required this.options,
  });

  final CustomTileProvider tileProvider;
  final TileCoordinates coordinates;
  final TileLayer options;

  @override
  ImageStreamCompleter loadImage(
    _CachedTileImageProvider key,
    ImageDecoderCallback decode,
  ) =>
      MultiFrameImageStreamCompleter(
        codec: _load(key, decode),
        scale: 1,
        debugLabel: key.tileProvider.getTileUrl(key.coordinates, key.options),
        informationCollector: () => [
          DiagnosticsProperty('Coordinates', '${coordinates.z}/${coordinates.x}/${coordinates.y}'),
          DiagnosticsProperty('URL', tileProvider.getTileUrl(coordinates, options)),
        ],
      );

  Future<ui.Codec> _load(
    _CachedTileImageProvider key,
    ImageDecoderCallback decode,
  ) async {
    final tileFile = await tileProvider._getTileFile(key.coordinates);

    // Try to load from local cache first
    if (await tileFile.exists()) {
      try {
        final bytes = await tileFile.readAsBytes();
        if (bytes.isNotEmpty) {
          developer.log('[CUSTOM_TILE] Cache hit: z=${coordinates.z} x=${coordinates.x} y=${coordinates.y}', name: 'CustomTileProvider');
          return await ui.ImmutableBuffer.fromUint8List(bytes).then(decode);
        }
      } catch (e) {
        developer.log('[CUSTOM_TILE] Cache read error: $e', name: 'CustomTileProvider', error: e);
      }
    }

    // Not in cache or corrupted - download from network
    developer.log('[CUSTOM_TILE] Cache miss, downloading: z=${coordinates.z} x=${coordinates.x} y=${coordinates.y}', name: 'CustomTileProvider');

    final url = tileProvider.getTileUrl(key.coordinates, key.options);
    try {
      final response = await http
          .get(
            Uri.parse(url),
            headers: tileProvider.headers,
          )
          .timeout(tileProvider.requestTimeout);

      if (response.statusCode == 200 && response.bodyBytes.isNotEmpty) {
        // Save to cache
        await tileFile.writeAsBytes(response.bodyBytes);
        developer.log('[CUSTOM_TILE] Downloaded and cached: z=${coordinates.z} x=${coordinates.x} y=${coordinates.y} (${response.bodyBytes.length} bytes)', name: 'CustomTileProvider');
        return await ui.ImmutableBuffer.fromUint8List(response.bodyBytes).then(decode);
      } else {
        developer.log('[CUSTOM_TILE] Download failed: ${response.statusCode}', name: 'CustomTileProvider');
      }
    } catch (e) {
      developer.log('[CUSTOM_TILE] Download error: $e', name: 'CustomTileProvider', error: e);
    }

    // Return transparent placeholder on failure
    return await ui.ImmutableBuffer.fromUint8List(TileProvider.transparentImage).then(decode);
  }

  @override
  SynchronousFuture<_CachedTileImageProvider> obtainKey(
    ImageConfiguration configuration,
  ) =>
      SynchronousFuture(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is _CachedTileImageProvider &&
          coordinates == other.coordinates &&
          options.urlTemplate == other.options.urlTemplate);

  @override
  int get hashCode => Object.hash(coordinates, options.urlTemplate);
}

/// Tile downloader for bulk downloading tiles in a region
class TileDownloader {
  TileDownloader({
    required this.tileProvider,
    this.maxConcurrentDownloads = 4,
    this.requestTimeout = const Duration(seconds: 15),
  });

  final CustomTileProvider tileProvider;
  final int maxConcurrentDownloads;
  final Duration requestTimeout;

  /// Download tiles for a bounding box at specific zoom levels
  Future<DownloadResult> downloadRegion({
    required LatLngBounds bounds,
    required int minZoom,
    required int maxZoom,
    void Function(double progress)? onProgress,
    bool Function()? shouldCancel,
  }) async {
    final tilesToDownload = <TileCoordinates>[];
    int totalTiles = 0;

    // Calculate all tiles needed
    for (int z = minZoom; z <= maxZoom; z++) {
      final minX = _latLngToTileX(bounds.west, z);
      final maxX = _latLngToTileX(bounds.east, z);
      final minY = _latLngToTileY(bounds.north, z);
      final maxY = _latLngToTileY(bounds.south, z);

      for (int x = minX; x <= maxX; x++) {
        for (int y = minY; y <= maxY; y++) {
          tilesToDownload.add(TileCoordinates(z, x, y));
        }
      }
      totalTiles += (maxX - minX + 1) * (maxY - minY + 1);
    }

    if (totalTiles == 0) {
      return DownloadResult(success: true, totalTiles: 0, downloaded: 0, failed: 0);
    }

    developer.log('[TILE_DOWNLOADER] Starting download: $totalTiles tiles (zoom $minZoom-$maxZoom)', name: 'TileDownloader');

    int downloaded = 0;
    int failed = 0;
    final semaphore = _Semaphore(maxConcurrentDownloads);

    final futures = tilesToDownload.map((coord) async {
      if (shouldCancel?.call() ?? false) return;

      await semaphore.acquire();
      try {
        // Check if already cached
        final tileFile = await tileProvider._getTileFile(coord);
        if (await tileFile.exists()) {
          downloaded++;
          if (onProgress != null) onProgress(downloaded / totalTiles);
          return;
        }

        // Download
        final url = tileProvider.getTileUrl(coord, TileLayer(urlTemplate: tileProvider.urlTemplate));
        try {
          final response = await http
              .get(
                Uri.parse(url),
                headers: tileProvider.headers,
              )
              .timeout(requestTimeout);

          if (response.statusCode == 200 && response.bodyBytes.isNotEmpty) {
            await tileFile.writeAsBytes(response.bodyBytes);
            downloaded++;
          } else {
            failed++;
            developer.log('[TILE_DOWNLOADER] Failed: z=${coord.z} x=${coord.x} y=${coord.y} (${response.statusCode})', name: 'TileDownloader');
          }
        } catch (e) {
          failed++;
          developer.log('[TILE_DOWNLOADER] Error: z=${coord.z} x=${coord.x} y=${coord.y} - $e', name: 'TileDownloader');
        }
      } finally {
        semaphore.release();
        if (onProgress != null) onProgress(downloaded / totalTiles);
      }
    });

    await Future.wait(futures);

    developer.log('[TILE_DOWNLOADER] Complete: $downloaded downloaded, $failed failed', name: 'TileDownloader');
    return DownloadResult(
      success: failed == 0,
      totalTiles: totalTiles,
      downloaded: downloaded,
      failed: failed,
    );
  }

  int _latLngToTileX(double lon, int zoom) {
    return ((lon + 180) / 360 * (1 << zoom)).floor().clamp(0, (1 << zoom) - 1);
  }

  int _latLngToTileY(double lat, int zoom) {
    final latRad = lat * math.pi / 180;
    return ((1 - math.log(math.tan(latRad) + 1 / math.cos(latRad)) / math.pi) / 2 * (1 << zoom)).floor().clamp(0, (1 << zoom) - 1);
  }
}

/// Simple semaphore for limiting concurrent operations
class _Semaphore {
  _Semaphore._internal(this.maxPermits) : _available = maxPermits;

  final int maxPermits;
  int _available;
  final List<Completer<void>> _waiters = [];

  factory _Semaphore(int maxPermits) => _Semaphore._internal(maxPermits);

  Future<void> acquire() async {
    if (_available > 0) {
      _available--;
      return;
    }
    final completer = Completer<void>();
    _waiters.add(completer);
    return completer.future;
  }

  void release() {
    if (_waiters.isNotEmpty) {
      final completer = _waiters.removeAt(0);
      completer.complete();
    } else {
      _available++;
    }
  }
}

/// Result of a tile download operation
class DownloadResult {
  const DownloadResult({
    required this.success,
    required this.totalTiles,
    required this.downloaded,
    required this.failed,
  });

  final bool success;
  final int totalTiles;
  final int downloaded;
  final int failed;

  double get progress => totalTiles > 0 ? downloaded / totalTiles : 1.0;
}