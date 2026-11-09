// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'navigation_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DestinationType {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DestinationType);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DestinationType()';
  }
}

/// @nodoc
class $DestinationTypeCopyWith<$Res> {
  $DestinationTypeCopyWith(
      DestinationType _, $Res Function(DestinationType) __);
}

/// Adds pattern-matching-related methods to [DestinationType].
extension DestinationTypePatterns on DestinationType {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Building value)? building,
    TResult Function(_Location value)? location,
    TResult Function(_Coordinates value)? coordinates,
    TResult Function(_EmergencyExit value)? emergencyExit,
    TResult Function(_AssemblyPoint value)? assemblyPoint,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Building() when building != null:
        return building(_that);
      case _Location() when location != null:
        return location(_that);
      case _Coordinates() when coordinates != null:
        return coordinates(_that);
      case _EmergencyExit() when emergencyExit != null:
        return emergencyExit(_that);
      case _AssemblyPoint() when assemblyPoint != null:
        return assemblyPoint(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(_Building value) building,
    required TResult Function(_Location value) location,
    required TResult Function(_Coordinates value) coordinates,
    required TResult Function(_EmergencyExit value) emergencyExit,
    required TResult Function(_AssemblyPoint value) assemblyPoint,
  }) {
    final _that = this;
    switch (_that) {
      case _Building():
        return building(_that);
      case _Location():
        return location(_that);
      case _Coordinates():
        return coordinates(_that);
      case _EmergencyExit():
        return emergencyExit(_that);
      case _AssemblyPoint():
        return assemblyPoint(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Building value)? building,
    TResult? Function(_Location value)? location,
    TResult? Function(_Coordinates value)? coordinates,
    TResult? Function(_EmergencyExit value)? emergencyExit,
    TResult? Function(_AssemblyPoint value)? assemblyPoint,
  }) {
    final _that = this;
    switch (_that) {
      case _Building() when building != null:
        return building(_that);
      case _Location() when location != null:
        return location(_that);
      case _Coordinates() when coordinates != null:
        return coordinates(_that);
      case _EmergencyExit() when emergencyExit != null:
        return emergencyExit(_that);
      case _AssemblyPoint() when assemblyPoint != null:
        return assemblyPoint(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? building,
    TResult Function()? location,
    TResult Function()? coordinates,
    TResult Function()? emergencyExit,
    TResult Function()? assemblyPoint,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Building() when building != null:
        return building();
      case _Location() when location != null:
        return location();
      case _Coordinates() when coordinates != null:
        return coordinates();
      case _EmergencyExit() when emergencyExit != null:
        return emergencyExit();
      case _AssemblyPoint() when assemblyPoint != null:
        return assemblyPoint();
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
  TResult when<TResult extends Object?>({
    required TResult Function() building,
    required TResult Function() location,
    required TResult Function() coordinates,
    required TResult Function() emergencyExit,
    required TResult Function() assemblyPoint,
  }) {
    final _that = this;
    switch (_that) {
      case _Building():
        return building();
      case _Location():
        return location();
      case _Coordinates():
        return coordinates();
      case _EmergencyExit():
        return emergencyExit();
      case _AssemblyPoint():
        return assemblyPoint();
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? building,
    TResult? Function()? location,
    TResult? Function()? coordinates,
    TResult? Function()? emergencyExit,
    TResult? Function()? assemblyPoint,
  }) {
    final _that = this;
    switch (_that) {
      case _Building() when building != null:
        return building();
      case _Location() when location != null:
        return location();
      case _Coordinates() when coordinates != null:
        return coordinates();
      case _EmergencyExit() when emergencyExit != null:
        return emergencyExit();
      case _AssemblyPoint() when assemblyPoint != null:
        return assemblyPoint();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Building implements DestinationType {
  const _Building();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Building);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DestinationType.building()';
  }
}

/// @nodoc

class _Location implements DestinationType {
  const _Location();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Location);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DestinationType.location()';
  }
}

/// @nodoc

class _Coordinates implements DestinationType {
  const _Coordinates();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Coordinates);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DestinationType.coordinates()';
  }
}

/// @nodoc

class _EmergencyExit implements DestinationType {
  const _EmergencyExit();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _EmergencyExit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DestinationType.emergencyExit()';
  }
}

/// @nodoc

class _AssemblyPoint implements DestinationType {
  const _AssemblyPoint();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _AssemblyPoint);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DestinationType.assemblyPoint()';
  }
}

/// @nodoc
mixin _$NavigationDestination {
  String get id;
  String get name;
  @JsonKey(
      fromJson: DestinationTypeConverter._destinationTypeFromJson,
      toJson: DestinationTypeConverter._destinationTypeToJson)
  DestinationType get type;
  LatLng get coordinates;
  String? get buildingId;
  String? get description;
  String? get address;
  Map<String, dynamic>? get metadata;

  /// Create a copy of NavigationDestination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NavigationDestinationCopyWith<NavigationDestination> get copyWith =>
      _$NavigationDestinationCopyWithImpl<NavigationDestination>(
          this as NavigationDestination, _$identity);

  /// Serializes this NavigationDestination to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as NavigationDestination;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NavigationDestination &&
            (identical(other.id, _this.id) || other.id == _this.id) &&
            (identical(other.name, _this.name) || other.name == _this.name) &&
            (identical(other.type, _this.type) || other.type == _this.type) &&
            (identical(other.coordinates, _this.coordinates) ||
                other.coordinates == _this.coordinates) &&
            (identical(other.buildingId, _this.buildingId) ||
                other.buildingId == _this.buildingId) &&
            (identical(other.description, _this.description) ||
                other.description == _this.description) &&
            (identical(other.address, _this.address) ||
                other.address == _this.address) &&
            const DeepCollectionEquality()
                .equals(other.metadata, _this.metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as NavigationDestination;
    return Object.hash(
        runtimeType,
        _this.id,
        _this.name,
        _this.type,
        _this.coordinates,
        _this.buildingId,
        _this.description,
        _this.address,
        const DeepCollectionEquality().hash(_this.metadata));
  }

  @override
  String toString() {
    final _this = this as NavigationDestination;
    return 'NavigationDestination(id: ${_this.id}, name: ${_this.name}, type: ${_this.type}, coordinates: ${_this.coordinates}, buildingId: ${_this.buildingId}, description: ${_this.description}, address: ${_this.address}, metadata: ${_this.metadata})';
  }
}

/// @nodoc
abstract mixin class $NavigationDestinationCopyWith<$Res> {
  factory $NavigationDestinationCopyWith(NavigationDestination value,
          $Res Function(NavigationDestination) _then) =
      _$NavigationDestinationCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      @JsonKey(
          fromJson: DestinationTypeConverter._destinationTypeFromJson,
          toJson: DestinationTypeConverter._destinationTypeToJson)
      DestinationType type,
      LatLng coordinates,
      String? buildingId,
      String? description,
      String? address,
      Map<String, dynamic>? metadata});

  $DestinationTypeCopyWith<$Res> get type;
}

/// @nodoc
class _$NavigationDestinationCopyWithImpl<$Res>
    implements $NavigationDestinationCopyWith<$Res> {
  _$NavigationDestinationCopyWithImpl(this._self, this._then);

  final NavigationDestination _self;
  final $Res Function(NavigationDestination) _then;

  /// Create a copy of NavigationDestination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? coordinates = null,
    Object? buildingId = freezed,
    Object? description = freezed,
    Object? address = freezed,
    Object? metadata = freezed,
  }) {
    return _then(NavigationDestination(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as DestinationType,
      coordinates: null == coordinates
          ? _self.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as LatLng,
      buildingId: freezed == buildingId
          ? _self.buildingId
          : buildingId // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _self.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }

  /// Create a copy of NavigationDestination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DestinationTypeCopyWith<$Res> get type {
    return $DestinationTypeCopyWith<$Res>(_self.type, (value) {
      return _then(_self.copyWith(type: value));
    });
  }
}

/// Adds pattern-matching-related methods to [NavigationDestination].
extension NavigationDestinationPatterns on NavigationDestination {
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
    TResult Function(_NavigationDestination value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NavigationDestination() when $default != null:
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
    TResult Function(_NavigationDestination value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NavigationDestination():
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
    TResult? Function(_NavigationDestination value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NavigationDestination() when $default != null:
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
            @JsonKey(
                fromJson: DestinationTypeConverter._destinationTypeFromJson,
                toJson: DestinationTypeConverter._destinationTypeToJson)
            DestinationType type,
            LatLng coordinates,
            String? buildingId,
            String? description,
            String? address,
            Map<String, dynamic>? metadata)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NavigationDestination() when $default != null:
        return $default(_that.id, _that.name, _that.type, _that.coordinates,
            _that.buildingId, _that.description, _that.address, _that.metadata);
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
            @JsonKey(
                fromJson: DestinationTypeConverter._destinationTypeFromJson,
                toJson: DestinationTypeConverter._destinationTypeToJson)
            DestinationType type,
            LatLng coordinates,
            String? buildingId,
            String? description,
            String? address,
            Map<String, dynamic>? metadata)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NavigationDestination():
        return $default(_that.id, _that.name, _that.type, _that.coordinates,
            _that.buildingId, _that.description, _that.address, _that.metadata);
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
            @JsonKey(
                fromJson: DestinationTypeConverter._destinationTypeFromJson,
                toJson: DestinationTypeConverter._destinationTypeToJson)
            DestinationType type,
            LatLng coordinates,
            String? buildingId,
            String? description,
            String? address,
            Map<String, dynamic>? metadata)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NavigationDestination() when $default != null:
        return $default(_that.id, _that.name, _that.type, _that.coordinates,
            _that.buildingId, _that.description, _that.address, _that.metadata);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NavigationDestination extends NavigationDestination {
  const _NavigationDestination(
      {required this.id,
      required this.name,
      @JsonKey(
          fromJson: DestinationTypeConverter._destinationTypeFromJson,
          toJson: DestinationTypeConverter._destinationTypeToJson)
      required this.type,
      required this.coordinates,
      this.buildingId,
      this.description,
      this.address,
      Map<String, dynamic>? metadata})
      : _metadata = metadata,
        super._();
  factory _NavigationDestination.fromJson(Map<String, dynamic> json) =>
      _$NavigationDestinationFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey(
      fromJson: DestinationTypeConverter._destinationTypeFromJson,
      toJson: DestinationTypeConverter._destinationTypeToJson)
  final DestinationType type;
  @override
  final LatLng coordinates;
  @override
  final String? buildingId;
  @override
  final String? description;
  @override
  final String? address;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Create a copy of NavigationDestination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NavigationDestinationCopyWith<_NavigationDestination> get copyWith =>
      __$NavigationDestinationCopyWithImpl<_NavigationDestination>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NavigationDestinationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NavigationDestination &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.coordinates, coordinates) ||
                other.coordinates == coordinates) &&
            (identical(other.buildingId, buildingId) ||
                other.buildingId == buildingId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality().equals(other.metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(runtimeType, id, name, type, coordinates, buildingId,
        description, address, const DeepCollectionEquality().hash(_metadata));
  }

  @override
  String toString() {
    return 'NavigationDestination(id: $id, name: $name, type: $type, coordinates: $coordinates, buildingId: $buildingId, description: $description, address: $address, metadata: $metadata)';
  }
}

/// @nodoc
abstract mixin class _$NavigationDestinationCopyWith<$Res>
    implements $NavigationDestinationCopyWith<$Res> {
  factory _$NavigationDestinationCopyWith(_NavigationDestination value,
          $Res Function(_NavigationDestination) _then) =
      __$NavigationDestinationCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      @JsonKey(
          fromJson: DestinationTypeConverter._destinationTypeFromJson,
          toJson: DestinationTypeConverter._destinationTypeToJson)
      DestinationType type,
      LatLng coordinates,
      String? buildingId,
      String? description,
      String? address,
      Map<String, dynamic>? metadata});

  @override
  $DestinationTypeCopyWith<$Res> get type;
}

/// @nodoc
class __$NavigationDestinationCopyWithImpl<$Res>
    implements _$NavigationDestinationCopyWith<$Res> {
  __$NavigationDestinationCopyWithImpl(this._self, this._then);

  final _NavigationDestination _self;
  final $Res Function(_NavigationDestination) _then;

  /// Create a copy of NavigationDestination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? coordinates = null,
    Object? buildingId = freezed,
    Object? description = freezed,
    Object? address = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_NavigationDestination(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as DestinationType,
      coordinates: null == coordinates
          ? _self.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as LatLng,
      buildingId: freezed == buildingId
          ? _self.buildingId
          : buildingId // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _self._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }

  /// Create a copy of NavigationDestination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DestinationTypeCopyWith<$Res> get type {
    return $DestinationTypeCopyWith<$Res>(_self.type, (value) {
      return _then(_self.copyWith(type: value));
    });
  }
}

/// @nodoc
mixin _$NavigationRoute {
  String get id;
  NavigationDestination get start;
  NavigationDestination get end;
  List<LatLng> get geometry;
  double get totalDistance;
  Duration get estimatedDuration;
  List<NavigationInstruction> get instructions;
  DateTime get createdAt;
  String? get pathwayIds;
  @JsonKey(
      fromJson: RouteStatusConverter._routeStatusFromJson,
      toJson: RouteStatusConverter._routeStatusToJson)
  RouteStatus? get status;

  /// Create a copy of NavigationRoute
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NavigationRouteCopyWith<NavigationRoute> get copyWith =>
      _$NavigationRouteCopyWithImpl<NavigationRoute>(
          this as NavigationRoute, _$identity);

  /// Serializes this NavigationRoute to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as NavigationRoute;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NavigationRoute &&
            (identical(other.id, _this.id) || other.id == _this.id) &&
            (identical(other.start, _this.start) ||
                other.start == _this.start) &&
            (identical(other.end, _this.end) || other.end == _this.end) &&
            const DeepCollectionEquality()
                .equals(other.geometry, _this.geometry) &&
            (identical(other.totalDistance, _this.totalDistance) ||
                other.totalDistance == _this.totalDistance) &&
            (identical(other.estimatedDuration, _this.estimatedDuration) ||
                other.estimatedDuration == _this.estimatedDuration) &&
            const DeepCollectionEquality()
                .equals(other.instructions, _this.instructions) &&
            (identical(other.createdAt, _this.createdAt) ||
                other.createdAt == _this.createdAt) &&
            (identical(other.pathwayIds, _this.pathwayIds) ||
                other.pathwayIds == _this.pathwayIds) &&
            (identical(other.status, _this.status) ||
                other.status == _this.status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as NavigationRoute;
    return Object.hash(
        runtimeType,
        _this.id,
        _this.start,
        _this.end,
        const DeepCollectionEquality().hash(_this.geometry),
        _this.totalDistance,
        _this.estimatedDuration,
        const DeepCollectionEquality().hash(_this.instructions),
        _this.createdAt,
        _this.pathwayIds,
        _this.status);
  }

  @override
  String toString() {
    final _this = this as NavigationRoute;
    return 'NavigationRoute(id: ${_this.id}, start: ${_this.start}, end: ${_this.end}, geometry: ${_this.geometry}, totalDistance: ${_this.totalDistance}, estimatedDuration: ${_this.estimatedDuration}, instructions: ${_this.instructions}, createdAt: ${_this.createdAt}, pathwayIds: ${_this.pathwayIds}, status: ${_this.status})';
  }
}

/// @nodoc
abstract mixin class $NavigationRouteCopyWith<$Res> {
  factory $NavigationRouteCopyWith(
          NavigationRoute value, $Res Function(NavigationRoute) _then) =
      _$NavigationRouteCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      NavigationDestination start,
      NavigationDestination end,
      List<LatLng> geometry,
      double totalDistance,
      Duration estimatedDuration,
      List<NavigationInstruction> instructions,
      DateTime createdAt,
      String? pathwayIds,
      @JsonKey(
          fromJson: RouteStatusConverter._routeStatusFromJson,
          toJson: RouteStatusConverter._routeStatusToJson)
      RouteStatus? status});

  $NavigationDestinationCopyWith<$Res> get start;
  $NavigationDestinationCopyWith<$Res> get end;
  $RouteStatusCopyWith<$Res>? get status;
}

/// @nodoc
class _$NavigationRouteCopyWithImpl<$Res>
    implements $NavigationRouteCopyWith<$Res> {
  _$NavigationRouteCopyWithImpl(this._self, this._then);

  final NavigationRoute _self;
  final $Res Function(NavigationRoute) _then;

  /// Create a copy of NavigationRoute
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? start = null,
    Object? end = null,
    Object? geometry = null,
    Object? totalDistance = null,
    Object? estimatedDuration = null,
    Object? instructions = null,
    Object? createdAt = null,
    Object? pathwayIds = freezed,
    Object? status = freezed,
  }) {
    return _then(NavigationRoute(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      start: null == start
          ? _self.start
          : start // ignore: cast_nullable_to_non_nullable
              as NavigationDestination,
      end: null == end
          ? _self.end
          : end // ignore: cast_nullable_to_non_nullable
              as NavigationDestination,
      geometry: null == geometry
          ? _self.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as List<LatLng>,
      totalDistance: null == totalDistance
          ? _self.totalDistance
          : totalDistance // ignore: cast_nullable_to_non_nullable
              as double,
      estimatedDuration: null == estimatedDuration
          ? _self.estimatedDuration
          : estimatedDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      instructions: null == instructions
          ? _self.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as List<NavigationInstruction>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      pathwayIds: freezed == pathwayIds
          ? _self.pathwayIds
          : pathwayIds // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as RouteStatus?,
    ));
  }

  /// Create a copy of NavigationRoute
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NavigationDestinationCopyWith<$Res> get start {
    return $NavigationDestinationCopyWith<$Res>(_self.start, (value) {
      return _then(_self.copyWith(start: value));
    });
  }

  /// Create a copy of NavigationRoute
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NavigationDestinationCopyWith<$Res> get end {
    return $NavigationDestinationCopyWith<$Res>(_self.end, (value) {
      return _then(_self.copyWith(end: value));
    });
  }

  /// Create a copy of NavigationRoute
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteStatusCopyWith<$Res>? get status {
    if (_self.status == null) {
      return null;
    }

    return $RouteStatusCopyWith<$Res>(_self.status!, (value) {
      return _then(_self.copyWith(status: value));
    });
  }
}

/// Adds pattern-matching-related methods to [NavigationRoute].
extension NavigationRoutePatterns on NavigationRoute {
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
    TResult Function(_NavigationRoute value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NavigationRoute() when $default != null:
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
    TResult Function(_NavigationRoute value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NavigationRoute():
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
    TResult? Function(_NavigationRoute value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NavigationRoute() when $default != null:
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
            NavigationDestination start,
            NavigationDestination end,
            List<LatLng> geometry,
            double totalDistance,
            Duration estimatedDuration,
            List<NavigationInstruction> instructions,
            DateTime createdAt,
            String? pathwayIds,
            @JsonKey(
                fromJson: RouteStatusConverter._routeStatusFromJson,
                toJson: RouteStatusConverter._routeStatusToJson)
            RouteStatus? status)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NavigationRoute() when $default != null:
        return $default(
            _that.id,
            _that.start,
            _that.end,
            _that.geometry,
            _that.totalDistance,
            _that.estimatedDuration,
            _that.instructions,
            _that.createdAt,
            _that.pathwayIds,
            _that.status);
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
            NavigationDestination start,
            NavigationDestination end,
            List<LatLng> geometry,
            double totalDistance,
            Duration estimatedDuration,
            List<NavigationInstruction> instructions,
            DateTime createdAt,
            String? pathwayIds,
            @JsonKey(
                fromJson: RouteStatusConverter._routeStatusFromJson,
                toJson: RouteStatusConverter._routeStatusToJson)
            RouteStatus? status)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NavigationRoute():
        return $default(
            _that.id,
            _that.start,
            _that.end,
            _that.geometry,
            _that.totalDistance,
            _that.estimatedDuration,
            _that.instructions,
            _that.createdAt,
            _that.pathwayIds,
            _that.status);
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
            NavigationDestination start,
            NavigationDestination end,
            List<LatLng> geometry,
            double totalDistance,
            Duration estimatedDuration,
            List<NavigationInstruction> instructions,
            DateTime createdAt,
            String? pathwayIds,
            @JsonKey(
                fromJson: RouteStatusConverter._routeStatusFromJson,
                toJson: RouteStatusConverter._routeStatusToJson)
            RouteStatus? status)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NavigationRoute() when $default != null:
        return $default(
            _that.id,
            _that.start,
            _that.end,
            _that.geometry,
            _that.totalDistance,
            _that.estimatedDuration,
            _that.instructions,
            _that.createdAt,
            _that.pathwayIds,
            _that.status);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NavigationRoute extends NavigationRoute {
  const _NavigationRoute(
      {required this.id,
      required this.start,
      required this.end,
      required List<LatLng> geometry,
      required this.totalDistance,
      required this.estimatedDuration,
      required List<NavigationInstruction> instructions,
      required this.createdAt,
      this.pathwayIds,
      @JsonKey(
          fromJson: RouteStatusConverter._routeStatusFromJson,
          toJson: RouteStatusConverter._routeStatusToJson)
      this.status})
      : _geometry = geometry,
        _instructions = instructions,
        super._();
  factory _NavigationRoute.fromJson(Map<String, dynamic> json) =>
      _$NavigationRouteFromJson(json);

  @override
  final String id;
  @override
  final NavigationDestination start;
  @override
  final NavigationDestination end;
  final List<LatLng> _geometry;
  @override
  List<LatLng> get geometry {
    if (_geometry is EqualUnmodifiableListView) return _geometry;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_geometry);
  }

  @override
  final double totalDistance;
  @override
  final Duration estimatedDuration;
  final List<NavigationInstruction> _instructions;
  @override
  List<NavigationInstruction> get instructions {
    if (_instructions is EqualUnmodifiableListView) return _instructions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_instructions);
  }

  @override
  final DateTime createdAt;
  @override
  final String? pathwayIds;
  @override
  @JsonKey(
      fromJson: RouteStatusConverter._routeStatusFromJson,
      toJson: RouteStatusConverter._routeStatusToJson)
  final RouteStatus? status;

  /// Create a copy of NavigationRoute
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NavigationRouteCopyWith<_NavigationRoute> get copyWith =>
      __$NavigationRouteCopyWithImpl<_NavigationRoute>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NavigationRouteToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NavigationRoute &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            const DeepCollectionEquality().equals(other.geometry, _geometry) &&
            (identical(other.totalDistance, totalDistance) ||
                other.totalDistance == totalDistance) &&
            (identical(other.estimatedDuration, estimatedDuration) ||
                other.estimatedDuration == estimatedDuration) &&
            const DeepCollectionEquality()
                .equals(other.instructions, _instructions) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.pathwayIds, pathwayIds) ||
                other.pathwayIds == pathwayIds) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        id,
        start,
        end,
        const DeepCollectionEquality().hash(_geometry),
        totalDistance,
        estimatedDuration,
        const DeepCollectionEquality().hash(_instructions),
        createdAt,
        pathwayIds,
        status);
  }

  @override
  String toString() {
    return 'NavigationRoute(id: $id, start: $start, end: $end, geometry: $geometry, totalDistance: $totalDistance, estimatedDuration: $estimatedDuration, instructions: $instructions, createdAt: $createdAt, pathwayIds: $pathwayIds, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$NavigationRouteCopyWith<$Res>
    implements $NavigationRouteCopyWith<$Res> {
  factory _$NavigationRouteCopyWith(
          _NavigationRoute value, $Res Function(_NavigationRoute) _then) =
      __$NavigationRouteCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      NavigationDestination start,
      NavigationDestination end,
      List<LatLng> geometry,
      double totalDistance,
      Duration estimatedDuration,
      List<NavigationInstruction> instructions,
      DateTime createdAt,
      String? pathwayIds,
      @JsonKey(
          fromJson: RouteStatusConverter._routeStatusFromJson,
          toJson: RouteStatusConverter._routeStatusToJson)
      RouteStatus? status});

  @override
  $NavigationDestinationCopyWith<$Res> get start;
  @override
  $NavigationDestinationCopyWith<$Res> get end;
  @override
  $RouteStatusCopyWith<$Res>? get status;
}

/// @nodoc
class __$NavigationRouteCopyWithImpl<$Res>
    implements _$NavigationRouteCopyWith<$Res> {
  __$NavigationRouteCopyWithImpl(this._self, this._then);

  final _NavigationRoute _self;
  final $Res Function(_NavigationRoute) _then;

  /// Create a copy of NavigationRoute
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? start = null,
    Object? end = null,
    Object? geometry = null,
    Object? totalDistance = null,
    Object? estimatedDuration = null,
    Object? instructions = null,
    Object? createdAt = null,
    Object? pathwayIds = freezed,
    Object? status = freezed,
  }) {
    return _then(_NavigationRoute(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      start: null == start
          ? _self.start
          : start // ignore: cast_nullable_to_non_nullable
              as NavigationDestination,
      end: null == end
          ? _self.end
          : end // ignore: cast_nullable_to_non_nullable
              as NavigationDestination,
      geometry: null == geometry
          ? _self._geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as List<LatLng>,
      totalDistance: null == totalDistance
          ? _self.totalDistance
          : totalDistance // ignore: cast_nullable_to_non_nullable
              as double,
      estimatedDuration: null == estimatedDuration
          ? _self.estimatedDuration
          : estimatedDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      instructions: null == instructions
          ? _self._instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as List<NavigationInstruction>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      pathwayIds: freezed == pathwayIds
          ? _self.pathwayIds
          : pathwayIds // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as RouteStatus?,
    ));
  }

  /// Create a copy of NavigationRoute
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NavigationDestinationCopyWith<$Res> get start {
    return $NavigationDestinationCopyWith<$Res>(_self.start, (value) {
      return _then(_self.copyWith(start: value));
    });
  }

  /// Create a copy of NavigationRoute
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NavigationDestinationCopyWith<$Res> get end {
    return $NavigationDestinationCopyWith<$Res>(_self.end, (value) {
      return _then(_self.copyWith(end: value));
    });
  }

  /// Create a copy of NavigationRoute
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RouteStatusCopyWith<$Res>? get status {
    if (_self.status == null) {
      return null;
    }

    return $RouteStatusCopyWith<$Res>(_self.status!, (value) {
      return _then(_self.copyWith(status: value));
    });
  }
}

/// @nodoc
mixin _$NavigationInstruction {
  String get instruction;
  double get latitude;
  double get longitude;
  double get distanceToNext;
  @JsonKey(
      fromJson: InstructionTypeConverter._instructionTypeFromJson,
      toJson: InstructionTypeConverter._instructionTypeToJson)
  InstructionType get type;
  String? get roadName;
  String? get landmark;

  /// Create a copy of NavigationInstruction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NavigationInstructionCopyWith<NavigationInstruction> get copyWith =>
      _$NavigationInstructionCopyWithImpl<NavigationInstruction>(
          this as NavigationInstruction, _$identity);

  /// Serializes this NavigationInstruction to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as NavigationInstruction;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NavigationInstruction &&
            (identical(other.instruction, _this.instruction) ||
                other.instruction == _this.instruction) &&
            (identical(other.latitude, _this.latitude) ||
                other.latitude == _this.latitude) &&
            (identical(other.longitude, _this.longitude) ||
                other.longitude == _this.longitude) &&
            (identical(other.distanceToNext, _this.distanceToNext) ||
                other.distanceToNext == _this.distanceToNext) &&
            (identical(other.type, _this.type) || other.type == _this.type) &&
            (identical(other.roadName, _this.roadName) ||
                other.roadName == _this.roadName) &&
            (identical(other.landmark, _this.landmark) ||
                other.landmark == _this.landmark));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as NavigationInstruction;
    return Object.hash(
        runtimeType,
        _this.instruction,
        _this.latitude,
        _this.longitude,
        _this.distanceToNext,
        _this.type,
        _this.roadName,
        _this.landmark);
  }

  @override
  String toString() {
    final _this = this as NavigationInstruction;
    return 'NavigationInstruction(instruction: ${_this.instruction}, latitude: ${_this.latitude}, longitude: ${_this.longitude}, distanceToNext: ${_this.distanceToNext}, type: ${_this.type}, roadName: ${_this.roadName}, landmark: ${_this.landmark})';
  }
}

/// @nodoc
abstract mixin class $NavigationInstructionCopyWith<$Res> {
  factory $NavigationInstructionCopyWith(NavigationInstruction value,
          $Res Function(NavigationInstruction) _then) =
      _$NavigationInstructionCopyWithImpl;
  @useResult
  $Res call(
      {String instruction,
      double latitude,
      double longitude,
      double distanceToNext,
      @JsonKey(
          fromJson: InstructionTypeConverter._instructionTypeFromJson,
          toJson: InstructionTypeConverter._instructionTypeToJson)
      InstructionType type,
      String? roadName,
      String? landmark});

  $InstructionTypeCopyWith<$Res> get type;
}

/// @nodoc
class _$NavigationInstructionCopyWithImpl<$Res>
    implements $NavigationInstructionCopyWith<$Res> {
  _$NavigationInstructionCopyWithImpl(this._self, this._then);

  final NavigationInstruction _self;
  final $Res Function(NavigationInstruction) _then;

  /// Create a copy of NavigationInstruction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instruction = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? distanceToNext = null,
    Object? type = null,
    Object? roadName = freezed,
    Object? landmark = freezed,
  }) {
    return _then(NavigationInstruction(
      instruction: null == instruction
          ? _self.instruction
          : instruction // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      distanceToNext: null == distanceToNext
          ? _self.distanceToNext
          : distanceToNext // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as InstructionType,
      roadName: freezed == roadName
          ? _self.roadName
          : roadName // ignore: cast_nullable_to_non_nullable
              as String?,
      landmark: freezed == landmark
          ? _self.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of NavigationInstruction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InstructionTypeCopyWith<$Res> get type {
    return $InstructionTypeCopyWith<$Res>(_self.type, (value) {
      return _then(_self.copyWith(type: value));
    });
  }
}

/// Adds pattern-matching-related methods to [NavigationInstruction].
extension NavigationInstructionPatterns on NavigationInstruction {
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
    TResult Function(_NavigationInstruction value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NavigationInstruction() when $default != null:
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
    TResult Function(_NavigationInstruction value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NavigationInstruction():
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
    TResult? Function(_NavigationInstruction value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NavigationInstruction() when $default != null:
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
            String instruction,
            double latitude,
            double longitude,
            double distanceToNext,
            @JsonKey(
                fromJson: InstructionTypeConverter._instructionTypeFromJson,
                toJson: InstructionTypeConverter._instructionTypeToJson)
            InstructionType type,
            String? roadName,
            String? landmark)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NavigationInstruction() when $default != null:
        return $default(_that.instruction, _that.latitude, _that.longitude,
            _that.distanceToNext, _that.type, _that.roadName, _that.landmark);
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
            String instruction,
            double latitude,
            double longitude,
            double distanceToNext,
            @JsonKey(
                fromJson: InstructionTypeConverter._instructionTypeFromJson,
                toJson: InstructionTypeConverter._instructionTypeToJson)
            InstructionType type,
            String? roadName,
            String? landmark)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NavigationInstruction():
        return $default(_that.instruction, _that.latitude, _that.longitude,
            _that.distanceToNext, _that.type, _that.roadName, _that.landmark);
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
            String instruction,
            double latitude,
            double longitude,
            double distanceToNext,
            @JsonKey(
                fromJson: InstructionTypeConverter._instructionTypeFromJson,
                toJson: InstructionTypeConverter._instructionTypeToJson)
            InstructionType type,
            String? roadName,
            String? landmark)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NavigationInstruction() when $default != null:
        return $default(_that.instruction, _that.latitude, _that.longitude,
            _that.distanceToNext, _that.type, _that.roadName, _that.landmark);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NavigationInstruction extends NavigationInstruction {
  const _NavigationInstruction(
      {required this.instruction,
      required this.latitude,
      required this.longitude,
      required this.distanceToNext,
      @JsonKey(
          fromJson: InstructionTypeConverter._instructionTypeFromJson,
          toJson: InstructionTypeConverter._instructionTypeToJson)
      required this.type,
      this.roadName,
      this.landmark})
      : super._();
  factory _NavigationInstruction.fromJson(Map<String, dynamic> json) =>
      _$NavigationInstructionFromJson(json);

  @override
  final String instruction;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final double distanceToNext;
  @override
  @JsonKey(
      fromJson: InstructionTypeConverter._instructionTypeFromJson,
      toJson: InstructionTypeConverter._instructionTypeToJson)
  final InstructionType type;
  @override
  final String? roadName;
  @override
  final String? landmark;

  /// Create a copy of NavigationInstruction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NavigationInstructionCopyWith<_NavigationInstruction> get copyWith =>
      __$NavigationInstructionCopyWithImpl<_NavigationInstruction>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NavigationInstructionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NavigationInstruction &&
            (identical(other.instruction, instruction) ||
                other.instruction == instruction) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.distanceToNext, distanceToNext) ||
                other.distanceToNext == distanceToNext) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.roadName, roadName) ||
                other.roadName == roadName) &&
            (identical(other.landmark, landmark) ||
                other.landmark == landmark));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(runtimeType, instruction, latitude, longitude,
        distanceToNext, type, roadName, landmark);
  }

  @override
  String toString() {
    return 'NavigationInstruction(instruction: $instruction, latitude: $latitude, longitude: $longitude, distanceToNext: $distanceToNext, type: $type, roadName: $roadName, landmark: $landmark)';
  }
}

/// @nodoc
abstract mixin class _$NavigationInstructionCopyWith<$Res>
    implements $NavigationInstructionCopyWith<$Res> {
  factory _$NavigationInstructionCopyWith(_NavigationInstruction value,
          $Res Function(_NavigationInstruction) _then) =
      __$NavigationInstructionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String instruction,
      double latitude,
      double longitude,
      double distanceToNext,
      @JsonKey(
          fromJson: InstructionTypeConverter._instructionTypeFromJson,
          toJson: InstructionTypeConverter._instructionTypeToJson)
      InstructionType type,
      String? roadName,
      String? landmark});

  @override
  $InstructionTypeCopyWith<$Res> get type;
}

/// @nodoc
class __$NavigationInstructionCopyWithImpl<$Res>
    implements _$NavigationInstructionCopyWith<$Res> {
  __$NavigationInstructionCopyWithImpl(this._self, this._then);

  final _NavigationInstruction _self;
  final $Res Function(_NavigationInstruction) _then;

  /// Create a copy of NavigationInstruction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? instruction = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? distanceToNext = null,
    Object? type = null,
    Object? roadName = freezed,
    Object? landmark = freezed,
  }) {
    return _then(_NavigationInstruction(
      instruction: null == instruction
          ? _self.instruction
          : instruction // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      distanceToNext: null == distanceToNext
          ? _self.distanceToNext
          : distanceToNext // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as InstructionType,
      roadName: freezed == roadName
          ? _self.roadName
          : roadName // ignore: cast_nullable_to_non_nullable
              as String?,
      landmark: freezed == landmark
          ? _self.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of NavigationInstruction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InstructionTypeCopyWith<$Res> get type {
    return $InstructionTypeCopyWith<$Res>(_self.type, (value) {
      return _then(_self.copyWith(type: value));
    });
  }
}

/// @nodoc
mixin _$InstructionType {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is InstructionType);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'InstructionType()';
  }
}

/// @nodoc
class $InstructionTypeCopyWith<$Res> {
  $InstructionTypeCopyWith(
      InstructionType _, $Res Function(InstructionType) __);
}

/// Adds pattern-matching-related methods to [InstructionType].
extension InstructionTypePatterns on InstructionType {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Start value)? start,
    TResult Function(_ContinueStraight value)? continueStraight,
    TResult Function(_TurnLeft value)? turnLeft,
    TResult Function(_TurnRight value)? turnRight,
    TResult Function(_TurnSlightLeft value)? turnSlightLeft,
    TResult Function(_TurnSlightRight value)? turnSlightRight,
    TResult Function(_Uturn value)? uturn,
    TResult Function(_Arrive value)? arrive,
    TResult Function(_EnterBuilding value)? enterBuilding,
    TResult Function(_ExitBuilding value)? exitBuilding,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Start() when start != null:
        return start(_that);
      case _ContinueStraight() when continueStraight != null:
        return continueStraight(_that);
      case _TurnLeft() when turnLeft != null:
        return turnLeft(_that);
      case _TurnRight() when turnRight != null:
        return turnRight(_that);
      case _TurnSlightLeft() when turnSlightLeft != null:
        return turnSlightLeft(_that);
      case _TurnSlightRight() when turnSlightRight != null:
        return turnSlightRight(_that);
      case _Uturn() when uturn != null:
        return uturn(_that);
      case _Arrive() when arrive != null:
        return arrive(_that);
      case _EnterBuilding() when enterBuilding != null:
        return enterBuilding(_that);
      case _ExitBuilding() when exitBuilding != null:
        return exitBuilding(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(_Start value) start,
    required TResult Function(_ContinueStraight value) continueStraight,
    required TResult Function(_TurnLeft value) turnLeft,
    required TResult Function(_TurnRight value) turnRight,
    required TResult Function(_TurnSlightLeft value) turnSlightLeft,
    required TResult Function(_TurnSlightRight value) turnSlightRight,
    required TResult Function(_Uturn value) uturn,
    required TResult Function(_Arrive value) arrive,
    required TResult Function(_EnterBuilding value) enterBuilding,
    required TResult Function(_ExitBuilding value) exitBuilding,
  }) {
    final _that = this;
    switch (_that) {
      case _Start():
        return start(_that);
      case _ContinueStraight():
        return continueStraight(_that);
      case _TurnLeft():
        return turnLeft(_that);
      case _TurnRight():
        return turnRight(_that);
      case _TurnSlightLeft():
        return turnSlightLeft(_that);
      case _TurnSlightRight():
        return turnSlightRight(_that);
      case _Uturn():
        return uturn(_that);
      case _Arrive():
        return arrive(_that);
      case _EnterBuilding():
        return enterBuilding(_that);
      case _ExitBuilding():
        return exitBuilding(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Start value)? start,
    TResult? Function(_ContinueStraight value)? continueStraight,
    TResult? Function(_TurnLeft value)? turnLeft,
    TResult? Function(_TurnRight value)? turnRight,
    TResult? Function(_TurnSlightLeft value)? turnSlightLeft,
    TResult? Function(_TurnSlightRight value)? turnSlightRight,
    TResult? Function(_Uturn value)? uturn,
    TResult? Function(_Arrive value)? arrive,
    TResult? Function(_EnterBuilding value)? enterBuilding,
    TResult? Function(_ExitBuilding value)? exitBuilding,
  }) {
    final _that = this;
    switch (_that) {
      case _Start() when start != null:
        return start(_that);
      case _ContinueStraight() when continueStraight != null:
        return continueStraight(_that);
      case _TurnLeft() when turnLeft != null:
        return turnLeft(_that);
      case _TurnRight() when turnRight != null:
        return turnRight(_that);
      case _TurnSlightLeft() when turnSlightLeft != null:
        return turnSlightLeft(_that);
      case _TurnSlightRight() when turnSlightRight != null:
        return turnSlightRight(_that);
      case _Uturn() when uturn != null:
        return uturn(_that);
      case _Arrive() when arrive != null:
        return arrive(_that);
      case _EnterBuilding() when enterBuilding != null:
        return enterBuilding(_that);
      case _ExitBuilding() when exitBuilding != null:
        return exitBuilding(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    TResult Function()? continueStraight,
    TResult Function()? turnLeft,
    TResult Function()? turnRight,
    TResult Function()? turnSlightLeft,
    TResult Function()? turnSlightRight,
    TResult Function()? uturn,
    TResult Function()? arrive,
    TResult Function()? enterBuilding,
    TResult Function()? exitBuilding,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Start() when start != null:
        return start();
      case _ContinueStraight() when continueStraight != null:
        return continueStraight();
      case _TurnLeft() when turnLeft != null:
        return turnLeft();
      case _TurnRight() when turnRight != null:
        return turnRight();
      case _TurnSlightLeft() when turnSlightLeft != null:
        return turnSlightLeft();
      case _TurnSlightRight() when turnSlightRight != null:
        return turnSlightRight();
      case _Uturn() when uturn != null:
        return uturn();
      case _Arrive() when arrive != null:
        return arrive();
      case _EnterBuilding() when enterBuilding != null:
        return enterBuilding();
      case _ExitBuilding() when exitBuilding != null:
        return exitBuilding();
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
  TResult when<TResult extends Object?>({
    required TResult Function() start,
    required TResult Function() continueStraight,
    required TResult Function() turnLeft,
    required TResult Function() turnRight,
    required TResult Function() turnSlightLeft,
    required TResult Function() turnSlightRight,
    required TResult Function() uturn,
    required TResult Function() arrive,
    required TResult Function() enterBuilding,
    required TResult Function() exitBuilding,
  }) {
    final _that = this;
    switch (_that) {
      case _Start():
        return start();
      case _ContinueStraight():
        return continueStraight();
      case _TurnLeft():
        return turnLeft();
      case _TurnRight():
        return turnRight();
      case _TurnSlightLeft():
        return turnSlightLeft();
      case _TurnSlightRight():
        return turnSlightRight();
      case _Uturn():
        return uturn();
      case _Arrive():
        return arrive();
      case _EnterBuilding():
        return enterBuilding();
      case _ExitBuilding():
        return exitBuilding();
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
    TResult? Function()? continueStraight,
    TResult? Function()? turnLeft,
    TResult? Function()? turnRight,
    TResult? Function()? turnSlightLeft,
    TResult? Function()? turnSlightRight,
    TResult? Function()? uturn,
    TResult? Function()? arrive,
    TResult? Function()? enterBuilding,
    TResult? Function()? exitBuilding,
  }) {
    final _that = this;
    switch (_that) {
      case _Start() when start != null:
        return start();
      case _ContinueStraight() when continueStraight != null:
        return continueStraight();
      case _TurnLeft() when turnLeft != null:
        return turnLeft();
      case _TurnRight() when turnRight != null:
        return turnRight();
      case _TurnSlightLeft() when turnSlightLeft != null:
        return turnSlightLeft();
      case _TurnSlightRight() when turnSlightRight != null:
        return turnSlightRight();
      case _Uturn() when uturn != null:
        return uturn();
      case _Arrive() when arrive != null:
        return arrive();
      case _EnterBuilding() when enterBuilding != null:
        return enterBuilding();
      case _ExitBuilding() when exitBuilding != null:
        return exitBuilding();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Start implements InstructionType {
  const _Start();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Start);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'InstructionType.start()';
  }
}

/// @nodoc

class _ContinueStraight implements InstructionType {
  const _ContinueStraight();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ContinueStraight);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'InstructionType.continueStraight()';
  }
}

/// @nodoc

class _TurnLeft implements InstructionType {
  const _TurnLeft();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _TurnLeft);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'InstructionType.turnLeft()';
  }
}

/// @nodoc

class _TurnRight implements InstructionType {
  const _TurnRight();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _TurnRight);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'InstructionType.turnRight()';
  }
}

/// @nodoc

class _TurnSlightLeft implements InstructionType {
  const _TurnSlightLeft();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _TurnSlightLeft);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'InstructionType.turnSlightLeft()';
  }
}

/// @nodoc

class _TurnSlightRight implements InstructionType {
  const _TurnSlightRight();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _TurnSlightRight);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'InstructionType.turnSlightRight()';
  }
}

/// @nodoc

class _Uturn implements InstructionType {
  const _Uturn();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Uturn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'InstructionType.uturn()';
  }
}

/// @nodoc

class _Arrive implements InstructionType {
  const _Arrive();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Arrive);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'InstructionType.arrive()';
  }
}

/// @nodoc

class _EnterBuilding implements InstructionType {
  const _EnterBuilding();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _EnterBuilding);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'InstructionType.enterBuilding()';
  }
}

/// @nodoc

class _ExitBuilding implements InstructionType {
  const _ExitBuilding();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ExitBuilding);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'InstructionType.exitBuilding()';
  }
}

/// @nodoc
mixin _$RouteStatus {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RouteStatus);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RouteStatus()';
  }
}

/// @nodoc
class $RouteStatusCopyWith<$Res> {
  $RouteStatusCopyWith(RouteStatus _, $Res Function(RouteStatus) __);
}

/// Adds pattern-matching-related methods to [RouteStatus].
extension RouteStatusPatterns on RouteStatus {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Planned value)? planned,
    TResult Function(_Active value)? active,
    TResult Function(_Paused value)? paused,
    TResult Function(_Completed value)? completed,
    TResult Function(_Cancelled value)? cancelled,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Planned() when planned != null:
        return planned(_that);
      case _Active() when active != null:
        return active(_that);
      case _Paused() when paused != null:
        return paused(_that);
      case _Completed() when completed != null:
        return completed(_that);
      case _Cancelled() when cancelled != null:
        return cancelled(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(_Planned value) planned,
    required TResult Function(_Active value) active,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Cancelled value) cancelled,
  }) {
    final _that = this;
    switch (_that) {
      case _Planned():
        return planned(_that);
      case _Active():
        return active(_that);
      case _Paused():
        return paused(_that);
      case _Completed():
        return completed(_that);
      case _Cancelled():
        return cancelled(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Planned value)? planned,
    TResult? Function(_Active value)? active,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Completed value)? completed,
    TResult? Function(_Cancelled value)? cancelled,
  }) {
    final _that = this;
    switch (_that) {
      case _Planned() when planned != null:
        return planned(_that);
      case _Active() when active != null:
        return active(_that);
      case _Paused() when paused != null:
        return paused(_that);
      case _Completed() when completed != null:
        return completed(_that);
      case _Cancelled() when cancelled != null:
        return cancelled(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? planned,
    TResult Function()? active,
    TResult Function()? paused,
    TResult Function()? completed,
    TResult Function()? cancelled,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Planned() when planned != null:
        return planned();
      case _Active() when active != null:
        return active();
      case _Paused() when paused != null:
        return paused();
      case _Completed() when completed != null:
        return completed();
      case _Cancelled() when cancelled != null:
        return cancelled();
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
  TResult when<TResult extends Object?>({
    required TResult Function() planned,
    required TResult Function() active,
    required TResult Function() paused,
    required TResult Function() completed,
    required TResult Function() cancelled,
  }) {
    final _that = this;
    switch (_that) {
      case _Planned():
        return planned();
      case _Active():
        return active();
      case _Paused():
        return paused();
      case _Completed():
        return completed();
      case _Cancelled():
        return cancelled();
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? planned,
    TResult? Function()? active,
    TResult? Function()? paused,
    TResult? Function()? completed,
    TResult? Function()? cancelled,
  }) {
    final _that = this;
    switch (_that) {
      case _Planned() when planned != null:
        return planned();
      case _Active() when active != null:
        return active();
      case _Paused() when paused != null:
        return paused();
      case _Completed() when completed != null:
        return completed();
      case _Cancelled() when cancelled != null:
        return cancelled();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Planned implements RouteStatus {
  const _Planned();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Planned);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RouteStatus.planned()';
  }
}

/// @nodoc

class _Active implements RouteStatus {
  const _Active();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Active);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RouteStatus.active()';
  }
}

/// @nodoc

class _Paused implements RouteStatus {
  const _Paused();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Paused);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RouteStatus.paused()';
  }
}

/// @nodoc

class _Completed implements RouteStatus {
  const _Completed();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Completed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RouteStatus.completed()';
  }
}

/// @nodoc

class _Cancelled implements RouteStatus {
  const _Cancelled();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Cancelled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RouteStatus.cancelled()';
  }
}

/// @nodoc
mixin _$NavigationSession {
  String get id;
  NavigationRoute get route;
  int get currentInstructionIndex;
  LatLng get currentPosition;
  DateTime get startedAt;
  DateTime? get completedAt;
  double? get remainingDistance;
  Duration? get remainingTime;
  bool get isVoiceGuidanceEnabled;
  bool get isRerouting;

  /// Create a copy of NavigationSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NavigationSessionCopyWith<NavigationSession> get copyWith =>
      _$NavigationSessionCopyWithImpl<NavigationSession>(
          this as NavigationSession, _$identity);

  /// Serializes this NavigationSession to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as NavigationSession;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NavigationSession &&
            (identical(other.id, _this.id) || other.id == _this.id) &&
            (identical(other.route, _this.route) ||
                other.route == _this.route) &&
            (identical(other.currentInstructionIndex,
                    _this.currentInstructionIndex) ||
                other.currentInstructionIndex ==
                    _this.currentInstructionIndex) &&
            (identical(other.currentPosition, _this.currentPosition) ||
                other.currentPosition == _this.currentPosition) &&
            (identical(other.startedAt, _this.startedAt) ||
                other.startedAt == _this.startedAt) &&
            (identical(other.completedAt, _this.completedAt) ||
                other.completedAt == _this.completedAt) &&
            (identical(other.remainingDistance, _this.remainingDistance) ||
                other.remainingDistance == _this.remainingDistance) &&
            (identical(other.remainingTime, _this.remainingTime) ||
                other.remainingTime == _this.remainingTime) &&
            (identical(other.isVoiceGuidanceEnabled,
                    _this.isVoiceGuidanceEnabled) ||
                other.isVoiceGuidanceEnabled == _this.isVoiceGuidanceEnabled) &&
            (identical(other.isRerouting, _this.isRerouting) ||
                other.isRerouting == _this.isRerouting));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as NavigationSession;
    return Object.hash(
        runtimeType,
        _this.id,
        _this.route,
        _this.currentInstructionIndex,
        _this.currentPosition,
        _this.startedAt,
        _this.completedAt,
        _this.remainingDistance,
        _this.remainingTime,
        _this.isVoiceGuidanceEnabled,
        _this.isRerouting);
  }

  @override
  String toString() {
    final _this = this as NavigationSession;
    return 'NavigationSession(id: ${_this.id}, route: ${_this.route}, currentInstructionIndex: ${_this.currentInstructionIndex}, currentPosition: ${_this.currentPosition}, startedAt: ${_this.startedAt}, completedAt: ${_this.completedAt}, remainingDistance: ${_this.remainingDistance}, remainingTime: ${_this.remainingTime}, isVoiceGuidanceEnabled: ${_this.isVoiceGuidanceEnabled}, isRerouting: ${_this.isRerouting})';
  }
}

/// @nodoc
abstract mixin class $NavigationSessionCopyWith<$Res> {
  factory $NavigationSessionCopyWith(
          NavigationSession value, $Res Function(NavigationSession) _then) =
      _$NavigationSessionCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      NavigationRoute route,
      int currentInstructionIndex,
      LatLng currentPosition,
      DateTime startedAt,
      DateTime? completedAt,
      double? remainingDistance,
      Duration? remainingTime,
      bool isVoiceGuidanceEnabled,
      bool isRerouting});

  $NavigationRouteCopyWith<$Res> get route;
}

/// @nodoc
class _$NavigationSessionCopyWithImpl<$Res>
    implements $NavigationSessionCopyWith<$Res> {
  _$NavigationSessionCopyWithImpl(this._self, this._then);

  final NavigationSession _self;
  final $Res Function(NavigationSession) _then;

  /// Create a copy of NavigationSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? route = null,
    Object? currentInstructionIndex = null,
    Object? currentPosition = null,
    Object? startedAt = null,
    Object? completedAt = freezed,
    Object? remainingDistance = freezed,
    Object? remainingTime = freezed,
    Object? isVoiceGuidanceEnabled = null,
    Object? isRerouting = null,
  }) {
    return _then(NavigationSession(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      route: null == route
          ? _self.route
          : route // ignore: cast_nullable_to_non_nullable
              as NavigationRoute,
      currentInstructionIndex: null == currentInstructionIndex
          ? _self.currentInstructionIndex
          : currentInstructionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentPosition: null == currentPosition
          ? _self.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as LatLng,
      startedAt: null == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      remainingDistance: freezed == remainingDistance
          ? _self.remainingDistance
          : remainingDistance // ignore: cast_nullable_to_non_nullable
              as double?,
      remainingTime: freezed == remainingTime
          ? _self.remainingTime
          : remainingTime // ignore: cast_nullable_to_non_nullable
              as Duration?,
      isVoiceGuidanceEnabled: null == isVoiceGuidanceEnabled
          ? _self.isVoiceGuidanceEnabled
          : isVoiceGuidanceEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isRerouting: null == isRerouting
          ? _self.isRerouting
          : isRerouting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of NavigationSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NavigationRouteCopyWith<$Res> get route {
    return $NavigationRouteCopyWith<$Res>(_self.route, (value) {
      return _then(_self.copyWith(route: value));
    });
  }
}

/// Adds pattern-matching-related methods to [NavigationSession].
extension NavigationSessionPatterns on NavigationSession {
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
    TResult Function(_NavigationSession value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NavigationSession() when $default != null:
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
    TResult Function(_NavigationSession value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NavigationSession():
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
    TResult? Function(_NavigationSession value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NavigationSession() when $default != null:
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
            NavigationRoute route,
            int currentInstructionIndex,
            LatLng currentPosition,
            DateTime startedAt,
            DateTime? completedAt,
            double? remainingDistance,
            Duration? remainingTime,
            bool isVoiceGuidanceEnabled,
            bool isRerouting)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NavigationSession() when $default != null:
        return $default(
            _that.id,
            _that.route,
            _that.currentInstructionIndex,
            _that.currentPosition,
            _that.startedAt,
            _that.completedAt,
            _that.remainingDistance,
            _that.remainingTime,
            _that.isVoiceGuidanceEnabled,
            _that.isRerouting);
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
            NavigationRoute route,
            int currentInstructionIndex,
            LatLng currentPosition,
            DateTime startedAt,
            DateTime? completedAt,
            double? remainingDistance,
            Duration? remainingTime,
            bool isVoiceGuidanceEnabled,
            bool isRerouting)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NavigationSession():
        return $default(
            _that.id,
            _that.route,
            _that.currentInstructionIndex,
            _that.currentPosition,
            _that.startedAt,
            _that.completedAt,
            _that.remainingDistance,
            _that.remainingTime,
            _that.isVoiceGuidanceEnabled,
            _that.isRerouting);
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
            NavigationRoute route,
            int currentInstructionIndex,
            LatLng currentPosition,
            DateTime startedAt,
            DateTime? completedAt,
            double? remainingDistance,
            Duration? remainingTime,
            bool isVoiceGuidanceEnabled,
            bool isRerouting)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NavigationSession() when $default != null:
        return $default(
            _that.id,
            _that.route,
            _that.currentInstructionIndex,
            _that.currentPosition,
            _that.startedAt,
            _that.completedAt,
            _that.remainingDistance,
            _that.remainingTime,
            _that.isVoiceGuidanceEnabled,
            _that.isRerouting);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NavigationSession extends NavigationSession {
  const _NavigationSession(
      {required this.id,
      required this.route,
      required this.currentInstructionIndex,
      required this.currentPosition,
      required this.startedAt,
      this.completedAt,
      this.remainingDistance,
      this.remainingTime,
      this.isVoiceGuidanceEnabled = false,
      this.isRerouting = false})
      : super._();
  factory _NavigationSession.fromJson(Map<String, dynamic> json) =>
      _$NavigationSessionFromJson(json);

  @override
  final String id;
  @override
  final NavigationRoute route;
  @override
  final int currentInstructionIndex;
  @override
  final LatLng currentPosition;
  @override
  final DateTime startedAt;
  @override
  final DateTime? completedAt;
  @override
  final double? remainingDistance;
  @override
  final Duration? remainingTime;
  @override
  @JsonKey()
  final bool isVoiceGuidanceEnabled;
  @override
  @JsonKey()
  final bool isRerouting;

  /// Create a copy of NavigationSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NavigationSessionCopyWith<_NavigationSession> get copyWith =>
      __$NavigationSessionCopyWithImpl<_NavigationSession>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NavigationSessionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NavigationSession &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.route, route) || other.route == route) &&
            (identical(
                    other.currentInstructionIndex, currentInstructionIndex) ||
                other.currentInstructionIndex == currentInstructionIndex) &&
            (identical(other.currentPosition, currentPosition) ||
                other.currentPosition == currentPosition) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.remainingDistance, remainingDistance) ||
                other.remainingDistance == remainingDistance) &&
            (identical(other.remainingTime, remainingTime) ||
                other.remainingTime == remainingTime) &&
            (identical(other.isVoiceGuidanceEnabled, isVoiceGuidanceEnabled) ||
                other.isVoiceGuidanceEnabled == isVoiceGuidanceEnabled) &&
            (identical(other.isRerouting, isRerouting) ||
                other.isRerouting == isRerouting));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        id,
        route,
        currentInstructionIndex,
        currentPosition,
        startedAt,
        completedAt,
        remainingDistance,
        remainingTime,
        isVoiceGuidanceEnabled,
        isRerouting);
  }

  @override
  String toString() {
    return 'NavigationSession(id: $id, route: $route, currentInstructionIndex: $currentInstructionIndex, currentPosition: $currentPosition, startedAt: $startedAt, completedAt: $completedAt, remainingDistance: $remainingDistance, remainingTime: $remainingTime, isVoiceGuidanceEnabled: $isVoiceGuidanceEnabled, isRerouting: $isRerouting)';
  }
}

/// @nodoc
abstract mixin class _$NavigationSessionCopyWith<$Res>
    implements $NavigationSessionCopyWith<$Res> {
  factory _$NavigationSessionCopyWith(
          _NavigationSession value, $Res Function(_NavigationSession) _then) =
      __$NavigationSessionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      NavigationRoute route,
      int currentInstructionIndex,
      LatLng currentPosition,
      DateTime startedAt,
      DateTime? completedAt,
      double? remainingDistance,
      Duration? remainingTime,
      bool isVoiceGuidanceEnabled,
      bool isRerouting});

  @override
  $NavigationRouteCopyWith<$Res> get route;
}

/// @nodoc
class __$NavigationSessionCopyWithImpl<$Res>
    implements _$NavigationSessionCopyWith<$Res> {
  __$NavigationSessionCopyWithImpl(this._self, this._then);

  final _NavigationSession _self;
  final $Res Function(_NavigationSession) _then;

  /// Create a copy of NavigationSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? route = null,
    Object? currentInstructionIndex = null,
    Object? currentPosition = null,
    Object? startedAt = null,
    Object? completedAt = freezed,
    Object? remainingDistance = freezed,
    Object? remainingTime = freezed,
    Object? isVoiceGuidanceEnabled = null,
    Object? isRerouting = null,
  }) {
    return _then(_NavigationSession(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      route: null == route
          ? _self.route
          : route // ignore: cast_nullable_to_non_nullable
              as NavigationRoute,
      currentInstructionIndex: null == currentInstructionIndex
          ? _self.currentInstructionIndex
          : currentInstructionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentPosition: null == currentPosition
          ? _self.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as LatLng,
      startedAt: null == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedAt: freezed == completedAt
          ? _self.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      remainingDistance: freezed == remainingDistance
          ? _self.remainingDistance
          : remainingDistance // ignore: cast_nullable_to_non_nullable
              as double?,
      remainingTime: freezed == remainingTime
          ? _self.remainingTime
          : remainingTime // ignore: cast_nullable_to_non_nullable
              as Duration?,
      isVoiceGuidanceEnabled: null == isVoiceGuidanceEnabled
          ? _self.isVoiceGuidanceEnabled
          : isVoiceGuidanceEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isRerouting: null == isRerouting
          ? _self.isRerouting
          : isRerouting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of NavigationSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NavigationRouteCopyWith<$Res> get route {
    return $NavigationRouteCopyWith<$Res>(_self.route, (value) {
      return _then(_self.copyWith(route: value));
    });
  }
}

/// @nodoc
mixin _$SavedRoute {
  String get id;
  String get name;
  NavigationRoute get route;
  DateTime get savedAt;
  bool get isFavorite;
  int get useCount;

  /// Create a copy of SavedRoute
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SavedRouteCopyWith<SavedRoute> get copyWith =>
      _$SavedRouteCopyWithImpl<SavedRoute>(this as SavedRoute, _$identity);

  /// Serializes this SavedRoute to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    final _this = this as SavedRoute;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SavedRoute &&
            (identical(other.id, _this.id) || other.id == _this.id) &&
            (identical(other.name, _this.name) || other.name == _this.name) &&
            (identical(other.route, _this.route) ||
                other.route == _this.route) &&
            (identical(other.savedAt, _this.savedAt) ||
                other.savedAt == _this.savedAt) &&
            (identical(other.isFavorite, _this.isFavorite) ||
                other.isFavorite == _this.isFavorite) &&
            (identical(other.useCount, _this.useCount) ||
                other.useCount == _this.useCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    final _this = this as SavedRoute;
    return Object.hash(runtimeType, _this.id, _this.name, _this.route,
        _this.savedAt, _this.isFavorite, _this.useCount);
  }

  @override
  String toString() {
    final _this = this as SavedRoute;
    return 'SavedRoute(id: ${_this.id}, name: ${_this.name}, route: ${_this.route}, savedAt: ${_this.savedAt}, isFavorite: ${_this.isFavorite}, useCount: ${_this.useCount})';
  }
}

/// @nodoc
abstract mixin class $SavedRouteCopyWith<$Res> {
  factory $SavedRouteCopyWith(
          SavedRoute value, $Res Function(SavedRoute) _then) =
      _$SavedRouteCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      NavigationRoute route,
      DateTime savedAt,
      bool isFavorite,
      int useCount});

  $NavigationRouteCopyWith<$Res> get route;
}

/// @nodoc
class _$SavedRouteCopyWithImpl<$Res> implements $SavedRouteCopyWith<$Res> {
  _$SavedRouteCopyWithImpl(this._self, this._then);

  final SavedRoute _self;
  final $Res Function(SavedRoute) _then;

  /// Create a copy of SavedRoute
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? route = null,
    Object? savedAt = null,
    Object? isFavorite = null,
    Object? useCount = null,
  }) {
    return _then(SavedRoute(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      route: null == route
          ? _self.route
          : route // ignore: cast_nullable_to_non_nullable
              as NavigationRoute,
      savedAt: null == savedAt
          ? _self.savedAt
          : savedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isFavorite: null == isFavorite
          ? _self.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      useCount: null == useCount
          ? _self.useCount
          : useCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of SavedRoute
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NavigationRouteCopyWith<$Res> get route {
    return $NavigationRouteCopyWith<$Res>(_self.route, (value) {
      return _then(_self.copyWith(route: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SavedRoute].
extension SavedRoutePatterns on SavedRoute {
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
    TResult Function(_SavedRoute value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SavedRoute() when $default != null:
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
    TResult Function(_SavedRoute value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SavedRoute():
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
    TResult? Function(_SavedRoute value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SavedRoute() when $default != null:
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
    TResult Function(String id, String name, NavigationRoute route,
            DateTime savedAt, bool isFavorite, int useCount)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SavedRoute() when $default != null:
        return $default(_that.id, _that.name, _that.route, _that.savedAt,
            _that.isFavorite, _that.useCount);
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
    TResult Function(String id, String name, NavigationRoute route,
            DateTime savedAt, bool isFavorite, int useCount)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SavedRoute():
        return $default(_that.id, _that.name, _that.route, _that.savedAt,
            _that.isFavorite, _that.useCount);
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
    TResult? Function(String id, String name, NavigationRoute route,
            DateTime savedAt, bool isFavorite, int useCount)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SavedRoute() when $default != null:
        return $default(_that.id, _that.name, _that.route, _that.savedAt,
            _that.isFavorite, _that.useCount);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SavedRoute implements SavedRoute {
  const _SavedRoute(
      {required this.id,
      required this.name,
      required this.route,
      required this.savedAt,
      this.isFavorite = false,
      this.useCount = 0});
  factory _SavedRoute.fromJson(Map<String, dynamic> json) =>
      _$SavedRouteFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final NavigationRoute route;
  @override
  final DateTime savedAt;
  @override
  @JsonKey()
  final bool isFavorite;
  @override
  @JsonKey()
  final int useCount;

  /// Create a copy of SavedRoute
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SavedRouteCopyWith<_SavedRoute> get copyWith =>
      __$SavedRouteCopyWithImpl<_SavedRoute>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SavedRouteToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SavedRoute &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.savedAt, savedAt) || other.savedAt == savedAt) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.useCount, useCount) ||
                other.useCount == useCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode {
    return Object.hash(
        runtimeType, id, name, route, savedAt, isFavorite, useCount);
  }

  @override
  String toString() {
    return 'SavedRoute(id: $id, name: $name, route: $route, savedAt: $savedAt, isFavorite: $isFavorite, useCount: $useCount)';
  }
}

/// @nodoc
abstract mixin class _$SavedRouteCopyWith<$Res>
    implements $SavedRouteCopyWith<$Res> {
  factory _$SavedRouteCopyWith(
          _SavedRoute value, $Res Function(_SavedRoute) _then) =
      __$SavedRouteCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      NavigationRoute route,
      DateTime savedAt,
      bool isFavorite,
      int useCount});

  @override
  $NavigationRouteCopyWith<$Res> get route;
}

/// @nodoc
class __$SavedRouteCopyWithImpl<$Res> implements _$SavedRouteCopyWith<$Res> {
  __$SavedRouteCopyWithImpl(this._self, this._then);

  final _SavedRoute _self;
  final $Res Function(_SavedRoute) _then;

  /// Create a copy of SavedRoute
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? route = null,
    Object? savedAt = null,
    Object? isFavorite = null,
    Object? useCount = null,
  }) {
    return _then(_SavedRoute(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      route: null == route
          ? _self.route
          : route // ignore: cast_nullable_to_non_nullable
              as NavigationRoute,
      savedAt: null == savedAt
          ? _self.savedAt
          : savedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isFavorite: null == isFavorite
          ? _self.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      useCount: null == useCount
          ? _self.useCount
          : useCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of SavedRoute
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NavigationRouteCopyWith<$Res> get route {
    return $NavigationRouteCopyWith<$Res>(_self.route, (value) {
      return _then(_self.copyWith(route: value));
    });
  }
}

// dart format on
