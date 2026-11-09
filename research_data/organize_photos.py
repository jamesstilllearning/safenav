#!/usr/bin/env python3
"""
SAFENAV CAVITE — Automated Photo Organization Script

Organizes photos from campus walkthrough into structured folders
based on filename convention.

Run from research_data/ after transferring photos from phone.
"""

import os
import re
import shutil
from pathlib import Path
from datetime import datetime

# ============================================================
# CONFIGURATION
# ============================================================
SOURCE_DIR = Path(".")  # Where photos are initially dumped
DRY_RUN = False  # Set True to preview without moving

# Filename patterns
BUILDING_PATTERN = re.compile(
    r'BLDG[_-](\d+)[_-](ENTRANCE[_-](MAIN|EMERGENCY)|SIGNAGE|EXTERIOR[_-](N|E|S|W)|FLOORS?)\.jpg$',
    re.IGNORECASE
)

EVAC_PATTERN = re.compile(
    r'EVAC[_-]BLDG(\d+)[_-]FL(\d+)[_-](FULL|EXITS|STAIRS|ASSEMBLY|LEGEND|YOUAREHERE|FIREEXT|FIRSTAID|CORRIDORS?)\.jpg$',
    re.IGNORECASE
)

PATH_PATTERN = re.compile(
    r'PATH[_-](\w+)[_-](SURFACE|WIDTH|INTERSECTION|RAMP|LIGHTING)\.jpg$',
    re.IGNORECASE
)

GATE_PATTERN = re.compile(
    r'GATE[_-](\d+)[_-](EXTERIOR|SIGNAGE)\.jpg$',
    re.IGNORECASE
)

ASM_PATTERN = re.compile(
    r'ASM[_-](\w+)[_-](OVERVIEW|CAPACITY)\.jpg$',
    re.IGNORECASE
)

LAND_PATTERN = re.compile(
    r'LAND[_-](\w+)[_-](OVERVIEW|DETAIL|CROSSING)\.jpg$',
    re.IGNORECASE
)

UNCERTAIN_PATTERN = re.compile(
    r'UNCERTAIN[_-](\w+)[_-](.+)\.jpg$',
    re.IGNORECASE
)

# ============================================================
# HELPER FUNCTIONS
# ============================================================
def ensure_dir(path: Path):
    """Create directory if it doesn't exist."""
    if not DRY_RUN:
        path.mkdir(parents=True, exist_ok=True)

def move_file(src: Path, dst: Path):
    """Move file, handling duplicates."""
    if dst.exists():
        # Add timestamp to avoid overwrite
        stem = dst.stem
        suffix = dst.suffix
        timestamp = datetime.now().strftime("%H%M%S")
        dst = dst.with_name(f"{stem}_{timestamp}{suffix}")
    if not DRY_RUN:
        shutil.move(str(src), str(dst))
    print(f"  {'[DRY RUN] ' if DRY_RUN else ''}MOVED: {src.name} → {dst.relative_to(SOURCE_DIR)}")

def get_building_folder(match) -> str:
    """Convert building match to folder name."""
    bldg_num = int(match.group(1))
    return f"BLDG-{bldg_num:03d}"

# ============================================================
# MAIN ORGANIZATION LOGIC
# ============================================================
def organize_building_photos(file: Path, match):
    """Organize building-related photos."""
    bldg_folder = get_building_folder(match)
    photo_type = match.group(2).upper()

    if 'ENTRANCE' in photo_type:
        subfolder = "entrances"
    elif 'SIGNAGE' in photo_type:
        subfolder = "signage"
    elif 'EXTERIOR' in photo_type:
        subfolder = "exteriors"
    elif 'FLOOR' in photo_type:
        subfolder = "floors"
    else:
        subfolder = "misc"

    target_dir = SOURCE_DIR / "building_photos" / bldg_folder / subfolder
    ensure_dir(target_dir)
    move_file(file, target_dir / file.name)

def organize_evac_photos(file: Path, match):
    """Organize evacuation plan photos."""
    bldg_num = int(match.group(1))
    floor_num = int(match.group(2))
    bldg_folder = f"BLDG-{bldg_num:03d}"
    floor_folder = f"FL{floor_num:02d}"

    target_dir = SOURCE_DIR / "evacuation_plans" / bldg_folder / floor_folder
    ensure_dir(target_dir)
    move_file(file, target_dir / file.name)

def organize_path_photos(file: Path, match):
    """Organize pathway photos."""
    path_id = match.group(1).upper()
    target_dir = SOURCE_DIR / "pathway_photos" / f"PATH-{path_id}"
    ensure_dir(target_dir)
    move_file(file, target_dir / file.name)

def organize_gate_photos(file: Path, match):
    """Organize gate photos."""
    gate_num = int(match.group(1))
    target_dir = SOURCE_DIR / "campus_photos" / "gates" / f"GATE-{gate_num:03d}"
    ensure_dir(target_dir)
    move_file(file, target_dir / file.name)

def organize_asm_photos(file: Path, match):
    """Organize assembly area photos."""
    asm_name = match.group(1).upper()
    target_dir = SOURCE_DIR / "campus_photos" / "assembly_areas" / f"ASM-{asm_name}"
    ensure_dir(target_dir)
    move_file(file, target_dir / file.name)

def organize_land_photos(file: Path, match):
    """Organize landmark photos."""
    land_name = match.group(1).upper()
    target_dir = SOURCE_DIR / "campus_photos" / "landmarks" / f"LAND-{land_name}"
    ensure_dir(target_dir)
    move_file(file, target_dir / file.name)

def organize_uncertain_photos(file: Path, match):
    """Organize uncertain label investigation photos."""
    label = match.group(1).upper()
    target_dir = SOURCE_DIR / "verification_records" / "uncertain_labels" / f"UNCERTAIN-{label}"
    ensure_dir(target_dir)
    move_file(file, target_dir / file.name)

# ============================================================
# DISPATCHER
# ============================================================
HANDLERS = [
    (BUILDING_PATTERN, organize_building_photos),
    (EVAC_PATTERN, organize_evac_photos),
    (PATH_PATTERN, organize_path_photos),
    (GATE_PATTERN, organize_gate_photos),
    (ASM_PATTERN, organize_asm_photos),
    (LAND_PATTERN, organize_land_photos),
    (UNCERTAIN_PATTERN, organize_uncertain_photos),
]

def organize_all():
    """Main entry point."""
    if not SOURCE_DIR.exists():
        print(f"ERROR: Source directory {SOURCE_DIR} does not exist")
        return

    files = list(SOURCE_DIR.glob("*.jpg")) + list(SOURCE_DIR.glob("*.JPG")) + \
            list(SOURCE_DIR.glob("*.png")) + list(SOURCE_DIR.glob("*.PNG")) + \
            list(SOURCE_DIR.glob("*.jpeg")) + list(SOURCE_DIR.glob("*.JPEG"))

    if not files:
        print("No image files found in source directory.")
        return

    print(f"Found {len(files)} image files to organize.")
    if DRY_RUN:
        print("*** DRY RUN MODE - No files will be moved ***\n")

    organized = 0
    skipped = 0

    for file in files:
        matched = False
        for pattern, handler in HANDLERS:
            match = pattern.match(file.name)
            if match:
                try:
                    handler(file, match)
                    organized += 1
                    matched = True
                    break
                except Exception as e:
                    print(f"  ERROR processing {file.name}: {e}")
                    skipped += 1
                    matched = True
                    break

        if not matched:
            print(f"  SKIPPED (no pattern match): {file.name}")
            skipped += 1

    print(f"\nDone. Organized: {organized}, Skipped/Errors: {skipped}")

if __name__ == "__main__":
    import sys
    if len(sys.argv) > 1 and sys.argv[1] in ('-n', '--dry-run'):
        DRY_RUN = True
    organize_all()