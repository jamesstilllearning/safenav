# SAFENAV CAVITE – Technical Environment Setup Report

**Date:** 2026-11-09  
**Environment:** Windows 10 Pro (10.0.19045)  
**Project Root:** `C:\SafeNav\safenav`

---

## Executive Summary

| Category | Status | Notes |
|----------|--------|-------|
| **Flutter/Dart** | ✅ Fully Configured | Flutter 3.47.9, Dart 3.13.7 (stable) |
| **VS Code** | ✅ Installed | Version 1.145.2 |
| **Git** | ✅ Installed | Version 2.56.0.windows.4 |
| **Python** | ✅ Available via `py` launcher | Python 3.15.2 (no `python` in PATH) |
| **QGIS** | ❌ Not Installed | Required for GIS processing |
| **GDAL** | ❌ Not Installed | Required for geospatial conversion |
| **Google Earth Pro** | ❌ Not Installed | Required for GCP collection |
| **Python GIS Packages** | ❌ Minimal | Only `pip` installed |

---

## Detailed Audit Results

### 1. Flutter & Dart SDK ✅
```
Flutter 3.47.9 • channel stable
Dart SDK version: 3.13.7 (stable)
```
- **Status:** Fully functional, latest stable channel
- **Project:** `safenav` Flutter project compiles and runs
- **Dependencies:** All packages in `pubspec.yaml` resolved (`pubspec.lock` present)
- **No action needed**

### 2. Visual Studio Code ✅
```
Version: 1.145.2 (x64)
Commit: c4453f8ea430795f941c1b2ff6c9321135a74a02
```
- **Status:** Installed and functional
- **Extensions to verify:** Flutter, Dart, GitLens (recommended)
- **No action needed**

### 3. Git ✅
```
git version 2.56.0.windows.4
```
- **Status:** Installed and in PATH
- **Repository:** Not yet initialized (no `.git` folder in project root)
- **Recommendation:** Initialize git repo after environment setup

### 4. Python ✅ (with caveat)
```
Python 3.15.2 (via `py` launcher)
pip 26.2.2
```
- **Status:** Python 3.15.2 installed, accessible via `py` launcher
- **Issue:** `python` command not in PATH (Windows default behavior)
- **Workaround:** Use `py` or `py -3` for all Python commands
- **Packages installed:** Only `pip` (no GIS packages yet)

### 5. QGIS ❌
- **Status:** Not installed
- **Checked locations:**
  - `C:\Program Files\QGIS` — Not found
  - `C:\OSGeo4W` / `C:\OSGeo4W64` — Not found
  - PATH — Not found
- **Required for:** Georeferencing, digitization, CRS conversion, GeoJSON export
- **Action needed:** Install QGIS LTR (Long Term Release) via OSGeo4W

### 6. GDAL ❌
- **Status:** Not installed (standalone)
- **Note:** GDAL will be installed as part of QGIS/OSGeo4W installation
- **Required for:** `ogr2ogr`, `gdalinfo`, format conversion, coordinate transformation
- **Action needed:** Install via OSGeo4W (bundled with QGIS)

### 7. Google Earth Pro ❌
- **Status:** Not installed
- **Checked locations:**
  - `C:\Program Files\Google\Google Earth Pro` — Not found
  - `C:\Program Files (x86)\Google\Google Earth Pro` — Not found
- **Required for:** Ground Control Point (GCP) collection, satellite imagery reference
- **Action needed:** Download and install from Google Earth website

### 8. Image Processing Utilities
- **Status:** Windows built-in tools only (Photos, Paint)
- **Recommendation:** Install ImageMagick (free) for batch processing if needed
- **Not critical** — Android phone + manual organization sufficient for Phase 4

---

## Existing Project Assets

### Master Site Plan (Source Image)
- **File:** `C:\SafeNav\safenav\EARIST CAVITE Master Site.png`
- **Size:** 4.5 MB (2048 × 1391 px based on analysis)
- **Format:** PNG
- **Use:** Primary reference for georeferencing in QGIS

### Codex Analysis Documents
- `docs/master_site_plan_analysis.md` — Complete building inventory & spatial analysis
- `docs/master_site_plan_integration_review.md` — Integration compatibility assessment
- `docs/prerequisites_acquisition_and_fieldwork_guide.md` — Fieldwork methodology
- `assets/data/campus_buildings.json` — Structured inventory (20 features)

### Existing Flutter Map Data (GeoJSON)
| File | Size | Features |
|------|------|----------|
| `lib/src/features/map/data/campus_boundary.geojson` | 1.3 KB | 1 (campus boundary polygon) |
| `lib/src/features/map/data/campus_buildings.geojson` | 3.3 KB | 4 (generic "Building 1–4") |
| `lib/src/features/map/data/campus_pathways.geojson` | 7.5 KB | 11 (pathways with categories) |

**Note:** Current GeoJSON uses generic OSM-derived data, NOT the master plan labels. These will be replaced after fieldwork.

### Flutter Project Structure
```
lib/
├── src/
│   ├── features/
│   │   ├── map/
│   │   │   ├── data/
│   │   │   │   ├── models/          # CampusBuilding, CampusPathway, CampusBoundary
│   │   │   │   ├── services/        # MapDataService, TileCacheService
│   │   │   │   └── *.geojson        # Existing map data (to be replaced)
│   │   │   └── presentation/
│   │   ├── navigation/
│   │   │   ├── data/
│   │   │   │   ├── models/          # NavigationRoute, NavigationDestination, etc.
│   │   │   │   └── services/        # NavigationService (Dijkstra)
│   │   │   └── presentation/
│   │   └── auth/
│   ├── core/
│   └── shared/models/               # EvacuationGraph, EvacuationNode, EvacuationEdge
```

---

## Phase 2: Required Installations (Awaiting Approval)

### Priority 1: QGIS LTR + GDAL (via OSGeo4W)
| Tool | Version | Installer | Size | Purpose |
|------|---------|-----------|------|---------|
| **QGIS LTR** | 3.38.x (current LTR) | OSGeo4W Network Installer | ~1.5 GB | Georeferencing, digitization, CRS conversion, GeoJSON export |
| **GDAL** | 3.8.x (bundled) | Included in OSGeo4W | — | `ogr2ogr`, `gdalinfo`, format conversion |
| **Python 3.x** | Bundled | Included in OSGeo4W | — | QGIS Python console, processing scripts |

**Installation Method:** OSGeo4W Network Installer (64-bit)
- Download: https://qgis.org/en/site/forusers/download.html
- Select: `qgis-ltr` (Long Term Release), `gdal`, `python3-core`
- Adds to PATH automatically

**Approval Required:** Yes (system-level installation, ~1.5 GB download)

### Priority 2: Google Earth Pro
| Tool | Version | Installer | Size | Purpose |
|------|---------|-----------|------|---------|
| **Google Earth Pro** | Latest (7.3.x) | Direct download | ~100 MB | GCP collection, satellite reference, KML export |

**Installation Method:** Direct download from https://earth.google.com/earth/download/ep.html
- Run installer as administrator
- No special configuration needed

**Approval Required:** Yes (system-level installation)

### Priority 3: Python GIS Packages (Post-QGIS)
| Package | Purpose | Install Command |
|---------|---------|-----------------|
| `geopandas` | GeoDataFrame operations | `py -m pip install geopandas` |
| `shapely` | Geometry operations | `py -m pip install shapely` |
| `rasterio` | Raster processing | `py -m pip install rasterio` |
| `pyproj` | CRS transformations | `py -m pip install pyproj` |
| `fiona` | Vector I/O | `py -m pip install fiona` |

**Note:** These require GDAL (from OSGeo4W) to be installed first.

**Approval Required:** No (user-space pip install)

### Priority 4: VS Code Extensions (Recommended)
| Extension | ID | Purpose |
|-----------|----|---------|
| Flutter | `Dart-Code.flutter` | Flutter development |
| Dart | `Dart-Code.dart` | Dart language support |
| GitLens | `eamodio.gitlens` | Enhanced Git workflow |
| QGIS Tools | `qgis.qgis-tools` | QGIS integration (optional) |

**Approval Required:** No (VS Code marketplace)

---

## Phase 3: Research Workspace Structure (To Create)

```
C:\SafeNav\safenav\
├── research_data/
│   ├── master_site_plan/
│   │   ├── EARIST_CAVITE_Master_Site.png          (copy of source)
│   │   ├── georeferenced_master_plan.tif          (QGIS output)
│   │   └── gcp_reference.csv                      (from Google Earth)
│   ├── evacuation_plans/
│   │   ├── building_01/
│   │   ├── building_02/
│   │   └── ... (per building)
│   ├── campus_photos/
│   ├── building_photos/
│   ├── pathway_photos/
│   ├── geospatial_data/
│   │   ├── qgis_project.qgz
│   │   ├── buildings.gpkg
│   │   ├── pathways.gpkg
│   │   ├── gates.gpkg
│   │   ├── landmarks.gpkg
│   │   ├── evacuation_areas.gpkg
│   │   └── exports/                               (GeoJSON/CSV for Flutter)
│   ├── field_observations/
│   │   ├── field_notes_YYYYMMDD.csv
│   │   └── voice_notes/
│   └── verification_records/
│       ├── uncertain_labels_resolution.md
│       └── discrepancy_log.md
├── docs/
│   ├── fieldwork_guide.md                         (already exists)
│   ├── campus_data_collection_checklist.md        (to create)
│   ├── geospatial_data_guide.md                   (to create)
│   ├── evacuation_plan_processing_guide.md        (to create)
│   ├── technical_environment_setup_report.md      (this file)
│   ├── master_site_plan_analysis.md
│   ├── master_site_plan_integration_review.md
│   └── prerequisites_acquisition_and_fieldwork_guide.md
├── assets/
│   ├── data/
│   │   ├── campus_buildings.json                  (Codex inventory)
│   │   └── campus_master_plan_reference.json      (to create from QGIS)
│   ├── maps/
│   │   └── master_plan_georeferenced.tif          (for reference layer)
│   └── floor_plans/
│       ├── building_01/
│       └── ... (per building)
└── lib/src/features/map/data/
    ├── campus_boundary.geojson                    (to regenerate)
    ├── campus_buildings.geojson                   (to regenerate)
    ├── campus_pathways.geojson                    (to regenerate)
    ├── campus_gates.geojson                       (new)
    ├── campus_landmarks.geojson                   (new)
    └── evacuation_areas.geojson                   (new)
```

---

## Phase 4: Fieldwork Preparation (Ready)

The following guides already exist:
- `docs/prerequisites_acquisition_and_fieldwork_guide.md` — Complete methodology
- `docs/templates/05_campus_field_observation_template.md` — Printable field form
- `docs/templates/06_geospatial_data_collection_template.csv` — Digital CSV template

**Needed:** `docs/campus_data_collection_checklist.md` — Quick-reference photo checklist

---

## Phase 5: Photo Processing Workflow (To Prepare)

**Tools Available:** Python (via `py`), potential for scripts
**Workflow:**
1. Transfer photos from Android → `research_data/building_photos/`, `research_data/evacuation_plans/`, etc.
2. Run organization script (to create) → sorts by building/floor based on filename convention
3. Manual review → identify readable text, exits, symbols
4. Structured extraction → JSON schemas for building info & evacuation floor plans
5. Output → `research_data/verification_records/extracted_data.json`

**Schemas to Define:**
- Building Information Schema
- Evacuation Floor Plan Schema
- Pathway Observation Schema

---

## Phase 6: GIS Environment (Pending QGIS Install)

**QGIS Project Setup (after install):**
1. Create project: `research_data/geospatial_data/qgis_project.qgz`
2. Set Project CRS: **EPSG:32651** (WGS 84 / UTM Zone 51N — Philippines)
3. Add Basemap: OSM XYZ Tiles
4. Georeference Master Plan: `Raster → Georeferencer` using GCPs from Google Earth
5. Create Vector Layers (GeoPackage):
   - `buildings` (Polygon) — fields: `id`, `official_name`, `status`, `source`, `confidence`
   - `pathways` (LineString) — fields: `id`, `name`, `type`, `surface`, `width`, `accessibility`
   - `gates` (Point) — fields: `id`, `name`, `type`, `hours`, `access_control`
   - `landmarks` (Point/Polygon) — fields: `id`, `name`, `type`
   - `evacuation_areas` (Polygon) — fields: `id`, `name`, `designation_status`, `capacity`
6. Digitize all features from georeferenced master plan + field GPS
7. Export to GeoJSON (EPSG:4326) for Flutter: `lib/src/features/map/data/*.geojson`

---

## Phase 7: Navigation Architecture (Existing Components)

### Reusable Components ✅
| Component | File | Status |
|-----------|------|--------|
| **Map Engine** | `flutter_map` + `flutter_map_tile_caching` | Working |
| **MapDataService** | `lib/src/features/map/data/services/map_data_service.dart` | Loads GeoJSON |
| **CampusBuilding Model** | `lib/src/features/map/data/models/campus_building.dart` | Freezed, needs category updates |
| **CampusPathway Model** | `lib/src/features/map/data/models/campus_pathway.dart` | Freezed, needs verification fields |
| **NavigationService** | `lib/src/features/navigation/data/services/navigation_service.dart` | Dijkstra implemented |
| **Navigation Models** | `lib/src/features/navigation/data/models/navigation_models.dart` | Freezed, supports building/emergency/assembly |
| **EvacuationGraph Model** | `lib/src/shared/models/evacuation_graph.dart` | Comprehensive, needs data |
| **MapScreen** | `lib/src/features/map/presentation/screens/map_screen.dart` | Layers, selection, routing |
| **NavigationScreen** | `lib/src/features/navigation/presentation/screens/navigation_screen.dart` | Search, emergency actions |

### Needed Adaptations 🔧
| Area | Required Changes |
|------|------------------|
| **Building Categories** | Add: `multipurpose`, `canteen`, `clinic`, `dormitory`, `theater`, `laboratory`, `material_segregation` |
| **Pathway Verification** | Add fields: `verification_status`, `access_restriction`, `closure_status`, `directionality` |
| **Graph Builder** | Replace 5m/50m proximity rules with verified junctions from digitized pathways |
| **Evacuation Routing** | Connect `EvacuationGraph` to `NavigationService`; add `evacuation_mode` |
| **Indoor Navigation** | New: Floor plan models, indoor routing, floor transitions |

---

## Phase 8: Validation & Quality Control (Schema)

### Data Source Classification
Every feature in the final GeoJSON must include:
```json
{
  "properties": {
    "source": "master_plan_2023 | field_gps_2026-01-20 | staff_interview_eng_reyes | posted_evacuation_diagram | google_earth_gcp",
    "collection_method": "digitized | gps_average | gps_single | verbal | photographed",
    "collection_date": "2026-01-20",
    "estimated_accuracy_m": 3.5,
    "confidence": "high | medium | low",
    "verification_status": "official | field_verified | staff_confirmed | estimated | unverified",
    "master_plan_ref_id": "building_016",
    "notes": "Main gate aligns with entrance. Guard confirms 6AM-10PM."
  }
}
```

### Evacuation Data Special Handling
| Designation Status | Meaning | App Display |
|--------------------|---------|-------------|
| `official` | Written in approved evacuation plan, signed by Safety Officer | ✅ "Assembly Point A" |
| `candidate` | Visible open space, master plan suggests, no official designation | ⚠️ "Potential Assembly Area (unverified)" |
| `unverified` | From photo/diagram, not cross-checked | ❓ "From Posted Diagram" |

---

## Next Steps & Approvals Required

### Immediate (Your Approval Needed)
1. **Install QGIS LTR + GDAL via OSGeo4W** (~1.5 GB, system install)
2. **Install Google Earth Pro** (~100 MB, system install)

### After Approval (Automated)
3. Install Python GIS packages via `py -m pip`
4. Create research workspace directory structure
5. Set up QGIS project with master plan georeferencing
6. Create fieldwork quick-reference checklist
7. Prepare photo processing Python scripts
8. Define JSON schemas for building/evacuation data

### Your Fieldwork (After Setup Complete)
9. Campus walkthrough with Android phone
10. Transfer photos to organized folders
11. Process photos → structured JSON
12. Field GPS → QGIS validation
13. Final GeoJSON export for Flutter

---

## Files to Generate Next

1. ✅ `docs/technical_environment_setup_report.md` (this file)
2. ⏳ `docs/campus_data_collection_checklist.md`
3. ⏳ `docs/geospatial_data_guide.md`
4. ⏳ `docs/evacuation_plan_processing_guide.md`
5. ⏳ `docs/fieldwork_guide.md` (enhanced quick-reference version)
6. ⏳ Research workspace directory structure
7. ⏳ QGIS project template
8. ⏳ Photo processing Python scripts
9. ⏳ JSON schemas for extracted data

---

**Prepared by:** Technical Environment Audit  
**Status:** Phase 1 Complete — Awaiting Approval for Phase 2 Installations