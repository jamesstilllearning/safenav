/// SAFENAV CAVITE - Auth Service
///
/// Handles Firebase Authentication state and user management.
library;

import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart' hide Result;
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/models/user.dart';
import '../errors/failures.dart';
import '../errors/result.dart';
import 'firestore_service.dart';

/// Auth service provider
final authServiceProvider = Provider<AuthService>((ref) => AuthService.instance);

/// Service for managing authentication
class AuthService {
  AuthService._() {
    debugPrint('[AUTH] AuthService: Constructor called, accessing FirebaseAuth.instance');
  }

  static final AuthService _instance = AuthService._();
  static AuthService get instance => _instance;

  final fb_auth.FirebaseAuth _auth = fb_auth.FirebaseAuth.instance;
  final FirestoreService _firestore = FirestoreService.instance;

  StreamSubscription<fb_auth.User?>? _authStateSubscription;
  User? _currentUser;
  bool _isInitialized = false;

  /// Current logged in user
  User? get currentUser => _currentUser;

  /// Whether user is logged in
  bool get isLoggedIn => _currentUser != null;

  /// Whether service is initialized
  bool get isInitialized => _isInitialized;

  /// Auth state changes stream (async to support Firestore profile lookup)
  Stream<User?> get authStateChanges => _auth.authStateChanges().asyncMap(_mapFirebaseUser);

  /// Initializes the auth service
  Future<Result<void>> initialize() async {
    if (_isInitialized) {
      debugPrint('[AUTH] AuthService.initialize: Already initialized, skipping');
      return const Success(null);
    }

    debugPrint('[AUTH] AuthService.initialize: Starting initialization...');
    try {
      // Listen to auth state changes
      debugPrint('[AUTH] AuthService.initialize: Setting up authStateChanges listener...');
      _authStateSubscription = _auth.authStateChanges().listen((fbUser) {
        debugPrint('[AUTH] AuthService.initialize: authStateChanges fired, user=${fbUser?.uid}');
        // Use sync version for immediate update, then async fetch will update via stream
        // Only update if not a dev mock user (dev mock users are set directly)
        if (!_isDevMockUser) {
          _currentUser = _mapFirebaseUserSync(fbUser);
        }
      });

      // Check current user
      debugPrint('[AUTH] AuthService.initialize: Checking current user...');
      final fbUser = _auth.currentUser;
      debugPrint('[AUTH] AuthService.initialize: Current user from FirebaseAuth: ${fbUser?.uid ?? "null"}');

      // Only set current user from Firebase Auth if not already set by dev mock
      if (!_isDevMockUser) {
        _currentUser = _mapFirebaseUserSync(fbUser);
        debugPrint('[AUTH] AuthService.initialize: Mapped currentUser: ${_currentUser?.id ?? "null"}');
      } else {
        debugPrint('[AUTH] AuthService.initialize: Preserving dev mock user: ${_currentUser?.id ?? "null"}');
      }

      _isInitialized = true;
      debugPrint('[AUTH] AuthService.initialize: Initialization complete, _isInitialized=true');
      return const Success(null);
    } catch (e) {
      debugPrint('[AUTH] AuthService.initialize: ERROR - $e');
      return FailureResult(AuthFailure(
        message: 'Failed to initialize auth service',
        code: 'AUTH_INIT_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Flag to track if current user is a development mock user
  /// This prevents overwriting the mock user during initialization
  bool _isDevMockUser = false;

  /// Maps Firebase User to our User model
  /// Tries to fetch the full user profile from Firestore, falls back to basic mapping
  Future<User?> _mapFirebaseUser(fb_auth.User? fbUser) async {
    if (fbUser == null) return null;

    // Try to get full profile from Firestore
    final profileResult = await _firestore.getUserProfile(fbUser.uid);
    if (profileResult.isSuccess) {
      debugPrint('[AUTH] _mapFirebaseUser: Loaded full profile from Firestore for ${fbUser.uid}');
      return profileResult.value;
    }

    debugPrint('[AUTH] _mapFirebaseUser: No Firestore profile found, using basic mapping for ${fbUser.uid}');

    // Determine role from custom claims or email
    UserRole role = UserRole.student;
    if (fbUser.email?.endsWith('@earist.edu.ph') == true) {
      // Could check custom claims for admin/faculty/security roles
      // For now, default to student
      role = UserRole.student;
    }

    final displayName = fbUser.displayName?.trim() ?? '';
    final nameParts = displayName.isNotEmpty ? displayName.split(' ') : ['User'];
    return User(
      id: fbUser.uid,
      email: fbUser.email ?? '',
      firstName: nameParts.first,
      lastName: nameParts.length > 1 ? nameParts.skip(1).join(' ') : '',
      role: role,
      emailVerified: fbUser.emailVerified,
      photoUrl: fbUser.photoURL,
      createdAt: fbUser.metadata.creationTime ?? DateTime.now(),
      updatedAt: fbUser.metadata.lastSignInTime ?? DateTime.now(),
    );
  }

  /// Synchronous version of _mapFirebaseUser for immediate use (e.g., during init)
  /// Falls back to basic mapping without Firestore lookup
  User? _mapFirebaseUserSync(fb_auth.User? fbUser) {
    if (fbUser == null) return null;

    // Determine role from custom claims or email
    UserRole role = UserRole.student;
    if (fbUser.email?.endsWith('@earist.edu.ph') == true) {
      // Could check custom claims for admin/faculty/security roles
      // For now, default to student
      role = UserRole.student;
    }

    final displayName = fbUser.displayName?.trim() ?? '';
    final nameParts = displayName.isNotEmpty ? displayName.split(' ') : ['User'];
    return User(
      id: fbUser.uid,
      email: fbUser.email ?? '',
      firstName: nameParts.first,
      lastName: nameParts.length > 1 ? nameParts.skip(1).join(' ') : '',
      role: role,
      emailVerified: fbUser.emailVerified,
      photoUrl: fbUser.photoURL,
      createdAt: fbUser.metadata.creationTime ?? DateTime.now(),
      updatedAt: fbUser.metadata.lastSignInTime ?? DateTime.now(),
    );
  }

  /// Signs in with email and password
  Future<Result<User>> signInWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = await _mapFirebaseUser(credential.user);
      if (user == null) {
        return FailureResult(AuthFailure(
          message: 'Failed to create user model',
          code: 'USER_MAPPING_FAILED',
        ));
      }

      _currentUser = user;
      return Success(user);
    } on fb_auth.FirebaseAuthException catch (e) {
      return FailureResult(AuthFailure(
        message: _getAuthErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      return FailureResult(AuthFailure(
        message: 'Sign in failed',
        code: 'SIGN_IN_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Registers a new user with email and password
  Future<Result<User>> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    String? middleInitial,
    required UserRole role,
    String? studentId,
    String? employeeId,
    String? department,
    String? phoneNumber,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Update display name
      await credential.user?.updateDisplayName('$firstName $lastName');

      final user = User(
        id: credential.user!.uid,
        email: email,
        firstName: firstName,
        lastName: lastName,
        middleInitial: middleInitial,
        role: role,
        studentId: studentId,
        employeeId: employeeId,
        department: department,
        phoneNumber: phoneNumber,
        emailVerified: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      // Save user profile to Firestore
      debugPrint('[AUTH] registerWithEmailAndPassword: Saving user profile to Firestore...');
      final firestoreResult = await _firestore.createUserProfile(user);
      if (firestoreResult.isFailure) {
        debugPrint('[AUTH] registerWithEmailAndPassword: Failed to save profile to Firestore: ${firestoreResult.failure}');
        // Don't fail registration if Firestore save fails - user can still sign in
        // The profile can be created later or on next sign in
      } else {
        debugPrint('[AUTH] registerWithEmailAndPassword: Successfully saved profile to Firestore');
      }

      _currentUser = user;
      return Success(user);
    } on fb_auth.FirebaseAuthException catch (e) {
      return FailureResult(AuthFailure(
        message: _getAuthErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      return FailureResult(AuthFailure(
        message: 'Registration failed',
        code: 'REGISTRATION_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Sends password reset email
  Future<Result<void>> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return const Success(null);
    } on fb_auth.FirebaseAuthException catch (e) {
      return FailureResult(AuthFailure(
        message: _getAuthErrorMessage(e.code),
        code: e.code,
      ));
    } catch (e) {
      return FailureResult(AuthFailure(
        message: 'Failed to send password reset email',
        code: 'PASSWORD_RESET_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Sends email verification
  Future<Result<void>> sendEmailVerification() async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        return FailureResult(AuthFailure(
          message: 'No user logged in',
          code: 'NO_USER',
        ));
      }
      await user.sendEmailVerification();
      return const Success(null);
    } on fb_auth.FirebaseAuthException catch (e) {
      return FailureResult(AuthFailure(
        message: _getAuthErrorMessage(e.code),
        code: e.code,
      ));
    } catch (e) {
      return FailureResult(AuthFailure(
        message: 'Failed to send email verification',
        code: 'EMAIL_VERIFICATION_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Updates user profile
  Future<Result<User>> updateProfile({
    String? displayName,
    String? photoUrl,
  }) async {
    try {
      final fbUser = _auth.currentUser;
      if (fbUser == null) {
        return FailureResult(AuthFailure(
          message: 'No user logged in',
          code: 'NO_USER',
        ));
      }

      if (displayName != null) {
        await fbUser.updateDisplayName(displayName);
      }
      if (photoUrl != null) {
        await fbUser.updatePhotoURL(photoUrl);
      }

      await fbUser.reload();
      final updatedUser = await _mapFirebaseUser(_auth.currentUser);
      if (updatedUser == null) {
        return FailureResult(AuthFailure(
          message: 'Failed to update profile',
          code: 'PROFILE_UPDATE_FAILED',
        ));
      }

      // Update Firestore profile
      debugPrint('[AUTH] updateProfile: Updating user profile in Firestore...');
      final firestoreResult = await _firestore.updateUserProfile(updatedUser);
      if (firestoreResult.isFailure) {
        debugPrint('[AUTH] updateProfile: Failed to update profile in Firestore: ${firestoreResult.failure}');
        // Don't fail if Firestore update fails
      } else {
        debugPrint('[AUTH] updateProfile: Successfully updated profile in Firestore');
      }

      _currentUser = updatedUser;
      return Success(updatedUser);
    } on fb_auth.FirebaseAuthException catch (e) {
      return FailureResult(AuthFailure(
        message: _getAuthErrorMessage(e.code),
        code: e.code,
      ));
    } catch (e) {
      return FailureResult(AuthFailure(
        message: 'Profile update failed',
        code: 'PROFILE_UPDATE_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Signs out the current user
  Future<Result<void>> signOut() async {
    try {
      await _auth.signOut();
      _currentUser = null;
      return const Success(null);
    } catch (e) {
      return FailureResult(AuthFailure(
        message: 'Sign out failed',
        code: 'SIGN_OUT_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Deletes the current user account
  Future<Result<void>> deleteAccount() async {
    try {
      final fbUser = _auth.currentUser;
      if (fbUser == null) {
        return FailureResult(AuthFailure(
          message: 'No user logged in',
          code: 'NO_USER',
        ));
      }

      await fbUser.delete();
      _currentUser = null;
      return const Success(null);
    } on fb_auth.FirebaseAuthException catch (e) {
      return FailureResult(AuthFailure(
        message: _getAuthErrorMessage(e.code),
        code: e.code,
      ));
    } catch (e) {
      return FailureResult(AuthFailure(
        message: 'Account deletion failed',
        code: 'DELETE_ACCOUNT_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Reauthenticates user with password (for sensitive operations)
  Future<Result<void>> reauthenticateWithPassword(String password) async {
    try {
      final fbUser = _auth.currentUser;
      if (fbUser == null || fbUser.email == null) {
        return FailureResult(AuthFailure(
          message: 'No user logged in',
          code: 'NO_USER',
        ));
      }

      final credential = fb_auth.EmailAuthProvider.credential(
        email: fbUser.email!,
        password: password,
      );
      await fbUser.reauthenticateWithCredential(credential);
      return const Success(null);
    } on fb_auth.FirebaseAuthException catch (e) {
      return FailureResult(AuthFailure(
        message: _getAuthErrorMessage(e.code),
        code: e.code,
      ));
    } catch (e) {
      return FailureResult(AuthFailure(
        message: 'Reauthentication failed',
        code: 'REAUTH_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Updates user password
  Future<Result<void>> updatePassword(String newPassword) async {
    try {
      final fbUser = _auth.currentUser;
      if (fbUser == null) {
        return FailureResult(AuthFailure(
          message: 'No user logged in',
          code: 'NO_USER',
        ));
      }

      await fbUser.updatePassword(newPassword);
      return const Success(null);
    } on fb_auth.FirebaseAuthException catch (e) {
      return FailureResult(AuthFailure(
        message: _getAuthErrorMessage(e.code),
        code: e.code,
      ));
    } catch (e) {
      return FailureResult(AuthFailure(
        message: 'Password update failed',
        code: 'PASSWORD_UPDATE_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Gets ID token for API calls
  Future<Result<String>> getIdToken({bool forceRefresh = false}) async {
    try {
      final fbUser = _auth.currentUser;
      if (fbUser == null) {
        return FailureResult(AuthFailure(
          message: 'No user logged in',
          code: 'NO_USER',
        ));
      }

      final token = await fbUser.getIdToken(forceRefresh);
      if (token == null) {
        return FailureResult(AuthFailure(
          message: 'Failed to get ID token',
          code: 'GET_TOKEN_FAILED',
        ));
      }
      return Success(token);
    } catch (e) {
      return FailureResult(AuthFailure(
        message: 'Failed to get ID token',
        code: 'GET_TOKEN_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Sets custom user claims (admin only - requires Firebase Admin SDK)
  /// This is a placeholder - actual implementation requires backend
  Future<Result<void>> setCustomClaims(String uid, Map<String, dynamic> claims) async {
    // This would be implemented via Cloud Functions or Admin SDK
    // For now, return success as placeholder
    return const Success(null);
  }

  /// Sets a user's role via Cloud Function (admin only)
  /// Updates both custom claims and Firestore profile
  Future<Result<void>> setUserRole(String targetUid, UserRole newRole) async {
    try {
      debugPrint('[AUTH] setUserRole: Setting role for $targetUid to ${newRole.name}');

      final functions = FirebaseFunctions.instance;
      final callable = functions.httpsCallable('setUserRole');

      final result = await callable.call({
        'targetUid': targetUid,
        'newRole': newRole.name,
      });

      final data = result.data as Map<String, dynamic>;
      if (data['success'] == true) {
        debugPrint('[AUTH] setUserRole: Successfully set role for $targetUid to ${newRole.name}');
        return const Success(null);
      } else {
        debugPrint('[AUTH] setUserRole: Failed - ${data['message']}');
        return FailureResult(AuthFailure(
          message: data['message'] ?? 'Failed to set user role',
          code: 'SET_ROLE_FAILED',
        ));
      }
    } on FirebaseFunctionsException catch (e) {
      debugPrint('[AUTH] setUserRole: FirebaseFunctionsException - ${e.code}: ${e.message}');
      return FailureResult(AuthFailure(
        message: _getFunctionsErrorMessage(e.code),
        code: e.code,
        details: {'originalCode': e.code},
      ));
    } catch (e) {
      debugPrint('[AUTH] setUserRole: ERROR - $e');
      return FailureResult(AuthFailure(
        message: 'Failed to set user role',
        code: 'SET_ROLE_FAILED',
        details: {'error': e.toString()},
      ));
    }
  }

  /// Maps Firebase Functions error codes to user-friendly messages
  String _getFunctionsErrorMessage(String code) {
    switch (code) {
      case 'unauthenticated':
        return 'Authentication required. Please sign in as an admin.';
      case 'permission-denied':
        return 'Admin role required to change user roles.';
      case 'invalid-argument':
        return 'Invalid input. Please check the user ID and role.';
      case 'not-found':
        return 'Target user not found.';
      case 'failed-precondition':
        return 'Cannot perform this operation (e.g., cannot remove own admin role).';
      case 'internal':
      default:
        return 'Server error. Please try again later.';
    }
  }

  /// Disposes resources
  Future<void> dispose() async {
    await _authStateSubscription?.cancel();
    _authStateSubscription = null;
    _currentUser = null;
    _isInitialized = false;
  }

  /// Maps Firebase Auth error codes to user-friendly messages
  String _getAuthErrorMessage(String code) {
    switch (code) {
      case 'invalid-email':
        return 'The email address is invalid';
      case 'user-disabled':
        return 'This account has been disabled';
      case 'user-not-found':
        return 'No account found with this email';
      case 'wrong-password':
        return 'Incorrect password';
      case 'email-already-in-use':
        return 'An account already exists with this email';
      case 'weak-password':
        return 'Password is too weak (minimum 6 characters)';
      case 'operation-not-allowed':
        return 'This operation is not allowed';
      case 'too-many-requests':
        return 'Too many attempts. Please try again later';
      case 'network-request-failed':
        return 'Network error. Please check your connection';
      case 'requires-recent-login':
        return 'Please log in again to continue';
      case 'credential-already-in-use':
        return 'This credential is already linked to another account';
      case 'invalid-credential':
        return 'Invalid credentials';
      case 'account-exists-with-different-credential':
        return 'Account exists with different sign-in method';
      default:
        return 'Authentication error: $code';
    }
  }

  // ===========================================================================
  // DEVELOPMENT-ONLY METHODS
  // ===========================================================================
  // These methods are ONLY available in debug mode and should NEVER be called
  // in production. They are guarded by kReleaseMode checks.

  /// Sets a mock user for development testing
  /// This method is ONLY available in debug mode and does nothing in release builds
  ///
  /// Usage (in debug mode only):
  /// ```dart
  /// await AuthService.instance.setMockUserForDev(
  ///   id: 'dev-user-001',
  ///   email: 'dev@earist.edu.ph',
  ///   firstName: 'Dev',
  ///   lastName: 'User',
  ///   role: UserRole.student,
  ///   studentId: '2024-DEV001',
  /// );
  /// ```
  Future<void> setMockUserForDev({
    required String id,
    required String email,
    required String firstName,
    required String lastName,
    required UserRole role,
    String? middleInitial,
    String? studentId,
    String? employeeId,
    String? department,
    String? phoneNumber,
  }) async {
    // This method does NOTHING in release builds
    if (kReleaseMode) {
      debugPrint('[AUTH] setMockUserForDev: IGNORED - Not available in release mode');
      return;
    }

    debugPrint('[AUTH] setMockUserForDev: Creating mock user for development...');

    final user = User(
      id: id,
      email: email,
      firstName: firstName,
      lastName: lastName,
      middleInitial: middleInitial,
      role: role,
      studentId: studentId,
      employeeId: employeeId,
      department: department,
      phoneNumber: phoneNumber,
      emailVerified: true, // Skip email verification in dev
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    _currentUser = user;
    _isDevMockUser = true;
    debugPrint('[AUTH] setMockUserForDev: Mock user set - ${user.displayName} (${user.role.displayName})');
  }

  /// Clears the mock user (for development testing)
  /// Only available in debug mode
  Future<void> clearMockUserForDev() async {
    if (kReleaseMode) {
      debugPrint('[AUTH] clearMockUserForDev: IGNORED - Not available in release mode');
      return;
    }

    debugPrint('[AUTH] clearMockUserForDev: Clearing mock user');
    _currentUser = null;
    _isDevMockUser = false;
  }
}