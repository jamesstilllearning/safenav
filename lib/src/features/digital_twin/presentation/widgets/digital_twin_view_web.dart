// Copyright 2025 SAFENAV CAVITE
// Flutter Web implementation for Three.js digital twin scene using iframe

import 'dart:async';
import 'dart:convert';
import 'dart:html' as html;
import 'dart:ui_web' as ui_web;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/digital_twin_models.dart';
import '../providers/digital_twin_providers.dart';

/// Web implementation of the Digital Twin view using iframe
/// This is only used when kIsWeb == true
class DigitalTwinViewWeb extends ConsumerStatefulWidget {
  final String buildingId;
  final Function(String roomId)? onRoomHovered;
  final Function(String roomId)? onRoomSelected;
  final Function(int floorIndex)? onFloorChanged;
  final Function(String message)? onError;

  const DigitalTwinViewWeb({
    super.key,
    required this.buildingId,
    this.onRoomHovered,
    this.onRoomSelected,
    this.onFloorChanged,
    this.onError,
  });

  @override
  ConsumerState<DigitalTwinViewWeb> createState() => _DigitalTwinViewWebState();
}

class _DigitalTwinViewWebState extends ConsumerState<DigitalTwinViewWeb> {
  html.IFrameElement? _iframe;
  bool _isLoaded = false;
  final Completer<void> _loadCompleter = Completer<void>();
  Timer? _stateSyncTimer;
  int _iframeId = 0;

  @override
  void initState() {
    super.initState();
    _initializeIframe();
  }

  @override
  void dispose() {
    _stateSyncTimer?.cancel();
    _iframe?.remove();
    // Remove message event listener
    html.window.removeEventListener('message', _handleMessageFromIframe);
    super.dispose();
  }

  void _initializeIframe() {
    // Create unique iframe ID
    _iframeId = DateTime.now().millisecondsSinceEpoch;
    final iframeId = 'digital-twin-iframe-$_iframeId';

    // Create iframe element
    _iframe = html.IFrameElement()
      ..id = iframeId
      ..src = 'assets/threejs/digital_twin_scene.html'
      ..style.border = 'none'
      ..style.width = '100%'
      ..style.height = '100%'
      ..allowFullscreen = true;

    // Register the iframe with the platform view registry
    // Using dart:ui_web platformViewRegistry (modern Flutter Web API)
    ui_web.platformViewRegistry.registerViewFactory(
      iframeId,
      (int viewId) => _iframe!,
    );

    // Listen for messages from the iframe
    html.window.addEventListener('message', _handleMessageFromIframe);

    // Check if iframe is loaded
    _iframe!.onLoad.listen((_) {
      if (!_isLoaded) {
        _isLoaded = true;
        _loadCompleter.complete();
        _startStateSync();
        _sendToJS(DigitalTwinMessage.loadBuilding(buildingId: widget.buildingId));
      }
    });

    // Handle iframe errors
    _iframe!.onError.listen((event) {
      debugPrint('DigitalTwinViewWeb: Iframe error: $event');
      widget.onError?.call('Failed to load 3D scene');
    });
  }

  void _startStateSync() {
    // Sync state every 500ms
    _stateSyncTimer = Timer.periodic(const Duration(milliseconds: 500), (_) {
      _syncStateToJS();
    });
  }

  void _syncStateToJS() {
    if (!_isLoaded || _iframe == null) return;

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

  void _handleMessageFromIframe(html.Event event) {
    final messageEvent = event as html.MessageEvent;

    // Verify origin for security (optional - can be relaxed for development)
    // if (messageEvent.origin != html.window.location.origin) return;

    try {
      final data = messageEvent.data;
      if (data is! String) return;

      final json = jsonDecode(data) as Map<String, dynamic>;
      final method = json['method'] as String?;
      final messageData = json['data'] as Map<String, dynamic>?;

      if (method == null) return;

      switch (method) {
        case 'onModelLoaded':
          debugPrint('DigitalTwinViewWeb: Model loaded for ${messageData?['buildingId']}');
          break;
        case 'onFloorChanged':
          final floorIndex = messageData?['floorIndex'] as int?;
          if (floorIndex != null) {
            ref.read(currentFloorProvider.notifier).state = floorIndex;
            widget.onFloorChanged?.call(floorIndex);
          }
          break;
        case 'onRoomHovered':
          final roomId = messageData?['roomId'] as String?;
          if (roomId != null) {
            widget.onRoomHovered?.call(roomId);
          }
          break;
        case 'onRoomSelected':
          final roomId = messageData?['roomId'] as String?;
          if (roomId != null) {
            ref.read(selectedRoomIdProvider.notifier).state = roomId;
            widget.onRoomSelected?.call(roomId);
          }
          break;
        case 'onCameraChanged':
          // Could update camera state provider here
          break;
        case 'onError':
          final errorMsg = messageData?['message'] as String? ?? 'Unknown error';
          debugPrint('DigitalTwinViewWeb: Three.js error: $errorMsg');
          widget.onError?.call(errorMsg);
          break;
      }
    } catch (e) {
      debugPrint('Failed to parse message from iframe: $e');
    }
  }

  void _sendToJS(DigitalTwinMessage message) {
    if (!_isLoaded || _iframe == null) return;

    try {
      final json = jsonEncode({
        'method': _messageToMethod(message),
        'data': _messageToData(message),
      });

      // Post message to iframe
      _iframe!.contentWindow?.postMessage(json, '*');
    } catch (e) {
      debugPrint('Failed to send message to iframe: $e');
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
    if (_iframe == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    // Create a unique view type for the HtmlElementView
    final viewType = 'digital-twin-iframe-$_iframeId';

    return HtmlElementView(
      viewType: viewType,
      onPlatformViewCreated: (id) {
        // The iframe is already registered in initState
      },
    );
  }
}