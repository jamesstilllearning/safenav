/// SAFENAV CAVITE - Error State
///
/// Reusable error state components for displaying errors and retry actions.
library;

import 'package:material_ui/material_ui.dart';

import '../../core/theme/app_theme.dart';

/// Full-screen error state
class ErrorState extends StatelessWidget {
  const ErrorState({
    super.key,
    required this.message,
    this.title,
    this.icon,
    this.onRetry,
    this.retryLabel,
    this.onDismiss,
    this.dismissLabel,
    this.iconColor,
    this.titleStyle,
    this.messageStyle,
    this.padding = const EdgeInsets.all(AppSpacing.lg),
    this.semanticLabel,
    this.excludeFromSemantics = false,
  });

  final String message;
  final String? title;
  final IconData? icon;
  final VoidCallback? onRetry;
  final String? retryLabel;
  final VoidCallback? onDismiss;
  final String? dismissLabel;
  final Color? iconColor;
  final TextStyle? titleStyle;
  final TextStyle? messageStyle;
  final EdgeInsetsGeometry padding;
  final String? semanticLabel;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final effectiveIconColor = iconColor ?? colorScheme.error;
    final effectiveTitleStyle = titleStyle ??
        textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w600,
          color: colorScheme.error,
        );
    final effectiveMessageStyle = messageStyle ??
        textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
        );

    Widget content = Center(
      child: Padding(
        padding: padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ExcludeSemantics(
              child: Icon(icon ?? Icons.error_outline, size: AppSpacing.xxxl, color: effectiveIconColor),
            ),
            const SizedBox(height: AppSpacing.md),
            if (title != null)
              Text(title!, style: effectiveTitleStyle, textAlign: TextAlign.center),
            if (title != null) const SizedBox(height: AppSpacing.sm),
            Text(message, style: effectiveMessageStyle, textAlign: TextAlign.center),
            const SizedBox(height: AppSpacing.lg),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (onRetry != null) ...[
                  FilledButton.icon(
                    onPressed: onRetry,
                    icon: ExcludeSemantics(child: const Icon(Icons.refresh)),
                    label: Text(retryLabel ?? 'Try again'),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: 12),
                    ),
                  ),
                  if (onDismiss != null) const SizedBox(width: 12),
                ],
                if (onDismiss != null)
                  OutlinedButton(
                    onPressed: onDismiss,
                    child: Text(dismissLabel ?? 'Dismiss'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );

    if (semanticLabel != null) {
      content = Semantics(
        label: semanticLabel!,
        liveRegion: true,
        child: content,
      );
    }

    if (excludeFromSemantics) {
      content = ExcludeSemantics(child: content);
    }

    return content;
  }
}

/// Inline error state for list items or content areas
class InlineError extends StatelessWidget {
  const InlineError({
    super.key,
    required this.message,
    this.title,
    this.icon,
    this.onRetry,
    this.retryLabel,
    this.iconColor,
    this.padding = const EdgeInsets.all(AppSpacing.md),
    this.semanticLabel,
    this.excludeFromSemantics = false,
  });

  final String message;
  final String? title;
  final IconData? icon;
  final VoidCallback? onRetry;
  final String? retryLabel;
  final Color? iconColor;
  final EdgeInsetsGeometry padding;
  final String? semanticLabel;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final effectiveIconColor = iconColor ?? colorScheme.error;
    final effectiveTitleStyle = textTheme.titleSmall?.copyWith(
      fontWeight: FontWeight.w600,
      color: colorScheme.error,
    );
    final effectiveMessageStyle = textTheme.bodyMedium?.copyWith(
      color: colorScheme.onSurfaceVariant,
    );

    Widget content = Padding(
      padding: padding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ExcludeSemantics(child: Icon(icon ?? Icons.error_outline, size: 20, color: effectiveIconColor)),
              const SizedBox(width: AppSpacing.sm),
              if (title != null)
                Text(title!, style: effectiveTitleStyle),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(message, style: effectiveMessageStyle, textAlign: TextAlign.center),
          if (onRetry != null) ...[
            const SizedBox(height: 12),
            TextButton.icon(
              onPressed: onRetry,
              icon: ExcludeSemantics(child: const Icon(Icons.refresh, size: 18)),
              label: Text(retryLabel ?? 'Retry'),
            ),
          ],
        ],
      ),
    );

    if (semanticLabel != null) {
      content = Semantics(
        label: semanticLabel!,
        liveRegion: true,
        child: content,
      );
    }

    if (excludeFromSemantics) {
      content = ExcludeSemantics(child: content);
    }

    return content;
  }
}

/// Error banner for top-of-screen notifications
class ErrorBanner extends StatelessWidget {
  const ErrorBanner({
    super.key,
    required this.message,
    this.title,
    this.icon,
    this.onDismiss,
    this.onAction,
    this.actionLabel,
    this.backgroundColor,
    this.iconColor,
    this.autoDismiss = false,
    this.dismissDuration = const Duration(seconds: 5),
    this.semanticLabel,
    this.excludeFromSemantics = false,
  });

  final String message;
  final String? title;
  final IconData? icon;
  final VoidCallback? onDismiss;
  final VoidCallback? onAction;
  final String? actionLabel;
  final Color? backgroundColor;
  final Color? iconColor;
  final bool autoDismiss;
  final Duration dismissDuration;
  final String? semanticLabel;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final effectiveBackground = backgroundColor ?? colorScheme.errorContainer;
    final effectiveIconColor = iconColor ?? colorScheme.onErrorContainer;
    final effectiveTitleStyle = Theme.of(context).textTheme.titleSmall?.copyWith(
      fontWeight: FontWeight.w600,
      color: colorScheme.onErrorContainer,
    );
    final effectiveMessageStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
      color: colorScheme.onErrorContainer.withValues(alpha: 0.8),
    );

    Widget banner = Material(
      color: effectiveBackground,
      elevation: 4,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 12),
          child: Row(
            children: [
              ExcludeSemantics(child: Icon(icon ?? Icons.error_outline, color: effectiveIconColor, size: AppSpacing.lg)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (title != null)
                      Text(title!, style: effectiveTitleStyle),
                    Text(message, style: effectiveMessageStyle),
                  ],
                ),
              ),
              if (onAction != null && actionLabel != null) ...[
                const SizedBox(width: 12),
                TextButton(
                  onPressed: onAction,
                  style: TextButton.styleFrom(
                    foregroundColor: effectiveIconColor,
                  ),
                  child: Text(actionLabel!, style: const TextStyle(fontWeight: FontWeight.w600)),
                ),
              ],
              if (onDismiss != null) ...[
                const SizedBox(width: AppSpacing.sm),
                IconButton(
                  onPressed: onDismiss,
                  icon: ExcludeSemantics(child: Icon(Icons.close, color: effectiveIconColor, size: 20)),
                  tooltip: 'Dismiss',
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ],
          ),
        ),
      ),
    );

    if (semanticLabel != null) {
      banner = Semantics(
        label: semanticLabel!,
        liveRegion: true,
        child: banner,
      );
    }

    if (excludeFromSemantics) {
      banner = ExcludeSemantics(child: banner);
    }

    if (autoDismiss) {
      return _AutoDismissBanner(
        dismissDuration: dismissDuration,
        child: banner,
      );
    }

    return banner;
  }
}

class _AutoDismissBanner extends StatefulWidget {
  const _AutoDismissBanner({
    required this.dismissDuration,
    required this.child,
  });

  final Duration dismissDuration;
  final Widget child;

  @override
  State<_AutoDismissBanner> createState() => _AutoDismissBannerState();
}

class _AutoDismissBannerState extends State<_AutoDismissBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _heightAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    Future.delayed(widget.dismissDuration, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return SizeTransition(
          sizeFactor: _heightAnimation,
          child: FadeTransition(
            opacity: _opacityAnimation,
            child: widget.child,
          ),
        );
      },
    );
  }
}

/// Network error state with offline indicator
class NetworkErrorState extends StatelessWidget {
  const NetworkErrorState({
    super.key,
    this.onRetry,
    this.onOpenSettings,
    this.customMessage,
    this.semanticLabel,
    this.excludeFromSemantics = false,
  });

  final VoidCallback? onRetry;
  final VoidCallback? onOpenSettings;
  final String? customMessage;
  final String? semanticLabel;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ErrorState(
      icon: Icons.wifi_off,
      title: 'Connection lost',
      message: customMessage ??
          'Unable to connect to the server. Please check your internet connection and try again.',
      onRetry: onRetry,
      retryLabel: 'Retry',
      onDismiss: onOpenSettings,
      dismissLabel: 'Open settings',
      iconColor: colorScheme.error,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
    );
  }
}

/// Permission denied error state
class PermissionErrorState extends StatelessWidget {
  const PermissionErrorState({
    super.key,
    required this.permissionName,
    this.onOpenSettings,
    this.onDismiss,
    this.customMessage,
    this.semanticLabel,
    this.excludeFromSemantics = false,
  });

  final String permissionName;
  final VoidCallback? onOpenSettings;
  final VoidCallback? onDismiss;
  final String? customMessage;
  final String? semanticLabel;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ErrorState(
      icon: Icons.lock_outline,
      title: 'Permission required',
      message: customMessage ??
          'This feature requires $permissionName permission. Please enable it in settings to continue.',
      onRetry: onOpenSettings,
      retryLabel: 'Open settings',
      onDismiss: onDismiss,
      dismissLabel: 'Not now',
      iconColor: colorScheme.error,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
    );
  }
}