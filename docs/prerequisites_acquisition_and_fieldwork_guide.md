# SAFENAV CAVITE — Prerequisites Acquisition & Fieldwork Guide

*A practical, step-by-step guide for a college student to obtain, verify, and prepare authoritative campus data for the SAFENAV CAVITE navigation and evacuation system.*

---

## TABLE OF CONTENTS

1. [Overview & Philosophy](#overview--philosophy)
2. [Phase 1: Obtaining Authoritative Geospatial Data](#phase-1-obtaining-authoritative-geospatial-data)
3. [Phase 2: Obtaining the Official Evacuation Plan](#phase-2-obtaining-the-official-evacuation-plan)
4. [Phase 3: Conducting a Campus Walkthrough](#phase-3-conducting-a-campus-walkthrough)
5. [Phase 4: Resolving Uncertain Building Labels](#phase-4-resolving-uncertain-building-labels)
5. [Phase 5: Free Tools & Recommended Technology Stack](#phase-5-free-tools--recommended-technology-stack)
7. [Phase 6: Data Quality & Validation](#phase-6-data-quality--validation)
8. [Phase 7: Execution Roadmap](#phase-7-execution-roadmap)
9. [Phase 8: Document Templates](#phase-8-document-templates)
10. [First Three Actions — Quick Start](#first-three-actions--quick-start)

---

## OVERVIEW & PHILOSOPHY

### Core Principles

| Principle | What It Means for You |
|-----------|----------------------|
| **Official > Estimated** | Never use Google Maps pins, phone GPS, or visual estimates as authoritative coordinates. They are starting points only. |
| **Document Everything** | Record *source*, *date*, *method*, and *confidence* for every data point. |
| **Separate Layers** | Keep three data layers distinct: (1) Official documents, (2) Field observations, (3) Derived/estimated data. |
| **No Silent Assumptions** | If a label is clipped, record it as clipped. If a pathway is proposed, record it as proposed. |
| **Student-Friendly** | Use free tools, public access, and academic courtesy. No professional survey equipment required. |

### Your Data Lineage (What to Track for Every Feature)

```
Feature ID → Source Document (e.g., "EARIST Master Plan 2023, p.3")
           → Field Verification Date (e.g., "2026-01-15, walkthrough with Eng. Santos")
           → GPS Reading (e.g., "Phone GPS, ±5m, 14.300521, 121.010151")
           → Confidence (High/Medium/Low)
           → Status (Official/Verified/Estimated/Proposed/Uncertain)
```

---

## PHASE 1: OBTAINING AUTHORITATIVE GEOSPATIAL DATA

### 1.1 Which Campus Offices to Approach

| Office | Why They Matter | Likely Data They Hold |
|--------|----------------|----------------------|
| **Office of the Campus Administrator / Director** | Top-level approval; can authorize data release | Master site plans, campus development plans, official correspondence |
| **Engineering & Facilities Management Office (EFMO)** | *Primary source* for building footprints, utilities, pathways | CAD drawings (DWG/DXF), as-built plans, site development plans, utility maps |
| **Planning & Development Office** | Long-term campus planning, master plans | Master site plan (original CAD/GIS), zoning maps, proposed projects |
| **Registrar / Academic Affairs** | Building names, room assignments, current usage | Official building registry, department locations |
| **Campus Security / Safety Office** | Gates, access control, restricted areas | Gate locations, access policies, security camera locations |

**Start with EFMO** — they are most likely to have digital CAD/GIS files.

### 1.2 What Specific Documents to Request

| Document | Format to Request | Why It Matters |
|----------|-------------------|----------------|
| **Current As-Built Campus Site Plan** | DWG, DXF, or SHP | Authoritative building footprints, pathways, boundaries |
| **Master Site Development Plan (Latest Revision)** | DWG, DXF, SHP, or georeferenced PDF | Official proposed/existing status, future projects |
| **Building Floor Plans (Ground Floor minimum)** | DWG, DXF, PDF | Entrance locations, room layouts, stairwells |
| **Utility/Infrastructure Maps** | DWG, DXF, SHP | Water tanks, electrical, drainage (context for pathways) |
| **Campus Boundary Survey** | SHP, KML, CSV (coordinates) | Legal campus perimeter |
| **Topographic/Contour Survey** | DWG, DXF, CSV | Elevation, slopes, drainage (accessibility) |

**Ask for "the latest revision" and "the revision date"** — the Codex analysis noted the plan date was illegible.

### 1.3 CAD vs GIS vs Surveyed Coordinates vs Site Plan Images

| Type | Description | Authority Level | Typical Source |
|------|-------------|-----------------|----------------|
| **CAD (DWG/DXF)** | Vector drawings with precise geometry, layers, dimensions | High (if as-built) | EFMO, Engineering Office |
| **GIS (SHP, GeoJSON, GDB)** | Geospatial features with attributes, CRS, topology | High (if surveyed) | Planning Office, GIS Unit |
| **Surveyed Coordinates** | Ground-truthed points from total station/GNSS | Highest | Licensed Geodetic Engineer survey |
| **Site Plan Image (PDF/PNG/JPG)** | Raster image, no inherent coordinates | Low (reference only) | Public documents, website |
| **Google Maps / OSM** | Crowdsourced/derived, variable accuracy | Reference only | Web |

**Key Distinction**: CAD/GIS files *contain* coordinates. Images *require* georeferencing to become coordinate data.

### 1.4 File Formats to Request (Priority Order)

| Priority | Format | Use Case | How to Use in QGIS |
|----------|--------|----------|-------------------|
| 1 | **DWG/DXF** | Original CAD with layers | Drag into QGIS; preserve layers (buildings, roads, contours) |
| 2 | **Shapefile (SHP)** | Standard GIS interchange | Direct load; includes .prj (CRS) |
| 3 | **GeoJSON** | Web-friendly, Flutter-compatible | Direct load; easy to convert for app |
| 4 | **KML/KMZ** | Google Earth compatible | Load in QGIS; may need cleaning |
| 5 | **CSV (X,Y,Z)** | Point surveys (corners, entrances) | Add as delimited text layer |
| 6 | **Georeferenced PDF** | If only PDF available | QGIS → Raster → Georeferencer |

**Always request the .prj (projection) file with Shapefiles.**

### 1.5 Coordinate Reference System (CRS)

| CRS | Code | When to Use |
|-----|------|-------------|
| **WGS 84 / UTM Zone 51N** | EPSG:32651 | **Preferred for Philippines** — metric, local accuracy |
| **WGS 84 (Lat/Lon)** | EPSG:4326 | **Required for Flutter/OSM** — degrees, global compatibility |
| **PRS 92 / Philippines Zone 3** | EPSG:3123 | Philippine Reference System 1992 (official national) |

**Request data in EPSG:32651 (UTM 51N) or EPSG:3123 (PRS 92).** Convert to EPSG:4326 in QGIS for Flutter use.

> **If they don't know the CRS**: Ask "What projection was the survey done in?" or "Can you export in UTM Zone 51N?"

### 1.6 What If EARIST Only Provides PDF/PNG/Printed Plan?

This is common. Here's your workflow:

#### Option A: Request the Source File
> "Do you have the original CAD or GIS file this PDF was printed from? Even an older version helps."

#### Option B: Georeference the Image Yourself (QGIS)
**Prerequisites**: You need **at least 4–6 known ground control points (GCPs)** with real coordinates.

**Where to get GCPs for free:**
1. **Google Earth Pro** — Click known corners (building corners, gate posts, road intersections), copy Lat/Lon
2. **OpenStreetMap** — Click identifiable features, copy coordinates
3. **PhilGIS / NAMRIA** — Download control points if available
4. **Your own phone GPS** — *Only as last resort; record accuracy (±m)*

**QGIS Georeferencer Workflow:**
```
1. Open QGIS → Raster → Georeferencer → Add Raster (your PDF/PNG)
2. Set Target CRS: EPSG:32651 (UTM 51N) or EPSG:4326
3. Click "Add Point" → Click recognizable feature on image → Enter known coordinates (from Google Earth/OSM)
4. Repeat for 6+ well-distributed points (corners, intersections)
5. Transformation: "Polynomial 2" or "Thin Plate Spline"
6. Resampling: "Nearest Neighbour" (for line art) or "Cubic" (for photos)
7. Run → Saves GeoTIFF with embedded coordinates
8. Load GeoTIFF in QGIS → Digitize features as vector layers
```

**Accuracy Reality Check**: Georeferenced images typically achieve **3–10m accuracy** depending on image distortion and GCP quality. **Document this limitation.**

#### Option C: Use the Image as Reference Layer Only
- Load georeferenced image in QGIS as background
- Digitize new vector layers (buildings, paths) on top
- Attribute each feature with `source: "digitized_from_master_plan_2023"`
- **Never claim these are surveyed coordinates.**

### 1.7 Converting the Master Site Plan to GIS Data (Step-by-Step)

**Tools**: QGIS (free, open-source)

**Workflow:**

```bash
# 1. Install QGIS
# Windows: https://qgis.org/en/site/forusers/download.html (OSGeo4W installer)
# Mac: Homebrew: brew install qgis
# Linux: sudo apt install qgis
```

**In QGIS:**

1. **Create Project** → Set Project CRS: `EPSG:32651` (UTM 51N)
2. **Add Basemap** → `XYZ Tiles` → `OpenStreetMap` (for reference)
3. **Georeference Master Plan** (if only image/PDF):
   - `Raster` → `Georeferencer` → Add your master plan image
   - Collect 6+ GCPs from OSM/Google Earth (building corners, gate, road intersections)
   - Run → Save as `master_plan_georef.tif`
4. **Digitize Features** (create new vector layers):
   - `Layer` → `Create Layer` → `New Shapefile Layer` (or GeoPackage)
   - **Buildings**: Polygon, fields: `name`, `official_name`, `status` (existing/proposed), `source`, `confidence`
   - **Pathways**: LineString, fields: `name`, `type` (road/pathwalk), `status`, `surface`, `width`, `source`
   - **Gates**: Point, fields: `name`, `type` (main/secondary), `status`, `access_hours`
   - **Landmarks**: Point/Polygon, fields: `name`, `type`, `source`
   - **Evacuation Areas**: Polygon, fields: `name`, `type` (assembly/shelter), `capacity`, `official_designation`
5. **Digitize Carefully**:
   - Snap to vertices where possible
   - One feature per building (not per room)
   - Pathways: connect at intersections (create nodes)
6. **Export for Flutter**:
   - Right-click layer → `Export` → `Save Features As` → `GeoJSON`
   - CRS: `EPSG:4326` (WGS 84) — **required for Flutter/latlong2**
   - File names: `campus_buildings.geojson`, `campus_pathways.geojson`, `campus_boundary.geojson`, `campus_gates.geojson`, `campus_landmarks.geojson`, `evacuation_areas.geojson`

### 1.8 Validating Building Positions

| Method | Accuracy | Cost | How to Do It |
|--------|----------|------|--------------|
| **Licensed Geodetic Engineer Survey** | ±2–5 cm | High (₱) | Hire professional; request CSV of building corners |
| **Total Station / RTK GNSS (University)** | ±1–3 cm | Low (if lab access) | Ask Engineering/Geodetic department for student access |
| **Phone GPS + Averaging** | ±3–10 m | Free | Stand at corner, average 30+ readings (GPS Essentials) |
| **Google Earth / OSM Cross-Check** | ±1–5 m | Free | Compare digitized corners to satellite imagery |
| **Campus Staff Walkthrough** | Qualitative | Free | "Is this building in the right place relative to that one?" |

**Minimum for Development**: Phone GPS averaging at each building entrance + Google Earth cross-check. **Document method and estimated accuracy.**

---

## PHASE 2: OBTAINING THE OFFICIAL EVACUATION PLAN

### 2.1 Which Office/Authority to Contact

| Office | Role | What to Ask For |
|--------|------|-----------------|
| **Campus Safety & Security Office** | *Primary* — evacuation planning, drills | Official evacuation plan, assembly points, exit routes, drill records |
| **Disaster Risk Reduction & Management Office (DRRMO)** | Mandated by RA 10121 | Campus DRRM plan, hazard maps, evacuation procedures |
| **Office of the Campus Administrator** | Approves plans | Signed evacuation plan, designated assembly areas |
| **Facilities/Engineering Office** | Building exits, fire systems | Fire exits, fire extinguishers, sprinkler systems, emergency lighting |
| **Bureau of Fire Protection (BFP) — Local** | Fire code compliance | Fire safety inspection certificates, approved evacuation plans |

**Start with Campus Safety/Security Office** — they typically manage the evacuation plan.

### 2.2 Documents to Request

| Document | What It Contains | Format |
|----------|------------------|--------|
| **Campus Emergency Evacuation Plan** | Assembly points, primary/secondary routes, exit assignments, procedures | PDF, printed |
| **Building-Level Evacuation Plans** | Per-building exit routes, floor plans with exits, assembly points | PDF, printed (per building) |
| **Campus Hazard Map** | Earthquake, flood, fire, landslide zones | PDF, GIS |
| **Fire Safety Inspection Certificates (BFP)** | Approved exits, occupancy, compliance | PDF |
| **Evacuation Drill Records** | Dates, participation, issues identified | PDF, logs |
| **List of Designated Assembly Areas** | Official names, coordinates, capacity, assigned buildings | CSV, PDF |
| **Emergency Access Routes** | Fire truck access, ambulance routes, gate assignments | Map, PDF |

### 2.3 How to Identify Officially Designated Assembly Areas

**Ask these specific questions:**

1. "Which open spaces are **officially designated** as assembly areas in the current evacuation plan?"
2. "What is the **assigned assembly area for each building**?"
3. "What is the **capacity** of each assembly area?"
4. "Are there **primary and secondary** assembly areas?"
5. "Who **approved** these designations and **when**?"
6. "Are there **shelter-in-place** locations for specific hazards (e.g., typhoon, earthquake)?"

**Record the official name exactly as written in the plan.** Example: "Assembly Area A — Quadrangle North" not just "Quadrangle."

### 2.4 Emergency Exits, Restricted Areas, Emergency Access Routes

| Information | Source | How to Verify |
|-------------|--------|---------------|
| **Fire Exits per Building** | Building evacuation plan, BFP certificate | Walkthrough: count exits, check signage, test hardware |
| **Emergency Vehicle Access** | Campus safety office, engineering | Drive/walk routes; measure width, clearance |
| **Restricted Areas** | Security office, administration | Ask for list; verify signage on site |
| **Gate Operating Hours** | Security office | Confirm with guard on duty |
| **Emergency Gate Override** | Security, admin | Ask: "Can all gates be opened immediately in emergency?" |

### 2.5 If No Digital Evacuation Plan Exists

**This is common.** Here's what to do:

1. **Request the printed/posted version** — Every building should have evacuation diagrams posted at corridors/exits (Fire Code requirement).
2. **Photograph every posted evacuation diagram** — Building by building, floor by floor.
3. **Interview the Safety Officer** — Record their verbal description; ask them to sketch on a campus map.
4. **Document as "Verbal from Safety Officer [Name], Date [X]"** — Not as official document.
5. **Request they formalize it** — Offer to help digitize it once you have the campus base map.

### 2.6 Documenting Without Declaring Unofficial Destinations

**Golden Rule**: Your app can show *candidate* areas with clear labeling, but **never** label anything as "Official Assembly Point" without written authorization.

**In your data, use these fields:**
```json
{
  "name": "Existing Quadrangle",
  "designation_status": "candidate",
  "source": "master_plan_visual_analysis",
  "official_designation": null,
  "authorized_by": null,
  "authorization_date": null,
  "capacity_estimate": 500,
  "notes": "Visible open space on master plan. Awaiting official designation from Campus Safety Office."
}
```

**Only when you have written confirmation:**
```json
{
  "designation_status": "official",
  "official_designation": "Assembly Area A",
  "authorized_by": "Eng. Juan Dela Cruz, Campus Safety Officer",
  "authorization_date": "2026-02-15",
  "document_reference": "EARIST-Cavite-EvacPlan-2026-Rev1.pdf"
}
```

### 2.7 Translating to SAFENAV CAVITE Evacuation Functionality

| App Feature | Data Required | Source |
|-------------|---------------|--------|
| **Nearest Assembly Point** | Official assembly areas with coordinates, capacity, assigned buildings | Official evacuation plan |
| **Evacuation Route from Current Location** | Verified pathway network + emergency exit nodes + assembly points | Field-verified pathways + official exits |
| **Hazard-Aware Routing** | Hazard zones (fault lines, flood areas, chemical storage) | Campus hazard map / DRRMO |
| **Real-Time Blockage Reporting** | Crowdsourced / admin-reported blocked paths | Future: Firebase backend |
| **Evacuation Drill Mode** | Drill schedule, announced routes | Safety office coordination |

---

## PHASE 3: CONDUCTING A CAMPUS WALKTHROUGH

### 3.1 Preparation (Before You Go)

| Task | Details |
|------|---------|
| **Obtain Permission** | Formal letter to Campus Administrator (template in Phase 8) |
| **Identify Companion** | Request EFMO staff or Security guard to accompany you (they know restricted areas, current construction) |
| **Schedule** | Weekday, 8 AM – 4 PM (offices open, staff available) |
| **Print Reference Maps** | Master plan (A3), OSM printout, blank field sheets |
| **Charge Devices** | Phone (GPS, camera), power bank |
| **Install Apps** | GPS Essentials, OSMAnd, QField (optional), voice recorder |
| **Prepare ID** | Student ID, project endorsement letter |

### 3.2 Equipment Checklist

| Item | Purpose | Free Alternative |
|------|---------|------------------|
| **Smartphone (GPS + Camera)** | Primary data collection | Your phone |
| **GPS Essentials (Android) / GPS Tracks (iOS)** | High-accuracy GPS logging, averaging | Free |
| **OSMAnd / Organic Maps** | Offline maps, GPS position, POI creation | Free |
| **QField (if QGIS project ready)** | Professional field digitization | Free |
| **Voice Recorder App** | Audio notes while walking | Built-in |
| **Notebook + Pen** | Backup, sketches, staff quotes | Any |
| **Printed Master Plan (A3)** | Reference, annotation | Print from PDF |
| **Measuring Tape / Laser Measure** | Path widths, door widths | Pacing (calibrate your stride) |
| **Compass App** | Bearing verification | Phone built-in |

### 3.3 What to Record at Each Feature

#### Building Entrances (Critical for Navigation Graph)
- GPS coordinate (averaged 30+ seconds)
- Entrance type: main, side, emergency, service
- Accessibility: ramp, stairs, level, door width
- Building name (official), floor served
- Photo of entrance + signage

#### Pedestrian Pathways
- Start/end GPS points (or trace full path in OSMAnd/QField)
- Surface: concrete, asphalt, pavers, dirt, grass
- Width (measure or pace)
- Condition: good, cracked, flooded, blocked
- Lighting: yes/no
- Accessibility: wheelchair passable?
- Connectivity: which buildings/gates/paths it connects

#### Gates
- GPS coordinate
- Type: main, secondary, service, emergency
- Operating hours (ask guard)
- Vehicle/pedestrian/both
- Access control: guard, card, open
- Emergency override: yes/no (ask)

#### Intersections/Junctions
- GPS coordinate
- Number of connecting paths
- Crosswalk, curb ramp, tactile paving?
- Signage present?

#### Restricted/Closed Areas
- GPS boundary (walk perimeter)
- Reason: construction, security, hazard, private
- Signage text (photograph)
- Temporary or permanent?

### 3.4 Sample Field Data Collection Table

**Print multiple copies. Use one row per feature.**

| Field | Example Entry |
|-------|---------------|
| **Date** | 2026-01-20 |
| **Collector** | Maria Santos (BS CS), accompanied by Eng. Reyes (EFMO) |
| **Feature ID** | BLDG-ENT-001 |
| **Feature Name** | Main Building Hall - Main Entrance |
| **Feature Type** | Building Entrance |
| **Official Name** | EXISTING MAIN BUILDING HALL - |
| **GPS Latitude** | 14.300156 |
| **GPS Longitude** | 121.007688 |
| **GPS Accuracy (±m)** | 4.2 |
| **GPS Method** | GPS Essentials, 60-sec average, 12 satellites |
| **Nearby Building ID** | BLDG-016 |
| **Pathway Connection** | PATH-001 (Main Entrance Path) |
| **Accessibility** | Ramp present, 1.2m wide, tactile paving at top |
| **Entrance Type** | Main |
| **Door Width (m)** | 1.8 (double door) |
| **Photograph Ref** | IMG_20260120_091523.jpg |
| **Verification Status** | Verified (staff confirmed) |
| **Staff Confirmed By** | Eng. Reyes (EFMO) |
| **Notes** | Main gate aligns with this entrance. Security guard on duty 6AM–10PM. |

**Digital Version**: Create this as a CSV or Google Sheet for easy export.

### 3.5 Photograph Organization

**Naming Convention**: `YYYYMMDD_HHMMSS_FEATUREID_DESCRIPTION.jpg`
- Example: `20260120_091523_BLDG-ENT-001_main_entrance.jpg`

**Folder Structure on Phone/Computer:**
```
/SAFENAV_Fieldwork/
  /2026-01-20/
    /photos/
    /gpx_tracks/
    /voice_notes/
    field_notes_20260120.csv
```

**What to Photograph:**
- Every building entrance (straight on + context)
- Every gate (signage, mechanism, approach)
- Pathway surfaces, widths, obstructions
- Intersection geometry
- Posted evacuation diagrams (per building)
- Hazard signs, restricted area signs
- Construction activity
- Master plan reference points (for georeferencing)

### 3.6 Comparing Field Observations vs Master Plan

| Master Plan Says | Field Reality | Action |
|------------------|---------------|--------|
| Building exists | Building exists, matches | Confirm; record GPS |
| Building proposed | Building exists (built) | Update status to "existing"; record GPS |
| Building proposed | Empty lot / construction | Record as "under construction" or "proposed" |
| Building existing | Demolished / different use | Record as "demolished" or "repurposed" |
| Pathway shown | Pathway exists, walkable | Confirm; record GPS trace |
| Pathway shown | No pathway / blocked | Record as "not existing" or "blocked" |
| Gate shown | Gate exists, operational | Confirm; record hours |
| Gate proposed | No gate | Record as "not built" |
| Assembly area | Open space exists | Record as "candidate" until officially designated |

**Never change the master plan record.** Create a new `field_verification` layer that references the master plan feature ID.

### 3.7 Information Requiring Staff Confirmation

| Information | Why Staff Confirmation Needed |
|-------------|------------------------------|
| **Building current use / department** | Signage may be outdated; registrar has official list |
| **Gate operating hours / access policy** | Guards rotate; security office has official schedule |
| **Restricted areas / no-entry zones** | Not always signed; security/admin knows |
| **Emergency exit usability** | Some exits locked/blocked; safety officer knows |
| **Construction timelines** | "Proposed" may be funded/not funded; planning office knows |
| **Official assembly area assignments** | Only safety office can authorize |
| **Hazard zones (chemical, electrical, structural)** | Facilities/safety office has records |
| **Utility locations (for pathway routing)** | Engineering office has as-builts |

---

## PHASE 4: RESOLVING UNCERTAIN BUILDING LABELS

### 4.1 The Three Uncertain Labels from Codex Analysis

| Label | Issue | Resolution Strategy |
|-------|-------|---------------------|
| **PROPOSED STAFF HOUSING BUILDIN…** | Clipped at image edge | 1. Request higher-res master plan from EFMO<br>2. Ask facilities: "Is there a staff housing building planned or built in the NW area?"<br>3. Walk the area; look for construction or existing structure |
| **PROPOSED MULTIPURPOSE BUILDIN… (Eastern)** | Clipped; duplicate of NW label? | 1. Compare NW and eastern callouts on master plan — separate leader lines?<br>2. Ask: "Are there two multipurpose buildings or one?"<br>3. Field check both locations |
| **PROPOSED RED FOX DRAGON PLANTATION** | Low contrast, may be "red fox garden" duplicate | 1. Ask: "Is there a 'red fox dragon plantation' distinct from 'red fox garden'?"<br>2. Check with grounds/maintenance staff<br>3. Field observe: one garden or two? |

### 4.2 Verification Procedure for Each Uncertain Label

**Template for each label:**

```
UNCERTAIN LABEL RESOLUTION RECORD

Label (as visible): ___________________________________
Master Plan ID: ______________________________________
Location on Plan: ____________________________________

STEP 1: Request Higher-Resolution Source
☐ Asked EFMO for original CAD/PDF
☐ Received: _________________ (file name, date)
☐ Resolution: _______________ (readable / still clipped)

STEP 2: Staff Interview
Person: ______________________ Role: ________________
Date: ________________________
Statement: _________________________________________
____________________________________________________

STEP 3: Field Observation
Date: ___________ GPS: _____________________________
Observed: _________________________________________
____________________________________________________
Photos: ____________________________________________

STEP 4: Cross-Reference
☐ Campus building registry
☐ Previous master plan revisions
☐ OSM / Google Maps labels

RESOLUTION:
☐ Resolved: Official name = _________________________
☐ Duplicate of: ____________________________________
☐ Does not exist (plan only): _______________________
☐ Still uncertain — Record as: ______________________

Final Record in Database:
  official_name: _________________________________
  label_as_visible: ______________________________
  status: _______________________________________
  confidence: ___________________________________
  resolution_notes: ______________________________
```

### 4.3 Recording Unresolved Labels

If resolution fails, **do not invent a name.** Record exactly:

```json
{
  "id": "building_011",
  "label_as_visible": "PROPOSED STAFF HOUSING BUILDIN…",
  "official_name": null,
  "status": "unresolved_clipped_label",
  "resolution_attempts": [
    "Requested high-res plan from EFMO (2026-01-15) — no response",
    "Interviewed Eng. Reyes (EFMO) — unsure, suggested checking 2024 plan",
    "Field walk 2026-01-20 — no visible structure at planned location"
  ],
  "confidence": "low",
  "notes": "Label clipped at image edge. Final characters unknown. Do not assume 'BUILDING'."
}
```

---

## PHASE 5: FREE TOOLS & RECOMMENDED TECHNOLOGY STACK

### 5.1 Tool Evaluation Matrix

| Tool | Cost | Difficulty | Accuracy | Flutter Export | Best For |
|------|------|------------|----------|----------------|----------|
| **QGIS** | Free | Medium | High (with good data) | GeoJSON, SHP, CSV | **Core GIS work** — georeferencing, digitizing, CRS conversion |
| **Google Earth Pro** | Free | Easy | Medium (satellite) | KML, CSV | GCPs, quick coordinate lookup, 3D visualization |
| **OSMAnd / Organic Maps** | Free | Easy | Medium (phone GPS) | GPX, OSM edits | Field navigation, GPS tracking, POI collection |
| **GPS Essentials (Android)** | Free | Easy | ±3–10m (phone) | CSV, GPX, KML | GPS averaging, coordinate capture |
| **GPS Tracks (iOS)** | Free | Easy | ±3–10m (phone) | GPX, CSV | GPS logging on iPhone |
| **QField** | Free | Medium | High (with QGIS sync) | Syncs to QGIS | Professional field digitization (if QGIS project ready) |
| **JOSM** | Free | Hard | High | OSM upload | Editing OpenStreetMap directly |
| **uMap / uMap.org** | Free | Easy | Medium | GeoJSON, KML | Quick web map sharing, collaboration |
| **kepler.gl** | Free | Easy | Visualization | Export config | Data exploration, styling |
| **Python (geopandas, shapely)** | Free | Hard | Programmatic | Any | Batch processing, validation scripts |

### 5.2 Recommended Workflow (Validated)

```
[1] Official Documents
    │
    ├─► EARIST provides DWG/DXF/SHP
    │       │
    │       └─► QGIS: Load directly, verify CRS, export GeoJSON (EPSG:4326)
    │
    └─► EARIST provides only PDF/PNG
            │
            └─► QGIS: Georeference using 6+ GCPs from Google Earth Pro
                    │
                    └─► QGIS: Digitize features as vector layers (buildings, paths, gates)
                            │
                            └─► QGIS: Export GeoJSON (EPSG:4326) for Flutter
                                    │
[2] Field Verification
    │
    ├─► Campus Walkthrough with GPS Essentials / OSMAnd
    │       │
    │       └─► Record GPS at entrances, path traces, gates, intersections
    │               │
    │               └─► QGIS: Load field GPS (GPX/CSV), compare to digitized
    │                       │
    │                       └─► QGIS: Adjust / validate / add missing features
    │                               │
    │                               └─► QGIS: Export final validated GeoJSON
    │
[3] Evacuation Data
    │
    ├─► Safety Office: Official evacuation plan (PDF)
    │       │
    │       └─► QGIS: Digitize assembly points, evacuation routes on validated base
    │               │
    │               └─► QGIS: Export evacuation_areas.geojson, evacuation_routes.geojson
    │
[4] Flutter Integration
    │
    ├─► Copy .geojson files to lib/src/features/map/data/
    │       │
    │       └─► Update MapDataService to load new files
    │               │
    │               └─► Test: MapScreen renders buildings, pathways, evacuation areas
    │
[5] Navigation Graph
    │
    └─► NavigationService.buildGraph() uses validated pathways
            │
            └─► Dijkstra computes routes on verified network
```

### 5.3 Why This Workflow Works for You

| Requirement | How Workflow Meets It |
|-------------|----------------------|
| **Free** | QGIS, Google Earth, OSMAnd, GPS Essentials all free |
| **Student-accessible** | Runs on laptop + phone; no special hardware |
| **Accurate enough** | Georeferenced digitization + field GPS = ~3–5m typical |
| **Flutter-compatible** | GeoJSON EPSG:4326 → direct load via MapDataService |
| **Auditable** | Every feature has `source`, `method`, `date`, `confidence` |
| **Extensible** | Add evacuation, hazard, accessibility layers later |
| **Collaborative** | Share QGIS project (.qgz) with advisor/team |

### 5.4 If You Don't Have a Laptop That Runs QGIS

**Minimum specs**: 8GB RAM, 2.5GHz dual-core, 5GB disk. Most 2018+ laptops handle it.

**Alternatives:**
- **University computer lab** — Check GIS/Engineering/Geography department
- **QGIS Portable** — Run from USB on any Windows lab computer
- **Web-based digitizing** — uMap.org (limited but works for simple features)
- **Phone-only** — OSMAnd + GPS Essentials → export GPX → convert online (geojson.io) → manual cleanup

---

## PHASE 6: DATA QUALITY & VALIDATION

### 6.1 Quality Dimensions to Track

| Dimension | What to Record | Target for Development |
|-----------|----------------|------------------------|
| **Coordinate Accuracy** | Method (survey/RTK/phone/georef), estimated ±m | ≤10m for building centroids; ≤5m for entrances |
| **Building Identification** | Official name match, status (existing/proposed/demolished) | 100% of official master plan labels accounted for |
| **Pathway Verification** | Walkable? Surface? Width? Connects where? | All routing pathways field-verified |
| **Connectivity Validation** | Graph junctions match real intersections | No "floating" dead-end pathways in graph |
| **Evacuation Authorization** | Official designation doc, authorizer, date | Only authorized areas marked `designation_status: official` |
| **Source Documentation** | Document name, revision, date, page | Every feature traces to a source |
| **Verification Date** | When field-checked | Within 6 months of app release |
| **Confidence Level** | High / Medium / Low | High for routing features; Medium for reference only |

### 6.2 Data Quality Checklist (Per Feature)

```
☐ Has official name (exact from source)
☐ Has feature ID (consistent across layers)
☐ Has geometry (LatLng polygon/line/point in EPSG:4326)
☐ Has source document reference
☐ Has collection method (digitized/field_gps/staff_interview)
☐ Has collection date
☐ Has estimated accuracy (±m)
☐ Has confidence (high/medium/low)
☐ Has status (official/verified/estimated/proposed/uncertain)
☐ Has verification status (pending/field_verified/staff_confirmed)
☐ Cross-referenced to master plan ID
```

### 6.3 What Is Sufficient to Begin Development

| Feature Type | Minimum Required | Can Defer |
|--------------|------------------|-----------|
| **Campus Boundary** | 1 polygon, verified | — |
| **Buildings (for map display)** | 1 polygon + centroid per building, official name, status | Exact entrance locations (use centroid initially) |
| **Pathways (for routing)** | **Verified centerlines with real junctions** — this is the routing backbone | Surface, width, lighting (add later) |
| **Gates** | Location, type, operating hours | Emergency override details |
| **Evacuation Areas** | **Official designation only** — do not use candidates | Capacity estimates (add later) |
| **Evacuation Routes** | Verified pathways + official exits + official assembly points | Hazard-aware weighting |

### 6.4 What Must Remain Pending

- Any coordinate from georeferenced image without field verification
- Any evacuation area without written authorization
- Any pathway not walked and confirmed
- Any building entrance not GPS-located
- Any "proposed" feature treated as "existing"

### 6.5 Never Confuse These

| ❌ Don't Treat As Authoritative | ✅ Treat As What It Is |
|--------------------------------|------------------------|
| Google Maps pin | Rough reference (±10–50m) |
| Phone GPS single reading | Estimate (±5–30m) — average 30+ sec |
| Georeferenced image digitization | Derived (±3–10m depending on GCPs) |
| Master plan visual position | Qualitative reference only |
| Staff verbal description | Hearsay — needs document or field check |
| Your visual estimate | Not data |

---

## PHASE 7: EXECUTION ROADMAP

### STAGE 1 – Official Data Requests (Week 1–2)

| Task | Tool/Method | Output | Completion Criteria |
|------|-------------|--------|---------------------|
| Send formal request to Campus Administrator | Template (Phase 8) | Acknowledgment letter | Received signed receipt or email acknowledgment |
| Request CAD/GIS from EFMO | In-person + letter | DWG/DXF/SHP files or written response | Files received OR written confirmation of what exists |
| Request evacuation plan from Safety Office | In-person + letter | PDF/printed plan or written response | Document received OR written confirmation |
| Request building registry from Registrar | Letter | Building list with official names | CSV/Excel received |
| Document all responses | Spreadsheet | Contact log | Every office contacted, response recorded |

**Estimated Time**: 1–2 weeks (depends on office responsiveness)
**Potential Difficulty**: Offices may not have digital files.
**Solution**: Accept printed plans; proceed to georeferencing (Stage 2).

### STAGE 2 – Geospatial Preparation (Week 2–4)

| Task | Tool | Output | Completion Criteria |
|------|------|--------|---------------------|
| Install QGIS + plugins | OSGeo4W / qgis.org | Working QGIS 3.x | QGIS opens; can load OSM basemap |
| Set up project CRS (EPSG:32651) | QGIS Project Properties | Project file (.qgz) | CRS shows "WGS 84 / UTM zone 51N" |
| Load basemap (OSM XYZ) | QGIS Browser | Reference layer | OSM tiles display correctly |
| Georeference master plan (if image only) | QGIS Georeferencer | GeoTIFF + GCP table | 6+ GCPs, RMS error < 2m (in target CRS) |
| Create vector layers (buildings, paths, gates, landmarks, boundary) | QGIS New Layer | 6+ Shapefile/GeoPackage layers | Layers created with proper fields |
| Digitize all master plan features | QGIS Digitizing | Populated vector layers | Every master plan label digitized with attributes |
| Export to GeoJSON (EPSG:4326) | QGIS Export | 6 .geojson files | Files load in geojson.io without errors |

**Estimated Time**: 1–2 weeks
**Potential Difficulty**: Georeferencing RMS error high.
**Solution**: Get more GCPs; use building corners visible on both plan and satellite.

### STAGE 3 – Campus Fieldwork (Week 3–5)

| Task | Tool | Output | Completion Criteria |
|------|------|--------|---------------------|
| Obtain walkthrough permission | Template letter | Signed permission | Signed letter from Campus Admin |
| Schedule with EFMO companion | Email/phone | Confirmed date/time | Companion confirmed |
| Conduct walkthrough (2–3 days) | GPS Essentials, OSMAnd, Camera, Notebook | GPX tracks, CSV points, photos, voice notes | All buildings, gates, paths, intersections visited |
| Post-process field data | QGIS | Field verification layer | GPS points loaded; compared to digitized |
| Update digitized features | QGIS | Validated vector layers | Discrepancies resolved; missing features added |
| Re-export GeoJSON | QGIS | Updated .geojson files | All features have `verification_status: field_verified` where applicable |

**Estimated Time**: 1–2 weeks (scheduling + 2 field days + processing)
**Potential Difficulty**: Companion unavailable; restricted areas.
**Solution**: Request security escort; do public areas first; document restrictions.

### STAGE 4 – Evacuation Plan Verification (Week 4–6)

| Task | Tool | Output | Completion Criteria |
|------|------|--------|---------------------|
| Obtain official evacuation plan | Safety Office | PDF/printed document | Document in hand |
| Extract assembly areas, routes, exits | Reading + QGIS digitizing | evacuation_areas.geojson, evacuation_routes.geojson | Every official assembly area digitized with `designation_status: official` |
| Interview Safety Officer | Voice recorder + notes | Interview record | Key questions answered (see Phase 2) |
| Cross-check with field data | QGIS | Validation report | Field GPS matches official exits/routes |
| Document unauthorized candidates | Spreadsheet | Candidate list | Clearly labeled `designation_status: candidate` |

**Estimated Time**: 1–2 weeks
**Potential Difficulty**: No official plan exists.
**Solution**: Photograph posted diagrams; record as "posted_diagram"; work with Safety Office to formalize.

### STAGE 5 – Data Consolidation (Week 6–7)

| Task | Tool | Output | Completion Criteria |
|------|------|--------|---------------------|
| Merge all GeoJSON into master dataset | QGIS / Python | Master GeoPackage or folder | All layers consistent CRS, naming, fields |
| Run validation checks | Python (geopandas) / QGIS | Validation report | No orphan nodes; all buildings have centroids; pathways connect |
| Assign final confidence levels | Manual review | Confidence matrix | Every feature has confidence + source trace |
| Create data dictionary | Markdown | DATA_DICTIONARY.md | Every field documented |
| Package for Flutter | File copy | `lib/src/features/map/data/*.geojson` | Files in place; MapDataService updated |

**Estimated Time**: 1 week
**Potential Difficulty**: Inconsistent IDs across layers.
**Solution**: Use master plan ID as primary key; enforce in digitizing.

### STAGE 6 – SAFENAV CAVITE Readiness (Week 7–8)

| Checklist Item | Status Required |
|----------------|-----------------|
| Campus boundary loaded & correct | ✅ Verified |
| All 20 master plan buildings present | ✅ Verified |
| Building polygons + centroids in EPSG:4326 | ✅ Verified |
| Official names match master plan exactly | ✅ Verified |
| Pathways form connected graph (no floating segments) | ✅ Verified |
| At least 2 junctions field-verified | ✅ Verified |
| Gates located with operating hours | ✅ Verified |
| **Official evacuation areas designated & digitized** | ✅ **Required** |
| Evacuation routes connect exits to assembly areas | ✅ Verified |
| MapDataService loads new files without error | ✅ Tested |
| MapScreen renders all layers | ✅ Tested |
| NavigationService.buildGraph() completes | ✅ Tested |
| Dijkstra route computes between 2 buildings | ✅ Tested |

**Only when ALL ✅ are checked**: Begin implementation integration.

---

## PHASE 8: DOCUMENT TEMPLATES

All templates are saved in `docs/templates/`. Copy, customize, and print.

---

### TEMPLATE 1: Formal Request for Campus Master Plan & Geospatial Data

```
[Your Letterhead / University Letterhead]
[Date]

Eng. [Name if known, otherwise "Campus Administrator"]
Eulogio "Amang" Rodriguez Institute of Science and Technology
Cavite Campus
Congressional Road, General Mariano Alvarez, Cavite

Subject: Request for Access to Official Campus Master Plan and Geospatial Data
         for Academic Research Project "SAFENAV CAVITE"

Dear Eng. [Name / Sir/Madam],

I am [Your Full Name], a [Year Level] student in the [Program, e.g., Bachelor of Science in Computer Science] at [Your University], currently developing my [capstone project / thesis / research project] titled **"SAFENAV CAVITE: A Mobile-Based Campus Navigation and Emergency Evacuation System with Real-Time Mapping for EARIST Cavite Campus."**

This project aims to create a free, open-source mobile application that helps students, faculty, and visitors navigate the EARIST Cavite campus safely and efficiently, with particular emphasis on emergency evacuation routing. The project is purely academic, non-commercial, and intended to benefit the campus community.

To ensure the accuracy and reliability of the system, I respectfully request access to the following official campus documents and data:

1. **Current Master Site Development Plan** — Preferably in original digital format (AutoCAD DWG/DXF, GIS Shapefile, or GeoPackage). If only printed/PDF versions are available, a high-resolution scan would be appreciated.

2. **As-Built Campus Site Plan** — Showing current building footprints, pathways, gates, utilities, and campus boundary with surveyed coordinates.

3. **Building Floor Plans (Ground Floor minimum)** — For all campus buildings, showing entrance locations, corridors, stairwells, and room layouts.

4. **Campus Boundary Survey Coordinates** — Legal campus perimeter in geographic or projected coordinates.

5. **Topographic/Contour Data** — If available, for accessibility analysis (slopes, ramps, drainage).

6. **Official Building Registry** — Current list of all campus buildings with official names, abbreviations, and departments housed.

I understand these documents may be sensitive or proprietary. I am willing to:
- Sign a non-disclosure agreement if required
- Restrict data usage to this academic project only
- Not publish or distribute raw geospatial data outside the project
- Provide the completed application to EARIST Cavite for campus use at no cost
- Acknowledge EARIST Cavite as the data source in all project documentation

If digital files are not available, I would be grateful for the opportunity to:
- Photograph/scan printed plans at your office
- Conduct a supervised campus walkthrough with facilities staff to collect GPS coordinates
- Work with your engineering team to digitize key features

I am available to discuss this request at your convenience and can be reached at:
- Email: [your.email@student.university.edu]
- Phone: [your phone number]
- Faculty Advisor: [Advisor Name, Email, Phone]

Thank you for considering this request. I believe this project can meaningfully contribute to campus safety and accessibility, and I would be honored to collaborate with EARIST Cavite on this initiative.

Respectfully,

[Your Signature]
[Your Printed Name]
[Student ID Number]
[Program, Year Level]
[University Name]
[Email Address]
[Phone Number]

cc: [Faculty Advisor Name], [Advisor Email]
```

---

### TEMPLATE 2: Request for Official Emergency Evacuation Plan

```
[Your Letterhead / University Letterhead]
[Date]

[Name/Title, e.g., "Campus Safety Officer" or "Head, Disaster Risk Reduction & Management Office"]
Eulogio "Amang" Rodriguez Institute of Science and Technology
Cavite Campus
Congressional Road, General Mariano Alvarez, Cavite

Subject: Request for Official Campus Emergency Evacuation Plan
         for Academic Research Project "SAFENAV CAVITE"

Dear [Title/Name],

I am [Your Full Name], a [Year Level] [Program] student at [Your University], developing the **"SAFENAV CAVITE"** mobile application for campus navigation and emergency evacuation as my [capstone/thesis] project.

A critical component of this system is accurate, officially authorized emergency evacuation routing. To implement this responsibly, I need the campus's official evacuation plan as the authoritative source.

I respectfully request access to:

1. **Campus-Wide Emergency Evacuation Plan** — Current version showing:
   - Officially designated assembly areas (with names, locations, capacities)
   - Primary and secondary evacuation routes from each building
   - Emergency exit assignments per building
   - Emergency vehicle access routes and gate assignments
   - Hazard-specific procedures (earthquake, fire, flood, etc.)

2. **Building-Level Evacuation Diagrams** — Posted diagrams for each building (ground floor minimum), showing exit routes and assembly point assignments.

3. **Fire Safety Inspection Certificates (BFP)** — Most recent certificates for campus buildings, indicating approved exits and occupancy.

4. **Evacuation Drill Records** — Recent drill dates, participation, and after-action reports (if available).

5. **Campus Hazard Map** — If maintained by DRRMO, showing fault lines, flood zones, landslide risks, chemical storage areas.

I understand evacuation plans are security-sensitive. I commit to:
- Using this information solely for the SAFENAV CAVITE academic project
- Not publishing sensitive security details (guard schedules, alarm codes, etc.)
- Clearly distinguishing **official** evacuation data from **candidate** areas in the application
- Providing the completed evacuation module to EARIST Cavite for review before any public release
- Coordinating with your office for any campus-wide deployment

If a comprehensive digital plan does not yet exist, I would welcome the opportunity to:
- Photograph all posted evacuation diagrams during a supervised campus walkthrough
- Assist your office in digitizing and formalizing the evacuation plan
- Conduct GPS mapping of assembly areas and exit routes with your staff

I am available to meet at your convenience to discuss how best to collaborate on this important safety initiative.

Respectfully,

[Your Signature]
[Your Printed Name]
[Student ID Number]
[Program, Year Level]
[University Name]
[Email Address]
[Phone Number]

Faculty Advisor: [Advisor Name, Email, Phone]
```

---

### TEMPLATE 3: Campus Walkthrough Permission Request

```
[Your Letterhead / University Letterhead]
[Date]

Eng. [Campus Administrator Name]
Eulogio "Amang" Rodriguez Institute of Science and Technology
Cavite Campus
Congressional Road, General Mariano Alvarez, Cavite

Subject: Request for Permission to Conduct Campus Field Survey
         for "SAFENAV CAVITE" Academic Research Project

Dear Eng. [Name],

In connection with my previous request for campus geospatial data, I respectfully request permission to conduct a **supervised campus field walkthrough** to collect GPS coordinates and verify campus features for the SAFENAV CAVITE navigation and evacuation system.

**Proposed Activity:**
- **Date(s):** [Propose 2–3 dates, e.g., "January 20–22, 2026"]
- **Time:** 8:00 AM – 4:00 PM (adjustable to office hours)
- **Duration:** Approximately 2–3 days total
- **Team:** [Your Name] (student researcher) + [1 companion from EFMO/Security, if available]

**Data to Collect:**
- GPS coordinates of all building entrances (main, emergency, service)
- GPS traces of pedestrian pathways (surface, width, condition, accessibility)
- GPS coordinates of all gates (type, operating hours, access control)
- GPS coordinates of intersections, landmarks, utility features
- Photographs of entrances, pathways, gates, posted evacuation diagrams
- Verification of master plan features against actual conditions

**Equipment:**
- Smartphone with GPS Essentials / OSMAnd (GPS logging, ±3–10m accuracy)
- Camera (smartphone)
- Notebook for field notes
- Printed master plan for reference

**Safety & Compliance:**
- Will stay on public pathways and authorized areas only
- Will be accompanied by EFMO/Security staff at all times
- Will not enter restricted areas without explicit escort
- Will not disrupt classes, operations, or security procedures
- Will wear visible identification (student ID + project badge)

**Deliverables to EARIST:**
- Complete field verification report with GPS coordinates
- Updated campus map with verified features
- SAFENAV CAVITE application for campus use (upon completion)

I would appreciate it if you could assign a staff member from the Engineering & Facilities Management Office or Security Office to accompany us, as their knowledge of current campus conditions (construction, restrictions, access policies) is essential for accurate verification.

Please let me know if the proposed dates work or if alternative scheduling is needed. I am flexible and can adjust to campus availability.

Respectfully,

[Your Signature]
[Your Printed Name]
[Student ID Number]
[Program, Year Level]
[University Name]
[Email Address]
[Phone Number]

Faculty Advisor: [Advisor Name, Email, Phone]

---

**For Office Use:**
☐ Approved — Assigned Companion: ________________________ Date: __________
☐ Rescheduled to: ______________________________________
☐ Denied — Reason: ____________________________________
```

---

### TEMPLATE 4: Checklist of Questions for Campus Personnel

**Print and bring to every meeting.**

#### For Engineering & Facilities Management Office (EFMO)

| # | Question | Answer / Notes |
|---|----------|----------------|
| 1 | Do you have the current master site plan in CAD (DWG/DXF) or GIS (SHP)? | |
| 2 | What is the latest revision date of the master plan? | |
| 3 | Are there as-built plans for each building (ground floor)? | |
| 4 | What coordinate system/projection was the survey done in? | |
| 5 | Which buildings on the master plan are **actually built** vs **proposed**? | |
| 6 | Are there two "Multipurpose Buildings" (NW and Eastern) or one? | |
| 7 | What is the status of "Staff Housing" — built, under construction, or planned? | |
| 8 | Is "Red Fox Dragon Plantation" a distinct feature from "Red Fox Garden"? | |
| 9 | Where are the **main entrances** for each building? (Can you mark on a map?) | |
| 10 | What are the **pedestrian pathway surfaces and widths**? | |
| 11 | Are there **accessible routes** (ramps, tactile paving, elevators)? | |
| 12 | Any **current construction** blocking pathways or entrances? | |
| 13 | Where are the **utility features** (water tank, electrical rooms)? | |
| 14 | Can you provide a **building registry** with official names and departments? | |

#### For Campus Safety / Security Office

| # | Question | Answer / Notes |
|---|----------|----------------|
| 1 | Do you have a **current campus evacuation plan** (digital or printed)? | |
| 2 | What are the **officially designated assembly areas**? (Names, locations, capacities) | |
| 3 | Which assembly area is assigned to **each building**? | |
| 4 | What are the **primary and secondary evacuation routes** from each building? | |
| 5 | Are all **fire exits** currently operational and unobstructed? | |
| 6 | What are the **gate operating hours** and **access policies**? | |
| 7 | Can **all gates be opened immediately** in an emergency? | |
| 8 | Are there **restricted areas** (no-entry zones) on campus? | |
| 9 | What are the **emergency vehicle access routes**? | |
| 10 | Do you have **fire safety inspection certificates** (BFP)? | |
| 11 | When was the **last evacuation drill**? Any issues identified? | |
| 12 | Is there a **campus hazard map** (fault, flood, landslide, chemical)? | |
| 13 | Who **authorizes** evacuation plan changes? | |

#### For Registrar / Academic Affairs

| # | Question | Answer / Notes |
|---|----------|----------------|
| 1 | Can you provide the **official building registry** with exact names? | |
| 2 | Which departments are in **which buildings**? | |
| 3 | Are there **building abbreviations** used officially? | |
| 4 | Any **recent building renames** or repurposing? | |

---

### TEMPLATE 5: Campus Field Observation Template

**Print multiple copies (one per feature) or use digital CSV.**

```
SAFENAV CAVITE — FIELD OBSERVATION RECORD
==========================================

Date: _______________  Collector: ____________________________
Companion: ____________________________  Role: _______________
Weather: _______________  GPS App: ___________________________

FEATURE IDENTIFICATION
----------------------
Feature ID: ________________________  (e.g., BLDG-ENT-001, PATH-012, GATE-002)
Feature Name (Official): ________________________________________
Feature Name (Visible/Signage): ___________________________________
Feature Type: ☐ Building Entrance  ☐ Pathway  ☐ Gate  ☐ Intersection
              ☐ Landmark  ☐ Assembly Area  ☐ Utility  ☐ Other: ______

Master Plan Reference ID: ___________________ (from campus_buildings.json)

GPS MEASUREMENT
---------------
Latitude: ________________________  Longitude: ________________________
Accuracy (±m): ___________________  Satellites: _______________________
Method: ☐ 30-sec average  ☐ 60-sec average  ☐ Single reading  ☐ RTK/Survey
App: _____________________________  Height (m): ______________________

PHYSICAL CHARACTERISTICS
------------------------
[For Building Entrance:]
  Entrance Type: ☐ Main  ☐ Side  ☐ Emergency  ☐ Service  ☐ Other: ______
  Door Width (m): __________  Ramp: ☐ Yes  ☐ No  ☐ N/A
  Tactile Paving: ☐ Yes  ☐ No  Stairs: ☐ Yes (___ steps)  ☐ No
  Lighting: ☐ Yes  ☐ No  Signage: ☐ Building Name  ☐ Room Numbers  ☐ Evacuation

[For Pathway:]
  Surface: ☐ Concrete  ☐ Asphalt  ☐ Pavers  ☐ Dirt  ☐ Grass  ☐ Other: ____
  Width (m): __________  Condition: ☐ Good  ☐ Fair  ☐ Poor  ☐ Blocked
  Lighting: ☐ Yes  ☐ No  Wheelchair Passable: ☐ Yes  ☐ No  ☐ Partial
  Connects: From ___________________ To ___________________

[For Gate:]
  Gate Type: ☐ Main  ☐ Secondary  ☐ Service  ☐ Emergency
  Hours: ___________________  Access: ☐ Guard  ☐ Card  ☐ Open  ☐ Locked
  Vehicle: ☐ Yes  ☐ No  Pedestrian: ☐ Yes  ☐ No
  Emergency Override: ☐ Yes  ☐ No  ☐ Unknown

[For Assembly Area:]
  Designation Status: ☐ Official  ☐ Candidate  ☐ Uncertain
  Capacity Estimate: ________ people  Assigned Buildings: ____________
  Surface: ☐ Grass  ☐ Concrete  ☐ Mixed  Shade: ☐ Yes  ☐ No

CONNECTIVITY & CONTEXT
----------------------
Nearby Building ID(s): ___________________________________________
Connected Pathway ID(s): _________________________________________
Intersection With: _______________________________________________
Restricted Nearby: ☐ Yes (describe) _______________________________

VERIFICATION
------------
Verification Status: ☐ Field Verified  ☐ Staff Confirmed  ☐ Master Plan Only
Staff Confirmed By: ________________________  Role: _______________
Date Confirmed: ____________________________

DISCREPANCIES (vs Master Plan)
------------------------------
☐ Matches master plan
☐ Position shifted (describe): ____________________________________
☐ Feature missing from master plan
☐ Feature on master plan not found in field
☐ Status different (e.g., proposed → existing): ___________________

PHOTOGRAPHS
-----------
Photo 1: ________________________  Description: ____________________
Photo 2: ________________________  Description: ____________________
Photo 3: ________________________  Description: ____________________

VOICE NOTE
----------
File: ________________________  Key Points: ________________________

ADDITIONAL NOTES
----------------
____________________________________________________________________
____________________________________________________________________
____________________________________________________________________

Collector Signature: ________________________  Date: _______________
```

---

### TEMPLATE 6: Geospatial Data Collection Template (CSV Format)

**Use this as your master field data spreadsheet. Columns match the observation template.**

```csv
date,collector,companion,companion_role,weather,gps_app,feature_id,official_name,visible_name,feature_type,master_plan_ref_id,latitude,longitude,accuracy_m,satellites,gps_method,gps_app_name,height_m,entrance_type,door_width_m,has_ramp,has_tactile_paving,stairs_count,lighting,signage,surface,width_m,condition,wheelchair_passable,connects_from,connects_to,gate_type,operating_hours,access_control,vehicle_access,pedestrian_access,emergency_override,designation_status,capacity_estimate,assigned_buildings,surface_type,shade,nearby_building_ids,connected_pathway_ids,intersection_with,restricted_nearby,verification_status,staff_confirmed_by,staff_role,date_confirmed,matches_master_plan,position_shifted,feature_missing_from_plan,feature_not_found,status_changed,photo_1,photo_1_desc,photo_2,photo_2_desc,photo_3,photo_3_desc,voice_note_file,voice_note_points,additional_notes
2026-01-20,Maria Santos,Eng. Reyes,EFMO Engineer,Sunny,GPS Essentials,BLDG-ENT-001,EXISTING MAIN BUILDING HALL -,Main Building Hall - Main Entrance,Building Entrance,building_016,14.300156,121.007688,4.2,12,60-sec average,GPS Essentials,12.5,Main,1.8,Yes,Yes,0,Yes,Building Name;Evacuation,,,,,,,,,,,,,,,,,,BLDG-016,PATH-001,,,Field Verified,Eng. Reyes,EFMO Engineer,2026-01-20,Yes,No,No,No,No,IMG_20260120_091523.jpg,Main entrance front,IMG_20260120_091545.jpg,Ramp detail,IMG_20260120_091612.jpg,Signage,VOICE_20260120_091700.m4a,Guard confirms 6AM-10PM hours,Main gate aligns with entrance
```

**Save as `field_data_YYYYMMDD.csv` each day.**

---

## FIRST THREE ACTIONS — QUICK START

### Action 1: Send the Formal Request Letters (Today)

1. **Customize Template 1** (Master Plan Request) with your details
2. **Customize Template 2** (Evacuation Plan Request) with your details
3. **Print 2 copies each** (one for office, one for your records)
4. **Deliver in person** to:
   - Office of the Campus Administrator (for both letters — they route internally)
   - *Or* directly to EFMO and Safety Office if you know the contacts
5. **Get a receiving stamp/signature** on your copy — this is your proof of submission
6. **Follow up in 3 business days** if no response

> **Tip**: Bring your student ID, a one-page project summary, and your faculty advisor's contact info. Being prepared shows professionalism.

### Action 2: Set Up Your GIS Toolkit (This Week)

1. **Install QGIS 3.38+ (LTR)** — https://qgis.org/en/site/forusers/download.html
   - Windows: Use OSGeo4W Network Installer → Select `qgis-ltr` (Long Term Release)
   - Mac: `brew install qgis` or download .dmg
   - Linux: `sudo apt install qgis` (Ubuntu/Debian)
2. **Install GPS Essentials** (Android) or **GPS Tracks** (iOS) on your phone
3. **Install OSMAnd** (free, offline maps) — https://osmand.net/
4. **Test QGIS**: Open → Add OSM XYZ basemap → Verify it loads
5. **Create project folder**: `C:\SAFENAV_GIS\` (or `~/SAFENAV_GIS/`)
   - Subfolders: `source_docs/`, `qgis_project/`, `field_data/`, `exports/`

### Action 3: Collect Ground Control Points from Google Earth Pro (While Waiting for Responses)

1. **Install Google Earth Pro** (free) — https://earth.google.com/earth/download/ep.html
2. **Search "EARIST Cavite Campus, General Mariano Alvarez"**
3. **Identify 8–10 clear, stable features** visible on both satellite and the master plan:
   - Building corners (sharp 90° corners best)
   - Gate posts
   - Road intersections (Congressional Road + campus entry)
   - Distinct pathway junctions
   - Water tank / unique landmarks
4. **For each GCP**:
   - Right-click → "Add Placemark"
   - Name: `GCP_01_MainGate`, `GCP_02_Bldg16_NW_Corner`, etc.
   - Copy coordinates: Right-click placemark → Properties → Copy Lat/Lon
   - Paste into spreadsheet: `GCP_ID, Lat, Lon, Description`
5. **Save as `gcp_reference.csv`** — you'll need this for georeferencing

> **Why do this now?** GCPs from Google Earth are free, immediate, and surprisingly accurate (±1–3m in urban areas). Having them ready means you can georeference the master plan the moment you receive it.

---

## FINAL REMINDERS

| Principle | Remember |
|-----------|----------|
| **Official > Everything** | A signed PDF from Safety Office beats 100 GPS points |
| **Document the "No"** | If an office says "we don't have that," write it down, date it, and move to the next method |
| **Field verification is not optional** | The master plan is a *plan* — the campus is *reality* |
| **Evacuation data requires authorization** | Never label "Assembly Point" without written proof |
| **Your phone GPS is a tool, not a standard** | Average readings; cross-check with satellite; note accuracy |
| **Uncertainty is data** | Record "clipped," "unknown," "unverified" — don't guess |
| **Share your work** | Give cleaned GeoJSON back to EARIST — builds goodwill for future students |

---

**Guide Version**: 1.0  
**Created**: 2026-11-08  
**For**: SAFENAV CAVITE — EARIST Cavite Campus Navigation & Emergency Evacuation System  
**Author**: Technical Advisory Guide (Claude Code)  
**License**: Free for academic use — adapt and share

---

*This guide is a living document. Update it as you learn what works for your campus. Share improvements with your faculty advisor and future student researchers.*