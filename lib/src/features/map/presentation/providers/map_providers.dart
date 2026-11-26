/// SAFENAV CAVITE - Map Providers
///
/// Riverpod providers for campus map state management.
library;

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';

import '../../data/models/campus_boundary.dart';
import '../../data/models/campus_building.dart';
import '../../data/models/campus_pathway.dart';
import '../../data/models/campus_room.dart';
import '../../data/services/map_data_service.dart';
import '../../data/services/tile_cache_service.dart';
import '../../data/services/campus_map_parser.dart';
import '../../../../core/services/location_service.dart';
import '../../../navigation/data/models/navigation_models.dart';
import '../../../navigation/presentation/providers/navigation_providers.dart';

/// Map type enumeration
enum MapType {
  /// Standard OpenStreetMap view
  standard,
  /// Satellite/aerial imagery view (ESRI World Imagery)
  satellite,
}

// Map data service provider
final mapDataServiceProvider = Provider<MapDataService>((ref) {
  return MapDataService.instance;
});

// Campus boundary provider
final campusBoundaryProvider = FutureProvider<CampusBoundary>((ref) async {
  final service = ref.watch(mapDataServiceProvider);
  return service.loadCampusBoundary();
});

// Campus buildings provider
final campusBuildingsProvider = FutureProvider<List<CampusBuilding>>((ref) async {
  final service = ref.watch(mapDataServiceProvider);
  return service.loadCampusBuildings();
});

// Campus pathways provider
final campusPathwaysProvider = FutureProvider<List<CampusPathway>>((ref) async {
  final service = ref.watch(mapDataServiceProvider);
  return service.loadCampusPathways();
});

// Combined map data loaded state
final mapDataLoadedProvider = FutureProvider<void>((ref) async {
  final service = ref.watch(mapDataServiceProvider);
  await service.loadAllData();
});

// Tile cache service provider
final tileCacheServiceProvider = Provider<TileCacheService>((ref) {
  return TileCacheService.instance;
});

// Cached tile layer provider (uses offline tiles when available)
final cachedTileLayerProvider = FutureProvider<TileLayer>((ref) async {
  final tileCacheService = ref.watch(tileCacheServiceProvider);
  await tileCacheService.initialize();
  return tileCacheService.getCachedTileLayer();
});

// Map tile layer provider (falls back to online if cache not initialized)
final mapTileLayerProvider = Provider<List<TileLayer>>((ref) {
  // Try to use cached tile layer, fall back to online
  final cachedTileLayerAsync = ref.watch(cachedTileLayerProvider);
  return cachedTileLayerAsync.when(
    data: (tileLayer) => [tileLayer],
    loading: () => [
      TileLayer(
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        maxZoom: 19,
        subdomains: const ['a', 'b', 'c'],
      ),
    ],
    error: (_, __) => [
      TileLayer(
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        maxZoom: 19,
        subdomains: const ['a', 'b', 'c'],
      ),
    ],
  );
});

// Offline tile cache initialization provider
// This initializes the cache and downloads tiles for the campus bounds
final offlineTileCacheProvider = FutureProvider<void>((ref) async {
  final tileCacheService = ref.watch(tileCacheServiceProvider);
  final boundary = await ref.watch(campusBoundaryProvider.future);

  // Initialize and cache tiles
  await tileCacheService.initialize();
  await tileCacheService.cacheCampusTiles(
    boundary: boundary,
    minZoom: 14,
    maxZoom: 19,
    onProgress: (progress) {
      // Progress updates could be exposed via a separate provider if needed
      debugPrint('[OFFLINE_CACHE] Progress: ${(progress * 100).toStringAsFixed(1)}%');
    },
  );
});

// Campus map parser provider
final campusMapParserProvider = Provider<CampusMapParser>((ref) {
  return CampusMapParser.instance;
});

// Campus map parser initialized provider
final campusMapParserInitializedProvider = FutureProvider<void>((ref) async {
  final parser = ref.watch(campusMapParserProvider);
  await parser.initialize();
});

// Campus rooms provider (from parser)
final campusRoomsProvider = FutureProvider<List<CampusRoom>>((ref) async {
  final parser = ref.watch(campusMapParserProvider);
  if (!parser.isInitialized) {
    await parser.initialize();
  }
  return parser.rooms;
});

// Building references provider (from parser)
final campusBuildingReferencesProvider = FutureProvider<List<CampusBuildingReference>>((ref) async {
  final parser = ref.watch(campusMapParserProvider);
  if (!parser.isInitialized) {
    await parser.initialize();
  }
  return parser.getBuildingReferences();
});

// All floors provider (from parser)
final campusAllFloorsProvider = FutureProvider<List<CampusFloor>>((ref) async {
  final parser = ref.watch(campusMapParserProvider);
  if (!parser.isInitialized) {
    await parser.initialize();
  }
  return parser.getAllFloors();
});

// Map view state provider (zoom, center, etc.)
final mapViewStateProvider = StateNotifierProvider<MapViewStateNotifier, MapViewState>(
  (ref) => MapViewStateNotifier(),
);

/// Map view state
@immutable
class MapViewState {
  final LatLng center;
  final double zoom;
  final bool showBuildings;
  final bool showPathways;
  final bool showBoundary;
  final bool showUserLocation;
  final String? selectedBuildingId;
  final String? selectedPathwayId;
  final String? selectedFloorId; // For indoor mode
  final String? selectedRoomId; // For room selection
  final MapType mapType;
  final MapMode mapMode; // Indoor/Outdoor mode

  const MapViewState({
    this.center = const LatLng(14.3003421, 121.0090085), // EARIST Cavite center
    this.zoom = 17.0,
    this.showBuildings = true,
    this.showPathways = true,
    this.showBoundary = true,
    this.showUserLocation = true,
    this.selectedBuildingId,
    this.selectedPathwayId,
    this.selectedFloorId,
    this.selectedRoomId,
    this.mapType = MapType.standard,
    this.mapMode = const MapMode.outdoor(),
  });

  MapViewState copyWith({
    LatLng? center,
    double? zoom,
    bool? showBuildings,
    bool? showPathways,
    bool? showBoundary,
    bool? showUserLocation,
    String? selectedBuildingId,
    String? selectedPathwayId,
    String? selectedFloorId,
    String? selectedRoomId,
    bool clearSelection = false,
    MapType? mapType,
    MapMode? mapMode,
  }) {
    return MapViewState(
      center: center ?? this.center,
      zoom: zoom ?? this.zoom,
      showBuildings: showBuildings ?? this.showBuildings,
      showPathways: showPathways ?? this.showPathways,
      showBoundary: showBoundary ?? this.showBoundary,
      showUserLocation: showUserLocation ?? this.showUserLocation,
      selectedBuildingId: clearSelection ? null : (selectedBuildingId ?? this.selectedBuildingId),
      selectedPathwayId: clearSelection ? null : (selectedPathwayId ?? this.selectedPathwayId),
      selectedFloorId: clearSelection ? null : (selectedFloorId ?? this.selectedFloorId),
      selectedRoomId: clearSelection ? null : (selectedRoomId ?? this.selectedRoomId),
      mapType: mapType ?? this.mapType,
      mapMode: mapMode ?? this.mapMode,
    );
  }

  /// Check if currently in indoor mode
  bool get isIndoor => mapMode.maybeWhen(
    indoor: (buildingId, floorId) => true,
    orElse: () => false,
  );

  /// Get current building ID if in indoor mode
  String? get indoorBuildingId => mapMode.maybeWhen(
    indoor: (buildingId, floorId) => buildingId,
    orElse: () => null,
  );

  /// Get current floor ID if in indoor mode
  String? get indoorFloorId => mapMode.maybeWhen(
    indoor: (buildingId, floorId) => floorId,
    orElse: () => null,
  );
}

/// Map view state notifier
class MapViewStateNotifier extends StateNotifier<MapViewState> {
  MapViewStateNotifier() : super(const MapViewState());

  void setCenter(LatLng center) {
    state = state.copyWith(center: center);
  }

  void setZoom(double zoom) {
    state = state.copyWith(zoom: zoom.clamp(10.0, 20.0));
  }

  void zoomIn() {
    state = state.copyWith(zoom: (state.zoom + 1).clamp(10.0, 20.0));
  }

  void zoomOut() {
    state = state.copyWith(zoom: (state.zoom - 1).clamp(10.0, 20.0));
  }

  void toggleBuildings() {
    state = state.copyWith(showBuildings: !state.showBuildings);
  }

  void togglePathways() {
    state = state.copyWith(showPathways: !state.showPathways);
  }

  void toggleBoundary() {
    state = state.copyWith(showBoundary: !state.showBoundary);
  }

  void toggleUserLocation() {
    state = state.copyWith(showUserLocation: !state.showUserLocation);
  }

  void toggleMapType() {
    state = state.copyWith(
      mapType: state.mapType == MapType.standard ? MapType.satellite : MapType.standard,
    );
  }

  void setMapType(MapType mapType) {
    state = state.copyWith(mapType: mapType);
  }

  void selectBuilding(String? buildingId) {
    state = state.copyWith(
      selectedBuildingId: buildingId,
      selectedPathwayId: null,
    );
  }

  void selectPathway(String? pathwayId) {
    state = state.copyWith(
      selectedPathwayId: pathwayId,
      selectedBuildingId: null,
    );
  }

  void selectFloor(String? floorId) {
    state = state.copyWith(selectedFloorId: floorId);
  }

  void selectRoom(String? roomId) {
    state = state.copyWith(selectedRoomId: roomId);
  }

  /// Enter indoor mode for a specific building and floor
  void enterIndoorMode(String buildingId, String floorId) {
    state = state.copyWith(
      mapMode: MapMode.indoor(buildingId: buildingId, floorId: floorId),
      showBuildings: false,
      showPathways: false,
      showBoundary: false,
    );
  }

  /// Exit indoor mode back to outdoor
  void exitIndoorMode() {
    state = state.copyWith(
      mapMode: const MapMode.outdoor(),
      showBuildings: true,
      showPathways: true,
      showBoundary: true,
    );
  }

  void clearSelection() {
    state = state.copyWith(clearSelection: true);
  }

  void reset() {
    state = const MapViewState();
  }
}

// Selected building provider (for detail view)
final selectedBuildingProvider = Provider<CampusBuilding?>((ref) {
  final viewState = ref.watch(mapViewStateProvider);
  final buildingsAsync = ref.watch(campusBuildingsProvider);

  if (viewState.selectedBuildingId == null) return null;
  return buildingsAsync.when(
    data: (buildings) => buildings.firstWhere(
      (b) => b.id == viewState.selectedBuildingId,
      orElse: () => throw StateError('Building not found'),
    ),
    loading: () => null,
    error: (_, __) => null,
  );
});

// Selected pathway provider
final selectedPathwayProvider = Provider<CampusPathway?>((ref) {
  final viewState = ref.watch(mapViewStateProvider);
  final pathwaysAsync = ref.watch(campusPathwaysProvider);

  if (viewState.selectedPathwayId == null) return null;
  return pathwaysAsync.when(
    data: (pathways) => pathways.firstWhere(
      (p) => p.id == viewState.selectedPathwayId,
      orElse: () => throw StateError('Pathway not found'),
    ),
    loading: () => null,
    error: (_, __) => null,
  );
});

// Cache status provider (for UI to show cache progress/size)
final tileCacheStatusProvider = FutureProvider<({bool initialized, int sizeBytes})>((ref) async {
  final tileCacheService = ref.watch(tileCacheServiceProvider);
  final initialized = await tileCacheService.storeExists();
  final sizeBytes = initialized ? await tileCacheService.getCacheSize() : 0;
  return (initialized: initialized, sizeBytes: sizeBytes);
});

// Location service provider
final locationServiceProvider = Provider<LocationService>((ref) {
  return LocationService.instance;
});

// User location stream provider - provides real-time GPS updates
final userLocationProvider = StreamProvider<Position>((ref) async* {
  final locationService = ref.watch(locationServiceProvider);

  // Check and request permission
  final permissionResult = await locationService.checkAndRequestPermission();
  if (permissionResult.isFailure) {
    throw Exception('Location permission denied: ${permissionResult.failure.message}');
  }

  // Start position updates
  final startResult = await locationService.startPositionUpdates(
    accuracy: LocationAccuracy.high,
    distanceFilter: 5,
  );
  if (startResult.isFailure) {
    throw Exception('Failed to start location updates: ${startResult.failure.message}');
  }

  // Get initial position
  final positionResult = await locationService.getCurrentPosition();
  if (positionResult.isSuccess) {
    yield positionResult.value;
  }

  // Listen to position stream
  await for (final position in Geolocator.getPositionStream(
    locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 5,
    ),
  )) {
    yield position;
  }
});

// User location as LatLng provider (for easy use on map)
final userLatLngProvider = Provider<LatLng?>((ref) {
  final userLocationAsync = ref.watch(userLocationProvider);
  return userLocationAsync.when(
    data: (position) => LatLng(position.latitude, position.longitude),
    loading: () => null,
    error: (_, __) => null,
  );
});

// User location with accuracy provider
final userLocationWithAccuracyProvider = Provider<({LatLng position, double accuracy})?>((ref) {
  final userLocationAsync = ref.watch(userLocationProvider);
  return userLocationAsync.when(
    data: (position) => (
      position: LatLng(position.latitude, position.longitude),
      accuracy: position.accuracy,
    ),
    loading: () => null,
    error: (_, __) => null,
  );
});

// Active navigation route provider for display on map
final activeNavigationRouteProvider = Provider<NavigationRoute?>((ref) {
  final session = ref.watch(navigationSessionProvider);
  return session?.route;
});

// Active navigation session provider for display on map
final activeNavigationSessionProvider = Provider<NavigationSession?>((ref) {
  return ref.watch(navigationSessionProvider);
});