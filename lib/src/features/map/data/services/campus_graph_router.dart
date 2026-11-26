/// SAFENAV CAVITE - Campus safety graph router.
///
/// A safety-first router over [CampusGraph]. Only edges with [GraphStatus]
/// confirmed may be traversed, and route endpoints must have surveyed
/// coordinates plus confirmed status. The router never guesses or snaps to a
/// nearby node.
library;

import '../models/campus_graph.dart';

/// Thrown when a route endpoint is not safe to route to or from.
class UnroutableEndpointError implements Exception {
  final String nodeId;
  final String reason;
  UnroutableEndpointError(this.nodeId, this.reason);

  @override
  String toString() => 'UnroutableEndpointError: node \'$nodeId\' is not routable ($reason)';
}

/// Thrown when no route exists under the given constraints.
class NoAccessibleRouteError implements Exception {
  final String reason;
  NoAccessibleRouteError(this.reason);

  @override
  String toString() => 'NoAccessibleRouteError: $reason';
}

/// Safety-first router for the campus graph.
class CampusGraphRouter {
  /// Creates a router over [graph].
  CampusGraphRouter(this.graph);

  final CampusGraph graph;

  /// Returns the ordered list of node ids from [startId] to [endId], or null
  /// when no route exists under the constraints.
  ///
  /// Throws [UnroutableEndpointError] when [startId] or [endId] is missing,
  /// lacks surveyed coordinates, or is not confirmed/routable.
  /// Never guesses or snaps to a nearby node.
  List<String>? computeRoute({
    required String startId,
    required String endId,
    bool avoidStairs = false,
  }) {
    final start = graph.node(startId);
    if (start == null) {
      throw UnroutableEndpointError(startId, 'start node not found in graph');
    }
    final end = graph.node(endId);
    if (end == null) {
      throw UnroutableEndpointError(endId, 'end node not found in graph');
    }
    if (!start.isRoutable) {
      throw UnroutableEndpointError(
        startId,
        'start node has no surveyed coordinates or is not confirmed/routable',
      );
    }
    if (!end.isRoutable) {
      throw UnroutableEndpointError(
        endId,
        'end node has no surveyed coordinates or is not confirmed/routable',
      );
    }

    // Build adjacency from confirmed edges only. Excluded edges (assumed,
    // inferred, unreviewed) never enter the route graph.
    final adjacency = <String, List<GraphEdge>>{};
    for (final edge in graph.edges) {
      if (edge.status != GraphStatus.confirmed) continue;
      if (avoidStairs && edge.isStair) continue;
      adjacency.putIfAbsent(edge.a, () => <GraphEdge>[]).add(edge);
      adjacency.putIfAbsent(edge.b, () => <GraphEdge>[]).add(edge);
    }

    // Breadth-first search for connectivity. Safety (surveyed + confirmed)
    // takes precedence over distance; cost is metadata only.
    final queue = <String>[startId];
    final visited = <String>{startId};
    final previous = <String, String?>{startId: null};

    while (queue.isNotEmpty) {
      final current = queue.removeAt(0);
      if (current == endId) break;
      for (final edge in adjacency[current] ?? const <GraphEdge>[]) {
        final other = edge.a == current ? edge.b : edge.a;
        if (!visited.contains(other)) {
          visited.add(other);
          previous[other] = current;
          queue.add(other);
        }
      }
    }

    if (!visited.contains(endId)) {
      return null;
    }

    final path = <String>[];
    String? cursor = endId;
    while (cursor != null) {
      path.add(cursor);
      cursor = previous[cursor];
    }
    return path.reversed.toList();
  }

  /// Whether a route exists between [startId] and [endId] under the
  /// constraints, without materializing the path.
  ///
  /// Returns false when either endpoint is not routable, rather than throwing.
  bool hasRoute({
    required String startId,
    required String endId,
    bool avoidStairs = false,
  }) {
    try {
      return computeRoute(
        startId: startId,
        endId: endId,
        avoidStairs: avoidStairs,
      ) !=
          null;
    } on UnroutableEndpointError {
      return false;
    }
  }
}
