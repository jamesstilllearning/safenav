/// SAFENAV CAVITE - Development Configuration
///
/// Development-only configuration flags and constants.
///
/// ⚠️ IMPORTANT: This file contains DEVELOPMENT-ONLY features.
/// These features are AUTOMATICALLY DISABLED in release/production builds
/// via the `kReleaseMode` check.
///
/// DO NOT commit sensitive data or enable features that should not be
/// available in production.
///
/// To ENABLE development authentication bypass:
/// 1. Set `DevConfig.enableAuthBypass = true` (only works in debug mode)
/// 2. Run the app in debug mode (flutter run --debug or from IDE)
///
/// To DISABLE development authentication bypass:
/// 1. Set `DevConfig.enableAuthBypass = false`
/// 2. Or simply run in release mode (flutter run --release)
///
/// In production builds (--release), this bypass is COMPILED OUT and
/// cannot be enabled regardless of the flag value.
library;

import 'package:flutter/foundation.dart';

/// Development configuration flags
/// All flags are automatically disabled in release builds
class DevConfig {
  DevConfig._();

  // ===========================================================================
  // Development Authentication Bypass
  // ===========================================================================

  /// Enable authentication bypass for local development
  ///
  /// When TRUE (and in debug mode):
  /// - Unauthenticated users are redirected to the main dashboard instead of /login
  /// - A mock user with 'student' role is created for testing
  /// - Login/Register screens are still accessible if navigated to directly
  /// - Role-based authorization (admin routes) still applies
  ///
  /// When FALSE or in release mode:
  /// - Normal authentication flow applies
  /// - Users must log in to access protected routes
  ///
  /// ⚠️ CANNOT BE ENABLED IN PRODUCTION - guarded by kReleaseMode check
  static const bool enableAuthBypass = true;

  /// Mock user ID for development bypass
  static const String mockUserId = 'dev-user-001';

  /// Mock user email for development bypass
  static const String mockUserEmail = 'dev@earist.edu.ph';

  /// Mock user role for development bypass
  /// Change to test different roles: UserRole.student, UserRole.faculty, UserRole.security
  /// Note: UserRole.admin is NOT set by default to maintain admin restrictions
  /// To test admin features, temporarily change this to UserRole.admin
  static const String mockUserRole = 'student'; // 'student', 'faculty', 'security'

  /// Mock user first name
  static const String mockUserFirstName = 'Dev';

  /// Mock user last name
  static const String mockUserLastName = 'User';

  /// Mock student ID (for student role)
  static const String mockStudentId = '2024-DEV001';

  /// Mock employee ID (for faculty/security role)
  static const String mockEmployeeId = 'EMP-DEV001';

  /// Mock department (for faculty/security role)
  static const String mockDepartment = 'College of Engineering';

  /// Mock phone number
  static const String mockPhoneNumber = '09123456789';

  // ===========================================================================
  // Development Feature Flags
  // ===========================================================================

  /// Enable debug logging throughout the app
  static const bool enableDebugLogging = true;

  /// Enable mock location data for testing
  static const bool enableMockLocation = true;

  /// Skip email verification in development
  static const bool skipEmailVerification = true;

  /// Enable test shortcuts (e.g., long-press to navigate)
  static const bool enableTestShortcuts = false;

  // ===========================================================================
  // Compile-time Checks
  // ===========================================================================

  /// Returns true if running in debug mode AND auth bypass is enabled
  /// This is the single source of truth for whether the bypass is active
  static bool get isAuthBypassActive {
    if (kReleaseMode) {
      return false; // NEVER active in release builds
    }
    return enableAuthBypass;
  }

  /// Returns true if running in debug mode
  static bool get isDebugMode => !kReleaseMode;

  /// Returns true if running in profile mode
  static bool get isProfileMode => kProfileMode;

  /// Returns true if running in release mode
  static bool get isReleaseMode => kReleaseMode;
}

/// Development user data for bypass
/// This is used to create a mock User object when auth bypass is active
class DevUserData {
  DevUserData._();

  static const String id = DevConfig.mockUserId;
  static const String email = DevConfig.mockUserEmail;
  static const String role = DevConfig.mockUserRole;
  static const String firstName = DevConfig.mockUserFirstName;
  static const String lastName = DevConfig.mockUserLastName;
  static const String studentId = DevConfig.mockStudentId;
  static const String employeeId = DevConfig.mockEmployeeId;
  static const String department = DevConfig.mockDepartment;
  static const String phoneNumber = DevConfig.mockPhoneNumber;
}