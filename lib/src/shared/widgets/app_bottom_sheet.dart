/// SAFENAV CAVITE - App Bottom Sheet
///
/// Reusable, themed bottom sheet component with consistent styling,
/// size variants, optional title and actions, rounded top corners,
/// and accessibility support.
library;

import 'package:material_ui/material_ui.dart';

import '../../core/theme/app_theme.dart';

/// Bottom sheet size variants, expressed as a fraction of the screen height.
enum AppBottomSheetSize {
  /// Compact sheet for simple actions or confirmations (~35% of screen).
  small,

  /// Default sheet for forms and moderate content (~60% of screen).
  medium,

  /// Large sheet for complex content (~90% of screen).
  large,
}

/// Fraction of screen height occupied by each [AppBottomSheetSize].
const Map<AppBottomSheetSize, double> _bottomSheetSizeFractions = {
  AppBottomSheetSize.small: 0.35,
  AppBottomSheetSize.medium: 0.60,
  AppBottomSheetSize.large: 0.90,
};

/// Reusable, themed bottom sheet content.
///
/// Wrap sheet content in this widget for consistent SAFENAV padding,
/// themed colors, an optional title bar with close button, and
/// size-based height constraints. Present it with [AppBottomSheet.show].
///
/// All colors and typography resolve from the current [Theme], so the
/// sheet works unchanged in light, dark, and emergency themes.
class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({
    super.key,
    required this.child,
    this.title,
    this.actions,
    this.showCloseButton = true,
    this.size = AppBottomSheetSize.medium,
    this.enableDrag = true,
    this.isScrollControlled = false,
    this.semanticLabel,
    this.excludeFromSemantics = false,
  });

  /// Sheet content.
  final Widget child;

  /// Optional title shown in the header.
  final String? title;

  /// Optional trailing actions shown between the title and the close button.
  final List<Widget>? actions;

  /// Whether to show a close button in the header.
  final bool showCloseButton;

  /// Size variant controlling the maximum sheet height.
  final AppBottomSheetSize size;

  /// Whether the sheet can be dismissed by dragging.
  final bool enableDrag;

  /// Whether the sheet is scroll controlled (required for fraction-based
  /// sizing to take effect).
  final bool isScrollControlled;

  /// Accessibility label for the sheet.
  final String? semanticLabel;

  /// Whether to exclude the sheet from semantics.
  final bool excludeFromSemantics;

  bool get _hasHeader =>
      title != null || showCloseButton || (actions?.isNotEmpty ?? false);

  /// Presents a themed modal bottom sheet containing [builder].
  ///
  /// Returns the value passed to [Navigator.pop] when the sheet closes.
  static Future<T?> show<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    AppBottomSheetSize size = AppBottomSheetSize.medium,
    bool enableDrag = true,
    bool isScrollControlled = true,
    Color? backgroundColor,
    Color? barrierColor,
    String? barrierLabel,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      builder: (context) => AppBottomSheet(
        size: size,
        enableDrag: enableDrag,
        showCloseButton: true,
        child: builder(context),
      ),
      backgroundColor: backgroundColor,
      barrierColor:
          barrierColor ?? Theme.of(context).colorScheme.surface.withValues(alpha: 0.5),
      barrierLabel: barrierLabel ?? 'Bottom sheet',
      elevation: AppElevation.level4,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusXl),
        ),
      ),
      isScrollControlled: isScrollControlled,
      enableDrag: enableDrag,
    );
  }

  /// Closes the bottom sheet (or any route) optionally returning [result].
  static void close<T>(BuildContext context, [T? result]) {
    Navigator.of(context).pop(result);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    Widget body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (_hasHeader) ...[
          _BottomSheetHeader(
            title: title,
            actions: actions,
            showCloseButton: showCloseButton,
          ),
          const SizedBox(height: AppSpacing.lg),
        ],
        DefaultTextStyle(
          style: AppTextStyles.bodyMedium(context),
          child: child,
        ),
      ],
    );

    Widget content = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (enableDrag) ...[
          const SizedBox(height: AppSpacing.md),
          Center(
            child: Container(
              width: 40,
              height: AppSpacing.xs,
              decoration: BoxDecoration(
                color: colorScheme.outlineVariant,
                borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
        ],
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: body,
        ),
      ],
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

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height *
            _bottomSheetSizeFractions[size]!,
      ),
      child: content,
    );
  }
}

/// Bottom sheet header: title, optional trailing actions, close button.
class _BottomSheetHeader extends StatelessWidget {
  const _BottomSheetHeader({
    required this.title,
    required this.actions,
    required this.showCloseButton,
  });

  final String? title;
  final List<Widget>? actions;
  final bool showCloseButton;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final children = <Widget>[
      if (title != null)
        Expanded(
          child: Text(
            title!,
            style: AppTextStyles.titleMedium(context).copyWith(
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      if (actions?.isNotEmpty ?? false) ...actions!,
      if (showCloseButton) ...[
        const SizedBox(width: AppSpacing.sm),
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: ExcludeSemantics(child: const Icon(Icons.close)),
          tooltip: 'Close',
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          style: IconButton.styleFrom(
            foregroundColor: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    ];

    return Row(children: children);
  }
}
