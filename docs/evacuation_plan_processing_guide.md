# SAFENAV CAVITE – Evacuation Plan Processing Guide

**Workflow for extracting structured data from photographed evacuation diagrams**

---

## Overview

This guide covers the complete evacuation plan processing pipeline:
1. **Photo Collection** — Systematic capture of posted diagrams
2. **Photo Organization** — Automated sorting by building/floor
3. **Visual Analysis** — Manual + assisted extraction of evacuation elements
3. **Structured Data Output** — JSON schemas for Flutter integration
4. **Validation** — Cross-reference with official plan and field observations

---

## Phase 1: Photo Collection Standards

### Equipment
- **Android phone** with good camera (12MP+)
- **GPS Essentials** for location tagging
- **Voice recorder** for verbal notes

### For Each Building Floor with Posted Diagram

| Shot Type | Purpose | Technique |
|---|---|---|
| **Full Diagram** | Complete context | Stand perpendicular, capture entire poster |
| **Exit Routes** | Path tracing | Close-up of colored arrows/routes |
| **Staircases** | Vertical connections | Close-up of stair symbols |
| **Assembly Points** | Destination mapping | Close-up of assembly point labels |
| **Fire Equipment** | Safety features | Extinguishers, hoses, alarms |
| **Legend/Symbols** | Symbol decoding | Entire legend area |
| **"You Are Here"** | Reference point | Indicator position on diagram |
| **Building/Floor ID** | Metadata | Room number sign, floor label |

### Naming Convention (Critical for Automation)
```
EVAC_BLDG<ID>_FL<##>_<TYPE>.jpg

Examples:
EVAC_BLDG016_FL01_FULL.jpg
EVAC_BLDG016_FL01_EXITS.jpg
EVAC_BLDG016_FL01_STAIRS.jpg
EVAC_BLDG016_FL01_ASSEMBLY.jpg
EVAC_BLDG016_FL01_LEGEND.jpg
EVAC_BLDG016_FL01_YOUAREHERE.jpg
EVAC_BLDG016_FL01_FIREEXT.jpg
EVAC_BLDG016_FL01_FIRSTAID.jpg
EVAC_BLDG016_FL02_FULL.jpg
```

### Folder Structure
```
research_data/evacuation_plans/
├── BLDG-001_DORMITORY/
│   ├── FL01/
│   │   ├── EVAC_BLDG001_FL01_FULL.jpg
│   │   └── ...
│   └── FL02/
├── BLDG-016_MAIN_HALL/
│   ├── FL01/
│   └── FL02/
└── ... (per building)
```

---

## Phase 2: Automated Photo Organization (Python Script)

### Script: `organize_evacuation_photos.py`

```python
#!/usr/bin/env python3
"""
Organize evacuation plan photos by building and floor based on filename convention.
Run from research_data/evacuation_plans/ after transferring photos.
"""

import os
import re
import shutil
from pathlib import Path

SOURCE_DIR = Path(".")  # Current directory (where photos are dumped)
TARGET_BASE = Path(".")  # Same directory, will create subfolders

# Filename pattern: EVAC_BLDG016_FL01_FULL.jpg
PATTERN = re.compile(r'EVAC_BLDG(\d+)_FL(\d+)_(.+)\.jpg$', re.IGNORECASE)

def organize():
    for file in SOURCE_DIR.glob("*.jpg"):
        match = PATTERN.match(file.name)
        if not match:
            print(f"SKIP (no match): {file.name}")
            continue
        
        bldg_id = f"BLDG-{int(match.group(1)):03d}"
        floor = f"FL{int(match.group(2)):02d}"
        desc = match.group(3)
        
        target_dir = TARGET_BASE / bldg_id / floor
        target_dir.mkdir(parents=True, exist_ok=True)
        
        target_file = target_dir / file.name
        if target_file.exists():
            print(f"EXISTS: {target_file}")
            continue
        
        shutil.move(str(file), str(target_file))
        print(f"MOVED: {file.name} → {bldg_id}/{floor}/")

if __name__ == "__main__":
    organize()
```

### Usage
```bash
# 1. Transfer all photos to research_data/evacuation_plans/
# 2. Run:
cd research_data/evacuation_plans
python organize_evacuation_photos.py
```

---

## Phase 3: Visual Analysis & Data Extraction

### Manual Review Process (Per Building/Floor)

For each organized folder, review photos and extract:

#### A. Building Metadata
- Building ID (from master plan: `building_016`)
- Building Name (official: `EXISTING MAIN BUILDING HALL -`)
- Floor Count (from exterior photos + diagram)
- Floor Label (Ground = FL01, 2nd = FL02, etc.)

#### B. Floor Plan Geometry (from diagram)
- **Rooms/Corridors** — Not needed for routing, but useful for context
- **Staircases** — Critical for multi-floor evacuation
  - Location (relative position on diagram)
  - Type: `enclosed`, `open`, `fire_exit`, `emergency`
  - Connects: `FL01` ↔ `FL02` (or `FL01` → `GROUND_EXIT`)
- **Corridors** — Main evacuation corridors
  - Width indication (if marked)
  - Direction arrows

#### C. Emergency Exits
For each exit marked on diagram:
- **Exit ID:** `EXIT_BLDG016_FL01_01`
- **Type:** `main`, `emergency`, `fire_exit`, `secondary`
- **Location:** Description (e.g., "North corridor end", "Near Room 105")
- **Accessibility:** `wheelchair`, `stairs_only`, `ramp_available`
- **Leads To:** `OUTSIDE` or `PATHWAY_ID` or `ASSEMBLY_AREA_ID`
- **Signage:** `illuminated`, `standard`, `none_visible`

#### D. Evacuation Routes (Arrows on Diagram)
For each distinct route:
- **Route ID:** `EVAC_ROUTE_BLDG016_FL01_01`
- **Start Zone:** Area description (e.g., "Rooms 101-110")
- **Path:** Sequence of corridors/stairs/exits
- **Direction:** One-way or bidirectional
- **Assembly Point:** Target assembly area ID

#### E. Assembly Points
For each assembly point referenced:
- **Assembly ID:** `ASM_QUADRANGLE_NORTH`
- **Name:** From diagram (e.g., "Quadrangle North", "Assembly Area A")
- **Location:** Building-relative or absolute (if site plan shown)
- **Capacity:** If marked on diagram
- **Assigned Buildings/Zones:** List from diagram

#### F. Fire Safety Equipment
- **Fire Extinguishers:** Location, type (if marked: A, B, C, ABC)
- **Fire Hose Reels:** Location
- **Fire Alarms/Call Points:** Location
- **First Aid Stations:** Location
- **Emergency Lighting:** Corridors/stairs marked?

#### G. Legend & Symbols
Document all symbols used:
| Symbol | Meaning | Color |
|---|---|---|
| 🟢 Green arrow | Evacuation route | Green |
| 🔴 Red square | Fire extinguisher | Red |
| 🔴 Red triangle | Fire alarm | Red |
| 🟡 Yellow cross | First aid | Yellow |
| 🟠 Orange door | Emergency exit | Orange |
| ⬆️ Stair icon | Staircase | Black/Blue |
| 🅰️ "A" in circle | Assembly point | Green/Blue |

#### H. "You Are Here" Indicator
- **Position:** Where on diagram
- **Implies:** Viewer's current location
- **Use:** Helps orient diagram to real building

---

## Phase 4: Structured JSON Output Schemas

### Schema 1: Building Evacuation Data
```json
{
  "building_id": "building_016",
  "building_name": "EXISTING MAIN BUILDING HALL -",
  "floors": [
    {
      "floor_id": "FL01",
      "floor_label": "Ground Floor",
      "source_photos": [
        "EVAC_BLDG016_FL01_FULL.jpg",
        "EVAC_BLDG016_FL01_EXITS.jpg"
      ],
      "exits": [
        {
          "exit_id": "EXIT_BLDG016_FL01_01",
          "type": "main",
          "description": "Main entrance facing Congressional Road",
          "accessibility": "wheelchair",
          "leads_to": "PATH_MAIN_ENTRANCE",
          "signage": "illuminated",
          "coordinates_estimate": null
        },
        {
          "exit_id": "EXIT_BLDG016_FL01_02",
          "type": "emergency",
          "description": "Rear emergency exit to quadrangle",
          "accessibility": "stairs_only",
          "leads_to": "ASM_QUADRANGLE_NORTH",
          "signage": "standard",
          "coordinates_estimate": null
        }
      ],
      "staircases": [
        {
          "stair_id": "STAIR_BLDG016_FL01_FL02_01",
          "type": "enclosed_fire_exit",
          "connects_floors": ["FL01", "FL02"],
          "location_description": "North corridor, near Room 105",
          "accessibility": "none",
          "evacuation_direction": "up_only"
        }
      ],
      "corridors": [
        {
          "corridor_id": "CORR_BLDG016_FL01_MAIN",
          "description": "Main east-west corridor",
          "width_m_estimate": 2.5,
          "connects": ["EXIT_BLDG016_FL01_01", "STAIR_BLDG016_FL01_FL02_01", "EXIT_BLDG016_FL01_02"]
        }
      ],
      "evacuation_routes": [
        {
          "route_id": "EVAC_ROUTE_BLDG016_FL01_01",
          "name": "North Wing to Main Exit",
          "start_zone": "Rooms 101-110",
          "path": ["CORR_BLDG016_FL01_MAIN", "EXIT_BLDG016_FL01_01"],
          "assembly_point": "ASM_QUADRANGLE_NORTH",
          "direction": "one_way"
        }
      ],
      "assembly_points_referenced": [
        "ASM_QUADRANGLE_NORTH",
        "ASM_QUADRANGLE_SOUTH"
      ],
      "fire_equipment": [
        {
          "equipment_id": "EXT_BLDG016_FL01_01",
          "type": "fire_extinguisher",
          "subtype": "ABC",
          "location_description": "Corridor near Room 105",
          "mounting": "wall"
        }
      ],
      "first_aid": [
        {
          "station_id": "FA_BLDG016_FL01_01",
          "location_description": "Near main entrance, Room 101",
          "type": "first_aid_cabinet"
        }
      ],
      "legend_symbols": [
        {"symbol": "green_arrow", "meaning": "evacuation_route", "color": "green"},
        {"symbol": "red_square", "meaning": "fire_extinguisher", "color": "red"},
        {"symbol": "orange_door", "meaning": "emergency_exit", "color": "orange"},
        {"symbol": "stair_icon", "meaning": "staircase", "color": "black"},
        {"symbol": "assembly_circle", "meaning": "assembly_point", "color": "green"}
      ],
      "you_are_here": {
        "photo": "EVAC_BLDG016_FL01_YOUAREHERE.jpg",
        "location_description": "Main corridor intersection",
        "orientation_note": "Diagram oriented with North at top"
      },
      "verification": {
        "source": "posted_diagram",
        "photo_date": "2026-01-20",
        "diagram_date_posted": "2025-06-15",
        "confirmed_current_by": null,
        "confidence": "medium",
        "notes": "Diagram dated June 2025. Not confirmed if current approved version."
      }
    }
  ]
}
```

### Schema 2: Campus-Wide Assembly Points
```json
{
  "assembly_points": [
    {
      "assembly_id": "ASM_QUADRANGLE_NORTH",
      "name": "Quadrangle North",
      "designation_status": "candidate",
      "description": "Northern section of Existing Quadrangle",
      "capacity_estimate": 300,
      "surface": "grass",
      "shade": true,
      "assigned_buildings": ["building_016", "building_009", "building_008"],
      "access_routes": ["PATH_CENTRAL_SPINE", "PATH_EAST_PERIMETER"],
      "coordinates": {
        "latitude": 14.300750,
        "longitude": 121.009100,
        "source": "field_gps",
        "accuracy_m": 4.0
      },
      "source": "master_plan_visual",
      "official_designation": null,
      "authorized_by": null,
      "authorization_date": null
    },
    {
      "assembly_id": "ASM_QUADRANGLE_SOUTH",
      "name": "Quadrangle South",
      "designation_status": "candidate",
      "description": "Southern section of Existing Quadrangle near Main Building Hall",
      "capacity_estimate": 200,
      "surface": "grass",
      "shade": false,
      "assigned_buildings": ["building_016"],
      "access_routes": ["PATH_MAIN_ENTRANCE"],
      "coordinates": {
        "latitude": 14.300400,
        "longitude": 121.009000,
        "source": "field_gps",
        "accuracy_m": 5.0
      },
      "source": "posted_diagram",
      "official_designation": null,
      "authorized_by": null,
      "authorization_date": null
    }
  ]
}
```

### Schema 3: Uncertain/Unreadable Information Log
```json
{
  "unresolved_items": [
    {
      "building_id": "building_016",
      "floor_id": "FL02",
      "item_type": "exit",
      "description": "Symbol appears to be emergency exit but label unreadable due to glare",
      "photo_reference": "EVAC_BLDG016_FL02_EXITS.jpg",
      "action_needed": "Re-photograph from different angle or confirm with Safety Office"
    },
    {
      "building_id": "building_009",
      "floor_id": "FL01",
      "item_type": "assembly_point",
      "description": "Diagram shows 'Assembly Area B' but location arrow points off-diagram",
      "photo_reference": "EVAC_BLDG009_FL01_ASSEMBLY.jpg",
      "action_needed": "Check adjacent building diagram or Safety Office"
    }
  ]
}
```

---

## Phase 5: Extraction Script Template

### Script: `extract_evacuation_data.py`

```python
#!/usr/bin/env python3
"""
Template for extracting structured data from evacuation plan photos.
This is a MANUAL-ASSISTED script - you fill in the data, it validates and outputs JSON.
"""

import json
from pathlib import Path
from datetime import date

EVAC_ROOT = Path("research_data/evacuation_plans")

def create_building_template(building_folder):
    """Generate a starter JSON template for a building based on its photo folders."""
    building_id = building_folder.name  # e.g., "BLDG-016_MAIN_HALL"
    
    floors = []
    for floor_dir in sorted(building_folder.iterdir()):
        if floor_dir.is_dir() and floor_dir.name.startswith("FL"):
            photos = list(floor_dir.glob("*.jpg"))
            floors.append({
                "floor_id": floor_dir.name,
                "floor_label": floor_dir.name.replace("FL", "Floor "),
                "source_photos": [p.name for p in photos],
                "exits": [],
                "staircases": [],
                "corridors": [],
                "evacuation_routes": [],
                "assembly_points_referenced": [],
                "fire_equipment": [],
                "first_aid": [],
                "legend_symbols": [],
                "you_are_here": {},
                "verification": {
                    "source": "posted_diagram",
                    "photo_date": str(date.today()),
                    "diagram_date_posted": None,
                    "confirmed_current_by": None,
                    "confidence": "medium",
                    "notes": "Awaiting manual review"
                }
            })
    
    template = {
        "building_id": building_id.replace("BLDG-", "building_").lower(),
        "building_name": building_id.split("_", 1)[1].replace("_", " ").title() if "_" in building_id else "UNKNOWN",
        "floors": floors
    }
    
    output_file = building_folder / f"{building_id}_evacuation_data.json"
    with open(output_file, 'w') as f:
        json.dump(template, f, indent=2)
    
    print(f"Created template: {output_file}")

def main():
    for building_folder in EVAC_ROOT.iterdir():
        if building_folder.is_dir() and building_folder.name.startswith("BLDG-"):
            create_building_template(building_folder)

if __name__ == "__main__":
    main()
```

### Usage
```bash
cd research_data/evacuation_plans
python extract_evacuation_data.py
# Then EDIT each generated JSON file with actual extracted data
```

---

## Phase 6: Validation & Cross-Reference

### Validation Checklist (Per Building)

| Check | Method | Pass Criteria |
|---|---|---|
| **Diagram Currency** | Check date on poster vs. Safety Office records | Date ≤ 1 year old, or confirmed current |
| **Exit Count** | Count exits on diagram vs. field walkthrough | Match (or documented discrepancy) |
| **Stair Connectivity** | Stairs on FL01 connect to FL02 on diagram | Consistent across floors |
| **Assembly Points** | Referenced assembly points exist in campus data | All `assembly_id` in `assembly_points.json` |
| **Route Continuity** | Evacuation routes form continuous paths | No dead ends except at exits/assembly |
| **Fire Equipment** | Extinguishers on diagram match field GPS | ±1 location accuracy |
| **Legend Completeness** | All symbols on diagram explained in legend | No unknown symbols |

### Discrepancy Resolution

| Discrepancy Type | Resolution |
|---|---|
| Diagram shows exit, field shows locked | Mark `verification_status: "discrepancy_locked"`; report to Safety Office |
| Diagram missing exit found in field | Add to JSON with `source: "field_observation"` |
| Assembly point on diagram not in master plan | Add as `designation_status: "candidate"` |
| Stair on diagram doesn't match building | Flag for Safety Office review |

---

## Phase 7: Flutter Integration

### Where Data Goes

| Data Type | Flutter Location | Model |
|---|---|---|
| Assembly Points | `lib/src/features/map/data/evacuation_areas.geojson` | `CampusBoundary`-like or new `EvacuationArea` model |
| Building Exits | `CampusBuilding` model → add `exits: List<BuildingExit>` | Extend `campus_building.dart` |
| Evacuation Routes | `EvacuationGraph` → nodes/edges | `lib/src/shared/models/evacuation_graph.dart` |
| Fire Equipment | `EvacuationNode` with `type: fireExtinguisher` | Existing model supports this |
| First Aid | `EvacuationNode` with `type: firstAid` | Existing model supports this |

### Required Model Extensions

**In `campus_building.dart`:**
```dart
@freezed
abstract class BuildingExit with _$BuildingExit {
  const factory BuildingExit({
    required String exitId,
    required String type, // main, emergency, fire_exit
    required String description,
    required String accessibility, // wheelchair, stairs_only, ramp
    required String leadsTo, // pathway_id or assembly_id
    required String signage, // illuminated, standard, none
    LatLng? coordinates, // if GPS verified
  }) = _BuildingExit;
}

@freezed
abstract class CampusBuilding with _$CampusBuilding {
  // ... existing fields ...
  @Default([]) List<BuildingExit> exits;
}
```

**In `evacuation_graph.dart`:** Already supports all needed node/edge types.

---

## Quick-Reference: Photo-to-Data Mapping

| Photo Suffix | Extracts To |
|---|---|
| `_FULL.jpg` | Overall layout, orientation, "You Are Here" |
| `_EXITS.jpg` | Exit locations, types, signage |
| `_STAIRS.jpg` | Staircase locations, types, floor connections |
| `_ASSEMBLY.jpg` | Assembly point labels, assignments |
| `_CORRIDORS.jpg` | Corridor paths, widths, directions |
| `_LEGEND.jpg` | Symbol dictionary |
| `_YOUAREHERE.jpg` | Diagram orientation reference |
| `_FIREEXT.jpg` | Fire extinguisher locations, types |
| `_FIRSTAID.jpg` | First aid locations |

---

## Important Reminders

1. **Never invent data** — If unreadable, log in `unresolved_items.json`
2. **Distinguish sources** — `posted_diagram` vs `field_observation` vs `official_plan`
3. **Track diagram dates** — Posted diagrams may be outdated
4. **Assembly points need authorization** — Only `designation_status: "official"` with written proof
5. **Coordinate with Safety Office** — They are the authority; your app reflects their plan

---

**Guide Version:** 1.0  
**Prepared for:** SAFENAV CAVITE — EARIST Cavite Campus  
**Dependencies:** Python 3.15+, organized photo folders