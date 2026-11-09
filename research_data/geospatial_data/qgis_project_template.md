# SAFENAV CAVITE — QGIS Project Template

**Reference document for creating the QGIS project when QGIS LTR is installed.**

---

## Project Setup

### 1. Create New Project
- **File → New**
- **Project → Properties → General**
  - **Project title:** `SAFENAV CAVITE Campus Mapping`
  - **Project file:** `research_data/geospatial_data/qgis_project.qgz`
- **Project → Properties → CRS**
  - **Project CRS:** **EPSG:32651** (WGS 84 / UTM Zone 51N)
  - **Units:** Meters
  - ✅ **Enable 'on the fly' CRS transformation**

### 2. Save Project
- **File → Save As** → `research_data/geospatial_data/qgis_project.qgz`

---

## Basemap Layers

### Add OpenStreetMap Basemap
- **Browser Panel** → `XYZ Tiles` → Right-click `OpenStreetMap` → `Add Layer to Project`
- Rename layer to: `OSM Basemap`
- Move to bottom of layer stack

### Optional: Google Satellite (for reference)
- **Browser Panel** → `XYZ Tiles` → Right-click → `New Connection`
- **Name:** `Google Satellite`
- **URL:** `https://mt1.google.com/vt/lyrs=s&x={x}&y={y}&z={z}`
- Add to project, rename to `Google Satellite`

---

## Master Plan Georeferencing

### Load Master Plan Image
- **Raster → Georeferencer → Georeferencer**
- **File → Open Raster** → `research_data/master_site_plan/EARIST_CAVITE_Master_Site.png`

### Add Ground Control Points (GCPs)
Use `research_data/master_site_plan/gcp_reference_template.csv` as reference.

For each GCP:
1. Click **Add Point** tool
2. Click recognizable feature on master plan image
3. Enter coordinates from GCP CSV (Lat/Lon in EPSG:4326)
4. QGIS auto-converts to project CRS (EPSG:32651)

**Minimum 8 GCPs, well-distributed:**
| GCP ID | Description | Master Plan Location |
|--------|-------------|---------------------|
| GCP_01 | Main Gate post | Lower-left frontage |
| GCP_02 | Main Building Hall NW corner | Lower/southern, along road |
| GCP_03 | Faculty Building NE corner | Central-west cluster |
| GCP_04 | Existing Quadrangle center | Central/lower-middle |
| GCP_05 | Creek crossing | Upper/right edge |
| GCP_06 | Congressional Road intersection | Lower/southern edge |
| GCP_07 | Central pathway junction | Central area |
| GCP_08 | South boundary marker | Lower edge |
| GCP_09 | Research Building SE corner | Central-west |
| GCP_10 | CHTM Building NW corner | Central-west |

### Transformation Settings
- **Settings → Transformation Settings**
  - **Transformation type:** `Polynomial 2` (for perspective distortion)
  - **Resampling method:** `Nearest Neighbour` (preserves sharp lines)
  - **Target CRS:** EPSG:32651
  - **Output raster:** `research_data/master_site_plan/georeferenced_master_plan.tif`
  - ✅ **Load in QGIS when done**

### Quality Check
- **Residual Error (RMS):** Should be **< 2 meters** in project CRS
- If > 2m: Add more GCPs, check for mis-identified points
- Visual check: Toggle georeferenced layer on/off vs OSM basemap

---

## Vector Layers (GeoPackage)

### Create GeoPackage Database
- **Layer → Create Layer → New GeoPackage Layer**
- **Database:** `research_data/geospatial_data/campus_features.gpkg`

### Layer 1: Buildings (Polygon)
- **Layer Name:** `buildings`
- **Geometry Type:** Polygon
- **CRS:** EPSG:32651
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
- **CRS:** EPSG:32651
- **Fields:**

| Field Name | Type | Purpose |
|---|---|---|
| `fid` | Integer | Auto PK |
| `master_plan_id` | Text | `path_class_001` or new ID |
| `name` | Text | From master plan or field |
| `type` | Text | `road_access`, `pathwalk`, `connector`, `perimeter`, `emergency`, `service`, `internal` |
| `surface` | Text | `concrete`, `asphalt`, `pavers`, `dirt`, `grass`, `mixed` |
| `width_m` | Real | Measured or estimated |
| `condition` | Text | `good`, `fair`, `poor`, `blocked`, `under_construction` |
| `accessibility` | Text | `wheelchair`, `partial`, `none` |
| `directionality` | Text | `bidirectional`, `one_way`, `varies` |
| `verification_status` | Text | Same as buildings |
| `source` | Text | `master_plan`, `field_gps_trace`, `staff_interview` |
| `collection_date` | Date | YYYY-MM-DD |
| `notes` | Text | Observations |

### Layer 3: Gates (Point)
- **Layer Name:** `gates`
- **Geometry Type:** Point
- **CRS:** EPSG:32651
- **Fields:**

| Field Name | Type | Purpose |
|---|---|---|
| `fid` | Integer | Auto PK |
| `master_plan_id` | Text | `gate_001`, `gate_002` |
| `name` | Text | `Main Gate`, `Secondary Access Gate` |
| `type` | Text | `main`, `secondary`, `service`, `emergency` |
| `hours` | Text | e.g., `6:00-22:00` |
| `access_control` | Text | `guard`, `card`, `open`, `locked` |
| `vehicle_access` | Boolean | |
| `pedestrian_access` | Boolean | |
| `emergency_override` | Boolean | |
| `source` | Text | `master_plan`, `field_gps`, `staff_interview` |
| `verification_status` | Text | Same as buildings |
| `notes` | Text | |

### Layer 4: Landmarks (Point/Polygon)
- **Layer Name:** `landmarks`
- **Geometry Type:** Point (or Polygon for areas)
- **CRS:** EPSG:32651
- **Fields:**

| Field Name | Type | Purpose |
|---|---|---|
| `fid` | Integer | Auto PK |
| `master_plan_id` | Text | `landmark_001` etc. |
| `name` | Text | e.g., `Creek`, `Existing Quadrangle` |
| `type` | Text | `creek`, `quadrangle`, `garden`, `plantation`, `pool`, `utility` |
| `designation_status` | Text | `official`, `candidate`, `unverified` |
| `source` | Text | `master_plan`, `field_gps`, `staff_interview` |
| `verification_status` | Text | Same as buildings |
| `notes` | Text | |

### Layer 5: Evacuation Areas (Polygon)
- **Layer Name:** `evacuation_areas`
- **Geometry Type:** Polygon
- **CRS:** EPSG:32651
- **Fields:**

| Field Name | Type | Purpose |
|---|---|---|
| `fid` | Integer | Auto PK |
| `master_plan_id` | Text | `landmark_003` etc. or new |
| `name` | Text | Official or candidate name |
| `designation_status` | Text | `official`, `candidate`, `unverified` |
| `capacity_estimate` | Integer | People |
| `assigned_buildings` | Text | Comma-separated master_plan_ids |
| `source` | Text | `evacuation_plan`, `posted_diagram`, `master_plan_visual`, `staff_interview` |
| `authorized_by` | Text | Name/title if official |
| `authorization_date` | Date | If official |
| `verification_status` | Text | Same as buildings |
| `notes` | Text | |

### Layer 6: Campus Boundary (Polygon)
- **Layer Name:** `campus_boundary`
- **Geometry Type:** Polygon
- **CRS:** EPSG:32651
- **Fields:**

| Field Name | Type | Purpose |
|---|---|---|
| `fid` | Integer | Auto PK |
| `name` | Text | `EARIST Cavite Campus` |
| `source` | Text | `master_plan`, `legal_survey` |
| `verification_status` | Text | Same as buildings |
| `notes` | Text | |

---

## Digitization Workflow

### Enable Snapping
- **Project → Snapping Options**
- ✅ **Enable Snapping**
- **Default snapping tolerance:** 10 pixels
- ✅ **Snap to:** Vertex and Segment
- Add `buildings`, `pathways`, `gates` layers to snapping config

### Digitize Buildings
1. **Select `buildings` layer** → Toggle Editing (pencil icon)
2. **Add Polygon Feature** tool
3. **Trace building footprints** from georeferenced master plan
   - One polygon per building (not per room)
   - Snap corners where buildings touch
   - For "proposed" buildings: digitize footprint outline from plan
4. **Fill Attributes:**
   - Use `master_plan_id` from `campus_buildings.json` as reference
   - `official_name` must match exactly (including hyphens, case)
   - For clipped/uncertain labels: leave `official_name` NULL, note in `notes`
5. **Save Layer Edits**

### Digitize Pathways
1. **Select `pathways` layer** → Toggle Editing
2. **Add Line Feature** tool
3. **Trace Path Centerlines:**
   - Follow visible path corridors on master plan
   - **Critical:** Create vertices at EVERY intersection (junction)
   - End pathways at building entrances (snap to building vertices)
   - End pathways at gates
4. **Split at Intersections:** Use `Edit → Split Features` so each segment connects two nodes
5. **Fill Attributes**
6. **Save Layer Edits**

### Digitize Gates
1. **Select `gates` layer** → Toggle Editing
2. **Add Point Feature** tool
3. Place point at gate center on master plan
4. Refine with field GPS after walkthrough

### Digitize Landmarks & Evacuation Areas
1. Trace boundaries from master plan + field observation
2. Evacuation areas: only digitize if officially designated OR clearly marked on posted diagrams

---

## Field GPS Validation (After Walkthrough)

### Load Field GPS Data
- **Layer → Add Layer → Add Delimited Text Layer**
- Select `research_data/field_observations/field_notes_YYYYMMDD.csv`
- **X field:** longitude, **Y field:** latitude
- **CRS:** EPSG:4326

### Compare Digitized vs. Field
1. Open attribute table of `buildings` layer
2. Add field GPS points as separate layer (style as red circles)
3. **Vector → Analysis → Distance Matrix**
   - Input: building entrance points (from digitized)
   - Target: field GPS points
   - Output: CSV with distances
4. For each building entrance: if offset > 5m, adjust digitized geometry

### Update Verification Status
- `field_verified` — GPS matches within 5m
- `staff_confirmed` — EFMO staff verified location
- `estimated` — No GPS, only master plan
- `unverified` — Conflicting info

### Add Missing Features
- Pathways not on master plan but walked in field
- Entrances not visible on master plan
- Accessibility features (ramps, tactile paving)

---

## Export for Flutter (GeoJSON EPSG:4326)

### Critical: Flutter/latlong2 requires **EPSG:4326 (WGS 84 Lat/Lon)**

### Export Each Layer
Right-click layer → **Export → Save Features As**
- **Format:** GeoJSON
- **File name:** `lib/src/features/map/data/<layer_name>.geojson`
- **CRS:** **EPSG:4326** (override project CRS)
- **Coordinate precision:** 7 decimal places (~1cm)
- **Add to project:** No

### Required Export Files

| Flutter Path | Source Layer | Expected Features |
|---|---|---|
| `campus_boundary.geojson` | `campus_boundary` or dissolve `buildings` | 1 |
| `campus_buildings.geojson` | `buildings` | 20 |
| `campus_pathways.geojson` | `pathways` | 30–50 segments |
| `campus_gates.geojson` | `gates` | 2 |
| `campus_landmarks.geojson` | `landmarks` | 8+ |
| `evacuation_areas.geojson` | `evacuation_areas` | 2–5 |

### Verify GeoJSON
```bash
# Check structure
cat lib/src/features/map/data/campus_buildings.geojson | python -m json.tool | head -50

# Validate geometry with GDAL (after OSGeo4W install)
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
    "centroid_lng": 121.007688,
    "floors": 3,
    "exits": [
      {
        "exit_id": "EXIT_BLDG016_FL01_01",
        "type": "main",
        "description": "Main entrance facing Congressional Road",
        "accessibility": "wheelchair",
        "leads_to": "PATH_MAIN_ENTRANCE",
        "signage": "illuminated"
      }
    ]
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
    "verification_status": "field_verified",
    "access_restriction": "open",
    "closure_status": "open",
    "directionality": "bidirectional",
    "condition": "good",
    "accessibility": "wheelchair"
  },
  "geometry": {
    "type": "LineString",
    "coordinates": [[121.007750, 14.300200], [121.008000, 14.300400], ...]
  }
}
```

---

## Quality Checklist Before Flutter Integration

- [ ] All 20 master plan buildings digitized with correct `master_plan_id`
- [ ] Official names match `campus_buildings.json` exactly (including hyphens, case)
- [ ] Pathways form connected graph (no floating segments)
- [ ] Every pathway junction is a shared vertex (exact coordinate match)
- [ ] Pathways connect to building entrances and gates
- [ ] All features have `verification_status` field populated
- [ ] GeoJSON exports are valid (test with `ogrinfo` or `python -m json.tool`)
- [ ] CRS is EPSG:4326 in all exported files
- [ ] Coordinate precision is 7 decimal places
- [ ] No duplicate features
- [ ] `campus_boundary.geojson` encompasses all features

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

## Post-Export Graph Validation (Python)

```python
# validate_graph.py
# Run after GeoJSON export to verify topology
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

## Next Steps After Export

1. **Update `MapDataService`** if new file names/structure
2. **Test in Flutter:** Run app, verify `MapScreen` loads all layers
3. **Test Routing:** Use `NavigationScreen` to compute route between two buildings
4. **Verify Evacuation Data:** Check `evacuation_areas.geojson` loads and displays
5. **Iterate:** Field discrepancies → QGIS adjustment → Re-export → Test

---

**Template Version:** 1.0  
**Prepared for:** SAFENAV CAVITE — EARIST Cavite Campus  
**Dependencies:** QGIS 3.38 LTR, GDAL 3.8+, Google Earth Pro