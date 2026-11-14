/// SAFENAV CAVITE - Loading State
///
/// Reusable loading state components for async operations.
library;

import 'package:flutter/material.dart';

/// Full-screen loading overlay
class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({
    super.key,
    this.message,
    this.color,
    this.backgroundColor,
    this.barrierDismissible = false,
    this.semanticLabel,
    this.excludeFromSemantics = false,
  });

  final String? message;
  final Color? color;
  final Color? backgroundColor;
  final bool barrierDismissible;
  final String? semanticLabel;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    Widget content = PopScope(
      canPop: barrierDismissible,
      child: Container(
        color: backgroundColor ?? colorScheme.surface.withValues(alpha: 0.8),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Semantics(
                label: 'Loading',
                excludeSemantics: true,
                child: CircularProgressIndicator(
                  color: color ?? colorScheme.primary,
                  strokeWidth: 3,
                ),
              ),
              if (message != null) ...[
                const SizedBox(height: 16),
                Text(
                  message!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
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

/// Inline loading indicator for list items or content areas
class InlineLoading extends StatelessWidget {
  const InlineLoading({
    super.key,
    this.message,
    this.size = 24,
    this.strokeWidth = 2,
    this.color,
    this.padding = const EdgeInsets.all(16),
    this.semanticLabel,
    this.excludeFromSemantics = false,
  });

  final String? message;
  final double size;
  final double strokeWidth;
  final Color? color;
  final EdgeInsetsGeometry padding;
  final String? semanticLabel;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    Widget content = Padding(
      padding: padding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Semantics(
            label: 'Loading',
            excludeSemantics: true,
            child: SizedBox(
              width: size,
              height: size,
              child: CircularProgressIndicator(
                strokeWidth: strokeWidth,
                color: color ?? colorScheme.primary,
              ),
            ),
          ),
          if (message != null) ...[
            const SizedBox(height: 12),
            Text(
              message!,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
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

/// Skeleton loading placeholder for cards and content
class SkeletonLoader extends StatefulWidget {
  const SkeletonLoader({
    super.key,
    required this.child,
    this.baseColor,
    this.highlightColor,
    this.duration = const Duration(milliseconds: 1500),
    this.semanticLabel,
    this.excludeFromSemantics = false,
  });

  final Widget child;
  final Color? baseColor;
  final Color? highlightColor;
  final Duration duration;
  final String? semanticLabel;
  final bool excludeFromSemantics;

  @override
  State<SkeletonLoader> createState() => _SkeletonLoaderState();
}

class _SkeletonLoaderState extends State<SkeletonLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this)
      ..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.4, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget content = AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Opacity(
          opacity: _animation.value,
          child: child,
        );
      },
      child: widget.child,
    );

    if (widget.semanticLabel != null) {
      content = Semantics(
        label: widget.semanticLabel!,
        liveRegion: true,
        child: content,
      );
    }

    if (widget.excludeFromSemantics) {
      content = ExcludeSemantics(child: content);
    }

    return content;
  }
}

/// Skeleton card placeholder
class SkeletonCard extends StatelessWidget {
  const SkeletonCard({
    super.key,
    this.height,
    this.width,
    this.borderRadius = 12,
    this.showAvatar = false,
    this.showTitle = true,
    this.showSubtitle = true,
    this.showAction = false,
    this.lines = 3,
    this.semanticLabel,
    this.excludeFromSemantics = false,
  });

  final double? height;
  final double? width;
  final double borderRadius;
  final bool showAvatar;
  final bool showTitle;
  final bool showSubtitle;
  final bool showAction;
  final int lines;
  final String? semanticLabel;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    Widget content = Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showAvatar) ...[
            Row(
              children: [
                ExcludeSemantics(child: _SkeletonLine(width: 48, height: 48, borderRadius: 24)),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _SkeletonLine(width: 120, height: 16),
                      const SizedBox(height: 8),
                      _SkeletonLine(width: 80, height: 12),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
          if (showTitle)
            _SkeletonLine(width: double.infinity, height: 20),
          if (showTitle && showSubtitle) const SizedBox(height: 12),
          if (showSubtitle)
            Column(
              children: List.generate(
                lines,
                (index) => Padding(
                  padding: EdgeInsets.only(bottom: index == lines - 1 ? 0 : 8),
                  child: _SkeletonLine(
                    width: double.infinity,
                    height: 14,
                    borderRadius: 4,
                  ),
                ),
              ),
            ),
          if (showAction) ...[
            const SizedBox(height: 16),
            _SkeletonLine(width: 100, height: 40, borderRadius: 8),
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

/// Skeleton line placeholder
class _SkeletonLine extends StatelessWidget {
  const _SkeletonLine({
    required this.width,
    required this.height,
    this.borderRadius = 4,
  });

  final double width;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}

/// Loading button state
class LoadingButton extends StatelessWidget {
  const LoadingButton({
    super.key,
    required this.isLoading,
    required this.child,
    this.loadingMessage,
    this.semanticLabel,
    this.excludeFromSemantics = false,
  });

  final bool isLoading;
  final Widget child;
  final String? loadingMessage;
  final String? semanticLabel;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    if (!isLoading) return child;

    Widget content = SizedBox(
      width: double.infinity,
      child: child is FilledButton || child is OutlinedButton || child is TextButton
          ? child
          : FilledButton(
              onPressed: null,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ExcludeSemantics(
                    child: const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(loadingMessage ?? 'Loading...'),
                ],
              ),
            ),
    );

    if (semanticLabel != null) {
      content = Semantics(
        label: semanticLabel!,
        liveRegion: true,
        button: true,
        enabled: false,
        child: content,
      );
    }

    if (excludeFromSemantics) {
      content = ExcludeSemantics(child: content);
    }

    return content;
  }
}

/// Pull to refresh indicator wrapper
class RefreshIndicatorWrapper extends StatelessWidget {
  const RefreshIndicatorWrapper({
    super.key,
    required this.onRefresh,
    required this.child,
    this.color,
    this.backgroundColor,
    this.displacement = 40,
    this.semanticLabel,
    this.excludeFromSemantics = false,
  });

  final Future<void> Function() onRefresh;
  final Widget child;
  final Color? color;
  final Color? backgroundColor;
  final double displacement;
  final String? semanticLabel;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    Widget content = RefreshIndicator(
      onRefresh: onRefresh,
      color: color ?? colorScheme.primary,
      backgroundColor: backgroundColor ?? colorScheme.surface,
      displacement: displacement,
      child: child,
    );

    if (semanticLabel != null) {
      content = Semantics(
        label: semanticLabel!,
        child: content,
      );
    }

    if (excludeFromSemantics) {
      content = ExcludeSemantics(child: content);
    }

    return content;
  }
}