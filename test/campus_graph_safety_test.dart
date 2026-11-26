import 'package:flutter_test/flutter_test.dart';

import 'package:safenav_cavite/src/features/map/data/models/campus_graph.dart';
import 'package:safenav_cavite/src/features/map/data/services/campus_graph_router.dart';
import 'package:safenav_cavite/src/features/map/data/services/campus_graph_service.dart';

GraphNode _routableNode(GraphNode n) => n.copyWith(
  lat: 14.375,
  lng: 120.887,
  surveyId: 'S-1',
  surveyor: 'surveyor',
  surveyedAt: DateTime(2026, 11, 25),
  status: GraphStatus.confirmed,
  routable: true,
);

GraphEdge _confirmedEdge(GraphEdge e) => e.copyWith(status: GraphStatus.confirmed);

/// Returns a copy of [g] where the nodes with [ids] are surveyed, confirmed
/// and routable.
CampusGraph _withRoutableNodes(CampusGraph g, Iterable<String> ids) {
  final nodes = <String, GraphNode>{}..addAll(g.nodes);
  for (final id in ids) {
    final n = g.node(id)!;
    nodes[id] = _routableNode(n);
  }
  return CampusGraph(
    nodes: nodes,
    edges: g.edges,
    sourceImage: g.sourceImage,
    coordinateType: g.coordinateType,
  );
}

/// Returns a copy of [g] where [edges] are marked confirmed.
CampusGraph _withConfirmedEdges(CampusGraph g, Iterable<GraphEdge> edges) {
  final ids = edges.map((e) => e.id).toSet();
  final updated = g.edges.map((e) => ids.contains(e.id) ? _confirmedEdge(e) : e).toList();
  return CampusGraph(
    nodes: g.nodes,
    edges: updated,
    sourceImage: g.sourceImage,
    coordinateType: g.coordinateType,
  );
}

Future<CampusGraph> _loadDraft() async => CampusGraphService.instance.load();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('(a) pixel coordinates never become GPS', () async {
    final graph = await _loadDraft();
    // The draft is stored in image-pixel space, not GPS.
    expect(graph.coordinateType, 'image_px');
    expect(graph.sourceImage, isNotEmpty);
    // No node carries surveyed GPS coordinates.
    expect(
      graph.nodes.values.every((n) => n.lat == null && n.lng == null),
      isTrue,
      reason: 'lat/lng must stay null until a surveyed record is set',
    );
    // Nodes carry image-pixel coordinates instead.
    expect(
      graph.nodes.values.every((n) => n.xPx != 0 && n.yPx != 0),
      isTrue,
    );
  });

  test('(b) an unsurveyed room cannot be a route start or end', () async {
    final graph = await _loadDraft();
    final router = CampusGraphRouter(graph);
    final id = graph.nodes.keys.first;
    // An unsurveyed / unconfirmed endpoint is rejected with a typed error;
    // the router never guesses or snaps to a nearby node.
    expect(
      () => router.computeRoute(startId: id, endId: id),
      throwsA(isA<UnroutableEndpointError>()),
    );
  });

  test('(c) an assumed edge never appears in a route', () async {
    final graph = await _loadDraft();
    GraphEdge? assumed;
    for (final edge in graph.edges) {
      if (edge.status == GraphStatus.assumed) {
        assumed = edge;
        break;
      }
    }
    if (assumed == null) return; // vacuous if the fixture has no assumed edge
    // Mark the endpoints routable but leave the edge assumed (not confirmed).
    final g2 = _withRoutableNodes(graph, [assumed.a, assumed.b]);
    final router = CampusGraphRouter(g2);
    expect(
      router.computeRoute(startId: assumed.a, endId: assumed.b),
      isNull,
      reason: 'an assumed (unconfirmed) edge never enters the route graph',
    );
  });

  test('(d) with the draft fixture no route exists until edges are confirmed',
      () async {
    final graph = await _loadDraft();
    final router = CampusGraphRouter(graph);
    final ids = graph.nodes.keys.toList();
    expect(ids.isNotEmpty, isTrue);
    // Endpoints aren't surveyed/confirmed, so the router rejects them.
    expect(
      () => router.computeRoute(startId: ids.first, endId: ids.last),
      throwsA(isA<UnroutableEndpointError>()),
    );
    // hasRoute returns false (no route) rather than throwing.
    expect(router.hasRoute(startId: ids.first, endId: ids.last), isFalse);
  });

  test('(e) marking a stair chain confirmed enables a cross-floor route',
      () async {
    final graph = await _loadDraft();
    final stairs = graph.edges.where((e) => e.isStair).toList();
    // Find a two-edge stair chain: e1.b == e2.a (change of floor via stairs).
    GraphEdge? e1;
    GraphEdge? e2;
    outer:
    for (final a in stairs) {
      for (final b in stairs) {
        if (a.b == b.a) {
          e1 = a;
          e2 = b;
          break outer;
        }
      }
    }
    if (e1 == null || e2 == null) return; // vacuous if no stair chain
    final nodes = [e1.a, e1.b, e2.b];
    final g2 = _withConfirmedEdges(_withRoutableNodes(graph, nodes), [e1, e2]);
    final router = CampusGraphRouter(g2);
    final route = router.computeRoute(startId: e1.a, endId: e2.b);
    expect(route, isNotNull);
    expect(route!.first, e1.a);
    expect(route.last, e2.b);
  });

  test('(f) avoid-stairs with no step-free edge returns no route', () async {
    final graph = await _loadDraft();
    final stairs = graph.edges.where((e) => e.isStair).toList();
    if (stairs.isEmpty) return;
    final stair = stairs.first;
    // Only this stair edge is confirmed; the endpoints are surveyed/routable.
    final g2 = _withConfirmedEdges(
      _withRoutableNodes(graph, [stair.a, stair.b]),
      [stair],
    );
    final router = CampusGraphRouter(g2);
    // Stairs allowed -> a route exists.
    expect(
      router.computeRoute(
        startId: stair.a,
        endId: stair.b,
        avoidStairs: false,
      ),
      isNotNull,
    );
    // Stairs avoided and no step-free edge -> no accessible route.
    expect(
      router.computeRoute(
        startId: stair.a,
        endId: stair.b,
        avoidStairs: true,
      ),
      isNull,
    );
  });
}
