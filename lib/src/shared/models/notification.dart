/// SAFENAV CAVITE - Notification Model
///
/// In-app notification and push notification data model.
library;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

/// Notification type
enum NotificationType {
  /// Emergency alert
  @JsonValue('emergency')
  emergency,

  /// Evacuation notice
  @JsonValue('evacuation')
  evacuation,

  /// System announcement
  @JsonValue('announcement')
  announcement,

  /// Personal message
  @JsonValue('personal')
  personal,

  /// Reminder
  @JsonValue('reminder')
  reminder,

  /// Location-based alert
  @JsonValue('location_alert')
  locationAlert,

  /// Safety tip
  @JsonValue('safety_tip')
  safetyTip,

  /// Drill/test
  @JsonValue('drill')
  drill,

  /// Maintenance
  @JsonValue('maintenance')
  maintenance,

  /// Other
  @JsonValue('other')
  other;

  /// Display name
  String get displayName {
    switch (this) {
      case NotificationType.emergency:
        return 'Emergency Alert';
      case NotificationType.evacuation:
        return 'Evacuation Notice';
      case NotificationType.announcement:
        return 'Announcement';
      case NotificationType.personal:
        return 'Personal Message';
      case NotificationType.reminder:
        return 'Reminder';
      case NotificationType.locationAlert:
        return 'Location Alert';
      case NotificationType.safetyTip:
        return 'Safety Tip';
      case NotificationType.drill:
        return 'Drill/Test';
      case NotificationType.maintenance:
        return 'Maintenance';
      case NotificationType.other:
        return 'Other';
    }
  }
}

/// Notification priority
enum NotificationPriority {
  /// Low priority
  @JsonValue('low')
  low,

  /// Normal priority
  @JsonValue('normal')
  normal,

  /// High priority
  @JsonValue('high')
  high,

  /// Critical priority
  @JsonValue('critical')
  critical;

  /// Display name
  String get displayName {
    switch (this) {
      case NotificationPriority.low:
        return 'Low';
      case NotificationPriority.normal:
        return 'Normal';
      case NotificationPriority.high:
        return 'High';
      case NotificationPriority.critical:
        return 'Critical';
    }
  }

  /// Sort order (higher = more important)
  int get sortOrder {
    switch (this) {
      case NotificationPriority.low:
        return 1;
      case NotificationPriority.normal:
        return 2;
      case NotificationPriority.high:
        return 3;
      case NotificationPriority.critical:
        return 4;
    }
  }
}

/// Notification status
enum NotificationStatus {
  /// Sent but not delivered
  @JsonValue('sent')
  sent,

  /// Delivered to device
  @JsonValue('delivered')
  delivered,

  /// Opened by user
  @JsonValue('opened')
  opened,

  /// Dismissed by user
  @JsonValue('dismissed')
  dismissed,

  /// Failed to deliver
  @JsonValue('failed')
  failed;

  /// Display name
  String get displayName {
    switch (this) {
      case NotificationStatus.sent:
        return 'Sent';
      case NotificationStatus.delivered:
        return 'Delivered';
      case NotificationStatus.opened:
        return 'Opened';
      case NotificationStatus.dismissed:
        return 'Dismissed';
      case NotificationStatus.failed:
        return 'Failed';
    }
  }
}

/// Notification model
@freezed
abstract class Notification with _$Notification {
  const factory Notification({
    /// Unique notification ID
    required String id,

    /// Notification title
    required String title,

    /// Notification body/message
    required String body,

    /// Notification type
    required NotificationType type,

    /// Priority level
    @Default(NotificationPriority.normal) NotificationPriority priority,

    /// Current status
    @Default(NotificationStatus.sent) NotificationStatus status,

    /// Target user ID (null for broadcast)
    String? userId,

    /// Target role (for role-based notifications)
    String? targetRole,

    /// Target building IDs
    @Default([]) List<String> targetBuildingIds,

    /// Related alert ID (if from alert)
    String? alertId,

    /// Related location ID
    String? locationId,

    /// Action URL/deep link
    String? actionUrl,

    /// Action label
    String? actionLabel,

    /// Image URL
    String? imageUrl,

    /// Data payload
    @Default({}) Map<String, dynamic> data,

    /// Whether notification was sent via FCM
    @Default(false) bool sentViaFcm,

    /// Whether notification was shown locally
    @Default(false) bool shownLocally,

    /// Local notification ID (for cancellation)
    int? localNotificationId,

    /// Scheduled send time
    DateTime? scheduledAt,

    /// Sent timestamp
    DateTime? sentAt,

    /// Delivered timestamp
    DateTime? deliveredAt,

    /// Opened timestamp
    DateTime? openedAt,

    /// Dismissed timestamp
    DateTime? dismissedAt,

    /// Expires at
    DateTime? expiresAt,

    /// Created at
    required DateTime createdAt,

    /// Updated at
    required DateTime updatedAt,

    /// Metadata
    @Default({}) Map<String, dynamic> metadata,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);
}

extension NotificationExtensions on Notification {
  /// Checks if notification is for a specific user
  bool isForUser(String userId) => this.userId == userId;

  /// Checks if notification is a broadcast
  bool get isBroadcast => userId == null;

  /// Checks if notification has expired
  bool get isExpired {
    if (expiresAt == null) return false;
    return DateTime.now().isAfter(expiresAt!);
  }

  /// Checks if notification is actionable
  bool get isActionable => actionUrl != null && actionUrl!.isNotEmpty;

  /// Checks if notification is high priority
  bool get isHighPriority => priority.sortOrder >= 3;

  /// Creates a copy with delivered status
  Notification markDelivered() {
    return copyWith(
      status: NotificationStatus.delivered,
      deliveredAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  /// Creates a copy with opened status
  Notification markOpened() {
    return copyWith(
      status: NotificationStatus.opened,
      openedAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  /// Creates a copy with dismissed status
  Notification markDismissed() {
    return copyWith(
      status: NotificationStatus.dismissed,
      dismissedAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  /// Creates a copy with failed status
  Notification markFailed() {
    return copyWith(
      status: NotificationStatus.failed,
      updatedAt: DateTime.now(),
    );
  }

  /// Gets time since creation
  Duration get timeSinceCreated => DateTime.now().difference(createdAt);

  /// Gets display timestamp
  String get displayTime {
    final diff = timeSinceCreated;
    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inHours < 1) return '${diff.inMinutes}m ago';
    if (diff.inDays < 1) return '${diff.inHours}h ago';
    if (diff.inDays < 7) return '${diff.inDays}d ago';
    return '${createdAt.day}/${createdAt.month}/${createdAt.year}';
  }
}

/// Notification preferences for a user
@freezed
abstract class NotificationPreferences with _$NotificationPreferences {
  const factory NotificationPreferences({
    /// User ID
    required String userId,

    /// Enable push notifications
    @Default(true) bool pushEnabled,

    /// Enable emergency alerts (cannot be disabled)
    @Default(true) bool emergencyAlertsEnabled,

    /// Enable evacuation notices
    @Default(true) bool evacuationNoticesEnabled,

    /// Enable announcements
    @Default(true) bool announcementsEnabled,

    /// Enable personal messages
    @Default(true) bool personalMessagesEnabled,

    /// Enable reminders
    @Default(true) bool remindersEnabled,

    /// Enable location alerts
    @Default(true) bool locationAlertsEnabled,

    /// Enable safety tips
    @Default(true) bool safetyTipsEnabled,

    /// Enable drill notifications
    @Default(true) bool drillNotificationsEnabled,

    /// Enable maintenance notifications
    @Default(true) bool maintenanceNotificationsEnabled,

    /// Quiet hours start (24-hour format, e.g., 22 for 10 PM)
    int? quietHoursStart,

    /// Quiet hours end (24-hour format, e.g., 7 for 7 AM)
    int? quietHoursEnd,

    /// Vibration enabled
    @Default(true) bool vibrationEnabled,

    /// Sound enabled
    @Default(true) bool soundEnabled,

    /// Updated at
    required DateTime updatedAt,
  }) = _NotificationPreferences;

  factory NotificationPreferences.fromJson(Map<String, dynamic> json) =>
      _$NotificationPreferencesFromJson(json);
}

extension NotificationPreferencesExtensions on NotificationPreferences {
  /// Checks if currently in quiet hours
  bool get isInQuietHours {
    if (quietHoursStart == null || quietHoursEnd == null) return false;
    final now = DateTime.now();
    final currentHour = now.hour;

    if (quietHoursStart! < quietHoursEnd!) {
      return currentHour >= quietHoursStart! && currentHour < quietHoursEnd!;
    } else {
      // Overnight quiet hours (e.g., 22 to 7)
      return currentHour >= quietHoursStart! || currentHour < quietHoursEnd!;
    }
  }

  /// Checks if notification type is enabled
  bool isTypeEnabled(NotificationType type) {
    switch (type) {
      case NotificationType.emergency:
        return emergencyAlertsEnabled;
      case NotificationType.evacuation:
        return evacuationNoticesEnabled;
      case NotificationType.announcement:
        return announcementsEnabled;
      case NotificationType.personal:
        return personalMessagesEnabled;
      case NotificationType.reminder:
        return remindersEnabled;
      case NotificationType.locationAlert:
        return locationAlertsEnabled;
      case NotificationType.safetyTip:
        return safetyTipsEnabled;
      case NotificationType.drill:
        return drillNotificationsEnabled;
      case NotificationType.maintenance:
        return maintenanceNotificationsEnabled;
      case NotificationType.other:
        return true; // Default to enabled
    }
  }

  /// Creates default preferences for a user
  static NotificationPreferences defaults(String userId) {
    return NotificationPreferences(
      userId: userId,
      updatedAt: DateTime.now(),
    );
  }
}