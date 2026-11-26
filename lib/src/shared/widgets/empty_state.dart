/// SAFENAV CAVITE - Empty State
///
/// Reusable empty state components for lists, searches, and content areas.
library;

import 'package:material_ui/material_ui.dart';

/// Empty state with icon, title, message, and optional action
class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    this.message,
    this.action,
    this.actionLabel,
    this.actionTooltip,
    this.iconSize = 64,
    this.iconColor,
    this.titleStyle,
    this.messageStyle,
    this.spacing = 16,
    this.padding = const EdgeInsets.all(24),
    this.semanticLabel,
    this.excludeFromSemantics = false,
  });

  final IconData icon;
  final String title;
  final String? message;
  final VoidCallback? action;
  final String? actionLabel;
  final String? actionTooltip;
  final double iconSize;
  final Color? iconColor;
  final TextStyle? titleStyle;
  final TextStyle? messageStyle;
  final double spacing;
  final EdgeInsetsGeometry padding;
  final String? semanticLabel;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final effectiveIconColor = iconColor ?? colorScheme.outline;
    final effectiveTitleStyle = titleStyle ??
        textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: colorScheme.onSurface,
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
              child: Icon(icon, size: iconSize, color: effectiveIconColor),
            ),
            SizedBox(height: spacing),
            Text(title, style: effectiveTitleStyle, textAlign: TextAlign.center),
            if (message != null) ...[
              SizedBox(height: spacing / 2),
              Text(
                message!,
                style: effectiveMessageStyle,
                textAlign: TextAlign.center,
              ),
            ],
            if (action != null && actionLabel != null) ...[
              SizedBox(height: spacing * 1.5),
              FilledButton.icon(
                onPressed: action,
                icon: ExcludeSemantics(child: const Icon(Icons.add)),
                label: Text(actionLabel!),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ],
          ],
        ),
      ),
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

/// Empty state for search results
class SearchEmptyState extends StatelessWidget {
  const SearchEmptyState({
    super.key,
    required this.query,
    this.onClear,
    this.onRetry,
    this.customIcon,
    this.customTitle,
    this.customMessage,
    this.semanticLabel,
    this.excludeFromSemantics = false,
  });

  final String query;
  final VoidCallback? onClear;
  final VoidCallback? onRetry;
  final IconData? customIcon;
  final String? customTitle;
  final String? customMessage;
  final String? semanticLabel;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return EmptyState(
      icon: customIcon ?? Icons.search_off,
      title: customTitle ?? 'No results found',
      message: customMessage ??
          'No destinations match "$query". Try a different search term.',
      action: onClear,
      actionLabel: onClear != null ? 'Clear search' : null,
      actionTooltip: 'Clear search and try again',
      iconColor: colorScheme.outline,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
    );
  }
}

/// Empty state for no data/content
class ContentEmptyState extends StatelessWidget {
  const ContentEmptyState({
    super.key,
    this.icon,
    this.title,
    this.message,
    this.action,
    this.actionLabel,
    this.actionTooltip,
    this.iconColor,
    this.semanticLabel,
    this.excludeFromSemantics = false,
  });

  final IconData? icon;
  final String? title;
  final String? message;
  final VoidCallback? action;
  final String? actionLabel;
  final String? actionTooltip;
  final Color? iconColor;
  final String? semanticLabel;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return EmptyState(
      icon: icon ?? Icons.inbox_outlined,
      title: title ?? 'No content available',
      message: message,
      action: action,
      actionLabel: actionLabel,
      actionTooltip: actionTooltip,
      iconColor: iconColor ?? colorScheme.outline,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
    );
  }
}

/// Empty state for offline/no connection
class OfflineEmptyState extends StatelessWidget {
  const OfflineEmptyState({
    super.key,
    this.onRetry,
    this.customMessage,
    this.semanticLabel,
    this.excludeFromSemantics = false,
  });

  final VoidCallback? onRetry;
  final String? customMessage;
  final String? semanticLabel;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return EmptyState(
      icon: Icons.wifi_off,
      title: 'You\'re offline',
      message: customMessage ??
          'Check your connection and try again. Some features may be unavailable.',
      action: onRetry,
      actionLabel: onRetry != null ? 'Try again' : null,
      actionTooltip: 'Retry loading content',
      iconColor: colorScheme.outline,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
    );
  }
}

/// Empty state for no notifications/alerts
class NotificationsEmptyState extends StatelessWidget {
  const NotificationsEmptyState({
    super.key,
    this.onRefresh,
    this.semanticLabel,
    this.excludeFromSemantics = false,
  });

  final VoidCallback? onRefresh;
  final String? semanticLabel;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return EmptyState(
      icon: Icons.notifications_none,
      title: 'No alerts',
      message: 'You\'re all caught up. New alerts will appear here.',
      action: onRefresh,
      actionLabel: onRefresh != null ? 'Refresh' : null,
      actionTooltip: 'Pull to refresh',
      iconColor: colorScheme.outline,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
    );
  }
}

/// Empty state for no route/navigation
class NavigationEmptyState extends StatelessWidget {
  const NavigationEmptyState({
    super.key,
    this.onSearch,
    this.semanticLabel,
    this.excludeFromSemantics = false,
  });

  final VoidCallback? onSearch;
  final String? semanticLabel;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return EmptyState(
      icon: Icons.explore_off,
      title: 'No route selected',
      message: 'Search for a destination or tap a building on the map to start navigation.',
      action: onSearch,
      actionLabel: onSearch != null ? 'Search destination' : null,
      actionTooltip: 'Open search',
      iconColor: colorScheme.outline,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
    );
  }
}