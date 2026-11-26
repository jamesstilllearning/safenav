// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_activity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ActivityType {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityType);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ActivityType()';
}


}

/// @nodoc
class $ActivityTypeCopyWith<$Res>  {
$ActivityTypeCopyWith(ActivityType _, $Res Function(ActivityType) __);
}


/// Adds pattern-matching-related methods to [ActivityType].
extension ActivityTypePatterns on ActivityType {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Navigation value)?  navigation,TResult Function( _Search value)?  search,TResult Function( _ViewMap value)?  viewMap,TResult Function( _ViewAlert value)?  viewAlert,TResult Function( _EmergencyAction value)?  emergencyAction,TResult Function( _ProfileUpdate value)?  profileUpdate,TResult Function( _SettingsChange value)?  settingsChange,TResult Function( _Login value)?  login,TResult Function( _Logout value)?  logout,TResult Function( _Other value)?  other,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Navigation() when navigation != null:
return navigation(_that);case _Search() when search != null:
return search(_that);case _ViewMap() when viewMap != null:
return viewMap(_that);case _ViewAlert() when viewAlert != null:
return viewAlert(_that);case _EmergencyAction() when emergencyAction != null:
return emergencyAction(_that);case _ProfileUpdate() when profileUpdate != null:
return profileUpdate(_that);case _SettingsChange() when settingsChange != null:
return settingsChange(_that);case _Login() when login != null:
return login(_that);case _Logout() when logout != null:
return logout(_that);case _Other() when other != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Navigation value)  navigation,required TResult Function( _Search value)  search,required TResult Function( _ViewMap value)  viewMap,required TResult Function( _ViewAlert value)  viewAlert,required TResult Function( _EmergencyAction value)  emergencyAction,required TResult Function( _ProfileUpdate value)  profileUpdate,required TResult Function( _SettingsChange value)  settingsChange,required TResult Function( _Login value)  login,required TResult Function( _Logout value)  logout,required TResult Function( _Other value)  other,}){
final _that = this;
switch (_that) {
case _Navigation():
return navigation(_that);case _Search():
return search(_that);case _ViewMap():
return viewMap(_that);case _ViewAlert():
return viewAlert(_that);case _EmergencyAction():
return emergencyAction(_that);case _ProfileUpdate():
return profileUpdate(_that);case _SettingsChange():
return settingsChange(_that);case _Login():
return login(_that);case _Logout():
return logout(_that);case _Other():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Navigation value)?  navigation,TResult? Function( _Search value)?  search,TResult? Function( _ViewMap value)?  viewMap,TResult? Function( _ViewAlert value)?  viewAlert,TResult? Function( _EmergencyAction value)?  emergencyAction,TResult? Function( _ProfileUpdate value)?  profileUpdate,TResult? Function( _SettingsChange value)?  settingsChange,TResult? Function( _Login value)?  login,TResult? Function( _Logout value)?  logout,TResult? Function( _Other value)?  other,}){
final _that = this;
switch (_that) {
case _Navigation() when navigation != null:
return navigation(_that);case _Search() when search != null:
return search(_that);case _ViewMap() when viewMap != null:
return viewMap(_that);case _ViewAlert() when viewAlert != null:
return viewAlert(_that);case _EmergencyAction() when emergencyAction != null:
return emergencyAction(_that);case _ProfileUpdate() when profileUpdate != null:
return profileUpdate(_that);case _SettingsChange() when settingsChange != null:
return settingsChange(_that);case _Login() when login != null:
return login(_that);case _Logout() when logout != null:
return logout(_that);case _Other() when other != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  navigation,TResult Function()?  search,TResult Function()?  viewMap,TResult Function()?  viewAlert,TResult Function()?  emergencyAction,TResult Function()?  profileUpdate,TResult Function()?  settingsChange,TResult Function()?  login,TResult Function()?  logout,TResult Function()?  other,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Navigation() when navigation != null:
return navigation();case _Search() when search != null:
return search();case _ViewMap() when viewMap != null:
return viewMap();case _ViewAlert() when viewAlert != null:
return viewAlert();case _EmergencyAction() when emergencyAction != null:
return emergencyAction();case _ProfileUpdate() when profileUpdate != null:
return profileUpdate();case _SettingsChange() when settingsChange != null:
return settingsChange();case _Login() when login != null:
return login();case _Logout() when logout != null:
return logout();case _Other() when other != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  navigation,required TResult Function()  search,required TResult Function()  viewMap,required TResult Function()  viewAlert,required TResult Function()  emergencyAction,required TResult Function()  profileUpdate,required TResult Function()  settingsChange,required TResult Function()  login,required TResult Function()  logout,required TResult Function()  other,}) {final _that = this;
switch (_that) {
case _Navigation():
return navigation();case _Search():
return search();case _ViewMap():
return viewMap();case _ViewAlert():
return viewAlert();case _EmergencyAction():
return emergencyAction();case _ProfileUpdate():
return profileUpdate();case _SettingsChange():
return settingsChange();case _Login():
return login();case _Logout():
return logout();case _Other():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  navigation,TResult? Function()?  search,TResult? Function()?  viewMap,TResult? Function()?  viewAlert,TResult? Function()?  emergencyAction,TResult? Function()?  profileUpdate,TResult? Function()?  settingsChange,TResult? Function()?  login,TResult? Function()?  logout,TResult? Function()?  other,}) {final _that = this;
switch (_that) {
case _Navigation() when navigation != null:
return navigation();case _Search() when search != null:
return search();case _ViewMap() when viewMap != null:
return viewMap();case _ViewAlert() when viewAlert != null:
return viewAlert();case _EmergencyAction() when emergencyAction != null:
return emergencyAction();case _ProfileUpdate() when profileUpdate != null:
return profileUpdate();case _SettingsChange() when settingsChange != null:
return settingsChange();case _Login() when login != null:
return login();case _Logout() when logout != null:
return logout();case _Other() when other != null:
return other();case _:
  return null;

}
}

}

/// @nodoc


class _Navigation implements ActivityType {
  const _Navigation();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Navigation);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ActivityType.navigation()';
}


}




/// @nodoc


class _Search implements ActivityType {
  const _Search();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Search);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ActivityType.search()';
}


}




/// @nodoc


class _ViewMap implements ActivityType {
  const _ViewMap();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ViewMap);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ActivityType.viewMap()';
}


}




/// @nodoc


class _ViewAlert implements ActivityType {
  const _ViewAlert();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ViewAlert);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ActivityType.viewAlert()';
}


}




/// @nodoc


class _EmergencyAction implements ActivityType {
  const _EmergencyAction();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmergencyAction);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ActivityType.emergencyAction()';
}


}




/// @nodoc


class _ProfileUpdate implements ActivityType {
  const _ProfileUpdate();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileUpdate);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ActivityType.profileUpdate()';
}


}




/// @nodoc


class _SettingsChange implements ActivityType {
  const _SettingsChange();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingsChange);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ActivityType.settingsChange()';
}


}




/// @nodoc


class _Login implements ActivityType {
  const _Login();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Login);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ActivityType.login()';
}


}




/// @nodoc


class _Logout implements ActivityType {
  const _Logout();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Logout);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ActivityType.logout()';
}


}




/// @nodoc


class _Other implements ActivityType {
  const _Other();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Other);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'ActivityType.other()';
}


}





/// @nodoc
mixin _$UserActivity {

 String get id; String get userId;@ActivityTypeConverter() ActivityType get type; String get description; String? get buildingId; String? get floorId; String? get roomId; LatLng? get location; Map<String, dynamic>? get metadata; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of UserActivity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserActivityCopyWith<UserActivity> get copyWith => _$UserActivityCopyWithImpl<UserActivity>(this as UserActivity, _$identity);

  /// Serializes this UserActivity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UserActivity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserActivity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.buildingId, _this.buildingId) || other.buildingId == _this.buildingId)&&(identical(other.floorId, _this.floorId) || other.floorId == _this.floorId)&&(identical(other.roomId, _this.roomId) || other.roomId == _this.roomId)&&(identical(other.location, _this.location) || other.location == _this.location)&&const DeepCollectionEquality().equals(other.metadata, _this.metadata)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UserActivity;
  return Object.hash(runtimeType,_this.id,_this.userId,_this.type,_this.description,_this.buildingId,_this.floorId,_this.roomId,_this.location,const DeepCollectionEquality().hash(_this.metadata),_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as UserActivity;
  return 'UserActivity(id: ${_this.id}, userId: ${_this.userId}, type: ${_this.type}, description: ${_this.description}, buildingId: ${_this.buildingId}, floorId: ${_this.floorId}, roomId: ${_this.roomId}, location: ${_this.location}, metadata: ${_this.metadata}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $UserActivityCopyWith<$Res>  {
  factory $UserActivityCopyWith(UserActivity value, $Res Function(UserActivity) _then) = _$UserActivityCopyWithImpl;
@useResult
$Res call({
 String id, String userId,@ActivityTypeConverter() ActivityType type, String description, String? buildingId, String? floorId, String? roomId, LatLng? location, Map<String, dynamic>? metadata, DateTime createdAt, DateTime updatedAt
});


$ActivityTypeCopyWith<$Res> get type;

}
/// @nodoc
class _$UserActivityCopyWithImpl<$Res>
    implements $UserActivityCopyWith<$Res> {
  _$UserActivityCopyWithImpl(this._self, this._then);

  final UserActivity _self;
  final $Res Function(UserActivity) _then;

/// Create a copy of UserActivity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? type = null,Object? description = null,Object? buildingId = freezed,Object? floorId = freezed,Object? roomId = freezed,Object? location = freezed,Object? metadata = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(UserActivity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ActivityType,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,buildingId: freezed == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as String?,floorId: freezed == floorId ? _self.floorId : floorId // ignore: cast_nullable_to_non_nullable
as String?,roomId: freezed == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LatLng?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of UserActivity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActivityTypeCopyWith<$Res> get type {
  
  return $ActivityTypeCopyWith<$Res>(_self.type, (value) {
    return _then(_self.copyWith(type: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserActivity].
extension UserActivityPatterns on UserActivity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserActivity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserActivity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserActivity value)  $default,){
final _that = this;
switch (_that) {
case _UserActivity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserActivity value)?  $default,){
final _that = this;
switch (_that) {
case _UserActivity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId, @ActivityTypeConverter()  ActivityType type,  String description,  String? buildingId,  String? floorId,  String? roomId,  LatLng? location,  Map<String, dynamic>? metadata,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserActivity() when $default != null:
return $default(_that.id,_that.userId,_that.type,_that.description,_that.buildingId,_that.floorId,_that.roomId,_that.location,_that.metadata,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId, @ActivityTypeConverter()  ActivityType type,  String description,  String? buildingId,  String? floorId,  String? roomId,  LatLng? location,  Map<String, dynamic>? metadata,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _UserActivity():
return $default(_that.id,_that.userId,_that.type,_that.description,_that.buildingId,_that.floorId,_that.roomId,_that.location,_that.metadata,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId, @ActivityTypeConverter()  ActivityType type,  String description,  String? buildingId,  String? floorId,  String? roomId,  LatLng? location,  Map<String, dynamic>? metadata,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _UserActivity() when $default != null:
return $default(_that.id,_that.userId,_that.type,_that.description,_that.buildingId,_that.floorId,_that.roomId,_that.location,_that.metadata,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserActivity implements UserActivity {
  const _UserActivity({required this.id, required this.userId, @ActivityTypeConverter() required this.type, required this.description, this.buildingId, this.floorId, this.roomId, this.location,  Map<String, dynamic>? metadata, required this.createdAt, required this.updatedAt}): _metadata = metadata;
  factory _UserActivity.fromJson(Map<String, dynamic> json) => _$UserActivityFromJson(json);

@override final  String id;
@override final  String userId;
@override@ActivityTypeConverter() final  ActivityType type;
@override final  String description;
@override final  String? buildingId;
@override final  String? floorId;
@override final  String? roomId;
@override final  LatLng? location;
 final  Map<String, dynamic>? _metadata;
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of UserActivity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserActivityCopyWith<_UserActivity> get copyWith => __$UserActivityCopyWithImpl<_UserActivity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserActivityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserActivity&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description)&&(identical(other.buildingId, buildingId) || other.buildingId == buildingId)&&(identical(other.floorId, floorId) || other.floorId == floorId)&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other.metadata, _metadata)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,userId,type,description,buildingId,floorId,roomId,location,const DeepCollectionEquality().hash(_metadata),createdAt,updatedAt);
}

@override
String toString() {
    return 'UserActivity(id: $id, userId: $userId, type: $type, description: $description, buildingId: $buildingId, floorId: $floorId, roomId: $roomId, location: $location, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$UserActivityCopyWith<$Res> implements $UserActivityCopyWith<$Res> {
  factory _$UserActivityCopyWith(_UserActivity value, $Res Function(_UserActivity) _then) = __$UserActivityCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId,@ActivityTypeConverter() ActivityType type, String description, String? buildingId, String? floorId, String? roomId, LatLng? location, Map<String, dynamic>? metadata, DateTime createdAt, DateTime updatedAt
});


@override $ActivityTypeCopyWith<$Res> get type;

}
/// @nodoc
class __$UserActivityCopyWithImpl<$Res>
    implements _$UserActivityCopyWith<$Res> {
  __$UserActivityCopyWithImpl(this._self, this._then);

  final _UserActivity _self;
  final $Res Function(_UserActivity) _then;

/// Create a copy of UserActivity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? type = null,Object? description = null,Object? buildingId = freezed,Object? floorId = freezed,Object? roomId = freezed,Object? location = freezed,Object? metadata = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_UserActivity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ActivityType,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,buildingId: freezed == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as String?,floorId: freezed == floorId ? _self.floorId : floorId // ignore: cast_nullable_to_non_nullable
as String?,roomId: freezed == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LatLng?,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of UserActivity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActivityTypeCopyWith<$Res> get type {
  
  return $ActivityTypeCopyWith<$Res>(_self.type, (value) {
    return _then(_self.copyWith(type: value));
  });
}
}


/// @nodoc
mixin _$UserVisit {

 String get id; String get userId; String get buildingId; String? get floorId; String? get roomId; String? get roomName; DateTime get visitedAt; Duration get duration; int? get visitCount; LatLng? get entryLocation; LatLng? get exitLocation; Map<String, dynamic>? get metadata; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of UserVisit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserVisitCopyWith<UserVisit> get copyWith => _$UserVisitCopyWithImpl<UserVisit>(this as UserVisit, _$identity);

  /// Serializes this UserVisit to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UserVisit;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserVisit&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.buildingId, _this.buildingId) || other.buildingId == _this.buildingId)&&(identical(other.floorId, _this.floorId) || other.floorId == _this.floorId)&&(identical(other.roomId, _this.roomId) || other.roomId == _this.roomId)&&(identical(other.roomName, _this.roomName) || other.roomName == _this.roomName)&&(identical(other.visitedAt, _this.visitedAt) || other.visitedAt == _this.visitedAt)&&(identical(other.duration, _this.duration) || other.duration == _this.duration)&&(identical(other.visitCount, _this.visitCount) || other.visitCount == _this.visitCount)&&(identical(other.entryLocation, _this.entryLocation) || other.entryLocation == _this.entryLocation)&&(identical(other.exitLocation, _this.exitLocation) || other.exitLocation == _this.exitLocation)&&const DeepCollectionEquality().equals(other.metadata, _this.metadata)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UserVisit;
  return Object.hash(runtimeType,_this.id,_this.userId,_this.buildingId,_this.floorId,_this.roomId,_this.roomName,_this.visitedAt,_this.duration,_this.visitCount,_this.entryLocation,_this.exitLocation,const DeepCollectionEquality().hash(_this.metadata),_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as UserVisit;
  return 'UserVisit(id: ${_this.id}, userId: ${_this.userId}, buildingId: ${_this.buildingId}, floorId: ${_this.floorId}, roomId: ${_this.roomId}, roomName: ${_this.roomName}, visitedAt: ${_this.visitedAt}, duration: ${_this.duration}, visitCount: ${_this.visitCount}, entryLocation: ${_this.entryLocation}, exitLocation: ${_this.exitLocation}, metadata: ${_this.metadata}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $UserVisitCopyWith<$Res>  {
  factory $UserVisitCopyWith(UserVisit value, $Res Function(UserVisit) _then) = _$UserVisitCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String buildingId, String? floorId, String? roomId, String? roomName, DateTime visitedAt, Duration duration, int? visitCount, LatLng? entryLocation, LatLng? exitLocation, Map<String, dynamic>? metadata, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$UserVisitCopyWithImpl<$Res>
    implements $UserVisitCopyWith<$Res> {
  _$UserVisitCopyWithImpl(this._self, this._then);

  final UserVisit _self;
  final $Res Function(UserVisit) _then;

/// Create a copy of UserVisit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? buildingId = null,Object? floorId = freezed,Object? roomId = freezed,Object? roomName = freezed,Object? visitedAt = null,Object? duration = null,Object? visitCount = freezed,Object? entryLocation = freezed,Object? exitLocation = freezed,Object? metadata = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(UserVisit(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,buildingId: null == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as String,floorId: freezed == floorId ? _self.floorId : floorId // ignore: cast_nullable_to_non_nullable
as String?,roomId: freezed == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String?,roomName: freezed == roomName ? _self.roomName : roomName // ignore: cast_nullable_to_non_nullable
as String?,visitedAt: null == visitedAt ? _self.visitedAt : visitedAt // ignore: cast_nullable_to_non_nullable
as DateTime,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,visitCount: freezed == visitCount ? _self.visitCount : visitCount // ignore: cast_nullable_to_non_nullable
as int?,entryLocation: freezed == entryLocation ? _self.entryLocation : entryLocation // ignore: cast_nullable_to_non_nullable
as LatLng?,exitLocation: freezed == exitLocation ? _self.exitLocation : exitLocation // ignore: cast_nullable_to_non_nullable
as LatLng?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [UserVisit].
extension UserVisitPatterns on UserVisit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserVisit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserVisit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserVisit value)  $default,){
final _that = this;
switch (_that) {
case _UserVisit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserVisit value)?  $default,){
final _that = this;
switch (_that) {
case _UserVisit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String buildingId,  String? floorId,  String? roomId,  String? roomName,  DateTime visitedAt,  Duration duration,  int? visitCount,  LatLng? entryLocation,  LatLng? exitLocation,  Map<String, dynamic>? metadata,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserVisit() when $default != null:
return $default(_that.id,_that.userId,_that.buildingId,_that.floorId,_that.roomId,_that.roomName,_that.visitedAt,_that.duration,_that.visitCount,_that.entryLocation,_that.exitLocation,_that.metadata,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String buildingId,  String? floorId,  String? roomId,  String? roomName,  DateTime visitedAt,  Duration duration,  int? visitCount,  LatLng? entryLocation,  LatLng? exitLocation,  Map<String, dynamic>? metadata,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _UserVisit():
return $default(_that.id,_that.userId,_that.buildingId,_that.floorId,_that.roomId,_that.roomName,_that.visitedAt,_that.duration,_that.visitCount,_that.entryLocation,_that.exitLocation,_that.metadata,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String buildingId,  String? floorId,  String? roomId,  String? roomName,  DateTime visitedAt,  Duration duration,  int? visitCount,  LatLng? entryLocation,  LatLng? exitLocation,  Map<String, dynamic>? metadata,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _UserVisit() when $default != null:
return $default(_that.id,_that.userId,_that.buildingId,_that.floorId,_that.roomId,_that.roomName,_that.visitedAt,_that.duration,_that.visitCount,_that.entryLocation,_that.exitLocation,_that.metadata,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserVisit implements UserVisit {
  const _UserVisit({required this.id, required this.userId, required this.buildingId, this.floorId, this.roomId, this.roomName, required this.visitedAt, required this.duration, this.visitCount, this.entryLocation, this.exitLocation,  Map<String, dynamic>? metadata, required this.createdAt, required this.updatedAt}): _metadata = metadata;
  factory _UserVisit.fromJson(Map<String, dynamic> json) => _$UserVisitFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String buildingId;
@override final  String? floorId;
@override final  String? roomId;
@override final  String? roomName;
@override final  DateTime visitedAt;
@override final  Duration duration;
@override final  int? visitCount;
@override final  LatLng? entryLocation;
@override final  LatLng? exitLocation;
 final  Map<String, dynamic>? _metadata;
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of UserVisit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserVisitCopyWith<_UserVisit> get copyWith => __$UserVisitCopyWithImpl<_UserVisit>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserVisitToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserVisit&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.buildingId, buildingId) || other.buildingId == buildingId)&&(identical(other.floorId, floorId) || other.floorId == floorId)&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.roomName, roomName) || other.roomName == roomName)&&(identical(other.visitedAt, visitedAt) || other.visitedAt == visitedAt)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.visitCount, visitCount) || other.visitCount == visitCount)&&(identical(other.entryLocation, entryLocation) || other.entryLocation == entryLocation)&&(identical(other.exitLocation, exitLocation) || other.exitLocation == exitLocation)&&const DeepCollectionEquality().equals(other.metadata, _metadata)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,userId,buildingId,floorId,roomId,roomName,visitedAt,duration,visitCount,entryLocation,exitLocation,const DeepCollectionEquality().hash(_metadata),createdAt,updatedAt);
}

@override
String toString() {
    return 'UserVisit(id: $id, userId: $userId, buildingId: $buildingId, floorId: $floorId, roomId: $roomId, roomName: $roomName, visitedAt: $visitedAt, duration: $duration, visitCount: $visitCount, entryLocation: $entryLocation, exitLocation: $exitLocation, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$UserVisitCopyWith<$Res> implements $UserVisitCopyWith<$Res> {
  factory _$UserVisitCopyWith(_UserVisit value, $Res Function(_UserVisit) _then) = __$UserVisitCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String buildingId, String? floorId, String? roomId, String? roomName, DateTime visitedAt, Duration duration, int? visitCount, LatLng? entryLocation, LatLng? exitLocation, Map<String, dynamic>? metadata, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$UserVisitCopyWithImpl<$Res>
    implements _$UserVisitCopyWith<$Res> {
  __$UserVisitCopyWithImpl(this._self, this._then);

  final _UserVisit _self;
  final $Res Function(_UserVisit) _then;

/// Create a copy of UserVisit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? buildingId = null,Object? floorId = freezed,Object? roomId = freezed,Object? roomName = freezed,Object? visitedAt = null,Object? duration = null,Object? visitCount = freezed,Object? entryLocation = freezed,Object? exitLocation = freezed,Object? metadata = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_UserVisit(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,buildingId: null == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as String,floorId: freezed == floorId ? _self.floorId : floorId // ignore: cast_nullable_to_non_nullable
as String?,roomId: freezed == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String?,roomName: freezed == roomName ? _self.roomName : roomName // ignore: cast_nullable_to_non_nullable
as String?,visitedAt: null == visitedAt ? _self.visitedAt : visitedAt // ignore: cast_nullable_to_non_nullable
as DateTime,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,visitCount: freezed == visitCount ? _self.visitCount : visitCount // ignore: cast_nullable_to_non_nullable
as int?,entryLocation: freezed == entryLocation ? _self.entryLocation : entryLocation // ignore: cast_nullable_to_non_nullable
as LatLng?,exitLocation: freezed == exitLocation ? _self.exitLocation : exitLocation // ignore: cast_nullable_to_non_nullable
as LatLng?,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$RouteType {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteType);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RouteType()';
}


}

/// @nodoc
class $RouteTypeCopyWith<$Res>  {
$RouteTypeCopyWith(RouteType _, $Res Function(RouteType) __);
}


/// Adds pattern-matching-related methods to [RouteType].
extension RouteTypePatterns on RouteType {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Walking value)?  walking,TResult Function( _Evacuation value)?  evacuation,TResult Function( _Emergency value)?  emergency,TResult Function( _Practice value)?  practice,TResult Function( _Custom value)?  custom,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Walking() when walking != null:
return walking(_that);case _Evacuation() when evacuation != null:
return evacuation(_that);case _Emergency() when emergency != null:
return emergency(_that);case _Practice() when practice != null:
return practice(_that);case _Custom() when custom != null:
return custom(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Walking value)  walking,required TResult Function( _Evacuation value)  evacuation,required TResult Function( _Emergency value)  emergency,required TResult Function( _Practice value)  practice,required TResult Function( _Custom value)  custom,}){
final _that = this;
switch (_that) {
case _Walking():
return walking(_that);case _Evacuation():
return evacuation(_that);case _Emergency():
return emergency(_that);case _Practice():
return practice(_that);case _Custom():
return custom(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Walking value)?  walking,TResult? Function( _Evacuation value)?  evacuation,TResult? Function( _Emergency value)?  emergency,TResult? Function( _Practice value)?  practice,TResult? Function( _Custom value)?  custom,}){
final _that = this;
switch (_that) {
case _Walking() when walking != null:
return walking(_that);case _Evacuation() when evacuation != null:
return evacuation(_that);case _Emergency() when emergency != null:
return emergency(_that);case _Practice() when practice != null:
return practice(_that);case _Custom() when custom != null:
return custom(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  walking,TResult Function()?  evacuation,TResult Function()?  emergency,TResult Function()?  practice,TResult Function()?  custom,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Walking() when walking != null:
return walking();case _Evacuation() when evacuation != null:
return evacuation();case _Emergency() when emergency != null:
return emergency();case _Practice() when practice != null:
return practice();case _Custom() when custom != null:
return custom();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  walking,required TResult Function()  evacuation,required TResult Function()  emergency,required TResult Function()  practice,required TResult Function()  custom,}) {final _that = this;
switch (_that) {
case _Walking():
return walking();case _Evacuation():
return evacuation();case _Emergency():
return emergency();case _Practice():
return practice();case _Custom():
return custom();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  walking,TResult? Function()?  evacuation,TResult? Function()?  emergency,TResult? Function()?  practice,TResult? Function()?  custom,}) {final _that = this;
switch (_that) {
case _Walking() when walking != null:
return walking();case _Evacuation() when evacuation != null:
return evacuation();case _Emergency() when emergency != null:
return emergency();case _Practice() when practice != null:
return practice();case _Custom() when custom != null:
return custom();case _:
  return null;

}
}

}

/// @nodoc


class _Walking implements RouteType {
  const _Walking();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Walking);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RouteType.walking()';
}


}




/// @nodoc


class _Evacuation implements RouteType {
  const _Evacuation();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Evacuation);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RouteType.evacuation()';
}


}




/// @nodoc


class _Emergency implements RouteType {
  const _Emergency();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Emergency);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RouteType.emergency()';
}


}




/// @nodoc


class _Practice implements RouteType {
  const _Practice();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Practice);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RouteType.practice()';
}


}




/// @nodoc


class _Custom implements RouteType {
  const _Custom();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Custom);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RouteType.custom()';
}


}





/// @nodoc
mixin _$UserRoute {

 String get id; String get userId;@RouteTypeConverter() RouteType get type; String get startBuildingId; String? get startFloorId; String? get startRoomId; String get endBuildingId; String? get endFloorId; String? get endRoomId; List<LatLng> get geometry; double get totalDistance; Duration get estimatedDuration; Duration get actualDuration; DateTime get startedAt; DateTime? get completedAt;@RouteStatusConverter() RouteStatus get status; Map<String, dynamic>? get metadata; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of UserRoute
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserRouteCopyWith<UserRoute> get copyWith => _$UserRouteCopyWithImpl<UserRoute>(this as UserRoute, _$identity);

  /// Serializes this UserRoute to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UserRoute;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserRoute&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.startBuildingId, _this.startBuildingId) || other.startBuildingId == _this.startBuildingId)&&(identical(other.startFloorId, _this.startFloorId) || other.startFloorId == _this.startFloorId)&&(identical(other.startRoomId, _this.startRoomId) || other.startRoomId == _this.startRoomId)&&(identical(other.endBuildingId, _this.endBuildingId) || other.endBuildingId == _this.endBuildingId)&&(identical(other.endFloorId, _this.endFloorId) || other.endFloorId == _this.endFloorId)&&(identical(other.endRoomId, _this.endRoomId) || other.endRoomId == _this.endRoomId)&&const DeepCollectionEquality().equals(other.geometry, _this.geometry)&&(identical(other.totalDistance, _this.totalDistance) || other.totalDistance == _this.totalDistance)&&(identical(other.estimatedDuration, _this.estimatedDuration) || other.estimatedDuration == _this.estimatedDuration)&&(identical(other.actualDuration, _this.actualDuration) || other.actualDuration == _this.actualDuration)&&(identical(other.startedAt, _this.startedAt) || other.startedAt == _this.startedAt)&&(identical(other.completedAt, _this.completedAt) || other.completedAt == _this.completedAt)&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.metadata, _this.metadata)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UserRoute;
  return Object.hashAll([runtimeType,_this.id,_this.userId,_this.type,_this.startBuildingId,_this.startFloorId,_this.startRoomId,_this.endBuildingId,_this.endFloorId,_this.endRoomId,const DeepCollectionEquality().hash(_this.geometry),_this.totalDistance,_this.estimatedDuration,_this.actualDuration,_this.startedAt,_this.completedAt,_this.status,const DeepCollectionEquality().hash(_this.metadata),_this.createdAt,_this.updatedAt]);
}

@override
String toString() {
  final _this = this as UserRoute;
  return 'UserRoute(id: ${_this.id}, userId: ${_this.userId}, type: ${_this.type}, startBuildingId: ${_this.startBuildingId}, startFloorId: ${_this.startFloorId}, startRoomId: ${_this.startRoomId}, endBuildingId: ${_this.endBuildingId}, endFloorId: ${_this.endFloorId}, endRoomId: ${_this.endRoomId}, geometry: ${_this.geometry}, totalDistance: ${_this.totalDistance}, estimatedDuration: ${_this.estimatedDuration}, actualDuration: ${_this.actualDuration}, startedAt: ${_this.startedAt}, completedAt: ${_this.completedAt}, status: ${_this.status}, metadata: ${_this.metadata}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $UserRouteCopyWith<$Res>  {
  factory $UserRouteCopyWith(UserRoute value, $Res Function(UserRoute) _then) = _$UserRouteCopyWithImpl;
@useResult
$Res call({
 String id, String userId,@RouteTypeConverter() RouteType type, String startBuildingId, String? startFloorId, String? startRoomId, String endBuildingId, String? endFloorId, String? endRoomId, List<LatLng> geometry, double totalDistance, Duration estimatedDuration, Duration actualDuration, DateTime startedAt, DateTime? completedAt,@RouteStatusConverter() RouteStatus status, Map<String, dynamic>? metadata, DateTime createdAt, DateTime updatedAt
});


$RouteTypeCopyWith<$Res> get type;$RouteStatusCopyWith<$Res> get status;

}
/// @nodoc
class _$UserRouteCopyWithImpl<$Res>
    implements $UserRouteCopyWith<$Res> {
  _$UserRouteCopyWithImpl(this._self, this._then);

  final UserRoute _self;
  final $Res Function(UserRoute) _then;

/// Create a copy of UserRoute
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? type = null,Object? startBuildingId = null,Object? startFloorId = freezed,Object? startRoomId = freezed,Object? endBuildingId = null,Object? endFloorId = freezed,Object? endRoomId = freezed,Object? geometry = null,Object? totalDistance = null,Object? estimatedDuration = null,Object? actualDuration = null,Object? startedAt = null,Object? completedAt = freezed,Object? status = null,Object? metadata = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(UserRoute(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as RouteType,startBuildingId: null == startBuildingId ? _self.startBuildingId : startBuildingId // ignore: cast_nullable_to_non_nullable
as String,startFloorId: freezed == startFloorId ? _self.startFloorId : startFloorId // ignore: cast_nullable_to_non_nullable
as String?,startRoomId: freezed == startRoomId ? _self.startRoomId : startRoomId // ignore: cast_nullable_to_non_nullable
as String?,endBuildingId: null == endBuildingId ? _self.endBuildingId : endBuildingId // ignore: cast_nullable_to_non_nullable
as String,endFloorId: freezed == endFloorId ? _self.endFloorId : endFloorId // ignore: cast_nullable_to_non_nullable
as String?,endRoomId: freezed == endRoomId ? _self.endRoomId : endRoomId // ignore: cast_nullable_to_non_nullable
as String?,geometry: null == geometry ? _self.geometry : geometry // ignore: cast_nullable_to_non_nullable
as List<LatLng>,totalDistance: null == totalDistance ? _self.totalDistance : totalDistance // ignore: cast_nullable_to_non_nullable
as double,estimatedDuration: null == estimatedDuration ? _self.estimatedDuration : estimatedDuration // ignore: cast_nullable_to_non_nullable
as Duration,actualDuration: null == actualDuration ? _self.actualDuration : actualDuration // ignore: cast_nullable_to_non_nullable
as Duration,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RouteStatus,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of UserRoute
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteTypeCopyWith<$Res> get type {
  
  return $RouteTypeCopyWith<$Res>(_self.type, (value) {
    return _then(_self.copyWith(type: value));
  });
}/// Create a copy of UserRoute
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteStatusCopyWith<$Res> get status {
  
  return $RouteStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserRoute].
extension UserRoutePatterns on UserRoute {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserRoute value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserRoute() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserRoute value)  $default,){
final _that = this;
switch (_that) {
case _UserRoute():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserRoute value)?  $default,){
final _that = this;
switch (_that) {
case _UserRoute() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId, @RouteTypeConverter()  RouteType type,  String startBuildingId,  String? startFloorId,  String? startRoomId,  String endBuildingId,  String? endFloorId,  String? endRoomId,  List<LatLng> geometry,  double totalDistance,  Duration estimatedDuration,  Duration actualDuration,  DateTime startedAt,  DateTime? completedAt, @RouteStatusConverter()  RouteStatus status,  Map<String, dynamic>? metadata,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserRoute() when $default != null:
return $default(_that.id,_that.userId,_that.type,_that.startBuildingId,_that.startFloorId,_that.startRoomId,_that.endBuildingId,_that.endFloorId,_that.endRoomId,_that.geometry,_that.totalDistance,_that.estimatedDuration,_that.actualDuration,_that.startedAt,_that.completedAt,_that.status,_that.metadata,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId, @RouteTypeConverter()  RouteType type,  String startBuildingId,  String? startFloorId,  String? startRoomId,  String endBuildingId,  String? endFloorId,  String? endRoomId,  List<LatLng> geometry,  double totalDistance,  Duration estimatedDuration,  Duration actualDuration,  DateTime startedAt,  DateTime? completedAt, @RouteStatusConverter()  RouteStatus status,  Map<String, dynamic>? metadata,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _UserRoute():
return $default(_that.id,_that.userId,_that.type,_that.startBuildingId,_that.startFloorId,_that.startRoomId,_that.endBuildingId,_that.endFloorId,_that.endRoomId,_that.geometry,_that.totalDistance,_that.estimatedDuration,_that.actualDuration,_that.startedAt,_that.completedAt,_that.status,_that.metadata,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId, @RouteTypeConverter()  RouteType type,  String startBuildingId,  String? startFloorId,  String? startRoomId,  String endBuildingId,  String? endFloorId,  String? endRoomId,  List<LatLng> geometry,  double totalDistance,  Duration estimatedDuration,  Duration actualDuration,  DateTime startedAt,  DateTime? completedAt, @RouteStatusConverter()  RouteStatus status,  Map<String, dynamic>? metadata,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _UserRoute() when $default != null:
return $default(_that.id,_that.userId,_that.type,_that.startBuildingId,_that.startFloorId,_that.startRoomId,_that.endBuildingId,_that.endFloorId,_that.endRoomId,_that.geometry,_that.totalDistance,_that.estimatedDuration,_that.actualDuration,_that.startedAt,_that.completedAt,_that.status,_that.metadata,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserRoute extends UserRoute {
  const _UserRoute({required this.id, required this.userId, @RouteTypeConverter() required this.type, required this.startBuildingId, this.startFloorId, this.startRoomId, required this.endBuildingId, this.endFloorId, this.endRoomId, required  List<LatLng> geometry, required this.totalDistance, required this.estimatedDuration, required this.actualDuration, required this.startedAt, this.completedAt, @RouteStatusConverter() this.status = const RouteStatus.planned(),  Map<String, dynamic>? metadata, required this.createdAt, required this.updatedAt}): _geometry = geometry,_metadata = metadata,super._();
  factory _UserRoute.fromJson(Map<String, dynamic> json) => _$UserRouteFromJson(json);

@override final  String id;
@override final  String userId;
@override@RouteTypeConverter() final  RouteType type;
@override final  String startBuildingId;
@override final  String? startFloorId;
@override final  String? startRoomId;
@override final  String endBuildingId;
@override final  String? endFloorId;
@override final  String? endRoomId;
 final  List<LatLng> _geometry;
@override List<LatLng> get geometry {
  if (_geometry is EqualUnmodifiableListView) return _geometry;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_geometry);
}

@override final  double totalDistance;
@override final  Duration estimatedDuration;
@override final  Duration actualDuration;
@override final  DateTime startedAt;
@override final  DateTime? completedAt;
@override@JsonKey()@RouteStatusConverter() final  RouteStatus status;
 final  Map<String, dynamic>? _metadata;
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of UserRoute
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserRouteCopyWith<_UserRoute> get copyWith => __$UserRouteCopyWithImpl<_UserRoute>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserRouteToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserRoute&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.type, type) || other.type == type)&&(identical(other.startBuildingId, startBuildingId) || other.startBuildingId == startBuildingId)&&(identical(other.startFloorId, startFloorId) || other.startFloorId == startFloorId)&&(identical(other.startRoomId, startRoomId) || other.startRoomId == startRoomId)&&(identical(other.endBuildingId, endBuildingId) || other.endBuildingId == endBuildingId)&&(identical(other.endFloorId, endFloorId) || other.endFloorId == endFloorId)&&(identical(other.endRoomId, endRoomId) || other.endRoomId == endRoomId)&&const DeepCollectionEquality().equals(other.geometry, _geometry)&&(identical(other.totalDistance, totalDistance) || other.totalDistance == totalDistance)&&(identical(other.estimatedDuration, estimatedDuration) || other.estimatedDuration == estimatedDuration)&&(identical(other.actualDuration, actualDuration) || other.actualDuration == actualDuration)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.metadata, _metadata)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,id,userId,type,startBuildingId,startFloorId,startRoomId,endBuildingId,endFloorId,endRoomId,const DeepCollectionEquality().hash(_geometry),totalDistance,estimatedDuration,actualDuration,startedAt,completedAt,status,const DeepCollectionEquality().hash(_metadata),createdAt,updatedAt]);
}

@override
String toString() {
    return 'UserRoute(id: $id, userId: $userId, type: $type, startBuildingId: $startBuildingId, startFloorId: $startFloorId, startRoomId: $startRoomId, endBuildingId: $endBuildingId, endFloorId: $endFloorId, endRoomId: $endRoomId, geometry: $geometry, totalDistance: $totalDistance, estimatedDuration: $estimatedDuration, actualDuration: $actualDuration, startedAt: $startedAt, completedAt: $completedAt, status: $status, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$UserRouteCopyWith<$Res> implements $UserRouteCopyWith<$Res> {
  factory _$UserRouteCopyWith(_UserRoute value, $Res Function(_UserRoute) _then) = __$UserRouteCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId,@RouteTypeConverter() RouteType type, String startBuildingId, String? startFloorId, String? startRoomId, String endBuildingId, String? endFloorId, String? endRoomId, List<LatLng> geometry, double totalDistance, Duration estimatedDuration, Duration actualDuration, DateTime startedAt, DateTime? completedAt,@RouteStatusConverter() RouteStatus status, Map<String, dynamic>? metadata, DateTime createdAt, DateTime updatedAt
});


@override $RouteTypeCopyWith<$Res> get type;@override $RouteStatusCopyWith<$Res> get status;

}
/// @nodoc
class __$UserRouteCopyWithImpl<$Res>
    implements _$UserRouteCopyWith<$Res> {
  __$UserRouteCopyWithImpl(this._self, this._then);

  final _UserRoute _self;
  final $Res Function(_UserRoute) _then;

/// Create a copy of UserRoute
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? type = null,Object? startBuildingId = null,Object? startFloorId = freezed,Object? startRoomId = freezed,Object? endBuildingId = null,Object? endFloorId = freezed,Object? endRoomId = freezed,Object? geometry = null,Object? totalDistance = null,Object? estimatedDuration = null,Object? actualDuration = null,Object? startedAt = null,Object? completedAt = freezed,Object? status = null,Object? metadata = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_UserRoute(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as RouteType,startBuildingId: null == startBuildingId ? _self.startBuildingId : startBuildingId // ignore: cast_nullable_to_non_nullable
as String,startFloorId: freezed == startFloorId ? _self.startFloorId : startFloorId // ignore: cast_nullable_to_non_nullable
as String?,startRoomId: freezed == startRoomId ? _self.startRoomId : startRoomId // ignore: cast_nullable_to_non_nullable
as String?,endBuildingId: null == endBuildingId ? _self.endBuildingId : endBuildingId // ignore: cast_nullable_to_non_nullable
as String,endFloorId: freezed == endFloorId ? _self.endFloorId : endFloorId // ignore: cast_nullable_to_non_nullable
as String?,endRoomId: freezed == endRoomId ? _self.endRoomId : endRoomId // ignore: cast_nullable_to_non_nullable
as String?,geometry: null == geometry ? _self._geometry : geometry // ignore: cast_nullable_to_non_nullable
as List<LatLng>,totalDistance: null == totalDistance ? _self.totalDistance : totalDistance // ignore: cast_nullable_to_non_nullable
as double,estimatedDuration: null == estimatedDuration ? _self.estimatedDuration : estimatedDuration // ignore: cast_nullable_to_non_nullable
as Duration,actualDuration: null == actualDuration ? _self.actualDuration : actualDuration // ignore: cast_nullable_to_non_nullable
as Duration,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RouteStatus,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of UserRoute
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteTypeCopyWith<$Res> get type {
  
  return $RouteTypeCopyWith<$Res>(_self.type, (value) {
    return _then(_self.copyWith(type: value));
  });
}/// Create a copy of UserRoute
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteStatusCopyWith<$Res> get status {
  
  return $RouteStatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Planned value)?  planned,TResult Function( _Active value)?  active,TResult Function( _Paused value)?  paused,TResult Function( _Completed value)?  completed,TResult Function( _Cancelled value)?  cancelled,TResult Function( _Failed value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Planned() when planned != null:
return planned(_that);case _Active() when active != null:
return active(_that);case _Paused() when paused != null:
return paused(_that);case _Completed() when completed != null:
return completed(_that);case _Cancelled() when cancelled != null:
return cancelled(_that);case _Failed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Planned value)  planned,required TResult Function( _Active value)  active,required TResult Function( _Paused value)  paused,required TResult Function( _Completed value)  completed,required TResult Function( _Cancelled value)  cancelled,required TResult Function( _Failed value)  failed,}){
final _that = this;
switch (_that) {
case _Planned():
return planned(_that);case _Active():
return active(_that);case _Paused():
return paused(_that);case _Completed():
return completed(_that);case _Cancelled():
return cancelled(_that);case _Failed():
return failed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Planned value)?  planned,TResult? Function( _Active value)?  active,TResult? Function( _Paused value)?  paused,TResult? Function( _Completed value)?  completed,TResult? Function( _Cancelled value)?  cancelled,TResult? Function( _Failed value)?  failed,}){
final _that = this;
switch (_that) {
case _Planned() when planned != null:
return planned(_that);case _Active() when active != null:
return active(_that);case _Paused() when paused != null:
return paused(_that);case _Completed() when completed != null:
return completed(_that);case _Cancelled() when cancelled != null:
return cancelled(_that);case _Failed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  planned,TResult Function()?  active,TResult Function()?  paused,TResult Function()?  completed,TResult Function()?  cancelled,TResult Function()?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Planned() when planned != null:
return planned();case _Active() when active != null:
return active();case _Paused() when paused != null:
return paused();case _Completed() when completed != null:
return completed();case _Cancelled() when cancelled != null:
return cancelled();case _Failed() when failed != null:
return failed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  planned,required TResult Function()  active,required TResult Function()  paused,required TResult Function()  completed,required TResult Function()  cancelled,required TResult Function()  failed,}) {final _that = this;
switch (_that) {
case _Planned():
return planned();case _Active():
return active();case _Paused():
return paused();case _Completed():
return completed();case _Cancelled():
return cancelled();case _Failed():
return failed();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  planned,TResult? Function()?  active,TResult? Function()?  paused,TResult? Function()?  completed,TResult? Function()?  cancelled,TResult? Function()?  failed,}) {final _that = this;
switch (_that) {
case _Planned() when planned != null:
return planned();case _Active() when active != null:
return active();case _Paused() when paused != null:
return paused();case _Completed() when completed != null:
return completed();case _Cancelled() when cancelled != null:
return cancelled();case _Failed() when failed != null:
return failed();case _:
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


class _Failed implements RouteStatus {
  const _Failed();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'RouteStatus.failed()';
}


}





/// @nodoc
mixin _$SafetyScore {

 String get userId; String get userName; int get totalScore; int get navigationScore; int get emergencyPreparednessScore; int get buildingFamiliarityScore; int get drillParticipationScore; int get alertResponsivenessScore; Map<String, int> get buildingScores; List<String> get completedDrills; List<String> get visitedBuildings; int get totalRoutesCompleted; int get totalDistanceMeters; int get totalVisits; DateTime? get lastActivityAt; DateTime get createdAt; DateTime get updatedAt; Map<String, dynamic>? get metadata;
/// Create a copy of SafetyScore
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SafetyScoreCopyWith<SafetyScore> get copyWith => _$SafetyScoreCopyWithImpl<SafetyScore>(this as SafetyScore, _$identity);

  /// Serializes this SafetyScore to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SafetyScore;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SafetyScore&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.userName, _this.userName) || other.userName == _this.userName)&&(identical(other.totalScore, _this.totalScore) || other.totalScore == _this.totalScore)&&(identical(other.navigationScore, _this.navigationScore) || other.navigationScore == _this.navigationScore)&&(identical(other.emergencyPreparednessScore, _this.emergencyPreparednessScore) || other.emergencyPreparednessScore == _this.emergencyPreparednessScore)&&(identical(other.buildingFamiliarityScore, _this.buildingFamiliarityScore) || other.buildingFamiliarityScore == _this.buildingFamiliarityScore)&&(identical(other.drillParticipationScore, _this.drillParticipationScore) || other.drillParticipationScore == _this.drillParticipationScore)&&(identical(other.alertResponsivenessScore, _this.alertResponsivenessScore) || other.alertResponsivenessScore == _this.alertResponsivenessScore)&&const DeepCollectionEquality().equals(other.buildingScores, _this.buildingScores)&&const DeepCollectionEquality().equals(other.completedDrills, _this.completedDrills)&&const DeepCollectionEquality().equals(other.visitedBuildings, _this.visitedBuildings)&&(identical(other.totalRoutesCompleted, _this.totalRoutesCompleted) || other.totalRoutesCompleted == _this.totalRoutesCompleted)&&(identical(other.totalDistanceMeters, _this.totalDistanceMeters) || other.totalDistanceMeters == _this.totalDistanceMeters)&&(identical(other.totalVisits, _this.totalVisits) || other.totalVisits == _this.totalVisits)&&(identical(other.lastActivityAt, _this.lastActivityAt) || other.lastActivityAt == _this.lastActivityAt)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&const DeepCollectionEquality().equals(other.metadata, _this.metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SafetyScore;
  return Object.hash(runtimeType,_this.userId,_this.userName,_this.totalScore,_this.navigationScore,_this.emergencyPreparednessScore,_this.buildingFamiliarityScore,_this.drillParticipationScore,_this.alertResponsivenessScore,const DeepCollectionEquality().hash(_this.buildingScores),const DeepCollectionEquality().hash(_this.completedDrills),const DeepCollectionEquality().hash(_this.visitedBuildings),_this.totalRoutesCompleted,_this.totalDistanceMeters,_this.totalVisits,_this.lastActivityAt,_this.createdAt,_this.updatedAt,const DeepCollectionEquality().hash(_this.metadata));
}

@override
String toString() {
  final _this = this as SafetyScore;
  return 'SafetyScore(userId: ${_this.userId}, userName: ${_this.userName}, totalScore: ${_this.totalScore}, navigationScore: ${_this.navigationScore}, emergencyPreparednessScore: ${_this.emergencyPreparednessScore}, buildingFamiliarityScore: ${_this.buildingFamiliarityScore}, drillParticipationScore: ${_this.drillParticipationScore}, alertResponsivenessScore: ${_this.alertResponsivenessScore}, buildingScores: ${_this.buildingScores}, completedDrills: ${_this.completedDrills}, visitedBuildings: ${_this.visitedBuildings}, totalRoutesCompleted: ${_this.totalRoutesCompleted}, totalDistanceMeters: ${_this.totalDistanceMeters}, totalVisits: ${_this.totalVisits}, lastActivityAt: ${_this.lastActivityAt}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, metadata: ${_this.metadata})';
}


}

/// @nodoc
abstract mixin class $SafetyScoreCopyWith<$Res>  {
  factory $SafetyScoreCopyWith(SafetyScore value, $Res Function(SafetyScore) _then) = _$SafetyScoreCopyWithImpl;
@useResult
$Res call({
 String userId, String userName, int totalScore, int navigationScore, int emergencyPreparednessScore, int buildingFamiliarityScore, int drillParticipationScore, int alertResponsivenessScore, Map<String, int> buildingScores, List<String> completedDrills, List<String> visitedBuildings, int totalRoutesCompleted, int totalDistanceMeters, int totalVisits, DateTime? lastActivityAt, DateTime createdAt, DateTime updatedAt, Map<String, dynamic>? metadata
});




}
/// @nodoc
class _$SafetyScoreCopyWithImpl<$Res>
    implements $SafetyScoreCopyWith<$Res> {
  _$SafetyScoreCopyWithImpl(this._self, this._then);

  final SafetyScore _self;
  final $Res Function(SafetyScore) _then;

/// Create a copy of SafetyScore
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? userName = null,Object? totalScore = null,Object? navigationScore = null,Object? emergencyPreparednessScore = null,Object? buildingFamiliarityScore = null,Object? drillParticipationScore = null,Object? alertResponsivenessScore = null,Object? buildingScores = null,Object? completedDrills = null,Object? visitedBuildings = null,Object? totalRoutesCompleted = null,Object? totalDistanceMeters = null,Object? totalVisits = null,Object? lastActivityAt = freezed,Object? createdAt = null,Object? updatedAt = null,Object? metadata = freezed,}) {
  return _then(SafetyScore(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,totalScore: null == totalScore ? _self.totalScore : totalScore // ignore: cast_nullable_to_non_nullable
as int,navigationScore: null == navigationScore ? _self.navigationScore : navigationScore // ignore: cast_nullable_to_non_nullable
as int,emergencyPreparednessScore: null == emergencyPreparednessScore ? _self.emergencyPreparednessScore : emergencyPreparednessScore // ignore: cast_nullable_to_non_nullable
as int,buildingFamiliarityScore: null == buildingFamiliarityScore ? _self.buildingFamiliarityScore : buildingFamiliarityScore // ignore: cast_nullable_to_non_nullable
as int,drillParticipationScore: null == drillParticipationScore ? _self.drillParticipationScore : drillParticipationScore // ignore: cast_nullable_to_non_nullable
as int,alertResponsivenessScore: null == alertResponsivenessScore ? _self.alertResponsivenessScore : alertResponsivenessScore // ignore: cast_nullable_to_non_nullable
as int,buildingScores: null == buildingScores ? _self.buildingScores : buildingScores // ignore: cast_nullable_to_non_nullable
as Map<String, int>,completedDrills: null == completedDrills ? _self.completedDrills : completedDrills // ignore: cast_nullable_to_non_nullable
as List<String>,visitedBuildings: null == visitedBuildings ? _self.visitedBuildings : visitedBuildings // ignore: cast_nullable_to_non_nullable
as List<String>,totalRoutesCompleted: null == totalRoutesCompleted ? _self.totalRoutesCompleted : totalRoutesCompleted // ignore: cast_nullable_to_non_nullable
as int,totalDistanceMeters: null == totalDistanceMeters ? _self.totalDistanceMeters : totalDistanceMeters // ignore: cast_nullable_to_non_nullable
as int,totalVisits: null == totalVisits ? _self.totalVisits : totalVisits // ignore: cast_nullable_to_non_nullable
as int,lastActivityAt: freezed == lastActivityAt ? _self.lastActivityAt : lastActivityAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [SafetyScore].
extension SafetyScorePatterns on SafetyScore {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SafetyScore value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SafetyScore() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SafetyScore value)  $default,){
final _that = this;
switch (_that) {
case _SafetyScore():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SafetyScore value)?  $default,){
final _that = this;
switch (_that) {
case _SafetyScore() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String userName,  int totalScore,  int navigationScore,  int emergencyPreparednessScore,  int buildingFamiliarityScore,  int drillParticipationScore,  int alertResponsivenessScore,  Map<String, int> buildingScores,  List<String> completedDrills,  List<String> visitedBuildings,  int totalRoutesCompleted,  int totalDistanceMeters,  int totalVisits,  DateTime? lastActivityAt,  DateTime createdAt,  DateTime updatedAt,  Map<String, dynamic>? metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SafetyScore() when $default != null:
return $default(_that.userId,_that.userName,_that.totalScore,_that.navigationScore,_that.emergencyPreparednessScore,_that.buildingFamiliarityScore,_that.drillParticipationScore,_that.alertResponsivenessScore,_that.buildingScores,_that.completedDrills,_that.visitedBuildings,_that.totalRoutesCompleted,_that.totalDistanceMeters,_that.totalVisits,_that.lastActivityAt,_that.createdAt,_that.updatedAt,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String userName,  int totalScore,  int navigationScore,  int emergencyPreparednessScore,  int buildingFamiliarityScore,  int drillParticipationScore,  int alertResponsivenessScore,  Map<String, int> buildingScores,  List<String> completedDrills,  List<String> visitedBuildings,  int totalRoutesCompleted,  int totalDistanceMeters,  int totalVisits,  DateTime? lastActivityAt,  DateTime createdAt,  DateTime updatedAt,  Map<String, dynamic>? metadata)  $default,) {final _that = this;
switch (_that) {
case _SafetyScore():
return $default(_that.userId,_that.userName,_that.totalScore,_that.navigationScore,_that.emergencyPreparednessScore,_that.buildingFamiliarityScore,_that.drillParticipationScore,_that.alertResponsivenessScore,_that.buildingScores,_that.completedDrills,_that.visitedBuildings,_that.totalRoutesCompleted,_that.totalDistanceMeters,_that.totalVisits,_that.lastActivityAt,_that.createdAt,_that.updatedAt,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String userName,  int totalScore,  int navigationScore,  int emergencyPreparednessScore,  int buildingFamiliarityScore,  int drillParticipationScore,  int alertResponsivenessScore,  Map<String, int> buildingScores,  List<String> completedDrills,  List<String> visitedBuildings,  int totalRoutesCompleted,  int totalDistanceMeters,  int totalVisits,  DateTime? lastActivityAt,  DateTime createdAt,  DateTime updatedAt,  Map<String, dynamic>? metadata)?  $default,) {final _that = this;
switch (_that) {
case _SafetyScore() when $default != null:
return $default(_that.userId,_that.userName,_that.totalScore,_that.navigationScore,_that.emergencyPreparednessScore,_that.buildingFamiliarityScore,_that.drillParticipationScore,_that.alertResponsivenessScore,_that.buildingScores,_that.completedDrills,_that.visitedBuildings,_that.totalRoutesCompleted,_that.totalDistanceMeters,_that.totalVisits,_that.lastActivityAt,_that.createdAt,_that.updatedAt,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SafetyScore extends SafetyScore {
  const _SafetyScore({required this.userId, required this.userName, required this.totalScore, this.navigationScore = 0, this.emergencyPreparednessScore = 0, this.buildingFamiliarityScore = 0, this.drillParticipationScore = 0, this.alertResponsivenessScore = 0,  Map<String, int> buildingScores = const {},  List<String> completedDrills = const [],  List<String> visitedBuildings = const [], this.totalRoutesCompleted = 0, this.totalDistanceMeters = 0, this.totalVisits = 0, this.lastActivityAt, required this.createdAt, required this.updatedAt,  Map<String, dynamic>? metadata}): _buildingScores = buildingScores,_completedDrills = completedDrills,_visitedBuildings = visitedBuildings,_metadata = metadata,super._();
  factory _SafetyScore.fromJson(Map<String, dynamic> json) => _$SafetyScoreFromJson(json);

@override final  String userId;
@override final  String userName;
@override final  int totalScore;
@override@JsonKey() final  int navigationScore;
@override@JsonKey() final  int emergencyPreparednessScore;
@override@JsonKey() final  int buildingFamiliarityScore;
@override@JsonKey() final  int drillParticipationScore;
@override@JsonKey() final  int alertResponsivenessScore;
 final  Map<String, int> _buildingScores;
@override@JsonKey() Map<String, int> get buildingScores {
  if (_buildingScores is EqualUnmodifiableMapView) return _buildingScores;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_buildingScores);
}

 final  List<String> _completedDrills;
@override@JsonKey() List<String> get completedDrills {
  if (_completedDrills is EqualUnmodifiableListView) return _completedDrills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_completedDrills);
}

 final  List<String> _visitedBuildings;
@override@JsonKey() List<String> get visitedBuildings {
  if (_visitedBuildings is EqualUnmodifiableListView) return _visitedBuildings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_visitedBuildings);
}

@override@JsonKey() final  int totalRoutesCompleted;
@override@JsonKey() final  int totalDistanceMeters;
@override@JsonKey() final  int totalVisits;
@override final  DateTime? lastActivityAt;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
 final  Map<String, dynamic>? _metadata;
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of SafetyScore
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SafetyScoreCopyWith<_SafetyScore> get copyWith => __$SafetyScoreCopyWithImpl<_SafetyScore>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SafetyScoreToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SafetyScore&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.totalScore, totalScore) || other.totalScore == totalScore)&&(identical(other.navigationScore, navigationScore) || other.navigationScore == navigationScore)&&(identical(other.emergencyPreparednessScore, emergencyPreparednessScore) || other.emergencyPreparednessScore == emergencyPreparednessScore)&&(identical(other.buildingFamiliarityScore, buildingFamiliarityScore) || other.buildingFamiliarityScore == buildingFamiliarityScore)&&(identical(other.drillParticipationScore, drillParticipationScore) || other.drillParticipationScore == drillParticipationScore)&&(identical(other.alertResponsivenessScore, alertResponsivenessScore) || other.alertResponsivenessScore == alertResponsivenessScore)&&const DeepCollectionEquality().equals(other.buildingScores, _buildingScores)&&const DeepCollectionEquality().equals(other.completedDrills, _completedDrills)&&const DeepCollectionEquality().equals(other.visitedBuildings, _visitedBuildings)&&(identical(other.totalRoutesCompleted, totalRoutesCompleted) || other.totalRoutesCompleted == totalRoutesCompleted)&&(identical(other.totalDistanceMeters, totalDistanceMeters) || other.totalDistanceMeters == totalDistanceMeters)&&(identical(other.totalVisits, totalVisits) || other.totalVisits == totalVisits)&&(identical(other.lastActivityAt, lastActivityAt) || other.lastActivityAt == lastActivityAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,userId,userName,totalScore,navigationScore,emergencyPreparednessScore,buildingFamiliarityScore,drillParticipationScore,alertResponsivenessScore,const DeepCollectionEquality().hash(_buildingScores),const DeepCollectionEquality().hash(_completedDrills),const DeepCollectionEquality().hash(_visitedBuildings),totalRoutesCompleted,totalDistanceMeters,totalVisits,lastActivityAt,createdAt,updatedAt,const DeepCollectionEquality().hash(_metadata));
}

@override
String toString() {
    return 'SafetyScore(userId: $userId, userName: $userName, totalScore: $totalScore, navigationScore: $navigationScore, emergencyPreparednessScore: $emergencyPreparednessScore, buildingFamiliarityScore: $buildingFamiliarityScore, drillParticipationScore: $drillParticipationScore, alertResponsivenessScore: $alertResponsivenessScore, buildingScores: $buildingScores, completedDrills: $completedDrills, visitedBuildings: $visitedBuildings, totalRoutesCompleted: $totalRoutesCompleted, totalDistanceMeters: $totalDistanceMeters, totalVisits: $totalVisits, lastActivityAt: $lastActivityAt, createdAt: $createdAt, updatedAt: $updatedAt, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$SafetyScoreCopyWith<$Res> implements $SafetyScoreCopyWith<$Res> {
  factory _$SafetyScoreCopyWith(_SafetyScore value, $Res Function(_SafetyScore) _then) = __$SafetyScoreCopyWithImpl;
@override @useResult
$Res call({
 String userId, String userName, int totalScore, int navigationScore, int emergencyPreparednessScore, int buildingFamiliarityScore, int drillParticipationScore, int alertResponsivenessScore, Map<String, int> buildingScores, List<String> completedDrills, List<String> visitedBuildings, int totalRoutesCompleted, int totalDistanceMeters, int totalVisits, DateTime? lastActivityAt, DateTime createdAt, DateTime updatedAt, Map<String, dynamic>? metadata
});




}
/// @nodoc
class __$SafetyScoreCopyWithImpl<$Res>
    implements _$SafetyScoreCopyWith<$Res> {
  __$SafetyScoreCopyWithImpl(this._self, this._then);

  final _SafetyScore _self;
  final $Res Function(_SafetyScore) _then;

/// Create a copy of SafetyScore
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? userName = null,Object? totalScore = null,Object? navigationScore = null,Object? emergencyPreparednessScore = null,Object? buildingFamiliarityScore = null,Object? drillParticipationScore = null,Object? alertResponsivenessScore = null,Object? buildingScores = null,Object? completedDrills = null,Object? visitedBuildings = null,Object? totalRoutesCompleted = null,Object? totalDistanceMeters = null,Object? totalVisits = null,Object? lastActivityAt = freezed,Object? createdAt = null,Object? updatedAt = null,Object? metadata = freezed,}) {
  return _then(_SafetyScore(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,totalScore: null == totalScore ? _self.totalScore : totalScore // ignore: cast_nullable_to_non_nullable
as int,navigationScore: null == navigationScore ? _self.navigationScore : navigationScore // ignore: cast_nullable_to_non_nullable
as int,emergencyPreparednessScore: null == emergencyPreparednessScore ? _self.emergencyPreparednessScore : emergencyPreparednessScore // ignore: cast_nullable_to_non_nullable
as int,buildingFamiliarityScore: null == buildingFamiliarityScore ? _self.buildingFamiliarityScore : buildingFamiliarityScore // ignore: cast_nullable_to_non_nullable
as int,drillParticipationScore: null == drillParticipationScore ? _self.drillParticipationScore : drillParticipationScore // ignore: cast_nullable_to_non_nullable
as int,alertResponsivenessScore: null == alertResponsivenessScore ? _self.alertResponsivenessScore : alertResponsivenessScore // ignore: cast_nullable_to_non_nullable
as int,buildingScores: null == buildingScores ? _self._buildingScores : buildingScores // ignore: cast_nullable_to_non_nullable
as Map<String, int>,completedDrills: null == completedDrills ? _self._completedDrills : completedDrills // ignore: cast_nullable_to_non_nullable
as List<String>,visitedBuildings: null == visitedBuildings ? _self._visitedBuildings : visitedBuildings // ignore: cast_nullable_to_non_nullable
as List<String>,totalRoutesCompleted: null == totalRoutesCompleted ? _self.totalRoutesCompleted : totalRoutesCompleted // ignore: cast_nullable_to_non_nullable
as int,totalDistanceMeters: null == totalDistanceMeters ? _self.totalDistanceMeters : totalDistanceMeters // ignore: cast_nullable_to_non_nullable
as int,totalVisits: null == totalVisits ? _self.totalVisits : totalVisits // ignore: cast_nullable_to_non_nullable
as int,lastActivityAt: freezed == lastActivityAt ? _self.lastActivityAt : lastActivityAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
