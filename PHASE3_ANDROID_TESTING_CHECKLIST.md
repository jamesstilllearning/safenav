# Phase 3 Core Navigation - Manual Android Testing Checklist

**Project:** SAFENAV CAVITE  
**Phase:** 3 - Core Navigation Functionality  
**Target Device:** Android Physical Device (required for GPS)  
**Tester:** QA Engineer  
**Date:** ___________

---

## Test Environment Setup

### Prerequisites
- [ ] Android device with Android 8.0+ (API 26+)
- [ ] Device has GPS/location services enabled
- [ ] App installed via `flutter install` or `flutter run --release`
- [ ] Location permissions granted (Settings > Apps > SAFENAV > Permissions > Location: Allow all the time)
- [ ] Internet connectivity for map tiles (or offline tiles cached)
- [ ] Campus boundary/building/pathway data loaded (check map screen)

### Device Preparation
- [ ] Disable battery optimization for SAFENAV app
- [ ] Ensure GPS is set to "High accuracy" mode
- [ ] Clear app data before testing (for fresh state)
- [ ] Device has sufficient battery (>50%)

---

## Test Categories

### 1. Navigation Initialization Tests

| Test ID | Description | Steps | Expected Result | Pass/Fail | Notes |
|---------|-------------|-------|-----------------|-----------|-------|
| NAV-001 | Idle → Initializing state transition | Open Navigation tab → Select destination from Common Destinations | State shows "Computing route to [destination]..." with spinner | [ ] Pass / [ ] Fail | |
| NAV-002 | GPS-based start position | No manual start selected → Tap "Start Navigation" on route preview | Route computed from current GPS location | [ ] Pass / [ ] Fail | |
| NAV-003 | Manual start position | Long-press on map → Select "Navigate from here" → Choose destination | Route computed from manual start point | [ ] Pass / [ ] Fail | |
| NAV-004 | Route computation success | Valid start + end on campus pathways | State transitions to Ready with route preview showing distance/duration | [ ] Pass / [ ] Fail | |
| NAV-005 | Route computation failure | Select destination outside campus boundary | State transitions to Error with "No route found" message | [ ] Pass / [ ] Fail | |
| NAV-006 | GPS unavailable fallback | Disable GPS → Try start navigation without manual start | Error state: "Unable to get current location" | [ ] Pass / [ ] Fail | |

### 2. GPS Location Integration Tests

| Test ID | Description | Steps | Expected Result | Pass/Fail | Notes |
|---------|-------------|-------|-----------------|-----------|-------|
| GPS-001 | Permission request on active nav | Tap "Start Navigation" in Ready state | System location permission dialog appears | [ ] Pass / [ ] Fail | |
| GPS-002 | Permission granted - GPS starts | Grant permission | Position updates begin, map centers on user | [ ] Pass / [ ] Fail | |
| GPS-003 | Permission denied - manual mode | Deny permission | Active navigation starts without GPS (manual advance only) | [ ] Pass / [ ] Fail | |
| GPS-004 | GPS accuracy sufficient | Walk along pathway with good signal | Position updates ~every 3m, accuracy < 10m | [ ] Pass / [ ] Fail | |
| GPS-005 | GPS signal loss handling | Enter building/basement → Observe state | Navigation continues in manual mode, shows "GPS signal weak" | [ ] Pass / [ ] Fail | |
| GPS-006 | GPS recovery | Exit building → GPS restored | Automatic GPS tracking resumes, position updates continue | [ ] Pass / [ ] Fail | |

### 3. Navigation State Transition Tests

| Test ID | Description | Steps | Expected Result | Pass/Fail | Notes |
|---------|-------------|-------|-----------------|-----------|-------|
| STATE-001 | Idle → Initializing → Ready → Active | Complete full navigation flow | All states display correctly with proper UI | [ ] Pass / [ ] Fail | |
| STATE-002 | Active → Idle on end | Tap "End Navigation" in active mode | Returns to Idle state, map clears route | [ ] Pass / [ ] Fail | |
| STATE-003 | Error → Idle on dismiss | Tap "OK" on error screen | Returns to Idle state | [ ] Pass / [ ] Fail | |
| STATE-004 | Ready → Idle on cancel | Tap "Cancel" in Ready state | Returns to Idle, route cleared | [ ] Pass / [ ] Fail | |
| STATE-005 | Active → Ready on route clear? | Not applicable (Active only goes to Idle) | N/A | N/A | |

### 4. Route Computation (Dijkstra) Tests

| Test ID | Description | Steps | Expected Result | Pass/Fail | Notes |
|---------|-------------|-------|-----------------|-----------|-------|
| ROUTE-001 | Pathway graph connectivity | Navigate between any two buildings | Route follows campus pathways, not straight line | [ ] Pass / [ ] Fail | |
| ROUTE-002 | Emergency path avoidance | Navigate near emergency exits | Route avoids emergency-only pathways (avoidEmergencyPaths=true) | [ ] Pass / [ ] Fail | |
| ROUTE-003 | Main path preference | Multiple route options exist | Route prefers main pathways (preferMainPaths=true) | [ ] Pass / [ ] Fail | |
| ROUTE-004 | Route geometry display | View route on map in Ready state | Polyline shows all waypoints correctly | [ ] Pass / [ ] Fail | |
| ROUTE-005 | Distance/duration accuracy | Compare with known campus distances | Values within 10% of actual walking distance/time | [ ] Pass / [ ] Fail | |

### 5. Waypoint Detection & Instruction Advancement Tests

| Test ID | Description | Steps | Expected Result | Pass/Fail | Notes |
|---------|-------------|-------|-----------------|-----------|-------|
| WAY-001 | Auto-advance at 15m threshold | Walk along route, approach next waypoint | Instruction advances when within 15m of waypoint | [ ] Pass / [ ] Fail | |
| WAY-002 | No premature advance | Stay >15m from waypoint | Instruction does NOT advance | [ ] Pass / [ ] Fail | |
| WAY-003 | Last instruction handling | Reach final waypoint | Stays on arrive instruction, doesn't advance past | [ ] Pass / [ ] Fail | |
| WAY-004 | Manual next instruction | Tap "Next" button in active nav | Advances to next instruction, speaks it | [ ] Pass / [ ] Fail | |
| WAY-005 | Manual previous instruction | Tap "Previous" after advancing | Goes back to previous instruction | [ ] Pass / [ ] Fail | |
| WAY-006 | Previous at first instruction | Tap "Previous" at start | Stays at first instruction (index 0) | [ ] Pass / [ ] Fail | |

### 6. Route Deviation Detection Tests

| Test ID | Description | Steps | Expected Result | Pass/Fail | Notes |
|---------|-------------|-------|-----------------|-----------|-------|
| DEV-001 | Deviation >25m detected | Intentionally walk off route >25m | "Route deviation detected" after 10s debounce | [ ] Pass / [ ] Fail | |
| DEV-002 | Debounce timer 10s | Walk off route, return within 10s | No reroute triggered | [ ] Pass / [ ] Fail | |
| DEV-003 | Reroute triggered after debounce | Stay off route >10s | Auto-reroute begins, speaks "Route updated. Recalculating." | [ ] Pass / [ ] Fail | |
| DEV-004 | Cancel reroute on return | Deviate >25m, return before 10s | Reroute timer cancelled, no reroute | [ ] Pass / [ ] Fail | |
| DEV-005 | Deviation UI indicator | During deviation | Visual indicator shows "Off route" | [ ] Pass / [ ] Fail | |

### 7. Automatic Rerouting Tests

| Test ID | Description | Steps | Expected Result | Pass/Fail | Notes |
|---------|-------------|-------|-----------------|-----------|-------|
| RER-001 | New route from current position | Trigger reroute mid-navigation | New route computed from current GPS location | [ ] Pass / [ ] Fail | |
| RER-002 | Instruction index reset | After reroute completes | Current instruction resets to 0 (start) | [ ] Pass / [ ] Fail | |
| RER-003 | Reroute voice announcement | Reroute triggered | Speaks "Route updated" + new route summary + first instruction | [ ] Pass / [ ] Fail | |
| RER-004 | Uses same pathway graph | Verify route after reroute | New route still follows campus pathways | [ ] Pass / [ ] Fail | |
| RER-005 | Multiple reroutes | Deviate, reroute, deviate again | Each reroute works independently | [ ] Pass / [ ] Fail | |

### 8. Destination Arrival Tests

| Test ID | Description | Steps | Expected Result | Pass/Fail | Notes |
|---------|-------------|-------|-----------------|-----------|-------|
| ARR-001 | Arrival at 20m threshold | Walk to destination building entrance | Arrival detected when within 20m on last instruction | [ ] Pass / [ ] Fail | |
| ARR-002 | No early arrival | 25m from destination on last instruction | Arrival NOT detected | [ ] Pass / [ ] Fail | |
| ARR-003 | Arrival stops GPS | Reach destination | GPS tracking stops, position updates cease | [ ] Pass / [ ] Fail | |
| ARR-004 | Arrival speaks final instruction | Reach destination | Speaks "You have arrived at [destination]" | [ ] Pass / [ ] Fail | |
| ARR-005 | Arrival state shows completion | After arrival | Screen shows "Navigation Complete" with summary | [ ] Pass / [ ] Fail | |
| ARR-006 | CompletedAt timestamp | Check session after arrival | completedAt timestamp set correctly | [ ] Pass / [ ] Fail | |

### 9. Voice Guidance Tests

| Test ID | Description | Steps | Expected Result | Pass/Fail | Notes |
|---------|-------------|-------|-----------------|-----------|-------|
| VOICE-001 | Route summary on start | Tap "Start Navigation" | Speaks distance, duration, turn count | [ ] Pass / [ ] Fail | |
| VOICE-002 | First instruction on start | After route summary | Speaks first instruction immediately | [ ] Pass / [ ] Fail | |
| VOICE-003 | Next instruction on advance | Auto or manual advance | Speaks next instruction | [ ] Pass / [ ] Fail | |
| VOICE-004 | Toggle voice off | Tap voice icon in app bar → Disable | No speech for subsequent instructions | [ ] Pass / [ ] Fail | |
| VOICE-005 | Toggle voice on | Re-enable voice guidance | Speech resumes for next instruction | [ ] Pass / [ ] Fail | |
| VOICE-006 | Reroute announcement | Trigger reroute | Speaks "Route updated. Recalculating." then new summary | [ ] Pass / [ ] Fail | |
| VOICE-007 | Arrival announcement | Reach destination | Speaks final arrival instruction | [ ] Pass / [ ] Fail | |
| VOICE-008 | Speech language | Change language in settings | Voice uses selected language (if supported) | [ ] Pass / [ ] Fail | |

### 10. Navigation Cancellation & Cleanup Tests

| Test ID | Description | Steps | Expected Result | Pass/Fail | Notes |
|---------|-------------|-------|-----------------|-----------|-------|
| CLEAN-001 | End navigation stops GPS | Tap "End Navigation" | GPS updates stop, location service stops | [ ] Pass / [ ] Fail | |
| CLEAN-002 | End navigation stops voice | Tap "End Navigation" | TTS stops, no queued speech plays | [ ] Pass / [ ] Fail | |
| CLEAN-003 | End navigation resets state | After end | Returns to Idle state | [ ] Pass / [ ] Fail | |
| CLEAN-004 | End navigation clears session | Check map after end | Route polyline removed from map | [ ] Pass / [ ] Fail | |
| CLEAN-005 | Dispose cleans resources | Close app during active nav | No memory leaks, TTS disposed | [ ] Pass / [ ] Fail | |
| CLEAN-006 | Multiple start/stop cycles | Start → End → Start → End (5x) | No duplicate subscriptions, no crashes | [ ] Pass / [ ] Fail | |
| CLEAN-007 | Rapid state changes | Quickly tap start/cancel/start | No race conditions, clean state | [ ] Pass / [ ] Fail | |

### 11. Map Screen Integration Tests

| Test ID | Description | Steps | Expected Result | Pass/Fail | Notes |
|---------|-------------|-------|-----------------|-----------|-------|
| MAP-001 | Building Navigate button | Tap building → Tap "Navigate" | Opens Navigation tab with building as destination | [ ] Pass / [ ] Fail | |
| MAP-002 | Pathway Navigate button | Tap pathway → Tap "Navigate using pathway" | Opens Navigation tab with pathway endpoint as destination | [ ] Pass / [ ] Fail | |
| MAP-003 | Correct coordinates passed | Navigate from map | Destination coordinates match building/pathway location | [ ] Pass / [ ] Fail | |
| MAP-004 | GPS-based start from map | No manual selection | Route starts from current GPS location | [ ] Pass / [ ] Fail | |
| MAP-005 | NavigationController integration | Start nav from map | NavigationController properly initialized and used | [ ] Pass / [ ] Fail | |
| MAP-006 | Map updates during nav | Active navigation on Map tab | User location marker moves, route highlighted | [ ] Pass / [ ] Fail | |

### 12. Performance & Reliability Tests

| Test ID | Description | Steps | Expected Result | Pass/Fail | Notes |
|---------|-------------|-------|-----------------|-----------|-------|
| PERF-001 | GPS stream at 3m intervals | Walk for 5 minutes | Position updates ~every 3m, no missed updates | [ ] Pass / [ ] Fail | |
| PERF-002 | Widget rebuild frequency | Active nav for 5 minutes | UI responsive, no jank (60fps) | [ ] Pass / [ ] Fail | |
| PERF-003 | Memory leak check | Start/stop nav 20x | Memory stable, no gradual increase | [ ] Pass / [ ] Fail | |
| PERF-004 | No async errors | Full navigation session | No uncaught exceptions in console | [ ] Pass / [ ] Fail | |
| PERF-005 | TTS no repetition | Multiple instructions | Each instruction spoken once, no duplicates | [ ] Pass / [ ] Fail | |
| PERF-006 | Multiple subscriptions | Rapid start/end cycles | Only one GPS subscription active at a time | [ ] Pass / [ ] Fail | |
| PERF-007 | Route calc <2s | Compute route | Route computed within 2 seconds | [ ] Pass / [ ] Fail | |
| PERF-008 | GPS inaccuracy handling | Simulate GPS jump (mock or weak signal) | Deviation logic handles gracefully | [ ] Pass / [ ] Fail | |

---

## Test Execution Summary

### Device Info
- **Device Model:** ___________
- **Android Version:** ___________
- **App Version:** ___________
- **Test Date:** ___________
- **Tester:** ___________

### Overall Results

| Category | Total Tests | Passed | Failed | Blocked | Pass Rate |
|----------|-------------|--------|--------|---------|-----------|
| Navigation Initialization | 6 | | | | |
| GPS Location Integration | 6 | | | | |
| Navigation State Transitions | 5 | | | | |
| Route Computation | 5 | | | | |
| Waypoint Detection | 6 | | | | |
| Route Deviation Detection | 5 | | | | |
| Automatic Rerouting | 5 | | | | |
| Destination Arrival | 6 | | | | |
| Voice Guidance | 8 | | | | |
| Navigation Cancellation | 7 | | | | |
| Map Screen Integration | 6 | | | | |
| Performance & Reliability | 8 | | | | |
| **TOTAL** | **73** | | | | |

### Critical Issues Found
1. ________________________________________
2. ________________________________________
3. ________________________________________

### Notes & Observations
_____________________________________________________________________________
_____________________________________________________________________________
_____________________________________________________________________________

### Sign-off
**QA Engineer:** ________________ **Date:** ___________  
**Lead Developer:** ________________ **Date:** ___________  
**Project Manager:** ________________ **Date:** ___________

---

## Emulator vs Physical Device Notes

| Test Category | Can Test on Emulator | Requires Physical Device |
|---------------|---------------------|-------------------------|
| Navigation Initialization | ✅ Yes (with mock location) | - |
| GPS Location Integration | ⚠️ Partial (mock location only) | ✅ Yes (real GPS) |
| Navigation State Transitions | ✅ Yes | - |
| Route Computation | ✅ Yes | - |
| Waypoint Detection | ⚠️ Partial (mock location) | ✅ Yes (real movement) |
| Route Deviation Detection | ⚠️ Partial (mock location) | ✅ Yes (real movement) |
| Automatic Rerouting | ⚠️ Partial (mock location) | ✅ Yes (real movement) |
| Destination Arrival | ⚠️ Partial (mock location) | ✅ Yes (real movement) |
| Voice Guidance | ✅ Yes | - |
| Navigation Cancellation | ✅ Yes | - |
| Map Screen Integration | ✅ Yes | - |
| Performance & Reliability | ⚠️ Limited | ✅ Yes |

**Note:** Emulator testing can validate UI flows and logic using mock locations (Extended Controls > Location), but real GPS behavior, accuracy, and movement-based features require a physical device.