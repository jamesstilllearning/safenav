#!/usr/bin/env python3
"""
SAFENAV CAVITE — GIS Setup Verification Script

Run after QGIS/GDAL/Google Earth Pro installation to verify
all tools are correctly configured and accessible.

Usage:
    py verify_gis_setup.py
"""

import subprocess
import sys
import os
from pathlib import Path

def run_cmd(cmd, description):
    """Run a command and return success status."""
    print(f"\n🔍 Checking {description}...")
    try:
        result = subprocess.run(cmd, shell=True, capture_output=True, text=True, timeout=30)
        if result.returncode == 0:
            output = result.stdout.strip()
            if output:
                print(f"   ✅ {output.split(chr(10))[0]}")  # First line only
            else:
                print(f"   ✅ Available")
            return True
        else:
            print(f"   ❌ Failed: {result.stderr.strip()}")
            return False
    except subprocess.TimeoutExpired:
        print(f"   ❌ Timeout")
        return False
    except Exception as e:
        print(f"   ❌ Error: {e}")
        return False

def check_qgis():
    """Check QGIS installation."""
    print("\n" + "="*60)
    print("QGIS VERIFICATION")
    print("="*60)

    checks = []

    # Check QGIS executable
    checks.append(run_cmd('qgis --version', 'QGIS executable'))

    # Check QGIS Python console
    checks.append(run_cmd('python -c "import qgis.core; print(qgis.core.QGIS_VERSION)"', 'QGIS Python bindings'))

    # Check processing framework
    checks.append(run_cmd('python -c "import processing; print(\"Processing framework available\")"', 'QGIS Processing framework'))

    return all(checks)

def check_gdal():
    """Check GDAL/OGR installation."""
    print("\n" + "="*60)
    print("GDAL/OGR VERIFICATION")
    print("="*60)

    checks = []

    # Check ogr2ogr
    checks.append(run_cmd('ogr2ogr --version', 'ogr2ogr'))

    # Check gdalinfo
    checks.append(run_cmd('gdalinfo --version', 'gdalinfo'))

    # Check Python bindings
    checks.append(run_cmd('python -c "from osgeo import gdal, ogr; print(f\"GDAL {gdal.__version__}, OGR {ogr.__version__}\")"', 'Python GDAL/OGR bindings'))

    # Check EPSG support
    checks.append(run_cmd('python -c "from osgeo import osr; srs = osr.SpatialReference(); srs.ImportFromEPSG(32651); print(f\"EPSG:32651 = {srs.GetName()}\")"', 'EPSG:32651 (UTM 51N) support'))

    checks.append(run_cmd('python -c "from osgeo import osr; srs = osr.SpatialReference(); srs.ImportFromEPSG(4326); print(f\"EPSG:4326 = {srs.GetName()}\")"', 'EPSG:4326 (WGS84) support'))

    return all(checks)

def check_google_earth():
    """Check Google Earth Pro installation."""
    print("\n" + "="*60)
    print("GOOGLE EARTH PRO VERIFICATION")
    print("="*60)

    # Check common install paths
    paths = [
        r"C:\Program Files\Google\Google Earth Pro\client\googleearth.exe",
        r"C:\Program Files (x86)\Google\Google Earth Pro\client\googleearth.exe",
    ]

    found = False
    for path in paths:
        if os.path.exists(path):
            print(f"   ✅ Found at: {path}")
            found = True
            break

    if not found:
        print(f"   ❌ Not found in standard locations")
        print(f"   Checked: {paths}")

    return found

def check_python_packages():
    """Check Python GIS packages."""
    print("\n" + "="*60)
    print("PYTHON GIS PACKAGES VERIFICATION")
    print("="*60)

    packages = [
        ('geopandas', 'import geopandas as gpd; print(gpd.__version__)'),
        ('shapely', 'import shapely; print(shapely.__version__)'),
        ('rasterio', 'import rasterio; print(rasterio.__version__)'),
        ('pyproj', 'import pyproj; print(pyproj.__version__)'),
        ('fiona', 'import fiona; print(fiona.__version__)'),
    ]

    checks = []
    for name, check_cmd in packages:
        checks.append(run_cmd(f'python -c "{check_cmd}"', name))

    return all(checks)

def check_project_structure():
    """Check SAFENAV project structure."""
    print("\n" + "="*60)
    print("PROJECT STRUCTURE VERIFICATION")
    print("="*60)

    project_root = Path(__file__).parent.parent
    checks = []

    required_dirs = [
        'docs',
        'assets/data',
        'lib/src/features/map/data',
        'research_data/master_site_plan',
        'research_data/evacuation_plans',
        'research_data/building_photos',
        'research_data/pathway_photos',
        'research_data/campus_photos',
        'research_data/geospatial_data',
        'research_data/field_observations',
        'research_data/verification_records',
        'research_data/schemas',
    ]

    for dir_path in required_dirs:
        full_path = project_root / dir_path
        if full_path.exists():
            print(f"   ✅ {dir_path}")
            checks.append(True)
        else:
            print(f"   ❌ {dir_path} (MISSING)")
            checks.append(False)

    required_files = [
        'assets/data/campus_buildings.json',
        'lib/src/features/map/data/campus_boundary.geojson',
        'lib/src/features/map/data/campus_buildings.geojson',
        'lib/src/features/map/data/campus_pathways.geojson',
        'research_data/master_site_plan/EARIST_CAVITE_Master_Site.png',
        'research_data/master_site_plan/gcp_reference_template.csv',
        'research_data/organize_photos.py',
        'research_data/extract_evacuation_data.py',
        'research_data/schemas/building_information_schema.json',
        'research_data/schemas/evacuation_floor_plan_schema.json',
        'research_data/schemas/pathway_observation_schema.json',
        'research_data/schemas/assembly_point_schema.json',
        'research_data/geospatial_data/qgis_project_template.md',
    ]

    for file_path in required_files:
        full_path = project_root / file_path
        if full_path.exists():
            print(f"   ✅ {file_path}")
            checks.append(True)
        else:
            print(f"   ❌ {file_path} (MISSING)")
            checks.append(False)

    return all(checks)

def check_flutter_env():
    """Check Flutter environment."""
    print("\n" + "="*60)
    print("FLUTTER ENVIRONMENT VERIFICATION")
    print("="*60)

    checks = []

    checks.append(run_cmd('flutter --version', 'Flutter SDK'))
    checks.append(run_cmd('dart --version', 'Dart SDK'))

    # Check if project compiles
    project_root = Path(__file__).parent.parent
    os.chdir(project_root)
    checks.append(run_cmd('flutter pub get', 'Flutter dependencies'))
    checks.append(run_cmd('flutter analyze --no-fatal-infos', 'Flutter static analysis'))

    return all(checks)

def main():
    print("="*60)
    print("SAFENAV CAVITE — GIS Setup Verification")
    print("="*60)
    print(f"Project root: {Path(__file__).parent.parent}")
    print(f"Python: {sys.version}")

    all_passed = True

    # Check Flutter first (should already work)
    all_passed &= check_flutter_env()

    # Check GIS tools (may fail if not installed)
    all_passed &= check_qgis()
    all_passed &= check_gdal()
    all_passed &= check_google_earth()
    all_passed &= check_python_packages()

    # Check project structure
    all_passed &= check_project_structure()

    print("\n" + "="*60)
    print("SUMMARY")
    print("="*60)

    if all_passed:
        print("✅ ALL CHECKS PASSED — Environment ready for geospatial work!")
        return 0
    else:
        print("⚠️  SOME CHECKS FAILED — Review output above")
        print("\nNext steps:")
        print("1. Install QGIS LTR + GDAL via OSGeo4W if not done")
        print("2. Install Google Earth Pro if not done")
        print("3. Install Python GIS packages: py -m pip install geopandas shapely rasterio pyproj fiona")
        print("4. Re-run this script after installations")
        return 1

if __name__ == '__main__':
    sys.exit(main())