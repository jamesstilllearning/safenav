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
mixin _$StartPointType {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is StartPointType);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'StartPointType()';
}


}

/// @nodoc
class $StartPointTypeCopyWith<$Res>  {
$StartPointTypeCopyWith(StartPointType _, $Res Function(StartPointType) __);
}


/// Adds pattern-matching-related methods to [StartPointType].
extension StartPointTypePatterns on StartPointType {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Indoor value)?  indoor,TResult Function( _Outdoor value)?  outdoor,TResult Function( _CurrentLocation value)?  currentLocation,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Indoor() when indoor != null:
return indoor(_that);case _Outdoor() when outdoor != null:
return outdoor(_that);case _CurrentLocation() when currentLocation != null:
return currentLocation(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Indoor value)  indoor,required TResult Function( _Outdoor value)  outdoor,required TResult Function( _CurrentLocation value)  currentLocation,}){
final _that = this;
switch (_that) {
case _Indoor():
return indoor(_that);case _Outdoor():
return outdoor(_that);case _CurrentLocation():
return currentLocation(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Indoor value)?  indoor,TResult? Function( _Outdoor value)?  outdoor,TResult? Function( _CurrentLocation value)?  currentLocation,}){
final _that = this;
switch (_that) {
case _Indoor() when indoor != null:
return indoor(_that);case _Outdoor() when outdoor != null:
return outdoor(_that);case _CurrentLocation() when currentLocation != null:
return currentLocation(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  indoor,TResult Function()?  outdoor,TResult Function()?  currentLocation,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Indoor() when indoor != null:
return indoor();case _Outdoor() when outdoor != null:
return outdoor();case _CurrentLocation() when currentLocation != null:
return currentLocation();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  indoor,required TResult Function()  outdoor,required TResult Function()  currentLocation,}) {final _that = this;
switch (_that) {
case _Indoor():
return indoor();case _Outdoor():
return outdoor();case _CurrentLocation():
return currentLocation();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  indoor,TResult? Function()?  outdoor,TResult? Function()?  currentLocation,}) {final _that = this;
switch (_that) {
case _Indoor() when indoor != null:
return indoor();case _Outdoor() when outdoor != null:
return outdoor();case _CurrentLocation() when currentLocation != null:
return currentLocation();case _:
  return null;

}
}

}

/// @nodoc


class _Indoor implements StartPointType {
  const _Indoor();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Indoor);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'StartPointType.indoor()';
}


}




/// @nodoc


class _Outdoor implements StartPointType {
  const _Outdoor();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Outdoor);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'StartPointType.outdoor()';
}


}




/// @nodoc


class _CurrentLocation implements StartPointType {
  const _CurrentLocation();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrentLocation);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'StartPointType.currentLocation()';
}


}





/// @nodoc
mixin _$IndoorStartPoint {

 String get buildingId; String get floorId; String? get roomId; String? get roomName; LatLng? get coordinates; String? get description; Map<String, dynamic>? get metadata;
/// Create a copy of IndoorStartPoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IndoorStartPointCopyWith<IndoorStartPoint> get copyWith => _$IndoorStartPointCopyWithImpl<IndoorStartPoint>(this as IndoorStartPoint, _$identity);

  /// Serializes this IndoorStartPoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as IndoorStartPoint;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IndoorStartPoint&&(identical(other.buildingId, _this.buildingId) || other.buildingId == _this.buildingId)&&(identical(other.floorId, _this.floorId) || other.floorId == _this.floorId)&&(identical(other.roomId, _this.roomId) || other.roomId == _this.roomId)&&(identical(other.roomName, _this.roomName) || other.roomName == _this.roomName)&&(identical(other.coordinates, _this.coordinates) || other.coordinates == _this.coordinates)&&(identical(other.description, _this.description) || other.description == _this.description)&&const DeepCollectionEquality().equals(other.metadata, _this.metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as IndoorStartPoint;
  return Object.hash(runtimeType,_this.buildingId,_this.floorId,_this.roomId,_this.roomName,_this.coordinates,_this.description,const DeepCollectionEquality().hash(_this.metadata));
}

@override
String toString() {
  final _this = this as IndoorStartPoint;
  return 'IndoorStartPoint(buildingId: ${_this.buildingId}, floorId: ${_this.floorId}, roomId: ${_this.roomId}, roomName: ${_this.roomName}, coordinates: ${_this.coordinates}, description: ${_this.description}, metadata: ${_this.metadata})';
}


}

/// @nodoc
abstract mixin class $IndoorStartPointCopyWith<$Res>  {
  factory $IndoorStartPointCopyWith(IndoorStartPoint value, $Res Function(IndoorStartPoint) _then) = _$IndoorStartPointCopyWithImpl;
@useResult
$Res call({
 String buildingId, String floorId, String? roomId, String? roomName, LatLng? coordinates, String? description, Map<String, dynamic>? metadata
});




}
/// @nodoc
class _$IndoorStartPointCopyWithImpl<$Res>
    implements $IndoorStartPointCopyWith<$Res> {
  _$IndoorStartPointCopyWithImpl(this._self, this._then);

  final IndoorStartPoint _self;
  final $Res Function(IndoorStartPoint) _then;

/// Create a copy of IndoorStartPoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? buildingId = null,Object? floorId = null,Object? roomId = freezed,Object? roomName = freezed,Object? coordinates = freezed,Object? description = freezed,Object? metadata = freezed,}) {
  return _then(IndoorStartPoint(
buildingId: null == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as String,floorId: null == floorId ? _self.floorId : floorId // ignore: cast_nullable_to_non_nullable
as String,roomId: freezed == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String?,roomName: freezed == roomName ? _self.roomName : roomName // ignore: cast_nullable_to_non_nullable
as String?,coordinates: freezed == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as LatLng?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [IndoorStartPoint].
extension IndoorStartPointPatterns on IndoorStartPoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IndoorStartPoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IndoorStartPoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IndoorStartPoint value)  $default,){
final _that = this;
switch (_that) {
case _IndoorStartPoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IndoorStartPoint value)?  $default,){
final _that = this;
switch (_that) {
case _IndoorStartPoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String buildingId,  String floorId,  String? roomId,  String? roomName,  LatLng? coordinates,  String? description,  Map<String, dynamic>? metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IndoorStartPoint() when $default != null:
return $default(_that.buildingId,_that.floorId,_that.roomId,_that.roomName,_that.coordinates,_that.description,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String buildingId,  String floorId,  String? roomId,  String? roomName,  LatLng? coordinates,  String? description,  Map<String, dynamic>? metadata)  $default,) {final _that = this;
switch (_that) {
case _IndoorStartPoint():
return $default(_that.buildingId,_that.floorId,_that.roomId,_that.roomName,_that.coordinates,_that.description,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String buildingId,  String floorId,  String? roomId,  String? roomName,  LatLng? coordinates,  String? description,  Map<String, dynamic>? metadata)?  $default,) {final _that = this;
switch (_that) {
case _IndoorStartPoint() when $default != null:
return $default(_that.buildingId,_that.floorId,_that.roomId,_that.roomName,_that.coordinates,_that.description,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IndoorStartPoint extends IndoorStartPoint {
  const _IndoorStartPoint({required this.buildingId, required this.floorId, this.roomId, this.roomName, this.coordinates, this.description,  Map<String, dynamic>? metadata}): _metadata = metadata,super._();
  factory _IndoorStartPoint.fromJson(Map<String, dynamic> json) => _$IndoorStartPointFromJson(json);

@override final  String buildingId;
@override final  String floorId;
@override final  String? roomId;
@override final  String? roomName;
@override final  LatLng? coordinates;
@override final  String? description;
 final  Map<String, dynamic>? _metadata;
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of IndoorStartPoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IndoorStartPointCopyWith<_IndoorStartPoint> get copyWith => __$IndoorStartPointCopyWithImpl<_IndoorStartPoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IndoorStartPointToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _IndoorStartPoint&&(identical(other.buildingId, buildingId) || other.buildingId == buildingId)&&(identical(other.floorId, floorId) || other.floorId == floorId)&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.roomName, roomName) || other.roomName == roomName)&&(identical(other.coordinates, coordinates) || other.coordinates == coordinates)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,buildingId,floorId,roomId,roomName,coordinates,description,const DeepCollectionEquality().hash(_metadata));
}

@override
String toString() {
    return 'IndoorStartPoint(buildingId: $buildingId, floorId: $floorId, roomId: $roomId, roomName: $roomName, coordinates: $coordinates, description: $description, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$IndoorStartPointCopyWith<$Res> implements $IndoorStartPointCopyWith<$Res> {
  factory _$IndoorStartPointCopyWith(_IndoorStartPoint value, $Res Function(_IndoorStartPoint) _then) = __$IndoorStartPointCopyWithImpl;
@override @useResult
$Res call({
 String buildingId, String floorId, String? roomId, String? roomName, LatLng? coordinates, String? description, Map<String, dynamic>? metadata
});




}
/// @nodoc
class __$IndoorStartPointCopyWithImpl<$Res>
    implements _$IndoorStartPointCopyWith<$Res> {
  __$IndoorStartPointCopyWithImpl(this._self, this._then);

  final _IndoorStartPoint _self;
  final $Res Function(_IndoorStartPoint) _then;

/// Create a copy of IndoorStartPoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? buildingId = null,Object? floorId = null,Object? roomId = freezed,Object? roomName = freezed,Object? coordinates = freezed,Object? description = freezed,Object? metadata = freezed,}) {
  return _then(_IndoorStartPoint(
buildingId: null == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as String,floorId: null == floorId ? _self.floorId : floorId // ignore: cast_nullable_to_non_nullable
as String,roomId: freezed == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String?,roomName: freezed == roomName ? _self.roomName : roomName // ignore: cast_nullable_to_non_nullable
as String?,coordinates: freezed == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as LatLng?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$OutdoorStartPoint {

 LatLng get coordinates; double? get accuracy; double? get altitude; double? get heading; double? get speed; String? get address; String? get placeName; DateTime? get timestamp; Map<String, dynamic>? get metadata;
/// Create a copy of OutdoorStartPoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutdoorStartPointCopyWith<OutdoorStartPoint> get copyWith => _$OutdoorStartPointCopyWithImpl<OutdoorStartPoint>(this as OutdoorStartPoint, _$identity);

  /// Serializes this OutdoorStartPoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OutdoorStartPoint;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutdoorStartPoint&&(identical(other.coordinates, _this.coordinates) || other.coordinates == _this.coordinates)&&(identical(other.accuracy, _this.accuracy) || other.accuracy == _this.accuracy)&&(identical(other.altitude, _this.altitude) || other.altitude == _this.altitude)&&(identical(other.heading, _this.heading) || other.heading == _this.heading)&&(identical(other.speed, _this.speed) || other.speed == _this.speed)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.placeName, _this.placeName) || other.placeName == _this.placeName)&&(identical(other.timestamp, _this.timestamp) || other.timestamp == _this.timestamp)&&const DeepCollectionEquality().equals(other.metadata, _this.metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OutdoorStartPoint;
  return Object.hash(runtimeType,_this.coordinates,_this.accuracy,_this.altitude,_this.heading,_this.speed,_this.address,_this.placeName,_this.timestamp,const DeepCollectionEquality().hash(_this.metadata));
}

@override
String toString() {
  final _this = this as OutdoorStartPoint;
  return 'OutdoorStartPoint(coordinates: ${_this.coordinates}, accuracy: ${_this.accuracy}, altitude: ${_this.altitude}, heading: ${_this.heading}, speed: ${_this.speed}, address: ${_this.address}, placeName: ${_this.placeName}, timestamp: ${_this.timestamp}, metadata: ${_this.metadata})';
}


}

/// @nodoc
abstract mixin class $OutdoorStartPointCopyWith<$Res>  {
  factory $OutdoorStartPointCopyWith(OutdoorStartPoint value, $Res Function(OutdoorStartPoint) _then) = _$OutdoorStartPointCopyWithImpl;
@useResult
$Res call({
 LatLng coordinates, double? accuracy, double? altitude, double? heading, double? speed, String? address, String? placeName, DateTime? timestamp, Map<String, dynamic>? metadata
});




}
/// @nodoc
class _$OutdoorStartPointCopyWithImpl<$Res>
    implements $OutdoorStartPointCopyWith<$Res> {
  _$OutdoorStartPointCopyWithImpl(this._self, this._then);

  final OutdoorStartPoint _self;
  final $Res Function(OutdoorStartPoint) _then;

/// Create a copy of OutdoorStartPoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? coordinates = null,Object? accuracy = freezed,Object? altitude = freezed,Object? heading = freezed,Object? speed = freezed,Object? address = freezed,Object? placeName = freezed,Object? timestamp = freezed,Object? metadata = freezed,}) {
  return _then(OutdoorStartPoint(
coordinates: null == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as LatLng,accuracy: freezed == accuracy ? _self.accuracy : accuracy // ignore: cast_nullable_to_non_nullable
as double?,altitude: freezed == altitude ? _self.altitude : altitude // ignore: cast_nullable_to_non_nullable
as double?,heading: freezed == heading ? _self.heading : heading // ignore: cast_nullable_to_non_nullable
as double?,speed: freezed == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,placeName: freezed == placeName ? _self.placeName : placeName // ignore: cast_nullable_to_non_nullable
as String?,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [OutdoorStartPoint].
extension OutdoorStartPointPatterns on OutdoorStartPoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OutdoorStartPoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OutdoorStartPoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OutdoorStartPoint value)  $default,){
final _that = this;
switch (_that) {
case _OutdoorStartPoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OutdoorStartPoint value)?  $default,){
final _that = this;
switch (_that) {
case _OutdoorStartPoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LatLng coordinates,  double? accuracy,  double? altitude,  double? heading,  double? speed,  String? address,  String? placeName,  DateTime? timestamp,  Map<String, dynamic>? metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OutdoorStartPoint() when $default != null:
return $default(_that.coordinates,_that.accuracy,_that.altitude,_that.heading,_that.speed,_that.address,_that.placeName,_that.timestamp,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LatLng coordinates,  double? accuracy,  double? altitude,  double? heading,  double? speed,  String? address,  String? placeName,  DateTime? timestamp,  Map<String, dynamic>? metadata)  $default,) {final _that = this;
switch (_that) {
case _OutdoorStartPoint():
return $default(_that.coordinates,_that.accuracy,_that.altitude,_that.heading,_that.speed,_that.address,_that.placeName,_that.timestamp,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LatLng coordinates,  double? accuracy,  double? altitude,  double? heading,  double? speed,  String? address,  String? placeName,  DateTime? timestamp,  Map<String, dynamic>? metadata)?  $default,) {final _that = this;
switch (_that) {
case _OutdoorStartPoint() when $default != null:
return $default(_that.coordinates,_that.accuracy,_that.altitude,_that.heading,_that.speed,_that.address,_that.placeName,_that.timestamp,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OutdoorStartPoint extends OutdoorStartPoint {
  const _OutdoorStartPoint({required this.coordinates, this.accuracy, this.altitude, this.heading, this.speed, this.address, this.placeName, this.timestamp,  Map<String, dynamic>? metadata}): _metadata = metadata,super._();
  factory _OutdoorStartPoint.fromJson(Map<String, dynamic> json) => _$OutdoorStartPointFromJson(json);

@override final  LatLng coordinates;
@override final  double? accuracy;
@override final  double? altitude;
@override final  double? heading;
@override final  double? speed;
@override final  String? address;
@override final  String? placeName;
@override final  DateTime? timestamp;
 final  Map<String, dynamic>? _metadata;
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of OutdoorStartPoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OutdoorStartPointCopyWith<_OutdoorStartPoint> get copyWith => __$OutdoorStartPointCopyWithImpl<_OutdoorStartPoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OutdoorStartPointToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OutdoorStartPoint&&(identical(other.coordinates, coordinates) || other.coordinates == coordinates)&&(identical(other.accuracy, accuracy) || other.accuracy == accuracy)&&(identical(other.altitude, altitude) || other.altitude == altitude)&&(identical(other.heading, heading) || other.heading == heading)&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.address, address) || other.address == address)&&(identical(other.placeName, placeName) || other.placeName == placeName)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&const DeepCollectionEquality().equals(other.metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,coordinates,accuracy,altitude,heading,speed,address,placeName,timestamp,const DeepCollectionEquality().hash(_metadata));
}

@override
String toString() {
    return 'OutdoorStartPoint(coordinates: $coordinates, accuracy: $accuracy, altitude: $altitude, heading: $heading, speed: $speed, address: $address, placeName: $placeName, timestamp: $timestamp, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$OutdoorStartPointCopyWith<$Res> implements $OutdoorStartPointCopyWith<$Res> {
  factory _$OutdoorStartPointCopyWith(_OutdoorStartPoint value, $Res Function(_OutdoorStartPoint) _then) = __$OutdoorStartPointCopyWithImpl;
@override @useResult
$Res call({
 LatLng coordinates, double? accuracy, double? altitude, double? heading, double? speed, String? address, String? placeName, DateTime? timestamp, Map<String, dynamic>? metadata
});




}
/// @nodoc
class __$OutdoorStartPointCopyWithImpl<$Res>
    implements _$OutdoorStartPointCopyWith<$Res> {
  __$OutdoorStartPointCopyWithImpl(this._self, this._then);

  final _OutdoorStartPoint _self;
  final $Res Function(_OutdoorStartPoint) _then;

/// Create a copy of OutdoorStartPoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? coordinates = null,Object? accuracy = freezed,Object? altitude = freezed,Object? heading = freezed,Object? speed = freezed,Object? address = freezed,Object? placeName = freezed,Object? timestamp = freezed,Object? metadata = freezed,}) {
  return _then(_OutdoorStartPoint(
coordinates: null == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as LatLng,accuracy: freezed == accuracy ? _self.accuracy : accuracy // ignore: cast_nullable_to_non_nullable
as double?,altitude: freezed == altitude ? _self.altitude : altitude // ignore: cast_nullable_to_non_nullable
as double?,heading: freezed == heading ? _self.heading : heading // ignore: cast_nullable_to_non_nullable
as double?,speed: freezed == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,placeName: freezed == placeName ? _self.placeName : placeName // ignore: cast_nullable_to_non_nullable
as String?,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

NavigationStartPoint _$NavigationStartPointFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'indoor':
          return _IndoorStartPointWrapper.fromJson(
            json
          );
                case 'outdoor':
          return _OutdoorStartPointWrapper.fromJson(
            json
          );
                case 'currentLocation':
          return _CurrentLocationStartPoint.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'NavigationStartPoint',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$NavigationStartPoint {



  /// Serializes this NavigationStartPoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigationStartPoint);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'NavigationStartPoint()';
}


}

/// @nodoc
class $NavigationStartPointCopyWith<$Res>  {
$NavigationStartPointCopyWith(NavigationStartPoint _, $Res Function(NavigationStartPoint) __);
}


/// Adds pattern-matching-related methods to [NavigationStartPoint].
extension NavigationStartPointPatterns on NavigationStartPoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _IndoorStartPointWrapper value)?  indoor,TResult Function( _OutdoorStartPointWrapper value)?  outdoor,TResult Function( _CurrentLocationStartPoint value)?  currentLocation,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IndoorStartPointWrapper() when indoor != null:
return indoor(_that);case _OutdoorStartPointWrapper() when outdoor != null:
return outdoor(_that);case _CurrentLocationStartPoint() when currentLocation != null:
return currentLocation(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _IndoorStartPointWrapper value)  indoor,required TResult Function( _OutdoorStartPointWrapper value)  outdoor,required TResult Function( _CurrentLocationStartPoint value)  currentLocation,}){
final _that = this;
switch (_that) {
case _IndoorStartPointWrapper():
return indoor(_that);case _OutdoorStartPointWrapper():
return outdoor(_that);case _CurrentLocationStartPoint():
return currentLocation(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _IndoorStartPointWrapper value)?  indoor,TResult? Function( _OutdoorStartPointWrapper value)?  outdoor,TResult? Function( _CurrentLocationStartPoint value)?  currentLocation,}){
final _that = this;
switch (_that) {
case _IndoorStartPointWrapper() when indoor != null:
return indoor(_that);case _OutdoorStartPointWrapper() when outdoor != null:
return outdoor(_that);case _CurrentLocationStartPoint() when currentLocation != null:
return currentLocation(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( IndoorStartPoint indoor)?  indoor,TResult Function( OutdoorStartPoint outdoor)?  outdoor,TResult Function( LatLng coordinates,  double? accuracy)?  currentLocation,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IndoorStartPointWrapper() when indoor != null:
return indoor(_that.indoor);case _OutdoorStartPointWrapper() when outdoor != null:
return outdoor(_that.outdoor);case _CurrentLocationStartPoint() when currentLocation != null:
return currentLocation(_that.coordinates,_that.accuracy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( IndoorStartPoint indoor)  indoor,required TResult Function( OutdoorStartPoint outdoor)  outdoor,required TResult Function( LatLng coordinates,  double? accuracy)  currentLocation,}) {final _that = this;
switch (_that) {
case _IndoorStartPointWrapper():
return indoor(_that.indoor);case _OutdoorStartPointWrapper():
return outdoor(_that.outdoor);case _CurrentLocationStartPoint():
return currentLocation(_that.coordinates,_that.accuracy);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( IndoorStartPoint indoor)?  indoor,TResult? Function( OutdoorStartPoint outdoor)?  outdoor,TResult? Function( LatLng coordinates,  double? accuracy)?  currentLocation,}) {final _that = this;
switch (_that) {
case _IndoorStartPointWrapper() when indoor != null:
return indoor(_that.indoor);case _OutdoorStartPointWrapper() when outdoor != null:
return outdoor(_that.outdoor);case _CurrentLocationStartPoint() when currentLocation != null:
return currentLocation(_that.coordinates,_that.accuracy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IndoorStartPointWrapper extends NavigationStartPoint {
  const _IndoorStartPointWrapper(this.indoor, { String? $type}): $type = $type ?? 'indoor',super._();
  factory _IndoorStartPointWrapper.fromJson(Map<String, dynamic> json) => _$IndoorStartPointWrapperFromJson(json);

 final  IndoorStartPoint indoor;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of NavigationStartPoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IndoorStartPointWrapperCopyWith<_IndoorStartPointWrapper> get copyWith => __$IndoorStartPointWrapperCopyWithImpl<_IndoorStartPointWrapper>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IndoorStartPointWrapperToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _IndoorStartPointWrapper&&(identical(other.indoor, indoor) || other.indoor == indoor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,indoor);
}

@override
String toString() {
    return 'NavigationStartPoint.indoor(indoor: $indoor)';
}


}

/// @nodoc
abstract mixin class _$IndoorStartPointWrapperCopyWith<$Res> implements $NavigationStartPointCopyWith<$Res> {
  factory _$IndoorStartPointWrapperCopyWith(_IndoorStartPointWrapper value, $Res Function(_IndoorStartPointWrapper) _then) = __$IndoorStartPointWrapperCopyWithImpl;
@useResult
$Res call({
 IndoorStartPoint indoor
});


$IndoorStartPointCopyWith<$Res> get indoor;

}
/// @nodoc
class __$IndoorStartPointWrapperCopyWithImpl<$Res>
    implements _$IndoorStartPointWrapperCopyWith<$Res> {
  __$IndoorStartPointWrapperCopyWithImpl(this._self, this._then);

  final _IndoorStartPointWrapper _self;
  final $Res Function(_IndoorStartPointWrapper) _then;

/// Create a copy of NavigationStartPoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? indoor = null,}) {
  return _then(_IndoorStartPointWrapper(
null == indoor ? _self.indoor : indoor // ignore: cast_nullable_to_non_nullable
as IndoorStartPoint,
  ));
}

/// Create a copy of NavigationStartPoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IndoorStartPointCopyWith<$Res> get indoor {
  
  return $IndoorStartPointCopyWith<$Res>(_self.indoor, (value) {
    return _then(_self.copyWith(indoor: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class _OutdoorStartPointWrapper extends NavigationStartPoint {
  const _OutdoorStartPointWrapper(this.outdoor, { String? $type}): $type = $type ?? 'outdoor',super._();
  factory _OutdoorStartPointWrapper.fromJson(Map<String, dynamic> json) => _$OutdoorStartPointWrapperFromJson(json);

 final  OutdoorStartPoint outdoor;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of NavigationStartPoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OutdoorStartPointWrapperCopyWith<_OutdoorStartPointWrapper> get copyWith => __$OutdoorStartPointWrapperCopyWithImpl<_OutdoorStartPointWrapper>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OutdoorStartPointWrapperToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OutdoorStartPointWrapper&&(identical(other.outdoor, outdoor) || other.outdoor == outdoor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,outdoor);
}

@override
String toString() {
    return 'NavigationStartPoint.outdoor(outdoor: $outdoor)';
}


}

/// @nodoc
abstract mixin class _$OutdoorStartPointWrapperCopyWith<$Res> implements $NavigationStartPointCopyWith<$Res> {
  factory _$OutdoorStartPointWrapperCopyWith(_OutdoorStartPointWrapper value, $Res Function(_OutdoorStartPointWrapper) _then) = __$OutdoorStartPointWrapperCopyWithImpl;
@useResult
$Res call({
 OutdoorStartPoint outdoor
});


$OutdoorStartPointCopyWith<$Res> get outdoor;

}
/// @nodoc
class __$OutdoorStartPointWrapperCopyWithImpl<$Res>
    implements _$OutdoorStartPointWrapperCopyWith<$Res> {
  __$OutdoorStartPointWrapperCopyWithImpl(this._self, this._then);

  final _OutdoorStartPointWrapper _self;
  final $Res Function(_OutdoorStartPointWrapper) _then;

/// Create a copy of NavigationStartPoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? outdoor = null,}) {
  return _then(_OutdoorStartPointWrapper(
null == outdoor ? _self.outdoor : outdoor // ignore: cast_nullable_to_non_nullable
as OutdoorStartPoint,
  ));
}

/// Create a copy of NavigationStartPoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OutdoorStartPointCopyWith<$Res> get outdoor {
  
  return $OutdoorStartPointCopyWith<$Res>(_self.outdoor, (value) {
    return _then(_self.copyWith(outdoor: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class _CurrentLocationStartPoint extends NavigationStartPoint {
  const _CurrentLocationStartPoint(this.coordinates, {this.accuracy,  String? $type}): $type = $type ?? 'currentLocation',super._();
  factory _CurrentLocationStartPoint.fromJson(Map<String, dynamic> json) => _$CurrentLocationStartPointFromJson(json);

 final  LatLng coordinates;
 final  double? accuracy;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of NavigationStartPoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrentLocationStartPointCopyWith<_CurrentLocationStartPoint> get copyWith => __$CurrentLocationStartPointCopyWithImpl<_CurrentLocationStartPoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CurrentLocationStartPointToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrentLocationStartPoint&&(identical(other.coordinates, coordinates) || other.coordinates == coordinates)&&(identical(other.accuracy, accuracy) || other.accuracy == accuracy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,coordinates,accuracy);
}

@override
String toString() {
    return 'NavigationStartPoint.currentLocation(coordinates: $coordinates, accuracy: $accuracy)';
}


}

/// @nodoc
abstract mixin class _$CurrentLocationStartPointCopyWith<$Res> implements $NavigationStartPointCopyWith<$Res> {
  factory _$CurrentLocationStartPointCopyWith(_CurrentLocationStartPoint value, $Res Function(_CurrentLocationStartPoint) _then) = __$CurrentLocationStartPointCopyWithImpl;
@useResult
$Res call({
 LatLng coordinates, double? accuracy
});




}
/// @nodoc
class __$CurrentLocationStartPointCopyWithImpl<$Res>
    implements _$CurrentLocationStartPointCopyWith<$Res> {
  __$CurrentLocationStartPointCopyWithImpl(this._self, this._then);

  final _CurrentLocationStartPoint _self;
  final $Res Function(_CurrentLocationStartPoint) _then;

/// Create a copy of NavigationStartPoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? coordinates = null,Object? accuracy = freezed,}) {
  return _then(_CurrentLocationStartPoint(
null == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as LatLng,accuracy: freezed == accuracy ? _self.accuracy : accuracy // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

/// @nodoc
mixin _$DestinationType {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DestinationType);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'DestinationType()';
}


}

/// @nodoc
class $DestinationTypeCopyWith<$Res>  {
$DestinationTypeCopyWith(DestinationType _, $Res Function(DestinationType) __);
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Building value)?  building,TResult Function( _Location value)?  location,TResult Function( _Coordinates value)?  coordinates,TResult Function( _EmergencyExit value)?  emergencyExit,TResult Function( _AssemblyPoint value)?  assemblyPoint,TResult Function( _Room value)?  room,TResult Function( _Facility value)?  facility,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Building() when building != null:
return building(_that);case _Location() when location != null:
return location(_that);case _Coordinates() when coordinates != null:
return coordinates(_that);case _EmergencyExit() when emergencyExit != null:
return emergencyExit(_that);case _AssemblyPoint() when assemblyPoint != null:
return assemblyPoint(_that);case _Room() when room != null:
return room(_that);case _Facility() when facility != null:
return facility(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Building value)  building,required TResult Function( _Location value)  location,required TResult Function( _Coordinates value)  coordinates,required TResult Function( _EmergencyExit value)  emergencyExit,required TResult Function( _AssemblyPoint value)  assemblyPoint,required TResult Function( _Room value)  room,required TResult Function( _Facility value)  facility,}){
final _that = this;
switch (_that) {
case _Building():
return building(_that);case _Location():
return location(_that);case _Coordinates():
return coordinates(_that);case _EmergencyExit():
return emergencyExit(_that);case _AssemblyPoint():
return assemblyPoint(_that);case _Room():
return room(_that);case _Facility():
return facility(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Building value)?  building,TResult? Function( _Location value)?  location,TResult? Function( _Coordinates value)?  coordinates,TResult? Function( _EmergencyExit value)?  emergencyExit,TResult? Function( _AssemblyPoint value)?  assemblyPoint,TResult? Function( _Room value)?  room,TResult? Function( _Facility value)?  facility,}){
final _that = this;
switch (_that) {
case _Building() when building != null:
return building(_that);case _Location() when location != null:
return location(_that);case _Coordinates() when coordinates != null:
return coordinates(_that);case _EmergencyExit() when emergencyExit != null:
return emergencyExit(_that);case _AssemblyPoint() when assemblyPoint != null:
return assemblyPoint(_that);case _Room() when room != null:
return room(_that);case _Facility() when facility != null:
return facility(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  building,TResult Function()?  location,TResult Function()?  coordinates,TResult Function()?  emergencyExit,TResult Function()?  assemblyPoint,TResult Function()?  room,TResult Function()?  facility,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Building() when building != null:
return building();case _Location() when location != null:
return location();case _Coordinates() when coordinates != null:
return coordinates();case _EmergencyExit() when emergencyExit != null:
return emergencyExit();case _AssemblyPoint() when assemblyPoint != null:
return assemblyPoint();case _Room() when room != null:
return room();case _Facility() when facility != null:
return facility();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  building,required TResult Function()  location,required TResult Function()  coordinates,required TResult Function()  emergencyExit,required TResult Function()  assemblyPoint,required TResult Function()  room,required TResult Function()  facility,}) {final _that = this;
switch (_that) {
case _Building():
return building();case _Location():
return location();case _Coordinates():
return coordinates();case _EmergencyExit():
return emergencyExit();case _AssemblyPoint():
return assemblyPoint();case _Room():
return room();case _Facility():
return facility();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  building,TResult? Function()?  location,TResult? Function()?  coordinates,TResult? Function()?  emergencyExit,TResult? Function()?  assemblyPoint,TResult? Function()?  room,TResult? Function()?  facility,}) {final _that = this;
switch (_that) {
case _Building() when building != null:
return building();case _Location() when location != null:
return location();case _Coordinates() when coordinates != null:
return coordinates();case _EmergencyExit() when emergencyExit != null:
return emergencyExit();case _AssemblyPoint() when assemblyPoint != null:
return assemblyPoint();case _Room() when room != null:
return room();case _Facility() when facility != null:
return facility();case _:
  return null;

}
}

}

/// @nodoc


class _Building implements DestinationType {
  const _Building();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Building);
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Location);
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Coordinates);
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmergencyExit);
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssemblyPoint);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'DestinationType.assemblyPoint()';
}


}




/// @nodoc


class _Room implements DestinationType {
  const _Room();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Room);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'DestinationType.room()';
}


}




/// @nodoc


class _Facility implements DestinationType {
  const _Facility();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Facility);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'DestinationType.facility()';
}


}





/// @nodoc
mixin _$NavigationDestination {

 String get id; String get name;@JsonKey(fromJson: DestinationTypeConverter._destinationTypeFromJson, toJson: DestinationTypeConverter._destinationTypeToJson) DestinationType get type; LatLng get coordinates; String? get buildingId; String? get floorId; String? get roomId; String? get roomName; String? get description; String? get address; Map<String, dynamic>? get metadata; bool get isEmergencyExit; bool get isAssemblyPoint; bool get isAccessible; String? get evacuationRouteId;
/// Create a copy of NavigationDestination
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigationDestinationCopyWith<NavigationDestination> get copyWith => _$NavigationDestinationCopyWithImpl<NavigationDestination>(this as NavigationDestination, _$identity);

  /// Serializes this NavigationDestination to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as NavigationDestination;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigationDestination&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.coordinates, _this.coordinates) || other.coordinates == _this.coordinates)&&(identical(other.buildingId, _this.buildingId) || other.buildingId == _this.buildingId)&&(identical(other.floorId, _this.floorId) || other.floorId == _this.floorId)&&(identical(other.roomId, _this.roomId) || other.roomId == _this.roomId)&&(identical(other.roomName, _this.roomName) || other.roomName == _this.roomName)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.address, _this.address) || other.address == _this.address)&&const DeepCollectionEquality().equals(other.metadata, _this.metadata)&&(identical(other.isEmergencyExit, _this.isEmergencyExit) || other.isEmergencyExit == _this.isEmergencyExit)&&(identical(other.isAssemblyPoint, _this.isAssemblyPoint) || other.isAssemblyPoint == _this.isAssemblyPoint)&&(identical(other.isAccessible, _this.isAccessible) || other.isAccessible == _this.isAccessible)&&(identical(other.evacuationRouteId, _this.evacuationRouteId) || other.evacuationRouteId == _this.evacuationRouteId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as NavigationDestination;
  return Object.hash(runtimeType,_this.id,_this.name,_this.type,_this.coordinates,_this.buildingId,_this.floorId,_this.roomId,_this.roomName,_this.description,_this.address,const DeepCollectionEquality().hash(_this.metadata),_this.isEmergencyExit,_this.isAssemblyPoint,_this.isAccessible,_this.evacuationRouteId);
}

@override
String toString() {
  final _this = this as NavigationDestination;
  return 'NavigationDestination(id: ${_this.id}, name: ${_this.name}, type: ${_this.type}, coordinates: ${_this.coordinates}, buildingId: ${_this.buildingId}, floorId: ${_this.floorId}, roomId: ${_this.roomId}, roomName: ${_this.roomName}, description: ${_this.description}, address: ${_this.address}, metadata: ${_this.metadata}, isEmergencyExit: ${_this.isEmergencyExit}, isAssemblyPoint: ${_this.isAssemblyPoint}, isAccessible: ${_this.isAccessible}, evacuationRouteId: ${_this.evacuationRouteId})';
}


}

/// @nodoc
abstract mixin class $NavigationDestinationCopyWith<$Res>  {
  factory $NavigationDestinationCopyWith(NavigationDestination value, $Res Function(NavigationDestination) _then) = _$NavigationDestinationCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(fromJson: DestinationTypeConverter._destinationTypeFromJson, toJson: DestinationTypeConverter._destinationTypeToJson) DestinationType type, LatLng coordinates, String? buildingId, String? floorId, String? roomId, String? roomName, String? description, String? address, Map<String, dynamic>? metadata, bool isEmergencyExit, bool isAssemblyPoint, bool isAccessible, String? evacuationRouteId
});


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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? coordinates = null,Object? buildingId = freezed,Object? floorId = freezed,Object? roomId = freezed,Object? roomName = freezed,Object? description = freezed,Object? address = freezed,Object? metadata = freezed,Object? isEmergencyExit = null,Object? isAssemblyPoint = null,Object? isAccessible = null,Object? evacuationRouteId = freezed,}) {
  return _then(NavigationDestination(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DestinationType,coordinates: null == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as LatLng,buildingId: freezed == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as String?,floorId: freezed == floorId ? _self.floorId : floorId // ignore: cast_nullable_to_non_nullable
as String?,roomId: freezed == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String?,roomName: freezed == roomName ? _self.roomName : roomName // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,isEmergencyExit: null == isEmergencyExit ? _self.isEmergencyExit : isEmergencyExit // ignore: cast_nullable_to_non_nullable
as bool,isAssemblyPoint: null == isAssemblyPoint ? _self.isAssemblyPoint : isAssemblyPoint // ignore: cast_nullable_to_non_nullable
as bool,isAccessible: null == isAccessible ? _self.isAccessible : isAccessible // ignore: cast_nullable_to_non_nullable
as bool,evacuationRouteId: freezed == evacuationRouteId ? _self.evacuationRouteId : evacuationRouteId // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NavigationDestination value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NavigationDestination() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NavigationDestination value)  $default,){
final _that = this;
switch (_that) {
case _NavigationDestination():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NavigationDestination value)?  $default,){
final _that = this;
switch (_that) {
case _NavigationDestination() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(fromJson: DestinationTypeConverter._destinationTypeFromJson, toJson: DestinationTypeConverter._destinationTypeToJson)  DestinationType type,  LatLng coordinates,  String? buildingId,  String? floorId,  String? roomId,  String? roomName,  String? description,  String? address,  Map<String, dynamic>? metadata,  bool isEmergencyExit,  bool isAssemblyPoint,  bool isAccessible,  String? evacuationRouteId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NavigationDestination() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.coordinates,_that.buildingId,_that.floorId,_that.roomId,_that.roomName,_that.description,_that.address,_that.metadata,_that.isEmergencyExit,_that.isAssemblyPoint,_that.isAccessible,_that.evacuationRouteId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(fromJson: DestinationTypeConverter._destinationTypeFromJson, toJson: DestinationTypeConverter._destinationTypeToJson)  DestinationType type,  LatLng coordinates,  String? buildingId,  String? floorId,  String? roomId,  String? roomName,  String? description,  String? address,  Map<String, dynamic>? metadata,  bool isEmergencyExit,  bool isAssemblyPoint,  bool isAccessible,  String? evacuationRouteId)  $default,) {final _that = this;
switch (_that) {
case _NavigationDestination():
return $default(_that.id,_that.name,_that.type,_that.coordinates,_that.buildingId,_that.floorId,_that.roomId,_that.roomName,_that.description,_that.address,_that.metadata,_that.isEmergencyExit,_that.isAssemblyPoint,_that.isAccessible,_that.evacuationRouteId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(fromJson: DestinationTypeConverter._destinationTypeFromJson, toJson: DestinationTypeConverter._destinationTypeToJson)  DestinationType type,  LatLng coordinates,  String? buildingId,  String? floorId,  String? roomId,  String? roomName,  String? description,  String? address,  Map<String, dynamic>? metadata,  bool isEmergencyExit,  bool isAssemblyPoint,  bool isAccessible,  String? evacuationRouteId)?  $default,) {final _that = this;
switch (_that) {
case _NavigationDestination() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.coordinates,_that.buildingId,_that.floorId,_that.roomId,_that.roomName,_that.description,_that.address,_that.metadata,_that.isEmergencyExit,_that.isAssemblyPoint,_that.isAccessible,_that.evacuationRouteId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NavigationDestination extends NavigationDestination {
  const _NavigationDestination({required this.id, required this.name, @JsonKey(fromJson: DestinationTypeConverter._destinationTypeFromJson, toJson: DestinationTypeConverter._destinationTypeToJson) required this.type, required this.coordinates, this.buildingId, this.floorId, this.roomId, this.roomName, this.description, this.address,  Map<String, dynamic>? metadata, this.isEmergencyExit = false, this.isAssemblyPoint = false, this.isAccessible = false, this.isRoutable = false, this.evacuationRouteId}): _metadata = metadata,super._();
  factory _NavigationDestination.fromJson(Map<String, dynamic> json) => _$NavigationDestinationFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey(fromJson: DestinationTypeConverter._destinationTypeFromJson, toJson: DestinationTypeConverter._destinationTypeToJson) final  DestinationType type;
@override final  LatLng coordinates;
@override final  String? buildingId;
@override final  String? floorId;
@override final  String? roomId;
@override final  String? roomName;
@override final  String? description;
@override final  String? address;
 final  Map<String, dynamic>? _metadata;
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey() final  bool isEmergencyExit;
@override@JsonKey() final  bool isAssemblyPoint;
@override@JsonKey() final  bool isAccessible;
@override@JsonKey() final  bool isRoutable;
@override final  String? evacuationRouteId;

/// Create a copy of NavigationDestination
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NavigationDestinationCopyWith<_NavigationDestination> get copyWith => __$NavigationDestinationCopyWithImpl<_NavigationDestination>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NavigationDestinationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NavigationDestination&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.coordinates, coordinates) || other.coordinates == coordinates)&&(identical(other.buildingId, buildingId) || other.buildingId == buildingId)&&(identical(other.floorId, floorId) || other.floorId == floorId)&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.roomName, roomName) || other.roomName == roomName)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other.metadata, _metadata)&&(identical(other.isEmergencyExit, isEmergencyExit) || other.isEmergencyExit == isEmergencyExit)&&(identical(other.isAssemblyPoint, isAssemblyPoint) || other.isAssemblyPoint == isAssemblyPoint)&&(identical(other.isAccessible, isAccessible) || other.isAccessible == isAccessible)&&(identical(other.evacuationRouteId, evacuationRouteId) || other.evacuationRouteId == evacuationRouteId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,type,coordinates,buildingId,floorId,roomId,roomName,description,address,const DeepCollectionEquality().hash(_metadata),isEmergencyExit,isAssemblyPoint,isAccessible,evacuationRouteId);
}

@override
String toString() {
    return 'NavigationDestination(id: $id, name: $name, type: $type, coordinates: $coordinates, buildingId: $buildingId, floorId: $floorId, roomId: $roomId, roomName: $roomName, description: $description, address: $address, metadata: $metadata, isEmergencyExit: $isEmergencyExit, isAssemblyPoint: $isAssemblyPoint, isAccessible: $isAccessible, evacuationRouteId: $evacuationRouteId)';
}


}

/// @nodoc
abstract mixin class _$NavigationDestinationCopyWith<$Res> implements $NavigationDestinationCopyWith<$Res> {
  factory _$NavigationDestinationCopyWith(_NavigationDestination value, $Res Function(_NavigationDestination) _then) = __$NavigationDestinationCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(fromJson: DestinationTypeConverter._destinationTypeFromJson, toJson: DestinationTypeConverter._destinationTypeToJson) DestinationType type, LatLng coordinates, String? buildingId, String? floorId, String? roomId, String? roomName, String? description, String? address, Map<String, dynamic>? metadata, bool isEmergencyExit, bool isAssemblyPoint, bool isAccessible, String? evacuationRouteId
});


@override $DestinationTypeCopyWith<$Res> get type;

}
/// @nodoc
class __$NavigationDestinationCopyWithImpl<$Res>
    implements _$NavigationDestinationCopyWith<$Res> {
  __$NavigationDestinationCopyWithImpl(this._self, this._then);

  final _NavigationDestination _self;
  final $Res Function(_NavigationDestination) _then;

/// Create a copy of NavigationDestination
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? coordinates = null,Object? buildingId = freezed,Object? floorId = freezed,Object? roomId = freezed,Object? roomName = freezed,Object? description = freezed,Object? address = freezed,Object? metadata = freezed,Object? isEmergencyExit = null,Object? isAssemblyPoint = null,Object? isAccessible = null,Object? evacuationRouteId = freezed,}) {
  return _then(_NavigationDestination(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DestinationType,coordinates: null == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as LatLng,buildingId: freezed == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as String?,floorId: freezed == floorId ? _self.floorId : floorId // ignore: cast_nullable_to_non_nullable
as String?,roomId: freezed == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String?,roomName: freezed == roomName ? _self.roomName : roomName // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,isEmergencyExit: null == isEmergencyExit ? _self.isEmergencyExit : isEmergencyExit // ignore: cast_nullable_to_non_nullable
as bool,isAssemblyPoint: null == isAssemblyPoint ? _self.isAssemblyPoint : isAssemblyPoint // ignore: cast_nullable_to_non_nullable
as bool,isAccessible: null == isAccessible ? _self.isAccessible : isAccessible // ignore: cast_nullable_to_non_nullable
as bool,evacuationRouteId: freezed == evacuationRouteId ? _self.evacuationRouteId : evacuationRouteId // ignore: cast_nullable_to_non_nullable
as String?,
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

 String get id; NavigationStartPoint get start; NavigationDestination get end; List<LatLng> get geometry; double get totalDistance; Duration get estimatedDuration; List<NavigationInstruction> get instructions; DateTime get createdAt; String? get pathwayIds;@JsonKey(fromJson: RouteStatusConverter._routeStatusFromJson, toJson: RouteStatusConverter._routeStatusToJson) RouteStatus? get status; List<String>? get buildingTransitions; List<String>? get floorTransitions; double? get indoorDistance; double? get outdoorDistance;
/// Create a copy of NavigationRoute
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigationRouteCopyWith<NavigationRoute> get copyWith => _$NavigationRouteCopyWithImpl<NavigationRoute>(this as NavigationRoute, _$identity);

  /// Serializes this NavigationRoute to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as NavigationRoute;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigationRoute&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.start, _this.start) || other.start == _this.start)&&(identical(other.end, _this.end) || other.end == _this.end)&&const DeepCollectionEquality().equals(other.geometry, _this.geometry)&&(identical(other.totalDistance, _this.totalDistance) || other.totalDistance == _this.totalDistance)&&(identical(other.estimatedDuration, _this.estimatedDuration) || other.estimatedDuration == _this.estimatedDuration)&&const DeepCollectionEquality().equals(other.instructions, _this.instructions)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.pathwayIds, _this.pathwayIds) || other.pathwayIds == _this.pathwayIds)&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.buildingTransitions, _this.buildingTransitions)&&const DeepCollectionEquality().equals(other.floorTransitions, _this.floorTransitions)&&(identical(other.indoorDistance, _this.indoorDistance) || other.indoorDistance == _this.indoorDistance)&&(identical(other.outdoorDistance, _this.outdoorDistance) || other.outdoorDistance == _this.outdoorDistance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as NavigationRoute;
  return Object.hash(runtimeType,_this.id,_this.start,_this.end,const DeepCollectionEquality().hash(_this.geometry),_this.totalDistance,_this.estimatedDuration,const DeepCollectionEquality().hash(_this.instructions),_this.createdAt,_this.pathwayIds,_this.status,const DeepCollectionEquality().hash(_this.buildingTransitions),const DeepCollectionEquality().hash(_this.floorTransitions),_this.indoorDistance,_this.outdoorDistance);
}

@override
String toString() {
  final _this = this as NavigationRoute;
  return 'NavigationRoute(id: ${_this.id}, start: ${_this.start}, end: ${_this.end}, geometry: ${_this.geometry}, totalDistance: ${_this.totalDistance}, estimatedDuration: ${_this.estimatedDuration}, instructions: ${_this.instructions}, createdAt: ${_this.createdAt}, pathwayIds: ${_this.pathwayIds}, status: ${_this.status}, buildingTransitions: ${_this.buildingTransitions}, floorTransitions: ${_this.floorTransitions}, indoorDistance: ${_this.indoorDistance}, outdoorDistance: ${_this.outdoorDistance})';
}


}

/// @nodoc
abstract mixin class $NavigationRouteCopyWith<$Res>  {
  factory $NavigationRouteCopyWith(NavigationRoute value, $Res Function(NavigationRoute) _then) = _$NavigationRouteCopyWithImpl;
@useResult
$Res call({
 String id, NavigationStartPoint start, NavigationDestination end, List<LatLng> geometry, double totalDistance, Duration estimatedDuration, List<NavigationInstruction> instructions, DateTime createdAt, String? pathwayIds,@JsonKey(fromJson: RouteStatusConverter._routeStatusFromJson, toJson: RouteStatusConverter._routeStatusToJson) RouteStatus? status, List<String>? buildingTransitions, List<String>? floorTransitions, double? indoorDistance, double? outdoorDistance
});


$NavigationStartPointCopyWith<$Res> get start;$NavigationDestinationCopyWith<$Res> get end;$RouteStatusCopyWith<$Res>? get status;

}
/// @nodoc
class _$NavigationRouteCopyWithImpl<$Res>
    implements $NavigationRouteCopyWith<$Res> {
  _$NavigationRouteCopyWithImpl(this._self, this._then);

  final NavigationRoute _self;
  final $Res Function(NavigationRoute) _then;

/// Create a copy of NavigationRoute
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? start = null,Object? end = null,Object? geometry = null,Object? totalDistance = null,Object? estimatedDuration = null,Object? instructions = null,Object? createdAt = null,Object? pathwayIds = freezed,Object? status = freezed,Object? buildingTransitions = freezed,Object? floorTransitions = freezed,Object? indoorDistance = freezed,Object? outdoorDistance = freezed,}) {
  return _then(NavigationRoute(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as NavigationStartPoint,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as NavigationDestination,geometry: null == geometry ? _self.geometry : geometry // ignore: cast_nullable_to_non_nullable
as List<LatLng>,totalDistance: null == totalDistance ? _self.totalDistance : totalDistance // ignore: cast_nullable_to_non_nullable
as double,estimatedDuration: null == estimatedDuration ? _self.estimatedDuration : estimatedDuration // ignore: cast_nullable_to_non_nullable
as Duration,instructions: null == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as List<NavigationInstruction>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,pathwayIds: freezed == pathwayIds ? _self.pathwayIds : pathwayIds // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RouteStatus?,buildingTransitions: freezed == buildingTransitions ? _self.buildingTransitions : buildingTransitions // ignore: cast_nullable_to_non_nullable
as List<String>?,floorTransitions: freezed == floorTransitions ? _self.floorTransitions : floorTransitions // ignore: cast_nullable_to_non_nullable
as List<String>?,indoorDistance: freezed == indoorDistance ? _self.indoorDistance : indoorDistance // ignore: cast_nullable_to_non_nullable
as double?,outdoorDistance: freezed == outdoorDistance ? _self.outdoorDistance : outdoorDistance // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}
/// Create a copy of NavigationRoute
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NavigationStartPointCopyWith<$Res> get start {
  
  return $NavigationStartPointCopyWith<$Res>(_self.start, (value) {
    return _then(_self.copyWith(start: value));
  });
}/// Create a copy of NavigationRoute
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NavigationDestinationCopyWith<$Res> get end {
  
  return $NavigationDestinationCopyWith<$Res>(_self.end, (value) {
    return _then(_self.copyWith(end: value));
  });
}/// Create a copy of NavigationRoute
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NavigationRoute value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NavigationRoute() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NavigationRoute value)  $default,){
final _that = this;
switch (_that) {
case _NavigationRoute():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NavigationRoute value)?  $default,){
final _that = this;
switch (_that) {
case _NavigationRoute() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  NavigationStartPoint start,  NavigationDestination end,  List<LatLng> geometry,  double totalDistance,  Duration estimatedDuration,  List<NavigationInstruction> instructions,  DateTime createdAt,  String? pathwayIds, @JsonKey(fromJson: RouteStatusConverter._routeStatusFromJson, toJson: RouteStatusConverter._routeStatusToJson)  RouteStatus? status,  List<String>? buildingTransitions,  List<String>? floorTransitions,  double? indoorDistance,  double? outdoorDistance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NavigationRoute() when $default != null:
return $default(_that.id,_that.start,_that.end,_that.geometry,_that.totalDistance,_that.estimatedDuration,_that.instructions,_that.createdAt,_that.pathwayIds,_that.status,_that.buildingTransitions,_that.floorTransitions,_that.indoorDistance,_that.outdoorDistance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  NavigationStartPoint start,  NavigationDestination end,  List<LatLng> geometry,  double totalDistance,  Duration estimatedDuration,  List<NavigationInstruction> instructions,  DateTime createdAt,  String? pathwayIds, @JsonKey(fromJson: RouteStatusConverter._routeStatusFromJson, toJson: RouteStatusConverter._routeStatusToJson)  RouteStatus? status,  List<String>? buildingTransitions,  List<String>? floorTransitions,  double? indoorDistance,  double? outdoorDistance)  $default,) {final _that = this;
switch (_that) {
case _NavigationRoute():
return $default(_that.id,_that.start,_that.end,_that.geometry,_that.totalDistance,_that.estimatedDuration,_that.instructions,_that.createdAt,_that.pathwayIds,_that.status,_that.buildingTransitions,_that.floorTransitions,_that.indoorDistance,_that.outdoorDistance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  NavigationStartPoint start,  NavigationDestination end,  List<LatLng> geometry,  double totalDistance,  Duration estimatedDuration,  List<NavigationInstruction> instructions,  DateTime createdAt,  String? pathwayIds, @JsonKey(fromJson: RouteStatusConverter._routeStatusFromJson, toJson: RouteStatusConverter._routeStatusToJson)  RouteStatus? status,  List<String>? buildingTransitions,  List<String>? floorTransitions,  double? indoorDistance,  double? outdoorDistance)?  $default,) {final _that = this;
switch (_that) {
case _NavigationRoute() when $default != null:
return $default(_that.id,_that.start,_that.end,_that.geometry,_that.totalDistance,_that.estimatedDuration,_that.instructions,_that.createdAt,_that.pathwayIds,_that.status,_that.buildingTransitions,_that.floorTransitions,_that.indoorDistance,_that.outdoorDistance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NavigationRoute extends NavigationRoute {
  const _NavigationRoute({required this.id, required this.start, required this.end, required  List<LatLng> geometry, required this.totalDistance, required this.estimatedDuration, required  List<NavigationInstruction> instructions, required this.createdAt, this.pathwayIds, @JsonKey(fromJson: RouteStatusConverter._routeStatusFromJson, toJson: RouteStatusConverter._routeStatusToJson) this.status,  List<String>? buildingTransitions,  List<String>? floorTransitions, this.indoorDistance, this.outdoorDistance}): _geometry = geometry,_instructions = instructions,_buildingTransitions = buildingTransitions,_floorTransitions = floorTransitions,super._();
  factory _NavigationRoute.fromJson(Map<String, dynamic> json) => _$NavigationRouteFromJson(json);

@override final  String id;
@override final  NavigationStartPoint start;
@override final  NavigationDestination end;
 final  List<LatLng> _geometry;
@override List<LatLng> get geometry {
  if (_geometry is EqualUnmodifiableListView) return _geometry;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_geometry);
}

@override final  double totalDistance;
@override final  Duration estimatedDuration;
 final  List<NavigationInstruction> _instructions;
@override List<NavigationInstruction> get instructions {
  if (_instructions is EqualUnmodifiableListView) return _instructions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_instructions);
}

@override final  DateTime createdAt;
@override final  String? pathwayIds;
@override@JsonKey(fromJson: RouteStatusConverter._routeStatusFromJson, toJson: RouteStatusConverter._routeStatusToJson) final  RouteStatus? status;
 final  List<String>? _buildingTransitions;
@override List<String>? get buildingTransitions {
  final value = _buildingTransitions;
  if (value == null) return null;
  if (_buildingTransitions is EqualUnmodifiableListView) return _buildingTransitions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _floorTransitions;
@override List<String>? get floorTransitions {
  final value = _floorTransitions;
  if (value == null) return null;
  if (_floorTransitions is EqualUnmodifiableListView) return _floorTransitions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  double? indoorDistance;
@override final  double? outdoorDistance;

/// Create a copy of NavigationRoute
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NavigationRouteCopyWith<_NavigationRoute> get copyWith => __$NavigationRouteCopyWithImpl<_NavigationRoute>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NavigationRouteToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NavigationRoute&&(identical(other.id, id) || other.id == id)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&const DeepCollectionEquality().equals(other.geometry, _geometry)&&(identical(other.totalDistance, totalDistance) || other.totalDistance == totalDistance)&&(identical(other.estimatedDuration, estimatedDuration) || other.estimatedDuration == estimatedDuration)&&const DeepCollectionEquality().equals(other.instructions, _instructions)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.pathwayIds, pathwayIds) || other.pathwayIds == pathwayIds)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.buildingTransitions, _buildingTransitions)&&const DeepCollectionEquality().equals(other.floorTransitions, _floorTransitions)&&(identical(other.indoorDistance, indoorDistance) || other.indoorDistance == indoorDistance)&&(identical(other.outdoorDistance, outdoorDistance) || other.outdoorDistance == outdoorDistance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,start,end,const DeepCollectionEquality().hash(_geometry),totalDistance,estimatedDuration,const DeepCollectionEquality().hash(_instructions),createdAt,pathwayIds,status,const DeepCollectionEquality().hash(_buildingTransitions),const DeepCollectionEquality().hash(_floorTransitions),indoorDistance,outdoorDistance);
}

@override
String toString() {
    return 'NavigationRoute(id: $id, start: $start, end: $end, geometry: $geometry, totalDistance: $totalDistance, estimatedDuration: $estimatedDuration, instructions: $instructions, createdAt: $createdAt, pathwayIds: $pathwayIds, status: $status, buildingTransitions: $buildingTransitions, floorTransitions: $floorTransitions, indoorDistance: $indoorDistance, outdoorDistance: $outdoorDistance)';
}


}

/// @nodoc
abstract mixin class _$NavigationRouteCopyWith<$Res> implements $NavigationRouteCopyWith<$Res> {
  factory _$NavigationRouteCopyWith(_NavigationRoute value, $Res Function(_NavigationRoute) _then) = __$NavigationRouteCopyWithImpl;
@override @useResult
$Res call({
 String id, NavigationStartPoint start, NavigationDestination end, List<LatLng> geometry, double totalDistance, Duration estimatedDuration, List<NavigationInstruction> instructions, DateTime createdAt, String? pathwayIds,@JsonKey(fromJson: RouteStatusConverter._routeStatusFromJson, toJson: RouteStatusConverter._routeStatusToJson) RouteStatus? status, List<String>? buildingTransitions, List<String>? floorTransitions, double? indoorDistance, double? outdoorDistance
});


@override $NavigationStartPointCopyWith<$Res> get start;@override $NavigationDestinationCopyWith<$Res> get end;@override $RouteStatusCopyWith<$Res>? get status;

}
/// @nodoc
class __$NavigationRouteCopyWithImpl<$Res>
    implements _$NavigationRouteCopyWith<$Res> {
  __$NavigationRouteCopyWithImpl(this._self, this._then);

  final _NavigationRoute _self;
  final $Res Function(_NavigationRoute) _then;

/// Create a copy of NavigationRoute
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? start = null,Object? end = null,Object? geometry = null,Object? totalDistance = null,Object? estimatedDuration = null,Object? instructions = null,Object? createdAt = null,Object? pathwayIds = freezed,Object? status = freezed,Object? buildingTransitions = freezed,Object? floorTransitions = freezed,Object? indoorDistance = freezed,Object? outdoorDistance = freezed,}) {
  return _then(_NavigationRoute(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as NavigationStartPoint,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as NavigationDestination,geometry: null == geometry ? _self._geometry : geometry // ignore: cast_nullable_to_non_nullable
as List<LatLng>,totalDistance: null == totalDistance ? _self.totalDistance : totalDistance // ignore: cast_nullable_to_non_nullable
as double,estimatedDuration: null == estimatedDuration ? _self.estimatedDuration : estimatedDuration // ignore: cast_nullable_to_non_nullable
as Duration,instructions: null == instructions ? _self._instructions : instructions // ignore: cast_nullable_to_non_nullable
as List<NavigationInstruction>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,pathwayIds: freezed == pathwayIds ? _self.pathwayIds : pathwayIds // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RouteStatus?,buildingTransitions: freezed == buildingTransitions ? _self._buildingTransitions : buildingTransitions // ignore: cast_nullable_to_non_nullable
as List<String>?,floorTransitions: freezed == floorTransitions ? _self._floorTransitions : floorTransitions // ignore: cast_nullable_to_non_nullable
as List<String>?,indoorDistance: freezed == indoorDistance ? _self.indoorDistance : indoorDistance // ignore: cast_nullable_to_non_nullable
as double?,outdoorDistance: freezed == outdoorDistance ? _self.outdoorDistance : outdoorDistance // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

/// Create a copy of NavigationRoute
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NavigationStartPointCopyWith<$Res> get start {
  
  return $NavigationStartPointCopyWith<$Res>(_self.start, (value) {
    return _then(_self.copyWith(start: value));
  });
}/// Create a copy of NavigationRoute
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NavigationDestinationCopyWith<$Res> get end {
  
  return $NavigationDestinationCopyWith<$Res>(_self.end, (value) {
    return _then(_self.copyWith(end: value));
  });
}/// Create a copy of NavigationRoute
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

 String get instruction; double get latitude; double get longitude; double get distanceToNext;@JsonKey(fromJson: InstructionTypeConverter._instructionTypeFromJson, toJson: InstructionTypeConverter._instructionTypeToJson) InstructionType get type; String? get roadName; String? get landmark; String? get buildingId; String? get floorId; String? get roomId; String? get levelChange; double? get elevationChange;
/// Create a copy of NavigationInstruction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigationInstructionCopyWith<NavigationInstruction> get copyWith => _$NavigationInstructionCopyWithImpl<NavigationInstruction>(this as NavigationInstruction, _$identity);

  /// Serializes this NavigationInstruction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as NavigationInstruction;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigationInstruction&&(identical(other.instruction, _this.instruction) || other.instruction == _this.instruction)&&(identical(other.latitude, _this.latitude) || other.latitude == _this.latitude)&&(identical(other.longitude, _this.longitude) || other.longitude == _this.longitude)&&(identical(other.distanceToNext, _this.distanceToNext) || other.distanceToNext == _this.distanceToNext)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.roadName, _this.roadName) || other.roadName == _this.roadName)&&(identical(other.landmark, _this.landmark) || other.landmark == _this.landmark)&&(identical(other.buildingId, _this.buildingId) || other.buildingId == _this.buildingId)&&(identical(other.floorId, _this.floorId) || other.floorId == _this.floorId)&&(identical(other.roomId, _this.roomId) || other.roomId == _this.roomId)&&(identical(other.levelChange, _this.levelChange) || other.levelChange == _this.levelChange)&&(identical(other.elevationChange, _this.elevationChange) || other.elevationChange == _this.elevationChange));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as NavigationInstruction;
  return Object.hash(runtimeType,_this.instruction,_this.latitude,_this.longitude,_this.distanceToNext,_this.type,_this.roadName,_this.landmark,_this.buildingId,_this.floorId,_this.roomId,_this.levelChange,_this.elevationChange);
}

@override
String toString() {
  final _this = this as NavigationInstruction;
  return 'NavigationInstruction(instruction: ${_this.instruction}, latitude: ${_this.latitude}, longitude: ${_this.longitude}, distanceToNext: ${_this.distanceToNext}, type: ${_this.type}, roadName: ${_this.roadName}, landmark: ${_this.landmark}, buildingId: ${_this.buildingId}, floorId: ${_this.floorId}, roomId: ${_this.roomId}, levelChange: ${_this.levelChange}, elevationChange: ${_this.elevationChange})';
}


}

/// @nodoc
abstract mixin class $NavigationInstructionCopyWith<$Res>  {
  factory $NavigationInstructionCopyWith(NavigationInstruction value, $Res Function(NavigationInstruction) _then) = _$NavigationInstructionCopyWithImpl;
@useResult
$Res call({
 String instruction, double latitude, double longitude, double distanceToNext,@JsonKey(fromJson: InstructionTypeConverter._instructionTypeFromJson, toJson: InstructionTypeConverter._instructionTypeToJson) InstructionType type, String? roadName, String? landmark, String? buildingId, String? floorId, String? roomId, String? levelChange, double? elevationChange
});


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
@pragma('vm:prefer-inline') @override $Res call({Object? instruction = null,Object? latitude = null,Object? longitude = null,Object? distanceToNext = null,Object? type = null,Object? roadName = freezed,Object? landmark = freezed,Object? buildingId = freezed,Object? floorId = freezed,Object? roomId = freezed,Object? levelChange = freezed,Object? elevationChange = freezed,}) {
  return _then(NavigationInstruction(
instruction: null == instruction ? _self.instruction : instruction // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,distanceToNext: null == distanceToNext ? _self.distanceToNext : distanceToNext // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as InstructionType,roadName: freezed == roadName ? _self.roadName : roadName // ignore: cast_nullable_to_non_nullable
as String?,landmark: freezed == landmark ? _self.landmark : landmark // ignore: cast_nullable_to_non_nullable
as String?,buildingId: freezed == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as String?,floorId: freezed == floorId ? _self.floorId : floorId // ignore: cast_nullable_to_non_nullable
as String?,roomId: freezed == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String?,levelChange: freezed == levelChange ? _self.levelChange : levelChange // ignore: cast_nullable_to_non_nullable
as String?,elevationChange: freezed == elevationChange ? _self.elevationChange : elevationChange // ignore: cast_nullable_to_non_nullable
as double?,
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NavigationInstruction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NavigationInstruction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NavigationInstruction value)  $default,){
final _that = this;
switch (_that) {
case _NavigationInstruction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NavigationInstruction value)?  $default,){
final _that = this;
switch (_that) {
case _NavigationInstruction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String instruction,  double latitude,  double longitude,  double distanceToNext, @JsonKey(fromJson: InstructionTypeConverter._instructionTypeFromJson, toJson: InstructionTypeConverter._instructionTypeToJson)  InstructionType type,  String? roadName,  String? landmark,  String? buildingId,  String? floorId,  String? roomId,  String? levelChange,  double? elevationChange)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NavigationInstruction() when $default != null:
return $default(_that.instruction,_that.latitude,_that.longitude,_that.distanceToNext,_that.type,_that.roadName,_that.landmark,_that.buildingId,_that.floorId,_that.roomId,_that.levelChange,_that.elevationChange);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String instruction,  double latitude,  double longitude,  double distanceToNext, @JsonKey(fromJson: InstructionTypeConverter._instructionTypeFromJson, toJson: InstructionTypeConverter._instructionTypeToJson)  InstructionType type,  String? roadName,  String? landmark,  String? buildingId,  String? floorId,  String? roomId,  String? levelChange,  double? elevationChange)  $default,) {final _that = this;
switch (_that) {
case _NavigationInstruction():
return $default(_that.instruction,_that.latitude,_that.longitude,_that.distanceToNext,_that.type,_that.roadName,_that.landmark,_that.buildingId,_that.floorId,_that.roomId,_that.levelChange,_that.elevationChange);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String instruction,  double latitude,  double longitude,  double distanceToNext, @JsonKey(fromJson: InstructionTypeConverter._instructionTypeFromJson, toJson: InstructionTypeConverter._instructionTypeToJson)  InstructionType type,  String? roadName,  String? landmark,  String? buildingId,  String? floorId,  String? roomId,  String? levelChange,  double? elevationChange)?  $default,) {final _that = this;
switch (_that) {
case _NavigationInstruction() when $default != null:
return $default(_that.instruction,_that.latitude,_that.longitude,_that.distanceToNext,_that.type,_that.roadName,_that.landmark,_that.buildingId,_that.floorId,_that.roomId,_that.levelChange,_that.elevationChange);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NavigationInstruction extends NavigationInstruction {
  const _NavigationInstruction({required this.instruction, required this.latitude, required this.longitude, required this.distanceToNext, @JsonKey(fromJson: InstructionTypeConverter._instructionTypeFromJson, toJson: InstructionTypeConverter._instructionTypeToJson) required this.type, this.roadName, this.landmark, this.buildingId, this.floorId, this.roomId, this.levelChange, this.elevationChange}): super._();
  factory _NavigationInstruction.fromJson(Map<String, dynamic> json) => _$NavigationInstructionFromJson(json);

@override final  String instruction;
@override final  double latitude;
@override final  double longitude;
@override final  double distanceToNext;
@override@JsonKey(fromJson: InstructionTypeConverter._instructionTypeFromJson, toJson: InstructionTypeConverter._instructionTypeToJson) final  InstructionType type;
@override final  String? roadName;
@override final  String? landmark;
@override final  String? buildingId;
@override final  String? floorId;
@override final  String? roomId;
@override final  String? levelChange;
@override final  double? elevationChange;

/// Create a copy of NavigationInstruction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NavigationInstructionCopyWith<_NavigationInstruction> get copyWith => __$NavigationInstructionCopyWithImpl<_NavigationInstruction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NavigationInstructionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NavigationInstruction&&(identical(other.instruction, instruction) || other.instruction == instruction)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.distanceToNext, distanceToNext) || other.distanceToNext == distanceToNext)&&(identical(other.type, type) || other.type == type)&&(identical(other.roadName, roadName) || other.roadName == roadName)&&(identical(other.landmark, landmark) || other.landmark == landmark)&&(identical(other.buildingId, buildingId) || other.buildingId == buildingId)&&(identical(other.floorId, floorId) || other.floorId == floorId)&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.levelChange, levelChange) || other.levelChange == levelChange)&&(identical(other.elevationChange, elevationChange) || other.elevationChange == elevationChange));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,instruction,latitude,longitude,distanceToNext,type,roadName,landmark,buildingId,floorId,roomId,levelChange,elevationChange);
}

@override
String toString() {
    return 'NavigationInstruction(instruction: $instruction, latitude: $latitude, longitude: $longitude, distanceToNext: $distanceToNext, type: $type, roadName: $roadName, landmark: $landmark, buildingId: $buildingId, floorId: $floorId, roomId: $roomId, levelChange: $levelChange, elevationChange: $elevationChange)';
}


}

/// @nodoc
abstract mixin class _$NavigationInstructionCopyWith<$Res> implements $NavigationInstructionCopyWith<$Res> {
  factory _$NavigationInstructionCopyWith(_NavigationInstruction value, $Res Function(_NavigationInstruction) _then) = __$NavigationInstructionCopyWithImpl;
@override @useResult
$Res call({
 String instruction, double latitude, double longitude, double distanceToNext,@JsonKey(fromJson: InstructionTypeConverter._instructionTypeFromJson, toJson: InstructionTypeConverter._instructionTypeToJson) InstructionType type, String? roadName, String? landmark, String? buildingId, String? floorId, String? roomId, String? levelChange, double? elevationChange
});


@override $InstructionTypeCopyWith<$Res> get type;

}
/// @nodoc
class __$NavigationInstructionCopyWithImpl<$Res>
    implements _$NavigationInstructionCopyWith<$Res> {
  __$NavigationInstructionCopyWithImpl(this._self, this._then);

  final _NavigationInstruction _self;
  final $Res Function(_NavigationInstruction) _then;

/// Create a copy of NavigationInstruction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? instruction = null,Object? latitude = null,Object? longitude = null,Object? distanceToNext = null,Object? type = null,Object? roadName = freezed,Object? landmark = freezed,Object? buildingId = freezed,Object? floorId = freezed,Object? roomId = freezed,Object? levelChange = freezed,Object? elevationChange = freezed,}) {
  return _then(_NavigationInstruction(
instruction: null == instruction ? _self.instruction : instruction // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,distanceToNext: null == distanceToNext ? _self.distanceToNext : distanceToNext // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as InstructionType,roadName: freezed == roadName ? _self.roadName : roadName // ignore: cast_nullable_to_non_nullable
as String?,landmark: freezed == landmark ? _self.landmark : landmark // ignore: cast_nullable_to_non_nullable
as String?,buildingId: freezed == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as String?,floorId: freezed == floorId ? _self.floorId : floorId // ignore: cast_nullable_to_non_nullable
as String?,roomId: freezed == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String?,levelChange: freezed == levelChange ? _self.levelChange : levelChange // ignore: cast_nullable_to_non_nullable
as String?,elevationChange: freezed == elevationChange ? _self.elevationChange : elevationChange // ignore: cast_nullable_to_non_nullable
as double?,
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is InstructionType);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'InstructionType()';
}


}

/// @nodoc
class $InstructionTypeCopyWith<$Res>  {
$InstructionTypeCopyWith(InstructionType _, $Res Function(InstructionType) __);
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Start value)?  start,TResult Function( _ContinueStraight value)?  continueStraight,TResult Function( _TurnLeft value)?  turnLeft,TResult Function( _TurnRight value)?  turnRight,TResult Function( _TurnSlightLeft value)?  turnSlightLeft,TResult Function( _TurnSlightRight value)?  turnSlightRight,TResult Function( _Uturn value)?  uturn,TResult Function( _Arrive value)?  arrive,TResult Function( _EnterBuilding value)?  enterBuilding,TResult Function( _ExitBuilding value)?  exitBuilding,TResult Function( _EnterFloor value)?  enterFloor,TResult Function( _ExitFloor value)?  exitFloor,TResult Function( _UseElevator value)?  useElevator,TResult Function( _UseStairs value)?  useStairs,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Start() when start != null:
return start(_that);case _ContinueStraight() when continueStraight != null:
return continueStraight(_that);case _TurnLeft() when turnLeft != null:
return turnLeft(_that);case _TurnRight() when turnRight != null:
return turnRight(_that);case _TurnSlightLeft() when turnSlightLeft != null:
return turnSlightLeft(_that);case _TurnSlightRight() when turnSlightRight != null:
return turnSlightRight(_that);case _Uturn() when uturn != null:
return uturn(_that);case _Arrive() when arrive != null:
return arrive(_that);case _EnterBuilding() when enterBuilding != null:
return enterBuilding(_that);case _ExitBuilding() when exitBuilding != null:
return exitBuilding(_that);case _EnterFloor() when enterFloor != null:
return enterFloor(_that);case _ExitFloor() when exitFloor != null:
return exitFloor(_that);case _UseElevator() when useElevator != null:
return useElevator(_that);case _UseStairs() when useStairs != null:
return useStairs(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Start value)  start,required TResult Function( _ContinueStraight value)  continueStraight,required TResult Function( _TurnLeft value)  turnLeft,required TResult Function( _TurnRight value)  turnRight,required TResult Function( _TurnSlightLeft value)  turnSlightLeft,required TResult Function( _TurnSlightRight value)  turnSlightRight,required TResult Function( _Uturn value)  uturn,required TResult Function( _Arrive value)  arrive,required TResult Function( _EnterBuilding value)  enterBuilding,required TResult Function( _ExitBuilding value)  exitBuilding,required TResult Function( _EnterFloor value)  enterFloor,required TResult Function( _ExitFloor value)  exitFloor,required TResult Function( _UseElevator value)  useElevator,required TResult Function( _UseStairs value)  useStairs,}){
final _that = this;
switch (_that) {
case _Start():
return start(_that);case _ContinueStraight():
return continueStraight(_that);case _TurnLeft():
return turnLeft(_that);case _TurnRight():
return turnRight(_that);case _TurnSlightLeft():
return turnSlightLeft(_that);case _TurnSlightRight():
return turnSlightRight(_that);case _Uturn():
return uturn(_that);case _Arrive():
return arrive(_that);case _EnterBuilding():
return enterBuilding(_that);case _ExitBuilding():
return exitBuilding(_that);case _EnterFloor():
return enterFloor(_that);case _ExitFloor():
return exitFloor(_that);case _UseElevator():
return useElevator(_that);case _UseStairs():
return useStairs(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Start value)?  start,TResult? Function( _ContinueStraight value)?  continueStraight,TResult? Function( _TurnLeft value)?  turnLeft,TResult? Function( _TurnRight value)?  turnRight,TResult? Function( _TurnSlightLeft value)?  turnSlightLeft,TResult? Function( _TurnSlightRight value)?  turnSlightRight,TResult? Function( _Uturn value)?  uturn,TResult? Function( _Arrive value)?  arrive,TResult? Function( _EnterBuilding value)?  enterBuilding,TResult? Function( _ExitBuilding value)?  exitBuilding,TResult? Function( _EnterFloor value)?  enterFloor,TResult? Function( _ExitFloor value)?  exitFloor,TResult? Function( _UseElevator value)?  useElevator,TResult? Function( _UseStairs value)?  useStairs,}){
final _that = this;
switch (_that) {
case _Start() when start != null:
return start(_that);case _ContinueStraight() when continueStraight != null:
return continueStraight(_that);case _TurnLeft() when turnLeft != null:
return turnLeft(_that);case _TurnRight() when turnRight != null:
return turnRight(_that);case _TurnSlightLeft() when turnSlightLeft != null:
return turnSlightLeft(_that);case _TurnSlightRight() when turnSlightRight != null:
return turnSlightRight(_that);case _Uturn() when uturn != null:
return uturn(_that);case _Arrive() when arrive != null:
return arrive(_that);case _EnterBuilding() when enterBuilding != null:
return enterBuilding(_that);case _ExitBuilding() when exitBuilding != null:
return exitBuilding(_that);case _EnterFloor() when enterFloor != null:
return enterFloor(_that);case _ExitFloor() when exitFloor != null:
return exitFloor(_that);case _UseElevator() when useElevator != null:
return useElevator(_that);case _UseStairs() when useStairs != null:
return useStairs(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  start,TResult Function()?  continueStraight,TResult Function()?  turnLeft,TResult Function()?  turnRight,TResult Function()?  turnSlightLeft,TResult Function()?  turnSlightRight,TResult Function()?  uturn,TResult Function()?  arrive,TResult Function()?  enterBuilding,TResult Function()?  exitBuilding,TResult Function()?  enterFloor,TResult Function()?  exitFloor,TResult Function()?  useElevator,TResult Function()?  useStairs,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Start() when start != null:
return start();case _ContinueStraight() when continueStraight != null:
return continueStraight();case _TurnLeft() when turnLeft != null:
return turnLeft();case _TurnRight() when turnRight != null:
return turnRight();case _TurnSlightLeft() when turnSlightLeft != null:
return turnSlightLeft();case _TurnSlightRight() when turnSlightRight != null:
return turnSlightRight();case _Uturn() when uturn != null:
return uturn();case _Arrive() when arrive != null:
return arrive();case _EnterBuilding() when enterBuilding != null:
return enterBuilding();case _ExitBuilding() when exitBuilding != null:
return exitBuilding();case _EnterFloor() when enterFloor != null:
return enterFloor();case _ExitFloor() when exitFloor != null:
return exitFloor();case _UseElevator() when useElevator != null:
return useElevator();case _UseStairs() when useStairs != null:
return useStairs();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  start,required TResult Function()  continueStraight,required TResult Function()  turnLeft,required TResult Function()  turnRight,required TResult Function()  turnSlightLeft,required TResult Function()  turnSlightRight,required TResult Function()  uturn,required TResult Function()  arrive,required TResult Function()  enterBuilding,required TResult Function()  exitBuilding,required TResult Function()  enterFloor,required TResult Function()  exitFloor,required TResult Function()  useElevator,required TResult Function()  useStairs,}) {final _that = this;
switch (_that) {
case _Start():
return start();case _ContinueStraight():
return continueStraight();case _TurnLeft():
return turnLeft();case _TurnRight():
return turnRight();case _TurnSlightLeft():
return turnSlightLeft();case _TurnSlightRight():
return turnSlightRight();case _Uturn():
return uturn();case _Arrive():
return arrive();case _EnterBuilding():
return enterBuilding();case _ExitBuilding():
return exitBuilding();case _EnterFloor():
return enterFloor();case _ExitFloor():
return exitFloor();case _UseElevator():
return useElevator();case _UseStairs():
return useStairs();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  start,TResult? Function()?  continueStraight,TResult? Function()?  turnLeft,TResult? Function()?  turnRight,TResult? Function()?  turnSlightLeft,TResult? Function()?  turnSlightRight,TResult? Function()?  uturn,TResult? Function()?  arrive,TResult? Function()?  enterBuilding,TResult? Function()?  exitBuilding,TResult? Function()?  enterFloor,TResult? Function()?  exitFloor,TResult? Function()?  useElevator,TResult? Function()?  useStairs,}) {final _that = this;
switch (_that) {
case _Start() when start != null:
return start();case _ContinueStraight() when continueStraight != null:
return continueStraight();case _TurnLeft() when turnLeft != null:
return turnLeft();case _TurnRight() when turnRight != null:
return turnRight();case _TurnSlightLeft() when turnSlightLeft != null:
return turnSlightLeft();case _TurnSlightRight() when turnSlightRight != null:
return turnSlightRight();case _Uturn() when uturn != null:
return uturn();case _Arrive() when arrive != null:
return arrive();case _EnterBuilding() when enterBuilding != null:
return enterBuilding();case _ExitBuilding() when exitBuilding != null:
return exitBuilding();case _EnterFloor() when enterFloor != null:
return enterFloor();case _ExitFloor() when exitFloor != null:
return exitFloor();case _UseElevator() when useElevator != null:
return useElevator();case _UseStairs() when useStairs != null:
return useStairs();case _:
  return null;

}
}

}

/// @nodoc


class _Start implements InstructionType {
  const _Start();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Start);
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContinueStraight);
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TurnLeft);
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TurnRight);
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TurnSlightLeft);
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TurnSlightRight);
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Uturn);
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Arrive);
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EnterBuilding);
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExitBuilding);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'InstructionType.exitBuilding()';
}


}




/// @nodoc


class _EnterFloor implements InstructionType {
  const _EnterFloor();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EnterFloor);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'InstructionType.enterFloor()';
}


}




/// @nodoc


class _ExitFloor implements InstructionType {
  const _ExitFloor();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExitFloor);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'InstructionType.exitFloor()';
}


}




/// @nodoc


class _UseElevator implements InstructionType {
  const _UseElevator();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UseElevator);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'InstructionType.useElevator()';
}


}




/// @nodoc


class _UseStairs implements InstructionType {
  const _UseStairs();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UseStairs);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'InstructionType.useStairs()';
}


}




/// @nodoc
mixin _$RouteStatus {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RouteStatus()';
}


}

/// @nodoc
class $RouteStatusCopyWith<$Res>  {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Planned value)?  planned,TResult Function( _Active value)?  active,TResult Function( _Paused value)?  paused,TResult Function( _Completed value)?  completed,TResult Function( _Cancelled value)?  cancelled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Planned() when planned != null:
return planned(_that);case _Active() when active != null:
return active(_that);case _Paused() when paused != null:
return paused(_that);case _Completed() when completed != null:
return completed(_that);case _Cancelled() when cancelled != null:
return cancelled(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Planned value)  planned,required TResult Function( _Active value)  active,required TResult Function( _Paused value)  paused,required TResult Function( _Completed value)  completed,required TResult Function( _Cancelled value)  cancelled,}){
final _that = this;
switch (_that) {
case _Planned():
return planned(_that);case _Active():
return active(_that);case _Paused():
return paused(_that);case _Completed():
return completed(_that);case _Cancelled():
return cancelled(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Planned value)?  planned,TResult? Function( _Active value)?  active,TResult? Function( _Paused value)?  paused,TResult? Function( _Completed value)?  completed,TResult? Function( _Cancelled value)?  cancelled,}){
final _that = this;
switch (_that) {
case _Planned() when planned != null:
return planned(_that);case _Active() when active != null:
return active(_that);case _Paused() when paused != null:
return paused(_that);case _Completed() when completed != null:
return completed(_that);case _Cancelled() when cancelled != null:
return cancelled(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  planned,TResult Function()?  active,TResult Function()?  paused,TResult Function()?  completed,TResult Function()?  cancelled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Planned() when planned != null:
return planned();case _Active() when active != null:
return active();case _Paused() when paused != null:
return paused();case _Completed() when completed != null:
return completed();case _Cancelled() when cancelled != null:
return cancelled();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  planned,required TResult Function()  active,required TResult Function()  paused,required TResult Function()  completed,required TResult Function()  cancelled,}) {final _that = this;
switch (_that) {
case _Planned():
return planned();case _Active():
return active();case _Paused():
return paused();case _Completed():
return completed();case _Cancelled():
return cancelled();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  planned,TResult? Function()?  active,TResult? Function()?  paused,TResult? Function()?  completed,TResult? Function()?  cancelled,}) {final _that = this;
switch (_that) {
case _Planned() when planned != null:
return planned();case _Active() when active != null:
return active();case _Paused() when paused != null:
return paused();case _Completed() when completed != null:
return completed();case _Cancelled() when cancelled != null:
return cancelled();case _:
  return null;

}
}

}

/// @nodoc


class _Planned implements RouteStatus {
  const _Planned();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Planned);
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Active);
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Paused);
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Completed);
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Cancelled);
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

 String get id; NavigationRoute get route; int get currentInstructionIndex; LatLng get currentPosition; DateTime get startedAt; DateTime? get completedAt; double? get remainingDistance; Duration? get remainingTime; bool get isVoiceGuidanceEnabled; bool get isRerouting; String? get currentBuildingId; String? get currentFloorId; String? get currentRoomId;
/// Create a copy of NavigationSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigationSessionCopyWith<NavigationSession> get copyWith => _$NavigationSessionCopyWithImpl<NavigationSession>(this as NavigationSession, _$identity);

  /// Serializes this NavigationSession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as NavigationSession;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigationSession&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.route, _this.route) || other.route == _this.route)&&(identical(other.currentInstructionIndex, _this.currentInstructionIndex) || other.currentInstructionIndex == _this.currentInstructionIndex)&&(identical(other.currentPosition, _this.currentPosition) || other.currentPosition == _this.currentPosition)&&(identical(other.startedAt, _this.startedAt) || other.startedAt == _this.startedAt)&&(identical(other.completedAt, _this.completedAt) || other.completedAt == _this.completedAt)&&(identical(other.remainingDistance, _this.remainingDistance) || other.remainingDistance == _this.remainingDistance)&&(identical(other.remainingTime, _this.remainingTime) || other.remainingTime == _this.remainingTime)&&(identical(other.isVoiceGuidanceEnabled, _this.isVoiceGuidanceEnabled) || other.isVoiceGuidanceEnabled == _this.isVoiceGuidanceEnabled)&&(identical(other.isRerouting, _this.isRerouting) || other.isRerouting == _this.isRerouting)&&(identical(other.currentBuildingId, _this.currentBuildingId) || other.currentBuildingId == _this.currentBuildingId)&&(identical(other.currentFloorId, _this.currentFloorId) || other.currentFloorId == _this.currentFloorId)&&(identical(other.currentRoomId, _this.currentRoomId) || other.currentRoomId == _this.currentRoomId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as NavigationSession;
  return Object.hash(runtimeType,_this.id,_this.route,_this.currentInstructionIndex,_this.currentPosition,_this.startedAt,_this.completedAt,_this.remainingDistance,_this.remainingTime,_this.isVoiceGuidanceEnabled,_this.isRerouting,_this.currentBuildingId,_this.currentFloorId,_this.currentRoomId);
}

@override
String toString() {
  final _this = this as NavigationSession;
  return 'NavigationSession(id: ${_this.id}, route: ${_this.route}, currentInstructionIndex: ${_this.currentInstructionIndex}, currentPosition: ${_this.currentPosition}, startedAt: ${_this.startedAt}, completedAt: ${_this.completedAt}, remainingDistance: ${_this.remainingDistance}, remainingTime: ${_this.remainingTime}, isVoiceGuidanceEnabled: ${_this.isVoiceGuidanceEnabled}, isRerouting: ${_this.isRerouting}, currentBuildingId: ${_this.currentBuildingId}, currentFloorId: ${_this.currentFloorId}, currentRoomId: ${_this.currentRoomId})';
}


}

/// @nodoc
abstract mixin class $NavigationSessionCopyWith<$Res>  {
  factory $NavigationSessionCopyWith(NavigationSession value, $Res Function(NavigationSession) _then) = _$NavigationSessionCopyWithImpl;
@useResult
$Res call({
 String id, NavigationRoute route, int currentInstructionIndex, LatLng currentPosition, DateTime startedAt, DateTime? completedAt, double? remainingDistance, Duration? remainingTime, bool isVoiceGuidanceEnabled, bool isRerouting, String? currentBuildingId, String? currentFloorId, String? currentRoomId
});


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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? route = null,Object? currentInstructionIndex = null,Object? currentPosition = null,Object? startedAt = null,Object? completedAt = freezed,Object? remainingDistance = freezed,Object? remainingTime = freezed,Object? isVoiceGuidanceEnabled = null,Object? isRerouting = null,Object? currentBuildingId = freezed,Object? currentFloorId = freezed,Object? currentRoomId = freezed,}) {
  return _then(NavigationSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,route: null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as NavigationRoute,currentInstructionIndex: null == currentInstructionIndex ? _self.currentInstructionIndex : currentInstructionIndex // ignore: cast_nullable_to_non_nullable
as int,currentPosition: null == currentPosition ? _self.currentPosition : currentPosition // ignore: cast_nullable_to_non_nullable
as LatLng,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,remainingDistance: freezed == remainingDistance ? _self.remainingDistance : remainingDistance // ignore: cast_nullable_to_non_nullable
as double?,remainingTime: freezed == remainingTime ? _self.remainingTime : remainingTime // ignore: cast_nullable_to_non_nullable
as Duration?,isVoiceGuidanceEnabled: null == isVoiceGuidanceEnabled ? _self.isVoiceGuidanceEnabled : isVoiceGuidanceEnabled // ignore: cast_nullable_to_non_nullable
as bool,isRerouting: null == isRerouting ? _self.isRerouting : isRerouting // ignore: cast_nullable_to_non_nullable
as bool,currentBuildingId: freezed == currentBuildingId ? _self.currentBuildingId : currentBuildingId // ignore: cast_nullable_to_non_nullable
as String?,currentFloorId: freezed == currentFloorId ? _self.currentFloorId : currentFloorId // ignore: cast_nullable_to_non_nullable
as String?,currentRoomId: freezed == currentRoomId ? _self.currentRoomId : currentRoomId // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NavigationSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NavigationSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NavigationSession value)  $default,){
final _that = this;
switch (_that) {
case _NavigationSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NavigationSession value)?  $default,){
final _that = this;
switch (_that) {
case _NavigationSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  NavigationRoute route,  int currentInstructionIndex,  LatLng currentPosition,  DateTime startedAt,  DateTime? completedAt,  double? remainingDistance,  Duration? remainingTime,  bool isVoiceGuidanceEnabled,  bool isRerouting,  String? currentBuildingId,  String? currentFloorId,  String? currentRoomId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NavigationSession() when $default != null:
return $default(_that.id,_that.route,_that.currentInstructionIndex,_that.currentPosition,_that.startedAt,_that.completedAt,_that.remainingDistance,_that.remainingTime,_that.isVoiceGuidanceEnabled,_that.isRerouting,_that.currentBuildingId,_that.currentFloorId,_that.currentRoomId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  NavigationRoute route,  int currentInstructionIndex,  LatLng currentPosition,  DateTime startedAt,  DateTime? completedAt,  double? remainingDistance,  Duration? remainingTime,  bool isVoiceGuidanceEnabled,  bool isRerouting,  String? currentBuildingId,  String? currentFloorId,  String? currentRoomId)  $default,) {final _that = this;
switch (_that) {
case _NavigationSession():
return $default(_that.id,_that.route,_that.currentInstructionIndex,_that.currentPosition,_that.startedAt,_that.completedAt,_that.remainingDistance,_that.remainingTime,_that.isVoiceGuidanceEnabled,_that.isRerouting,_that.currentBuildingId,_that.currentFloorId,_that.currentRoomId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  NavigationRoute route,  int currentInstructionIndex,  LatLng currentPosition,  DateTime startedAt,  DateTime? completedAt,  double? remainingDistance,  Duration? remainingTime,  bool isVoiceGuidanceEnabled,  bool isRerouting,  String? currentBuildingId,  String? currentFloorId,  String? currentRoomId)?  $default,) {final _that = this;
switch (_that) {
case _NavigationSession() when $default != null:
return $default(_that.id,_that.route,_that.currentInstructionIndex,_that.currentPosition,_that.startedAt,_that.completedAt,_that.remainingDistance,_that.remainingTime,_that.isVoiceGuidanceEnabled,_that.isRerouting,_that.currentBuildingId,_that.currentFloorId,_that.currentRoomId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NavigationSession extends NavigationSession {
  const _NavigationSession({required this.id, required this.route, required this.currentInstructionIndex, required this.currentPosition, required this.startedAt, this.completedAt, this.remainingDistance, this.remainingTime, this.isVoiceGuidanceEnabled = false, this.isRerouting = false, this.currentBuildingId, this.currentFloorId, this.currentRoomId}): super._();
  factory _NavigationSession.fromJson(Map<String, dynamic> json) => _$NavigationSessionFromJson(json);

@override final  String id;
@override final  NavigationRoute route;
@override final  int currentInstructionIndex;
@override final  LatLng currentPosition;
@override final  DateTime startedAt;
@override final  DateTime? completedAt;
@override final  double? remainingDistance;
@override final  Duration? remainingTime;
@override@JsonKey() final  bool isVoiceGuidanceEnabled;
@override@JsonKey() final  bool isRerouting;
@override final  String? currentBuildingId;
@override final  String? currentFloorId;
@override final  String? currentRoomId;

/// Create a copy of NavigationSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NavigationSessionCopyWith<_NavigationSession> get copyWith => __$NavigationSessionCopyWithImpl<_NavigationSession>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NavigationSessionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NavigationSession&&(identical(other.id, id) || other.id == id)&&(identical(other.route, route) || other.route == route)&&(identical(other.currentInstructionIndex, currentInstructionIndex) || other.currentInstructionIndex == currentInstructionIndex)&&(identical(other.currentPosition, currentPosition) || other.currentPosition == currentPosition)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.remainingDistance, remainingDistance) || other.remainingDistance == remainingDistance)&&(identical(other.remainingTime, remainingTime) || other.remainingTime == remainingTime)&&(identical(other.isVoiceGuidanceEnabled, isVoiceGuidanceEnabled) || other.isVoiceGuidanceEnabled == isVoiceGuidanceEnabled)&&(identical(other.isRerouting, isRerouting) || other.isRerouting == isRerouting)&&(identical(other.currentBuildingId, currentBuildingId) || other.currentBuildingId == currentBuildingId)&&(identical(other.currentFloorId, currentFloorId) || other.currentFloorId == currentFloorId)&&(identical(other.currentRoomId, currentRoomId) || other.currentRoomId == currentRoomId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,route,currentInstructionIndex,currentPosition,startedAt,completedAt,remainingDistance,remainingTime,isVoiceGuidanceEnabled,isRerouting,currentBuildingId,currentFloorId,currentRoomId);
}

@override
String toString() {
    return 'NavigationSession(id: $id, route: $route, currentInstructionIndex: $currentInstructionIndex, currentPosition: $currentPosition, startedAt: $startedAt, completedAt: $completedAt, remainingDistance: $remainingDistance, remainingTime: $remainingTime, isVoiceGuidanceEnabled: $isVoiceGuidanceEnabled, isRerouting: $isRerouting, currentBuildingId: $currentBuildingId, currentFloorId: $currentFloorId, currentRoomId: $currentRoomId)';
}


}

/// @nodoc
abstract mixin class _$NavigationSessionCopyWith<$Res> implements $NavigationSessionCopyWith<$Res> {
  factory _$NavigationSessionCopyWith(_NavigationSession value, $Res Function(_NavigationSession) _then) = __$NavigationSessionCopyWithImpl;
@override @useResult
$Res call({
 String id, NavigationRoute route, int currentInstructionIndex, LatLng currentPosition, DateTime startedAt, DateTime? completedAt, double? remainingDistance, Duration? remainingTime, bool isVoiceGuidanceEnabled, bool isRerouting, String? currentBuildingId, String? currentFloorId, String? currentRoomId
});


@override $NavigationRouteCopyWith<$Res> get route;

}
/// @nodoc
class __$NavigationSessionCopyWithImpl<$Res>
    implements _$NavigationSessionCopyWith<$Res> {
  __$NavigationSessionCopyWithImpl(this._self, this._then);

  final _NavigationSession _self;
  final $Res Function(_NavigationSession) _then;

/// Create a copy of NavigationSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? route = null,Object? currentInstructionIndex = null,Object? currentPosition = null,Object? startedAt = null,Object? completedAt = freezed,Object? remainingDistance = freezed,Object? remainingTime = freezed,Object? isVoiceGuidanceEnabled = null,Object? isRerouting = null,Object? currentBuildingId = freezed,Object? currentFloorId = freezed,Object? currentRoomId = freezed,}) {
  return _then(_NavigationSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,route: null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as NavigationRoute,currentInstructionIndex: null == currentInstructionIndex ? _self.currentInstructionIndex : currentInstructionIndex // ignore: cast_nullable_to_non_nullable
as int,currentPosition: null == currentPosition ? _self.currentPosition : currentPosition // ignore: cast_nullable_to_non_nullable
as LatLng,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,remainingDistance: freezed == remainingDistance ? _self.remainingDistance : remainingDistance // ignore: cast_nullable_to_non_nullable
as double?,remainingTime: freezed == remainingTime ? _self.remainingTime : remainingTime // ignore: cast_nullable_to_non_nullable
as Duration?,isVoiceGuidanceEnabled: null == isVoiceGuidanceEnabled ? _self.isVoiceGuidanceEnabled : isVoiceGuidanceEnabled // ignore: cast_nullable_to_non_nullable
as bool,isRerouting: null == isRerouting ? _self.isRerouting : isRerouting // ignore: cast_nullable_to_non_nullable
as bool,currentBuildingId: freezed == currentBuildingId ? _self.currentBuildingId : currentBuildingId // ignore: cast_nullable_to_non_nullable
as String?,currentFloorId: freezed == currentFloorId ? _self.currentFloorId : currentFloorId // ignore: cast_nullable_to_non_nullable
as String?,currentRoomId: freezed == currentRoomId ? _self.currentRoomId : currentRoomId // ignore: cast_nullable_to_non_nullable
as String?,
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

 String get id; String get name; NavigationRoute get route; DateTime get savedAt; bool get isFavorite; int get useCount;
/// Create a copy of SavedRoute
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedRouteCopyWith<SavedRoute> get copyWith => _$SavedRouteCopyWithImpl<SavedRoute>(this as SavedRoute, _$identity);

  /// Serializes this SavedRoute to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SavedRoute;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedRoute&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.route, _this.route) || other.route == _this.route)&&(identical(other.savedAt, _this.savedAt) || other.savedAt == _this.savedAt)&&(identical(other.isFavorite, _this.isFavorite) || other.isFavorite == _this.isFavorite)&&(identical(other.useCount, _this.useCount) || other.useCount == _this.useCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SavedRoute;
  return Object.hash(runtimeType,_this.id,_this.name,_this.route,_this.savedAt,_this.isFavorite,_this.useCount);
}

@override
String toString() {
  final _this = this as SavedRoute;
  return 'SavedRoute(id: ${_this.id}, name: ${_this.name}, route: ${_this.route}, savedAt: ${_this.savedAt}, isFavorite: ${_this.isFavorite}, useCount: ${_this.useCount})';
}


}

/// @nodoc
abstract mixin class $SavedRouteCopyWith<$Res>  {
  factory $SavedRouteCopyWith(SavedRoute value, $Res Function(SavedRoute) _then) = _$SavedRouteCopyWithImpl;
@useResult
$Res call({
 String id, String name, NavigationRoute route, DateTime savedAt, bool isFavorite, int useCount
});


$NavigationRouteCopyWith<$Res> get route;

}
/// @nodoc
class _$SavedRouteCopyWithImpl<$Res>
    implements $SavedRouteCopyWith<$Res> {
  _$SavedRouteCopyWithImpl(this._self, this._then);

  final SavedRoute _self;
  final $Res Function(SavedRoute) _then;

/// Create a copy of SavedRoute
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? route = null,Object? savedAt = null,Object? isFavorite = null,Object? useCount = null,}) {
  return _then(SavedRoute(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,route: null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as NavigationRoute,savedAt: null == savedAt ? _self.savedAt : savedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,useCount: null == useCount ? _self.useCount : useCount // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavedRoute value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavedRoute() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavedRoute value)  $default,){
final _that = this;
switch (_that) {
case _SavedRoute():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavedRoute value)?  $default,){
final _that = this;
switch (_that) {
case _SavedRoute() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  NavigationRoute route,  DateTime savedAt,  bool isFavorite,  int useCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavedRoute() when $default != null:
return $default(_that.id,_that.name,_that.route,_that.savedAt,_that.isFavorite,_that.useCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  NavigationRoute route,  DateTime savedAt,  bool isFavorite,  int useCount)  $default,) {final _that = this;
switch (_that) {
case _SavedRoute():
return $default(_that.id,_that.name,_that.route,_that.savedAt,_that.isFavorite,_that.useCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  NavigationRoute route,  DateTime savedAt,  bool isFavorite,  int useCount)?  $default,) {final _that = this;
switch (_that) {
case _SavedRoute() when $default != null:
return $default(_that.id,_that.name,_that.route,_that.savedAt,_that.isFavorite,_that.useCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SavedRoute extends SavedRoute {
  const _SavedRoute({required this.id, required this.name, required this.route, required this.savedAt, this.isFavorite = false, this.useCount = 0}): super._();
  factory _SavedRoute.fromJson(Map<String, dynamic> json) => _$SavedRouteFromJson(json);

@override final  String id;
@override final  String name;
@override final  NavigationRoute route;
@override final  DateTime savedAt;
@override@JsonKey() final  bool isFavorite;
@override@JsonKey() final  int useCount;

/// Create a copy of SavedRoute
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavedRouteCopyWith<_SavedRoute> get copyWith => __$SavedRouteCopyWithImpl<_SavedRoute>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SavedRouteToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavedRoute&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.route, route) || other.route == route)&&(identical(other.savedAt, savedAt) || other.savedAt == savedAt)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.useCount, useCount) || other.useCount == useCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,route,savedAt,isFavorite,useCount);
}

@override
String toString() {
    return 'SavedRoute(id: $id, name: $name, route: $route, savedAt: $savedAt, isFavorite: $isFavorite, useCount: $useCount)';
}


}

/// @nodoc
abstract mixin class _$SavedRouteCopyWith<$Res> implements $SavedRouteCopyWith<$Res> {
  factory _$SavedRouteCopyWith(_SavedRoute value, $Res Function(_SavedRoute) _then) = __$SavedRouteCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, NavigationRoute route, DateTime savedAt, bool isFavorite, int useCount
});


@override $NavigationRouteCopyWith<$Res> get route;

}
/// @nodoc
class __$SavedRouteCopyWithImpl<$Res>
    implements _$SavedRouteCopyWith<$Res> {
  __$SavedRouteCopyWithImpl(this._self, this._then);

  final _SavedRoute _self;
  final $Res Function(_SavedRoute) _then;

/// Create a copy of SavedRoute
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? route = null,Object? savedAt = null,Object? isFavorite = null,Object? useCount = null,}) {
  return _then(_SavedRoute(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,route: null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as NavigationRoute,savedAt: null == savedAt ? _self.savedAt : savedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,useCount: null == useCount ? _self.useCount : useCount // ignore: cast_nullable_to_non_nullable
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


/// @nodoc
mixin _$NavigationPreferences {

 bool get avoidStairs; bool get preferElevators; bool get accessibleRoute; bool get avoidIndoor; bool get preferShortestPath; bool get preferSafestPath; Map<String, dynamic> get customWeights;
/// Create a copy of NavigationPreferences
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigationPreferencesCopyWith<NavigationPreferences> get copyWith => _$NavigationPreferencesCopyWithImpl<NavigationPreferences>(this as NavigationPreferences, _$identity);

  /// Serializes this NavigationPreferences to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as NavigationPreferences;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigationPreferences&&(identical(other.avoidStairs, _this.avoidStairs) || other.avoidStairs == _this.avoidStairs)&&(identical(other.preferElevators, _this.preferElevators) || other.preferElevators == _this.preferElevators)&&(identical(other.accessibleRoute, _this.accessibleRoute) || other.accessibleRoute == _this.accessibleRoute)&&(identical(other.avoidIndoor, _this.avoidIndoor) || other.avoidIndoor == _this.avoidIndoor)&&(identical(other.preferShortestPath, _this.preferShortestPath) || other.preferShortestPath == _this.preferShortestPath)&&(identical(other.preferSafestPath, _this.preferSafestPath) || other.preferSafestPath == _this.preferSafestPath)&&const DeepCollectionEquality().equals(other.customWeights, _this.customWeights));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as NavigationPreferences;
  return Object.hash(runtimeType,_this.avoidStairs,_this.preferElevators,_this.accessibleRoute,_this.avoidIndoor,_this.preferShortestPath,_this.preferSafestPath,const DeepCollectionEquality().hash(_this.customWeights));
}

@override
String toString() {
  final _this = this as NavigationPreferences;
  return 'NavigationPreferences(avoidStairs: ${_this.avoidStairs}, preferElevators: ${_this.preferElevators}, accessibleRoute: ${_this.accessibleRoute}, avoidIndoor: ${_this.avoidIndoor}, preferShortestPath: ${_this.preferShortestPath}, preferSafestPath: ${_this.preferSafestPath}, customWeights: ${_this.customWeights})';
}


}

/// @nodoc
abstract mixin class $NavigationPreferencesCopyWith<$Res>  {
  factory $NavigationPreferencesCopyWith(NavigationPreferences value, $Res Function(NavigationPreferences) _then) = _$NavigationPreferencesCopyWithImpl;
@useResult
$Res call({
 bool avoidStairs, bool preferElevators, bool accessibleRoute, bool avoidIndoor, bool preferShortestPath, bool preferSafestPath, Map<String, dynamic> customWeights
});




}
/// @nodoc
class _$NavigationPreferencesCopyWithImpl<$Res>
    implements $NavigationPreferencesCopyWith<$Res> {
  _$NavigationPreferencesCopyWithImpl(this._self, this._then);

  final NavigationPreferences _self;
  final $Res Function(NavigationPreferences) _then;

/// Create a copy of NavigationPreferences
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? avoidStairs = null,Object? preferElevators = null,Object? accessibleRoute = null,Object? avoidIndoor = null,Object? preferShortestPath = null,Object? preferSafestPath = null,Object? customWeights = null,}) {
  return _then(NavigationPreferences(
avoidStairs: null == avoidStairs ? _self.avoidStairs : avoidStairs // ignore: cast_nullable_to_non_nullable
as bool,preferElevators: null == preferElevators ? _self.preferElevators : preferElevators // ignore: cast_nullable_to_non_nullable
as bool,accessibleRoute: null == accessibleRoute ? _self.accessibleRoute : accessibleRoute // ignore: cast_nullable_to_non_nullable
as bool,avoidIndoor: null == avoidIndoor ? _self.avoidIndoor : avoidIndoor // ignore: cast_nullable_to_non_nullable
as bool,preferShortestPath: null == preferShortestPath ? _self.preferShortestPath : preferShortestPath // ignore: cast_nullable_to_non_nullable
as bool,preferSafestPath: null == preferSafestPath ? _self.preferSafestPath : preferSafestPath // ignore: cast_nullable_to_non_nullable
as bool,customWeights: null == customWeights ? _self.customWeights : customWeights // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [NavigationPreferences].
extension NavigationPreferencesPatterns on NavigationPreferences {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NavigationPreferences value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NavigationPreferences() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NavigationPreferences value)  $default,){
final _that = this;
switch (_that) {
case _NavigationPreferences():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NavigationPreferences value)?  $default,){
final _that = this;
switch (_that) {
case _NavigationPreferences() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool avoidStairs,  bool preferElevators,  bool accessibleRoute,  bool avoidIndoor,  bool preferShortestPath,  bool preferSafestPath,  Map<String, dynamic> customWeights)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NavigationPreferences() when $default != null:
return $default(_that.avoidStairs,_that.preferElevators,_that.accessibleRoute,_that.avoidIndoor,_that.preferShortestPath,_that.preferSafestPath,_that.customWeights);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool avoidStairs,  bool preferElevators,  bool accessibleRoute,  bool avoidIndoor,  bool preferShortestPath,  bool preferSafestPath,  Map<String, dynamic> customWeights)  $default,) {final _that = this;
switch (_that) {
case _NavigationPreferences():
return $default(_that.avoidStairs,_that.preferElevators,_that.accessibleRoute,_that.avoidIndoor,_that.preferShortestPath,_that.preferSafestPath,_that.customWeights);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool avoidStairs,  bool preferElevators,  bool accessibleRoute,  bool avoidIndoor,  bool preferShortestPath,  bool preferSafestPath,  Map<String, dynamic> customWeights)?  $default,) {final _that = this;
switch (_that) {
case _NavigationPreferences() when $default != null:
return $default(_that.avoidStairs,_that.preferElevators,_that.accessibleRoute,_that.avoidIndoor,_that.preferShortestPath,_that.preferSafestPath,_that.customWeights);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NavigationPreferences extends NavigationPreferences {
  const _NavigationPreferences({this.avoidStairs = true, this.preferElevators = true, this.accessibleRoute = true, this.avoidIndoor = false, this.preferShortestPath = false, this.preferSafestPath = false,  Map<String, dynamic> customWeights = const {}}): _customWeights = customWeights,super._();
  factory _NavigationPreferences.fromJson(Map<String, dynamic> json) => _$NavigationPreferencesFromJson(json);

@override@JsonKey() final  bool avoidStairs;
@override@JsonKey() final  bool preferElevators;
@override@JsonKey() final  bool accessibleRoute;
@override@JsonKey() final  bool avoidIndoor;
@override@JsonKey() final  bool preferShortestPath;
@override@JsonKey() final  bool preferSafestPath;
 final  Map<String, dynamic> _customWeights;
@override@JsonKey() Map<String, dynamic> get customWeights {
  if (_customWeights is EqualUnmodifiableMapView) return _customWeights;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_customWeights);
}


/// Create a copy of NavigationPreferences
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NavigationPreferencesCopyWith<_NavigationPreferences> get copyWith => __$NavigationPreferencesCopyWithImpl<_NavigationPreferences>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NavigationPreferencesToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NavigationPreferences&&(identical(other.avoidStairs, avoidStairs) || other.avoidStairs == avoidStairs)&&(identical(other.preferElevators, preferElevators) || other.preferElevators == preferElevators)&&(identical(other.accessibleRoute, accessibleRoute) || other.accessibleRoute == accessibleRoute)&&(identical(other.avoidIndoor, avoidIndoor) || other.avoidIndoor == avoidIndoor)&&(identical(other.preferShortestPath, preferShortestPath) || other.preferShortestPath == preferShortestPath)&&(identical(other.preferSafestPath, preferSafestPath) || other.preferSafestPath == preferSafestPath)&&const DeepCollectionEquality().equals(other.customWeights, _customWeights));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,avoidStairs,preferElevators,accessibleRoute,avoidIndoor,preferShortestPath,preferSafestPath,const DeepCollectionEquality().hash(_customWeights));
}

@override
String toString() {
    return 'NavigationPreferences(avoidStairs: $avoidStairs, preferElevators: $preferElevators, accessibleRoute: $accessibleRoute, avoidIndoor: $avoidIndoor, preferShortestPath: $preferShortestPath, preferSafestPath: $preferSafestPath, customWeights: $customWeights)';
}


}

/// @nodoc
abstract mixin class _$NavigationPreferencesCopyWith<$Res> implements $NavigationPreferencesCopyWith<$Res> {
  factory _$NavigationPreferencesCopyWith(_NavigationPreferences value, $Res Function(_NavigationPreferences) _then) = __$NavigationPreferencesCopyWithImpl;
@override @useResult
$Res call({
 bool avoidStairs, bool preferElevators, bool accessibleRoute, bool avoidIndoor, bool preferShortestPath, bool preferSafestPath, Map<String, dynamic> customWeights
});




}
/// @nodoc
class __$NavigationPreferencesCopyWithImpl<$Res>
    implements _$NavigationPreferencesCopyWith<$Res> {
  __$NavigationPreferencesCopyWithImpl(this._self, this._then);

  final _NavigationPreferences _self;
  final $Res Function(_NavigationPreferences) _then;

/// Create a copy of NavigationPreferences
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? avoidStairs = null,Object? preferElevators = null,Object? accessibleRoute = null,Object? avoidIndoor = null,Object? preferShortestPath = null,Object? preferSafestPath = null,Object? customWeights = null,}) {
  return _then(_NavigationPreferences(
avoidStairs: null == avoidStairs ? _self.avoidStairs : avoidStairs // ignore: cast_nullable_to_non_nullable
as bool,preferElevators: null == preferElevators ? _self.preferElevators : preferElevators // ignore: cast_nullable_to_non_nullable
as bool,accessibleRoute: null == accessibleRoute ? _self.accessibleRoute : accessibleRoute // ignore: cast_nullable_to_non_nullable
as bool,avoidIndoor: null == avoidIndoor ? _self.avoidIndoor : avoidIndoor // ignore: cast_nullable_to_non_nullable
as bool,preferShortestPath: null == preferShortestPath ? _self.preferShortestPath : preferShortestPath // ignore: cast_nullable_to_non_nullable
as bool,preferSafestPath: null == preferSafestPath ? _self.preferSafestPath : preferSafestPath // ignore: cast_nullable_to_non_nullable
as bool,customWeights: null == customWeights ? _self._customWeights : customWeights // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}


/// @nodoc
mixin _$IndoorLocation {

 String get buildingId; String get floorId; String? get roomId; String? get roomName; LatLng get coordinates; double? get accuracy; String? get description; Map<String, dynamic>? get metadata;
/// Create a copy of IndoorLocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IndoorLocationCopyWith<IndoorLocation> get copyWith => _$IndoorLocationCopyWithImpl<IndoorLocation>(this as IndoorLocation, _$identity);

  /// Serializes this IndoorLocation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as IndoorLocation;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IndoorLocation&&(identical(other.buildingId, _this.buildingId) || other.buildingId == _this.buildingId)&&(identical(other.floorId, _this.floorId) || other.floorId == _this.floorId)&&(identical(other.roomId, _this.roomId) || other.roomId == _this.roomId)&&(identical(other.roomName, _this.roomName) || other.roomName == _this.roomName)&&(identical(other.coordinates, _this.coordinates) || other.coordinates == _this.coordinates)&&(identical(other.accuracy, _this.accuracy) || other.accuracy == _this.accuracy)&&(identical(other.description, _this.description) || other.description == _this.description)&&const DeepCollectionEquality().equals(other.metadata, _this.metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as IndoorLocation;
  return Object.hash(runtimeType,_this.buildingId,_this.floorId,_this.roomId,_this.roomName,_this.coordinates,_this.accuracy,_this.description,const DeepCollectionEquality().hash(_this.metadata));
}

@override
String toString() {
  final _this = this as IndoorLocation;
  return 'IndoorLocation(buildingId: ${_this.buildingId}, floorId: ${_this.floorId}, roomId: ${_this.roomId}, roomName: ${_this.roomName}, coordinates: ${_this.coordinates}, accuracy: ${_this.accuracy}, description: ${_this.description}, metadata: ${_this.metadata})';
}


}

/// @nodoc
abstract mixin class $IndoorLocationCopyWith<$Res>  {
  factory $IndoorLocationCopyWith(IndoorLocation value, $Res Function(IndoorLocation) _then) = _$IndoorLocationCopyWithImpl;
@useResult
$Res call({
 String buildingId, String floorId, String? roomId, String? roomName, LatLng coordinates, double? accuracy, String? description, Map<String, dynamic>? metadata
});




}
/// @nodoc
class _$IndoorLocationCopyWithImpl<$Res>
    implements $IndoorLocationCopyWith<$Res> {
  _$IndoorLocationCopyWithImpl(this._self, this._then);

  final IndoorLocation _self;
  final $Res Function(IndoorLocation) _then;

/// Create a copy of IndoorLocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? buildingId = null,Object? floorId = null,Object? roomId = freezed,Object? roomName = freezed,Object? coordinates = null,Object? accuracy = freezed,Object? description = freezed,Object? metadata = freezed,}) {
  return _then(IndoorLocation(
buildingId: null == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as String,floorId: null == floorId ? _self.floorId : floorId // ignore: cast_nullable_to_non_nullable
as String,roomId: freezed == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String?,roomName: freezed == roomName ? _self.roomName : roomName // ignore: cast_nullable_to_non_nullable
as String?,coordinates: null == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as LatLng,accuracy: freezed == accuracy ? _self.accuracy : accuracy // ignore: cast_nullable_to_non_nullable
as double?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [IndoorLocation].
extension IndoorLocationPatterns on IndoorLocation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IndoorLocation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IndoorLocation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IndoorLocation value)  $default,){
final _that = this;
switch (_that) {
case _IndoorLocation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IndoorLocation value)?  $default,){
final _that = this;
switch (_that) {
case _IndoorLocation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String buildingId,  String floorId,  String? roomId,  String? roomName,  LatLng coordinates,  double? accuracy,  String? description,  Map<String, dynamic>? metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IndoorLocation() when $default != null:
return $default(_that.buildingId,_that.floorId,_that.roomId,_that.roomName,_that.coordinates,_that.accuracy,_that.description,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String buildingId,  String floorId,  String? roomId,  String? roomName,  LatLng coordinates,  double? accuracy,  String? description,  Map<String, dynamic>? metadata)  $default,) {final _that = this;
switch (_that) {
case _IndoorLocation():
return $default(_that.buildingId,_that.floorId,_that.roomId,_that.roomName,_that.coordinates,_that.accuracy,_that.description,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String buildingId,  String floorId,  String? roomId,  String? roomName,  LatLng coordinates,  double? accuracy,  String? description,  Map<String, dynamic>? metadata)?  $default,) {final _that = this;
switch (_that) {
case _IndoorLocation() when $default != null:
return $default(_that.buildingId,_that.floorId,_that.roomId,_that.roomName,_that.coordinates,_that.accuracy,_that.description,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IndoorLocation extends IndoorLocation {
  const _IndoorLocation({required this.buildingId, required this.floorId, this.roomId, this.roomName, required this.coordinates, this.accuracy, this.description,  Map<String, dynamic>? metadata}): _metadata = metadata,super._();
  factory _IndoorLocation.fromJson(Map<String, dynamic> json) => _$IndoorLocationFromJson(json);

@override final  String buildingId;
@override final  String floorId;
@override final  String? roomId;
@override final  String? roomName;
@override final  LatLng coordinates;
@override final  double? accuracy;
@override final  String? description;
 final  Map<String, dynamic>? _metadata;
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of IndoorLocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IndoorLocationCopyWith<_IndoorLocation> get copyWith => __$IndoorLocationCopyWithImpl<_IndoorLocation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IndoorLocationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _IndoorLocation&&(identical(other.buildingId, buildingId) || other.buildingId == buildingId)&&(identical(other.floorId, floorId) || other.floorId == floorId)&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.roomName, roomName) || other.roomName == roomName)&&(identical(other.coordinates, coordinates) || other.coordinates == coordinates)&&(identical(other.accuracy, accuracy) || other.accuracy == accuracy)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,buildingId,floorId,roomId,roomName,coordinates,accuracy,description,const DeepCollectionEquality().hash(_metadata));
}

@override
String toString() {
    return 'IndoorLocation(buildingId: $buildingId, floorId: $floorId, roomId: $roomId, roomName: $roomName, coordinates: $coordinates, accuracy: $accuracy, description: $description, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$IndoorLocationCopyWith<$Res> implements $IndoorLocationCopyWith<$Res> {
  factory _$IndoorLocationCopyWith(_IndoorLocation value, $Res Function(_IndoorLocation) _then) = __$IndoorLocationCopyWithImpl;
@override @useResult
$Res call({
 String buildingId, String floorId, String? roomId, String? roomName, LatLng coordinates, double? accuracy, String? description, Map<String, dynamic>? metadata
});




}
/// @nodoc
class __$IndoorLocationCopyWithImpl<$Res>
    implements _$IndoorLocationCopyWith<$Res> {
  __$IndoorLocationCopyWithImpl(this._self, this._then);

  final _IndoorLocation _self;
  final $Res Function(_IndoorLocation) _then;

/// Create a copy of IndoorLocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? buildingId = null,Object? floorId = null,Object? roomId = freezed,Object? roomName = freezed,Object? coordinates = null,Object? accuracy = freezed,Object? description = freezed,Object? metadata = freezed,}) {
  return _then(_IndoorLocation(
buildingId: null == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as String,floorId: null == floorId ? _self.floorId : floorId // ignore: cast_nullable_to_non_nullable
as String,roomId: freezed == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String?,roomName: freezed == roomName ? _self.roomName : roomName // ignore: cast_nullable_to_non_nullable
as String?,coordinates: null == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as LatLng,accuracy: freezed == accuracy ? _self.accuracy : accuracy // ignore: cast_nullable_to_non_nullable
as double?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$OutdoorLocation {

 LatLng get coordinates; double? get accuracy; double? get altitude; double? get heading; double? get speed; String? get address; String? get placeName; DateTime? get timestamp; Map<String, dynamic>? get metadata;
/// Create a copy of OutdoorLocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutdoorLocationCopyWith<OutdoorLocation> get copyWith => _$OutdoorLocationCopyWithImpl<OutdoorLocation>(this as OutdoorLocation, _$identity);

  /// Serializes this OutdoorLocation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OutdoorLocation;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutdoorLocation&&(identical(other.coordinates, _this.coordinates) || other.coordinates == _this.coordinates)&&(identical(other.accuracy, _this.accuracy) || other.accuracy == _this.accuracy)&&(identical(other.altitude, _this.altitude) || other.altitude == _this.altitude)&&(identical(other.heading, _this.heading) || other.heading == _this.heading)&&(identical(other.speed, _this.speed) || other.speed == _this.speed)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.placeName, _this.placeName) || other.placeName == _this.placeName)&&(identical(other.timestamp, _this.timestamp) || other.timestamp == _this.timestamp)&&const DeepCollectionEquality().equals(other.metadata, _this.metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OutdoorLocation;
  return Object.hash(runtimeType,_this.coordinates,_this.accuracy,_this.altitude,_this.heading,_this.speed,_this.address,_this.placeName,_this.timestamp,const DeepCollectionEquality().hash(_this.metadata));
}

@override
String toString() {
  final _this = this as OutdoorLocation;
  return 'OutdoorLocation(coordinates: ${_this.coordinates}, accuracy: ${_this.accuracy}, altitude: ${_this.altitude}, heading: ${_this.heading}, speed: ${_this.speed}, address: ${_this.address}, placeName: ${_this.placeName}, timestamp: ${_this.timestamp}, metadata: ${_this.metadata})';
}


}

/// @nodoc
abstract mixin class $OutdoorLocationCopyWith<$Res>  {
  factory $OutdoorLocationCopyWith(OutdoorLocation value, $Res Function(OutdoorLocation) _then) = _$OutdoorLocationCopyWithImpl;
@useResult
$Res call({
 LatLng coordinates, double? accuracy, double? altitude, double? heading, double? speed, String? address, String? placeName, DateTime? timestamp, Map<String, dynamic>? metadata
});




}
/// @nodoc
class _$OutdoorLocationCopyWithImpl<$Res>
    implements $OutdoorLocationCopyWith<$Res> {
  _$OutdoorLocationCopyWithImpl(this._self, this._then);

  final OutdoorLocation _self;
  final $Res Function(OutdoorLocation) _then;

/// Create a copy of OutdoorLocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? coordinates = null,Object? accuracy = freezed,Object? altitude = freezed,Object? heading = freezed,Object? speed = freezed,Object? address = freezed,Object? placeName = freezed,Object? timestamp = freezed,Object? metadata = freezed,}) {
  return _then(OutdoorLocation(
coordinates: null == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as LatLng,accuracy: freezed == accuracy ? _self.accuracy : accuracy // ignore: cast_nullable_to_non_nullable
as double?,altitude: freezed == altitude ? _self.altitude : altitude // ignore: cast_nullable_to_non_nullable
as double?,heading: freezed == heading ? _self.heading : heading // ignore: cast_nullable_to_non_nullable
as double?,speed: freezed == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,placeName: freezed == placeName ? _self.placeName : placeName // ignore: cast_nullable_to_non_nullable
as String?,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [OutdoorLocation].
extension OutdoorLocationPatterns on OutdoorLocation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OutdoorLocation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OutdoorLocation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OutdoorLocation value)  $default,){
final _that = this;
switch (_that) {
case _OutdoorLocation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OutdoorLocation value)?  $default,){
final _that = this;
switch (_that) {
case _OutdoorLocation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LatLng coordinates,  double? accuracy,  double? altitude,  double? heading,  double? speed,  String? address,  String? placeName,  DateTime? timestamp,  Map<String, dynamic>? metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OutdoorLocation() when $default != null:
return $default(_that.coordinates,_that.accuracy,_that.altitude,_that.heading,_that.speed,_that.address,_that.placeName,_that.timestamp,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LatLng coordinates,  double? accuracy,  double? altitude,  double? heading,  double? speed,  String? address,  String? placeName,  DateTime? timestamp,  Map<String, dynamic>? metadata)  $default,) {final _that = this;
switch (_that) {
case _OutdoorLocation():
return $default(_that.coordinates,_that.accuracy,_that.altitude,_that.heading,_that.speed,_that.address,_that.placeName,_that.timestamp,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LatLng coordinates,  double? accuracy,  double? altitude,  double? heading,  double? speed,  String? address,  String? placeName,  DateTime? timestamp,  Map<String, dynamic>? metadata)?  $default,) {final _that = this;
switch (_that) {
case _OutdoorLocation() when $default != null:
return $default(_that.coordinates,_that.accuracy,_that.altitude,_that.heading,_that.speed,_that.address,_that.placeName,_that.timestamp,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OutdoorLocation extends OutdoorLocation {
  const _OutdoorLocation({required this.coordinates, this.accuracy, this.altitude, this.heading, this.speed, this.address, this.placeName, this.timestamp,  Map<String, dynamic>? metadata}): _metadata = metadata,super._();
  factory _OutdoorLocation.fromJson(Map<String, dynamic> json) => _$OutdoorLocationFromJson(json);

@override final  LatLng coordinates;
@override final  double? accuracy;
@override final  double? altitude;
@override final  double? heading;
@override final  double? speed;
@override final  String? address;
@override final  String? placeName;
@override final  DateTime? timestamp;
 final  Map<String, dynamic>? _metadata;
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of OutdoorLocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OutdoorLocationCopyWith<_OutdoorLocation> get copyWith => __$OutdoorLocationCopyWithImpl<_OutdoorLocation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OutdoorLocationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OutdoorLocation&&(identical(other.coordinates, coordinates) || other.coordinates == coordinates)&&(identical(other.accuracy, accuracy) || other.accuracy == accuracy)&&(identical(other.altitude, altitude) || other.altitude == altitude)&&(identical(other.heading, heading) || other.heading == heading)&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.address, address) || other.address == address)&&(identical(other.placeName, placeName) || other.placeName == placeName)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&const DeepCollectionEquality().equals(other.metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,coordinates,accuracy,altitude,heading,speed,address,placeName,timestamp,const DeepCollectionEquality().hash(_metadata));
}

@override
String toString() {
    return 'OutdoorLocation(coordinates: $coordinates, accuracy: $accuracy, altitude: $altitude, heading: $heading, speed: $speed, address: $address, placeName: $placeName, timestamp: $timestamp, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$OutdoorLocationCopyWith<$Res> implements $OutdoorLocationCopyWith<$Res> {
  factory _$OutdoorLocationCopyWith(_OutdoorLocation value, $Res Function(_OutdoorLocation) _then) = __$OutdoorLocationCopyWithImpl;
@override @useResult
$Res call({
 LatLng coordinates, double? accuracy, double? altitude, double? heading, double? speed, String? address, String? placeName, DateTime? timestamp, Map<String, dynamic>? metadata
});




}
/// @nodoc
class __$OutdoorLocationCopyWithImpl<$Res>
    implements _$OutdoorLocationCopyWith<$Res> {
  __$OutdoorLocationCopyWithImpl(this._self, this._then);

  final _OutdoorLocation _self;
  final $Res Function(_OutdoorLocation) _then;

/// Create a copy of OutdoorLocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? coordinates = null,Object? accuracy = freezed,Object? altitude = freezed,Object? heading = freezed,Object? speed = freezed,Object? address = freezed,Object? placeName = freezed,Object? timestamp = freezed,Object? metadata = freezed,}) {
  return _then(_OutdoorLocation(
coordinates: null == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as LatLng,accuracy: freezed == accuracy ? _self.accuracy : accuracy // ignore: cast_nullable_to_non_nullable
as double?,altitude: freezed == altitude ? _self.altitude : altitude // ignore: cast_nullable_to_non_nullable
as double?,heading: freezed == heading ? _self.heading : heading // ignore: cast_nullable_to_non_nullable
as double?,speed: freezed == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,placeName: freezed == placeName ? _self.placeName : placeName // ignore: cast_nullable_to_non_nullable
as String?,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

/// @nodoc
mixin _$MapMode {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is MapMode);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'MapMode()';
}


}

/// @nodoc
class $MapModeCopyWith<$Res>  {
$MapModeCopyWith(MapMode _, $Res Function(MapMode) __);
}


/// Adds pattern-matching-related methods to [MapMode].
extension MapModePatterns on MapMode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _OutdoorMode value)?  outdoor,TResult Function( _IndoorMode value)?  indoor,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OutdoorMode() when outdoor != null:
return outdoor(_that);case _IndoorMode() when indoor != null:
return indoor(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _OutdoorMode value)  outdoor,required TResult Function( _IndoorMode value)  indoor,}){
final _that = this;
switch (_that) {
case _OutdoorMode():
return outdoor(_that);case _IndoorMode():
return indoor(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _OutdoorMode value)?  outdoor,TResult? Function( _IndoorMode value)?  indoor,}){
final _that = this;
switch (_that) {
case _OutdoorMode() when outdoor != null:
return outdoor(_that);case _IndoorMode() when indoor != null:
return indoor(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  outdoor,TResult Function( String buildingId,  String floorId)?  indoor,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OutdoorMode() when outdoor != null:
return outdoor();case _IndoorMode() when indoor != null:
return indoor(_that.buildingId,_that.floorId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  outdoor,required TResult Function( String buildingId,  String floorId)  indoor,}) {final _that = this;
switch (_that) {
case _OutdoorMode():
return outdoor();case _IndoorMode():
return indoor(_that.buildingId,_that.floorId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  outdoor,TResult? Function( String buildingId,  String floorId)?  indoor,}) {final _that = this;
switch (_that) {
case _OutdoorMode() when outdoor != null:
return outdoor();case _IndoorMode() when indoor != null:
return indoor(_that.buildingId,_that.floorId);case _:
  return null;

}
}

}

/// @nodoc


class _OutdoorMode implements MapMode {
  const _OutdoorMode();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OutdoorMode);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'MapMode.outdoor()';
}


}




/// @nodoc


class _IndoorMode implements MapMode {
  const _IndoorMode({required this.buildingId, required this.floorId});
  

 final  String buildingId;
 final  String floorId;

/// Create a copy of MapMode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IndoorModeCopyWith<_IndoorMode> get copyWith => __$IndoorModeCopyWithImpl<_IndoorMode>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _IndoorMode&&(identical(other.buildingId, buildingId) || other.buildingId == buildingId)&&(identical(other.floorId, floorId) || other.floorId == floorId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,buildingId,floorId);
}

@override
String toString() {
    return 'MapMode.indoor(buildingId: $buildingId, floorId: $floorId)';
}


}

/// @nodoc
abstract mixin class _$IndoorModeCopyWith<$Res> implements $MapModeCopyWith<$Res> {
  factory _$IndoorModeCopyWith(_IndoorMode value, $Res Function(_IndoorMode) _then) = __$IndoorModeCopyWithImpl;
@useResult
$Res call({
 String buildingId, String floorId
});




}
/// @nodoc
class __$IndoorModeCopyWithImpl<$Res>
    implements _$IndoorModeCopyWith<$Res> {
  __$IndoorModeCopyWithImpl(this._self, this._then);

  final _IndoorMode _self;
  final $Res Function(_IndoorMode) _then;

/// Create a copy of MapMode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? buildingId = null,Object? floorId = null,}) {
  return _then(_IndoorMode(
buildingId: null == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as String,floorId: null == floorId ? _self.floorId : floorId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
