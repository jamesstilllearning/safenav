/// SAFENAV CAVITE - Navigation Screen
///
/// Navigation and routing screen with search, route preview, and active navigation.
library;

import 'package:flutter/material.dart' hide NavigationDestination;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../map/presentation/providers/map_providers.dart';
import '../providers/navigation_providers.dart';
import '../../data/models/navigation_models.dart';
import 'widgets/route_preview_bottom_sheet.dart';
import 'widgets/active_navigation_view.dart';
import 'widgets/destination_search_bar.dart';
import 'widgets/common_destinations_list.dart';

/// Navigation screen - 2nd tab in bottom navigation
class NavigationScreen extends ConsumerStatefulWidget {
  const NavigationScreen({super.key});

  @override
  ConsumerState<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends ConsumerState<NavigationScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Watch voice guidance integration to activate the listener
    ref.watch(voiceGuidanceIntegrationProvider);

    final routeAsync = ref.watch(navigationRouteProvider);
    final session = ref.watch(navigationSessionProvider);
    final isSearching = ref.watch(searchQueryProvider).isNotEmpty;

    // If active navigation session, show active navigation view
    if (session != null) {
      return ActiveNavigationView(
        session: session,
        onEndNavigation: () => ref.read(navigationSessionProvider.notifier).state = null,
      );
    }

    return Scaffold(
      appBar: _buildAppBar(context, isSearching),
      body: Column(
        children: [
          // Search bar
          DestinationSearchBar(
            controller: _searchController,
            focusNode: _searchFocus,
            onChanged: (query) => ref.read(searchQueryProvider.notifier).state = query,
            onClear: () {
              _searchController.clear();
              ref.read(searchQueryProvider.notifier).state = '';
              _searchFocus.unfocus();
            },
            onSubmit: _handleSearchSubmit,
          ),

          // Content
          Expanded(
            child: isSearching
                ? _buildSearchResults()
                : _buildMainContent(context, routeAsync),
          ),

          // Route preview bottom bar (when route computed but not started)
          routeAsync.when(
            data: (NavigationRoute? route) {
              if (route != null && session == null) {
                return RoutePreviewBar(
                  route: route,
                  onStartNavigation: _startNavigation,
                  onClearRoute: _clearRoute,
                );
              }
              return const SizedBox.shrink();
            },
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, bool isSearching) {
    return AppBar(
      title: isSearching
          ? null
          : Text(
              'Navigation',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
      centerTitle: !isSearching,
      automaticallyImplyLeading: false,
      actions: [
        // GPS button to center on user location
        IconButton(
          icon: const Icon(Icons.my_location),
          onPressed: _centerOnUser,
          tooltip: 'My Location',
        ),
        // History button
        IconButton(
          icon: const Icon(Icons.history),
          onPressed: _showRouteHistory,
          tooltip: 'Route History',
        ),
        // Settings button
        PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert),
          onSelected: _handleMenuAction,
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'saved_routes',
              child: Row(
                children: [
                  Icon(Icons.bookmark_outline),
                  SizedBox(width: 8),
                  Text('Saved Routes'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'voice_guidance',
              child: Row(
                children: [
                  Icon(Icons.volume_up_outlined),
                  SizedBox(width: 8),
                  Text('Voice Guidance'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'avoid_emergency',
              child: Row(
                children: [
                  Icon(Icons.block_outlined),
                  SizedBox(width: 8),
                  Text('Avoid Emergency Paths'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMainContent(BuildContext context, AsyncValue<NavigationRoute?> routeAsync) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Quick actions
          _buildQuickActions(context),

          const SizedBox(height: 24),

          // Common destinations
          const CommonDestinationsList(),

          const SizedBox(height: 24),

          // Route preview if available (collapsed state)
          routeAsync.when(
            data: (route) {
              if (route != null) {
                return RoutePreviewCard(
                  route: route,
                  onStartNavigation: _startNavigation,
                  onClearRoute: _clearRoute,
                );
              }
              return const SizedBox.shrink();
            },
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _QuickActionCard(
                icon: Icons.emergency_outlined,
                label: 'Emergency Exit',
                color: Colors.red,
                onTap: _navigateToEmergencyExit,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _QuickActionCard(
                icon: Icons.meeting_room_outlined,
                label: 'Assembly Point',
                color: Colors.blue,
                onTap: _navigateToAssemblyPoint,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchResults() {
    return Consumer(
      builder: (context, ref, child) {
        final searchAsync = ref.watch(destinationSearchProvider);

        return searchAsync.when(
          data: (destinations) {
            if (destinations.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search_off,
                      size: 64,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No destinations found',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Try a different search term',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: destinations.length,
              itemBuilder: (context, index) {
                final dest = destinations[index];
                return _SearchResultTile(
                  destination: dest,
                  onTap: () => _selectDestination(dest),
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 64, color: Colors.red),
                const SizedBox(height: 16),
                Text('Error searching destinations'),
                const SizedBox(height: 8),
                Text(
                  error.toString(),
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _handleSearchSubmit(String query) {
    if (query.trim().isNotEmpty) {
      _searchFocus.unfocus();
    }
  }

  void _selectDestination(NavigationDestination destination) {
    ref.read(navigationDestinationProvider.notifier).state = destination;
    ref.read(searchQueryProvider.notifier).state = '';
    _searchController.clear();
    _searchFocus.unfocus();
  }

  void _startNavigation(NavigationRoute route) {
    ref.read(navigationSessionProvider.notifier).state = NavigationSession(
      id: 'session_${DateTime.now().millisecondsSinceEpoch}',
      route: route,
      currentInstructionIndex: 0,
      currentPosition: route.start.coordinates,
      startedAt: DateTime.now(),
      isVoiceGuidanceEnabled: ref.read(voiceGuidanceProvider),
      isRerouting: false,
    );
  }

  void _clearRoute() {
    ref.read(navigationDestinationProvider.notifier).state = null;
    ref.read(navigationStartProvider.notifier).state = null;
  }

  void _centerOnUser() {
    final userLocation = ref.read(userLatLngProvider);
    if (userLocation != null) {
      ref.read(mapViewStateProvider.notifier)
        ..setCenter(userLocation)
        ..setZoom(18.0);
    } else {
      // Fallback to campus center if GPS not available
      ref.read(mapViewStateProvider.notifier).reset();
    }
  }

  void _showRouteHistory() {
    // TODO: Show route history bottom sheet
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Route history coming soon')),
    );
  }

  void _handleMenuAction(String action) {
    switch (action) {
      case 'saved_routes':
        _showSavedRoutes();
        break;
      case 'voice_guidance':
        ref.read(voiceGuidanceProvider.notifier).state = !ref.read(voiceGuidanceProvider);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              ref.read(voiceGuidanceProvider) ? 'Voice guidance enabled' : 'Voice guidance disabled',
            ),
          ),
        );
        break;
      case 'avoid_emergency':
        // TODO: Toggle avoid emergency paths preference
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Emergency path avoidance toggled')),
        );
        break;
    }
  }

  void _showSavedRoutes() {
    showModalBottomSheet(
      context: context,
      builder: (context) => _SavedRoutesSheet(),
    );
  }

  void _navigateToEmergencyExit() {
    // TODO: Find nearest emergency exit and set as destination
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Navigating to nearest emergency exit...')),
    );
  }

  void _navigateToAssemblyPoint() {
    // TODO: Find nearest assembly point and set as destination
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Navigating to nearest assembly point...')),
    );
  }
}

/// Quick action card widget
class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              const SizedBox(height: 12),
              Text(
                label,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Search result tile
class _SearchResultTile extends StatelessWidget {
  final NavigationDestination destination;
  final VoidCallback onTap;

  const _SearchResultTile({
    required this.destination,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final typeColor = _getTypeColor(destination.type);

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: typeColor.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(_getTypeIcon(destination.type), color: typeColor, size: 20),
        ),
        title: Text(
          destination.name,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: destination.description != null
            ? Text(destination.description!, maxLines: 1, overflow: TextOverflow.ellipsis)
            : null,
        trailing: Icon(Icons.chevron_right, color: colorScheme.outline),
        onTap: onTap,
      ),
    );
  }

  Color _getTypeColor(DestinationType type) {
    return type.when(
      building: () => Colors.blue,
      location: () => Colors.green,
      coordinates: () => Colors.orange,
      emergencyExit: () => Colors.red,
      assemblyPoint: () => Colors.purple,
    );
  }

  IconData _getTypeIcon(DestinationType type) {
    return type.when(
      building: () => Icons.apartment_outlined,
      location: () => Icons.location_on_outlined,
      coordinates: () => Icons.gps_fixed_outlined,
      emergencyExit: () => Icons.emergency_outlined,
      assemblyPoint: () => Icons.groups_outlined,
    );
  }
}

/// Saved routes bottom sheet
class _SavedRoutesSheet extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedRoutes = ref.watch(savedRoutesProvider);

    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.3,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
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
                  color: Theme.of(context).colorScheme.outlineVariant,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              // Header
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Text(
                      'Saved Routes',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    if (savedRoutes.isNotEmpty)
                      TextButton(
                        onPressed: () {
                          // TODO: Clear all saved routes
                        },
                        child: const Text('Clear All'),
                      ),
                  ],
                ),
              ),
              // List
              Expanded(
                child: savedRoutes.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.bookmark_outline,
                              size: 64,
                              color: Theme.of(context).colorScheme.outline,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No saved routes yet',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        controller: scrollController,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: savedRoutes.length,
                        itemBuilder: (context, index) {
                          final route = savedRoutes[index];
                          return _SavedRouteTile(
                            route: route,
                            onTap: () {
                              // TODO: Load saved route
                              Navigator.pop(context);
                            },
                            onDelete: () {
                              final updated = List<SavedRoute>.from(savedRoutes);
                              updated.removeAt(index);
                              ref.read(savedRoutesProvider.notifier).state = updated;
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      },
  );
}
}

/// Saved route tile
class _SavedRouteTile extends StatelessWidget {
  final SavedRoute route;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const _SavedRouteTile({
    required this.route,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: route.isFavorite
                ? Colors.amber.withValues(alpha: 0.15)
                : colorScheme.primary.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            route.isFavorite ? Icons.star : Icons.route_outlined,
            color: route.isFavorite ? Colors.amber : colorScheme.primary,
            size: 20,
          ),
        ),
        title: Text(route.name, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(
          '${route.route.formattedDistance} • ${route.route.formattedDuration}',
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'delete') onDelete();
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'delete',
              child: Row(
                children: [
                  Icon(Icons.delete_outline, color: Colors.red),
                  const SizedBox(width: 8),
                  const Text('Delete'),
                ],
              ),
            ),
            PopupMenuItem(
              value: 'favorite',
              child: Row(
                children: [
                  Icon(route.isFavorite ? Icons.star_border : Icons.star),
                  const SizedBox(width: 8),
                  Text(route.isFavorite ? 'Remove Favorite' : 'Add to Favorites'),
                ],
              ),
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}