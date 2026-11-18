/// SAFENAV CAVITE - Map Screen
///
/// Main campus map screen with OpenStreetMap tiles, building polygons,
/// pathways, boundary, and user location tracking.
library;

import 'package:flutter/material.dart'
    hide NavigationDestination; // Hide to avoid conflict with our navigation model
import 'package:flutter_map/flutter_map.dart'
    hide LatLngBounds; // Hide to avoid conflict with campus_boundary
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

import '../../data/models/campus_boundary.dart';
import '../../data/models/campus_building.dart';
import '../../data/models/campus_pathway.dart';
import '../../../navigation/data/models/navigation_models.dart';
import '../../../navigation/presentation/providers/navigation_providers.dart';
import '../../../../core/router/app_routes.dart';
import '../../../navigation/presentation/providers/navigation_controller.dart';
import '../providers/map_providers.dart';
import '../../../../shared/widgets/widgets.dart';

/// Main campus map screen
class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  final MapController _mapController = MapController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  void _onMapTap(TapPosition tapPosition, LatLng latLng) {
    // Clear selection when tapping on empty map area
    ref.read(mapViewStateProvider.notifier).clearSelection();
  }

  void _onBuildingTap(CampusBuilding building) {
    ref.read(mapViewStateProvider.notifier).selectBuilding(building.id);
    _showBuildingBottomSheet(building);
  }

  void _onPathwayTap(CampusPathway pathway) {
    ref.read(mapViewStateProvider.notifier).selectPathway(pathway.id);
    _showPathwayBottomSheet(pathway);
  }

  void _showBuildingBottomSheet(CampusBuilding building) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _BuildingBottomSheet(building: building),
    );
  }

  void _showPathwayBottomSheet(CampusPathway pathway) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _PathwayBottomSheet(pathway: pathway),
    );
  }

  @override
  Widget build(BuildContext context) {
    final boundaryAsync = ref.watch(campusBoundaryProvider);
    final buildingsAsync = ref.watch(campusBuildingsProvider);
    final pathwaysAsync = ref.watch(campusPathwaysProvider);
    final viewState = ref.watch(mapViewStateProvider);
    final cachedTileLayerAsync = ref.watch(cachedTileLayerProvider);
    final activeRoute = ref.watch(activeNavigationRouteProvider);
    final activeSession = ref.watch(activeNavigationSessionProvider);

    // Build tile layer based on map type
    final TileLayer tileLayer;
    switch (viewState.mapType) {
      case MapType.satellite:
        tileLayer = TileLayer(
          // ESRI World Imagery - free satellite imagery
          urlTemplate: 'https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}',
          maxZoom: 19,
          userAgentPackageName: 'com.earist.safenav',
        );
      case MapType.standard:
        // Use cached OSM tiles if available, otherwise fallback to online
        tileLayer = cachedTileLayerAsync.when(
          data: (cachedTileLayer) => cachedTileLayer,
          loading: () => TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            maxZoom: 19,
            subdomains: const ['a', 'b', 'c'],
            userAgentPackageName: 'com.earist.safenav',
          ),
          error: (_, __) => TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            maxZoom: 19,
            subdomains: const ['a', 'b', 'c'],
            userAgentPackageName: 'com.earist.safenav',
          ),
        );
    }

    return Scaffold(
      body: Stack(
        children: [
          // Map
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: viewState.center,
              initialZoom: viewState.zoom,
              minZoom: 10.0,
              maxZoom: 20.0,
              onTap: _onMapTap,
              interactionOptions: const InteractionOptions(
                flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
              ),
            ),
            children: [
              // Tile Layer (OpenStreetMap or Satellite)
              tileLayer,

              // Campus Boundary
              if (viewState.showBoundary)
                boundaryAsync.when(
                  data: (boundary) => _BoundaryLayer(boundary: boundary),
                  loading: () => const SizedBox.shrink(),
                  error: (_, __) => const SizedBox.shrink(),
                ),

              // Pathways
              if (viewState.showPathways)
                pathwaysAsync.when(
                  data: (pathways) => _PathwaysLayer(
                    pathways: pathways,
                    onPathwayTap: _onPathwayTap,
                    selectedPathwayId: viewState.selectedPathwayId,
                  ),
                  loading: () => const SizedBox.shrink(),
                  error: (_, __) => const SizedBox.shrink(),
                ),

              // Buildings
              if (viewState.showBuildings)
                buildingsAsync.when(
                  data: (buildings) => _BuildingsLayer(
                    buildings: buildings,
                    onBuildingTap: _onBuildingTap,
                    selectedBuildingId: viewState.selectedBuildingId,
                  ),
                  loading: () => const SizedBox.shrink(),
                  error: (_, __) => const SizedBox.shrink(),
                ),

              // Active Navigation Route Polyline
              if (activeRoute != null)
                _ActiveRouteLayer(route: activeRoute, session: activeSession),

              // User Location Marker
              if (viewState.showUserLocation)
                const _UserLocationLayer(),
            ],
          ),

          // Top Toolbar
          _MapToolbar(
            onToggleLayers: _showLayerOptions,
          ),

          // Zoom Controls (lower-right)
          _MapZoomControls(
            onZoomIn: () => ref.read(mapViewStateProvider.notifier).zoomIn(),
            onZoomOut: () => ref.read(mapViewStateProvider.notifier).zoomOut(),
          ),

          // Bottom Info Bar (when building/pathway selected)
          if (viewState.selectedBuildingId != null ||
              viewState.selectedPathwayId != null)
            _SelectionInfoBar(
              onClose: () => ref.read(mapViewStateProvider.notifier).clearSelection(),
            ),
        ],
      ),
      floatingActionButton: _MapFAB(
        onCenterUser: _centerOnUser,
      ),
    );
  }

  void _centerOnUser() {
    final userLocation = ref.read(userLatLngProvider);
    if (userLocation != null) {
      _mapController.move(userLocation, 18.0);
      ref.read(mapViewStateProvider.notifier)
        ..setCenter(userLocation)
        ..setZoom(18.0);
    } else {
      // Fallback to campus center if GPS not available
      final boundary = ref.read(campusBoundaryProvider).value;
      if (boundary != null) {
        _mapController.move(boundary.center, 17.0);
        ref.read(mapViewStateProvider.notifier)
          ..setCenter(boundary.center)
          ..setZoom(17.0);
      }
    }
  }

  void _showLayerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) => _LayerOptionsSheet(),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }
}

/// Campus boundary layer
class _BoundaryLayer extends StatelessWidget {
  final CampusBoundary boundary;

  const _BoundaryLayer({required this.boundary});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return PolygonLayer(
      polygons: [
        Polygon(
          points: boundary.polygon,
          color: colorScheme.primary.withValues(alpha: 0.1),
          borderColor: colorScheme.primary,
          borderStrokeWidth: 2.0,
        ),
      ],
    );
  }
}

/// Buildings layer
class _BuildingsLayer extends StatelessWidget {
  final List<CampusBuilding> buildings;
  final void Function(CampusBuilding) onBuildingTap;
  final String? selectedBuildingId;

  const _BuildingsLayer({
    required this.buildings,
    required this.onBuildingTap,
    this.selectedBuildingId,
  });

  @override
  Widget build(BuildContext context) {
    return PolygonLayer(
      polygons: buildings.map((building) {
        final isSelected = building.id == selectedBuildingId;
        final categoryColor = Color(building.category.colorValue);

        return Polygon(
          points: building.polygon,
          color: isSelected
              ? categoryColor.withValues(alpha: 0.5)
              : categoryColor.withValues(alpha: 0.3),
          borderColor: isSelected
              ? categoryColor
              : categoryColor.withValues(alpha: 0.7),
          borderStrokeWidth: isSelected ? 3.0 : 1.5,
        );
      }).toList(),
    );
  }
}

/// Pathways layer
class _PathwaysLayer extends StatelessWidget {
  final List<CampusPathway> pathways;
  final void Function(CampusPathway) onPathwayTap;
  final String? selectedPathwayId;

  const _PathwaysLayer({
    required this.pathways,
    required this.onPathwayTap,
    this.selectedPathwayId,
  });

  @override
  Widget build(BuildContext context) {
    return PolylineLayer(
      polylines: pathways.map((pathway) {
        final isSelected = pathway.id == selectedPathwayId;
        final categoryColor = Color(pathway.category.colorValue);

        // Only render LineString pathways as polylines
        if (pathway.isPolygon) {
          return Polyline(
            points: pathway.coordinates,
            color: categoryColor.withValues(alpha: 0.3),
            strokeWidth: 0,
          );
        }

        return Polyline(
          points: pathway.coordinates,
          color: isSelected
              ? categoryColor
              : categoryColor.withValues(alpha: 0.7),
          strokeWidth: isSelected ? 5.0 : pathway.width,
          pattern: pathway.category.when(
            emergency: () => StrokePattern.dashed(segments: const [10, 5]),
            mainPath: StrokePattern.solid,
            connector: StrokePattern.solid,
            perimeter: StrokePattern.solid,
            parking: StrokePattern.solid,
            openSpace: StrokePattern.solid,
            other: StrokePattern.solid,
          ),
        );
      }).toList(),
    );
  }
}

/// User location layer
class _UserLocationLayer extends ConsumerWidget {
  const _UserLocationLayer();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userLocation = ref.watch(userLatLngProvider);
    if (userLocation == null) return const SizedBox.shrink();

    final userLocationWithAccuracy = ref.watch(userLocationWithAccuracyProvider);

    return MarkerLayer(
      markers: [
        Marker(
          point: userLocation,
          width: 48,
          height: 48,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Accuracy circle (if available)
              if (userLocationWithAccuracy != null)
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.15),
                  ),
                ),
              // User location marker
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.onPrimary,
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
                  Icons.navigation,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Map toolbar at top
class _MapToolbar extends ConsumerWidget {
  final VoidCallback onToggleLayers;

  const _MapToolbar({
    required this.onToggleLayers,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final viewState = ref.watch(mapViewStateProvider);

    return Positioned(
      top: MediaQuery.of(context).padding.top + 8,
      left: 16,
      right: 16,
      child: Row(
        children: [
          // App title with map type indicator
          Expanded(
            child: AppCard(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              elevation: 2,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      viewState.mapType == MapType.satellite
                          ? Icons.satellite_outlined
                          : Icons.map_outlined,
                      color: colorScheme.primary,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'EARIST Cavite Campus',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        Text(
                          viewState.mapType == MapType.satellite ? 'Satellite View' : 'Standard View',
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Layer toggle button
          _ToolbarButton(
            icon: Icons.layers_outlined,
            onPressed: onToggleLayers,
            tooltip: 'Map Layers',
          ),
        ],
      ),
    );
  }
}

/// Zoom controls positioned at lower-right of map
class _MapZoomControls extends ConsumerWidget {
  final VoidCallback onZoomIn;
  final VoidCallback onZoomOut;

  const _MapZoomControls({
    required this.onZoomIn,
    required this.onZoomOut,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return Positioned(
      right: 16,
      bottom: _kBottomNavigationBarHeight + 16 + 56 + 12, // Above FAB: bottom nav (80) + margin (16) + FAB height (56) + spacing (12)
      child: AppCard(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        elevation: 3,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppIconButton(
              icon: Icons.add,
              size: IconButtonSize.medium,
              onPressed: onZoomIn,
              tooltip: 'Zoom In',
              semanticLabel: 'Zoom in',
            ),
            Container(
              width: 24,
              height: 1,
              color: colorScheme.outlineVariant,
              margin: const EdgeInsets.symmetric(vertical: 4),
            ),
            AppIconButton(
              icon: Icons.remove,
              size: IconButtonSize.medium,
              onPressed: onZoomOut,
              tooltip: 'Zoom Out',
              semanticLabel: 'Zoom out',
            ),
          ],
        ),
      ),
    );
  }
}

/// Toolbar button
class _ToolbarButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String tooltip;

  const _ToolbarButton({
    required this.icon,
    required this.onPressed,
    required this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Tooltip(
      message: tooltip,
      child: AppIconButton(
        icon: icon,
        size: IconButtonSize.medium,
        onPressed: onPressed,
        backgroundColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.9),
        foregroundColor: colorScheme.onSurface,
      ),
    );
  }
}

/// Layer options bottom sheet
class _LayerOptionsSheet extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewState = ref.watch(mapViewStateProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return DraggableScrollableSheet(
      initialChildSize: 0.55,
      minChildSize: 0.4,
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

              // Title
              SectionHeader(
                title: 'Map Layers',
                icon: Icons.layers_outlined,
                style: SectionHeaderStyle.standard,
              ),
              const SizedBox(height: 16),

              // Layer toggles
              _LayerToggleCard(
                icon: Icons.apartment_outlined,
                title: 'Buildings',
                subtitle: 'Campus building footprints',
                color: const Color(0xFF2196F3),
                value: viewState.showBuildings,
                onChanged: (v) => ref.read(mapViewStateProvider.notifier).toggleBuildings(),
              ),
              const SizedBox(height: 12),
              _LayerToggleCard(
                icon: Icons.directions_walk_outlined,
                title: 'Pathways',
                subtitle: 'Walkways and emergency routes',
                color: const Color(0xFF4CAF50),
                value: viewState.showPathways,
                onChanged: (v) => ref.read(mapViewStateProvider.notifier).togglePathways(),
              ),
              const SizedBox(height: 12),
              _LayerToggleCard(
                icon: Icons.map_outlined,
                title: 'Campus Boundary',
                subtitle: 'EARIST Cavite campus perimeter',
                color: colorScheme.primary,
                value: viewState.showBoundary,
                onChanged: (v) => ref.read(mapViewStateProvider.notifier).toggleBoundary(),
              ),
              const SizedBox(height: 12),
              _LayerToggleCard(
                icon: Icons.my_location_outlined,
                title: 'My Location',
                subtitle: 'Show current GPS position',
                color: const Color(0xFFFF9800),
                value: viewState.showUserLocation,
                onChanged: (v) => ref.read(mapViewStateProvider.notifier).toggleUserLocation(),
              ),

              const SizedBox(height: 24),

              // Map Type Selector
              SectionHeader(
                title: 'Map Type',
                icon: Icons.map_outlined,
                style: SectionHeaderStyle.standard,
              ),
              const SizedBox(height: 12),
              _MapTypeSelector(
                currentType: viewState.mapType,
                onChanged: (type) => ref.read(mapViewStateProvider.notifier).setMapType(type),
              ),

              const SizedBox(height: 24),

              // Legend
              SectionHeader(
                title: 'Legend',
                icon: Icons.legend_toggle_outlined,
                style: SectionHeaderStyle.standard,
              ),
              const SizedBox(height: 12),
              _buildLegend(context),

              SizedBox(height: MediaQuery.of(context).padding.bottom + 20),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLegend(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _LegendItem(
            color: const Color(0xFF2196F3),
            label: 'Academic Buildings',
            shape: LegendShape.square,
          ),
          const SizedBox(height: 8),
          _LegendItem(
            color: const Color(0xFF4CAF50),
            label: 'Pathways & Walkways',
            shape: LegendShape.line,
          ),
          const SizedBox(height: 8),
          _LegendItem(
            color: colorScheme.primary,
            label: 'Campus Boundary',
            shape: LegendShape.line,
          ),
          const SizedBox(height: 8),
          _LegendItem(
            color: const Color(0xFFFF9800),
            label: 'Your Location',
            shape: LegendShape.circle,
          ),
        ],
      ),
    );
  }
}

/// Legend item
class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;
  final LegendShape shape;

  const _LegendItem({
    required this.color,
    required this.label,
    required this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            shape: shape == LegendShape.circle ? BoxShape.circle : BoxShape.rectangle,
            borderRadius: shape == LegendShape.square ? BorderRadius.circular(4) : null,
          ),
          child: shape == LegendShape.line
              ? Center(
                  child: Container(
                    width: 12,
                    height: 3,
                    color: Colors.white,
                  ),
                )
              : null,
        ),
        const SizedBox(width: 12),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

enum LegendShape { square, circle, line }

/// Layer toggle card
class _LayerToggleCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _LayerToggleCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppCard(
      padding: const EdgeInsets.all(16),
      onTap: () => onChanged(!value),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: color, width: 2),
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: color,
            activeTrackColor: color.withValues(alpha: 0.3),
          ),
        ],
      ),
    );
  }
}

/// Map type selector widget
class _MapTypeSelector extends StatelessWidget {
  final MapType currentType;
  final ValueChanged<MapType> onChanged;

  const _MapTypeSelector({
    required this.currentType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Standard map option
        _MapTypeTile(
          title: 'Standard',
          subtitle: 'OpenStreetMap vector view',
          icon: Icons.map_outlined,
          color: const Color(0xFF2196F3),
          isSelected: currentType == MapType.standard,
          onTap: () => onChanged(MapType.standard),
        ),
        const SizedBox(height: 8),
        // Satellite map option
        _MapTypeTile(
          title: 'Satellite',
          subtitle: 'Aerial/satellite imagery (ESRI)',
          icon: Icons.satellite_outlined,
          color: const Color(0xFF4CAF50),
          isSelected: currentType == MapType.satellite,
          onTap: () => onChanged(MapType.satellite),
        ),
      ],
    );
  }
}

/// Map type tile widget
class _MapTypeTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const _MapTypeTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppCard(
      padding: const EdgeInsets.all(16),
      onTap: onTap,
      border: BorderSide(
        color: isSelected ? color : colorScheme.outlineVariant,
        width: isSelected ? 2 : 1,
      ),
      elevation: isSelected ? 2 : 0,
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: color.withValues(alpha: isSelected ? 0.2 : 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isSelected ? color : colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          if (isSelected)
            Icon(
              Icons.check_circle,
              color: color,
              size: 24,
            ),
        ],
      ),
    );
  }
}

/// Height of the bottom navigation bar in the main shell (Material 3 NavigationBar)
const double _kBottomNavigationBarHeight = 80.0;

/// Selection info bar at bottom
class _SelectionInfoBar extends ConsumerWidget {
  final VoidCallback onClose;

  const _SelectionInfoBar({required this.onClose});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final building = ref.watch(selectedBuildingProvider);
    final pathway = ref.watch(selectedPathwayProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Positioned(
      bottom: _kBottomNavigationBarHeight,
      left: 0,
      right: 0,
      child: AppElevatedCard(
        margin: const EdgeInsets.all(16),
        elevation: 8,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            if (building != null) ...[
              Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: Color(building.category.colorValue),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      building.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      building.category.label,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              AppTextButton(
                onPressed: () {
                  // TODO: Navigate to building detail screen
                },
                label: 'Details',
                icon: Icons.info_outline,
                iconPosition: IconPosition.leading,
              ),
            ] else if (pathway != null) ...[
              Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: Color(pathway.category.colorValue),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      pathway.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${pathway.category.label} • ${pathway.lengthMeters.toStringAsFixed(0)}m',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            IconButton(
              onPressed: onClose,
              icon: const Icon(Icons.close),
              tooltip: 'Clear selection',
            ),
          ],
        ),
      ),
    );
  }
}

/// Floating action button for centering on user (icon only)
class _MapFAB extends StatelessWidget {
  final VoidCallback onCenterUser;

  const _MapFAB({required this.onCenterUser});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return FloatingActionButton(
      onPressed: onCenterUser,
      heroTag: 'map_center_user',
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      tooltip: 'My Location',
      child: const Icon(Icons.my_location),
    );
  }
}

/// Building bottom sheet
class _BuildingBottomSheet extends ConsumerWidget {
  final CampusBuilding building;

  const _BuildingBottomSheet({required this.building});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final categoryColor = Color(building.category.colorValue);

    void navigateToBuilding() {
      // Set the building as navigation destination and start navigation
      final destination = NavigationDestination(
        id: 'building_${building.id}',
        name: building.name,
        type: DestinationType.building(),
        coordinates: building.centroid,
        buildingId: building.id,
        description: building.description,
      );
      ref.read(navigationDestinationProvider.notifier).state = destination;
      Navigator.pop(context);

      // Start navigation using NavigationController (uses GPS as start position)
      ref.read(navigationControllerProvider.notifier).startNavigation(destination: destination);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Starting navigation to ${building.name}...')),
      );
    }

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

              // Building header
              Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: categoryColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      Icons.apartment_outlined,
                      color: categoryColor,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          building.name,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        AppChip(
                          label: building.category.label,
                          backgroundColor: categoryColor.withValues(alpha: 0.15),
                          labelStyle: TextStyle(
                            color: categoryColor,
                            fontWeight: FontWeight.w500,
                          ),
                          icon: Icons.apartment_outlined,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Description
              if (building.description.isNotEmpty) ...[
                SectionHeader(
                  title: 'About',
                  style: SectionHeaderStyle.standard,
                ),
                const SizedBox(height: 10),
                Text(
                  building.description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 20),
              ],

              // Details
              SectionHeader(
                title: 'Details',
                style: SectionHeaderStyle.standard,
              ),
              const SizedBox(height: 10),
              _InfoRow(
                icon: Icons.location_on_outlined,
                label: 'Coordinates',
                value:
                    '${building.centroid.latitude.toStringAsFixed(6)}, ${building.centroid.longitude.toStringAsFixed(6)}',
              ),
              const SizedBox(height: 12),
              _InfoRow(
                icon: Icons.straighten_outlined,
                label: 'OSM Way ID',
                value: building.osmWayId.toString(),
              ),
              const SizedBox(height: 12),
              _InfoRow(
                icon: Icons.verified_outlined,
                label: 'Verification',
                value: building.verificationStatus.replaceAll('_', ' '),
              ),
              if (building.areaSqMeters != null) ...[
                const SizedBox(height: 12),
                _InfoRow(
                  icon: Icons.square_foot_outlined,
                  label: 'Approx. Area',
                  value: '${building.areaSqMeters!.toStringAsFixed(0)} m²',
                ),
              ],

              const SizedBox(height: 28),

              // Action buttons
              Row(
                children: [
                  Expanded(
                    child: AppOutlinedButton(
                      onPressed: navigateToBuilding,
                      label: 'Navigate',
                      icon: Icons.directions,
                      iconPosition: IconPosition.leading,
                      size: ButtonSize.large,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: AppFilledButton(
                      onPressed: () {
                        Navigator.pop(context);
                        context.push(AppRoutes.digitalTwinRoute(building.id));
                      },
                      label: '3D View',
                      icon: Icons.view_in_ar,
                      iconPosition: IconPosition.leading,
                      size: ButtonSize.large,
                    ),
                  ),
                ],
              ),

              SizedBox(height: MediaQuery.of(context).padding.bottom + 20),
            ],
          ),
        );
      },
    );
  }
}

/// Pathway bottom sheet
class _PathwayBottomSheet extends ConsumerWidget {
  final CampusPathway pathway;

  const _PathwayBottomSheet({required this.pathway});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final categoryColor = Color(pathway.category.colorValue);

    void navigateUsingPathway() {
      // For pathways, we can set the start or end as destination
      // Since pathways are connections, we'll use the midpoint or let user choose
      // For now, navigate to the pathway's start coordinate
      final destination = NavigationDestination(
        id: 'pathway_${pathway.id}',
        name: pathway.name,
        type: DestinationType.location(),
        coordinates: pathway.coordinates.isNotEmpty
            ? pathway.coordinates.first
            : pathway.center,
        description: 'Via ${pathway.category.label}',
      );
      ref.read(navigationDestinationProvider.notifier).state = destination;
      Navigator.pop(context);

      // Start navigation using NavigationController (uses GPS as start position)
      ref.read(navigationControllerProvider.notifier).startNavigation(destination: destination);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Starting navigation to ${pathway.name}...')),
      );
    }

    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.3,
      maxChildSize: 0.7,
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

              Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: categoryColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      pathway.isPolygon ? Icons.park_outlined : Icons.directions_walk,
                      color: categoryColor,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pathway.name,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        AppChip(
                          label: pathway.category.label,
                          backgroundColor: categoryColor.withValues(alpha: 0.15),
                          labelStyle: TextStyle(
                            color: categoryColor,
                            fontWeight: FontWeight.w500,
                          ),
                          icon: pathway.isPolygon ? Icons.park_outlined : Icons.directions_walk,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              if (pathway.description.isNotEmpty) ...[
                SectionHeader(
                  title: 'Description',
                  style: SectionHeaderStyle.standard,
                ),
                const SizedBox(height: 10),
                Text(
                  pathway.description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 20),
              ],

              SectionHeader(
                title: 'Details',
                style: SectionHeaderStyle.standard,
              ),
              const SizedBox(height: 10),
              _InfoRow(
                icon: Icons.straighten_outlined,
                label: pathway.isPolygon ? 'Area' : 'Length',
                value: pathway.isPolygon
                    ? '${pathway.areaSqMeters.toStringAsFixed(0)} m²'
                    : '${pathway.lengthMeters.toStringAsFixed(0)} m',
              ),
              const SizedBox(height: 12),
              _InfoRow(
                icon: Icons.layers_outlined,
                label: 'Surface',
                value: pathway.surface,
              ),
              const SizedBox(height: 12),
              _InfoRow(
                icon: Icons.verified_outlined,
                label: 'Verification',
                value: pathway.verificationStatus.replaceAll('_', ' '),
              ),

              const SizedBox(height: 28),

              Row(
                children: [
                  Expanded(
                    child: AppFilledButton(
                      onPressed: navigateUsingPathway,
                      label: 'Use Route',
                      icon: Icons.route,
                      iconPosition: IconPosition.leading,
                      size: ButtonSize.large,
                    ),
                  ),
                ],
              ),

              SizedBox(height: MediaQuery.of(context).padding.bottom + 20),
            ],
          ),
        );
      },
    );
  }
}

/// Info row widget
class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 18, color: colorScheme.onSurfaceVariant),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Active navigation route layer - shows the route polyline on the map
class _ActiveRouteLayer extends StatelessWidget {
  final NavigationRoute route;
  final NavigationSession? session;

  const _ActiveRouteLayer({required this.route, this.session});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return PolylineLayer(
      polylines: [
        // Full route geometry (light)
        Polyline(
          points: route.geometry,
          color: colorScheme.primary.withValues(alpha: 0.3),
          strokeWidth: 4.0,
        ),
        // Remaining route from current position (darker)
        if (session != null && session!.currentInstructionIndex < route.instructions.length - 1)
          Polyline(
            points: _getRemainingRouteGeometry(route, session!),
            color: colorScheme.primary,
            strokeWidth: 5.0,
          ),
      ],
    );
  }

  List<LatLng> _getRemainingRouteGeometry(NavigationRoute route, NavigationSession session) {
    // Simplified: return geometry from current instruction position to end
    if (session.currentInstructionIndex >= route.instructions.length - 1) {
      return [];
    }
    final currentPos = route.instructions[session.currentInstructionIndex].position;
    return [currentPos, route.end.coordinates];
  }
}