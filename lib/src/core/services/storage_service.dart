/// SAFENAV CAVITE - Storage Service
///
/// Handles local data persistence using Hive for offline-first architecture.
library;

import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_constants.dart';
import '../errors/failures.dart';
import '../errors/result.dart';

/// Service for managing local storage (Hive + SharedPreferences)
class StorageService {
  StorageService._();

  static final StorageService _instance = StorageService._();
  static StorageService get instance => _instance;

  bool _isInitialized = false;
  late Box _cacheBox;
  late Box _settingsBox;
  late Box _mapDataBox;
  late SharedPreferences _prefs;

  /// Whether service is initialized
  bool get isInitialized => _isInitialized;

  /// Initializes storage service
  Future<Result<void>> initialize() async {
    if (_isInitialized) return const Success(null);

    try {
      // Initialize Hive
      await Hive.initFlutter();

      // Open boxes
      _cacheBox = await Hive.openBox('cache');
      _settingsBox = await Hive.openBox('settings');
      _mapDataBox = await Hive.openBox('map_data');

      // Initialize SharedPreferences
      _prefs = await SharedPreferences.getInstance();

      _isInitialized = true;
      return const Success(null);
    } catch (e) {
      return FailureResult(CacheFailure(
        message: 'Failed to initialize storage',
        code: 'STORAGE_INIT_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  // ===========================================================================
  // Cache Operations (for API responses, temporary data)
  // ===========================================================================

  /// Stores a value in cache with optional expiration
  Future<Result<void>> setCache(String key, dynamic value, {Duration? ttl}) async {
    try {
      final cacheEntry = {
        'value': value,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
        'ttl': ttl?.inMilliseconds,
      };
      await _cacheBox.put(key, cacheEntry);
      return const Success(null);
    } catch (e) {
      return FailureResult(CacheFailure(
        message: 'Failed to store cache',
        code: 'CACHE_SET_FAILED',
        details: {'key': key, 'error': e.toString()},
      ));
    }
  }

  /// Gets a value from cache, returns null if expired or not found
  Future<Result<dynamic>> getCache(String key) async {
    try {
      final entry = _cacheBox.get(key);
      if (entry == null) return const Success(null);

      final timestamp = entry['timestamp'] as int;
      final ttl = entry['ttl'] as int?;
      final now = DateTime.now().millisecondsSinceEpoch;

      // Check expiration
      if (ttl != null && (now - timestamp) > ttl) {
        await _cacheBox.delete(key);
        return const Success(null);
      }

      return Success(entry['value']);
    } catch (e) {
      return FailureResult(CacheFailure(
        message: 'Failed to get cache',
        code: 'CACHE_GET_FAILED',
        details: {'key': key, 'error': e.toString()},
      ));
    }
  }

  /// Removes a cache entry
  Future<Result<void>> removeCache(String key) async {
    try {
      await _cacheBox.delete(key);
      return const Success(null);
    } catch (e) {
      return FailureResult(CacheFailure(
        message: 'Failed to remove cache',
        code: 'CACHE_REMOVE_FAILED',
        details: {'key': key, 'error': e.toString()},
      ));
    }
  }

  /// Clears all cache
  Future<Result<void>> clearCache() async {
    try {
      await _cacheBox.clear();
      return const Success(null);
    } catch (e) {
      return FailureResult(CacheFailure(
        message: 'Failed to clear cache',
        code: 'CACHE_CLEAR_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  // ===========================================================================
  // Settings Operations (persistent user preferences)
  // ===========================================================================

  /// Stores a setting value
  Future<Result<void>> setSetting(String key, dynamic value) async {
    try {
      await _settingsBox.put(key, value);
      return const Success(null);
    } catch (e) {
      return FailureResult(CacheFailure(
        message: 'Failed to store setting',
        code: 'SETTING_SET_FAILED',
        details: {'key': key, 'error': e.toString()},
      ));
    }
  }

  /// Gets a setting value
  Future<Result<dynamic>> getSetting(String key, {dynamic defaultValue}) async {
    try {
      final value = _settingsBox.get(key, defaultValue: defaultValue);
      return Success(value);
    } catch (e) {
      return FailureResult(CacheFailure(
        message: 'Failed to get setting',
        code: 'SETTING_GET_FAILED',
        details: {'key': key, 'error': e.toString()},
      ));
    }
  }

  /// Gets a boolean setting
  Future<Result<bool>> getBoolSetting(String key, {bool defaultValue = false}) async {
    try {
      final value = _settingsBox.get(key, defaultValue: defaultValue) as bool?;
      return Success(value ?? defaultValue);
    } catch (e) {
      return FailureResult(CacheFailure(
        message: 'Failed to get boolean setting',
        code: 'BOOL_SETTING_GET_FAILED',
        details: {'key': key, 'error': e.toString()},
      ));
    }
  }

  /// Gets a string setting
  Future<Result<String?>> getStringSetting(String key) async {
    try {
      final value = _settingsBox.get(key) as String?;
      return Success(value);
    } catch (e) {
      return FailureResult(CacheFailure(
        message: 'Failed to get string setting',
        code: 'STRING_SETTING_GET_FAILED',
        details: {'key': key, 'error': e.toString()},
      ));
    }
  }

  /// Gets an int setting
  Future<Result<int?>> getIntSetting(String key) async {
    try {
      final value = _settingsBox.get(key) as int?;
      return Success(value);
    } catch (e) {
      return FailureResult(CacheFailure(
        message: 'Failed to get int setting',
        code: 'INT_SETTING_GET_FAILED',
        details: {'key': key, 'error': e.toString()},
      ));
    }
  }

  /// Removes a setting
  Future<Result<void>> removeSetting(String key) async {
    try {
      await _settingsBox.delete(key);
      return const Success(null);
    } catch (e) {
      return FailureResult(CacheFailure(
        message: 'Failed to remove setting',
        code: 'SETTING_REMOVE_FAILED',
        details: {'key': key, 'error': e.toString()},
      ));
    }
  }

  // ===========================================================================
  // Map Data Operations (offline map and evacuation graph)
  // ===========================================================================

  /// Stores evacuation graph data
  Future<Result<void>> setEvacuationGraph(Map<String, dynamic> graphData) async {
    try {
      await _mapDataBox.put('evacuation_graph', {
        'data': graphData,
        'version': graphData['version'] ?? 1,
        'cached_at': DateTime.now().millisecondsSinceEpoch,
      });
      await setSetting(AppConstants.prefKeyEvacuationGraphCached, true);
      await setSetting(AppConstants.prefKeyLastGraphVersion, graphData['version'] ?? 1);
      return const Success(null);
    } catch (e) {
      return FailureResult(CacheFailure(
        message: 'Failed to store evacuation graph',
        code: 'EVACUATION_GRAPH_SET_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Gets evacuation graph data
  Future<Result<Map<String, dynamic>?>> getEvacuationGraph() async {
    try {
      final entry = _mapDataBox.get('evacuation_graph');
      if (entry == null) return const Success(null);
      return Success(entry['data'] as Map<String, dynamic>);
    } catch (e) {
      return FailureResult(CacheFailure(
        message: 'Failed to get evacuation graph',
        code: 'EVACUATION_GRAPH_GET_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Stores locations data
  Future<Result<void>> setLocationsData(List<Map<String, dynamic>> locations) async {
    try {
      await _mapDataBox.put('locations', {
        'data': locations,
        'cached_at': DateTime.now().millisecondsSinceEpoch,
      });
      await setSetting(AppConstants.prefKeyOfflineMapCached, true);
      return const Success(null);
    } catch (e) {
      return FailureResult(CacheFailure(
        message: 'Failed to store locations data',
        code: 'LOCATIONS_SET_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Gets locations data
  Future<Result<List<Map<String, dynamic>>?>> getLocationsData() async {
    try {
      final entry = _mapDataBox.get('locations');
      if (entry == null) return const Success(null);
      return Success(List<Map<String, dynamic>>.from(entry['data']));
    } catch (e) {
      final err = e.toString();
      return FailureResult(CacheFailure(
        message: 'Failed to get locations data',
        code: 'LOCATIONS_GET_FAILED',
        details: {'error': err},
      ));
    }
  }

  /// Checks if offline map data is available
  Future<Result<bool>> isOfflineDataAvailable() async {
    try {
      final mapCachedResult = await getBoolSetting(AppConstants.prefKeyOfflineMapCached);
      final graphCachedResult = await getBoolSetting(AppConstants.prefKeyEvacuationGraphCached);
      final mapCached = mapCachedResult.isSuccess ? mapCachedResult.value : false;
      final graphCached = graphCachedResult.isSuccess ? graphCachedResult.value : false;
      return Success(mapCached && graphCached);
    } catch (_) {
      return const Success(false);
    }
  }

  /// Clears all map data
  Future<Result<void>> clearMapData() async {
    try {
      await _mapDataBox.clear();
      await setSetting(AppConstants.prefKeyOfflineMapCached, false);
      await setSetting(AppConstants.prefKeyEvacuationGraphCached, false);
      return const Success(null);
    } catch (e) {
      return FailureResult(CacheFailure(
        message: 'Failed to clear map data',
        code: 'MAP_DATA_CLEAR_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  // ===========================================================================
  // SharedPreferences Operations (for simple key-value)
  // ===========================================================================

  /// Sets a string in SharedPreferences
  Future<Result<void>> setPrefsString(String key, String value) async {
    try {
      await _prefs.setString(key, value);
      return const Success(null);
    } catch (e) {
      return FailureResult(CacheFailure(
        message: 'Failed to store string preference',
        code: 'PREFS_STRING_SET_FAILED',
        details: {'key': key, 'error': e.toString()},
      ));
    }
  }

  /// Gets a string from SharedPreferences
  Future<Result<String?>> getPrefsString(String key) async {
    try {
      final value = _prefs.getString(key);
      return Success(value);
    } catch (e) {
      return FailureResult(CacheFailure(
        message: 'Failed to get string preference',
        code: 'PREFS_STRING_GET_FAILED',
        details: {'key': key, 'error': e.toString()},
      ));
    }
  }

  /// Sets a bool in SharedPreferences
  Future<Result<void>> setPrefsBool(String key, bool value) async {
    try {
      await _prefs.setBool(key, value);
      return const Success(null);
    } catch (e) {
      return FailureResult(CacheFailure(
        message: 'Failed to store bool preference',
        code: 'PREFS_BOOL_SET_FAILED',
        details: {'key': key, 'error': e.toString()},
      ));
    }
  }

  /// Gets a bool from SharedPreferences
  Future<Result<bool>> getPrefsBool(String key, {bool defaultValue = false}) async {
    try {
      final value = _prefs.getBool(key) ?? defaultValue;
      return Success(value);
    } catch (e) {
      return FailureResult(CacheFailure(
        message: 'Failed to get bool preference',
        code: 'PREFS_BOOL_GET_FAILED',
        details: {'key': key, 'error': e.toString()},
      ));
    }
  }

  /// Removes a key from SharedPreferences
  Future<Result<void>> removePrefs(String key) async {
    try {
      await _prefs.remove(key);
      return const Success(null);
    } catch (e) {
      return FailureResult(CacheFailure(
        message: 'Failed to remove preference',
        code: 'PREFS_REMOVE_FAILED',
        details: {'key': key, 'error': e.toString()},
      ));
    }
  }

  /// Clears all SharedPreferences
  Future<Result<void>> clearPrefs() async {
    try {
      await _prefs.clear();
      return const Success(null);
    } catch (e) {
      return FailureResult(CacheFailure(
        message: 'Failed to clear preferences',
        code: 'PREFS_CLEAR_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  // ===========================================================================
  // Utility Methods
  // ===========================================================================

  /// Gets storage usage info
  Future<Result<Map<String, int>>> getStorageInfo() async {
    try {
      return Success({
        'cache_entries': _cacheBox.length,
        'settings_entries': _settingsBox.length,
        'map_data_entries': _mapDataBox.length,
      });
    } catch (e) {
      return FailureResult(CacheFailure(
        message: 'Failed to get storage info',
        code: 'STORAGE_INFO_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Disposes resources
  Future<void> dispose() async {
    await _cacheBox.close();
    await _settingsBox.close();
    await _mapDataBox.close();
    _isInitialized = false;
  }
}