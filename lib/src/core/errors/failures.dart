/// SAFENAV CAVITE - Error Handling
///
/// Defines failure types for functional error handling using the Either pattern.
/// All failures extend the base [Failure] class and provide structured error information.
library;

import 'dart:async';

import 'package:equatable/equatable.dart';

/// Base failure class for all application errors
abstract class Failure extends Equatable {
  const Failure({
    required this.message,
    this.code,
    this.details,
  });

  final String message;
  final String? code;
  final Map<String, dynamic>? details;

  @override
  List<Object?> get props => [message, code, details];

  @override
  String toString() => '$runtimeType: $message${code != null ? ' (Code: $code)' : ''}';
}

/// Server-side failures (Firebase, API, etc.)
class ServerFailure extends Failure {
  const ServerFailure({
    required super.message,
    super.code,
    super.details,
  });
}

/// Cache/local storage failures
class CacheFailure extends Failure {
  const CacheFailure({
    required super.message,
    super.code,
    super.details,
  });
}

/// Network connectivity failures
class NetworkFailure extends Failure {
  const NetworkFailure({
    required super.message,
    super.code,
    super.details,
  });
}

/// Authentication failures
class AuthFailure extends Failure {
  const AuthFailure({
    required super.message,
    super.code,
    super.details,
  });
}

/// Permission denied failures
class PermissionFailure extends Failure {
  const PermissionFailure({
    required super.message,
    super.code,
    super.details,
  });
}

/// Location/GPS failures
class LocationFailure extends Failure {
  const LocationFailure({
    required super.message,
    super.code,
    super.details,
  });
}

/// Map/routing failures
class MapFailure extends Failure {
  const MapFailure({
    required super.message,
    super.code,
    super.details,
  });
}

/// Emergency system failures
class EmergencyFailure extends Failure {
  const EmergencyFailure({
    required super.message,
    super.code,
    super.details,
  });
}

/// Validation failures
class ValidationFailure extends Failure {
  const ValidationFailure({
    required super.message,
    super.code,
    super.details,
  });
}

/// Not found failures
class NotFoundFailure extends Failure {
  const NotFoundFailure({
    required super.message,
    super.code,
    super.details,
  });
}

/// Firestore/database failures
class FirestoreFailure extends Failure {
  const FirestoreFailure({
    required super.message,
    super.code,
    super.details,
  });
}

/// Timeout failures
class TimeoutFailure extends Failure {
  const TimeoutFailure({
    required super.message,
    super.code,
    super.details,
  });
}

/// Unknown/unexpected failures
class UnknownFailure extends Failure {
  const UnknownFailure({
    required super.message,
    super.code,
    super.details,
  });
}

/// Extension for converting exceptions to failures
extension ExceptionToFailure on Exception {
  Failure toFailure() {
    if (this is FirebaseException) {
      return _mapFirebaseException(this as FirebaseException);
    }
    if (this is FormatException) {
      return const ValidationFailure(
        message: 'Invalid data format.',
        code: 'INVALID_FORMAT',
      );
    }
    if (this is TimeoutException) {
      return const TimeoutFailure(
        message: 'Operation timed out. Please try again.',
        code: 'TIMEOUT',
      );
    }
    return UnknownFailure(
      message: toString(),
      code: 'UNKNOWN_ERROR',
    );
  }

  Failure _mapFirebaseException(FirebaseException e) {
    switch (e.code) {
      // Auth errors
      case 'email-already-in-use':
        return const AuthFailure(
          message: 'An account with this email already exists.',
          code: 'EMAIL_ALREADY_IN_USE',
        );
      case 'invalid-email':
        return const AuthFailure(
          message: 'Invalid email address.',
          code: 'INVALID_EMAIL',
        );
      case 'user-disabled':
        return const AuthFailure(
          message: 'This account has been disabled.',
          code: 'USER_DISABLED',
        );
      case 'user-not-found':
        return const AuthFailure(
          message: 'No account found with this email.',
          code: 'USER_NOT_FOUND',
        );
      case 'wrong-password':
        return const AuthFailure(
          message: 'Incorrect password.',
          code: 'WRONG_PASSWORD',
        );
      case 'too-many-requests':
        return const AuthFailure(
          message: 'Too many attempts. Please try again later.',
          code: 'TOO_MANY_REQUESTS',
        );
      case 'operation-not-allowed':
        return const AuthFailure(
          message: 'This sign-in method is not enabled.',
          code: 'OPERATION_NOT_ALLOWED',
        );
      case 'account-exists-with-different-credential':
        return const AuthFailure(
          message: 'An account already exists with different credentials.',
          code: 'ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL',
        );
      case 'invalid-credential':
        return const AuthFailure(
          message: 'Invalid credentials provided.',
          code: 'INVALID_CREDENTIAL',
        );
      case 'network-request-failed':
        return const NetworkFailure(
          message: 'Network error. Please check your connection.',
          code: 'NETWORK_REQUEST_FAILED',
        );

      // Firestore errors
      case 'permission-denied':
        return const PermissionFailure(
          message: 'You do not have permission to perform this action.',
          code: 'PERMISSION_DENIED',
        );
      case 'not-found':
        return const NotFoundFailure(
          message: 'The requested resource was not found.',
          code: 'NOT_FOUND',
        );
      case 'already-exists':
        return const ValidationFailure(
          message: 'This resource already exists.',
          code: 'ALREADY_EXISTS',
        );
      case 'unavailable':
        return const ServerFailure(
          message: 'Service temporarily unavailable. Please try again.',
          code: 'SERVICE_UNAVAILABLE',
        );
      case 'deadline-exceeded':
        return const TimeoutFailure(
          message: 'Operation timed out. Please try again.',
          code: 'DEADLINE_EXCEEDED',
        );
      default:
        return ServerFailure(
          message: e.message ?? 'A server error occurred.',
          code: e.code,
          details: {'plugin': e.plugin},
        );
    }
  }
}

/// Firebase exception placeholder (actual import from firebase_core)
class FirebaseException implements Exception {
  final String code;
  final String? message;
  final String? plugin;

  const FirebaseException({
    required this.code,
    this.message,
    this.plugin,
  });

  @override
  String toString() => 'FirebaseException(code: $code, message: $message)';
}