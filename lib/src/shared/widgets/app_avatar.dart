/// SAFENAV CAVITE - App Avatar
///
/// Reusable avatar components for user profiles and initials.
library;

import 'package:material_ui/material_ui.dart';

/// User avatar with image, initials, or icon fallback
class AppAvatar extends StatelessWidget {
  const AppAvatar({
    super.key,
    this.imageUrl,
    this.name,
    this.radius = 24,
    this.backgroundColor,
    this.foregroundColor,
    this.border,
    this.onTap,
    this.tooltip,
    this.semanticLabel,
    this.shape = AvatarShape.circle,
  });

  final String? imageUrl;
  final String? name;
  final double radius;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final BoxBorder? border;
  final VoidCallback? onTap;
  final String? tooltip;
  final String? semanticLabel;
  final AvatarShape shape;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final effectiveBackground = backgroundColor ?? _getColorFromName(name, colorScheme);
    final effectiveForeground = foregroundColor ?? colorScheme.onPrimaryContainer;
    final initials = _getInitials(name);
    final fontSize = radius * 0.5;

    Widget avatar = CircleAvatar(
      radius: radius,
      backgroundColor: effectiveBackground,
      foregroundColor: effectiveForeground,
      backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
      child: imageUrl == null
          ? Text(
              initials,
              style: textTheme.titleMedium?.copyWith(
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
                color: effectiveForeground,
              ),
            )
          : null,
    );

    if (shape == AvatarShape.roundedSquare) {
      avatar = ClipRRect(
        borderRadius: BorderRadius.circular(radius * 0.3),
        child: avatar,
      );
    }

    if (border != null) {
      avatar = Container(
        decoration: BoxDecoration(
          shape: shape == AvatarShape.circle ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: shape == AvatarShape.roundedSquare
              ? BorderRadius.circular(radius * 0.3)
              : null,
          border: border,
        ),
        child: avatar,
      );
    }

    if (onTap != null) {
      avatar = InkWell(
        onTap: onTap,
        borderRadius: shape == AvatarShape.circle
            ? BorderRadius.circular(radius)
            : BorderRadius.circular(radius * 0.3),
        child: avatar,
      );
    }

    if (tooltip != null) {
      avatar = Tooltip(message: tooltip!, child: avatar);
    }

    if (semanticLabel != null) {
      avatar = Semantics(label: semanticLabel!, child: avatar);
    }

    return avatar;
  }

  String _getInitials(String? name) {
    if (name == null || name.trim().isEmpty) {
      return '?';
    }
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.length == 1) {
      return parts[0][0].toUpperCase();
    }
    return '${parts[0][0]}${parts[parts.length - 1][0]}'.toUpperCase();
  }

  Color _getColorFromName(String? name, ColorScheme colorScheme) {
    if (name == null || name.trim().isEmpty) {
      return colorScheme.primaryContainer;
    }
    // Generate consistent color from name hash
    final hash = name.hashCode;
    final colors = [
      colorScheme.primaryContainer,
      colorScheme.secondaryContainer,
      colorScheme.tertiaryContainer,
      colorScheme.errorContainer,
      colorScheme.surfaceContainerHigh,
      colorScheme.surfaceContainerHighest,
      colorScheme.surfaceContainer,
      colorScheme.outlineVariant,
      colorScheme.primaryContainer,
      colorScheme.errorContainer,
    ];
    return colors[hash.abs() % colors.length];
  }
}

/// Avatar with status indicator
class AppAvatarWithStatus extends StatelessWidget {
  const AppAvatarWithStatus({
    super.key,
    this.imageUrl,
    this.name,
    this.radius = 24,
    this.status = AvatarStatus.none,
    this.statusSize,
    this.statusPosition = AvatarStatusPosition.bottomRight,
    this.backgroundColor,
    this.foregroundColor,
    this.border,
    this.onTap,
    this.tooltip,
    this.semanticLabel,
    this.shape = AvatarShape.circle,
  });

  final String? imageUrl;
  final String? name;
  final double radius;
  final AvatarStatus status;
  final double? statusSize;
  final AvatarStatusPosition statusPosition;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final BoxBorder? border;
  final VoidCallback? onTap;
  final String? tooltip;
  final String? semanticLabel;
  final AvatarShape shape;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final effectiveStatusSize = statusSize ?? radius * 0.4;
    final statusColor = _getStatusColor(status, colorScheme);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        AppAvatar(
          imageUrl: imageUrl,
          name: name,
          radius: radius,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          border: border,
          onTap: onTap,
          tooltip: tooltip,
          semanticLabel: semanticLabel,
          shape: shape,
        ),
        if (status != AvatarStatus.none)
          Positioned(
            right: statusPosition == AvatarStatusPosition.bottomRight ||
                    statusPosition == AvatarStatusPosition.topRight
                ? -effectiveStatusSize / 3
                : null,
            left: statusPosition == AvatarStatusPosition.bottomLeft ||
                    statusPosition == AvatarStatusPosition.topLeft
                ? -effectiveStatusSize / 3
                : null,
            bottom: statusPosition == AvatarStatusPosition.bottomRight ||
                    statusPosition == AvatarStatusPosition.bottomLeft
                ? -effectiveStatusSize / 3
                : null,
            top: statusPosition == AvatarStatusPosition.topRight ||
                    statusPosition == AvatarStatusPosition.topLeft
                ? -effectiveStatusSize / 3
                : null,
            child: Container(
              width: effectiveStatusSize,
              height: effectiveStatusSize,
              decoration: BoxDecoration(
                color: statusColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: colorScheme.surface,
                  width: 2,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Color _getStatusColor(AvatarStatus status, ColorScheme colorScheme) {
    switch (status) {
      case AvatarStatus.online:
        return colorScheme.secondary;
      case AvatarStatus.busy:
        return colorScheme.error;
      case AvatarStatus.away:
        return colorScheme.tertiary;
      case AvatarStatus.offline:
        return colorScheme.outline;
      case AvatarStatus.emergency:
        return colorScheme.error;
      case AvatarStatus.none:
        return Colors.transparent;
    }
  }
}

/// Avatar group for multiple users
class AppAvatarGroup extends StatelessWidget {
  const AppAvatarGroup({
    super.key,
    required this.avatars,
    this.maxVisible = 5,
    this.radius = 20,
    this.overlap = 0.3,
    this.onTap,
    this.remainingLabel,
  });

  final List<Widget> avatars;
  final int maxVisible;
  final double radius;
  final double overlap;
  final VoidCallback? onTap;
  final String? remainingLabel;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final visibleAvatars = avatars.take(maxVisible).toList();
    final remaining = avatars.length - maxVisible;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...visibleAvatars.asMap().entries.map((entry) {
          final index = entry.key;
          final avatar = entry.value;
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 0 : -radius * 2 * overlap,
            ),
            child: avatar,
          );
        }),
        if (remaining > 0)
          Padding(
            padding: EdgeInsets.only(left: -radius * 2 * overlap),
            child: CircleAvatar(
              radius: radius,
              backgroundColor: colorScheme.surfaceContainerHighest,
              child: Text(
                remainingLabel ?? '+$remaining',
                style: textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

/// Avatar shape variants
enum AvatarShape { circle, roundedSquare }

/// Avatar status variants
enum AvatarStatus { none, online, busy, away, offline, emergency }

/// Avatar status position variants
enum AvatarStatusPosition {
  bottomRight,
  bottomLeft,
  topRight,
  topLeft,
}