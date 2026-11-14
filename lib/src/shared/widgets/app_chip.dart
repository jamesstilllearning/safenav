/// SAFENAV CAVITE - App Chip
///
/// Reusable chip components for labels, filters, and status indicators.
library;

import 'package:flutter/material.dart';

/// Standard chip with consistent styling
class AppChip extends StatelessWidget {
  const AppChip({
    super.key,
    required this.label,
    this.icon,
    this.iconPosition = IconPosition.leading,
    this.onDeleted,
    this.isSelected = false,
    this.backgroundColor,
    this.labelStyle,
    this.avatar,
    this.padding,
    this.tooltip,
    this.semanticLabel,
    this.excludeFromSemantics = false,
  });

  final String label;
  final IconData? icon;
  final IconPosition iconPosition;
  final VoidCallback? onDeleted;
  final bool isSelected;
  final Color? backgroundColor;
  final TextStyle? labelStyle;
  final Widget? avatar;
  final EdgeInsetsGeometry? padding;
  final String? tooltip;
  final String? semanticLabel;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final effectiveBackground = isSelected
        ? (backgroundColor ?? colorScheme.primaryContainer)
        : (backgroundColor ?? colorScheme.surfaceContainerHigh);
    final effectiveLabelStyle = labelStyle ??
        textTheme.labelMedium?.copyWith(
          color: isSelected
              ? colorScheme.onPrimaryContainer
              : colorScheme.onSurface,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
        );

    Widget chip = Chip(
      label: Text(label, style: effectiveLabelStyle),
      avatar: avatar != null ? ExcludeSemantics(child: avatar!) : null,
      labelPadding: EdgeInsets.zero,
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      backgroundColor: effectiveBackground,
      side: isSelected
          ? BorderSide(color: colorScheme.primary, width: 2)
          : BorderSide(color: colorScheme.outlineVariant, width: 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      deleteIcon: onDeleted != null
          ? ExcludeSemantics(child: const Icon(Icons.close, size: 18))
          : null,
      onDeleted: onDeleted,
      deleteIconColor: colorScheme.onSurfaceVariant,
      deleteButtonTooltipMessage: 'Remove',
    );

    if (tooltip != null) {
      chip = Tooltip(message: tooltip!, child: chip);
    }

    if (semanticLabel != null) {
      chip = Semantics(
        label: semanticLabel!,
        selected: isSelected,
        button: onDeleted != null,
        enabled: onDeleted != null,
        child: chip,
      );
    }

    if (excludeFromSemantics) {
      chip = ExcludeSemantics(child: chip);
    }

    return chip;
  }
}

/// Filter chip variant with leading icon
class AppFilterChip extends StatelessWidget {
  const AppFilterChip({
    super.key,
    required this.label,
    this.icon,
    this.onSelected,
    this.selected = false,
    this.backgroundColor,
    this.selectedColor,
    this.labelStyle,
    this.tooltip,
    this.semanticLabel,
    this.excludeFromSemantics = false,
  });

  final String label;
  final IconData? icon;
  final ValueChanged<bool>? onSelected;
  final bool selected;
  final Color? backgroundColor;
  final Color? selectedColor;
  final TextStyle? labelStyle;
  final String? tooltip;
  final String? semanticLabel;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final effectiveLabelStyle = labelStyle ??
        textTheme.labelMedium?.copyWith(
          color: selected
              ? colorScheme.onPrimaryContainer
              : colorScheme.onSurface,
          fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
        );

    Widget chip = FilterChip(
      label: Text(label, style: effectiveLabelStyle),
      avatar: icon != null ? ExcludeSemantics(child: Icon(icon!, size: 18)) : null,
      selected: selected,
      onSelected: onSelected,
      backgroundColor: backgroundColor,
      selectedColor: selectedColor,
      labelPadding: EdgeInsets.zero,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      side: BorderSide(
        color: selected ? colorScheme.primary : colorScheme.outlineVariant,
        width: selected ? 2 : 1,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      showCheckmark: true,
      checkmarkColor: colorScheme.onPrimaryContainer,
    );

    if (tooltip != null) {
      chip = Tooltip(message: tooltip!, child: chip);
    }

    if (semanticLabel != null) {
      chip = Semantics(
        label: semanticLabel!,
        selected: selected,
        toggled: selected,
        child: chip,
      );
    }

    if (excludeFromSemantics) {
      chip = ExcludeSemantics(child: chip);
    }

    return chip;
  }
}

/// Choice chip variant for single selection
class AppChoiceChip<T> extends StatelessWidget {
  const AppChoiceChip({
    super.key,
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onSelected,
    this.icon,
    this.selectedColor,
    this.backgroundColor,
    this.labelStyle,
    this.tooltip,
    this.semanticLabel,
    this.excludeFromSemantics = false,
  });

  final String label;
  final T value;
  final T groupValue;
  final ValueChanged<T?> onSelected;
  final IconData? icon;
  final Color? selectedColor;
  final Color? backgroundColor;
  final TextStyle? labelStyle;
  final String? tooltip;
  final String? semanticLabel;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final selected = value == groupValue;
    final effectiveLabelStyle = labelStyle ??
        textTheme.labelMedium?.copyWith(
          color: selected
              ? colorScheme.onPrimaryContainer
              : colorScheme.onSurface,
          fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
        );

    Widget chip = ChoiceChip(
      label: Text(label, style: effectiveLabelStyle),
      avatar: icon != null ? ExcludeSemantics(child: Icon(icon!, size: 18)) : null,
      selected: selected,
      onSelected: (bool selected) => onSelected(selected ? value : null),
      backgroundColor: backgroundColor,
      selectedColor: selectedColor,
      labelPadding: EdgeInsets.zero,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      side: BorderSide(
        color: selected ? colorScheme.primary : colorScheme.outlineVariant,
        width: selected ? 2 : 1,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      showCheckmark: true,
      checkmarkColor: colorScheme.onPrimaryContainer,
    );

    if (tooltip != null) {
      chip = Tooltip(message: tooltip!, child: chip);
    }

    if (semanticLabel != null) {
      chip = Semantics(
        label: semanticLabel!,
        selected: selected,
        toggled: selected,
        child: chip,
      );
    }

    if (excludeFromSemantics) {
      chip = ExcludeSemantics(child: chip);
    }

    return chip;
  }
}

/// Input chip variant with delete action
class AppInputChip extends StatelessWidget {
  const AppInputChip({
    super.key,
    required this.label,
    this.icon,
    this.onDeleted,
    this.backgroundColor,
    this.labelStyle,
    this.tooltip,
    this.semanticLabel,
    this.excludeFromSemantics = false,
  });

  final String label;
  final IconData? icon;
  final VoidCallback? onDeleted;
  final Color? backgroundColor;
  final TextStyle? labelStyle;
  final String? tooltip;
  final String? semanticLabel;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final effectiveBackground = backgroundColor ?? colorScheme.primaryContainer;
    final effectiveLabelStyle = labelStyle ??
        textTheme.labelMedium?.copyWith(
          color: colorScheme.onPrimaryContainer,
          fontWeight: FontWeight.w500,
        );

    Widget chip = InputChip(
      label: Text(label, style: effectiveLabelStyle),
      avatar: icon != null
          ? ExcludeSemantics(
              child: Icon(icon!, size: 18, color: colorScheme.onPrimaryContainer))
          : null,
      onDeleted: onDeleted,
      deleteIcon: onDeleted != null
          ? ExcludeSemantics(child: const Icon(Icons.close, size: 18))
          : null,
      deleteIconColor: colorScheme.onPrimaryContainer,
      backgroundColor: effectiveBackground,
      labelPadding: EdgeInsets.zero,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      side: BorderSide(color: colorScheme.primary.withValues(alpha: 0.3), width: 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );

    if (tooltip != null) {
      chip = Tooltip(message: tooltip!, child: chip);
    }

    if (semanticLabel != null) {
      chip = Semantics(
        label: semanticLabel!,
        button: true,
        enabled: onDeleted != null,
        child: chip,
      );
    }

    if (excludeFromSemantics) {
      chip = ExcludeSemantics(child: chip);
    }

    return chip;
  }
}

/// Status chip for severity/alert levels
class AppStatusChip extends StatelessWidget {
  const AppStatusChip({
    super.key,
    required this.label,
    required this.severity,
    this.icon,
    this.showIcon = true,
    this.compact = false,
    this.semanticLabel,
    this.excludeFromSemantics = false,
  });

  final String label;
  final ChipSeverity severity;
  final IconData? icon;
  final bool showIcon;
  final bool compact;
  final String? semanticLabel;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final (bgColor, textColor, defaultIcon) = switch (severity) {
      ChipSeverity.info => (
          colorScheme.primaryContainer,
          colorScheme.onPrimaryContainer,
          Icons.info_outline,
        ),
      ChipSeverity.success => (
          colorScheme.primaryContainer,
          colorScheme.onPrimaryContainer,
          Icons.check_circle_outline,
        ),
      ChipSeverity.warning => (
          colorScheme.tertiaryContainer,
          colorScheme.onTertiaryContainer,
          Icons.warning_amber_outlined,
        ),
      ChipSeverity.error => (
          colorScheme.errorContainer,
          colorScheme.onErrorContainer,
          Icons.error_outline,
        ),
      ChipSeverity.emergency => (
          colorScheme.error,
          colorScheme.onError,
          Icons.warning,
        ),
    };

    final effectiveIcon = showIcon ? (icon ?? defaultIcon) : null;
    final horizontalPadding = compact ? 8.0 : 12.0;
    final verticalPadding = compact ? 2.0 : 4.0;
    final fontSize = compact ? 11.0 : 12.0;
    final iconSize = compact ? 14.0 : 16.0;

    Widget chip = Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(compact ? 8 : 20),
        border: severity == ChipSeverity.emergency
            ? Border.all(color: colorScheme.error, width: 2)
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (effectiveIcon != null) ...[
            ExcludeSemantics(child: Icon(effectiveIcon, size: iconSize, color: textColor)),
            SizedBox(width: compact ? 4 : 6),
          ],
          Text(
            label,
            style: textTheme.labelMedium?.copyWith(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );

    if (semanticLabel != null) {
      chip = Semantics(label: semanticLabel!, child: chip);
    }

    if (excludeFromSemantics) {
      chip = ExcludeSemantics(child: chip);
    }

    return chip;
  }
}

/// Severity levels for status chips
enum ChipSeverity { info, success, warning, error, emergency }

/// Icon position in chip
enum IconPosition { leading, trailing }