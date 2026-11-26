/// SAFENAV CAVITE - User Model
///
/// User data model with role-based access control.
library;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// User roles in the system
enum UserRole {
  /// Student user
  @JsonValue('student')
  student,

  /// Faculty/staff user
  @JsonValue('faculty')
  faculty,

  /// Administrator user
  @JsonValue('admin')
  admin,

  /// Security personnel user
  @JsonValue('security')
  security;

  /// Display name for the role
  String get displayName {
    switch (this) {
      case UserRole.student:
        return 'Student';
      case UserRole.faculty:
        return 'Faculty';
      case UserRole.admin:
        return 'Administrator';
      case UserRole.security:
        return 'Security Personnel';
    }
  }

  /// Checks if role has admin privileges
  bool get isAdmin => this == UserRole.admin;

  /// Checks if role is security or admin
  bool get isSecurityOrAdmin => this == UserRole.security || this == UserRole.admin;
}

/// User model representing an app user
@freezed
abstract class User with _$User {
  const factory User({
    /// Unique user ID (Firebase Auth UID)
    required String id,

    /// User's email address
    required String email,

    /// User's first name
    required String firstName,

    /// User's last name
    required String lastName,

    /// User's middle initial (optional)
    String? middleInitial,

    /// User's role in the system
    required UserRole role,

    /// Student ID (for students only)
    String? studentId,

    /// Employee ID (for faculty/security/admin)
    String? employeeId,

    /// Department/College
    String? department,

    /// Phone number
    String? phoneNumber,

    /// Profile photo URL
    String? photoUrl,

    /// Whether user is active
    @Default(true) bool isActive,

    /// Whether email is verified
    @Default(false) bool emailVerified,

    /// Last login timestamp
    DateTime? lastLoginAt,

    /// Account creation timestamp
    required DateTime createdAt,

    /// Last update timestamp
    required DateTime updatedAt,

    /// FCM token for push notifications
    String? fcmToken,

    /// Emergency contact name
    String? emergencyContactName,

    /// Emergency contact phone
    String? emergencyContactPhone,

    /// Preferred language
    @Default('en') String language,

    /// Notification preferences
    @Default({}) Map<String, bool> notificationPrefs,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

extension UserExtensions on User {
  /// Full display name
  String get displayName {
    final parts = <String>[firstName.trim()];
    if (middleInitial != null && middleInitial!.isNotEmpty) {
      parts.add('${middleInitial!.trim()}.');
    }
    parts.add(lastName.trim());
    return parts.join(' ');
  }

  /// Short display name (first name + last initial)
  String get shortName {
    return '${firstName.trim()} ${lastName.trim().isNotEmpty ? lastName.trim()[0].toUpperCase() : ''}';
  }

  /// Checks if user is a student
  bool get isStudent => role == UserRole.student;

  /// Checks if user is faculty
  bool get isFaculty => role == UserRole.faculty;

  /// Checks if user is admin
  bool get isAdmin => role.isAdmin;

  /// Checks if user is security
  bool get isSecurity => role == UserRole.security;

  /// Checks if user can access admin features
  bool get canAccessAdmin => role.isSecurityOrAdmin;

  /// Gets the appropriate ID number for display
  String? get idNumber => isStudent ? studentId : employeeId;

  /// Creates a copy with updated last login
  User withLastLogin(DateTime timestamp) {
    return copyWith(lastLoginAt: timestamp, updatedAt: timestamp);
  }

  /// Creates a copy with updated FCM token
  User withFcmToken(String token) {
    return copyWith(fcmToken: token, updatedAt: DateTime.now());
  }
}