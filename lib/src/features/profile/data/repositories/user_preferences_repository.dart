/// SAFENAV CAVITE - User Preferences Repository
///
/// Repository for managing user preferences including theme, notifications,
/// map preferences, emergency settings, and privacy settings in Firestore.
library;

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart' as fs;
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/failures.dart' hide FirebaseException;
import '../../../../core/errors/result.dart';

/// User preferences repository provider
final userPreferencesRepositoryProvider = Provider<UserPreferencesRepository>((ref) => UserPreferencesRepository.instance);

/// Theme mode preference
enum ThemeModePreference {
  @JsonValue('system')
  system,
  @JsonValue('light')
  light,
  @JsonValue('dark')
  dark;

  String get displayName {
    switch (this) {
      case ThemeModePreference.system:
        return 'System Default';
      case ThemeModePreference.light:
        return 'Light';
      case ThemeModePreference.dark:
        return 'Dark';
    }
  }

  static ThemeModePreference fromString(String value) {
    return ThemeModePreference.values.firstWhere(
      (e) => e.name == value,
      orElse: () => ThemeModePreference.system,
    );
  }
}

/// Map style preference
enum MapStylePreference {
  @JsonValue('standard')
  standard,
  @JsonValue('satellite')
  satellite,
  @JsonValue('hybrid')
  hybrid,
  @JsonValue('terrain')
  terrain,
  @JsonValue('dark')
  dark,
  @JsonValue('light')
  light;

  String get displayName {
    switch (this) {
      case MapStylePreference.standard:
        return 'Standard';
      case MapStylePreference.satellite:
        return 'Satellite';
      case MapStylePreference.hybrid:
        return 'Hybrid';
      case MapStylePreference.terrain:
        return 'Terrain';
      case MapStylePreference.dark:
        return 'Dark';
      case MapStylePreference.light:
        return 'Light';
    }
  }

  static MapStylePreference fromString(String value) {
    return MapStylePreference.values.firstWhere(
      (e) => e.name == value,
      orElse: () => MapStylePreference.standard,
    );
  }
}

/// Distance unit preference
enum DistanceUnit {
  @JsonValue('metric')
  metric,
  @JsonValue('imperial')
  imperial;

  String get displayName {
    switch (this) {
      case DistanceUnit.metric:
        return 'Metric (m/km)';
      case DistanceUnit.imperial:
        return 'Imperial (ft/mi)';
    }
  }

  String get shortName {
    switch (this) {
      case DistanceUnit.metric:
        return 'km';
      case DistanceUnit.imperial:
        return 'mi';
    }
  }

  static DistanceUnit fromString(String value) {
    return DistanceUnit.values.firstWhere(
      (e) => e.name == value,
      orElse: () => DistanceUnit.metric,
    );
  }
}

/// Language preference
enum LanguagePreference {
  @JsonValue('en')
  english,
  @JsonValue('fil')
  filipino,
  @JsonValue('es')
  spanish;

  String get displayName {
    switch (this) {
      case LanguagePreference.english:
        return 'English';
      case LanguagePreference.filipino:
        return 'Filipino';
      case LanguagePreference.spanish:
        return 'Spanish';
    }
  }

  static LanguagePreference fromString(String value) {
    return LanguagePreference.values.firstWhere(
      (e) => e.name == value,
      orElse: () => LanguagePreference.english,
    );
  }
}

/// Notification preferences
class NotificationPreferences {
  const NotificationPreferences({
    this.pushEnabled = true,
    this.emailEnabled = false,
    this.smsEnabled = false,
    this.emergencyAlerts = true,
    this.weatherAlerts = true,
    this.securityAlerts = true,
    this.maintenanceAlerts = false,
    this.newFeatureAlerts = true,
    this.weeklyDigest = false,
    this.dailyCheckInReminder = false,
    this.routeArrivalNotifications = true,
    this.geofenceAlerts = true,
    this.lowBatteryWarning = true,
  });

  final bool pushEnabled;
  final bool emailEnabled;
  final bool smsEnabled;
  final bool emergencyAlerts;
  final bool weatherAlerts;
  final bool securityAlerts;
  final bool maintenanceAlerts;
  final bool newFeatureAlerts;
  final bool weeklyDigest;
  final bool dailyCheckInReminder;
  final bool routeArrivalNotifications;
  final bool geofenceAlerts;
  final bool lowBatteryWarning;

  Map<String, dynamic> toJson() => {
        'pushEnabled': pushEnabled,
        'emailEnabled': emailEnabled,
        'smsEnabled': smsEnabled,
        'emergencyAlerts': emergencyAlerts,
        'weatherAlerts': weatherAlerts,
        'securityAlerts': securityAlerts,
        'maintenanceAlerts': maintenanceAlerts,
        'newFeatureAlerts': newFeatureAlerts,
        'weeklyDigest': weeklyDigest,
        'dailyCheckInReminder': dailyCheckInReminder,
        'routeArrivalNotifications': routeArrivalNotifications,
        'geofenceAlerts': geofenceAlerts,
        'lowBatteryWarning': lowBatteryWarning,
      };

  factory NotificationPreferences.fromJson(Map<String, dynamic> json) => NotificationPreferences(
        pushEnabled: json['pushEnabled'] as bool? ?? true,
        emailEnabled: json['emailEnabled'] as bool? ?? false,
        smsEnabled: json['smsEnabled'] as bool? ?? false,
        emergencyAlerts: json['emergencyAlerts'] as bool? ?? true,
        weatherAlerts: json['weatherAlerts'] as bool? ?? true,
        securityAlerts: json['securityAlerts'] as bool? ?? true,
        maintenanceAlerts: json['maintenanceAlerts'] as bool? ?? false,
        newFeatureAlerts: json['newFeatureAlerts'] as bool? ?? true,
        weeklyDigest: json['weeklyDigest'] as bool? ?? false,
        dailyCheckInReminder: json['dailyCheckInReminder'] as bool? ?? false,
        routeArrivalNotifications: json['routeArrivalNotifications'] as bool? ?? true,
        geofenceAlerts: json['geofenceAlerts'] as bool? ?? true,
        lowBatteryWarning: json['lowBatteryWarning'] as bool? ?? true,
      );

  NotificationPreferences copyWith({
    bool? pushEnabled,
    bool? emailEnabled,
    bool? smsEnabled,
    bool? emergencyAlerts,
    bool? weatherAlerts,
    bool? securityAlerts,
    bool? maintenanceAlerts,
    bool? newFeatureAlerts,
    bool? weeklyDigest,
    bool? dailyCheckInReminder,
    bool? routeArrivalNotifications,
    bool? geofenceAlerts,
    bool? lowBatteryWarning,
  }) {
    return NotificationPreferences(
      pushEnabled: pushEnabled ?? this.pushEnabled,
      emailEnabled: emailEnabled ?? this.emailEnabled,
      smsEnabled: smsEnabled ?? this.smsEnabled,
      emergencyAlerts: emergencyAlerts ?? this.emergencyAlerts,
      weatherAlerts: weatherAlerts ?? this.weatherAlerts,
      securityAlerts: securityAlerts ?? this.securityAlerts,
      maintenanceAlerts: maintenanceAlerts ?? this.maintenanceAlerts,
      newFeatureAlerts: newFeatureAlerts ?? this.newFeatureAlerts,
      weeklyDigest: weeklyDigest ?? this.weeklyDigest,
      dailyCheckInReminder: dailyCheckInReminder ?? this.dailyCheckInReminder,
      routeArrivalNotifications: routeArrivalNotifications ?? this.routeArrivalNotifications,
      geofenceAlerts: geofenceAlerts ?? this.geofenceAlerts,
      lowBatteryWarning: lowBatteryWarning ?? this.lowBatteryWarning,
    );
  }
}

/// Map preferences
class MapPreferences {
  const MapPreferences({
    this.style = MapStylePreference.standard,
    this.showBuildings = true,
    this.showPathways = true,
    this.showRooms = true,
    this.showFacilities = true,
    this.showCurrentLocation = true,
    this.autoCenter = true,
    this.enable3dBuildings = false,
    this.enableTrafficLayer = false,
    this.enableTransitLayer = false,
    this.defaultZoomLevel = 18.0,
    this.distanceUnit = DistanceUnit.metric,
    this.compassEnabled = true,
    this.scaleEnabled = true,
    this.myLocationButtonEnabled = true,
  });

  final MapStylePreference style;
  final bool showBuildings;
  final bool showPathways;
  final bool showRooms;
  final bool showFacilities;
  final bool showCurrentLocation;
  final bool autoCenter;
  final bool enable3dBuildings;
  final bool enableTrafficLayer;
  final bool enableTransitLayer;
  final double defaultZoomLevel;
  final DistanceUnit distanceUnit;
  final bool compassEnabled;
  final bool scaleEnabled;
  final bool myLocationButtonEnabled;

  Map<String, dynamic> toJson() => {
        'style': style.name,
        'showBuildings': showBuildings,
        'showPathways': showPathways,
        'showRooms': showRooms,
        'showFacilities': showFacilities,
        'showCurrentLocation': showCurrentLocation,
        'autoCenter': autoCenter,
        'enable3dBuildings': enable3dBuildings,
        'enableTrafficLayer': enableTrafficLayer,
        'enableTransitLayer': enableTransitLayer,
        'defaultZoomLevel': defaultZoomLevel,
        'distanceUnit': distanceUnit.name,
        'compassEnabled': compassEnabled,
        'scaleEnabled': scaleEnabled,
        'myLocationButtonEnabled': myLocationButtonEnabled,
      };

  factory MapPreferences.fromJson(Map<String, dynamic> json) => MapPreferences(
        style: MapStylePreference.fromString(json['style'] as String? ?? 'standard'),
        showBuildings: json['showBuildings'] as bool? ?? true,
        showPathways: json['showPathways'] as bool? ?? true,
        showRooms: json['showRooms'] as bool? ?? true,
        showFacilities: json['showFacilities'] as bool? ?? true,
        showCurrentLocation: json['showCurrentLocation'] as bool? ?? true,
        autoCenter: json['autoCenter'] as bool? ?? true,
        enable3dBuildings: json['enable3dBuildings'] as bool? ?? false,
        enableTrafficLayer: json['enableTrafficLayer'] as bool? ?? false,
        enableTransitLayer: json['enableTransitLayer'] as bool? ?? false,
        defaultZoomLevel: (json['defaultZoomLevel'] as num?)?.toDouble() ?? 18.0,
        distanceUnit: DistanceUnit.fromString(json['distanceUnit'] as String? ?? 'metric'),
        compassEnabled: json['compassEnabled'] as bool? ?? true,
        scaleEnabled: json['scaleEnabled'] as bool? ?? true,
        myLocationButtonEnabled: json['myLocationButtonEnabled'] as bool? ?? true,
      );

  MapPreferences copyWith({
    MapStylePreference? style,
    bool? showBuildings,
    bool? showPathways,
    bool? showRooms,
    bool? showFacilities,
    bool? showCurrentLocation,
    bool? autoCenter,
    bool? enable3dBuildings,
    bool? enableTrafficLayer,
    bool? enableTransitLayer,
    double? defaultZoomLevel,
    DistanceUnit? distanceUnit,
    bool? compassEnabled,
    bool? scaleEnabled,
    bool? myLocationButtonEnabled,
  }) {
    return MapPreferences(
      style: style ?? this.style,
      showBuildings: showBuildings ?? this.showBuildings,
      showPathways: showPathways ?? this.showPathways,
      showRooms: showRooms ?? this.showRooms,
      showFacilities: showFacilities ?? this.showFacilities,
      showCurrentLocation: showCurrentLocation ?? this.showCurrentLocation,
      autoCenter: autoCenter ?? this.autoCenter,
      enable3dBuildings: enable3dBuildings ?? this.enable3dBuildings,
      enableTrafficLayer: enableTrafficLayer ?? this.enableTrafficLayer,
      enableTransitLayer: enableTransitLayer ?? this.enableTransitLayer,
      defaultZoomLevel: defaultZoomLevel ?? this.defaultZoomLevel,
      distanceUnit: distanceUnit ?? this.distanceUnit,
      compassEnabled: compassEnabled ?? this.compassEnabled,
      scaleEnabled: scaleEnabled ?? this.scaleEnabled,
      myLocationButtonEnabled: myLocationButtonEnabled ?? this.myLocationButtonEnabled,
    );
  }
}

/// Emergency settings
class EmergencySettings {
  const EmergencySettings({
    this.autoShareLocation = true,
    this.countdownSeconds = 5,
    this.requireConfirmation = true,
    this.vibrationPattern = 'emergency',
    this.soundEnabled = true,
    this.flashlightEnabled = false,
    this.notifyContacts = true,
    this.callEmergencyServices = false,
    this.emergencyNumber = '911',
    this.shareMedicalInfo = false,
  });

  final bool autoShareLocation;
  final int countdownSeconds;
  final bool requireConfirmation;
  final String vibrationPattern;
  final bool soundEnabled;
  final bool flashlightEnabled;
  final bool notifyContacts;
  final bool callEmergencyServices;
  final String emergencyNumber;
  final bool shareMedicalInfo;

  Map<String, dynamic> toJson() => {
        'autoShareLocation': autoShareLocation,
        'countdownSeconds': countdownSeconds,
        'requireConfirmation': requireConfirmation,
        'vibrationPattern': vibrationPattern,
        'soundEnabled': soundEnabled,
        'flashlightEnabled': flashlightEnabled,
        'notifyContacts': notifyContacts,
        'callEmergencyServices': callEmergencyServices,
        'emergencyNumber': emergencyNumber,
        'shareMedicalInfo': shareMedicalInfo,
      };

  factory EmergencySettings.fromJson(Map<String, dynamic> json) => EmergencySettings(
        autoShareLocation: json['autoShareLocation'] as bool? ?? true,
        countdownSeconds: json['countdownSeconds'] as int? ?? 5,
        requireConfirmation: json['requireConfirmation'] as bool? ?? true,
        vibrationPattern: json['vibrationPattern'] as String? ?? 'emergency',
        soundEnabled: json['soundEnabled'] as bool? ?? true,
        flashlightEnabled: json['flashlightEnabled'] as bool? ?? false,
        notifyContacts: json['notifyContacts'] as bool? ?? true,
        callEmergencyServices: json['callEmergencyServices'] as bool? ?? false,
        emergencyNumber: json['emergencyNumber'] as String? ?? '911',
        shareMedicalInfo: json['shareMedicalInfo'] as bool? ?? false,
      );

  EmergencySettings copyWith({
    bool? autoShareLocation,
    int? countdownSeconds,
    bool? requireConfirmation,
    String? vibrationPattern,
    bool? soundEnabled,
    bool? flashlightEnabled,
    bool? notifyContacts,
    bool? callEmergencyServices,
    String? emergencyNumber,
    bool? shareMedicalInfo,
  }) {
    return EmergencySettings(
      autoShareLocation: autoShareLocation ?? this.autoShareLocation,
      countdownSeconds: countdownSeconds ?? this.countdownSeconds,
      requireConfirmation: requireConfirmation ?? this.requireConfirmation,
      vibrationPattern: vibrationPattern ?? this.vibrationPattern,
      soundEnabled: soundEnabled ?? this.soundEnabled,
      flashlightEnabled: flashlightEnabled ?? this.flashlightEnabled,
      notifyContacts: notifyContacts ?? this.notifyContacts,
      callEmergencyServices: callEmergencyServices ?? this.callEmergencyServices,
      emergencyNumber: emergencyNumber ?? this.emergencyNumber,
      shareMedicalInfo: shareMedicalInfo ?? this.shareMedicalInfo,
    );
  }
}

/// Privacy settings
class PrivacySettings {
  const PrivacySettings({
    this.shareLocationWithApp = true,
    this.shareLocationWithContacts = false,
    this.shareAnalytics = true,
    this.shareCrashReports = true,
    this.allowPersonalizedAds = false,
    this.dataRetentionDays = 365,
    this.enableLocationHistory = true,
    this.enableActivityTracking = true,
    this.profileVisibility = ProfileVisibility.private,
  });

  final bool shareLocationWithApp;
  final bool shareLocationWithContacts;
  final bool shareAnalytics;
  final bool shareCrashReports;
  final bool allowPersonalizedAds;
  final int dataRetentionDays;
  final bool enableLocationHistory;
  final bool enableActivityTracking;
  final ProfileVisibility profileVisibility;

  Map<String, dynamic> toJson() => {
        'shareLocationWithApp': shareLocationWithApp,
        'shareLocationWithContacts': shareLocationWithContacts,
        'shareAnalytics': shareAnalytics,
        'shareCrashReports': shareCrashReports,
        'allowPersonalizedAds': allowPersonalizedAds,
        'dataRetentionDays': dataRetentionDays,
        'enableLocationHistory': enableLocationHistory,
        'enableActivityTracking': enableActivityTracking,
        'profileVisibility': profileVisibility.name,
      };

  factory PrivacySettings.fromJson(Map<String, dynamic> json) => PrivacySettings(
        shareLocationWithApp: json['shareLocationWithApp'] as bool? ?? true,
        shareLocationWithContacts: json['shareLocationWithContacts'] as bool? ?? false,
        shareAnalytics: json['shareAnalytics'] as bool? ?? true,
        shareCrashReports: json['shareCrashReports'] as bool? ?? true,
        allowPersonalizedAds: json['allowPersonalizedAds'] as bool? ?? false,
        dataRetentionDays: json['dataRetentionDays'] as int? ?? 365,
        enableLocationHistory: json['enableLocationHistory'] as bool? ?? true,
        enableActivityTracking: json['enableActivityTracking'] as bool? ?? true,
        profileVisibility: ProfileVisibility.fromString(json['profileVisibility'] as String? ?? 'private'),
      );

  PrivacySettings copyWith({
    bool? shareLocationWithApp,
    bool? shareLocationWithContacts,
    bool? shareAnalytics,
    bool? shareCrashReports,
    bool? allowPersonalizedAds,
    int? dataRetentionDays,
    bool? enableLocationHistory,
    bool? enableActivityTracking,
    ProfileVisibility? profileVisibility,
  }) {
    return PrivacySettings(
      shareLocationWithApp: shareLocationWithApp ?? this.shareLocationWithApp,
      shareLocationWithContacts: shareLocationWithContacts ?? this.shareLocationWithContacts,
      shareAnalytics: shareAnalytics ?? this.shareAnalytics,
      shareCrashReports: shareCrashReports ?? this.shareCrashReports,
      allowPersonalizedAds: allowPersonalizedAds ?? this.allowPersonalizedAds,
      dataRetentionDays: dataRetentionDays ?? this.dataRetentionDays,
      enableLocationHistory: enableLocationHistory ?? this.enableLocationHistory,
      enableActivityTracking: enableActivityTracking ?? this.enableActivityTracking,
      profileVisibility: profileVisibility ?? this.profileVisibility,
    );
  }
}

/// Profile visibility options
enum ProfileVisibility {
  @JsonValue('public')
  public,
  @JsonValue('contacts_only')
  contactsOnly,
  @JsonValue('private')
  private;

  String get displayName {
    switch (this) {
      case ProfileVisibility.public:
        return 'Public';
      case ProfileVisibility.contactsOnly:
        return 'Contacts Only';
      case ProfileVisibility.private:
        return 'Private';
    }
  }

  static ProfileVisibility fromString(String value) {
    return ProfileVisibility.values.firstWhere(
      (e) => e.name == value,
      orElse: () => ProfileVisibility.private,
    );
  }
}

/// User preferences model
class UserPreferences {
  const UserPreferences({
    required this.userId,
    this.theme = ThemeModePreference.system,
    this.language = LanguagePreference.english,
    this.notifications = const NotificationPreferences(),
    this.map = const MapPreferences(),
    this.emergency = const EmergencySettings(),
    this.privacy = const PrivacySettings(),
    this.favoriteBuildings = const [],
    this.recentSearches = const [],
    this.customPoiCategories = const [],
    this.accessibility = const AccessibilitySettings(),
    required this.createdAt,
    required this.updatedAt,
  });

  final String userId;
  final ThemeModePreference theme;
  final LanguagePreference language;
  final NotificationPreferences notifications;
  final MapPreferences map;
  final EmergencySettings emergency;
  final PrivacySettings privacy;
  final List<String> favoriteBuildings;
  final List<String> recentSearches;
  final List<String> customPoiCategories;
  final AccessibilitySettings accessibility;
  final DateTime createdAt;
  final DateTime updatedAt;

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'theme': theme.name,
        'language': language.name,
        'notifications': notifications.toJson(),
        'map': map.toJson(),
        'emergency': emergency.toJson(),
        'privacy': privacy.toJson(),
        'favoriteBuildings': favoriteBuildings,
        'recentSearches': recentSearches,
        'customPoiCategories': customPoiCategories,
        'accessibility': accessibility.toJson(),
        'createdAt': Timestamp.fromDate(createdAt),
        'updatedAt': Timestamp.fromDate(updatedAt),
      };

  factory UserPreferences.fromJson(Map<String, dynamic> json) => UserPreferences(
        userId: json['userId'] as String,
        theme: ThemeModePreference.fromString(json['theme'] as String? ?? 'system'),
        language: LanguagePreference.fromString(json['language'] as String? ?? 'en'),
        notifications: NotificationPreferences.fromJson(json['notifications'] as Map<String, dynamic>? ?? {}),
        map: MapPreferences.fromJson(json['map'] as Map<String, dynamic>? ?? {}),
        emergency: EmergencySettings.fromJson(json['emergency'] as Map<String, dynamic>? ?? {}),
        privacy: PrivacySettings.fromJson(json['privacy'] as Map<String, dynamic>? ?? {}),
        favoriteBuildings: List<String>.from(json['favoriteBuildings'] ?? []),
        recentSearches: List<String>.from(json['recentSearches'] ?? []),
        customPoiCategories: List<String>.from(json['customPoiCategories'] ?? []),
        accessibility: AccessibilitySettings.fromJson(json['accessibility'] as Map<String, dynamic>? ?? {}),
        createdAt: (json['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
        updatedAt: (json['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      );

  UserPreferences copyWith({
    String? userId,
    ThemeModePreference? theme,
    LanguagePreference? language,
    NotificationPreferences? notifications,
    MapPreferences? map,
    EmergencySettings? emergency,
    PrivacySettings? privacy,
    List<String>? favoriteBuildings,
    List<String>? recentSearches,
    List<String>? customPoiCategories,
    AccessibilitySettings? accessibility,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserPreferences(
      userId: userId ?? this.userId,
      theme: theme ?? this.theme,
      language: language ?? this.language,
      notifications: notifications ?? this.notifications,
      map: map ?? this.map,
      emergency: emergency ?? this.emergency,
      privacy: privacy ?? this.privacy,
      favoriteBuildings: favoriteBuildings ?? this.favoriteBuildings,
      recentSearches: recentSearches ?? this.recentSearches,
      customPoiCategories: customPoiCategories ?? this.customPoiCategories,
      accessibility: accessibility ?? this.accessibility,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

/// Accessibility settings
class AccessibilitySettings {
  const AccessibilitySettings({
    this.largeText = false,
    this.highContrast = false,
    this.reduceMotion = false,
    this.voiceGuidance = true,
    this.voiceGuidanceVolume = 0.8,
    this.hapticFeedback = true,
    this.screenReaderOptimized = false,
    this.colorBlindMode = ColorBlindMode.none,
  });

  final bool largeText;
  final bool highContrast;
  final bool reduceMotion;
  final bool voiceGuidance;
  final double voiceGuidanceVolume;
  final bool hapticFeedback;
  final bool screenReaderOptimized;
  final ColorBlindMode colorBlindMode;

  Map<String, dynamic> toJson() => {
        'largeText': largeText,
        'highContrast': highContrast,
        'reduceMotion': reduceMotion,
        'voiceGuidance': voiceGuidance,
        'voiceGuidanceVolume': voiceGuidanceVolume,
        'hapticFeedback': hapticFeedback,
        'screenReaderOptimized': screenReaderOptimized,
        'colorBlindMode': colorBlindMode.name,
      };

  factory AccessibilitySettings.fromJson(Map<String, dynamic> json) => AccessibilitySettings(
        largeText: json['largeText'] as bool? ?? false,
        highContrast: json['highContrast'] as bool? ?? false,
        reduceMotion: json['reduceMotion'] as bool? ?? false,
        voiceGuidance: json['voiceGuidance'] as bool? ?? true,
        voiceGuidanceVolume: (json['voiceGuidanceVolume'] as num?)?.toDouble() ?? 0.8,
        hapticFeedback: json['hapticFeedback'] as bool? ?? true,
        screenReaderOptimized: json['screenReaderOptimized'] as bool? ?? false,
        colorBlindMode: ColorBlindMode.fromString(json['colorBlindMode'] as String? ?? 'none'),
      );

  AccessibilitySettings copyWith({
    bool? largeText,
    bool? highContrast,
    bool? reduceMotion,
    bool? voiceGuidance,
    double? voiceGuidanceVolume,
    bool? hapticFeedback,
    bool? screenReaderOptimized,
    ColorBlindMode? colorBlindMode,
  }) {
    return AccessibilitySettings(
      largeText: largeText ?? this.largeText,
      highContrast: highContrast ?? this.highContrast,
      reduceMotion: reduceMotion ?? this.reduceMotion,
      voiceGuidance: voiceGuidance ?? this.voiceGuidance,
      voiceGuidanceVolume: voiceGuidanceVolume ?? this.voiceGuidanceVolume,
      hapticFeedback: hapticFeedback ?? this.hapticFeedback,
      screenReaderOptimized: screenReaderOptimized ?? this.screenReaderOptimized,
      colorBlindMode: colorBlindMode ?? this.colorBlindMode,
    );
  }
}

/// Color blind mode options
enum ColorBlindMode {
  @JsonValue('none')
  none,
  @JsonValue('protanopia')
  protanopia,
  @JsonValue('deuteranopia')
  deuteranopia,
  @JsonValue('tritanopia')
  tritanopia,
  @JsonValue('achromatopsia')
  achromatopsia;

  String get displayName {
    switch (this) {
      case ColorBlindMode.none:
        return 'None';
      case ColorBlindMode.protanopia:
        return 'Protanopia (Red-blind)';
      case ColorBlindMode.deuteranopia:
        return 'Deuteranopia (Green-blind)';
      case ColorBlindMode.tritanopia:
        return 'Tritanopia (Blue-blind)';
      case ColorBlindMode.achromatopsia:
        return 'Achromatopsia (Monochrome)';
    }
  }

  static ColorBlindMode fromString(String value) {
    return ColorBlindMode.values.firstWhere(
      (e) => e.name == value,
      orElse: () => ColorBlindMode.none,
    );
  }
}

/// Repository for user preferences operations
class UserPreferencesRepository {
  UserPreferencesRepository._() {
    debugPrint('[USER_PREFS_REPO] UserPreferencesRepository: Constructor called');
  }

  static final UserPreferencesRepository _instance = UserPreferencesRepository._();
  static UserPreferencesRepository get instance => _instance;

  final fs.FirebaseFirestore _firestore = fs.FirebaseFirestore.instance;

  /// Collection reference for user preferences
  fs.CollectionReference<Map<String, dynamic>> get _preferencesCollection =>
      _firestore.collection('user_preferences');

  /// Creates or updates user preferences
  Future<Result<UserPreferences>> savePreferences(UserPreferences prefs) async {
    try {
      debugPrint('[USER_PREFS_REPO] savePreferences: Saving preferences for user ${prefs.userId}');
      final docRef = _preferencesCollection.doc(prefs.userId);
      await docRef.set(prefs.toJson());
      debugPrint('[USER_PREFS_REPO] savePreferences: Successfully saved preferences');
      return Success(prefs);
    } on fs.FirebaseException catch (e) {
      debugPrint('[USER_PREFS_REPO] savePreferences: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[USER_PREFS_REPO] savePreferences: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to save preferences',
        code: 'SAVE_PREFERENCES_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Gets user preferences
  Future<Result<UserPreferences>> getPreferences(String userId) async {
    try {
      debugPrint('[USER_PREFS_REPO] getPreferences: Fetching preferences for user $userId');
      final docSnapshot = await _preferencesCollection.doc(userId).get();

      if (!docSnapshot.exists) {
        // Return defaults
        final prefs = UserPreferences(
          userId: userId,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        await savePreferences(prefs);
        debugPrint('[USER_PREFS_REPO] getPreferences: Created default preferences for user $userId');
        return Success(prefs);
      }

      final prefs = UserPreferences.fromJson(docSnapshot.data()!);
      debugPrint('[USER_PREFS_REPO] getPreferences: Successfully fetched preferences');
      return Success(prefs);
    } on fs.FirebaseException catch (e) {
      debugPrint('[USER_PREFS_REPO] getPreferences: FirebaseException - ${e.code}: ${e.message}');
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[USER_PREFS_REPO] getPreferences: ERROR - $e');
      return FailureResult(FirestoreFailure(
        message: 'Failed to get preferences',
        code: 'GET_PREFERENCES_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Stream of user preferences for real-time updates
  Stream<UserPreferences> watchPreferences(String userId) {
    return _preferencesCollection.doc(userId).snapshots().map((snapshot) {
      if (!snapshot.exists) {
        return UserPreferences(
          userId: userId,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
      }
      return UserPreferences.fromJson(snapshot.data()!);
    });
  }

  /// Updates only specific preference sections
  Future<Result<UserPreferences>> updateTheme(String userId, ThemeModePreference theme) async {
    final prefsResult = await getPreferences(userId);
    if (prefsResult.isFailure) return FailureResult(prefsResult.failure);

    final updated = prefsResult.value.copyWith(theme: theme, updatedAt: DateTime.now());
    return savePreferences(updated);
  }

  Future<Result<UserPreferences>> updateLanguage(String userId, LanguagePreference language) async {
    final prefsResult = await getPreferences(userId);
    if (prefsResult.isFailure) return FailureResult(prefsResult.failure);

    final updated = prefsResult.value.copyWith(language: language, updatedAt: DateTime.now());
    return savePreferences(updated);
  }

  Future<Result<UserPreferences>> updateNotifications(String userId, NotificationPreferences notifications) async {
    final prefsResult = await getPreferences(userId);
    if (prefsResult.isFailure) return FailureResult(prefsResult.failure);

    final updated = prefsResult.value.copyWith(notifications: notifications, updatedAt: DateTime.now());
    return savePreferences(updated);
  }

  Future<Result<UserPreferences>> updateMapPreferences(String userId, MapPreferences map) async {
    final prefsResult = await getPreferences(userId);
    if (prefsResult.isFailure) return FailureResult(prefsResult.failure);

    final updated = prefsResult.value.copyWith(map: map, updatedAt: DateTime.now());
    return savePreferences(updated);
  }

  Future<Result<UserPreferences>> updateEmergencySettings(String userId, EmergencySettings emergency) async {
    final prefsResult = await getPreferences(userId);
    if (prefsResult.isFailure) return FailureResult(prefsResult.failure);

    final updated = prefsResult.value.copyWith(emergency: emergency, updatedAt: DateTime.now());
    return savePreferences(updated);
  }

  Future<Result<UserPreferences>> updatePrivacySettings(String userId, PrivacySettings privacy) async {
    final prefsResult = await getPreferences(userId);
    if (prefsResult.isFailure) return FailureResult(prefsResult.failure);

    final updated = prefsResult.value.copyWith(privacy: privacy, updatedAt: DateTime.now());
    return savePreferences(updated);
  }

  Future<Result<UserPreferences>> updateAccessibility(String userId, AccessibilitySettings accessibility) async {
    final prefsResult = await getPreferences(userId);
    if (prefsResult.isFailure) return FailureResult(prefsResult.failure);

    final updated = prefsResult.value.copyWith(accessibility: accessibility, updatedAt: DateTime.now());
    return savePreferences(updated);
  }

  /// Adds a building to favorites
  Future<Result<UserPreferences>> addFavoriteBuilding(String userId, String buildingId) async {
    final prefsResult = await getPreferences(userId);
    if (prefsResult.isFailure) return FailureResult(prefsResult.failure);

    final prefs = prefsResult.value;
    if (!prefs.favoriteBuildings.contains(buildingId)) {
      final updated = prefs.copyWith(
        favoriteBuildings: [...prefs.favoriteBuildings, buildingId],
        updatedAt: DateTime.now(),
      );
      return savePreferences(updated);
    }
    return Success(prefs);
  }

  /// Removes a building from favorites
  Future<Result<UserPreferences>> removeFavoriteBuilding(String userId, String buildingId) async {
    final prefsResult = await getPreferences(userId);
    if (prefsResult.isFailure) return FailureResult(prefsResult.failure);

    final prefs = prefsResult.value;
    if (prefs.favoriteBuildings.contains(buildingId)) {
      final updated = prefs.copyWith(
        favoriteBuildings: prefs.favoriteBuildings.where((b) => b != buildingId).toList(),
        updatedAt: DateTime.now(),
      );
      return savePreferences(updated);
    }
    return Success(prefs);
  }

  /// Adds a recent search
  Future<Result<UserPreferences>> addRecentSearch(String userId, String searchQuery) async {
    final prefsResult = await getPreferences(userId);
    if (prefsResult.isFailure) return FailureResult(prefsResult.failure);

    final prefs = prefsResult.value;
    var searches = prefs.recentSearches.toList();
    // Remove if already exists
    searches.remove(searchQuery);
    // Add to front
    searches.insert(0, searchQuery);
    // Keep only last 10
    if (searches.length > 10) searches = searches.take(10).toList();

    final updated = prefs.copyWith(
      recentSearches: searches,
      updatedAt: DateTime.now(),
    );
    return savePreferences(updated);
  }

  /// Clears recent searches
  Future<Result<UserPreferences>> clearRecentSearches(String userId) async {
    final prefsResult = await getPreferences(userId);
    if (prefsResult.isFailure) return FailureResult(prefsResult.failure);

    final updated = prefsResult.value.copyWith(
      recentSearches: [],
      updatedAt: DateTime.now(),
    );
    return savePreferences(updated);
  }

  /// Resets preferences to defaults
  Future<Result<UserPreferences>> resetToDefaults(String userId) async {
    final prefs = UserPreferences(
      userId: userId,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    return savePreferences(prefs);
  }

  /// Deletes user preferences
  Future<Result<void>> deletePreferences(String userId) async {
    try {
      await _preferencesCollection.doc(userId).delete();
      return const Success(null);
    } on fs.FirebaseException catch (e) {
      return FailureResult(FirestoreFailure(
        message: _getFirestoreErrorMessage(e.code),
        code: e.code,
      ));
    } catch (e) {
      return FailureResult(FirestoreFailure(
        message: 'Failed to delete preferences',
        code: 'DELETE_PREFERENCES_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Maps Firestore error codes to user-friendly messages
  String _getFirestoreErrorMessage(String code) {
    switch (code) {
      case 'permission-denied':
        return 'Permission denied. You do not have access to this resource.';
      case 'not-found':
        return 'The requested document was not found.';
      case 'already-exists':
        return 'A document with this ID already exists.';
      case 'resource-exhausted':
        return 'Too many requests. Please try again later.';
      case 'failed-precondition':
        return 'Operation failed due to a precondition.';
      case 'aborted':
        return 'Operation was aborted. Please try again.';
      case 'out-of-range':
        return 'Operation was out of range.';
      case 'unimplemented':
        return 'Operation is not implemented.';
      case 'internal':
        return 'Internal server error. Please try again later.';
      case 'unavailable':
        return 'Service unavailable. Please check your connection.';
      case 'data-loss':
        return 'Data loss occurred. Please contact support.';
      case 'unauthenticated':
        return 'Authentication required. Please sign in again.';
      default:
        return 'Database error: $code';
    }
  }
}