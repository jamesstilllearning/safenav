// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  /// Unique user ID (Firebase Auth UID)
  String get id => throw _privateConstructorUsedError;

  /// User's email address
  String get email => throw _privateConstructorUsedError;

  /// User's first name
  String get firstName => throw _privateConstructorUsedError;

  /// User's last name
  String get lastName => throw _privateConstructorUsedError;

  /// User's middle initial (optional)
  String? get middleInitial => throw _privateConstructorUsedError;

  /// User's role in the system
  UserRole get role => throw _privateConstructorUsedError;

  /// Student ID (for students only)
  String? get studentId => throw _privateConstructorUsedError;

  /// Employee ID (for faculty/security/admin)
  String? get employeeId => throw _privateConstructorUsedError;

  /// Department/College
  String? get department => throw _privateConstructorUsedError;

  /// Phone number
  String? get phoneNumber => throw _privateConstructorUsedError;

  /// Profile photo URL
  String? get photoUrl => throw _privateConstructorUsedError;

  /// Whether user is active
  bool get isActive => throw _privateConstructorUsedError;

  /// Whether email is verified
  bool get emailVerified => throw _privateConstructorUsedError;

  /// Last login timestamp
  DateTime? get lastLoginAt => throw _privateConstructorUsedError;

  /// Account creation timestamp
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Last update timestamp
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// FCM token for push notifications
  String? get fcmToken => throw _privateConstructorUsedError;

  /// Emergency contact name
  String? get emergencyContactName => throw _privateConstructorUsedError;

  /// Emergency contact phone
  String? get emergencyContactPhone => throw _privateConstructorUsedError;

  /// Preferred language
  String get language => throw _privateConstructorUsedError;

  /// Notification preferences
  Map<String, bool> get notificationPrefs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String id,
      String email,
      String firstName,
      String lastName,
      String? middleInitial,
      UserRole role,
      String? studentId,
      String? employeeId,
      String? department,
      String? phoneNumber,
      String? photoUrl,
      bool isActive,
      bool emailVerified,
      DateTime? lastLoginAt,
      DateTime createdAt,
      DateTime updatedAt,
      String? fcmToken,
      String? emergencyContactName,
      String? emergencyContactPhone,
      String language,
      Map<String, bool> notificationPrefs});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? middleInitial = freezed,
    Object? role = null,
    Object? studentId = freezed,
    Object? employeeId = freezed,
    Object? department = freezed,
    Object? phoneNumber = freezed,
    Object? photoUrl = freezed,
    Object? isActive = null,
    Object? emailVerified = null,
    Object? lastLoginAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? fcmToken = freezed,
    Object? emergencyContactName = freezed,
    Object? emergencyContactPhone = freezed,
    Object? language = null,
    Object? notificationPrefs = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      middleInitial: freezed == middleInitial
          ? _value.middleInitial
          : middleInitial // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      studentId: freezed == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as String?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      emailVerified: null == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      lastLoginAt: freezed == lastLoginAt
          ? _value.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
      emergencyContactName: freezed == emergencyContactName
          ? _value.emergencyContactName
          : emergencyContactName // ignore: cast_nullable_to_non_nullable
              as String?,
      emergencyContactPhone: freezed == emergencyContactPhone
          ? _value.emergencyContactPhone
          : emergencyContactPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      notificationPrefs: null == notificationPrefs
          ? _value.notificationPrefs
          : notificationPrefs // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String email,
      String firstName,
      String lastName,
      String? middleInitial,
      UserRole role,
      String? studentId,
      String? employeeId,
      String? department,
      String? phoneNumber,
      String? photoUrl,
      bool isActive,
      bool emailVerified,
      DateTime? lastLoginAt,
      DateTime createdAt,
      DateTime updatedAt,
      String? fcmToken,
      String? emergencyContactName,
      String? emergencyContactPhone,
      String language,
      Map<String, bool> notificationPrefs});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? middleInitial = freezed,
    Object? role = null,
    Object? studentId = freezed,
    Object? employeeId = freezed,
    Object? department = freezed,
    Object? phoneNumber = freezed,
    Object? photoUrl = freezed,
    Object? isActive = null,
    Object? emailVerified = null,
    Object? lastLoginAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? fcmToken = freezed,
    Object? emergencyContactName = freezed,
    Object? emergencyContactPhone = freezed,
    Object? language = null,
    Object? notificationPrefs = null,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      middleInitial: freezed == middleInitial
          ? _value.middleInitial
          : middleInitial // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      studentId: freezed == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeId: freezed == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as String?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      emailVerified: null == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      lastLoginAt: freezed == lastLoginAt
          ? _value.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
      emergencyContactName: freezed == emergencyContactName
          ? _value.emergencyContactName
          : emergencyContactName // ignore: cast_nullable_to_non_nullable
              as String?,
      emergencyContactPhone: freezed == emergencyContactPhone
          ? _value.emergencyContactPhone
          : emergencyContactPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      notificationPrefs: null == notificationPrefs
          ? _value._notificationPrefs
          : notificationPrefs // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      this.middleInitial,
      required this.role,
      this.studentId,
      this.employeeId,
      this.department,
      this.phoneNumber,
      this.photoUrl,
      this.isActive = true,
      this.emailVerified = false,
      this.lastLoginAt,
      required this.createdAt,
      required this.updatedAt,
      this.fcmToken,
      this.emergencyContactName,
      this.emergencyContactPhone,
      this.language = 'en',
      final Map<String, bool> notificationPrefs = const {}})
      : _notificationPrefs = notificationPrefs;

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  /// Unique user ID (Firebase Auth UID)
  @override
  final String id;

  /// User's email address
  @override
  final String email;

  /// User's first name
  @override
  final String firstName;

  /// User's last name
  @override
  final String lastName;

  /// User's middle initial (optional)
  @override
  final String? middleInitial;

  /// User's role in the system
  @override
  final UserRole role;

  /// Student ID (for students only)
  @override
  final String? studentId;

  /// Employee ID (for faculty/security/admin)
  @override
  final String? employeeId;

  /// Department/College
  @override
  final String? department;

  /// Phone number
  @override
  final String? phoneNumber;

  /// Profile photo URL
  @override
  final String? photoUrl;

  /// Whether user is active
  @override
  @JsonKey()
  final bool isActive;

  /// Whether email is verified
  @override
  @JsonKey()
  final bool emailVerified;

  /// Last login timestamp
  @override
  final DateTime? lastLoginAt;

  /// Account creation timestamp
  @override
  final DateTime createdAt;

  /// Last update timestamp
  @override
  final DateTime updatedAt;

  /// FCM token for push notifications
  @override
  final String? fcmToken;

  /// Emergency contact name
  @override
  final String? emergencyContactName;

  /// Emergency contact phone
  @override
  final String? emergencyContactPhone;

  /// Preferred language
  @override
  @JsonKey()
  final String language;

  /// Notification preferences
  final Map<String, bool> _notificationPrefs;

  /// Notification preferences
  @override
  @JsonKey()
  Map<String, bool> get notificationPrefs {
    if (_notificationPrefs is EqualUnmodifiableMapView)
      return _notificationPrefs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_notificationPrefs);
  }

  @override
  String toString() {
    return 'User(id: $id, email: $email, firstName: $firstName, lastName: $lastName, middleInitial: $middleInitial, role: $role, studentId: $studentId, employeeId: $employeeId, department: $department, phoneNumber: $phoneNumber, photoUrl: $photoUrl, isActive: $isActive, emailVerified: $emailVerified, lastLoginAt: $lastLoginAt, createdAt: $createdAt, updatedAt: $updatedAt, fcmToken: $fcmToken, emergencyContactName: $emergencyContactName, emergencyContactPhone: $emergencyContactPhone, language: $language, notificationPrefs: $notificationPrefs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.middleInitial, middleInitial) ||
                other.middleInitial == middleInitial) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.lastLoginAt, lastLoginAt) ||
                other.lastLoginAt == lastLoginAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            (identical(other.emergencyContactName, emergencyContactName) ||
                other.emergencyContactName == emergencyContactName) &&
            (identical(other.emergencyContactPhone, emergencyContactPhone) ||
                other.emergencyContactPhone == emergencyContactPhone) &&
            (identical(other.language, language) ||
                other.language == language) &&
            const DeepCollectionEquality()
                .equals(other._notificationPrefs, _notificationPrefs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        email,
        firstName,
        lastName,
        middleInitial,
        role,
        studentId,
        employeeId,
        department,
        phoneNumber,
        photoUrl,
        isActive,
        emailVerified,
        lastLoginAt,
        createdAt,
        updatedAt,
        fcmToken,
        emergencyContactName,
        emergencyContactPhone,
        language,
        const DeepCollectionEquality().hash(_notificationPrefs)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {required final String id,
      required final String email,
      required final String firstName,
      required final String lastName,
      final String? middleInitial,
      required final UserRole role,
      final String? studentId,
      final String? employeeId,
      final String? department,
      final String? phoneNumber,
      final String? photoUrl,
      final bool isActive,
      final bool emailVerified,
      final DateTime? lastLoginAt,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final String? fcmToken,
      final String? emergencyContactName,
      final String? emergencyContactPhone,
      final String language,
      final Map<String, bool> notificationPrefs}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override

  /// Unique user ID (Firebase Auth UID)
  String get id;
  @override

  /// User's email address
  String get email;
  @override

  /// User's first name
  String get firstName;
  @override

  /// User's last name
  String get lastName;
  @override

  /// User's middle initial (optional)
  String? get middleInitial;
  @override

  /// User's role in the system
  UserRole get role;
  @override

  /// Student ID (for students only)
  String? get studentId;
  @override

  /// Employee ID (for faculty/security/admin)
  String? get employeeId;
  @override

  /// Department/College
  String? get department;
  @override

  /// Phone number
  String? get phoneNumber;
  @override

  /// Profile photo URL
  String? get photoUrl;
  @override

  /// Whether user is active
  bool get isActive;
  @override

  /// Whether email is verified
  bool get emailVerified;
  @override

  /// Last login timestamp
  DateTime? get lastLoginAt;
  @override

  /// Account creation timestamp
  DateTime get createdAt;
  @override

  /// Last update timestamp
  DateTime get updatedAt;
  @override

  /// FCM token for push notifications
  String? get fcmToken;
  @override

  /// Emergency contact name
  String? get emergencyContactName;
  @override

  /// Emergency contact phone
  String? get emergencyContactPhone;
  @override

  /// Preferred language
  String get language;
  @override

  /// Notification preferences
  Map<String, bool> get notificationPrefs;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
