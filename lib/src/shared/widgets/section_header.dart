/// SAFENAV CAVITE - Section Header
///
/// Reusable section header with title, subtitle, and optional action.
library;

import 'package:material_ui/material_ui.dart';

/// Section header with title, optional subtitle, and trailing action
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.action,
    this.actionTooltip,
    this.actionSemanticLabel,
    this.icon,
    this.iconColor,
    this.style = SectionHeaderStyle.standard,
    this.titleStyle,
    this.subtitleStyle,
    this.spacing = 4.0,
    this.padding = EdgeInsets.zero,
    this.semanticLabel,
    this.excludeFromSemantics = false,
  });

  final String title;
  final String? subtitle;
  final Widget? action;
  final String? actionTooltip;
  final String? actionSemanticLabel;
  final IconData? icon;
  final Color? iconColor;
  final SectionHeaderStyle style;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final double spacing;
  final EdgeInsetsGeometry padding;
  final String? semanticLabel;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final effectiveTitleStyle = _getTitleStyle(textTheme, style);
    final effectiveSubtitleStyle = subtitleStyle ??
        textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
        );

    Widget header = Padding(
      padding: padding,
      child: Row(
        children: [
          if (icon != null) ...[
            ExcludeSemantics(
              child: Icon(
                icon,
                color: iconColor ?? colorScheme.primary,
                size: _getIconSize(style),
              ),
            ),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: effectiveTitleStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (subtitle != null) ...[
                  SizedBox(height: spacing),
                  Text(
                    subtitle!,
                    style: effectiveSubtitleStyle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
          if (action != null) ...[
            const SizedBox(width: 12),
            _wrapAction(action!, context),
          ],
        ],
      ),
    );

    if (style == SectionHeaderStyle.divider) {
      header = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          header,
          const SizedBox(height: 8),
          ExcludeSemantics(
            child: Divider(
              color: colorScheme.outlineVariant,
              height: 1,
              thickness: 1,
            ),
          ),
        ],
      );
    }

    if (semanticLabel != null) {
      header = Semantics(
        header: true,
        label: semanticLabel!,
        child: header,
      );
    }

    if (excludeFromSemantics) {
      header = ExcludeSemantics(child: header);
    }

    return header;
  }

  Widget _wrapAction(Widget action, BuildContext context) {
    if (actionTooltip != null || actionSemanticLabel != null) {
      Widget wrapped = action;
      if (actionTooltip != null) {
        wrapped = Tooltip(message: actionTooltip!, child: wrapped);
      }
      if (actionSemanticLabel != null) {
        wrapped = Semantics(
          label: actionSemanticLabel!,
          button: true,
          child: wrapped,
        );
      }
      return wrapped;
    }
    return action;
  }

  TextStyle _getTitleStyle(TextTheme textTheme, SectionHeaderStyle style) {
    switch (style) {
      case SectionHeaderStyle.standard:
        return titleStyle ??
            textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ) ??
            const TextStyle(fontWeight: FontWeight.w600);
      case SectionHeaderStyle.large:
        return titleStyle ??
            textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ) ??
            const TextStyle(fontWeight: FontWeight.w600, fontSize: 22);
      case SectionHeaderStyle.small:
        return titleStyle ??
            textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ) ??
            const TextStyle(fontWeight: FontWeight.w600, fontSize: 14);
      case SectionHeaderStyle.divider:
        return titleStyle ??
            textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ) ??
            const TextStyle(fontWeight: FontWeight.w600);
    }
  }

  double _getIconSize(SectionHeaderStyle style) {
    switch (style) {
      case SectionHeaderStyle.standard:
      case SectionHeaderStyle.divider:
        return 24.0;
      case SectionHeaderStyle.large:
        return 28.0;
      case SectionHeaderStyle.small:
        return 20.0;
    }
  }
}

/// Simple section title without action
class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    this.style = SectionHeaderStyle.standard,
    this.titleStyle,
    this.padding = EdgeInsets.zero,
    this.semanticLabel,
    this.excludeFromSemantics = false,
  });

  final String title;
  final SectionHeaderStyle style;
  final TextStyle? titleStyle;
  final EdgeInsetsGeometry padding;
  final String? semanticLabel;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final effectiveStyle = switch (style) {
      SectionHeaderStyle.standard => titleStyle ??
          textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600) ??
          const TextStyle(fontWeight: FontWeight.w600),
      SectionHeaderStyle.large => titleStyle ??
          textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600) ??
          const TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
      SectionHeaderStyle.small => titleStyle ??
          textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600) ??
          const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      SectionHeaderStyle.divider => titleStyle ??
          textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600) ??
          const TextStyle(fontWeight: FontWeight.w600),
    };

    Widget titleWidget = Padding(
      padding: padding,
      child: Text(title, style: effectiveStyle, maxLines: 1, overflow: TextOverflow.ellipsis),
    );

    if (style == SectionHeaderStyle.divider) {
      titleWidget = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          titleWidget,
          const SizedBox(height: 8),
          ExcludeSemantics(
            child: Divider(
              color: colorScheme.outlineVariant,
              height: 1,
              thickness: 1,
            ),
          ),
        ],
      );
    }

    if (semanticLabel != null) {
      titleWidget = Semantics(
        header: true,
        label: semanticLabel!,
        child: titleWidget,
      );
    }

    if (excludeFromSemantics) {
      titleWidget = ExcludeSemantics(child: titleWidget);
    }

    return titleWidget;
  }
}

/// Header with count badge
class SectionHeaderWithCount extends StatelessWidget {
  const SectionHeaderWithCount({
    super.key,
    required this.title,
    required this.count,
    this.subtitle,
    this.action,
    this.actionTooltip,
    this.countStyle,
    this.style = SectionHeaderStyle.standard,
    this.titleStyle,
    this.subtitleStyle,
    this.padding = EdgeInsets.zero,
    this.semanticLabel,
    this.excludeFromSemantics = false,
  });

  final String title;
  final int count;
  final String? subtitle;
  final Widget? action;
  final String? actionTooltip;
  final TextStyle? countStyle;
  final SectionHeaderStyle style;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final EdgeInsetsGeometry padding;
  final String? semanticLabel;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final effectiveTitleStyle = _getTitleStyle(textTheme, style);
    final effectiveSubtitleStyle = subtitleStyle ??
        textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
        );

    Widget header = Padding(
      padding: padding,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(title, style: effectiveTitleStyle, maxLines: 1, overflow: TextOverflow.ellipsis),
                    const SizedBox(width: 8),
                    ExcludeSemantics(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          count.toString(),
                          style: countStyle ??
                              textTheme.labelSmall?.copyWith(
                                color: colorScheme.onPrimaryContainer,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle!,
                    style: effectiveSubtitleStyle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
          if (action != null) ...[
            const SizedBox(width: 12),
            if (actionTooltip != null)
              Tooltip(message: actionTooltip!, child: action!)
            else
              action!,
          ],
        ],
      ),
    );

    if (semanticLabel != null) {
      header = Semantics(
        header: true,
        label: semanticLabel!,
        child: header,
      );
    }

    if (excludeFromSemantics) {
      header = ExcludeSemantics(child: header);
    }

    return header;
  }

  TextStyle _getTitleStyle(TextTheme textTheme, SectionHeaderStyle style) {
    switch (style) {
      case SectionHeaderStyle.standard:
        return titleStyle ??
            textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600) ??
            const TextStyle(fontWeight: FontWeight.w600);
      case SectionHeaderStyle.large:
        return titleStyle ??
            textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600) ??
            const TextStyle(fontWeight: FontWeight.w600, fontSize: 22);
      case SectionHeaderStyle.small:
        return titleStyle ??
            textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600) ??
            const TextStyle(fontWeight: FontWeight.w600, fontSize: 14);
      case SectionHeaderStyle.divider:
        return titleStyle ??
            textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600) ??
            const TextStyle(fontWeight: FontWeight.w600);
    }
  }
}

/// Section header style variants
enum SectionHeaderStyle { standard, large, small, divider }