// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'evacuation_graph.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EvacuationEdge {
  /// Unique edge ID
  String get id;

  /// Source node ID
  String get fromNodeId;

  /// Destination node ID
  String get toNodeId;

  /// Distance in meters
  double get distance;

  /// Estimated traversal time in seconds
  int get estimatedTimeSeconds;

  /// Whether this path is accessible for wheelchair users
  bool get isWheelchairAccessible;

  /// Whether this path is an emergency exit route
  bool get isEmergencyRoute;

  /// Floor level (for multi-floor buildings)
  int? get floor;

  /// Path description
  String? get description;

  /// Hazards on this path (e.g., "fire", "debris", "smoke")
  List<String> get hazards;

  /// Whether path is currently blocked
  bool get isBlocked;

  /// Block reason
  String? get blockReason;

  /// Timestamp when block was reported
  DateTime? get blockedAt;

  /// Metadata
  Map<String, dynamic> get metadata;

  /// Create a copy of EvacuationEdge
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EvacuationEdgeCopyWith<EvacuationEdge> get copyWith =>
      _$EvacuationEdgeCopyWithImpl<EvacuationEdge>(
          this as EvacuationEdge, _$identity);

  /// Serializes this EvacuationEdge to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as EvacuationEdge;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EvacuationEdge &&
            (identical(other.id, _this.id) || other.id == _this.id) &&
            (identical(other.fromNodeId, _this.fromNodeId) ||
                other.fromNodeId == _this.fromNodeId) &&
            (identical(other.toNodeId, _this.toNodeId) ||
                other.toNodeId == _this.toNodeId) &&
            (identical(other.distance, _this.distance) ||
                other.distance == _this.distance) &&
            (identical(
                    other.estimatedTimeSeconds, _this.estimatedTimeSeconds) ||
                other.estimatedTimeSeconds == _this.estimatedTimeSeconds) &&
            (identical(other.isWheelchairAccessible,
                    _this.isWheelchairAccessible) ||
                other.isWheelchairAccessible == _this.isWheelchairAccessible) &&
            (identical(other.isEmergencyRoute, _this.isEmergencyRoute) ||
                other.isEmergencyRoute == _this.isEmergencyRoute) &&
            (identical(other.floor, _this.floor) ||
                other.floor == _this.floor) &&
            (identical(other.description, _this.description) ||
                other.description == _this.description) &&
            const DeepCollectionEquality()
                .equals(other.hazards, _this.hazards) &&
            (identical(other.isBlocked, _this.isBlocked) ||
                other.isBlocked == _this.isBlocked) &&
            (identical(other.blockReason, _this.blockReason) ||
                other.blockReason == _this.blockReason) &&
            (identical(other.blockedAt, _this.blockedAt) ||
                other.blockedAt == _this.blockedAt) &&
            const DeepCollectionEquality()
                .equals(other.metadata, _this.metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as EvacuationEdge;
    return Object.hash(
        runtimeType,
        _this.id,
        _this.fromNodeId,
        _this.toNodeId,
        _this.distance,
        _this.estimatedTimeSeconds,
        _this.isWheelchairAccessible,
        _this.isEmergencyRoute,
        _this.floor,
        _this.description,
        const DeepCollectionEquality().hash(_this.hazards),
        _this.isBlocked,
        _this.blockReason,
        _this.blockedAt,
        const DeepCollectionEquality().hash(_this.metadata));
  }

  @override
  String toString() {
    final _this = this as EvacuationEdge;
    return 'EvacuationEdge(id: ${_this.id}, fromNodeId: ${_this.fromNodeId}, toNodeId: ${_this.toNodeId}, distance: ${_this.distance}, estimatedTimeSeconds: ${_this.estimatedTimeSeconds}, isWheelchairAccessible: ${_this.isWheelchairAccessible}, isEmergencyRoute: ${_this.isEmergencyRoute}, floor: ${_this.floor}, description: ${_this.description}, hazards: ${_this.hazards}, isBlocked: ${_this.isBlocked}, blockReason: ${_this.blockReason}, blockedAt: ${_this.blockedAt}, metadata: ${_this.metadata})';
  }
}

/// @nodoc
abstract mixin class $EvacuationEdgeCopyWith<$Res> {
  factory $EvacuationEdgeCopyWith(
          EvacuationEdge value, $Res Function(EvacuationEdge) _then) =
      _$EvacuationEdgeCopyWithImpl;
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
class _$EvacuationEdgeCopyWithImpl<$Res>
    implements $EvacuationEdgeCopyWith<$Res> {
  _$EvacuationEdgeCopyWithImpl(this._self, this._then);

  final EvacuationEdge _self;
  final $Res Function(EvacuationEdge) _then;

  /// Create a copy of EvacuationEdge
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(EvacuationEdge(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fromNodeId: null == fromNodeId
          ? _self.fromNodeId
          : fromNodeId // ignore: cast_nullable_to_non_nullable
              as String,
      toNodeId: null == toNodeId
          ? _self.toNodeId
          : toNodeId // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _self.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      estimatedTimeSeconds: null == estimatedTimeSeconds
          ? _self.estimatedTimeSeconds
          : estimatedTimeSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      isWheelchairAccessible: null == isWheelchairAccessible
          ? _self.isWheelchairAccessible
          : isWheelchairAccessible // ignore: cast_nullable_to_non_nullable
              as bool,
      isEmergencyRoute: null == isEmergencyRoute
          ? _self.isEmergencyRoute
          : isEmergencyRoute // ignore: cast_nullable_to_non_nullable
              as bool,
      floor: freezed == floor
          ? _self.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      hazards: null == hazards
          ? _self.hazards
          : hazards // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isBlocked: null == isBlocked
          ? _self.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      blockReason: freezed == blockReason
          ? _self.blockReason
          : blockReason // ignore: cast_nullable_to_non_nullable
              as String?,
      blockedAt: freezed == blockedAt
          ? _self.blockedAt
          : blockedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: null == metadata
          ? _self.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// Adds pattern-matching-related methods to [EvacuationEdge].
extension EvacuationEdgePatterns on EvacuationEdge {
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
    TResult Function(_EvacuationEdge value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EvacuationEdge() when $default != null:
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
    TResult Function(_EvacuationEdge value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EvacuationEdge():
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
    TResult? Function(_EvacuationEdge value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EvacuationEdge() when $default != null:
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
            Map<String, dynamic> metadata)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EvacuationEdge() when $default != null:
        return $default(
            _that.id,
            _that.fromNodeId,
            _that.toNodeId,
            _that.distance,
            _that.estimatedTimeSeconds,
            _that.isWheelchairAccessible,
            _that.isEmergencyRoute,
            _that.floor,
            _that.description,
            _that.hazards,
            _that.isBlocked,
            _that.blockReason,
            _that.blockedAt,
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
            Map<String, dynamic> metadata)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EvacuationEdge():
        return $default(
            _that.id,
            _that.fromNodeId,
            _that.toNodeId,
            _that.distance,
            _that.estimatedTimeSeconds,
            _that.isWheelchairAccessible,
            _that.isEmergencyRoute,
            _that.floor,
            _that.description,
            _that.hazards,
            _that.isBlocked,
            _that.blockReason,
            _that.blockedAt,
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
            Map<String, dynamic> metadata)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EvacuationEdge() when $default != null:
        return $default(
            _that.id,
            _that.fromNodeId,
            _that.toNodeId,
            _that.distance,
            _that.estimatedTimeSeconds,
            _that.isWheelchairAccessible,
            _that.isEmergencyRoute,
            _that.floor,
            _that.description,
            _that.hazards,
            _that.isBlocked,
            _that.blockReason,
            _that.blockedAt,
            _that.metadata);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _EvacuationEdge implements EvacuationEdge {
  const _EvacuationEdge(
      {required this.id,
      required this.fromNodeId,
      required this.toNodeId,
      required this.distance,
      required this.estimatedTimeSeconds,
      this.isWheelchairAccessible = true,
      this.isEmergencyRoute = false,
      this.floor,
      this.description,
      List<String> hazards = const [],
      this.isBlocked = false,
      this.blockReason,
      this.blockedAt,
      Map<String, dynamic> metadata = const {}})
      : _hazards = hazards,
        _metadata = metadata;
  factory _EvacuationEdge.fromJson(Map<String, dynamic> json) =>
      _$EvacuationEdgeFromJson(json);

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

  /// Create a copy of EvacuationEdge
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EvacuationEdgeCopyWith<_EvacuationEdge> get copyWith =>
      __$EvacuationEdgeCopyWithImpl<_EvacuationEdge>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EvacuationEdgeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EvacuationEdge &&
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
            const DeepCollectionEquality().equals(other.hazards, _hazards) &&
            (identical(other.isBlocked, isBlocked) ||
                other.isBlocked == isBlocked) &&
            (identical(other.blockReason, blockReason) ||
                other.blockReason == blockReason) &&
            (identical(other.blockedAt, blockedAt) ||
                other.blockedAt == blockedAt) &&
            const DeepCollectionEquality().equals(other.metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(
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
  }

  @override
  String toString() {
    return 'EvacuationEdge(id: $id, fromNodeId: $fromNodeId, toNodeId: $toNodeId, distance: $distance, estimatedTimeSeconds: $estimatedTimeSeconds, isWheelchairAccessible: $isWheelchairAccessible, isEmergencyRoute: $isEmergencyRoute, floor: $floor, description: $description, hazards: $hazards, isBlocked: $isBlocked, blockReason: $blockReason, blockedAt: $blockedAt, metadata: $metadata)';
  }
}

/// @nodoc
abstract mixin class _$EvacuationEdgeCopyWith<$Res>
    implements $EvacuationEdgeCopyWith<$Res> {
  factory _$EvacuationEdgeCopyWith(
          _EvacuationEdge value, $Res Function(_EvacuationEdge) _then) =
      __$EvacuationEdgeCopyWithImpl;
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
class __$EvacuationEdgeCopyWithImpl<$Res>
    implements _$EvacuationEdgeCopyWith<$Res> {
  __$EvacuationEdgeCopyWithImpl(this._self, this._then);

  final _EvacuationEdge _self;
  final $Res Function(_EvacuationEdge) _then;

  /// Create a copy of EvacuationEdge
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_EvacuationEdge(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fromNodeId: null == fromNodeId
          ? _self.fromNodeId
          : fromNodeId // ignore: cast_nullable_to_non_nullable
              as String,
      toNodeId: null == toNodeId
          ? _self.toNodeId
          : toNodeId // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _self.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      estimatedTimeSeconds: null == estimatedTimeSeconds
          ? _self.estimatedTimeSeconds
          : estimatedTimeSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      isWheelchairAccessible: null == isWheelchairAccessible
          ? _self.isWheelchairAccessible
          : isWheelchairAccessible // ignore: cast_nullable_to_non_nullable
              as bool,
      isEmergencyRoute: null == isEmergencyRoute
          ? _self.isEmergencyRoute
          : isEmergencyRoute // ignore: cast_nullable_to_non_nullable
              as bool,
      floor: freezed == floor
          ? _self.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      hazards: null == hazards
          ? _self._hazards
          : hazards // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isBlocked: null == isBlocked
          ? _self.isBlocked
          : isBlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      blockReason: freezed == blockReason
          ? _self.blockReason
          : blockReason // ignore: cast_nullable_to_non_nullable
              as String?,
      blockedAt: freezed == blockedAt
          ? _self.blockedAt
          : blockedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: null == metadata
          ? _self._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
mixin _$EvacuationNode {
  /// Unique node ID
  String get id;

  /// Node label/name
  String get label;

  /// Node type
  EvacuationNodeType get type;

  /// Latitude
  double get latitude;

  /// Longitude
  double get longitude;

  /// Floor level
  int? get floor;

  /// Building ID this node belongs to
  String? get buildingId;

  /// Room/area identifier
  String? get roomId;

  /// Whether this node is an exit to outside
  bool get isExit;

  /// Whether this node is an assembly point
  bool get isAssemblyPoint;

  /// Whether this node is a shelter
  bool get isShelter;

  /// Capacity (for assembly points/shelters)
  int? get capacity;

  /// Current occupancy (for real-time updates)
  int get currentOccupancy;

  /// Accessibility features
  List<String> get accessibilityFeatures;

  /// Emergency equipment at this node
  List<String> get emergencyEquipment;

  /// Connected edge IDs
  List<String> get connectedEdgeIds;

  /// Metadata
  Map<String, dynamic> get metadata;

  /// Create a copy of EvacuationNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EvacuationNodeCopyWith<EvacuationNode> get copyWith =>
      _$EvacuationNodeCopyWithImpl<EvacuationNode>(
          this as EvacuationNode, _$identity);

  /// Serializes this EvacuationNode to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as EvacuationNode;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EvacuationNode &&
            (identical(other.id, _this.id) || other.id == _this.id) &&
            (identical(other.label, _this.label) ||
                other.label == _this.label) &&
            (identical(other.type, _this.type) || other.type == _this.type) &&
            (identical(other.latitude, _this.latitude) ||
                other.latitude == _this.latitude) &&
            (identical(other.longitude, _this.longitude) ||
                other.longitude == _this.longitude) &&
            (identical(other.floor, _this.floor) ||
                other.floor == _this.floor) &&
            (identical(other.buildingId, _this.buildingId) ||
                other.buildingId == _this.buildingId) &&
            (identical(other.roomId, _this.roomId) ||
                other.roomId == _this.roomId) &&
            (identical(other.isExit, _this.isExit) ||
                other.isExit == _this.isExit) &&
            (identical(other.isAssemblyPoint, _this.isAssemblyPoint) ||
                other.isAssemblyPoint == _this.isAssemblyPoint) &&
            (identical(other.isShelter, _this.isShelter) ||
                other.isShelter == _this.isShelter) &&
            (identical(other.capacity, _this.capacity) ||
                other.capacity == _this.capacity) &&
            (identical(other.currentOccupancy, _this.currentOccupancy) ||
                other.currentOccupancy == _this.currentOccupancy) &&
            const DeepCollectionEquality().equals(
                other.accessibilityFeatures, _this.accessibilityFeatures) &&
            const DeepCollectionEquality()
                .equals(other.emergencyEquipment, _this.emergencyEquipment) &&
            const DeepCollectionEquality()
                .equals(other.connectedEdgeIds, _this.connectedEdgeIds) &&
            const DeepCollectionEquality()
                .equals(other.metadata, _this.metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as EvacuationNode;
    return Object.hash(
        runtimeType,
        _this.id,
        _this.label,
        _this.type,
        _this.latitude,
        _this.longitude,
        _this.floor,
        _this.buildingId,
        _this.roomId,
        _this.isExit,
        _this.isAssemblyPoint,
        _this.isShelter,
        _this.capacity,
        _this.currentOccupancy,
        const DeepCollectionEquality().hash(_this.accessibilityFeatures),
        const DeepCollectionEquality().hash(_this.emergencyEquipment),
        const DeepCollectionEquality().hash(_this.connectedEdgeIds),
        const DeepCollectionEquality().hash(_this.metadata));
  }

  @override
  String toString() {
    final _this = this as EvacuationNode;
    return 'EvacuationNode(id: ${_this.id}, label: ${_this.label}, type: ${_this.type}, latitude: ${_this.latitude}, longitude: ${_this.longitude}, floor: ${_this.floor}, buildingId: ${_this.buildingId}, roomId: ${_this.roomId}, isExit: ${_this.isExit}, isAssemblyPoint: ${_this.isAssemblyPoint}, isShelter: ${_this.isShelter}, capacity: ${_this.capacity}, currentOccupancy: ${_this.currentOccupancy}, accessibilityFeatures: ${_this.accessibilityFeatures}, emergencyEquipment: ${_this.emergencyEquipment}, connectedEdgeIds: ${_this.connectedEdgeIds}, metadata: ${_this.metadata})';
  }
}

/// @nodoc
abstract mixin class $EvacuationNodeCopyWith<$Res> {
  factory $EvacuationNodeCopyWith(
          EvacuationNode value, $Res Function(EvacuationNode) _then) =
      _$EvacuationNodeCopyWithImpl;
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
class _$EvacuationNodeCopyWithImpl<$Res>
    implements $EvacuationNodeCopyWith<$Res> {
  _$EvacuationNodeCopyWithImpl(this._self, this._then);

  final EvacuationNode _self;
  final $Res Function(EvacuationNode) _then;

  /// Create a copy of EvacuationNode
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(EvacuationNode(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as EvacuationNodeType,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      floor: freezed == floor
          ? _self.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int?,
      buildingId: freezed == buildingId
          ? _self.buildingId
          : buildingId // ignore: cast_nullable_to_non_nullable
              as String?,
      roomId: freezed == roomId
          ? _self.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String?,
      isExit: null == isExit
          ? _self.isExit
          : isExit // ignore: cast_nullable_to_non_nullable
              as bool,
      isAssemblyPoint: null == isAssemblyPoint
          ? _self.isAssemblyPoint
          : isAssemblyPoint // ignore: cast_nullable_to_non_nullable
              as bool,
      isShelter: null == isShelter
          ? _self.isShelter
          : isShelter // ignore: cast_nullable_to_non_nullable
              as bool,
      capacity: freezed == capacity
          ? _self.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      currentOccupancy: null == currentOccupancy
          ? _self.currentOccupancy
          : currentOccupancy // ignore: cast_nullable_to_non_nullable
              as int,
      accessibilityFeatures: null == accessibilityFeatures
          ? _self.accessibilityFeatures
          : accessibilityFeatures // ignore: cast_nullable_to_non_nullable
              as List<String>,
      emergencyEquipment: null == emergencyEquipment
          ? _self.emergencyEquipment
          : emergencyEquipment // ignore: cast_nullable_to_non_nullable
              as List<String>,
      connectedEdgeIds: null == connectedEdgeIds
          ? _self.connectedEdgeIds
          : connectedEdgeIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      metadata: null == metadata
          ? _self.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// Adds pattern-matching-related methods to [EvacuationNode].
extension EvacuationNodePatterns on EvacuationNode {
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
    TResult Function(_EvacuationNode value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EvacuationNode() when $default != null:
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
    TResult Function(_EvacuationNode value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EvacuationNode():
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
    TResult? Function(_EvacuationNode value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EvacuationNode() when $default != null:
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
            Map<String, dynamic> metadata)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EvacuationNode() when $default != null:
        return $default(
            _that.id,
            _that.label,
            _that.type,
            _that.latitude,
            _that.longitude,
            _that.floor,
            _that.buildingId,
            _that.roomId,
            _that.isExit,
            _that.isAssemblyPoint,
            _that.isShelter,
            _that.capacity,
            _that.currentOccupancy,
            _that.accessibilityFeatures,
            _that.emergencyEquipment,
            _that.connectedEdgeIds,
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
            Map<String, dynamic> metadata)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EvacuationNode():
        return $default(
            _that.id,
            _that.label,
            _that.type,
            _that.latitude,
            _that.longitude,
            _that.floor,
            _that.buildingId,
            _that.roomId,
            _that.isExit,
            _that.isAssemblyPoint,
            _that.isShelter,
            _that.capacity,
            _that.currentOccupancy,
            _that.accessibilityFeatures,
            _that.emergencyEquipment,
            _that.connectedEdgeIds,
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
            Map<String, dynamic> metadata)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EvacuationNode() when $default != null:
        return $default(
            _that.id,
            _that.label,
            _that.type,
            _that.latitude,
            _that.longitude,
            _that.floor,
            _that.buildingId,
            _that.roomId,
            _that.isExit,
            _that.isAssemblyPoint,
            _that.isShelter,
            _that.capacity,
            _that.currentOccupancy,
            _that.accessibilityFeatures,
            _that.emergencyEquipment,
            _that.connectedEdgeIds,
            _that.metadata);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _EvacuationNode implements EvacuationNode {
  const _EvacuationNode(
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
      List<String> accessibilityFeatures = const [],
      List<String> emergencyEquipment = const [],
      List<String> connectedEdgeIds = const [],
      Map<String, dynamic> metadata = const {}})
      : _accessibilityFeatures = accessibilityFeatures,
        _emergencyEquipment = emergencyEquipment,
        _connectedEdgeIds = connectedEdgeIds,
        _metadata = metadata;
  factory _EvacuationNode.fromJson(Map<String, dynamic> json) =>
      _$EvacuationNodeFromJson(json);

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

  /// Create a copy of EvacuationNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EvacuationNodeCopyWith<_EvacuationNode> get copyWith =>
      __$EvacuationNodeCopyWithImpl<_EvacuationNode>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EvacuationNodeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EvacuationNode &&
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
                .equals(other.accessibilityFeatures, _accessibilityFeatures) &&
            const DeepCollectionEquality()
                .equals(other.emergencyEquipment, _emergencyEquipment) &&
            const DeepCollectionEquality()
                .equals(other.connectedEdgeIds, _connectedEdgeIds) &&
            const DeepCollectionEquality().equals(other.metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(
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
  }

  @override
  String toString() {
    return 'EvacuationNode(id: $id, label: $label, type: $type, latitude: $latitude, longitude: $longitude, floor: $floor, buildingId: $buildingId, roomId: $roomId, isExit: $isExit, isAssemblyPoint: $isAssemblyPoint, isShelter: $isShelter, capacity: $capacity, currentOccupancy: $currentOccupancy, accessibilityFeatures: $accessibilityFeatures, emergencyEquipment: $emergencyEquipment, connectedEdgeIds: $connectedEdgeIds, metadata: $metadata)';
  }
}

/// @nodoc
abstract mixin class _$EvacuationNodeCopyWith<$Res>
    implements $EvacuationNodeCopyWith<$Res> {
  factory _$EvacuationNodeCopyWith(
          _EvacuationNode value, $Res Function(_EvacuationNode) _then) =
      __$EvacuationNodeCopyWithImpl;
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
class __$EvacuationNodeCopyWithImpl<$Res>
    implements _$EvacuationNodeCopyWith<$Res> {
  __$EvacuationNodeCopyWithImpl(this._self, this._then);

  final _EvacuationNode _self;
  final $Res Function(_EvacuationNode) _then;

  /// Create a copy of EvacuationNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_EvacuationNode(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as EvacuationNodeType,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      floor: freezed == floor
          ? _self.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int?,
      buildingId: freezed == buildingId
          ? _self.buildingId
          : buildingId // ignore: cast_nullable_to_non_nullable
              as String?,
      roomId: freezed == roomId
          ? _self.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String?,
      isExit: null == isExit
          ? _self.isExit
          : isExit // ignore: cast_nullable_to_non_nullable
              as bool,
      isAssemblyPoint: null == isAssemblyPoint
          ? _self.isAssemblyPoint
          : isAssemblyPoint // ignore: cast_nullable_to_non_nullable
              as bool,
      isShelter: null == isShelter
          ? _self.isShelter
          : isShelter // ignore: cast_nullable_to_non_nullable
              as bool,
      capacity: freezed == capacity
          ? _self.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      currentOccupancy: null == currentOccupancy
          ? _self.currentOccupancy
          : currentOccupancy // ignore: cast_nullable_to_non_nullable
              as int,
      accessibilityFeatures: null == accessibilityFeatures
          ? _self._accessibilityFeatures
          : accessibilityFeatures // ignore: cast_nullable_to_non_nullable
              as List<String>,
      emergencyEquipment: null == emergencyEquipment
          ? _self._emergencyEquipment
          : emergencyEquipment // ignore: cast_nullable_to_non_nullable
              as List<String>,
      connectedEdgeIds: null == connectedEdgeIds
          ? _self._connectedEdgeIds
          : connectedEdgeIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      metadata: null == metadata
          ? _self._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
mixin _$EvacuationGraph {
  /// Unique graph ID
  String get id;

  /// Graph name (e.g., "Main Building", "Campus Wide")
  String get name;

  /// Building ID (if building-specific)
  String? get buildingId;

  /// Version number for cache invalidation
  int get version;

  /// All nodes in the graph
  List<EvacuationNode> get nodes;

  /// All edges in the graph
  List<EvacuationEdge> get edges;

  /// Default assembly points
  List<String> get defaultAssemblyPointIds;

  /// Default shelter locations
  List<String> get defaultShelterIds;

  /// Graph bounds (minLat, minLng, maxLat, maxLng)
  List<double> get bounds;

  /// Creation timestamp
  DateTime get createdAt;

  /// Last update timestamp
  DateTime get updatedAt;

  /// Source of graph data
  String? get dataSource;

  /// Metadata
  Map<String, dynamic> get metadata;

  /// Create a copy of EvacuationGraph
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EvacuationGraphCopyWith<EvacuationGraph> get copyWith =>
      _$EvacuationGraphCopyWithImpl<EvacuationGraph>(
          this as EvacuationGraph, _$identity);

  /// Serializes this EvacuationGraph to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as EvacuationGraph;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EvacuationGraph &&
            (identical(other.id, _this.id) || other.id == _this.id) &&
            (identical(other.name, _this.name) || other.name == _this.name) &&
            (identical(other.buildingId, _this.buildingId) ||
                other.buildingId == _this.buildingId) &&
            (identical(other.version, _this.version) ||
                other.version == _this.version) &&
            const DeepCollectionEquality().equals(other.nodes, _this.nodes) &&
            const DeepCollectionEquality().equals(other.edges, _this.edges) &&
            const DeepCollectionEquality().equals(
                other.defaultAssemblyPointIds, _this.defaultAssemblyPointIds) &&
            const DeepCollectionEquality()
                .equals(other.defaultShelterIds, _this.defaultShelterIds) &&
            const DeepCollectionEquality().equals(other.bounds, _this.bounds) &&
            (identical(other.createdAt, _this.createdAt) ||
                other.createdAt == _this.createdAt) &&
            (identical(other.updatedAt, _this.updatedAt) ||
                other.updatedAt == _this.updatedAt) &&
            (identical(other.dataSource, _this.dataSource) ||
                other.dataSource == _this.dataSource) &&
            const DeepCollectionEquality()
                .equals(other.metadata, _this.metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as EvacuationGraph;
    return Object.hash(
        runtimeType,
        _this.id,
        _this.name,
        _this.buildingId,
        _this.version,
        const DeepCollectionEquality().hash(_this.nodes),
        const DeepCollectionEquality().hash(_this.edges),
        const DeepCollectionEquality().hash(_this.defaultAssemblyPointIds),
        const DeepCollectionEquality().hash(_this.defaultShelterIds),
        const DeepCollectionEquality().hash(_this.bounds),
        _this.createdAt,
        _this.updatedAt,
        _this.dataSource,
        const DeepCollectionEquality().hash(_this.metadata));
  }

  @override
  String toString() {
    final _this = this as EvacuationGraph;
    return 'EvacuationGraph(id: ${_this.id}, name: ${_this.name}, buildingId: ${_this.buildingId}, version: ${_this.version}, nodes: ${_this.nodes}, edges: ${_this.edges}, defaultAssemblyPointIds: ${_this.defaultAssemblyPointIds}, defaultShelterIds: ${_this.defaultShelterIds}, bounds: ${_this.bounds}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, dataSource: ${_this.dataSource}, metadata: ${_this.metadata})';
  }
}

/// @nodoc
abstract mixin class $EvacuationGraphCopyWith<$Res> {
  factory $EvacuationGraphCopyWith(
          EvacuationGraph value, $Res Function(EvacuationGraph) _then) =
      _$EvacuationGraphCopyWithImpl;
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
class _$EvacuationGraphCopyWithImpl<$Res>
    implements $EvacuationGraphCopyWith<$Res> {
  _$EvacuationGraphCopyWithImpl(this._self, this._then);

  final EvacuationGraph _self;
  final $Res Function(EvacuationGraph) _then;

  /// Create a copy of EvacuationGraph
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(EvacuationGraph(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      buildingId: freezed == buildingId
          ? _self.buildingId
          : buildingId // ignore: cast_nullable_to_non_nullable
              as String?,
      version: null == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      nodes: null == nodes
          ? _self.nodes
          : nodes // ignore: cast_nullable_to_non_nullable
              as List<EvacuationNode>,
      edges: null == edges
          ? _self.edges
          : edges // ignore: cast_nullable_to_non_nullable
              as List<EvacuationEdge>,
      defaultAssemblyPointIds: null == defaultAssemblyPointIds
          ? _self.defaultAssemblyPointIds
          : defaultAssemblyPointIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      defaultShelterIds: null == defaultShelterIds
          ? _self.defaultShelterIds
          : defaultShelterIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      bounds: null == bounds
          ? _self.bounds
          : bounds // ignore: cast_nullable_to_non_nullable
              as List<double>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dataSource: freezed == dataSource
          ? _self.dataSource
          : dataSource // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: null == metadata
          ? _self.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// Adds pattern-matching-related methods to [EvacuationGraph].
extension EvacuationGraphPatterns on EvacuationGraph {
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
    TResult Function(_EvacuationGraph value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EvacuationGraph() when $default != null:
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
    TResult Function(_EvacuationGraph value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EvacuationGraph():
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
    TResult? Function(_EvacuationGraph value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EvacuationGraph() when $default != null:
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
            Map<String, dynamic> metadata)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EvacuationGraph() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.buildingId,
            _that.version,
            _that.nodes,
            _that.edges,
            _that.defaultAssemblyPointIds,
            _that.defaultShelterIds,
            _that.bounds,
            _that.createdAt,
            _that.updatedAt,
            _that.dataSource,
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
            Map<String, dynamic> metadata)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EvacuationGraph():
        return $default(
            _that.id,
            _that.name,
            _that.buildingId,
            _that.version,
            _that.nodes,
            _that.edges,
            _that.defaultAssemblyPointIds,
            _that.defaultShelterIds,
            _that.bounds,
            _that.createdAt,
            _that.updatedAt,
            _that.dataSource,
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
            Map<String, dynamic> metadata)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EvacuationGraph() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.buildingId,
            _that.version,
            _that.nodes,
            _that.edges,
            _that.defaultAssemblyPointIds,
            _that.defaultShelterIds,
            _that.bounds,
            _that.createdAt,
            _that.updatedAt,
            _that.dataSource,
            _that.metadata);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _EvacuationGraph implements EvacuationGraph {
  const _EvacuationGraph(
      {required this.id,
      required this.name,
      this.buildingId,
      required this.version,
      required List<EvacuationNode> nodes,
      required List<EvacuationEdge> edges,
      List<String> defaultAssemblyPointIds = const [],
      List<String> defaultShelterIds = const [],
      required List<double> bounds,
      required this.createdAt,
      required this.updatedAt,
      this.dataSource,
      Map<String, dynamic> metadata = const {}})
      : _nodes = nodes,
        _edges = edges,
        _defaultAssemblyPointIds = defaultAssemblyPointIds,
        _defaultShelterIds = defaultShelterIds,
        _bounds = bounds,
        _metadata = metadata;
  factory _EvacuationGraph.fromJson(Map<String, dynamic> json) =>
      _$EvacuationGraphFromJson(json);

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

  /// Create a copy of EvacuationGraph
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EvacuationGraphCopyWith<_EvacuationGraph> get copyWith =>
      __$EvacuationGraphCopyWithImpl<_EvacuationGraph>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EvacuationGraphToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EvacuationGraph &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.buildingId, buildingId) ||
                other.buildingId == buildingId) &&
            (identical(other.version, version) || other.version == version) &&
            const DeepCollectionEquality().equals(other.nodes, _nodes) &&
            const DeepCollectionEquality().equals(other.edges, _edges) &&
            const DeepCollectionEquality().equals(
                other.defaultAssemblyPointIds, _defaultAssemblyPointIds) &&
            const DeepCollectionEquality()
                .equals(other.defaultShelterIds, _defaultShelterIds) &&
            const DeepCollectionEquality().equals(other.bounds, _bounds) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.dataSource, dataSource) ||
                other.dataSource == dataSource) &&
            const DeepCollectionEquality().equals(other.metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(
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
  }

  @override
  String toString() {
    return 'EvacuationGraph(id: $id, name: $name, buildingId: $buildingId, version: $version, nodes: $nodes, edges: $edges, defaultAssemblyPointIds: $defaultAssemblyPointIds, defaultShelterIds: $defaultShelterIds, bounds: $bounds, createdAt: $createdAt, updatedAt: $updatedAt, dataSource: $dataSource, metadata: $metadata)';
  }
}

/// @nodoc
abstract mixin class _$EvacuationGraphCopyWith<$Res>
    implements $EvacuationGraphCopyWith<$Res> {
  factory _$EvacuationGraphCopyWith(
          _EvacuationGraph value, $Res Function(_EvacuationGraph) _then) =
      __$EvacuationGraphCopyWithImpl;
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
class __$EvacuationGraphCopyWithImpl<$Res>
    implements _$EvacuationGraphCopyWith<$Res> {
  __$EvacuationGraphCopyWithImpl(this._self, this._then);

  final _EvacuationGraph _self;
  final $Res Function(_EvacuationGraph) _then;

  /// Create a copy of EvacuationGraph
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_EvacuationGraph(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      buildingId: freezed == buildingId
          ? _self.buildingId
          : buildingId // ignore: cast_nullable_to_non_nullable
              as String?,
      version: null == version
          ? _self.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      nodes: null == nodes
          ? _self._nodes
          : nodes // ignore: cast_nullable_to_non_nullable
              as List<EvacuationNode>,
      edges: null == edges
          ? _self._edges
          : edges // ignore: cast_nullable_to_non_nullable
              as List<EvacuationEdge>,
      defaultAssemblyPointIds: null == defaultAssemblyPointIds
          ? _self._defaultAssemblyPointIds
          : defaultAssemblyPointIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      defaultShelterIds: null == defaultShelterIds
          ? _self._defaultShelterIds
          : defaultShelterIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      bounds: null == bounds
          ? _self._bounds
          : bounds // ignore: cast_nullable_to_non_nullable
              as List<double>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dataSource: freezed == dataSource
          ? _self.dataSource
          : dataSource // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: null == metadata
          ? _self._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

// dart format on
