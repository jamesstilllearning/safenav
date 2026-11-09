# Template 5: Campus Field Observation Template

**Print multiple copies (one per feature) or use digital CSV.**

---

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

## Quick Reference: Feature ID Naming Convention

| Feature Type | Prefix | Example |
|--------------|--------|---------|
| Building Entrance | `BLDG-ENT-` | `BLDG-ENT-001` |
| Pathway | `PATH-` | `PATH-001` |
| Gate | `GATE-` | `GATE-001` |
| Intersection | `JUNC-` | `JUNC-001` |
| Landmark | `LAND-` | `LAND-001` |
| Assembly Area | `ASM-` | `ASM-001` |
| Utility | `UTIL-` | `UTIL-001` |
| Evacuation Route | `EVAC-` | `EVAC-001` |

**Master Plan Reference IDs** (from `campus_buildings.json`):
- Buildings: `building_001` through `building_016`
- Facilities: `facility_017` through `facility_020`
- Roads: `road_001`
- Gates: `gate_001`, `gate_002`
- Pathway Classes: `path_class_001`, `path_class_002`
- Landmarks: `landmark_001` through `landmark_008`