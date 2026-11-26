/// SAFENAV CAVITE - Map Screen
///
/// Main campus map screen with OpenStreetMap tiles, building polygons,
/// pathways, boundary, campus layout image overlay, indoor/outdoor modes,
/// building/floor/facility selection, and interactive markers.
library;

import 'package:material_ui/material_ui.dart' hide NavigationDestination;
import 'package:flutter_map/flutter_map.dart'
    hide LatLngBounds; // Hide to avoid conflict with campus_boundary
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

import '../../data/models/campus_boundary.dart';
import '../../data/models/campus_building.dart';
import '../../data/models/campus_pathway.dart';
import '../../data/models/campus_room.dart';
import '../../../navigation/data/models/navigation_models.dart';
import '../../../navigation/presentation/providers/navigation_providers.dart';
import '../../../../core/router/app_routes.dart';
import '../../../navigation/presentation/providers/navigation_controller.dart';
import '../providers/map_providers.dart';
import '../widgets/campus_plan_reference_view.dart';
import '../../../../shared/widgets/widgets.dart';
import '../../../alerts/presentation/screens/alerts_screen.dart'
    show alertMapCenterProvider;

/// Main campus map screen
class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  final MapController _mapController = MapController();
  bool _hasCenteredOnAlert = false;
  bool _showPlanReference = false;

  @override
  void initState() {
    super.initState();
    // Initialize campus map parser
    ref.read(campusMapParserInitializedProvider);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Check for alert map center and move map if needed
    final alertCenter = ref.read(alertMapCenterProvider);
    if (alertCenter != null && !_hasCenteredOnAlert) {
      _hasCenteredOnAlert = true;
      // Use a post-frame callback to ensure map controller is ready
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _mapController.move(alertCenter, 18.0);
          // Clear the alert center so it doesn't re-center on subsequent builds
          ref.read(alertMapCenterProvider.notifier).state = null;
        }
      });
    }
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

  void _onRoomTap(CampusRoom room) {
    ref.read(mapViewStateProvider.notifier).selectRoom(room.id);
    _showRoomBottomSheet(room);
  }

  void _onMarkerTap(MarkerData marker) {
    _showMarkerBottomSheet(marker);
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

  void _showRoomBottomSheet(CampusRoom room) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _RoomBottomSheet(room: room),
    );
  }

  void _showMarkerBottomSheet(MarkerData marker) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _MarkerBottomSheet(marker: marker),
    );
  }

  void _showBuildingSelector() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const _BuildingSelectorSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final boundaryAsync = ref.watch(campusBoundaryProvider);
    final buildingsAsync = ref.watch(campusBuildingsProvider);
    final pathwaysAsync = ref.watch(campusPathwaysProvider);
    final roomsAsync = ref.watch(campusRoomsProvider);
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
          urlTemplate:
              'https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}',
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
      body: _showPlanReference
          ? CampusPlanReferenceView(
              onClose: () => setState(() => _showPlanReference = false),
            )
          : Stack(
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
                    // Tile Layer (OpenStreetMap or Satellite) - only in outdoor mode
                    if (!viewState.isIndoor) tileLayer,

                    // Campus Boundary - only in outdoor mode
                    if (viewState.showBoundary && !viewState.isIndoor)
                      boundaryAsync.when(
                        data: (boundary) => _BoundaryLayer(boundary: boundary),
                        loading: () => const SizedBox.shrink(),
                        error: (_, __) => const SizedBox.shrink(),
                      ),

                    // Pathways - only in outdoor mode
                    if (viewState.showPathways && !viewState.isIndoor)
                      pathwaysAsync.when(
                        data: (pathways) => _PathwaysLayer(
                          pathways: pathways,
                          onPathwayTap: _onPathwayTap,
                          selectedPathwayId: viewState.selectedPathwayId,
                        ),
                        loading: () => const SizedBox.shrink(),
                        error: (_, __) => const SizedBox.shrink(),
                      ),

                    // Buildings - only in outdoor mode
                    if (viewState.showBuildings && !viewState.isIndoor)
                      buildingsAsync.when(
                        data: (buildings) => _BuildingsLayer(
                          buildings: buildings,
                          onBuildingTap: _onBuildingTap,
                          selectedBuildingId: viewState.selectedBuildingId,
                        ),
                        loading: () => const SizedBox.shrink(),
                        error: (_, __) => const SizedBox.shrink(),
                      ),

                    // Indoor Mode: Room Polygons
                    if (viewState.isIndoor)
                      (() {
                        final buildingId = viewState.indoorBuildingId!;
                        final floorId = viewState.indoorFloorId!;
                        return roomsAsync.when(
                          data: (rooms) {
                            final List<CampusRoom> roomList = rooms;
                            return _IndoorRoomsLayer(
                              rooms: roomList
                                  .where(
                                    (r) =>
                                        r.buildingId == buildingId &&
                                        r.floorId == floorId,
                                  )
                                  .toList(),
                              onRoomTap: _onRoomTap,
                              selectedRoomId: viewState.selectedRoomId,
                            );
                          },
                          loading: () => const SizedBox.shrink(),
                          error: (_, __) => const SizedBox.shrink(),
                        );
                      }()),

                    // Interactive Markers (Emergency exits, assembly points, etc.) - outdoor only
                    if (!viewState.isIndoor)
                      _InteractiveMarkersLayer(
                        onMarkerTap: _onMarkerTap,
                        selectedRoomId: viewState.selectedRoomId,
                      ),

                    // Active Navigation Route Polyline
                    if (activeRoute != null)
                      _ActiveRouteLayer(
                        route: activeRoute,
                        session: activeSession,
                      ),

                    // User Location Marker
                    if (viewState.showUserLocation) const _UserLocationLayer(),
                  ],
                ),

                // Top Toolbar (header + actions)
                _MapToolbar(
                  onBuildingSearch: _showBuildingSelector,
                  onOpenPlanReference: () =>
                      setState(() => _showPlanReference = true),
                  viewState: viewState,
                  onToggleIndoorMode: viewState.isIndoor
                      ? () => ref
                            .read(mapViewStateProvider.notifier)
                            .exitIndoorMode()
                      : null,
                ),

                // Right-edge controls: layers, zoom, compass (Figma)
                _MapRightControls(
                  onToggleLayers: _showLayerOptions,
                  onZoomIn: () =>
                      ref.read(mapViewStateProvider.notifier).zoomIn(),
                  onZoomOut: () =>
                      ref.read(mapViewStateProvider.notifier).zoomOut(),
                  onCenterUser: _centerOnUser,
                ),

                // Bottom Info Bar (when building/pathway/room selected)
                if (viewState.selectedBuildingId != null ||
                    viewState.selectedPathwayId != null ||
                    viewState.selectedRoomId != null)
                  _SelectionInfoBar(
                    onClose: () => ref
                        .read(mapViewStateProvider.notifier)
                        .clearSelection(),
                  ),

                // Indoor Mode Floor Selector (floating)
                if (viewState.isIndoor) _IndoorFloorSelector(),
              ],
            ),
      floatingActionButton: null,
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

/// Indoor rooms layer - shows room polygons for selected building/floor
class _IndoorRoomsLayer extends StatelessWidget {
  final List<CampusRoom> rooms;
  final void Function(CampusRoom) onRoomTap;
  final String? selectedRoomId;

  const _IndoorRoomsLayer({
    required this.rooms,
    required this.onRoomTap,
    this.selectedRoomId,
  });

  @override
  Widget build(BuildContext context) {
    // Filter rooms that have real-world polygon coordinates
    final roomsWithPolygons = rooms
        .where(
          (r) =>
              r.geometry.hasRealWorldCoords &&
              r.geometry.polygon != null &&
              r.geometry.polygon!.isNotEmpty,
        )
        .toList();

    return PolygonLayer(
      polygons: roomsWithPolygons.map((room) {
        final isSelected = room.id == selectedRoomId;
        final categoryColor = Color(room.categoryColor);

        return Polygon(
          points: room.geometry.polygon!,
          color: isSelected
              ? categoryColor.withValues(alpha: 0.5)
              : categoryColor.withValues(alpha: 0.25),
          borderColor: isSelected
              ? categoryColor
              : categoryColor.withValues(alpha: 0.6),
          borderStrokeWidth: isSelected ? 3.0 : 1.5,
        );
      }).toList(),
    );
  }
}

/// Interactive markers layer for emergency exits, assembly points, medical, security
class _InteractiveMarkersLayer extends ConsumerWidget {
  final void Function(MarkerData) onMarkerTap;
  final String? selectedRoomId;

  const _InteractiveMarkersLayer({
    required this.onMarkerTap,
    this.selectedRoomId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roomsAsync = ref.watch(campusRoomsProvider);

    return roomsAsync.when(
      data: (rooms) {
        // Filter for facility and safety/emergency markers
        final markers = <Marker>[];

        for (final room in rooms) {
          if (!room.geometry.hasRealWorldCoords ||
              room.geometry.centroid == null) {
            continue;
          }

          // Show markers for facilities and safety/emergency categories
          final shouldShowMarker = room.category.when(
            room: () => false,
            restroom: () => true,
            office: () => false,
            facility: () => true,
            canteen: () => true,
            hallway: () => false,
            laboratory: () => false,
            library: () => false,
            parking: () => true,
            sportsFacility: () => true,
            stage: () => false,
            staircase: () => true,
            storage: () => false,
            unresolvedMapAnnotation: () => false,
            unresolvedSpace: () => false,
            // Safety & Emergency categories
            emergencyExit: () => true,
            assemblyPoint: () => true,
            medicalFacility: () => true,
            securityOffice: () => true,
            other: () => false,
          );

          if (!shouldShowMarker) continue;

          final isSelected = room.id == selectedRoomId;
          final marker = _createMarker(room, isSelected);
          markers.add(marker);
        }

        return MarkerLayer(markers: markers);
      },
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
    );
  }

  Marker _createMarker(CampusRoom room, bool isSelected) {
    final categoryColor = Color(room.categoryColor);
    final iconData = _getCategoryIcon(room.category);
    final categoryName = room.category.label;

    return Marker(
      point: room.geometry.centroid!,
      width: isSelected ? 56 : 44,
      height: isSelected ? 56 : 44,
      child: GestureDetector(
        onTap: () => onMarkerTap(MarkerData.fromRoom(room)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: isSelected ? 48 : 36,
              height: isSelected ? 48 : 36,
              decoration: BoxDecoration(
                color: categoryColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? Colors.white
                      : categoryColor.withValues(alpha: 0.8),
                  width: isSelected ? 3 : 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: isSelected ? 8 : 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                iconData,
                color: Colors.white,
                size: isSelected ? 24 : 18,
              ),
            ),
            if (isSelected) ...[
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: categoryColor.withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  categoryName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  IconData _getCategoryIcon(RoomCategory category) {
    return category.when(
      room: () => Icons.meeting_room_outlined,
      office: () => Icons.business_outlined,
      laboratory: () => Icons.science_outlined,
      library: () => Icons.library_books_outlined,
      canteen: () => Icons.restaurant_outlined,
      restroom: () => Icons.wc_outlined,
      hallway: () => Icons.door_sliding,
      staircase: () => Icons.stairs_outlined,
      facility: () => Icons.business_outlined,
      parking: () => Icons.local_parking_outlined,
      sportsFacility: () => Icons.sports_soccer_outlined,
      stage: () => Icons.theater_comedy_outlined,
      storage: () => Icons.inventory_2_outlined,
      unresolvedMapAnnotation: () => Icons.help_outline,
      unresolvedSpace: () => Icons.help_outline,
      other: () => Icons.place_outlined,
      // Safety & Emergency categories
      emergencyExit: () => Icons.emergency_outlined,
      assemblyPoint: () => Icons.groups_outlined,
      medicalFacility: () => Icons.local_hospital_outlined,
      securityOffice: () => Icons.security_outlined,
    );
  }
}

/// Marker data model for bottom sheet
@immutable
class MarkerData {
  final String id;
  final String name;
  final String category;
  final String categoryLabel;
  final int categoryColor;
  final LatLng coordinates;
  final String? buildingId;
  final String? floorId;
  final String? description;
  final IconData icon;

  const MarkerData({
    required this.id,
    required this.name,
    required this.category,
    required this.categoryLabel,
    required this.categoryColor,
    required this.coordinates,
    this.buildingId,
    this.floorId,
    this.description,
    required this.icon,
  });

  factory MarkerData.fromRoom(CampusRoom room) {
    return MarkerData(
      id: room.id,
      name: room.displayName,
      category: room.categoryDisplayName,
      categoryLabel: room.categoryDisplayName,
      categoryColor: room.categoryColor,
      coordinates: room.geometry.centroid ?? const LatLng(0, 0),
      buildingId: room.buildingId,
      floorId: room.floorId,
      description: room.notes,
      icon: _getCategoryIcon(room.category),
    );
  }

  static IconData _getCategoryIcon(RoomCategory category) {
    return category.when(
      room: () => Icons.meeting_room_outlined,
      office: () => Icons.business_outlined,
      laboratory: () => Icons.science_outlined,
      library: () => Icons.library_books_outlined,
      canteen: () => Icons.restaurant_outlined,
      restroom: () => Icons.wc_outlined,
      hallway: () => Icons.door_sliding,
      staircase: () => Icons.stairs_outlined,
      facility: () => Icons.business_outlined,
      parking: () => Icons.local_parking_outlined,
      sportsFacility: () => Icons.sports_soccer_outlined,
      stage: () => Icons.theater_comedy_outlined,
      storage: () => Icons.inventory_2_outlined,
      unresolvedMapAnnotation: () => Icons.help_outline,
      unresolvedSpace: () => Icons.help_outline,
      other: () => Icons.place_outlined,
      // Safety & Emergency categories
      emergencyExit: () => Icons.emergency_outlined,
      assemblyPoint: () => Icons.groups_outlined,
      medicalFacility: () => Icons.local_hospital_outlined,
      securityOffice: () => Icons.security_outlined,
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

    final userLocationWithAccuracy = ref.watch(
      userLocationWithAccuracyProvider,
    );

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
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.15),
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
  final VoidCallback onBuildingSearch;
  final VoidCallback onOpenPlanReference;
  final MapViewState viewState;
  final VoidCallback? onToggleIndoorMode;

  const _MapToolbar({
    required this.onBuildingSearch,
    required this.onOpenPlanReference,
    required this.viewState,
    this.onToggleIndoorMode,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return Positioned(
      top: MediaQuery.of(context).padding.top + 8,
      left: 16,
      right: 16,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // App title with map type/mode indicator
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: AppCard(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                elevation: 2,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: _getModeColor(colorScheme),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        _getModeIcon(),
                        color: colorScheme.onPrimaryContainer,
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
                            'EARIST CAVITE CAMPUS',
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: colorScheme.onSurface,
                                ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            _getModeSubtitle(),
                            style: Theme.of(context).textTheme.labelSmall
                                ?.copyWith(color: colorScheme.onSurfaceVariant),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            // Building search button
            _ToolbarButton(
              icon: Icons.search_outlined,
              onPressed: onBuildingSearch,
              tooltip: 'Find Building',
            ),
            const SizedBox(width: 8),
            _ToolbarButton(
              icon: Icons.map_outlined,
              onPressed: onOpenPlanReference,
              tooltip: 'Master Site Plan Reference',
            ),
            const SizedBox(width: 8),
            // Indoor/Outdoor toggle
            if (onToggleIndoorMode != null) ...[
              const SizedBox(width: 8),
              _ToolbarButton(
                icon: Icons.exit_to_app_outlined,
                onPressed: onToggleIndoorMode!,
                tooltip: 'Exit Indoor View',
              ),
            ],
          ],
        ),
      ),
    );
  }

  Color _getModeColor(ColorScheme colorScheme) {
    if (viewState.isIndoor) return colorScheme.primaryContainer;
    return viewState.mapType == MapType.satellite
        ? colorScheme.tertiaryContainer
        : colorScheme.primaryContainer;
  }

  IconData _getModeIcon() {
    if (viewState.isIndoor) return Icons.layers_outlined;
    return viewState.mapType == MapType.satellite
        ? Icons.satellite_outlined
        : Icons.map_outlined;
  }

  String _getModeSubtitle() {
    if (viewState.isIndoor) {
      final buildingId = viewState.indoorBuildingId ?? '';
      final floorId = viewState.indoorFloorId ?? '';
      return 'Indoor: $buildingId > $floorId';
    }
    return viewState.mapType == MapType.satellite
        ? 'Satellite View'
        : 'Standard View';
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
        backgroundColor: colorScheme.surfaceContainerHighest.withValues(
          alpha: 0.9,
        ),
        foregroundColor: colorScheme.onSurface,
      ),
    );
  }
}

/// Right-edge map controls: layers, zoom in/out, compass (Figma)
class _MapRightControls extends ConsumerWidget {
  final VoidCallback onToggleLayers;
  final VoidCallback onZoomIn;
  final VoidCallback onZoomOut;
  final VoidCallback onCenterUser;

  const _MapRightControls({
    required this.onToggleLayers,
    required this.onZoomIn,
    required this.onZoomOut,
    required this.onCenterUser,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return Positioned(
      right: 12,
      top: MediaQuery.of(context).padding.top + 96,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _RightControlButton(
            icon: Icons.layers_outlined,
            onPressed: onToggleLayers,
            tooltip: 'Map Layers',
            semanticLabel: 'Map layers',
            color: colorScheme.primary,
          ),
          const SizedBox(height: 8),
          _RightControlButton(
            icon: Icons.add,
            onPressed: onZoomIn,
            tooltip: 'Zoom In',
            semanticLabel: 'Zoom in',
            color: colorScheme.primary,
          ),
          const SizedBox(height: 4),
          _RightControlButton(
            icon: Icons.remove,
            onPressed: onZoomOut,
            tooltip: 'Zoom Out',
            semanticLabel: 'Zoom out',
            color: colorScheme.primary,
          ),
          const SizedBox(height: 8),
          _RightControlButton(
            icon: Icons.my_location,
            onPressed: onCenterUser,
            tooltip: 'My Location / Compass',
            semanticLabel: 'Center on my location',
            color: colorScheme.primary,
          ),
        ],
      ),
    );
  }
}

/// Single circular control button on the right edge
class _RightControlButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String tooltip;
  final String semanticLabel;
  final Color color;

  const _RightControlButton({
    required this.icon,
    required this.onPressed,
    required this.tooltip,
    required this.semanticLabel,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: AppIconButton(
        icon: icon,
        size: IconButtonSize.medium,
        onPressed: onPressed,
        backgroundColor: Colors.white.withValues(alpha: 0.95),
        foregroundColor: color,
        semanticLabel: semanticLabel,
      ),
    );
  }
}

/// Selection info bar at bottom
class _SelectionInfoBar extends ConsumerWidget {
  final VoidCallback onClose;

  const _SelectionInfoBar({required this.onClose});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final building = ref.watch(selectedBuildingProvider);
    final pathway = ref.watch(selectedPathwayProvider);
    final roomsAsync = ref.watch(campusRoomsProvider);
    final colorScheme = Theme.of(context).colorScheme;

    CampusRoom? room;
    if (roomsAsync.hasValue && roomsAsync.value != null) {
      final viewState = ref.watch(mapViewStateProvider);
      if (viewState.selectedRoomId != null) {
        try {
          room = roomsAsync.value!.firstWhere(
            (CampusRoom r) => r.id == viewState.selectedRoomId,
          );
        } catch (_) {
          room = null;
        }
      }
    }

    return Positioned(
      bottom: 80.0,
      left: 0,
      right: 0,
      child: AppElevatedCard(
        margin: const EdgeInsets.all(16),
        elevation: 8,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      building.category.label,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: AppTextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) =>
                          _BuildingBottomSheet(building: building),
                    );
                  },
                  label: 'Details',
                  icon: Icons.info_outline,
                  iconPosition: IconPosition.leading,
                  size: ButtonSize.small,
                ),
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
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '${pathway.category.label} • ${pathway.lengthMeters.toStringAsFixed(0)}m',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ] else if (room != null) ...[
              Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: Color(room.categoryColor),
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
                      room.displayName,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      room.categoryDisplayName,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: AppTextButton(
                  onPressed: () {
                    _showRoomBottomSheet(context, room!);
                  },
                  label: 'Details',
                  icon: Icons.info_outline,
                  iconPosition: IconPosition.leading,
                  size: ButtonSize.small,
                ),
              ),
            ],
            const SizedBox(width: 8),
            IconButton(
              onPressed: onClose,
              icon: const Icon(Icons.close),
              tooltip: 'Clear selection',
              constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
              padding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }

  void _showRoomBottomSheet(BuildContext context, CampusRoom room) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _RoomBottomSheet(room: room),
    );
  }
}

/// Building bottom sheet - enhanced with floor selector and room list
class _BuildingBottomSheet extends ConsumerWidget {
  final CampusBuilding building;

  const _BuildingBottomSheet({required this.building});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final categoryColor = Color(building.category.colorValue);
    final buildingRefsAsync = ref.watch(campusBuildingReferencesProvider);
    final roomsAsync = ref.watch(campusRoomsProvider);

    void navigateToBuilding() {
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
      ref
          .read(navigationControllerProvider.notifier)
          .startNavigation(destination: destination);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Starting navigation to ${building.name}...')),
      );
    }

    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.95,
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
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 6),
                        AppChip(
                          label: building.category.label,
                          backgroundColor: categoryColor.withValues(
                            alpha: 0.15,
                          ),
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

              // Floor Selector & Room List
              buildingRefsAsync.when(
                data: (List<CampusBuildingReference> buildingRefs) {
                  final buildingRef = buildingRefs.firstWhere(
                    (CampusBuildingReference b) => b.id == building.id,
                    orElse: () => CampusBuildingReference(
                      id: building.id,
                      name: building.name,
                      floors: [],
                      roomCount: 0,
                    ),
                  );

                  if (buildingRef.floors.isEmpty) {
                    return const SizedBox.shrink();
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionHeader(
                        title: 'Floors & Rooms',
                        style: SectionHeaderStyle.standard,
                      ),
                      const SizedBox(height: 10),
                      _FloorTabsWithRooms(
                        buildingId: building.id,
                        floors: buildingRef.floors,
                        roomsAsync: roomsAsync,
                        onRoomTap: (room) {
                          Navigator.pop(context);
                          _showRoomBottomSheet(context, room);
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                },
                loading: () => const Center(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: CircularProgressIndicator(),
                  ),
                ),
                error: (_, __) => const SizedBox.shrink(),
              ),

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

  void _showRoomBottomSheet(BuildContext context, CampusRoom room) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _RoomBottomSheet(room: room),
    );
  }
}

/// Floor tabs with room list for building bottom sheet
class _FloorTabsWithRooms extends ConsumerStatefulWidget {
  final String buildingId;
  final List<CampusFloor> floors;
  final AsyncValue<List<CampusRoom>> roomsAsync;
  final void Function(CampusRoom) onRoomTap;

  const _FloorTabsWithRooms({
    required this.buildingId,
    required this.floors,
    required this.roomsAsync,
    required this.onRoomTap,
  });

  @override
  ConsumerState<_FloorTabsWithRooms> createState() =>
      _FloorTabsWithRoomsState();
}

class _FloorTabsWithRoomsState extends ConsumerState<_FloorTabsWithRooms>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.floors.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        // Search field
        TextField(
          decoration: InputDecoration(
            hintText: 'Search rooms...',
            prefixIcon: const Icon(Icons.search, size: 20),
            suffixIcon: _searchQuery.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear, size: 20),
                    onPressed: () => setState(() => _searchQuery = ''),
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: colorScheme.outlineVariant),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            filled: true,
            fillColor: colorScheme.surfaceContainerHighest.withValues(
              alpha: 0.5,
            ),
          ),
          onChanged: (value) =>
              setState(() => _searchQuery = value.toLowerCase()),
        ),
        const SizedBox(height: 12),

        // Floor tabs
        TabBar(
          controller: _tabController,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          labelColor: colorScheme.primary,
          unselectedLabelColor: colorScheme.onSurfaceVariant,
          indicatorColor: colorScheme.primary,
          dividerColor: Colors.transparent,
          tabs: widget.floors.map((floor) => Tab(text: floor.name)).toList(),
        ),
        const SizedBox(height: 12),

        // Room list for selected floor
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 400),
          child: widget.roomsAsync.when(
            data: (rooms) {
              final allRooms = rooms
                  .where((r) => r.buildingId == widget.buildingId)
                  .toList();

              return TabBarView(
                controller: _tabController,
                children: widget.floors.map((floor) {
                  var floorRooms = allRooms
                      .where((r) => r.floorId == floor.id)
                      .toList();

                  // Apply search filter
                  if (_searchQuery.isNotEmpty) {
                    floorRooms = floorRooms
                        .where(
                          (r) =>
                              r.displayName.toLowerCase().contains(
                                _searchQuery,
                              ) ||
                              r.originalLabel.toLowerCase().contains(
                                _searchQuery,
                              ) ||
                              r.category.label.toLowerCase().contains(
                                _searchQuery,
                              ),
                        )
                        .toList();
                  }

                  // Sort by category priority then name
                  floorRooms.sort((a, b) {
                    final catOrderA = _getCategoryOrder(a.category);
                    final catOrderB = _getCategoryOrder(b.category);
                    if (catOrderA != catOrderB) {
                      return catOrderA.compareTo(catOrderB);
                    }
                    return a.displayName.compareTo(b.displayName);
                  });

                  if (floorRooms.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.meeting_room_outlined,
                            size: 48,
                            color: colorScheme.onSurfaceVariant.withValues(
                              alpha: 0.5,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            _searchQuery.isNotEmpty
                                ? 'No rooms match "$_searchQuery"'
                                : 'No rooms on this floor',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: colorScheme.onSurfaceVariant),
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: floorRooms.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final room = floorRooms[index];
                      return _RoomListTile(
                        room: room,
                        onTap: () => widget.onRoomTap(room),
                      );
                    },
                  );
                }).toList(),
              );
            },
            loading: () =>
                const Center(child: InlineLoading(message: 'Loading rooms...')),
            error: (_, __) => Center(
              child: InlineError(
                message: 'Failed to load rooms',
                retryLabel: 'Retry',
              ),
            ),
          ),
        ),
      ],
    );
  }

  int _getCategoryOrder(RoomCategory category) {
    return category.when(
      office: () => 0,
      laboratory: () => 1,
      library: () => 2,
      room: () => 3,
      canteen: () => 4,
      facility: () => 5,
      restroom: () => 6,
      staircase: () => 7,
      hallway: () => 8,
      sportsFacility: () => 9,
      stage: () => 10,
      parking: () => 11,
      storage: () => 12,
      unresolvedMapAnnotation: () => 13,
      unresolvedSpace: () => 14,
      other: () => 15,
      // Safety & Emergency categories
      emergencyExit: () => 16,
      assemblyPoint: () => 17,
      medicalFacility: () => 18,
      securityOffice: () => 19,
    );
  }
}

/// Room list tile
class _RoomListTile extends StatelessWidget {
  final CampusRoom room;
  final VoidCallback onTap;

  const _RoomListTile({required this.room, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final categoryColor = Color(room.categoryColor);

    return AppCard(
      padding: const EdgeInsets.all(12),
      onTap: onTap,
      elevation: 1,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: categoryColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              _getCategoryIcon(room.category),
              color: categoryColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  room.displayName,
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    AppChip(
                      label: room.categoryDisplayName,
                      backgroundColor: categoryColor.withValues(alpha: 0.1),
                      labelStyle: TextStyle(
                        color: categoryColor,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (room.floorLevel != FloorLevel.notIndicated()) ...[
                      const SizedBox(width: 8),
                      AppChip(
                        label: room.floorDisplayName,
                        backgroundColor: colorScheme.surfaceContainerHighest,
                        labelStyle: TextStyle(
                          color: colorScheme.onSurfaceVariant,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: colorScheme.onSurfaceVariant,
            size: 20,
          ),
        ],
      ),
    );
  }

  IconData _getCategoryIcon(RoomCategory category) {
    return category.when(
      room: () => Icons.meeting_room_outlined,
      office: () => Icons.business_outlined,
      laboratory: () => Icons.science_outlined,
      library: () => Icons.library_books_outlined,
      canteen: () => Icons.restaurant_outlined,
      restroom: () => Icons.wc_outlined,
      hallway: () => Icons.door_sliding,
      staircase: () => Icons.stairs_outlined,
      facility: () => Icons.business_outlined,
      parking: () => Icons.local_parking_outlined,
      sportsFacility: () => Icons.sports_soccer_outlined,
      stage: () => Icons.theater_comedy_outlined,
      storage: () => Icons.inventory_2_outlined,
      unresolvedMapAnnotation: () => Icons.help_outline,
      unresolvedSpace: () => Icons.help_outline,
      other: () => Icons.place_outlined,
      // Safety & Emergency categories
      emergencyExit: () => Icons.emergency_outlined,
      assemblyPoint: () => Icons.groups_outlined,
      medicalFacility: () => Icons.local_hospital_outlined,
      securityOffice: () => Icons.security_outlined,
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
      ref
          .read(navigationControllerProvider.notifier)
          .startNavigation(destination: destination);
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
                      pathway.isPolygon
                          ? Icons.park_outlined
                          : Icons.directions_walk,
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
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 6),
                        AppChip(
                          label: pathway.category.label,
                          backgroundColor: categoryColor.withValues(
                            alpha: 0.15,
                          ),
                          labelStyle: TextStyle(
                            color: categoryColor,
                            fontWeight: FontWeight.w500,
                          ),
                          icon: pathway.isPolygon
                              ? Icons.park_outlined
                              : Icons.directions_walk,
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

/// Room bottom sheet with navigate and 3D view actions
class _RoomBottomSheet extends ConsumerWidget {
  final CampusRoom room;

  const _RoomBottomSheet({required this.room});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final categoryColor = Color(room.categoryColor);

    void navigateToRoom() {
      final destination = NavigationDestination(
        id: 'room_${room.id}',
        name: room.displayName,
        type: DestinationType.room(),
        coordinates:
            room.geometry.centroid ??
            room.geometry.latLng ??
            const LatLng(0, 0),
        buildingId: room.buildingId,
        floorId: room.floorId,
        roomId: room.id,
        roomName: room.displayName,
        description: room.notes,
      );
      ref.read(navigationDestinationProvider.notifier).state = destination;
      Navigator.pop(context);
      ref
          .read(navigationControllerProvider.notifier)
          .startNavigation(destination: destination);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Starting navigation to ${room.displayName}...'),
        ),
      );
    }

    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.35,
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
                      _getCategoryIcon(room.category),
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
                          room.displayName,
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            AppChip(
                              label: room.categoryDisplayName,
                              backgroundColor: categoryColor.withValues(
                                alpha: 0.15,
                              ),
                              labelStyle: TextStyle(
                                color: categoryColor,
                                fontWeight: FontWeight.w500,
                              ),
                              icon: _getCategoryIcon(room.category),
                            ),
                            if (room.floorLevel !=
                                FloorLevel.notIndicated()) ...[
                              const SizedBox(width: 8),
                              AppChip(
                                label: room.floorDisplayName,
                                backgroundColor:
                                    colorScheme.surfaceContainerHighest,
                                labelStyle: TextStyle(
                                  color: colorScheme.onSurfaceVariant,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              if (room.notes != null && room.notes!.isNotEmpty) ...[
                SectionHeader(
                  title: 'Description',
                  style: SectionHeaderStyle.standard,
                ),
                const SizedBox(height: 10),
                Text(
                  room.notes!,
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
              if (room.geometry.hasRealWorldCoords) ...[
                _InfoRow(
                  icon: Icons.location_on_outlined,
                  label: 'Coordinates',
                  value:
                      '${room.geometry.centroid?.latitude.toStringAsFixed(6) ?? "N/A"}, ${room.geometry.centroid?.longitude.toStringAsFixed(6) ?? "N/A"}',
                ),
                const SizedBox(height: 12),
              ],
              _InfoRow(
                icon: Icons.apartment_outlined,
                label: 'Building',
                value: room.buildingId,
              ),
              const SizedBox(height: 12),
              _InfoRow(
                icon: Icons.layers_outlined,
                label: 'Floor',
                value: room.floorDisplayName,
              ),
              const SizedBox(height: 12),
              _InfoRow(
                icon: Icons.verified_outlined,
                label: 'Data Confidence',
                value: room.confidence.label,
              ),
              const SizedBox(height: 12),
              _InfoRow(
                icon: Icons.straighten_outlined,
                label: 'Geometry Confidence',
                value: room.geometryConfidence.label,
              ),

              const SizedBox(height: 28),

              // Action buttons
              Row(
                children: [
                  Expanded(
                    child: AppOutlinedButton(
                      onPressed: navigateToRoom,
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
                        context.push(
                          AppRoutes.digitalTwinRoute(room.buildingId),
                        );
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

  IconData _getCategoryIcon(RoomCategory category) {
    return category.when(
      room: () => Icons.meeting_room_outlined,
      office: () => Icons.business_outlined,
      laboratory: () => Icons.science_outlined,
      library: () => Icons.library_books_outlined,
      canteen: () => Icons.restaurant_outlined,
      restroom: () => Icons.wc_outlined,
      hallway: () => Icons.door_sliding,
      staircase: () => Icons.stairs_outlined,
      facility: () => Icons.business_outlined,
      parking: () => Icons.local_parking_outlined,
      sportsFacility: () => Icons.sports_soccer_outlined,
      stage: () => Icons.theater_comedy_outlined,
      storage: () => Icons.inventory_2_outlined,
      unresolvedMapAnnotation: () => Icons.help_outline,
      unresolvedSpace: () => Icons.help_outline,
      other: () => Icons.place_outlined,
      // Safety & Emergency categories
      emergencyExit: () => Icons.emergency_outlined,
      assemblyPoint: () => Icons.groups_outlined,
      medicalFacility: () => Icons.local_hospital_outlined,
      securityOffice: () => Icons.security_outlined,
    );
  }
}

/// Marker bottom sheet for interactive markers
class _MarkerBottomSheet extends ConsumerWidget {
  final MarkerData marker;

  const _MarkerBottomSheet({required this.marker});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final categoryColor = Color(marker.categoryColor);

    void navigateToMarker() {
      final destination = NavigationDestination(
        id: 'marker_${marker.id}',
        name: marker.name,
        type: DestinationType.facility(),
        coordinates: marker.coordinates,
        buildingId: marker.buildingId,
        floorId: marker.floorId,
        description: marker.description,
      );
      ref.read(navigationDestinationProvider.notifier).state = destination;
      Navigator.pop(context);
      ref
          .read(navigationControllerProvider.notifier)
          .startNavigation(destination: destination);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Starting navigation to ${marker.name}...')),
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
                    child: Icon(marker.icon, color: categoryColor, size: 28),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          marker.name.isNotEmpty
                              ? marker.name
                              : marker.categoryLabel,
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 6),
                        AppChip(
                          label: marker.categoryLabel,
                          backgroundColor: categoryColor.withValues(
                            alpha: 0.15,
                          ),
                          labelStyle: TextStyle(
                            color: categoryColor,
                            fontWeight: FontWeight.w500,
                          ),
                          icon: marker.icon,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              if (marker.description != null &&
                  marker.description!.isNotEmpty) ...[
                SectionHeader(
                  title: 'Description',
                  style: SectionHeaderStyle.standard,
                ),
                const SizedBox(height: 10),
                Text(
                  marker.description!,
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
                icon: Icons.location_on_outlined,
                label: 'Coordinates',
                value:
                    '${marker.coordinates.latitude.toStringAsFixed(6)}, ${marker.coordinates.longitude.toStringAsFixed(6)}',
              ),
              if (marker.buildingId != null) ...[
                const SizedBox(height: 12),
                _InfoRow(
                  icon: Icons.apartment_outlined,
                  label: 'Building',
                  value: marker.buildingId!,
                ),
              ],
              if (marker.floorId != null) ...[
                const SizedBox(height: 12),
                _InfoRow(
                  icon: Icons.layers_outlined,
                  label: 'Floor',
                  value: marker.floorId!,
                ),
              ],

              const SizedBox(height: 28),

              Row(
                children: [
                  Expanded(
                    child: AppFilledButton(
                      onPressed: navigateToMarker,
                      label: 'Navigate',
                      icon: Icons.directions,
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

/// Building selector bottom sheet
class _BuildingSelectorSheet extends ConsumerWidget {
  const _BuildingSelectorSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final buildingRefsAsync = ref.watch(campusBuildingReferencesProvider);

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              // Handle bar
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(top: 12, bottom: 8),
                  decoration: BoxDecoration(
                    color: colorScheme.outlineVariant,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),

              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      'Select Building',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),

              // Search field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search buildings...',
                    prefixIcon: const Icon(Icons.search, size: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: colorScheme.outlineVariant),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    filled: true,
                    fillColor: colorScheme.surfaceContainerHighest.withValues(
                      alpha: 0.5,
                    ),
                  ),
                  onChanged: (value) {
                    // Search is handled in the list below
                  },
                ),
              ),
              const SizedBox(height: 16),

              // Building list
              Expanded(
                child: buildingRefsAsync.when(
                  data: (buildingRefs) {
                    if (buildingRefs.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.apartment_outlined,
                              size: 64,
                              color: colorScheme.onSurfaceVariant.withValues(
                                alpha: 0.5,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No buildings found',
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                            ),
                          ],
                        ),
                      );
                    }

                    return ListView.separated(
                      controller: scrollController,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      itemCount: buildingRefs.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        final buildingRef = buildingRefs[index];
                        return _BuildingListTile(
                          buildingRef: buildingRef,
                          onTap: () {
                            Navigator.pop(context);
                            _enterBuilding(context, ref, buildingRef);
                          },
                        );
                      },
                    );
                  },
                  loading: () => const Center(
                    child: InlineLoading(message: 'Loading buildings...'),
                  ),
                  error: (_, __) => Center(
                    child: InlineError(
                      message: 'Failed to load buildings',
                      retryLabel: 'Retry',
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _enterBuilding(
    BuildContext context,
    WidgetRef ref,
    CampusBuildingReference buildingRef,
  ) {
    // Select the building and show bottom sheet
    ref.read(mapViewStateProvider.notifier).selectBuilding(buildingRef.id);

    // Get the building data
    final buildingsAsync = ref.read(campusBuildingsProvider);
    buildingsAsync.whenData((buildings) {
      final building = buildings.firstWhere(
        (b) => b.id == buildingRef.id,
        orElse: () => throw StateError('Building not found'),
      );

      // Show building bottom sheet
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => _BuildingBottomSheet(building: building),
      );
    });
  }
}

/// Building list tile for selector
class _BuildingListTile extends StatelessWidget {
  final CampusBuildingReference buildingRef;
  final VoidCallback onTap;

  const _BuildingListTile({required this.buildingRef, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppCard(
      padding: const EdgeInsets.all(16),
      onTap: onTap,
      elevation: 1,
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.apartment_outlined,
              color: colorScheme.primary,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  buildingRef.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${buildingRef.roomCount} rooms • ${buildingRef.floors.length} floors',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                if (buildingRef.roomsByCategory != null &&
                    buildingRef.roomsByCategory!.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 6,
                    runSpacing: 4,
                    children: buildingRef.roomsByCategory!.entries.map((entry) {
                      return AppChip(
                        label: '${entry.key} (${entry.value})',
                        backgroundColor: colorScheme.surfaceContainerHighest,
                        labelStyle: TextStyle(
                          color: colorScheme.onSurfaceVariant,
                          fontSize: 10,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ],
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: colorScheme.onSurfaceVariant,
            size: 20,
          ),
        ],
      ),
    );
  }
}

/// Indoor floor selector (floating)
class _IndoorFloorSelector extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewState = ref.watch(mapViewStateProvider);
    final buildingRefsAsync = ref.watch(campusBuildingReferencesProvider);
    final colorScheme = Theme.of(context).colorScheme;

    if (!viewState.isIndoor) return const SizedBox.shrink();

    return buildingRefsAsync.when(
      data: (List<CampusBuildingReference> buildingRefs) {
        final buildingRef = buildingRefs
            .where(
              (CampusBuildingReference b) =>
                  b.id == viewState.indoorBuildingId!,
            )
            .firstOrNull;
        if (buildingRef == null || buildingRef.floors.isEmpty) {
          return const SizedBox.shrink();
        }

        return Positioned(
          top: MediaQuery.of(context).padding.top + 80, // Below toolbar
          left: 16,
          right: 16,
          child: AppCard(
            elevation: 4,
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.layers_outlined,
                      color: colorScheme.primary,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Floor: ${viewState.indoorFloorId!}',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    PopupMenuButton<String>(
                      icon: Icon(
                        Icons.expand_more,
                        color: colorScheme.onSurface,
                      ),
                      onSelected: (floorId) {
                        ref
                            .read(mapViewStateProvider.notifier)
                            .selectFloor(floorId);
                        ref
                            .read(mapViewStateProvider.notifier)
                            .enterIndoorMode(
                              viewState.indoorBuildingId!,
                              floorId,
                            );
                      },
                      itemBuilder: (context) => buildingRef.floors.map((floor) {
                        return PopupMenuItem<String>(
                          value: floor.id,
                          child: Text(floor.name),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
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
      initialChildSize: 0.6,
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
                onChanged: (v) =>
                    ref.read(mapViewStateProvider.notifier).toggleBuildings(),
              ),
              const SizedBox(height: 12),
              _LayerToggleCard(
                icon: Icons.directions_walk_outlined,
                title: 'Pathways',
                subtitle: 'Walkways and emergency routes',
                color: const Color(0xFF4CAF50),
                value: viewState.showPathways,
                onChanged: (v) =>
                    ref.read(mapViewStateProvider.notifier).togglePathways(),
              ),
              const SizedBox(height: 12),
              _LayerToggleCard(
                icon: Icons.map_outlined,
                title: 'Campus Boundary',
                subtitle: 'EARIST Cavite campus perimeter',
                color: colorScheme.primary,
                value: viewState.showBoundary,
                onChanged: (v) =>
                    ref.read(mapViewStateProvider.notifier).toggleBoundary(),
              ),
              const SizedBox(height: 12),
              _LayerToggleCard(
                icon: Icons.my_location_outlined,
                title: 'My Location',
                subtitle: 'Show current GPS position',
                color: const Color(0xFFFF9800),
                value: viewState.showUserLocation,
                onChanged: (v) => ref
                    .read(mapViewStateProvider.notifier)
                    .toggleUserLocation(),
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
                onChanged: (type) =>
                    ref.read(mapViewStateProvider.notifier).setMapType(type),
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
          const SizedBox(height: 8),
          _LegendItem(
            color: const Color(0xFF9C27B0),
            label: 'Campus Layout Image',
            shape: LegendShape.square,
          ),
          const SizedBox(height: 8),
          _LegendItem(
            color: const Color(0xFFF44336),
            label: 'Emergency Routes',
            shape: LegendShape.line,
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
            shape: shape == LegendShape.circle
                ? BoxShape.circle
                : BoxShape.rectangle,
            borderRadius: shape == LegendShape.square
                ? BorderRadius.circular(4)
                : null,
          ),
          child: shape == LegendShape.line
              ? Center(
                  child: Container(width: 12, height: 3, color: Colors.white),
                )
              : null,
        ),
        const SizedBox(width: 12),
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
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
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
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

  const _MapTypeSelector({required this.currentType, required this.onChanged});

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
          if (isSelected) Icon(Icons.check_circle, color: color, size: 24),
        ],
      ),
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
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Active navigation route layer - shows the route polyline and markers on the map
class _ActiveRouteLayer extends StatelessWidget {
  final NavigationRoute route;
  final NavigationSession? session;

  const _ActiveRouteLayer({required this.route, this.session});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final startCoords = route.start.coordinates;
    final endCoords = route.end.coordinates;

    return Stack(
      children: [
        // Route polylines
        PolylineLayer(
          polylines: [
            // Full route geometry (light)
            Polyline(
              points: route.geometry,
              color: colorScheme.primary.withValues(alpha: 0.3),
              strokeWidth: 4.0,
            ),
            // Remaining route from current position (darker)
            if (session != null &&
                session!.currentInstructionIndex <
                    route.instructions.length - 1)
              Polyline(
                points: _getRemainingRouteGeometry(route, session!),
                color: colorScheme.primary,
                strokeWidth: 5.0,
              ),
          ],
        ),
        // Start marker
        if (startCoords != null)
          MarkerLayer(
            markers: [
              Marker(
                point: startCoords,
                width: 48,
                height: 48,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 3),
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
            ],
          ),
        // Destination marker
        MarkerLayer(
          markers: [
            Marker(
              point: endCoords,
              width: 44,
              height: 44,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Icon(Icons.flag, color: Colors.white, size: 20),
              ),
            ),
          ],
        ),
      ],
    );
  }

  List<LatLng> _getRemainingRouteGeometry(
    NavigationRoute route,
    NavigationSession session,
  ) {
    // Simplified: return geometry from current instruction position to end
    if (session.currentInstructionIndex >= route.instructions.length - 1) {
      return [];
    }
    final currentPos =
        route.instructions[session.currentInstructionIndex].position;
    return [currentPos, route.end.coordinates];
  }
}

