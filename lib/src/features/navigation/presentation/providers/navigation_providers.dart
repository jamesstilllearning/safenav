/// SAFENAV CAVITE - Navigation Providers
///
/// Riverpod providers for navigation state management.
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../../data/models/navigation_models.dart';
import '../../data/services/navigation_service.dart' show NavigationService;
import '../../data/services/navigation_service.dart' as nav_service hide NavigationService;
import '../../data/services/voice_guidance_service.dart';
import '../../../map/presentation/providers/map_providers.dart';

// Default start location provider - uses GPS location when available
final defaultStartLocationProvider = Provider<LatLng?>((ref) {
  return ref.watch(userLatLngProvider);
});

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

  ref.read(navigationServiceProvider).buildGraph(pathways, buildings);
});

/// Current navigation destination (selected from map or search)
final navigationDestinationProvider = StateProvider<NavigationDestination?>((ref) => null);

/// Current navigation start point (user location or selected)
final navigationStartProvider = StateProvider<LatLng?>((ref) => null);

/// Computed route result
final navigationRouteProvider = FutureProvider<NavigationRoute?>((ref) async {
  final start = ref.watch(navigationStartProvider);
  final defaultStart = ref.watch(defaultStartLocationProvider);
  final effectiveStart = start ?? defaultStart;
  final destination = ref.watch(navigationDestinationProvider);
  final service = ref.watch(navigationServiceProvider);
  await ref.watch(navigationGraphProvider.future); // Ensure graph is built

  if (effectiveStart == null || destination == null) return null;

  // After null check, effectiveStart is non-null
  final LatLng startPoint = effectiveStart;

  final result = service.computeRoute(
    start: startPoint,
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
    }
  }

  return NavigationRoute(
    id: 'route_${DateTime.now().millisecondsSinceEpoch}',
    start: NavigationDestination(
      id: 'start',
      name: 'Current Location',
      type: DestinationType.coordinates(),
      coordinates: startPoint,
    ),
    end: destination,
    geometry: result.routeGeometry,
    totalDistance: result.totalDistance,
    estimatedDuration: result.estimatedDuration,
    instructions: result.instructions.map((i) => NavigationInstruction(
      instruction: i.instruction,
      latitude: i.position.latitude,
      longitude: i.position.longitude,
      distanceToNext: i.distanceToNext,
      type: convertInstructionType(i.type),
      roadName: i.roadName,
    )).toList(),
    createdAt: DateTime.now(),
    status: RouteStatus.planned(),
  );
});

/// Active navigation session
final navigationSessionProvider = StateProvider<NavigationSession?>((ref) => null);

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

/// Search results for destinations
final destinationSearchProvider = FutureProvider<List<NavigationDestination>>((ref) async {
  final query = ref.watch(searchQueryProvider);
  if (query.isEmpty) return [];

  // Search in buildings
  final buildings = await ref.watch(campusBuildingsProvider.future);

  final results = <NavigationDestination>[];

  for (final building in buildings) {
    if (building.name.toLowerCase().contains(query.toLowerCase())) {
      results.add(NavigationDestination(
        id: 'building_${building.id}',
        name: building.name,
        type: DestinationType.building(),
        coordinates: building.centroid,
        buildingId: building.id,
        description: building.description,
      ));
    }
  }

  // Add emergency exits, assembly points, etc. as needed
  return results;
});

// Quick destination providers for common destinations
final commonDestinationsProvider = FutureProvider<List<NavigationDestination>>((ref) async {
  final buildings = await ref.watch(campusBuildingsProvider.future);

  return buildings.map((b) => NavigationDestination(
    id: 'building_${b.id}',
    name: b.name,
    type: DestinationType.building(),
    coordinates: b.centroid,
    buildingId: b.id,
    description: b.description,
  )).toList();
});

/// Voice guidance integration - watches navigation session and speaks instructions
final voiceGuidanceIntegrationProvider = Provider<void>((ref) {
  final voiceGuidanceService = ref.watch(voiceGuidanceServiceProvider);

  // Use a listener to react to session changes
  ref.listen<NavigationSession?>(navigationSessionProvider, (previous, next) async {
    final voiceGuidanceEnabled = ref.read(voiceGuidanceProvider);
    if (next != null && voiceGuidanceEnabled) {
      // Initialize voice guidance if needed
      await voiceGuidanceService.initialize();

      // Speak route summary on new session
      if (previous == null) {
        await voiceGuidanceService.speakRouteSummary(next.route);
        // Speak first instruction
        if (next.route.instructions.isNotEmpty) {
          await voiceGuidanceService.speakInstruction(next.route.instructions[0]);
        }
      } else if (previous != null && previous.currentInstructionIndex != next.currentInstructionIndex) {
        // Instruction changed, speak new instruction
        if (next.currentInstructionIndex < next.route.instructions.length) {
          await voiceGuidanceService.speakInstruction(next.route.instructions[next.currentInstructionIndex]);
        }
      }
    }
  });
});