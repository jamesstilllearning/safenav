/// SAFENAV CAVITE - User Preferences Models
///
/// Data models for user preferences including theme, notifications, map preferences,
/// emergency settings, and privacy settings.
library;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_preferences.freezed.dart';
part 'user_preferences.g.dart';

/// Theme mode preference
@freezed
abstract class ThemeMode with _$ThemeMode {
  const factory ThemeMode.system() = _System;
  const factory ThemeMode.light() = _Light;
  const factory ThemeMode.dark() = _Dark;
}

/// JSON converter for ThemeMode (freezed union - tagged format)
class ThemeModeConverter implements JsonConverter<ThemeMode, Object> {
  const ThemeModeConverter();

  @override
  ThemeMode fromJson(Object json) {
    if (json is Map<String, dynamic>) {
      if (json.containsKey('system')) return ThemeMode.system();
      if (json.containsKey('light')) return ThemeMode.light();
      if (json.containsKey('dark')) return ThemeMode.dark();
    }
    // Fallback for string format (legacy)
    if (json is String) {
      return json.toThemeMode();
    }
    return ThemeMode.system();
  }

  @override
  Object toJson(ThemeMode object) {
    return object.when(
      system: () => {'system': {}},
      light: () => {'light': {}},
      dark: () => {'dark': {}},
    );
  }
}

/// Map style preference
@freezed
abstract class MapStyle with _$MapStyle {
  const factory MapStyle.standard() = _Standard;
  const factory MapStyle.satellite() = _Satellite;
  const factory MapStyle.hybrid() = _Hybrid;
  const factory MapStyle.dark() = _MapDark;
  const factory MapStyle.light() = _MapLight;
  const factory MapStyle.outdoor() = _Outdoor;
}

/// JSON converter for MapStyle (freezed union - tagged format)
class MapStyleConverter implements JsonConverter<MapStyle, Object> {
  const MapStyleConverter();

  @override
  MapStyle fromJson(Object json) {
    if (json is Map<String, dynamic>) {
      if (json.containsKey('standard')) return MapStyle.standard();
      if (json.containsKey('satellite')) return MapStyle.satellite();
      if (json.containsKey('hybrid')) return MapStyle.hybrid();
      if (json.containsKey('dark')) return MapStyle.dark();
      if (json.containsKey('light')) return MapStyle.light();
      if (json.containsKey('outdoor')) return MapStyle.outdoor();
    }
    // Fallback for string format (legacy)
    if (json is String) {
      return json.toMapStyle();
    }
    return MapStyle.standard();
  }

  @override
  Object toJson(MapStyle object) {
    return object.when(
      standard: () => {'standard': {}},
      satellite: () => {'satellite': {}},
      hybrid: () => {'hybrid': {}},
      dark: () => {'dark': {}},
      light: () => {'light': {}},
      outdoor: () => {'outdoor': {}},
    );
  }
}

/// Distance unit preference
@freezed
abstract class DistanceUnit with _$DistanceUnit {
  const factory DistanceUnit.metric() = _Metric;
  const factory DistanceUnit.imperial() = _Imperial;
}

/// JSON converter for DistanceUnit (freezed union - tagged format)
class DistanceUnitConverter implements JsonConverter<DistanceUnit, Object> {
  const DistanceUnitConverter();

  @override
  DistanceUnit fromJson(Object json) {
    if (json is Map<String, dynamic>) {
      if (json.containsKey('metric')) return DistanceUnit.metric();
      if (json.containsKey('imperial')) return DistanceUnit.imperial();
    }
    // Fallback for string format (legacy)
    if (json is String) {
      return json.toDistanceUnit();
    }
    return DistanceUnit.metric();
  }

  @override
  Object toJson(DistanceUnit object) {
    return object.when(
      metric: () => {'metric': {}},
      imperial: () => {'imperial': {}},
    );
  }
}

/// Navigation voice preference
@freezed
abstract class NavigationVoice with _$NavigationVoice {
  const factory NavigationVoice.enabled() = _Enabled;
  const factory NavigationVoice.muted() = _Muted;
  const factory NavigationVoice.alertsOnly() = _AlertsOnly;
}

/// JSON converter for NavigationVoice (freezed union - tagged format)
class NavigationVoiceConverter implements JsonConverter<NavigationVoice, Object> {
  const NavigationVoiceConverter();

  @override
  NavigationVoice fromJson(Object json) {
    if (json is Map<String, dynamic>) {
      if (json.containsKey('enabled')) return NavigationVoice.enabled();
      if (json.containsKey('muted')) return NavigationVoice.muted();
      if (json.containsKey('alertsOnly')) return NavigationVoice.alertsOnly();
    }
    // Fallback for string format (legacy)
    if (json is String) {
      return json.toNavigationVoice();
    }
    return NavigationVoice.enabled();
  }

  @override
  Object toJson(NavigationVoice object) {
    return object.when(
      enabled: () => {'enabled': {}},
      muted: () => {'muted': {}},
      alertsOnly: () => {'alertsOnly': {}},
    );
  }
}

/// Emergency alert level preference
@freezed
abstract class EmergencyAlertLevel with _$EmergencyAlertLevel {
  const factory EmergencyAlertLevel.all() = _All;
  const factory EmergencyAlertLevel.criticalOnly() = _CriticalOnly;
  const factory EmergencyAlertLevel.emergencyOnly() = _EmergencyOnly;
  const factory EmergencyAlertLevel.none() = _None;
}

/// JSON converter for EmergencyAlertLevel (freezed union - tagged format)
class EmergencyAlertLevelConverter implements JsonConverter<EmergencyAlertLevel, Object> {
  const EmergencyAlertLevelConverter();

  @override
  EmergencyAlertLevel fromJson(Object json) {
    if (json is Map<String, dynamic>) {
      if (json.containsKey('all')) return EmergencyAlertLevel.all();
      if (json.containsKey('criticalOnly')) return EmergencyAlertLevel.criticalOnly();
      if (json.containsKey('emergencyOnly')) return EmergencyAlertLevel.emergencyOnly();
      if (json.containsKey('none')) return EmergencyAlertLevel.none();
    }
    // Fallback for string format (legacy)
    if (json is String) {
      switch (json.toLowerCase()) {
        case 'all':
          return EmergencyAlertLevel.all();
        case 'criticalonly':
        case 'critical_only':
          return EmergencyAlertLevel.criticalOnly();
        case 'emergencyonly':
        case 'emergency_only':
          return EmergencyAlertLevel.emergencyOnly();
        case 'none':
        default:
          return EmergencyAlertLevel.none();
      }
    }
    return EmergencyAlertLevel.all();
  }

  @override
  Object toJson(EmergencyAlertLevel object) {
    return object.when(
      all: () => {'all': {}},
      criticalOnly: () => {'criticalOnly': {}},
      emergencyOnly: () => {'emergencyOnly': {}},
      none: () => {'none': {}},
    );
  }
}

/// Privacy level preference
@freezed
abstract class PrivacyLevel with _$PrivacyLevel {
  const factory PrivacyLevel.public() = _Public;
  const factory PrivacyLevel.contactsOnly() = _ContactsOnly;
  const factory PrivacyLevel.private() = _Private;
}

/// JSON converter for PrivacyLevel (freezed union - tagged format)
class PrivacyLevelConverter implements JsonConverter<PrivacyLevel, Object> {
  const PrivacyLevelConverter();

  @override
  PrivacyLevel fromJson(Object json) {
    if (json is Map<String, dynamic>) {
      if (json.containsKey('public')) return PrivacyLevel.public();
      if (json.containsKey('contactsOnly')) return PrivacyLevel.contactsOnly();
      if (json.containsKey('private')) return PrivacyLevel.private();
    }
    // Fallback for string format (legacy)
    if (json is String) {
      return json.toPrivacyLevel();
    }
    return PrivacyLevel.contactsOnly();
  }

  @override
  Object toJson(PrivacyLevel object) {
    return object.when(
      public: () => {'public': {}},
      contactsOnly: () => {'contactsOnly': {}},
      private: () => {'private': {}},
    );
  }
}

/// Notification preferences
@freezed
abstract class NotificationPreferences with _$NotificationPreferences {
  const factory NotificationPreferences({
    @Default(true) bool pushEnabled,
    @Default(true) bool emailEnabled,
    @Default(true) bool smsEnabled,
    @Default(true) bool inAppEnabled,
    @EmergencyAlertLevelConverter() @Default(EmergencyAlertLevel.all()) EmergencyAlertLevel emergencyAlerts,
    @Default(true) bool drillNotifications,
    @Default(true) bool buildingAlerts,
    @Default(true) bool routeUpdates,
    @Default(true) bool safetyScoreUpdates,
    @Default(true) bool weeklyDigest,
    @Default(true) bool maintenanceNotifications,
    @Default({}) Map<String, bool> customChannels,
  }) = _NotificationPreferences;

  factory NotificationPreferences.fromJson(Map<String, dynamic> json) =>
      _$NotificationPreferencesFromJson(json);
}

/// Map preferences
@freezed
abstract class MapPreferences with _$MapPreferences {
  const factory MapPreferences({
    @MapStyleConverter() @Default(MapStyle.standard()) MapStyle mapStyle,
    @Default(true) bool showBuildings,
    @Default(true) bool showPathways,
    @Default(true) bool showRooms,
    @Default(true) bool showFacilities,
    @Default(true) bool showEmergencyExits,
    @Default(true) bool showAssemblyPoints,
    @Default(true) bool showCurrentLocation,
    @Default(true) bool autoRotate,
    @Default(true) bool showCompass,
    @Default(true) bool showScale,
    @Default(15.0) double defaultZoom,
    @DistanceUnitConverter() @Default(DistanceUnit.metric()) DistanceUnit distanceUnit,
    @NavigationVoiceConverter() @Default(NavigationVoice.enabled()) NavigationVoice voiceGuidance,
    @Default(true) bool hapticFeedback,
    @Default(true) bool offlineMapsEnabled,
    @Default({}) Map<String, bool> layerVisibility,
  }) = _MapPreferences;

  factory MapPreferences.fromJson(Map<String, dynamic> json) =>
      _$MapPreferencesFromJson(json);
}

/// Emergency preferences (document model with metadata)
@freezed
abstract class EmergencyPreferences with _$EmergencyPreferences {
  const factory EmergencyPreferences({
    required String userId,
    @Default(true) bool shareLocationWithContacts,
    @Default(true) bool shareLocationWithResponders,
    @Default(true) bool autoCallEmergency,
    @Default(30) int autoCallDelaySeconds,
    @Default(true) bool sendPeriodicUpdates,
    @Default(300) int updateIntervalSeconds,
    @Default(true) bool vibrateOnEmergency,
    @Default(true) bool flashScreenOnEmergency,
    @Default(true) bool playSirenSound,
    @EmergencyAlertLevelConverter() @Default(EmergencyAlertLevel.all()) EmergencyAlertLevel alertLevel,
    @Default([]) List<String> blockedAlertTypes,
    @Default({}) Map<String, dynamic> customSettings,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _EmergencyPreferences;

  factory EmergencyPreferences.fromJson(Map<String, dynamic> json) =>
      _$EmergencyPreferencesFromJson(json);

  /// Create default preferences for a user
  factory EmergencyPreferences.defaultPreferences(String userId) {
    final now = DateTime.now();
    return EmergencyPreferences(
      userId: userId,
      createdAt: now,
      updatedAt: now,
    );
  }
}

/// Privacy preferences
@freezed
abstract class PrivacyPreferences with _$PrivacyPreferences {
  const factory PrivacyPreferences({
    @PrivacyLevelConverter() @Default(PrivacyLevel.contactsOnly()) PrivacyLevel locationSharing,
    @PrivacyLevelConverter() @Default(PrivacyLevel.contactsOnly()) PrivacyLevel activitySharing,
    @PrivacyLevelConverter() @Default(PrivacyLevel.private()) PrivacyLevel routeHistory,
    @PrivacyLevelConverter() @Default(PrivacyLevel.private()) PrivacyLevel visitHistory,
    @PrivacyLevelConverter() @Default(PrivacyLevel.private()) PrivacyLevel safetyScore,
    @Default(true) bool analyticsOptIn,
    @Default(true) bool crashReportingOptIn,
    @Default(true) bool personalizedContent,
    @Default(false) bool allowThirdPartyTracking,
    @Default({}) Map<String, dynamic> customSettings,
  }) = _PrivacyPreferences;

  factory PrivacyPreferences.fromJson(Map<String, dynamic> json) =>
      _$PrivacyPreferencesFromJson(json);
}

/// Accessibility preferences
@freezed
abstract class AccessibilityPreferences with _$AccessibilityPreferences {
  const factory AccessibilityPreferences({
    @Default(false) bool highContrast,
    @Default(false) bool largeText,
    @Default(false) bool reduceMotion,
    @Default(false) bool screenReaderOptimized,
    @Default(false) bool colorBlindFriendly,
    @Default(1.0) double textScaleFactor,
    @Default({}) Map<String, dynamic> customSettings,
  }) = _AccessibilityPreferences;

  factory AccessibilityPreferences.fromJson(Map<String, dynamic> json) =>
      _$AccessibilityPreferencesFromJson(json);
}

/// User preferences model
@freezed
abstract class UserPreferences with _$UserPreferences {
  const factory UserPreferences({
    required String userId,
    @ThemeModeConverter() @Default(ThemeMode.system()) ThemeMode themeMode,
    @Default('en') String language,
    @Default('PH') String region,
    @Default(NotificationPreferences()) NotificationPreferences notifications,
    @Default(MapPreferences()) MapPreferences map,
    required EmergencyPreferences emergency,
    @Default(PrivacyPreferences()) PrivacyPreferences privacy,
    @Default(AccessibilityPreferences()) AccessibilityPreferences accessibility,
    Map<String, dynamic>? customPreferences,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserPreferences;

  factory UserPreferences.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesFromJson(json);

  /// Create default preferences for a user
  factory UserPreferences.defaultPreferences(String userId) {
    final now = DateTime.now();
    return UserPreferences(
      userId: userId,
      emergency: EmergencyPreferences.defaultPreferences(userId),
      createdAt: now,
      updatedAt: now,
    );
  }
}

/// Extension for ThemeMode display
extension ThemeModeDisplay on ThemeMode {
  String get displayName {
    return when(
      system: () => 'System Default',
      light: () => 'Light',
      dark: () => 'Dark',
    );
  }
}

/// Extension for MapStyle display
extension MapStyleDisplay on MapStyle {
  String get displayName {
    return when(
      standard: () => 'Standard',
      satellite: () => 'Satellite',
      hybrid: () => 'Hybrid',
      dark: () => 'Dark',
      light: () => 'Light',
      outdoor: () => 'Outdoor',
    );
  }
}

/// Extension for DistanceUnit display
extension DistanceUnitDisplay on DistanceUnit {
  String get displayName {
    return when(
      metric: () => 'Metric (km/m)',
      imperial: () => 'Imperial (mi/ft)',
    );
  }

  String get shortName {
    return when(
      metric: () => 'km',
      imperial: () => 'mi',
    );
  }
}

/// Extension for NavigationVoice display
extension NavigationVoiceDisplay on NavigationVoice {
  String get displayName {
    return when(
      enabled: () => 'Enabled',
      muted: () => 'Muted',
      alertsOnly: () => 'Alerts Only',
    );
  }
}

/// Extension for EmergencyAlertLevel display
extension EmergencyAlertLevelDisplay on EmergencyAlertLevel {
  String get displayName {
    return when(
      all: () => 'All Alerts',
      criticalOnly: () => 'Critical Only',
      emergencyOnly: () => 'Emergency Only',
      none: () => 'None',
    );
  }
}

/// Extension for PrivacyLevel display
extension PrivacyLevelDisplay on PrivacyLevel {
  String get displayName {
    return when(
      public: () => 'Public',
      contactsOnly: () => 'Contacts Only',
      private: () => 'Private',
    );
  }
}

/// Extension for string parsing
extension ThemeModeX on String {
  ThemeMode toThemeMode() {
    switch (toLowerCase()) {
      case 'system':
        return ThemeMode.system();
      case 'light':
        return ThemeMode.light();
      case 'dark':
        return ThemeMode.dark();
      default:
        return ThemeMode.system();
    }
  }
}

extension MapStyleX on String {
  MapStyle toMapStyle() {
    switch (toLowerCase()) {
      case 'standard':
        return MapStyle.standard();
      case 'satellite':
        return MapStyle.satellite();
      case 'hybrid':
        return MapStyle.hybrid();
      case 'dark':
        return MapStyle.dark();
      case 'light':
        return MapStyle.light();
      case 'outdoor':
        return MapStyle.outdoor();
      default:
        return MapStyle.standard();
    }
  }
}

extension DistanceUnitX on String {
  DistanceUnit toDistanceUnit() {
    switch (toLowerCase()) {
      case 'metric':
        return DistanceUnit.metric();
      case 'imperial':
        return DistanceUnit.imperial();
      default:
        return DistanceUnit.metric();
    }
  }
}

extension NavigationVoiceX on String {
  NavigationVoice toNavigationVoice() {
    switch (toLowerCase()) {
      case 'enabled':
        return NavigationVoice.enabled();
      case 'muted':
        return NavigationVoice.muted();
      case 'alertsonly':
      case 'alerts_only':
        return NavigationVoice.alertsOnly();
      default:
        return NavigationVoice.enabled();
    }
  }
}

extension EmergencyAlertLevelX on String {
  EmergencyAlertLevel toEmergencyAlertLevel() {
    switch (toLowerCase()) {
      case 'all':
        return EmergencyAlertLevel.all();
      case 'criticalonly':
      case 'critical_only':
        return EmergencyAlertLevel.criticalOnly();
      case 'emergencyonly':
      case 'emergency_only':
        return EmergencyAlertLevel.emergencyOnly();
      case 'none':
        return EmergencyAlertLevel.none();
      default:
        return EmergencyAlertLevel.all();
    }
  }
}

extension PrivacyLevelX on String {
  PrivacyLevel toPrivacyLevel() {
    switch (toLowerCase()) {
      case 'public':
        return PrivacyLevel.public();
      case 'contactsonly':
      case 'contacts_only':
        return PrivacyLevel.contactsOnly();
      case 'private':
        return PrivacyLevel.private();
      default:
        return PrivacyLevel.contactsOnly();
    }
  }
}