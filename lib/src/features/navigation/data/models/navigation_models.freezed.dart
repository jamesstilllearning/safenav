// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'navigation_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DestinationType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() building,
    required TResult Function() location,
    required TResult Function() coordinates,
    required TResult Function() emergencyExit,
    required TResult Function() assemblyPoint,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? building,
    TResult? Function()? location,
    TResult? Function()? coordinates,
    TResult? Function()? emergencyExit,
    TResult? Function()? assemblyPoint,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? building,
    TResult Function()? location,
    TResult Function()? coordinates,
    TResult Function()? emergencyExit,
    TResult Function()? assemblyPoint,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Building value) building,
    required TResult Function(_Location value) location,
    required TResult Function(_Coordinates value) coordinates,
    required TResult Function(_EmergencyExit value) emergencyExit,
    required TResult Function(_AssemblyPoint value) assemblyPoint,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Building value)? building,
    TResult? Function(_Location value)? location,
    TResult? Function(_Coordinates value)? coordinates,
    TResult? Function(_EmergencyExit value)? emergencyExit,
    TResult? Function(_AssemblyPoint value)? assemblyPoint,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Building value)? building,
    TResult Function(_Location value)? location,
    TResult Function(_Coordinates value)? coordinates,
    TResult Function(_EmergencyExit value)? emergencyExit,
    TResult Function(_AssemblyPoint value)? assemblyPoint,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DestinationTypeCopyWith<$Res> {
  factory $DestinationTypeCopyWith(
          DestinationType value, $Res Function(DestinationType) then) =
      _$DestinationTypeCopyWithImpl<$Res, DestinationType>;
}

/// @nodoc
class _$DestinationTypeCopyWithImpl<$Res, $Val extends DestinationType>
    implements $DestinationTypeCopyWith<$Res> {
  _$DestinationTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$BuildingImplCopyWith<$Res> {
  factory _$$BuildingImplCopyWith(
          _$BuildingImpl value, $Res Function(_$BuildingImpl) then) =
      __$$BuildingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BuildingImplCopyWithImpl<$Res>
    extends _$DestinationTypeCopyWithImpl<$Res, _$BuildingImpl>
    implements _$$BuildingImplCopyWith<$Res> {
  __$$BuildingImplCopyWithImpl(
      _$BuildingImpl _value, $Res Function(_$BuildingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BuildingImpl implements _Building {
  const _$BuildingImpl();

  @override
  String toString() {
    return 'DestinationType.building()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BuildingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() building,
    required TResult Function() location,
    required TResult Function() coordinates,
    required TResult Function() emergencyExit,
    required TResult Function() assemblyPoint,
  }) {
    return building();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? building,
    TResult? Function()? location,
    TResult? Function()? coordinates,
    TResult? Function()? emergencyExit,
    TResult? Function()? assemblyPoint,
  }) {
    return building?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? building,
    TResult Function()? location,
    TResult Function()? coordinates,
    TResult Function()? emergencyExit,
    TResult Function()? assemblyPoint,
    required TResult orElse(),
  }) {
    if (building != null) {
      return building();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Building value) building,
    required TResult Function(_Location value) location,
    required TResult Function(_Coordinates value) coordinates,
    required TResult Function(_EmergencyExit value) emergencyExit,
    required TResult Function(_AssemblyPoint value) assemblyPoint,
  }) {
    return building(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Building value)? building,
    TResult? Function(_Location value)? location,
    TResult? Function(_Coordinates value)? coordinates,
    TResult? Function(_EmergencyExit value)? emergencyExit,
    TResult? Function(_AssemblyPoint value)? assemblyPoint,
  }) {
    return building?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Building value)? building,
    TResult Function(_Location value)? location,
    TResult Function(_Coordinates value)? coordinates,
    TResult Function(_EmergencyExit value)? emergencyExit,
    TResult Function(_AssemblyPoint value)? assemblyPoint,
    required TResult orElse(),
  }) {
    if (building != null) {
      return building(this);
    }
    return orElse();
  }
}

abstract class _Building implements DestinationType {
  const factory _Building() = _$BuildingImpl;
}

/// @nodoc
abstract class _$$LocationImplCopyWith<$Res> {
  factory _$$LocationImplCopyWith(
          _$LocationImpl value, $Res Function(_$LocationImpl) then) =
      __$$LocationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LocationImplCopyWithImpl<$Res>
    extends _$DestinationTypeCopyWithImpl<$Res, _$LocationImpl>
    implements _$$LocationImplCopyWith<$Res> {
  __$$LocationImplCopyWithImpl(
      _$LocationImpl _value, $Res Function(_$LocationImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LocationImpl implements _Location {
  const _$LocationImpl();

  @override
  String toString() {
    return 'DestinationType.location()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LocationImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() building,
    required TResult Function() location,
    required TResult Function() coordinates,
    required TResult Function() emergencyExit,
    required TResult Function() assemblyPoint,
  }) {
    return location();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? building,
    TResult? Function()? location,
    TResult? Function()? coordinates,
    TResult? Function()? emergencyExit,
    TResult? Function()? assemblyPoint,
  }) {
    return location?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? building,
    TResult Function()? location,
    TResult Function()? coordinates,
    TResult Function()? emergencyExit,
    TResult Function()? assemblyPoint,
    required TResult orElse(),
  }) {
    if (location != null) {
      return location();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Building value) building,
    required TResult Function(_Location value) location,
    required TResult Function(_Coordinates value) coordinates,
    required TResult Function(_EmergencyExit value) emergencyExit,
    required TResult Function(_AssemblyPoint value) assemblyPoint,
  }) {
    return location(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Building value)? building,
    TResult? Function(_Location value)? location,
    TResult? Function(_Coordinates value)? coordinates,
    TResult? Function(_EmergencyExit value)? emergencyExit,
    TResult? Function(_AssemblyPoint value)? assemblyPoint,
  }) {
    return location?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Building value)? building,
    TResult Function(_Location value)? location,
    TResult Function(_Coordinates value)? coordinates,
    TResult Function(_EmergencyExit value)? emergencyExit,
    TResult Function(_AssemblyPoint value)? assemblyPoint,
    required TResult orElse(),
  }) {
    if (location != null) {
      return location(this);
    }
    return orElse();
  }
}

abstract class _Location implements DestinationType {
  const factory _Location() = _$LocationImpl;
}

/// @nodoc
abstract class _$$CoordinatesImplCopyWith<$Res> {
  factory _$$CoordinatesImplCopyWith(
          _$CoordinatesImpl value, $Res Function(_$CoordinatesImpl) then) =
      __$$CoordinatesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CoordinatesImplCopyWithImpl<$Res>
    extends _$DestinationTypeCopyWithImpl<$Res, _$CoordinatesImpl>
    implements _$$CoordinatesImplCopyWith<$Res> {
  __$$CoordinatesImplCopyWithImpl(
      _$CoordinatesImpl _value, $Res Function(_$CoordinatesImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CoordinatesImpl implements _Coordinates {
  const _$CoordinatesImpl();

  @override
  String toString() {
    return 'DestinationType.coordinates()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CoordinatesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() building,
    required TResult Function() location,
    required TResult Function() coordinates,
    required TResult Function() emergencyExit,
    required TResult Function() assemblyPoint,
  }) {
    return coordinates();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? building,
    TResult? Function()? location,
    TResult? Function()? coordinates,
    TResult? Function()? emergencyExit,
    TResult? Function()? assemblyPoint,
  }) {
    return coordinates?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? building,
    TResult Function()? location,
    TResult Function()? coordinates,
    TResult Function()? emergencyExit,
    TResult Function()? assemblyPoint,
    required TResult orElse(),
  }) {
    if (coordinates != null) {
      return coordinates();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Building value) building,
    required TResult Function(_Location value) location,
    required TResult Function(_Coordinates value) coordinates,
    required TResult Function(_EmergencyExit value) emergencyExit,
    required TResult Function(_AssemblyPoint value) assemblyPoint,
  }) {
    return coordinates(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Building value)? building,
    TResult? Function(_Location value)? location,
    TResult? Function(_Coordinates value)? coordinates,
    TResult? Function(_EmergencyExit value)? emergencyExit,
    TResult? Function(_AssemblyPoint value)? assemblyPoint,
  }) {
    return coordinates?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Building value)? building,
    TResult Function(_Location value)? location,
    TResult Function(_Coordinates value)? coordinates,
    TResult Function(_EmergencyExit value)? emergencyExit,
    TResult Function(_AssemblyPoint value)? assemblyPoint,
    required TResult orElse(),
  }) {
    if (coordinates != null) {
      return coordinates(this);
    }
    return orElse();
  }
}

abstract class _Coordinates implements DestinationType {
  const factory _Coordinates() = _$CoordinatesImpl;
}

/// @nodoc
abstract class _$$EmergencyExitImplCopyWith<$Res> {
  factory _$$EmergencyExitImplCopyWith(
          _$EmergencyExitImpl value, $Res Function(_$EmergencyExitImpl) then) =
      __$$EmergencyExitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmergencyExitImplCopyWithImpl<$Res>
    extends _$DestinationTypeCopyWithImpl<$Res, _$EmergencyExitImpl>
    implements _$$EmergencyExitImplCopyWith<$Res> {
  __$$EmergencyExitImplCopyWithImpl(
      _$EmergencyExitImpl _value, $Res Function(_$EmergencyExitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EmergencyExitImpl implements _EmergencyExit {
  const _$EmergencyExitImpl();

  @override
  String toString() {
    return 'DestinationType.emergencyExit()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmergencyExitImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() building,
    required TResult Function() location,
    required TResult Function() coordinates,
    required TResult Function() emergencyExit,
    required TResult Function() assemblyPoint,
  }) {
    return emergencyExit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? building,
    TResult? Function()? location,
    TResult? Function()? coordinates,
    TResult? Function()? emergencyExit,
    TResult? Function()? assemblyPoint,
  }) {
    return emergencyExit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? building,
    TResult Function()? location,
    TResult Function()? coordinates,
    TResult Function()? emergencyExit,
    TResult Function()? assemblyPoint,
    required TResult orElse(),
  }) {
    if (emergencyExit != null) {
      return emergencyExit();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Building value) building,
    required TResult Function(_Location value) location,
    required TResult Function(_Coordinates value) coordinates,
    required TResult Function(_EmergencyExit value) emergencyExit,
    required TResult Function(_AssemblyPoint value) assemblyPoint,
  }) {
    return emergencyExit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Building value)? building,
    TResult? Function(_Location value)? location,
    TResult? Function(_Coordinates value)? coordinates,
    TResult? Function(_EmergencyExit value)? emergencyExit,
    TResult? Function(_AssemblyPoint value)? assemblyPoint,
  }) {
    return emergencyExit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Building value)? building,
    TResult Function(_Location value)? location,
    TResult Function(_Coordinates value)? coordinates,
    TResult Function(_EmergencyExit value)? emergencyExit,
    TResult Function(_AssemblyPoint value)? assemblyPoint,
    required TResult orElse(),
  }) {
    if (emergencyExit != null) {
      return emergencyExit(this);
    }
    return orElse();
  }
}

abstract class _EmergencyExit implements DestinationType {
  const factory _EmergencyExit() = _$EmergencyExitImpl;
}

/// @nodoc
abstract class _$$AssemblyPointImplCopyWith<$Res> {
  factory _$$AssemblyPointImplCopyWith(
          _$AssemblyPointImpl value, $Res Function(_$AssemblyPointImpl) then) =
      __$$AssemblyPointImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AssemblyPointImplCopyWithImpl<$Res>
    extends _$DestinationTypeCopyWithImpl<$Res, _$AssemblyPointImpl>
    implements _$$AssemblyPointImplCopyWith<$Res> {
  __$$AssemblyPointImplCopyWithImpl(
      _$AssemblyPointImpl _value, $Res Function(_$AssemblyPointImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AssemblyPointImpl implements _AssemblyPoint {
  const _$AssemblyPointImpl();

  @override
  String toString() {
    return 'DestinationType.assemblyPoint()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AssemblyPointImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() building,
    required TResult Function() location,
    required TResult Function() coordinates,
    required TResult Function() emergencyExit,
    required TResult Function() assemblyPoint,
  }) {
    return assemblyPoint();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? building,
    TResult? Function()? location,
    TResult? Function()? coordinates,
    TResult? Function()? emergencyExit,
    TResult? Function()? assemblyPoint,
  }) {
    return assemblyPoint?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? building,
    TResult Function()? location,
    TResult Function()? coordinates,
    TResult Function()? emergencyExit,
    TResult Function()? assemblyPoint,
    required TResult orElse(),
  }) {
    if (assemblyPoint != null) {
      return assemblyPoint();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Building value) building,
    required TResult Function(_Location value) location,
    required TResult Function(_Coordinates value) coordinates,
    required TResult Function(_EmergencyExit value) emergencyExit,
    required TResult Function(_AssemblyPoint value) assemblyPoint,
  }) {
    return assemblyPoint(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Building value)? building,
    TResult? Function(_Location value)? location,
    TResult? Function(_Coordinates value)? coordinates,
    TResult? Function(_EmergencyExit value)? emergencyExit,
    TResult? Function(_AssemblyPoint value)? assemblyPoint,
  }) {
    return assemblyPoint?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Building value)? building,
    TResult Function(_Location value)? location,
    TResult Function(_Coordinates value)? coordinates,
    TResult Function(_EmergencyExit value)? emergencyExit,
    TResult Function(_AssemblyPoint value)? assemblyPoint,
    required TResult orElse(),
  }) {
    if (assemblyPoint != null) {
      return assemblyPoint(this);
    }
    return orElse();
  }
}

abstract class _AssemblyPoint implements DestinationType {
  const factory _AssemblyPoint() = _$AssemblyPointImpl;
}

NavigationDestination _$NavigationDestinationFromJson(
    Map<String, dynamic> json) {
  return _NavigationDestination.fromJson(json);
}

/// @nodoc
mixin _$NavigationDestination {
  String get id => throw _privateConstructorUsedError;
  String get name =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(
      fromJson: DestinationTypeConverter._destinationTypeFromJson,
      toJson: DestinationTypeConverter._destinationTypeToJson)
  DestinationType get type => throw _privateConstructorUsedError;
  LatLng get coordinates => throw _privateConstructorUsedError;
  String? get buildingId => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NavigationDestinationCopyWith<NavigationDestination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationDestinationCopyWith<$Res> {
  factory $NavigationDestinationCopyWith(NavigationDestination value,
          $Res Function(NavigationDestination) then) =
      _$NavigationDestinationCopyWithImpl<$Res, NavigationDestination>;
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
class _$NavigationDestinationCopyWithImpl<$Res,
        $Val extends NavigationDestination>
    implements $NavigationDestinationCopyWith<$Res> {
  _$NavigationDestinationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DestinationType,
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as LatLng,
      buildingId: freezed == buildingId
          ? _value.buildingId
          : buildingId // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DestinationTypeCopyWith<$Res> get type {
    return $DestinationTypeCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NavigationDestinationImplCopyWith<$Res>
    implements $NavigationDestinationCopyWith<$Res> {
  factory _$$NavigationDestinationImplCopyWith(
          _$NavigationDestinationImpl value,
          $Res Function(_$NavigationDestinationImpl) then) =
      __$$NavigationDestinationImplCopyWithImpl<$Res>;
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
class __$$NavigationDestinationImplCopyWithImpl<$Res>
    extends _$NavigationDestinationCopyWithImpl<$Res,
        _$NavigationDestinationImpl>
    implements _$$NavigationDestinationImplCopyWith<$Res> {
  __$$NavigationDestinationImplCopyWithImpl(_$NavigationDestinationImpl _value,
      $Res Function(_$NavigationDestinationImpl) _then)
      : super(_value, _then);

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
    return _then(_$NavigationDestinationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DestinationType,
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as LatLng,
      buildingId: freezed == buildingId
          ? _value.buildingId
          : buildingId // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NavigationDestinationImpl extends _NavigationDestination {
  const _$NavigationDestinationImpl(
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
      final Map<String, dynamic>? metadata})
      : _metadata = metadata,
        super._();

  factory _$NavigationDestinationImpl.fromJson(Map<String, dynamic> json) =>
      _$$NavigationDestinationImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
// ignore: invalid_annotation_target
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

  @override
  String toString() {
    return 'NavigationDestination(id: $id, name: $name, type: $type, coordinates: $coordinates, buildingId: $buildingId, description: $description, address: $address, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NavigationDestinationImpl &&
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
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      type,
      coordinates,
      buildingId,
      description,
      address,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NavigationDestinationImplCopyWith<_$NavigationDestinationImpl>
      get copyWith => __$$NavigationDestinationImplCopyWithImpl<
          _$NavigationDestinationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NavigationDestinationImplToJson(
      this,
    );
  }
}

abstract class _NavigationDestination extends NavigationDestination {
  const factory _NavigationDestination(
      {required final String id,
      required final String name,
      @JsonKey(
          fromJson: DestinationTypeConverter._destinationTypeFromJson,
          toJson: DestinationTypeConverter._destinationTypeToJson)
      required final DestinationType type,
      required final LatLng coordinates,
      final String? buildingId,
      final String? description,
      final String? address,
      final Map<String, dynamic>? metadata}) = _$NavigationDestinationImpl;
  const _NavigationDestination._() : super._();

  factory _NavigationDestination.fromJson(Map<String, dynamic> json) =
      _$NavigationDestinationImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override // ignore: invalid_annotation_target
  @JsonKey(
      fromJson: DestinationTypeConverter._destinationTypeFromJson,
      toJson: DestinationTypeConverter._destinationTypeToJson)
  DestinationType get type;
  @override
  LatLng get coordinates;
  @override
  String? get buildingId;
  @override
  String? get description;
  @override
  String? get address;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$NavigationDestinationImplCopyWith<_$NavigationDestinationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

NavigationRoute _$NavigationRouteFromJson(Map<String, dynamic> json) {
  return _NavigationRoute.fromJson(json);
}

/// @nodoc
mixin _$NavigationRoute {
  String get id => throw _privateConstructorUsedError;
  NavigationDestination get start => throw _privateConstructorUsedError;
  NavigationDestination get end => throw _privateConstructorUsedError;
  List<LatLng> get geometry => throw _privateConstructorUsedError;
  double get totalDistance => throw _privateConstructorUsedError;
  Duration get estimatedDuration => throw _privateConstructorUsedError;
  List<NavigationInstruction> get instructions =>
      throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String? get pathwayIds =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(
      fromJson: RouteStatusConverter._routeStatusFromJson,
      toJson: RouteStatusConverter._routeStatusToJson)
  RouteStatus? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NavigationRouteCopyWith<NavigationRoute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationRouteCopyWith<$Res> {
  factory $NavigationRouteCopyWith(
          NavigationRoute value, $Res Function(NavigationRoute) then) =
      _$NavigationRouteCopyWithImpl<$Res, NavigationRoute>;
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
class _$NavigationRouteCopyWithImpl<$Res, $Val extends NavigationRoute>
    implements $NavigationRouteCopyWith<$Res> {
  _$NavigationRouteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as NavigationDestination,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as NavigationDestination,
      geometry: null == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as List<LatLng>,
      totalDistance: null == totalDistance
          ? _value.totalDistance
          : totalDistance // ignore: cast_nullable_to_non_nullable
              as double,
      estimatedDuration: null == estimatedDuration
          ? _value.estimatedDuration
          : estimatedDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      instructions: null == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as List<NavigationInstruction>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      pathwayIds: freezed == pathwayIds
          ? _value.pathwayIds
          : pathwayIds // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RouteStatus?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NavigationDestinationCopyWith<$Res> get start {
    return $NavigationDestinationCopyWith<$Res>(_value.start, (value) {
      return _then(_value.copyWith(start: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $NavigationDestinationCopyWith<$Res> get end {
    return $NavigationDestinationCopyWith<$Res>(_value.end, (value) {
      return _then(_value.copyWith(end: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RouteStatusCopyWith<$Res>? get status {
    if (_value.status == null) {
      return null;
    }

    return $RouteStatusCopyWith<$Res>(_value.status!, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NavigationRouteImplCopyWith<$Res>
    implements $NavigationRouteCopyWith<$Res> {
  factory _$$NavigationRouteImplCopyWith(_$NavigationRouteImpl value,
          $Res Function(_$NavigationRouteImpl) then) =
      __$$NavigationRouteImplCopyWithImpl<$Res>;
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
class __$$NavigationRouteImplCopyWithImpl<$Res>
    extends _$NavigationRouteCopyWithImpl<$Res, _$NavigationRouteImpl>
    implements _$$NavigationRouteImplCopyWith<$Res> {
  __$$NavigationRouteImplCopyWithImpl(
      _$NavigationRouteImpl _value, $Res Function(_$NavigationRouteImpl) _then)
      : super(_value, _then);

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
    return _then(_$NavigationRouteImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as NavigationDestination,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as NavigationDestination,
      geometry: null == geometry
          ? _value._geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as List<LatLng>,
      totalDistance: null == totalDistance
          ? _value.totalDistance
          : totalDistance // ignore: cast_nullable_to_non_nullable
              as double,
      estimatedDuration: null == estimatedDuration
          ? _value.estimatedDuration
          : estimatedDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      instructions: null == instructions
          ? _value._instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as List<NavigationInstruction>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      pathwayIds: freezed == pathwayIds
          ? _value.pathwayIds
          : pathwayIds // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RouteStatus?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NavigationRouteImpl extends _NavigationRoute {
  const _$NavigationRouteImpl(
      {required this.id,
      required this.start,
      required this.end,
      required final List<LatLng> geometry,
      required this.totalDistance,
      required this.estimatedDuration,
      required final List<NavigationInstruction> instructions,
      required this.createdAt,
      this.pathwayIds,
      @JsonKey(
          fromJson: RouteStatusConverter._routeStatusFromJson,
          toJson: RouteStatusConverter._routeStatusToJson)
      this.status})
      : _geometry = geometry,
        _instructions = instructions,
        super._();

  factory _$NavigationRouteImpl.fromJson(Map<String, dynamic> json) =>
      _$$NavigationRouteImplFromJson(json);

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
// ignore: invalid_annotation_target
  @override
  @JsonKey(
      fromJson: RouteStatusConverter._routeStatusFromJson,
      toJson: RouteStatusConverter._routeStatusToJson)
  final RouteStatus? status;

  @override
  String toString() {
    return 'NavigationRoute(id: $id, start: $start, end: $end, geometry: $geometry, totalDistance: $totalDistance, estimatedDuration: $estimatedDuration, instructions: $instructions, createdAt: $createdAt, pathwayIds: $pathwayIds, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NavigationRouteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            const DeepCollectionEquality().equals(other._geometry, _geometry) &&
            (identical(other.totalDistance, totalDistance) ||
                other.totalDistance == totalDistance) &&
            (identical(other.estimatedDuration, estimatedDuration) ||
                other.estimatedDuration == estimatedDuration) &&
            const DeepCollectionEquality()
                .equals(other._instructions, _instructions) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.pathwayIds, pathwayIds) ||
                other.pathwayIds == pathwayIds) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NavigationRouteImplCopyWith<_$NavigationRouteImpl> get copyWith =>
      __$$NavigationRouteImplCopyWithImpl<_$NavigationRouteImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NavigationRouteImplToJson(
      this,
    );
  }
}

abstract class _NavigationRoute extends NavigationRoute {
  const factory _NavigationRoute(
      {required final String id,
      required final NavigationDestination start,
      required final NavigationDestination end,
      required final List<LatLng> geometry,
      required final double totalDistance,
      required final Duration estimatedDuration,
      required final List<NavigationInstruction> instructions,
      required final DateTime createdAt,
      final String? pathwayIds,
      @JsonKey(
          fromJson: RouteStatusConverter._routeStatusFromJson,
          toJson: RouteStatusConverter._routeStatusToJson)
      final RouteStatus? status}) = _$NavigationRouteImpl;
  const _NavigationRoute._() : super._();

  factory _NavigationRoute.fromJson(Map<String, dynamic> json) =
      _$NavigationRouteImpl.fromJson;

  @override
  String get id;
  @override
  NavigationDestination get start;
  @override
  NavigationDestination get end;
  @override
  List<LatLng> get geometry;
  @override
  double get totalDistance;
  @override
  Duration get estimatedDuration;
  @override
  List<NavigationInstruction> get instructions;
  @override
  DateTime get createdAt;
  @override
  String? get pathwayIds;
  @override // ignore: invalid_annotation_target
  @JsonKey(
      fromJson: RouteStatusConverter._routeStatusFromJson,
      toJson: RouteStatusConverter._routeStatusToJson)
  RouteStatus? get status;
  @override
  @JsonKey(ignore: true)
  _$$NavigationRouteImplCopyWith<_$NavigationRouteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NavigationInstruction _$NavigationInstructionFromJson(
    Map<String, dynamic> json) {
  return _NavigationInstruction.fromJson(json);
}

/// @nodoc
mixin _$NavigationInstruction {
  String get instruction => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get distanceToNext =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(
      fromJson: InstructionTypeConverter._instructionTypeFromJson,
      toJson: InstructionTypeConverter._instructionTypeToJson)
  InstructionType get type => throw _privateConstructorUsedError;
  String? get roadName => throw _privateConstructorUsedError;
  String? get landmark => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NavigationInstructionCopyWith<NavigationInstruction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationInstructionCopyWith<$Res> {
  factory $NavigationInstructionCopyWith(NavigationInstruction value,
          $Res Function(NavigationInstruction) then) =
      _$NavigationInstructionCopyWithImpl<$Res, NavigationInstruction>;
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
class _$NavigationInstructionCopyWithImpl<$Res,
        $Val extends NavigationInstruction>
    implements $NavigationInstructionCopyWith<$Res> {
  _$NavigationInstructionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      instruction: null == instruction
          ? _value.instruction
          : instruction // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      distanceToNext: null == distanceToNext
          ? _value.distanceToNext
          : distanceToNext // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as InstructionType,
      roadName: freezed == roadName
          ? _value.roadName
          : roadName // ignore: cast_nullable_to_non_nullable
              as String?,
      landmark: freezed == landmark
          ? _value.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $InstructionTypeCopyWith<$Res> get type {
    return $InstructionTypeCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NavigationInstructionImplCopyWith<$Res>
    implements $NavigationInstructionCopyWith<$Res> {
  factory _$$NavigationInstructionImplCopyWith(
          _$NavigationInstructionImpl value,
          $Res Function(_$NavigationInstructionImpl) then) =
      __$$NavigationInstructionImplCopyWithImpl<$Res>;
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
class __$$NavigationInstructionImplCopyWithImpl<$Res>
    extends _$NavigationInstructionCopyWithImpl<$Res,
        _$NavigationInstructionImpl>
    implements _$$NavigationInstructionImplCopyWith<$Res> {
  __$$NavigationInstructionImplCopyWithImpl(_$NavigationInstructionImpl _value,
      $Res Function(_$NavigationInstructionImpl) _then)
      : super(_value, _then);

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
    return _then(_$NavigationInstructionImpl(
      instruction: null == instruction
          ? _value.instruction
          : instruction // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      distanceToNext: null == distanceToNext
          ? _value.distanceToNext
          : distanceToNext // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as InstructionType,
      roadName: freezed == roadName
          ? _value.roadName
          : roadName // ignore: cast_nullable_to_non_nullable
              as String?,
      landmark: freezed == landmark
          ? _value.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NavigationInstructionImpl extends _NavigationInstruction {
  const _$NavigationInstructionImpl(
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

  factory _$NavigationInstructionImpl.fromJson(Map<String, dynamic> json) =>
      _$$NavigationInstructionImplFromJson(json);

  @override
  final String instruction;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final double distanceToNext;
// ignore: invalid_annotation_target
  @override
  @JsonKey(
      fromJson: InstructionTypeConverter._instructionTypeFromJson,
      toJson: InstructionTypeConverter._instructionTypeToJson)
  final InstructionType type;
  @override
  final String? roadName;
  @override
  final String? landmark;

  @override
  String toString() {
    return 'NavigationInstruction(instruction: $instruction, latitude: $latitude, longitude: $longitude, distanceToNext: $distanceToNext, type: $type, roadName: $roadName, landmark: $landmark)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NavigationInstructionImpl &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, instruction, latitude, longitude,
      distanceToNext, type, roadName, landmark);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NavigationInstructionImplCopyWith<_$NavigationInstructionImpl>
      get copyWith => __$$NavigationInstructionImplCopyWithImpl<
          _$NavigationInstructionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NavigationInstructionImplToJson(
      this,
    );
  }
}

abstract class _NavigationInstruction extends NavigationInstruction {
  const factory _NavigationInstruction(
      {required final String instruction,
      required final double latitude,
      required final double longitude,
      required final double distanceToNext,
      @JsonKey(
          fromJson: InstructionTypeConverter._instructionTypeFromJson,
          toJson: InstructionTypeConverter._instructionTypeToJson)
      required final InstructionType type,
      final String? roadName,
      final String? landmark}) = _$NavigationInstructionImpl;
  const _NavigationInstruction._() : super._();

  factory _NavigationInstruction.fromJson(Map<String, dynamic> json) =
      _$NavigationInstructionImpl.fromJson;

  @override
  String get instruction;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  double get distanceToNext;
  @override // ignore: invalid_annotation_target
  @JsonKey(
      fromJson: InstructionTypeConverter._instructionTypeFromJson,
      toJson: InstructionTypeConverter._instructionTypeToJson)
  InstructionType get type;
  @override
  String? get roadName;
  @override
  String? get landmark;
  @override
  @JsonKey(ignore: true)
  _$$NavigationInstructionImplCopyWith<_$NavigationInstructionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InstructionType {
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstructionTypeCopyWith<$Res> {
  factory $InstructionTypeCopyWith(
          InstructionType value, $Res Function(InstructionType) then) =
      _$InstructionTypeCopyWithImpl<$Res, InstructionType>;
}

/// @nodoc
class _$InstructionTypeCopyWithImpl<$Res, $Val extends InstructionType>
    implements $InstructionTypeCopyWith<$Res> {
  _$InstructionTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartImplCopyWith<$Res> {
  factory _$$StartImplCopyWith(
          _$StartImpl value, $Res Function(_$StartImpl) then) =
      __$$StartImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartImplCopyWithImpl<$Res>
    extends _$InstructionTypeCopyWithImpl<$Res, _$StartImpl>
    implements _$$StartImplCopyWith<$Res> {
  __$$StartImplCopyWithImpl(
      _$StartImpl _value, $Res Function(_$StartImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartImpl implements _Start {
  const _$StartImpl();

  @override
  String toString() {
    return 'InstructionType.start()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return start();
  }

  @override
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
    return start?.call();
  }

  @override
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
    if (start != null) {
      return start();
    }
    return orElse();
  }

  @override
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
    return start(this);
  }

  @override
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
    return start?.call(this);
  }

  @override
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
    if (start != null) {
      return start(this);
    }
    return orElse();
  }
}

abstract class _Start implements InstructionType {
  const factory _Start() = _$StartImpl;
}

/// @nodoc
abstract class _$$ContinueStraightImplCopyWith<$Res> {
  factory _$$ContinueStraightImplCopyWith(_$ContinueStraightImpl value,
          $Res Function(_$ContinueStraightImpl) then) =
      __$$ContinueStraightImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ContinueStraightImplCopyWithImpl<$Res>
    extends _$InstructionTypeCopyWithImpl<$Res, _$ContinueStraightImpl>
    implements _$$ContinueStraightImplCopyWith<$Res> {
  __$$ContinueStraightImplCopyWithImpl(_$ContinueStraightImpl _value,
      $Res Function(_$ContinueStraightImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ContinueStraightImpl implements _ContinueStraight {
  const _$ContinueStraightImpl();

  @override
  String toString() {
    return 'InstructionType.continueStraight()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ContinueStraightImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return continueStraight();
  }

  @override
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
    return continueStraight?.call();
  }

  @override
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
    if (continueStraight != null) {
      return continueStraight();
    }
    return orElse();
  }

  @override
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
    return continueStraight(this);
  }

  @override
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
    return continueStraight?.call(this);
  }

  @override
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
    if (continueStraight != null) {
      return continueStraight(this);
    }
    return orElse();
  }
}

abstract class _ContinueStraight implements InstructionType {
  const factory _ContinueStraight() = _$ContinueStraightImpl;
}

/// @nodoc
abstract class _$$TurnLeftImplCopyWith<$Res> {
  factory _$$TurnLeftImplCopyWith(
          _$TurnLeftImpl value, $Res Function(_$TurnLeftImpl) then) =
      __$$TurnLeftImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TurnLeftImplCopyWithImpl<$Res>
    extends _$InstructionTypeCopyWithImpl<$Res, _$TurnLeftImpl>
    implements _$$TurnLeftImplCopyWith<$Res> {
  __$$TurnLeftImplCopyWithImpl(
      _$TurnLeftImpl _value, $Res Function(_$TurnLeftImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TurnLeftImpl implements _TurnLeft {
  const _$TurnLeftImpl();

  @override
  String toString() {
    return 'InstructionType.turnLeft()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TurnLeftImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return turnLeft();
  }

  @override
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
    return turnLeft?.call();
  }

  @override
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
    if (turnLeft != null) {
      return turnLeft();
    }
    return orElse();
  }

  @override
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
    return turnLeft(this);
  }

  @override
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
    return turnLeft?.call(this);
  }

  @override
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
    if (turnLeft != null) {
      return turnLeft(this);
    }
    return orElse();
  }
}

abstract class _TurnLeft implements InstructionType {
  const factory _TurnLeft() = _$TurnLeftImpl;
}

/// @nodoc
abstract class _$$TurnRightImplCopyWith<$Res> {
  factory _$$TurnRightImplCopyWith(
          _$TurnRightImpl value, $Res Function(_$TurnRightImpl) then) =
      __$$TurnRightImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TurnRightImplCopyWithImpl<$Res>
    extends _$InstructionTypeCopyWithImpl<$Res, _$TurnRightImpl>
    implements _$$TurnRightImplCopyWith<$Res> {
  __$$TurnRightImplCopyWithImpl(
      _$TurnRightImpl _value, $Res Function(_$TurnRightImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TurnRightImpl implements _TurnRight {
  const _$TurnRightImpl();

  @override
  String toString() {
    return 'InstructionType.turnRight()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TurnRightImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return turnRight();
  }

  @override
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
    return turnRight?.call();
  }

  @override
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
    if (turnRight != null) {
      return turnRight();
    }
    return orElse();
  }

  @override
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
    return turnRight(this);
  }

  @override
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
    return turnRight?.call(this);
  }

  @override
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
    if (turnRight != null) {
      return turnRight(this);
    }
    return orElse();
  }
}

abstract class _TurnRight implements InstructionType {
  const factory _TurnRight() = _$TurnRightImpl;
}

/// @nodoc
abstract class _$$TurnSlightLeftImplCopyWith<$Res> {
  factory _$$TurnSlightLeftImplCopyWith(_$TurnSlightLeftImpl value,
          $Res Function(_$TurnSlightLeftImpl) then) =
      __$$TurnSlightLeftImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TurnSlightLeftImplCopyWithImpl<$Res>
    extends _$InstructionTypeCopyWithImpl<$Res, _$TurnSlightLeftImpl>
    implements _$$TurnSlightLeftImplCopyWith<$Res> {
  __$$TurnSlightLeftImplCopyWithImpl(
      _$TurnSlightLeftImpl _value, $Res Function(_$TurnSlightLeftImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TurnSlightLeftImpl implements _TurnSlightLeft {
  const _$TurnSlightLeftImpl();

  @override
  String toString() {
    return 'InstructionType.turnSlightLeft()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TurnSlightLeftImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return turnSlightLeft();
  }

  @override
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
    return turnSlightLeft?.call();
  }

  @override
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
    if (turnSlightLeft != null) {
      return turnSlightLeft();
    }
    return orElse();
  }

  @override
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
    return turnSlightLeft(this);
  }

  @override
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
    return turnSlightLeft?.call(this);
  }

  @override
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
    if (turnSlightLeft != null) {
      return turnSlightLeft(this);
    }
    return orElse();
  }
}

abstract class _TurnSlightLeft implements InstructionType {
  const factory _TurnSlightLeft() = _$TurnSlightLeftImpl;
}

/// @nodoc
abstract class _$$TurnSlightRightImplCopyWith<$Res> {
  factory _$$TurnSlightRightImplCopyWith(_$TurnSlightRightImpl value,
          $Res Function(_$TurnSlightRightImpl) then) =
      __$$TurnSlightRightImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TurnSlightRightImplCopyWithImpl<$Res>
    extends _$InstructionTypeCopyWithImpl<$Res, _$TurnSlightRightImpl>
    implements _$$TurnSlightRightImplCopyWith<$Res> {
  __$$TurnSlightRightImplCopyWithImpl(
      _$TurnSlightRightImpl _value, $Res Function(_$TurnSlightRightImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TurnSlightRightImpl implements _TurnSlightRight {
  const _$TurnSlightRightImpl();

  @override
  String toString() {
    return 'InstructionType.turnSlightRight()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TurnSlightRightImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return turnSlightRight();
  }

  @override
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
    return turnSlightRight?.call();
  }

  @override
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
    if (turnSlightRight != null) {
      return turnSlightRight();
    }
    return orElse();
  }

  @override
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
    return turnSlightRight(this);
  }

  @override
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
    return turnSlightRight?.call(this);
  }

  @override
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
    if (turnSlightRight != null) {
      return turnSlightRight(this);
    }
    return orElse();
  }
}

abstract class _TurnSlightRight implements InstructionType {
  const factory _TurnSlightRight() = _$TurnSlightRightImpl;
}

/// @nodoc
abstract class _$$UturnImplCopyWith<$Res> {
  factory _$$UturnImplCopyWith(
          _$UturnImpl value, $Res Function(_$UturnImpl) then) =
      __$$UturnImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UturnImplCopyWithImpl<$Res>
    extends _$InstructionTypeCopyWithImpl<$Res, _$UturnImpl>
    implements _$$UturnImplCopyWith<$Res> {
  __$$UturnImplCopyWithImpl(
      _$UturnImpl _value, $Res Function(_$UturnImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UturnImpl implements _Uturn {
  const _$UturnImpl();

  @override
  String toString() {
    return 'InstructionType.uturn()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UturnImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return uturn();
  }

  @override
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
    return uturn?.call();
  }

  @override
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
    if (uturn != null) {
      return uturn();
    }
    return orElse();
  }

  @override
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
    return uturn(this);
  }

  @override
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
    return uturn?.call(this);
  }

  @override
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
    if (uturn != null) {
      return uturn(this);
    }
    return orElse();
  }
}

abstract class _Uturn implements InstructionType {
  const factory _Uturn() = _$UturnImpl;
}

/// @nodoc
abstract class _$$ArriveImplCopyWith<$Res> {
  factory _$$ArriveImplCopyWith(
          _$ArriveImpl value, $Res Function(_$ArriveImpl) then) =
      __$$ArriveImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ArriveImplCopyWithImpl<$Res>
    extends _$InstructionTypeCopyWithImpl<$Res, _$ArriveImpl>
    implements _$$ArriveImplCopyWith<$Res> {
  __$$ArriveImplCopyWithImpl(
      _$ArriveImpl _value, $Res Function(_$ArriveImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ArriveImpl implements _Arrive {
  const _$ArriveImpl();

  @override
  String toString() {
    return 'InstructionType.arrive()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ArriveImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return arrive();
  }

  @override
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
    return arrive?.call();
  }

  @override
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
    if (arrive != null) {
      return arrive();
    }
    return orElse();
  }

  @override
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
    return arrive(this);
  }

  @override
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
    return arrive?.call(this);
  }

  @override
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
    if (arrive != null) {
      return arrive(this);
    }
    return orElse();
  }
}

abstract class _Arrive implements InstructionType {
  const factory _Arrive() = _$ArriveImpl;
}

/// @nodoc
abstract class _$$EnterBuildingImplCopyWith<$Res> {
  factory _$$EnterBuildingImplCopyWith(
          _$EnterBuildingImpl value, $Res Function(_$EnterBuildingImpl) then) =
      __$$EnterBuildingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EnterBuildingImplCopyWithImpl<$Res>
    extends _$InstructionTypeCopyWithImpl<$Res, _$EnterBuildingImpl>
    implements _$$EnterBuildingImplCopyWith<$Res> {
  __$$EnterBuildingImplCopyWithImpl(
      _$EnterBuildingImpl _value, $Res Function(_$EnterBuildingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EnterBuildingImpl implements _EnterBuilding {
  const _$EnterBuildingImpl();

  @override
  String toString() {
    return 'InstructionType.enterBuilding()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EnterBuildingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return enterBuilding();
  }

  @override
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
    return enterBuilding?.call();
  }

  @override
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
    if (enterBuilding != null) {
      return enterBuilding();
    }
    return orElse();
  }

  @override
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
    return enterBuilding(this);
  }

  @override
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
    return enterBuilding?.call(this);
  }

  @override
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
    if (enterBuilding != null) {
      return enterBuilding(this);
    }
    return orElse();
  }
}

abstract class _EnterBuilding implements InstructionType {
  const factory _EnterBuilding() = _$EnterBuildingImpl;
}

/// @nodoc
abstract class _$$ExitBuildingImplCopyWith<$Res> {
  factory _$$ExitBuildingImplCopyWith(
          _$ExitBuildingImpl value, $Res Function(_$ExitBuildingImpl) then) =
      __$$ExitBuildingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ExitBuildingImplCopyWithImpl<$Res>
    extends _$InstructionTypeCopyWithImpl<$Res, _$ExitBuildingImpl>
    implements _$$ExitBuildingImplCopyWith<$Res> {
  __$$ExitBuildingImplCopyWithImpl(
      _$ExitBuildingImpl _value, $Res Function(_$ExitBuildingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ExitBuildingImpl implements _ExitBuilding {
  const _$ExitBuildingImpl();

  @override
  String toString() {
    return 'InstructionType.exitBuilding()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ExitBuildingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
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
    return exitBuilding();
  }

  @override
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
    return exitBuilding?.call();
  }

  @override
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
    if (exitBuilding != null) {
      return exitBuilding();
    }
    return orElse();
  }

  @override
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
    return exitBuilding(this);
  }

  @override
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
    return exitBuilding?.call(this);
  }

  @override
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
    if (exitBuilding != null) {
      return exitBuilding(this);
    }
    return orElse();
  }
}

abstract class _ExitBuilding implements InstructionType {
  const factory _ExitBuilding() = _$ExitBuildingImpl;
}

/// @nodoc
mixin _$RouteStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() planned,
    required TResult Function() active,
    required TResult Function() paused,
    required TResult Function() completed,
    required TResult Function() cancelled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? planned,
    TResult? Function()? active,
    TResult? Function()? paused,
    TResult? Function()? completed,
    TResult? Function()? cancelled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? planned,
    TResult Function()? active,
    TResult Function()? paused,
    TResult Function()? completed,
    TResult Function()? cancelled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Planned value) planned,
    required TResult Function(_Active value) active,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Cancelled value) cancelled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Planned value)? planned,
    TResult? Function(_Active value)? active,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Completed value)? completed,
    TResult? Function(_Cancelled value)? cancelled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Planned value)? planned,
    TResult Function(_Active value)? active,
    TResult Function(_Paused value)? paused,
    TResult Function(_Completed value)? completed,
    TResult Function(_Cancelled value)? cancelled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteStatusCopyWith<$Res> {
  factory $RouteStatusCopyWith(
          RouteStatus value, $Res Function(RouteStatus) then) =
      _$RouteStatusCopyWithImpl<$Res, RouteStatus>;
}

/// @nodoc
class _$RouteStatusCopyWithImpl<$Res, $Val extends RouteStatus>
    implements $RouteStatusCopyWith<$Res> {
  _$RouteStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PlannedImplCopyWith<$Res> {
  factory _$$PlannedImplCopyWith(
          _$PlannedImpl value, $Res Function(_$PlannedImpl) then) =
      __$$PlannedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PlannedImplCopyWithImpl<$Res>
    extends _$RouteStatusCopyWithImpl<$Res, _$PlannedImpl>
    implements _$$PlannedImplCopyWith<$Res> {
  __$$PlannedImplCopyWithImpl(
      _$PlannedImpl _value, $Res Function(_$PlannedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PlannedImpl implements _Planned {
  const _$PlannedImpl();

  @override
  String toString() {
    return 'RouteStatus.planned()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PlannedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() planned,
    required TResult Function() active,
    required TResult Function() paused,
    required TResult Function() completed,
    required TResult Function() cancelled,
  }) {
    return planned();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? planned,
    TResult? Function()? active,
    TResult? Function()? paused,
    TResult? Function()? completed,
    TResult? Function()? cancelled,
  }) {
    return planned?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? planned,
    TResult Function()? active,
    TResult Function()? paused,
    TResult Function()? completed,
    TResult Function()? cancelled,
    required TResult orElse(),
  }) {
    if (planned != null) {
      return planned();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Planned value) planned,
    required TResult Function(_Active value) active,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Cancelled value) cancelled,
  }) {
    return planned(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Planned value)? planned,
    TResult? Function(_Active value)? active,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Completed value)? completed,
    TResult? Function(_Cancelled value)? cancelled,
  }) {
    return planned?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Planned value)? planned,
    TResult Function(_Active value)? active,
    TResult Function(_Paused value)? paused,
    TResult Function(_Completed value)? completed,
    TResult Function(_Cancelled value)? cancelled,
    required TResult orElse(),
  }) {
    if (planned != null) {
      return planned(this);
    }
    return orElse();
  }
}

abstract class _Planned implements RouteStatus {
  const factory _Planned() = _$PlannedImpl;
}

/// @nodoc
abstract class _$$ActiveImplCopyWith<$Res> {
  factory _$$ActiveImplCopyWith(
          _$ActiveImpl value, $Res Function(_$ActiveImpl) then) =
      __$$ActiveImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ActiveImplCopyWithImpl<$Res>
    extends _$RouteStatusCopyWithImpl<$Res, _$ActiveImpl>
    implements _$$ActiveImplCopyWith<$Res> {
  __$$ActiveImplCopyWithImpl(
      _$ActiveImpl _value, $Res Function(_$ActiveImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ActiveImpl implements _Active {
  const _$ActiveImpl();

  @override
  String toString() {
    return 'RouteStatus.active()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ActiveImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() planned,
    required TResult Function() active,
    required TResult Function() paused,
    required TResult Function() completed,
    required TResult Function() cancelled,
  }) {
    return active();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? planned,
    TResult? Function()? active,
    TResult? Function()? paused,
    TResult? Function()? completed,
    TResult? Function()? cancelled,
  }) {
    return active?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? planned,
    TResult Function()? active,
    TResult Function()? paused,
    TResult Function()? completed,
    TResult Function()? cancelled,
    required TResult orElse(),
  }) {
    if (active != null) {
      return active();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Planned value) planned,
    required TResult Function(_Active value) active,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Cancelled value) cancelled,
  }) {
    return active(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Planned value)? planned,
    TResult? Function(_Active value)? active,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Completed value)? completed,
    TResult? Function(_Cancelled value)? cancelled,
  }) {
    return active?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Planned value)? planned,
    TResult Function(_Active value)? active,
    TResult Function(_Paused value)? paused,
    TResult Function(_Completed value)? completed,
    TResult Function(_Cancelled value)? cancelled,
    required TResult orElse(),
  }) {
    if (active != null) {
      return active(this);
    }
    return orElse();
  }
}

abstract class _Active implements RouteStatus {
  const factory _Active() = _$ActiveImpl;
}

/// @nodoc
abstract class _$$PausedImplCopyWith<$Res> {
  factory _$$PausedImplCopyWith(
          _$PausedImpl value, $Res Function(_$PausedImpl) then) =
      __$$PausedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PausedImplCopyWithImpl<$Res>
    extends _$RouteStatusCopyWithImpl<$Res, _$PausedImpl>
    implements _$$PausedImplCopyWith<$Res> {
  __$$PausedImplCopyWithImpl(
      _$PausedImpl _value, $Res Function(_$PausedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PausedImpl implements _Paused {
  const _$PausedImpl();

  @override
  String toString() {
    return 'RouteStatus.paused()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PausedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() planned,
    required TResult Function() active,
    required TResult Function() paused,
    required TResult Function() completed,
    required TResult Function() cancelled,
  }) {
    return paused();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? planned,
    TResult? Function()? active,
    TResult? Function()? paused,
    TResult? Function()? completed,
    TResult? Function()? cancelled,
  }) {
    return paused?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? planned,
    TResult Function()? active,
    TResult Function()? paused,
    TResult Function()? completed,
    TResult Function()? cancelled,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Planned value) planned,
    required TResult Function(_Active value) active,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Cancelled value) cancelled,
  }) {
    return paused(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Planned value)? planned,
    TResult? Function(_Active value)? active,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Completed value)? completed,
    TResult? Function(_Cancelled value)? cancelled,
  }) {
    return paused?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Planned value)? planned,
    TResult Function(_Active value)? active,
    TResult Function(_Paused value)? paused,
    TResult Function(_Completed value)? completed,
    TResult Function(_Cancelled value)? cancelled,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused(this);
    }
    return orElse();
  }
}

abstract class _Paused implements RouteStatus {
  const factory _Paused() = _$PausedImpl;
}

/// @nodoc
abstract class _$$CompletedImplCopyWith<$Res> {
  factory _$$CompletedImplCopyWith(
          _$CompletedImpl value, $Res Function(_$CompletedImpl) then) =
      __$$CompletedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CompletedImplCopyWithImpl<$Res>
    extends _$RouteStatusCopyWithImpl<$Res, _$CompletedImpl>
    implements _$$CompletedImplCopyWith<$Res> {
  __$$CompletedImplCopyWithImpl(
      _$CompletedImpl _value, $Res Function(_$CompletedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CompletedImpl implements _Completed {
  const _$CompletedImpl();

  @override
  String toString() {
    return 'RouteStatus.completed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CompletedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() planned,
    required TResult Function() active,
    required TResult Function() paused,
    required TResult Function() completed,
    required TResult Function() cancelled,
  }) {
    return completed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? planned,
    TResult? Function()? active,
    TResult? Function()? paused,
    TResult? Function()? completed,
    TResult? Function()? cancelled,
  }) {
    return completed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? planned,
    TResult Function()? active,
    TResult Function()? paused,
    TResult Function()? completed,
    TResult Function()? cancelled,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Planned value) planned,
    required TResult Function(_Active value) active,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Cancelled value) cancelled,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Planned value)? planned,
    TResult? Function(_Active value)? active,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Completed value)? completed,
    TResult? Function(_Cancelled value)? cancelled,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Planned value)? planned,
    TResult Function(_Active value)? active,
    TResult Function(_Paused value)? paused,
    TResult Function(_Completed value)? completed,
    TResult Function(_Cancelled value)? cancelled,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class _Completed implements RouteStatus {
  const factory _Completed() = _$CompletedImpl;
}

/// @nodoc
abstract class _$$CancelledImplCopyWith<$Res> {
  factory _$$CancelledImplCopyWith(
          _$CancelledImpl value, $Res Function(_$CancelledImpl) then) =
      __$$CancelledImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CancelledImplCopyWithImpl<$Res>
    extends _$RouteStatusCopyWithImpl<$Res, _$CancelledImpl>
    implements _$$CancelledImplCopyWith<$Res> {
  __$$CancelledImplCopyWithImpl(
      _$CancelledImpl _value, $Res Function(_$CancelledImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CancelledImpl implements _Cancelled {
  const _$CancelledImpl();

  @override
  String toString() {
    return 'RouteStatus.cancelled()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CancelledImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() planned,
    required TResult Function() active,
    required TResult Function() paused,
    required TResult Function() completed,
    required TResult Function() cancelled,
  }) {
    return cancelled();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? planned,
    TResult? Function()? active,
    TResult? Function()? paused,
    TResult? Function()? completed,
    TResult? Function()? cancelled,
  }) {
    return cancelled?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? planned,
    TResult Function()? active,
    TResult Function()? paused,
    TResult Function()? completed,
    TResult Function()? cancelled,
    required TResult orElse(),
  }) {
    if (cancelled != null) {
      return cancelled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Planned value) planned,
    required TResult Function(_Active value) active,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Cancelled value) cancelled,
  }) {
    return cancelled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Planned value)? planned,
    TResult? Function(_Active value)? active,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Completed value)? completed,
    TResult? Function(_Cancelled value)? cancelled,
  }) {
    return cancelled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Planned value)? planned,
    TResult Function(_Active value)? active,
    TResult Function(_Paused value)? paused,
    TResult Function(_Completed value)? completed,
    TResult Function(_Cancelled value)? cancelled,
    required TResult orElse(),
  }) {
    if (cancelled != null) {
      return cancelled(this);
    }
    return orElse();
  }
}

abstract class _Cancelled implements RouteStatus {
  const factory _Cancelled() = _$CancelledImpl;
}

NavigationSession _$NavigationSessionFromJson(Map<String, dynamic> json) {
  return _NavigationSession.fromJson(json);
}

/// @nodoc
mixin _$NavigationSession {
  String get id => throw _privateConstructorUsedError;
  NavigationRoute get route => throw _privateConstructorUsedError;
  int get currentInstructionIndex => throw _privateConstructorUsedError;
  LatLng get currentPosition => throw _privateConstructorUsedError;
  DateTime get startedAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  double? get remainingDistance => throw _privateConstructorUsedError;
  Duration? get remainingTime => throw _privateConstructorUsedError;
  bool get isVoiceGuidanceEnabled => throw _privateConstructorUsedError;
  bool get isRerouting => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NavigationSessionCopyWith<NavigationSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationSessionCopyWith<$Res> {
  factory $NavigationSessionCopyWith(
          NavigationSession value, $Res Function(NavigationSession) then) =
      _$NavigationSessionCopyWithImpl<$Res, NavigationSession>;
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
class _$NavigationSessionCopyWithImpl<$Res, $Val extends NavigationSession>
    implements $NavigationSessionCopyWith<$Res> {
  _$NavigationSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as NavigationRoute,
      currentInstructionIndex: null == currentInstructionIndex
          ? _value.currentInstructionIndex
          : currentInstructionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentPosition: null == currentPosition
          ? _value.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as LatLng,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      remainingDistance: freezed == remainingDistance
          ? _value.remainingDistance
          : remainingDistance // ignore: cast_nullable_to_non_nullable
              as double?,
      remainingTime: freezed == remainingTime
          ? _value.remainingTime
          : remainingTime // ignore: cast_nullable_to_non_nullable
              as Duration?,
      isVoiceGuidanceEnabled: null == isVoiceGuidanceEnabled
          ? _value.isVoiceGuidanceEnabled
          : isVoiceGuidanceEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isRerouting: null == isRerouting
          ? _value.isRerouting
          : isRerouting // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NavigationRouteCopyWith<$Res> get route {
    return $NavigationRouteCopyWith<$Res>(_value.route, (value) {
      return _then(_value.copyWith(route: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NavigationSessionImplCopyWith<$Res>
    implements $NavigationSessionCopyWith<$Res> {
  factory _$$NavigationSessionImplCopyWith(_$NavigationSessionImpl value,
          $Res Function(_$NavigationSessionImpl) then) =
      __$$NavigationSessionImplCopyWithImpl<$Res>;
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
class __$$NavigationSessionImplCopyWithImpl<$Res>
    extends _$NavigationSessionCopyWithImpl<$Res, _$NavigationSessionImpl>
    implements _$$NavigationSessionImplCopyWith<$Res> {
  __$$NavigationSessionImplCopyWithImpl(_$NavigationSessionImpl _value,
      $Res Function(_$NavigationSessionImpl) _then)
      : super(_value, _then);

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
    return _then(_$NavigationSessionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as NavigationRoute,
      currentInstructionIndex: null == currentInstructionIndex
          ? _value.currentInstructionIndex
          : currentInstructionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentPosition: null == currentPosition
          ? _value.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as LatLng,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      remainingDistance: freezed == remainingDistance
          ? _value.remainingDistance
          : remainingDistance // ignore: cast_nullable_to_non_nullable
              as double?,
      remainingTime: freezed == remainingTime
          ? _value.remainingTime
          : remainingTime // ignore: cast_nullable_to_non_nullable
              as Duration?,
      isVoiceGuidanceEnabled: null == isVoiceGuidanceEnabled
          ? _value.isVoiceGuidanceEnabled
          : isVoiceGuidanceEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isRerouting: null == isRerouting
          ? _value.isRerouting
          : isRerouting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NavigationSessionImpl extends _NavigationSession {
  const _$NavigationSessionImpl(
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

  factory _$NavigationSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$NavigationSessionImplFromJson(json);

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

  @override
  String toString() {
    return 'NavigationSession(id: $id, route: $route, currentInstructionIndex: $currentInstructionIndex, currentPosition: $currentPosition, startedAt: $startedAt, completedAt: $completedAt, remainingDistance: $remainingDistance, remainingTime: $remainingTime, isVoiceGuidanceEnabled: $isVoiceGuidanceEnabled, isRerouting: $isRerouting)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NavigationSessionImpl &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NavigationSessionImplCopyWith<_$NavigationSessionImpl> get copyWith =>
      __$$NavigationSessionImplCopyWithImpl<_$NavigationSessionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NavigationSessionImplToJson(
      this,
    );
  }
}

abstract class _NavigationSession extends NavigationSession {
  const factory _NavigationSession(
      {required final String id,
      required final NavigationRoute route,
      required final int currentInstructionIndex,
      required final LatLng currentPosition,
      required final DateTime startedAt,
      final DateTime? completedAt,
      final double? remainingDistance,
      final Duration? remainingTime,
      final bool isVoiceGuidanceEnabled,
      final bool isRerouting}) = _$NavigationSessionImpl;
  const _NavigationSession._() : super._();

  factory _NavigationSession.fromJson(Map<String, dynamic> json) =
      _$NavigationSessionImpl.fromJson;

  @override
  String get id;
  @override
  NavigationRoute get route;
  @override
  int get currentInstructionIndex;
  @override
  LatLng get currentPosition;
  @override
  DateTime get startedAt;
  @override
  DateTime? get completedAt;
  @override
  double? get remainingDistance;
  @override
  Duration? get remainingTime;
  @override
  bool get isVoiceGuidanceEnabled;
  @override
  bool get isRerouting;
  @override
  @JsonKey(ignore: true)
  _$$NavigationSessionImplCopyWith<_$NavigationSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SavedRoute _$SavedRouteFromJson(Map<String, dynamic> json) {
  return _SavedRoute.fromJson(json);
}

/// @nodoc
mixin _$SavedRoute {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  NavigationRoute get route => throw _privateConstructorUsedError;
  DateTime get savedAt => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;
  int get useCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SavedRouteCopyWith<SavedRoute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedRouteCopyWith<$Res> {
  factory $SavedRouteCopyWith(
          SavedRoute value, $Res Function(SavedRoute) then) =
      _$SavedRouteCopyWithImpl<$Res, SavedRoute>;
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
class _$SavedRouteCopyWithImpl<$Res, $Val extends SavedRoute>
    implements $SavedRouteCopyWith<$Res> {
  _$SavedRouteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as NavigationRoute,
      savedAt: null == savedAt
          ? _value.savedAt
          : savedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      useCount: null == useCount
          ? _value.useCount
          : useCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NavigationRouteCopyWith<$Res> get route {
    return $NavigationRouteCopyWith<$Res>(_value.route, (value) {
      return _then(_value.copyWith(route: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SavedRouteImplCopyWith<$Res>
    implements $SavedRouteCopyWith<$Res> {
  factory _$$SavedRouteImplCopyWith(
          _$SavedRouteImpl value, $Res Function(_$SavedRouteImpl) then) =
      __$$SavedRouteImplCopyWithImpl<$Res>;
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
class __$$SavedRouteImplCopyWithImpl<$Res>
    extends _$SavedRouteCopyWithImpl<$Res, _$SavedRouteImpl>
    implements _$$SavedRouteImplCopyWith<$Res> {
  __$$SavedRouteImplCopyWithImpl(
      _$SavedRouteImpl _value, $Res Function(_$SavedRouteImpl) _then)
      : super(_value, _then);

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
    return _then(_$SavedRouteImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as NavigationRoute,
      savedAt: null == savedAt
          ? _value.savedAt
          : savedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      useCount: null == useCount
          ? _value.useCount
          : useCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SavedRouteImpl implements _SavedRoute {
  const _$SavedRouteImpl(
      {required this.id,
      required this.name,
      required this.route,
      required this.savedAt,
      this.isFavorite = false,
      this.useCount = 0});

  factory _$SavedRouteImpl.fromJson(Map<String, dynamic> json) =>
      _$$SavedRouteImplFromJson(json);

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

  @override
  String toString() {
    return 'SavedRoute(id: $id, name: $name, route: $route, savedAt: $savedAt, isFavorite: $isFavorite, useCount: $useCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedRouteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.savedAt, savedAt) || other.savedAt == savedAt) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.useCount, useCount) ||
                other.useCount == useCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, route, savedAt, isFavorite, useCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedRouteImplCopyWith<_$SavedRouteImpl> get copyWith =>
      __$$SavedRouteImplCopyWithImpl<_$SavedRouteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SavedRouteImplToJson(
      this,
    );
  }
}

abstract class _SavedRoute implements SavedRoute {
  const factory _SavedRoute(
      {required final String id,
      required final String name,
      required final NavigationRoute route,
      required final DateTime savedAt,
      final bool isFavorite,
      final int useCount}) = _$SavedRouteImpl;

  factory _SavedRoute.fromJson(Map<String, dynamic> json) =
      _$SavedRouteImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  NavigationRoute get route;
  @override
  DateTime get savedAt;
  @override
  bool get isFavorite;
  @override
  int get useCount;
  @override
  @JsonKey(ignore: true)
  _$$SavedRouteImplCopyWith<_$SavedRouteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
