# SAFENAV CAVITE – Geospatial Data Processing Guide

**Complete workflow for converting campus data into Flutter-ready GeoJSON**

---

## Overview

This guide covers the complete geospatial data pipeline:
1. **Ground Control Points** from Google Earth Pro
2. **Master Plan Georeferencing** in QGIS
3. **Feature Digitization** (buildings, pathways, gates, landmarks, evacuation areas)
4. **Field GPS Validation** (comparing digitized vs. real-world)
5. **GeoJSON Export** for Flutter (EPSG:4326)
6. **Navigation Graph Preparation** (verified junctions, connectivity)

---

## Phase 1: Ground Control Points (GCPs) from Google Earth Pro

### Why GCPs?
The master plan image (`EARIST CAVITE Master Site.png`) has **no coordinates**. GCPs link image pixels to real-world coordinates.

### Procedure

1. **Install Google Earth Pro** (free)
2. **Search:** "EARIST Cavite Campus, General Mariano Alvarez, Cavite"
3. **Identify 8–10 clear, stable features** visible on BOTH satellite and master plan:
   - Building corners (sharp 90° corners best)
   - Gate posts / gate structures
   - Road intersections (Congressional Road + campus entry)
   - Distinct pathway junctions
   - Water tank / unique landmarks

4. **For each GCP:**
   - Right-click → "Add Placemark"
   - Name: `GCP_01_MainGate`, `GCP_02_Bldg16_NW_Corner`, etc.
   - Right-click placemark → Properties → Copy **Latitude, Longitude**
   - Paste into spreadsheet

5. **Save as `gcp_reference.csv`:**

```csv
gcp_id,latitude,longitude,description,source
GCP_01,14.300156,121.007688,Main Gate post,Google Earth Pro
GCP_02,14.300150,121.007680,Main Building Hall NW corner,Google Earth Pro
GCP_03,14.300550,121.009200,Faculty Building NE corner,Google Earth Pro
GCP_04,14.300750,121.009100,Existing Quadrangle center,Google Earth Pro
GCP_05,14.300800,121.010300,Creek crossing (if visible),Google Earth Pro
GCP_06,14.300000,121.009500,Congressional Road intersection,Google Earth Pro
GCP_07,14.300650,121.008900,Central pathway junction,Google Earth Pro
GCP_08,14.299500,121.007800,South boundary marker,Google Earth Pro
```

**Target Accuracy:** Google Earth Pro in urban Philippines: **±1–3m**

---

## Phase 2: QGIS Project Setup

### Install QGIS (if not done)
- Download OSGeo4W Network Installer: https://qgis.org/en/site/forusers/download.html
- Select: `qgis-ltr` (3.38 LTR), `gdal`, `python3-core`
- Install to `C:\OSGeo4W64\`

### Create Project

1. **Open QGIS** → New Project
2. **Project → Properties → CRS** → Set to **EPSG:32651** (WGS 84 / UTM Zone 51N)
   - *Why UTM 51N?* Philippines standard, metric units, accurate for digitizing
3. **Save Project:** `research_data/geospatial_data/qgis_project.qgz`

### Add Basemap
- **Browser Panel** → `XYZ Tiles` → Right-click `OpenStreetMap` → `Add Layer to Project`
- Verify alignment with known features

---

## Phase 3: Georeference Master Plan

### Load Image
- `Raster → Georeferencer → Georeferencer`
- `File → Open Raster` → Select `EARIST CAVITE Master Site.png`

### Add GCPs
- Click `Add Point` tool
- Click recognizable feature on **master plan image**
- Enter coordinates from `gcp_reference.csv` (Lat/Lon → QGIS converts to project CRS)
- Repeat for **all 8–10 GCPs**, well-distributed across image

### Transformation Settings
- **Transformation Type:** `Polynomial 2` (for perspective distortion) or `Thin Plate Spline` (if many GCPs)
- **Resampling:** `Nearest Neighbour` (preserves sharp lines for digitizing)
- **Target CRS:** EPSG:32651 (project CRS)
- **Output:** `research_data/master_site_plan/georeferenced_master_plan.tif`

### Quality Check
- **Residual Error (RMS):** Should be **< 2 meters** in project CRS
- If > 2m: Add more GCPs, check for mis-identified points
- Visual check: Toggle georeferenced layer on/off vs OSM basemap

---

## Phase 4: Create Vector Layers (GeoPackage)

**Use GeoPackage (.gpkg)** — single file, multiple layers, supports CRS, better than Shapefile.

### Layer 1: Buildings (Polygon)
`Layer → Create Layer → New GeoPackage Layer`
- **Database:** `research_data/geospatial_data/campus_features.gpkg`
- **Layer Name:** `buildings`
- **Geometry Type:** Polygon
- **CRS:** EPSG:32651 (project CRS)
- **Fields:**

| Field Name | Type | Length | Purpose |
|---|---|---|---|
| `fid` | Integer | — | Auto PK |
| `master_plan_id` | Text | 50 | e.g., `building_016` |
| `official_name` | Text | 100 | Exact from master plan |
| `visible_name` | Text | 100 | From signage/field |
| `status` | Text | 20 | `existing`, `proposed`, `on_going`, `recently_accomplished`, `facility_project` |
| `category` | Text | 50 | `academic`, `multipurpose`, `canteen`, `clinic`, `dormitory`, `library`, `theater`, `laboratory`, `material_segregation`, `main_hall`, `office`, `hostel` |
| `source` | Text | 50 | `master_plan`, `field_gps`, `staff_interview` |
| `collection_date` | Date | — | YYYY-MM-DD |
| `estimated_accuracy_m` | Real | — | e.g., 3.5 |
| `confidence` | Text | 10 | `high`, `medium`, `low` |
| `verification_status` | Text | 20 | `official`, `field_verified`, `staff_confirmed`, `estimated`, `unverified` |
| `floors` | Integer | — | If visible |
| `notes` | Text | 500 | Discrepancies, observations |

### Layer 2: Pathways (LineString)
- **Layer Name:** `pathways`
- **Geometry Type:** LineString
- **Fields:**

| Field Name | Type | Purpose |
|---|---|---|
| `master_plan_id` | e.g., `path_class_001` or new ID |
| `name` | From master plan or field |
| `type` | `road_access`, `pathwalk`, `connector`, `perimeter`, `emergency` |
| `surface` | `concrete`, `asphalt`, `pavers`, `dirt`, `grass` |
| `width_m` | Measured or estimated |
| `condition` | `good`, `fair`, `poor`, `blocked` |
| `accessibility` | `wheelchair`, `partial`, `none` |
| `directionality` | `bidirectional`, `one_way` |
| `verification_status` | Same as buildings |

### Layer 3: Gates (Point)
- **Layer Name:** `gates`
- **Geometry Type:** Point
- **Fields:**

| Field Name | Type | Purpose |
|---|---|---|
| `master_plan_id` | `gate_001`, `gate_002` |
| `name` | `Main Gate`, `Secondary Access Gate` |
| `type` | `main`, `secondary`, `service`, `emergency` |
| `hours` | e.g., `6:00-22:00` |
| `access_control` | `guard`, `card`, `open`, `locked` |
| `vehicle_access` | Boolean |
| `pedestrian_access` | Boolean |
| `emergency_override` | Boolean |

### Layer 4: Landmarks (Point/Polygon)
- **Layer Name:** `landmarks`
- **Geometry Type:** Point (or Polygon for areas)
- **Fields:** `master_plan_id`, `name`, `type` (`creek`, `quadrangle`, `garden`, `plantation`, `pool`, `utility`), `designation_status` (`official`, `candidate`, `unverified`)

### Layer 5: Evacuation Areas (Polygon)
- **Layer Name:** `evacuation_areas`
- **Geometry Type:** Polygon
- **Fields:**

| Field Name | Type | Purpose |
|---|---|---|
| `master_plan_id` | `landmark_003` etc. or new |
| `name` | Official or candidate name |
| `designation_status` | `official`, `candidate`, `unverified` |
| `capacity_estimate` | Integer (people) |
| `assigned_buildings` | Text (comma-separated master_plan_ids) |
| `source` | `evacuation_plan_2026`, `posted_diagram`, `master_plan_visual`, `staff_interview` |
| `authorized_by` | Name/title if official |
| `authorization_date` | Date if official |

---

## Phase 5: Digitization Workflow

### Buildings
1. **Enable Snapping:** `Project → Snapping Options` → Enable for `buildings` layer, tolerance 10px
2. **Trace Building Footprints:**
   - Use georeferenced master plan as background
   - One polygon per building (not per room)
   - Snap corners where buildings touch
   - For "proposed" buildings: digitize footprint outline from plan
3. **Fill Attributes:** Use `master_plan_id` from `campus_buildings.json` as reference
4. **For clipped/uncertain labels:** Leave `official_name` NULL, note in `notes`

### Pathways
1. **Trace Path Centerlines:**
   - Follow visible path corridors on master plan
   - **Critical:** Create nodes at EVERY intersection (junction)
   - End pathways at building entrances (connect to building entrance points)
   - End pathways at gates
2. **Split at Intersections:** Use `Edit → Split Features` so each segment connects two nodes
3. **Field Validation:** After walkthrough, adjust geometry to match GPS traces

### Gates
- Place point at gate center on master plan
- Refine with field GPS

### Landmarks & Evacuation Areas
- Trace boundaries from master plan + field observation
- Evacuation areas: only digitize if officially designated OR clearly marked on posted diagrams

---

## Phase 6: Field GPS Validation

### After Campus Walkthrough

1. **Load Field GPS Data:**
   - `Layer → Add Layer → Add Delimited Text Layer`
   - Select `field_notes_YYYYMMDD.csv`
   - X=longitude, Y=latitude, CRS=EPSG:4326

2. **Compare Digitized vs. Field:**
   - Open attribute table of `buildings` layer
   - Add field GPS points as separate layer
   - Measure distance: `Vector → Analysis → Distance Matrix`
   - For each building entrance: if offset > 5m, adjust digitized geometry

3. **Update Verification Status:**
   - `field_verified` — GPS matches within 5m
   - `staff_confirmed` — EFMO staff verified location
   - `estimated` — No GPS, only master plan
   - `unverified` — Conflicting info

4. **Add Missing Features:**
   - Pathways not on master plan but walked in field
   - Entrances not visible on master plan
   - Accessibility features (ramps, tactile paving)

---

## Phase 7: Export for Flutter (GeoJSON EPSG:4326)

### Critical: Flutter/latlong2 requires **EPSG:4326 (WGS 84 Lat/Lon)**

### Export Each Layer
Right-click layer → `Export → Save Features As`
- **Format:** GeoJSON
- **File name:** `lib/src/features/map/data/campus_buildings.geojson` (etc.)
- **CRS:** **EPSG:4326** (override project CRS)
- **Coordinate precision:** 7 decimal places (~1cm)
- **Add to project:** No

### Required Export Files
| Flutter Path | Source Layer | Features |
|---|---|---|
| `campus_boundary.geojson` | `buildings` (dissolve) or separate boundary layer | 1 |
| `campus_buildings.geojson` | `buildings` | 20 |
| `campus_pathways.geojson` | `pathways` | 30–50 segments |
| `campus_gates.geojson` | `gates` | 2 |
| `campus_landmarks.geojson` | `landmarks` | 8+ |
| `evacuation_areas.geojson` | `evacuation_areas` | 2–5 |

### Verify GeoJSON
```bash
# Check structure
cat lib/src/features/map/data/campus_buildings.geojson | python -m json.tool | head -50

# Validate geometry
ogrinfo -so -al lib/src/features/map/data/campus_buildings.geojson
```

### Required Properties for Flutter Models

**CampusBuilding (must match `campus_building.dart`):**
```json
{
  "type": "Feature",
  "properties": {
    "id": "building_016",
    "osm_way_id": 0,
    "name": "EXISTING MAIN BUILDING HALL -",
    "building": "college",
    "category": "main_hall",
    "description": "Main administrative and academic building",
    "source": "master_plan_field_verified",
    "source_date": "2026-01-20",
    "verification_status": "field_verified",
    "centroid_lat": 14.300156,
    "centroid_lng": 121.007688
  },
  "geometry": {
    "type": "Polygon",
    "coordinates": [[[121.007688, 14.300156], ...]]
  }
}
```

**CampusPathway (must match `campus_pathway.dart`):**
```json
{
  "type": "Feature",
  "properties": {
    "id": "path_main_entrance",
    "name": "Main Entrance Path",
    "highway": "footway",
    "surface": "concrete",
    "width": 3.0,
    "category": "main_path",
    "description": "Primary pedestrian entrance from Congressional Road",
    "source": "master_plan_field_verified",
    "verification_status": "field_verified"
  },
  "geometry": {
    "type": "LineString",
    "coordinates": [[121.007750, 14.300200], [121.008000, 14.300400], ...]
  }
}
```

---

## Phase 8: Navigation Graph Preparation

The `NavigationService.buildGraph()` uses pathway coordinates to build a graph. **Quality of graph depends on pathway digitization.**

### Requirements for Reliable Routing

1. **True Junctions:** Every pathway intersection must be a shared vertex (not just crossing lines)
2. **Building Entrance Connections:** Pathways must END at building entrance points
3. **Gate Connections:** Pathways must connect to gate points
4. **No Dangling Ends:** Dead ends only at actual termini (gates, building entrances, boundary)
5. **Verified Segments Only:** Set `verification_status` = `field_verified` for routing; exclude `estimated`/`unverified`

### Post-Export Graph Validation Script (Python)

```python
# validate_graph.py
import json
from collections import defaultdict

def validate_geojson_topology(filepath):
    with open(filepath) as f:
        data = json.load(f)
    
    # Build coordinate → feature mapping
    coord_to_features = defaultdict(list)
    for feat in data['features']:
        geom = feat['geometry']
        if geom['type'] == 'LineString':
            coords = geom['coordinates']
            for i, coord in enumerate(coords):
                key = f"{coord[0]:.7f},{coord[1]:.7f}"
                coord_to_features[key].append((feat['properties']['id'], i))
    
    # Find junctions (coords shared by 2+ features)
    junctions = {k: v for k, v in coord_to_features.items() if len(v) >= 2}
    
    print(f"Total unique coordinates: {len(coord_to_features)}")
    print(f"Junctions (shared coords): {len(junctions)}")
    
    # Check for near-duplicates (within 1cm)
    # ... additional validation
    
    return junctions

if __name__ == '__main__':
    validate_geojson_topology('lib/src/features/map/data/campus_pathways.geojson')
```

---

## Coordinate Reference System Summary

| Stage | CRS | EPSG | Purpose |
|---|---|---|---|
| **Google Earth GCPs** | WGS 84 Lat/Lon | 4326 | Collection |
| **QGIS Project** | UTM Zone 51N | 32651 | Digitizing (metric, accurate) |
| **Field GPS** | WGS 84 Lat/Lon | 4326 | Collection |
| **GeoJSON Export** | WGS 84 Lat/Lon | **4326** | **Flutter requirement** |
| **Navigation Graph** | WGS 84 Lat/Lon | 4326 | Dart `latlong2` package |

**Always export final GeoJSON as EPSG:4326.** QGIS project can stay in 32651.

---

## Quality Checklist Before Flutter Integration

- [ ] All 20 master plan buildings digitized with correct `master_plan_id`
- [ ] Official names match `campus_buildings.json` exactly (including hyphens, case)
- [ ] Pathways form connected graph (no floating segments)
- [ ] Every pathway junction is a shared vertex
- [ ] Pathways connect to building entrances and gates
- [ ] All features have `verification_status` field populated
- [ ] GeoJSON exports are valid (test with `ogrinfo` or `python -m json.tool`)
- [ ] CRS is EPSG:4326 in all exported files
- [ ] Coordinate precision is 7 decimal places
- [ ] No duplicate features
- [ ] `campus_boundary.geojson` encompasses all features

---

## Next Steps After Export

1. **Update `MapDataService`** if new file names/structure
2. **Test in Flutter:** Run app, verify `MapScreen` loads all layers
3. **Test Routing:** Use `NavigationScreen` to compute route between two buildings
4. **Verify Evacuation Data:** Check `evacuation_areas.geojson` loads and displays
5. **Iterate:** Field discrepancies → QGIS adjustment → Re-export → Test

---

**Guide Version:** 1.0  
**Prepared for:** SAFENAV CAVITE — EARIST Cavite Campus  
**Dependencies:** QGIS 3.38 LTR, GDAL 3.8+, Google Earth Pro