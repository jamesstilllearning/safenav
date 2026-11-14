/// SAFENAV CAVITE - Connectivity Service
///
/// Monitors network connectivity and provides reactive connectivity status.
/// Uses connectivity_plus package for cross-platform connectivity monitoring.
library;

import 'dart:async';
import 'dart:developer' as developer;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Connectivity status enumeration
enum ConnectivityStatus {
  /// Connected to internet
  connected,
  /// Connected to WiFi but no internet
  wifiOnly,
  /// Connected to mobile data
  mobile,
  /// No network connection
  disconnected,
  /// Unknown status
  unknown;

  /// Whether the device has internet connectivity
  bool get hasInternet => this == ConnectivityStatus.connected ||
      this == ConnectivityStatus.mobile ||
      this == ConnectivityStatus.wifiOnly;

  /// Whether the device is completely offline
  bool get isOffline => this == ConnectivityStatus.disconnected;

  /// Human-readable status text
  String get displayName {
    switch (this) {
      case ConnectivityStatus.connected:
        return 'Online';
      case ConnectivityStatus.wifiOnly:
        return 'WiFi only';
      case ConnectivityStatus.mobile:
        return 'Mobile data';
      case ConnectivityStatus.disconnected:
        return 'Offline';
      case ConnectivityStatus.unknown:
        return 'Unknown';
    }
  }
}

/// Connectivity service for monitoring network status
class ConnectivityService {
  ConnectivityService._();

  static final ConnectivityService _instance = ConnectivityService._();
  static ConnectivityService get instance => _instance;

  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _subscription;
  final StreamController<ConnectivityStatus> _statusController =
      StreamController<ConnectivityStatus>.broadcast();
  ConnectivityStatus _currentStatus = ConnectivityStatus.unknown;

  /// Current connectivity status
  ConnectivityStatus get currentStatus => _currentStatus;

  /// Stream of connectivity status changes
  Stream<ConnectivityStatus> get statusStream => _statusController.stream;

  /// Whether currently connected to internet
  bool get isConnected => _currentStatus.hasInternet;

  /// Whether currently offline
  bool get isOffline => _currentStatus.isOffline;

  /// Initialize the connectivity service
  Future<void> initialize() async {
    developer.log('[CONNECTIVITY] Initializing connectivity service',
        name: 'ConnectivityService');

    try {
      // Get initial connectivity status
      await _updateStatusFromCheck();

      // Listen for connectivity changes (returns list of active connections)
      _subscription = _connectivity.onConnectivityChanged.listen((results) {
        _handleConnectivityChange(results);
      });

      developer.log('[CONNECTIVITY] Connectivity service initialized',
          name: 'ConnectivityService');
    } catch (e) {
      developer.log('[CONNECTIVITY] ERROR initializing: $e',
          name: 'ConnectivityService', error: e);
      rethrow;
    }
  }

  /// Handle connectivity change event (receives list of active connections)
  void _handleConnectivityChange(List<ConnectivityResult> results) {
    if (results.isEmpty) {
      _updateStatus(ConnectivityStatus.disconnected);
      return;
    }

    // Check for internet connectivity across all results
    // Priority: mobile > wifi > ethernet/vpn > none
    // The list may contain multiple results (e.g., both wifi and mobile)
    bool hasMobile = results.contains(ConnectivityResult.mobile);
    bool hasWifi = results.contains(ConnectivityResult.wifi);
    bool hasEthernet = results.contains(ConnectivityResult.ethernet);
    bool hasVpn = results.contains(ConnectivityResult.vpn);

    ConnectivityStatus newStatus;
    if (hasMobile) {
      newStatus = ConnectivityStatus.mobile;
    } else if (hasWifi) {
      // WiFi doesn't guarantee internet, but we assume it for now
      newStatus = ConnectivityStatus.wifiOnly;
    } else if (hasEthernet || hasVpn) {
      newStatus = ConnectivityStatus.connected;
    } else if (results.contains(ConnectivityResult.none)) {
      newStatus = ConnectivityStatus.disconnected;
    } else {
      newStatus = ConnectivityStatus.disconnected;
    }

    _updateStatus(newStatus);
  }

  /// Update the connectivity status from a direct check
  Future<void> _updateStatusFromCheck() async {
    try {
      // checkConnectivity() returns List<ConnectivityResult> (never empty)
      final results = await _connectivity.checkConnectivity();
      _processResults(results);
    } catch (e) {
      developer.log('[CONNECTIVITY] ERROR checking connectivity: $e',
          name: 'ConnectivityService', error: e);
      _updateStatus(ConnectivityStatus.unknown);
    }
  }

  /// Process a list of connectivity results and update status
  void _processResults(List<ConnectivityResult> results) {
    if (results.isEmpty) {
      _updateStatus(ConnectivityStatus.disconnected);
      return;
    }

    // Priority: mobile > wifi > ethernet/vpn > bluetooth/other > none
    bool hasMobile = results.contains(ConnectivityResult.mobile);
    bool hasWifi = results.contains(ConnectivityResult.wifi);
    bool hasEthernet = results.contains(ConnectivityResult.ethernet);
    bool hasVpn = results.contains(ConnectivityResult.vpn);
    bool hasNone = results.contains(ConnectivityResult.none);

    ConnectivityStatus newStatus;
    if (hasMobile) {
      newStatus = ConnectivityStatus.mobile;
    } else if (hasWifi) {
      newStatus = ConnectivityStatus.wifiOnly;
    } else if (hasEthernet || hasVpn) {
      newStatus = ConnectivityStatus.connected;
    } else if (hasNone) {
      newStatus = ConnectivityStatus.disconnected;
    } else {
      // Bluetooth, other, satellite - treat as disconnected for internet purposes
      newStatus = ConnectivityStatus.disconnected;
    }

    _updateStatus(newStatus);
  }

  /// Update the connectivity status
  void _updateStatus(ConnectivityStatus status) {
    if (_currentStatus != status) {
      _currentStatus = status;
      _statusController.add(_currentStatus);
      developer.log('[CONNECTIVITY] Status changed: ${_currentStatus.displayName}',
          name: 'ConnectivityService');
    }
  }

  /// Check connectivity once and update status
  Future<ConnectivityStatus> checkConnectivity() async {
    try {
      final results = await _connectivity.checkConnectivity();
      _processResults(results);
    } catch (e) {
      developer.log('[CONNECTIVITY] ERROR checking connectivity: $e',
          name: 'ConnectivityService', error: e);
      _updateStatus(ConnectivityStatus.unknown);
    }
    return _currentStatus;
  }

  /// Wait for connectivity to be restored
  Future<void> waitForConnection({
    Duration timeout = const Duration(seconds: 30),
    Duration checkInterval = const Duration(seconds: 2),
  }) async {
    if (isConnected) return;

    final completer = Completer<void>();
    late StreamSubscription<ConnectivityStatus> sub;

    sub = _statusController.stream.listen((status) {
      if (status.hasInternet) {
        completer.complete();
      }
    });

    // Also set a timeout
    Timer(timeout, () {
      if (!completer.isCompleted) {
        completer.completeError(
            TimeoutException('Connection timeout after ${timeout.inSeconds}s'));
      }
    });

    try {
      await completer.future;
    } finally {
      sub.cancel();
    }
  }

  /// Dispose the service
  void dispose() {
    _subscription?.cancel();
    _statusController.close();
    developer.log('[CONNECTIVITY] Connectivity service disposed',
        name: 'ConnectivityService');
  }
}

/// Riverpod provider for connectivity service
final connectivityServiceProvider = Provider<ConnectivityService>((ref) {
  final service = ConnectivityService.instance;
  ref.onDispose(() => service.dispose());
  return service;
});

/// Riverpod provider for connectivity status stream
final connectivityStatusProvider = StreamProvider<ConnectivityStatus>((ref) {
  final service = ref.watch(connectivityServiceProvider);
  // Initialize the service
  service.initialize().catchError((e) {
    developer.log('[CONNECTIVITY] Failed to initialize: $e',
        name: 'ConnectivityService', error: e);
  });
  return service.statusStream;
});

/// Riverpod provider for current connectivity status (notifier)
final currentConnectivityStatusProvider = StateNotifierProvider<
    CurrentConnectivityStatusNotifier, ConnectivityStatus>((ref) {
  final service = ref.watch(connectivityServiceProvider);
  return CurrentConnectivityStatusNotifier(service);
});

/// Notifier for current connectivity status
class CurrentConnectivityStatusNotifier
    extends StateNotifier<ConnectivityStatus> {
  CurrentConnectivityStatusNotifier(this._service)
      : super(ConnectivityStatus.unknown) {
    _initialize();
  }

  final ConnectivityService _service;

  Future<void> _initialize() async {
    await _service.initialize();
    state = _service.currentStatus;
    _service.statusStream.listen((status) {
      state = status;
    });
  }

  Future<void> refresh() async {
    await _service.checkConnectivity();
    state = _service.currentStatus;
  }
}