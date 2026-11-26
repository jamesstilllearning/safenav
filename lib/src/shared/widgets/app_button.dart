/// SAFENAV CAVITE - App Buttons
///
/// Reusable button components with consistent styling.
library;

import 'package:material_ui/material_ui.dart' hide NavigationDestination;

import '../../core/theme/app_theme.dart';

/// Primary filled button with consistent styling
class AppFilledButton extends StatelessWidget {
  const AppFilledButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.iconPosition = IconPosition.leading,
    this.isLoading = false,
    this.isDisabled = false,
    this.fullWidth = true,
    this.size = ButtonSize.medium,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
    this.tooltip,
    this.semanticLabel,
    this.excludeFromSemantics = false,
  });

  final VoidCallback? onPressed;
  final String label;
  final IconData? icon;
  final IconPosition iconPosition;
  final bool isLoading;
  final bool isDisabled;
  final bool fullWidth;
  final ButtonSize size;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final BorderRadius? borderRadius;
  final String? tooltip;
  final String? semanticLabel;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final effectiveOnPressed = isDisabled || isLoading ? null : onPressed;
    final (height, horizontalPadding, textStyle, iconSize) = _getSizeConfig(textTheme);

    Widget button = FilledButton(
      onPressed: effectiveOnPressed,
      style: FilledButton.styleFrom(
        minimumSize: fullWidth ? Size(double.infinity, height) : Size(0, height),
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 0),
        backgroundColor: backgroundColor ?? colorScheme.primary,
        foregroundColor: foregroundColor ?? colorScheme.onPrimary,
        textStyle: textStyle,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(AppSpacing.radiusMd),
        ),
        elevation: AppElevation.level1,
      ),
      child: _buildChild(iconSize, context),
    );

    if (tooltip != null) {
      button = Tooltip(message: tooltip!, child: button);
    }

    if (semanticLabel != null) {
      button = Semantics(
        label: semanticLabel!,
        button: true,
        enabled: effectiveOnPressed != null,
        child: button,
      );
    }

    if (excludeFromSemantics) {
      button = ExcludeSemantics(child: button);
    }

    return button;
  }

  Widget _buildChild(double iconSize, BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    if (isLoading) {
      return Semantics(
        label: 'Loading',
        liveRegion: true,
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            strokeWidth: 2.5,
            valueColor: AlwaysStoppedAnimation<Color>(
              foregroundColor ?? colorScheme.onPrimary,
            ),
          ),
        ),
      );
    }

    if (icon == null) {
      return Text(label);
    }

    final children = [
      if (iconPosition == IconPosition.leading)
        ExcludeSemantics(child: Icon(icon!, size: iconSize)),
      if (iconPosition == IconPosition.leading) const SizedBox(width: 8),
      Flexible(child: Text(label, overflow: TextOverflow.ellipsis)),
      if (iconPosition == IconPosition.trailing) const SizedBox(width: 8),
      if (iconPosition == IconPosition.trailing)
        ExcludeSemantics(child: Icon(icon!, size: iconSize)),
    ];

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }

  (double, double, TextStyle, double) _getSizeConfig(TextTheme textTheme) {
    switch (size) {
      case ButtonSize.small:
        return (40.0, 16.0, textTheme.labelLarge!, 18.0);
      case ButtonSize.medium:
        return (48.0, 24.0, textTheme.labelLarge!, 20.0);
      case ButtonSize.large:
        return (56.0, 32.0, textTheme.titleMedium!, 24.0);
    }
  }
}

/// Secondary outlined button
class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.iconPosition = IconPosition.leading,
    this.isLoading = false,
    this.isDisabled = false,
    this.fullWidth = true,
    this.size = ButtonSize.medium,
    this.borderColor,
    this.foregroundColor,
    this.tooltip,
    this.semanticLabel,
    this.excludeFromSemantics = false,
  });

  final VoidCallback? onPressed;
  final String label;
  final IconData? icon;
  final IconPosition iconPosition;
  final bool isLoading;
  final bool isDisabled;
  final bool fullWidth;
  final ButtonSize size;
  final Color? borderColor;
  final Color? foregroundColor;
  final String? tooltip;
  final String? semanticLabel;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final effectiveOnPressed = isDisabled || isLoading ? null : onPressed;
    final (height, horizontalPadding, textStyle, iconSize) = _getSizeConfig(textTheme);
    final effectiveBorderColor = borderColor ?? colorScheme.outline;
    final effectiveForeground = foregroundColor ?? colorScheme.primary;

    Widget button = OutlinedButton(
      onPressed: effectiveOnPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: fullWidth ? Size(double.infinity, height) : Size(0, height),
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 0),
        foregroundColor: effectiveForeground,
        textStyle: textStyle,
        side: BorderSide(color: effectiveBorderColor, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        ),
      ),
      child: _buildChild(iconSize, context),
    );

    if (tooltip != null) {
      button = Tooltip(message: tooltip!, child: button);
    }

    if (semanticLabel != null) {
      button = Semantics(
        label: semanticLabel!,
        button: true,
        enabled: effectiveOnPressed != null,
        child: button,
      );
    }

    if (excludeFromSemantics) {
      button = ExcludeSemantics(child: button);
    }

    return button;
  }

  Widget _buildChild(double iconSize, BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    if (isLoading) {
      return Semantics(
        label: 'Loading',
        liveRegion: true,
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            strokeWidth: 2.5,
            valueColor: AlwaysStoppedAnimation<Color>(foregroundColor ?? colorScheme.primary),
          ),
        ),
      );
    }

    if (icon == null) {
      return Text(label);
    }

    final children = [
      if (iconPosition == IconPosition.leading)
        ExcludeSemantics(child: Icon(icon!, size: iconSize)),
      if (iconPosition == IconPosition.leading) const SizedBox(width: 8),
      Flexible(child: Text(label, overflow: TextOverflow.ellipsis)),
      if (iconPosition == IconPosition.trailing) const SizedBox(width: 8),
      if (iconPosition == IconPosition.trailing)
        ExcludeSemantics(child: Icon(icon!, size: iconSize)),
    ];

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }

  (double, double, TextStyle, double) _getSizeConfig(TextTheme textTheme) {
    switch (size) {
      case ButtonSize.small:
        return (40.0, 16.0, textTheme.labelLarge!, 18.0);
      case ButtonSize.medium:
        return (48.0, 24.0, textTheme.labelLarge!, 20.0);
      case ButtonSize.large:
        return (56.0, 32.0, textTheme.titleMedium!, 24.0);
    }
  }
}

/// Tertiary text button
class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.iconPosition = IconPosition.leading,
    this.isDisabled = false,
    this.fullWidth = false,
    this.size = ButtonSize.medium,
    this.foregroundColor,
    this.tooltip,
    this.semanticLabel,
    this.excludeFromSemantics = false,
  });

  final VoidCallback? onPressed;
  final String label;
  final IconData? icon;
  final IconPosition iconPosition;
  final bool isDisabled;
  final bool fullWidth;
  final ButtonSize size;
  final Color? foregroundColor;
  final String? tooltip;
  final String? semanticLabel;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final effectiveOnPressed = isDisabled ? null : onPressed;
    final (height, horizontalPadding, textStyle, iconSize) = _getSizeConfig(textTheme);
    final effectiveForeground = foregroundColor ?? colorScheme.primary;

    Widget button = TextButton(
      onPressed: effectiveOnPressed,
      style: TextButton.styleFrom(
        minimumSize: fullWidth ? Size(double.infinity, height) : Size(0, height),
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 0),
        foregroundColor: effectiveForeground,
        textStyle: textStyle,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        ),
      ),
      child: _buildChild(iconSize, context),
    );

    if (tooltip != null) {
      button = Tooltip(message: tooltip!, child: button);
    }

    if (semanticLabel != null) {
      button = Semantics(
        label: semanticLabel!,
        button: true,
        enabled: effectiveOnPressed != null,
        child: button,
      );
    }

    if (excludeFromSemantics) {
      button = ExcludeSemantics(child: button);
    }

    return button;
  }

  Widget _buildChild(double iconSize, BuildContext context) {
    if (icon == null) {
      return Text(label);
    }

    final children = [
      if (iconPosition == IconPosition.leading)
        ExcludeSemantics(child: Icon(icon!, size: iconSize)),
      if (iconPosition == IconPosition.leading) const SizedBox(width: 8),
      Flexible(child: Text(label, overflow: TextOverflow.ellipsis)),
      if (iconPosition == IconPosition.trailing) const SizedBox(width: 8),
      if (iconPosition == IconPosition.trailing)
        ExcludeSemantics(child: Icon(icon!, size: iconSize)),
    ];

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }

  (double, double, TextStyle, double) _getSizeConfig(TextTheme textTheme) {
    switch (size) {
      case ButtonSize.small:
        return (40.0, 16.0, textTheme.labelLarge!, 18.0);
      case ButtonSize.medium:
        return (48.0, 24.0, textTheme.labelLarge!, 20.0);
      case ButtonSize.large:
        return (56.0, 32.0, textTheme.titleMedium!, 24.0);
    }
  }
}

/// Emergency/SOS button - large, prominent, with pulse animation
class AppSosButton extends StatefulWidget {
  const AppSosButton({
    super.key,
    required this.onPressed,
    this.label = 'SOS',
    this.size = SosButtonSize.large,
    this.isEnabled = true,
    this.semanticLabel = 'Emergency SOS button. Tap to trigger emergency alert.',
  });

  final VoidCallback onPressed;
  final String label;
  final SosButtonSize size;
  final bool isEnabled;
  final String semanticLabel;

  @override
  State<AppSosButton> createState() => _AppSosButtonState();
}

class _AppSosButtonState extends State<AppSosButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
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
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final (diameter, fontSize, iconSize) = switch (widget.size) {
      SosButtonSize.small => (72.0, 16.0, 28.0),
      SosButtonSize.medium => (88.0, 20.0, 36.0),
      SosButtonSize.large => (104.0, 24.0, 44.0),
    };

    return Semantics(
      label: widget.semanticLabel,
      button: true,
      enabled: widget.isEnabled,
      child: AnimatedBuilder(
        animation: _pulseAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: widget.isEnabled ? _pulseAnimation.value : 1.0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: widget.isEnabled ? widget.onPressed : null,
                borderRadius: BorderRadius.circular(diameter / 2),
                child: Container(
                  width: diameter,
                  height: diameter,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        colorScheme.error,
                        colorScheme.error.withValues(alpha: 0.8),
                      ],
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.error.withValues(alpha: 0.4),
                        blurRadius: 16,
                        spreadRadius: 4,
                        offset: const Offset(0, 4),
                      ),
                      BoxShadow(
                        color: colorScheme.error.withValues(alpha: 0.2),
                        blurRadius: 32,
                        spreadRadius: 8,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ExcludeSemantics(
                          child: Icon(
                            Icons.sos,
                            size: iconSize,
                            color: colorScheme.onError,
                          ),
                        ),
                        if (widget.size != SosButtonSize.small) ...[
                          const SizedBox(height: 4),
                          Text(
                            widget.label,
                            style: textTheme.labelLarge?.copyWith(
                              fontSize: fontSize,
                              fontWeight: FontWeight.w700,
                              color: colorScheme.onError,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Icon button with consistent styling
class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.size = IconButtonSize.medium,
    this.backgroundColor,
    this.foregroundColor,
    this.tooltip,
    this.semanticLabel,
    this.isDisabled = false,
    this.excludeFromSemantics = false,
  });

  final VoidCallback? onPressed;
  final IconData icon;
  final IconButtonSize size;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final String? tooltip;
  final String? semanticLabel;
  final bool isDisabled;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final (diameter, iconSize) = switch (size) {
      IconButtonSize.small => (40.0, 20.0),
      IconButtonSize.medium => (48.0, 24.0),
      IconButtonSize.large => (56.0, 28.0),
    };

    final effectiveOnPressed = isDisabled ? null : onPressed;
    final effectiveBackground = backgroundColor ?? colorScheme.surfaceContainerHighest;
    final effectiveForeground = foregroundColor ?? colorScheme.onSurface;

    Widget button = Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: effectiveOnPressed,
        borderRadius: BorderRadius.circular(diameter / 2),
        child: Container(
          width: diameter,
          height: diameter,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: effectiveBackground,
            shape: BoxShape.circle,
          ),
          child: ExcludeSemantics(child: Icon(icon, size: iconSize, color: effectiveForeground)),
        ),
      ),
    );

    if (tooltip != null) {
      button = Tooltip(message: tooltip!, child: button);
    }

    if (semanticLabel != null) {
      button = Semantics(
        label: semanticLabel!,
        button: true,
        enabled: effectiveOnPressed != null,
        child: button,
      );
    }

    if (excludeFromSemantics) {
      button = ExcludeSemantics(child: button);
    }

    return button;
  }
}

/// Segmented button for mutually exclusive options
class AppSegmentedButton<T> extends StatelessWidget {
  const AppSegmentedButton({
    super.key,
    required this.segments,
    required this.selected,
    required this.onSelectionChanged,
    this.multiSelectionEnabled = false,
  });

  final List<ButtonSegment<T>> segments;
  final Set<T> selected;
  final ValueChanged<Set<T>> onSelectionChanged;
  final bool multiSelectionEnabled;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<T>(
      segments: segments,
      selected: selected,
      onSelectionChanged: onSelectionChanged,
      multiSelectionEnabled: multiSelectionEnabled,
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSpacing.radiusMd)),
        ),
      ),
    );
  }
}

/// Button size variants
enum ButtonSize { small, medium, large }

/// SOS button size variants
enum SosButtonSize { small, medium, large }

/// Icon button size variants
enum IconButtonSize { small, medium, large }

/// Icon position in button
enum IconPosition { leading, trailing }

// Global navigator key for accessing context in static methods
final navigatorKey = GlobalKey<NavigatorState>();