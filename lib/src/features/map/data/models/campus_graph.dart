/// SAFENAV CAVITE - Campus safety graph models.
///
/// A campus graph is built from the draft floor-plan JSON. Nodes live in
/// image-pixel space (x_px/y_px); latitude/longitude are nullable and are
/// only populated from a surveyed record, never derived from pixels.
library;

/// Verification status of a graph node or edge.
enum GraphStatus {
  unreviewed,
  assumed,
  inferred,
  confirmed,
}

/// A node in the campus safety graph.
class GraphNode {
  const GraphNode({
    required this.id,
    required this.label,
    required this.floor,
    required this.type,
    required this.xPx,
    required this.yPx,
    this.lat,
    this.lng,
    this.surveyId,
    this.surveyor,
    this.surveyedAt,
    this.status = GraphStatus.unreviewed,
    this.routable = false,
  });

  final String id;
  final String label;
  final int floor;
  final String type;
  final int xPx;
  final int yPx;

  /// Surveyed latitude, nullable and only set from a surveyed record.
  final double? lat;

  /// Surveyed longitude, nullable and only set from a surveyed record.
  final double? lng;

  final String? surveyId;
  final String? surveyor;
  final DateTime? surveyedAt;
  final GraphStatus status;
  final bool routable;

  /// True only when the node has surveyed GPS coordinates.
  bool get hasSurveyedCoords => lat != null && lng != null;

  /// True when the node may be used as a route endpoint: surveyed coordinates
  /// plus confirmed status plus the routable flag.
  bool get isRoutable => hasSurveyedCoords && status == GraphStatus.confirmed && routable;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'label': label,
      'floor': floor,
      'type': type,
      'x_px': xPx,
      'y_px': yPx,
      'lat': lat,
      'lng': lng,
      'survey_id': surveyId,
      'surveyor': surveyor,
      'surveyed_at': surveyedAt?.toIso8601String(),
      'status': status.name,
      'routable': routable,
    };
  }

  factory GraphNode.fromJson(Map<String, dynamic> json) {
    return GraphNode(
      id: json['id'] as String,
      label: json['label'] as String? ?? '',
      floor: (json['floor'] as num? ?? 0).toInt(),
      type: json['type'] as String? ?? '',
      xPx: (json['x_px'] as num? ?? 0).toInt(),
      yPx: (json['y_px'] as num? ?? 0).toInt(),
      lat: _asDouble(json['lat']),
      lng: _asDouble(json['lng']),
      surveyId: json['survey_id'] as String?,
      surveyor: json['surveyor'] as String?,
      surveyedAt: json['surveyed_at'] == null
          ? null
          : DateTime.parse(json['surveyed_at'] as String),
      status: _parseStatus(json['status']),
      routable: json['routable'] as bool? ?? false,
    );
  }

  GraphNode copyWith({
    String? id,
    String? label,
    int? floor,
    String? type,
    int? xPx,
    int? yPx,
    double? lat,
    double? lng,
    String? surveyId,
    String? surveyor,
    DateTime? surveyedAt,
    GraphStatus? status,
    bool? routable,
  }) {
    return GraphNode(
      id: id ?? this.id,
      label: label ?? this.label,
      floor: floor ?? this.floor,
      type: type ?? this.type,
      xPx: xPx ?? this.xPx,
      yPx: yPx ?? this.yPx,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      surveyId: surveyId ?? this.surveyId,
      surveyor: surveyor ?? this.surveyor,
      surveyedAt: surveyedAt ?? this.surveyedAt,
      status: status ?? this.status,
      routable: routable ?? this.routable,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GraphNode &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          label == other.label &&
          floor == other.floor &&
          type == other.type &&
          xPx == other.xPx &&
          yPx == other.yPx &&
          lat == other.lat &&
          lng == other.lng &&
          surveyId == other.surveyId &&
          surveyor == other.surveyor &&
          surveyedAt == other.surveyedAt &&
          status == other.status &&
          routable == other.routable;

  @override
  int get hashCode =>
      id.hashCode ^
      label.hashCode ^
      floor.hashCode ^
      type.hashCode ^
      xPx.hashCode ^
      yPx.hashCode ^
      lat.hashCode ^
      lng.hashCode ^
      surveyId.hashCode ^
      surveyor.hashCode ^
      surveyedAt.hashCode ^
      status.hashCode ^
      routable.hashCode;

  @override
  String toString() => 'GraphNode(id: $id, label: $label, status: $status, lat: $lat, lng: $lng)';
}

/// An edge in the campus safety graph.
class GraphEdge {
  const GraphEdge({
    required this.id,
    required this.a,
    required this.b,
    required this.kind,
    required this.cost,
    this.status = GraphStatus.unreviewed,
  });

  final String id;
  final String a; // from node id
  final String b; // to node id
  final String kind; // walk, st (stair), as (assumed access), etc.
  final double cost;
  final GraphStatus status;

  /// True when this is a stair connection between floors.
  bool get isStair => kind == 'st';

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'a': a,
      'b': b,
      'kind': kind,
      'cost': cost,
      'status': status.name,
    };
  }

  factory GraphEdge.fromJson(Map<String, dynamic> json) {
    return GraphEdge(
      id: json['id'] as String? ?? '${json['a']}-${json['b']}',
      a: json['a'] as String,
      b: json['b'] as String,
      kind: json['kind'] as String? ?? 'walk',
      cost: _asDouble(json['cost']) ?? 0.0,
      status: _parseStatus(json['status']),
    );
  }

  GraphEdge copyWith({
    String? id,
    String? a,
    String? b,
    String? kind,
    double? cost,
    GraphStatus? status,
  }) {
    return GraphEdge(
      id: id ?? this.id,
      a: a ?? this.a,
      b: b ?? this.b,
      kind: kind ?? this.kind,
      cost: cost ?? this.cost,
      status: status ?? this.status,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GraphEdge &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          a == other.a &&
          b == other.b &&
          kind == other.kind &&
          cost == other.cost &&
          status == other.status;

  @override
  int get hashCode =>
      id.hashCode ^
      a.hashCode ^
      b.hashCode ^
      kind.hashCode ^
      cost.hashCode ^
      status.hashCode;

  @override
  String toString() => 'GraphEdge(id: $id, $a-$b, kind: $kind, status: $status)';
}

/// The campus safety graph loaded from the draft floor-plan JSON.
class CampusGraph {
  const CampusGraph({
    required this.nodes,
    required this.edges,
    required this.sourceImage,
    this.coordinateType = 'image_px',
  });

  final Map<String, GraphNode> nodes;
  final List<GraphEdge> edges;
  final String sourceImage;
  final String coordinateType;

  GraphNode? node(String id) => nodes[id];

  factory CampusGraph.fromJson(Map<String, dynamic> json) {
    final nodesList = (json['nodes'] as List<dynamic>? ?? const [])
        .whereType<Map<String, dynamic>>()
        .map((e) => GraphNode.fromJson(e))
        .toList();
    final nodesMap = <String, GraphNode>{};
    for (final node in nodesList) {
      nodesMap[node.id] = node;
    }
    final edgesList = (json['edges'] as List<dynamic>? ?? const [])
        .whereType<Map<String, dynamic>>()
        .map((e) => GraphEdge.fromJson(e))
        .toList();
    return CampusGraph(
      nodes: nodesMap,
      edges: edgesList,
      sourceImage: json['source_image'] as String? ?? '',
      coordinateType: json['coordinate_type'] as String? ?? 'image_px',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nodes': nodes.values.map((n) => n.toJson()).toList(),
      'edges': edges.map((e) => e.toJson()).toList(),
      'source_image': sourceImage,
      'coordinate_type': coordinateType,
    };
  }

  @override
  String toString() => 'CampusGraph(nodes: ${nodes.length}, edges: ${edges.length})';
}

double? _asDouble(dynamic value) {
  if (value == null) return null;
  if (value is num) return value.toDouble();
  return double.tryParse(value.toString());
}

GraphStatus _parseStatus(dynamic value) {
  if (value == null) return GraphStatus.unreviewed;
  try {
    return GraphStatus.values.firstWhere((e) => e.name == value.toString());
  } on StateError {
    return GraphStatus.unreviewed;
  }
}
