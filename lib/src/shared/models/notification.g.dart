// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Notification _$NotificationFromJson(Map<String, dynamic> json) =>
    _Notification(
      id: json['id'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
      priority: $enumDecodeNullable(
              _$NotificationPriorityEnumMap, json['priority']) ??
          NotificationPriority.normal,
      status:
          $enumDecodeNullable(_$NotificationStatusEnumMap, json['status']) ??
              NotificationStatus.sent,
      userId: json['userId'] as String?,
      targetRole: json['targetRole'] as String?,
      targetBuildingIds: (json['targetBuildingIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      alertId: json['alertId'] as String?,
      locationId: json['locationId'] as String?,
      actionUrl: json['actionUrl'] as String?,
      actionLabel: json['actionLabel'] as String?,
      imageUrl: json['imageUrl'] as String?,
      data: json['data'] as Map<String, dynamic>? ?? const {},
      sentViaFcm: json['sentViaFcm'] as bool? ?? false,
      shownLocally: json['shownLocally'] as bool? ?? false,
      localNotificationId: (json['localNotificationId'] as num?)?.toInt(),
      scheduledAt: json['scheduledAt'] == null
          ? null
          : DateTime.parse(json['scheduledAt'] as String),
      sentAt: json['sentAt'] == null
          ? null
          : DateTime.parse(json['sentAt'] as String),
      deliveredAt: json['deliveredAt'] == null
          ? null
          : DateTime.parse(json['deliveredAt'] as String),
      openedAt: json['openedAt'] == null
          ? null
          : DateTime.parse(json['openedAt'] as String),
      dismissedAt: json['dismissedAt'] == null
          ? null
          : DateTime.parse(json['dismissedAt'] as String),
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$NotificationToJson(_Notification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'type': _$NotificationTypeEnumMap[instance.type]!,
      'priority': _$NotificationPriorityEnumMap[instance.priority]!,
      'status': _$NotificationStatusEnumMap[instance.status]!,
      'userId': instance.userId,
      'targetRole': instance.targetRole,
      'targetBuildingIds': instance.targetBuildingIds,
      'alertId': instance.alertId,
      'locationId': instance.locationId,
      'actionUrl': instance.actionUrl,
      'actionLabel': instance.actionLabel,
      'imageUrl': instance.imageUrl,
      'data': instance.data,
      'sentViaFcm': instance.sentViaFcm,
      'shownLocally': instance.shownLocally,
      'localNotificationId': instance.localNotificationId,
      'scheduledAt': instance.scheduledAt?.toIso8601String(),
      'sentAt': instance.sentAt?.toIso8601String(),
      'deliveredAt': instance.deliveredAt?.toIso8601String(),
      'openedAt': instance.openedAt?.toIso8601String(),
      'dismissedAt': instance.dismissedAt?.toIso8601String(),
      'expiresAt': instance.expiresAt?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'metadata': instance.metadata,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.emergency: 'emergency',
  NotificationType.evacuation: 'evacuation',
  NotificationType.announcement: 'announcement',
  NotificationType.personal: 'personal',
  NotificationType.reminder: 'reminder',
  NotificationType.locationAlert: 'location_alert',
  NotificationType.safetyTip: 'safety_tip',
  NotificationType.drill: 'drill',
  NotificationType.maintenance: 'maintenance',
  NotificationType.other: 'other',
};

const _$NotificationPriorityEnumMap = {
  NotificationPriority.low: 'low',
  NotificationPriority.normal: 'normal',
  NotificationPriority.high: 'high',
  NotificationPriority.critical: 'critical',
};

const _$NotificationStatusEnumMap = {
  NotificationStatus.sent: 'sent',
  NotificationStatus.delivered: 'delivered',
  NotificationStatus.opened: 'opened',
  NotificationStatus.dismissed: 'dismissed',
  NotificationStatus.failed: 'failed',
};

_NotificationPreferences _$NotificationPreferencesFromJson(
        Map<String, dynamic> json) =>
    _NotificationPreferences(
      userId: json['userId'] as String,
      pushEnabled: json['pushEnabled'] as bool? ?? true,
      emergencyAlertsEnabled: json['emergencyAlertsEnabled'] as bool? ?? true,
      evacuationNoticesEnabled:
          json['evacuationNoticesEnabled'] as bool? ?? true,
      announcementsEnabled: json['announcementsEnabled'] as bool? ?? true,
      personalMessagesEnabled: json['personalMessagesEnabled'] as bool? ?? true,
      remindersEnabled: json['remindersEnabled'] as bool? ?? true,
      locationAlertsEnabled: json['locationAlertsEnabled'] as bool? ?? true,
      safetyTipsEnabled: json['safetyTipsEnabled'] as bool? ?? true,
      drillNotificationsEnabled:
          json['drillNotificationsEnabled'] as bool? ?? true,
      maintenanceNotificationsEnabled:
          json['maintenanceNotificationsEnabled'] as bool? ?? true,
      quietHoursStart: (json['quietHoursStart'] as num?)?.toInt(),
      quietHoursEnd: (json['quietHoursEnd'] as num?)?.toInt(),
      vibrationEnabled: json['vibrationEnabled'] as bool? ?? true,
      soundEnabled: json['soundEnabled'] as bool? ?? true,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$NotificationPreferencesToJson(
        _NotificationPreferences instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'pushEnabled': instance.pushEnabled,
      'emergencyAlertsEnabled': instance.emergencyAlertsEnabled,
      'evacuationNoticesEnabled': instance.evacuationNoticesEnabled,
      'announcementsEnabled': instance.announcementsEnabled,
      'personalMessagesEnabled': instance.personalMessagesEnabled,
      'remindersEnabled': instance.remindersEnabled,
      'locationAlertsEnabled': instance.locationAlertsEnabled,
      'safetyTipsEnabled': instance.safetyTipsEnabled,
      'drillNotificationsEnabled': instance.drillNotificationsEnabled,
      'maintenanceNotificationsEnabled':
          instance.maintenanceNotificationsEnabled,
      'quietHoursStart': instance.quietHoursStart,
      'quietHoursEnd': instance.quietHoursEnd,
      'vibrationEnabled': instance.vibrationEnabled,
      'soundEnabled': instance.soundEnabled,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
