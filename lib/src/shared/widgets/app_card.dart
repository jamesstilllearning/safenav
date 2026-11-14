/// SAFENAV CAVITE - App Card
///
/// Reusable card component with consistent styling across the app.
library;

import 'package:flutter/material.dart';

/// A card with consistent elevation, shape, and styling
class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.margin = EdgeInsets.zero,
    this.elevation,
    this.color,
    this.borderRadius,
    this.border,
    this.onTap,
    this.inkWell = false,
    this.semanticLabel,
    this.excludeFromSemantics = false,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final double? elevation;
  final Color? color;
  final BorderRadius? borderRadius;
  final BorderSide? border;
  final VoidCallback? onTap;
  final bool inkWell;
  final String? semanticLabel;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final cardTheme = Theme.of(context).cardTheme;

    final effectiveElevation = elevation ?? cardTheme.elevation ?? 1;
    final effectiveColor = color ?? cardTheme.color ?? colorScheme.surface;
    final effectiveBorderRadius = borderRadius ?? BorderRadius.circular(12);
    final effectiveBorder = border ??
        BorderSide(
          color: colorScheme.outlineVariant,
          width: 1,
        );

    Widget card = Card(
      elevation: effectiveElevation,
      margin: margin,
      color: effectiveColor,
      shape: RoundedRectangleBorder(
        borderRadius: effectiveBorderRadius,
        side: effectiveBorder,
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: padding,
        child: child,
      ),
    );

    if (onTap != null) {
      if (inkWell) {
        card = InkWell(
          onTap: onTap,
          borderRadius: effectiveBorderRadius,
          child: card,
        );
      } else {
        card = Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: effectiveBorderRadius,
            child: card,
          ),
        );
      }
    }

    if (semanticLabel != null) {
      card = Semantics(
        label: semanticLabel!,
        button: onTap != null,
        enabled: onTap != null,
        child: card,
      );
    }

    if (excludeFromSemantics) {
      card = ExcludeSemantics(child: card);
    }

    return card;
  }
}

/// Outlined card variant with transparent background
class AppOutlinedCard extends StatelessWidget {
  const AppOutlinedCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.margin = EdgeInsets.zero,
    this.borderRadius,
    this.borderColor,
    this.onTap,
    this.semanticLabel,
    this.excludeFromSemantics = false,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final VoidCallback? onTap;
  final String? semanticLabel;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final effectiveBorderRadius = borderRadius ?? BorderRadius.circular(12);
    final effectiveBorderColor = borderColor ?? colorScheme.outlineVariant;

    Widget card = Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: effectiveBorderRadius,
        border: Border.all(color: effectiveBorderColor, width: 1.5),
      ),
      child: child,
    );

    if (onTap != null) {
      card = InkWell(
        onTap: onTap,
        borderRadius: effectiveBorderRadius,
        child: card,
      );
    }

    if (semanticLabel != null) {
      card = Semantics(
        label: semanticLabel!,
        button: onTap != null,
        enabled: onTap != null,
        child: card,
      );
    }

    if (excludeFromSemantics) {
      card = ExcludeSemantics(child: card);
    }

    return card;
  }
}

/// Elevated card variant for primary content
class AppElevatedCard extends StatelessWidget {
  const AppElevatedCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.margin = EdgeInsets.zero,
    this.borderRadius,
    this.elevation = 3,
    this.onTap,
    this.semanticLabel,
    this.excludeFromSemantics = false,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final BorderRadius? borderRadius;
  final double elevation;
  final VoidCallback? onTap;
  final String? semanticLabel;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final effectiveBorderRadius = borderRadius ?? BorderRadius.circular(16);

    Widget card = Card(
      elevation: elevation,
      margin: margin,
      color: colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: effectiveBorderRadius),
      shadowColor: colorScheme.shadow,
      child: Padding(
        padding: padding,
        child: child,
      ),
    );

    if (onTap != null) {
      card = InkWell(
        onTap: onTap,
        borderRadius: effectiveBorderRadius,
        child: card,
      );
    }

    if (semanticLabel != null) {
      card = Semantics(
        label: semanticLabel!,
        button: onTap != null,
        enabled: onTap != null,
        child: card,
      );
    }

    if (excludeFromSemantics) {
      card = ExcludeSemantics(child: card);
    }

    return card;
  }
}