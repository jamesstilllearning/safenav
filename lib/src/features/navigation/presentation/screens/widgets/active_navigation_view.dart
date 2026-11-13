/// SAFENAV CAVITE - Active Navigation View
///
/// Full-screen view for active turn-by-turn navigation.
library;

import 'package:flutter/material.dart' hide NavigationDestination;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

import '../../providers/navigation_providers.dart';
import '../../../data/models/navigation_models.dart';
import '../../../../map/presentation/providers/map_providers.dart';

/// Height of the bottom navigation bar in the main shell (Material 3 NavigationBar)
const double _kBottomNavigationBarHeight = 80.0;

/// Full-screen active navigation view
class ActiveNavigationView extends ConsumerStatefulWidget {
  final NavigationSession session;
  final VoidCallback onEndNavigation;

  const ActiveNavigationView({
    super.key,
    required this.session,
    required this.onEndNavigation,
  });

  @override
  ConsumerState<ActiveNavigationView> createState() => _ActiveNavigationViewState();
}

class _ActiveNavigationViewState extends ConsumerState<ActiveNavigationView> {
  final MapController _mapController = MapController();
  bool _isFollowing = true; // Auto-follow user location

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final session = widget.session;
    final route = session.route;
    final currentInstruction = session.currentInstruction;
    final viewState = ref.watch(mapViewStateProvider);

    // Build tile layer based on map type
    final tileLayer = switch (viewState.mapType) {
      MapType.satellite => TileLayer(
          // ESRI World Imagery - free satellite imagery
          urlTemplate: 'https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}',
          maxZoom: 19,
          userAgentPackageName: 'com.earist.safenav',
        ),
      MapType.standard => TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          maxZoom: 19,
          subdomains: const ['a', 'b', 'c'],
          userAgentPackageName: 'com.earist.safenav',
        ),
    };

    // Use a Column layout instead of Stack with Positioned to naturally
    // leave space for the parent shell's bottom NavigationBar.
    // The map takes remaining space, and bottom cards are at the bottom
    // above the navigation bar.
    return Stack(
      children: [
        // Map with route overlay - fills the entire available space
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            initialCenter: session.currentPosition,
            initialZoom: 18.0,
            minZoom: 15.0,
            maxZoom: 20.0,
            interactionOptions: const InteractionOptions(
              flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
            ),
          ),
          children: [
            // Tile layer
            tileLayer,
            // Route polyline
            PolylineLayer(
              polylines: [
                Polyline(
                  points: route.geometry,
                  color: colorScheme.primary,
                  strokeWidth: 5.0,
                  // pattern: StrokePattern.solid, // Default is solid
                ),
              ],
            ),
            // Remaining route (from current position)
            if (session.currentInstructionIndex < route.instructions.length - 1)
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: _getRemainingRouteGeometry(session),
                    color: colorScheme.primary.withValues(alpha: 0.5),
                    strokeWidth: 3.0,
                    pattern: StrokePattern.dashed(segments: [10, 5]),
                  ),
                ],
              ),
            // Current location marker
            MarkerLayer(
              markers: [
                Marker(
                  point: session.currentPosition,
                  width: 48,
                  height: 48,
                  child: Container(
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: colorScheme.onPrimary,
                        width: 3,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.navigation,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
                // Destination marker
                if (session.currentInstructionIndex < route.instructions.length - 1)
                  Marker(
                    point: route.end.coordinates,
                    width: 40,
                    height: 40,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 3,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.3),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.flag,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),

        // Top bar with destination info
        Positioned(
          top: MediaQuery.of(context).padding.top,
          left: 16,
          right: 16,
          child: _TopNavigationBar(
            session: session,
            onEndNavigation: widget.onEndNavigation,
            onToggleFollow: () => setState(() => _isFollowing = !_isFollowing),
            isFollowing: _isFollowing,
          ),
        ),

        // Bottom instruction cards - positioned above the bottom navigation bar
        Positioned(
          bottom: _kBottomNavigationBarHeight,
          left: 0,
          right: 0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Next instruction preview (above current)
              if (session.currentInstructionIndex < route.instructions.length - 2)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: _NextInstructionPreview(
                    instruction: route.instructions[session.currentInstructionIndex + 1],
                  ),
                ),
              // Current instruction card (bottom)
              _CurrentInstructionCard(
                instruction: currentInstruction,
                stepNumber: session.currentInstructionIndex + 1,
                totalSteps: route.instructions.length,
                distanceToNext: currentInstruction.distanceToNext,
                onNextInstruction: _advanceInstruction,
                onPreviousInstruction: _previousInstruction,
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<LatLng> _getRemainingRouteGeometry(NavigationSession session) {
    final route = session.route;
    // Simplified: return geometry from current instruction position to end
    if (session.currentInstructionIndex >= route.instructions.length - 1) {
      return [];
    }
    final currentPos = route.instructions[session.currentInstructionIndex].position;
    return [currentPos, route.end.coordinates];
  }

  void _advanceInstruction() {
    if (widget.session.currentInstructionIndex < widget.session.route.instructions.length - 1) {
      ref.read(navigationSessionProvider.notifier).state = widget.session.copyWith(
        currentInstructionIndex: widget.session.currentInstructionIndex + 1,
      );
    } else {
      // Arrived at destination
      _handleArrival();
    }
  }

  void _previousInstruction() {
    if (widget.session.currentInstructionIndex > 0) {
      ref.read(navigationSessionProvider.notifier).state = widget.session.copyWith(
        currentInstructionIndex: widget.session.currentInstructionIndex - 1,
      );
    }
  }

  void _handleArrival() {
    ref.read(navigationSessionProvider.notifier).state = widget.session.copyWith(
      completedAt: DateTime.now(),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('You have arrived at your destination!'),
        backgroundColor: Colors.green,
      ),
    );
  }
}

/// Top navigation bar during active navigation
class _TopNavigationBar extends StatelessWidget {
  final NavigationSession session;
  final VoidCallback onEndNavigation;
  final VoidCallback onToggleFollow;
  final bool isFollowing;

  const _TopNavigationBar({
    required this.session,
    required this.onEndNavigation,
    required this.onToggleFollow,
    required this.isFollowing,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final route = session.route;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Destination info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Navigating to',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  route.end.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          // Stats
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                route.formattedDistance,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                route.formattedDuration,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          // Action buttons
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(isFollowing ? Icons.gps_fixed : Icons.gps_not_fixed),
                onPressed: onToggleFollow,
                tooltip: isFollowing ? 'Disable auto-follow' : 'Enable auto-follow',
                style: IconButton.styleFrom(
                  backgroundColor: isFollowing ? colorScheme.primary : colorScheme.surfaceContainerHighest,
                  foregroundColor: isFollowing ? Colors.white : colorScheme.onSurface,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: onEndNavigation,
                tooltip: 'End navigation',
                style: IconButton.styleFrom(
                  backgroundColor: Colors.red.withValues(alpha: 0.1),
                  foregroundColor: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Current instruction card at bottom
class _CurrentInstructionCard extends StatelessWidget {
  final NavigationInstruction instruction;
  final int stepNumber;
  final int totalSteps;
  final double distanceToNext;
  final VoidCallback onNextInstruction;
  final VoidCallback onPreviousInstruction;

  const _CurrentInstructionCard({
    required this.instruction,
    required this.stepNumber,
    required this.totalSteps,
    required this.distanceToNext,
    required this.onNextInstruction,
    required this.onPreviousInstruction,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 12,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Progress indicator
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: (stepNumber - 1) / (totalSteps - 1).clamp(1, double.infinity),
                    backgroundColor: colorScheme.surfaceContainerHighest,
                    color: colorScheme.primary,
                    minHeight: 4,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Step $stepNumber of $totalSteps',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Instruction content
            Row(
              children: [
                // Instruction icon
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    _getInstructionIcon(instruction.type),
                    size: 32,
                    color: colorScheme.primary,
                  ),
                ),

                const SizedBox(width: 16),

                // Instruction text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        instruction.instruction,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (instruction.distanceToNext > 0) ...[
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.straighten_outlined,
                              size: 16,
                              color: colorScheme.onSurfaceVariant,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${distanceToNext.round()} meters',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Navigation controls
            Row(
              children: [
                // Previous
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: stepNumber > 1 ? onPreviousInstruction : null,
                    icon: const Icon(Icons.chevron_left),
                    label: const Text('Previous'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Next/Arrive
                Expanded(
                  child: FilledButton.icon(
                    onPressed: onNextInstruction,
                    icon: Icon(_isArrive(instruction.type) ? Icons.check_circle : Icons.chevron_right),
                    label: Text(_isArrive(instruction.type) ? 'Arrived' : 'Next'),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: _isArrive(instruction.type) ? Colors.green : null,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool _isArrive(InstructionType type) {
    return type.maybeWhen(
      arrive: () => true,
      orElse: () => false,
    );
  }

  IconData _getInstructionIcon(InstructionType type) {
    return type.when(
      start: () => Icons.navigation,
      continueStraight: () => Icons.arrow_upward,
      turnLeft: () => Icons.turn_left,
      turnRight: () => Icons.turn_right,
      turnSlightLeft: () => Icons.turn_slight_left,
      turnSlightRight: () => Icons.turn_slight_right,
      uturn: () => Icons.u_turn_left,
      arrive: () => Icons.location_on,
      enterBuilding: () => Icons.door_front_door,
      exitBuilding: () => Icons.exit_to_app,
    );
  }
}

/// Next instruction preview
class _NextInstructionPreview extends StatelessWidget {
  final NavigationInstruction instruction;

  const _NextInstructionPreview({required this.instruction});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: colorScheme.primary.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              _getInstructionIcon(instruction.type),
              size: 18,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Then',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  instruction.instruction,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          if (instruction.distanceToNext > 0)
            Text(
              '${instruction.distanceToNext.round()}m',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
        ],
      ),
    );
  }

  IconData _getInstructionIcon(InstructionType type) {
      return type.when(
        start: () => Icons.navigation,
        continueStraight: () => Icons.arrow_upward,
        turnLeft: () => Icons.turn_left,
        turnRight: () => Icons.turn_right,
        turnSlightLeft: () => Icons.turn_slight_left,
        turnSlightRight: () => Icons.turn_slight_right,
        uturn: () => Icons.u_turn_left,
        arrive: () => Icons.location_on,
        enterBuilding: () => Icons.door_front_door,
        exitBuilding: () => Icons.exit_to_app,
      );
    }
  }