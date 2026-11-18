// Copyright 2025 SAFENAV CAVITE
// Conditional import for platform-specific Digital Twin view implementations

// Web implementation (uses dart:html, dart:ui_web)
export 'digital_twin_view_web.dart'
    if (dart.library.io) 'digital_twin_view_mobile.dart';