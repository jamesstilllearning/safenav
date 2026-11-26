// Copyright 2025 SAFENAV CAVITE
// WebView integration for Three.js digital twin scene

import 'dart:async';
import 'dart:convert';

import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import '../../data/models/digital_twin_models.dart';
import '../providers/digital_twin_providers.dart';
import '../../../../shared/widgets/widgets.dart';

/// WebView widget that hosts the Three.js digital twin scene
class DigitalTwinWebView extends ConsumerStatefulWidget {
  final String buildingId;
  final Function(String roomId)? onRoomHovered;
  final Function(String roomId)? onRoomSelected;
  final Function(int floorIndex)? onFloorChanged;
  final Function(String message)? onError;

  const DigitalTwinWebView({
    super.key,
    required this.buildingId,
    this.onRoomHovered,
    this.onRoomSelected,
    this.onFloorChanged,
    this.onError,
  });

  @override
  ConsumerState<DigitalTwinWebView> createState() => _DigitalTwinWebViewState();
}

class _DigitalTwinWebViewState extends ConsumerState<DigitalTwinWebView> {
  WebViewController? _controller;
  bool _isLoaded = false;
  final Completer<void> _loadCompleter = Completer<void>();
  Timer? _stateSyncTimer;

  @override
  void initState() {
    super.initState();
    _initializeWebView();
  }

  @override
  void dispose() {
    _stateSyncTimer?.cancel();
    super.dispose();
  }

  Future<void> _initializeWebView() async {
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final controller = WebViewController.fromPlatformCreationParams(params);

    // Configure WebView
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0xFF1A1A2E))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            debugPrint('DigitalTwinWebView: Page started loading: $url');
          },
          onPageFinished: (url) {
            debugPrint('DigitalTwinWebView: Page finished loading: $url');
            _onPageFinished();
          },
          onWebResourceError: (error) {
            debugPrint('DigitalTwinWebView: Resource error: ${error.description}');
            widget.onError?.call('Resource error: ${error.description}');
          },
          onNavigationRequest: (request) {
            // Allow all navigation within the app
            return NavigationDecision.navigate;
          },
        ),
      )
      ..addJavaScriptChannel(
        'FlutterChannel',
        onMessageReceived: (JavaScriptMessage message) {
          _handleMessageFromJS(message.message);
        },
      );

    // Platform-specific settings (using the new API)
    if (controller.platform is AndroidWebViewController) {
      final androidController = controller.platform as AndroidWebViewController;
      androidController.setMediaPlaybackRequiresUserGesture(false);
      // Note: setMixedContentMode is deprecated in new API, handled by default
    }

    if (controller.platform is WebKitWebViewController) {
      // Note: setAllowsInlineMediaPlayback and setAllowsPictureInPictureMediaPlayback
      // are handled by the creation params in the new API
    }

    _controller = controller;

    // Load the Three.js scene from assets
    await _loadScene();
  }

  Future<void> _loadScene() async {
    if (_controller == null) return;

    try {
      // Load the HTML file from assets
      await _controller!.loadFlutterAsset('assets/threejs/digital_twin_scene.html');
    } catch (e) {
      debugPrint('Failed to load Three.js scene: $e');
      widget.onError?.call('Failed to load 3D scene: $e');
    }
  }

  void _onPageFinished() {
    if (!_isLoaded) {
      _isLoaded = true;
      _loadCompleter.complete();

      // Start periodic state sync
      _startStateSync();

      // Send initial building load command
      _sendToJS(DigitalTwinMessage.loadBuilding(buildingId: widget.buildingId));
    }
  }

  void _startStateSync() {
    // Sync state every 500ms
    _stateSyncTimer = Timer.periodic(const Duration(milliseconds: 500), (_) {
      _syncStateToJS();
    });
  }

  void _syncStateToJS() {
    if (!_isLoaded || _controller == null) return;

    final currentFloor = ref.read(currentFloorProvider);
    final theme = ref.read(digitalTwinThemeProvider);
    final isExploded = ref.read(explodedViewProvider);
    final highlightedRooms = ref.read(highlightedRoomsProvider);
    final selectedRoomId = ref.read(selectedRoomIdProvider);

    // Send floor change if needed
    _sendToJS(DigitalTwinMessage.showFloor(floorIndex: currentFloor));

    // Send theme if changed
    _sendToJS(DigitalTwinMessage.setTheme(theme: theme.threeJsName));

    // Send exploded view state
    _sendToJS(DigitalTwinMessage.setExplodedView(enabled: isExploded));

    // Send room highlights
    for (final roomId in highlightedRooms) {
      _sendToJS(DigitalTwinMessage.highlightRoom(roomId: roomId));
    }

    // Send selected room highlight (different color)
    if (selectedRoomId != null) {
      _sendToJS(DigitalTwinMessage.highlightRoom(roomId: selectedRoomId, color: 0xFF0000));
    }
  }

  void _handleMessageFromJS(String message) {
    try {
      final json = jsonDecode(message) as Map<String, dynamic>;
      final method = json['method'] as String?;
      final data = json['data'] as Map<String, dynamic>?;

      if (method == null) return;

      switch (method) {
        case 'onModelLoaded':
          debugPrint('DigitalTwinWebView: Model loaded for ${data?['buildingId']}');
          break;
        case 'onFloorChanged':
          final floorIndex = data?['floorIndex'] as int?;
          if (floorIndex != null) {
            ref.read(currentFloorProvider.notifier).state = floorIndex;
            widget.onFloorChanged?.call(floorIndex);
          }
          break;
        case 'onRoomHovered':
          final roomId = data?['roomId'] as String?;
          if (roomId != null) {
            widget.onRoomHovered?.call(roomId);
          }
          break;
        case 'onRoomSelected':
          final roomId = data?['roomId'] as String?;
          if (roomId != null) {
            ref.read(selectedRoomIdProvider.notifier).state = roomId;
            widget.onRoomSelected?.call(roomId);
          }
          break;
        case 'onCameraChanged':
          // Could update camera state provider here
          break;
        case 'onError':
          final errorMsg = data?['message'] as String? ?? 'Unknown error';
          debugPrint('DigitalTwinWebView: Three.js error: $errorMsg');
          widget.onError?.call(errorMsg);
          break;
      }
    } catch (e) {
      debugPrint('Failed to parse message from JS: $e');
    }
  }

  void _sendToJS(DigitalTwinMessage message) {
    if (!_isLoaded || _controller == null) return;

    try {
      final json = jsonEncode({
        'method': _messageToMethod(message),
        'data': _messageToData(message),
      });

      _controller!.runJavaScript('window.handleFlutterMessage($json)');
    } catch (e) {
      debugPrint('Failed to send message to JS: $e');
    }
  }

  String _messageToMethod(DigitalTwinMessage message) {
    return message.when(
      loadBuilding: (_) => 'loadBuilding',
      showFloor: (_) => 'showFloor',
      setFloorVisibility: (_, __, ___) => 'setFloorVisibility',
      highlightRoom: (_, __) => 'highlightRoom',
      clearHighlight: (_) => 'clearHighlight',
      flyToRoom: (_, __) => 'flyToRoom',
      setTheme: (_) => 'setTheme',
      setExplodedView: (_, __) => 'setExplodedView',
      setCameraPosition: (_, __, ___) => 'setCameraPosition',
      requestState: () => 'requestState',
    );
  }

  Map<String, dynamic> _messageToData(DigitalTwinMessage message) {
    return message.when(
      loadBuilding: (buildingId) => {'buildingId': buildingId},
      showFloor: (floorIndex) => {'floorIndex': floorIndex},
      setFloorVisibility: (floorIndex, visible, opacity) => {
        'floorIndex': floorIndex,
        'visible': visible,
        'opacity': opacity,
      },
      highlightRoom: (roomId, color) => {
        'roomId': roomId,
        if (color != null) 'color': color,
      },
      clearHighlight: (roomId) => {'roomId': roomId},
      flyToRoom: (roomId, duration) => {
        'roomId': roomId,
        'duration': duration,
      },
      setTheme: (theme) => {'theme': theme},
      setExplodedView: (enabled, separation) => {
        'enabled': enabled,
        'separation': separation,
      },
      setCameraPosition: (x, y, z) => {'x': x, 'y': y, 'z': z},
      requestState: () => <String, dynamic>{},
    );
  }

  // Public methods for external control
  Future<void> waitForLoad() => _loadCompleter.future;

  void flyToRoom(String roomId, {int duration = 1000}) {
    _sendToJS(DigitalTwinMessage.flyToRoom(roomId: roomId, duration: duration));
  }

  void setFloor(int floorIndex) {
    _sendToJS(DigitalTwinMessage.showFloor(floorIndex: floorIndex));
  }

  void setTheme(DigitalTwinTheme theme) {
    _sendToJS(DigitalTwinMessage.setTheme(theme: theme.threeJsName));
  }

  void setExplodedView(bool enabled, {double separation = 5.0}) {
    _sendToJS(DigitalTwinMessage.setExplodedView(enabled: enabled, separation: separation));
  }

  void highlightRoom(String roomId, {int? color}) {
    _sendToJS(DigitalTwinMessage.highlightRoom(roomId: roomId, color: color));
  }

  void clearHighlight(String roomId) {
    _sendToJS(DigitalTwinMessage.clearHighlight(roomId: roomId));
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null) {
      return const Center(
        child: InlineLoading(message: 'Loading 3D view...'),
      );
    }

    return WebViewWidget(controller: _controller!);
  }
}

