/// SAFENAV CAVITE - Cloudflare Worker Client
///
/// Client for calling Cloudflare Worker HTTP endpoints.
/// Replaces Firebase Cloud Functions callables.
library;

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod/riverpod.dart';

import '../errors/failures.dart';
import '../errors/result.dart';

/// Cloudflare Worker client provider
final cloudflareWorkerClientProvider = Provider<CloudflareWorkerClient>((ref) => CloudflareWorkerClient.instance);

/// Service for calling Cloudflare Worker endpoints
class CloudflareWorkerClient {
  CloudflareWorkerClient._();

  static final CloudflareWorkerClient _instance = CloudflareWorkerClient._();
  static CloudflareWorkerClient get instance => _instance;

  // Base URL for the worker
  // Update this after deploying to Cloudflare
  // Format: https://<worker-name>.<subdomain>.workers.dev
  static const String _baseUrl = 'https://safenav-cavite-workers.your-subdomain.workers.dev';

  final http.Client _client = http.Client();

  /// Auth token getter - set during initialization
  Future<String?> Function()? _authTokenGetter;

  /// Get the base URL (can be overridden for different environments)
  String get baseUrl => _baseUrl;

  /// Import campus data from GeoJSON
  ///
  /// Calls POST /api/importCampusData
  Future<Result<CampusImportResult>> importCampusData({
    required Map<String, dynamic> buildings,
    required Map<String, dynamic> pathways,
    required Map<String, dynamic> boundary,
    bool clearExisting = false,
  }) async {
    try {
      final token = await _getAuthToken();
      if (token == null) {
        return FailureResult(AuthFailure(
          message: 'No authenticated user',
          code: 'NO_AUTH_TOKEN',
        ));
      }

      final response = await _client.post(
        Uri.parse('$_baseUrl/api/importCampusData'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'buildings': buildings,
          'pathways': pathways,
          'boundary': boundary,
          'clearExisting': clearExisting,
        }),
      );

      return _handleResponse<CampusImportResult>(response, (data) {
        return CampusImportResult(
          success: data['success'] as bool,
          message: data['message'] as String,
          buildingsImported: data['counts']['buildings'] as int,
          pathwaysImported: data['counts']['pathways'] as int,
          boundaryImported: data['counts']['boundary'] as int,
        );
      });
    } catch (e) {
      return FailureResult(NetworkFailure(
        message: 'Import failed: $e',
        code: 'IMPORT_FAILED',
      ));
    }
  }

  /// Register FCM token for the current user
  ///
  /// Calls POST /api/registerToken
  Future<Result<void>> registerToken({
    required String token,
    required String platform,
    required String appVersion,
  }) async {
    try {
      final authToken = await _getAuthToken();
      if (authToken == null) {
        return FailureResult(AuthFailure(
          message: 'No authenticated user',
          code: 'NO_AUTH_TOKEN',
        ));
      }

      final response = await _client.post(
        Uri.parse('$_baseUrl/api/registerToken'),
        headers: {
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'token': token,
          'platform': platform,
          'appVersion': appVersion,
        }),
      );

      return _handleResponse<void>(response, (_) {});
    } catch (e) {
      return FailureResult(NetworkFailure(
        message: 'Token registration failed: $e',
        code: 'TOKEN_REGISTER_FAILED',
      ));
    }
  }

  /// Trigger cleanup of expired alerts (manual trigger for testing)
  Future<Result<ScheduledFunctionResult>> triggerCleanupExpiredAlerts() async {
    return _triggerScheduledFunction('cleanup-expired-alerts');
  }

  /// Trigger daily analytics aggregation (manual trigger for testing)
  Future<Result<ScheduledFunctionResult>> triggerDailyAnalytics() async {
    return _triggerScheduledFunction('daily-analytics');
  }

  /// Trigger cleanup of stale FCM tokens (manual trigger for testing)
  Future<Result<ScheduledFunctionResult>> triggerCleanupStaleTokens() async {
    return _triggerScheduledFunction('cleanup-stale-tokens');
  }

  /// Trigger FCM topics refresh (manual trigger for testing)
  Future<Result<ScheduledFunctionResult>> triggerRefreshFCMTopics() async {
    return _triggerScheduledFunction('refresh-fcm-topics');
  }

  /// Generic scheduled function trigger
  Future<Result<ScheduledFunctionResult>> _triggerScheduledFunction(String functionName) async {
    try {
      final token = await _getAuthToken();
      if (token == null) {
        return FailureResult(AuthFailure(
          message: 'No authenticated user',
          code: 'NO_AUTH_TOKEN',
        ));
      }

      final response = await _client.get(
        Uri.parse('$_baseUrl/api/scheduled/$functionName'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      return _handleResponse<ScheduledFunctionResult>(response, (data) {
        return ScheduledFunctionResult(
          success: data['success'] as bool? ?? false,
          updatedCount: data['updatedCount'] as int? ?? data['subscribedCount'] as int? ?? 0,
        );
      });
    } catch (e) {
      return FailureResult(NetworkFailure(
        message: 'Scheduled function trigger failed: $e',
        code: 'SCHEDULED_TRIGGER_FAILED',
      ));
    }
  }

  /// Get current user's Firebase ID token
  Future<String?> _getAuthToken() async {
    if (_authTokenGetter != null) {
      return _authTokenGetter!();
    }
    return null;
  }

  /// Handle HTTP response and parse result
  Result<T> _handleResponse<T>(http.Response response, T Function(Map<String, dynamic>) parser) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      try {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return Success(parser(data));
      } catch (e) {
        return FailureResult(NetworkFailure(
          message: 'Failed to parse response: $e',
          code: 'PARSE_ERROR',
        ));
      }
    } else {
      try {
        final errorData = jsonDecode(response.body) as Map<String, dynamic>;
        return FailureResult(NetworkFailure(
          message: errorData['message'] as String? ?? 'Request failed',
          code: 'HTTP_${response.statusCode}',
          details: {'statusCode': response.statusCode},
        ));
      } catch (_) {
        return FailureResult(NetworkFailure(
          message: 'Request failed with status ${response.statusCode}',
          code: 'HTTP_${response.statusCode}',
        ));
      }
    }
  }

  /// Set auth token getter (called during initialization)
  void setAuthTokenGetter(Future<String?> Function() getter) {
    _authTokenGetter = getter;
  }

  /// Dispose resources
  void dispose() {
    _client.close();
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

/// Result of scheduled function execution
class ScheduledFunctionResult {
  const ScheduledFunctionResult({
    required this.success,
    required this.updatedCount,
  });

  final bool success;
  final int updatedCount;

  @override
  String toString() {
    return 'ScheduledFunctionResult(success: $success, updatedCount: $updatedCount)';
  }
}