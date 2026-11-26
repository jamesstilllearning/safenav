// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationPreferences _$NotificationPreferencesFromJson(
  Map<String, dynamic> json,
) => _NotificationPreferences(
  pushEnabled: json['pushEnabled'] as bool? ?? true,
  emailEnabled: json['emailEnabled'] as bool? ?? true,
  smsEnabled: json['smsEnabled'] as bool? ?? true,
  inAppEnabled: json['inAppEnabled'] as bool? ?? true,
  emergencyAlerts: json['emergencyAlerts'] == null
      ? const EmergencyAlertLevel.all()
      : const EmergencyAlertLevelConverter().fromJson(
          json['emergencyAlerts'] as Object,
        ),
  drillNotifications: json['drillNotifications'] as bool? ?? true,
  buildingAlerts: json['buildingAlerts'] as bool? ?? true,
  routeUpdates: json['routeUpdates'] as bool? ?? true,
  safetyScoreUpdates: json['safetyScoreUpdates'] as bool? ?? true,
  weeklyDigest: json['weeklyDigest'] as bool? ?? true,
  maintenanceNotifications: json['maintenanceNotifications'] as bool? ?? true,
  customChannels:
      (json['customChannels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as bool),
      ) ??
      const {},
);

Map<String, dynamic> _$NotificationPreferencesToJson(
  _NotificationPreferences instance,
) => <String, dynamic>{
  'pushEnabled': instance.pushEnabled,
  'emailEnabled': instance.emailEnabled,
  'smsEnabled': instance.smsEnabled,
  'inAppEnabled': instance.inAppEnabled,
  'emergencyAlerts': const EmergencyAlertLevelConverter().toJson(
    instance.emergencyAlerts,
  ),
  'drillNotifications': instance.drillNotifications,
  'buildingAlerts': instance.buildingAlerts,
  'routeUpdates': instance.routeUpdates,
  'safetyScoreUpdates': instance.safetyScoreUpdates,
  'weeklyDigest': instance.weeklyDigest,
  'maintenanceNotifications': instance.maintenanceNotifications,
  'customChannels': instance.customChannels,
};

_MapPreferences _$MapPreferencesFromJson(Map<String, dynamic> json) =>
    _MapPreferences(
      mapStyle: json['mapStyle'] == null
          ? const MapStyle.standard()
          : const MapStyleConverter().fromJson(json['mapStyle'] as Object),
      showBuildings: json['showBuildings'] as bool? ?? true,
      showPathways: json['showPathways'] as bool? ?? true,
      showRooms: json['showRooms'] as bool? ?? true,
      showFacilities: json['showFacilities'] as bool? ?? true,
      showEmergencyExits: json['showEmergencyExits'] as bool? ?? true,
      showAssemblyPoints: json['showAssemblyPoints'] as bool? ?? true,
      showCurrentLocation: json['showCurrentLocation'] as bool? ?? true,
      autoRotate: json['autoRotate'] as bool? ?? true,
      showCompass: json['showCompass'] as bool? ?? true,
      showScale: json['showScale'] as bool? ?? true,
      defaultZoom: (json['defaultZoom'] as num?)?.toDouble() ?? 15.0,
      distanceUnit: json['distanceUnit'] == null
          ? const DistanceUnit.metric()
          : const DistanceUnitConverter().fromJson(
              json['distanceUnit'] as Object,
            ),
      voiceGuidance: json['voiceGuidance'] == null
          ? const NavigationVoice.enabled()
          : const NavigationVoiceConverter().fromJson(
              json['voiceGuidance'] as Object,
            ),
      hapticFeedback: json['hapticFeedback'] as bool? ?? true,
      offlineMapsEnabled: json['offlineMapsEnabled'] as bool? ?? true,
      layerVisibility:
          (json['layerVisibility'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as bool),
          ) ??
          const {},
    );

Map<String, dynamic> _$MapPreferencesToJson(
  _MapPreferences instance,
) => <String, dynamic>{
  'mapStyle': const MapStyleConverter().toJson(instance.mapStyle),
  'showBuildings': instance.showBuildings,
  'showPathways': instance.showPathways,
  'showRooms': instance.showRooms,
  'showFacilities': instance.showFacilities,
  'showEmergencyExits': instance.showEmergencyExits,
  'showAssemblyPoints': instance.showAssemblyPoints,
  'showCurrentLocation': instance.showCurrentLocation,
  'autoRotate': instance.autoRotate,
  'showCompass': instance.showCompass,
  'showScale': instance.showScale,
  'defaultZoom': instance.defaultZoom,
  'distanceUnit': const DistanceUnitConverter().toJson(instance.distanceUnit),
  'voiceGuidance': const NavigationVoiceConverter().toJson(
    instance.voiceGuidance,
  ),
  'hapticFeedback': instance.hapticFeedback,
  'offlineMapsEnabled': instance.offlineMapsEnabled,
  'layerVisibility': instance.layerVisibility,
};

_EmergencyPreferences _$EmergencyPreferencesFromJson(
  Map<String, dynamic> json,
) => _EmergencyPreferences(
  userId: json['userId'] as String,
  shareLocationWithContacts: json['shareLocationWithContacts'] as bool? ?? true,
  shareLocationWithResponders:
      json['shareLocationWithResponders'] as bool? ?? true,
  autoCallEmergency: json['autoCallEmergency'] as bool? ?? true,
  autoCallDelaySeconds: (json['autoCallDelaySeconds'] as num?)?.toInt() ?? 30,
  sendPeriodicUpdates: json['sendPeriodicUpdates'] as bool? ?? true,
  updateIntervalSeconds:
      (json['updateIntervalSeconds'] as num?)?.toInt() ?? 300,
  vibrateOnEmergency: json['vibrateOnEmergency'] as bool? ?? true,
  flashScreenOnEmergency: json['flashScreenOnEmergency'] as bool? ?? true,
  playSirenSound: json['playSirenSound'] as bool? ?? true,
  alertLevel: json['alertLevel'] == null
      ? const EmergencyAlertLevel.all()
      : const EmergencyAlertLevelConverter().fromJson(
          json['alertLevel'] as Object,
        ),
  blockedAlertTypes:
      (json['blockedAlertTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  customSettings: json['customSettings'] as Map<String, dynamic>? ?? const {},
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$EmergencyPreferencesToJson(
  _EmergencyPreferences instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'shareLocationWithContacts': instance.shareLocationWithContacts,
  'shareLocationWithResponders': instance.shareLocationWithResponders,
  'autoCallEmergency': instance.autoCallEmergency,
  'autoCallDelaySeconds': instance.autoCallDelaySeconds,
  'sendPeriodicUpdates': instance.sendPeriodicUpdates,
  'updateIntervalSeconds': instance.updateIntervalSeconds,
  'vibrateOnEmergency': instance.vibrateOnEmergency,
  'flashScreenOnEmergency': instance.flashScreenOnEmergency,
  'playSirenSound': instance.playSirenSound,
  'alertLevel': const EmergencyAlertLevelConverter().toJson(
    instance.alertLevel,
  ),
  'blockedAlertTypes': instance.blockedAlertTypes,
  'customSettings': instance.customSettings,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};

_PrivacyPreferences _$PrivacyPreferencesFromJson(
  Map<String, dynamic> json,
) => _PrivacyPreferences(
  locationSharing: json['locationSharing'] == null
      ? const PrivacyLevel.contactsOnly()
      : const PrivacyLevelConverter().fromJson(
          json['locationSharing'] as Object,
        ),
  activitySharing: json['activitySharing'] == null
      ? const PrivacyLevel.contactsOnly()
      : const PrivacyLevelConverter().fromJson(
          json['activitySharing'] as Object,
        ),
  routeHistory: json['routeHistory'] == null
      ? const PrivacyLevel.private()
      : const PrivacyLevelConverter().fromJson(json['routeHistory'] as Object),
  visitHistory: json['visitHistory'] == null
      ? const PrivacyLevel.private()
      : const PrivacyLevelConverter().fromJson(json['visitHistory'] as Object),
  safetyScore: json['safetyScore'] == null
      ? const PrivacyLevel.private()
      : const PrivacyLevelConverter().fromJson(json['safetyScore'] as Object),
  analyticsOptIn: json['analyticsOptIn'] as bool? ?? true,
  crashReportingOptIn: json['crashReportingOptIn'] as bool? ?? true,
  personalizedContent: json['personalizedContent'] as bool? ?? true,
  allowThirdPartyTracking: json['allowThirdPartyTracking'] as bool? ?? false,
  customSettings: json['customSettings'] as Map<String, dynamic>? ?? const {},
);

Map<String, dynamic> _$PrivacyPreferencesToJson(
  _PrivacyPreferences instance,
) => <String, dynamic>{
  'locationSharing': const PrivacyLevelConverter().toJson(
    instance.locationSharing,
  ),
  'activitySharing': const PrivacyLevelConverter().toJson(
    instance.activitySharing,
  ),
  'routeHistory': const PrivacyLevelConverter().toJson(instance.routeHistory),
  'visitHistory': const PrivacyLevelConverter().toJson(instance.visitHistory),
  'safetyScore': const PrivacyLevelConverter().toJson(instance.safetyScore),
  'analyticsOptIn': instance.analyticsOptIn,
  'crashReportingOptIn': instance.crashReportingOptIn,
  'personalizedContent': instance.personalizedContent,
  'allowThirdPartyTracking': instance.allowThirdPartyTracking,
  'customSettings': instance.customSettings,
};

_AccessibilityPreferences _$AccessibilityPreferencesFromJson(
  Map<String, dynamic> json,
) => _AccessibilityPreferences(
  highContrast: json['highContrast'] as bool? ?? false,
  largeText: json['largeText'] as bool? ?? false,
  reduceMotion: json['reduceMotion'] as bool? ?? false,
  screenReaderOptimized: json['screenReaderOptimized'] as bool? ?? false,
  colorBlindFriendly: json['colorBlindFriendly'] as bool? ?? false,
  textScaleFactor: (json['textScaleFactor'] as num?)?.toDouble() ?? 1.0,
  customSettings: json['customSettings'] as Map<String, dynamic>? ?? const {},
);

Map<String, dynamic> _$AccessibilityPreferencesToJson(
  _AccessibilityPreferences instance,
) => <String, dynamic>{
  'highContrast': instance.highContrast,
  'largeText': instance.largeText,
  'reduceMotion': instance.reduceMotion,
  'screenReaderOptimized': instance.screenReaderOptimized,
  'colorBlindFriendly': instance.colorBlindFriendly,
  'textScaleFactor': instance.textScaleFactor,
  'customSettings': instance.customSettings,
};

_UserPreferences _$UserPreferencesFromJson(Map<String, dynamic> json) =>
    _UserPreferences(
      userId: json['userId'] as String,
      themeMode: json['themeMode'] == null
          ? const ThemeMode.system()
          : const ThemeModeConverter().fromJson(json['themeMode'] as Object),
      language: json['language'] as String? ?? 'en',
      region: json['region'] as String? ?? 'PH',
      notifications: json['notifications'] == null
          ? const NotificationPreferences()
          : NotificationPreferences.fromJson(
              json['notifications'] as Map<String, dynamic>,
            ),
      map: json['map'] == null
          ? const MapPreferences()
          : MapPreferences.fromJson(json['map'] as Map<String, dynamic>),
      emergency: EmergencyPreferences.fromJson(
        json['emergency'] as Map<String, dynamic>,
      ),
      privacy: json['privacy'] == null
          ? const PrivacyPreferences()
          : PrivacyPreferences.fromJson(
              json['privacy'] as Map<String, dynamic>,
            ),
      accessibility: json['accessibility'] == null
          ? const AccessibilityPreferences()
          : AccessibilityPreferences.fromJson(
              json['accessibility'] as Map<String, dynamic>,
            ),
      customPreferences: json['customPreferences'] as Map<String, dynamic>?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$UserPreferencesToJson(_UserPreferences instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'themeMode': const ThemeModeConverter().toJson(instance.themeMode),
      'language': instance.language,
      'region': instance.region,
      'notifications': instance.notifications,
      'map': instance.map,
      'emergency': instance.emergency,
      'privacy': instance.privacy,
      'accessibility': instance.accessibility,
      'customPreferences': instance.customPreferences,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
