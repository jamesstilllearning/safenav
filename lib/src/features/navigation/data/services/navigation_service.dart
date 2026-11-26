/// SAFENAV CAVITE - Navigation Service
///
/// Provides routing and navigation capabilities using campus pathways as a graph.
/// Implements Dijkstra's algorithm for shortest path computation.
library;

import 'dart:math';

import 'package:latlong2/latlong.dart';

import '../../../map/data/models/campus_pathway.dart';
import '../../../map/data/models/campus_building.dart';

/// A node in the navigation graph (intersection or point of interest)
class NavNode {
  final String id;
  final LatLng position;
  final List<NavEdge> edges;
  final String? name;
  final String? buildingId;

  NavNode({
    required this.id,
    required this.position,
    required this.edges,
    this.name,
    this.buildingId,
  });
}

/// An edge in the navigation graph (pathway segment)
class NavEdge {
  final String targetNodeId;
  final double distance;
  final String pathwayId;
  final PathwayCategory category;
  final List<LatLng> geometry; // Full geometry for route display

  NavEdge({
    required this.targetNodeId,
    required this.distance,
    required this.pathwayId,
    required this.category,
    required this.geometry,
  });
}

/// Result of a navigation query
class NavigationResult {
  final List<NavNode> path;
  final double totalDistance;
  final Duration estimatedDuration;
  final List<NavigationInstruction> instructions;
  final List<LatLng> routeGeometry;

  NavigationResult({
    required this.path,
    required this.totalDistance,
    required this.estimatedDuration,
    required this.instructions,
    required this.routeGeometry,
  });

  bool get hasRoute => path.isNotEmpty;
}

/// Turn-by-turn navigation instruction
class NavigationInstruction {
  final String instruction;
  final LatLng position;
  final double distanceToNext;
  final InstructionType type;
  final String? roadName;

  NavigationInstruction({
    required this.instruction,
    required this.position,
    required this.distanceToNext,
    required this.type,
    this.roadName,
  });
}

enum InstructionType {
  start,
  continueStraight,
  turnLeft,
  turnRight,
  turnSlightLeft,
  turnSlightRight,
  uturn,
  arrive,
  enterBuilding,
  exitBuilding,
  // Indoor navigation instruction types
  enterFloor,
  exitFloor,
  useElevator,
  useStairs,
}

/// Navigation service for computing routes on campus
class NavigationService {
  NavigationService._();

  static final NavigationService _instance = NavigationService._();
  static NavigationService get instance => _instance;

  final Map<String, NavNode> _nodes = {};
  bool _graphBuilt = false;

  /// Build the navigation graph from campus pathways
  void buildGraph(List<CampusPathway> pathways, List<CampusBuilding> buildings) {
    if (_graphBuilt) return;

    _nodes.clear();

    // Create nodes from pathway endpoints and intersections
    final Map<String, NavNode> nodeMap = {};
    final Map<String, List<LatLng>> pathwayGeometries = {};

    // First pass: collect all unique points from pathways
    final Map<String, LatLng> pointIdToLatLng = {};

    for (final pathway in pathways) {
      if (pathway.coordinates.length < 2) continue;

      pathwayGeometries[pathway.id] = pathway.coordinates;

      // Create nodes for each coordinate point
      for (int i = 0; i < pathway.coordinates.length; i++) {
        final point = pathway.coordinates[i];
        final pointId = '${pathway.id}_$i';

        // Check if this point is close to an existing node (intersection)
        String? existingNodeId;
        for (final entry in pointIdToLatLng.entries) {
          if (_distance(point, entry.value) < 5.0) { // 5 meter threshold
            existingNodeId = entry.key;
            break;
          }
        }

        if (existingNodeId != null) {
          // Reuse existing node
        } else {
          pointIdToLatLng[pointId] = point;
        }
      }
    }

    // Create NavNodes from collected points
    for (final entry in pointIdToLatLng.entries) {
      final node = NavNode(
        id: entry.key,
        position: entry.value,
        edges: [],
      );
      nodeMap[entry.key] = node;
      _nodes[entry.key] = node;
    }

    // Second pass: create edges between consecutive points in each pathway
    for (final pathway in pathways) {
      if (pathway.coordinates.length < 2) continue;

      for (int i = 0; i < pathway.coordinates.length - 1; i++) {
        final p1 = pathway.coordinates[i];
        final p2 = pathway.coordinates[i + 1];

        // Find node IDs for these points
        String? nodeId1, nodeId2;
        for (final entry in pointIdToLatLng.entries) {
          if (_distance(p1, entry.value) < 5.0) nodeId1 = entry.key;
          if (_distance(p2, entry.value) < 5.0) nodeId2 = entry.key;
        }

        if (nodeId1 != null && nodeId2 != null && nodeId1 != nodeId2) {
          final distance = _distance(p1, p2);

          // Add bidirectional edges
          _nodes[nodeId1]!.edges.add(NavEdge(
            targetNodeId: nodeId2,
            distance: distance,
            pathwayId: pathway.id,
            category: pathway.category,
            geometry: [p1, p2],
          ));

          _nodes[nodeId2]!.edges.add(NavEdge(
            targetNodeId: nodeId1,
            distance: distance,
            pathwayId: pathway.id,
            category: pathway.category,
            geometry: [p2, p1],
          ));
        }
      }
    }

    // Add building entrance nodes
    for (final building in buildings) {
      // Find nearest pathway node to building centroid
      String? nearestNodeId;
      double minDist = double.infinity;

      for (final node in _nodes.values) {
        final dist = _distance(building.centroid, node.position);
        if (dist < minDist) {
          minDist = dist;
          nearestNodeId = node.id;
        }
      }

      if (nearestNodeId != null && minDist < 50.0) { // Within 50 meters
        // Add building as a special node connected to nearest pathway node
        final buildingNodeId = 'building_${building.id}';
        _nodes[buildingNodeId] = NavNode(
          id: buildingNodeId,
          position: building.centroid,
          edges: [
            NavEdge(
              targetNodeId: nearestNodeId,
              distance: minDist,
              pathwayId: 'building_access_${building.id}',
              category: PathwayCategory.connector(),
              geometry: [building.centroid, _nodes[nearestNodeId]!.position],
            ),
          ],
          name: building.name,
          buildingId: building.id,
        );

        // Add reverse edge
        _nodes[nearestNodeId]!.edges.add(NavEdge(
          targetNodeId: buildingNodeId,
          distance: minDist,
          pathwayId: 'building_access_${building.id}',
          category: PathwayCategory.connector(),
          geometry: [_nodes[nearestNodeId]!.position, building.centroid],
        ));
      }
    }

    _graphBuilt = true;
  }

  /// Find the nearest node to a given position
  String? findNearestNode(LatLng position, {double maxDistance = 100.0}) {
    String? nearestId;
    double minDist = maxDistance;

    for (final node in _nodes.values) {
      final dist = _distance(position, node.position);
      if (dist < minDist) {
        minDist = dist;
        nearestId = node.id;
      }
    }

    return nearestId;
  }

  /// Find nearest node that is not a building node
  String? findNearestPathwayNode(LatLng position, {double maxDistance = 100.0}) {
    String? nearestId;
    double minDist = maxDistance;

    for (final node in _nodes.values) {
      if (node.buildingId != null) continue; // Skip building nodes
      final dist = _distance(position, node.position);
      if (dist < minDist) {
        minDist = dist;
        nearestId = node.id;
      }
    }

    return nearestId;
  }

  /// Compute shortest path using Dijkstra's algorithm
  NavigationResult? computeRoute({
    required LatLng start,
    required LatLng end,
    bool avoidEmergencyPaths = false,
    bool preferMainPaths = true,
  }) {
    if (!_graphBuilt) return null;

    final startNodeId = findNearestPathwayNode(start);
    final endNodeId = findNearestNode(end);

    if (startNodeId == null || endNodeId == null) return null;

    // Dijkstra's algorithm
    final distances = <String, double>{};
    final previous = <String, String?>{};
    final visited = <String>{};
    final queue = <String>[];

    // Initialize
    for (final nodeId in _nodes.keys) {
      distances[nodeId] = double.infinity;
      previous[nodeId] = null;
    }
    distances[startNodeId] = 0;
    queue.add(startNodeId);

    while (queue.isNotEmpty) {
      // Find unvisited node with minimum distance
      queue.sort((a, b) => distances[a]!.compareTo(distances[b]!));
      final currentId = queue.removeAt(0);

      if (visited.contains(currentId)) continue;
      visited.add(currentId);

      if (currentId == endNodeId) break;

      final currentNode = _nodes[currentId]!;
      for (final edge in currentNode.edges) {
        if (avoidEmergencyPaths && edge.category == PathwayCategory.emergency()) continue;

        double weight = edge.distance;
        if (preferMainPaths && edge.category == PathwayCategory.mainPath()) {
          weight *= 0.8; // Slight preference for main paths
        }

        final newDist = distances[currentId]! + weight;
        if (newDist < distances[edge.targetNodeId]!) {
          distances[edge.targetNodeId] = newDist;
          previous[edge.targetNodeId] = currentId;
          if (!visited.contains(edge.targetNodeId) && !queue.contains(edge.targetNodeId)) {
            queue.add(edge.targetNodeId);
          }
        }
      }
    }

    // Reconstruct path
    if (distances[endNodeId] == double.infinity) return null;

    final pathNodeIds = <String>[];
    String? current = endNodeId;
    while (current != null) {
      pathNodeIds.insert(0, current);
      current = previous[current];
    }

    // Convert to NavNodes
    final pathNodes = pathNodeIds.map((id) => _nodes[id]!).toList();

    // Build route geometry
    final routeGeometry = <LatLng>[];
    for (int i = 0; i < pathNodes.length - 1; i++) {
      final currentNode = pathNodes[i];
      final nextNode = pathNodes[i + 1];

      // Find the edge between these nodes
      final edge = currentNode.edges.firstWhere(
        (e) => e.targetNodeId == nextNode.id,
        orElse: () => NavEdge(
          targetNodeId: nextNode.id,
          distance: _distance(currentNode.position, nextNode.position),
          pathwayId: 'direct',
          category: PathwayCategory.connector(),
          geometry: [currentNode.position, nextNode.position],
        ),
      );
      if (i == 0) {
        routeGeometry.addAll(edge.geometry);
      } else {
        // Skip first point to avoid duplicates
        routeGeometry.addAll(edge.geometry.skip(1));
      }
    }

    // Add start and end positions if not already included
    if (routeGeometry.isEmpty || _distance(routeGeometry.first, start) > 1.0) {
      routeGeometry.insert(0, start);
    }
    if (_distance(routeGeometry.last, end) > 1.0) {
      routeGeometry.add(end);
    }

    // Generate turn-by-turn instructions
    final instructions = _generateInstructions(pathNodes, routeGeometry, start, end);

    // Estimate duration (walking speed ~1.4 m/s = 5 km/h)
    const walkingSpeed = 1.4; // m/s
    final duration = Duration(seconds: (distances[endNodeId]! / walkingSpeed).round());

    return NavigationResult(
      path: pathNodes,
      totalDistance: distances[endNodeId]!,
      estimatedDuration: duration,
      instructions: instructions,
      routeGeometry: routeGeometry,
    );
  }

  /// Generate turn-by-turn instructions from path
  List<NavigationInstruction> _generateInstructions(
    List<NavNode> path,
    List<LatLng> routeGeometry,
    LatLng start,
    LatLng end,
  ) {
    final instructions = <NavigationInstruction>[];

    if (path.length < 2) {
      instructions.add(NavigationInstruction(
        instruction: 'You have arrived at your destination',
        position: end,
        distanceToNext: 0,
        type: InstructionType.arrive,
      ));
      return instructions;
    }

    // Start instruction
    instructions.add(NavigationInstruction(
      instruction: 'Start walking',
      position: start,
      distanceToNext: _distance(start, path[1].position),
      type: InstructionType.start,
    ));

    // Intermediate turns
    for (int i = 1; i < path.length - 1; i++) {
      final prev = path[i - 1].position;
      final current = path[i].position;
      final next = path[i + 1].position;

      final bearing1 = _bearing(prev, current);
      final bearing2 = _bearing(current, next);
      final turnAngle = _normalizeAngle(bearing2 - bearing1);

      InstructionType type;
      String instruction;

      if (turnAngle.abs() < 20) {
        type = InstructionType.continueStraight;
        instruction = 'Continue straight';
      } else if (turnAngle > 0 && turnAngle < 60) {
        type = InstructionType.turnSlightRight;
        instruction = 'Turn slight right';
      } else if (turnAngle >= 60 && turnAngle < 120) {
        type = InstructionType.turnRight;
        instruction = 'Turn right';
      } else if (turnAngle >= 120 && turnAngle < 180) {
        type = InstructionType.uturn;
        instruction = 'Make a U-turn';
      } else if (turnAngle < 0 && turnAngle > -60) {
        type = InstructionType.turnSlightLeft;
        instruction = 'Turn slight left';
      } else if (turnAngle <= -60 && turnAngle > -120) {
        type = InstructionType.turnLeft;
        instruction = 'Turn left';
      } else {
        type = InstructionType.uturn;
        instruction = 'Make a U-turn';
      }

      final distToNext = _distance(current, next);
      instructions.add(NavigationInstruction(
        instruction: instruction,
        position: current,
        distanceToNext: distToNext,
        type: type,
      ));
    }

    // Arrival instruction
    instructions.add(NavigationInstruction(
      instruction: 'You have arrived at your destination',
      position: end,
      distanceToNext: 0,
      type: InstructionType.arrive,
    ));

    return instructions;
  }

  /// Haversine distance between two points in meters
  double _distance(LatLng p1, LatLng p2) {
    const double earthRadius = 6371000.0;
    final dLat = _toRadians(p2.latitude - p1.latitude);
    final dLon = _toRadians(p2.longitude - p1.longitude);
    final lat1 = _toRadians(p1.latitude);
    final lat2 = _toRadians(p2.latitude);

    final sinDLat = dLat / 2;
    final sinDLon = dLon / 2;
    final a = sinDLat * sinDLat + sinDLon * sinDLon * cos(lat1) * cos(lat2);
    final c = 2 * asin(sqrt(a));
    return earthRadius * c;
  }

  /// Bearing from p1 to p2 in degrees
  double _bearing(LatLng p1, LatLng p2) {
    final dLon = _toRadians(p2.longitude - p1.longitude);
    final lat1 = _toRadians(p1.latitude);
    final lat2 = _toRadians(p2.latitude);

    final y = sin(dLon) * cos(lat2);
    final x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon);
    final bearing = atan2(x, y) * 180 / pi;
    return (bearing + 360) % 360;
  }

  double _toRadians(double degrees) => degrees * pi / 180.0;

  double _normalizeAngle(double angle) {
    while (angle > 180) {
      angle -= 360;
    }
    while (angle < -180) {
      angle += 360;
    }
    return angle;
  }

  /// Get all nodes (for debugging)
  Map<String, NavNode> get nodes => Map.unmodifiable(_nodes);

  /// Check if graph is built
  bool get isGraphBuilt => _graphBuilt;

  /// Clear and rebuild graph
  void clearGraph() {
    _nodes.clear();
    _graphBuilt = false;
  }
}