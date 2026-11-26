// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gcp_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GroundControlPoint {

/// Unique identifier for this GCP
 String get id;/// Human-readable label (e.g., "Building A NW Corner")
 String get label;/// Image/plan coordinates (normalized 0-1 or pixel coordinates)
 GcpImageCoordinate get imageCoordinate;/// Real-world WGS84 coordinate (EPSG:4326)
 LatLngCoordinate get wgs84Coordinate;/// Real-world UTM Zone 51N coordinate (EPSG:32651)
 UtmCoordinate get utmCoordinate;/// Optional local Cartesian coordinate (meters from campus origin)
 LocalCartesianCoordinate? get localCoordinate;/// GCP quality/grade
 GcpGrade get grade;/// Source of this GCP
 GcpSource get source;/// Date this GCP was collected/verified
 DateTime? get collectedAt;/// Surveyor/collector name
 String? get collectedBy;/// Estimated horizontal accuracy in meters
 double? get accuracyMeters;/// Notes about this GCP
 String? get notes;/// Metadata for extensibility
 Map<String, dynamic> get metadata;
/// Create a copy of GroundControlPoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroundControlPointCopyWith<GroundControlPoint> get copyWith => _$GroundControlPointCopyWithImpl<GroundControlPoint>(this as GroundControlPoint, _$identity);

  /// Serializes this GroundControlPoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as GroundControlPoint;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroundControlPoint&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.imageCoordinate, _this.imageCoordinate) || other.imageCoordinate == _this.imageCoordinate)&&(identical(other.wgs84Coordinate, _this.wgs84Coordinate) || other.wgs84Coordinate == _this.wgs84Coordinate)&&(identical(other.utmCoordinate, _this.utmCoordinate) || other.utmCoordinate == _this.utmCoordinate)&&(identical(other.localCoordinate, _this.localCoordinate) || other.localCoordinate == _this.localCoordinate)&&(identical(other.grade, _this.grade) || other.grade == _this.grade)&&(identical(other.source, _this.source) || other.source == _this.source)&&(identical(other.collectedAt, _this.collectedAt) || other.collectedAt == _this.collectedAt)&&(identical(other.collectedBy, _this.collectedBy) || other.collectedBy == _this.collectedBy)&&(identical(other.accuracyMeters, _this.accuracyMeters) || other.accuracyMeters == _this.accuracyMeters)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&const DeepCollectionEquality().equals(other.metadata, _this.metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as GroundControlPoint;
  return Object.hash(runtimeType,_this.id,_this.label,_this.imageCoordinate,_this.wgs84Coordinate,_this.utmCoordinate,_this.localCoordinate,_this.grade,_this.source,_this.collectedAt,_this.collectedBy,_this.accuracyMeters,_this.notes,const DeepCollectionEquality().hash(_this.metadata));
}

@override
String toString() {
  final _this = this as GroundControlPoint;
  return 'GroundControlPoint(id: ${_this.id}, label: ${_this.label}, imageCoordinate: ${_this.imageCoordinate}, wgs84Coordinate: ${_this.wgs84Coordinate}, utmCoordinate: ${_this.utmCoordinate}, localCoordinate: ${_this.localCoordinate}, grade: ${_this.grade}, source: ${_this.source}, collectedAt: ${_this.collectedAt}, collectedBy: ${_this.collectedBy}, accuracyMeters: ${_this.accuracyMeters}, notes: ${_this.notes}, metadata: ${_this.metadata})';
}


}

/// @nodoc
abstract mixin class $GroundControlPointCopyWith<$Res>  {
  factory $GroundControlPointCopyWith(GroundControlPoint value, $Res Function(GroundControlPoint) _then) = _$GroundControlPointCopyWithImpl;
@useResult
$Res call({
 String id, String label, GcpImageCoordinate imageCoordinate, LatLngCoordinate wgs84Coordinate, UtmCoordinate utmCoordinate, LocalCartesianCoordinate? localCoordinate, GcpGrade grade, GcpSource source, DateTime? collectedAt, String? collectedBy, double? accuracyMeters, String? notes, Map<String, dynamic> metadata
});


$GcpImageCoordinateCopyWith<$Res> get imageCoordinate;$LatLngCoordinateCopyWith<$Res> get wgs84Coordinate;$UtmCoordinateCopyWith<$Res> get utmCoordinate;$LocalCartesianCoordinateCopyWith<$Res>? get localCoordinate;

}
/// @nodoc
class _$GroundControlPointCopyWithImpl<$Res>
    implements $GroundControlPointCopyWith<$Res> {
  _$GroundControlPointCopyWithImpl(this._self, this._then);

  final GroundControlPoint _self;
  final $Res Function(GroundControlPoint) _then;

/// Create a copy of GroundControlPoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,Object? imageCoordinate = null,Object? wgs84Coordinate = null,Object? utmCoordinate = null,Object? localCoordinate = freezed,Object? grade = null,Object? source = null,Object? collectedAt = freezed,Object? collectedBy = freezed,Object? accuracyMeters = freezed,Object? notes = freezed,Object? metadata = null,}) {
  return _then(GroundControlPoint(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,imageCoordinate: null == imageCoordinate ? _self.imageCoordinate : imageCoordinate // ignore: cast_nullable_to_non_nullable
as GcpImageCoordinate,wgs84Coordinate: null == wgs84Coordinate ? _self.wgs84Coordinate : wgs84Coordinate // ignore: cast_nullable_to_non_nullable
as LatLngCoordinate,utmCoordinate: null == utmCoordinate ? _self.utmCoordinate : utmCoordinate // ignore: cast_nullable_to_non_nullable
as UtmCoordinate,localCoordinate: freezed == localCoordinate ? _self.localCoordinate : localCoordinate // ignore: cast_nullable_to_non_nullable
as LocalCartesianCoordinate?,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as GcpGrade,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as GcpSource,collectedAt: freezed == collectedAt ? _self.collectedAt : collectedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,collectedBy: freezed == collectedBy ? _self.collectedBy : collectedBy // ignore: cast_nullable_to_non_nullable
as String?,accuracyMeters: freezed == accuracyMeters ? _self.accuracyMeters : accuracyMeters // ignore: cast_nullable_to_non_nullable
as double?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}
/// Create a copy of GroundControlPoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GcpImageCoordinateCopyWith<$Res> get imageCoordinate {
  
  return $GcpImageCoordinateCopyWith<$Res>(_self.imageCoordinate, (value) {
    return _then(_self.copyWith(imageCoordinate: value));
  });
}/// Create a copy of GroundControlPoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LatLngCoordinateCopyWith<$Res> get wgs84Coordinate {
  
  return $LatLngCoordinateCopyWith<$Res>(_self.wgs84Coordinate, (value) {
    return _then(_self.copyWith(wgs84Coordinate: value));
  });
}/// Create a copy of GroundControlPoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UtmCoordinateCopyWith<$Res> get utmCoordinate {
  
  return $UtmCoordinateCopyWith<$Res>(_self.utmCoordinate, (value) {
    return _then(_self.copyWith(utmCoordinate: value));
  });
}/// Create a copy of GroundControlPoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalCartesianCoordinateCopyWith<$Res>? get localCoordinate {
    if (_self.localCoordinate == null) {
    return null;
  }

  return $LocalCartesianCoordinateCopyWith<$Res>(_self.localCoordinate!, (value) {
    return _then(_self.copyWith(localCoordinate: value));
  });
}
}


/// Adds pattern-matching-related methods to [GroundControlPoint].
extension GroundControlPointPatterns on GroundControlPoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GroundControlPoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GroundControlPoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GroundControlPoint value)  $default,){
final _that = this;
switch (_that) {
case _GroundControlPoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GroundControlPoint value)?  $default,){
final _that = this;
switch (_that) {
case _GroundControlPoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String label,  GcpImageCoordinate imageCoordinate,  LatLngCoordinate wgs84Coordinate,  UtmCoordinate utmCoordinate,  LocalCartesianCoordinate? localCoordinate,  GcpGrade grade,  GcpSource source,  DateTime? collectedAt,  String? collectedBy,  double? accuracyMeters,  String? notes,  Map<String, dynamic> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GroundControlPoint() when $default != null:
return $default(_that.id,_that.label,_that.imageCoordinate,_that.wgs84Coordinate,_that.utmCoordinate,_that.localCoordinate,_that.grade,_that.source,_that.collectedAt,_that.collectedBy,_that.accuracyMeters,_that.notes,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String label,  GcpImageCoordinate imageCoordinate,  LatLngCoordinate wgs84Coordinate,  UtmCoordinate utmCoordinate,  LocalCartesianCoordinate? localCoordinate,  GcpGrade grade,  GcpSource source,  DateTime? collectedAt,  String? collectedBy,  double? accuracyMeters,  String? notes,  Map<String, dynamic> metadata)  $default,) {final _that = this;
switch (_that) {
case _GroundControlPoint():
return $default(_that.id,_that.label,_that.imageCoordinate,_that.wgs84Coordinate,_that.utmCoordinate,_that.localCoordinate,_that.grade,_that.source,_that.collectedAt,_that.collectedBy,_that.accuracyMeters,_that.notes,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String label,  GcpImageCoordinate imageCoordinate,  LatLngCoordinate wgs84Coordinate,  UtmCoordinate utmCoordinate,  LocalCartesianCoordinate? localCoordinate,  GcpGrade grade,  GcpSource source,  DateTime? collectedAt,  String? collectedBy,  double? accuracyMeters,  String? notes,  Map<String, dynamic> metadata)?  $default,) {final _that = this;
switch (_that) {
case _GroundControlPoint() when $default != null:
return $default(_that.id,_that.label,_that.imageCoordinate,_that.wgs84Coordinate,_that.utmCoordinate,_that.localCoordinate,_that.grade,_that.source,_that.collectedAt,_that.collectedBy,_that.accuracyMeters,_that.notes,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GroundControlPoint implements GroundControlPoint {
  const _GroundControlPoint({required this.id, required this.label, required this.imageCoordinate, required this.wgs84Coordinate, required this.utmCoordinate, this.localCoordinate, this.grade = GcpGrade.unverified, this.source = GcpSource.manualSurvey, this.collectedAt, this.collectedBy, this.accuracyMeters, this.notes,  Map<String, dynamic> metadata = const {}}): _metadata = metadata;
  factory _GroundControlPoint.fromJson(Map<String, dynamic> json) => _$GroundControlPointFromJson(json);

/// Unique identifier for this GCP
@override final  String id;
/// Human-readable label (e.g., "Building A NW Corner")
@override final  String label;
/// Image/plan coordinates (normalized 0-1 or pixel coordinates)
@override final  GcpImageCoordinate imageCoordinate;
/// Real-world WGS84 coordinate (EPSG:4326)
@override final  LatLngCoordinate wgs84Coordinate;
/// Real-world UTM Zone 51N coordinate (EPSG:32651)
@override final  UtmCoordinate utmCoordinate;
/// Optional local Cartesian coordinate (meters from campus origin)
@override final  LocalCartesianCoordinate? localCoordinate;
/// GCP quality/grade
@override@JsonKey() final  GcpGrade grade;
/// Source of this GCP
@override@JsonKey() final  GcpSource source;
/// Date this GCP was collected/verified
@override final  DateTime? collectedAt;
/// Surveyor/collector name
@override final  String? collectedBy;
/// Estimated horizontal accuracy in meters
@override final  double? accuracyMeters;
/// Notes about this GCP
@override final  String? notes;
/// Metadata for extensibility
 final  Map<String, dynamic> _metadata;
/// Metadata for extensibility
@override@JsonKey() Map<String, dynamic> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of GroundControlPoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroundControlPointCopyWith<_GroundControlPoint> get copyWith => __$GroundControlPointCopyWithImpl<_GroundControlPoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GroundControlPointToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GroundControlPoint&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.imageCoordinate, imageCoordinate) || other.imageCoordinate == imageCoordinate)&&(identical(other.wgs84Coordinate, wgs84Coordinate) || other.wgs84Coordinate == wgs84Coordinate)&&(identical(other.utmCoordinate, utmCoordinate) || other.utmCoordinate == utmCoordinate)&&(identical(other.localCoordinate, localCoordinate) || other.localCoordinate == localCoordinate)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.source, source) || other.source == source)&&(identical(other.collectedAt, collectedAt) || other.collectedAt == collectedAt)&&(identical(other.collectedBy, collectedBy) || other.collectedBy == collectedBy)&&(identical(other.accuracyMeters, accuracyMeters) || other.accuracyMeters == accuracyMeters)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,label,imageCoordinate,wgs84Coordinate,utmCoordinate,localCoordinate,grade,source,collectedAt,collectedBy,accuracyMeters,notes,const DeepCollectionEquality().hash(_metadata));
}

@override
String toString() {
    return 'GroundControlPoint(id: $id, label: $label, imageCoordinate: $imageCoordinate, wgs84Coordinate: $wgs84Coordinate, utmCoordinate: $utmCoordinate, localCoordinate: $localCoordinate, grade: $grade, source: $source, collectedAt: $collectedAt, collectedBy: $collectedBy, accuracyMeters: $accuracyMeters, notes: $notes, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$GroundControlPointCopyWith<$Res> implements $GroundControlPointCopyWith<$Res> {
  factory _$GroundControlPointCopyWith(_GroundControlPoint value, $Res Function(_GroundControlPoint) _then) = __$GroundControlPointCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, GcpImageCoordinate imageCoordinate, LatLngCoordinate wgs84Coordinate, UtmCoordinate utmCoordinate, LocalCartesianCoordinate? localCoordinate, GcpGrade grade, GcpSource source, DateTime? collectedAt, String? collectedBy, double? accuracyMeters, String? notes, Map<String, dynamic> metadata
});


@override $GcpImageCoordinateCopyWith<$Res> get imageCoordinate;@override $LatLngCoordinateCopyWith<$Res> get wgs84Coordinate;@override $UtmCoordinateCopyWith<$Res> get utmCoordinate;@override $LocalCartesianCoordinateCopyWith<$Res>? get localCoordinate;

}
/// @nodoc
class __$GroundControlPointCopyWithImpl<$Res>
    implements _$GroundControlPointCopyWith<$Res> {
  __$GroundControlPointCopyWithImpl(this._self, this._then);

  final _GroundControlPoint _self;
  final $Res Function(_GroundControlPoint) _then;

/// Create a copy of GroundControlPoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? imageCoordinate = null,Object? wgs84Coordinate = null,Object? utmCoordinate = null,Object? localCoordinate = freezed,Object? grade = null,Object? source = null,Object? collectedAt = freezed,Object? collectedBy = freezed,Object? accuracyMeters = freezed,Object? notes = freezed,Object? metadata = null,}) {
  return _then(_GroundControlPoint(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,imageCoordinate: null == imageCoordinate ? _self.imageCoordinate : imageCoordinate // ignore: cast_nullable_to_non_nullable
as GcpImageCoordinate,wgs84Coordinate: null == wgs84Coordinate ? _self.wgs84Coordinate : wgs84Coordinate // ignore: cast_nullable_to_non_nullable
as LatLngCoordinate,utmCoordinate: null == utmCoordinate ? _self.utmCoordinate : utmCoordinate // ignore: cast_nullable_to_non_nullable
as UtmCoordinate,localCoordinate: freezed == localCoordinate ? _self.localCoordinate : localCoordinate // ignore: cast_nullable_to_non_nullable
as LocalCartesianCoordinate?,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as GcpGrade,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as GcpSource,collectedAt: freezed == collectedAt ? _self.collectedAt : collectedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,collectedBy: freezed == collectedBy ? _self.collectedBy : collectedBy // ignore: cast_nullable_to_non_nullable
as String?,accuracyMeters: freezed == accuracyMeters ? _self.accuracyMeters : accuracyMeters // ignore: cast_nullable_to_non_nullable
as double?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

/// Create a copy of GroundControlPoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GcpImageCoordinateCopyWith<$Res> get imageCoordinate {
  
  return $GcpImageCoordinateCopyWith<$Res>(_self.imageCoordinate, (value) {
    return _then(_self.copyWith(imageCoordinate: value));
  });
}/// Create a copy of GroundControlPoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LatLngCoordinateCopyWith<$Res> get wgs84Coordinate {
  
  return $LatLngCoordinateCopyWith<$Res>(_self.wgs84Coordinate, (value) {
    return _then(_self.copyWith(wgs84Coordinate: value));
  });
}/// Create a copy of GroundControlPoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UtmCoordinateCopyWith<$Res> get utmCoordinate {
  
  return $UtmCoordinateCopyWith<$Res>(_self.utmCoordinate, (value) {
    return _then(_self.copyWith(utmCoordinate: value));
  });
}/// Create a copy of GroundControlPoint
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalCartesianCoordinateCopyWith<$Res>? get localCoordinate {
    if (_self.localCoordinate == null) {
    return null;
  }

  return $LocalCartesianCoordinateCopyWith<$Res>(_self.localCoordinate!, (value) {
    return _then(_self.copyWith(localCoordinate: value));
  });
}
}


/// @nodoc
mixin _$GcpImageCoordinate {

/// X coordinate (normalized 0-1 or pixels)
 double get x;/// Y coordinate (normalized 0-1 or pixels)
 double get y;/// Coordinate system type
 GcpCoordinateSystem get coordinateSystem;/// Image/plan width (if pixel coordinates)
 int? get imageWidth;/// Image/plan height (if pixel coordinates)
 int? get imageHeight;/// Floor level (for multi-floor plans)
 int? get floor;
/// Create a copy of GcpImageCoordinate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GcpImageCoordinateCopyWith<GcpImageCoordinate> get copyWith => _$GcpImageCoordinateCopyWithImpl<GcpImageCoordinate>(this as GcpImageCoordinate, _$identity);

  /// Serializes this GcpImageCoordinate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as GcpImageCoordinate;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GcpImageCoordinate&&(identical(other.x, _this.x) || other.x == _this.x)&&(identical(other.y, _this.y) || other.y == _this.y)&&(identical(other.coordinateSystem, _this.coordinateSystem) || other.coordinateSystem == _this.coordinateSystem)&&(identical(other.imageWidth, _this.imageWidth) || other.imageWidth == _this.imageWidth)&&(identical(other.imageHeight, _this.imageHeight) || other.imageHeight == _this.imageHeight)&&(identical(other.floor, _this.floor) || other.floor == _this.floor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as GcpImageCoordinate;
  return Object.hash(runtimeType,_this.x,_this.y,_this.coordinateSystem,_this.imageWidth,_this.imageHeight,_this.floor);
}

@override
String toString() {
  final _this = this as GcpImageCoordinate;
  return 'GcpImageCoordinate(x: ${_this.x}, y: ${_this.y}, coordinateSystem: ${_this.coordinateSystem}, imageWidth: ${_this.imageWidth}, imageHeight: ${_this.imageHeight}, floor: ${_this.floor})';
}


}

/// @nodoc
abstract mixin class $GcpImageCoordinateCopyWith<$Res>  {
  factory $GcpImageCoordinateCopyWith(GcpImageCoordinate value, $Res Function(GcpImageCoordinate) _then) = _$GcpImageCoordinateCopyWithImpl;
@useResult
$Res call({
 double x, double y, GcpCoordinateSystem coordinateSystem, int? imageWidth, int? imageHeight, int? floor
});




}
/// @nodoc
class _$GcpImageCoordinateCopyWithImpl<$Res>
    implements $GcpImageCoordinateCopyWith<$Res> {
  _$GcpImageCoordinateCopyWithImpl(this._self, this._then);

  final GcpImageCoordinate _self;
  final $Res Function(GcpImageCoordinate) _then;

/// Create a copy of GcpImageCoordinate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? x = null,Object? y = null,Object? coordinateSystem = null,Object? imageWidth = freezed,Object? imageHeight = freezed,Object? floor = freezed,}) {
  return _then(GcpImageCoordinate(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,coordinateSystem: null == coordinateSystem ? _self.coordinateSystem : coordinateSystem // ignore: cast_nullable_to_non_nullable
as GcpCoordinateSystem,imageWidth: freezed == imageWidth ? _self.imageWidth : imageWidth // ignore: cast_nullable_to_non_nullable
as int?,imageHeight: freezed == imageHeight ? _self.imageHeight : imageHeight // ignore: cast_nullable_to_non_nullable
as int?,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [GcpImageCoordinate].
extension GcpImageCoordinatePatterns on GcpImageCoordinate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GcpImageCoordinate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GcpImageCoordinate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GcpImageCoordinate value)  $default,){
final _that = this;
switch (_that) {
case _GcpImageCoordinate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GcpImageCoordinate value)?  $default,){
final _that = this;
switch (_that) {
case _GcpImageCoordinate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double x,  double y,  GcpCoordinateSystem coordinateSystem,  int? imageWidth,  int? imageHeight,  int? floor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GcpImageCoordinate() when $default != null:
return $default(_that.x,_that.y,_that.coordinateSystem,_that.imageWidth,_that.imageHeight,_that.floor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double x,  double y,  GcpCoordinateSystem coordinateSystem,  int? imageWidth,  int? imageHeight,  int? floor)  $default,) {final _that = this;
switch (_that) {
case _GcpImageCoordinate():
return $default(_that.x,_that.y,_that.coordinateSystem,_that.imageWidth,_that.imageHeight,_that.floor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double x,  double y,  GcpCoordinateSystem coordinateSystem,  int? imageWidth,  int? imageHeight,  int? floor)?  $default,) {final _that = this;
switch (_that) {
case _GcpImageCoordinate() when $default != null:
return $default(_that.x,_that.y,_that.coordinateSystem,_that.imageWidth,_that.imageHeight,_that.floor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GcpImageCoordinate implements GcpImageCoordinate {
  const _GcpImageCoordinate({required this.x, required this.y, this.coordinateSystem = GcpCoordinateSystem.normalized, this.imageWidth, this.imageHeight, this.floor});
  factory _GcpImageCoordinate.fromJson(Map<String, dynamic> json) => _$GcpImageCoordinateFromJson(json);

/// X coordinate (normalized 0-1 or pixels)
@override final  double x;
/// Y coordinate (normalized 0-1 or pixels)
@override final  double y;
/// Coordinate system type
@override@JsonKey() final  GcpCoordinateSystem coordinateSystem;
/// Image/plan width (if pixel coordinates)
@override final  int? imageWidth;
/// Image/plan height (if pixel coordinates)
@override final  int? imageHeight;
/// Floor level (for multi-floor plans)
@override final  int? floor;

/// Create a copy of GcpImageCoordinate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GcpImageCoordinateCopyWith<_GcpImageCoordinate> get copyWith => __$GcpImageCoordinateCopyWithImpl<_GcpImageCoordinate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GcpImageCoordinateToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GcpImageCoordinate&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.coordinateSystem, coordinateSystem) || other.coordinateSystem == coordinateSystem)&&(identical(other.imageWidth, imageWidth) || other.imageWidth == imageWidth)&&(identical(other.imageHeight, imageHeight) || other.imageHeight == imageHeight)&&(identical(other.floor, floor) || other.floor == floor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,x,y,coordinateSystem,imageWidth,imageHeight,floor);
}

@override
String toString() {
    return 'GcpImageCoordinate(x: $x, y: $y, coordinateSystem: $coordinateSystem, imageWidth: $imageWidth, imageHeight: $imageHeight, floor: $floor)';
}


}

/// @nodoc
abstract mixin class _$GcpImageCoordinateCopyWith<$Res> implements $GcpImageCoordinateCopyWith<$Res> {
  factory _$GcpImageCoordinateCopyWith(_GcpImageCoordinate value, $Res Function(_GcpImageCoordinate) _then) = __$GcpImageCoordinateCopyWithImpl;
@override @useResult
$Res call({
 double x, double y, GcpCoordinateSystem coordinateSystem, int? imageWidth, int? imageHeight, int? floor
});




}
/// @nodoc
class __$GcpImageCoordinateCopyWithImpl<$Res>
    implements _$GcpImageCoordinateCopyWith<$Res> {
  __$GcpImageCoordinateCopyWithImpl(this._self, this._then);

  final _GcpImageCoordinate _self;
  final $Res Function(_GcpImageCoordinate) _then;

/// Create a copy of GcpImageCoordinate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? x = null,Object? y = null,Object? coordinateSystem = null,Object? imageWidth = freezed,Object? imageHeight = freezed,Object? floor = freezed,}) {
  return _then(_GcpImageCoordinate(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,coordinateSystem: null == coordinateSystem ? _self.coordinateSystem : coordinateSystem // ignore: cast_nullable_to_non_nullable
as GcpCoordinateSystem,imageWidth: freezed == imageWidth ? _self.imageWidth : imageWidth // ignore: cast_nullable_to_non_nullable
as int?,imageHeight: freezed == imageHeight ? _self.imageHeight : imageHeight // ignore: cast_nullable_to_non_nullable
as int?,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$GcpConfig {

/// Campus identifier
 String get campusId;/// Campus name
 String get campusName;/// Coordinate Reference System for the campus (should be UTM 51N)
 CoordinateReferenceSystem get targetCrs;/// Campus origin in WGS84 (used for local Cartesian)
 LatLngCoordinate get campusOriginWgs84;/// Campus origin in UTM 51N
 UtmCoordinate get campusOriginUtm;/// All Ground Control Points
 List<GroundControlPoint> get groundControlPoints;/// Image/plan reference (e.g., campus map image)
 GcpImageReference? get imageReference;/// Calibration method used
 CalibrationMethod get calibrationMethod;/// Affine transform (WGS84 -> Local) - computed from GCPs
 AffineTransform? get affineWgs84ToLocal;/// Affine transform (Local -> WGS84) - computed from GCPs
 AffineTransform? get affineLocalToWgs84;/// Projective transform (WGS84 -> Local) - if using 4+ GCPs
 ProjectiveTransform? get projectiveWgs84ToLocal;/// Projective transform (Local -> WGS84) - if using 4+ GCPs
 ProjectiveTransform? get projectiveLocalToWgs84;/// Transformation accuracy metrics
 TransformAccuracy? get accuracy;/// Configuration version
 int get version;/// Last calibration timestamp
 DateTime? get calibratedAt;/// Calibrated by
 String? get calibratedBy;/// Notes
 String? get notes;/// Metadata
 Map<String, dynamic> get metadata;
/// Create a copy of GcpConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GcpConfigCopyWith<GcpConfig> get copyWith => _$GcpConfigCopyWithImpl<GcpConfig>(this as GcpConfig, _$identity);

  /// Serializes this GcpConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as GcpConfig;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GcpConfig&&(identical(other.campusId, _this.campusId) || other.campusId == _this.campusId)&&(identical(other.campusName, _this.campusName) || other.campusName == _this.campusName)&&(identical(other.targetCrs, _this.targetCrs) || other.targetCrs == _this.targetCrs)&&(identical(other.campusOriginWgs84, _this.campusOriginWgs84) || other.campusOriginWgs84 == _this.campusOriginWgs84)&&(identical(other.campusOriginUtm, _this.campusOriginUtm) || other.campusOriginUtm == _this.campusOriginUtm)&&const DeepCollectionEquality().equals(other.groundControlPoints, _this.groundControlPoints)&&(identical(other.imageReference, _this.imageReference) || other.imageReference == _this.imageReference)&&(identical(other.calibrationMethod, _this.calibrationMethod) || other.calibrationMethod == _this.calibrationMethod)&&(identical(other.affineWgs84ToLocal, _this.affineWgs84ToLocal) || other.affineWgs84ToLocal == _this.affineWgs84ToLocal)&&(identical(other.affineLocalToWgs84, _this.affineLocalToWgs84) || other.affineLocalToWgs84 == _this.affineLocalToWgs84)&&(identical(other.projectiveWgs84ToLocal, _this.projectiveWgs84ToLocal) || other.projectiveWgs84ToLocal == _this.projectiveWgs84ToLocal)&&(identical(other.projectiveLocalToWgs84, _this.projectiveLocalToWgs84) || other.projectiveLocalToWgs84 == _this.projectiveLocalToWgs84)&&(identical(other.accuracy, _this.accuracy) || other.accuracy == _this.accuracy)&&(identical(other.version, _this.version) || other.version == _this.version)&&(identical(other.calibratedAt, _this.calibratedAt) || other.calibratedAt == _this.calibratedAt)&&(identical(other.calibratedBy, _this.calibratedBy) || other.calibratedBy == _this.calibratedBy)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&const DeepCollectionEquality().equals(other.metadata, _this.metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as GcpConfig;
  return Object.hash(runtimeType,_this.campusId,_this.campusName,_this.targetCrs,_this.campusOriginWgs84,_this.campusOriginUtm,const DeepCollectionEquality().hash(_this.groundControlPoints),_this.imageReference,_this.calibrationMethod,_this.affineWgs84ToLocal,_this.affineLocalToWgs84,_this.projectiveWgs84ToLocal,_this.projectiveLocalToWgs84,_this.accuracy,_this.version,_this.calibratedAt,_this.calibratedBy,_this.notes,const DeepCollectionEquality().hash(_this.metadata));
}

@override
String toString() {
  final _this = this as GcpConfig;
  return 'GcpConfig(campusId: ${_this.campusId}, campusName: ${_this.campusName}, targetCrs: ${_this.targetCrs}, campusOriginWgs84: ${_this.campusOriginWgs84}, campusOriginUtm: ${_this.campusOriginUtm}, groundControlPoints: ${_this.groundControlPoints}, imageReference: ${_this.imageReference}, calibrationMethod: ${_this.calibrationMethod}, affineWgs84ToLocal: ${_this.affineWgs84ToLocal}, affineLocalToWgs84: ${_this.affineLocalToWgs84}, projectiveWgs84ToLocal: ${_this.projectiveWgs84ToLocal}, projectiveLocalToWgs84: ${_this.projectiveLocalToWgs84}, accuracy: ${_this.accuracy}, version: ${_this.version}, calibratedAt: ${_this.calibratedAt}, calibratedBy: ${_this.calibratedBy}, notes: ${_this.notes}, metadata: ${_this.metadata})';
}


}

/// @nodoc
abstract mixin class $GcpConfigCopyWith<$Res>  {
  factory $GcpConfigCopyWith(GcpConfig value, $Res Function(GcpConfig) _then) = _$GcpConfigCopyWithImpl;
@useResult
$Res call({
 String campusId, String campusName, CoordinateReferenceSystem targetCrs, LatLngCoordinate campusOriginWgs84, UtmCoordinate campusOriginUtm, List<GroundControlPoint> groundControlPoints, GcpImageReference? imageReference, CalibrationMethod calibrationMethod, AffineTransform? affineWgs84ToLocal, AffineTransform? affineLocalToWgs84, ProjectiveTransform? projectiveWgs84ToLocal, ProjectiveTransform? projectiveLocalToWgs84, TransformAccuracy? accuracy, int version, DateTime? calibratedAt, String? calibratedBy, String? notes, Map<String, dynamic> metadata
});


$LatLngCoordinateCopyWith<$Res> get campusOriginWgs84;$UtmCoordinateCopyWith<$Res> get campusOriginUtm;$GcpImageReferenceCopyWith<$Res>? get imageReference;$AffineTransformCopyWith<$Res>? get affineWgs84ToLocal;$AffineTransformCopyWith<$Res>? get affineLocalToWgs84;$ProjectiveTransformCopyWith<$Res>? get projectiveWgs84ToLocal;$ProjectiveTransformCopyWith<$Res>? get projectiveLocalToWgs84;$TransformAccuracyCopyWith<$Res>? get accuracy;

}
/// @nodoc
class _$GcpConfigCopyWithImpl<$Res>
    implements $GcpConfigCopyWith<$Res> {
  _$GcpConfigCopyWithImpl(this._self, this._then);

  final GcpConfig _self;
  final $Res Function(GcpConfig) _then;

/// Create a copy of GcpConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? campusId = null,Object? campusName = null,Object? targetCrs = null,Object? campusOriginWgs84 = null,Object? campusOriginUtm = null,Object? groundControlPoints = null,Object? imageReference = freezed,Object? calibrationMethod = null,Object? affineWgs84ToLocal = freezed,Object? affineLocalToWgs84 = freezed,Object? projectiveWgs84ToLocal = freezed,Object? projectiveLocalToWgs84 = freezed,Object? accuracy = freezed,Object? version = null,Object? calibratedAt = freezed,Object? calibratedBy = freezed,Object? notes = freezed,Object? metadata = null,}) {
  return _then(GcpConfig(
campusId: null == campusId ? _self.campusId : campusId // ignore: cast_nullable_to_non_nullable
as String,campusName: null == campusName ? _self.campusName : campusName // ignore: cast_nullable_to_non_nullable
as String,targetCrs: null == targetCrs ? _self.targetCrs : targetCrs // ignore: cast_nullable_to_non_nullable
as CoordinateReferenceSystem,campusOriginWgs84: null == campusOriginWgs84 ? _self.campusOriginWgs84 : campusOriginWgs84 // ignore: cast_nullable_to_non_nullable
as LatLngCoordinate,campusOriginUtm: null == campusOriginUtm ? _self.campusOriginUtm : campusOriginUtm // ignore: cast_nullable_to_non_nullable
as UtmCoordinate,groundControlPoints: null == groundControlPoints ? _self.groundControlPoints : groundControlPoints // ignore: cast_nullable_to_non_nullable
as List<GroundControlPoint>,imageReference: freezed == imageReference ? _self.imageReference : imageReference // ignore: cast_nullable_to_non_nullable
as GcpImageReference?,calibrationMethod: null == calibrationMethod ? _self.calibrationMethod : calibrationMethod // ignore: cast_nullable_to_non_nullable
as CalibrationMethod,affineWgs84ToLocal: freezed == affineWgs84ToLocal ? _self.affineWgs84ToLocal : affineWgs84ToLocal // ignore: cast_nullable_to_non_nullable
as AffineTransform?,affineLocalToWgs84: freezed == affineLocalToWgs84 ? _self.affineLocalToWgs84 : affineLocalToWgs84 // ignore: cast_nullable_to_non_nullable
as AffineTransform?,projectiveWgs84ToLocal: freezed == projectiveWgs84ToLocal ? _self.projectiveWgs84ToLocal : projectiveWgs84ToLocal // ignore: cast_nullable_to_non_nullable
as ProjectiveTransform?,projectiveLocalToWgs84: freezed == projectiveLocalToWgs84 ? _self.projectiveLocalToWgs84 : projectiveLocalToWgs84 // ignore: cast_nullable_to_non_nullable
as ProjectiveTransform?,accuracy: freezed == accuracy ? _self.accuracy : accuracy // ignore: cast_nullable_to_non_nullable
as TransformAccuracy?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,calibratedAt: freezed == calibratedAt ? _self.calibratedAt : calibratedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,calibratedBy: freezed == calibratedBy ? _self.calibratedBy : calibratedBy // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}
/// Create a copy of GcpConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LatLngCoordinateCopyWith<$Res> get campusOriginWgs84 {
  
  return $LatLngCoordinateCopyWith<$Res>(_self.campusOriginWgs84, (value) {
    return _then(_self.copyWith(campusOriginWgs84: value));
  });
}/// Create a copy of GcpConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UtmCoordinateCopyWith<$Res> get campusOriginUtm {
  
  return $UtmCoordinateCopyWith<$Res>(_self.campusOriginUtm, (value) {
    return _then(_self.copyWith(campusOriginUtm: value));
  });
}/// Create a copy of GcpConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GcpImageReferenceCopyWith<$Res>? get imageReference {
    if (_self.imageReference == null) {
    return null;
  }

  return $GcpImageReferenceCopyWith<$Res>(_self.imageReference!, (value) {
    return _then(_self.copyWith(imageReference: value));
  });
}/// Create a copy of GcpConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AffineTransformCopyWith<$Res>? get affineWgs84ToLocal {
    if (_self.affineWgs84ToLocal == null) {
    return null;
  }

  return $AffineTransformCopyWith<$Res>(_self.affineWgs84ToLocal!, (value) {
    return _then(_self.copyWith(affineWgs84ToLocal: value));
  });
}/// Create a copy of GcpConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AffineTransformCopyWith<$Res>? get affineLocalToWgs84 {
    if (_self.affineLocalToWgs84 == null) {
    return null;
  }

  return $AffineTransformCopyWith<$Res>(_self.affineLocalToWgs84!, (value) {
    return _then(_self.copyWith(affineLocalToWgs84: value));
  });
}/// Create a copy of GcpConfig
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
}/// Create a copy of GcpConfig
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
}/// Create a copy of GcpConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransformAccuracyCopyWith<$Res>? get accuracy {
    if (_self.accuracy == null) {
    return null;
  }

  return $TransformAccuracyCopyWith<$Res>(_self.accuracy!, (value) {
    return _then(_self.copyWith(accuracy: value));
  });
}
}


/// Adds pattern-matching-related methods to [GcpConfig].
extension GcpConfigPatterns on GcpConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GcpConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GcpConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GcpConfig value)  $default,){
final _that = this;
switch (_that) {
case _GcpConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GcpConfig value)?  $default,){
final _that = this;
switch (_that) {
case _GcpConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String campusId,  String campusName,  CoordinateReferenceSystem targetCrs,  LatLngCoordinate campusOriginWgs84,  UtmCoordinate campusOriginUtm,  List<GroundControlPoint> groundControlPoints,  GcpImageReference? imageReference,  CalibrationMethod calibrationMethod,  AffineTransform? affineWgs84ToLocal,  AffineTransform? affineLocalToWgs84,  ProjectiveTransform? projectiveWgs84ToLocal,  ProjectiveTransform? projectiveLocalToWgs84,  TransformAccuracy? accuracy,  int version,  DateTime? calibratedAt,  String? calibratedBy,  String? notes,  Map<String, dynamic> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GcpConfig() when $default != null:
return $default(_that.campusId,_that.campusName,_that.targetCrs,_that.campusOriginWgs84,_that.campusOriginUtm,_that.groundControlPoints,_that.imageReference,_that.calibrationMethod,_that.affineWgs84ToLocal,_that.affineLocalToWgs84,_that.projectiveWgs84ToLocal,_that.projectiveLocalToWgs84,_that.accuracy,_that.version,_that.calibratedAt,_that.calibratedBy,_that.notes,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String campusId,  String campusName,  CoordinateReferenceSystem targetCrs,  LatLngCoordinate campusOriginWgs84,  UtmCoordinate campusOriginUtm,  List<GroundControlPoint> groundControlPoints,  GcpImageReference? imageReference,  CalibrationMethod calibrationMethod,  AffineTransform? affineWgs84ToLocal,  AffineTransform? affineLocalToWgs84,  ProjectiveTransform? projectiveWgs84ToLocal,  ProjectiveTransform? projectiveLocalToWgs84,  TransformAccuracy? accuracy,  int version,  DateTime? calibratedAt,  String? calibratedBy,  String? notes,  Map<String, dynamic> metadata)  $default,) {final _that = this;
switch (_that) {
case _GcpConfig():
return $default(_that.campusId,_that.campusName,_that.targetCrs,_that.campusOriginWgs84,_that.campusOriginUtm,_that.groundControlPoints,_that.imageReference,_that.calibrationMethod,_that.affineWgs84ToLocal,_that.affineLocalToWgs84,_that.projectiveWgs84ToLocal,_that.projectiveLocalToWgs84,_that.accuracy,_that.version,_that.calibratedAt,_that.calibratedBy,_that.notes,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String campusId,  String campusName,  CoordinateReferenceSystem targetCrs,  LatLngCoordinate campusOriginWgs84,  UtmCoordinate campusOriginUtm,  List<GroundControlPoint> groundControlPoints,  GcpImageReference? imageReference,  CalibrationMethod calibrationMethod,  AffineTransform? affineWgs84ToLocal,  AffineTransform? affineLocalToWgs84,  ProjectiveTransform? projectiveWgs84ToLocal,  ProjectiveTransform? projectiveLocalToWgs84,  TransformAccuracy? accuracy,  int version,  DateTime? calibratedAt,  String? calibratedBy,  String? notes,  Map<String, dynamic> metadata)?  $default,) {final _that = this;
switch (_that) {
case _GcpConfig() when $default != null:
return $default(_that.campusId,_that.campusName,_that.targetCrs,_that.campusOriginWgs84,_that.campusOriginUtm,_that.groundControlPoints,_that.imageReference,_that.calibrationMethod,_that.affineWgs84ToLocal,_that.affineLocalToWgs84,_that.projectiveWgs84ToLocal,_that.projectiveLocalToWgs84,_that.accuracy,_that.version,_that.calibratedAt,_that.calibratedBy,_that.notes,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GcpConfig implements GcpConfig {
  const _GcpConfig({required this.campusId, required this.campusName, this.targetCrs = CoordinateReferenceSystem.utm51n, required this.campusOriginWgs84, required this.campusOriginUtm,  List<GroundControlPoint> groundControlPoints = const [], this.imageReference, this.calibrationMethod = CalibrationMethod.affine, this.affineWgs84ToLocal, this.affineLocalToWgs84, this.projectiveWgs84ToLocal, this.projectiveLocalToWgs84, this.accuracy, this.version = 1, this.calibratedAt, this.calibratedBy, this.notes,  Map<String, dynamic> metadata = const {}}): _groundControlPoints = groundControlPoints,_metadata = metadata;
  factory _GcpConfig.fromJson(Map<String, dynamic> json) => _$GcpConfigFromJson(json);

/// Campus identifier
@override final  String campusId;
/// Campus name
@override final  String campusName;
/// Coordinate Reference System for the campus (should be UTM 51N)
@override@JsonKey() final  CoordinateReferenceSystem targetCrs;
/// Campus origin in WGS84 (used for local Cartesian)
@override final  LatLngCoordinate campusOriginWgs84;
/// Campus origin in UTM 51N
@override final  UtmCoordinate campusOriginUtm;
/// All Ground Control Points
 final  List<GroundControlPoint> _groundControlPoints;
/// All Ground Control Points
@override@JsonKey() List<GroundControlPoint> get groundControlPoints {
  if (_groundControlPoints is EqualUnmodifiableListView) return _groundControlPoints;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_groundControlPoints);
}

/// Image/plan reference (e.g., campus map image)
@override final  GcpImageReference? imageReference;
/// Calibration method used
@override@JsonKey() final  CalibrationMethod calibrationMethod;
/// Affine transform (WGS84 -> Local) - computed from GCPs
@override final  AffineTransform? affineWgs84ToLocal;
/// Affine transform (Local -> WGS84) - computed from GCPs
@override final  AffineTransform? affineLocalToWgs84;
/// Projective transform (WGS84 -> Local) - if using 4+ GCPs
@override final  ProjectiveTransform? projectiveWgs84ToLocal;
/// Projective transform (Local -> WGS84) - if using 4+ GCPs
@override final  ProjectiveTransform? projectiveLocalToWgs84;
/// Transformation accuracy metrics
@override final  TransformAccuracy? accuracy;
/// Configuration version
@override@JsonKey() final  int version;
/// Last calibration timestamp
@override final  DateTime? calibratedAt;
/// Calibrated by
@override final  String? calibratedBy;
/// Notes
@override final  String? notes;
/// Metadata
 final  Map<String, dynamic> _metadata;
/// Metadata
@override@JsonKey() Map<String, dynamic> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of GcpConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GcpConfigCopyWith<_GcpConfig> get copyWith => __$GcpConfigCopyWithImpl<_GcpConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GcpConfigToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GcpConfig&&(identical(other.campusId, campusId) || other.campusId == campusId)&&(identical(other.campusName, campusName) || other.campusName == campusName)&&(identical(other.targetCrs, targetCrs) || other.targetCrs == targetCrs)&&(identical(other.campusOriginWgs84, campusOriginWgs84) || other.campusOriginWgs84 == campusOriginWgs84)&&(identical(other.campusOriginUtm, campusOriginUtm) || other.campusOriginUtm == campusOriginUtm)&&const DeepCollectionEquality().equals(other.groundControlPoints, _groundControlPoints)&&(identical(other.imageReference, imageReference) || other.imageReference == imageReference)&&(identical(other.calibrationMethod, calibrationMethod) || other.calibrationMethod == calibrationMethod)&&(identical(other.affineWgs84ToLocal, affineWgs84ToLocal) || other.affineWgs84ToLocal == affineWgs84ToLocal)&&(identical(other.affineLocalToWgs84, affineLocalToWgs84) || other.affineLocalToWgs84 == affineLocalToWgs84)&&(identical(other.projectiveWgs84ToLocal, projectiveWgs84ToLocal) || other.projectiveWgs84ToLocal == projectiveWgs84ToLocal)&&(identical(other.projectiveLocalToWgs84, projectiveLocalToWgs84) || other.projectiveLocalToWgs84 == projectiveLocalToWgs84)&&(identical(other.accuracy, accuracy) || other.accuracy == accuracy)&&(identical(other.version, version) || other.version == version)&&(identical(other.calibratedAt, calibratedAt) || other.calibratedAt == calibratedAt)&&(identical(other.calibratedBy, calibratedBy) || other.calibratedBy == calibratedBy)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,campusId,campusName,targetCrs,campusOriginWgs84,campusOriginUtm,const DeepCollectionEquality().hash(_groundControlPoints),imageReference,calibrationMethod,affineWgs84ToLocal,affineLocalToWgs84,projectiveWgs84ToLocal,projectiveLocalToWgs84,accuracy,version,calibratedAt,calibratedBy,notes,const DeepCollectionEquality().hash(_metadata));
}

@override
String toString() {
    return 'GcpConfig(campusId: $campusId, campusName: $campusName, targetCrs: $targetCrs, campusOriginWgs84: $campusOriginWgs84, campusOriginUtm: $campusOriginUtm, groundControlPoints: $groundControlPoints, imageReference: $imageReference, calibrationMethod: $calibrationMethod, affineWgs84ToLocal: $affineWgs84ToLocal, affineLocalToWgs84: $affineLocalToWgs84, projectiveWgs84ToLocal: $projectiveWgs84ToLocal, projectiveLocalToWgs84: $projectiveLocalToWgs84, accuracy: $accuracy, version: $version, calibratedAt: $calibratedAt, calibratedBy: $calibratedBy, notes: $notes, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$GcpConfigCopyWith<$Res> implements $GcpConfigCopyWith<$Res> {
  factory _$GcpConfigCopyWith(_GcpConfig value, $Res Function(_GcpConfig) _then) = __$GcpConfigCopyWithImpl;
@override @useResult
$Res call({
 String campusId, String campusName, CoordinateReferenceSystem targetCrs, LatLngCoordinate campusOriginWgs84, UtmCoordinate campusOriginUtm, List<GroundControlPoint> groundControlPoints, GcpImageReference? imageReference, CalibrationMethod calibrationMethod, AffineTransform? affineWgs84ToLocal, AffineTransform? affineLocalToWgs84, ProjectiveTransform? projectiveWgs84ToLocal, ProjectiveTransform? projectiveLocalToWgs84, TransformAccuracy? accuracy, int version, DateTime? calibratedAt, String? calibratedBy, String? notes, Map<String, dynamic> metadata
});


@override $LatLngCoordinateCopyWith<$Res> get campusOriginWgs84;@override $UtmCoordinateCopyWith<$Res> get campusOriginUtm;@override $GcpImageReferenceCopyWith<$Res>? get imageReference;@override $AffineTransformCopyWith<$Res>? get affineWgs84ToLocal;@override $AffineTransformCopyWith<$Res>? get affineLocalToWgs84;@override $ProjectiveTransformCopyWith<$Res>? get projectiveWgs84ToLocal;@override $ProjectiveTransformCopyWith<$Res>? get projectiveLocalToWgs84;@override $TransformAccuracyCopyWith<$Res>? get accuracy;

}
/// @nodoc
class __$GcpConfigCopyWithImpl<$Res>
    implements _$GcpConfigCopyWith<$Res> {
  __$GcpConfigCopyWithImpl(this._self, this._then);

  final _GcpConfig _self;
  final $Res Function(_GcpConfig) _then;

/// Create a copy of GcpConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? campusId = null,Object? campusName = null,Object? targetCrs = null,Object? campusOriginWgs84 = null,Object? campusOriginUtm = null,Object? groundControlPoints = null,Object? imageReference = freezed,Object? calibrationMethod = null,Object? affineWgs84ToLocal = freezed,Object? affineLocalToWgs84 = freezed,Object? projectiveWgs84ToLocal = freezed,Object? projectiveLocalToWgs84 = freezed,Object? accuracy = freezed,Object? version = null,Object? calibratedAt = freezed,Object? calibratedBy = freezed,Object? notes = freezed,Object? metadata = null,}) {
  return _then(_GcpConfig(
campusId: null == campusId ? _self.campusId : campusId // ignore: cast_nullable_to_non_nullable
as String,campusName: null == campusName ? _self.campusName : campusName // ignore: cast_nullable_to_non_nullable
as String,targetCrs: null == targetCrs ? _self.targetCrs : targetCrs // ignore: cast_nullable_to_non_nullable
as CoordinateReferenceSystem,campusOriginWgs84: null == campusOriginWgs84 ? _self.campusOriginWgs84 : campusOriginWgs84 // ignore: cast_nullable_to_non_nullable
as LatLngCoordinate,campusOriginUtm: null == campusOriginUtm ? _self.campusOriginUtm : campusOriginUtm // ignore: cast_nullable_to_non_nullable
as UtmCoordinate,groundControlPoints: null == groundControlPoints ? _self._groundControlPoints : groundControlPoints // ignore: cast_nullable_to_non_nullable
as List<GroundControlPoint>,imageReference: freezed == imageReference ? _self.imageReference : imageReference // ignore: cast_nullable_to_non_nullable
as GcpImageReference?,calibrationMethod: null == calibrationMethod ? _self.calibrationMethod : calibrationMethod // ignore: cast_nullable_to_non_nullable
as CalibrationMethod,affineWgs84ToLocal: freezed == affineWgs84ToLocal ? _self.affineWgs84ToLocal : affineWgs84ToLocal // ignore: cast_nullable_to_non_nullable
as AffineTransform?,affineLocalToWgs84: freezed == affineLocalToWgs84 ? _self.affineLocalToWgs84 : affineLocalToWgs84 // ignore: cast_nullable_to_non_nullable
as AffineTransform?,projectiveWgs84ToLocal: freezed == projectiveWgs84ToLocal ? _self.projectiveWgs84ToLocal : projectiveWgs84ToLocal // ignore: cast_nullable_to_non_nullable
as ProjectiveTransform?,projectiveLocalToWgs84: freezed == projectiveLocalToWgs84 ? _self.projectiveLocalToWgs84 : projectiveLocalToWgs84 // ignore: cast_nullable_to_non_nullable
as ProjectiveTransform?,accuracy: freezed == accuracy ? _self.accuracy : accuracy // ignore: cast_nullable_to_non_nullable
as TransformAccuracy?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,calibratedAt: freezed == calibratedAt ? _self.calibratedAt : calibratedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,calibratedBy: freezed == calibratedBy ? _self.calibratedBy : calibratedBy // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

/// Create a copy of GcpConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LatLngCoordinateCopyWith<$Res> get campusOriginWgs84 {
  
  return $LatLngCoordinateCopyWith<$Res>(_self.campusOriginWgs84, (value) {
    return _then(_self.copyWith(campusOriginWgs84: value));
  });
}/// Create a copy of GcpConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UtmCoordinateCopyWith<$Res> get campusOriginUtm {
  
  return $UtmCoordinateCopyWith<$Res>(_self.campusOriginUtm, (value) {
    return _then(_self.copyWith(campusOriginUtm: value));
  });
}/// Create a copy of GcpConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GcpImageReferenceCopyWith<$Res>? get imageReference {
    if (_self.imageReference == null) {
    return null;
  }

  return $GcpImageReferenceCopyWith<$Res>(_self.imageReference!, (value) {
    return _then(_self.copyWith(imageReference: value));
  });
}/// Create a copy of GcpConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AffineTransformCopyWith<$Res>? get affineWgs84ToLocal {
    if (_self.affineWgs84ToLocal == null) {
    return null;
  }

  return $AffineTransformCopyWith<$Res>(_self.affineWgs84ToLocal!, (value) {
    return _then(_self.copyWith(affineWgs84ToLocal: value));
  });
}/// Create a copy of GcpConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AffineTransformCopyWith<$Res>? get affineLocalToWgs84 {
    if (_self.affineLocalToWgs84 == null) {
    return null;
  }

  return $AffineTransformCopyWith<$Res>(_self.affineLocalToWgs84!, (value) {
    return _then(_self.copyWith(affineLocalToWgs84: value));
  });
}/// Create a copy of GcpConfig
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
}/// Create a copy of GcpConfig
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
}/// Create a copy of GcpConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransformAccuracyCopyWith<$Res>? get accuracy {
    if (_self.accuracy == null) {
    return null;
  }

  return $TransformAccuracyCopyWith<$Res>(_self.accuracy!, (value) {
    return _then(_self.copyWith(accuracy: value));
  });
}
}


/// @nodoc
mixin _$GcpImageReference {

/// Image file path (asset or local file)
 String get imagePath;/// Image width in pixels
 int get width;/// Image height in pixels
 int get height;/// Image format (png, jpg, tiff, pdf)
 String get format;/// Description of the image (e.g., "Campus master plan 2024")
 String? get description;/// Source of the image
 String? get source;/// Date of the image
 DateTime? get imageDate;/// Coordinate system of the image coordinates
 GcpCoordinateSystem get coordinateSystem;
/// Create a copy of GcpImageReference
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GcpImageReferenceCopyWith<GcpImageReference> get copyWith => _$GcpImageReferenceCopyWithImpl<GcpImageReference>(this as GcpImageReference, _$identity);

  /// Serializes this GcpImageReference to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as GcpImageReference;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GcpImageReference&&(identical(other.imagePath, _this.imagePath) || other.imagePath == _this.imagePath)&&(identical(other.width, _this.width) || other.width == _this.width)&&(identical(other.height, _this.height) || other.height == _this.height)&&(identical(other.format, _this.format) || other.format == _this.format)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.source, _this.source) || other.source == _this.source)&&(identical(other.imageDate, _this.imageDate) || other.imageDate == _this.imageDate)&&(identical(other.coordinateSystem, _this.coordinateSystem) || other.coordinateSystem == _this.coordinateSystem));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as GcpImageReference;
  return Object.hash(runtimeType,_this.imagePath,_this.width,_this.height,_this.format,_this.description,_this.source,_this.imageDate,_this.coordinateSystem);
}

@override
String toString() {
  final _this = this as GcpImageReference;
  return 'GcpImageReference(imagePath: ${_this.imagePath}, width: ${_this.width}, height: ${_this.height}, format: ${_this.format}, description: ${_this.description}, source: ${_this.source}, imageDate: ${_this.imageDate}, coordinateSystem: ${_this.coordinateSystem})';
}


}

/// @nodoc
abstract mixin class $GcpImageReferenceCopyWith<$Res>  {
  factory $GcpImageReferenceCopyWith(GcpImageReference value, $Res Function(GcpImageReference) _then) = _$GcpImageReferenceCopyWithImpl;
@useResult
$Res call({
 String imagePath, int width, int height, String format, String? description, String? source, DateTime? imageDate, GcpCoordinateSystem coordinateSystem
});




}
/// @nodoc
class _$GcpImageReferenceCopyWithImpl<$Res>
    implements $GcpImageReferenceCopyWith<$Res> {
  _$GcpImageReferenceCopyWithImpl(this._self, this._then);

  final GcpImageReference _self;
  final $Res Function(GcpImageReference) _then;

/// Create a copy of GcpImageReference
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? imagePath = null,Object? width = null,Object? height = null,Object? format = null,Object? description = freezed,Object? source = freezed,Object? imageDate = freezed,Object? coordinateSystem = null,}) {
  return _then(GcpImageReference(
imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,imageDate: freezed == imageDate ? _self.imageDate : imageDate // ignore: cast_nullable_to_non_nullable
as DateTime?,coordinateSystem: null == coordinateSystem ? _self.coordinateSystem : coordinateSystem // ignore: cast_nullable_to_non_nullable
as GcpCoordinateSystem,
  ));
}

}


/// Adds pattern-matching-related methods to [GcpImageReference].
extension GcpImageReferencePatterns on GcpImageReference {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GcpImageReference value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GcpImageReference() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GcpImageReference value)  $default,){
final _that = this;
switch (_that) {
case _GcpImageReference():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GcpImageReference value)?  $default,){
final _that = this;
switch (_that) {
case _GcpImageReference() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String imagePath,  int width,  int height,  String format,  String? description,  String? source,  DateTime? imageDate,  GcpCoordinateSystem coordinateSystem)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GcpImageReference() when $default != null:
return $default(_that.imagePath,_that.width,_that.height,_that.format,_that.description,_that.source,_that.imageDate,_that.coordinateSystem);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String imagePath,  int width,  int height,  String format,  String? description,  String? source,  DateTime? imageDate,  GcpCoordinateSystem coordinateSystem)  $default,) {final _that = this;
switch (_that) {
case _GcpImageReference():
return $default(_that.imagePath,_that.width,_that.height,_that.format,_that.description,_that.source,_that.imageDate,_that.coordinateSystem);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String imagePath,  int width,  int height,  String format,  String? description,  String? source,  DateTime? imageDate,  GcpCoordinateSystem coordinateSystem)?  $default,) {final _that = this;
switch (_that) {
case _GcpImageReference() when $default != null:
return $default(_that.imagePath,_that.width,_that.height,_that.format,_that.description,_that.source,_that.imageDate,_that.coordinateSystem);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GcpImageReference implements GcpImageReference {
  const _GcpImageReference({required this.imagePath, required this.width, required this.height, required this.format, this.description, this.source, this.imageDate, this.coordinateSystem = GcpCoordinateSystem.pixels});
  factory _GcpImageReference.fromJson(Map<String, dynamic> json) => _$GcpImageReferenceFromJson(json);

/// Image file path (asset or local file)
@override final  String imagePath;
/// Image width in pixels
@override final  int width;
/// Image height in pixels
@override final  int height;
/// Image format (png, jpg, tiff, pdf)
@override final  String format;
/// Description of the image (e.g., "Campus master plan 2024")
@override final  String? description;
/// Source of the image
@override final  String? source;
/// Date of the image
@override final  DateTime? imageDate;
/// Coordinate system of the image coordinates
@override@JsonKey() final  GcpCoordinateSystem coordinateSystem;

/// Create a copy of GcpImageReference
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GcpImageReferenceCopyWith<_GcpImageReference> get copyWith => __$GcpImageReferenceCopyWithImpl<_GcpImageReference>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GcpImageReferenceToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GcpImageReference&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.format, format) || other.format == format)&&(identical(other.description, description) || other.description == description)&&(identical(other.source, source) || other.source == source)&&(identical(other.imageDate, imageDate) || other.imageDate == imageDate)&&(identical(other.coordinateSystem, coordinateSystem) || other.coordinateSystem == coordinateSystem));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,imagePath,width,height,format,description,source,imageDate,coordinateSystem);
}

@override
String toString() {
    return 'GcpImageReference(imagePath: $imagePath, width: $width, height: $height, format: $format, description: $description, source: $source, imageDate: $imageDate, coordinateSystem: $coordinateSystem)';
}


}

/// @nodoc
abstract mixin class _$GcpImageReferenceCopyWith<$Res> implements $GcpImageReferenceCopyWith<$Res> {
  factory _$GcpImageReferenceCopyWith(_GcpImageReference value, $Res Function(_GcpImageReference) _then) = __$GcpImageReferenceCopyWithImpl;
@override @useResult
$Res call({
 String imagePath, int width, int height, String format, String? description, String? source, DateTime? imageDate, GcpCoordinateSystem coordinateSystem
});




}
/// @nodoc
class __$GcpImageReferenceCopyWithImpl<$Res>
    implements _$GcpImageReferenceCopyWith<$Res> {
  __$GcpImageReferenceCopyWithImpl(this._self, this._then);

  final _GcpImageReference _self;
  final $Res Function(_GcpImageReference) _then;

/// Create a copy of GcpImageReference
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? imagePath = null,Object? width = null,Object? height = null,Object? format = null,Object? description = freezed,Object? source = freezed,Object? imageDate = freezed,Object? coordinateSystem = null,}) {
  return _then(_GcpImageReference(
imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,imageDate: freezed == imageDate ? _self.imageDate : imageDate // ignore: cast_nullable_to_non_nullable
as DateTime?,coordinateSystem: null == coordinateSystem ? _self.coordinateSystem : coordinateSystem // ignore: cast_nullable_to_non_nullable
as GcpCoordinateSystem,
  ));
}


}


/// @nodoc
mixin _$GcpEnvironmentConfig {

/// Environment name (development, staging, production)
 String get environment;/// GCP configuration
 GcpConfig get gcpConfig;/// Whether to use mock GPS for testing
 bool get useMockGps;/// Mock GPS location (if useMockGps is true)
 LatLngCoordinate? get mockGpsLocation;/// Whether to enable debug logging for coordinate transforms
 bool get debugTransforms;
/// Create a copy of GcpEnvironmentConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GcpEnvironmentConfigCopyWith<GcpEnvironmentConfig> get copyWith => _$GcpEnvironmentConfigCopyWithImpl<GcpEnvironmentConfig>(this as GcpEnvironmentConfig, _$identity);

  /// Serializes this GcpEnvironmentConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as GcpEnvironmentConfig;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GcpEnvironmentConfig&&(identical(other.environment, _this.environment) || other.environment == _this.environment)&&(identical(other.gcpConfig, _this.gcpConfig) || other.gcpConfig == _this.gcpConfig)&&(identical(other.useMockGps, _this.useMockGps) || other.useMockGps == _this.useMockGps)&&(identical(other.mockGpsLocation, _this.mockGpsLocation) || other.mockGpsLocation == _this.mockGpsLocation)&&(identical(other.debugTransforms, _this.debugTransforms) || other.debugTransforms == _this.debugTransforms));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as GcpEnvironmentConfig;
  return Object.hash(runtimeType,_this.environment,_this.gcpConfig,_this.useMockGps,_this.mockGpsLocation,_this.debugTransforms);
}

@override
String toString() {
  final _this = this as GcpEnvironmentConfig;
  return 'GcpEnvironmentConfig(environment: ${_this.environment}, gcpConfig: ${_this.gcpConfig}, useMockGps: ${_this.useMockGps}, mockGpsLocation: ${_this.mockGpsLocation}, debugTransforms: ${_this.debugTransforms})';
}


}

/// @nodoc
abstract mixin class $GcpEnvironmentConfigCopyWith<$Res>  {
  factory $GcpEnvironmentConfigCopyWith(GcpEnvironmentConfig value, $Res Function(GcpEnvironmentConfig) _then) = _$GcpEnvironmentConfigCopyWithImpl;
@useResult
$Res call({
 String environment, GcpConfig gcpConfig, bool useMockGps, LatLngCoordinate? mockGpsLocation, bool debugTransforms
});


$GcpConfigCopyWith<$Res> get gcpConfig;$LatLngCoordinateCopyWith<$Res>? get mockGpsLocation;

}
/// @nodoc
class _$GcpEnvironmentConfigCopyWithImpl<$Res>
    implements $GcpEnvironmentConfigCopyWith<$Res> {
  _$GcpEnvironmentConfigCopyWithImpl(this._self, this._then);

  final GcpEnvironmentConfig _self;
  final $Res Function(GcpEnvironmentConfig) _then;

/// Create a copy of GcpEnvironmentConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? environment = null,Object? gcpConfig = null,Object? useMockGps = null,Object? mockGpsLocation = freezed,Object? debugTransforms = null,}) {
  return _then(GcpEnvironmentConfig(
environment: null == environment ? _self.environment : environment // ignore: cast_nullable_to_non_nullable
as String,gcpConfig: null == gcpConfig ? _self.gcpConfig : gcpConfig // ignore: cast_nullable_to_non_nullable
as GcpConfig,useMockGps: null == useMockGps ? _self.useMockGps : useMockGps // ignore: cast_nullable_to_non_nullable
as bool,mockGpsLocation: freezed == mockGpsLocation ? _self.mockGpsLocation : mockGpsLocation // ignore: cast_nullable_to_non_nullable
as LatLngCoordinate?,debugTransforms: null == debugTransforms ? _self.debugTransforms : debugTransforms // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of GcpEnvironmentConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GcpConfigCopyWith<$Res> get gcpConfig {
  
  return $GcpConfigCopyWith<$Res>(_self.gcpConfig, (value) {
    return _then(_self.copyWith(gcpConfig: value));
  });
}/// Create a copy of GcpEnvironmentConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LatLngCoordinateCopyWith<$Res>? get mockGpsLocation {
    if (_self.mockGpsLocation == null) {
    return null;
  }

  return $LatLngCoordinateCopyWith<$Res>(_self.mockGpsLocation!, (value) {
    return _then(_self.copyWith(mockGpsLocation: value));
  });
}
}


/// Adds pattern-matching-related methods to [GcpEnvironmentConfig].
extension GcpEnvironmentConfigPatterns on GcpEnvironmentConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GcpEnvironmentConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GcpEnvironmentConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GcpEnvironmentConfig value)  $default,){
final _that = this;
switch (_that) {
case _GcpEnvironmentConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GcpEnvironmentConfig value)?  $default,){
final _that = this;
switch (_that) {
case _GcpEnvironmentConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String environment,  GcpConfig gcpConfig,  bool useMockGps,  LatLngCoordinate? mockGpsLocation,  bool debugTransforms)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GcpEnvironmentConfig() when $default != null:
return $default(_that.environment,_that.gcpConfig,_that.useMockGps,_that.mockGpsLocation,_that.debugTransforms);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String environment,  GcpConfig gcpConfig,  bool useMockGps,  LatLngCoordinate? mockGpsLocation,  bool debugTransforms)  $default,) {final _that = this;
switch (_that) {
case _GcpEnvironmentConfig():
return $default(_that.environment,_that.gcpConfig,_that.useMockGps,_that.mockGpsLocation,_that.debugTransforms);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String environment,  GcpConfig gcpConfig,  bool useMockGps,  LatLngCoordinate? mockGpsLocation,  bool debugTransforms)?  $default,) {final _that = this;
switch (_that) {
case _GcpEnvironmentConfig() when $default != null:
return $default(_that.environment,_that.gcpConfig,_that.useMockGps,_that.mockGpsLocation,_that.debugTransforms);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GcpEnvironmentConfig implements GcpEnvironmentConfig {
  const _GcpEnvironmentConfig({required this.environment, required this.gcpConfig, this.useMockGps = false, this.mockGpsLocation, this.debugTransforms = false});
  factory _GcpEnvironmentConfig.fromJson(Map<String, dynamic> json) => _$GcpEnvironmentConfigFromJson(json);

/// Environment name (development, staging, production)
@override final  String environment;
/// GCP configuration
@override final  GcpConfig gcpConfig;
/// Whether to use mock GPS for testing
@override@JsonKey() final  bool useMockGps;
/// Mock GPS location (if useMockGps is true)
@override final  LatLngCoordinate? mockGpsLocation;
/// Whether to enable debug logging for coordinate transforms
@override@JsonKey() final  bool debugTransforms;

/// Create a copy of GcpEnvironmentConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GcpEnvironmentConfigCopyWith<_GcpEnvironmentConfig> get copyWith => __$GcpEnvironmentConfigCopyWithImpl<_GcpEnvironmentConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GcpEnvironmentConfigToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GcpEnvironmentConfig&&(identical(other.environment, environment) || other.environment == environment)&&(identical(other.gcpConfig, gcpConfig) || other.gcpConfig == gcpConfig)&&(identical(other.useMockGps, useMockGps) || other.useMockGps == useMockGps)&&(identical(other.mockGpsLocation, mockGpsLocation) || other.mockGpsLocation == mockGpsLocation)&&(identical(other.debugTransforms, debugTransforms) || other.debugTransforms == debugTransforms));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,environment,gcpConfig,useMockGps,mockGpsLocation,debugTransforms);
}

@override
String toString() {
    return 'GcpEnvironmentConfig(environment: $environment, gcpConfig: $gcpConfig, useMockGps: $useMockGps, mockGpsLocation: $mockGpsLocation, debugTransforms: $debugTransforms)';
}


}

/// @nodoc
abstract mixin class _$GcpEnvironmentConfigCopyWith<$Res> implements $GcpEnvironmentConfigCopyWith<$Res> {
  factory _$GcpEnvironmentConfigCopyWith(_GcpEnvironmentConfig value, $Res Function(_GcpEnvironmentConfig) _then) = __$GcpEnvironmentConfigCopyWithImpl;
@override @useResult
$Res call({
 String environment, GcpConfig gcpConfig, bool useMockGps, LatLngCoordinate? mockGpsLocation, bool debugTransforms
});


@override $GcpConfigCopyWith<$Res> get gcpConfig;@override $LatLngCoordinateCopyWith<$Res>? get mockGpsLocation;

}
/// @nodoc
class __$GcpEnvironmentConfigCopyWithImpl<$Res>
    implements _$GcpEnvironmentConfigCopyWith<$Res> {
  __$GcpEnvironmentConfigCopyWithImpl(this._self, this._then);

  final _GcpEnvironmentConfig _self;
  final $Res Function(_GcpEnvironmentConfig) _then;

/// Create a copy of GcpEnvironmentConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? environment = null,Object? gcpConfig = null,Object? useMockGps = null,Object? mockGpsLocation = freezed,Object? debugTransforms = null,}) {
  return _then(_GcpEnvironmentConfig(
environment: null == environment ? _self.environment : environment // ignore: cast_nullable_to_non_nullable
as String,gcpConfig: null == gcpConfig ? _self.gcpConfig : gcpConfig // ignore: cast_nullable_to_non_nullable
as GcpConfig,useMockGps: null == useMockGps ? _self.useMockGps : useMockGps // ignore: cast_nullable_to_non_nullable
as bool,mockGpsLocation: freezed == mockGpsLocation ? _self.mockGpsLocation : mockGpsLocation // ignore: cast_nullable_to_non_nullable
as LatLngCoordinate?,debugTransforms: null == debugTransforms ? _self.debugTransforms : debugTransforms // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of GcpEnvironmentConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GcpConfigCopyWith<$Res> get gcpConfig {
  
  return $GcpConfigCopyWith<$Res>(_self.gcpConfig, (value) {
    return _then(_self.copyWith(gcpConfig: value));
  });
}/// Create a copy of GcpEnvironmentConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LatLngCoordinateCopyWith<$Res>? get mockGpsLocation {
    if (_self.mockGpsLocation == null) {
    return null;
  }

  return $LatLngCoordinateCopyWith<$Res>(_self.mockGpsLocation!, (value) {
    return _then(_self.copyWith(mockGpsLocation: value));
  });
}
}

// dart format on
