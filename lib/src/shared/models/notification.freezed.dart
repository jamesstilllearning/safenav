// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return _Notification.fromJson(json);
}

/// @nodoc
mixin _$Notification {
  /// Unique notification ID
  String get id => throw _privateConstructorUsedError;

  /// Notification title
  String get title => throw _privateConstructorUsedError;

  /// Notification body/message
  String get body => throw _privateConstructorUsedError;

  /// Notification type
  NotificationType get type => throw _privateConstructorUsedError;

  /// Priority level
  NotificationPriority get priority => throw _privateConstructorUsedError;

  /// Current status
  NotificationStatus get status => throw _privateConstructorUsedError;

  /// Target user ID (null for broadcast)
  String? get userId => throw _privateConstructorUsedError;

  /// Target role (for role-based notifications)
  String? get targetRole => throw _privateConstructorUsedError;

  /// Target building IDs
  List<String> get targetBuildingIds => throw _privateConstructorUsedError;

  /// Related alert ID (if from alert)
  String? get alertId => throw _privateConstructorUsedError;

  /// Related location ID
  String? get locationId => throw _privateConstructorUsedError;

  /// Action URL/deep link
  String? get actionUrl => throw _privateConstructorUsedError;

  /// Action label
  String? get actionLabel => throw _privateConstructorUsedError;

  /// Image URL
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Data payload
  Map<String, dynamic> get data => throw _privateConstructorUsedError;

  /// Whether notification was sent via FCM
  bool get sentViaFcm => throw _privateConstructorUsedError;

  /// Whether notification was shown locally
  bool get shownLocally => throw _privateConstructorUsedError;

  /// Local notification ID (for cancellation)
  int? get localNotificationId => throw _privateConstructorUsedError;

  /// Scheduled send time
  DateTime? get scheduledAt => throw _privateConstructorUsedError;

  /// Sent timestamp
  DateTime? get sentAt => throw _privateConstructorUsedError;

  /// Delivered timestamp
  DateTime? get deliveredAt => throw _privateConstructorUsedError;

  /// Opened timestamp
  DateTime? get openedAt => throw _privateConstructorUsedError;

  /// Dismissed timestamp
  DateTime? get dismissedAt => throw _privateConstructorUsedError;

  /// Expires at
  DateTime? get expiresAt => throw _privateConstructorUsedError;

  /// Created at
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Updated at
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Metadata
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationCopyWith<Notification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationCopyWith<$Res> {
  factory $NotificationCopyWith(
          Notification value, $Res Function(Notification) then) =
      _$NotificationCopyWithImpl<$Res, Notification>;
  @useResult
  $Res call(
      {String id,
      String title,
      String body,
      NotificationType type,
      NotificationPriority priority,
      NotificationStatus status,
      String? userId,
      String? targetRole,
      List<String> targetBuildingIds,
      String? alertId,
      String? locationId,
      String? actionUrl,
      String? actionLabel,
      String? imageUrl,
      Map<String, dynamic> data,
      bool sentViaFcm,
      bool shownLocally,
      int? localNotificationId,
      DateTime? scheduledAt,
      DateTime? sentAt,
      DateTime? deliveredAt,
      DateTime? openedAt,
      DateTime? dismissedAt,
      DateTime? expiresAt,
      DateTime createdAt,
      DateTime updatedAt,
      Map<String, dynamic> metadata});
}

/// @nodoc
class _$NotificationCopyWithImpl<$Res, $Val extends Notification>
    implements $NotificationCopyWith<$Res> {
  _$NotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? body = null,
    Object? type = null,
    Object? priority = null,
    Object? status = null,
    Object? userId = freezed,
    Object? targetRole = freezed,
    Object? targetBuildingIds = null,
    Object? alertId = freezed,
    Object? locationId = freezed,
    Object? actionUrl = freezed,
    Object? actionLabel = freezed,
    Object? imageUrl = freezed,
    Object? data = null,
    Object? sentViaFcm = null,
    Object? shownLocally = null,
    Object? localNotificationId = freezed,
    Object? scheduledAt = freezed,
    Object? sentAt = freezed,
    Object? deliveredAt = freezed,
    Object? openedAt = freezed,
    Object? dismissedAt = freezed,
    Object? expiresAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? metadata = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as NotificationPriority,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as NotificationStatus,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      targetRole: freezed == targetRole
          ? _value.targetRole
          : targetRole // ignore: cast_nullable_to_non_nullable
              as String?,
      targetBuildingIds: null == targetBuildingIds
          ? _value.targetBuildingIds
          : targetBuildingIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      alertId: freezed == alertId
          ? _value.alertId
          : alertId // ignore: cast_nullable_to_non_nullable
              as String?,
      locationId: freezed == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String?,
      actionUrl: freezed == actionUrl
          ? _value.actionUrl
          : actionUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      actionLabel: freezed == actionLabel
          ? _value.actionLabel
          : actionLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      sentViaFcm: null == sentViaFcm
          ? _value.sentViaFcm
          : sentViaFcm // ignore: cast_nullable_to_non_nullable
              as bool,
      shownLocally: null == shownLocally
          ? _value.shownLocally
          : shownLocally // ignore: cast_nullable_to_non_nullable
              as bool,
      localNotificationId: freezed == localNotificationId
          ? _value.localNotificationId
          : localNotificationId // ignore: cast_nullable_to_non_nullable
              as int?,
      scheduledAt: freezed == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sentAt: freezed == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveredAt: freezed == deliveredAt
          ? _value.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      openedAt: freezed == openedAt
          ? _value.openedAt
          : openedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dismissedAt: freezed == dismissedAt
          ? _value.dismissedAt
          : dismissedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationImplCopyWith<$Res>
    implements $NotificationCopyWith<$Res> {
  factory _$$NotificationImplCopyWith(
          _$NotificationImpl value, $Res Function(_$NotificationImpl) then) =
      __$$NotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String body,
      NotificationType type,
      NotificationPriority priority,
      NotificationStatus status,
      String? userId,
      String? targetRole,
      List<String> targetBuildingIds,
      String? alertId,
      String? locationId,
      String? actionUrl,
      String? actionLabel,
      String? imageUrl,
      Map<String, dynamic> data,
      bool sentViaFcm,
      bool shownLocally,
      int? localNotificationId,
      DateTime? scheduledAt,
      DateTime? sentAt,
      DateTime? deliveredAt,
      DateTime? openedAt,
      DateTime? dismissedAt,
      DateTime? expiresAt,
      DateTime createdAt,
      DateTime updatedAt,
      Map<String, dynamic> metadata});
}

/// @nodoc
class __$$NotificationImplCopyWithImpl<$Res>
    extends _$NotificationCopyWithImpl<$Res, _$NotificationImpl>
    implements _$$NotificationImplCopyWith<$Res> {
  __$$NotificationImplCopyWithImpl(
      _$NotificationImpl _value, $Res Function(_$NotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? body = null,
    Object? type = null,
    Object? priority = null,
    Object? status = null,
    Object? userId = freezed,
    Object? targetRole = freezed,
    Object? targetBuildingIds = null,
    Object? alertId = freezed,
    Object? locationId = freezed,
    Object? actionUrl = freezed,
    Object? actionLabel = freezed,
    Object? imageUrl = freezed,
    Object? data = null,
    Object? sentViaFcm = null,
    Object? shownLocally = null,
    Object? localNotificationId = freezed,
    Object? scheduledAt = freezed,
    Object? sentAt = freezed,
    Object? deliveredAt = freezed,
    Object? openedAt = freezed,
    Object? dismissedAt = freezed,
    Object? expiresAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? metadata = null,
  }) {
    return _then(_$NotificationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as NotificationPriority,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as NotificationStatus,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      targetRole: freezed == targetRole
          ? _value.targetRole
          : targetRole // ignore: cast_nullable_to_non_nullable
              as String?,
      targetBuildingIds: null == targetBuildingIds
          ? _value._targetBuildingIds
          : targetBuildingIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      alertId: freezed == alertId
          ? _value.alertId
          : alertId // ignore: cast_nullable_to_non_nullable
              as String?,
      locationId: freezed == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String?,
      actionUrl: freezed == actionUrl
          ? _value.actionUrl
          : actionUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      actionLabel: freezed == actionLabel
          ? _value.actionLabel
          : actionLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      sentViaFcm: null == sentViaFcm
          ? _value.sentViaFcm
          : sentViaFcm // ignore: cast_nullable_to_non_nullable
              as bool,
      shownLocally: null == shownLocally
          ? _value.shownLocally
          : shownLocally // ignore: cast_nullable_to_non_nullable
              as bool,
      localNotificationId: freezed == localNotificationId
          ? _value.localNotificationId
          : localNotificationId // ignore: cast_nullable_to_non_nullable
              as int?,
      scheduledAt: freezed == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sentAt: freezed == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveredAt: freezed == deliveredAt
          ? _value.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      openedAt: freezed == openedAt
          ? _value.openedAt
          : openedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dismissedAt: freezed == dismissedAt
          ? _value.dismissedAt
          : dismissedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationImpl implements _Notification {
  const _$NotificationImpl(
      {required this.id,
      required this.title,
      required this.body,
      required this.type,
      this.priority = NotificationPriority.normal,
      this.status = NotificationStatus.sent,
      this.userId,
      this.targetRole,
      final List<String> targetBuildingIds = const [],
      this.alertId,
      this.locationId,
      this.actionUrl,
      this.actionLabel,
      this.imageUrl,
      final Map<String, dynamic> data = const {},
      this.sentViaFcm = false,
      this.shownLocally = false,
      this.localNotificationId,
      this.scheduledAt,
      this.sentAt,
      this.deliveredAt,
      this.openedAt,
      this.dismissedAt,
      this.expiresAt,
      required this.createdAt,
      required this.updatedAt,
      final Map<String, dynamic> metadata = const {}})
      : _targetBuildingIds = targetBuildingIds,
        _data = data,
        _metadata = metadata;

  factory _$NotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationImplFromJson(json);

  /// Unique notification ID
  @override
  final String id;

  /// Notification title
  @override
  final String title;

  /// Notification body/message
  @override
  final String body;

  /// Notification type
  @override
  final NotificationType type;

  /// Priority level
  @override
  @JsonKey()
  final NotificationPriority priority;

  /// Current status
  @override
  @JsonKey()
  final NotificationStatus status;

  /// Target user ID (null for broadcast)
  @override
  final String? userId;

  /// Target role (for role-based notifications)
  @override
  final String? targetRole;

  /// Target building IDs
  final List<String> _targetBuildingIds;

  /// Target building IDs
  @override
  @JsonKey()
  List<String> get targetBuildingIds {
    if (_targetBuildingIds is EqualUnmodifiableListView)
      return _targetBuildingIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_targetBuildingIds);
  }

  /// Related alert ID (if from alert)
  @override
  final String? alertId;

  /// Related location ID
  @override
  final String? locationId;

  /// Action URL/deep link
  @override
  final String? actionUrl;

  /// Action label
  @override
  final String? actionLabel;

  /// Image URL
  @override
  final String? imageUrl;

  /// Data payload
  final Map<String, dynamic> _data;

  /// Data payload
  @override
  @JsonKey()
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  /// Whether notification was sent via FCM
  @override
  @JsonKey()
  final bool sentViaFcm;

  /// Whether notification was shown locally
  @override
  @JsonKey()
  final bool shownLocally;

  /// Local notification ID (for cancellation)
  @override
  final int? localNotificationId;

  /// Scheduled send time
  @override
  final DateTime? scheduledAt;

  /// Sent timestamp
  @override
  final DateTime? sentAt;

  /// Delivered timestamp
  @override
  final DateTime? deliveredAt;

  /// Opened timestamp
  @override
  final DateTime? openedAt;

  /// Dismissed timestamp
  @override
  final DateTime? dismissedAt;

  /// Expires at
  @override
  final DateTime? expiresAt;

  /// Created at
  @override
  final DateTime createdAt;

  /// Updated at
  @override
  final DateTime updatedAt;

  /// Metadata
  final Map<String, dynamic> _metadata;

  /// Metadata
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  String toString() {
    return 'Notification(id: $id, title: $title, body: $body, type: $type, priority: $priority, status: $status, userId: $userId, targetRole: $targetRole, targetBuildingIds: $targetBuildingIds, alertId: $alertId, locationId: $locationId, actionUrl: $actionUrl, actionLabel: $actionLabel, imageUrl: $imageUrl, data: $data, sentViaFcm: $sentViaFcm, shownLocally: $shownLocally, localNotificationId: $localNotificationId, scheduledAt: $scheduledAt, sentAt: $sentAt, deliveredAt: $deliveredAt, openedAt: $openedAt, dismissedAt: $dismissedAt, expiresAt: $expiresAt, createdAt: $createdAt, updatedAt: $updatedAt, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.targetRole, targetRole) ||
                other.targetRole == targetRole) &&
            const DeepCollectionEquality()
                .equals(other._targetBuildingIds, _targetBuildingIds) &&
            (identical(other.alertId, alertId) || other.alertId == alertId) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.actionUrl, actionUrl) ||
                other.actionUrl == actionUrl) &&
            (identical(other.actionLabel, actionLabel) ||
                other.actionLabel == actionLabel) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.sentViaFcm, sentViaFcm) ||
                other.sentViaFcm == sentViaFcm) &&
            (identical(other.shownLocally, shownLocally) ||
                other.shownLocally == shownLocally) &&
            (identical(other.localNotificationId, localNotificationId) ||
                other.localNotificationId == localNotificationId) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.deliveredAt, deliveredAt) ||
                other.deliveredAt == deliveredAt) &&
            (identical(other.openedAt, openedAt) ||
                other.openedAt == openedAt) &&
            (identical(other.dismissedAt, dismissedAt) ||
                other.dismissedAt == dismissedAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        title,
        body,
        type,
        priority,
        status,
        userId,
        targetRole,
        const DeepCollectionEquality().hash(_targetBuildingIds),
        alertId,
        locationId,
        actionUrl,
        actionLabel,
        imageUrl,
        const DeepCollectionEquality().hash(_data),
        sentViaFcm,
        shownLocally,
        localNotificationId,
        scheduledAt,
        sentAt,
        deliveredAt,
        openedAt,
        dismissedAt,
        expiresAt,
        createdAt,
        updatedAt,
        const DeepCollectionEquality().hash(_metadata)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationImplCopyWith<_$NotificationImpl> get copyWith =>
      __$$NotificationImplCopyWithImpl<_$NotificationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationImplToJson(
      this,
    );
  }
}

abstract class _Notification implements Notification {
  const factory _Notification(
      {required final String id,
      required final String title,
      required final String body,
      required final NotificationType type,
      final NotificationPriority priority,
      final NotificationStatus status,
      final String? userId,
      final String? targetRole,
      final List<String> targetBuildingIds,
      final String? alertId,
      final String? locationId,
      final String? actionUrl,
      final String? actionLabel,
      final String? imageUrl,
      final Map<String, dynamic> data,
      final bool sentViaFcm,
      final bool shownLocally,
      final int? localNotificationId,
      final DateTime? scheduledAt,
      final DateTime? sentAt,
      final DateTime? deliveredAt,
      final DateTime? openedAt,
      final DateTime? dismissedAt,
      final DateTime? expiresAt,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final Map<String, dynamic> metadata}) = _$NotificationImpl;

  factory _Notification.fromJson(Map<String, dynamic> json) =
      _$NotificationImpl.fromJson;

  @override

  /// Unique notification ID
  String get id;
  @override

  /// Notification title
  String get title;
  @override

  /// Notification body/message
  String get body;
  @override

  /// Notification type
  NotificationType get type;
  @override

  /// Priority level
  NotificationPriority get priority;
  @override

  /// Current status
  NotificationStatus get status;
  @override

  /// Target user ID (null for broadcast)
  String? get userId;
  @override

  /// Target role (for role-based notifications)
  String? get targetRole;
  @override

  /// Target building IDs
  List<String> get targetBuildingIds;
  @override

  /// Related alert ID (if from alert)
  String? get alertId;
  @override

  /// Related location ID
  String? get locationId;
  @override

  /// Action URL/deep link
  String? get actionUrl;
  @override

  /// Action label
  String? get actionLabel;
  @override

  /// Image URL
  String? get imageUrl;
  @override

  /// Data payload
  Map<String, dynamic> get data;
  @override

  /// Whether notification was sent via FCM
  bool get sentViaFcm;
  @override

  /// Whether notification was shown locally
  bool get shownLocally;
  @override

  /// Local notification ID (for cancellation)
  int? get localNotificationId;
  @override

  /// Scheduled send time
  DateTime? get scheduledAt;
  @override

  /// Sent timestamp
  DateTime? get sentAt;
  @override

  /// Delivered timestamp
  DateTime? get deliveredAt;
  @override

  /// Opened timestamp
  DateTime? get openedAt;
  @override

  /// Dismissed timestamp
  DateTime? get dismissedAt;
  @override

  /// Expires at
  DateTime? get expiresAt;
  @override

  /// Created at
  DateTime get createdAt;
  @override

  /// Updated at
  DateTime get updatedAt;
  @override

  /// Metadata
  Map<String, dynamic> get metadata;
  @override
  @JsonKey(ignore: true)
  _$$NotificationImplCopyWith<_$NotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NotificationPreferences _$NotificationPreferencesFromJson(
    Map<String, dynamic> json) {
  return _NotificationPreferences.fromJson(json);
}

/// @nodoc
mixin _$NotificationPreferences {
  /// User ID
  String get userId => throw _privateConstructorUsedError;

  /// Enable push notifications
  bool get pushEnabled => throw _privateConstructorUsedError;

  /// Enable emergency alerts (cannot be disabled)
  bool get emergencyAlertsEnabled => throw _privateConstructorUsedError;

  /// Enable evacuation notices
  bool get evacuationNoticesEnabled => throw _privateConstructorUsedError;

  /// Enable announcements
  bool get announcementsEnabled => throw _privateConstructorUsedError;

  /// Enable personal messages
  bool get personalMessagesEnabled => throw _privateConstructorUsedError;

  /// Enable reminders
  bool get remindersEnabled => throw _privateConstructorUsedError;

  /// Enable location alerts
  bool get locationAlertsEnabled => throw _privateConstructorUsedError;

  /// Enable safety tips
  bool get safetyTipsEnabled => throw _privateConstructorUsedError;

  /// Enable drill notifications
  bool get drillNotificationsEnabled => throw _privateConstructorUsedError;

  /// Enable maintenance notifications
  bool get maintenanceNotificationsEnabled =>
      throw _privateConstructorUsedError;

  /// Quiet hours start (24-hour format, e.g., 22 for 10 PM)
  int? get quietHoursStart => throw _privateConstructorUsedError;

  /// Quiet hours end (24-hour format, e.g., 7 for 7 AM)
  int? get quietHoursEnd => throw _privateConstructorUsedError;

  /// Vibration enabled
  bool get vibrationEnabled => throw _privateConstructorUsedError;

  /// Sound enabled
  bool get soundEnabled => throw _privateConstructorUsedError;

  /// Updated at
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationPreferencesCopyWith<NotificationPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationPreferencesCopyWith<$Res> {
  factory $NotificationPreferencesCopyWith(NotificationPreferences value,
          $Res Function(NotificationPreferences) then) =
      _$NotificationPreferencesCopyWithImpl<$Res, NotificationPreferences>;
  @useResult
  $Res call(
      {String userId,
      bool pushEnabled,
      bool emergencyAlertsEnabled,
      bool evacuationNoticesEnabled,
      bool announcementsEnabled,
      bool personalMessagesEnabled,
      bool remindersEnabled,
      bool locationAlertsEnabled,
      bool safetyTipsEnabled,
      bool drillNotificationsEnabled,
      bool maintenanceNotificationsEnabled,
      int? quietHoursStart,
      int? quietHoursEnd,
      bool vibrationEnabled,
      bool soundEnabled,
      DateTime updatedAt});
}

/// @nodoc
class _$NotificationPreferencesCopyWithImpl<$Res,
        $Val extends NotificationPreferences>
    implements $NotificationPreferencesCopyWith<$Res> {
  _$NotificationPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? pushEnabled = null,
    Object? emergencyAlertsEnabled = null,
    Object? evacuationNoticesEnabled = null,
    Object? announcementsEnabled = null,
    Object? personalMessagesEnabled = null,
    Object? remindersEnabled = null,
    Object? locationAlertsEnabled = null,
    Object? safetyTipsEnabled = null,
    Object? drillNotificationsEnabled = null,
    Object? maintenanceNotificationsEnabled = null,
    Object? quietHoursStart = freezed,
    Object? quietHoursEnd = freezed,
    Object? vibrationEnabled = null,
    Object? soundEnabled = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      pushEnabled: null == pushEnabled
          ? _value.pushEnabled
          : pushEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      emergencyAlertsEnabled: null == emergencyAlertsEnabled
          ? _value.emergencyAlertsEnabled
          : emergencyAlertsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      evacuationNoticesEnabled: null == evacuationNoticesEnabled
          ? _value.evacuationNoticesEnabled
          : evacuationNoticesEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      announcementsEnabled: null == announcementsEnabled
          ? _value.announcementsEnabled
          : announcementsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      personalMessagesEnabled: null == personalMessagesEnabled
          ? _value.personalMessagesEnabled
          : personalMessagesEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      remindersEnabled: null == remindersEnabled
          ? _value.remindersEnabled
          : remindersEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      locationAlertsEnabled: null == locationAlertsEnabled
          ? _value.locationAlertsEnabled
          : locationAlertsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      safetyTipsEnabled: null == safetyTipsEnabled
          ? _value.safetyTipsEnabled
          : safetyTipsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      drillNotificationsEnabled: null == drillNotificationsEnabled
          ? _value.drillNotificationsEnabled
          : drillNotificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      maintenanceNotificationsEnabled: null == maintenanceNotificationsEnabled
          ? _value.maintenanceNotificationsEnabled
          : maintenanceNotificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      quietHoursStart: freezed == quietHoursStart
          ? _value.quietHoursStart
          : quietHoursStart // ignore: cast_nullable_to_non_nullable
              as int?,
      quietHoursEnd: freezed == quietHoursEnd
          ? _value.quietHoursEnd
          : quietHoursEnd // ignore: cast_nullable_to_non_nullable
              as int?,
      vibrationEnabled: null == vibrationEnabled
          ? _value.vibrationEnabled
          : vibrationEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      soundEnabled: null == soundEnabled
          ? _value.soundEnabled
          : soundEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationPreferencesImplCopyWith<$Res>
    implements $NotificationPreferencesCopyWith<$Res> {
  factory _$$NotificationPreferencesImplCopyWith(
          _$NotificationPreferencesImpl value,
          $Res Function(_$NotificationPreferencesImpl) then) =
      __$$NotificationPreferencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      bool pushEnabled,
      bool emergencyAlertsEnabled,
      bool evacuationNoticesEnabled,
      bool announcementsEnabled,
      bool personalMessagesEnabled,
      bool remindersEnabled,
      bool locationAlertsEnabled,
      bool safetyTipsEnabled,
      bool drillNotificationsEnabled,
      bool maintenanceNotificationsEnabled,
      int? quietHoursStart,
      int? quietHoursEnd,
      bool vibrationEnabled,
      bool soundEnabled,
      DateTime updatedAt});
}

/// @nodoc
class __$$NotificationPreferencesImplCopyWithImpl<$Res>
    extends _$NotificationPreferencesCopyWithImpl<$Res,
        _$NotificationPreferencesImpl>
    implements _$$NotificationPreferencesImplCopyWith<$Res> {
  __$$NotificationPreferencesImplCopyWithImpl(
      _$NotificationPreferencesImpl _value,
      $Res Function(_$NotificationPreferencesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? pushEnabled = null,
    Object? emergencyAlertsEnabled = null,
    Object? evacuationNoticesEnabled = null,
    Object? announcementsEnabled = null,
    Object? personalMessagesEnabled = null,
    Object? remindersEnabled = null,
    Object? locationAlertsEnabled = null,
    Object? safetyTipsEnabled = null,
    Object? drillNotificationsEnabled = null,
    Object? maintenanceNotificationsEnabled = null,
    Object? quietHoursStart = freezed,
    Object? quietHoursEnd = freezed,
    Object? vibrationEnabled = null,
    Object? soundEnabled = null,
    Object? updatedAt = null,
  }) {
    return _then(_$NotificationPreferencesImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      pushEnabled: null == pushEnabled
          ? _value.pushEnabled
          : pushEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      emergencyAlertsEnabled: null == emergencyAlertsEnabled
          ? _value.emergencyAlertsEnabled
          : emergencyAlertsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      evacuationNoticesEnabled: null == evacuationNoticesEnabled
          ? _value.evacuationNoticesEnabled
          : evacuationNoticesEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      announcementsEnabled: null == announcementsEnabled
          ? _value.announcementsEnabled
          : announcementsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      personalMessagesEnabled: null == personalMessagesEnabled
          ? _value.personalMessagesEnabled
          : personalMessagesEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      remindersEnabled: null == remindersEnabled
          ? _value.remindersEnabled
          : remindersEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      locationAlertsEnabled: null == locationAlertsEnabled
          ? _value.locationAlertsEnabled
          : locationAlertsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      safetyTipsEnabled: null == safetyTipsEnabled
          ? _value.safetyTipsEnabled
          : safetyTipsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      drillNotificationsEnabled: null == drillNotificationsEnabled
          ? _value.drillNotificationsEnabled
          : drillNotificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      maintenanceNotificationsEnabled: null == maintenanceNotificationsEnabled
          ? _value.maintenanceNotificationsEnabled
          : maintenanceNotificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      quietHoursStart: freezed == quietHoursStart
          ? _value.quietHoursStart
          : quietHoursStart // ignore: cast_nullable_to_non_nullable
              as int?,
      quietHoursEnd: freezed == quietHoursEnd
          ? _value.quietHoursEnd
          : quietHoursEnd // ignore: cast_nullable_to_non_nullable
              as int?,
      vibrationEnabled: null == vibrationEnabled
          ? _value.vibrationEnabled
          : vibrationEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      soundEnabled: null == soundEnabled
          ? _value.soundEnabled
          : soundEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationPreferencesImpl implements _NotificationPreferences {
  const _$NotificationPreferencesImpl(
      {required this.userId,
      this.pushEnabled = true,
      this.emergencyAlertsEnabled = true,
      this.evacuationNoticesEnabled = true,
      this.announcementsEnabled = true,
      this.personalMessagesEnabled = true,
      this.remindersEnabled = true,
      this.locationAlertsEnabled = true,
      this.safetyTipsEnabled = true,
      this.drillNotificationsEnabled = true,
      this.maintenanceNotificationsEnabled = true,
      this.quietHoursStart,
      this.quietHoursEnd,
      this.vibrationEnabled = true,
      this.soundEnabled = true,
      required this.updatedAt});

  factory _$NotificationPreferencesImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationPreferencesImplFromJson(json);

  /// User ID
  @override
  final String userId;

  /// Enable push notifications
  @override
  @JsonKey()
  final bool pushEnabled;

  /// Enable emergency alerts (cannot be disabled)
  @override
  @JsonKey()
  final bool emergencyAlertsEnabled;

  /// Enable evacuation notices
  @override
  @JsonKey()
  final bool evacuationNoticesEnabled;

  /// Enable announcements
  @override
  @JsonKey()
  final bool announcementsEnabled;

  /// Enable personal messages
  @override
  @JsonKey()
  final bool personalMessagesEnabled;

  /// Enable reminders
  @override
  @JsonKey()
  final bool remindersEnabled;

  /// Enable location alerts
  @override
  @JsonKey()
  final bool locationAlertsEnabled;

  /// Enable safety tips
  @override
  @JsonKey()
  final bool safetyTipsEnabled;

  /// Enable drill notifications
  @override
  @JsonKey()
  final bool drillNotificationsEnabled;

  /// Enable maintenance notifications
  @override
  @JsonKey()
  final bool maintenanceNotificationsEnabled;

  /// Quiet hours start (24-hour format, e.g., 22 for 10 PM)
  @override
  final int? quietHoursStart;

  /// Quiet hours end (24-hour format, e.g., 7 for 7 AM)
  @override
  final int? quietHoursEnd;

  /// Vibration enabled
  @override
  @JsonKey()
  final bool vibrationEnabled;

  /// Sound enabled
  @override
  @JsonKey()
  final bool soundEnabled;

  /// Updated at
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'NotificationPreferences(userId: $userId, pushEnabled: $pushEnabled, emergencyAlertsEnabled: $emergencyAlertsEnabled, evacuationNoticesEnabled: $evacuationNoticesEnabled, announcementsEnabled: $announcementsEnabled, personalMessagesEnabled: $personalMessagesEnabled, remindersEnabled: $remindersEnabled, locationAlertsEnabled: $locationAlertsEnabled, safetyTipsEnabled: $safetyTipsEnabled, drillNotificationsEnabled: $drillNotificationsEnabled, maintenanceNotificationsEnabled: $maintenanceNotificationsEnabled, quietHoursStart: $quietHoursStart, quietHoursEnd: $quietHoursEnd, vibrationEnabled: $vibrationEnabled, soundEnabled: $soundEnabled, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationPreferencesImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.pushEnabled, pushEnabled) ||
                other.pushEnabled == pushEnabled) &&
            (identical(other.emergencyAlertsEnabled, emergencyAlertsEnabled) ||
                other.emergencyAlertsEnabled == emergencyAlertsEnabled) &&
            (identical(
                    other.evacuationNoticesEnabled, evacuationNoticesEnabled) ||
                other.evacuationNoticesEnabled == evacuationNoticesEnabled) &&
            (identical(other.announcementsEnabled, announcementsEnabled) ||
                other.announcementsEnabled == announcementsEnabled) &&
            (identical(other.personalMessagesEnabled, personalMessagesEnabled) ||
                other.personalMessagesEnabled == personalMessagesEnabled) &&
            (identical(other.remindersEnabled, remindersEnabled) ||
                other.remindersEnabled == remindersEnabled) &&
            (identical(other.locationAlertsEnabled, locationAlertsEnabled) ||
                other.locationAlertsEnabled == locationAlertsEnabled) &&
            (identical(other.safetyTipsEnabled, safetyTipsEnabled) ||
                other.safetyTipsEnabled == safetyTipsEnabled) &&
            (identical(other.drillNotificationsEnabled,
                    drillNotificationsEnabled) ||
                other.drillNotificationsEnabled == drillNotificationsEnabled) &&
            (identical(other.maintenanceNotificationsEnabled,
                    maintenanceNotificationsEnabled) ||
                other.maintenanceNotificationsEnabled ==
                    maintenanceNotificationsEnabled) &&
            (identical(other.quietHoursStart, quietHoursStart) ||
                other.quietHoursStart == quietHoursStart) &&
            (identical(other.quietHoursEnd, quietHoursEnd) ||
                other.quietHoursEnd == quietHoursEnd) &&
            (identical(other.vibrationEnabled, vibrationEnabled) ||
                other.vibrationEnabled == vibrationEnabled) &&
            (identical(other.soundEnabled, soundEnabled) ||
                other.soundEnabled == soundEnabled) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      pushEnabled,
      emergencyAlertsEnabled,
      evacuationNoticesEnabled,
      announcementsEnabled,
      personalMessagesEnabled,
      remindersEnabled,
      locationAlertsEnabled,
      safetyTipsEnabled,
      drillNotificationsEnabled,
      maintenanceNotificationsEnabled,
      quietHoursStart,
      quietHoursEnd,
      vibrationEnabled,
      soundEnabled,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationPreferencesImplCopyWith<_$NotificationPreferencesImpl>
      get copyWith => __$$NotificationPreferencesImplCopyWithImpl<
          _$NotificationPreferencesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationPreferencesImplToJson(
      this,
    );
  }
}

abstract class _NotificationPreferences implements NotificationPreferences {
  const factory _NotificationPreferences(
      {required final String userId,
      final bool pushEnabled,
      final bool emergencyAlertsEnabled,
      final bool evacuationNoticesEnabled,
      final bool announcementsEnabled,
      final bool personalMessagesEnabled,
      final bool remindersEnabled,
      final bool locationAlertsEnabled,
      final bool safetyTipsEnabled,
      final bool drillNotificationsEnabled,
      final bool maintenanceNotificationsEnabled,
      final int? quietHoursStart,
      final int? quietHoursEnd,
      final bool vibrationEnabled,
      final bool soundEnabled,
      required final DateTime updatedAt}) = _$NotificationPreferencesImpl;

  factory _NotificationPreferences.fromJson(Map<String, dynamic> json) =
      _$NotificationPreferencesImpl.fromJson;

  @override

  /// User ID
  String get userId;
  @override

  /// Enable push notifications
  bool get pushEnabled;
  @override

  /// Enable emergency alerts (cannot be disabled)
  bool get emergencyAlertsEnabled;
  @override

  /// Enable evacuation notices
  bool get evacuationNoticesEnabled;
  @override

  /// Enable announcements
  bool get announcementsEnabled;
  @override

  /// Enable personal messages
  bool get personalMessagesEnabled;
  @override

  /// Enable reminders
  bool get remindersEnabled;
  @override

  /// Enable location alerts
  bool get locationAlertsEnabled;
  @override

  /// Enable safety tips
  bool get safetyTipsEnabled;
  @override

  /// Enable drill notifications
  bool get drillNotificationsEnabled;
  @override

  /// Enable maintenance notifications
  bool get maintenanceNotificationsEnabled;
  @override

  /// Quiet hours start (24-hour format, e.g., 22 for 10 PM)
  int? get quietHoursStart;
  @override

  /// Quiet hours end (24-hour format, e.g., 7 for 7 AM)
  int? get quietHoursEnd;
  @override

  /// Vibration enabled
  bool get vibrationEnabled;
  @override

  /// Sound enabled
  bool get soundEnabled;
  @override

  /// Updated at
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$NotificationPreferencesImplCopyWith<_$NotificationPreferencesImpl>
      get copyWith => throw _privateConstructorUsedError;
}
