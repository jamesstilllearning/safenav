# SAFENAV CAVITE — Outdoor Navigation Data Requirements

**Project:** SAFENAV CAVITE — Mobile-Based Campus Navigation and Emergency Evacuation System (EARIST Cavite Campus)
**Purpose:** Specify the information required to build the outdoor navigation graph (structured nodes + edges) that feeds the existing Dijkstra routing implementation.
**Relationship to map:** The campus illustration (`assets/maps/campus_overview.svg`) and the navigation graph are separate components. Decorative map lines are **not** automatically valid navigation routes. No coordinates or measurements are fabricated here.

---

## 1. Separation of concerns

| Component | Role | Status |
|-----------|------|--------|
| Campus overview SVG | Visual illustration for the mobile map | Created (Phase 2) |
| Outdoor navigation graph | Structured nodes/edges for Dijkstra routing | To be built (Phase 3 data requirements only) |
| Indoor navigation graphs | Per-floor building graphs | Already completed; not modified |
| Dijkstra implementation | Existing routing algorithm | Not modified |

## 2. Information required to build the outdoor navigation graph

### 2.1 Verified pedestrian access points
To be confirmed against the physical campus / higher-resolution plan:
- Existing main gate location on Congressional Road (bottom-left-of-center).
- Proposed secondary access gate location (bottom-right corner).
- Any additional unlabeled gate or entry openings along the campus boundary.

### 2.2 Building entrances
For each building in `campus_feature_inventory.md`, identify:
- Which facade(s) have pedestrian entrances.
- Which entrance connects to which outdoor node.
- Entrances for: existing main building hall (both possible locations), existing quadrangle, existing research/faculty/criminology/medical-dental buildings, existing canteen stalls, existing water cistern tank, proposed dormitory, proposed multipurpose (×2), proposed engineering, proposed staff housing, proposed theater & arts, proposed CIT & ICT, proposed material segregation facility, ECC library extension, ongoing-construction buildings, recently accomplished facilities.

### 2.3 Road and pathway intersections
- Intersections along Congressional Road where internal paths meet the public road.
- Intersections among internal proposed road-access strips and pedestrian pathways.
- Junction points near building clusters (upper-left, center, right side, lower-left).

### 2.4 Walkable path connections
- Confirmed pedestrian connections between gates, building entrances, and intersections.
- Which illustrated pathways are actually walkable vs. decorative/restricted.
- Connections across the creek (if any bridges exist) — the creek runs along the upper-right boundary; verify whether it blocks or is crossed by paths.

### 2.5 Gate connections
- How the existing main gate connects to the outdoor graph and to nearby building entrances.
- How the proposed secondary gate connects to the graph (noting it is "proposed" — may not yet be traversable).

### 2.6 Restricted or uncertain areas
- Construction zones (ongoing construction/repair buildings) — may not be traversable.
- Proposed facilities (not yet constructed) — should not be used as routing destinations until built.
- The creek (water feature) — likely non-traversable; verify bridges.
- Any areas marked restricted or under construction in the master plan.

### 2.7 Potential connections to indoor building entrances
- Each outdoor graph node at a building entrance should link to the corresponding indoor navigation graph entry node for that building.
- Maintain a mapping: outdoor node ID ↔ building ID ↔ indoor graph entry point.

---

## 3. Coordinate system

- Use a **consistent local coordinate system** based on the SVG `viewBox` (`0 0 1543 1000`) for graph node placement during alignment.
- **Do not confuse local SVG coordinates with GPS latitude/longitude.** GPS coordinates must be obtained separately (geolocator/geocoding are already dependencies) and are not part of this deliverable.
- Node coordinates should be expressed in the local SVG space until GPS registration is performed.

---

## 4. Representation

The outdoor navigation graph must eventually be represented as structured **nodes and edges** consumable by the existing Dijkstra implementation:
- Nodes: gates, building entrances, intersections, pathway junctions (with local x/y coordinates).
- Edges: walkable connections between nodes (with cost/weight, e.g. distance).
- Do **not** implement or modify Dijkstra; only supply the graph data.

---

## 5. Items not to fabricate

- Exact node coordinates and edge distances (unavailable from the illustration).
- Which pathways are pedestrian-safe (requires physical verification).
- Whether the proposed secondary gate is currently open (it is "proposed").
- GPS coordinates for any feature.

---

## 6. Suggested next steps

1. Obtain a higher-resolution master plan or site survey to confirm gate locations, building entrances, and pathway routing.
2. Walk the campus to verify which illustrated paths are pedestrian-accessible and identify restrictions.
3. Define the node/edge schema and export as structured data (JSON) consistent with the existing `assets/data/campus_graph_draft.json` structure — without overwriting or duplicating it.
4. Link outdoor entrance nodes to the existing indoor navigation graphs per building.
5. Register local SVG coordinates to GPS (if outdoor geolocation is required) using the existing `geolocator`/`geocoding` dependencies.
