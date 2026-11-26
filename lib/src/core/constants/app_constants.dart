/// SAFENAV CAVITE - Application Constants
///
/// Centralized constants for the application including API keys placeholders,
/// collection names, default values, and configuration parameters.
library;

class AppConstants {
  // Private constructor to prevent instantiation
  AppConstants._();

  // ===========================================================================
  // App Information
  // ===========================================================================
  static const String appName = 'SAFENAV CAVITE';
  static const String appVersion = '1.0.0';
  static const String appBuildNumber = '1';
  static const String packageName = 'com.earist.safenavcavite';

  // ===========================================================================
  // Firebase Configuration
  // ===========================================================================
  /// NOTE: These values must be replaced with actual Firebase project configuration
  /// after running `flutterfire configure` or manually from Firebase Console.
  static const String firebaseApiKey = 'YOUR_FIREBASE_API_KEY';
  static const String firebaseAuthDomain = 'YOUR_PROJECT_ID.firebaseapp.com';
  static const String firebaseProjectId = 'YOUR_PROJECT_ID';
  static const String firebaseStorageBucket = 'YOUR_PROJECT_ID.appspot.com';
  static const String firebaseMessagingSenderId = 'YOUR_SENDER_ID';
  static const String firebaseAppId = 'YOUR_APP_ID';
  static const String firebaseMeasurementId = 'YOUR_MEASUREMENT_ID';

  // ===========================================================================
  // Google Maps Configuration
  // ===========================================================================
  /// NOTE: Replace with actual Google Maps API key from Google Cloud Console
  static const String googleMapsApiKey = 'YOUR_GOOGLE_MAPS_API_KEY';

  /// Default camera position for EARIST Cavite Campus (approximate coordinates)
  static const double defaultCameraLat = 14.2795;
  static const double defaultCameraLng = 120.8848;
  static const double defaultCameraZoom = 17.0;

  // ===========================================================================
  // Firestore Collection Names
  // ===========================================================================
  static const String collectionUsers = 'users';
  static const String collectionLocations = 'locations';
  static const String collectionEvacuationGraph = 'evacuation_graph';
  static const String collectionAlerts = 'alerts';
  static const String collectionNotifications = 'notifications';
  static const String collectionAdminActions = 'admin_actions';

  // ===========================================================================
  // User Roles
  // ===========================================================================
  static const String roleStudent = 'student';
  static const String roleFaculty = 'faculty';
  static const String roleAdmin = 'admin';
  static const String roleSecurity = 'security';

  static const List<String> validRoles = [
    roleStudent,
    roleFaculty,
    roleAdmin,
    roleSecurity,
  ];

  static const List<String> adminRoles = [roleAdmin, roleSecurity];

  // ===========================================================================
  // Location Categories
  // ===========================================================================
  static const String categoryBuilding = 'building';
  static const String categoryOffice = 'office';
  static const String categoryFacility = 'facility';
  static const String categoryEvacuationZone = 'evacuation_zone';
  static const String categoryGuardPost = 'guard_post';
  static const String categoryClinic = 'clinic';
  static const String categoryLibrary = 'library';
  static const String categoryCanteen = 'canteen';
  static const String categoryEntrance = 'entrance';
  static const String categoryStairwell = 'stairwell';
  static const String categoryElevator = 'elevator';

  static const List<String> locationCategories = [
    categoryBuilding,
    categoryOffice,
    categoryFacility,
    categoryEvacuationZone,
    categoryGuardPost,
    categoryClinic,
    categoryLibrary,
    categoryCanteen,
    categoryEntrance,
    categoryStairwell,
    categoryElevator,
  ];

  // ===========================================================================
  // Emergency Types
  // ===========================================================================
  static const String emergencyFire = 'fire';
  static const String emergencyEarthquake = 'earthquake';
  static const String emergencyFlood = 'flood';
  static const String emergencySecurity = 'security';
  static const String emergencyMedical = 'medical';
  static const String emergencyOther = 'other';

  static const List<String> emergencyTypes = [
    emergencyFire,
    emergencyEarthquake,
    emergencyFlood,
    emergencySecurity,
    emergencyMedical,
    emergencyOther,
  ];

  // ===========================================================================
  // Alert Status
  // ===========================================================================
  static const String alertStatusActive = 'active';
  static const String alertStatusAcknowledged = 'acknowledged';
  static const String alertStatusResolved = 'resolved';
  static const String alertStatusFalseAlarm = 'false_alarm';

  static const List<String> alertStatuses = [
    alertStatusActive,
    alertStatusAcknowledged,
    alertStatusResolved,
    alertStatusFalseAlarm,
  ];

  // ===========================================================================
  // Notification Types
  // ===========================================================================
  static const String notificationTypeEmergency = 'emergency';
  static const String notificationTypeAdvisory = 'advisory';
  static const String notificationTypeDrill = 'drill';
  static const String notificationTypeInfo = 'info';

  // ===========================================================================
  // Graph Node Types
  // ===========================================================================
  static const String nodeTypeBuildingEntrance = 'building_entrance';
  static const String nodeTypeJunction = 'junction';
  static const String nodeTypeStairwell = 'stairwell';
  static const String nodeTypeElevator = 'elevator';
  static const String nodeTypeSafeZone = 'safe_zone';
  static const String nodeTypeExit = 'exit';

  // ===========================================================================
  // Default Values & Limits
  // ===========================================================================
  static const int maxSearchResults = 20;
  static const int maxRouteAlternatives = 3;
  static const int sosHoldDurationMs = 3000; // 3 seconds hold for SOS
  static const int notificationTimeoutSeconds = 30;
  static const int locationUpdateIntervalSeconds = 10;
  static const int maxOfflineCacheDays = 30;
  static const double walkingSpeedMps = 1.4; // Average walking speed in m/s
  static const double gpsAccuracyThresholdMeters = 50.0;

  // ===========================================================================
  // FCM Topics
  // ===========================================================================
  static const String fcmTopicAllUsers = 'all_users';
  static const String fcmTopicSecurity = 'security_team';
  static const String fcmTopicAdmins = 'admins';
  static const String fcmTopicBuildingPrefix = 'building_';

  // ===========================================================================
  // Shared Preferences Keys
  // ===========================================================================
  static const String prefKeyLanguage = 'app_language';
  static const String prefKeyHighContrast = 'high_contrast_mode';
  static const String prefKeyOfflineMapCached = 'offline_map_cached';
  static const String prefKeyEvacuationGraphCached = 'evacuation_graph_cached';
  static const String prefKeyLastGraphVersion = 'last_graph_version';
  static const String prefKeyUserRole = 'user_role';
  static const String prefKeyBiometricEnabled = 'biometric_enabled';
  static const String prefKeyFirstLaunch = 'first_launch';

  // ===========================================================================
  // Supported Languages
  // ===========================================================================
  static const String languageEnglish = 'en';
  static const String languageFilipino = 'fil';
  static const List<String> supportedLanguages = [languageEnglish, languageFilipino];

  // ===========================================================================
  // Error Messages
  // ===========================================================================
  static const String errorNetworkUnavailable = 'Network unavailable. Please check your connection.';
  static const String errorLocationPermissionDenied = 'Location permission is required for navigation and emergency features.';
  static const String errorGpsUnavailable = 'GPS signal unavailable. Please ensure location services are enabled.';
  static const String errorFirebaseNotInitialized = 'Firebase not initialized. Please restart the app.';
  static const String errorMapLoadFailed = 'Failed to load map. Please try again.';
  static const String errorRouteCalculationFailed = 'Unable to calculate route. Please try again.';
  static const String errorEvacuationRouteFailed = 'Unable to calculate evacuation route. Follow nearest exit signs.';
  static const String errorAuthFailed = 'Authentication failed. Please try again.';
  static const String errorSessionExpired = 'Your session has expired. Please log in again.';
  static const String errorUnknown = 'An unexpected error occurred. Please try again.';

  // ===========================================================================
  // Success Messages
  // ===========================================================================
  static const String successSosSent = 'SOS alert sent to campus security. Help is on the way.';
  static const String successRouteCalculated = 'Route calculated successfully.';
  static const String successEvacuationRouteReady = 'Evacuation route displayed. Follow the path to safety.';
  static const String successProfileUpdated = 'Profile updated successfully.';
  static const String successNotificationSent = 'Emergency notification broadcasted to all users.';

  // ===========================================================================
  // Feature Flags (for gradual rollout)
  // ===========================================================================
  static const bool featureVoiceGuidance = true;
  static const bool featureOfflineMode = true;
  static const bool featureMultiFloor = true;
  static const bool featureBiometricAuth = false; // Requires additional setup
  static const bool featureQrCheckpoints = false; // Future enhancement
  static const bool featureMeshNetworking = false; // Future enhancement
}