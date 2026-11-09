// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Notification {
  /// Unique notification ID
  String get id;

  /// Notification title
  String get title;

  /// Notification body/message
  String get body;

  /// Notification type
  NotificationType get type;

  /// Priority level
  NotificationPriority get priority;

  /// Current status
  NotificationStatus get status;

  /// Target user ID (null for broadcast)
  String? get userId;

  /// Target role (for role-based notifications)
  String? get targetRole;

  /// Target building IDs
  List<String> get targetBuildingIds;

  /// Related alert ID (if from alert)
  String? get alertId;

  /// Related location ID
  String? get locationId;

  /// Action URL/deep link
  String? get actionUrl;

  /// Action label
  String? get actionLabel;

  /// Image URL
  String? get imageUrl;

  /// Data payload
  Map<String, dynamic> get data;

  /// Whether notification was sent via FCM
  bool get sentViaFcm;

  /// Whether notification was shown locally
  bool get shownLocally;

  /// Local notification ID (for cancellation)
  int? get localNotificationId;

  /// Scheduled send time
  DateTime? get scheduledAt;

  /// Sent timestamp
  DateTime? get sentAt;

  /// Delivered timestamp
  DateTime? get deliveredAt;

  /// Opened timestamp
  DateTime? get openedAt;

  /// Dismissed timestamp
  DateTime? get dismissedAt;

  /// Expires at
  DateTime? get expiresAt;

  /// Created at
  DateTime get createdAt;

  /// Updated at
  DateTime get updatedAt;

  /// Metadata
  Map<String, dynamic> get metadata;

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationCopyWith<Notification> get copyWith =>
      _$NotificationCopyWithImpl<Notification>(
          this as Notification, _$identity);

  /// Serializes this Notification to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as Notification;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Notification &&
            (identical(other.id, _this.id) || other.id == _this.id) &&
            (identical(other.title, _this.title) ||
                other.title == _this.title) &&
            (identical(other.body, _this.body) || other.body == _this.body) &&
            (identical(other.type, _this.type) || other.type == _this.type) &&
            (identical(other.priority, _this.priority) ||
                other.priority == _this.priority) &&
            (identical(other.status, _this.status) ||
                other.status == _this.status) &&
            (identical(other.userId, _this.userId) ||
                other.userId == _this.userId) &&
            (identical(other.targetRole, _this.targetRole) ||
                other.targetRole == _this.targetRole) &&
            const DeepCollectionEquality()
                .equals(other.targetBuildingIds, _this.targetBuildingIds) &&
            (identical(other.alertId, _this.alertId) ||
                other.alertId == _this.alertId) &&
            (identical(other.locationId, _this.locationId) ||
                other.locationId == _this.locationId) &&
            (identical(other.actionUrl, _this.actionUrl) ||
                other.actionUrl == _this.actionUrl) &&
            (identical(other.actionLabel, _this.actionLabel) ||
                other.actionLabel == _this.actionLabel) &&
            (identical(other.imageUrl, _this.imageUrl) ||
                other.imageUrl == _this.imageUrl) &&
            const DeepCollectionEquality().equals(other.data, _this.data) &&
            (identical(other.sentViaFcm, _this.sentViaFcm) ||
                other.sentViaFcm == _this.sentViaFcm) &&
            (identical(other.shownLocally, _this.shownLocally) ||
                other.shownLocally == _this.shownLocally) &&
            (identical(other.localNotificationId, _this.localNotificationId) ||
                other.localNotificationId == _this.localNotificationId) &&
            (identical(other.scheduledAt, _this.scheduledAt) ||
                other.scheduledAt == _this.scheduledAt) &&
            (identical(other.sentAt, _this.sentAt) ||
                other.sentAt == _this.sentAt) &&
            (identical(other.deliveredAt, _this.deliveredAt) ||
                other.deliveredAt == _this.deliveredAt) &&
            (identical(other.openedAt, _this.openedAt) ||
                other.openedAt == _this.openedAt) &&
            (identical(other.dismissedAt, _this.dismissedAt) ||
                other.dismissedAt == _this.dismissedAt) &&
            (identical(other.expiresAt, _this.expiresAt) ||
                other.expiresAt == _this.expiresAt) &&
            (identical(other.createdAt, _this.createdAt) ||
                other.createdAt == _this.createdAt) &&
            (identical(other.updatedAt, _this.updatedAt) ||
                other.updatedAt == _this.updatedAt) &&
            const DeepCollectionEquality()
                .equals(other.metadata, _this.metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as Notification;
    return Object.hashAll([
      runtimeType,
      _this.id,
      _this.title,
      _this.body,
      _this.type,
      _this.priority,
      _this.status,
      _this.userId,
      _this.targetRole,
      const DeepCollectionEquality().hash(_this.targetBuildingIds),
      _this.alertId,
      _this.locationId,
      _this.actionUrl,
      _this.actionLabel,
      _this.imageUrl,
      const DeepCollectionEquality().hash(_this.data),
      _this.sentViaFcm,
      _this.shownLocally,
      _this.localNotificationId,
      _this.scheduledAt,
      _this.sentAt,
      _this.deliveredAt,
      _this.openedAt,
      _this.dismissedAt,
      _this.expiresAt,
      _this.createdAt,
      _this.updatedAt,
      const DeepCollectionEquality().hash(_this.metadata)
    ]);
  }

  @override
  String toString() {
    final _this = this as Notification;
    return 'Notification(id: ${_this.id}, title: ${_this.title}, body: ${_this.body}, type: ${_this.type}, priority: ${_this.priority}, status: ${_this.status}, userId: ${_this.userId}, targetRole: ${_this.targetRole}, targetBuildingIds: ${_this.targetBuildingIds}, alertId: ${_this.alertId}, locationId: ${_this.locationId}, actionUrl: ${_this.actionUrl}, actionLabel: ${_this.actionLabel}, imageUrl: ${_this.imageUrl}, data: ${_this.data}, sentViaFcm: ${_this.sentViaFcm}, shownLocally: ${_this.shownLocally}, localNotificationId: ${_this.localNotificationId}, scheduledAt: ${_this.scheduledAt}, sentAt: ${_this.sentAt}, deliveredAt: ${_this.deliveredAt}, openedAt: ${_this.openedAt}, dismissedAt: ${_this.dismissedAt}, expiresAt: ${_this.expiresAt}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, metadata: ${_this.metadata})';
  }
}

/// @nodoc
abstract mixin class $NotificationCopyWith<$Res> {
  factory $NotificationCopyWith(
          Notification value, $Res Function(Notification) _then) =
      _$NotificationCopyWithImpl;
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
class _$NotificationCopyWithImpl<$Res> implements $NotificationCopyWith<$Res> {
  _$NotificationCopyWithImpl(this._self, this._then);

  final Notification _self;
  final $Res Function(Notification) _then;

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(Notification(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _self.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as NotificationPriority,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as NotificationStatus,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      targetRole: freezed == targetRole
          ? _self.targetRole
          : targetRole // ignore: cast_nullable_to_non_nullable
              as String?,
      targetBuildingIds: null == targetBuildingIds
          ? _self.targetBuildingIds
          : targetBuildingIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      alertId: freezed == alertId
          ? _self.alertId
          : alertId // ignore: cast_nullable_to_non_nullable
              as String?,
      locationId: freezed == locationId
          ? _self.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String?,
      actionUrl: freezed == actionUrl
          ? _self.actionUrl
          : actionUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      actionLabel: freezed == actionLabel
          ? _self.actionLabel
          : actionLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      sentViaFcm: null == sentViaFcm
          ? _self.sentViaFcm
          : sentViaFcm // ignore: cast_nullable_to_non_nullable
              as bool,
      shownLocally: null == shownLocally
          ? _self.shownLocally
          : shownLocally // ignore: cast_nullable_to_non_nullable
              as bool,
      localNotificationId: freezed == localNotificationId
          ? _self.localNotificationId
          : localNotificationId // ignore: cast_nullable_to_non_nullable
              as int?,
      scheduledAt: freezed == scheduledAt
          ? _self.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sentAt: freezed == sentAt
          ? _self.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveredAt: freezed == deliveredAt
          ? _self.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      openedAt: freezed == openedAt
          ? _self.openedAt
          : openedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dismissedAt: freezed == dismissedAt
          ? _self.dismissedAt
          : dismissedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiresAt: freezed == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: null == metadata
          ? _self.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// Adds pattern-matching-related methods to [Notification].
extension NotificationPatterns on Notification {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Notification value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Notification() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Notification value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Notification():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Notification value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Notification() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
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
            Map<String, dynamic> metadata)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Notification() when $default != null:
        return $default(
            _that.id,
            _that.title,
            _that.body,
            _that.type,
            _that.priority,
            _that.status,
            _that.userId,
            _that.targetRole,
            _that.targetBuildingIds,
            _that.alertId,
            _that.locationId,
            _that.actionUrl,
            _that.actionLabel,
            _that.imageUrl,
            _that.data,
            _that.sentViaFcm,
            _that.shownLocally,
            _that.localNotificationId,
            _that.scheduledAt,
            _that.sentAt,
            _that.deliveredAt,
            _that.openedAt,
            _that.dismissedAt,
            _that.expiresAt,
            _that.createdAt,
            _that.updatedAt,
            _that.metadata);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
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
            Map<String, dynamic> metadata)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Notification():
        return $default(
            _that.id,
            _that.title,
            _that.body,
            _that.type,
            _that.priority,
            _that.status,
            _that.userId,
            _that.targetRole,
            _that.targetBuildingIds,
            _that.alertId,
            _that.locationId,
            _that.actionUrl,
            _that.actionLabel,
            _that.imageUrl,
            _that.data,
            _that.sentViaFcm,
            _that.shownLocally,
            _that.localNotificationId,
            _that.scheduledAt,
            _that.sentAt,
            _that.deliveredAt,
            _that.openedAt,
            _that.dismissedAt,
            _that.expiresAt,
            _that.createdAt,
            _that.updatedAt,
            _that.metadata);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
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
            Map<String, dynamic> metadata)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Notification() when $default != null:
        return $default(
            _that.id,
            _that.title,
            _that.body,
            _that.type,
            _that.priority,
            _that.status,
            _that.userId,
            _that.targetRole,
            _that.targetBuildingIds,
            _that.alertId,
            _that.locationId,
            _that.actionUrl,
            _that.actionLabel,
            _that.imageUrl,
            _that.data,
            _that.sentViaFcm,
            _that.shownLocally,
            _that.localNotificationId,
            _that.scheduledAt,
            _that.sentAt,
            _that.deliveredAt,
            _that.openedAt,
            _that.dismissedAt,
            _that.expiresAt,
            _that.createdAt,
            _that.updatedAt,
            _that.metadata);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Notification implements Notification {
  const _Notification(
      {required this.id,
      required this.title,
      required this.body,
      required this.type,
      this.priority = NotificationPriority.normal,
      this.status = NotificationStatus.sent,
      this.userId,
      this.targetRole,
      List<String> targetBuildingIds = const [],
      this.alertId,
      this.locationId,
      this.actionUrl,
      this.actionLabel,
      this.imageUrl,
      Map<String, dynamic> data = const {},
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
      Map<String, dynamic> metadata = const {}})
      : _targetBuildingIds = targetBuildingIds,
        _data = data,
        _metadata = metadata;
  factory _Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);

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

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotificationCopyWith<_Notification> get copyWith =>
      __$NotificationCopyWithImpl<_Notification>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NotificationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Notification &&
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
                .equals(other.targetBuildingIds, _targetBuildingIds) &&
            (identical(other.alertId, alertId) || other.alertId == alertId) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.actionUrl, actionUrl) ||
                other.actionUrl == actionUrl) &&
            (identical(other.actionLabel, actionLabel) ||
                other.actionLabel == actionLabel) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(other.data, _data) &&
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
            const DeepCollectionEquality().equals(other.metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hashAll([
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
  }

  @override
  String toString() {
    return 'Notification(id: $id, title: $title, body: $body, type: $type, priority: $priority, status: $status, userId: $userId, targetRole: $targetRole, targetBuildingIds: $targetBuildingIds, alertId: $alertId, locationId: $locationId, actionUrl: $actionUrl, actionLabel: $actionLabel, imageUrl: $imageUrl, data: $data, sentViaFcm: $sentViaFcm, shownLocally: $shownLocally, localNotificationId: $localNotificationId, scheduledAt: $scheduledAt, sentAt: $sentAt, deliveredAt: $deliveredAt, openedAt: $openedAt, dismissedAt: $dismissedAt, expiresAt: $expiresAt, createdAt: $createdAt, updatedAt: $updatedAt, metadata: $metadata)';
  }
}

/// @nodoc
abstract mixin class _$NotificationCopyWith<$Res>
    implements $NotificationCopyWith<$Res> {
  factory _$NotificationCopyWith(
          _Notification value, $Res Function(_Notification) _then) =
      __$NotificationCopyWithImpl;
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
class __$NotificationCopyWithImpl<$Res>
    implements _$NotificationCopyWith<$Res> {
  __$NotificationCopyWithImpl(this._self, this._then);

  final _Notification _self;
  final $Res Function(_Notification) _then;

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_Notification(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _self.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as NotificationPriority,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as NotificationStatus,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      targetRole: freezed == targetRole
          ? _self.targetRole
          : targetRole // ignore: cast_nullable_to_non_nullable
              as String?,
      targetBuildingIds: null == targetBuildingIds
          ? _self._targetBuildingIds
          : targetBuildingIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      alertId: freezed == alertId
          ? _self.alertId
          : alertId // ignore: cast_nullable_to_non_nullable
              as String?,
      locationId: freezed == locationId
          ? _self.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String?,
      actionUrl: freezed == actionUrl
          ? _self.actionUrl
          : actionUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      actionLabel: freezed == actionLabel
          ? _self.actionLabel
          : actionLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      sentViaFcm: null == sentViaFcm
          ? _self.sentViaFcm
          : sentViaFcm // ignore: cast_nullable_to_non_nullable
              as bool,
      shownLocally: null == shownLocally
          ? _self.shownLocally
          : shownLocally // ignore: cast_nullable_to_non_nullable
              as bool,
      localNotificationId: freezed == localNotificationId
          ? _self.localNotificationId
          : localNotificationId // ignore: cast_nullable_to_non_nullable
              as int?,
      scheduledAt: freezed == scheduledAt
          ? _self.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sentAt: freezed == sentAt
          ? _self.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveredAt: freezed == deliveredAt
          ? _self.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      openedAt: freezed == openedAt
          ? _self.openedAt
          : openedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dismissedAt: freezed == dismissedAt
          ? _self.dismissedAt
          : dismissedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiresAt: freezed == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: null == metadata
          ? _self._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
mixin _$NotificationPreferences {
  /// User ID
  String get userId;

  /// Enable push notifications
  bool get pushEnabled;

  /// Enable emergency alerts (cannot be disabled)
  bool get emergencyAlertsEnabled;

  /// Enable evacuation notices
  bool get evacuationNoticesEnabled;

  /// Enable announcements
  bool get announcementsEnabled;

  /// Enable personal messages
  bool get personalMessagesEnabled;

  /// Enable reminders
  bool get remindersEnabled;

  /// Enable location alerts
  bool get locationAlertsEnabled;

  /// Enable safety tips
  bool get safetyTipsEnabled;

  /// Enable drill notifications
  bool get drillNotificationsEnabled;

  /// Enable maintenance notifications
  bool get maintenanceNotificationsEnabled;

  /// Quiet hours start (24-hour format, e.g., 22 for 10 PM)
  int? get quietHoursStart;

  /// Quiet hours end (24-hour format, e.g., 7 for 7 AM)
  int? get quietHoursEnd;

  /// Vibration enabled
  bool get vibrationEnabled;

  /// Sound enabled
  bool get soundEnabled;

  /// Updated at
  DateTime get updatedAt;

  /// Create a copy of NotificationPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationPreferencesCopyWith<NotificationPreferences> get copyWith =>
      _$NotificationPreferencesCopyWithImpl<NotificationPreferences>(
          this as NotificationPreferences, _$identity);

  /// Serializes this NotificationPreferences to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as NotificationPreferences;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationPreferences &&
            (identical(other.userId, _this.userId) ||
                other.userId == _this.userId) &&
            (identical(other.pushEnabled, _this.pushEnabled) ||
                other.pushEnabled == _this.pushEnabled) &&
            (identical(other.emergencyAlertsEnabled, _this.emergencyAlertsEnabled) ||
                other.emergencyAlertsEnabled == _this.emergencyAlertsEnabled) &&
            (identical(other.evacuationNoticesEnabled, _this.evacuationNoticesEnabled) ||
                other.evacuationNoticesEnabled ==
                    _this.evacuationNoticesEnabled) &&
            (identical(other.announcementsEnabled, _this.announcementsEnabled) ||
                other.announcementsEnabled == _this.announcementsEnabled) &&
            (identical(other.personalMessagesEnabled, _this.personalMessagesEnabled) ||
                other.personalMessagesEnabled ==
                    _this.personalMessagesEnabled) &&
            (identical(other.remindersEnabled, _this.remindersEnabled) ||
                other.remindersEnabled == _this.remindersEnabled) &&
            (identical(other.locationAlertsEnabled, _this.locationAlertsEnabled) ||
                other.locationAlertsEnabled == _this.locationAlertsEnabled) &&
            (identical(other.safetyTipsEnabled, _this.safetyTipsEnabled) ||
                other.safetyTipsEnabled == _this.safetyTipsEnabled) &&
            (identical(other.drillNotificationsEnabled, _this.drillNotificationsEnabled) ||
                other.drillNotificationsEnabled ==
                    _this.drillNotificationsEnabled) &&
            (identical(other.maintenanceNotificationsEnabled,
                    _this.maintenanceNotificationsEnabled) ||
                other.maintenanceNotificationsEnabled ==
                    _this.maintenanceNotificationsEnabled) &&
            (identical(other.quietHoursStart, _this.quietHoursStart) ||
                other.quietHoursStart == _this.quietHoursStart) &&
            (identical(other.quietHoursEnd, _this.quietHoursEnd) ||
                other.quietHoursEnd == _this.quietHoursEnd) &&
            (identical(other.vibrationEnabled, _this.vibrationEnabled) ||
                other.vibrationEnabled == _this.vibrationEnabled) &&
            (identical(other.soundEnabled, _this.soundEnabled) ||
                other.soundEnabled == _this.soundEnabled) &&
            (identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as NotificationPreferences;
    return Object.hash(
        runtimeType,
        _this.userId,
        _this.pushEnabled,
        _this.emergencyAlertsEnabled,
        _this.evacuationNoticesEnabled,
        _this.announcementsEnabled,
        _this.personalMessagesEnabled,
        _this.remindersEnabled,
        _this.locationAlertsEnabled,
        _this.safetyTipsEnabled,
        _this.drillNotificationsEnabled,
        _this.maintenanceNotificationsEnabled,
        _this.quietHoursStart,
        _this.quietHoursEnd,
        _this.vibrationEnabled,
        _this.soundEnabled,
        _this.updatedAt);
  }

  @override
  String toString() {
    final _this = this as NotificationPreferences;
    return 'NotificationPreferences(userId: ${_this.userId}, pushEnabled: ${_this.pushEnabled}, emergencyAlertsEnabled: ${_this.emergencyAlertsEnabled}, evacuationNoticesEnabled: ${_this.evacuationNoticesEnabled}, announcementsEnabled: ${_this.announcementsEnabled}, personalMessagesEnabled: ${_this.personalMessagesEnabled}, remindersEnabled: ${_this.remindersEnabled}, locationAlertsEnabled: ${_this.locationAlertsEnabled}, safetyTipsEnabled: ${_this.safetyTipsEnabled}, drillNotificationsEnabled: ${_this.drillNotificationsEnabled}, maintenanceNotificationsEnabled: ${_this.maintenanceNotificationsEnabled}, quietHoursStart: ${_this.quietHoursStart}, quietHoursEnd: ${_this.quietHoursEnd}, vibrationEnabled: ${_this.vibrationEnabled}, soundEnabled: ${_this.soundEnabled}, updatedAt: ${_this.updatedAt})';
  }
}

/// @nodoc
abstract mixin class $NotificationPreferencesCopyWith<$Res> {
  factory $NotificationPreferencesCopyWith(NotificationPreferences value,
          $Res Function(NotificationPreferences) _then) =
      _$NotificationPreferencesCopyWithImpl;
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
class _$NotificationPreferencesCopyWithImpl<$Res>
    implements $NotificationPreferencesCopyWith<$Res> {
  _$NotificationPreferencesCopyWithImpl(this._self, this._then);

  final NotificationPreferences _self;
  final $Res Function(NotificationPreferences) _then;

  /// Create a copy of NotificationPreferences
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(NotificationPreferences(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      pushEnabled: null == pushEnabled
          ? _self.pushEnabled
          : pushEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      emergencyAlertsEnabled: null == emergencyAlertsEnabled
          ? _self.emergencyAlertsEnabled
          : emergencyAlertsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      evacuationNoticesEnabled: null == evacuationNoticesEnabled
          ? _self.evacuationNoticesEnabled
          : evacuationNoticesEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      announcementsEnabled: null == announcementsEnabled
          ? _self.announcementsEnabled
          : announcementsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      personalMessagesEnabled: null == personalMessagesEnabled
          ? _self.personalMessagesEnabled
          : personalMessagesEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      remindersEnabled: null == remindersEnabled
          ? _self.remindersEnabled
          : remindersEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      locationAlertsEnabled: null == locationAlertsEnabled
          ? _self.locationAlertsEnabled
          : locationAlertsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      safetyTipsEnabled: null == safetyTipsEnabled
          ? _self.safetyTipsEnabled
          : safetyTipsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      drillNotificationsEnabled: null == drillNotificationsEnabled
          ? _self.drillNotificationsEnabled
          : drillNotificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      maintenanceNotificationsEnabled: null == maintenanceNotificationsEnabled
          ? _self.maintenanceNotificationsEnabled
          : maintenanceNotificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      quietHoursStart: freezed == quietHoursStart
          ? _self.quietHoursStart
          : quietHoursStart // ignore: cast_nullable_to_non_nullable
              as int?,
      quietHoursEnd: freezed == quietHoursEnd
          ? _self.quietHoursEnd
          : quietHoursEnd // ignore: cast_nullable_to_non_nullable
              as int?,
      vibrationEnabled: null == vibrationEnabled
          ? _self.vibrationEnabled
          : vibrationEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      soundEnabled: null == soundEnabled
          ? _self.soundEnabled
          : soundEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [NotificationPreferences].
extension NotificationPreferencesPatterns on NotificationPreferences {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_NotificationPreferences value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationPreferences() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_NotificationPreferences value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationPreferences():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_NotificationPreferences value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationPreferences() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String userId,
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
            DateTime updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationPreferences() when $default != null:
        return $default(
            _that.userId,
            _that.pushEnabled,
            _that.emergencyAlertsEnabled,
            _that.evacuationNoticesEnabled,
            _that.announcementsEnabled,
            _that.personalMessagesEnabled,
            _that.remindersEnabled,
            _that.locationAlertsEnabled,
            _that.safetyTipsEnabled,
            _that.drillNotificationsEnabled,
            _that.maintenanceNotificationsEnabled,
            _that.quietHoursStart,
            _that.quietHoursEnd,
            _that.vibrationEnabled,
            _that.soundEnabled,
            _that.updatedAt);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String userId,
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
            DateTime updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationPreferences():
        return $default(
            _that.userId,
            _that.pushEnabled,
            _that.emergencyAlertsEnabled,
            _that.evacuationNoticesEnabled,
            _that.announcementsEnabled,
            _that.personalMessagesEnabled,
            _that.remindersEnabled,
            _that.locationAlertsEnabled,
            _that.safetyTipsEnabled,
            _that.drillNotificationsEnabled,
            _that.maintenanceNotificationsEnabled,
            _that.quietHoursStart,
            _that.quietHoursEnd,
            _that.vibrationEnabled,
            _that.soundEnabled,
            _that.updatedAt);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String userId,
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
            DateTime updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationPreferences() when $default != null:
        return $default(
            _that.userId,
            _that.pushEnabled,
            _that.emergencyAlertsEnabled,
            _that.evacuationNoticesEnabled,
            _that.announcementsEnabled,
            _that.personalMessagesEnabled,
            _that.remindersEnabled,
            _that.locationAlertsEnabled,
            _that.safetyTipsEnabled,
            _that.drillNotificationsEnabled,
            _that.maintenanceNotificationsEnabled,
            _that.quietHoursStart,
            _that.quietHoursEnd,
            _that.vibrationEnabled,
            _that.soundEnabled,
            _that.updatedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NotificationPreferences implements NotificationPreferences {
  const _NotificationPreferences(
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
  factory _NotificationPreferences.fromJson(Map<String, dynamic> json) =>
      _$NotificationPreferencesFromJson(json);

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

  /// Create a copy of NotificationPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotificationPreferencesCopyWith<_NotificationPreferences> get copyWith =>
      __$NotificationPreferencesCopyWithImpl<_NotificationPreferences>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NotificationPreferencesToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationPreferences &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(
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
  }

  @override
  String toString() {
    return 'NotificationPreferences(userId: $userId, pushEnabled: $pushEnabled, emergencyAlertsEnabled: $emergencyAlertsEnabled, evacuationNoticesEnabled: $evacuationNoticesEnabled, announcementsEnabled: $announcementsEnabled, personalMessagesEnabled: $personalMessagesEnabled, remindersEnabled: $remindersEnabled, locationAlertsEnabled: $locationAlertsEnabled, safetyTipsEnabled: $safetyTipsEnabled, drillNotificationsEnabled: $drillNotificationsEnabled, maintenanceNotificationsEnabled: $maintenanceNotificationsEnabled, quietHoursStart: $quietHoursStart, quietHoursEnd: $quietHoursEnd, vibrationEnabled: $vibrationEnabled, soundEnabled: $soundEnabled, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$NotificationPreferencesCopyWith<$Res>
    implements $NotificationPreferencesCopyWith<$Res> {
  factory _$NotificationPreferencesCopyWith(_NotificationPreferences value,
          $Res Function(_NotificationPreferences) _then) =
      __$NotificationPreferencesCopyWithImpl;
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
class __$NotificationPreferencesCopyWithImpl<$Res>
    implements _$NotificationPreferencesCopyWith<$Res> {
  __$NotificationPreferencesCopyWithImpl(this._self, this._then);

  final _NotificationPreferences _self;
  final $Res Function(_NotificationPreferences) _then;

  /// Create a copy of NotificationPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_NotificationPreferences(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      pushEnabled: null == pushEnabled
          ? _self.pushEnabled
          : pushEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      emergencyAlertsEnabled: null == emergencyAlertsEnabled
          ? _self.emergencyAlertsEnabled
          : emergencyAlertsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      evacuationNoticesEnabled: null == evacuationNoticesEnabled
          ? _self.evacuationNoticesEnabled
          : evacuationNoticesEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      announcementsEnabled: null == announcementsEnabled
          ? _self.announcementsEnabled
          : announcementsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      personalMessagesEnabled: null == personalMessagesEnabled
          ? _self.personalMessagesEnabled
          : personalMessagesEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      remindersEnabled: null == remindersEnabled
          ? _self.remindersEnabled
          : remindersEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      locationAlertsEnabled: null == locationAlertsEnabled
          ? _self.locationAlertsEnabled
          : locationAlertsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      safetyTipsEnabled: null == safetyTipsEnabled
          ? _self.safetyTipsEnabled
          : safetyTipsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      drillNotificationsEnabled: null == drillNotificationsEnabled
          ? _self.drillNotificationsEnabled
          : drillNotificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      maintenanceNotificationsEnabled: null == maintenanceNotificationsEnabled
          ? _self.maintenanceNotificationsEnabled
          : maintenanceNotificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      quietHoursStart: freezed == quietHoursStart
          ? _self.quietHoursStart
          : quietHoursStart // ignore: cast_nullable_to_non_nullable
              as int?,
      quietHoursEnd: freezed == quietHoursEnd
          ? _self.quietHoursEnd
          : quietHoursEnd // ignore: cast_nullable_to_non_nullable
              as int?,
      vibrationEnabled: null == vibrationEnabled
          ? _self.vibrationEnabled
          : vibrationEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      soundEnabled: null == soundEnabled
          ? _self.soundEnabled
          : soundEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
