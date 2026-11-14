/// SAFENAV CAVITE - App Divider
///
/// Reusable divider components with consistent styling.
library;

import 'package:flutter/material.dart';

/// Standard divider with consistent styling
class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
    this.height = 1,
    this.thickness,
    this.color,
    this.indent = 0,
    this.endIndent = 0,
    this.vertical = false,
  });

  final double height;
  final double? thickness;
  final Color? color;
  final double indent;
  final double endIndent;
  final bool vertical;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (vertical) {
      return VerticalDivider(
        width: height,
        thickness: thickness ?? 1,
        color: color ?? colorScheme.outlineVariant,
        indent: indent,
        endIndent: endIndent,
      );
    }

    return Divider(
      height: height,
      thickness: thickness ?? 1,
      color: color ?? colorScheme.outlineVariant,
      indent: indent,
      endIndent: endIndent,
    );
  }
}

/// Divider with label in the middle
class AppLabeledDivider extends StatelessWidget {
  const AppLabeledDivider({
    super.key,
    required this.label,
    this.color,
    this.labelStyle,
    this.thickness = 1,
    this.indent = 16,
    this.endIndent = 16,
  });

  final String label;
  final Color? color;
  final TextStyle? labelStyle;
  final double thickness;
  final double indent;
  final double endIndent;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final effectiveColor = color ?? colorScheme.outlineVariant;
    final effectiveLabelStyle = labelStyle ??
        textTheme.labelSmall?.copyWith(
          color: colorScheme.onSurfaceVariant,
          fontWeight: FontWeight.w500,
        );

    return Row(
      children: [
        Expanded(
          child: Divider(
            color: effectiveColor,
            thickness: thickness,
            indent: indent,
            endIndent: 8,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(label, style: effectiveLabelStyle),
        ),
        Expanded(
          child: Divider(
            color: effectiveColor,
            thickness: thickness,
            indent: 8,
            endIndent: endIndent,
          ),
        ),
      ],
    );
  }
}

/// Dashed divider
class AppDashedDivider extends StatelessWidget {
  const AppDashedDivider({
    super.key,
    this.height = 1,
    this.color,
    this.dashWidth = 5,
    this.dashGap = 3,
    this.indent = 0,
    this.endIndent = 0,
  });

  final double height;
  final Color? color;
  final double dashWidth;
  final double dashGap;
  final double indent;
  final double endIndent;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return CustomPaint(
      size: Size(double.infinity, height),
      painter: _DashedLinePainter(
        color: color ?? colorScheme.outlineVariant,
        dashWidth: dashWidth,
        dashGap: dashGap,
        thickness: 1,
      ),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  _DashedLinePainter({
    required this.color,
    required this.dashWidth,
    required this.dashGap,
    required this.thickness,
  });

  final Color color;
  final double dashWidth;
  final double dashGap;
  final double thickness;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = thickness
      ..style = PaintingStyle.stroke;

    double startX = 0;
    while (startX < size.width) {
      final endX = (startX + dashWidth).clamp(0.0, size.width);
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(endX, size.height / 2),
        paint,
      );
      startX += dashWidth + dashGap;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

/// Spacer divider for vertical spacing
class AppSpacer extends StatelessWidget {
  const AppSpacer({
    super.key,
    this.height = 16,
    this.color,
  });

  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

/// Section divider with more visual weight
class SectionDivider extends StatelessWidget {
  const SectionDivider({
    super.key,
    this.color,
    this.thickness = 2,
    this.indent = 0,
    this.endIndent = 0,
  });

  final Color? color;
  final double thickness;
  final double indent;
  final double endIndent;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Divider(
      color: color ?? colorScheme.outline,
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
      height: 24,
    );
  }
}

/// Card divider for internal card separation
class CardDivider extends StatelessWidget {
  const CardDivider({
    super.key,
    this.indent = 16,
    this.endIndent = 16,
  });

  final double indent;
  final double endIndent;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Divider(
      color: colorScheme.outlineVariant,
      thickness: 1,
      indent: indent,
      endIndent: endIndent,
      height: 1,
    );
  }
}

/// List tile divider with proper indentation
class ListTileDivider extends StatelessWidget {
  const ListTileDivider({
    super.key,
    this.leadingWidth = 72,
    this.color,
    this.indent = 0,
    this.endIndent = 0,
  });

  final double leadingWidth;
  final Color? color;
  final double indent;
  final double endIndent;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Divider(
      color: color ?? colorScheme.outlineVariant,
      thickness: 1,
      indent: leadingWidth + indent,
      endIndent: endIndent,
      height: 1,
    );
  }
}