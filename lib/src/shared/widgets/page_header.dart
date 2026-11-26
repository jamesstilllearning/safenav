/// SAFENAV CAVITE - Page Header
///
/// Consistent top-left page title with optional icon, subtitle, and trailing action.
/// Used across all screens to enforce uniform header alignment and spacing.
library;

import 'package:material_ui/material_ui.dart';

import '../../core/theme/app_theme.dart';

/// Page header style variants
enum PageHeaderStyle { standard, compact }

/// Page header with title, optional subtitle, icon, and trailing action.
/// All content is top-left aligned for consistent header positioning.
class PageHeader extends StatelessWidget {
  const PageHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.iconColor,
    this.action,
    this.actionTooltip,
    this.style = PageHeaderStyle.standard,
  });

  final String title;
  final String? subtitle;
  final IconData? icon;
  final Color? iconColor;
  final Widget? action;
  final String? actionTooltip;
  final PageHeaderStyle style;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final isCompact = style == PageHeaderStyle.compact;
    final edgeInsets = isCompact
        ? const EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.xs, AppSpacing.md, AppSpacing.xs)
        : const EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.sm, AppSpacing.md, AppSpacing.sm);

    return Padding(
      padding: edgeInsets,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null) ...[
            Container(
              width: isCompact ? 36 : 40,
              height: isCompact ? 36 : 40,
              decoration: BoxDecoration(
                color: (iconColor ?? colorScheme.primary).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
              ),
              child: Icon(
                icon,
                color: iconColor ?? colorScheme.primary,
                size: isCompact ? 18 : 20,
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: colorScheme.onSurface,
                    fontSize: isCompact ? 20 : 22,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    subtitle!,
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontSize: isCompact ? 13 : 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
          if (action != null) ...[
            const SizedBox(width: AppSpacing.sm),
            if (actionTooltip != null)
              Tooltip(message: actionTooltip!, child: action!)
            else
              action!,
          ],
        ],
      ),
    );
  }
}
