/// SAFENAV CAVITE - Firebase Initialization
///
/// Handles Firebase Core initialization and app-level setup.
library;

import 'dart:async';
import 'dart:io';

import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:safenav_cavite/firebase_options.dart';
import '../services/offline_alert_queue.dart';

/// Firebase initialization provider
final firebaseInitProvider = FutureProvider<void>((ref) async {
  debugPrint('[FIREBASE] firebaseInitProvider: Starting Firebase initialization...');
  await FirebaseInitialize.initialize();
  debugPrint('[FIREBASE] firebaseInitProvider: Firebase initialization completed');
});

/// Service for initializing Firebase
class FirebaseInitialize {
  static bool _isInitialized = false;

  /// Whether Firebase has been initialized
  static bool get isInitialized => _isInitialized;

  /// Initializes Firebase Core
  static Future<void> initialize() async {
    if (_isInitialized) {
      debugPrint('[FIREBASE] FirebaseInitialize.initialize: Already initialized, skipping');
      return;
    }

    debugPrint('[FIREBASE] FirebaseInitialize.initialize: Starting Firebase.initializeApp()...');
    try {
      // Initialize Firebase with platform-specific options
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ).timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          debugPrint('[FIREBASE] FirebaseInitialize.initialize: TIMEOUT after 30 seconds!');
          throw TimeoutException('Firebase initialization timed out after 30 seconds');
        },
      );

      debugPrint('[FIREBASE] FirebaseInitialize.initialize: Firebase.initializeApp() completed successfully');

      // Capture uncaught Flutter and platform errors in Crashlytics
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
      PlatformDispatcher.instance.onError = (error, stack) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        return true;
      };

      // Initialize Firebase App Check for abuse protection on callable functions
      await _initializeAppCheck();

      // Initialize the offline alert queue so queued alerts/actions sync when online
      await OfflineAlertQueue.instance.initialize();

      // Enable debug logging in debug mode
      if (kDebugMode) {
        debugPrint('[FIREBASE] FirebaseInitialize.initialize: Debug mode enabled');
        // Firebase logging would be enabled here if needed
      }

      _isInitialized = true;
      debugPrint('[FIREBASE] FirebaseInitialize.initialize: Initialization complete, _isInitialized = true');
    } catch (e) {
      // Log error but don't crash - app can work offline
      debugPrint('[FIREBASE] FirebaseInitialize.initialize: ERROR - $e');
      rethrow;
    }
  }

  /// Initializes Firebase App Check for abuse protection on callable functions.
  ///
  /// Debug builds use debug providers (debug tokens must be registered in the
  /// Firebase Console). Release builds use production providers:
  ///   - Android: Play Integrity
  ///   - iOS: App Attest
  ///   - Web: reCAPTCHA v3 (requires a site key in Firebase Console)
  static Future<void> _initializeAppCheck() async {
    try {
      if (kIsWeb) {
        await FirebaseAppCheck.instance.activate(
          providerWeb: ReCaptchaV3Provider('recaptcha-v3-site-key'),
        );
      } else if (Platform.isAndroid) {
        await FirebaseAppCheck.instance.activate(
          providerAndroid:
              kDebugMode ? const AndroidDebugProvider() : const AndroidPlayIntegrityProvider(),
        );
      } else if (Platform.isIOS) {
        await FirebaseAppCheck.instance.activate(
          providerApple: kDebugMode ? const AppleDeviceCheckProvider() : const AppleAppAttestProvider(),
        );
      }
      debugPrint('[FIREBASE] App Check initialized');
    } catch (e) {
      // Don't crash - App Check can be configured in the Firebase Console.
      debugPrint('[FIREBASE] App Check initialization warning: $e');
    }
  }

  /// Resets initialization state (for testing)
  static void reset() {
    _isInitialized = false;
  }
}

/// Firebase configuration constants
class FirebaseConfig {
  FirebaseConfig._();

  /// Firestore collection names
  static const String usersCollection = 'users';
  static const String locationsCollection = 'locations';
  static const String evacuationGraphsCollection = 'evacuation_graphs';
  static const String alertsCollection = 'alerts';
  static const String notificationsCollection = 'notifications';
  static const String settingsCollection = 'settings';
  static const String analyticsCollection = 'analytics';

  /// Storage paths
  static const String userPhotosPath = 'user_photos';
  static const String locationImagesPath = 'location_images';
  static const String evacuationMapsPath = 'evacuation_maps';
  static const String alertAttachmentsPath = 'alert_attachments';

  /// FCM Topics
  static const String topicAllUsers = 'all_users';
  static const String topicStudents = 'students';
  static const String topicFaculty = 'faculty';
  static const String topicSecurity = 'security';
  static const String topicAdmins = 'admins';
  static const String topicEmergency = 'emergency';

  /// Builds topic name for a specific building
  static String buildingTopic(String buildingId) => 'building_$buildingId';

  /// Builds topic name for a specific user
  static String userTopic(String userId) => 'user_$userId';

  /// Default cache settings
  static const Duration firestoreCacheDuration = Duration(hours: 24);
  static const int firestoreCacheSizeBytes = 50 * 1024 * 1024; // 50 MB
}