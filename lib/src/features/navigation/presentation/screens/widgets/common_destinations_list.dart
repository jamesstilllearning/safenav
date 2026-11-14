/// SAFENAV CAVITE - Common Destinations List
///
/// Displays a list of common navigation destinations (buildings).
library;

import 'package:flutter/material.dart' hide NavigationDestination;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/navigation_providers.dart';
import '../../../data/models/navigation_models.dart';
import '../../../../../shared/widgets/widgets.dart';

/// List of common destinations (buildings)
class CommonDestinationsList extends ConsumerWidget {
  const CommonDestinationsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final destinationsAsync = ref.watch(commonDestinationsProvider);

    return destinationsAsync.when(
      data: (destinations) {
        if (destinations.isEmpty) return const SizedBox.shrink();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeader(
              title: 'Campus Buildings',
              icon: Icons.apartment_outlined,
              style: SectionHeaderStyle.standard,
              action: Text(
                '${destinations.length} buildings',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: destinations.length,
                itemBuilder: (context, index) {
                  final dest = destinations[index];
                  return _DestinationCard(
                    destination: dest,
                    onTap: () => ref.read(navigationDestinationProvider.notifier).state = dest,
                  );
                },
              ),
            ),
          ],
        );
      },
      loading: () => const SizedBox(
        height: 100,
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (_, __) => const SizedBox.shrink(),
    );
  }
}

/// Individual destination card for horizontal list
class _DestinationCard extends StatelessWidget {
  final NavigationDestination destination;
  final VoidCallback onTap;

  const _DestinationCard({
    required this.destination,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 12),
        child: AppCard(
          elevation: 2,
          padding: const EdgeInsets.all(12),
          borderRadius: BorderRadius.circular(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: colorScheme.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.apartment_outlined,
                  color: colorScheme.primary,
                  size: 24,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                destination.name,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              AppChip(
                label: destination.type.when(
                  building: () => 'Building',
                  location: () => 'Location',
                  coordinates: () => 'Coordinates',
                  emergencyExit: () => 'Emergency Exit',
                  assemblyPoint: () => 'Assembly Point',
                ),
                backgroundColor: colorScheme.primary.withValues(alpha: 0.1),
                labelStyle: TextStyle(
                  fontSize: 10,
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}