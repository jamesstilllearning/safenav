/// SAFENAV CAVITE - Result Type
///
/// Functional error handling using Result/Either pattern.
/// Provides type-safe success/failure handling without exceptions.
library;

import 'failures.dart';

/// Represents either a success value [T] or a [Failure]
sealed class Result<T> {
  const Result();

  /// Returns true if this is a success result
  bool get isSuccess => this is Success<T>;

  /// Returns true if this is a failure result
  bool get isFailure => this is FailureResult<T>;

  /// Gets the success value, throws if failure
  T get value {
    if (this is Success<T>) {
      return (this as Success<T>).value;
    }
    throw StateError('Cannot get value from failure result');
  }

  /// Gets the failure, throws if success
  Failure get failure {
    if (this is FailureResult<T>) {
      return (this as FailureResult<T>).failure;
    }
    throw StateError('Cannot get failure from success result');
  }

  /// Maps success value with a function, propagates failure
  Result<R> map<R>(R Function(T) transform) {
    if (this is Success<T>) {
      return Success(transform((this as Success<T>).value));
    }
    return this as FailureResult<R>;
  }

  /// Flat maps success value with a function returning Result, propagates failure
  Result<R> flatMap<R>(Result<R> Function(T) transform) {
    if (this is Success<T>) {
      return transform((this as Success<T>).value);
    }
    return this as FailureResult<R>;
  }

  /// Handles both success and failure cases
  R fold<R>(R Function(Failure) onFailure, R Function(T) onSuccess) {
    if (this is Success<T>) {
      return onSuccess((this as Success<T>).value);
    }
    return onFailure((this as FailureResult<T>).failure);
  }

  /// Executes action on success, returns original result
  Result<T> onSuccess(void Function(T) action) {
    if (this is Success<T>) {
      action((this as Success<T>).value);
    }
    return this;
  }

  /// Executes action on failure, returns original result
  Result<T> onFailure(void Function(Failure) action) {
    if (this is FailureResult<T>) {
      action((this as FailureResult<T>).failure);
    }
    return this;
  }
}

/// Success result containing a value
class Success<T> extends Result<T> {
  const Success(this.value);

  @override
  final T value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Success<T> && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Success($value)';
}

/// Failure result containing a failure
class FailureResult<T> extends Result<T> {
  const FailureResult(this.failure);

  @override
  final Failure failure;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FailureResult<T> && other.failure == failure;

  @override
  int get hashCode => failure.hashCode;

  @override
  String toString() => 'Failure($failure)';
}

/// Extension for creating results easily
extension ResultExtensions<T> on T {
  Result<T> toSuccess() => Success(this);
}

extension FailureExtensions on Failure {
  Result<T> toFailure<T>() => FailureResult<T>(this);
}

/// Async result for Future-based operations
typedef AsyncResult<T> = Future<Result<T>>;

/// Extension for async result handling
extension AsyncResultExtensions<T> on Future<Result<T>> {
  /// Maps the success value asynchronously
  Future<Result<R>> mapAsync<R>(Future<R> Function(T) transform) async {
    final result = await this;
    if (result.isSuccess) {
      final transformed = await transform(result.value);
      return Success(transformed);
    }
    return result as FailureResult<R>;
  }

  /// Flat maps the success value asynchronously
  Future<Result<R>> flatMapAsync<R>(Future<Result<R>> Function(T) transform) async {
    final result = await this;
    if (result.isSuccess) {
      return await transform(result.value);
    }
    return result as FailureResult<R>;
  }

  /// Folds the result asynchronously
  Future<R> foldAsync<R>(
    Future<R> Function(Failure) onFailure,
    Future<R> Function(T) onSuccess,
  ) async {
    final result = await this;
    if (result.isSuccess) {
      return onSuccess(result.value);
    }
    return onFailure(result.failure);
  }
}