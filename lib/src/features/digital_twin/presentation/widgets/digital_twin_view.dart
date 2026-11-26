// Copyright 2025 SAFENAV CAVITE
// Platform-aware Digital Twin view that uses WebView on mobile and iframe on web

import 'digital_twin_view_platform.dart';

/// Platform-aware Digital Twin view widget
/// Uses iframe-based implementation on Flutter Web (DigitalTwinViewWeb)
/// Uses webview_flutter on Android/iOS (DigitalTwinWebView)
class DigitalTwinView extends DigitalTwinViewWeb {
  const DigitalTwinView({
    super.key,
    required super.buildingId,
    super.onRoomHovered,
    super.onRoomSelected,
    super.onFloorChanged,
    super.onError,
  });
}