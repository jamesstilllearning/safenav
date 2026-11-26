/// SAFENAV CAVITE - FCM Service
///
/// Handles Firebase Cloud Messaging for emergency alerts and notifications.
library;

import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../errors/result.dart' show Result, Success, FailureResult;
import '../errors/failures.dart';

/// FCM service for handling push notifications
class FCMService {
  FCMService._internal();
  static final FCMService _instance = FCMService._internal();
  static FCMService get instance => _instance;

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;
  Function(RemoteMessage)? _onMessageHandler;
  Function(RemoteMessage)? _onBackgroundHandler;

  /// Initialize FCM service
  Future<Result<void>> initialize() async {
    if (_isInitialized) return Success(null);

    try {
      // Request permission
      final settings = await _messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
        provisional: false,
      );

      if (settings.authorizationStatus == AuthorizationStatus.denied) {
        return FailureResult(
          FCMPermissionDeniedFailure(message: 'Notification permission denied'),
        );
      }

      // Register and receive the FCM token through the current SDK API
      _messaging.onRegistered.listen((_) {
        debugPrint('[FCM] FCM token registered');
      });
      await _messaging.register();

      // Initialize local notifications
      await _initializeLocalNotifications();

      // Set up message handlers
      _setupMessageHandlers();

      _isInitialized = true;
      return Success(null);
    } catch (e) {
      return FailureResult(FCMInitializationFailure(message: e.toString()));
    }
  }

  /// Initialize local notifications plugin
  Future<void> _initializeLocalNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
        );

    const InitializationSettings initializationSettings =
        InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsDarwin,
        );

    await _localNotifications.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _onNotificationTap,
    );

    // Create notification channels for Android
    await _createNotificationChannels();
  }

  /// Create notification channels for different priority levels
  Future<void> _createNotificationChannels() async {
    const emergencyChannel = AndroidNotificationChannel(
      'emergency_alerts',
      'Emergency Alerts',
      description: 'Critical emergency notifications and evacuation orders',
      importance: Importance.max,
      playSound: true,
      enableVibration: true,
      enableLights: true,
    );

    const warningChannel = AndroidNotificationChannel(
      'warning_alerts',
      'Warning Alerts',
      description: 'Important warnings and safety notifications',
      importance: Importance.high,
      playSound: true,
      enableVibration: true,
    );

    const infoChannel = AndroidNotificationChannel(
      'info_alerts',
      'Information Alerts',
      description: 'General information and updates',
      importance: Importance.defaultImportance,
      playSound: false,
      enableVibration: false,
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(emergencyChannel);

    await _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(warningChannel);

    await _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(infoChannel);
  }

  /// Set up FCM message handlers
  void _setupMessageHandlers() {
    // Foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _handleForegroundMessage(message);
    });

    // Background messages - handled by background handler
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // When app is opened from terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        _handleBackgroundMessage(message);
      }
    });
  }

  /// Handle foreground message
  Future<void> _handleForegroundMessage(RemoteMessage message) async {
    debugPrint('[FCM] Foreground message received: ${message.messageId}');

    // Show local notification
    await _showLocalNotification(message);

    // Call custom handler if set
    if (_onMessageHandler != null) {
      _onMessageHandler!(message);
    }
  }

  /// Handle background/terminated message
  void _handleBackgroundMessage(RemoteMessage message) {
    debugPrint('[FCM] Background message received: ${message.messageId}');

    if (_onBackgroundHandler != null) {
      _onBackgroundHandler!(message);
    }
  }

  /// Background message handler (must be top-level function)
  @pragma('vm:entry-point')
  static Future<void> _firebaseMessagingBackgroundHandler(
    RemoteMessage message,
  ) async {
    debugPrint('[FCM] Background handler: ${message.messageId}');
    // Background processing here
    // Note: UI operations not allowed in background handler
  }

  /// Show local notification based on message data
  Future<void> _showLocalNotification(RemoteMessage message) async {
    final notification = message.notification;
    final data = message.data;

    // Determine notification type
    final type = data['type'] ?? 'info';
    final channelId = _getChannelId(type);
    final importance = _getImportance(type);
    final priority = _getPriority(type);

    final androidDetails = AndroidNotificationDetails(
      channelId,
      _getChannelName(type),
      channelDescription: _getChannelDescription(type),
      importance: importance,
      priority: priority,
      playSound: type != 'info',
      enableVibration: type != 'info',
      icon: '@mipmap/ic_launcher',
      color: Color(_getNotificationColor(type)),
      styleInformation: BigTextStyleInformation(
        notification?.body ?? data['body'] ?? 'New notification',
        htmlFormatBigText: true,
        contentTitle: notification?.title ?? data['title'] ?? 'SAFENAV Alert',
        htmlFormatContentTitle: true,
      ),
    );

    final iOSDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: type != 'info',
      categoryIdentifier: type,
    );

    final details = NotificationDetails(
      android: androidDetails,
      iOS: iOSDetails,
    );

    await _localNotifications.show(
      message.hashCode,
      notification?.title ?? data['title'] ?? 'SAFENAV Alert',
      notification?.body ?? data['body'] ?? 'New notification',
      details,
      payload: message.data['payload'],
    );
  }

  String _getChannelId(String type) {
    switch (type) {
      case 'emergency':
        return 'emergency_alerts';
      case 'warning':
        return 'warning_alerts';
      default:
        return 'info_alerts';
    }
  }

  String _getChannelName(String type) {
    switch (type) {
      case 'emergency':
        return 'Emergency Alerts';
      case 'warning':
        return 'Warning Alerts';
      default:
        return 'Information Alerts';
    }
  }

  String _getChannelDescription(String type) {
    switch (type) {
      case 'emergency':
        return 'Critical emergency notifications and evacuation orders';
      case 'warning':
        return 'Important warnings and safety notifications';
      default:
        return 'General information and updates';
    }
  }

  Importance _getImportance(String type) {
    switch (type) {
      case 'emergency':
        return Importance.max;
      case 'warning':
        return Importance.high;
      default:
        return Importance.defaultImportance;
    }
  }

  Priority _getPriority(String type) {
    switch (type) {
      case 'emergency':
        return Priority.max;
      case 'warning':
        return Priority.high;
      default:
        return Priority.defaultPriority;
    }
  }

  int _getNotificationColor(String type) {
    switch (type) {
      case 'emergency':
        return 0xFFF44336; // Red
      case 'warning':
        return 0xFFFF9800; // Orange
      default:
        return 0xFF2196F3; // Blue
    }
  }

  /// Handle notification tap
  void _onNotificationTap(NotificationResponse response) {
    debugPrint('[FCM] Notification tapped');
    // Handle deep linking based on payload
    if (response.payload != null) {
      // Navigate to specific screen based on payload
    }
  }

  /// Set custom message handler for foreground messages
  void setOnMessageHandler(Function(RemoteMessage) handler) {
    _onMessageHandler = handler;
  }

  /// Set custom background message handler
  void setOnBackgroundHandler(Function(RemoteMessage) handler) {
    _onBackgroundHandler = handler;
  }

  /// Get FCM token
  Future<String?> getToken() async {
    final tokenFuture = _messaging.onRegistered.first.timeout(
      const Duration(seconds: 10),
      onTimeout: () => throw TimeoutException(
        'Timed out while registering for Firebase Cloud Messaging',
      ),
    );
    await _messaging.register();
    return tokenFuture;
  }

  /// Subscribe to topic
  Future<void> subscribeToTopic(String topic) async {
    await _messaging.subscribeToTopic(topic);
  }

  /// Unsubscribe from topic
  Future<void> unsubscribeFromTopic(String topic) async {
    await _messaging.unsubscribeFromTopic(topic);
  }

  /// Dispose resources
  void dispose() {
    _isInitialized = false;
  }
}

/// FCM failures
class FCMPermissionDeniedFailure extends Failure {
  const FCMPermissionDeniedFailure({
    required super.message,
    super.code,
    super.details,
  });
}

class FCMInitializationFailure extends Failure {
  const FCMInitializationFailure({
    required super.message,
    super.code,
    super.details,
  });
}
