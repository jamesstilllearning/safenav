// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] as String,
  email: json['email'] as String,
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  middleInitial: json['middleInitial'] as String?,
  role: $enumDecode(_$UserRoleEnumMap, json['role']),
  studentId: json['studentId'] as String?,
  employeeId: json['employeeId'] as String?,
  department: json['department'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  photoUrl: json['photoUrl'] as String?,
  isActive: json['isActive'] as bool? ?? true,
  emailVerified: json['emailVerified'] as bool? ?? false,
  lastLoginAt: json['lastLoginAt'] == null
      ? null
      : DateTime.parse(json['lastLoginAt'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  fcmToken: json['fcmToken'] as String?,
  emergencyContactName: json['emergencyContactName'] as String?,
  emergencyContactPhone: json['emergencyContactPhone'] as String?,
  language: json['language'] as String? ?? 'en',
  notificationPrefs:
      (json['notificationPrefs'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as bool),
      ) ??
      const {},
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'middleInitial': instance.middleInitial,
  'role': _$UserRoleEnumMap[instance.role]!,
  'studentId': instance.studentId,
  'employeeId': instance.employeeId,
  'department': instance.department,
  'phoneNumber': instance.phoneNumber,
  'photoUrl': instance.photoUrl,
  'isActive': instance.isActive,
  'emailVerified': instance.emailVerified,
  'lastLoginAt': instance.lastLoginAt?.toIso8601String(),
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'fcmToken': instance.fcmToken,
  'emergencyContactName': instance.emergencyContactName,
  'emergencyContactPhone': instance.emergencyContactPhone,
  'language': instance.language,
  'notificationPrefs': instance.notificationPrefs,
};

const _$UserRoleEnumMap = {
  UserRole.student: 'student',
  UserRole.faculty: 'faculty',
  UserRole.admin: 'admin',
  UserRole.security: 'security',
};
