# SAFENAV CAVITE — Campus Digitization Report

**Project:** SAFENAV CAVITE — Mobile-Based Campus Navigation and Emergency Evacuation System (EARIST Cavite Campus)
**Deliverable:** `assets/maps/campus_overview.svg` (Phase 2 digitized campus overview map)
**Reference:** `assets/maps/earist_master_site_plan.png` (original EARIST Cavite Master Site Development Plan — preserved, not overwritten)
**Related:** `campus_feature_inventory.md`, `outdoor_navigation_data_requirements.md`, `pubspec.yaml` (asset declared)

---

## 1. Files created / modified

| File | Action | Purpose |
|------|--------|---------|
| `assets/maps/campus_overview.svg` | Created | Clean top-down 2D vector campus overview map |
| `pubspec.yaml` | Modified (config only) | Declared `- assets/maps/campus_overview.svg` in the Flutter assets list so the SVG is bundled and loadable via `flutter_svg` |

**No existing Flutter application code was modified.** No files in `lib/` were touched. No existing assets were deleted, renamed, or overwritten (the reference `earist_master_site_plan.png` and `campus_layout.png` remain intact). No duplicate navigation data was created — the SVG is a visual illustration only; the outdoor navigation graph remains a separate structured deliverable.

## 2. SVG technical validation

| Check | Result |
|-------|--------|
| Well-formed XML | PASS (validated with PowerShell `[xml]` parser) |
| Root element | `svg` |
| viewBox | `0 0 1543 1000` (matches reference aspect ratio ~1.54:1 landscape) |
| width / height | 1543 / 1000 |
| Embedded raster images | None |
| Complex filters / effects | None |
| Unnecessary transforms | None |
| Logical `<g>` groups | Yes (boundary, water_features, roads, gardens_vegetation, existing_buildings, proposed_buildings, ongoing_construction, recently_accomplished, gates, pedestrian_pathways, building_labels, orientation_indicator) |
| Meaningful descriptive IDs | Yes (e.g. `existing_main_building_hall_bottom`, `proposed_engineering_building`, `existing_main_gate`, `proposed_secondary_gate`, `congressional_road`, `campus_boundary`, `creek`) |
| Flutter `flutter_svg` compatible | Yes (`flutter_svg: ^2.0.10+1` already a dependency; no new packages installed) |

## 3. Features successfully digitized

All 34 features from `campus_feature_inventory.md` are represented:

- **Existing/completed (dark red, 9):** existing main building hall (bottom-center), existing main building hall (right), existing quadrangle, existing research building, existing faculty building, existing criminology building, existing medical and dental clinic, existing canteen stalls, existing water cistern tank.
- **Proposed (orange, 9):** proposed dormitory building, proposed multipurpose building (upper-left), proposed multipurpose building (right edge), proposed engineering building, proposed staff housing building, proposed theater & arts building, proposed CIT & ICT building, proposed material segregation facility, ECC library extension / learning commons.
- **Ongoing construction/repair (cyan, 5):** canteen roofing & floor drainage, on-going CHTM building, ECC guidance office repair, ECC beauty care facility, proposed outdoor swimming pool (rendered cyan per plan color — see ambiguity #4).
- **Recently accomplished (magenta, 3):** CHTM simulation hostel, ECC food technology lab rehab, main building comfort rooms rehab.
- **Open space / plantation / garden (5):** proposed grass quadrangle, proposed fruit & vegetable plantation, dragon fruit plantation, red fox garden, creek.
- **Proposed road access / gates (3):** congressional road, existing main gate, proposed secondary access gate.

## 4. Layout fidelity

- Relative building positions, footprints, and proportions preserved from the reference; buildings were **not** rearranged, rotated, mirrored, or stretched for aesthetics.
- Campus boundary, congressional road, creek, gate locations, gardens, and open spaces preserved.
- North indicator kept accurate to the reference (arrow pointing diagonally toward upper-right).
- Colors follow the confirmed six-entry legend consistently.
- Labels placed to avoid overlap; building names inside large dark-red buildings use white text, smaller labels use dark text placed adjacent to footprints.

## 5. Features that need manual correction

None required to ship the illustrative SVG, but the following should be verified against a higher-resolution source before the map is used for precise status reporting or labeling:

1. Exact spelling of cut-off building names (BUILDIN → BUILDING).
2. Whether the last legend entry reads "PROPOSED PATHWAY".
3. Which converging leader line in the top cluster targets which building.
4. Whether the cyan pool-shaped footprint near center-left is the proposed swimming pool under construction.
5. Which "EXISTING MAIN BUILDING HALL" is the actual main hall.
6. Exact wording of blurry left-panel annotations.
7. "Proposed Material Segregation Earthpit" (reference list) vs. "PROPOSED MATERIAL SEGREGATION FACILIT…" (image label).

## 6. Details that could not be confirmed

- Precise coordinates / dimensions / GPS latitudes-longitudes (not available from the illustration; SVG uses a local coordinate system only).
- Exact building entrances and which are pedestrian-accessible.
- Exact internal pathway routing and which are walkable vs. decorative.
- Which of the two "EXISTING MAIN BUILDING HALL" buildings is the true main hall.

## 7. Recommendations for the next SAFENAV development phase

1. **Resolve the Section 5 manual-verification items** against a higher-resolution master plan before using building names or statuses in production UI.
2. **Build the outdoor navigation graph separately** (see `outdoor_navigation_data_requirements.md`) as structured nodes/edges for the existing Dijkstra routing; do **not** derive walkable edges automatically from the SVG's decorative pathway lines.
3. **Load the SVG in Flutter** via `flutter_svg` from `assets/maps/campus_overview.svg` (now declared in `pubspec.yaml`).
4. **Establish a local coordinate system** on the SVG viewBox for map-to-graph alignment; do not confuse local SVG coordinates with GPS latitude/longitude.
5. **Treat proposed facilities as not yet constructed** in any routing or evacuation logic until construction status is confirmed.
