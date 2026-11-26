// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'campus_map_parser_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CampusReferencePoints {

 double get topLeftLat; double get topLeftLng; double get topRightLat; double get topRightLng; double get bottomLeftLat; double get bottomLeftLng; double get bottomRightLat; double get bottomRightLng; double get imageWidth; double get imageHeight; String get source; DateTime? get calibratedAt;
/// Create a copy of CampusReferencePoints
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CampusReferencePointsCopyWith<CampusReferencePoints> get copyWith => _$CampusReferencePointsCopyWithImpl<CampusReferencePoints>(this as CampusReferencePoints, _$identity);

  /// Serializes this CampusReferencePoints to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CampusReferencePoints;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CampusReferencePoints&&(identical(other.topLeftLat, _this.topLeftLat) || other.topLeftLat == _this.topLeftLat)&&(identical(other.topLeftLng, _this.topLeftLng) || other.topLeftLng == _this.topLeftLng)&&(identical(other.topRightLat, _this.topRightLat) || other.topRightLat == _this.topRightLat)&&(identical(other.topRightLng, _this.topRightLng) || other.topRightLng == _this.topRightLng)&&(identical(other.bottomLeftLat, _this.bottomLeftLat) || other.bottomLeftLat == _this.bottomLeftLat)&&(identical(other.bottomLeftLng, _this.bottomLeftLng) || other.bottomLeftLng == _this.bottomLeftLng)&&(identical(other.bottomRightLat, _this.bottomRightLat) || other.bottomRightLat == _this.bottomRightLat)&&(identical(other.bottomRightLng, _this.bottomRightLng) || other.bottomRightLng == _this.bottomRightLng)&&(identical(other.imageWidth, _this.imageWidth) || other.imageWidth == _this.imageWidth)&&(identical(other.imageHeight, _this.imageHeight) || other.imageHeight == _this.imageHeight)&&(identical(other.source, _this.source) || other.source == _this.source)&&(identical(other.calibratedAt, _this.calibratedAt) || other.calibratedAt == _this.calibratedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CampusReferencePoints;
  return Object.hash(runtimeType,_this.topLeftLat,_this.topLeftLng,_this.topRightLat,_this.topRightLng,_this.bottomLeftLat,_this.bottomLeftLng,_this.bottomRightLat,_this.bottomRightLng,_this.imageWidth,_this.imageHeight,_this.source,_this.calibratedAt);
}

@override
String toString() {
  final _this = this as CampusReferencePoints;
  return 'CampusReferencePoints(topLeftLat: ${_this.topLeftLat}, topLeftLng: ${_this.topLeftLng}, topRightLat: ${_this.topRightLat}, topRightLng: ${_this.topRightLng}, bottomLeftLat: ${_this.bottomLeftLat}, bottomLeftLng: ${_this.bottomLeftLng}, bottomRightLat: ${_this.bottomRightLat}, bottomRightLng: ${_this.bottomRightLng}, imageWidth: ${_this.imageWidth}, imageHeight: ${_this.imageHeight}, source: ${_this.source}, calibratedAt: ${_this.calibratedAt})';
}


}

/// @nodoc
abstract mixin class $CampusReferencePointsCopyWith<$Res>  {
  factory $CampusReferencePointsCopyWith(CampusReferencePoints value, $Res Function(CampusReferencePoints) _then) = _$CampusReferencePointsCopyWithImpl;
@useResult
$Res call({
 double topLeftLat, double topLeftLng, double topRightLat, double topRightLng, double bottomLeftLat, double bottomLeftLng, double bottomRightLat, double bottomRightLng, double imageWidth, double imageHeight, String source, DateTime? calibratedAt
});




}
/// @nodoc
class _$CampusReferencePointsCopyWithImpl<$Res>
    implements $CampusReferencePointsCopyWith<$Res> {
  _$CampusReferencePointsCopyWithImpl(this._self, this._then);

  final CampusReferencePoints _self;
  final $Res Function(CampusReferencePoints) _then;

/// Create a copy of CampusReferencePoints
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? topLeftLat = null,Object? topLeftLng = null,Object? topRightLat = null,Object? topRightLng = null,Object? bottomLeftLat = null,Object? bottomLeftLng = null,Object? bottomRightLat = null,Object? bottomRightLng = null,Object? imageWidth = null,Object? imageHeight = null,Object? source = null,Object? calibratedAt = freezed,}) {
  return _then(CampusReferencePoints(
topLeftLat: null == topLeftLat ? _self.topLeftLat : topLeftLat // ignore: cast_nullable_to_non_nullable
as double,topLeftLng: null == topLeftLng ? _self.topLeftLng : topLeftLng // ignore: cast_nullable_to_non_nullable
as double,topRightLat: null == topRightLat ? _self.topRightLat : topRightLat // ignore: cast_nullable_to_non_nullable
as double,topRightLng: null == topRightLng ? _self.topRightLng : topRightLng // ignore: cast_nullable_to_non_nullable
as double,bottomLeftLat: null == bottomLeftLat ? _self.bottomLeftLat : bottomLeftLat // ignore: cast_nullable_to_non_nullable
as double,bottomLeftLng: null == bottomLeftLng ? _self.bottomLeftLng : bottomLeftLng // ignore: cast_nullable_to_non_nullable
as double,bottomRightLat: null == bottomRightLat ? _self.bottomRightLat : bottomRightLat // ignore: cast_nullable_to_non_nullable
as double,bottomRightLng: null == bottomRightLng ? _self.bottomRightLng : bottomRightLng // ignore: cast_nullable_to_non_nullable
as double,imageWidth: null == imageWidth ? _self.imageWidth : imageWidth // ignore: cast_nullable_to_non_nullable
as double,imageHeight: null == imageHeight ? _self.imageHeight : imageHeight // ignore: cast_nullable_to_non_nullable
as double,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,calibratedAt: freezed == calibratedAt ? _self.calibratedAt : calibratedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CampusReferencePoints].
extension CampusReferencePointsPatterns on CampusReferencePoints {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CampusReferencePoints value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CampusReferencePoints() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CampusReferencePoints value)  $default,){
final _that = this;
switch (_that) {
case _CampusReferencePoints():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CampusReferencePoints value)?  $default,){
final _that = this;
switch (_that) {
case _CampusReferencePoints() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double topLeftLat,  double topLeftLng,  double topRightLat,  double topRightLng,  double bottomLeftLat,  double bottomLeftLng,  double bottomRightLat,  double bottomRightLng,  double imageWidth,  double imageHeight,  String source,  DateTime? calibratedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CampusReferencePoints() when $default != null:
return $default(_that.topLeftLat,_that.topLeftLng,_that.topRightLat,_that.topRightLng,_that.bottomLeftLat,_that.bottomLeftLng,_that.bottomRightLat,_that.bottomRightLng,_that.imageWidth,_that.imageHeight,_that.source,_that.calibratedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double topLeftLat,  double topLeftLng,  double topRightLat,  double topRightLng,  double bottomLeftLat,  double bottomLeftLng,  double bottomRightLat,  double bottomRightLng,  double imageWidth,  double imageHeight,  String source,  DateTime? calibratedAt)  $default,) {final _that = this;
switch (_that) {
case _CampusReferencePoints():
return $default(_that.topLeftLat,_that.topLeftLng,_that.topRightLat,_that.topRightLng,_that.bottomLeftLat,_that.bottomLeftLng,_that.bottomRightLat,_that.bottomRightLng,_that.imageWidth,_that.imageHeight,_that.source,_that.calibratedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double topLeftLat,  double topLeftLng,  double topRightLat,  double topRightLng,  double bottomLeftLat,  double bottomLeftLng,  double bottomRightLat,  double bottomRightLng,  double imageWidth,  double imageHeight,  String source,  DateTime? calibratedAt)?  $default,) {final _that = this;
switch (_that) {
case _CampusReferencePoints() when $default != null:
return $default(_that.topLeftLat,_that.topLeftLng,_that.topRightLat,_that.topRightLng,_that.bottomLeftLat,_that.bottomLeftLng,_that.bottomRightLat,_that.bottomRightLng,_that.imageWidth,_that.imageHeight,_that.source,_that.calibratedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CampusReferencePoints extends CampusReferencePoints {
  const _CampusReferencePoints({required this.topLeftLat, required this.topLeftLng, required this.topRightLat, required this.topRightLng, required this.bottomLeftLat, required this.bottomLeftLng, required this.bottomRightLat, required this.bottomRightLng, required this.imageWidth, required this.imageHeight, this.source = 'EARIST Cavite Campus Map', this.calibratedAt}): super._();
  factory _CampusReferencePoints.fromJson(Map<String, dynamic> json) => _$CampusReferencePointsFromJson(json);

@override final  double topLeftLat;
@override final  double topLeftLng;
@override final  double topRightLat;
@override final  double topRightLng;
@override final  double bottomLeftLat;
@override final  double bottomLeftLng;
@override final  double bottomRightLat;
@override final  double bottomRightLng;
@override final  double imageWidth;
@override final  double imageHeight;
@override@JsonKey() final  String source;
@override final  DateTime? calibratedAt;

/// Create a copy of CampusReferencePoints
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CampusReferencePointsCopyWith<_CampusReferencePoints> get copyWith => __$CampusReferencePointsCopyWithImpl<_CampusReferencePoints>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CampusReferencePointsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CampusReferencePoints&&(identical(other.topLeftLat, topLeftLat) || other.topLeftLat == topLeftLat)&&(identical(other.topLeftLng, topLeftLng) || other.topLeftLng == topLeftLng)&&(identical(other.topRightLat, topRightLat) || other.topRightLat == topRightLat)&&(identical(other.topRightLng, topRightLng) || other.topRightLng == topRightLng)&&(identical(other.bottomLeftLat, bottomLeftLat) || other.bottomLeftLat == bottomLeftLat)&&(identical(other.bottomLeftLng, bottomLeftLng) || other.bottomLeftLng == bottomLeftLng)&&(identical(other.bottomRightLat, bottomRightLat) || other.bottomRightLat == bottomRightLat)&&(identical(other.bottomRightLng, bottomRightLng) || other.bottomRightLng == bottomRightLng)&&(identical(other.imageWidth, imageWidth) || other.imageWidth == imageWidth)&&(identical(other.imageHeight, imageHeight) || other.imageHeight == imageHeight)&&(identical(other.source, source) || other.source == source)&&(identical(other.calibratedAt, calibratedAt) || other.calibratedAt == calibratedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,topLeftLat,topLeftLng,topRightLat,topRightLng,bottomLeftLat,bottomLeftLng,bottomRightLat,bottomRightLng,imageWidth,imageHeight,source,calibratedAt);
}

@override
String toString() {
    return 'CampusReferencePoints(topLeftLat: $topLeftLat, topLeftLng: $topLeftLng, topRightLat: $topRightLat, topRightLng: $topRightLng, bottomLeftLat: $bottomLeftLat, bottomLeftLng: $bottomLeftLng, bottomRightLat: $bottomRightLat, bottomRightLng: $bottomRightLng, imageWidth: $imageWidth, imageHeight: $imageHeight, source: $source, calibratedAt: $calibratedAt)';
}


}

/// @nodoc
abstract mixin class _$CampusReferencePointsCopyWith<$Res> implements $CampusReferencePointsCopyWith<$Res> {
  factory _$CampusReferencePointsCopyWith(_CampusReferencePoints value, $Res Function(_CampusReferencePoints) _then) = __$CampusReferencePointsCopyWithImpl;
@override @useResult
$Res call({
 double topLeftLat, double topLeftLng, double topRightLat, double topRightLng, double bottomLeftLat, double bottomLeftLng, double bottomRightLat, double bottomRightLng, double imageWidth, double imageHeight, String source, DateTime? calibratedAt
});




}
/// @nodoc
class __$CampusReferencePointsCopyWithImpl<$Res>
    implements _$CampusReferencePointsCopyWith<$Res> {
  __$CampusReferencePointsCopyWithImpl(this._self, this._then);

  final _CampusReferencePoints _self;
  final $Res Function(_CampusReferencePoints) _then;

/// Create a copy of CampusReferencePoints
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? topLeftLat = null,Object? topLeftLng = null,Object? topRightLat = null,Object? topRightLng = null,Object? bottomLeftLat = null,Object? bottomLeftLng = null,Object? bottomRightLat = null,Object? bottomRightLng = null,Object? imageWidth = null,Object? imageHeight = null,Object? source = null,Object? calibratedAt = freezed,}) {
  return _then(_CampusReferencePoints(
topLeftLat: null == topLeftLat ? _self.topLeftLat : topLeftLat // ignore: cast_nullable_to_non_nullable
as double,topLeftLng: null == topLeftLng ? _self.topLeftLng : topLeftLng // ignore: cast_nullable_to_non_nullable
as double,topRightLat: null == topRightLat ? _self.topRightLat : topRightLat // ignore: cast_nullable_to_non_nullable
as double,topRightLng: null == topRightLng ? _self.topRightLng : topRightLng // ignore: cast_nullable_to_non_nullable
as double,bottomLeftLat: null == bottomLeftLat ? _self.bottomLeftLat : bottomLeftLat // ignore: cast_nullable_to_non_nullable
as double,bottomLeftLng: null == bottomLeftLng ? _self.bottomLeftLng : bottomLeftLng // ignore: cast_nullable_to_non_nullable
as double,bottomRightLat: null == bottomRightLat ? _self.bottomRightLat : bottomRightLat // ignore: cast_nullable_to_non_nullable
as double,bottomRightLng: null == bottomRightLng ? _self.bottomRightLng : bottomRightLng // ignore: cast_nullable_to_non_nullable
as double,imageWidth: null == imageWidth ? _self.imageWidth : imageWidth // ignore: cast_nullable_to_non_nullable
as double,imageHeight: null == imageHeight ? _self.imageHeight : imageHeight // ignore: cast_nullable_to_non_nullable
as double,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,calibratedAt: freezed == calibratedAt ? _self.calibratedAt : calibratedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$RoomSearchFilter {

 String? get query; String? get buildingId; String? get floorId;@RoomCategoryConverter() RoomCategory? get category;@DataConfidenceConverter() DataConfidence? get minConfidence; bool? get navigableOnly; bool? get facilityOnly;
/// Create a copy of RoomSearchFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoomSearchFilterCopyWith<RoomSearchFilter> get copyWith => _$RoomSearchFilterCopyWithImpl<RoomSearchFilter>(this as RoomSearchFilter, _$identity);

  /// Serializes this RoomSearchFilter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RoomSearchFilter;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomSearchFilter&&(identical(other.query, _this.query) || other.query == _this.query)&&(identical(other.buildingId, _this.buildingId) || other.buildingId == _this.buildingId)&&(identical(other.floorId, _this.floorId) || other.floorId == _this.floorId)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.minConfidence, _this.minConfidence) || other.minConfidence == _this.minConfidence)&&(identical(other.navigableOnly, _this.navigableOnly) || other.navigableOnly == _this.navigableOnly)&&(identical(other.facilityOnly, _this.facilityOnly) || other.facilityOnly == _this.facilityOnly));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RoomSearchFilter;
  return Object.hash(runtimeType,_this.query,_this.buildingId,_this.floorId,_this.category,_this.minConfidence,_this.navigableOnly,_this.facilityOnly);
}

@override
String toString() {
  final _this = this as RoomSearchFilter;
  return 'RoomSearchFilter(query: ${_this.query}, buildingId: ${_this.buildingId}, floorId: ${_this.floorId}, category: ${_this.category}, minConfidence: ${_this.minConfidence}, navigableOnly: ${_this.navigableOnly}, facilityOnly: ${_this.facilityOnly})';
}


}

/// @nodoc
abstract mixin class $RoomSearchFilterCopyWith<$Res>  {
  factory $RoomSearchFilterCopyWith(RoomSearchFilter value, $Res Function(RoomSearchFilter) _then) = _$RoomSearchFilterCopyWithImpl;
@useResult
$Res call({
 String? query, String? buildingId, String? floorId,@RoomCategoryConverter() RoomCategory? category,@DataConfidenceConverter() DataConfidence? minConfidence, bool? navigableOnly, bool? facilityOnly
});


$RoomCategoryCopyWith<$Res>? get category;$DataConfidenceCopyWith<$Res>? get minConfidence;

}
/// @nodoc
class _$RoomSearchFilterCopyWithImpl<$Res>
    implements $RoomSearchFilterCopyWith<$Res> {
  _$RoomSearchFilterCopyWithImpl(this._self, this._then);

  final RoomSearchFilter _self;
  final $Res Function(RoomSearchFilter) _then;

/// Create a copy of RoomSearchFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = freezed,Object? buildingId = freezed,Object? floorId = freezed,Object? category = freezed,Object? minConfidence = freezed,Object? navigableOnly = freezed,Object? facilityOnly = freezed,}) {
  return _then(RoomSearchFilter(
query: freezed == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String?,buildingId: freezed == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as String?,floorId: freezed == floorId ? _self.floorId : floorId // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as RoomCategory?,minConfidence: freezed == minConfidence ? _self.minConfidence : minConfidence // ignore: cast_nullable_to_non_nullable
as DataConfidence?,navigableOnly: freezed == navigableOnly ? _self.navigableOnly : navigableOnly // ignore: cast_nullable_to_non_nullable
as bool?,facilityOnly: freezed == facilityOnly ? _self.facilityOnly : facilityOnly // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of RoomSearchFilter
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoomCategoryCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $RoomCategoryCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of RoomSearchFilter
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DataConfidenceCopyWith<$Res>? get minConfidence {
    if (_self.minConfidence == null) {
    return null;
  }

  return $DataConfidenceCopyWith<$Res>(_self.minConfidence!, (value) {
    return _then(_self.copyWith(minConfidence: value));
  });
}
}


/// Adds pattern-matching-related methods to [RoomSearchFilter].
extension RoomSearchFilterPatterns on RoomSearchFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoomSearchFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoomSearchFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoomSearchFilter value)  $default,){
final _that = this;
switch (_that) {
case _RoomSearchFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoomSearchFilter value)?  $default,){
final _that = this;
switch (_that) {
case _RoomSearchFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? query,  String? buildingId,  String? floorId, @RoomCategoryConverter()  RoomCategory? category, @DataConfidenceConverter()  DataConfidence? minConfidence,  bool? navigableOnly,  bool? facilityOnly)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoomSearchFilter() when $default != null:
return $default(_that.query,_that.buildingId,_that.floorId,_that.category,_that.minConfidence,_that.navigableOnly,_that.facilityOnly);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? query,  String? buildingId,  String? floorId, @RoomCategoryConverter()  RoomCategory? category, @DataConfidenceConverter()  DataConfidence? minConfidence,  bool? navigableOnly,  bool? facilityOnly)  $default,) {final _that = this;
switch (_that) {
case _RoomSearchFilter():
return $default(_that.query,_that.buildingId,_that.floorId,_that.category,_that.minConfidence,_that.navigableOnly,_that.facilityOnly);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? query,  String? buildingId,  String? floorId, @RoomCategoryConverter()  RoomCategory? category, @DataConfidenceConverter()  DataConfidence? minConfidence,  bool? navigableOnly,  bool? facilityOnly)?  $default,) {final _that = this;
switch (_that) {
case _RoomSearchFilter() when $default != null:
return $default(_that.query,_that.buildingId,_that.floorId,_that.category,_that.minConfidence,_that.navigableOnly,_that.facilityOnly);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoomSearchFilter extends RoomSearchFilter {
  const _RoomSearchFilter({this.query, this.buildingId, this.floorId, @RoomCategoryConverter() this.category, @DataConfidenceConverter() this.minConfidence, this.navigableOnly, this.facilityOnly}): super._();
  factory _RoomSearchFilter.fromJson(Map<String, dynamic> json) => _$RoomSearchFilterFromJson(json);

@override final  String? query;
@override final  String? buildingId;
@override final  String? floorId;
@override@RoomCategoryConverter() final  RoomCategory? category;
@override@DataConfidenceConverter() final  DataConfidence? minConfidence;
@override final  bool? navigableOnly;
@override final  bool? facilityOnly;

/// Create a copy of RoomSearchFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoomSearchFilterCopyWith<_RoomSearchFilter> get copyWith => __$RoomSearchFilterCopyWithImpl<_RoomSearchFilter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoomSearchFilterToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoomSearchFilter&&(identical(other.query, query) || other.query == query)&&(identical(other.buildingId, buildingId) || other.buildingId == buildingId)&&(identical(other.floorId, floorId) || other.floorId == floorId)&&(identical(other.category, category) || other.category == category)&&(identical(other.minConfidence, minConfidence) || other.minConfidence == minConfidence)&&(identical(other.navigableOnly, navigableOnly) || other.navigableOnly == navigableOnly)&&(identical(other.facilityOnly, facilityOnly) || other.facilityOnly == facilityOnly));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,query,buildingId,floorId,category,minConfidence,navigableOnly,facilityOnly);
}

@override
String toString() {
    return 'RoomSearchFilter(query: $query, buildingId: $buildingId, floorId: $floorId, category: $category, minConfidence: $minConfidence, navigableOnly: $navigableOnly, facilityOnly: $facilityOnly)';
}


}

/// @nodoc
abstract mixin class _$RoomSearchFilterCopyWith<$Res> implements $RoomSearchFilterCopyWith<$Res> {
  factory _$RoomSearchFilterCopyWith(_RoomSearchFilter value, $Res Function(_RoomSearchFilter) _then) = __$RoomSearchFilterCopyWithImpl;
@override @useResult
$Res call({
 String? query, String? buildingId, String? floorId,@RoomCategoryConverter() RoomCategory? category,@DataConfidenceConverter() DataConfidence? minConfidence, bool? navigableOnly, bool? facilityOnly
});


@override $RoomCategoryCopyWith<$Res>? get category;@override $DataConfidenceCopyWith<$Res>? get minConfidence;

}
/// @nodoc
class __$RoomSearchFilterCopyWithImpl<$Res>
    implements _$RoomSearchFilterCopyWith<$Res> {
  __$RoomSearchFilterCopyWithImpl(this._self, this._then);

  final _RoomSearchFilter _self;
  final $Res Function(_RoomSearchFilter) _then;

/// Create a copy of RoomSearchFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = freezed,Object? buildingId = freezed,Object? floorId = freezed,Object? category = freezed,Object? minConfidence = freezed,Object? navigableOnly = freezed,Object? facilityOnly = freezed,}) {
  return _then(_RoomSearchFilter(
query: freezed == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String?,buildingId: freezed == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as String?,floorId: freezed == floorId ? _self.floorId : floorId // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as RoomCategory?,minConfidence: freezed == minConfidence ? _self.minConfidence : minConfidence // ignore: cast_nullable_to_non_nullable
as DataConfidence?,navigableOnly: freezed == navigableOnly ? _self.navigableOnly : navigableOnly // ignore: cast_nullable_to_non_nullable
as bool?,facilityOnly: freezed == facilityOnly ? _self.facilityOnly : facilityOnly // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of RoomSearchFilter
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoomCategoryCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $RoomCategoryCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of RoomSearchFilter
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DataConfidenceCopyWith<$Res>? get minConfidence {
    if (_self.minConfidence == null) {
    return null;
  }

  return $DataConfidenceCopyWith<$Res>(_self.minConfidence!, (value) {
    return _then(_self.copyWith(minConfidence: value));
  });
}
}


/// @nodoc
mixin _$RoomSearchResult {

 List<CampusRoom> get rooms; int get totalCount; RoomSearchFilter get filter; int? get page; int? get pageSize;
/// Create a copy of RoomSearchResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoomSearchResultCopyWith<RoomSearchResult> get copyWith => _$RoomSearchResultCopyWithImpl<RoomSearchResult>(this as RoomSearchResult, _$identity);

  /// Serializes this RoomSearchResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RoomSearchResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomSearchResult&&const DeepCollectionEquality().equals(other.rooms, _this.rooms)&&(identical(other.totalCount, _this.totalCount) || other.totalCount == _this.totalCount)&&(identical(other.filter, _this.filter) || other.filter == _this.filter)&&(identical(other.page, _this.page) || other.page == _this.page)&&(identical(other.pageSize, _this.pageSize) || other.pageSize == _this.pageSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RoomSearchResult;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.rooms),_this.totalCount,_this.filter,_this.page,_this.pageSize);
}

@override
String toString() {
  final _this = this as RoomSearchResult;
  return 'RoomSearchResult(rooms: ${_this.rooms}, totalCount: ${_this.totalCount}, filter: ${_this.filter}, page: ${_this.page}, pageSize: ${_this.pageSize})';
}


}

/// @nodoc
abstract mixin class $RoomSearchResultCopyWith<$Res>  {
  factory $RoomSearchResultCopyWith(RoomSearchResult value, $Res Function(RoomSearchResult) _then) = _$RoomSearchResultCopyWithImpl;
@useResult
$Res call({
 List<CampusRoom> rooms, int totalCount, RoomSearchFilter filter, int? page, int? pageSize
});


$RoomSearchFilterCopyWith<$Res> get filter;

}
/// @nodoc
class _$RoomSearchResultCopyWithImpl<$Res>
    implements $RoomSearchResultCopyWith<$Res> {
  _$RoomSearchResultCopyWithImpl(this._self, this._then);

  final RoomSearchResult _self;
  final $Res Function(RoomSearchResult) _then;

/// Create a copy of RoomSearchResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rooms = null,Object? totalCount = null,Object? filter = null,Object? page = freezed,Object? pageSize = freezed,}) {
  return _then(RoomSearchResult(
rooms: null == rooms ? _self.rooms : rooms // ignore: cast_nullable_to_non_nullable
as List<CampusRoom>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as RoomSearchFilter,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,pageSize: freezed == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of RoomSearchResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoomSearchFilterCopyWith<$Res> get filter {
  
  return $RoomSearchFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}
}


/// Adds pattern-matching-related methods to [RoomSearchResult].
extension RoomSearchResultPatterns on RoomSearchResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoomSearchResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoomSearchResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoomSearchResult value)  $default,){
final _that = this;
switch (_that) {
case _RoomSearchResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoomSearchResult value)?  $default,){
final _that = this;
switch (_that) {
case _RoomSearchResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CampusRoom> rooms,  int totalCount,  RoomSearchFilter filter,  int? page,  int? pageSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoomSearchResult() when $default != null:
return $default(_that.rooms,_that.totalCount,_that.filter,_that.page,_that.pageSize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CampusRoom> rooms,  int totalCount,  RoomSearchFilter filter,  int? page,  int? pageSize)  $default,) {final _that = this;
switch (_that) {
case _RoomSearchResult():
return $default(_that.rooms,_that.totalCount,_that.filter,_that.page,_that.pageSize);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CampusRoom> rooms,  int totalCount,  RoomSearchFilter filter,  int? page,  int? pageSize)?  $default,) {final _that = this;
switch (_that) {
case _RoomSearchResult() when $default != null:
return $default(_that.rooms,_that.totalCount,_that.filter,_that.page,_that.pageSize);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoomSearchResult extends RoomSearchResult {
  const _RoomSearchResult({required  List<CampusRoom> rooms, required this.totalCount, required this.filter, this.page, this.pageSize}): _rooms = rooms,super._();
  factory _RoomSearchResult.fromJson(Map<String, dynamic> json) => _$RoomSearchResultFromJson(json);

 final  List<CampusRoom> _rooms;
@override List<CampusRoom> get rooms {
  if (_rooms is EqualUnmodifiableListView) return _rooms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rooms);
}

@override final  int totalCount;
@override final  RoomSearchFilter filter;
@override final  int? page;
@override final  int? pageSize;

/// Create a copy of RoomSearchResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoomSearchResultCopyWith<_RoomSearchResult> get copyWith => __$RoomSearchResultCopyWithImpl<_RoomSearchResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoomSearchResultToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoomSearchResult&&const DeepCollectionEquality().equals(other.rooms, _rooms)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_rooms),totalCount,filter,page,pageSize);
}

@override
String toString() {
    return 'RoomSearchResult(rooms: $rooms, totalCount: $totalCount, filter: $filter, page: $page, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class _$RoomSearchResultCopyWith<$Res> implements $RoomSearchResultCopyWith<$Res> {
  factory _$RoomSearchResultCopyWith(_RoomSearchResult value, $Res Function(_RoomSearchResult) _then) = __$RoomSearchResultCopyWithImpl;
@override @useResult
$Res call({
 List<CampusRoom> rooms, int totalCount, RoomSearchFilter filter, int? page, int? pageSize
});


@override $RoomSearchFilterCopyWith<$Res> get filter;

}
/// @nodoc
class __$RoomSearchResultCopyWithImpl<$Res>
    implements _$RoomSearchResultCopyWith<$Res> {
  __$RoomSearchResultCopyWithImpl(this._self, this._then);

  final _RoomSearchResult _self;
  final $Res Function(_RoomSearchResult) _then;

/// Create a copy of RoomSearchResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rooms = null,Object? totalCount = null,Object? filter = null,Object? page = freezed,Object? pageSize = freezed,}) {
  return _then(_RoomSearchResult(
rooms: null == rooms ? _self._rooms : rooms // ignore: cast_nullable_to_non_nullable
as List<CampusRoom>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as RoomSearchFilter,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,pageSize: freezed == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of RoomSearchResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoomSearchFilterCopyWith<$Res> get filter {
  
  return $RoomSearchFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}
}

// dart format on
