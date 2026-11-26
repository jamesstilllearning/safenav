/// SAFENAV CAVITE - Evacuation Graph Model
///
/// Graph data model for emergency evacuation routing using Dijkstra's algorithm.
library;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'evacuation_graph.freezed.dart';
part 'evacuation_graph.g.dart';

/// Evacuation node type
enum EvacuationNodeType {
  /// Building entrance/exit
  @JsonValue('entrance')
  entrance,

  /// Stairwell
  @JsonValue('stairwell')
  stairwell,

  /// Corridor/hallway
  @JsonValue('corridor')
  corridor,

  /// Intersection/junction
  @JsonValue('intersection')
  intersection,

  /// Evacuation assembly point
  @JsonValue('assembly_point')
  assemblyPoint,

  /// Shelter location
  @JsonValue('shelter')
  shelter,

  /// Emergency exit
  @JsonValue('emergency_exit')
  emergencyExit,

  /// Fire extinguisher location
  @JsonValue('fire_extinguisher')
  fireExtinguisher,

  /// First aid station
  @JsonValue('first_aid')
  firstAid,

  /// Other
  @JsonValue('other')
  other;

  /// Display name
  String get displayName {
    switch (this) {
      case EvacuationNodeType.entrance:
        return 'Entrance/Exit';
      case EvacuationNodeType.stairwell:
        return 'Stairwell';
      case EvacuationNodeType.corridor:
        return 'Corridor';
      case EvacuationNodeType.intersection:
        return 'Intersection';
      case EvacuationNodeType.assemblyPoint:
        return 'Assembly Point';
      case EvacuationNodeType.shelter:
        return 'Shelter';
      case EvacuationNodeType.emergencyExit:
        return 'Emergency Exit';
      case EvacuationNodeType.fireExtinguisher:
        return 'Fire Extinguisher';
      case EvacuationNodeType.firstAid:
        return 'First Aid Station';
      case EvacuationNodeType.other:
        return 'Other';
    }
  }
}

/// Edge representing a path between two nodes
@freezed
abstract class EvacuationEdge with _$EvacuationEdge {
  const factory EvacuationEdge({
    /// Unique edge ID
    required String id,

    /// Source node ID
    required String fromNodeId,

    /// Destination node ID
    required String toNodeId,

    /// Distance in meters
    required double distance,

    /// Estimated traversal time in seconds
    required int estimatedTimeSeconds,

    /// Whether this path is accessible for wheelchair users
    @Default(true) bool isWheelchairAccessible,

    /// Whether this path is an emergency exit route
    @Default(false) bool isEmergencyRoute,

    /// Floor level (for multi-floor buildings)
    int? floor,

    /// Path description
    String? description,

    /// Hazards on this path (e.g., "fire", "debris", "smoke")
    @Default([]) List<String> hazards,

    /// Whether path is currently blocked
    @Default(false) bool isBlocked,

    /// Block reason
    String? blockReason,

    /// Timestamp when block was reported
    DateTime? blockedAt,

    /// Metadata
    @Default({}) Map<String, dynamic> metadata,
  }) = _EvacuationEdge;

  factory EvacuationEdge.fromJson(Map<String, dynamic> json) => _$EvacuationEdgeFromJson(json);
}

/// Node in the evacuation graph
@freezed
abstract class EvacuationNode with _$EvacuationNode {
  const factory EvacuationNode({
    /// Unique node ID
    required String id,

    /// Node label/name
    required String label,

    /// Node type
    required EvacuationNodeType type,

    /// Latitude
    required double latitude,

    /// Longitude
    required double longitude,

    /// Floor level
    int? floor,

    /// Building ID this node belongs to
    String? buildingId,

    /// Room/area identifier
    String? roomId,

    /// Whether this node is an exit to outside
    @Default(false) bool isExit,

    /// Whether this node is an assembly point
    @Default(false) bool isAssemblyPoint,

    /// Whether this node is a shelter
    @Default(false) bool isShelter,

    /// Capacity (for assembly points/shelters)
    int? capacity,

    /// Current occupancy (for real-time updates)
    @Default(0) int currentOccupancy,

    /// Accessibility features
    @Default([]) List<String> accessibilityFeatures,

    /// Emergency equipment at this node
    @Default([]) List<String> emergencyEquipment,

    /// Connected edge IDs
    @Default([]) List<String> connectedEdgeIds,

    /// Metadata
    @Default({}) Map<String, dynamic> metadata,
  }) = _EvacuationNode;

  factory EvacuationNode.fromJson(Map<String, dynamic> json) => _$EvacuationNodeFromJson(json);
}

/// Complete evacuation graph for a building or campus area
@freezed
abstract class EvacuationGraph with _$EvacuationGraph {
  const factory EvacuationGraph({
    /// Unique graph ID
    required String id,

    /// Graph name (e.g., "Main Building", "Campus Wide")
    required String name,

    /// Building ID (if building-specific)
    String? buildingId,

    /// Version number for cache invalidation
    required int version,

    /// All nodes in the graph
    required List<EvacuationNode> nodes,

    /// All edges in the graph
    required List<EvacuationEdge> edges,

    /// Default assembly points
    @Default([]) List<String> defaultAssemblyPointIds,

    /// Default shelter locations
    @Default([]) List<String> defaultShelterIds,

    /// Graph bounds (minLat, minLng, maxLat, maxLng)
    required List<double> bounds,

    /// Creation timestamp
    required DateTime createdAt,

    /// Last update timestamp
    required DateTime updatedAt,

    /// Source of graph data
    String? dataSource,

    /// Metadata
    @Default({}) Map<String, dynamic> metadata,
  }) = _EvacuationGraph;

  factory EvacuationGraph.fromJson(Map<String, dynamic> json) => _$EvacuationGraphFromJson(json);
}

extension EvacuationGraphExtensions on EvacuationGraph {
  /// Gets a node by ID
  EvacuationNode? getNode(String nodeId) {
    try {
      return nodes.firstWhere((n) => n.id == nodeId);
    } catch (_) {
      return null;
    }
  }

  /// Gets an edge by ID
  EvacuationEdge? getEdge(String edgeId) {
    try {
      return edges.firstWhere((e) => e.id == edgeId);
    } catch (_) {
      return null;
    }
  }

  /// Gets all assembly points
  List<EvacuationNode> get assemblyPoints =>
      nodes.where((n) => n.isAssemblyPoint).toList();

  /// Gets all shelters
  List<EvacuationNode> get shelters => nodes.where((n) => n.isShelter).toList();

  /// Gets all exits
  List<EvacuationNode> get exits => nodes.where((n) => n.isExit).toList();

  /// Gets edges from a node
  List<EvacuationEdge> getEdgesFrom(String nodeId) {
    return edges.where((e) => e.fromNodeId == nodeId && !e.isBlocked).toList();
  }

  /// Gets edges to a node
  List<EvacuationEdge> getEdgesTo(String nodeId) {
    return edges.where((e) => e.toNodeId == nodeId && !e.isBlocked).toList();
  }

  /// Gets all unblocked edges
  List<EvacuationEdge> get unblockedEdges => edges.where((e) => !e.isBlocked).toList();

  /// Checks if graph has valid data
  bool get isValid => nodes.isNotEmpty && edges.isNotEmpty;

  /// Number of nodes
  int get nodeCount => nodes.length;

  /// Number of edges
  int get edgeCount => edges.length;

  /// Creates a copy with updated timestamp
  EvacuationGraph withUpdatedTimestamp(DateTime timestamp) {
    return copyWith(updatedAt: timestamp);
  }
}

extension EvacuationNodeExtensions on EvacuationNode {
  /// Gets coordinates
  (double lat, double lng) get coordinates => (latitude, longitude);

  /// Checks if node is on specific floor
  bool isOnFloor(int floor) => this.floor == floor;
}

extension EvacuationEdgeExtensions on EvacuationEdge {
  /// Checks if edge is traversable
  bool get isTraversable => !isBlocked;

  /// Gets estimated time as Duration
  Duration get estimatedDuration => Duration(seconds: estimatedTimeSeconds);
}