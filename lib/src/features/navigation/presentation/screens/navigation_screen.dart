/// SAFENAV CAVITE - Navigation Screen
///
/// Navigation and routing screen with search, route preview, and active navigation.
library;

import 'dart:math' as math;

import 'package:material_ui/material_ui.dart' hide NavigationDestination;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../../../map/presentation/providers/map_providers.dart';
import '../providers/navigation_providers.dart';
import '../providers/navigation_controller.dart'
    show
        NavigationControllerState,
        NavigationIdle,
        NavigationInitializing,
        NavigationReady,
        NavigationActive,
        NavigationError,
        navigationControllerProvider,
        navigationStateProvider;
import '../../data/models/navigation_models.dart';
import 'widgets/route_preview_bottom_sheet.dart';
import 'widgets/active_navigation_view.dart';
import 'widgets/destination_search_bar.dart';
import 'widgets/common_destinations_list.dart';
import 'widgets/destination_details_bottom_sheet.dart'
    show showDestinationDetailsBottomSheet;
import '../../../../core/theme/app_theme.dart';
import '../../../../shared/widgets/widgets.dart';

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

    // Watch the new navigation controller state
    final navState = ref.watch(navigationStateProvider);
    final routeAsync = ref.watch(navigationRouteProvider);
    final isSearching = ref.watch(searchQueryProvider).isNotEmpty;
    final destination = ref.watch(navigationDestinationProvider);
    final startPoint = ref.watch(navigationStartProvider);

    // Handle navigation controller states using pattern matching
    return switch (navState) {
      NavigationIdle() => _buildIdleState(
          context,
          routeAsync,
          isSearching,
          destination,
          startPoint,
        ),
      NavigationInitializing() => _buildInitializingState(context, navState),
      NavigationReady() => _buildReadyState(context, navState),
      NavigationActive() => _buildActiveState(context, navState),
      NavigationError() => _buildErrorState(context, navState),
      _ => _buildIdleState(
          context,
          routeAsync,
          isSearching,
          destination,
          startPoint,
        ), // Fallback
    };
  }

  Widget _buildIdleState(
    BuildContext context,
    AsyncValue<NavigationRoute?> routeAsync,
    bool isSearching,
    NavigationDestination? destination,
    NavigationStartPoint? startPoint,
  ) {
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
                : _buildMainContent(context, routeAsync, destination, startPoint),
          ),

          // Route preview bottom bar (when route computed but not started)
          routeAsync.when(
            data: (NavigationRoute? route) {
              if (route != null) {
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

  Widget _buildInitializingState(BuildContext context, NavigationControllerState state) {
    final initializing = state as NavigationInitializing;
    return Scaffold(
      appBar: _buildAppBar(context, false),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const InlineLoading(message: 'Computing route...'),
            const SizedBox(height: 16),
            Text('Computing route to ${initializing.destination.name}...'),
          ],
        ),
      ),
    );
  }

  Widget _buildReadyState(BuildContext context, NavigationControllerState state) {
    final ready = state as NavigationReady;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: _buildAppBar(context, false),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(
                  Icons.navigation,
                  size: 50,
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(height: 24),
              // Start point
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(Icons.my_location, color: colorScheme.primary, size: 20),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'From',
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                          Text(
                            ready.route.start.displayName,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward, color: colorScheme.outline),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'To',
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                          Text(
                            ready.route.end.name,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '${ready.route.formattedDistance} • ${ready.route.formattedDuration}',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 32),
              AppFilledButton(
                onPressed: () => _beginActiveNavigation(ready.route),
                label: 'Start Navigation',
                icon: Icons.play_arrow,
                iconPosition: IconPosition.leading,
                size: ButtonSize.large,
              ),
              const SizedBox(height: 16),
              AppTextButton(
                onPressed: _clearRoute,
                label: 'Cancel',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActiveState(BuildContext context, NavigationControllerState state) {
    final active = state as NavigationActive;
    return ActiveNavigationView(
      session: active.session,
      onEndNavigation: () => ref.read(navigationControllerProvider.notifier).endNavigation(),
    );
  }

  Widget _buildErrorState(BuildContext context, NavigationControllerState state) {
    final error = state as NavigationError;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: _buildAppBar(context, false),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: colorScheme.errorContainer,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Icon(
                  Icons.error_outline,
                  size: 40,
                  color: colorScheme.error,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Navigation Error',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                error.message,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              AppFilledButton(
                onPressed: () => ref.read(navigationControllerProvider.notifier).endNavigation(),
                label: 'OK',
                size: ButtonSize.large,
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, bool isSearching) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppBar(
      title: isSearching
          ? null
          : Text(
              'Navigation',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
      centerTitle: false,
      automaticallyImplyLeading: false,
      actions: [
        // GPS button to center on user location
        AppIconButton(
          icon: Icons.my_location,
          onPressed: _centerOnUser,
          tooltip: 'My Location',
        ),
        // History button
        AppIconButton(
          icon: Icons.history,
          onPressed: _showRouteHistory,
          tooltip: 'Route History',
        ),
        // Settings button
        PopupMenuButton<String>(
          icon: Icon(Icons.more_vert, color: colorScheme.onSurface),
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

  Widget _buildMainContent(
    BuildContext context,
    AsyncValue<NavigationRoute?> routeAsync,
    NavigationDestination? destination,
    NavigationStartPoint? startPoint,
  ) {
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
              // Show destination preview if destination selected but no route yet
              if (destination != null) {
                return _buildDestinationPreview(context, destination, startPoint);
              }
              return const SizedBox.shrink();
            },
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),

          // Empty state when no destination selected
          if (destination == null && routeAsync.value == null) ...[
            const SizedBox(height: 32),
            NavigationEmptyState(
              onSearch: () => _searchFocus.requestFocus(),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDestinationPreview(
    BuildContext context,
    NavigationDestination destination,
    NavigationStartPoint? startPoint,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    // Calculate distance from start if available
    double? distance;
    Duration? duration;
    if (startPoint != null && startPoint.coordinates != null) {
      final startCoords = startPoint.coordinates!;
      distance = _calculateDistance(startCoords, destination.coordinates);
      duration = Duration(seconds: (distance / 1.4).round());
    }

    return AppElevatedCard(
      margin: EdgeInsets.zero,
      elevation: 4,
      padding: const EdgeInsets.all(16),
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
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.flag_outlined,
                  color: colorScheme.primary,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Destination Selected',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                    ),
                    Text(
                      destination.displayName,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.close, color: colorScheme.outline),
                onPressed: _clearRoute,
                tooltip: 'Clear destination',
              ),
            ],
          ),

          // Distance and time from start
          if (distance != null && duration != null) ...[
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _PreviewStatChip(
                  icon: Icons.straighten_outlined,
                  label: _formatDistance(distance),
                  color: colorScheme.primary,
                ),
                _PreviewStatChip(
                  icon: Icons.access_time_outlined,
                  label: _formatDuration(duration),
                  color: colorScheme.secondary,
                ),
                if (startPoint != null) ...[
                  _PreviewStatChip(
                    icon: Icons.my_location_outlined,
                    label: 'From Start',
                    color: colorScheme.tertiary,
                  ),
                ],
              ],
            ),
          ],

          const SizedBox(height: 16),

          // Action buttons
          Row(
            children: [
              Expanded(
                child: AppOutlinedButton(
                  onPressed: _clearRoute,
                  label: 'Clear',
                  icon: Icons.clear,
                  iconPosition: IconPosition.leading,
                  size: ButtonSize.large,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: AppFilledButton(
                  onPressed: () {
                    // Compute route
                    ref.read(navigationControllerProvider.notifier).startNavigation(
                          destination: destination,
                          manualStart: startPoint,
                        );
                  },
                  label: startPoint != null ? 'Compute Route' : 'Select Start Location',
                  icon: startPoint != null ? Icons.route : Icons.edit_location,
                  iconPosition: IconPosition.leading,
                  size: ButtonSize.large,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: 'Quick Actions',
          icon: Icons.flash_on,
          style: SectionHeaderStyle.standard,
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: AppSpacing.md,
          runSpacing: AppSpacing.md,
          alignment: WrapAlignment.start,
          children: [
            _QuickActionCard(
              icon: Icons.emergency_outlined,
              label: 'Emergency Exit',
              color: colorScheme.error,
              onTap: _navigateToEmergencyExit,
            ),
            _QuickActionCard(
              icon: Icons.meeting_room_outlined,
              label: 'Assembly Point',
              color: colorScheme.secondary,
              onTap: _navigateToAssemblyPoint,
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
              return const ContentEmptyState(
                icon: Icons.search_off,
                title: 'No destinations found',
                message: 'Try a different search term',
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
          loading: () => const Center(child: InlineLoading(message: 'Searching destinations...')),
          error: (error, _) => Center(child: InlineError(message: 'Error searching destinations: ${error.toString()}', retryLabel: 'Retry')),
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
    // Show destination details bottom sheet instead of directly setting destination
    showDestinationDetailsBottomSheet(
      context: context,
      destination: destination,
      startPoint: ref.read(navigationStartProvider),
      existingRoute: null,
      onStartNavigation: () {
        // Trigger route computation
        ref.read(navigationControllerProvider.notifier).startNavigation(
              destination: destination,
              manualStart: ref.read(navigationStartProvider),
            );
      },
    );
  }

  void _startNavigation(NavigationRoute route) {
    ref.read(navigationControllerProvider.notifier).beginActiveNavigation(route);
  }

  void _beginActiveNavigation(NavigationRoute route) {
    ref.read(navigationControllerProvider.notifier).beginActiveNavigation(route);
  }

  void _clearRoute() {
    ref.read(navigationDestinationProvider.notifier).state = null;
    // Clear individual start point providers (navigationStartProvider is computed)
    ref.read(selectedIndoorStartPointProvider.notifier).state = null;
    ref.read(selectedOutdoorStartPointProvider.notifier).state = null;
    ref.read(useGpsStartProvider.notifier).state = true; // Re-enable GPS
    ref.read(navigationControllerProvider.notifier).endNavigation();
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
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }

  void _navigateToEmergencyExit() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Navigating to nearest emergency exit...')),
    );
  }

  void _navigateToAssemblyPoint() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Navigating to nearest assembly point...')),
    );
  }

  // Helper methods for distance calculation
  double _calculateDistance(LatLng start, LatLng end) {
    const double earthRadius = 6371000.0;
    final dLat = _toRadians(end.latitude - start.latitude);
    final dLon = _toRadians(end.longitude - start.longitude);
    final lat1 = _toRadians(start.latitude);
    final lat2 = _toRadians(end.latitude);

    final sinDLat = math.sin(dLat / 2);
    final sinDLon = math.sin(dLon / 2);
    final a = sinDLat * sinDLat + sinDLon * sinDLon * math.cos(lat1) * math.cos(lat2);
    final c = 2 * math.asin(math.sqrt(a));
    return earthRadius * c;
  }

  String _formatDistance(double distance) {
    if (distance < 1000) {
      return '${distance.round()} m';
    } else {
      return '${(distance / 1000).toStringAsFixed(1)} km';
    }
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    if (minutes < 60) {
      return '$minutes min';
    } else {
      final hours = duration.inHours;
      final remainingMinutes = minutes % 60;
      return '${hours}h ${remainingMinutes}m';
    }
  }

  double _toRadians(double degrees) => degrees * math.pi / 180.0;
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
    return AppOutlinedCard(
      onTap: onTap,
      padding: const EdgeInsets.all(20),
      borderColor: color.withValues(alpha: 0.3),
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
    );
  }
}

/// Preview stat chip for destination preview
class _PreviewStatChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _PreviewStatChip({
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

    return AppCard(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: typeColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(_getTypeIcon(destination.type), color: typeColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  destination.name,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (destination.description != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    destination.description!,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: colorScheme.outline),
        ],
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
}

/// Saved routes bottom sheet
class _SavedRoutesSheet extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedRoutes = ref.watch(savedRoutesProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.3,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.all(20),
            children: [
              // Handle bar
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: colorScheme.outlineVariant,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Header
              SectionHeader(
                title: 'Saved Routes',
                icon: Icons.bookmark_outlined,
                style: SectionHeaderStyle.standard,
                action: savedRoutes.isNotEmpty
                    ? AppTextButton(
                        onPressed: () {
                          // Clear all saved routes
                          ref.read(savedRoutesProvider.notifier).state = [];
                        },
                        label: 'Clear All',
                        size: ButtonSize.small,
                        semanticLabel: 'Clear all saved routes',
                      )
                    : null,
              ),
              const SizedBox(height: 16),

              // List
              savedRoutes.isEmpty
                  ? ContentEmptyState(
                      icon: Icons.bookmark_outline,
                      title: 'No saved routes yet',
                      message: 'Save routes from the route preview to access them here',
                    )
                  : Column(
                      children: savedRoutes.map((route) => _SavedRouteTile(
                        route: route,
                        onTap: () {

                          Navigator.pop(context);
                        },
                        onDelete: () {
                          final updated = List<SavedRoute>.from(savedRoutes);
                          updated.remove(route);
                          ref.read(savedRoutesProvider.notifier).state = updated;
                        },
                      )).toList(),
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

    return AppCard(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      onTap: onTap,
      child: Row(
        children: [
          Container(
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
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  route.name,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${route.route.formattedDistance} • ${route.route.formattedDuration}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          PopupMenuButton<String>(
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
        ],
      ),
    );
  }
}