// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'evacuation_graph.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EvacuationEdge _$EvacuationEdgeFromJson(Map<String, dynamic> json) {
  return _EvacuationEdge.fromJson(json);
}

/// @nodoc
mixin _$EvacuationEdge {
  /// Unique edge ID
  String get id => throw _privateConstructorUsedError;

  /// Source node ID
  String get fromNodeId => throw _privateConstructorUsedError;

  /// Destination node ID
  String get toNodeId => throw _privateConstructorUsedError;

  /// Distance in meters
  double get distance => throw _privateConstructorUsedError;

  /// Estimated traversal time in seconds
  int get estimatedTimeSeconds => throw _privateConstructorUsedError;

  /// Whether this path is accessible for wheelchair users
  bool get isWheelchairAccessible => throw _privateConstructorUsedError;

  /// Whether this path is an emergency exit route
  bool get isEmergencyRoute => throw _privateConstructorUsedError;

  /// Floor level (for multi-floor buildings)
  int? get floor => throw _privateConstructorUsedError;

  /// Path description
  String? get description => throw _privateConstructorUsedError;

  /// Hazards on this path (e.g., "fire", "debris", "smoke")
  List<String> get hazards => throw _privateConstructorUsedError;

  /// Whether path is currently blocked
  bool get isBlocked => throw _privateConstructorUsedError;

  /// Block reason
  String? get blockReason => throw _privateConstructorUsedError;

  /// Timestamp when block was reported
  DateTime? get blockedAt => throw _privateConstructorUsedError;

  /// Metadata
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EvacuationEdgeCopyWith<EvacuationEdge> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EvacuationEdgeCopyWith<$Res> {
  factory $EvacuationEdgeCopyWith(
          EvacuationEdge value, $Res Function(EvacuationEdge) then) =
      _$EvacuationEdgeCopyWithImpl<$Res, EvacuationEdge>;
  @useResult
  $Res call(
      {String id,
      String fromNodeId,
      String toNodeId,
      double distance,
      int estimatedTimeSeconds,
      bool isWheelchairAccessible,
      bool isEmergencyRoute,
      int? floor,
      String? description,
      List<String> hazards,
      bool isBlocked,
      String? blockReason,
      DateTime? blockedAt,
      Map<String, dynamic> metadata});
}

/// @nodoc
class _$EvacuationEdgeCopyWithImpl<$Res, $Val extends EvacuationEdge>
    implements $EvacuationEdgeCopyWith<$Res> {
  _$EvacuationEdgeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fromNodeId = null,
    Object? toNodeId = null,
    Object? distance = null,
    Object? estimatedTimeSeconds = null,
    Object? isWheelchairAccessible = null,
    Object? isEmergencyRoute = null,
    Object? floor = freezed,
    Object? description = freezed,
    Object? hazards = null,
    Object? isBlocked = null,
    Object? blockReason = freezed,
    Object? blockedAt = freezed,
    Object? metadata = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fromNodeId: null == fromNodeId
          ? _value.fromNodeId
          : fromNodeId // ignore: cast_nullable_to_non_nullable
              as String,
      toNodeId: null == toNodeId
          ? _value.toNodeId
          : toNodeId // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      estimatedTimeSeconds: null == estimatedTimeSeconds
          ? _value.estimatedTimeSeconds
          : estimatedTimeSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      isWheelchairAccessible: null == isWheelchairAccessible
          ? _value.isWheelchairAccessible
          : isWheelchairAccessible // ignore: cast_nullable_to_non_nullable
              as bool,
      isEmergencyRoute: null == isEmergencyRoute
          ? _value.isEmergencyRoute
          : isEmergencyRoute // ignore: cast_nullable_to_non_nullable
              as bool,
      floor: freezed == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      hazards: null == hazards
          ? _value.hazards
          : hazards // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isBlocked: null == isBlocked
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      blockReason: freezed == blockReason
          ? _value.blockReason
          : blockReason // ignore: cast_nullable_to_non_nullable
              as String?,
      blockedAt: freezed == blockedAt
          ? _value.blockedAt
          : blockedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EvacuationEdgeImplCopyWith<$Res>
    implements $EvacuationEdgeCopyWith<$Res> {
  factory _$$EvacuationEdgeImplCopyWith(_$EvacuationEdgeImpl value,
          $Res Function(_$EvacuationEdgeImpl) then) =
      __$$EvacuationEdgeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String fromNodeId,
      String toNodeId,
      double distance,
      int estimatedTimeSeconds,
      bool isWheelchairAccessible,
      bool isEmergencyRoute,
      int? floor,
      String? description,
      List<String> hazards,
      bool isBlocked,
      String? blockReason,
      DateTime? blockedAt,
      Map<String, dynamic> metadata});
}

/// @nodoc
class __$$EvacuationEdgeImplCopyWithImpl<$Res>
    extends _$EvacuationEdgeCopyWithImpl<$Res, _$EvacuationEdgeImpl>
    implements _$$EvacuationEdgeImplCopyWith<$Res> {
  __$$EvacuationEdgeImplCopyWithImpl(
      _$EvacuationEdgeImpl _value, $Res Function(_$EvacuationEdgeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fromNodeId = null,
    Object? toNodeId = null,
    Object? distance = null,
    Object? estimatedTimeSeconds = null,
    Object? isWheelchairAccessible = null,
    Object? isEmergencyRoute = null,
    Object? floor = freezed,
    Object? description = freezed,
    Object? hazards = null,
    Object? isBlocked = null,
    Object? blockReason = freezed,
    Object? blockedAt = freezed,
    Object? metadata = null,
  }) {
    return _then(_$EvacuationEdgeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fromNodeId: null == fromNodeId
          ? _value.fromNodeId
          : fromNodeId // ignore: cast_nullable_to_non_nullable
              as String,
      toNodeId: null == toNodeId
          ? _value.toNodeId
          : toNodeId // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      estimatedTimeSeconds: null == estimatedTimeSeconds
          ? _value.estimatedTimeSeconds
          : estimatedTimeSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      isWheelchairAccessible: null == isWheelchairAccessible
          ? _value.isWheelchairAccessible
          : isWheelchairAccessible // ignore: cast_nullable_to_non_nullable
              as bool,
      isEmergencyRoute: null == isEmergencyRoute
          ? _value.isEmergencyRoute
          : isEmergencyRoute // ignore: cast_nullable_to_non_nullable
              as bool,
      floor: freezed == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      hazards: null == hazards
          ? _value._hazards
          : hazards // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isBlocked: null == isBlocked
          ? _value.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      blockReason: freezed == blockReason
          ? _value.blockReason
          : blockReason // ignore: cast_nullable_to_non_nullable
              as String?,
      blockedAt: freezed == blockedAt
          ? _value.blockedAt
          : blockedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EvacuationEdgeImpl implements _EvacuationEdge {
  const _$EvacuationEdgeImpl(
      {required this.id,
      required this.fromNodeId,
      required this.toNodeId,
      required this.distance,
      required this.estimatedTimeSeconds,
      this.isWheelchairAccessible = true,
      this.isEmergencyRoute = false,
      this.floor,
      this.description,
      final List<String> hazards = const [],
      this.isBlocked = false,
      this.blockReason,
      this.blockedAt,
      final Map<String, dynamic> metadata = const {}})
      : _hazards = hazards,
        _metadata = metadata;

  factory _$EvacuationEdgeImpl.fromJson(Map<String, dynamic> json) =>
      _$$EvacuationEdgeImplFromJson(json);

  /// Unique edge ID
  @override
  final String id;

  /// Source node ID
  @override
  final String fromNodeId;

  /// Destination node ID
  @override
  final String toNodeId;

  /// Distance in meters
  @override
  final double distance;

  /// Estimated traversal time in seconds
  @override
  final int estimatedTimeSeconds;

  /// Whether this path is accessible for wheelchair users
  @override
  @JsonKey()
  final bool isWheelchairAccessible;

  /// Whether this path is an emergency exit route
  @override
  @JsonKey()
  final bool isEmergencyRoute;

  /// Floor level (for multi-floor buildings)
  @override
  final int? floor;

  /// Path description
  @override
  final String? description;

  /// Hazards on this path (e.g., "fire", "debris", "smoke")
  final List<String> _hazards;

  /// Hazards on this path (e.g., "fire", "debris", "smoke")
  @override
  @JsonKey()
  List<String> get hazards {
    if (_hazards is EqualUnmodifiableListView) return _hazards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hazards);
  }

  /// Whether path is currently blocked
  @override
  @JsonKey()
  final bool isBlocked;

  /// Block reason
  @override
  final String? blockReason;

  /// Timestamp when block was reported
  @override
  final DateTime? blockedAt;

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
    return 'EvacuationEdge(id: $id, fromNodeId: $fromNodeId, toNodeId: $toNodeId, distance: $distance, estimatedTimeSeconds: $estimatedTimeSeconds, isWheelchairAccessible: $isWheelchairAccessible, isEmergencyRoute: $isEmergencyRoute, floor: $floor, description: $description, hazards: $hazards, isBlocked: $isBlocked, blockReason: $blockReason, blockedAt: $blockedAt, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EvacuationEdgeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fromNodeId, fromNodeId) ||
                other.fromNodeId == fromNodeId) &&
            (identical(other.toNodeId, toNodeId) ||
                other.toNodeId == toNodeId) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.estimatedTimeSeconds, estimatedTimeSeconds) ||
                other.estimatedTimeSeconds == estimatedTimeSeconds) &&
            (identical(other.isWheelchairAccessible, isWheelchairAccessible) ||
                other.isWheelchairAccessible == isWheelchairAccessible) &&
            (identical(other.isEmergencyRoute, isEmergencyRoute) ||
                other.isEmergencyRoute == isEmergencyRoute) &&
            (identical(other.floor, floor) || other.floor == floor) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._hazards, _hazards) &&
            (identical(other.isBlocked, isBlocked) ||
                other.isBlocked == isBlocked) &&
            (identical(other.blockReason, blockReason) ||
                other.blockReason == blockReason) &&
            (identical(other.blockedAt, blockedAt) ||
                other.blockedAt == blockedAt) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      fromNodeId,
      toNodeId,
      distance,
      estimatedTimeSeconds,
      isWheelchairAccessible,
      isEmergencyRoute,
      floor,
      description,
      const DeepCollectionEquality().hash(_hazards),
      isBlocked,
      blockReason,
      blockedAt,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EvacuationEdgeImplCopyWith<_$EvacuationEdgeImpl> get copyWith =>
      __$$EvacuationEdgeImplCopyWithImpl<_$EvacuationEdgeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EvacuationEdgeImplToJson(
      this,
    );
  }
}

abstract class _EvacuationEdge implements EvacuationEdge {
  const factory _EvacuationEdge(
      {required final String id,
      required final String fromNodeId,
      required final String toNodeId,
      required final double distance,
      required final int estimatedTimeSeconds,
      final bool isWheelchairAccessible,
      final bool isEmergencyRoute,
      final int? floor,
      final String? description,
      final List<String> hazards,
      final bool isBlocked,
      final String? blockReason,
      final DateTime? blockedAt,
      final Map<String, dynamic> metadata}) = _$EvacuationEdgeImpl;

  factory _EvacuationEdge.fromJson(Map<String, dynamic> json) =
      _$EvacuationEdgeImpl.fromJson;

  @override

  /// Unique edge ID
  String get id;
  @override

  /// Source node ID
  String get fromNodeId;
  @override

  /// Destination node ID
  String get toNodeId;
  @override

  /// Distance in meters
  double get distance;
  @override

  /// Estimated traversal time in seconds
  int get estimatedTimeSeconds;
  @override

  /// Whether this path is accessible for wheelchair users
  bool get isWheelchairAccessible;
  @override

  /// Whether this path is an emergency exit route
  bool get isEmergencyRoute;
  @override

  /// Floor level (for multi-floor buildings)
  int? get floor;
  @override

  /// Path description
  String? get description;
  @override

  /// Hazards on this path (e.g., "fire", "debris", "smoke")
  List<String> get hazards;
  @override

  /// Whether path is currently blocked
  bool get isBlocked;
  @override

  /// Block reason
  String? get blockReason;
  @override

  /// Timestamp when block was reported
  DateTime? get blockedAt;
  @override

  /// Metadata
  Map<String, dynamic> get metadata;
  @override
  @JsonKey(ignore: true)
  _$$EvacuationEdgeImplCopyWith<_$EvacuationEdgeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EvacuationNode _$EvacuationNodeFromJson(Map<String, dynamic> json) {
  return _EvacuationNode.fromJson(json);
}

/// @nodoc
mixin _$EvacuationNode {
  /// Unique node ID
  String get id => throw _privateConstructorUsedError;

  /// Node label/name
  String get label => throw _privateConstructorUsedError;

  /// Node type
  EvacuationNodeType get type => throw _privateConstructorUsedError;

  /// Latitude
  double get latitude => throw _privateConstructorUsedError;

  /// Longitude
  double get longitude => throw _privateConstructorUsedError;

  /// Floor level
  int? get floor => throw _privateConstructorUsedError;

  /// Building ID this node belongs to
  String? get buildingId => throw _privateConstructorUsedError;

  /// Room/area identifier
  String? get roomId => throw _privateConstructorUsedError;

  /// Whether this node is an exit to outside
  bool get isExit => throw _privateConstructorUsedError;

  /// Whether this node is an assembly point
  bool get isAssemblyPoint => throw _privateConstructorUsedError;

  /// Whether this node is a shelter
  bool get isShelter => throw _privateConstructorUsedError;

  /// Capacity (for assembly points/shelters)
  int? get capacity => throw _privateConstructorUsedError;

  /// Current occupancy (for real-time updates)
  int get currentOccupancy => throw _privateConstructorUsedError;

  /// Accessibility features
  List<String> get accessibilityFeatures => throw _privateConstructorUsedError;

  /// Emergency equipment at this node
  List<String> get emergencyEquipment => throw _privateConstructorUsedError;

  /// Connected edge IDs
  List<String> get connectedEdgeIds => throw _privateConstructorUsedError;

  /// Metadata
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EvacuationNodeCopyWith<EvacuationNode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EvacuationNodeCopyWith<$Res> {
  factory $EvacuationNodeCopyWith(
          EvacuationNode value, $Res Function(EvacuationNode) then) =
      _$EvacuationNodeCopyWithImpl<$Res, EvacuationNode>;
  @useResult
  $Res call(
      {String id,
      String label,
      EvacuationNodeType type,
      double latitude,
      double longitude,
      int? floor,
      String? buildingId,
      String? roomId,
      bool isExit,
      bool isAssemblyPoint,
      bool isShelter,
      int? capacity,
      int currentOccupancy,
      List<String> accessibilityFeatures,
      List<String> emergencyEquipment,
      List<String> connectedEdgeIds,
      Map<String, dynamic> metadata});
}

/// @nodoc
class _$EvacuationNodeCopyWithImpl<$Res, $Val extends EvacuationNode>
    implements $EvacuationNodeCopyWith<$Res> {
  _$EvacuationNodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? type = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? floor = freezed,
    Object? buildingId = freezed,
    Object? roomId = freezed,
    Object? isExit = null,
    Object? isAssemblyPoint = null,
    Object? isShelter = null,
    Object? capacity = freezed,
    Object? currentOccupancy = null,
    Object? accessibilityFeatures = null,
    Object? emergencyEquipment = null,
    Object? connectedEdgeIds = null,
    Object? metadata = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EvacuationNodeType,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      floor: freezed == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int?,
      buildingId: freezed == buildingId
          ? _value.buildingId
          : buildingId // ignore: cast_nullable_to_non_nullable
              as String?,
      roomId: freezed == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String?,
      isExit: null == isExit
          ? _value.isExit
          : isExit // ignore: cast_nullable_to_non_nullable
              as bool,
      isAssemblyPoint: null == isAssemblyPoint
          ? _value.isAssemblyPoint
          : isAssemblyPoint // ignore: cast_nullable_to_non_nullable
              as bool,
      isShelter: null == isShelter
          ? _value.isShelter
          : isShelter // ignore: cast_nullable_to_non_nullable
              as bool,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      currentOccupancy: null == currentOccupancy
          ? _value.currentOccupancy
          : currentOccupancy // ignore: cast_nullable_to_non_nullable
              as int,
      accessibilityFeatures: null == accessibilityFeatures
          ? _value.accessibilityFeatures
          : accessibilityFeatures // ignore: cast_nullable_to_non_nullable
              as List<String>,
      emergencyEquipment: null == emergencyEquipment
          ? _value.emergencyEquipment
          : emergencyEquipment // ignore: cast_nullable_to_non_nullable
              as List<String>,
      connectedEdgeIds: null == connectedEdgeIds
          ? _value.connectedEdgeIds
          : connectedEdgeIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EvacuationNodeImplCopyWith<$Res>
    implements $EvacuationNodeCopyWith<$Res> {
  factory _$$EvacuationNodeImplCopyWith(_$EvacuationNodeImpl value,
          $Res Function(_$EvacuationNodeImpl) then) =
      __$$EvacuationNodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String label,
      EvacuationNodeType type,
      double latitude,
      double longitude,
      int? floor,
      String? buildingId,
      String? roomId,
      bool isExit,
      bool isAssemblyPoint,
      bool isShelter,
      int? capacity,
      int currentOccupancy,
      List<String> accessibilityFeatures,
      List<String> emergencyEquipment,
      List<String> connectedEdgeIds,
      Map<String, dynamic> metadata});
}

/// @nodoc
class __$$EvacuationNodeImplCopyWithImpl<$Res>
    extends _$EvacuationNodeCopyWithImpl<$Res, _$EvacuationNodeImpl>
    implements _$$EvacuationNodeImplCopyWith<$Res> {
  __$$EvacuationNodeImplCopyWithImpl(
      _$EvacuationNodeImpl _value, $Res Function(_$EvacuationNodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? type = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? floor = freezed,
    Object? buildingId = freezed,
    Object? roomId = freezed,
    Object? isExit = null,
    Object? isAssemblyPoint = null,
    Object? isShelter = null,
    Object? capacity = freezed,
    Object? currentOccupancy = null,
    Object? accessibilityFeatures = null,
    Object? emergencyEquipment = null,
    Object? connectedEdgeIds = null,
    Object? metadata = null,
  }) {
    return _then(_$EvacuationNodeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EvacuationNodeType,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      floor: freezed == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int?,
      buildingId: freezed == buildingId
          ? _value.buildingId
          : buildingId // ignore: cast_nullable_to_non_nullable
              as String?,
      roomId: freezed == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String?,
      isExit: null == isExit
          ? _value.isExit
          : isExit // ignore: cast_nullable_to_non_nullable
              as bool,
      isAssemblyPoint: null == isAssemblyPoint
          ? _value.isAssemblyPoint
          : isAssemblyPoint // ignore: cast_nullable_to_non_nullable
              as bool,
      isShelter: null == isShelter
          ? _value.isShelter
          : isShelter // ignore: cast_nullable_to_non_nullable
              as bool,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      currentOccupancy: null == currentOccupancy
          ? _value.currentOccupancy
          : currentOccupancy // ignore: cast_nullable_to_non_nullable
              as int,
      accessibilityFeatures: null == accessibilityFeatures
          ? _value._accessibilityFeatures
          : accessibilityFeatures // ignore: cast_nullable_to_non_nullable
              as List<String>,
      emergencyEquipment: null == emergencyEquipment
          ? _value._emergencyEquipment
          : emergencyEquipment // ignore: cast_nullable_to_non_nullable
              as List<String>,
      connectedEdgeIds: null == connectedEdgeIds
          ? _value._connectedEdgeIds
          : connectedEdgeIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EvacuationNodeImpl implements _EvacuationNode {
  const _$EvacuationNodeImpl(
      {required this.id,
      required this.label,
      required this.type,
      required this.latitude,
      required this.longitude,
      this.floor,
      this.buildingId,
      this.roomId,
      this.isExit = false,
      this.isAssemblyPoint = false,
      this.isShelter = false,
      this.capacity,
      this.currentOccupancy = 0,
      final List<String> accessibilityFeatures = const [],
      final List<String> emergencyEquipment = const [],
      final List<String> connectedEdgeIds = const [],
      final Map<String, dynamic> metadata = const {}})
      : _accessibilityFeatures = accessibilityFeatures,
        _emergencyEquipment = emergencyEquipment,
        _connectedEdgeIds = connectedEdgeIds,
        _metadata = metadata;

  factory _$EvacuationNodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$EvacuationNodeImplFromJson(json);

  /// Unique node ID
  @override
  final String id;

  /// Node label/name
  @override
  final String label;

  /// Node type
  @override
  final EvacuationNodeType type;

  /// Latitude
  @override
  final double latitude;

  /// Longitude
  @override
  final double longitude;

  /// Floor level
  @override
  final int? floor;

  /// Building ID this node belongs to
  @override
  final String? buildingId;

  /// Room/area identifier
  @override
  final String? roomId;

  /// Whether this node is an exit to outside
  @override
  @JsonKey()
  final bool isExit;

  /// Whether this node is an assembly point
  @override
  @JsonKey()
  final bool isAssemblyPoint;

  /// Whether this node is a shelter
  @override
  @JsonKey()
  final bool isShelter;

  /// Capacity (for assembly points/shelters)
  @override
  final int? capacity;

  /// Current occupancy (for real-time updates)
  @override
  @JsonKey()
  final int currentOccupancy;

  /// Accessibility features
  final List<String> _accessibilityFeatures;

  /// Accessibility features
  @override
  @JsonKey()
  List<String> get accessibilityFeatures {
    if (_accessibilityFeatures is EqualUnmodifiableListView)
      return _accessibilityFeatures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accessibilityFeatures);
  }

  /// Emergency equipment at this node
  final List<String> _emergencyEquipment;

  /// Emergency equipment at this node
  @override
  @JsonKey()
  List<String> get emergencyEquipment {
    if (_emergencyEquipment is EqualUnmodifiableListView)
      return _emergencyEquipment;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_emergencyEquipment);
  }

  /// Connected edge IDs
  final List<String> _connectedEdgeIds;

  /// Connected edge IDs
  @override
  @JsonKey()
  List<String> get connectedEdgeIds {
    if (_connectedEdgeIds is EqualUnmodifiableListView)
      return _connectedEdgeIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_connectedEdgeIds);
  }

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
    return 'EvacuationNode(id: $id, label: $label, type: $type, latitude: $latitude, longitude: $longitude, floor: $floor, buildingId: $buildingId, roomId: $roomId, isExit: $isExit, isAssemblyPoint: $isAssemblyPoint, isShelter: $isShelter, capacity: $capacity, currentOccupancy: $currentOccupancy, accessibilityFeatures: $accessibilityFeatures, emergencyEquipment: $emergencyEquipment, connectedEdgeIds: $connectedEdgeIds, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EvacuationNodeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.floor, floor) || other.floor == floor) &&
            (identical(other.buildingId, buildingId) ||
                other.buildingId == buildingId) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.isExit, isExit) || other.isExit == isExit) &&
            (identical(other.isAssemblyPoint, isAssemblyPoint) ||
                other.isAssemblyPoint == isAssemblyPoint) &&
            (identical(other.isShelter, isShelter) ||
                other.isShelter == isShelter) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.currentOccupancy, currentOccupancy) ||
                other.currentOccupancy == currentOccupancy) &&
            const DeepCollectionEquality()
                .equals(other._accessibilityFeatures, _accessibilityFeatures) &&
            const DeepCollectionEquality()
                .equals(other._emergencyEquipment, _emergencyEquipment) &&
            const DeepCollectionEquality()
                .equals(other._connectedEdgeIds, _connectedEdgeIds) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      label,
      type,
      latitude,
      longitude,
      floor,
      buildingId,
      roomId,
      isExit,
      isAssemblyPoint,
      isShelter,
      capacity,
      currentOccupancy,
      const DeepCollectionEquality().hash(_accessibilityFeatures),
      const DeepCollectionEquality().hash(_emergencyEquipment),
      const DeepCollectionEquality().hash(_connectedEdgeIds),
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EvacuationNodeImplCopyWith<_$EvacuationNodeImpl> get copyWith =>
      __$$EvacuationNodeImplCopyWithImpl<_$EvacuationNodeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EvacuationNodeImplToJson(
      this,
    );
  }
}

abstract class _EvacuationNode implements EvacuationNode {
  const factory _EvacuationNode(
      {required final String id,
      required final String label,
      required final EvacuationNodeType type,
      required final double latitude,
      required final double longitude,
      final int? floor,
      final String? buildingId,
      final String? roomId,
      final bool isExit,
      final bool isAssemblyPoint,
      final bool isShelter,
      final int? capacity,
      final int currentOccupancy,
      final List<String> accessibilityFeatures,
      final List<String> emergencyEquipment,
      final List<String> connectedEdgeIds,
      final Map<String, dynamic> metadata}) = _$EvacuationNodeImpl;

  factory _EvacuationNode.fromJson(Map<String, dynamic> json) =
      _$EvacuationNodeImpl.fromJson;

  @override

  /// Unique node ID
  String get id;
  @override

  /// Node label/name
  String get label;
  @override

  /// Node type
  EvacuationNodeType get type;
  @override

  /// Latitude
  double get latitude;
  @override

  /// Longitude
  double get longitude;
  @override

  /// Floor level
  int? get floor;
  @override

  /// Building ID this node belongs to
  String? get buildingId;
  @override

  /// Room/area identifier
  String? get roomId;
  @override

  /// Whether this node is an exit to outside
  bool get isExit;
  @override

  /// Whether this node is an assembly point
  bool get isAssemblyPoint;
  @override

  /// Whether this node is a shelter
  bool get isShelter;
  @override

  /// Capacity (for assembly points/shelters)
  int? get capacity;
  @override

  /// Current occupancy (for real-time updates)
  int get currentOccupancy;
  @override

  /// Accessibility features
  List<String> get accessibilityFeatures;
  @override

  /// Emergency equipment at this node
  List<String> get emergencyEquipment;
  @override

  /// Connected edge IDs
  List<String> get connectedEdgeIds;
  @override

  /// Metadata
  Map<String, dynamic> get metadata;
  @override
  @JsonKey(ignore: true)
  _$$EvacuationNodeImplCopyWith<_$EvacuationNodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EvacuationGraph _$EvacuationGraphFromJson(Map<String, dynamic> json) {
  return _EvacuationGraph.fromJson(json);
}

/// @nodoc
mixin _$EvacuationGraph {
  /// Unique graph ID
  String get id => throw _privateConstructorUsedError;

  /// Graph name (e.g., "Main Building", "Campus Wide")
  String get name => throw _privateConstructorUsedError;

  /// Building ID (if building-specific)
  String? get buildingId => throw _privateConstructorUsedError;

  /// Version number for cache invalidation
  int get version => throw _privateConstructorUsedError;

  /// All nodes in the graph
  List<EvacuationNode> get nodes => throw _privateConstructorUsedError;

  /// All edges in the graph
  List<EvacuationEdge> get edges => throw _privateConstructorUsedError;

  /// Default assembly points
  List<String> get defaultAssemblyPointIds =>
      throw _privateConstructorUsedError;

  /// Default shelter locations
  List<String> get defaultShelterIds => throw _privateConstructorUsedError;

  /// Graph bounds (minLat, minLng, maxLat, maxLng)
  List<double> get bounds => throw _privateConstructorUsedError;

  /// Creation timestamp
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Last update timestamp
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Source of graph data
  String? get dataSource => throw _privateConstructorUsedError;

  /// Metadata
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EvacuationGraphCopyWith<EvacuationGraph> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EvacuationGraphCopyWith<$Res> {
  factory $EvacuationGraphCopyWith(
          EvacuationGraph value, $Res Function(EvacuationGraph) then) =
      _$EvacuationGraphCopyWithImpl<$Res, EvacuationGraph>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? buildingId,
      int version,
      List<EvacuationNode> nodes,
      List<EvacuationEdge> edges,
      List<String> defaultAssemblyPointIds,
      List<String> defaultShelterIds,
      List<double> bounds,
      DateTime createdAt,
      DateTime updatedAt,
      String? dataSource,
      Map<String, dynamic> metadata});
}

/// @nodoc
class _$EvacuationGraphCopyWithImpl<$Res, $Val extends EvacuationGraph>
    implements $EvacuationGraphCopyWith<$Res> {
  _$EvacuationGraphCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? buildingId = freezed,
    Object? version = null,
    Object? nodes = null,
    Object? edges = null,
    Object? defaultAssemblyPointIds = null,
    Object? defaultShelterIds = null,
    Object? bounds = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? dataSource = freezed,
    Object? metadata = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      buildingId: freezed == buildingId
          ? _value.buildingId
          : buildingId // ignore: cast_nullable_to_non_nullable
              as String?,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      nodes: null == nodes
          ? _value.nodes
          : nodes // ignore: cast_nullable_to_non_nullable
              as List<EvacuationNode>,
      edges: null == edges
          ? _value.edges
          : edges // ignore: cast_nullable_to_non_nullable
              as List<EvacuationEdge>,
      defaultAssemblyPointIds: null == defaultAssemblyPointIds
          ? _value.defaultAssemblyPointIds
          : defaultAssemblyPointIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      defaultShelterIds: null == defaultShelterIds
          ? _value.defaultShelterIds
          : defaultShelterIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      bounds: null == bounds
          ? _value.bounds
          : bounds // ignore: cast_nullable_to_non_nullable
              as List<double>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dataSource: freezed == dataSource
          ? _value.dataSource
          : dataSource // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EvacuationGraphImplCopyWith<$Res>
    implements $EvacuationGraphCopyWith<$Res> {
  factory _$$EvacuationGraphImplCopyWith(_$EvacuationGraphImpl value,
          $Res Function(_$EvacuationGraphImpl) then) =
      __$$EvacuationGraphImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? buildingId,
      int version,
      List<EvacuationNode> nodes,
      List<EvacuationEdge> edges,
      List<String> defaultAssemblyPointIds,
      List<String> defaultShelterIds,
      List<double> bounds,
      DateTime createdAt,
      DateTime updatedAt,
      String? dataSource,
      Map<String, dynamic> metadata});
}

/// @nodoc
class __$$EvacuationGraphImplCopyWithImpl<$Res>
    extends _$EvacuationGraphCopyWithImpl<$Res, _$EvacuationGraphImpl>
    implements _$$EvacuationGraphImplCopyWith<$Res> {
  __$$EvacuationGraphImplCopyWithImpl(
      _$EvacuationGraphImpl _value, $Res Function(_$EvacuationGraphImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? buildingId = freezed,
    Object? version = null,
    Object? nodes = null,
    Object? edges = null,
    Object? defaultAssemblyPointIds = null,
    Object? defaultShelterIds = null,
    Object? bounds = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? dataSource = freezed,
    Object? metadata = null,
  }) {
    return _then(_$EvacuationGraphImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      buildingId: freezed == buildingId
          ? _value.buildingId
          : buildingId // ignore: cast_nullable_to_non_nullable
              as String?,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      nodes: null == nodes
          ? _value._nodes
          : nodes // ignore: cast_nullable_to_non_nullable
              as List<EvacuationNode>,
      edges: null == edges
          ? _value._edges
          : edges // ignore: cast_nullable_to_non_nullable
              as List<EvacuationEdge>,
      defaultAssemblyPointIds: null == defaultAssemblyPointIds
          ? _value._defaultAssemblyPointIds
          : defaultAssemblyPointIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      defaultShelterIds: null == defaultShelterIds
          ? _value._defaultShelterIds
          : defaultShelterIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      bounds: null == bounds
          ? _value._bounds
          : bounds // ignore: cast_nullable_to_non_nullable
              as List<double>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dataSource: freezed == dataSource
          ? _value.dataSource
          : dataSource // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EvacuationGraphImpl implements _EvacuationGraph {
  const _$EvacuationGraphImpl(
      {required this.id,
      required this.name,
      this.buildingId,
      required this.version,
      required final List<EvacuationNode> nodes,
      required final List<EvacuationEdge> edges,
      final List<String> defaultAssemblyPointIds = const [],
      final List<String> defaultShelterIds = const [],
      required final List<double> bounds,
      required this.createdAt,
      required this.updatedAt,
      this.dataSource,
      final Map<String, dynamic> metadata = const {}})
      : _nodes = nodes,
        _edges = edges,
        _defaultAssemblyPointIds = defaultAssemblyPointIds,
        _defaultShelterIds = defaultShelterIds,
        _bounds = bounds,
        _metadata = metadata;

  factory _$EvacuationGraphImpl.fromJson(Map<String, dynamic> json) =>
      _$$EvacuationGraphImplFromJson(json);

  /// Unique graph ID
  @override
  final String id;

  /// Graph name (e.g., "Main Building", "Campus Wide")
  @override
  final String name;

  /// Building ID (if building-specific)
  @override
  final String? buildingId;

  /// Version number for cache invalidation
  @override
  final int version;

  /// All nodes in the graph
  final List<EvacuationNode> _nodes;

  /// All nodes in the graph
  @override
  List<EvacuationNode> get nodes {
    if (_nodes is EqualUnmodifiableListView) return _nodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nodes);
  }

  /// All edges in the graph
  final List<EvacuationEdge> _edges;

  /// All edges in the graph
  @override
  List<EvacuationEdge> get edges {
    if (_edges is EqualUnmodifiableListView) return _edges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_edges);
  }

  /// Default assembly points
  final List<String> _defaultAssemblyPointIds;

  /// Default assembly points
  @override
  @JsonKey()
  List<String> get defaultAssemblyPointIds {
    if (_defaultAssemblyPointIds is EqualUnmodifiableListView)
      return _defaultAssemblyPointIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_defaultAssemblyPointIds);
  }

  /// Default shelter locations
  final List<String> _defaultShelterIds;

  /// Default shelter locations
  @override
  @JsonKey()
  List<String> get defaultShelterIds {
    if (_defaultShelterIds is EqualUnmodifiableListView)
      return _defaultShelterIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_defaultShelterIds);
  }

  /// Graph bounds (minLat, minLng, maxLat, maxLng)
  final List<double> _bounds;

  /// Graph bounds (minLat, minLng, maxLat, maxLng)
  @override
  List<double> get bounds {
    if (_bounds is EqualUnmodifiableListView) return _bounds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bounds);
  }

  /// Creation timestamp
  @override
  final DateTime createdAt;

  /// Last update timestamp
  @override
  final DateTime updatedAt;

  /// Source of graph data
  @override
  final String? dataSource;

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
    return 'EvacuationGraph(id: $id, name: $name, buildingId: $buildingId, version: $version, nodes: $nodes, edges: $edges, defaultAssemblyPointIds: $defaultAssemblyPointIds, defaultShelterIds: $defaultShelterIds, bounds: $bounds, createdAt: $createdAt, updatedAt: $updatedAt, dataSource: $dataSource, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EvacuationGraphImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.buildingId, buildingId) ||
                other.buildingId == buildingId) &&
            (identical(other.version, version) || other.version == version) &&
            const DeepCollectionEquality().equals(other._nodes, _nodes) &&
            const DeepCollectionEquality().equals(other._edges, _edges) &&
            const DeepCollectionEquality().equals(
                other._defaultAssemblyPointIds, _defaultAssemblyPointIds) &&
            const DeepCollectionEquality()
                .equals(other._defaultShelterIds, _defaultShelterIds) &&
            const DeepCollectionEquality().equals(other._bounds, _bounds) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.dataSource, dataSource) ||
                other.dataSource == dataSource) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      buildingId,
      version,
      const DeepCollectionEquality().hash(_nodes),
      const DeepCollectionEquality().hash(_edges),
      const DeepCollectionEquality().hash(_defaultAssemblyPointIds),
      const DeepCollectionEquality().hash(_defaultShelterIds),
      const DeepCollectionEquality().hash(_bounds),
      createdAt,
      updatedAt,
      dataSource,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EvacuationGraphImplCopyWith<_$EvacuationGraphImpl> get copyWith =>
      __$$EvacuationGraphImplCopyWithImpl<_$EvacuationGraphImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EvacuationGraphImplToJson(
      this,
    );
  }
}

abstract class _EvacuationGraph implements EvacuationGraph {
  const factory _EvacuationGraph(
      {required final String id,
      required final String name,
      final String? buildingId,
      required final int version,
      required final List<EvacuationNode> nodes,
      required final List<EvacuationEdge> edges,
      final List<String> defaultAssemblyPointIds,
      final List<String> defaultShelterIds,
      required final List<double> bounds,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final String? dataSource,
      final Map<String, dynamic> metadata}) = _$EvacuationGraphImpl;

  factory _EvacuationGraph.fromJson(Map<String, dynamic> json) =
      _$EvacuationGraphImpl.fromJson;

  @override

  /// Unique graph ID
  String get id;
  @override

  /// Graph name (e.g., "Main Building", "Campus Wide")
  String get name;
  @override

  /// Building ID (if building-specific)
  String? get buildingId;
  @override

  /// Version number for cache invalidation
  int get version;
  @override

  /// All nodes in the graph
  List<EvacuationNode> get nodes;
  @override

  /// All edges in the graph
  List<EvacuationEdge> get edges;
  @override

  /// Default assembly points
  List<String> get defaultAssemblyPointIds;
  @override

  /// Default shelter locations
  List<String> get defaultShelterIds;
  @override

  /// Graph bounds (minLat, minLng, maxLat, maxLng)
  List<double> get bounds;
  @override

  /// Creation timestamp
  DateTime get createdAt;
  @override

  /// Last update timestamp
  DateTime get updatedAt;
  @override

  /// Source of graph data
  String? get dataSource;
  @override

  /// Metadata
  Map<String, dynamic> get metadata;
  @override
  @JsonKey(ignore: true)
  _$$EvacuationGraphImplCopyWith<_$EvacuationGraphImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
