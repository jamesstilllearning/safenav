/// SAFENAV CAVITE - Destination Details Bottom Sheet
///
/// Bottom sheet showing destination details with option to set as destination.
library;

import 'dart:math';

import 'package:material_ui/material_ui.dart' hide NavigationDestination;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../shared/widgets/widgets.dart';
import '../../../data/models/navigation_models.dart';
import '../../providers/navigation_providers.dart';
import '../../providers/navigation_controller.dart';

/// Bottom sheet showing destination details with option to set as destination
class DestinationDetailsBottomSheet extends ConsumerWidget {
  final NavigationDestination destination;
  final NavigationStartPoint? startPoint;
  final VoidCallback? onSetAsDestination;
  final VoidCallback? onDismiss;

  const DestinationDetailsBottomSheet({
    super.key,
    required this.destination,
    this.startPoint,
    this.onSetAsDestination,
    this.onDismiss,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final typeColor = _getTypeColor(destination.type);
    final typeIcon = _getTypeIcon(destination.type);

    // Calculate distance from start if available
    String? distanceText;
    String? durationText;
    final sp = startPoint; // Local variable for null safety promotion
    if (sp != null && sp.coordinates != null) {
      final distance = _calculateDistance(sp.coordinates!, destination.coordinates);
      distanceText = _formatDistance(distance);
      durationText = _formatDuration(distance);
    }

    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.4,
      maxChildSize: 0.85,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              // Handle bar
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: colorScheme.outlineVariant,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              // Content
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(20),
                  children: [
                    // Destination header
                    Row(
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: typeColor.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(typeIcon, color: typeColor, size: 28),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                destination.name,
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              AppChip(
                                label: destination.type.displayName,
                                backgroundColor: typeColor.withValues(alpha: 0.1),
                                labelStyle: TextStyle(
                                  color: typeColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.close, color: colorScheme.outline),
                          onPressed: () {
                            onDismiss?.call();
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Location details
                    if (destination.indoorDescription != null) ...[
                      _DetailRow(
                        icon: Icons.location_on_outlined,
                        label: 'Location',
                        value: destination.indoorDescription!,
                        iconColor: typeColor,
                      ),
                      const SizedBox(height: 12),
                    ],

                    if (destination.description != null) ...[
                      _DetailRow(
                        icon: Icons.info_outline,
                        label: 'Type',
                        value: destination.description!,
                        iconColor: typeColor,
                      ),
                      const SizedBox(height: 12),
                    ],

                    // Coordinates
                    _DetailRow(
                      icon: Icons.gps_fixed_outlined,
                      label: 'Coordinates',
                      value: '${destination.coordinates.latitude.toStringAsFixed(6)}, ${destination.coordinates.longitude.toStringAsFixed(6)}',
                      iconColor: colorScheme.outline,
                    ),

                    const SizedBox(height: 24),

                    // Distance from start (if available)
                    if (distanceText != null && durationText != null) ...[
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: colorScheme.primaryContainer.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: colorScheme.primary.withValues(alpha: 0.3)),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: _DistanceInfo(
                                icon: Icons.straighten_outlined,
                                label: 'Distance',
                                value: distanceText,
                                color: colorScheme.primary,
                              ),
                            ),
                            Container(
                              width: 1,
                              height: 40,
                              color: colorScheme.outlineVariant,
                            ),
                            Expanded(
                              child: _DistanceInfo(
                                icon: Icons.access_time_outlined,
                                label: 'Est. Time',
                                value: durationText,
                                color: colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],

                    // Start point info
                    if (startPoint != null) ...[
                      _DetailRow(
                        icon: Icons.my_location_outlined,
                        label: 'Starting From',
                        value: startPoint!.displayName,
                        iconColor: colorScheme.primary,
                      ),
                      const SizedBox(height: 24),
                    ],

                    // Emergency badges
                    if (destination.isEmergencyExit || destination.isAssemblyPoint) ...[
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: destination.isEmergencyExit
                              ? Colors.red.withValues(alpha: 0.1)
                              : Colors.orange.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: destination.isEmergencyExit
                                ? Colors.red.withValues(alpha: 0.3)
                                : Colors.orange.withValues(alpha: 0.3),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              destination.isEmergencyExit ? Icons.emergency : Icons.groups,
                              color: destination.isEmergencyExit ? Colors.red : Colors.orange,
                              size: 20,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                destination.isEmergencyExit
                                    ? 'Emergency Exit - Use for evacuation'
                                    : 'Assembly Point - Safe gathering area',
                                style: TextStyle(
                                  color: destination.isEmergencyExit ? Colors.red.shade700 : Colors.orange.shade700,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],

                    // Action buttons
                    Row(
                      children: [
                        Expanded(
                          child: AppOutlinedButton(
                            onPressed: () {
                              onDismiss?.call();
                              Navigator.of(context).pop();
                            },
                            label: 'Cancel',
                            icon: Icons.close,
                            iconPosition: IconPosition.leading,
                            size: ButtonSize.large,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: AppFilledButton(
                            onPressed: () {
                              onSetAsDestination?.call();
                              Navigator.of(context).pop();
                            },
                            label: 'Set as Destination',
                            icon: Icons.flag,
                            iconPosition: IconPosition.leading,
                            size: ButtonSize.large,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Start navigation button (if route is already computed)
                    Consumer(
                      builder: (context, ref, child) {
                        final routeAsync = ref.watch(navigationRouteProvider);
                        return routeAsync.when(
                          data: (route) {
                            if (route != null && route.end.id == destination.id) {
                              return AppFilledButton(
                                onPressed: () {
                                  ref.read(navigationControllerProvider.notifier).beginActiveNavigation(route);
                                  Navigator.of(context).pop();
                                },
                                label: 'Start Navigation',
                                icon: Icons.navigation,
                                iconPosition: IconPosition.leading,
                                size: ButtonSize.large,
                                backgroundColor: Colors.green,
                              );
                            }
                            return const SizedBox.shrink();
                          },
                          loading: () => const SizedBox.shrink(),
                          error: (_, __) => const SizedBox.shrink(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Color _getTypeColor(DestinationType type) {
    return type.when(
      building: () => Colors.blue,
      location: () => Colors.green,
      coordinates: () => Colors.orange,
      emergencyExit: () => Colors.red,
      assemblyPoint: () => Colors.purple,
      room: () => Colors.indigo,
      facility: () => Colors.teal,
    );
  }

  IconData _getTypeIcon(DestinationType type) {
    return type.when(
      building: () => Icons.apartment_outlined,
      location: () => Icons.location_on_outlined,
      coordinates: () => Icons.gps_fixed_outlined,
      emergencyExit: () => Icons.emergency_outlined,
      assemblyPoint: () => Icons.groups_outlined,
      room: () => Icons.meeting_room_outlined,
      facility: () => Icons.business_outlined,
    );
  }

  double _calculateDistance(LatLng start, LatLng end) {
    const double earthRadius = 6371000.0;
    final dLat = _toRadians(end.latitude - start.latitude);
    final dLon = _toRadians(end.longitude - start.longitude);
    final lat1 = _toRadians(start.latitude);
    final lat2 = _toRadians(end.latitude);

    final sinDLat = sin(dLat / 2);
    final sinDLon = sin(dLon / 2);
    final a = sinDLat * sinDLat + sinDLon * sinDLon * cos(lat1) * cos(lat2);
    final c = 2 * asin(sqrt(a));
    return earthRadius * c;
  }

  String _formatDistance(double meters) {
    if (meters < 1000) {
      return '${meters.round()} m';
    } else {
      return '${(meters / 1000).toStringAsFixed(1)} km';
    }
  }

  String _formatDuration(double meters) {
    // Assume average walking speed of 1.4 m/s
    final seconds = (meters / 1.4).round();
    final minutes = seconds ~/ 60;
    if (minutes < 1) return '< 1 min';
    if (minutes < 60) return '$minutes min';
    final hours = minutes ~/ 60;
    final remainingMinutes = minutes % 60;
    return remainingMinutes > 0 ? '${hours}h ${remainingMinutes}m' : '${hours}h';
  }

  double _toRadians(double degrees) => degrees * pi / 180.0;
}

/// Helper function to show the destination details bottom sheet
Future<void> showDestinationDetailsBottomSheet({
  required BuildContext context,
  required NavigationDestination destination,
  required NavigationStartPoint? startPoint,
  NavigationRoute? existingRoute,
  required VoidCallback onStartNavigation,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => DestinationDetailsBottomSheet(
      destination: destination,
      startPoint: startPoint,
      onSetAsDestination: onStartNavigation,
      onDismiss: () {},
    ),
  );
}

/// Detail row widget
class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color iconColor;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: iconColor, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Distance info widget
class _DistanceInfo extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _DistanceInfo({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: color,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}