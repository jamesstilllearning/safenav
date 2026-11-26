/// SAFENAV CAVITE - Navigation Providers
///
/// Riverpod providers for navigation state management.
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../../data/models/navigation_models.dart';
import '../../data/services/navigation_service.dart' show NavigationService;
import '../../data/services/navigation_service.dart'
    as nav_service
    hide NavigationService;
import '../../data/services/voice_guidance_service.dart';
import '../../../map/data/models/campus_room.dart';
import '../../../map/presentation/providers/map_providers.dart';

// Default start location provider - uses GPS location when available
final defaultStartLocationProvider = Provider<LatLng?>((ref) {
  return ref.watch(userLatLngProvider);
});

/// Selected indoor start point for manual indoor selection
final selectedIndoorStartPointProvider = StateProvider<IndoorStartPoint?>(
  (ref) => null,
);

/// Selected outdoor start point for manual outdoor selection (map tap)
final selectedOutdoorStartPointProvider = StateProvider<OutdoorStartPoint?>(
  (ref) => null,
);

/// Whether to use GPS as start point (default: true)
final useGpsStartProvider = StateProvider<bool>((ref) => true);

/// Combined navigation start point - computed from manual selection or GPS
final navigationStartProvider = Provider<NavigationStartPoint?>((ref) {
  // Check if indoor start point is selected
  final indoorStart = ref.watch(selectedIndoorStartPointProvider);
  if (indoorStart != null) {
    return NavigationStartPoint.indoor(indoorStart);
  }

  // Check if outdoor start point is selected
  final outdoorStart = ref.watch(selectedOutdoorStartPointProvider);
  if (outdoorStart != null) {
    return NavigationStartPoint.outdoor(outdoorStart);
  }

  // Check if GPS should be used
  final useGps = ref.watch(useGpsStartProvider);
  if (useGps) {
    final userLocation = ref.watch(userLatLngProvider);
    if (userLocation != null) {
      return NavigationStartPoint.currentLocation(userLocation);
    }
  }

  return null;
});

/// Start location mode enum for UI
enum StartLocationMode { gps, indoor, outdoor }

/// Current start location mode provider
final startLocationModeProvider = StateProvider<StartLocationMode>(
  (ref) => StartLocationMode.gps,
);

/// Navigation service provider
final navigationServiceProvider = Provider<NavigationService>((ref) {
  return NavigationService.instance;
});

/// Voice guidance service provider
final voiceGuidanceServiceProvider = Provider<VoiceGuidanceService>((ref) {
  return VoiceGuidanceService.instance;
});

/// Navigation graph builder - builds graph when pathway/building data is available
final navigationGraphProvider = FutureProvider<void>((ref) async {
  final pathways = await ref.watch(campusPathwaysProvider.future);
  final buildings = await ref.watch(campusBuildingsProvider.future);
  // Routing is enabled only for paths explicitly verified against an
  // authoritative campus source or field survey. `verified_osm` and
  // `estimated` describe provenance/estimation, not campus safety approval.
  const routingVerificationStatuses = {
    'field_verified',
    'verified_campus',
    'verified_official',
  };
  final routingPathways = pathways
      .where(
        (pathway) => routingVerificationStatuses.contains(
          pathway.verificationStatus.toLowerCase(),
        ),
      )
      .toList(growable: false);

  ref.read(navigationServiceProvider).buildGraph(routingPathways, buildings);
});

/// Current navigation destination (selected from map or search)
final navigationDestinationProvider = StateProvider<NavigationDestination?>(
  (ref) => null,
);

/// Computed route result
final navigationRouteProvider = FutureProvider<NavigationRoute?>((ref) async {
  final startPoint = ref.watch(navigationStartProvider);
  final defaultStart = ref.watch(defaultStartLocationProvider);
  final useGps = ref.watch(useGpsStartProvider);
  final destination = ref.watch(navigationDestinationProvider);
  final service = ref.watch(navigationServiceProvider);
  await ref.watch(navigationGraphProvider.future); // Ensure graph is built

  if (destination == null) return null;

  // Determine effective start position
  LatLng? effectiveStart;

  if (startPoint != null) {
    // Use manually selected start point
    effectiveStart = startPoint.coordinates;
  } else if (useGps) {
    // Use GPS location
    effectiveStart = defaultStart;
  }

  if (effectiveStart == null) return null;

  final result = service.computeRoute(
    start: effectiveStart,
    end: destination.coordinates,
    avoidEmergencyPaths: true,
    preferMainPaths: true,
  );

  if (result == null) return null;

  // Convert service's InstructionType enum to model's InstructionType freezed union
  InstructionType convertInstructionType(nav_service.InstructionType type) {
    switch (type) {
      case nav_service.InstructionType.start:
        return InstructionType.start();
      case nav_service.InstructionType.continueStraight:
        return InstructionType.continueStraight();
      case nav_service.InstructionType.turnLeft:
        return InstructionType.turnLeft();
      case nav_service.InstructionType.turnRight:
        return InstructionType.turnRight();
      case nav_service.InstructionType.turnSlightLeft:
        return InstructionType.turnSlightLeft();
      case nav_service.InstructionType.turnSlightRight:
        return InstructionType.turnSlightRight();
      case nav_service.InstructionType.uturn:
        return InstructionType.uturn();
      case nav_service.InstructionType.arrive:
        return InstructionType.arrive();
      case nav_service.InstructionType.enterBuilding:
        return InstructionType.enterBuilding();
      case nav_service.InstructionType.exitBuilding:
        return InstructionType.exitBuilding();
      // Indoor navigation instruction types
      case nav_service.InstructionType.enterFloor:
        return InstructionType.enterFloor();
      case nav_service.InstructionType.exitFloor:
        return InstructionType.exitFloor();
      case nav_service.InstructionType.useElevator:
        return InstructionType.useElevator();
      case nav_service.InstructionType.useStairs:
        return InstructionType.useStairs();
    }
  }

  // Determine start point for the route model
  NavigationStartPoint routeStartPoint;
  if (startPoint != null) {
    routeStartPoint = startPoint;
  } else {
    // effectiveStart is guaranteed non-null here (checked above)
    routeStartPoint = NavigationStartPoint.currentLocation(
      effectiveStart,
      accuracy: null,
    );
  }

  return NavigationRoute(
    id: 'route_${DateTime.now().millisecondsSinceEpoch}',
    start: routeStartPoint,
    end: destination,
    geometry: result.routeGeometry,
    totalDistance: result.totalDistance,
    estimatedDuration: result.estimatedDuration,
    instructions: result.instructions
        .map(
          (i) => NavigationInstruction(
            instruction: i.instruction,
            latitude: i.position.latitude,
            longitude: i.position.longitude,
            distanceToNext: i.distanceToNext,
            type: convertInstructionType(i.type),
            roadName: i.roadName,
          ),
        )
        .toList(),
    createdAt: DateTime.now(),
    status: RouteStatus.planned(),
  );
});

/// Active navigation session
final navigationSessionProvider = StateProvider<NavigationSession?>(
  (ref) => null,
);

/// Current instruction index for active navigation
final currentInstructionIndexProvider = StateProvider<int>((ref) => 0);

/// Voice guidance enabled
final voiceGuidanceProvider = StateProvider<bool>((ref) => true);

/// Rerouting state
final isReroutingProvider = StateProvider<bool>((ref) => false);

/// Saved routes history
final savedRoutesProvider = StateProvider<List<SavedRoute>>((ref) => []);

// Destination search provider
final searchQueryProvider = StateProvider<String>((ref) => '');

/// Search results for destinations - searches across buildings, rooms, offices, facilities, emergency exits, assembly points
final destinationSearchProvider = FutureProvider<List<NavigationDestination>>((
  ref,
) async {
  final query = ref.watch(searchQueryProvider);
  if (query.isEmpty) return [];

  final results = <NavigationDestination>[];
  final queryLower = query.toLowerCase();

  // Search in buildings
  final buildings = await ref.watch(campusBuildingsProvider.future);
  for (final building in buildings) {
    if (building.name.toLowerCase().contains(queryLower)) {
      results.add(
        NavigationDestination(
          id: 'building_${building.id}',
          name: building.name,
          type: DestinationType.building(),
          coordinates: building.centroid,
          buildingId: building.id,
          description: building.description,
        ),
      );
    }
  }

  // Search in campus rooms/facilities (from parsed map data)
  final parser = ref.watch(campusMapParserProvider);
  if (!parser.isInitialized) {
    await parser.initialize();
  }
  final rooms = parser.rooms;

  for (final room in rooms) {
    // Check if room matches query (name, original label, or building)
    final nameMatch = room.name.toLowerCase().contains(queryLower);
    final labelMatch = room.originalLabel.toLowerCase().contains(queryLower);
    final buildingMatch = room.buildingId.toLowerCase().contains(queryLower);

    if (nameMatch || labelMatch || buildingMatch) {
      // Convert CampusRoom to NavigationDestination
      // Use when for freezed union pattern matching
      final destType = room.category.when(
        room: () => DestinationType.room(),
        restroom: () => DestinationType.facility(),
        office: () => DestinationType.room(), // Treat offices as rooms
        facility: () => DestinationType.facility(),
        canteen: () => DestinationType.facility(),
        hallway: () => DestinationType.facility(),
        laboratory: () => DestinationType.room(),
        library: () => DestinationType.facility(),
        parking: () => DestinationType.facility(),
        sportsFacility: () => DestinationType.facility(),
        stage: () => DestinationType.facility(),
        staircase: () => DestinationType.facility(),
        storage: () => DestinationType.location(),
        unresolvedMapAnnotation: () => DestinationType.location(),
        unresolvedSpace: () => DestinationType.location(),
        other: () => DestinationType.location(),
        // Safety & Emergency categories
        emergencyExit: () => DestinationType.emergencyExit(),
        assemblyPoint: () => DestinationType.assemblyPoint(),
        medicalFacility: () => DestinationType.facility(),
        securityOffice: () => DestinationType.facility(),
      );

      // Get coordinates - use real-world if available, otherwise fallback to building centroid
      LatLng coordinates;
      if (room.geometry.hasRealWorldCoords && room.geometry.centroid != null) {
        coordinates = room.geometry.centroid!;
      } else {
        // Try to find building centroid
        final building = buildings.firstWhere(
          (b) => b.id == room.buildingId,
          orElse: () =>
              throw StateError('Building not found: ${room.buildingId}'),
        );
        coordinates = building.centroid;
      }

      results.add(
        NavigationDestination(
          id: 'room_${room.id}',
          name: room.displayName,
          type: destType,
          coordinates: coordinates,
          buildingId: room.buildingId,
          floorId: room.floorId,
          roomId: room.id,
          roomName: room.name,
          description: room.category.label,
          isEmergencyExit: room.category.maybeWhen(
            emergencyExit: () => true,
            orElse: () => false,
          ),
          isAssemblyPoint: room.category.maybeWhen(
            assemblyPoint: () => true,
            orElse: () => false,
          ),
          isAccessible: room.isNavigableSpace,
        ),
      );
    }
  }

  return results;
});

// Quick destination providers for common destinations
final commonDestinationsProvider = FutureProvider<List<NavigationDestination>>((
  ref,
) async {
  final buildings = await ref.watch(campusBuildingsProvider.future);

  return buildings
      .map(
        (b) => NavigationDestination(
          id: 'building_${b.id}',
          name: b.name,
          type: DestinationType.building(),
          coordinates: b.centroid,
          buildingId: b.id,
          description: b.description,
        ),
      )
      .toList();
});

/// Voice guidance integration - watches navigation session and speaks instructions
final voiceGuidanceIntegrationProvider = Provider<void>((ref) {
  final voiceGuidanceService = ref.watch(voiceGuidanceServiceProvider);

  // Use a listener to react to session changes
  ref.listen<NavigationSession?>(navigationSessionProvider, (
    previous,
    next,
  ) async {
    final voiceGuidanceEnabled = ref.read(voiceGuidanceProvider);
    if (next != null && voiceGuidanceEnabled) {
      // Initialize voice guidance if needed
      await voiceGuidanceService.initialize();

      // Speak route summary on new session
      if (previous == null) {
        await voiceGuidanceService.speakRouteSummary(next.route);
        // Speak first instruction
        if (next.route.instructions.isNotEmpty) {
          await voiceGuidanceService.speakInstruction(
            next.route.instructions[0],
          );
        }
      } else if (previous.currentInstructionIndex !=
          next.currentInstructionIndex) {
        // Instruction changed, speak new instruction
        if (next.currentInstructionIndex < next.route.instructions.length) {
          await voiceGuidanceService.speakInstruction(
            next.route.instructions[next.currentInstructionIndex],
          );
        }
      }
    }
  });
});
