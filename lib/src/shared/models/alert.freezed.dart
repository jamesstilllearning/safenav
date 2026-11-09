// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alert.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Alert {
  /// Unique alert ID
  String get id;

  /// Alert title
  String get title;

  /// Alert message/description
  String get message;

  /// Alert type
  AlertType get type;

  /// Alert severity
  AlertSeverity get severity;

  /// Current status
  AlertStatus get status;

  /// Location ID where alert originated
  String? get locationId;

  /// Location name
  String? get locationName;

  /// Latitude of alert location
  double? get latitude;

  /// Longitude of alert location
  double? get longitude;

  /// Building affected
  String? get buildingId;

  /// Floor affected
  int? get floor;

  /// Affected area description
  String? get affectedArea;

  /// User ID who created the alert
  String? get createdBy;

  /// User role who created the alert
  String? get createdByRole;

  /// Whether this is a system-generated alert
  bool get isSystemGenerated;

  /// Whether this is a test/drill
  bool get isTest;

  /// Instructions for users
  String? get instructions;

  /// Evacuation route ID (if applicable)
  String? get evacuationRouteId;

  /// Assembly point ID (if applicable)
  String? get assemblyPointId;

  /// Shelter ID (if applicable)
  String? get shelterId;

  /// Related alert IDs
  List<String> get relatedAlertIds;

  /// Attachments (photos, documents)
  List<String> get attachmentUrls;

  /// Tags for filtering
  List<String> get tags;

  /// Target audience (roles)
  List<String> get targetRoles;

  /// Target building IDs
  List<String> get targetBuildingIds;

  /// Expires at
  DateTime? get expiresAt;

  /// Acknowledged by user IDs
  List<String> get acknowledgedBy;

  /// Resolved by user ID
  String? get resolvedBy;

  /// Resolution notes
  String? get resolutionNotes;

  /// Created at
  DateTime get createdAt;

  /// Updated at
  DateTime get updatedAt;

  /// Metadata
  Map<String, dynamic> get metadata;

  /// Create a copy of Alert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AlertCopyWith<Alert> get copyWith =>
      _$AlertCopyWithImpl<Alert>(this as Alert, _$identity);

  /// Serializes this Alert to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as Alert;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Alert &&
            (identical(other.id, _this.id) || other.id == _this.id) &&
            (identical(other.title, _this.title) ||
                other.title == _this.title) &&
            (identical(other.message, _this.message) ||
                other.message == _this.message) &&
            (identical(other.type, _this.type) || other.type == _this.type) &&
            (identical(other.severity, _this.severity) ||
                other.severity == _this.severity) &&
            (identical(other.status, _this.status) ||
                other.status == _this.status) &&
            (identical(other.locationId, _this.locationId) ||
                other.locationId == _this.locationId) &&
            (identical(other.locationName, _this.locationName) ||
                other.locationName == _this.locationName) &&
            (identical(other.latitude, _this.latitude) ||
                other.latitude == _this.latitude) &&
            (identical(other.longitude, _this.longitude) ||
                other.longitude == _this.longitude) &&
            (identical(other.buildingId, _this.buildingId) ||
                other.buildingId == _this.buildingId) &&
            (identical(other.floor, _this.floor) ||
                other.floor == _this.floor) &&
            (identical(other.affectedArea, _this.affectedArea) ||
                other.affectedArea == _this.affectedArea) &&
            (identical(other.createdBy, _this.createdBy) ||
                other.createdBy == _this.createdBy) &&
            (identical(other.createdByRole, _this.createdByRole) ||
                other.createdByRole == _this.createdByRole) &&
            (identical(other.isSystemGenerated, _this.isSystemGenerated) ||
                other.isSystemGenerated == _this.isSystemGenerated) &&
            (identical(other.isTest, _this.isTest) ||
                other.isTest == _this.isTest) &&
            (identical(other.instructions, _this.instructions) ||
                other.instructions == _this.instructions) &&
            (identical(other.evacuationRouteId, _this.evacuationRouteId) ||
                other.evacuationRouteId == _this.evacuationRouteId) &&
            (identical(other.assemblyPointId, _this.assemblyPointId) ||
                other.assemblyPointId == _this.assemblyPointId) &&
            (identical(other.shelterId, _this.shelterId) ||
                other.shelterId == _this.shelterId) &&
            const DeepCollectionEquality()
                .equals(other.relatedAlertIds, _this.relatedAlertIds) &&
            const DeepCollectionEquality()
                .equals(other.attachmentUrls, _this.attachmentUrls) &&
            const DeepCollectionEquality().equals(other.tags, _this.tags) &&
            const DeepCollectionEquality()
                .equals(other.targetRoles, _this.targetRoles) &&
            const DeepCollectionEquality()
                .equals(other.targetBuildingIds, _this.targetBuildingIds) &&
            (identical(other.expiresAt, _this.expiresAt) ||
                other.expiresAt == _this.expiresAt) &&
            const DeepCollectionEquality()
                .equals(other.acknowledgedBy, _this.acknowledgedBy) &&
            (identical(other.resolvedBy, _this.resolvedBy) ||
                other.resolvedBy == _this.resolvedBy) &&
            (identical(other.resolutionNotes, _this.resolutionNotes) ||
                other.resolutionNotes == _this.resolutionNotes) &&
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
    final _this = this as Alert;
    return Object.hashAll([
      runtimeType,
      _this.id,
      _this.title,
      _this.message,
      _this.type,
      _this.severity,
      _this.status,
      _this.locationId,
      _this.locationName,
      _this.latitude,
      _this.longitude,
      _this.buildingId,
      _this.floor,
      _this.affectedArea,
      _this.createdBy,
      _this.createdByRole,
      _this.isSystemGenerated,
      _this.isTest,
      _this.instructions,
      _this.evacuationRouteId,
      _this.assemblyPointId,
      _this.shelterId,
      const DeepCollectionEquality().hash(_this.relatedAlertIds),
      const DeepCollectionEquality().hash(_this.attachmentUrls),
      const DeepCollectionEquality().hash(_this.tags),
      const DeepCollectionEquality().hash(_this.targetRoles),
      const DeepCollectionEquality().hash(_this.targetBuildingIds),
      _this.expiresAt,
      const DeepCollectionEquality().hash(_this.acknowledgedBy),
      _this.resolvedBy,
      _this.resolutionNotes,
      _this.createdAt,
      _this.updatedAt,
      const DeepCollectionEquality().hash(_this.metadata)
    ]);
  }

  @override
  String toString() {
    final _this = this as Alert;
    return 'Alert(id: ${_this.id}, title: ${_this.title}, message: ${_this.message}, type: ${_this.type}, severity: ${_this.severity}, status: ${_this.status}, locationId: ${_this.locationId}, locationName: ${_this.locationName}, latitude: ${_this.latitude}, longitude: ${_this.longitude}, buildingId: ${_this.buildingId}, floor: ${_this.floor}, affectedArea: ${_this.affectedArea}, createdBy: ${_this.createdBy}, createdByRole: ${_this.createdByRole}, isSystemGenerated: ${_this.isSystemGenerated}, isTest: ${_this.isTest}, instructions: ${_this.instructions}, evacuationRouteId: ${_this.evacuationRouteId}, assemblyPointId: ${_this.assemblyPointId}, shelterId: ${_this.shelterId}, relatedAlertIds: ${_this.relatedAlertIds}, attachmentUrls: ${_this.attachmentUrls}, tags: ${_this.tags}, targetRoles: ${_this.targetRoles}, targetBuildingIds: ${_this.targetBuildingIds}, expiresAt: ${_this.expiresAt}, acknowledgedBy: ${_this.acknowledgedBy}, resolvedBy: ${_this.resolvedBy}, resolutionNotes: ${_this.resolutionNotes}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, metadata: ${_this.metadata})';
  }
}

/// @nodoc
abstract mixin class $AlertCopyWith<$Res> {
  factory $AlertCopyWith(Alert value, $Res Function(Alert) _then) =
      _$AlertCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String title,
      String message,
      AlertType type,
      AlertSeverity severity,
      AlertStatus status,
      String? locationId,
      String? locationName,
      double? latitude,
      double? longitude,
      String? buildingId,
      int? floor,
      String? affectedArea,
      String? createdBy,
      String? createdByRole,
      bool isSystemGenerated,
      bool isTest,
      String? instructions,
      String? evacuationRouteId,
      String? assemblyPointId,
      String? shelterId,
      List<String> relatedAlertIds,
      List<String> attachmentUrls,
      List<String> tags,
      List<String> targetRoles,
      List<String> targetBuildingIds,
      DateTime? expiresAt,
      List<String> acknowledgedBy,
      String? resolvedBy,
      String? resolutionNotes,
      DateTime createdAt,
      DateTime updatedAt,
      Map<String, dynamic> metadata});
}

/// @nodoc
class _$AlertCopyWithImpl<$Res> implements $AlertCopyWith<$Res> {
  _$AlertCopyWithImpl(this._self, this._then);

  final Alert _self;
  final $Res Function(Alert) _then;

  /// Create a copy of Alert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? message = null,
    Object? type = null,
    Object? severity = null,
    Object? status = null,
    Object? locationId = freezed,
    Object? locationName = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? buildingId = freezed,
    Object? floor = freezed,
    Object? affectedArea = freezed,
    Object? createdBy = freezed,
    Object? createdByRole = freezed,
    Object? isSystemGenerated = null,
    Object? isTest = null,
    Object? instructions = freezed,
    Object? evacuationRouteId = freezed,
    Object? assemblyPointId = freezed,
    Object? shelterId = freezed,
    Object? relatedAlertIds = null,
    Object? attachmentUrls = null,
    Object? tags = null,
    Object? targetRoles = null,
    Object? targetBuildingIds = null,
    Object? expiresAt = freezed,
    Object? acknowledgedBy = null,
    Object? resolvedBy = freezed,
    Object? resolutionNotes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? metadata = null,
  }) {
    return _then(Alert(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as AlertType,
      severity: null == severity
          ? _self.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as AlertSeverity,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as AlertStatus,
      locationId: freezed == locationId
          ? _self.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String?,
      locationName: freezed == locationName
          ? _self.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      buildingId: freezed == buildingId
          ? _self.buildingId
          : buildingId // ignore: cast_nullable_to_non_nullable
              as String?,
      floor: freezed == floor
          ? _self.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int?,
      affectedArea: freezed == affectedArea
          ? _self.affectedArea
          : affectedArea // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdByRole: freezed == createdByRole
          ? _self.createdByRole
          : createdByRole // ignore: cast_nullable_to_non_nullable
              as String?,
      isSystemGenerated: null == isSystemGenerated
          ? _self.isSystemGenerated
          : isSystemGenerated // ignore: cast_nullable_to_non_nullable
              as bool,
      isTest: null == isTest
          ? _self.isTest
          : isTest // ignore: cast_nullable_to_non_nullable
              as bool,
      instructions: freezed == instructions
          ? _self.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String?,
      evacuationRouteId: freezed == evacuationRouteId
          ? _self.evacuationRouteId
          : evacuationRouteId // ignore: cast_nullable_to_non_nullable
              as String?,
      assemblyPointId: freezed == assemblyPointId
          ? _self.assemblyPointId
          : assemblyPointId // ignore: cast_nullable_to_non_nullable
              as String?,
      shelterId: freezed == shelterId
          ? _self.shelterId
          : shelterId // ignore: cast_nullable_to_non_nullable
              as String?,
      relatedAlertIds: null == relatedAlertIds
          ? _self.relatedAlertIds
          : relatedAlertIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      attachmentUrls: null == attachmentUrls
          ? _self.attachmentUrls
          : attachmentUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tags: null == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      targetRoles: null == targetRoles
          ? _self.targetRoles
          : targetRoles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      targetBuildingIds: null == targetBuildingIds
          ? _self.targetBuildingIds
          : targetBuildingIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      expiresAt: freezed == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      acknowledgedBy: null == acknowledgedBy
          ? _self.acknowledgedBy
          : acknowledgedBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
      resolvedBy: freezed == resolvedBy
          ? _self.resolvedBy
          : resolvedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      resolutionNotes: freezed == resolutionNotes
          ? _self.resolutionNotes
          : resolutionNotes // ignore: cast_nullable_to_non_nullable
              as String?,
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

/// Adds pattern-matching-related methods to [Alert].
extension AlertPatterns on Alert {
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
    TResult Function(_Alert value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Alert() when $default != null:
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
    TResult Function(_Alert value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Alert():
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
    TResult? Function(_Alert value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Alert() when $default != null:
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
            String message,
            AlertType type,
            AlertSeverity severity,
            AlertStatus status,
            String? locationId,
            String? locationName,
            double? latitude,
            double? longitude,
            String? buildingId,
            int? floor,
            String? affectedArea,
            String? createdBy,
            String? createdByRole,
            bool isSystemGenerated,
            bool isTest,
            String? instructions,
            String? evacuationRouteId,
            String? assemblyPointId,
            String? shelterId,
            List<String> relatedAlertIds,
            List<String> attachmentUrls,
            List<String> tags,
            List<String> targetRoles,
            List<String> targetBuildingIds,
            DateTime? expiresAt,
            List<String> acknowledgedBy,
            String? resolvedBy,
            String? resolutionNotes,
            DateTime createdAt,
            DateTime updatedAt,
            Map<String, dynamic> metadata)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Alert() when $default != null:
        return $default(
            _that.id,
            _that.title,
            _that.message,
            _that.type,
            _that.severity,
            _that.status,
            _that.locationId,
            _that.locationName,
            _that.latitude,
            _that.longitude,
            _that.buildingId,
            _that.floor,
            _that.affectedArea,
            _that.createdBy,
            _that.createdByRole,
            _that.isSystemGenerated,
            _that.isTest,
            _that.instructions,
            _that.evacuationRouteId,
            _that.assemblyPointId,
            _that.shelterId,
            _that.relatedAlertIds,
            _that.attachmentUrls,
            _that.tags,
            _that.targetRoles,
            _that.targetBuildingIds,
            _that.expiresAt,
            _that.acknowledgedBy,
            _that.resolvedBy,
            _that.resolutionNotes,
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
            String message,
            AlertType type,
            AlertSeverity severity,
            AlertStatus status,
            String? locationId,
            String? locationName,
            double? latitude,
            double? longitude,
            String? buildingId,
            int? floor,
            String? affectedArea,
            String? createdBy,
            String? createdByRole,
            bool isSystemGenerated,
            bool isTest,
            String? instructions,
            String? evacuationRouteId,
            String? assemblyPointId,
            String? shelterId,
            List<String> relatedAlertIds,
            List<String> attachmentUrls,
            List<String> tags,
            List<String> targetRoles,
            List<String> targetBuildingIds,
            DateTime? expiresAt,
            List<String> acknowledgedBy,
            String? resolvedBy,
            String? resolutionNotes,
            DateTime createdAt,
            DateTime updatedAt,
            Map<String, dynamic> metadata)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Alert():
        return $default(
            _that.id,
            _that.title,
            _that.message,
            _that.type,
            _that.severity,
            _that.status,
            _that.locationId,
            _that.locationName,
            _that.latitude,
            _that.longitude,
            _that.buildingId,
            _that.floor,
            _that.affectedArea,
            _that.createdBy,
            _that.createdByRole,
            _that.isSystemGenerated,
            _that.isTest,
            _that.instructions,
            _that.evacuationRouteId,
            _that.assemblyPointId,
            _that.shelterId,
            _that.relatedAlertIds,
            _that.attachmentUrls,
            _that.tags,
            _that.targetRoles,
            _that.targetBuildingIds,
            _that.expiresAt,
            _that.acknowledgedBy,
            _that.resolvedBy,
            _that.resolutionNotes,
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
            String message,
            AlertType type,
            AlertSeverity severity,
            AlertStatus status,
            String? locationId,
            String? locationName,
            double? latitude,
            double? longitude,
            String? buildingId,
            int? floor,
            String? affectedArea,
            String? createdBy,
            String? createdByRole,
            bool isSystemGenerated,
            bool isTest,
            String? instructions,
            String? evacuationRouteId,
            String? assemblyPointId,
            String? shelterId,
            List<String> relatedAlertIds,
            List<String> attachmentUrls,
            List<String> tags,
            List<String> targetRoles,
            List<String> targetBuildingIds,
            DateTime? expiresAt,
            List<String> acknowledgedBy,
            String? resolvedBy,
            String? resolutionNotes,
            DateTime createdAt,
            DateTime updatedAt,
            Map<String, dynamic> metadata)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Alert() when $default != null:
        return $default(
            _that.id,
            _that.title,
            _that.message,
            _that.type,
            _that.severity,
            _that.status,
            _that.locationId,
            _that.locationName,
            _that.latitude,
            _that.longitude,
            _that.buildingId,
            _that.floor,
            _that.affectedArea,
            _that.createdBy,
            _that.createdByRole,
            _that.isSystemGenerated,
            _that.isTest,
            _that.instructions,
            _that.evacuationRouteId,
            _that.assemblyPointId,
            _that.shelterId,
            _that.relatedAlertIds,
            _that.attachmentUrls,
            _that.tags,
            _that.targetRoles,
            _that.targetBuildingIds,
            _that.expiresAt,
            _that.acknowledgedBy,
            _that.resolvedBy,
            _that.resolutionNotes,
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
class _Alert implements Alert {
  const _Alert(
      {required this.id,
      required this.title,
      required this.message,
      required this.type,
      required this.severity,
      this.status = AlertStatus.active,
      this.locationId,
      this.locationName,
      this.latitude,
      this.longitude,
      this.buildingId,
      this.floor,
      this.affectedArea,
      this.createdBy,
      this.createdByRole,
      this.isSystemGenerated = false,
      this.isTest = false,
      this.instructions,
      this.evacuationRouteId,
      this.assemblyPointId,
      this.shelterId,
      List<String> relatedAlertIds = const [],
      List<String> attachmentUrls = const [],
      List<String> tags = const [],
      List<String> targetRoles = const [],
      List<String> targetBuildingIds = const [],
      this.expiresAt,
      List<String> acknowledgedBy = const [],
      this.resolvedBy,
      this.resolutionNotes,
      required this.createdAt,
      required this.updatedAt,
      Map<String, dynamic> metadata = const {}})
      : _relatedAlertIds = relatedAlertIds,
        _attachmentUrls = attachmentUrls,
        _tags = tags,
        _targetRoles = targetRoles,
        _targetBuildingIds = targetBuildingIds,
        _acknowledgedBy = acknowledgedBy,
        _metadata = metadata;
  factory _Alert.fromJson(Map<String, dynamic> json) => _$AlertFromJson(json);

  /// Unique alert ID
  @override
  final String id;

  /// Alert title
  @override
  final String title;

  /// Alert message/description
  @override
  final String message;

  /// Alert type
  @override
  final AlertType type;

  /// Alert severity
  @override
  final AlertSeverity severity;

  /// Current status
  @override
  @JsonKey()
  final AlertStatus status;

  /// Location ID where alert originated
  @override
  final String? locationId;

  /// Location name
  @override
  final String? locationName;

  /// Latitude of alert location
  @override
  final double? latitude;

  /// Longitude of alert location
  @override
  final double? longitude;

  /// Building affected
  @override
  final String? buildingId;

  /// Floor affected
  @override
  final int? floor;

  /// Affected area description
  @override
  final String? affectedArea;

  /// User ID who created the alert
  @override
  final String? createdBy;

  /// User role who created the alert
  @override
  final String? createdByRole;

  /// Whether this is a system-generated alert
  @override
  @JsonKey()
  final bool isSystemGenerated;

  /// Whether this is a test/drill
  @override
  @JsonKey()
  final bool isTest;

  /// Instructions for users
  @override
  final String? instructions;

  /// Evacuation route ID (if applicable)
  @override
  final String? evacuationRouteId;

  /// Assembly point ID (if applicable)
  @override
  final String? assemblyPointId;

  /// Shelter ID (if applicable)
  @override
  final String? shelterId;

  /// Related alert IDs
  final List<String> _relatedAlertIds;

  /// Related alert IDs
  @override
  @JsonKey()
  List<String> get relatedAlertIds {
    if (_relatedAlertIds is EqualUnmodifiableListView) return _relatedAlertIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_relatedAlertIds);
  }

  /// Attachments (photos, documents)
  final List<String> _attachmentUrls;

  /// Attachments (photos, documents)
  @override
  @JsonKey()
  List<String> get attachmentUrls {
    if (_attachmentUrls is EqualUnmodifiableListView) return _attachmentUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachmentUrls);
  }

  /// Tags for filtering
  final List<String> _tags;

  /// Tags for filtering
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  /// Target audience (roles)
  final List<String> _targetRoles;

  /// Target audience (roles)
  @override
  @JsonKey()
  List<String> get targetRoles {
    if (_targetRoles is EqualUnmodifiableListView) return _targetRoles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_targetRoles);
  }

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

  /// Expires at
  @override
  final DateTime? expiresAt;

  /// Acknowledged by user IDs
  final List<String> _acknowledgedBy;

  /// Acknowledged by user IDs
  @override
  @JsonKey()
  List<String> get acknowledgedBy {
    if (_acknowledgedBy is EqualUnmodifiableListView) return _acknowledgedBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_acknowledgedBy);
  }

  /// Resolved by user ID
  @override
  final String? resolvedBy;

  /// Resolution notes
  @override
  final String? resolutionNotes;

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

  /// Create a copy of Alert
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AlertCopyWith<_Alert> get copyWith =>
      __$AlertCopyWithImpl<_Alert>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AlertToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Alert &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.buildingId, buildingId) ||
                other.buildingId == buildingId) &&
            (identical(other.floor, floor) || other.floor == floor) &&
            (identical(other.affectedArea, affectedArea) ||
                other.affectedArea == affectedArea) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdByRole, createdByRole) ||
                other.createdByRole == createdByRole) &&
            (identical(other.isSystemGenerated, isSystemGenerated) ||
                other.isSystemGenerated == isSystemGenerated) &&
            (identical(other.isTest, isTest) || other.isTest == isTest) &&
            (identical(other.instructions, instructions) ||
                other.instructions == instructions) &&
            (identical(other.evacuationRouteId, evacuationRouteId) ||
                other.evacuationRouteId == evacuationRouteId) &&
            (identical(other.assemblyPointId, assemblyPointId) ||
                other.assemblyPointId == assemblyPointId) &&
            (identical(other.shelterId, shelterId) ||
                other.shelterId == shelterId) &&
            const DeepCollectionEquality()
                .equals(other.relatedAlertIds, _relatedAlertIds) &&
            const DeepCollectionEquality()
                .equals(other.attachmentUrls, _attachmentUrls) &&
            const DeepCollectionEquality().equals(other.tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other.targetRoles, _targetRoles) &&
            const DeepCollectionEquality()
                .equals(other.targetBuildingIds, _targetBuildingIds) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            const DeepCollectionEquality()
                .equals(other.acknowledgedBy, _acknowledgedBy) &&
            (identical(other.resolvedBy, resolvedBy) ||
                other.resolvedBy == resolvedBy) &&
            (identical(other.resolutionNotes, resolutionNotes) ||
                other.resolutionNotes == resolutionNotes) &&
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
      message,
      type,
      severity,
      status,
      locationId,
      locationName,
      latitude,
      longitude,
      buildingId,
      floor,
      affectedArea,
      createdBy,
      createdByRole,
      isSystemGenerated,
      isTest,
      instructions,
      evacuationRouteId,
      assemblyPointId,
      shelterId,
      const DeepCollectionEquality().hash(_relatedAlertIds),
      const DeepCollectionEquality().hash(_attachmentUrls),
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_targetRoles),
      const DeepCollectionEquality().hash(_targetBuildingIds),
      expiresAt,
      const DeepCollectionEquality().hash(_acknowledgedBy),
      resolvedBy,
      resolutionNotes,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_metadata)
    ]);
  }

  @override
  String toString() {
    return 'Alert(id: $id, title: $title, message: $message, type: $type, severity: $severity, status: $status, locationId: $locationId, locationName: $locationName, latitude: $latitude, longitude: $longitude, buildingId: $buildingId, floor: $floor, affectedArea: $affectedArea, createdBy: $createdBy, createdByRole: $createdByRole, isSystemGenerated: $isSystemGenerated, isTest: $isTest, instructions: $instructions, evacuationRouteId: $evacuationRouteId, assemblyPointId: $assemblyPointId, shelterId: $shelterId, relatedAlertIds: $relatedAlertIds, attachmentUrls: $attachmentUrls, tags: $tags, targetRoles: $targetRoles, targetBuildingIds: $targetBuildingIds, expiresAt: $expiresAt, acknowledgedBy: $acknowledgedBy, resolvedBy: $resolvedBy, resolutionNotes: $resolutionNotes, createdAt: $createdAt, updatedAt: $updatedAt, metadata: $metadata)';
  }
}

/// @nodoc
abstract mixin class _$AlertCopyWith<$Res> implements $AlertCopyWith<$Res> {
  factory _$AlertCopyWith(_Alert value, $Res Function(_Alert) _then) =
      __$AlertCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String message,
      AlertType type,
      AlertSeverity severity,
      AlertStatus status,
      String? locationId,
      String? locationName,
      double? latitude,
      double? longitude,
      String? buildingId,
      int? floor,
      String? affectedArea,
      String? createdBy,
      String? createdByRole,
      bool isSystemGenerated,
      bool isTest,
      String? instructions,
      String? evacuationRouteId,
      String? assemblyPointId,
      String? shelterId,
      List<String> relatedAlertIds,
      List<String> attachmentUrls,
      List<String> tags,
      List<String> targetRoles,
      List<String> targetBuildingIds,
      DateTime? expiresAt,
      List<String> acknowledgedBy,
      String? resolvedBy,
      String? resolutionNotes,
      DateTime createdAt,
      DateTime updatedAt,
      Map<String, dynamic> metadata});
}

/// @nodoc
class __$AlertCopyWithImpl<$Res> implements _$AlertCopyWith<$Res> {
  __$AlertCopyWithImpl(this._self, this._then);

  final _Alert _self;
  final $Res Function(_Alert) _then;

  /// Create a copy of Alert
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? message = null,
    Object? type = null,
    Object? severity = null,
    Object? status = null,
    Object? locationId = freezed,
    Object? locationName = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? buildingId = freezed,
    Object? floor = freezed,
    Object? affectedArea = freezed,
    Object? createdBy = freezed,
    Object? createdByRole = freezed,
    Object? isSystemGenerated = null,
    Object? isTest = null,
    Object? instructions = freezed,
    Object? evacuationRouteId = freezed,
    Object? assemblyPointId = freezed,
    Object? shelterId = freezed,
    Object? relatedAlertIds = null,
    Object? attachmentUrls = null,
    Object? tags = null,
    Object? targetRoles = null,
    Object? targetBuildingIds = null,
    Object? expiresAt = freezed,
    Object? acknowledgedBy = null,
    Object? resolvedBy = freezed,
    Object? resolutionNotes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? metadata = null,
  }) {
    return _then(_Alert(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as AlertType,
      severity: null == severity
          ? _self.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as AlertSeverity,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as AlertStatus,
      locationId: freezed == locationId
          ? _self.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String?,
      locationName: freezed == locationName
          ? _self.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      buildingId: freezed == buildingId
          ? _self.buildingId
          : buildingId // ignore: cast_nullable_to_non_nullable
              as String?,
      floor: freezed == floor
          ? _self.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int?,
      affectedArea: freezed == affectedArea
          ? _self.affectedArea
          : affectedArea // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdByRole: freezed == createdByRole
          ? _self.createdByRole
          : createdByRole // ignore: cast_nullable_to_non_nullable
              as String?,
      isSystemGenerated: null == isSystemGenerated
          ? _self.isSystemGenerated
          : isSystemGenerated // ignore: cast_nullable_to_non_nullable
              as bool,
      isTest: null == isTest
          ? _self.isTest
          : isTest // ignore: cast_nullable_to_non_nullable
              as bool,
      instructions: freezed == instructions
          ? _self.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String?,
      evacuationRouteId: freezed == evacuationRouteId
          ? _self.evacuationRouteId
          : evacuationRouteId // ignore: cast_nullable_to_non_nullable
              as String?,
      assemblyPointId: freezed == assemblyPointId
          ? _self.assemblyPointId
          : assemblyPointId // ignore: cast_nullable_to_non_nullable
              as String?,
      shelterId: freezed == shelterId
          ? _self.shelterId
          : shelterId // ignore: cast_nullable_to_non_nullable
              as String?,
      relatedAlertIds: null == relatedAlertIds
          ? _self._relatedAlertIds
          : relatedAlertIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      attachmentUrls: null == attachmentUrls
          ? _self._attachmentUrls
          : attachmentUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tags: null == tags
          ? _self._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      targetRoles: null == targetRoles
          ? _self._targetRoles
          : targetRoles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      targetBuildingIds: null == targetBuildingIds
          ? _self._targetBuildingIds
          : targetBuildingIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      expiresAt: freezed == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      acknowledgedBy: null == acknowledgedBy
          ? _self._acknowledgedBy
          : acknowledgedBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
      resolvedBy: freezed == resolvedBy
          ? _self.resolvedBy
          : resolvedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      resolutionNotes: freezed == resolutionNotes
          ? _self.resolutionNotes
          : resolutionNotes // ignore: cast_nullable_to_non_nullable
              as String?,
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

// dart format on
