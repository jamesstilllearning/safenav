/// SAFENAV CAVITE - Navigation Controller
///
/// StateNotifier for managing active navigation with GPS tracking,
/// automatic instruction advancement, and rerouting.
library;

import 'dart:async';
import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

import '../../data/models/navigation_models.dart';
import '../../data/services/navigation_service.dart' show NavigationService;
import '../../data/services/navigation_service.dart' as nav_service;
import '../../data/services/voice_guidance_service.dart';
import '../../../../core/services/location_service.dart';
import '../providers/navigation_providers.dart';
import '../../../../features/map/presentation/providers/map_providers.dart';

/// Navigation controller state
@immutable
abstract class NavigationControllerState {
  const NavigationControllerState();
}

/// No active navigation
class NavigationIdle extends NavigationControllerState {
  const NavigationIdle();
}

/// Navigation is initializing (getting GPS, computing route)
class NavigationInitializing extends NavigationControllerState {
  final NavigationDestination destination;
  final LatLng? manualStart;

  const NavigationInitializing({
    required this.destination,
    this.manualStart,
  });
}

/// Route computed, ready to start
class NavigationReady extends NavigationControllerState {
  final NavigationRoute route;
  final LatLng startPosition;

  const NavigationReady({
    required this.route,
    required this.startPosition,
  });
}

/// Active navigation with GPS tracking
class NavigationActive extends NavigationControllerState {
  final NavigationSession session;
  final StreamSubscription<Position>? positionSubscription;

  const NavigationActive({
    required this.session,
    this.positionSubscription,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NavigationActive &&
          other.session == session &&
          other.positionSubscription == positionSubscription;

  @override
  int get hashCode => Object.hash(session, positionSubscription);
}

/// Navigation error state
class NavigationError extends NavigationControllerState {
  final String message;
  final String? code;

  const NavigationError({
    required this.message,
    this.code,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NavigationError &&
          other.message == message &&
          other.code == code;

  @override
  int get hashCode => Object.hash(message, code);
}

/// Navigation controller managing the full navigation lifecycle
class NavigationController extends StateNotifier<NavigationControllerState> {
  NavigationController({
    required NavigationService navigationService,
    required VoiceGuidanceService voiceGuidanceService,
    required LocationService locationService,
    required Ref ref,
  })  : _navigationService = navigationService,
        _voiceGuidanceService = voiceGuidanceService,
        _locationService = locationService,
        _ref = ref,
        super(const NavigationIdle());

  final NavigationService _navigationService;
  final VoiceGuidanceService _voiceGuidanceService;
  final LocationService _locationService;
  final Ref _ref;

  StreamSubscription<Position>? _positionSubscription;
  Timer? _rerouteDebounceTimer;
  static const double _rerouteThresholdMeters = 25.0; // Deviation threshold
  static const Duration _rerouteDebounce = Duration(seconds: 10); // Debounce time
  bool _isRerouting = false;

  /// Start navigation to a destination
  /// Uses GPS as start position unless manualStart is provided
  Future<void> startNavigation({
    required NavigationDestination destination,
    LatLng? manualStart,
  }) async {
    // Set initializing state
    state = NavigationInitializing(destination: destination, manualStart: manualStart);

    try {
      // Get start position: manual > GPS > null (will fail)
      LatLng? startPosition = manualStart;

      if (startPosition == null) {
        // Try to get current GPS position
        final positionResult = await _locationService.getCurrentPosition(
          accuracy: LocationAccuracy.high,
        );

        if (positionResult.isSuccess) {
          startPosition = LatLng(
            positionResult.value.latitude,
            positionResult.value.longitude,
          );
        }
      }

      if (startPosition == null) {
        state = const NavigationError(
          message: 'Unable to determine starting location. Please ensure GPS is enabled.',
          code: 'NO_START_POSITION',
        );
        return;
      }

      // Ensure graph is built
      if (!_navigationService.isGraphBuilt) {
        // Graph should be built via navigationGraphProvider, but ensure it's ready
        await Future.delayed(const Duration(milliseconds: 500));
      }

      // Compute route
      final result = _navigationService.computeRoute(
        start: startPosition,
        end: destination.coordinates,
        avoidEmergencyPaths: true,
        preferMainPaths: true,
      );

      if (result == null) {
        state = const NavigationError(
          message: 'No route found to destination. Try a different location.',
          code: 'NO_ROUTE_FOUND',
        );
        return;
      }

      // Convert to NavigationRoute model
      final route = _convertToNavigationRoute(result, startPosition, destination);

      // Ready to start - UI will show preview
      state = NavigationReady(route: route, startPosition: startPosition);
    } catch (e) {
      state = NavigationError(
        message: 'Failed to compute route: $e',
        code: 'ROUTE_COMPUTATION_ERROR',
      );
    }
  }

  /// Begin active navigation with GPS tracking
  Future<void> beginActiveNavigation(NavigationRoute route) async {
    // Initialize voice guidance
    await _voiceGuidanceService.initialize();
    _voiceGuidanceService.setEnabled(true);

    // Speak route summary
    await _voiceGuidanceService.speakRouteSummary(route);

    // Create initial session
    final session = NavigationSession(
      id: 'session_${DateTime.now().millisecondsSinceEpoch}',
      route: route,
      currentInstructionIndex: 0,
      currentPosition: route.start.coordinates,
      startedAt: DateTime.now(),
      isVoiceGuidanceEnabled: true,
      isRerouting: false,
    );

    // Speak first instruction
    if (route.instructions.isNotEmpty) {
      await _voiceGuidanceService.speakInstruction(route.instructions[0]);
    }

    // Start GPS tracking
    await _startGPSTracking(session);

    state = NavigationActive(session: session, positionSubscription: _positionSubscription);
  }

  /// Start GPS position tracking for active navigation
  Future<void> _startGPSTracking(NavigationSession session) async {
    // Cancel any existing subscription
    await _positionSubscription?.cancel();

    // Check permission
    final permissionResult = await _locationService.checkAndRequestPermission();
    if (permissionResult.isFailure) {
      // Continue without GPS - manual instruction advancement only
      return;
    }

    // Start position updates
    final startResult = await _locationService.startPositionUpdates(
      accuracy: LocationAccuracy.high,
      distanceFilter: 3, // 3 meters for more responsive tracking
    );

    if (startResult.isFailure) {
      return;
    }

    // Listen to position stream
    _positionSubscription = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 3,
      ),
    ).listen(
      (position) => _onPositionUpdate(position, session),
      onError: (error) {
        // GPS error - continue with manual navigation
        _positionSubscription?.cancel();
        _positionSubscription = null;
      },
    );
  }

  /// Handle GPS position update during active navigation
  void _onPositionUpdate(Position position, NavigationSession currentSession) {
    final newPosition = LatLng(position.latitude, position.longitude);

    // Check if we've reached the destination
    if (_hasArrivedAtDestination(newPosition, currentSession)) {
      _handleArrival(currentSession);
      return;
    }

    // Check if we should advance to next instruction
    if (_shouldAdvanceInstruction(newPosition, currentSession)) {
      _advanceInstruction(currentSession, newPosition);
      return;
    }

    // Check for route deviation (rerouting)
    _checkForDeviation(newPosition, currentSession);

    // Update current position in session
    _updateSessionPosition(currentSession, newPosition);
  }

  /// Check if user has arrived at destination
  bool _hasArrivedAtDestination(LatLng position, NavigationSession session) {
    final destination = session.route.end.coordinates;
    final distance = _distance(position, destination);
    // Arrival threshold: 20 meters
    return distance <= 20.0 && session.currentInstructionIndex >= session.route.instructions.length - 1;
  }

  /// Check if user has reached the next instruction waypoint
  bool _shouldAdvanceInstruction(LatLng position, NavigationSession session) {
    if (session.currentInstructionIndex >= session.route.instructions.length - 1) {
      return false; // Already at last instruction
    }

    final currentInstruction = session.route.instructions[session.currentInstructionIndex];
    final instructionPosition = currentInstruction.position;
    final distance = _distance(position, instructionPosition);

    // Advance when within 15 meters of instruction point
    return distance <= 15.0;
  }

  /// Advance to next instruction
  Future<void> _advanceInstruction(NavigationSession session, LatLng newPosition) async {
    final nextIndex = session.currentInstructionIndex + 1;

    if (nextIndex >= session.route.instructions.length) {
      // Should be caught by _hasArrivedAtDestination, but safety check
      await _handleArrival(session);
      return;
    }

    final updatedSession = session.copyWith(
      currentInstructionIndex: nextIndex,
      currentPosition: newPosition,
    );

    // Speak next instruction
    if (session.isVoiceGuidanceEnabled) {
      final nextInstruction = session.route.instructions[nextIndex];
      await _voiceGuidanceService.speakInstruction(nextInstruction);
    }

    // Update state
    if (state is NavigationActive) {
      state = NavigationActive(session: updatedSession, positionSubscription: _positionSubscription);
    }
  }

  /// Update session position without advancing instruction
  void _updateSessionPosition(NavigationSession session, LatLng newPosition) {
    final updatedSession = session.copyWith(currentPosition: newPosition);

    if (state is NavigationActive) {
      state = NavigationActive(session: updatedSession, positionSubscription: _positionSubscription);
    }
  }

  /// Check if user has deviated from route
  void _checkForDeviation(LatLng position, NavigationSession session) {
    if (_isRerouting) return;

    // Find distance from current position to route geometry
    final minDistanceToRoute = _distanceToRouteGeometry(position, session.route.geometry);

    if (minDistanceToRoute > _rerouteThresholdMeters) {
      // Potential deviation detected - debounce
      _rerouteDebounceTimer?.cancel();
      _rerouteDebounceTimer = Timer(_rerouteDebounce, () {
        _triggerReroute(position, session);
      });
    } else {
      // Back on route - cancel any pending reroute
      _rerouteDebounceTimer?.cancel();
    }
  }

  /// Trigger automatic rerouting
  Future<void> _triggerReroute(LatLng currentPosition, NavigationSession session) async {
    if (_isRerouting) return;

    _isRerouting = true;

    // Update session to show rerouting
    if (state is NavigationActive) {
      final reroutingSession = session.copyWith(isRerouting: true);
      state = NavigationActive(session: reroutingSession, positionSubscription: _positionSubscription);
    }

    try {
      // Recompute route from current position
      final result = _navigationService.computeRoute(
        start: currentPosition,
        end: session.route.end.coordinates,
        avoidEmergencyPaths: true,
        preferMainPaths: true,
      );

      if (result != null) {
        final newRoute = _convertToNavigationRoute(result, currentPosition, session.route.end);

        // Create updated session with new route
        final updatedSession = NavigationSession(
          id: session.id,
          route: newRoute,
          currentInstructionIndex: 0, // Reset to first instruction
          currentPosition: currentPosition,
          startedAt: session.startedAt,
          isVoiceGuidanceEnabled: session.isVoiceGuidanceEnabled,
          isRerouting: false,
        );

        // Speak reroute notification
        if (session.isVoiceGuidanceEnabled) {
          await _voiceGuidanceService.speak('Route updated. Recalculating.');
          await _voiceGuidanceService.speakRouteSummary(newRoute);
          if (newRoute.instructions.isNotEmpty) {
            await _voiceGuidanceService.speakInstruction(newRoute.instructions[0]);
          }
        }

        if (state is NavigationActive) {
          state = NavigationActive(session: updatedSession, positionSubscription: _positionSubscription);
        }
      }
    } catch (e) {
      // Reroute failed - keep original route
      if (state is NavigationActive) {
        final failedSession = session.copyWith(isRerouting: false);
        state = NavigationActive(session: failedSession, positionSubscription: _positionSubscription);
      }
    } finally {
      _isRerouting = false;
    }
  }

  /// Handle arrival at destination
  Future<void> _handleArrival(NavigationSession session) async {
    // Stop GPS tracking
    await _stopGPSTracking();

    // Speak arrival
    if (session.isVoiceGuidanceEnabled) {
      await _voiceGuidanceService.speakInstruction(
        session.route.instructions.last,
      );
    }

    // Create completed session
    final completedSession = session.copyWith(
      completedAt: DateTime.now(),
      currentInstructionIndex: session.route.instructions.length - 1,
    );

    // Update state to completed (still active but completed)
    if (state is NavigationActive) {
      state = NavigationActive(session: completedSession, positionSubscription: null);
    }

    // Notify UI
    _ref.read(navigationSessionProvider.notifier).state = completedSession;
  }

  /// Stop GPS tracking
  Future<void> _stopGPSTracking() async {
    _rerouteDebounceTimer?.cancel();
    _rerouteDebounceTimer = null;
    await _positionSubscription?.cancel();
    _positionSubscription = null;
    await _locationService.stopPositionUpdates();
  }

  /// End navigation manually
  Future<void> endNavigation() async {
    await _stopGPSTracking();
    _voiceGuidanceService.stop();
    state = const NavigationIdle();
    _ref.read(navigationSessionProvider.notifier).state = null;
  }

  /// Manually advance instruction (for testing or when GPS unavailable)
  void manuallyAdvanceInstruction() {
    if (state is NavigationActive) {
      final active = state as NavigationActive;
      _advanceInstruction(active.session, active.session.currentPosition);
    }
  }

  /// Manually go back instruction
  void manuallyPreviousInstruction() {
    if (state is NavigationActive) {
      final active = state as NavigationActive;
      if (active.session.currentInstructionIndex > 0) {
        final updatedSession = active.session.copyWith(
          currentInstructionIndex: active.session.currentInstructionIndex - 1,
        );
        state = NavigationActive(session: updatedSession, positionSubscription: _positionSubscription);
      }
    }
  }

  /// Toggle voice guidance
  Future<void> setVoiceGuidanceEnabled(bool enabled) async {
    _voiceGuidanceService.setEnabled(enabled);

    if (state is NavigationActive) {
      final active = state as NavigationActive;
      final updatedSession = active.session.copyWith(isVoiceGuidanceEnabled: enabled);
      state = NavigationActive(session: updatedSession, positionSubscription: _positionSubscription);
    }
  }

  /// Convert NavigationResult to NavigationRoute model
  NavigationRoute _convertToNavigationRoute(
    nav_service.NavigationResult result,
    LatLng startPosition,
    NavigationDestination destination,
  ) {
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
        coordinates: startPosition,
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
  }

  /// Calculate distance from point to route geometry
  double _distanceToRouteGeometry(LatLng point, List<LatLng> geometry) {
    if (geometry.length < 2) return double.infinity;

    double minDist = double.infinity;
    for (int i = 0; i < geometry.length - 1; i++) {
      final dist = _distanceToLineSegment(point, geometry[i], geometry[i + 1]);
      if (dist < minDist) minDist = dist;
    }
    return minDist;
  }

  /// Distance from point to line segment
  double _distanceToLineSegment(LatLng point, LatLng lineStart, LatLng lineEnd) {
    // Convert to local flat coordinates for simplicity (small distances)
    final double x = point.latitude;
    final double y = point.longitude;
    final double x1 = lineStart.latitude;
    final double y1 = lineStart.longitude;
    final double x2 = lineEnd.latitude;
    final double y2 = lineEnd.longitude;

    final double A = x - x1;
    final double B = y - y1;
    final double C = x2 - x1;
    final double D = y2 - y1;

    final double dot = A * C + B * D;
    final double lenSq = C * C + D * D;
    double param = -1;

    if (lenSq != 0) param = dot / lenSq;

    double xx, yy;

    if (param < 0) {
      xx = x1;
      yy = y1;
    } else if (param > 1) {
      xx = x2;
      yy = y2;
    } else {
      xx = x1 + param * C;
      yy = y1 + param * D;
    }

    return _distance(LatLng(x, y), LatLng(xx, yy));
  }

  /// Haversine distance between two points
  double _distance(LatLng p1, LatLng p2) {
    const double earthRadius = 6371000.0;
    final dLat = _toRadians(p2.latitude - p1.latitude);
    final dLon = _toRadians(p2.longitude - p1.longitude);
    final lat1 = _toRadians(p1.latitude);
    final lat2 = _toRadians(p2.latitude);

    final double sinDLat = math.sin(dLat / 2);
    final double sinDLon = math.sin(dLon / 2);
    final double a = sinDLat * sinDLat + sinDLon * sinDLon * math.cos(lat1) * math.cos(lat2);
    final double c = 2 * math.asin(math.sqrt(a));
    return earthRadius * c;
  }

  double _toRadians(double degrees) => degrees * math.pi / 180.0;

  @override
  void dispose() {
    _stopGPSTracking();
    _voiceGuidanceService.dispose();
    super.dispose();
  }
}

/// Provider for NavigationController
final navigationControllerProvider = StateNotifierProvider<NavigationController, NavigationControllerState>((ref) {
  return NavigationController(
    navigationService: ref.watch(navigationServiceProvider),
    voiceGuidanceService: ref.watch(voiceGuidanceServiceProvider),
    locationService: ref.watch(locationServiceProvider),
    ref: ref,
  );
});

/// Provider to watch the current navigation state for UI
final navigationStateProvider = Provider<NavigationControllerState>((ref) {
  return ref.watch(navigationControllerProvider);
});