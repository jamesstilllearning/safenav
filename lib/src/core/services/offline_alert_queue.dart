/// SAFENAV CAVITE - Offline Alert Queue
///
/// Service for queuing alerts when offline and syncing them when online.
/// Provides offline-first support for alert operations.
library;

import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../errors/failures.dart';
import '../errors/result.dart';
import 'connectivity_service.dart';
import 'storage_service.dart';

/// Offline alert queue service for managing alerts when offline
class OfflineAlertQueue {
  OfflineAlertQueue._();

  static final OfflineAlertQueue _instance = OfflineAlertQueue._();
  static OfflineAlertQueue get instance => _instance;

  final StorageService _storage = StorageService.instance;
  final ConnectivityService _connectivity = ConnectivityService.instance;

  static const String _queueKey = 'offline_alert_queue';
  static const String _pendingActionsKey = 'offline_pending_actions';

  bool _isInitialized = false;
  StreamSubscription<ConnectivityStatus>? _connectivitySubscription;

  /// Whether the queue has been initialized
  bool get isInitialized => _isInitialized;

  /// Initialize the offline alert queue
  Future<Result<void>> initialize() async {
    if (_isInitialized) return const Success(null);

    try {
      // Initialize storage if needed
      final storageResult = await _storage.initialize();
      if (storageResult.isFailure) {
        return storageResult;
      }

      // Initialize connectivity service
      await _connectivity.initialize();

      // Listen for connectivity changes to sync when online
      _connectivitySubscription = _connectivity.statusStream.listen((status) {
        if (status.hasInternet) {
          _syncQueue();
        }
      });

      _isInitialized = true;
      developer.log('[OFFLINE_ALERT_QUEUE] Initialized', name: 'OfflineAlertQueue');
      return const Success(null);
    } catch (e) {
      developer.log('[OFFLINE_ALERT_QUEUE] ERROR initializing: $e',
          name: 'OfflineAlertQueue', error: e);
      return FailureResult(CacheFailure(
        message: 'Failed to initialize offline alert queue',
        code: 'OFFLINE_QUEUE_INIT_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Add an alert to the offline queue
  Future<Result<void>> queueAlert(Map<String, dynamic> alertData) async {
    try {
      final queueResult = await _getQueue();
      if (queueResult.isFailure) {
        return queueResult;
      }

      final queue = queueResult.value;
      final alertWithTimestamp = Map<String, dynamic>.from(alertData);
      alertWithTimestamp['_queuedAt'] = DateTime.now().toIso8601String();
      alertWithTimestamp['_synced'] = false;

      queue.add(alertWithTimestamp);

      final setResult = await _setQueue(queue);
      if (setResult.isFailure) {
        return setResult;
      }

      developer.log('[OFFLINE_ALERT_QUEUE] Alert queued: ${alertData['id']}',
          name: 'OfflineAlertQueue');
      return const Success(null);
    } catch (e) {
      developer.log('[OFFLINE_ALERT_QUEUE] ERROR queueing alert: $e',
          name: 'OfflineAlertQueue', error: e);
      return FailureResult(CacheFailure(
        message: 'Failed to queue alert',
        code: 'ALERT_QUEUE_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Add a pending action (acknowledge, resolve, etc.) to the offline queue
  Future<Result<void>> queueAction({
    required String actionType, // 'acknowledge', 'resolve', 'delete'
    required String alertId,
    String? userId,
    Map<String, dynamic>? additionalData,
  }) async {
    try {
      final actionsResult = await _getPendingActions();
      if (actionsResult.isFailure) {
        return actionsResult;
      }

      final actions = actionsResult.value;
      final action = <String, dynamic>{
        'type': actionType,
        'alertId': alertId,
        'userId': userId,
        'additionalData': additionalData ?? {},
        'queuedAt': DateTime.now().toIso8601String(),
      };

      actions.add(action);

      final setResult = await _setPendingActions(actions);
      if (setResult.isFailure) {
        return setResult;
      }

      developer.log('[OFFLINE_ALERT_QUEUE] Action queued: $actionType for $alertId',
          name: 'OfflineAlertQueue');
      return const Success(null);
    } catch (e) {
      developer.log('[OFFLINE_ALERT_QUEUE] ERROR queueing action: $e',
          name: 'OfflineAlertQueue', error: e);
      return FailureResult(CacheFailure(
        message: 'Failed to queue action',
        code: 'ACTION_QUEUE_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Get all queued alerts
  Future<Result<List<Map<String, dynamic>>>> getQueuedAlerts() async {
    final result = await _getQueue();
    if (result.isFailure) {
      return FailureResult(result.failure);
    }
    return Success(result.value);
  }

  /// Get all pending actions
  Future<Result<List<Map<String, dynamic>>>> getPendingActions() async {
    final result = await _getPendingActions();
    if (result.isFailure) {
      return FailureResult(result.failure);
    }
    return Success(result.value);
  }

  /// Get count of queued items
  Future<Result<int>> getQueuedCount() async {
    final alertsResult = await getQueuedAlerts();
    final actionsResult = await getPendingActions();
    if (alertsResult.isFailure || actionsResult.isFailure) {
      return const Success(0);
    }
    return Success((alertsResult.value.length) + (actionsResult.value.length));
  }

  /// Clear the queue (after successful sync)
  Future<Result<void>> clearQueue() async {
    try {
      await _storage.removeCache(_queueKey);
      await _storage.removeCache(_pendingActionsKey);
      developer.log('[OFFLINE_ALERT_QUEUE] Queue cleared', name: 'OfflineAlertQueue');
      return const Success(null);
    } catch (e) {
      developer.log('[OFFLINE_ALERT_QUEUE] ERROR clearing queue: $e',
          name: 'OfflineAlertQueue', error: e);
      return FailureResult(CacheFailure(
        message: 'Failed to clear queue',
        code: 'QUEUE_CLEAR_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Remove a specific alert from the queue
  Future<Result<void>> removeQueuedAlert(String alertId) async {
    try {
      final queueResult = await _getQueue();
      if (queueResult.isFailure) {
        return queueResult;
      }

      final queue = queueResult.value;
      queue.removeWhere((alert) => alert['id'] == alertId);

      final setResult = await _setQueue(queue);
      if (setResult.isFailure) {
        return setResult;
      }

      developer.log('[OFFLINE_ALERT_QUEUE] Alert removed from queue: $alertId',
          name: 'OfflineAlertQueue');
      return const Success(null);
    } catch (e) {
      developer.log('[OFFLINE_ALERT_QUEUE] ERROR removing queued alert: $e',
          name: 'OfflineAlertQueue', error: e);
      return FailureResult(CacheFailure(
        message: 'Failed to remove queued alert',
        code: 'ALERT_REMOVE_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Manually trigger sync
  Future<Result<void>> syncNow() async {
    return _syncQueue();
  }

  /// Sync the queue with the server
  Future<Result<void>> _syncQueue() async {
    if (!_connectivity.isConnected) {
      return const Success(null);
    }

    try {
      developer.log('[OFFLINE_ALERT_QUEUE] Starting sync...', name: 'OfflineAlertQueue');

      // Get queued alerts and actions
      final alertsResult = await getQueuedAlerts();
      final actionsResult = await getPendingActions();

      if (alertsResult.isFailure || actionsResult.isFailure) {
        return alertsResult.isFailure ? alertsResult : actionsResult;
      }

      final alerts = alertsResult.value;
      final actions = actionsResult.value;

      if (alerts.isEmpty && actions.isEmpty) {
        developer.log('[OFFLINE_ALERT_QUEUE] Nothing to sync', name: 'OfflineAlertQueue');
        return const Success(null);
      }

      // TODO: Implement actual server sync logic here
      // This would typically involve calling an API to send the queued alerts and actions
      // For now, we'll just log what would be synced
      developer.log('[OFFLINE_ALERT_QUEUE] Would sync ${alerts.length} alerts and ${actions.length} actions',
          name: 'OfflineAlertQueue');

      // In a real implementation, you would:
      // 1. Send queued alerts to server
      // 2. Send pending actions to server
      // 3. On success, remove synced items from queue
      // 4. On failure, keep items in queue for retry

      // For now, we'll just clear the queue (simulating successful sync)
      // In production, this should only happen after successful server response
      // await clearQueue();

      developer.log('[OFFLINE_ALERT_QUEUE] Sync completed', name: 'OfflineAlertQueue');
      return const Success(null);
    } catch (e) {
      developer.log('[OFFLINE_ALERT_QUEUE] ERROR during sync: $e',
          name: 'OfflineAlertQueue', error: e);
      return FailureResult(CacheFailure(
        message: 'Failed to sync queue',
        code: 'QUEUE_SYNC_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Get the queued alerts from storage
  Future<Result<List<Map<String, dynamic>>>> _getQueue() async {
    final result = await _storage.getCache(_queueKey);
    if (result.isFailure) {
      return FailureResult(result.failure);
    }
    final data = result.value;
    if (data == null) {
      return const Success(<Map<String, dynamic>>[]);
    }
    return Success(List<Map<String, dynamic>>.from(data));
  }

  /// Set the queued alerts in storage
  Future<Result<void>> _setQueue(List<Map<String, dynamic>> queue) async {
    return _storage.setCache(_queueKey, queue);
  }

  /// Get the pending actions from storage
  Future<Result<List<Map<String, dynamic>>>> _getPendingActions() async {
    final result = await _storage.getCache(_pendingActionsKey);
    if (result.isFailure) {
      return FailureResult(result.failure);
    }
    final data = result.value;
    if (data == null) {
      return const Success(<Map<String, dynamic>>[]);
    }
    return Success(List<Map<String, dynamic>>.from(data));
  }

  /// Set the pending actions in storage
  Future<Result<void>> _setPendingActions(List<Map<String, dynamic>> actions) async {
    return _storage.setCache(_pendingActionsKey, actions);
  }

  /// Dispose resources
  void dispose() {
    _connectivitySubscription?.cancel();
    _isInitialized = false;
    developer.log('[OFFLINE_ALERT_QUEUE] Disposed', name: 'OfflineAlertQueue');
  }
}

/// Riverpod provider for offline alert queue
final offlineAlertQueueProvider = Provider<OfflineAlertQueue>((ref) {
  final queue = OfflineAlertQueue.instance;
  ref.onDispose(() => queue.dispose());
  return queue;
});

/// Riverpod provider for queued alerts count
final queuedAlertsCountProvider = FutureProvider<int>((ref) async {
  final queue = ref.watch(offlineAlertQueueProvider);
  final result = await queue.getQueuedCount();
  return result.isSuccess ? result.value : 0;
});

/// Riverpod provider for queued alerts
final queuedAlertsProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async {
  final queue = ref.watch(offlineAlertQueueProvider);
  final result = await queue.getQueuedAlerts();
  return result.isSuccess ? result.value : [];
});