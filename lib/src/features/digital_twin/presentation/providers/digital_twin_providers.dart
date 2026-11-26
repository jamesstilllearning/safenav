// Copyright 2025 SAFENAV CAVITE
// Digital Twin providers for 3D campus state management

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:safenav_cavite/src/features/digital_twin/data/models/digital_twin_models.dart';
import 'package:safenav_cavite/src/features/digital_twin/data/services/coordinate_transform_service.dart';
import 'package:safenav_cavite/src/features/digital_twin/data/services/model_loader_service.dart';

/// Provider for the coordinate transform service
final coordinateTransformServiceProvider = Provider<CoordinateTransformService>((ref) {
  return CoordinateTransformService();
});

/// Provider for the model loader service
final modelLoaderServiceProvider = Provider<ModelLoaderService>((ref) {
  final transformService = ref.watch(coordinateTransformServiceProvider);
  return ModelLoaderService(transformService);
});

/// Provider for the currently selected building ID
final selectedBuildingIdProvider = StateProvider<String?>((ref) => null);

/// Provider for the current floor index in digital twin
final currentFloorProvider = StateProvider<int>((ref) => 0);

/// Provider for the digital twin theme
final digitalTwinThemeProvider = StateProvider<DigitalTwinTheme>((ref) => DigitalTwinTheme.dark());

/// Provider for exploded view state
final explodedViewProvider = StateProvider<bool>((ref) => false);

/// Provider for highlighted rooms
final highlightedRoomsProvider = StateProvider<Set<String>>((ref) => <String>{});

/// Provider for selected room ID
final selectedRoomIdProvider = StateProvider<String?>((ref) => null);

/// Provider for room search query
final roomSearchQueryProvider = StateProvider<String>((ref) => '');

/// Provider for the digital twin state (loaded building, etc.)
final digitalTwinStateProvider = StateProvider<DigitalTwinState>((ref) => DigitalTwinState.loading());

/// Provider for campus data parsed for 3D
final campusData3DProvider = FutureProvider<CampusDataFor3D>((ref) async {
  final loader = ref.watch(modelLoaderServiceProvider);
  return loader.parseCampusDataFor3D();
});

/// Provider for building 3D model
final building3DProvider = FutureProvider.family<Building3D?, String>((ref, buildingId) async {
  final loader = ref.watch(modelLoaderServiceProvider);
  final campusData = await ref.watch(campusData3DProvider.future);

  if (!campusData.buildings.containsKey(buildingId)) {
    return null;
  }

  return loader.buildBuilding3D(
    buildingId: buildingId,
    campusData: campusData,
    modelPath: 'assets/3d/$buildingId.glb',
    metadataPath: 'assets/3d/${buildingId}_metadata.json',
  );
});

/// Provider for filtered rooms based on search query
final filteredRoomsProvider = Provider.family<List<Room3D>, String>((ref, buildingId) {
  final buildingAsync = ref.watch(building3DProvider(buildingId));
  final query = ref.watch(roomSearchQueryProvider).toLowerCase();

  return buildingAsync.when(
    data: (building) {
      if (building == null) return <Room3D>[];

      final allRooms = building.floors.expand((f) => f.rooms).toList();

      if (query.isEmpty) return allRooms;

      return allRooms.where((room) {
        return room.name.toLowerCase().contains(query) ||
               room.number.toLowerCase().contains(query) ||
               room.category.toString().toLowerCase().contains(query) ||
               room.id.toLowerCase().contains(query);
      }).toList();
    },
    loading: () => <Room3D>[],
    error: (_, __) => <Room3D>[],
  );
});

/// Provider for room search results with relevance scoring
final roomSearchResultsProvider = Provider.family<List<RoomSearchResult>, String>((ref, buildingId) {
  final buildingAsync = ref.watch(building3DProvider(buildingId));
  final query = ref.watch(roomSearchQueryProvider).toLowerCase();

  return buildingAsync.when(
    data: (building) {
      if (building == null || query.isEmpty) return <RoomSearchResult>[];

      final allRooms = building.floors.expand((f) => f.rooms).toList();
      final results = <RoomSearchResult>[];

      for (final room in allRooms) {
        final nameMatch = _calculateMatchScore(room.name.toLowerCase(), query);
        final numberMatch = _calculateMatchScore(room.number.toLowerCase(), query);
        final idMatch = _calculateMatchScore(room.id.toLowerCase(), query);
        final categoryMatch = _calculateMatchScore(room.category.toString().toLowerCase(), query);

        final maxScore = [nameMatch, numberMatch, idMatch, categoryMatch].reduce((a, b) => a > b ? a : b);

        if (maxScore > 0) {
          SearchMatchType matchType;
          String matchedField;

          if (nameMatch == maxScore) {
            matchType = nameMatch == 1.0 ? SearchMatchType.exact() : SearchMatchType.contains();
            matchedField = 'name';
          } else if (numberMatch == maxScore) {
            matchType = numberMatch == 1.0 ? SearchMatchType.exact() : SearchMatchType.contains();
            matchedField = 'number';
          } else if (idMatch == maxScore) {
            matchType = idMatch == 1.0 ? SearchMatchType.exact() : SearchMatchType.contains();
            matchedField = 'id';
          } else {
            matchType = categoryMatch == 1.0 ? SearchMatchType.exact() : SearchMatchType.contains();
            matchedField = 'category';
          }

          results.add(RoomSearchResult(
            room: room,
            relevanceScore: maxScore,
            matchType: matchType,
            matchedField: matchedField,
          ));
        }
      }

      // Sort by relevance score descending
      results.sort((a, b) => b.relevanceScore.compareTo(a.relevanceScore));
      return results;
    },
    loading: () => <RoomSearchResult>[],
    error: (_, __) => <RoomSearchResult>[],
  );
});

/// Helper to calculate match score (1.0 = exact, 0.8 = prefix, 0.6 = contains, 0.3 = fuzzy)
double _calculateMatchScore(String text, String query) {
  if (text == query) return 1.0;
  if (text.startsWith(query)) return 0.8;
  if (text.contains(query)) return 0.6;

  // Simple fuzzy match: check if all query chars appear in order
  int queryIndex = 0;
  for (int i = 0; i < text.length && queryIndex < query.length; i++) {
    if (text[i] == query[queryIndex]) {
      queryIndex++;
    }
  }
  if (queryIndex == query.length) return 0.3;

  return 0.0;
}

/// Provider for camera state
final cameraStateProvider = StateProvider<CameraState>((ref) => CameraState.defaultView());

/// Provider for floor visibility (for exploded view or manual control)
final floorVisibilityProvider = StateProvider<Map<int, bool>>((ref) => {});

/// Provider for loading state of digital twin
final digitalTwinLoadingProvider = StateProvider<bool>((ref) => false);

/// Provider for digital twin errors
final digitalTwinErrorProvider = StateProvider<String?>((ref) => null);

/// Notifier for managing digital twin state transitions
class DigitalTwinController {
  final Ref _ref;

  DigitalTwinController(this._ref);

  /// Load a building into the digital twin
  Future<void> loadBuilding(String buildingId) async {
    _ref.read(digitalTwinLoadingProvider.notifier).state = true;
    _ref.read(digitalTwinErrorProvider.notifier).state = null;
    _ref.read(selectedBuildingIdProvider.notifier).state = buildingId;
    _ref.read(currentFloorProvider.notifier).state = 0;
    _ref.read(highlightedRoomsProvider.notifier).state = <String>{};
    _ref.read(selectedRoomIdProvider.notifier).state = null;

    try {
      final building = await _ref.read(building3DProvider(buildingId).future);
      if (building != null) {
        _ref.read(digitalTwinStateProvider.notifier).state = DigitalTwinState.loaded(
          building: building,
          currentFloor: 0,
          highlightedRooms: <String>{},
          selectedRoomId: null,
          theme: _ref.read(digitalTwinThemeProvider),
          isExplodedView: _ref.read(explodedViewProvider),
          camera: _ref.read(cameraStateProvider),
        );
      } else {
        _ref.read(digitalTwinStateProvider.notifier).state = DigitalTwinState.error(
          message: 'Building $buildingId not found',
          error: StateError('Building not found'),
          stackTrace: null,
        );
      }
    } catch (e, st) {
      _ref.read(digitalTwinStateProvider.notifier).state = DigitalTwinState.error(
        message: 'Failed to load building: $e',
        error: e,
        stackTrace: st,
      );
      _ref.read(digitalTwinErrorProvider.notifier).state = e.toString();
    } finally {
      _ref.read(digitalTwinLoadingProvider.notifier).state = false;
    }
  }

  /// Change the current floor
  void changeFloor(int floorIndex) {
    _ref.read(currentFloorProvider.notifier).state = floorIndex;

    final state = _ref.read(digitalTwinStateProvider);
    _updateLoadedState(state, currentFloor: floorIndex);
  }

  /// Highlight a room
  void highlightRoom(String roomId) {
    final highlighted = _ref.read(highlightedRoomsProvider);
    final newHighlighted = {...highlighted, roomId};
    _ref.read(highlightedRoomsProvider.notifier).state = newHighlighted;

    final state = _ref.read(digitalTwinStateProvider);
    _updateLoadedState(state, highlightedRooms: newHighlighted);
  }

  /// Clear room highlight
  void clearHighlight(String roomId) {
    final highlighted = _ref.read(highlightedRoomsProvider);
    final newHighlighted = {...highlighted}..remove(roomId);
    _ref.read(highlightedRoomsProvider.notifier).state = newHighlighted;

    final state = _ref.read(digitalTwinStateProvider);
    _updateLoadedState(state, highlightedRooms: newHighlighted);
  }

  /// Select a room
  void selectRoom(String? roomId) {
    _ref.read(selectedRoomIdProvider.notifier).state = roomId;

    final state = _ref.read(digitalTwinStateProvider);
    _updateLoadedState(state, selectedRoomId: roomId);
  }

  /// Toggle theme
  void toggleTheme() {
    final current = _ref.read(digitalTwinThemeProvider);
    final next = current.next;
    _ref.read(digitalTwinThemeProvider.notifier).state = next;

    final state = _ref.read(digitalTwinStateProvider);
    _updateLoadedState(state, theme: next);
  }

  /// Toggle exploded view
  void toggleExplodedView() {
    final current = _ref.read(explodedViewProvider);
    final next = !current;
    _ref.read(explodedViewProvider.notifier).state = next;

    final state = _ref.read(digitalTwinStateProvider);
    _updateLoadedState(state, isExplodedView: next);
  }

  /// Set camera state
  void setCameraState(CameraState camera) {
    _ref.read(cameraStateProvider.notifier).state = camera;

    final state = _ref.read(digitalTwinStateProvider);
    _updateLoadedState(state, camera: camera);
  }

  /// Helper to update loaded state using Freezed's when method
  void _updateLoadedState(
    DigitalTwinState state, {
    int? currentFloor,
    Set<String>? highlightedRooms,
    String? selectedRoomId,
    DigitalTwinTheme? theme,
    bool? isExplodedView,
    CameraState? camera,
  }) {
    state.when(
      loaded: (building, currFloor, currHighlighted, currSelected, currTheme, currExploded, currCamera) {
        _ref.read(digitalTwinStateProvider.notifier).state = DigitalTwinState.loaded(
          building: building,
          currentFloor: currentFloor ?? currFloor,
          highlightedRooms: highlightedRooms ?? currHighlighted,
          selectedRoomId: selectedRoomId ?? currSelected,
          theme: theme ?? currTheme,
          isExplodedView: isExplodedView ?? currExploded,
          camera: camera ?? currCamera,
        );
      },
      loading: () {},
      error: (message, error, stackTrace) {},
    );
  }

  /// Clear error
  void clearError() {
    _ref.read(digitalTwinErrorProvider.notifier).state = null;
  }

  /// Fly to a specific room
  void flyToRoom(String roomId, {int duration = 1000}) {
    // The WebView handles the actual camera animation
    // This method could be used to trigger the animation via JS channel
    // For now, the screen calls the WebView directly
    // This is a placeholder for future integration
  }
}

/// Provider for the digital twin controller
final digitalTwinControllerProvider = Provider<DigitalTwinController>((ref) {
  return DigitalTwinController(ref);
});