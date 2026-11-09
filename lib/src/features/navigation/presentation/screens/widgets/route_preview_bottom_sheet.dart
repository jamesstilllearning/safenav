/// SAFENAV CAVITE - Route Preview Widgets
///
/// Widgets for displaying route previews and active navigation.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/navigation_models.dart';

/// Route preview card for main content area
class RoutePreviewCard extends ConsumerWidget {
  final NavigationRoute route;
  final void Function(NavigationRoute) onStartNavigation;
  final VoidCallback onClearRoute;

  const RoutePreviewCard({
    super.key,
    required this.route,
    required this.onStartNavigation,
    required this.onClearRoute,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorScheme.primary.withValues(alpha: 0.1),
              colorScheme.primaryContainer.withValues(alpha: 0.1),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.route_outlined, color: Colors.white, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Route Ready',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.primary,
                        ),
                      ),
                      Text(
                        '${route.start.name} → ${route.end.name}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close, color: colorScheme.outline),
                  onPressed: onClearRoute,
                  tooltip: 'Clear route',
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Route stats
            Row(
              children: [
                _StatChip(
                  icon: Icons.straighten_outlined,
                  label: route.formattedDistance,
                  color: colorScheme.primary,
                ),
                const SizedBox(width: 8),
                _StatChip(
                  icon: Icons.access_time_outlined,
                  label: route.formattedDuration,
                  color: colorScheme.secondary,
                ),
                const SizedBox(width: 8),
                _StatChip(
                  icon: Icons.turn_left_outlined,
                  label: '${route.instructions.length} steps',
                  color: colorScheme.tertiary,
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Action buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: onClearRoute,
                    icon: const Icon(Icons.clear),
                    label: const Text('Clear'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton.icon(
                    onPressed: () => onStartNavigation(route),
                    icon: const Icon(Icons.navigation),
                    label: const Text('Start Navigation'),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Preview steps
            Text(
              'Turn-by-turn preview',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: route.instructions.length.clamp(0, 5),
                itemBuilder: (context, index) {
                  final instruction = route.instructions[index];
                  return _InstructionPreviewCard(
                    instruction: instruction,
                    stepNumber: index + 1,
                    isCurrent: index == 0,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Route preview bar at bottom of screen
class RoutePreviewBar extends ConsumerWidget {
  final NavigationRoute route;
  final void Function(NavigationRoute) onStartNavigation;
  final VoidCallback onClearRoute;

  const RoutePreviewBar({
    super.key,
    required this.route,
    required this.onStartNavigation,
    required this.onClearRoute,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            // Route info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Icon(Icons.route_outlined, color: colorScheme.primary, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'Route Ready',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${route.formattedDistance} • ${route.formattedDuration} • ${route.instructions.length} steps',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            // Actions
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton.icon(
                  onPressed: onClearRoute,
                  icon: const Icon(Icons.clear, size: 18),
                  label: const Text('Clear'),
                  style: TextButton.styleFrom(
                    foregroundColor: colorScheme.outline,
                  ),
                ),
                const SizedBox(width: 8),
                FilledButton.icon(
                  onPressed: () => onStartNavigation(route),
                  icon: const Icon(Icons.navigation, size: 18),
                  label: const Text('Start'),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Stat chip for route preview
class _StatChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _StatChip({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

/// Instruction preview card for horizontal list
class _InstructionPreviewCard extends StatelessWidget {
  final NavigationInstruction instruction;
  final int stepNumber;
  final bool isCurrent;

  const _InstructionPreviewCard({
    required this.instruction,
    required this.stepNumber,
    required this.isCurrent,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 8),
      child: Card(
        elevation: isCurrent ? 4 : 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: isCurrent ? colorScheme.primary : colorScheme.outlineVariant,
            width: isCurrent ? 2 : 1,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Step number
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: isCurrent ? colorScheme.primary : colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(
                    '$stepNumber',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: isCurrent ? Colors.white : colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Instruction icon
              Icon(
                _getInstructionIcon(instruction.type),
                size: 24,
                color: isCurrent ? colorScheme.primary : colorScheme.onSurfaceVariant,
              ),
              const SizedBox(height: 6),
              // Instruction text
              Text(
                instruction.instruction,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: isCurrent ? FontWeight.w600 : FontWeight.normal,
                  color: isCurrent ? colorScheme.primary : colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              if (instruction.distanceToNext > 0) ...[
                const SizedBox(height: 4),
                Text(
                  '${instruction.distanceToNext.round()}m',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: colorScheme.outline,
                  ),
                ),
              ],
            ],
          ),
        ),
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