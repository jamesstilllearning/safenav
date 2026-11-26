// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coordinate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LatLngCoordinate {

 double get latitude; double get longitude; double? get altitude;
/// Create a copy of LatLngCoordinate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LatLngCoordinateCopyWith<LatLngCoordinate> get copyWith => _$LatLngCoordinateCopyWithImpl<LatLngCoordinate>(this as LatLngCoordinate, _$identity);

  /// Serializes this LatLngCoordinate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LatLngCoordinate;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LatLngCoordinate&&(identical(other.latitude, _this.latitude) || other.latitude == _this.latitude)&&(identical(other.longitude, _this.longitude) || other.longitude == _this.longitude)&&(identical(other.altitude, _this.altitude) || other.altitude == _this.altitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LatLngCoordinate;
  return Object.hash(runtimeType,_this.latitude,_this.longitude,_this.altitude);
}

@override
String toString() {
  final _this = this as LatLngCoordinate;
  return 'LatLngCoordinate(latitude: ${_this.latitude}, longitude: ${_this.longitude}, altitude: ${_this.altitude})';
}


}

/// @nodoc
abstract mixin class $LatLngCoordinateCopyWith<$Res>  {
  factory $LatLngCoordinateCopyWith(LatLngCoordinate value, $Res Function(LatLngCoordinate) _then) = _$LatLngCoordinateCopyWithImpl;
@useResult
$Res call({
 double latitude, double longitude, double? altitude
});




}
/// @nodoc
class _$LatLngCoordinateCopyWithImpl<$Res>
    implements $LatLngCoordinateCopyWith<$Res> {
  _$LatLngCoordinateCopyWithImpl(this._self, this._then);

  final LatLngCoordinate _self;
  final $Res Function(LatLngCoordinate) _then;

/// Create a copy of LatLngCoordinate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? latitude = null,Object? longitude = null,Object? altitude = freezed,}) {
  return _then(LatLngCoordinate(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,altitude: freezed == altitude ? _self.altitude : altitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [LatLngCoordinate].
extension LatLngCoordinatePatterns on LatLngCoordinate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LatLngCoordinate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LatLngCoordinate() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LatLngCoordinate value)  $default,){
final _that = this;
switch (_that) {
case _LatLngCoordinate():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LatLngCoordinate value)?  $default,){
final _that = this;
switch (_that) {
case _LatLngCoordinate() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double latitude,  double longitude,  double? altitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LatLngCoordinate() when $default != null:
return $default(_that.latitude,_that.longitude,_that.altitude);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double latitude,  double longitude,  double? altitude)  $default,) {final _that = this;
switch (_that) {
case _LatLngCoordinate():
return $default(_that.latitude,_that.longitude,_that.altitude);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double latitude,  double longitude,  double? altitude)?  $default,) {final _that = this;
switch (_that) {
case _LatLngCoordinate() when $default != null:
return $default(_that.latitude,_that.longitude,_that.altitude);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LatLngCoordinate implements LatLngCoordinate {
  const _LatLngCoordinate({required this.latitude, required this.longitude, this.altitude});
  factory _LatLngCoordinate.fromJson(Map<String, dynamic> json) => _$LatLngCoordinateFromJson(json);

@override final  double latitude;
@override final  double longitude;
@override final  double? altitude;

/// Create a copy of LatLngCoordinate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LatLngCoordinateCopyWith<_LatLngCoordinate> get copyWith => __$LatLngCoordinateCopyWithImpl<_LatLngCoordinate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LatLngCoordinateToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LatLngCoordinate&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.altitude, altitude) || other.altitude == altitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,latitude,longitude,altitude);
}

@override
String toString() {
    return 'LatLngCoordinate(latitude: $latitude, longitude: $longitude, altitude: $altitude)';
}


}

/// @nodoc
abstract mixin class _$LatLngCoordinateCopyWith<$Res> implements $LatLngCoordinateCopyWith<$Res> {
  factory _$LatLngCoordinateCopyWith(_LatLngCoordinate value, $Res Function(_LatLngCoordinate) _then) = __$LatLngCoordinateCopyWithImpl;
@override @useResult
$Res call({
 double latitude, double longitude, double? altitude
});




}
/// @nodoc
class __$LatLngCoordinateCopyWithImpl<$Res>
    implements _$LatLngCoordinateCopyWith<$Res> {
  __$LatLngCoordinateCopyWithImpl(this._self, this._then);

  final _LatLngCoordinate _self;
  final $Res Function(_LatLngCoordinate) _then;

/// Create a copy of LatLngCoordinate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? latitude = null,Object? longitude = null,Object? altitude = freezed,}) {
  return _then(_LatLngCoordinate(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,altitude: freezed == altitude ? _self.altitude : altitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$UtmCoordinate {

 double get easting; double get northing; int get zoneNumber; String get zoneLetter;
/// Create a copy of UtmCoordinate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UtmCoordinateCopyWith<UtmCoordinate> get copyWith => _$UtmCoordinateCopyWithImpl<UtmCoordinate>(this as UtmCoordinate, _$identity);

  /// Serializes this UtmCoordinate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UtmCoordinate;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UtmCoordinate&&(identical(other.easting, _this.easting) || other.easting == _this.easting)&&(identical(other.northing, _this.northing) || other.northing == _this.northing)&&(identical(other.zoneNumber, _this.zoneNumber) || other.zoneNumber == _this.zoneNumber)&&(identical(other.zoneLetter, _this.zoneLetter) || other.zoneLetter == _this.zoneLetter));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UtmCoordinate;
  return Object.hash(runtimeType,_this.easting,_this.northing,_this.zoneNumber,_this.zoneLetter);
}

@override
String toString() {
  final _this = this as UtmCoordinate;
  return 'UtmCoordinate(easting: ${_this.easting}, northing: ${_this.northing}, zoneNumber: ${_this.zoneNumber}, zoneLetter: ${_this.zoneLetter})';
}


}

/// @nodoc
abstract mixin class $UtmCoordinateCopyWith<$Res>  {
  factory $UtmCoordinateCopyWith(UtmCoordinate value, $Res Function(UtmCoordinate) _then) = _$UtmCoordinateCopyWithImpl;
@useResult
$Res call({
 double easting, double northing, int zoneNumber, String zoneLetter
});




}
/// @nodoc
class _$UtmCoordinateCopyWithImpl<$Res>
    implements $UtmCoordinateCopyWith<$Res> {
  _$UtmCoordinateCopyWithImpl(this._self, this._then);

  final UtmCoordinate _self;
  final $Res Function(UtmCoordinate) _then;

/// Create a copy of UtmCoordinate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? easting = null,Object? northing = null,Object? zoneNumber = null,Object? zoneLetter = null,}) {
  return _then(UtmCoordinate(
easting: null == easting ? _self.easting : easting // ignore: cast_nullable_to_non_nullable
as double,northing: null == northing ? _self.northing : northing // ignore: cast_nullable_to_non_nullable
as double,zoneNumber: null == zoneNumber ? _self.zoneNumber : zoneNumber // ignore: cast_nullable_to_non_nullable
as int,zoneLetter: null == zoneLetter ? _self.zoneLetter : zoneLetter // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UtmCoordinate].
extension UtmCoordinatePatterns on UtmCoordinate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UtmCoordinate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UtmCoordinate() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UtmCoordinate value)  $default,){
final _that = this;
switch (_that) {
case _UtmCoordinate():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UtmCoordinate value)?  $default,){
final _that = this;
switch (_that) {
case _UtmCoordinate() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double easting,  double northing,  int zoneNumber,  String zoneLetter)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UtmCoordinate() when $default != null:
return $default(_that.easting,_that.northing,_that.zoneNumber,_that.zoneLetter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double easting,  double northing,  int zoneNumber,  String zoneLetter)  $default,) {final _that = this;
switch (_that) {
case _UtmCoordinate():
return $default(_that.easting,_that.northing,_that.zoneNumber,_that.zoneLetter);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double easting,  double northing,  int zoneNumber,  String zoneLetter)?  $default,) {final _that = this;
switch (_that) {
case _UtmCoordinate() when $default != null:
return $default(_that.easting,_that.northing,_that.zoneNumber,_that.zoneLetter);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UtmCoordinate implements UtmCoordinate {
  const _UtmCoordinate({required this.easting, required this.northing, required this.zoneNumber, required this.zoneLetter});
  factory _UtmCoordinate.fromJson(Map<String, dynamic> json) => _$UtmCoordinateFromJson(json);

@override final  double easting;
@override final  double northing;
@override final  int zoneNumber;
@override final  String zoneLetter;

/// Create a copy of UtmCoordinate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UtmCoordinateCopyWith<_UtmCoordinate> get copyWith => __$UtmCoordinateCopyWithImpl<_UtmCoordinate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UtmCoordinateToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UtmCoordinate&&(identical(other.easting, easting) || other.easting == easting)&&(identical(other.northing, northing) || other.northing == northing)&&(identical(other.zoneNumber, zoneNumber) || other.zoneNumber == zoneNumber)&&(identical(other.zoneLetter, zoneLetter) || other.zoneLetter == zoneLetter));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,easting,northing,zoneNumber,zoneLetter);
}

@override
String toString() {
    return 'UtmCoordinate(easting: $easting, northing: $northing, zoneNumber: $zoneNumber, zoneLetter: $zoneLetter)';
}


}

/// @nodoc
abstract mixin class _$UtmCoordinateCopyWith<$Res> implements $UtmCoordinateCopyWith<$Res> {
  factory _$UtmCoordinateCopyWith(_UtmCoordinate value, $Res Function(_UtmCoordinate) _then) = __$UtmCoordinateCopyWithImpl;
@override @useResult
$Res call({
 double easting, double northing, int zoneNumber, String zoneLetter
});




}
/// @nodoc
class __$UtmCoordinateCopyWithImpl<$Res>
    implements _$UtmCoordinateCopyWith<$Res> {
  __$UtmCoordinateCopyWithImpl(this._self, this._then);

  final _UtmCoordinate _self;
  final $Res Function(_UtmCoordinate) _then;

/// Create a copy of UtmCoordinate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? easting = null,Object? northing = null,Object? zoneNumber = null,Object? zoneLetter = null,}) {
  return _then(_UtmCoordinate(
easting: null == easting ? _self.easting : easting // ignore: cast_nullable_to_non_nullable
as double,northing: null == northing ? _self.northing : northing // ignore: cast_nullable_to_non_nullable
as double,zoneNumber: null == zoneNumber ? _self.zoneNumber : zoneNumber // ignore: cast_nullable_to_non_nullable
as int,zoneLetter: null == zoneLetter ? _self.zoneLetter : zoneLetter // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$LocalCartesianCoordinate {

 double get x; double get y; int? get floor;
/// Create a copy of LocalCartesianCoordinate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalCartesianCoordinateCopyWith<LocalCartesianCoordinate> get copyWith => _$LocalCartesianCoordinateCopyWithImpl<LocalCartesianCoordinate>(this as LocalCartesianCoordinate, _$identity);

  /// Serializes this LocalCartesianCoordinate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LocalCartesianCoordinate;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalCartesianCoordinate&&(identical(other.x, _this.x) || other.x == _this.x)&&(identical(other.y, _this.y) || other.y == _this.y)&&(identical(other.floor, _this.floor) || other.floor == _this.floor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LocalCartesianCoordinate;
  return Object.hash(runtimeType,_this.x,_this.y,_this.floor);
}

@override
String toString() {
  final _this = this as LocalCartesianCoordinate;
  return 'LocalCartesianCoordinate(x: ${_this.x}, y: ${_this.y}, floor: ${_this.floor})';
}


}

/// @nodoc
abstract mixin class $LocalCartesianCoordinateCopyWith<$Res>  {
  factory $LocalCartesianCoordinateCopyWith(LocalCartesianCoordinate value, $Res Function(LocalCartesianCoordinate) _then) = _$LocalCartesianCoordinateCopyWithImpl;
@useResult
$Res call({
 double x, double y, int? floor
});




}
/// @nodoc
class _$LocalCartesianCoordinateCopyWithImpl<$Res>
    implements $LocalCartesianCoordinateCopyWith<$Res> {
  _$LocalCartesianCoordinateCopyWithImpl(this._self, this._then);

  final LocalCartesianCoordinate _self;
  final $Res Function(LocalCartesianCoordinate) _then;

/// Create a copy of LocalCartesianCoordinate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? x = null,Object? y = null,Object? floor = freezed,}) {
  return _then(LocalCartesianCoordinate(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [LocalCartesianCoordinate].
extension LocalCartesianCoordinatePatterns on LocalCartesianCoordinate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocalCartesianCoordinate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocalCartesianCoordinate() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocalCartesianCoordinate value)  $default,){
final _that = this;
switch (_that) {
case _LocalCartesianCoordinate():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocalCartesianCoordinate value)?  $default,){
final _that = this;
switch (_that) {
case _LocalCartesianCoordinate() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double x,  double y,  int? floor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocalCartesianCoordinate() when $default != null:
return $default(_that.x,_that.y,_that.floor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double x,  double y,  int? floor)  $default,) {final _that = this;
switch (_that) {
case _LocalCartesianCoordinate():
return $default(_that.x,_that.y,_that.floor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double x,  double y,  int? floor)?  $default,) {final _that = this;
switch (_that) {
case _LocalCartesianCoordinate() when $default != null:
return $default(_that.x,_that.y,_that.floor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocalCartesianCoordinate implements LocalCartesianCoordinate {
  const _LocalCartesianCoordinate({required this.x, required this.y, this.floor});
  factory _LocalCartesianCoordinate.fromJson(Map<String, dynamic> json) => _$LocalCartesianCoordinateFromJson(json);

@override final  double x;
@override final  double y;
@override final  int? floor;

/// Create a copy of LocalCartesianCoordinate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocalCartesianCoordinateCopyWith<_LocalCartesianCoordinate> get copyWith => __$LocalCartesianCoordinateCopyWithImpl<_LocalCartesianCoordinate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocalCartesianCoordinateToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocalCartesianCoordinate&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.floor, floor) || other.floor == floor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,x,y,floor);
}

@override
String toString() {
    return 'LocalCartesianCoordinate(x: $x, y: $y, floor: $floor)';
}


}

/// @nodoc
abstract mixin class _$LocalCartesianCoordinateCopyWith<$Res> implements $LocalCartesianCoordinateCopyWith<$Res> {
  factory _$LocalCartesianCoordinateCopyWith(_LocalCartesianCoordinate value, $Res Function(_LocalCartesianCoordinate) _then) = __$LocalCartesianCoordinateCopyWithImpl;
@override @useResult
$Res call({
 double x, double y, int? floor
});




}
/// @nodoc
class __$LocalCartesianCoordinateCopyWithImpl<$Res>
    implements _$LocalCartesianCoordinateCopyWith<$Res> {
  __$LocalCartesianCoordinateCopyWithImpl(this._self, this._then);

  final _LocalCartesianCoordinate _self;
  final $Res Function(_LocalCartesianCoordinate) _then;

/// Create a copy of LocalCartesianCoordinate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? x = null,Object? y = null,Object? floor = freezed,}) {
  return _then(_LocalCartesianCoordinate(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$AffineTransform {

 double get a; double get b; double get c; double get d; double get e; double get f;
/// Create a copy of AffineTransform
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AffineTransformCopyWith<AffineTransform> get copyWith => _$AffineTransformCopyWithImpl<AffineTransform>(this as AffineTransform, _$identity);

  /// Serializes this AffineTransform to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AffineTransform;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AffineTransform&&(identical(other.a, _this.a) || other.a == _this.a)&&(identical(other.b, _this.b) || other.b == _this.b)&&(identical(other.c, _this.c) || other.c == _this.c)&&(identical(other.d, _this.d) || other.d == _this.d)&&(identical(other.e, _this.e) || other.e == _this.e)&&(identical(other.f, _this.f) || other.f == _this.f));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AffineTransform;
  return Object.hash(runtimeType,_this.a,_this.b,_this.c,_this.d,_this.e,_this.f);
}

@override
String toString() {
  final _this = this as AffineTransform;
  return 'AffineTransform(a: ${_this.a}, b: ${_this.b}, c: ${_this.c}, d: ${_this.d}, e: ${_this.e}, f: ${_this.f})';
}


}

/// @nodoc
abstract mixin class $AffineTransformCopyWith<$Res>  {
  factory $AffineTransformCopyWith(AffineTransform value, $Res Function(AffineTransform) _then) = _$AffineTransformCopyWithImpl;
@useResult
$Res call({
 double a, double b, double c, double d, double e, double f
});




}
/// @nodoc
class _$AffineTransformCopyWithImpl<$Res>
    implements $AffineTransformCopyWith<$Res> {
  _$AffineTransformCopyWithImpl(this._self, this._then);

  final AffineTransform _self;
  final $Res Function(AffineTransform) _then;

/// Create a copy of AffineTransform
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? a = null,Object? b = null,Object? c = null,Object? d = null,Object? e = null,Object? f = null,}) {
  return _then(AffineTransform(
a: null == a ? _self.a : a // ignore: cast_nullable_to_non_nullable
as double,b: null == b ? _self.b : b // ignore: cast_nullable_to_non_nullable
as double,c: null == c ? _self.c : c // ignore: cast_nullable_to_non_nullable
as double,d: null == d ? _self.d : d // ignore: cast_nullable_to_non_nullable
as double,e: null == e ? _self.e : e // ignore: cast_nullable_to_non_nullable
as double,f: null == f ? _self.f : f // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [AffineTransform].
extension AffineTransformPatterns on AffineTransform {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AffineTransform value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AffineTransform() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AffineTransform value)  $default,){
final _that = this;
switch (_that) {
case _AffineTransform():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AffineTransform value)?  $default,){
final _that = this;
switch (_that) {
case _AffineTransform() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double a,  double b,  double c,  double d,  double e,  double f)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AffineTransform() when $default != null:
return $default(_that.a,_that.b,_that.c,_that.d,_that.e,_that.f);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double a,  double b,  double c,  double d,  double e,  double f)  $default,) {final _that = this;
switch (_that) {
case _AffineTransform():
return $default(_that.a,_that.b,_that.c,_that.d,_that.e,_that.f);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double a,  double b,  double c,  double d,  double e,  double f)?  $default,) {final _that = this;
switch (_that) {
case _AffineTransform() when $default != null:
return $default(_that.a,_that.b,_that.c,_that.d,_that.e,_that.f);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AffineTransform implements AffineTransform {
  const _AffineTransform({required this.a, required this.b, required this.c, required this.d, required this.e, required this.f});
  factory _AffineTransform.fromJson(Map<String, dynamic> json) => _$AffineTransformFromJson(json);

@override final  double a;
@override final  double b;
@override final  double c;
@override final  double d;
@override final  double e;
@override final  double f;

/// Create a copy of AffineTransform
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AffineTransformCopyWith<_AffineTransform> get copyWith => __$AffineTransformCopyWithImpl<_AffineTransform>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AffineTransformToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AffineTransform&&(identical(other.a, a) || other.a == a)&&(identical(other.b, b) || other.b == b)&&(identical(other.c, c) || other.c == c)&&(identical(other.d, d) || other.d == d)&&(identical(other.e, e) || other.e == e)&&(identical(other.f, f) || other.f == f));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,a,b,c,d,e,f);
}

@override
String toString() {
    return 'AffineTransform(a: $a, b: $b, c: $c, d: $d, e: $e, f: $f)';
}


}

/// @nodoc
abstract mixin class _$AffineTransformCopyWith<$Res> implements $AffineTransformCopyWith<$Res> {
  factory _$AffineTransformCopyWith(_AffineTransform value, $Res Function(_AffineTransform) _then) = __$AffineTransformCopyWithImpl;
@override @useResult
$Res call({
 double a, double b, double c, double d, double e, double f
});




}
/// @nodoc
class __$AffineTransformCopyWithImpl<$Res>
    implements _$AffineTransformCopyWith<$Res> {
  __$AffineTransformCopyWithImpl(this._self, this._then);

  final _AffineTransform _self;
  final $Res Function(_AffineTransform) _then;

/// Create a copy of AffineTransform
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? a = null,Object? b = null,Object? c = null,Object? d = null,Object? e = null,Object? f = null,}) {
  return _then(_AffineTransform(
a: null == a ? _self.a : a // ignore: cast_nullable_to_non_nullable
as double,b: null == b ? _self.b : b // ignore: cast_nullable_to_non_nullable
as double,c: null == c ? _self.c : c // ignore: cast_nullable_to_non_nullable
as double,d: null == d ? _self.d : d // ignore: cast_nullable_to_non_nullable
as double,e: null == e ? _self.e : e // ignore: cast_nullable_to_non_nullable
as double,f: null == f ? _self.f : f // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$ProjectiveTransform {

 double get m00; double get m01; double get m02; double get m10; double get m11; double get m12; double get m20; double get m21;
/// Create a copy of ProjectiveTransform
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectiveTransformCopyWith<ProjectiveTransform> get copyWith => _$ProjectiveTransformCopyWithImpl<ProjectiveTransform>(this as ProjectiveTransform, _$identity);

  /// Serializes this ProjectiveTransform to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProjectiveTransform;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectiveTransform&&(identical(other.m00, _this.m00) || other.m00 == _this.m00)&&(identical(other.m01, _this.m01) || other.m01 == _this.m01)&&(identical(other.m02, _this.m02) || other.m02 == _this.m02)&&(identical(other.m10, _this.m10) || other.m10 == _this.m10)&&(identical(other.m11, _this.m11) || other.m11 == _this.m11)&&(identical(other.m12, _this.m12) || other.m12 == _this.m12)&&(identical(other.m20, _this.m20) || other.m20 == _this.m20)&&(identical(other.m21, _this.m21) || other.m21 == _this.m21));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProjectiveTransform;
  return Object.hash(runtimeType,_this.m00,_this.m01,_this.m02,_this.m10,_this.m11,_this.m12,_this.m20,_this.m21);
}

@override
String toString() {
  final _this = this as ProjectiveTransform;
  return 'ProjectiveTransform(m00: ${_this.m00}, m01: ${_this.m01}, m02: ${_this.m02}, m10: ${_this.m10}, m11: ${_this.m11}, m12: ${_this.m12}, m20: ${_this.m20}, m21: ${_this.m21})';
}


}

/// @nodoc
abstract mixin class $ProjectiveTransformCopyWith<$Res>  {
  factory $ProjectiveTransformCopyWith(ProjectiveTransform value, $Res Function(ProjectiveTransform) _then) = _$ProjectiveTransformCopyWithImpl;
@useResult
$Res call({
 double m00, double m01, double m02, double m10, double m11, double m12, double m20, double m21
});




}
/// @nodoc
class _$ProjectiveTransformCopyWithImpl<$Res>
    implements $ProjectiveTransformCopyWith<$Res> {
  _$ProjectiveTransformCopyWithImpl(this._self, this._then);

  final ProjectiveTransform _self;
  final $Res Function(ProjectiveTransform) _then;

/// Create a copy of ProjectiveTransform
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? m00 = null,Object? m01 = null,Object? m02 = null,Object? m10 = null,Object? m11 = null,Object? m12 = null,Object? m20 = null,Object? m21 = null,}) {
  return _then(ProjectiveTransform(
m00: null == m00 ? _self.m00 : m00 // ignore: cast_nullable_to_non_nullable
as double,m01: null == m01 ? _self.m01 : m01 // ignore: cast_nullable_to_non_nullable
as double,m02: null == m02 ? _self.m02 : m02 // ignore: cast_nullable_to_non_nullable
as double,m10: null == m10 ? _self.m10 : m10 // ignore: cast_nullable_to_non_nullable
as double,m11: null == m11 ? _self.m11 : m11 // ignore: cast_nullable_to_non_nullable
as double,m12: null == m12 ? _self.m12 : m12 // ignore: cast_nullable_to_non_nullable
as double,m20: null == m20 ? _self.m20 : m20 // ignore: cast_nullable_to_non_nullable
as double,m21: null == m21 ? _self.m21 : m21 // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectiveTransform].
extension ProjectiveTransformPatterns on ProjectiveTransform {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectiveTransform value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectiveTransform() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectiveTransform value)  $default,){
final _that = this;
switch (_that) {
case _ProjectiveTransform():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectiveTransform value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectiveTransform() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double m00,  double m01,  double m02,  double m10,  double m11,  double m12,  double m20,  double m21)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectiveTransform() when $default != null:
return $default(_that.m00,_that.m01,_that.m02,_that.m10,_that.m11,_that.m12,_that.m20,_that.m21);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double m00,  double m01,  double m02,  double m10,  double m11,  double m12,  double m20,  double m21)  $default,) {final _that = this;
switch (_that) {
case _ProjectiveTransform():
return $default(_that.m00,_that.m01,_that.m02,_that.m10,_that.m11,_that.m12,_that.m20,_that.m21);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double m00,  double m01,  double m02,  double m10,  double m11,  double m12,  double m20,  double m21)?  $default,) {final _that = this;
switch (_that) {
case _ProjectiveTransform() when $default != null:
return $default(_that.m00,_that.m01,_that.m02,_that.m10,_that.m11,_that.m12,_that.m20,_that.m21);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectiveTransform implements ProjectiveTransform {
  const _ProjectiveTransform({required this.m00, required this.m01, required this.m02, required this.m10, required this.m11, required this.m12, required this.m20, required this.m21});
  factory _ProjectiveTransform.fromJson(Map<String, dynamic> json) => _$ProjectiveTransformFromJson(json);

@override final  double m00;
@override final  double m01;
@override final  double m02;
@override final  double m10;
@override final  double m11;
@override final  double m12;
@override final  double m20;
@override final  double m21;

/// Create a copy of ProjectiveTransform
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectiveTransformCopyWith<_ProjectiveTransform> get copyWith => __$ProjectiveTransformCopyWithImpl<_ProjectiveTransform>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectiveTransformToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectiveTransform&&(identical(other.m00, m00) || other.m00 == m00)&&(identical(other.m01, m01) || other.m01 == m01)&&(identical(other.m02, m02) || other.m02 == m02)&&(identical(other.m10, m10) || other.m10 == m10)&&(identical(other.m11, m11) || other.m11 == m11)&&(identical(other.m12, m12) || other.m12 == m12)&&(identical(other.m20, m20) || other.m20 == m20)&&(identical(other.m21, m21) || other.m21 == m21));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,m00,m01,m02,m10,m11,m12,m20,m21);
}

@override
String toString() {
    return 'ProjectiveTransform(m00: $m00, m01: $m01, m02: $m02, m10: $m10, m11: $m11, m12: $m12, m20: $m20, m21: $m21)';
}


}

/// @nodoc
abstract mixin class _$ProjectiveTransformCopyWith<$Res> implements $ProjectiveTransformCopyWith<$Res> {
  factory _$ProjectiveTransformCopyWith(_ProjectiveTransform value, $Res Function(_ProjectiveTransform) _then) = __$ProjectiveTransformCopyWithImpl;
@override @useResult
$Res call({
 double m00, double m01, double m02, double m10, double m11, double m12, double m20, double m21
});




}
/// @nodoc
class __$ProjectiveTransformCopyWithImpl<$Res>
    implements _$ProjectiveTransformCopyWith<$Res> {
  __$ProjectiveTransformCopyWithImpl(this._self, this._then);

  final _ProjectiveTransform _self;
  final $Res Function(_ProjectiveTransform) _then;

/// Create a copy of ProjectiveTransform
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? m00 = null,Object? m01 = null,Object? m02 = null,Object? m10 = null,Object? m11 = null,Object? m12 = null,Object? m20 = null,Object? m21 = null,}) {
  return _then(_ProjectiveTransform(
m00: null == m00 ? _self.m00 : m00 // ignore: cast_nullable_to_non_nullable
as double,m01: null == m01 ? _self.m01 : m01 // ignore: cast_nullable_to_non_nullable
as double,m02: null == m02 ? _self.m02 : m02 // ignore: cast_nullable_to_non_nullable
as double,m10: null == m10 ? _self.m10 : m10 // ignore: cast_nullable_to_non_nullable
as double,m11: null == m11 ? _self.m11 : m11 // ignore: cast_nullable_to_non_nullable
as double,m12: null == m12 ? _self.m12 : m12 // ignore: cast_nullable_to_non_nullable
as double,m20: null == m20 ? _self.m20 : m20 // ignore: cast_nullable_to_non_nullable
as double,m21: null == m21 ? _self.m21 : m21 // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$CampusGeoreference {

 String get campusId; String get campusName; LatLngCoordinate get wgs84Origin; UtmCoordinate get utmOrigin; LocalCartesianCoordinate get localOrigin; AffineTransform get wgs84ToLocal; AffineTransform get localToWgs84; AffineTransform get utmToLocal; AffineTransform get localToUtm; ProjectiveTransform? get projectiveWgs84ToLocal; ProjectiveTransform? get projectiveLocalToWgs84; DateTime get calibratedAt; String? get calibrationMethod; List<LatLngCoordinate>? get groundControlPointsWgs84; List<LocalCartesianCoordinate>? get groundControlPointsLocal; Map<String, dynamic>? get metadata;
/// Create a copy of CampusGeoreference
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CampusGeoreferenceCopyWith<CampusGeoreference> get copyWith => _$CampusGeoreferenceCopyWithImpl<CampusGeoreference>(this as CampusGeoreference, _$identity);

  /// Serializes this CampusGeoreference to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CampusGeoreference;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CampusGeoreference&&(identical(other.campusId, _this.campusId) || other.campusId == _this.campusId)&&(identical(other.campusName, _this.campusName) || other.campusName == _this.campusName)&&(identical(other.wgs84Origin, _this.wgs84Origin) || other.wgs84Origin == _this.wgs84Origin)&&(identical(other.utmOrigin, _this.utmOrigin) || other.utmOrigin == _this.utmOrigin)&&(identical(other.localOrigin, _this.localOrigin) || other.localOrigin == _this.localOrigin)&&(identical(other.wgs84ToLocal, _this.wgs84ToLocal) || other.wgs84ToLocal == _this.wgs84ToLocal)&&(identical(other.localToWgs84, _this.localToWgs84) || other.localToWgs84 == _this.localToWgs84)&&(identical(other.utmToLocal, _this.utmToLocal) || other.utmToLocal == _this.utmToLocal)&&(identical(other.localToUtm, _this.localToUtm) || other.localToUtm == _this.localToUtm)&&(identical(other.projectiveWgs84ToLocal, _this.projectiveWgs84ToLocal) || other.projectiveWgs84ToLocal == _this.projectiveWgs84ToLocal)&&(identical(other.projectiveLocalToWgs84, _this.projectiveLocalToWgs84) || other.projectiveLocalToWgs84 == _this.projectiveLocalToWgs84)&&(identical(other.calibratedAt, _this.calibratedAt) || other.calibratedAt == _this.calibratedAt)&&(identical(other.calibrationMethod, _this.calibrationMethod) || other.calibrationMethod == _this.calibrationMethod)&&const DeepCollectionEquality().equals(other.groundControlPointsWgs84, _this.groundControlPointsWgs84)&&const DeepCollectionEquality().equals(other.groundControlPointsLocal, _this.groundControlPointsLocal)&&const DeepCollectionEquality().equals(other.metadata, _this.metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CampusGeoreference;
  return Object.hash(runtimeType,_this.campusId,_this.campusName,_this.wgs84Origin,_this.utmOrigin,_this.localOrigin,_this.wgs84ToLocal,_this.localToWgs84,_this.utmToLocal,_this.localToUtm,_this.projectiveWgs84ToLocal,_this.projectiveLocalToWgs84,_this.calibratedAt,_this.calibrationMethod,const DeepCollectionEquality().hash(_this.groundControlPointsWgs84),const DeepCollectionEquality().hash(_this.groundControlPointsLocal),const DeepCollectionEquality().hash(_this.metadata));
}

@override
String toString() {
  final _this = this as CampusGeoreference;
  return 'CampusGeoreference(campusId: ${_this.campusId}, campusName: ${_this.campusName}, wgs84Origin: ${_this.wgs84Origin}, utmOrigin: ${_this.utmOrigin}, localOrigin: ${_this.localOrigin}, wgs84ToLocal: ${_this.wgs84ToLocal}, localToWgs84: ${_this.localToWgs84}, utmToLocal: ${_this.utmToLocal}, localToUtm: ${_this.localToUtm}, projectiveWgs84ToLocal: ${_this.projectiveWgs84ToLocal}, projectiveLocalToWgs84: ${_this.projectiveLocalToWgs84}, calibratedAt: ${_this.calibratedAt}, calibrationMethod: ${_this.calibrationMethod}, groundControlPointsWgs84: ${_this.groundControlPointsWgs84}, groundControlPointsLocal: ${_this.groundControlPointsLocal}, metadata: ${_this.metadata})';
}


}

/// @nodoc
abstract mixin class $CampusGeoreferenceCopyWith<$Res>  {
  factory $CampusGeoreferenceCopyWith(CampusGeoreference value, $Res Function(CampusGeoreference) _then) = _$CampusGeoreferenceCopyWithImpl;
@useResult
$Res call({
 String campusId, String campusName, LatLngCoordinate wgs84Origin, UtmCoordinate utmOrigin, LocalCartesianCoordinate localOrigin, AffineTransform wgs84ToLocal, AffineTransform localToWgs84, AffineTransform utmToLocal, AffineTransform localToUtm, ProjectiveTransform? projectiveWgs84ToLocal, ProjectiveTransform? projectiveLocalToWgs84, DateTime calibratedAt, String? calibrationMethod, List<LatLngCoordinate>? groundControlPointsWgs84, List<LocalCartesianCoordinate>? groundControlPointsLocal, Map<String, dynamic>? metadata
});


$LatLngCoordinateCopyWith<$Res> get wgs84Origin;$UtmCoordinateCopyWith<$Res> get utmOrigin;$LocalCartesianCoordinateCopyWith<$Res> get localOrigin;$AffineTransformCopyWith<$Res> get wgs84ToLocal;$AffineTransformCopyWith<$Res> get localToWgs84;$AffineTransformCopyWith<$Res> get utmToLocal;$AffineTransformCopyWith<$Res> get localToUtm;$ProjectiveTransformCopyWith<$Res>? get projectiveWgs84ToLocal;$ProjectiveTransformCopyWith<$Res>? get projectiveLocalToWgs84;

}
/// @nodoc
class _$CampusGeoreferenceCopyWithImpl<$Res>
    implements $CampusGeoreferenceCopyWith<$Res> {
  _$CampusGeoreferenceCopyWithImpl(this._self, this._then);

  final CampusGeoreference _self;
  final $Res Function(CampusGeoreference) _then;

/// Create a copy of CampusGeoreference
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? campusId = null,Object? campusName = null,Object? wgs84Origin = null,Object? utmOrigin = null,Object? localOrigin = null,Object? wgs84ToLocal = null,Object? localToWgs84 = null,Object? utmToLocal = null,Object? localToUtm = null,Object? projectiveWgs84ToLocal = freezed,Object? projectiveLocalToWgs84 = freezed,Object? calibratedAt = null,Object? calibrationMethod = freezed,Object? groundControlPointsWgs84 = freezed,Object? groundControlPointsLocal = freezed,Object? metadata = freezed,}) {
  return _then(CampusGeoreference(
campusId: null == campusId ? _self.campusId : campusId // ignore: cast_nullable_to_non_nullable
as String,campusName: null == campusName ? _self.campusName : campusName // ignore: cast_nullable_to_non_nullable
as String,wgs84Origin: null == wgs84Origin ? _self.wgs84Origin : wgs84Origin // ignore: cast_nullable_to_non_nullable
as LatLngCoordinate,utmOrigin: null == utmOrigin ? _self.utmOrigin : utmOrigin // ignore: cast_nullable_to_non_nullable
as UtmCoordinate,localOrigin: null == localOrigin ? _self.localOrigin : localOrigin // ignore: cast_nullable_to_non_nullable
as LocalCartesianCoordinate,wgs84ToLocal: null == wgs84ToLocal ? _self.wgs84ToLocal : wgs84ToLocal // ignore: cast_nullable_to_non_nullable
as AffineTransform,localToWgs84: null == localToWgs84 ? _self.localToWgs84 : localToWgs84 // ignore: cast_nullable_to_non_nullable
as AffineTransform,utmToLocal: null == utmToLocal ? _self.utmToLocal : utmToLocal // ignore: cast_nullable_to_non_nullable
as AffineTransform,localToUtm: null == localToUtm ? _self.localToUtm : localToUtm // ignore: cast_nullable_to_non_nullable
as AffineTransform,projectiveWgs84ToLocal: freezed == projectiveWgs84ToLocal ? _self.projectiveWgs84ToLocal : projectiveWgs84ToLocal // ignore: cast_nullable_to_non_nullable
as ProjectiveTransform?,projectiveLocalToWgs84: freezed == projectiveLocalToWgs84 ? _self.projectiveLocalToWgs84 : projectiveLocalToWgs84 // ignore: cast_nullable_to_non_nullable
as ProjectiveTransform?,calibratedAt: null == calibratedAt ? _self.calibratedAt : calibratedAt // ignore: cast_nullable_to_non_nullable
as DateTime,calibrationMethod: freezed == calibrationMethod ? _self.calibrationMethod : calibrationMethod // ignore: cast_nullable_to_non_nullable
as String?,groundControlPointsWgs84: freezed == groundControlPointsWgs84 ? _self.groundControlPointsWgs84 : groundControlPointsWgs84 // ignore: cast_nullable_to_non_nullable
as List<LatLngCoordinate>?,groundControlPointsLocal: freezed == groundControlPointsLocal ? _self.groundControlPointsLocal : groundControlPointsLocal // ignore: cast_nullable_to_non_nullable
as List<LocalCartesianCoordinate>?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}
/// Create a copy of CampusGeoreference
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LatLngCoordinateCopyWith<$Res> get wgs84Origin {
  
  return $LatLngCoordinateCopyWith<$Res>(_self.wgs84Origin, (value) {
    return _then(_self.copyWith(wgs84Origin: value));
  });
}/// Create a copy of CampusGeoreference
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UtmCoordinateCopyWith<$Res> get utmOrigin {
  
  return $UtmCoordinateCopyWith<$Res>(_self.utmOrigin, (value) {
    return _then(_self.copyWith(utmOrigin: value));
  });
}/// Create a copy of CampusGeoreference
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalCartesianCoordinateCopyWith<$Res> get localOrigin {
  
  return $LocalCartesianCoordinateCopyWith<$Res>(_self.localOrigin, (value) {
    return _then(_self.copyWith(localOrigin: value));
  });
}/// Create a copy of CampusGeoreference
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AffineTransformCopyWith<$Res> get wgs84ToLocal {
  
  return $AffineTransformCopyWith<$Res>(_self.wgs84ToLocal, (value) {
    return _then(_self.copyWith(wgs84ToLocal: value));
  });
}/// Create a copy of CampusGeoreference
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AffineTransformCopyWith<$Res> get localToWgs84 {
  
  return $AffineTransformCopyWith<$Res>(_self.localToWgs84, (value) {
    return _then(_self.copyWith(localToWgs84: value));
  });
}/// Create a copy of CampusGeoreference
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AffineTransformCopyWith<$Res> get utmToLocal {
  
  return $AffineTransformCopyWith<$Res>(_self.utmToLocal, (value) {
    return _then(_self.copyWith(utmToLocal: value));
  });
}/// Create a copy of CampusGeoreference
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AffineTransformCopyWith<$Res> get localToUtm {
  
  return $AffineTransformCopyWith<$Res>(_self.localToUtm, (value) {
    return _then(_self.copyWith(localToUtm: value));
  });
}/// Create a copy of CampusGeoreference
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectiveTransformCopyWith<$Res>? get projectiveWgs84ToLocal {
    if (_self.projectiveWgs84ToLocal == null) {
    return null;
  }

  return $ProjectiveTransformCopyWith<$Res>(_self.projectiveWgs84ToLocal!, (value) {
    return _then(_self.copyWith(projectiveWgs84ToLocal: value));
  });
}/// Create a copy of CampusGeoreference
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectiveTransformCopyWith<$Res>? get projectiveLocalToWgs84 {
    if (_self.projectiveLocalToWgs84 == null) {
    return null;
  }

  return $ProjectiveTransformCopyWith<$Res>(_self.projectiveLocalToWgs84!, (value) {
    return _then(_self.copyWith(projectiveLocalToWgs84: value));
  });
}
}


/// Adds pattern-matching-related methods to [CampusGeoreference].
extension CampusGeoreferencePatterns on CampusGeoreference {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CampusGeoreference value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CampusGeoreference() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CampusGeoreference value)  $default,){
final _that = this;
switch (_that) {
case _CampusGeoreference():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CampusGeoreference value)?  $default,){
final _that = this;
switch (_that) {
case _CampusGeoreference() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String campusId,  String campusName,  LatLngCoordinate wgs84Origin,  UtmCoordinate utmOrigin,  LocalCartesianCoordinate localOrigin,  AffineTransform wgs84ToLocal,  AffineTransform localToWgs84,  AffineTransform utmToLocal,  AffineTransform localToUtm,  ProjectiveTransform? projectiveWgs84ToLocal,  ProjectiveTransform? projectiveLocalToWgs84,  DateTime calibratedAt,  String? calibrationMethod,  List<LatLngCoordinate>? groundControlPointsWgs84,  List<LocalCartesianCoordinate>? groundControlPointsLocal,  Map<String, dynamic>? metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CampusGeoreference() when $default != null:
return $default(_that.campusId,_that.campusName,_that.wgs84Origin,_that.utmOrigin,_that.localOrigin,_that.wgs84ToLocal,_that.localToWgs84,_that.utmToLocal,_that.localToUtm,_that.projectiveWgs84ToLocal,_that.projectiveLocalToWgs84,_that.calibratedAt,_that.calibrationMethod,_that.groundControlPointsWgs84,_that.groundControlPointsLocal,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String campusId,  String campusName,  LatLngCoordinate wgs84Origin,  UtmCoordinate utmOrigin,  LocalCartesianCoordinate localOrigin,  AffineTransform wgs84ToLocal,  AffineTransform localToWgs84,  AffineTransform utmToLocal,  AffineTransform localToUtm,  ProjectiveTransform? projectiveWgs84ToLocal,  ProjectiveTransform? projectiveLocalToWgs84,  DateTime calibratedAt,  String? calibrationMethod,  List<LatLngCoordinate>? groundControlPointsWgs84,  List<LocalCartesianCoordinate>? groundControlPointsLocal,  Map<String, dynamic>? metadata)  $default,) {final _that = this;
switch (_that) {
case _CampusGeoreference():
return $default(_that.campusId,_that.campusName,_that.wgs84Origin,_that.utmOrigin,_that.localOrigin,_that.wgs84ToLocal,_that.localToWgs84,_that.utmToLocal,_that.localToUtm,_that.projectiveWgs84ToLocal,_that.projectiveLocalToWgs84,_that.calibratedAt,_that.calibrationMethod,_that.groundControlPointsWgs84,_that.groundControlPointsLocal,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String campusId,  String campusName,  LatLngCoordinate wgs84Origin,  UtmCoordinate utmOrigin,  LocalCartesianCoordinate localOrigin,  AffineTransform wgs84ToLocal,  AffineTransform localToWgs84,  AffineTransform utmToLocal,  AffineTransform localToUtm,  ProjectiveTransform? projectiveWgs84ToLocal,  ProjectiveTransform? projectiveLocalToWgs84,  DateTime calibratedAt,  String? calibrationMethod,  List<LatLngCoordinate>? groundControlPointsWgs84,  List<LocalCartesianCoordinate>? groundControlPointsLocal,  Map<String, dynamic>? metadata)?  $default,) {final _that = this;
switch (_that) {
case _CampusGeoreference() when $default != null:
return $default(_that.campusId,_that.campusName,_that.wgs84Origin,_that.utmOrigin,_that.localOrigin,_that.wgs84ToLocal,_that.localToWgs84,_that.utmToLocal,_that.localToUtm,_that.projectiveWgs84ToLocal,_that.projectiveLocalToWgs84,_that.calibratedAt,_that.calibrationMethod,_that.groundControlPointsWgs84,_that.groundControlPointsLocal,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CampusGeoreference implements CampusGeoreference {
  const _CampusGeoreference({required this.campusId, required this.campusName, required this.wgs84Origin, required this.utmOrigin, required this.localOrigin, this.wgs84ToLocal = const AffineTransform(a: 1.0, b: 0.0, c: 0.0, d: 1.0, e: 0.0, f: 0.0), this.localToWgs84 = const AffineTransform(a: 1.0, b: 0.0, c: 0.0, d: 1.0, e: 0.0, f: 0.0), this.utmToLocal = const AffineTransform(a: 1.0, b: 0.0, c: 0.0, d: 1.0, e: 0.0, f: 0.0), this.localToUtm = const AffineTransform(a: 1.0, b: 0.0, c: 0.0, d: 1.0, e: 0.0, f: 0.0), this.projectiveWgs84ToLocal, this.projectiveLocalToWgs84, required this.calibratedAt, this.calibrationMethod,  List<LatLngCoordinate>? groundControlPointsWgs84,  List<LocalCartesianCoordinate>? groundControlPointsLocal,  Map<String, dynamic>? metadata}): _groundControlPointsWgs84 = groundControlPointsWgs84,_groundControlPointsLocal = groundControlPointsLocal,_metadata = metadata;
  factory _CampusGeoreference.fromJson(Map<String, dynamic> json) => _$CampusGeoreferenceFromJson(json);

@override final  String campusId;
@override final  String campusName;
@override final  LatLngCoordinate wgs84Origin;
@override final  UtmCoordinate utmOrigin;
@override final  LocalCartesianCoordinate localOrigin;
@override@JsonKey() final  AffineTransform wgs84ToLocal;
@override@JsonKey() final  AffineTransform localToWgs84;
@override@JsonKey() final  AffineTransform utmToLocal;
@override@JsonKey() final  AffineTransform localToUtm;
@override final  ProjectiveTransform? projectiveWgs84ToLocal;
@override final  ProjectiveTransform? projectiveLocalToWgs84;
@override final  DateTime calibratedAt;
@override final  String? calibrationMethod;
 final  List<LatLngCoordinate>? _groundControlPointsWgs84;
@override List<LatLngCoordinate>? get groundControlPointsWgs84 {
  final value = _groundControlPointsWgs84;
  if (value == null) return null;
  if (_groundControlPointsWgs84 is EqualUnmodifiableListView) return _groundControlPointsWgs84;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<LocalCartesianCoordinate>? _groundControlPointsLocal;
@override List<LocalCartesianCoordinate>? get groundControlPointsLocal {
  final value = _groundControlPointsLocal;
  if (value == null) return null;
  if (_groundControlPointsLocal is EqualUnmodifiableListView) return _groundControlPointsLocal;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  Map<String, dynamic>? _metadata;
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of CampusGeoreference
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CampusGeoreferenceCopyWith<_CampusGeoreference> get copyWith => __$CampusGeoreferenceCopyWithImpl<_CampusGeoreference>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CampusGeoreferenceToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CampusGeoreference&&(identical(other.campusId, campusId) || other.campusId == campusId)&&(identical(other.campusName, campusName) || other.campusName == campusName)&&(identical(other.wgs84Origin, wgs84Origin) || other.wgs84Origin == wgs84Origin)&&(identical(other.utmOrigin, utmOrigin) || other.utmOrigin == utmOrigin)&&(identical(other.localOrigin, localOrigin) || other.localOrigin == localOrigin)&&(identical(other.wgs84ToLocal, wgs84ToLocal) || other.wgs84ToLocal == wgs84ToLocal)&&(identical(other.localToWgs84, localToWgs84) || other.localToWgs84 == localToWgs84)&&(identical(other.utmToLocal, utmToLocal) || other.utmToLocal == utmToLocal)&&(identical(other.localToUtm, localToUtm) || other.localToUtm == localToUtm)&&(identical(other.projectiveWgs84ToLocal, projectiveWgs84ToLocal) || other.projectiveWgs84ToLocal == projectiveWgs84ToLocal)&&(identical(other.projectiveLocalToWgs84, projectiveLocalToWgs84) || other.projectiveLocalToWgs84 == projectiveLocalToWgs84)&&(identical(other.calibratedAt, calibratedAt) || other.calibratedAt == calibratedAt)&&(identical(other.calibrationMethod, calibrationMethod) || other.calibrationMethod == calibrationMethod)&&const DeepCollectionEquality().equals(other.groundControlPointsWgs84, _groundControlPointsWgs84)&&const DeepCollectionEquality().equals(other.groundControlPointsLocal, _groundControlPointsLocal)&&const DeepCollectionEquality().equals(other.metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,campusId,campusName,wgs84Origin,utmOrigin,localOrigin,wgs84ToLocal,localToWgs84,utmToLocal,localToUtm,projectiveWgs84ToLocal,projectiveLocalToWgs84,calibratedAt,calibrationMethod,const DeepCollectionEquality().hash(_groundControlPointsWgs84),const DeepCollectionEquality().hash(_groundControlPointsLocal),const DeepCollectionEquality().hash(_metadata));
}

@override
String toString() {
    return 'CampusGeoreference(campusId: $campusId, campusName: $campusName, wgs84Origin: $wgs84Origin, utmOrigin: $utmOrigin, localOrigin: $localOrigin, wgs84ToLocal: $wgs84ToLocal, localToWgs84: $localToWgs84, utmToLocal: $utmToLocal, localToUtm: $localToUtm, projectiveWgs84ToLocal: $projectiveWgs84ToLocal, projectiveLocalToWgs84: $projectiveLocalToWgs84, calibratedAt: $calibratedAt, calibrationMethod: $calibrationMethod, groundControlPointsWgs84: $groundControlPointsWgs84, groundControlPointsLocal: $groundControlPointsLocal, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$CampusGeoreferenceCopyWith<$Res> implements $CampusGeoreferenceCopyWith<$Res> {
  factory _$CampusGeoreferenceCopyWith(_CampusGeoreference value, $Res Function(_CampusGeoreference) _then) = __$CampusGeoreferenceCopyWithImpl;
@override @useResult
$Res call({
 String campusId, String campusName, LatLngCoordinate wgs84Origin, UtmCoordinate utmOrigin, LocalCartesianCoordinate localOrigin, AffineTransform wgs84ToLocal, AffineTransform localToWgs84, AffineTransform utmToLocal, AffineTransform localToUtm, ProjectiveTransform? projectiveWgs84ToLocal, ProjectiveTransform? projectiveLocalToWgs84, DateTime calibratedAt, String? calibrationMethod, List<LatLngCoordinate>? groundControlPointsWgs84, List<LocalCartesianCoordinate>? groundControlPointsLocal, Map<String, dynamic>? metadata
});


@override $LatLngCoordinateCopyWith<$Res> get wgs84Origin;@override $UtmCoordinateCopyWith<$Res> get utmOrigin;@override $LocalCartesianCoordinateCopyWith<$Res> get localOrigin;@override $AffineTransformCopyWith<$Res> get wgs84ToLocal;@override $AffineTransformCopyWith<$Res> get localToWgs84;@override $AffineTransformCopyWith<$Res> get utmToLocal;@override $AffineTransformCopyWith<$Res> get localToUtm;@override $ProjectiveTransformCopyWith<$Res>? get projectiveWgs84ToLocal;@override $ProjectiveTransformCopyWith<$Res>? get projectiveLocalToWgs84;

}
/// @nodoc
class __$CampusGeoreferenceCopyWithImpl<$Res>
    implements _$CampusGeoreferenceCopyWith<$Res> {
  __$CampusGeoreferenceCopyWithImpl(this._self, this._then);

  final _CampusGeoreference _self;
  final $Res Function(_CampusGeoreference) _then;

/// Create a copy of CampusGeoreference
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? campusId = null,Object? campusName = null,Object? wgs84Origin = null,Object? utmOrigin = null,Object? localOrigin = null,Object? wgs84ToLocal = null,Object? localToWgs84 = null,Object? utmToLocal = null,Object? localToUtm = null,Object? projectiveWgs84ToLocal = freezed,Object? projectiveLocalToWgs84 = freezed,Object? calibratedAt = null,Object? calibrationMethod = freezed,Object? groundControlPointsWgs84 = freezed,Object? groundControlPointsLocal = freezed,Object? metadata = freezed,}) {
  return _then(_CampusGeoreference(
campusId: null == campusId ? _self.campusId : campusId // ignore: cast_nullable_to_non_nullable
as String,campusName: null == campusName ? _self.campusName : campusName // ignore: cast_nullable_to_non_nullable
as String,wgs84Origin: null == wgs84Origin ? _self.wgs84Origin : wgs84Origin // ignore: cast_nullable_to_non_nullable
as LatLngCoordinate,utmOrigin: null == utmOrigin ? _self.utmOrigin : utmOrigin // ignore: cast_nullable_to_non_nullable
as UtmCoordinate,localOrigin: null == localOrigin ? _self.localOrigin : localOrigin // ignore: cast_nullable_to_non_nullable
as LocalCartesianCoordinate,wgs84ToLocal: null == wgs84ToLocal ? _self.wgs84ToLocal : wgs84ToLocal // ignore: cast_nullable_to_non_nullable
as AffineTransform,localToWgs84: null == localToWgs84 ? _self.localToWgs84 : localToWgs84 // ignore: cast_nullable_to_non_nullable
as AffineTransform,utmToLocal: null == utmToLocal ? _self.utmToLocal : utmToLocal // ignore: cast_nullable_to_non_nullable
as AffineTransform,localToUtm: null == localToUtm ? _self.localToUtm : localToUtm // ignore: cast_nullable_to_non_nullable
as AffineTransform,projectiveWgs84ToLocal: freezed == projectiveWgs84ToLocal ? _self.projectiveWgs84ToLocal : projectiveWgs84ToLocal // ignore: cast_nullable_to_non_nullable
as ProjectiveTransform?,projectiveLocalToWgs84: freezed == projectiveLocalToWgs84 ? _self.projectiveLocalToWgs84 : projectiveLocalToWgs84 // ignore: cast_nullable_to_non_nullable
as ProjectiveTransform?,calibratedAt: null == calibratedAt ? _self.calibratedAt : calibratedAt // ignore: cast_nullable_to_non_nullable
as DateTime,calibrationMethod: freezed == calibrationMethod ? _self.calibrationMethod : calibrationMethod // ignore: cast_nullable_to_non_nullable
as String?,groundControlPointsWgs84: freezed == groundControlPointsWgs84 ? _self._groundControlPointsWgs84 : groundControlPointsWgs84 // ignore: cast_nullable_to_non_nullable
as List<LatLngCoordinate>?,groundControlPointsLocal: freezed == groundControlPointsLocal ? _self._groundControlPointsLocal : groundControlPointsLocal // ignore: cast_nullable_to_non_nullable
as List<LocalCartesianCoordinate>?,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

/// Create a copy of CampusGeoreference
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LatLngCoordinateCopyWith<$Res> get wgs84Origin {
  
  return $LatLngCoordinateCopyWith<$Res>(_self.wgs84Origin, (value) {
    return _then(_self.copyWith(wgs84Origin: value));
  });
}/// Create a copy of CampusGeoreference
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UtmCoordinateCopyWith<$Res> get utmOrigin {
  
  return $UtmCoordinateCopyWith<$Res>(_self.utmOrigin, (value) {
    return _then(_self.copyWith(utmOrigin: value));
  });
}/// Create a copy of CampusGeoreference
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalCartesianCoordinateCopyWith<$Res> get localOrigin {
  
  return $LocalCartesianCoordinateCopyWith<$Res>(_self.localOrigin, (value) {
    return _then(_self.copyWith(localOrigin: value));
  });
}/// Create a copy of CampusGeoreference
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AffineTransformCopyWith<$Res> get wgs84ToLocal {
  
  return $AffineTransformCopyWith<$Res>(_self.wgs84ToLocal, (value) {
    return _then(_self.copyWith(wgs84ToLocal: value));
  });
}/// Create a copy of CampusGeoreference
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AffineTransformCopyWith<$Res> get localToWgs84 {
  
  return $AffineTransformCopyWith<$Res>(_self.localToWgs84, (value) {
    return _then(_self.copyWith(localToWgs84: value));
  });
}/// Create a copy of CampusGeoreference
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AffineTransformCopyWith<$Res> get utmToLocal {
  
  return $AffineTransformCopyWith<$Res>(_self.utmToLocal, (value) {
    return _then(_self.copyWith(utmToLocal: value));
  });
}/// Create a copy of CampusGeoreference
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AffineTransformCopyWith<$Res> get localToUtm {
  
  return $AffineTransformCopyWith<$Res>(_self.localToUtm, (value) {
    return _then(_self.copyWith(localToUtm: value));
  });
}/// Create a copy of CampusGeoreference
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectiveTransformCopyWith<$Res>? get projectiveWgs84ToLocal {
    if (_self.projectiveWgs84ToLocal == null) {
    return null;
  }

  return $ProjectiveTransformCopyWith<$Res>(_self.projectiveWgs84ToLocal!, (value) {
    return _then(_self.copyWith(projectiveWgs84ToLocal: value));
  });
}/// Create a copy of CampusGeoreference
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectiveTransformCopyWith<$Res>? get projectiveLocalToWgs84 {
    if (_self.projectiveLocalToWgs84 == null) {
    return null;
  }

  return $ProjectiveTransformCopyWith<$Res>(_self.projectiveLocalToWgs84!, (value) {
    return _then(_self.copyWith(projectiveLocalToWgs84: value));
  });
}
}

TransformResult _$TransformResultFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'success':
          return _TransformSuccess.fromJson(
            json
          );
                case 'failure':
          return _TransformFailure.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'TransformResult',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$TransformResult {



  /// Serializes this TransformResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TransformResult);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'TransformResult()';
}


}

/// @nodoc
class $TransformResultCopyWith<$Res>  {
$TransformResultCopyWith(TransformResult _, $Res Function(TransformResult) __);
}


/// Adds pattern-matching-related methods to [TransformResult].
extension TransformResultPatterns on TransformResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _TransformSuccess value)?  success,TResult Function( _TransformFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransformSuccess() when success != null:
return success(_that);case _TransformFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _TransformSuccess value)  success,required TResult Function( _TransformFailure value)  failure,}){
final _that = this;
switch (_that) {
case _TransformSuccess():
return success(_that);case _TransformFailure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _TransformSuccess value)?  success,TResult? Function( _TransformFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _TransformSuccess() when success != null:
return success(_that);case _TransformFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( dynamic value,  double? accuracyMeters,  String? method)?  success,TResult Function( String error,  String? code,  Map<String, dynamic>? details)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransformSuccess() when success != null:
return success(_that.value,_that.accuracyMeters,_that.method);case _TransformFailure() when failure != null:
return failure(_that.error,_that.code,_that.details);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( dynamic value,  double? accuracyMeters,  String? method)  success,required TResult Function( String error,  String? code,  Map<String, dynamic>? details)  failure,}) {final _that = this;
switch (_that) {
case _TransformSuccess():
return success(_that.value,_that.accuracyMeters,_that.method);case _TransformFailure():
return failure(_that.error,_that.code,_that.details);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( dynamic value,  double? accuracyMeters,  String? method)?  success,TResult? Function( String error,  String? code,  Map<String, dynamic>? details)?  failure,}) {final _that = this;
switch (_that) {
case _TransformSuccess() when success != null:
return success(_that.value,_that.accuracyMeters,_that.method);case _TransformFailure() when failure != null:
return failure(_that.error,_that.code,_that.details);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransformSuccess implements TransformResult {
  const _TransformSuccess({required this.value, this.accuracyMeters, this.method,  String? $type}): $type = $type ?? 'success';
  factory _TransformSuccess.fromJson(Map<String, dynamic> json) => _$TransformSuccessFromJson(json);

 final  dynamic value;
 final  double? accuracyMeters;
 final  String? method;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of TransformResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransformSuccessCopyWith<_TransformSuccess> get copyWith => __$TransformSuccessCopyWithImpl<_TransformSuccess>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransformSuccessToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransformSuccess&&const DeepCollectionEquality().equals(other.value, value)&&(identical(other.accuracyMeters, accuracyMeters) || other.accuracyMeters == accuracyMeters)&&(identical(other.method, method) || other.method == method));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(value),accuracyMeters,method);
}

@override
String toString() {
    return 'TransformResult.success(value: $value, accuracyMeters: $accuracyMeters, method: $method)';
}


}

/// @nodoc
abstract mixin class _$TransformSuccessCopyWith<$Res> implements $TransformResultCopyWith<$Res> {
  factory _$TransformSuccessCopyWith(_TransformSuccess value, $Res Function(_TransformSuccess) _then) = __$TransformSuccessCopyWithImpl;
@useResult
$Res call({
 dynamic value, double? accuracyMeters, String? method
});




}
/// @nodoc
class __$TransformSuccessCopyWithImpl<$Res>
    implements _$TransformSuccessCopyWith<$Res> {
  __$TransformSuccessCopyWithImpl(this._self, this._then);

  final _TransformSuccess _self;
  final $Res Function(_TransformSuccess) _then;

/// Create a copy of TransformResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = freezed,Object? accuracyMeters = freezed,Object? method = freezed,}) {
  return _then(_TransformSuccess(
value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as dynamic,accuracyMeters: freezed == accuracyMeters ? _self.accuracyMeters : accuracyMeters // ignore: cast_nullable_to_non_nullable
as double?,method: freezed == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _TransformFailure implements TransformResult {
  const _TransformFailure({required this.error, this.code,  Map<String, dynamic>? details,  String? $type}): _details = details,$type = $type ?? 'failure';
  factory _TransformFailure.fromJson(Map<String, dynamic> json) => _$TransformFailureFromJson(json);

 final  String error;
 final  String? code;
 final  Map<String, dynamic>? _details;
 Map<String, dynamic>? get details {
  final value = _details;
  if (value == null) return null;
  if (_details is EqualUnmodifiableMapView) return _details;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of TransformResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransformFailureCopyWith<_TransformFailure> get copyWith => __$TransformFailureCopyWithImpl<_TransformFailure>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransformFailureToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransformFailure&&(identical(other.error, error) || other.error == error)&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other.details, _details));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,error,code,const DeepCollectionEquality().hash(_details));
}

@override
String toString() {
    return 'TransformResult.failure(error: $error, code: $code, details: $details)';
}


}

/// @nodoc
abstract mixin class _$TransformFailureCopyWith<$Res> implements $TransformResultCopyWith<$Res> {
  factory _$TransformFailureCopyWith(_TransformFailure value, $Res Function(_TransformFailure) _then) = __$TransformFailureCopyWithImpl;
@useResult
$Res call({
 String error, String? code, Map<String, dynamic>? details
});




}
/// @nodoc
class __$TransformFailureCopyWithImpl<$Res>
    implements _$TransformFailureCopyWith<$Res> {
  __$TransformFailureCopyWithImpl(this._self, this._then);

  final _TransformFailure _self;
  final $Res Function(_TransformFailure) _then;

/// Create a copy of TransformResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,Object? code = freezed,Object? details = freezed,}) {
  return _then(_TransformFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,details: freezed == details ? _self._details : details // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$TransformAccuracy {

 double get meanError; double get rmse; double get maxError; int get pointCount;
/// Create a copy of TransformAccuracy
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransformAccuracyCopyWith<TransformAccuracy> get copyWith => _$TransformAccuracyCopyWithImpl<TransformAccuracy>(this as TransformAccuracy, _$identity);

  /// Serializes this TransformAccuracy to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TransformAccuracy;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransformAccuracy&&(identical(other.meanError, _this.meanError) || other.meanError == _this.meanError)&&(identical(other.rmse, _this.rmse) || other.rmse == _this.rmse)&&(identical(other.maxError, _this.maxError) || other.maxError == _this.maxError)&&(identical(other.pointCount, _this.pointCount) || other.pointCount == _this.pointCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TransformAccuracy;
  return Object.hash(runtimeType,_this.meanError,_this.rmse,_this.maxError,_this.pointCount);
}

@override
String toString() {
  final _this = this as TransformAccuracy;
  return 'TransformAccuracy(meanError: ${_this.meanError}, rmse: ${_this.rmse}, maxError: ${_this.maxError}, pointCount: ${_this.pointCount})';
}


}

/// @nodoc
abstract mixin class $TransformAccuracyCopyWith<$Res>  {
  factory $TransformAccuracyCopyWith(TransformAccuracy value, $Res Function(TransformAccuracy) _then) = _$TransformAccuracyCopyWithImpl;
@useResult
$Res call({
 double meanError, double rmse, double maxError, int pointCount
});




}
/// @nodoc
class _$TransformAccuracyCopyWithImpl<$Res>
    implements $TransformAccuracyCopyWith<$Res> {
  _$TransformAccuracyCopyWithImpl(this._self, this._then);

  final TransformAccuracy _self;
  final $Res Function(TransformAccuracy) _then;

/// Create a copy of TransformAccuracy
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? meanError = null,Object? rmse = null,Object? maxError = null,Object? pointCount = null,}) {
  return _then(TransformAccuracy(
meanError: null == meanError ? _self.meanError : meanError // ignore: cast_nullable_to_non_nullable
as double,rmse: null == rmse ? _self.rmse : rmse // ignore: cast_nullable_to_non_nullable
as double,maxError: null == maxError ? _self.maxError : maxError // ignore: cast_nullable_to_non_nullable
as double,pointCount: null == pointCount ? _self.pointCount : pointCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TransformAccuracy].
extension TransformAccuracyPatterns on TransformAccuracy {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransformAccuracy value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransformAccuracy() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransformAccuracy value)  $default,){
final _that = this;
switch (_that) {
case _TransformAccuracy():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransformAccuracy value)?  $default,){
final _that = this;
switch (_that) {
case _TransformAccuracy() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double meanError,  double rmse,  double maxError,  int pointCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransformAccuracy() when $default != null:
return $default(_that.meanError,_that.rmse,_that.maxError,_that.pointCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double meanError,  double rmse,  double maxError,  int pointCount)  $default,) {final _that = this;
switch (_that) {
case _TransformAccuracy():
return $default(_that.meanError,_that.rmse,_that.maxError,_that.pointCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double meanError,  double rmse,  double maxError,  int pointCount)?  $default,) {final _that = this;
switch (_that) {
case _TransformAccuracy() when $default != null:
return $default(_that.meanError,_that.rmse,_that.maxError,_that.pointCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransformAccuracy implements TransformAccuracy {
  const _TransformAccuracy({required this.meanError, required this.rmse, required this.maxError, required this.pointCount});
  factory _TransformAccuracy.fromJson(Map<String, dynamic> json) => _$TransformAccuracyFromJson(json);

@override final  double meanError;
@override final  double rmse;
@override final  double maxError;
@override final  int pointCount;

/// Create a copy of TransformAccuracy
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransformAccuracyCopyWith<_TransformAccuracy> get copyWith => __$TransformAccuracyCopyWithImpl<_TransformAccuracy>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransformAccuracyToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransformAccuracy&&(identical(other.meanError, meanError) || other.meanError == meanError)&&(identical(other.rmse, rmse) || other.rmse == rmse)&&(identical(other.maxError, maxError) || other.maxError == maxError)&&(identical(other.pointCount, pointCount) || other.pointCount == pointCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,meanError,rmse,maxError,pointCount);
}

@override
String toString() {
    return 'TransformAccuracy(meanError: $meanError, rmse: $rmse, maxError: $maxError, pointCount: $pointCount)';
}


}

/// @nodoc
abstract mixin class _$TransformAccuracyCopyWith<$Res> implements $TransformAccuracyCopyWith<$Res> {
  factory _$TransformAccuracyCopyWith(_TransformAccuracy value, $Res Function(_TransformAccuracy) _then) = __$TransformAccuracyCopyWithImpl;
@override @useResult
$Res call({
 double meanError, double rmse, double maxError, int pointCount
});




}
/// @nodoc
class __$TransformAccuracyCopyWithImpl<$Res>
    implements _$TransformAccuracyCopyWith<$Res> {
  __$TransformAccuracyCopyWithImpl(this._self, this._then);

  final _TransformAccuracy _self;
  final $Res Function(_TransformAccuracy) _then;

/// Create a copy of TransformAccuracy
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? meanError = null,Object? rmse = null,Object? maxError = null,Object? pointCount = null,}) {
  return _then(_TransformAccuracy(
meanError: null == meanError ? _self.meanError : meanError // ignore: cast_nullable_to_non_nullable
as double,rmse: null == rmse ? _self.rmse : rmse // ignore: cast_nullable_to_non_nullable
as double,maxError: null == maxError ? _self.maxError : maxError // ignore: cast_nullable_to_non_nullable
as double,pointCount: null == pointCount ? _self.pointCount : pointCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
