/// SAFENAV CAVITE - Error Boundary
///
/// Widget that catches errors in its subtree and displays a fallback UI.
/// Provides graceful error handling and recovery options.
library;

import 'dart:developer' as developer;

import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'error_state.dart';

/// Error boundary widget that catches errors in its subtree
class ErrorBoundary extends StatefulWidget {
  const ErrorBoundary({
    super.key,
    this.fallback,
    this.onError,
    this.onErrorDetails,
    required this.child,
  });

  /// Optional custom fallback widget
  final Widget? fallback;

  /// Called when an error is caught
  final void Function(Object error, StackTrace stackTrace)? onError;

  /// Called with detailed error information
  final void Function(FlutterErrorDetails details)? onErrorDetails;

  /// The child widget to wrap
  final Widget child;

  @override
  State<ErrorBoundary> createState() => _ErrorBoundaryState();

  /// Static method to wrap a widget with error boundary
  static Widget wrap({
    Widget? fallback,
    void Function(Object error, StackTrace stackTrace)? onError,
    void Function(FlutterErrorDetails details)? onErrorDetails,
    required Widget child,
  }) {
    return ErrorBoundary(
      fallback: fallback,
      onError: onError,
      onErrorDetails: onErrorDetails,
      child: child,
    );
  }
}

class _ErrorBoundaryState extends State<ErrorBoundary> {
  Object? _error;

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      if (widget.fallback != null) {
        return widget.fallback!;
      }

      return _DefaultErrorFallback(
        error: _error!,
        onRetry: () {
          setState(() {
            _error = null;
          });
        },
      );
    }

    return widget.child;
  }

  /// Call this method to manually trigger an error state
  void captureError(Object error, StackTrace stackTrace) {
    setState(() {
      _error = error;
    });

    // Log the error
    developer.log(
      '[ERROR_BOUNDARY] Error captured: $error',
      name: 'ErrorBoundary',
      error: error,
      stackTrace: stackTrace,
    );

    // Call callbacks
    widget.onError?.call(error, stackTrace);
  }
}

/// Default error fallback widget
class _DefaultErrorFallback extends StatelessWidget {
  const _DefaultErrorFallback({
    required this.error,
    required this.onRetry,
  });

  final Object error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Semantics(
      label: 'Error occurred. Tap retry to try again.',
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64,
                color: colorScheme.error,
                semanticLabel: 'Error icon',
              ),
              const SizedBox(height: 16),
              Text(
                'Something went wrong',
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colorScheme.error,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                _getErrorMessage(error),
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FilledButton.icon(
                    onPressed: onRetry,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Try again'),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getErrorMessage(Object error) {
    final errorString = error.toString();
    if (errorString.length > 200) {
      return '${errorString.substring(0, 200)}...';
    }
    return errorString;
  }
}

/// Error boundary with specific error type handling
class TypedErrorBoundary<T extends Object> extends StatefulWidget {
  const TypedErrorBoundary({
    super.key,
    this.fallback,
    this.onError,
    this.matcher,
    required this.child,
  });

  final Widget? fallback;
  final void Function(T error, StackTrace stackTrace)? onError;
  final bool Function(Object error)? matcher;
  final Widget child;

  @override
  State<TypedErrorBoundary<T>> createState() => _TypedErrorBoundaryState<T>();
}

class _TypedErrorBoundaryState<T extends Object> extends State<TypedErrorBoundary<T>> {
  @override
  Widget build(BuildContext context) {
    return ErrorBoundary(
      fallback: widget.fallback,
      onError: (error, stackTrace) {
        if (widget.matcher?.call(error) ?? error is T) {
          widget.onError?.call(error as T, stackTrace);
        } else {
          // Re-throw if not matching
          Error.throwWithStackTrace(error, stackTrace);
        }
      },
      child: widget.child,
    );
  }
}

/// Provider for error boundary state
final errorBoundaryProvider = StateNotifierProvider<ErrorBoundaryNotifier, Object?>(
  (ref) => ErrorBoundaryNotifier(),
);

/// Notifier for global error boundary state
class ErrorBoundaryNotifier extends StateNotifier<Object?> {
  ErrorBoundaryNotifier() : super(null);

  void captureError(Object error, StackTrace stackTrace) {
    state = error;
    developer.log(
      '[ERROR_BOUNDARY] Global error captured: $error',
      name: 'ErrorBoundaryNotifier',
      error: error,
      stackTrace: stackTrace,
    );
  }

  void clearError() {
    state = null;
  }
}

/// Widget that shows error banner when there's a global error
class GlobalErrorBanner extends ConsumerWidget {
  const GlobalErrorBanner({
    super.key,
    this.onDismiss,
    this.autoDismiss = true,
    this.dismissDuration = const Duration(seconds: 5),
  });

  final VoidCallback? onDismiss;
  final bool autoDismiss;
  final Duration dismissDuration;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final error = ref.watch(errorBoundaryProvider);

    if (error == null) {
      return const SizedBox.shrink();
    }

    final colorScheme = Theme.of(context).colorScheme;

    return ErrorBanner(
      title: 'Error',
      message: error.toString(),
      backgroundColor: colorScheme.errorContainer,
      iconColor: colorScheme.onErrorContainer,
      onDismiss: () {
        ref.read(errorBoundaryProvider.notifier).clearError();
        onDismiss?.call();
      },
      autoDismiss: autoDismiss,
      dismissDuration: dismissDuration,
    );
  }
}