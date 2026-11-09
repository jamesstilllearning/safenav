# SAFENAV CAVITE — Navigation Architecture Adaptation Specification

**Purpose:** Document specific code changes needed to integrate field-verified geospatial data and evacuation routing into the existing Flutter navigation architecture.

---

## Current State Analysis

### Reusable Components ✅
| Component | File | Status |
|-----------|------|--------|
| Map Engine | `flutter_map` + `flutter_map_tile_caching` | Working |
| MapDataService | `lib/src/features/map/data/services/map_data_service.dart` | Loads GeoJSON |
| CampusBuilding Model | `lib/src/features/map/data/models/campus_building.dart` | Freezed, needs category updates |
| CampusPathway Model | `lib/src/features/map/data/models/campus_pathway.dart` | Freezed, needs verification fields |
| NavigationService | `lib/src/features/navigation/data/services/navigation_service.dart` | Dijkstra implemented |
| Navigation Models | `lib/src/features/navigation/data/models/navigation_models.dart` | Freezed, supports building/emergency/assembly |
| EvacuationGraph Model | `lib/src/shared/models/evacuation_graph.dart` | Comprehensive, needs data |
| MapScreen | `lib/src/features/map/presentation/screens/map_screen.dart` | Layers, selection, routing |
| NavigationScreen | `lib/src/features/navigation/presentation/screens/navigation_screen.dart` | Search, emergency actions |

---

## Required Model Changes

### 1. CampusBuilding Model (`campus_building.dart`)

#### Add BuildingExit Model
```dart
// ADD to campus_building.dart (after BuildingCategory definition)

@freezed
abstract class BuildingExit with _$BuildingExit {
  const factory BuildingExit({
    required String exitId,
    required String type, // main, emergency, fire_exit, secondary, service
    required String description,
    required String accessibility, // wheelchair, partial, stairs_only, unknown
    required String leadsTo, // pathway_id or assembly_id
    required String signage, // illuminated, standard, none
    LatLng? coordinates, // if GPS verified
    String? verificationStatus,
    DateTime? verificationDate,
  }) = _BuildingExit;
}

// ADD to CampusBuilding model
@freezed
abstract class CampusBuilding with _$CampusBuilding {
  // ... existing fields ...
  @Default([]) List<BuildingExit> exits;
  
  // ADD: Floor information for multi-floor buildings
  @Default(1) int floors;
  
  // ADD: Building category extensions for master plan types
  // See category extensions below
}
```

#### Extend BuildingCategory Enum
```dart
// REPLACE existing BuildingCategory enum in campus_building.dart

@freezed
abstract class BuildingCategory with _$BuildingCategory {
  const factory BuildingCategory.academic() = _Academic;
  const factory BuildingCategory.administrative() = _Administrative;
  const factory BuildingCategory.library() = _Library;
  const factory BuildingCategory.laboratory() = _Laboratory;
  const factory BuildingCategory.gymnasium() = _Gymnasium;
  const factory BuildingCategory.cafeteria() = _Cafeteria;
  const factory BuildingCategory.dormitory() = _Dormitory;
  const factory BuildingCategory.parking() = _Parking;
  // NEW categories from master plan
  const factory BuildingCategory.multipurpose() = _Multipurpose;
  const factory BuildingCategory.canteen() = _Canteen;
  const factory BuildingCategory.clinic() = _Clinic;
  const factory BuildingCategory.theater() = _Theater;
  const factory BuildingCategory.materialSegregation() = _MaterialSegregation;
  const factory BuildingCategory.mainHall() = _MainHall;
  const factory BuildingCategory.office() = _Office;
  const factory BuildingCategory.hostel() = _Hostel;
  const factory BuildingCategory.other() = _Other;
}

// UPDATE BuildingCategoryConverter
class BuildingCategoryConverter implements JsonConverter<BuildingCategory, String> {
  const BuildingCategoryConverter();

  @override
  BuildingCategory fromJson(String json) {
    return json.toBuildingCategory();
  }

  @override
  String toJson(BuildingCategory object) {
    return object.label.toLowerCase();
  }
}

// UPDATE BuildingCategoryX extension
extension BuildingCategoryX on String {
  BuildingCategory toBuildingCategory() {
    switch (toLowerCase()) {
      case 'academic': return BuildingCategory.academic();
      case 'administrative': return BuildingCategory.administrative();
      case 'library': return BuildingCategory.library();
      case 'laboratory': return BuildingCategory.laboratory();
      case 'gymnasium': return BuildingCategory.gymnasium();
      case 'cafeteria': return BuildingCategory.cafeteria();
      case 'dormitory': return BuildingCategory.dormitory();
      case 'parking': return BuildingCategory.parking();
      case 'multipurpose': return BuildingCategory.multipurpose();
      case 'canteen': return BuildingCategory.canteen();
      case 'clinic': return BuildingCategory.clinic();
      case 'theater': return BuildingCategory.theater();
      case 'material_segregation': return BuildingCategory.materialSegregation();
      case 'main_hall': return BuildingCategory.mainHall();
      case 'office': return BuildingCategory.office();
      case 'hostel': return BuildingCategory.hostel();
      default: return BuildingCategory.other();
    }
  }
}

// UPDATE BuildingCategoryColor extension
extension BuildingCategoryColor on BuildingCategory {
  int get colorValue {
    return when(
      academic: () => 0xFF2196F3,
      administrative: () => 0xFF9C27B0,
      library: () => 0xFF4CAF50,
      laboratory: () => 0xFFFF9800,
      gymnasium: () => 0xFFE91E63,
      cafeteria: () => 0xFF795548,
      dormitory: () => 0xFF3F51B5,
      parking: () => 0xFF607D8B,
      multipurpose: () => 0xFF8BC34A,
      canteen: () => 0xFFFF5722,
      clinic: () => 0xFFF44336,
      theater: () => 0xFF9C27B0,
      materialSegregation: () => 0xFF795548,
      mainHall: () => 0xFF3F51B5,
      office: () => 0xFF607D8B,
      hostel: () => 0xFF00BCD4,
      other: () => 0xFF757575,
    );
  }

  String get label {
    return when(
      academic: () => 'Academic',
      administrative: () => 'Administrative',
      library: () => 'Library',
      laboratory: () => 'Laboratory',
      gymnasium: () => 'Gymnasium',
      cafeteria: () => 'Cafeteria',
      dormitory: () => 'Dormitory',
      parking: () => 'Parking',
      multipurpose: () => 'Multipurpose',
      canteen: () => 'Canteen',
      clinic: () => 'Clinic',
      theater: () => 'Theater',
      materialSegregation: () => 'Material Segregation',
      mainHall: () => 'Main Hall',
      office: () => 'Office',
      hostel: () => 'Hostel',
      other: () => 'Other',
    );
  }
}
```

---

### 2. CampusPathway Model (`campus_pathway.dart`)

```dart
// UPDATE PathwayCategory enum
@freezed
abstract class PathwayCategory with _$PathwayCategory {
  const factory PathwayCategory.mainPath() = _MainPath;
  const factory PathwayCategory.connector() = _Connector;
  const factory PathwayCategory.perimeter() = _Perimeter;
  const factory PathwayCategory.emergency() = _Emergency;
  const factory PathwayCategory.parking() = _Parking;
  const factory PathwayCategory.openSpace() = _OpenSpace;
  // NEW categories from master plan
  const factory PathwayCategory.roadAccess() = _RoadAccess;
  const factory PathwayCategory.pathwalk() = _Pathwalk;
  const factory PathwayCategory.service() = _Service;
  const factory PathwayCategory.internal() = _Internal;
  const factory PathwayCategory.other() = _Other;
}

// UPDATE PathwayCategoryConverter
class PathwayCategoryConverter implements JsonConverter<PathwayCategory, String> {
  const PathwayCategoryConverter();

  @override
  PathwayCategory fromJson(String json) {
    return json.toPathwayCategory();
  }

  @override
  String toJson(PathwayCategory object) {
    return object.label.toLowerCase().replaceAll(' ', '_');
  }
}

// UPDATE PathwayCategoryX extension
extension PathwayCategoryX on String {
  PathwayCategory toPathwayCategory() {
    switch (toLowerCase()) {
      case 'main_path':
      case 'mainpath':
        return PathwayCategory.mainPath();
      case 'connector':
        return PathwayCategory.connector();
      case 'perimeter':
        return PathwayCategory.perimeter();
      case 'emergency':
        return PathwayCategory.emergency();
      case 'parking':
        return PathwayCategory.parking();
      case 'open_space':
      case 'openspace':
        return PathwayCategory.openSpace();
      case 'road_access':
        return PathwayCategory.roadAccess();
      case 'pathwalk':
        return PathwayCategory.pathwalk();
      case 'service':
        return PathwayCategory.service();
      case 'internal':
        return PathwayCategory.internal();
      default:
        return PathwayCategory.other();
    }
  }
}

// UPDATE CampusPathway model - ADD verification fields
@freezed
abstract class CampusPathway with _$CampusPathway {
  const CampusPathway._();

  const factory CampusPathway({
    required String id,
    required String name,
    required String highway,
    required String surface,
    required double width,
    @PathwayCategoryConverter() required PathwayCategory category,
    required String description,
    required String source,
    required String verificationStatus, // official, field_verified, staff_confirmed, estimated, unverified
    required List<LatLng> coordinates,
    String? geometryType, // 'LineString' or 'Polygon'
    int? capacity,
    // NEW fields
    String? accessRestriction, // guard, card, open, locked, time_restricted
    String? closureStatus, // open, closed, partially_closed
    String? directionality, // bidirectional, one_way
    String? condition, // good, fair, poor, blocked
    String? accessibility, // wheelchair, partial, none
    Map<String, dynamic>? additionalTags,
  }) = _CampusPathway;

  factory CampusPathway.fromJson(Map<String, dynamic> json) =>
      _$CampusPathwayFromJson(json);
  
  // ... existing getters ...
}
```

---

### 3. NavigationService (`navigation_service.dart`)

#### Replace Graph Builder with Verified Junctions
```dart
// REPLACE buildGraph() method to use verified junctions instead of proximity rules

void buildGraph(List<CampusPathway> pathways, List<CampusBuilding> buildings) {
  if (_graphBuilt) return;
  _nodes.clear();

  // Create nodes from pathway endpoints and verified intersections
  final Map<String, NavNode> nodeMap = {};
  final Map<String, List<LatLng>> pathwayGeometries = {};

  // Collect all unique points from pathways (using exact coordinates)
  final Map<String, LatLng> pointIdToLatLng = {};
  final Map<String, Set<String>> coordinateToNodeIds = {}; // For exact junction matching

  for (final pathway in pathways) {
    // Skip unverified/closed pathways for standard routing
    if (pathway.verificationStatus == 'unverified' || 
        pathway.closureStatus == 'closed') continue;
    
    if (pathway.coordinates.length < 2) continue;
    pathwayGeometries[pathway.id] = pathway.coordinates;

    for (int i = 0; i < pathway.coordinates.length; i++) {
      final point = pathway.coordinates[i];
      // Create deterministic node ID from coordinate (rounded to 7 decimals)
      final coordKey = '${point.longitude.toStringAsFixed(7)},${point.latitude.toStringAsFixed(7)}';
      final nodeId = 'node_$coordKey';

      if (!pointIdToLatLng.containsKey(nodeId)) {
        pointIdToLatLng[nodeId] = point;
      }
      coordinateToNodeIds.putIfAbsent(coordKey, () => {}).add(nodeId);
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

  // Create edges between consecutive points in each pathway
  for (final pathway in pathways) {
    if (pathway.verificationStatus == 'unverified' || 
        pathway.closureStatus == 'closed') continue;
    
    if (pathway.coordinates.length < 2) continue;

    for (int i = 0; i < pathway.coordinates.length - 1; i++) {
      final p1 = pathway.coordinates[i];
      final p2 = pathway.coordinates[i + 1];

      final coordKey1 = '${p1.longitude.toStringAsFixed(7)},${p1.latitude.toStringAsFixed(7)}';
      final coordKey2 = '${p2.longitude.toStringAsFixed(7)},${p2.latitude.toStringAsFixed(7)}';
      final nodeId1 = 'node_$coordKey1';
      final nodeId2 = 'node_$coordKey2';

      if (nodeId1 != nodeId2) {
        final distance = _distance(p1, p2);

        // Check if pathway is one-way
        final isOneWay = pathway.directionality == 'one_way';
        
        // Add forward edge
        _nodes[nodeId1]!.edges.add(NavEdge(
          targetNodeId: nodeId2,
          distance: distance,
          pathwayId: pathway.id,
          category: pathway.category,
          geometry: [p1, p2],
        ));

        // Add reverse edge unless one-way
        if (!isOneWay) {
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
  }

  // Add building entrance nodes using VERIFIED entrance coordinates
  for (final building in buildings) {
    for (final exit in building.exits) {
      if (exit.coordinates != null) {
        final coord = exit.coordinates!;
        final coordKey = '${coord.longitude.toStringAsFixed(7)},${coord.latitude.toStringAsFixed(7)}';
        final nodeId = 'node_$coordKey';

        // Find nearest pathway node
        String? nearestNodeId;
        double minDist = double.infinity;

        for (final node in _nodes.values) {
          // Skip building nodes
          if (node.buildingId != null) continue;
          final dist = _distance(coord, node.position);
          if (dist < minDist && dist < 50.0) { // Within 50m
            minDist = dist;
            nearestNodeId = node.id;
          }
        }

        if (nearestNodeId != null) {
          final buildingNodeId = 'building_${building.id}_${exit.exitId}';
          _nodes[buildingNodeId] = NavNode(
            id: buildingNodeId,
            position: coord,
            edges: [
              NavEdge(
                targetNodeId: nearestNodeId,
                distance: minDist,
                pathwayId: 'building_access_${building.id}_${exit.exitId}',
                category: PathwayCategory.connector(),
                geometry: [coord, _nodes[nearestNodeId]!.position],
              ),
            ],
            name: building.name,
            buildingId: building.id,
          );

          // Add reverse edge
          _nodes[nearestNodeId]!.edges.add(NavEdge(
            targetNodeId: buildingNodeId,
            distance: minDist,
            pathwayId: 'building_access_${building.id}_${exit.exitId}',
            category: PathwayCategory.connector(),
            geometry: [_nodes[nearestNodeId]!.position, coord],
          ));
        }
      }
    }
  }

  // Add gate nodes
  // (Similar pattern for gates if they exist in CampusGate model)

  _graphBuilt = true;
}
```

#### Add Evacuation Mode
```dart
// ADD to NavigationService

enum NavigationMode {
  normal,
  evacuation,
  accessibility,
}

/// Compute route with mode-specific behavior
NavigationResult? computeRoute({
  required LatLng start,
  required LatLng end,
  NavigationMode mode = NavigationMode.normal,
  bool avoidEmergencyPaths = false,
  bool preferMainPaths = true,
  List<String>? blockedPathwayIds,
}) {
  if (!_graphBuilt) return null;

  String? startNodeId, endNodeId;

  switch (mode) {
    case NavigationMode.normal:
      startNodeId = findNearestPathwayNode(start);
      endNodeId = findNearestNode(end);
      break;
    case NavigationMode.evacuation:
      // For evacuation: start from nearest node, end at nearest assembly point/exit
      startNodeId = findNearestNode(start); // Include building nodes
      endNodeId = findNearestAssemblyOrExit(end);
      break;
    case NavigationMode.accessibility:
      startNodeId = findNearestAccessibleNode(start);
      endNodeId = findNearestAccessibleNode(end);
      break;
  }

  if (startNodeId == null || endNodeId == null) return null;

  // Dijkstra with mode-specific edge filtering
  final distances = <String, double>{};
  final previous = <String, String?>{};
  final visited = <String>{};
  final queue = <String>[];

  for (final nodeId in _nodes.keys) {
    distances[nodeId] = double.infinity;
    previous[nodeId] = null;
  }
  distances[startNodeId] = 0;
  queue.add(startNodeId);

  while (queue.isNotEmpty) {
    queue.sort((a, b) => distances[a]!.compareTo(distances[b]!));
    final currentId = queue.removeAt(0);

    if (visited.contains(currentId)) continue;
    visited.add(currentId);

    if (currentId == endNodeId) break;

    final currentNode = _nodes[currentId]!;
    for (final edge in currentNode.edges) {
      // Mode-specific edge filtering
      if (!_isEdgeTraversable(edge, mode, blockedPathwayIds)) continue;

      double weight = edge.distance;
      if (preferMainPaths && edge.category == PathwayCategory.mainPath()) {
        weight *= 0.8;
      }
      // Evacuation mode: prioritize emergency routes
      if (mode == NavigationMode.evacuation && edge.category == PathwayCategory.emergency()) {
        weight *= 0.5;
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

  // ... rest of path reconstruction ...
  // (Same as existing code)
}

/// Check if edge is traversable in current mode
bool _isEdgeTraversable(NavEdge edge, NavigationMode mode, List<String>? blockedPathwayIds) {
  // Check blocked pathways
  if (blockedPathwayIds?.contains(edge.pathwayId) == true) return false;

  switch (mode) {
    case NavigationMode.normal:
      return true; // All verified edges
    case NavigationMode.evacuation:
      // Allow all edges but prefer emergency routes
      return edge.category != PathwayCategory.service(); // Exclude service paths
    case NavigationMode.accessibility:
      // Only wheelchair accessible edges
      // This requires pathway accessibility field
      // For now, exclude stairs-only pathways
      return edge.category != PathwayCategory.emergency(); // Emergency often has stairs
  }
}

/// Find nearest assembly point or exit node
String? findNearestAssemblyOrExit(LatLng position, {double maxDistance = 500.0}) {
  // This would need assembly point data loaded
  // For now, find nearest building exit node
  String? nearestId;
  double minDist = maxDistance;

  for (final node in _nodes.values) {
    if (node.buildingId == null) continue; // Only building nodes (exits)
    final dist = _distance(position, node.position);
    if (dist < minDist) {
      minDist = dist;
      nearestId = node.id;
    }
  }

  return nearestId;
}

/// Find nearest accessible node (wheelchair)
String? findNearestAccessibleNode(LatLng position, {double maxDistance = 100.0}) {
  // Would need pathway accessibility data
  // Fallback to normal for now
  return findNearestPathwayNode(position, maxDistance: maxDistance);
}
```

---

### 4. EvacuationGraph Integration

The `EvacuationGraph` model already exists and is comprehensive. Need to:

1. **Load evacuation data** from GeoJSON into `EvacuationGraph` objects
2. **Connect** `EvacuationGraph` to `NavigationService` for evacuation routing
3. **Add** evacuation-specific graph builder

```dart
// NEW SERVICE: lib/src/features/navigation/data/services/evacuation_service.dart

class EvacuationService {
  EvacuationService._();
  static final EvacuationService _instance = EvacuationService._();
  static EvacuationService get instance => _instance;

  EvacuationGraph? _campusGraph;
  final Map<String, EvacuationGraph> _buildingGraphs = {};

  Future<void> loadEvacuationData() async {
    // Load campus-wide evacuation graph
    final campusJson = await rootBundle.loadString(
      'lib/src/features/map/data/evacuation_areas.geojson'
    );
    _campusGraph = _parseEvacuationGeoJSON(campusJson);

    // Load building-specific graphs
    // ...
  }

  EvacuationGraph _parseEvacuationGeoJSON(String jsonString) {
    // Parse GeoJSON and convert to EvacuationGraph
    // Map features to EvacuationNode and EvacuationEdge
  }

  // Evacuation-specific routing
  List<EvacuationNode> findEvacuationRoute({
    required String startNodeId,
    required String assemblyPointId,
    List<String>? hazards,
    bool wheelchairAccessible = false,
  }) {
    // Use Dijkstra on EvacuationGraph with hazard avoidance
  }

  List<EvacuationNode> getNearestAssemblyPoints(LatLng position, {int count = 3}) {
    // Return nearest assembly points from campus graph
  }
}
```

---

### 5. New Models Needed

#### CampusGate Model
```dart
// NEW FILE: lib/src/features/map/data/models/campus_gate.dart

@freezed
abstract class CampusGate with _$CampusGate {
  const factory CampusGate({
    required String id,
    required String name,
    required String type, // main, secondary, service, emergency
    required LatLng position,
    required String hours, // e.g., "6:00-22:00"
    required String accessControl, // guard, card, open, locked
    required bool vehicleAccess,
    required bool pedestrianAccess,
    required bool emergencyOverride,
    required String source,
    required String verificationStatus,
    String? description,
  }) = _CampusGate;
}
```

#### CampusLandmark Model
```dart
// NEW FILE: lib/src/features/map/data/models/campus_landmark.dart

@freezed
abstract class CampusLandmark with _$CampusLandmark {
  const factory CampusLandmark({
    required String id,
    required String name,
    required String type, // creek, quadrangle, garden, plantation, pool, utility
    required LatLng position,
    String? polygon, // GeoJSON polygon for areas
    required String designationStatus, // official, candidate, unverified
    required String source,
    required String verificationStatus,
    String? description,
  }) = _CampusLandmark;
}
```

#### FloorPlan Model (for indoor navigation)
```dart
// NEW FILE: lib/src/features/map/data/models/floor_plan.dart

@freezed
abstract class FloorPlan with _$FloorPlan {
  const factory FloorPlan({
    required String buildingId,
    required String floorId, // FL01, FL02
    required String floorLabel,
    required List<FloorRoom> rooms,
    required List<FloorExit> exits,
    required List<FloorStaircase> staircases,
    required List<FloorCorridor> corridors,
    required List<FloorEvacuationRoute> evacuationRoutes,
    required String source, // posted_diagram, architectural_drawing
    required String verificationStatus,
    DateTime? diagramDate,
  }) = _FloorPlan;
}

@freezed
abstract class FloorRoom with _$FloorRoom {
  const factory FloorRoom({
    required String roomId,
    required String name,
    required List<LatLng> polygon, // Relative to building or absolute
    required String type, // classroom, office, lab, corridor, stair, restroom
    int? capacity,
  }) = _FloorRoom;
}

@freezed
abstract class FloorExit with _$FloorExit {
  const factory FloorExit({
    required String exitId,
    required String type, // main, emergency, fire_exit
    required LatLng position,
    required String leadsTo, // pathway_id or assembly_id
    required String accessibility,
  }) = _FloorExit;
}

@freezed
abstract class FloorStaircase with _$FloorStaircase {
  const factory FloorStaircase({
    required String stairId,
    required String type, // enclosed, open, fire_exit
    required List<String> connectsFloors, // [FL01, FL02]
    required LatLng position,
    required String evacuationDirection, // up_only, down_only, bidirectional
    required String accessibility,
  }) = _FloorStaircase;
}

@freezed
abstract class FloorCorridor with _$FloorCorridor {
  const factory FloorCorridor({
    required String corridorId,
    required List<LatLng> centerline,
    required double widthEstimate,
    required List<String> connects, // room/exit/stair IDs
  }) = _FloorCorridor;
}

@freezed
abstract class FloorEvacuationRoute with _$FloorEvacuationRoute {
  const factory FloorEvacuationRoute({
    required String routeId,
    required String startZone,
    required List<String> path, // corridor/stair/exit IDs
    required String assemblyPointId,
    required String direction, // one_way, bidirectional
  }) = _FloorEvacuationRoute;
}
```

---

### 6. MapDataService Updates

```dart
// UPDATE MapDataService to load new GeoJSON files

class MapDataService {
  // ... existing code ...

  // ADD new load methods
  Future<List<CampusGate>> loadCampusGates() async { /* ... */ }
  Future<List<CampusLandmark>> loadCampusLandmarks() async { /* ... */ }
  Future<List<FloorPlan>> loadFloorPlans(String buildingId) async { /* ... */ }
  Future<EvacuationGraph> loadCampusEvacuationGraph() async { /* ... */ }

  // UPDATE loadAllData to include new layers
  Future<void> loadAllData() async {
    await Future.wait([
      loadCampusBoundary(),
      loadCampusBuildings(),
      loadCampusPathways(),
      loadCampusGates(),
      loadCampusLandmarks(),
    ]);
  }
}
```

---

### 7. GeoJSON Asset Registration (pubspec.yaml)

```yaml
flutter:
  uses-material-design: true

  assets:
    - lib/src/features/map/data/campus_boundary.geojson
    - lib/src/features/map/data/campus_buildings.geojson
    - lib/src/features/map/data/campus_pathways.geojson
    # NEW files to add after fieldwork:
    - lib/src/features/map/data/campus_gates.geojson
    - lib/src/features/map/data/campus_landmarks.geojson
    - lib/src/features/map/data/evacuation_areas.geojson
    - lib/src/features/map/data/floor_plans/building_016_fl01.geojson
    # ... per building/floor
```

---

## Implementation Priority

| Priority | Task | Dependencies |
|----------|------|--------------|
| **P0** | Extend BuildingCategory enum | None |
| **P0** | Add BuildingExit model to CampusBuilding | BuildingCategory |
| **P0** | Add verification fields to CampusPathway | None |
| **P1** | Replace NavigationService graph builder | Verified pathway GeoJSON |
| **P1** | Add NavigationMode enum and evacuation routing | Graph builder |
| **P1** | Create CampusGate, CampusLandmark models | None |
| **P2** | Create FloorPlan models for indoor nav | Evacuation diagrams processed |
| **P2** | Build EvacuationService | EvacuationGraph model, evacuation GeoJSON |
| **P2** | Integrate EvacuationService with NavigationScreen | NavigationService evacuation mode |
| **P3** | Update MapDataService for new GeoJSON files | New GeoJSON assets exist |
| **P3** | Update pubspec.yaml asset declarations | GeoJSON files generated |

---

## Data Flow After Fieldwork

```
Field Data (Photos + GPS)
    ↓
Photo Organization (organize_photos.py)
    ↓
Manual Extraction → JSON (building_*.json, evacuation_*.json)
    ↓
QGIS Digitization → GeoPackage (.gpkg)
    ↓
Field GPS Validation → Updated geometries
    ↓
GeoJSON Export (EPSG:4326)
    ↓
Flutter Assets (campus_*.geojson, floor_plans/*.geojson)
    ↓
MapDataService loads data
    ↓
NavigationService.buildGraph(verified pathways)
    ↓
EvacuationService loads evacuation graphs
    ↓
MapScreen / NavigationScreen display & route
```

---

## Testing Checklist

- [ ] BuildingCategory enum parses all master plan categories
- [ ] CampusBuilding.exits loads from GeoJSON properties
- [ ] CampusPathway.verificationStatus filters routing correctly
- [ ] NavigationService graph uses exact coordinate junctions
- [ ] NavigationMode.evacuation finds assembly points
- [ ] NavigationMode.accessibility filters stairs-only paths
- [ ] EvacuationService computes building-to-assembly routes
- [ ] MapDataService loads all 6+ GeoJSON files
- [ ] MapScreen renders buildings, pathways, gates, landmarks, evacuation areas
- [ ] NavigationScreen shows evacuation mode toggle
- [ ] Freezed code generation runs without errors (`flutter pub run build_runner build`)

---

**Version:** 1.0  
**Prepared for:** SAFENAV CAVITE — EARIST Cavite Campus  
**Dependencies:** Field-verified GeoJSON data from QGIS export