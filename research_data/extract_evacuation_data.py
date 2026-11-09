#!/usr/bin/env python3
"""
SAFENAV CAVITE — Evacuation Data Extraction Template Generator

Generates starter JSON templates for each building based on
organized evacuation plan photo folders.

Run from research_data/evacuation_plans/ after photos are organized.
"""

import json
from pathlib import Path
from datetime import date

EVAC_ROOT = Path(".")

# Master plan building IDs mapping (from campus_buildings.json)
MASTER_PLAN_BUILDINGS = {
    "001": "building_001",  # PROPOSED DORMITORY BUILDING
    "002": "building_002",  # PROPOSED MULTIPURPOSE BUILDING (NW)
    "003": "building_003",  # EXISTING CANTEEN STALLS
    "004": "building_004",  # PROPOSED ENGINEERING BUILDING
    "005": "building_005",  # EXISTING CRIMINOLOGY BUILDING
    "006": "building_006",  # EXISTING MEDICAL AND DENTAL CLINIC
    "007": "building_007",  # EXISTING RESEARCH BUILDING
    "008": "building_008",  # ON-GOING CHTM BUILDING
    "009": "building_009",  # EXISTING FACULTY BUILDING
    "010": "building_010",  # ECC Library Extension - Learning Commons
    "011": "building_011",  # PROPOSED STAFF HOUSING (clipped)
    "012": "building_012",  # PROPOSED THEATER AND ARTS BUILDING
    "013": "building_013",  # PROPOSED CIT & ICT BUILDING
    "014": "building_014",  # PROPOSED MULTIPURPOSE BUILDING (Eastern)
    "015": "building_015",  # PROPOSED MATERIAL SEGREGATION FACILITY
    "016": "building_016",  # EXISTING MAIN BUILDING HALL -
    "017": "facility_017",  # ECC Guidance office
    "018": "facility_018",  # ECC Food Technology Laboratory
    "019": "facility_019",  # ecc beauty care facility
    "020": "facility_020",  # chtm simulation hostel
}

BUILDING_NAMES = {
    "building_001": "PROPOSED DORMITORY BUILDING",
    "building_002": "PROPOSED MULTIPURPOSE BUILDING",
    "building_003": "EXISTING CANTEEN STALLS",
    "building_004": "PROPOSED ENGINEERING BUILDING",
    "building_005": "EXISTING CRIMINOLOGY BUILDING",
    "building_006": "EXISTING MEDICAL AND DENTAL CLINIC",
    "building_007": "EXISTING RESEARCH BUILDING",
    "building_008": "ON-GOING CHTM BUILDING",
    "building_009": "EXISTING FACULTY BUILDING",
    "building_010": "ECC Library Extension - Learning Commons",
    "building_011": "PROPOSED STAFF HOUSING",
    "building_012": "PROPOSED THEATER AND ARTS BUILDING",
    "building_013": "PROPOSED CIT & ICT BUILDING",
    "building_014": "PROPOSED MULTIPURPOSE BUILDING",
    "building_015": "PROPOSED MATERIAL SEGREGATION FACILITY",
    "building_016": "EXISTING MAIN BUILDING HALL -",
    "facility_017": "ECC Guidance office",
    "facility_018": "ECC Food Technology Laboratory",
    "facility_019": "ecc beauty care facility",
    "facility_020": "chtm simulation hostel",
}

def create_floor_template(floor_dir: Path, building_id: str, floor_id: str):
    """Create a template for a single floor."""
    photos = sorted([p.name for p in floor_dir.glob("*.jpg")] +
                    [p.name for p in floor_dir.glob("*.JPG")] +
                    [p.name for p in floor_dir.glob("*.png")] +
                    [p.name for p in floor_dir.glob("*.PNG")])

    # Detect which photo types are present
    photo_types = set()
    for photo in photos:
        for suffix in ["FULL", "EXITS", "STAIRS", "ASSEMBLY", "LEGEND",
                       "YOUAREHERE", "FIREEXT", "FIRSTAID", "CORRIDORS"]:
            if f"_{suffix}." in photo.upper():
                photo_types.add(suffix.lower())

    floor_template = {
        "floor_id": floor_id,
        "floor_label": floor_id.replace("FL", "Floor "),
        "source_photos": photos,
        "photo_types_found": sorted(list(photo_types)),
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
            "notes": "Awaiting manual review. Fill in data from photos."
        }
    }
    return floor_template

def create_building_template(building_folder: Path):
    """Generate JSON template for a building."""
    folder_name = building_folder.name  # e.g., "BLDG-016_MAIN_HALL"

    # Extract building number
    import re
    match = re.match(r'BLDG-(\d+)', folder_name)
    if not match:
        print(f"  WARNING: Cannot parse building number from {folder_name}")
        return

    bldg_num = match.group(1)
    master_plan_id = MASTER_PLAN_BUILDINGS.get(bldg_num)
    if not master_plan_id:
        print(f"  WARNING: No master plan mapping for BLDG-{bldg_num}")
        master_plan_id = f"building_{bldg_num}"

    building_name = BUILDING_NAMES.get(master_plan_id, "UNKNOWN")

    floors = []
    for floor_dir in sorted(building_folder.iterdir()):
        if floor_dir.is_dir() and re.match(r'FL\d+', floor_dir.name):
            floors.append(create_floor_template(floor_dir, master_plan_id, floor_dir.name))

    template = {
        "master_plan_id": master_plan_id,
        "building_name": building_name,
        "folder_name": folder_name,
        "floors": floors,
        "building_level_notes": "",
        "verification_summary": {
            "total_floors_photographed": len(floors),
            "floors_with_full_diagram": len([f for f in floors if "full" in f["photo_types_found"]]),
            "floors_with_exits": len([f for f in floors if "exits" in f["photo_types_found"]]),
            "floors_with_stairs": len([f for f in floors if "stairs" in f["photo_types_found"]]),
            "floors_with_assembly": len([f for f in floors if "assembly" in f["photo_types_found"]]),
            "last_updated": str(date.today()),
            "status": "template_generated_awaiting_review"
        }
    }

    output_file = building_folder / f"{folder_name}_evacuation_data.json"
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(template, f, indent=2, ensure_ascii=False)

    print(f"  Created: {output_file.relative_to(EVAC_ROOT)}")

def create_campus_assembly_template():
    """Create campus-wide assembly points template."""
    template = {
        "assembly_points": [
            {
                "assembly_id": "ASM_QUADRANGLE_NORTH",
                "name": "Quadrangle North",
                "designation_status": "candidate",
                "description": "Northern section of Existing Quadrangle",
                "capacity_estimate": 300,
                "surface": "grass",
                "shade": True,
                "assigned_buildings": ["building_016", "building_009", "building_008"],
                "access_routes": ["PATH_CENTRAL_SPINE", "PATH_EAST_PERIMETER"],
                "coordinates": {
                    "latitude": None,
                    "longitude": None,
                    "source": "field_gps",
                    "accuracy_m": None
                },
                "source": "master_plan_visual",
                "official_designation": None,
                "authorized_by": None,
                "authorization_date": None,
                "notes": "Visible open space on master plan. Awaiting official designation."
            },
            {
                "assembly_id": "ASM_QUADRANGLE_SOUTH",
                "name": "Quadrangle South",
                "designation_status": "candidate",
                "description": "Southern section of Existing Quadrangle near Main Building Hall",
                "capacity_estimate": 200,
                "surface": "grass",
                "shade": False,
                "assigned_buildings": ["building_016"],
                "access_routes": ["PATH_MAIN_ENTRANCE"],
                "coordinates": {
                    "latitude": None,
                    "longitude": None,
                    "source": "field_gps",
                    "accuracy_m": None
                },
                "source": "posted_diagram",
                "official_designation": None,
                "authorized_by": None,
                "authorization_date": None,
                "notes": "Referenced on Main Building Hall evacuation diagrams."
            },
            {
                "assembly_id": "ASM_GRASS_QUADRANGLE",
                "name": "Proposed Grass Quadrangle",
                "designation_status": "candidate",
                "description": "Proposed grass quadrangle in NW campus area",
                "capacity_estimate": 500,
                "surface": "grass",
                "shade": False,
                "assigned_buildings": ["building_001", "building_002"],
                "access_routes": [],
                "coordinates": {
                    "latitude": None,
                    "longitude": None,
                    "source": "field_gps",
                    "accuracy_m": None
                },
                "source": "master_plan_visual",
                "official_designation": None,
                "authorized_by": None,
                "authorization_date": None,
                "notes": "Proposed open space on master plan. Not yet built/verified."
            }
        ],
        "unresolved_items": [],
        "last_updated": str(date.today()),
        "notes": "All assembly points are CANDIDATE until officially designated by Campus Safety Office."
    }

    output_file = EVAC_ROOT / "campus_assembly_points.json"
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(template, f, indent=2, ensure_ascii=False)

    print(f"  Created: {output_file.relative_to(EVAC_ROOT)}")

def main():
    print("SAFENAV CAVITE — Evacuation Data Template Generator")
    print("=" * 55)

    if not EVAC_ROOT.exists():
        print(f"ERROR: {EVAC_ROOT} does not exist")
        return

    building_folders = [d for d in EVAC_ROOT.iterdir()
                       if d.is_dir() and d.name.startswith("BLDG-")]

    if not building_folders:
        print("No BLDG-* folders found. Run organize_photos.py first.")
        return

    print(f"Found {len(building_folders)} building folders.\n")

    for building_folder in sorted(building_folders):
        create_building_template(building_folder)

    print("\nGenerating campus assembly points template...")
    create_campus_assembly_template()

    print("\nDone! Next steps:")
    print("1. Open each generated JSON file")
    print("2. Fill in data from photos (exits, stairs, routes, assembly points)")
    print("3. Update verification.confidence based on diagram currency")
    print("4. Add GPS coordinates for assembly points after fieldwork")
    print("5. Cross-reference with official evacuation plan from Safety Office")

if __name__ == "__main__":
    main()