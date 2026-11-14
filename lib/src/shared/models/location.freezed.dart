// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Location {

/// Unique location ID
 String get id;/// Location name
 String get name;/// Location code (e.g., BLDG-A, BLDG-B)
 String get code;/// Category
 LocationCategory get category;/// Description
 String? get description;/// Latitude
 double get latitude;/// Longitude
 double get longitude;/// Building floor (for multi-floor buildings)
 int? get floor;/// Room number (for specific rooms)
 String? get roomNumber;/// Whether this is an evacuation assembly point
 bool get isEvacuationPoint;/// Whether this is a shelter location
 bool get isShelter;/// Whether location has wheelchair access
 bool get hasWheelchairAccess;/// Whether location has emergency equipment
 bool get hasEmergencyEquipment;/// Emergency equipment details
 String? get emergencyEquipmentDetails;/// Contact phone for this location
 String? get contactPhone;/// Operating hours
 String? get operatingHours;/// Image URL
 String? get imageUrl;/// Tags for search/filtering
 List<String> get tags;/// Creation timestamp
 DateTime get createdAt;/// Last update timestamp
 DateTime get updatedAt;/// Additional metadata
 Map<String, dynamic> get metadata;
/// Create a copy of Location
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationCopyWith<Location> get copyWith => _$LocationCopyWithImpl<Location>(this as Location, _$identity);

  /// Serializes this Location to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Location;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Location&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.latitude, _this.latitude) || other.latitude == _this.latitude)&&(identical(other.longitude, _this.longitude) || other.longitude == _this.longitude)&&(identical(other.floor, _this.floor) || other.floor == _this.floor)&&(identical(other.roomNumber, _this.roomNumber) || other.roomNumber == _this.roomNumber)&&(identical(other.isEvacuationPoint, _this.isEvacuationPoint) || other.isEvacuationPoint == _this.isEvacuationPoint)&&(identical(other.isShelter, _this.isShelter) || other.isShelter == _this.isShelter)&&(identical(other.hasWheelchairAccess, _this.hasWheelchairAccess) || other.hasWheelchairAccess == _this.hasWheelchairAccess)&&(identical(other.hasEmergencyEquipment, _this.hasEmergencyEquipment) || other.hasEmergencyEquipment == _this.hasEmergencyEquipment)&&(identical(other.emergencyEquipmentDetails, _this.emergencyEquipmentDetails) || other.emergencyEquipmentDetails == _this.emergencyEquipmentDetails)&&(identical(other.contactPhone, _this.contactPhone) || other.contactPhone == _this.contactPhone)&&(identical(other.operatingHours, _this.operatingHours) || other.operatingHours == _this.operatingHours)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&const DeepCollectionEquality().equals(other.tags, _this.tags)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&const DeepCollectionEquality().equals(other.metadata, _this.metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Location;
  return Object.hashAll([runtimeType,_this.id,_this.name,_this.code,_this.category,_this.description,_this.latitude,_this.longitude,_this.floor,_this.roomNumber,_this.isEvacuationPoint,_this.isShelter,_this.hasWheelchairAccess,_this.hasEmergencyEquipment,_this.emergencyEquipmentDetails,_this.contactPhone,_this.operatingHours,_this.imageUrl,const DeepCollectionEquality().hash(_this.tags),_this.createdAt,_this.updatedAt,const DeepCollectionEquality().hash(_this.metadata)]);
}

@override
String toString() {
  final _this = this as Location;
  return 'Location(id: ${_this.id}, name: ${_this.name}, code: ${_this.code}, category: ${_this.category}, description: ${_this.description}, latitude: ${_this.latitude}, longitude: ${_this.longitude}, floor: ${_this.floor}, roomNumber: ${_this.roomNumber}, isEvacuationPoint: ${_this.isEvacuationPoint}, isShelter: ${_this.isShelter}, hasWheelchairAccess: ${_this.hasWheelchairAccess}, hasEmergencyEquipment: ${_this.hasEmergencyEquipment}, emergencyEquipmentDetails: ${_this.emergencyEquipmentDetails}, contactPhone: ${_this.contactPhone}, operatingHours: ${_this.operatingHours}, imageUrl: ${_this.imageUrl}, tags: ${_this.tags}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, metadata: ${_this.metadata})';
}


}

/// @nodoc
abstract mixin class $LocationCopyWith<$Res>  {
  factory $LocationCopyWith(Location value, $Res Function(Location) _then) = _$LocationCopyWithImpl;
@useResult
$Res call({
 String id, String name, String code, LocationCategory category, String? description, double latitude, double longitude, int? floor, String? roomNumber, bool isEvacuationPoint, bool isShelter, bool hasWheelchairAccess, bool hasEmergencyEquipment, String? emergencyEquipmentDetails, String? contactPhone, String? operatingHours, String? imageUrl, List<String> tags, DateTime createdAt, DateTime updatedAt, Map<String, dynamic> metadata
});




}
/// @nodoc
class _$LocationCopyWithImpl<$Res>
    implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._self, this._then);

  final Location _self;
  final $Res Function(Location) _then;

/// Create a copy of Location
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? code = null,Object? category = null,Object? description = freezed,Object? latitude = null,Object? longitude = null,Object? floor = freezed,Object? roomNumber = freezed,Object? isEvacuationPoint = null,Object? isShelter = null,Object? hasWheelchairAccess = null,Object? hasEmergencyEquipment = null,Object? emergencyEquipmentDetails = freezed,Object? contactPhone = freezed,Object? operatingHours = freezed,Object? imageUrl = freezed,Object? tags = null,Object? createdAt = null,Object? updatedAt = null,Object? metadata = null,}) {
  return _then(Location(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as LocationCategory,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int?,roomNumber: freezed == roomNumber ? _self.roomNumber : roomNumber // ignore: cast_nullable_to_non_nullable
as String?,isEvacuationPoint: null == isEvacuationPoint ? _self.isEvacuationPoint : isEvacuationPoint // ignore: cast_nullable_to_non_nullable
as bool,isShelter: null == isShelter ? _self.isShelter : isShelter // ignore: cast_nullable_to_non_nullable
as bool,hasWheelchairAccess: null == hasWheelchairAccess ? _self.hasWheelchairAccess : hasWheelchairAccess // ignore: cast_nullable_to_non_nullable
as bool,hasEmergencyEquipment: null == hasEmergencyEquipment ? _self.hasEmergencyEquipment : hasEmergencyEquipment // ignore: cast_nullable_to_non_nullable
as bool,emergencyEquipmentDetails: freezed == emergencyEquipmentDetails ? _self.emergencyEquipmentDetails : emergencyEquipmentDetails // ignore: cast_nullable_to_non_nullable
as String?,contactPhone: freezed == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String?,operatingHours: freezed == operatingHours ? _self.operatingHours : operatingHours // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [Location].
extension LocationPatterns on Location {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Location value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Location() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Location value)  $default,){
final _that = this;
switch (_that) {
case _Location():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Location value)?  $default,){
final _that = this;
switch (_that) {
case _Location() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String code,  LocationCategory category,  String? description,  double latitude,  double longitude,  int? floor,  String? roomNumber,  bool isEvacuationPoint,  bool isShelter,  bool hasWheelchairAccess,  bool hasEmergencyEquipment,  String? emergencyEquipmentDetails,  String? contactPhone,  String? operatingHours,  String? imageUrl,  List<String> tags,  DateTime createdAt,  DateTime updatedAt,  Map<String, dynamic> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Location() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.category,_that.description,_that.latitude,_that.longitude,_that.floor,_that.roomNumber,_that.isEvacuationPoint,_that.isShelter,_that.hasWheelchairAccess,_that.hasEmergencyEquipment,_that.emergencyEquipmentDetails,_that.contactPhone,_that.operatingHours,_that.imageUrl,_that.tags,_that.createdAt,_that.updatedAt,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String code,  LocationCategory category,  String? description,  double latitude,  double longitude,  int? floor,  String? roomNumber,  bool isEvacuationPoint,  bool isShelter,  bool hasWheelchairAccess,  bool hasEmergencyEquipment,  String? emergencyEquipmentDetails,  String? contactPhone,  String? operatingHours,  String? imageUrl,  List<String> tags,  DateTime createdAt,  DateTime updatedAt,  Map<String, dynamic> metadata)  $default,) {final _that = this;
switch (_that) {
case _Location():
return $default(_that.id,_that.name,_that.code,_that.category,_that.description,_that.latitude,_that.longitude,_that.floor,_that.roomNumber,_that.isEvacuationPoint,_that.isShelter,_that.hasWheelchairAccess,_that.hasEmergencyEquipment,_that.emergencyEquipmentDetails,_that.contactPhone,_that.operatingHours,_that.imageUrl,_that.tags,_that.createdAt,_that.updatedAt,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String code,  LocationCategory category,  String? description,  double latitude,  double longitude,  int? floor,  String? roomNumber,  bool isEvacuationPoint,  bool isShelter,  bool hasWheelchairAccess,  bool hasEmergencyEquipment,  String? emergencyEquipmentDetails,  String? contactPhone,  String? operatingHours,  String? imageUrl,  List<String> tags,  DateTime createdAt,  DateTime updatedAt,  Map<String, dynamic> metadata)?  $default,) {final _that = this;
switch (_that) {
case _Location() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.category,_that.description,_that.latitude,_that.longitude,_that.floor,_that.roomNumber,_that.isEvacuationPoint,_that.isShelter,_that.hasWheelchairAccess,_that.hasEmergencyEquipment,_that.emergencyEquipmentDetails,_that.contactPhone,_that.operatingHours,_that.imageUrl,_that.tags,_that.createdAt,_that.updatedAt,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Location implements Location {
  const _Location({required this.id, required this.name, required this.code, required this.category, this.description, required this.latitude, required this.longitude, this.floor, this.roomNumber, this.isEvacuationPoint = false, this.isShelter = false, this.hasWheelchairAccess = false, this.hasEmergencyEquipment = false, this.emergencyEquipmentDetails, this.contactPhone, this.operatingHours, this.imageUrl,  List<String> tags = const [], required this.createdAt, required this.updatedAt,  Map<String, dynamic> metadata = const {}}): _tags = tags,_metadata = metadata;
  factory _Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

/// Unique location ID
@override final  String id;
/// Location name
@override final  String name;
/// Location code (e.g., BLDG-A, BLDG-B)
@override final  String code;
/// Category
@override final  LocationCategory category;
/// Description
@override final  String? description;
/// Latitude
@override final  double latitude;
/// Longitude
@override final  double longitude;
/// Building floor (for multi-floor buildings)
@override final  int? floor;
/// Room number (for specific rooms)
@override final  String? roomNumber;
/// Whether this is an evacuation assembly point
@override@JsonKey() final  bool isEvacuationPoint;
/// Whether this is a shelter location
@override@JsonKey() final  bool isShelter;
/// Whether location has wheelchair access
@override@JsonKey() final  bool hasWheelchairAccess;
/// Whether location has emergency equipment
@override@JsonKey() final  bool hasEmergencyEquipment;
/// Emergency equipment details
@override final  String? emergencyEquipmentDetails;
/// Contact phone for this location
@override final  String? contactPhone;
/// Operating hours
@override final  String? operatingHours;
/// Image URL
@override final  String? imageUrl;
/// Tags for search/filtering
 final  List<String> _tags;
/// Tags for search/filtering
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

/// Creation timestamp
@override final  DateTime createdAt;
/// Last update timestamp
@override final  DateTime updatedAt;
/// Additional metadata
 final  Map<String, dynamic> _metadata;
/// Additional metadata
@override@JsonKey() Map<String, dynamic> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of Location
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationCopyWith<_Location> get copyWith => __$LocationCopyWithImpl<_Location>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Location&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.category, category) || other.category == category)&&(identical(other.description, description) || other.description == description)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.floor, floor) || other.floor == floor)&&(identical(other.roomNumber, roomNumber) || other.roomNumber == roomNumber)&&(identical(other.isEvacuationPoint, isEvacuationPoint) || other.isEvacuationPoint == isEvacuationPoint)&&(identical(other.isShelter, isShelter) || other.isShelter == isShelter)&&(identical(other.hasWheelchairAccess, hasWheelchairAccess) || other.hasWheelchairAccess == hasWheelchairAccess)&&(identical(other.hasEmergencyEquipment, hasEmergencyEquipment) || other.hasEmergencyEquipment == hasEmergencyEquipment)&&(identical(other.emergencyEquipmentDetails, emergencyEquipmentDetails) || other.emergencyEquipmentDetails == emergencyEquipmentDetails)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.operatingHours, operatingHours) || other.operatingHours == operatingHours)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other.tags, _tags)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,id,name,code,category,description,latitude,longitude,floor,roomNumber,isEvacuationPoint,isShelter,hasWheelchairAccess,hasEmergencyEquipment,emergencyEquipmentDetails,contactPhone,operatingHours,imageUrl,const DeepCollectionEquality().hash(_tags),createdAt,updatedAt,const DeepCollectionEquality().hash(_metadata)]);
}

@override
String toString() {
    return 'Location(id: $id, name: $name, code: $code, category: $category, description: $description, latitude: $latitude, longitude: $longitude, floor: $floor, roomNumber: $roomNumber, isEvacuationPoint: $isEvacuationPoint, isShelter: $isShelter, hasWheelchairAccess: $hasWheelchairAccess, hasEmergencyEquipment: $hasEmergencyEquipment, emergencyEquipmentDetails: $emergencyEquipmentDetails, contactPhone: $contactPhone, operatingHours: $operatingHours, imageUrl: $imageUrl, tags: $tags, createdAt: $createdAt, updatedAt: $updatedAt, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$LocationCopyWith<$Res> implements $LocationCopyWith<$Res> {
  factory _$LocationCopyWith(_Location value, $Res Function(_Location) _then) = __$LocationCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String code, LocationCategory category, String? description, double latitude, double longitude, int? floor, String? roomNumber, bool isEvacuationPoint, bool isShelter, bool hasWheelchairAccess, bool hasEmergencyEquipment, String? emergencyEquipmentDetails, String? contactPhone, String? operatingHours, String? imageUrl, List<String> tags, DateTime createdAt, DateTime updatedAt, Map<String, dynamic> metadata
});




}
/// @nodoc
class __$LocationCopyWithImpl<$Res>
    implements _$LocationCopyWith<$Res> {
  __$LocationCopyWithImpl(this._self, this._then);

  final _Location _self;
  final $Res Function(_Location) _then;

/// Create a copy of Location
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? code = null,Object? category = null,Object? description = freezed,Object? latitude = null,Object? longitude = null,Object? floor = freezed,Object? roomNumber = freezed,Object? isEvacuationPoint = null,Object? isShelter = null,Object? hasWheelchairAccess = null,Object? hasEmergencyEquipment = null,Object? emergencyEquipmentDetails = freezed,Object? contactPhone = freezed,Object? operatingHours = freezed,Object? imageUrl = freezed,Object? tags = null,Object? createdAt = null,Object? updatedAt = null,Object? metadata = null,}) {
  return _then(_Location(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as LocationCategory,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,floor: freezed == floor ? _self.floor : floor // ignore: cast_nullable_to_non_nullable
as int?,roomNumber: freezed == roomNumber ? _self.roomNumber : roomNumber // ignore: cast_nullable_to_non_nullable
as String?,isEvacuationPoint: null == isEvacuationPoint ? _self.isEvacuationPoint : isEvacuationPoint // ignore: cast_nullable_to_non_nullable
as bool,isShelter: null == isShelter ? _self.isShelter : isShelter // ignore: cast_nullable_to_non_nullable
as bool,hasWheelchairAccess: null == hasWheelchairAccess ? _self.hasWheelchairAccess : hasWheelchairAccess // ignore: cast_nullable_to_non_nullable
as bool,hasEmergencyEquipment: null == hasEmergencyEquipment ? _self.hasEmergencyEquipment : hasEmergencyEquipment // ignore: cast_nullable_to_non_nullable
as bool,emergencyEquipmentDetails: freezed == emergencyEquipmentDetails ? _self.emergencyEquipmentDetails : emergencyEquipmentDetails // ignore: cast_nullable_to_non_nullable
as String?,contactPhone: freezed == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String?,operatingHours: freezed == operatingHours ? _self.operatingHours : operatingHours // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
