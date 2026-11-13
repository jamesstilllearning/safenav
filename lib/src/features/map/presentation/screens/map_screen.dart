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
import 'package:latlong2/latlong.dart';

import '../../data/models/campus_boundary.dart';
import '../../data/models/campus_building.dart';
import '../../data/models/campus_pathway.dart';
import '../../../navigation/data/models/navigation_models.dart';
import '../../../navigation/presentation/providers/navigation_providers.dart';
import '../providers/map_providers.dart';

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
            onZoomIn: () => ref.read(mapViewStateProvider.notifier).zoomIn(),
            onZoomOut: () => ref.read(mapViewStateProvider.notifier).zoomOut(),
            onCenterUser: _centerOnUser,
            onToggleLayers: _showLayerOptions,
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
    );
  }
}

/// Tile layer widget
class TileLayerWidget extends ConsumerWidget {
  final List<TileLayer> tileLayers;

  const TileLayerWidget({super.key, required this.tileLayers});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TileLayer(
      urlTemplate: tileLayers.first.urlTemplate,
      maxZoom: tileLayers.first.maxZoom,
      subdomains: tileLayers.first.subdomains,
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
class _MapToolbar extends StatelessWidget {
  final VoidCallback onZoomIn;
  final VoidCallback onZoomOut;
  final VoidCallback onCenterUser;
  final VoidCallback onToggleLayers;

  const _MapToolbar({
    required this.onZoomIn,
    required this.onZoomOut,
    required this.onCenterUser,
    required this.onToggleLayers,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Positioned(
      top: MediaQuery.of(context).padding.top + 8,
      left: 16,
      right: 16,
      child: Row(
        children: [
          // App title
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.map_outlined, color: colorScheme.primary, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'EARIST Cavite Campus',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
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
      child: Material(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 44,
            height: 44,
            alignment: Alignment.center,
            child: Icon(icon, color: colorScheme.onSurface, size: 24),
          ),
        ),
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

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Map Layers',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _LayerToggle(
            title: 'Buildings',
            subtitle: 'Campus building footprints',
            value: viewState.showBuildings,
            onChanged: (v) => ref.read(mapViewStateProvider.notifier).toggleBuildings(),
            color: Color(0xFF2196F3),
          ),
          _LayerToggle(
            title: 'Pathways',
            subtitle: 'Walkways and emergency routes',
            value: viewState.showPathways,
            onChanged: (v) => ref.read(mapViewStateProvider.notifier).togglePathways(),
            color: Color(0xFF4CAF50),
          ),
          _LayerToggle(
            title: 'Campus Boundary',
            subtitle: 'EARIST Cavite campus perimeter',
            value: viewState.showBoundary,
            onChanged: (v) => ref.read(mapViewStateProvider.notifier).toggleBoundary(),
            color: colorScheme.primary,
          ),
          _LayerToggle(
            title: 'My Location',
            subtitle: 'Show current GPS position',
            value: viewState.showUserLocation,
            onChanged: (v) => ref.read(mapViewStateProvider.notifier).toggleUserLocation(),
            color: Color(0xFFFF9800),
          ),
          const SizedBox(height: 16),
          // Map Type Selector
          Text(
            'Map Type',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          _MapTypeSelector(
            currentType: viewState.mapType,
            onChanged: (type) => ref.read(mapViewStateProvider.notifier).toggleMapType(),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Done'),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom),
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
          subtitle: 'OpenStreetMap view',
          icon: Icons.map_outlined,
          color: Color(0xFF2196F3),
          isSelected: currentType == MapType.standard,
          onTap: () => onChanged(MapType.standard),
        ),
        const SizedBox(height: 8),
        // Satellite map option
        _MapTypeTile(
          title: 'Satellite',
          subtitle: 'Aerial/satellite imagery (ESRI)',
          icon: Icons.satellite_outlined,
          color: Color(0xFF4CAF50),
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

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? color : colorScheme.outlineVariant,
            width: isSelected ? 2 : 1,
          ),
          color: isSelected
              ? color.withValues(alpha: 0.1)
              : colorScheme.surfaceContainerHighest,
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color, size: 22),
            ),
            const SizedBox(width: 12),
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
      ),
    );
  }
}

/// Layer toggle tile
class _LayerToggle extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color color;

  const _LayerToggle({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: color, width: 2),
        ),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
      trailing: Switch(value: value, onChanged: onChanged),
      contentPadding: EdgeInsets.zero,
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
      child: Material(
        elevation: 8,
        color: colorScheme.surfaceContainerHighest,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              if (building != null) ...[
                Container(
                  width: 12,
                  height: 12,
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
                TextButton.icon(
                  onPressed: () {
                    // TODO: Navigate to building detail screen
                  },
                  icon: const Icon(Icons.info_outline, size: 18),
                  label: const Text('Details'),
                ),
              ] else if (pathway != null) ...[
                Container(
                  width: 12,
                  height: 12,
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
      ),
    );
  }
}

/// Floating action button for centering on user
class _MapFAB extends StatelessWidget {
  final VoidCallback onCenterUser;

  const _MapFAB({required this.onCenterUser});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onCenterUser,
      heroTag: 'map_center_user',
      mini: true,
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
      // Set the building as navigation destination
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

      // Switch to navigation tab (index 1)
      // The GoRouter will handle the tab switch when we navigate
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Route to ${building.name} computed. Switch to Navigation tab to start.')),
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
            padding: const EdgeInsets.all(16),
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
              const SizedBox(height: 16),

              // Building icon and name
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: categoryColor.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.apartment_outlined,
                      color: categoryColor,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
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
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: categoryColor.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            building.category.label,
                            style: TextStyle(
                              color: categoryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Description
              if (building.description.isNotEmpty) ...[
                Text(
                  'About',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  building.description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 16),
              ],

              // Details
              _InfoRow(
                icon: Icons.location_on_outlined,
                label: 'Coordinates',
                value:
                    '${building.centroid.latitude.toStringAsFixed(6)}, ${building.centroid.longitude.toStringAsFixed(6)}',
              ),
              _InfoRow(
                icon: Icons.straighten_outlined,
                label: 'OSM Way ID',
                value: building.osmWayId.toString(),
              ),
              _InfoRow(
                icon: Icons.verified_outlined,
                label: 'Verification',
                value: building.verificationStatus.replaceAll('_', ' '),
              ),
              if (building.areaSqMeters != null)
                _InfoRow(
                  icon: Icons.square_foot_outlined,
                  label: 'Approx. Area',
                  value: '${building.areaSqMeters!.toStringAsFixed(0)} m²',
                ),

              const SizedBox(height: 24),

              // Action buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: navigateToBuilding,
                      icon: const Icon(Icons.directions),
                      label: const Text('Navigate'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: () {
                        // TODO: Show more details
                      },
                      icon: const Icon(Icons.info_outline),
                      label: const Text('Details'),
                    ),
                  ),
                ],
              ),

              SizedBox(height: MediaQuery.of(context).padding.bottom + 16),
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

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Route to ${pathway.name} computed. Switch to Navigation tab to start.')),
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
            padding: const EdgeInsets.all(16),
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
              const SizedBox(height: 16),

              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: categoryColor.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      pathway.isPolygon ? Icons.park_outlined : Icons.directions_walk,
                      color: categoryColor,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
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
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: categoryColor.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            pathway.category.label,
                            style: TextStyle(
                              color: categoryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              if (pathway.description.isNotEmpty) ...[
                Text(
                  'Description',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  pathway.description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 16),
              ],

              _InfoRow(
                icon: Icons.straighten_outlined,
                label: pathway.isPolygon ? 'Area' : 'Length',
                value: pathway.isPolygon
                    ? '${pathway.areaSqMeters.toStringAsFixed(0)} m²'
                    : '${pathway.lengthMeters.toStringAsFixed(0)} m',
              ),
              _InfoRow(
                icon: Icons.layers_outlined,
                label: 'Surface',
                value: pathway.surface,
              ),
              _InfoRow(
                icon: Icons.verified_outlined,
                label: 'Verification',
                value: pathway.verificationStatus.replaceAll('_', ' '),
              ),

              const SizedBox(height: 24),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: navigateUsingPathway,
                      icon: const Icon(Icons.route),
                      label: const Text('Use Route'),
                    ),
                  ),
                ],
              ),

              SizedBox(height: MediaQuery.of(context).padding.bottom + 16),
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

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 20, color: colorScheme.onSurfaceVariant),
          const SizedBox(width: 12),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
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