/// SAFENAV CAVITE - Auth State
///
/// Riverpod state management for authentication flow.
library;

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../shared/models/user.dart';
import '../../core/errors/failures.dart';
import '../../core/errors/result.dart';
import '../../core/services/auth_service.dart';

part 'auth_state.freezed.dart';

/// Authentication status
@freezed
abstract class AuthStatus with _$AuthStatus {
  const factory AuthStatus.initial() = _Initial;
  const factory AuthStatus.authenticated(User user) = _Authenticated;
  const factory AuthStatus.unauthenticated() = _Unauthenticated;
  const factory AuthStatus.authenticating() = _Authenticating;
  const factory AuthStatus.registering() = _Registering;
  const factory AuthStatus.sendingReset() = _SendingReset;
  const factory AuthStatus.verifyingEmail() = _VerifyingEmail;
  const factory AuthStatus.error(Failure failure) = _Error;
}

/// Extension getters for AuthStatus
extension AuthStatusX on AuthStatus {
  bool get isAuthenticated => this is _Authenticated;
  User? get currentUser => this is _Authenticated ? (this as _Authenticated).user : null;

  /// Whether the auth state is in the initial state (not yet initialized)
  bool get isInitial => this is _Initial;

  /// Whether the auth state is in a transitional loading state
  bool get isLoading => this is _Authenticating ||
      this is _Registering ||
      this is _SendingReset ||
      this is _VerifyingEmail;

  /// Whether the auth state is an error state
  bool get isError => this is _Error;

  /// Whether the auth state is unauthenticated (explicitly not logged in)
  bool get isUnauthenticated => this is _Unauthenticated;

  /// Gets the error failure if in error state
  Failure? get error => this is _Error ? (this as _Error).failure : null;
}

/// Authentication state notifier
class AuthNotifier extends StateNotifier<AuthStatus> {
  AuthNotifier(this._authService) : super(const AuthStatus.initial()) {
    debugPrint('[AUTH] AuthNotifier: Constructor called, starting _init()...');
    _init();
  }

  final AuthService _authService;

  Future<void> _init() async {
    debugPrint('[AUTH] AuthNotifier._init: Calling _authService.initialize()...');
    final initResult = await _authService.initialize();
    debugPrint('[AUTH] AuthNotifier._init: _authService.initialize() returned: ${initResult.isSuccess ? "Success" : "Failure"}');
    if (initResult.isFailure) {
      debugPrint('[AUTH] AuthNotifier._init: Initialization failed: ${initResult.failure}');
      state = AuthStatus.error(initResult.failure);
      return;
    }

    debugPrint('[AUTH] AuthNotifier._init: Checking auth state - isLoggedIn=${_authService.isLoggedIn}, currentUser=${_authService.currentUser?.id}');
    if (_authService.isLoggedIn && _authService.currentUser != null) {
      debugPrint('[AUTH] AuthNotifier._init: User is logged in, setting authenticated state');
      state = AuthStatus.authenticated(_authService.currentUser!);
    } else {
      debugPrint('[AUTH] AuthNotifier._init: User not logged in, setting unauthenticated state');
      state = const AuthStatus.unauthenticated();
    }
  }

  /// Sign in with email and password
  Future<Result<User>> signIn(String email, String password) async {
    state = const AuthStatus.authenticating();

    final result = await _authService.signInWithEmailAndPassword(email, password);

    if (result.isSuccess) {
      state = AuthStatus.authenticated(result.value);
    } else {
      state = AuthStatus.error(result.failure);
      // Revert to unauthenticated after error
      Future.delayed(const Duration(seconds: 2), () {
        if (state is _Error) {
          state = const AuthStatus.unauthenticated();
        }
      });
    }

    return result;
  }

  /// Register new user
  Future<Result<User>> register({
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
    state = const AuthStatus.registering();

    final result = await _authService.registerWithEmailAndPassword(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
      middleInitial: middleInitial,
      role: role,
      studentId: studentId,
      employeeId: employeeId,
      department: department,
      phoneNumber: phoneNumber,
    );

    if (result.isSuccess) {
      state = AuthStatus.authenticated(result.value);
    } else {
      state = AuthStatus.error(result.failure);
      Future.delayed(const Duration(seconds: 2), () {
        if (state is _Error) {
          state = const AuthStatus.unauthenticated();
        }
      });
    }

    return result;
  }

  /// Send password reset email
  Future<Result<void>> sendPasswordReset(String email) async {
    state = const AuthStatus.sendingReset();

    final result = await _authService.sendPasswordResetEmail(email);

    if (result.isFailure) {
      state = AuthStatus.error(result.failure);
      Future.delayed(const Duration(seconds: 2), () {
        if (state is _Error) {
          state = const AuthStatus.unauthenticated();
        }
      });
    } else {
      state = const AuthStatus.unauthenticated();
    }

    return result;
  }

  /// Send email verification
  Future<Result<void>> sendEmailVerification() async {
    state = const AuthStatus.verifyingEmail();

    final result = await _authService.sendEmailVerification();

    if (result.isFailure) {
      state = AuthStatus.error(result.failure);
    } else {
      state = const AuthStatus.unauthenticated();
    }

    return result;
  }

  /// Sign out
  Future<Result<void>> signOut() async {
    final result = await _authService.signOut();

    if (result.isSuccess) {
      state = const AuthStatus.unauthenticated();
    } else {
      state = AuthStatus.error(result.failure);
    }

    return result;
  }

  /// Update current user in state
  void updateUser(User user) {
    if (state is _Authenticated) {
      state = AuthStatus.authenticated(user);
    }
  }

  /// Check if currently authenticated
  bool get isAuthenticated => state is _Authenticated;

  /// Get current user if authenticated
  User? get currentUser => state is _Authenticated ? (state as _Authenticated).user : null;
}

/// Auth notifier provider
final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthStatus>((ref) {
  final authService = ref.watch(authServiceProvider);
  return AuthNotifier(authService);
});

/// Convenience providers
final isAuthenticatedProvider = Provider<bool>((ref) {
  return ref.watch(authNotifierProvider).isAuthenticated;
});

final currentUserProvider = Provider<User?>((ref) {
  return ref.watch(authNotifierProvider).currentUser;
});

final authStatusProvider = Provider<AuthStatus>((ref) {
  return ref.watch(authNotifierProvider);
});