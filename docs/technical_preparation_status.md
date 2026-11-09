# SAFENAV CAVITE — Technical Preparation Status

**Date:** 2026-11-09  
**Status:** Phase 1 Complete — Phase 2 Pending (QGIS/GDAL/Google Earth Pro Installation)

---

## Overview

This document summarizes all technical preparation work completed for the SAFENAV CAVITE project. The user handles campus fieldwork while all technical preparation (environment setup, tooling, documentation, scripts, schemas, architecture) is handled here.

---

## ✅ Phase 1: Environment Audit & Documentation — COMPLETE

### Core Documentation (5 files)
| File | Status | Description |
|------|--------|-------------|
| `docs/technical_environment_setup_report.md` | ✅ Complete | Full environment audit with installation requirements |
| `docs/campus_data_collection_checklist.md` | ✅ Complete | Quick-reference photo & GPS checklist for fieldwork |
| `docs/geospatial_data_guide.md` | ✅ Complete | Complete QGIS workflow (GCP → georeference → digitize → export) |
| `docs/evacuation_plan_processing_guide.md` | ✅ Complete | Photo organization, visual analysis, JSON schemas |
| `docs/fieldwork_guide.md` | ✅ Complete | Condensed one-page field reference |

### Integration Analysis (2 files)
| File | Status | Description |
|------|--------|-------------|
| `docs/master_site_plan_analysis.md` | ✅ Complete | Codex analysis of 20 building labels, roads, gates, landmarks |
| `docs/master_site_plan_integration_review.md` | ✅ Complete | Flutter architecture compatibility assessment |

### Fieldwork Templates (6 files)
| File | Status | Description |
|------|--------|-------------|
| `docs/templates/01_master_plan_data_request_letter.md` | ✅ Complete | Formal request for master plan data |
| `docs/templates/02_evacuation_plan_request_letter.md` | ✅ Complete | Formal request for evacuation plans |
| `docs/templates/03_campus_walkthrough_permission_request.md` | ✅ Complete | Permission request for campus access |
| `docs/templates/04_questions_checklist_for_campus_personnel.md` | ✅ Complete | Questions for EFMO/security staff |
| `docs/templates/05_campus_field_observation_template.md` | ✅ Complete | Printable field observation form |
| `docs/templates/06_geospatial_data_collection_template.csv` | ✅ Complete | Digital CSV template for GPS data |

---

## ✅ Phase 3: Research Workspace — COMPLETE

### Directory Structure Created
```
research_data/
├── master_site_plan/
│   ├── EARIST_CAVITE_Master_Site.png (4.3 MB)
│   └── gcp_reference_template.csv
├── evacuation_plans/           # Empty, ready for photos
├── building_photos/            # Empty, ready for photos
├── pathway_photos/             # Empty, ready for photos
├── campus_photos/              # Empty, ready for photos
├── geospatial_data/            # Empty, ready for QGIS project
├── field_observations/         # Empty, ready for GPS/voice
└── verification_records/       # Empty, ready for logs
    └── schemas/                # JSON schemas (see below)
```

### Photo Processing Scripts (2 files)
| File | Status | Description |
|------|--------|-------------|
| `research_data/organize_photos.py` | ✅ Complete | Automated sorting by filename convention |
| `research_data/extract_evacuation_data.py` | ✅ Complete | Template generator for evacuation JSON |

### JSON Schemas (4 files)
| File | Status | Description |
|------|--------|-------------|
| `research_data/schemas/building_information_schema.json` | ✅ Complete | Building metadata + entrances schema |
| `research_data/schemas/evacuation_floor_plan_schema.json` | ✅ Complete | Per-floor evacuation data schema |
| `research_data/schemas/pathway_observation_schema.json` | ✅ Complete | Pathway GPS trace + attributes schema |
| `research_data/schemas/assembly_point_schema.json` | ✅ Complete | Campus assembly points schema |

---

## ✅ Phase 6: GIS Configuration Documentation — COMPLETE

| File | Status | Description |
|------|--------|-------------|
| `research_data/geospatial_data/qgis_project_template.md` | ✅ Complete | Full QGIS project setup reference |
| `research_data/verify_gis_setup.py` | ✅ Complete | Post-installation verification script |

---

## ✅ Phase 7: Navigation Architecture Preparation — COMPLETE

| File | Status | Description |
|------|--------|-------------|
| `docs/navigation_architecture_adaptation.md` | ✅ Complete | Specific model changes, code replacements, priority order |

### Key Architecture Changes Documented:
1. **CampusBuilding** → Add `BuildingExit` model, extend `BuildingCategory` enum (11 new categories)
2. **CampusPathway** → Add verification fields, new `PathwayCategory` types, replace proximity-based graph builder
3. **NavigationService** → Add `NavigationMode` enum (normal/evacuation/accessibility), evacuation routing
4. **New Models** → `CampusGate`, `CampusLandmark`, `FloorPlan` (indoor navigation)
5. **EvacuationService** → New service connecting `EvacuationGraph` to routing
6. **MapDataService** → Updated to load new GeoJSON asset types

---

## 📊 Existing Flutter Assets (Verified)

### Map Data Models
- `lib/src/features/map/data/models/campus_building.dart` ✅ Freezed, 9 categories
- `lib/src/features/map/data/models/campus_pathway.dart` ✅ Freezed, 7 categories
- `lib/src/features/map/data/models/campus_boundary.dart` ✅ Freezed

### Navigation Models
- `lib/src/features/navigation/data/models/navigation_models.dart` ✅ Freezed, supports building/emergency/assembly destinations
- `lib/src/shared/models/evacuation_graph.dart` ✅ Comprehensive (nodes, edges, hazards, real-time occupancy)

### Services
- `lib/src/features/map/data/services/map_data_service.dart` ✅ Singleton, loads GeoJSON assets
- `lib/src/features/navigation/data/services/navigation_service.dart` ✅ Dijkstra with pathway categories

### GeoJSON Assets (Current - to be replaced)
- `lib/src/features/map/data/campus_boundary.geojson` (1 feature)
- `lib/src/features/map/data/campus_buildings.geojson` (4 generic "Building 1-4")
- `lib/src/features/map/data/campus_pathways.geojson` (11 OSM-derived features)

### Structured Inventory
- `assets/data/campus_buildings.json` ✅ 20 features matching master plan analysis, all coordinates: null

---

## ⏳ Phase 2: Tool Installation — PENDING APPROVAL

### Required Installations
| Tool | Version | Method | Size | Purpose |
|------|---------|--------|------|---------|
| **QGIS LTR** | 3.38.x | OSGeo4W Network Installer | ~1.5 GB | Georeferencing, digitization, CRS conversion, GeoJSON export |
| **GDAL** | 3.8.x | Bundled in OSGeo4W | — | `ogr2ogr`, `gdalinfo`, format conversion |
| **Google Earth Pro** | 7.3.x | Direct download | ~100 MB | GCP collection, satellite reference |

### Post-Install Python Packages
```bash
py -m pip install geopandas shapely rasterio pyproj fiona
```

---

## 🎯 Next Steps (After Tool Installation)

### Immediate (Automated)
1. Run `py research_data/verify_gis_setup.py` to verify installation
2. Create QGIS project using `research_data/geospatial_data/qgis_project_template.md`
3. Install Python GIS packages

### User Fieldwork (Parallel)
- Campus walkthrough with Android phone
- Photo collection per `docs/campus_data_collection_checklist.md`
- GPS waypoints per 60-second protocol
- Evacuation diagram photography

### Post-Fieldwork Processing
1. Transfer photos → run `organize_photos.py`
2. Extract evacuation data → run `extract_evacuation_data.py`
3. Fill JSON templates from photos
4. QGIS digitization + field GPS validation
5. GeoJSON export (EPSG:4326) → Flutter assets
6. Update `MapDataService` and `pubspec.yaml`
7. Test navigation + evacuation routing

---

## 🔑 Key Principles Maintained

- ✅ **Exact label preservation** — Master plan labels used verbatim (including hyphens, case, clipped text)
- ✅ **Source distinction** — Every feature tagged: `master_plan`, `field_gps`, `staff_interview`, `posted_diagram`, `official_plan`
- ✅ **Verification status** — `official`, `field_verified`, `staff_confirmed`, `estimated`, `unverified`
- ✅ **No coordinate fabrication** — All `coordinates: null` until field GPS or digitized
- ✅ **No implementation without approval** — Architecture documented, code not modified
- ✅ **Free tools only** — QGIS, GDAL, Google Earth Pro, GPS Essentials, OSMAnd, Python

---

## 📋 Quick Reference: What User Needs to Do

### Before Fieldwork
- [ ] Approve QGIS/GDAL/Google Earth Pro installation
- [ ] Install GPS Essentials + OSMAnd on Android phone
- [ ] Print `docs/fieldwork_guide.md` (or keep on phone)
- [ ] Bring: phone, power bank, pen, notebook, student ID

### During Fieldwork
- [ ] Photograph all 20 buildings (entrances, signage, 4 sides, floors)
- [ ] Photograph every posted evacuation diagram (7 shot types per floor)
- [ ] Trace major pathways with GPS track recording
- [ ] GPS at every entrance, gate, junction, assembly area (60-sec average)
- [ ] Investigate 3 uncertain labels (staff housing, eastern multipurpose, red fox dragon)
- [ ] Record voice notes for discrepancies

### After Fieldwork
- [ ] Transfer photos to laptop folders
- [ ] Export GPS (GPX + CSV)
- [ ] Run photo organization script
- [ ] Fill evacuation JSON templates

---

**Prepared by:** Technical Preparation Agent  
**For:** SAFENAV CAVITE — EARIST Cavite Campus  
**All files created in:** `C:\SafeNav\safenav\`