/// SAFENAV CAVITE - Notification Service
///
/// Handles local notifications, FCM token management, and push notification display.
library;

import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../errors/failures.dart';
import '../errors/result.dart';

/// Service for managing notifications (local and push)
class NotificationService {
  NotificationService._();

  static final NotificationService _instance = NotificationService._();
  static NotificationService get instance => _instance;

  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications = FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;
  String? _fcmToken;

  /// Current FCM token
  String? get fcmToken => _fcmToken;

  /// Whether service is initialized
  bool get isInitialized => _isInitialized;

  /// Initializes notification service
  Future<Result<void>> initialize() async {
    if (_isInitialized) return const Success(null);

    try {
      // Request permissions
      final settings = await _fcm.requestPermission(
        alert: true,
        badge: true,
        sound: true,
        provisional: false,
        announcement: false,
        carPlay: false,
        criticalAlert: true, // For emergency alerts
      );

      if (settings.authorizationStatus == AuthorizationStatus.denied) {
        return FailureResult(PermissionFailure(
          message: 'Notification permission denied',
          code: 'NOTIFICATION_PERMISSION_DENIED',
        ));
      }

      // Initialize local notifications
      const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
      const iosInit = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        requestCriticalPermission: true,
      );
      const initSettings = InitializationSettings(
        android: androidInit,
        iOS: iosInit,
      );

      await _localNotifications.initialize(
        initSettings,
        onDidReceiveNotificationResponse: _onNotificationTapped,
        onDidReceiveBackgroundNotificationResponse: _onNotificationTapped,
      );

      // Get FCM token
      _fcmToken = await _fcm.getToken();

      // Listen for token refresh
      _fcm.onTokenRefresh.listen((token) {
        _fcmToken = token;
      });

      // Handle foreground messages
      FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

      // Handle background message taps
      FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageOpenedApp);

      // Get initial message if app opened from terminated state
      final initialMessage = await _fcm.getInitialMessage();
      if (initialMessage != null) {
        _handleMessageOpenedApp(initialMessage);
      }

      _isInitialized = true;
      return const Success(null);
    } catch (e) {
      return FailureResult(UnknownFailure(
        message: 'Failed to initialize notifications',
        code: 'NOTIFICATION_INIT_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Subscribes to a topic
  Future<Result<void>> subscribeToTopic(String topic) async {
    try {
      await _fcm.subscribeToTopic(topic);
      return const Success(null);
    } catch (e) {
      return FailureResult(UnknownFailure(
        message: 'Failed to subscribe to topic: $topic',
        code: 'TOPIC_SUBSCRIBE_FAILED',
        details: {'topic': topic, 'error': e.toString()},
      ));
    }
  }

  /// Unsubscribes from a topic
  Future<Result<void>> unsubscribeFromTopic(String topic) async {
    try {
      await _fcm.unsubscribeFromTopic(topic);
      return const Success(null);
    } catch (e) {
      return FailureResult(UnknownFailure(
        message: 'Failed to unsubscribe from topic: $topic',
        code: 'TOPIC_UNSUBSCRIBE_FAILED',
        details: {'topic': topic, 'error': e.toString()},
      ));
    }
  }

  /// Shows a local notification
  Future<Result<void>> showLocalNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
    bool playSound = true,
    bool enableVibration = true,
  }) async {
    try {
      final androidDetails = AndroidNotificationDetails(
        'safenav_emergency',
        'SafeNav Emergency Alerts',
        channelDescription: 'Critical emergency notifications for SafeNav Cavite',
        importance: Importance.max,
        priority: Priority.high,
        playSound: true,
        enableVibration: true,
        vibrationPattern: Int64List.fromList([0, 500, 200, 500]),
        category: AndroidNotificationCategory.alarm,
        visibility: NotificationVisibility.public,
        fullScreenIntent: true,
        ongoing: true,
        autoCancel: false,
      );

      const iosDetails = DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
        interruptionLevel: InterruptionLevel.critical,
        sound: 'default',
      );

      final details = NotificationDetails(
        android: androidDetails,
        iOS: iosDetails,
      );

      await _localNotifications.show(
        id,
        title,
        body,
        details,
        payload: payload,
      );

      return const Success(null);
    } catch (e) {
      return FailureResult(UnknownFailure(
        message: 'Failed to show local notification',
        code: 'LOCAL_NOTIFICATION_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Shows emergency notification (highest priority)
  Future<Result<void>> showEmergencyNotification({
    required int id,
    required String title,
    required String body,
    required String emergencyType,
    String? payload,
  }) async {
    try {
      const emergencyColor = ui.Color(0xFFB71C1C);
      final androidDetails = AndroidNotificationDetails(
        'safenav_emergency',
        'SafeNav Emergency Alerts',
        channelDescription: 'Critical emergency notifications for SafeNav Cavite',
        importance: Importance.max,
        priority: Priority.max,
        playSound: true,
        enableVibration: true,
        vibrationPattern: Int64List.fromList([0, 1000, 500, 1000, 500, 1000]),
        category: AndroidNotificationCategory.alarm,
        visibility: NotificationVisibility.public,
        fullScreenIntent: true,
        ongoing: true,
        autoCancel: false,
        color: emergencyColor,
        colorized: true,
        ledColor: emergencyColor,
        ledOnMs: 1000,
        ledOffMs: 500,
      );

      const iosDetails = DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
        interruptionLevel: InterruptionLevel.critical,
        sound: 'default',
        badgeNumber: 1,
      );

      final details = NotificationDetails(
        android: androidDetails,
        iOS: iosDetails,
      );

      await _localNotifications.show(
        id,
        title,
        body,
        details,
        payload: payload,
      );

      return const Success(null);
    } catch (e) {
      return FailureResult(UnknownFailure(
        message: 'Failed to show emergency notification',
        code: 'EMERGENCY_NOTIFICATION_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Cancels a specific notification
  Future<void> cancelNotification(int id) async {
    await _localNotifications.cancel(id);
  }

  /// Cancels all notifications
  Future<void> cancelAllNotifications() async {
    await _localNotifications.cancelAll();
  }

  /// Gets pending notifications
  Future<List<PendingNotificationRequest>> getPendingNotifications() async {
    return await _localNotifications.pendingNotificationRequests();
  }

  /// Handles foreground FCM messages
  void _handleForegroundMessage(RemoteMessage message) {
    // Show local notification for foreground messages
    final notification = message.notification;
    final data = message.data;

    if (notification != null) {
      final isEmergency = data['type'] == 'emergency' || data['priority'] == 'critical';
      if (isEmergency) {
        showEmergencyNotification(
          id: notification.hashCode,
          title: notification.title ?? 'Emergency Alert',
          body: notification.body ?? '',
          emergencyType: data['emergency_type'] ?? 'unknown',
          payload: data['payload'],
        );
      } else {
        showLocalNotification(
          id: notification.hashCode,
          title: notification.title ?? 'Notification',
          body: notification.body ?? '',
          payload: data['payload'],
        );
      }
    }
  }

  /// Handles notification tap when app is in background
  void _handleMessageOpenedApp(RemoteMessage message) {
    // Navigate based on message data
    final data = message.data;
    // ignore: unused_local_variable
    final type = data['type'];

    // Navigation logic would be handled by router
    // This is where you'd trigger navigation to emergency screen, etc.
  }

  /// Handles local notification tap
  void _onNotificationTapped(NotificationResponse response) {
    final payload = response.payload;
    if (payload != null) {
      // Handle navigation based on payload
    }
  }

  /// Disposes resources
  Future<void> dispose() async {
    await cancelAllNotifications();
    _isInitialized = false;
  }
}