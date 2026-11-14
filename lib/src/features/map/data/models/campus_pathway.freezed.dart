// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'campus_pathway.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PathwayCategory {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PathwayCategory);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PathwayCategory()';
}


}

/// @nodoc
class $PathwayCategoryCopyWith<$Res>  {
$PathwayCategoryCopyWith(PathwayCategory _, $Res Function(PathwayCategory) __);
}


/// Adds pattern-matching-related methods to [PathwayCategory].
extension PathwayCategoryPatterns on PathwayCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _MainPath value)?  mainPath,TResult Function( _Connector value)?  connector,TResult Function( _Perimeter value)?  perimeter,TResult Function( _Emergency value)?  emergency,TResult Function( _Parking value)?  parking,TResult Function( _OpenSpace value)?  openSpace,TResult Function( _Other value)?  other,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MainPath() when mainPath != null:
return mainPath(_that);case _Connector() when connector != null:
return connector(_that);case _Perimeter() when perimeter != null:
return perimeter(_that);case _Emergency() when emergency != null:
return emergency(_that);case _Parking() when parking != null:
return parking(_that);case _OpenSpace() when openSpace != null:
return openSpace(_that);case _Other() when other != null:
return other(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _MainPath value)  mainPath,required TResult Function( _Connector value)  connector,required TResult Function( _Perimeter value)  perimeter,required TResult Function( _Emergency value)  emergency,required TResult Function( _Parking value)  parking,required TResult Function( _OpenSpace value)  openSpace,required TResult Function( _Other value)  other,}){
final _that = this;
switch (_that) {
case _MainPath():
return mainPath(_that);case _Connector():
return connector(_that);case _Perimeter():
return perimeter(_that);case _Emergency():
return emergency(_that);case _Parking():
return parking(_that);case _OpenSpace():
return openSpace(_that);case _Other():
return other(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _MainPath value)?  mainPath,TResult? Function( _Connector value)?  connector,TResult? Function( _Perimeter value)?  perimeter,TResult? Function( _Emergency value)?  emergency,TResult? Function( _Parking value)?  parking,TResult? Function( _OpenSpace value)?  openSpace,TResult? Function( _Other value)?  other,}){
final _that = this;
switch (_that) {
case _MainPath() when mainPath != null:
return mainPath(_that);case _Connector() when connector != null:
return connector(_that);case _Perimeter() when perimeter != null:
return perimeter(_that);case _Emergency() when emergency != null:
return emergency(_that);case _Parking() when parking != null:
return parking(_that);case _OpenSpace() when openSpace != null:
return openSpace(_that);case _Other() when other != null:
return other(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  mainPath,TResult Function()?  connector,TResult Function()?  perimeter,TResult Function()?  emergency,TResult Function()?  parking,TResult Function()?  openSpace,TResult Function()?  other,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MainPath() when mainPath != null:
return mainPath();case _Connector() when connector != null:
return connector();case _Perimeter() when perimeter != null:
return perimeter();case _Emergency() when emergency != null:
return emergency();case _Parking() when parking != null:
return parking();case _OpenSpace() when openSpace != null:
return openSpace();case _Other() when other != null:
return other();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  mainPath,required TResult Function()  connector,required TResult Function()  perimeter,required TResult Function()  emergency,required TResult Function()  parking,required TResult Function()  openSpace,required TResult Function()  other,}) {final _that = this;
switch (_that) {
case _MainPath():
return mainPath();case _Connector():
return connector();case _Perimeter():
return perimeter();case _Emergency():
return emergency();case _Parking():
return parking();case _OpenSpace():
return openSpace();case _Other():
return other();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  mainPath,TResult? Function()?  connector,TResult? Function()?  perimeter,TResult? Function()?  emergency,TResult? Function()?  parking,TResult? Function()?  openSpace,TResult? Function()?  other,}) {final _that = this;
switch (_that) {
case _MainPath() when mainPath != null:
return mainPath();case _Connector() when connector != null:
return connector();case _Perimeter() when perimeter != null:
return perimeter();case _Emergency() when emergency != null:
return emergency();case _Parking() when parking != null:
return parking();case _OpenSpace() when openSpace != null:
return openSpace();case _Other() when other != null:
return other();case _:
  return null;

}
}

}

/// @nodoc


class _MainPath implements PathwayCategory {
  const _MainPath();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MainPath);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PathwayCategory.mainPath()';
}


}




/// @nodoc


class _Connector implements PathwayCategory {
  const _Connector();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Connector);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PathwayCategory.connector()';
}


}




/// @nodoc


class _Perimeter implements PathwayCategory {
  const _Perimeter();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Perimeter);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PathwayCategory.perimeter()';
}


}




/// @nodoc


class _Emergency implements PathwayCategory {
  const _Emergency();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Emergency);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PathwayCategory.emergency()';
}


}




/// @nodoc


class _Parking implements PathwayCategory {
  const _Parking();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Parking);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PathwayCategory.parking()';
}


}




/// @nodoc


class _OpenSpace implements PathwayCategory {
  const _OpenSpace();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpenSpace);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PathwayCategory.openSpace()';
}


}




/// @nodoc


class _Other implements PathwayCategory {
  const _Other();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Other);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'PathwayCategory.other()';
}


}





/// @nodoc
mixin _$CampusPathway {

 String get id; String get name; String get highway; String get surface; double get width;@PathwayCategoryConverter() PathwayCategory get category; String get description; String get source; String get verificationStatus; List<LatLng> get coordinates; String? get geometryType; int? get capacity; Map<String, dynamic>? get additionalTags;
/// Create a copy of CampusPathway
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CampusPathwayCopyWith<CampusPathway> get copyWith => _$CampusPathwayCopyWithImpl<CampusPathway>(this as CampusPathway, _$identity);

  /// Serializes this CampusPathway to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CampusPathway;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CampusPathway&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.highway, _this.highway) || other.highway == _this.highway)&&(identical(other.surface, _this.surface) || other.surface == _this.surface)&&(identical(other.width, _this.width) || other.width == _this.width)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.source, _this.source) || other.source == _this.source)&&(identical(other.verificationStatus, _this.verificationStatus) || other.verificationStatus == _this.verificationStatus)&&const DeepCollectionEquality().equals(other.coordinates, _this.coordinates)&&(identical(other.geometryType, _this.geometryType) || other.geometryType == _this.geometryType)&&(identical(other.capacity, _this.capacity) || other.capacity == _this.capacity)&&const DeepCollectionEquality().equals(other.additionalTags, _this.additionalTags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CampusPathway;
  return Object.hash(runtimeType,_this.id,_this.name,_this.highway,_this.surface,_this.width,_this.category,_this.description,_this.source,_this.verificationStatus,const DeepCollectionEquality().hash(_this.coordinates),_this.geometryType,_this.capacity,const DeepCollectionEquality().hash(_this.additionalTags));
}

@override
String toString() {
  final _this = this as CampusPathway;
  return 'CampusPathway(id: ${_this.id}, name: ${_this.name}, highway: ${_this.highway}, surface: ${_this.surface}, width: ${_this.width}, category: ${_this.category}, description: ${_this.description}, source: ${_this.source}, verificationStatus: ${_this.verificationStatus}, coordinates: ${_this.coordinates}, geometryType: ${_this.geometryType}, capacity: ${_this.capacity}, additionalTags: ${_this.additionalTags})';
}


}

/// @nodoc
abstract mixin class $CampusPathwayCopyWith<$Res>  {
  factory $CampusPathwayCopyWith(CampusPathway value, $Res Function(CampusPathway) _then) = _$CampusPathwayCopyWithImpl;
@useResult
$Res call({
 String id, String name, String highway, String surface, double width,@PathwayCategoryConverter() PathwayCategory category, String description, String source, String verificationStatus, List<LatLng> coordinates, String? geometryType, int? capacity, Map<String, dynamic>? additionalTags
});


$PathwayCategoryCopyWith<$Res> get category;

}
/// @nodoc
class _$CampusPathwayCopyWithImpl<$Res>
    implements $CampusPathwayCopyWith<$Res> {
  _$CampusPathwayCopyWithImpl(this._self, this._then);

  final CampusPathway _self;
  final $Res Function(CampusPathway) _then;

/// Create a copy of CampusPathway
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? highway = null,Object? surface = null,Object? width = null,Object? category = null,Object? description = null,Object? source = null,Object? verificationStatus = null,Object? coordinates = null,Object? geometryType = freezed,Object? capacity = freezed,Object? additionalTags = freezed,}) {
  return _then(CampusPathway(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,highway: null == highway ? _self.highway : highway // ignore: cast_nullable_to_non_nullable
as String,surface: null == surface ? _self.surface : surface // ignore: cast_nullable_to_non_nullable
as String,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as PathwayCategory,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,verificationStatus: null == verificationStatus ? _self.verificationStatus : verificationStatus // ignore: cast_nullable_to_non_nullable
as String,coordinates: null == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as List<LatLng>,geometryType: freezed == geometryType ? _self.geometryType : geometryType // ignore: cast_nullable_to_non_nullable
as String?,capacity: freezed == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int?,additionalTags: freezed == additionalTags ? _self.additionalTags : additionalTags // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}
/// Create a copy of CampusPathway
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PathwayCategoryCopyWith<$Res> get category {
  
  return $PathwayCategoryCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// Adds pattern-matching-related methods to [CampusPathway].
extension CampusPathwayPatterns on CampusPathway {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CampusPathway value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CampusPathway() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CampusPathway value)  $default,){
final _that = this;
switch (_that) {
case _CampusPathway():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CampusPathway value)?  $default,){
final _that = this;
switch (_that) {
case _CampusPathway() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String highway,  String surface,  double width, @PathwayCategoryConverter()  PathwayCategory category,  String description,  String source,  String verificationStatus,  List<LatLng> coordinates,  String? geometryType,  int? capacity,  Map<String, dynamic>? additionalTags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CampusPathway() when $default != null:
return $default(_that.id,_that.name,_that.highway,_that.surface,_that.width,_that.category,_that.description,_that.source,_that.verificationStatus,_that.coordinates,_that.geometryType,_that.capacity,_that.additionalTags);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String highway,  String surface,  double width, @PathwayCategoryConverter()  PathwayCategory category,  String description,  String source,  String verificationStatus,  List<LatLng> coordinates,  String? geometryType,  int? capacity,  Map<String, dynamic>? additionalTags)  $default,) {final _that = this;
switch (_that) {
case _CampusPathway():
return $default(_that.id,_that.name,_that.highway,_that.surface,_that.width,_that.category,_that.description,_that.source,_that.verificationStatus,_that.coordinates,_that.geometryType,_that.capacity,_that.additionalTags);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String highway,  String surface,  double width, @PathwayCategoryConverter()  PathwayCategory category,  String description,  String source,  String verificationStatus,  List<LatLng> coordinates,  String? geometryType,  int? capacity,  Map<String, dynamic>? additionalTags)?  $default,) {final _that = this;
switch (_that) {
case _CampusPathway() when $default != null:
return $default(_that.id,_that.name,_that.highway,_that.surface,_that.width,_that.category,_that.description,_that.source,_that.verificationStatus,_that.coordinates,_that.geometryType,_that.capacity,_that.additionalTags);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CampusPathway extends CampusPathway {
  const _CampusPathway({required this.id, required this.name, required this.highway, required this.surface, required this.width, @PathwayCategoryConverter() required this.category, required this.description, required this.source, required this.verificationStatus, required  List<LatLng> coordinates, this.geometryType, this.capacity,  Map<String, dynamic>? additionalTags}): _coordinates = coordinates,_additionalTags = additionalTags,super._();
  factory _CampusPathway.fromJson(Map<String, dynamic> json) => _$CampusPathwayFromJson(json);

@override final  String id;
@override final  String name;
@override final  String highway;
@override final  String surface;
@override final  double width;
@override@PathwayCategoryConverter() final  PathwayCategory category;
@override final  String description;
@override final  String source;
@override final  String verificationStatus;
 final  List<LatLng> _coordinates;
@override List<LatLng> get coordinates {
  if (_coordinates is EqualUnmodifiableListView) return _coordinates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_coordinates);
}

@override final  String? geometryType;
@override final  int? capacity;
 final  Map<String, dynamic>? _additionalTags;
@override Map<String, dynamic>? get additionalTags {
  final value = _additionalTags;
  if (value == null) return null;
  if (_additionalTags is EqualUnmodifiableMapView) return _additionalTags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of CampusPathway
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CampusPathwayCopyWith<_CampusPathway> get copyWith => __$CampusPathwayCopyWithImpl<_CampusPathway>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CampusPathwayToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CampusPathway&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.highway, highway) || other.highway == highway)&&(identical(other.surface, surface) || other.surface == surface)&&(identical(other.width, width) || other.width == width)&&(identical(other.category, category) || other.category == category)&&(identical(other.description, description) || other.description == description)&&(identical(other.source, source) || other.source == source)&&(identical(other.verificationStatus, verificationStatus) || other.verificationStatus == verificationStatus)&&const DeepCollectionEquality().equals(other.coordinates, _coordinates)&&(identical(other.geometryType, geometryType) || other.geometryType == geometryType)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&const DeepCollectionEquality().equals(other.additionalTags, _additionalTags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,highway,surface,width,category,description,source,verificationStatus,const DeepCollectionEquality().hash(_coordinates),geometryType,capacity,const DeepCollectionEquality().hash(_additionalTags));
}

@override
String toString() {
    return 'CampusPathway(id: $id, name: $name, highway: $highway, surface: $surface, width: $width, category: $category, description: $description, source: $source, verificationStatus: $verificationStatus, coordinates: $coordinates, geometryType: $geometryType, capacity: $capacity, additionalTags: $additionalTags)';
}


}

/// @nodoc
abstract mixin class _$CampusPathwayCopyWith<$Res> implements $CampusPathwayCopyWith<$Res> {
  factory _$CampusPathwayCopyWith(_CampusPathway value, $Res Function(_CampusPathway) _then) = __$CampusPathwayCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String highway, String surface, double width,@PathwayCategoryConverter() PathwayCategory category, String description, String source, String verificationStatus, List<LatLng> coordinates, String? geometryType, int? capacity, Map<String, dynamic>? additionalTags
});


@override $PathwayCategoryCopyWith<$Res> get category;

}
/// @nodoc
class __$CampusPathwayCopyWithImpl<$Res>
    implements _$CampusPathwayCopyWith<$Res> {
  __$CampusPathwayCopyWithImpl(this._self, this._then);

  final _CampusPathway _self;
  final $Res Function(_CampusPathway) _then;

/// Create a copy of CampusPathway
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? highway = null,Object? surface = null,Object? width = null,Object? category = null,Object? description = null,Object? source = null,Object? verificationStatus = null,Object? coordinates = null,Object? geometryType = freezed,Object? capacity = freezed,Object? additionalTags = freezed,}) {
  return _then(_CampusPathway(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,highway: null == highway ? _self.highway : highway // ignore: cast_nullable_to_non_nullable
as String,surface: null == surface ? _self.surface : surface // ignore: cast_nullable_to_non_nullable
as String,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as PathwayCategory,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,verificationStatus: null == verificationStatus ? _self.verificationStatus : verificationStatus // ignore: cast_nullable_to_non_nullable
as String,coordinates: null == coordinates ? _self._coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as List<LatLng>,geometryType: freezed == geometryType ? _self.geometryType : geometryType // ignore: cast_nullable_to_non_nullable
as String?,capacity: freezed == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int?,additionalTags: freezed == additionalTags ? _self._additionalTags : additionalTags // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

/// Create a copy of CampusPathway
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PathwayCategoryCopyWith<$Res> get category {
  
  return $PathwayCategoryCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

// dart format on
