// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alert.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Alert _$AlertFromJson(Map<String, dynamic> json) {
  return _Alert.fromJson(json);
}

/// @nodoc
mixin _$Alert {
  /// Unique alert ID
  String get id => throw _privateConstructorUsedError;

  /// Alert title
  String get title => throw _privateConstructorUsedError;

  /// Alert message/description
  String get message => throw _privateConstructorUsedError;

  /// Alert type
  AlertType get type => throw _privateConstructorUsedError;

  /// Alert severity
  AlertSeverity get severity => throw _privateConstructorUsedError;

  /// Current status
  AlertStatus get status => throw _privateConstructorUsedError;

  /// Location ID where alert originated
  String? get locationId => throw _privateConstructorUsedError;

  /// Location name
  String? get locationName => throw _privateConstructorUsedError;

  /// Latitude of alert location
  double? get latitude => throw _privateConstructorUsedError;

  /// Longitude of alert location
  double? get longitude => throw _privateConstructorUsedError;

  /// Building affected
  String? get buildingId => throw _privateConstructorUsedError;

  /// Floor affected
  int? get floor => throw _privateConstructorUsedError;

  /// Affected area description
  String? get affectedArea => throw _privateConstructorUsedError;

  /// User ID who created the alert
  String? get createdBy => throw _privateConstructorUsedError;

  /// User role who created the alert
  String? get createdByRole => throw _privateConstructorUsedError;

  /// Whether this is a system-generated alert
  bool get isSystemGenerated => throw _privateConstructorUsedError;

  /// Whether this is a test/drill
  bool get isTest => throw _privateConstructorUsedError;

  /// Instructions for users
  String? get instructions => throw _privateConstructorUsedError;

  /// Evacuation route ID (if applicable)
  String? get evacuationRouteId => throw _privateConstructorUsedError;

  /// Assembly point ID (if applicable)
  String? get assemblyPointId => throw _privateConstructorUsedError;

  /// Shelter ID (if applicable)
  String? get shelterId => throw _privateConstructorUsedError;

  /// Related alert IDs
  List<String> get relatedAlertIds => throw _privateConstructorUsedError;

  /// Attachments (photos, documents)
  List<String> get attachmentUrls => throw _privateConstructorUsedError;

  /// Tags for filtering
  List<String> get tags => throw _privateConstructorUsedError;

  /// Target audience (roles)
  List<String> get targetRoles => throw _privateConstructorUsedError;

  /// Target building IDs
  List<String> get targetBuildingIds => throw _privateConstructorUsedError;

  /// Expires at
  DateTime? get expiresAt => throw _privateConstructorUsedError;

  /// Acknowledged by user IDs
  List<String> get acknowledgedBy => throw _privateConstructorUsedError;

  /// Resolved by user ID
  String? get resolvedBy => throw _privateConstructorUsedError;

  /// Resolution notes
  String? get resolutionNotes => throw _privateConstructorUsedError;

  /// Created at
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Updated at
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Metadata
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlertCopyWith<Alert> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlertCopyWith<$Res> {
  factory $AlertCopyWith(Alert value, $Res Function(Alert) then) =
      _$AlertCopyWithImpl<$Res, Alert>;
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
class _$AlertCopyWithImpl<$Res, $Val extends Alert>
    implements $AlertCopyWith<$Res> {
  _$AlertCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AlertType,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as AlertSeverity,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AlertStatus,
      locationId: freezed == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String?,
      locationName: freezed == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      buildingId: freezed == buildingId
          ? _value.buildingId
          : buildingId // ignore: cast_nullable_to_non_nullable
              as String?,
      floor: freezed == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int?,
      affectedArea: freezed == affectedArea
          ? _value.affectedArea
          : affectedArea // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdByRole: freezed == createdByRole
          ? _value.createdByRole
          : createdByRole // ignore: cast_nullable_to_non_nullable
              as String?,
      isSystemGenerated: null == isSystemGenerated
          ? _value.isSystemGenerated
          : isSystemGenerated // ignore: cast_nullable_to_non_nullable
              as bool,
      isTest: null == isTest
          ? _value.isTest
          : isTest // ignore: cast_nullable_to_non_nullable
              as bool,
      instructions: freezed == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String?,
      evacuationRouteId: freezed == evacuationRouteId
          ? _value.evacuationRouteId
          : evacuationRouteId // ignore: cast_nullable_to_non_nullable
              as String?,
      assemblyPointId: freezed == assemblyPointId
          ? _value.assemblyPointId
          : assemblyPointId // ignore: cast_nullable_to_non_nullable
              as String?,
      shelterId: freezed == shelterId
          ? _value.shelterId
          : shelterId // ignore: cast_nullable_to_non_nullable
              as String?,
      relatedAlertIds: null == relatedAlertIds
          ? _value.relatedAlertIds
          : relatedAlertIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      attachmentUrls: null == attachmentUrls
          ? _value.attachmentUrls
          : attachmentUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      targetRoles: null == targetRoles
          ? _value.targetRoles
          : targetRoles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      targetBuildingIds: null == targetBuildingIds
          ? _value.targetBuildingIds
          : targetBuildingIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      acknowledgedBy: null == acknowledgedBy
          ? _value.acknowledgedBy
          : acknowledgedBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
      resolvedBy: freezed == resolvedBy
          ? _value.resolvedBy
          : resolvedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      resolutionNotes: freezed == resolutionNotes
          ? _value.resolutionNotes
          : resolutionNotes // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$AlertImplCopyWith<$Res> implements $AlertCopyWith<$Res> {
  factory _$$AlertImplCopyWith(
          _$AlertImpl value, $Res Function(_$AlertImpl) then) =
      __$$AlertImplCopyWithImpl<$Res>;
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
class __$$AlertImplCopyWithImpl<$Res>
    extends _$AlertCopyWithImpl<$Res, _$AlertImpl>
    implements _$$AlertImplCopyWith<$Res> {
  __$$AlertImplCopyWithImpl(
      _$AlertImpl _value, $Res Function(_$AlertImpl) _then)
      : super(_value, _then);

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
    return _then(_$AlertImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AlertType,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as AlertSeverity,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AlertStatus,
      locationId: freezed == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String?,
      locationName: freezed == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      buildingId: freezed == buildingId
          ? _value.buildingId
          : buildingId // ignore: cast_nullable_to_non_nullable
              as String?,
      floor: freezed == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int?,
      affectedArea: freezed == affectedArea
          ? _value.affectedArea
          : affectedArea // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdByRole: freezed == createdByRole
          ? _value.createdByRole
          : createdByRole // ignore: cast_nullable_to_non_nullable
              as String?,
      isSystemGenerated: null == isSystemGenerated
          ? _value.isSystemGenerated
          : isSystemGenerated // ignore: cast_nullable_to_non_nullable
              as bool,
      isTest: null == isTest
          ? _value.isTest
          : isTest // ignore: cast_nullable_to_non_nullable
              as bool,
      instructions: freezed == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String?,
      evacuationRouteId: freezed == evacuationRouteId
          ? _value.evacuationRouteId
          : evacuationRouteId // ignore: cast_nullable_to_non_nullable
              as String?,
      assemblyPointId: freezed == assemblyPointId
          ? _value.assemblyPointId
          : assemblyPointId // ignore: cast_nullable_to_non_nullable
              as String?,
      shelterId: freezed == shelterId
          ? _value.shelterId
          : shelterId // ignore: cast_nullable_to_non_nullable
              as String?,
      relatedAlertIds: null == relatedAlertIds
          ? _value._relatedAlertIds
          : relatedAlertIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      attachmentUrls: null == attachmentUrls
          ? _value._attachmentUrls
          : attachmentUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      targetRoles: null == targetRoles
          ? _value._targetRoles
          : targetRoles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      targetBuildingIds: null == targetBuildingIds
          ? _value._targetBuildingIds
          : targetBuildingIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      acknowledgedBy: null == acknowledgedBy
          ? _value._acknowledgedBy
          : acknowledgedBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
      resolvedBy: freezed == resolvedBy
          ? _value.resolvedBy
          : resolvedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      resolutionNotes: freezed == resolutionNotes
          ? _value.resolutionNotes
          : resolutionNotes // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$AlertImpl implements _Alert {
  const _$AlertImpl(
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
      final List<String> relatedAlertIds = const [],
      final List<String> attachmentUrls = const [],
      final List<String> tags = const [],
      final List<String> targetRoles = const [],
      final List<String> targetBuildingIds = const [],
      this.expiresAt,
      final List<String> acknowledgedBy = const [],
      this.resolvedBy,
      this.resolutionNotes,
      required this.createdAt,
      required this.updatedAt,
      final Map<String, dynamic> metadata = const {}})
      : _relatedAlertIds = relatedAlertIds,
        _attachmentUrls = attachmentUrls,
        _tags = tags,
        _targetRoles = targetRoles,
        _targetBuildingIds = targetBuildingIds,
        _acknowledgedBy = acknowledgedBy,
        _metadata = metadata;

  factory _$AlertImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlertImplFromJson(json);

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

  @override
  String toString() {
    return 'Alert(id: $id, title: $title, message: $message, type: $type, severity: $severity, status: $status, locationId: $locationId, locationName: $locationName, latitude: $latitude, longitude: $longitude, buildingId: $buildingId, floor: $floor, affectedArea: $affectedArea, createdBy: $createdBy, createdByRole: $createdByRole, isSystemGenerated: $isSystemGenerated, isTest: $isTest, instructions: $instructions, evacuationRouteId: $evacuationRouteId, assemblyPointId: $assemblyPointId, shelterId: $shelterId, relatedAlertIds: $relatedAlertIds, attachmentUrls: $attachmentUrls, tags: $tags, targetRoles: $targetRoles, targetBuildingIds: $targetBuildingIds, expiresAt: $expiresAt, acknowledgedBy: $acknowledgedBy, resolvedBy: $resolvedBy, resolutionNotes: $resolutionNotes, createdAt: $createdAt, updatedAt: $updatedAt, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlertImpl &&
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
                .equals(other._relatedAlertIds, _relatedAlertIds) &&
            const DeepCollectionEquality()
                .equals(other._attachmentUrls, _attachmentUrls) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other._targetRoles, _targetRoles) &&
            const DeepCollectionEquality()
                .equals(other._targetBuildingIds, _targetBuildingIds) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            const DeepCollectionEquality()
                .equals(other._acknowledgedBy, _acknowledgedBy) &&
            (identical(other.resolvedBy, resolvedBy) ||
                other.resolvedBy == resolvedBy) &&
            (identical(other.resolutionNotes, resolutionNotes) ||
                other.resolutionNotes == resolutionNotes) &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AlertImplCopyWith<_$AlertImpl> get copyWith =>
      __$$AlertImplCopyWithImpl<_$AlertImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlertImplToJson(
      this,
    );
  }
}

abstract class _Alert implements Alert {
  const factory _Alert(
      {required final String id,
      required final String title,
      required final String message,
      required final AlertType type,
      required final AlertSeverity severity,
      final AlertStatus status,
      final String? locationId,
      final String? locationName,
      final double? latitude,
      final double? longitude,
      final String? buildingId,
      final int? floor,
      final String? affectedArea,
      final String? createdBy,
      final String? createdByRole,
      final bool isSystemGenerated,
      final bool isTest,
      final String? instructions,
      final String? evacuationRouteId,
      final String? assemblyPointId,
      final String? shelterId,
      final List<String> relatedAlertIds,
      final List<String> attachmentUrls,
      final List<String> tags,
      final List<String> targetRoles,
      final List<String> targetBuildingIds,
      final DateTime? expiresAt,
      final List<String> acknowledgedBy,
      final String? resolvedBy,
      final String? resolutionNotes,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final Map<String, dynamic> metadata}) = _$AlertImpl;

  factory _Alert.fromJson(Map<String, dynamic> json) = _$AlertImpl.fromJson;

  @override

  /// Unique alert ID
  String get id;
  @override

  /// Alert title
  String get title;
  @override

  /// Alert message/description
  String get message;
  @override

  /// Alert type
  AlertType get type;
  @override

  /// Alert severity
  AlertSeverity get severity;
  @override

  /// Current status
  AlertStatus get status;
  @override

  /// Location ID where alert originated
  String? get locationId;
  @override

  /// Location name
  String? get locationName;
  @override

  /// Latitude of alert location
  double? get latitude;
  @override

  /// Longitude of alert location
  double? get longitude;
  @override

  /// Building affected
  String? get buildingId;
  @override

  /// Floor affected
  int? get floor;
  @override

  /// Affected area description
  String? get affectedArea;
  @override

  /// User ID who created the alert
  String? get createdBy;
  @override

  /// User role who created the alert
  String? get createdByRole;
  @override

  /// Whether this is a system-generated alert
  bool get isSystemGenerated;
  @override

  /// Whether this is a test/drill
  bool get isTest;
  @override

  /// Instructions for users
  String? get instructions;
  @override

  /// Evacuation route ID (if applicable)
  String? get evacuationRouteId;
  @override

  /// Assembly point ID (if applicable)
  String? get assemblyPointId;
  @override

  /// Shelter ID (if applicable)
  String? get shelterId;
  @override

  /// Related alert IDs
  List<String> get relatedAlertIds;
  @override

  /// Attachments (photos, documents)
  List<String> get attachmentUrls;
  @override

  /// Tags for filtering
  List<String> get tags;
  @override

  /// Target audience (roles)
  List<String> get targetRoles;
  @override

  /// Target building IDs
  List<String> get targetBuildingIds;
  @override

  /// Expires at
  DateTime? get expiresAt;
  @override

  /// Acknowledged by user IDs
  List<String> get acknowledgedBy;
  @override

  /// Resolved by user ID
  String? get resolvedBy;
  @override

  /// Resolution notes
  String? get resolutionNotes;
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
  _$$AlertImplCopyWith<_$AlertImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
