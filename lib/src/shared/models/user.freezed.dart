// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {

/// Unique user ID (Firebase Auth UID)
 String get id;/// User's email address
 String get email;/// User's first name
 String get firstName;/// User's last name
 String get lastName;/// User's middle initial (optional)
 String? get middleInitial;/// User's role in the system
 UserRole get role;/// Student ID (for students only)
 String? get studentId;/// Employee ID (for faculty/security/admin)
 String? get employeeId;/// Department/College
 String? get department;/// Phone number
 String? get phoneNumber;/// Profile photo URL
 String? get photoUrl;/// Whether user is active
 bool get isActive;/// Whether email is verified
 bool get emailVerified;/// Last login timestamp
 DateTime? get lastLoginAt;/// Account creation timestamp
 DateTime get createdAt;/// Last update timestamp
 DateTime get updatedAt;/// FCM token for push notifications
 String? get fcmToken;/// Emergency contact name
 String? get emergencyContactName;/// Emergency contact phone
 String? get emergencyContactPhone;/// Preferred language
 String get language;/// Notification preferences
 Map<String, bool> get notificationPrefs;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as User;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.firstName, _this.firstName) || other.firstName == _this.firstName)&&(identical(other.lastName, _this.lastName) || other.lastName == _this.lastName)&&(identical(other.middleInitial, _this.middleInitial) || other.middleInitial == _this.middleInitial)&&(identical(other.role, _this.role) || other.role == _this.role)&&(identical(other.studentId, _this.studentId) || other.studentId == _this.studentId)&&(identical(other.employeeId, _this.employeeId) || other.employeeId == _this.employeeId)&&(identical(other.department, _this.department) || other.department == _this.department)&&(identical(other.phoneNumber, _this.phoneNumber) || other.phoneNumber == _this.phoneNumber)&&(identical(other.photoUrl, _this.photoUrl) || other.photoUrl == _this.photoUrl)&&(identical(other.isActive, _this.isActive) || other.isActive == _this.isActive)&&(identical(other.emailVerified, _this.emailVerified) || other.emailVerified == _this.emailVerified)&&(identical(other.lastLoginAt, _this.lastLoginAt) || other.lastLoginAt == _this.lastLoginAt)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.fcmToken, _this.fcmToken) || other.fcmToken == _this.fcmToken)&&(identical(other.emergencyContactName, _this.emergencyContactName) || other.emergencyContactName == _this.emergencyContactName)&&(identical(other.emergencyContactPhone, _this.emergencyContactPhone) || other.emergencyContactPhone == _this.emergencyContactPhone)&&(identical(other.language, _this.language) || other.language == _this.language)&&const DeepCollectionEquality().equals(other.notificationPrefs, _this.notificationPrefs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as User;
  return Object.hashAll([runtimeType,_this.id,_this.email,_this.firstName,_this.lastName,_this.middleInitial,_this.role,_this.studentId,_this.employeeId,_this.department,_this.phoneNumber,_this.photoUrl,_this.isActive,_this.emailVerified,_this.lastLoginAt,_this.createdAt,_this.updatedAt,_this.fcmToken,_this.emergencyContactName,_this.emergencyContactPhone,_this.language,const DeepCollectionEquality().hash(_this.notificationPrefs)]);
}

@override
String toString() {
  final _this = this as User;
  return 'User(id: ${_this.id}, email: ${_this.email}, firstName: ${_this.firstName}, lastName: ${_this.lastName}, middleInitial: ${_this.middleInitial}, role: ${_this.role}, studentId: ${_this.studentId}, employeeId: ${_this.employeeId}, department: ${_this.department}, phoneNumber: ${_this.phoneNumber}, photoUrl: ${_this.photoUrl}, isActive: ${_this.isActive}, emailVerified: ${_this.emailVerified}, lastLoginAt: ${_this.lastLoginAt}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, fcmToken: ${_this.fcmToken}, emergencyContactName: ${_this.emergencyContactName}, emergencyContactPhone: ${_this.emergencyContactPhone}, language: ${_this.language}, notificationPrefs: ${_this.notificationPrefs})';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 String id, String email, String firstName, String lastName, String? middleInitial, UserRole role, String? studentId, String? employeeId, String? department, String? phoneNumber, String? photoUrl, bool isActive, bool emailVerified, DateTime? lastLoginAt, DateTime createdAt, DateTime updatedAt, String? fcmToken, String? emergencyContactName, String? emergencyContactPhone, String language, Map<String, bool> notificationPrefs
});




}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? firstName = null,Object? lastName = null,Object? middleInitial = freezed,Object? role = null,Object? studentId = freezed,Object? employeeId = freezed,Object? department = freezed,Object? phoneNumber = freezed,Object? photoUrl = freezed,Object? isActive = null,Object? emailVerified = null,Object? lastLoginAt = freezed,Object? createdAt = null,Object? updatedAt = null,Object? fcmToken = freezed,Object? emergencyContactName = freezed,Object? emergencyContactPhone = freezed,Object? language = null,Object? notificationPrefs = null,}) {
  return _then(User(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,middleInitial: freezed == middleInitial ? _self.middleInitial : middleInitial // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,studentId: freezed == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as String?,employeeId: freezed == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String?,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,lastLoginAt: freezed == lastLoginAt ? _self.lastLoginAt : lastLoginAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,fcmToken: freezed == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String?,emergencyContactName: freezed == emergencyContactName ? _self.emergencyContactName : emergencyContactName // ignore: cast_nullable_to_non_nullable
as String?,emergencyContactPhone: freezed == emergencyContactPhone ? _self.emergencyContactPhone : emergencyContactPhone // ignore: cast_nullable_to_non_nullable
as String?,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,notificationPrefs: null == notificationPrefs ? _self.notificationPrefs : notificationPrefs // ignore: cast_nullable_to_non_nullable
as Map<String, bool>,
  ));
}

}


/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,){
final _that = this;
switch (_that) {
case _User():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String email,  String firstName,  String lastName,  String? middleInitial,  UserRole role,  String? studentId,  String? employeeId,  String? department,  String? phoneNumber,  String? photoUrl,  bool isActive,  bool emailVerified,  DateTime? lastLoginAt,  DateTime createdAt,  DateTime updatedAt,  String? fcmToken,  String? emergencyContactName,  String? emergencyContactPhone,  String language,  Map<String, bool> notificationPrefs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.email,_that.firstName,_that.lastName,_that.middleInitial,_that.role,_that.studentId,_that.employeeId,_that.department,_that.phoneNumber,_that.photoUrl,_that.isActive,_that.emailVerified,_that.lastLoginAt,_that.createdAt,_that.updatedAt,_that.fcmToken,_that.emergencyContactName,_that.emergencyContactPhone,_that.language,_that.notificationPrefs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String email,  String firstName,  String lastName,  String? middleInitial,  UserRole role,  String? studentId,  String? employeeId,  String? department,  String? phoneNumber,  String? photoUrl,  bool isActive,  bool emailVerified,  DateTime? lastLoginAt,  DateTime createdAt,  DateTime updatedAt,  String? fcmToken,  String? emergencyContactName,  String? emergencyContactPhone,  String language,  Map<String, bool> notificationPrefs)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.id,_that.email,_that.firstName,_that.lastName,_that.middleInitial,_that.role,_that.studentId,_that.employeeId,_that.department,_that.phoneNumber,_that.photoUrl,_that.isActive,_that.emailVerified,_that.lastLoginAt,_that.createdAt,_that.updatedAt,_that.fcmToken,_that.emergencyContactName,_that.emergencyContactPhone,_that.language,_that.notificationPrefs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String email,  String firstName,  String lastName,  String? middleInitial,  UserRole role,  String? studentId,  String? employeeId,  String? department,  String? phoneNumber,  String? photoUrl,  bool isActive,  bool emailVerified,  DateTime? lastLoginAt,  DateTime createdAt,  DateTime updatedAt,  String? fcmToken,  String? emergencyContactName,  String? emergencyContactPhone,  String language,  Map<String, bool> notificationPrefs)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.email,_that.firstName,_that.lastName,_that.middleInitial,_that.role,_that.studentId,_that.employeeId,_that.department,_that.phoneNumber,_that.photoUrl,_that.isActive,_that.emailVerified,_that.lastLoginAt,_that.createdAt,_that.updatedAt,_that.fcmToken,_that.emergencyContactName,_that.emergencyContactPhone,_that.language,_that.notificationPrefs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _User implements User {
  const _User({required this.id, required this.email, required this.firstName, required this.lastName, this.middleInitial, required this.role, this.studentId, this.employeeId, this.department, this.phoneNumber, this.photoUrl, this.isActive = true, this.emailVerified = false, this.lastLoginAt, required this.createdAt, required this.updatedAt, this.fcmToken, this.emergencyContactName, this.emergencyContactPhone, this.language = 'en',  Map<String, bool> notificationPrefs = const {}}): _notificationPrefs = notificationPrefs;
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

/// Unique user ID (Firebase Auth UID)
@override final  String id;
/// User's email address
@override final  String email;
/// User's first name
@override final  String firstName;
/// User's last name
@override final  String lastName;
/// User's middle initial (optional)
@override final  String? middleInitial;
/// User's role in the system
@override final  UserRole role;
/// Student ID (for students only)
@override final  String? studentId;
/// Employee ID (for faculty/security/admin)
@override final  String? employeeId;
/// Department/College
@override final  String? department;
/// Phone number
@override final  String? phoneNumber;
/// Profile photo URL
@override final  String? photoUrl;
/// Whether user is active
@override@JsonKey() final  bool isActive;
/// Whether email is verified
@override@JsonKey() final  bool emailVerified;
/// Last login timestamp
@override final  DateTime? lastLoginAt;
/// Account creation timestamp
@override final  DateTime createdAt;
/// Last update timestamp
@override final  DateTime updatedAt;
/// FCM token for push notifications
@override final  String? fcmToken;
/// Emergency contact name
@override final  String? emergencyContactName;
/// Emergency contact phone
@override final  String? emergencyContactPhone;
/// Preferred language
@override@JsonKey() final  String language;
/// Notification preferences
 final  Map<String, bool> _notificationPrefs;
/// Notification preferences
@override@JsonKey() Map<String, bool> get notificationPrefs {
  if (_notificationPrefs is EqualUnmodifiableMapView) return _notificationPrefs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_notificationPrefs);
}


/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.middleInitial, middleInitial) || other.middleInitial == middleInitial)&&(identical(other.role, role) || other.role == role)&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.department, department) || other.department == department)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.lastLoginAt, lastLoginAt) || other.lastLoginAt == lastLoginAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken)&&(identical(other.emergencyContactName, emergencyContactName) || other.emergencyContactName == emergencyContactName)&&(identical(other.emergencyContactPhone, emergencyContactPhone) || other.emergencyContactPhone == emergencyContactPhone)&&(identical(other.language, language) || other.language == language)&&const DeepCollectionEquality().equals(other.notificationPrefs, _notificationPrefs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,id,email,firstName,lastName,middleInitial,role,studentId,employeeId,department,phoneNumber,photoUrl,isActive,emailVerified,lastLoginAt,createdAt,updatedAt,fcmToken,emergencyContactName,emergencyContactPhone,language,const DeepCollectionEquality().hash(_notificationPrefs)]);
}

@override
String toString() {
    return 'User(id: $id, email: $email, firstName: $firstName, lastName: $lastName, middleInitial: $middleInitial, role: $role, studentId: $studentId, employeeId: $employeeId, department: $department, phoneNumber: $phoneNumber, photoUrl: $photoUrl, isActive: $isActive, emailVerified: $emailVerified, lastLoginAt: $lastLoginAt, createdAt: $createdAt, updatedAt: $updatedAt, fcmToken: $fcmToken, emergencyContactName: $emergencyContactName, emergencyContactPhone: $emergencyContactPhone, language: $language, notificationPrefs: $notificationPrefs)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 String id, String email, String firstName, String lastName, String? middleInitial, UserRole role, String? studentId, String? employeeId, String? department, String? phoneNumber, String? photoUrl, bool isActive, bool emailVerified, DateTime? lastLoginAt, DateTime createdAt, DateTime updatedAt, String? fcmToken, String? emergencyContactName, String? emergencyContactPhone, String language, Map<String, bool> notificationPrefs
});




}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? firstName = null,Object? lastName = null,Object? middleInitial = freezed,Object? role = null,Object? studentId = freezed,Object? employeeId = freezed,Object? department = freezed,Object? phoneNumber = freezed,Object? photoUrl = freezed,Object? isActive = null,Object? emailVerified = null,Object? lastLoginAt = freezed,Object? createdAt = null,Object? updatedAt = null,Object? fcmToken = freezed,Object? emergencyContactName = freezed,Object? emergencyContactPhone = freezed,Object? language = null,Object? notificationPrefs = null,}) {
  return _then(_User(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,middleInitial: freezed == middleInitial ? _self.middleInitial : middleInitial // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,studentId: freezed == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as String?,employeeId: freezed == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String?,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,lastLoginAt: freezed == lastLoginAt ? _self.lastLoginAt : lastLoginAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,fcmToken: freezed == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String?,emergencyContactName: freezed == emergencyContactName ? _self.emergencyContactName : emergencyContactName // ignore: cast_nullable_to_non_nullable
as String?,emergencyContactPhone: freezed == emergencyContactPhone ? _self.emergencyContactPhone : emergencyContactPhone // ignore: cast_nullable_to_non_nullable
as String?,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,notificationPrefs: null == notificationPrefs ? _self._notificationPrefs : notificationPrefs // ignore: cast_nullable_to_non_nullable
as Map<String, bool>,
  ));
}


}

// dart format on
