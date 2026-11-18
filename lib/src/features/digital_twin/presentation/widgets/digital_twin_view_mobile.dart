// Copyright 2025 SAFENAV CAVITE
// Mobile/VM stub implementation for Digital Twin view
// Used when not running on Flutter Web (tests, Android, iOS)

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'digital_twin_webview.dart';

/// Mobile implementation of the Digital Twin view using webview_flutter
/// This is used on Android, iOS, and during VM-based tests
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
  @override
  Widget build(BuildContext context) {
    // Delegate to the existing DigitalTwinWebView implementation
    return DigitalTwinWebView(
      buildingId: widget.buildingId,
      onRoomHovered: widget.onRoomHovered,
      onRoomSelected: widget.onRoomSelected,
      onFloorChanged: widget.onFloorChanged,
      onError: widget.onError,
    );
  }
}