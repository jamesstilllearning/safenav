# SAFENAV CAVITE — Phase 1 UI/UX Audit Report

**Status:** Read-only audit — no code changes made  
**App:** SAFENAV CAVITE (campus navigation + emergency evacuation for EARIST Cavite Campus)  
**Framework:** Flutter 3.8.0+, Material 3, go_router 14.3.0, flutter_riverpod 2.6.1, flutter_map 7.0.2  
**Auditor role:** Senior Flutter UI/UX Designer & Flutter Software Architect  
**Goal:** Inform a future modern, minimalist, map-first redesign  

---

## 1. Executive Summary

SAFENAV CAVITE is a campus navigation and emergency evacuation app with a solid technical foundation: a Material 3 theme system, a comprehensive shared widget library, a Riverpod + go_router architecture, and flutter_map-based indoor/outdoor mapping. The app is structured around a 5-tab bottom-nav shell (Map, Navigate, Emergency, Alerts, Profile) with a Begin entry screen replacing login.

**Overall impression:** The app has good design-system bones but is incomplete and inconsistent. Several screens are TODOs or placeholders, navigation references screens that do not exist, duplicated helper logic appears across files, and accessibility/responsiveness are unevenly implemented. The strongest assets are the shared widget library (`lib/src/shared/widgets/`) and theme system (`lib/src/core/theme/app_theme.dart`), which are reusable and well-typed. The weakest areas are the profile feature (5,838 lines of mostly stubbed settings), missing screens referenced by the router, and duplicated severity/color/instruction-icon switch functions.

**Key recommendation:** Do not start by redesigning individual screens. Phase 1 of implementation should lock down the shared design system (theme tokens, component library, navigation patterns, bottom sheets, empty/error/loading states), then bring each screen up to that standard one at a time.

No files were modified during this audit. Implementation requires separate approval.

---

## 2. Methodology & Scope

**Approach:** Read-only inspection of all Dart source files in `lib/`, the router, theme system, shared widgets, and every feature screen. No builds, no runs, no file modifications.

**Files examined (read-only):**

| Area | Files |
|------|-------|
| App shell | `lib/main.dart`, `lib/src/core/router/app_router.dart`, `lib/src/core/router/app_routes.dart` |
| Theme | `lib/src/core/theme/app_theme.dart`, `lib/src/core/theme/theme_provider.dart` |
| Onboarding | `lib/src/features/onboarding/presentation/screens/begin_screen.dart` |
| Map | `lib/src/features/map/presentation/screens/map_screen.dart` |
| Navigation | `lib/src/features/navigation/presentation/screens/navigation_screen.dart` + 5 widget files |
| Emergency | `lib/src/features/emergency/presentation/screens/emergency_screen.dart` |
| Alerts | `lib/src/features/alerts/presentation/screens/alerts_screen.dart` |
| Profile | `lib/src/features/profile/presentation/screens/profile_screen.dart` (partial) |
| Digital twin | `lib/src/features/digital_twin/presentation/screens/digital_twin_screen.dart` + 6 view widget files |
| Shared widgets | `lib/src/shared/widgets/widgets.dart` + `app_button.dart`, `app_card.dart`, `app_chip.dart`, `section_header.dart`, `page_header.dart`, `app_avatar.dart`, `empty_state.dart`, `loading_state.dart`, `error_state.dart`, `app_divider.dart` |
| Config | `pubspec.yaml` |

**Constraints honored (verbatim):** No file creation/modification/deletion/rename/move; no Firebase config or backend changes; no Firestore rules changes; no navigation algorithm or routing logic changes; no campus map SVG / navigation graph JSON changes; no node/edge ID or coordinate changes; no authentication reintroduction; no new features implemented.

---

## 3. Complete Screen Inventory

### 3.1 Public / onboarding screens

| Route | Screen | File | Status |
|-------|--------|------|--------|
| `/` | Splash → redirects to Begin | `app_router.dart` (`_SplashScreen`) | Placeholder (inline in router) |
| `/begin` | BeginScreen (entry, replaces login) | `onboarding/.../begin_screen.dart` | Implemented |

### 3.2 Main shell (StatefulShellRoute, 5 branches)

| Branch | Route | Screen | File | Status |
|--------|-------|--------|------|--------|
| Map (0) | `/home` | MapScreen | `map/.../map_screen.dart` | Implemented |
| | `/location/:locationId` | _LocationDetailScreen | `app_router.dart` | TODO placeholder |
| | `/building/:buildingId` | _BuildingDetailScreen | `app_router.dart` | TODO placeholder |
| | `/digital-twin/:buildingId` | DigitalTwinScreen | `digital_twin/.../digital_twin_screen.dart` | Implemented |
| Navigate (1) | `/navigation` | NavigationScreen | `navigation/.../navigation_screen.dart` | Implemented |
| | `/:routeId` | _NavigationDetailScreen | `app_router.dart` | TODO placeholder |
| Emergency (2) | `/emergency` | EmergencyScreen | `emergency/.../emergency_screen.dart` | Implemented |
| | `/evacuation` | _EvacuationScreen | `app_router.dart` | TODO placeholder |
| | `/evacuation/:routeId` | _EvacuationDetailScreen | `app_router.dart` | TODO placeholder |
| Alerts (3) | `/alerts` | AlertsScreen | `alerts/.../alerts_screen.dart` | Implemented |
| | `/alert/:alertId` | _AlertDetailScreen | `app_router.dart` | TODO placeholder |
| | `/alerts/create` | _CreateAlertScreen | `app_router.dart` | TODO placeholder |
| Profile (4) | `/profile` | ProfileScreen | `profile/.../profile_screen.dart` | Implemented (large) |
| | `/profile/edit` | EditProfileScreen | `profile/.../profile_screen.dart` | Implemented (stubbed) |
| | `/profile/id-card` | DigitalIDCardScreen | `profile/.../profile_screen.dart` | Implemented (CustomPaint placeholders) |
| | `/profile/security` | SecuritySettingsScreen | `profile/.../profile_screen.dart` | Implemented (mostly stubbed) |
| | `/profile/emergency-contacts` | EmergencyContactsScreen | `profile/.../profile_screen.dart` | Implemented |
| | `/profile/medical-info` | MedicalInfoScreen | `profile/.../profile_screen.dart` | Implemented (mostly stubbed) |
| | `/profile/location-sharing` | LocationSharingScreen | `profile/.../profile_screen.dart` | Implemented (stubbed) |
| | `/profile/safety-checkins` | SafetyCheckinsScreen | `profile/.../profile_screen.dart` | Implemented |
| | `/profile/activity/history` | ActivityHistoryScreen | `profile/.../profile_screen.dart` | Implemented (partial tabs) |
| | `/profile/preferences/language` | LanguagePreferencesScreen | `app_router.dart` | **Missing** — referenced but no file |
| | `/profile/preferences/theme` | ThemePreferencesScreen | `app_router.dart` | **Missing** — referenced but no file |
| | `/profile/preferences/notifications` | NotificationPreferencesScreen | `app_router.dart` | **Missing** — referenced but no file |
| | `/profile/preferences/map` | MapPreferencesScreen | `app_router.dart` | **Missing** — referenced but no file |
| | `/profile/preferences/accessibility` | AccessibilityPreferencesScreen | `app_router.dart` | **Missing** — referenced but no file |
| | `/settings` | SettingsScreen | `app_router.dart` | **Missing** — referenced but no file |
| | `/help` | HelpScreen | `app_router.dart` | **Missing** — referenced but no file |

### 3.3 Admin routes (all TODOs)

| Route | Screen | Status |
|-------|--------|--------|
| `/admin` | _AdminDashboardScreen | TODO placeholder |
| `/admin/users` | _AdminUsersScreen | TODO placeholder |
| `/admin/locations` | _AdminLocationsScreen | TODO placeholder |
| `/admin/evacuation-graph` | _AdminEvacuationGraphScreen | TODO placeholder |
| `/admin/alerts` | _AdminAlertsScreen | TODO placeholder |
| `/admin/analytics` | _AdminAnalyticsScreen | TODO placeholder |
| `/admin/settings` | _AdminSettingsScreen | TODO placeholder |

### 3.4 Reusable bottom sheets / modals (navigation)

| Component | File | Status |
|-----------|------|--------|
| _BuildingBottomSheet | `map_screen.dart` | Implemented |
| _PathwayBottomSheet | `map_screen.dart` | Implemented |
| _RoomBottomSheet | `map_screen.dart` | Implemented |
| _MarkerBottomSheet | `map_screen.dart` | Implemented |
| _BuildingSelectorSheet | `map_screen.dart` | Implemented |
| _LayerOptionsSheet | `map_screen.dart` | Implemented |
| RoutePreviewBottomSheet | `route_preview_bottom_sheet.dart` | Implemented |
| DestinationDetailsBottomSheet | `destination_details_bottom_sheet.dart` | Implemented |
| _SosConfirmationDialog | `emergency_screen.dart` | Implemented |

---

## 4. Per-Screen UI/UX Assessment

### 4.1 BeginScreen (entry, replaces login)

**File:** `lib/src/features/onboarding/presentation/screens/begin_screen.dart`

- **Visual:** Large AppFilledButton "BEGIN" → `AppRoutes.home`. Clean, minimal, appropriate as an entry point.
- **Layout:** Centered, single primary action. Good use of space.
- **Interaction:** Single clear call-to-action. No secondary actions, no sign-up/sign-in noise.
- **Functional:** Correctly replaces the removed login system per project memory.
- **Accessibility:** Button has semanticLabel support via AppFilledButton.
- **Assessment:** Strong. This is the pattern the rest of the app should follow — single primary action, clear hierarchy.

### 4.2 MapScreen (home tab)

**File:** `lib/src/features/map/presentation/screens/map_screen.dart`

- **Visual:** flutter_map with indoor/outdoor modes, building/pathway/room/marker/polyline layers. Map-first design is correct for this app.
- **Layout:** Full-screen map with bottom sheets, toolbar, zoom controls, selection info bar, FAB, indoor floor selector. Layered UI is dense but map-centric.
- **Interaction:** Multiple bottom sheet types for different feature types (building, pathway, room, marker). Building selector, layer options. Floor selector for indoor.
- **Functional:** Backend-dependent (map tiles, building data, graph). Indoor floor switching is a key differentiator.
- **Accessibility:** Bottom sheets need explicit semantic labels; map markers are not inherently accessible (no screen-reader-friendly alternatives).
- **Responsiveness:** Bottom sheets use `DraggableScrollableSheet` — good for varying screen heights. FAB placement may collide with bottom nav on small phones.
- **Assessment:** Good map-first foundation. Bottom sheet variety is a strength but creates UI fragmentation (6 different sheet types).

### 4.3 NavigationScreen (navigate tab)

**File:** `lib/src/features/navigation/presentation/screens/navigation_screen.dart`

- **Visual:** State machine (Idle/Initializing/Ready/Active/Error). DestinationSearchBar, RoutePreviewBar, RoutePreviewCard, CommonDestinationsList, quick action cards, stat chips.
- **Layout:** Search bar at top, common destinations horizontal scroll, route preview bar/card. Information-dense.
- **Interaction:** Start location mode selector (GPS/Indoor/Outdoor), destination search, saved routes sheet. Voice search stubbed ("coming soon").
- **Functional:** Haversine distance helpers inline. Haversine + format helpers duplicated in `destination_details_bottom_sheet.dart`. Navigation controller imperative provider usage.
- **Accessibility:** Search field has hint text; stat chips lack semantic labels in places.
- **Responsiveness:** Horizontal scroll for destinations works on narrow screens; route preview card may be cramped.
- **Assessment:** Functional core but duplicated helpers and stubbed voice guidance are liabilities.

### 4.4 EmergencyScreen

**File:** `lib/src/features/emergency/presentation/screens/emergency_screen.dart`

- **Visual:** 3-second SOS hold via Timer + AnimationController pulse + progress ring. Confirmation dialog. Fire/Medical/Security quick actions. Emergency red theme.
- **Layout:** Full-screen status view (EmergencyStatusScreen/EmergencyStatusView) with PopScope canPop:false. Timeline, responder info, cancel dialog.
- **Interaction:** Long-press SOS hold is the right interaction for preventing accidental triggers. Confirmation dialog adds safety.
- **Functional:** Firestore emergency contacts, assembly point & evacuation route cards. **Critical issue:** `_activateSos` requires userId and shows "Please log in" despite the app having no login (Begin replaces login). This is a functional contradiction.
- **Accessibility:** SOS hold needs haptic + audio fallback for users who cannot press-and-hold. Progress ring needs aria-valuenow equivalent.
- **Responsiveness:** Full-screen status works across sizes; quick action grid needs to adapt.
- **Assessment:** Strong interaction design (SOS hold), but the login contradiction is a functional bug that must be fixed before launch.

### 4.5 AlertsScreen

**File:** `lib/src/features/alerts/presentation/screens/alerts_screen.dart`

- **Visual:** TabBar (All/Unread/Critical). _AlertTile, AlertDetailScreen, CreateAlertScreen, related alerts section. Filter chips.
- **Layout:** List-based, standard alert pattern. FCM init + registerToken. Firestore stream providers.
- **Interaction:** FilterParams equality/hashCode implemented (good). Severity/color switch functions **duplicated in 3 places** (maintenance risk).
- **Functional:** Real-time Firestore stream, unread count stream, critical filtering. Create alert is admin/security only (placeholder).
- **Accessibility:** Alert tiles need semantic labels for unread/critical status; color-coded severity must not rely on color alone.
- **Responsiveness:** TabBar works; list scales vertically.
- **Assessment:** Solid pattern, but duplicated severity/color logic is a maintainability smell.

### 4.6 ProfileScreen (profile tab)

**File:** `lib/src/features/profile/presentation/screens/profile_screen.dart` (~5,838 lines)

- **Visual:** SectionHeader-gated sections: Account, Safety & Emergency, Preferences, About. Edit profile, digital ID card (CustomPaint QR/barcode placeholders), security settings, emergency contacts, medical info, location sharing, safety check-ins, activity history.
- **Layout:** Massive single file. Sections gated by authentication state (_buildNoUserProfile vs _buildAuthenticatedProfile) — but app has no login, so authenticated branch may be dead code or inconsistent.
- **Interaction:** ~15 string-route pushes (e.g. `context.push('/profile/edit')`) mixed with typed AppRoutes — inconsistent navigation style. Most editors stubbed "coming soon".
- **Functional:** Inline providers (placesVisitedCountProvider, routesTakenCountProvider, alertsReceivedCountProvider, userSafetyScoreProvider, etc.). Digital ID card QR/barcode are CustomPaint placeholders (non-functional).
- **Accessibility:** Section headers need semantic labels; large file makes consistent a11y hard to audit.
- **Responsiveness:** Not evident; likely single-column only.
- **Assessment:** Over-scoped and incomplete. This is the weakest screen — should be split into multiple files, and stubbed "coming soon" features either implemented or removed.

### 4.7 DigitalTwinScreen

**File:** `lib/src/features/digital_twin/presentation/screens/digital_twin_screen.dart`

- **Visual:** 3D WebView (Three.js) via webview_flutter. Floor selector (left), room search panel (right), room info panel (bottom), highlighted rooms badge. Theme toggle (light/dark/emergency), exploded view toggle.
- **Layout:** Stack-based overlay on full-screen WebView. Dense overlay UI.
- **Interaction:** Room hover/select, floor change, fly-to-room, search with debounce (300ms).
- **Functional:** Building3D model loading, coordinate transform, model loader service. "Navigate" button stubbed ("Coming soon").
- **Accessibility:** WebView content is not accessible to screen readers; no fallback for 3D view. Color-coded room categories rely on color alone.
- **Responsiveness:** Fixed-width search panel (280px) and floor selector (60px) may not adapt well to small phones.
- **Assessment:** Technically ambitious but accessibility-poor. 3D twin is secondary to the core map navigation use case.

### 4.8 _MainShell (bottom navigation)

**File:** `lib/src/core/router/app_router.dart` (inline)

- **Visual:** 5 destinations (Map, Navigate, Emergency, Alerts, Profile). Emergency tab highlighted in error color when selected. Unread alert badge on Alerts.
- **Layout:** Connectivity banner above content. Custom InkWell-based nav items (not Material 3 NavigationBar despite the comment referencing it).
- **Interaction:** Branch-based navigation via `navigationShell.goBranch(index)`.
- **Accessibility:** Bottom nav items lack explicit semantics; badge is visual-only (no screen-reader announcement of count).
- **Responsiveness:** 5 tabs is at the upper limit for bottom nav on small phones; labels are small (11px).
- **Assessment:** Functional but custom-built rather than using Material 3 NavigationBar; emergency color coding is good.

---

## 5. Reusable Widgets & Components Inventory

### 5.1 Shared widget library (`lib/src/shared/widgets/`)

| Widget | File | Type | Notes |
|--------|------|------|-------|
| AppFilledButton / AppOutlinedButton / AppTextButton | `app_button.dart` | Button | ButtonSize {small, medium, large}, IconPosition {leading, trailing}, isLoading/isDisabled/semanticLabel |
| AppSosButton | `app_button.dart` | Button | Pulse animation via AnimationController, SosButtonSize |
| AppIconButton | `app_button.dart` | Button | IconButtonSize enum |
| AppSegmentedButton | `app_button.dart` | Button | Material segmented button wrapper |
| navigatorKey | `app_button.dart` | GlobalKey | GlobalKey<NavigatorState> — global navigation key |
| AppCard / AppOutlinedCard / AppElevatedCard | `app_card.dart` | Card | onTap/inkWell/semanticLabel/excludeFromSemantics |
| AppChip / AppFilterChip / AppChoiceChip / AppInputChip / AppStatusChip | `app_chip.dart` | Chip | ChipSeverity {info, success, warning, error, emergency} |
| SectionHeader / SectionTitle / SectionHeaderWithCount | `section_header.dart` | Header | SectionHeaderStyle {standard, large, small, divider} |
| PageHeader / PageHeaderStyle | `page_header.dart` | Header | {standard, compact}, uses AppSpacing |
| AppAvatar / AppAvatarWithStatus / AppAvatarGroup | `app_avatar.dart` | Avatar | AvatarShape/AvatarStatus/AvatarStatusPosition, color-from-name-hash |
| EmptyState / SearchEmptyState / ContentEmptyState / OfflineEmptyState / NotificationsEmptyState / NavigationEmptyState | `empty_state.dart` | Empty | Icon/title/message/action pattern |
| LoadingOverlay / InlineLoading / SkeletonLoader / SkeletonCard / LoadingButton / RefreshIndicatorWrapper | `loading_state.dart` | Loading | Skeleton with animation controller |
| ErrorState / InlineError / ErrorBanner / NetworkErrorState / PermissionErrorState | `error_state.dart` | Error | Retry/dismiss actions, auto-dismiss banner |
| AppDivider / AppLabeledDivider / AppDashedDivider / AppSpacer / SectionDivider / CardDivider / ListTileDivider | `app_divider.dart` | Divider | Consistent divider family |
| AppFilledButton used as SOS button | `app_button.dart` | Emergency | AppSosButton with pulse |

**Assessment:** This is the strongest asset in the codebase. Comprehensive, well-typed, theming-aware. However:
- `empty_state.dart`, `loading_state.dart`, `error_state.dart`, `app_divider.dart` import `package:material_ui/material_ui.dart` — a suspicious `^0.0.1` dependency that may not exist or publish properly (potential build blocker).
- AppCard in empty/error states uses raw `FilledButton`/`OutlinedButton`/`TextButton` instead of the App* button wrappers — inconsistency within the library itself.

### 5.2 Navigation-specific widgets

| Widget | File | Notes |
|--------|------|-------|
| DestinationSearchBar | `destination_search_bar.dart` | Search + start location mode |
| _StartLocationButton | `destination_search_bar.dart` | GPS/Indoor/Outdoor badge |
| _ModeOptionTile | `destination_search_bar.dart` | Mode selection tile |
| _DestinationCard | `common_destinations_list.dart` | Horizontal destination card |
| RoutePreviewCard / RoutePreviewBar / _StatChip / _InstructionPreviewCard | `route_preview_bottom_sheet.dart` | Route preview |
| _getInstructionIcon (×2 definitions) | `route_preview_bottom_sheet.dart` + `active_navigation_view.dart` | **Duplicated** |
| ActiveNavigationView / _TopNavigationBar / _CurrentInstructionCard / _NextInstructionPreview | `active_navigation_view.dart` | Turn-by-turn view |
| DestinationDetailsBottomSheet / _DetailRow / _DistanceInfo | `destination_details_bottom_sheet.dart` | Destination detail |
| Haversine + _formatDistance/_formatDuration | `destination_details_bottom_sheet.dart` | **Duplicated** in navigation_screen.dart |

---

## 6. Theme & Color System Assessment

**Files:** `lib/src/core/theme/app_theme.dart`, `lib/src/core/theme/theme_provider.dart`

### 6.1 Strengths

- **AppColors, AppTextStyles, AppSpacing, AppElevation, AppDurations** — complete token system.
- **Inter + RobotoMono** via Google Fonts — good pairing (sans + mono for technical data).
- **Three ColorSchemes:** light, dark, emergency. Emergency is a full-screen red emergency mode — appropriate for this app's use case.
- **ThemeData builder** with Material 3 component themes (elevatedButton, filledButton, outlinedButton, textButton, card, chip, bottomSheet, dialog, appBar, etc.).
- **Zoom / Cupertino page transitions** — nice touch.
- **textScaler clamped 0.8–1.3** in `_AppBuilder` — good accessibility guardrail.
- **ThemeProvider** with SharedPreferences persistence, AppThemeMode {system, light, dark, emergency}, emergency mode toggle.

### 6.2 Weaknesses

- Emergency ColorScheme exists but emergency mode is persisted to SharedPreferences and can be activated independently of actual emergencies — potential for confusing UI state.
- Several widgets use hardcoded `Colors.red`, `Colors.green`, `Colors.blue`, `Colors.orange` instead of theme color scheme (e.g., digital_twin_screen.dart, emergency badges in destination_details_bottom_sheet.dart). This breaks dark/emergency theme consistency.
- `_AppBuilder` clamps text scaler but there's no evidence of large-text layout testing (text overflow at 1.3x scale).

---

## 7. Responsiveness & Accessibility Assessment

### 7.1 Responsiveness

- **Bottom sheets** use `DraggableScrollableSheet` with min/max child sizes — good adaptive behavior.
- **Digital twin** has fixed-width panels (280px search, 60px floor selector) — poor small-phone adaptation.
- **Bottom navigation** has 5 tabs at 11px labels — crowded on small phones (<360dp width).
- **No evidence** of breakpoint-based layout changes (no `LayoutBuilder`/`MediaQuery` adaptive patterns observed outside map screen).
- **Map screen** FAB and bottom sheets may collide with bottom nav on small phones.
- **Verdict:** Partially responsive; needs breakpoint-based adaptation and safe-area awareness.

### 7.2 Accessibility

**Strengths:**
- SemanticLabel support on AppFilledButton, AppCard, AppChip, AppAvatar, EmptyState, LoadingOverlay, ErrorState, ErrorBanner.
- ExcludeSemantics on decorative icons (good).
- textScaler clamp (0.8–1.3).
- PopScope canPop:false on emergency status (prevents accidental exit).
- LiveRegion on loading/error semantics.

**Gaps:**
- Map markers and FlutterMap layer have no screen-reader alternative (campus buildings/rooms not announced).
- Color-coded severity (alerts, destination types, room categories) relies on color alone — no pattern/text fallback.
- SOS hold interaction has no documented haptic/audio fallback for motor-impaired users.
- Bottom nav badge (unread count) is visual-only.
- Digital twin WebView content is inaccessible.
- `_getInstructionIcon` icons have no semantic labels.
- Contrast in emergency mode (red on dark) needs verification.

**Verdict:** Good semantic infrastructure exists but is inconsistently applied. Map and digital twin are the biggest accessibility gaps (inherently visual, need alternatives).

---

## 8. Problems & Inconsistencies

Each finding is categorized as **Visual / Layout / Interaction / Functional / Backend-dependent**.

### 8.1 Critical (block launch)

| # | Problem | Category | Location | Why it matters |
|---|---------|----------|----------|----------------|
| P1 | `_activateSos` requires userId and shows "Please log in" despite no-login design | Functional | `emergency_screen.dart` | SOS is the core emergency feature; it cannot work without a user ID in an app with no authentication |
| P2 | Router references 8 screens that do not exist (LanguagePreferencesScreen, ThemePreferencesScreen, NotificationPreferencesScreen, MapPreferencesScreen, AccessibilityPreferencesScreen, SettingsScreen, HelpScreen + admin screens) | Functional | `app_router.dart` | Navigating to these routes throws / breaks the app |
| P3 | `material_ui: ^0.0.1` and `cupertino_ui: ^0.0.1` imported app-wide | Functional/Build | `pubspec.yaml`, all widget files | `^0.0.1` is an invalid/suspicious version; likely build blocker |
| P4 | Digital ID QR/barcode are CustomPaint placeholders (non-functional) | Functional | `profile_screen.dart` | Marketed feature doesn't work |

### 8.2 High (major UX debt)

| # | Problem | Category | Location | Why it matters |
|---|---------|----------|----------|----------------|
| P5 | `_getInstructionIcon` duplicated identically in 2 files | Layout/Code | `route_preview_bottom_sheet.dart:512`, `active_navigation_view.dart:512` | Inconsistent updates; bug when one is changed and other isn't |
| P6 | Haversine distance + `_formatDistance`/`_formatDuration` duplicated | Layout/Code | `navigation_screen.dart`, `destination_details_bottom_sheet.dart` | Same as P5; maintenance risk |
| P7 | Severity/color switch functions duplicated in 3 places | Layout/Code | `alerts_screen.dart` | Inconsistent severity colors across the alerts feature |
| P8 | ~15 string-route pushes mixed with typed AppRoutes in profile | Interaction | `profile_screen.dart` | Inconsistent navigation; typos in string routes won't be caught at compile time |
| P9 | ProfileScreen is ~5,838 lines in one file with mostly stubbed "coming soon" editors | Layout/Functional | `profile_screen.dart` | Unmaintainable; dead/stubbed code ships to users |
| P10 | Hardcoded `Colors.red/green/blue/orange` in multiple widgets instead of theme color scheme | Visual | `digital_twin_screen.dart`, `destination_details_bottom_sheet.dart`, `emergency_screen.dart` | Breaks dark/emergency theme consistency |

### 8.3 Medium (UX polish)

| # | Problem | Category | Location | Why it matters |
|---|---------|----------|----------|----------------|
| P11 | 6 different bottom sheet types in map screen with inconsistent patterns | Layout | `map_screen.dart` | UI fragmentation; users re-learn each sheet |
| P12 | Voice search and voice guidance stubbed with "coming soon" SnackBars | Interaction | `destination_search_bar.dart`, `navigation_screen.dart` | Ships broken promises to users |
| P13 | 5-tab bottom nav crowded on small phones | Layout/Responsive | `app_router.dart` (_MainShell) | Poor experience on compact devices |
| P14 | Digital twin fixed-width panels (280px/60px) | Layout/Responsive | `digital_twin_screen.dart` | Breaks on small phones |
| P15 | Empty/error/loading states use raw Material buttons instead of App* wrappers | Visual | `empty_state.dart`, `error_state.dart` | Inconsistent within the shared library itself |
| P16 | No breakpoint-based responsive layout patterns | Layout/Responsive | App-wide | App doesn't adapt between phone/tablet/foldable |

### 8.4 Low / accessibility

| # | Problem | Category | Location | Why it matters |
|---|---------|----------|----------|----------------|
| P17 | Map markers have no screen-reader alternative | Accessibility | `map_screen.dart`, `active_navigation_view.dart` | Blind/low-vision users cannot use map features |
| P18 | Color-coded severity relies on color alone | Accessibility | `alerts_screen.dart`, `app_chip.dart` | Fails WCAG 1.4.1 |
| P19 | SOS hold has no haptic/audio fallback | Accessibility/Interaction | `emergency_screen.dart` | Excludes motor-impaired users |
| P20 | Bottom nav badge is visual-only | Accessibility | `app_router.dart` (_MainShell) | Screen reader users don't know unread count |
| P21 | Digital twin WebView is inaccessible | Accessibility | `digital_twin_screen.dart` | No fallback for 3D content |
| P22 | `_getInstructionIcon` icons unlabeled | Accessibility | `active_navigation_view.dart` | Turn instructions not announced |

---

## 9. Recommended Redesign Per Screen

### 9.1 BeginScreen — Keep as-is (visual/layout only)
The BeginScreen is the best-designed screen in the app. Keep the single-primary-action pattern. **No structural change needed.** Consider adding a subtle campus illustration or wordmark for brand.

### 9.2 MapScreen — Map-first, consolidate bottom sheets
**Redesign:** Keep full-screen map. Consolidate the 6 bottom sheet types into 2: a generic `FeatureBottomSheet` (building/room/pathway/marker) with a type-driven header chip, and a `LayerOptionsSheet`. Unify the handle bar, header, and action button pattern across all sheets using the shared `EmptyState`/`LoadingState`/`ErrorState` components.
- **Visual:** Unified sheet header with type color from `AppChip`/`ChipSeverity`.
- **Layout:** `DraggableScrollableSheet` with consistent snap points.
- **Interaction:** Sheet gestures consistent across types.
- **Functional:** No change to map layers or graph data.
- **Backend-dependent:** Map tiles, building data remain unchanged.

### 9.3 NavigationScreen — Extract duplicated helpers, finish stubs
**Redesign:** Move Haversine + format helpers to a shared `NavigationUtils` class. Replace "coming soon" voice search/guidance SnackBars with disabled states or remove until implemented. Unify start-location mode selector with the shared `AppChip`/`AppSegmentedButton` pattern.
- **Visual:** Consistent stat chips via `AppChip` with `ChipSeverity`.
- **Layout:** Search bar fixed height; destinations horizontal scroll with `AppCard`.
- **Interaction:** Voice search button disabled with tooltip until real implementation.
- **Functional:** Haversine moved to shared util (no behavior change).
- **Backend-dependent:** Route computation unchanged.

### 9.4 EmergencyScreen — Fix SOS auth contradiction, add fallbacks
**Redesign:** Remove the userId/login requirement from `_activateSos` — SOS must work for any user in a no-login app. Add haptic feedback and audio cues to the SOS hold. Add a non-color indicator (pattern/text) to the progress ring.
- **Visual:** Emergency red theme retained; progress ring gets a text percentage label.
- **Layout:** Full-screen status retained; PopScope canPop:false retained.
- **Interaction:** SOS hold + haptic + audio; confirmation dialog retained.
- **Functional:** **Critical fix** — remove login requirement.
- **Backend-dependent:** Firestore emergency contacts unchanged.

### 9.5 AlertsScreen — Centralize severity/color logic
**Redesign:** Extract the 3 duplicated severity/color switch functions into a shared `AlertSeverity` helper (color + icon + label). Use `AppChip` with `ChipSeverity.emergency` for critical alerts. Ensure color is never the only indicator of severity (add text label + icon).
- **Visual:** Severity chips via `AppChip`/`ChipSeverity`.
- **Layout:** TabBar retained; list via `AppCard` tiles.
- **Interaction:** Filter chips consistent with shared widget library.
- **Functional:** No change to Firestore streams or FCM.
- **Backend-dependent:** Firestore alert stream unchanged.

### 9.6 ProfileScreen — Split into feature files, remove stubs
**Redesign:** Split `profile_screen.dart` (5,838 lines) into per-section screens: `EditProfileScreen`, `DigitalIDCardScreen`, `SecuritySettingsScreen`, `EmergencyContactsScreen`, `MedicalInfoScreen`, `LocationSharingScreen`, `SafetyCheckinsScreen`, `ActivityHistoryScreen` — each in its own file under `profile/presentation/screens/`. Remove or gate all "coming soon" stubs. Replace string-route pushes with typed `AppRoutes`. Make Digital ID QR/barcode functional or remove.
- **Visual:** Section headers via `SectionHeader`; cards via `AppCard`.
- **Layout:** Single-column scrollable per screen.
- **Interaction:** Only show implemented features; hide stubbed ones.
- **Functional:** Remove dead authenticated/unauthenticated branching if no login exists.
- **Backend-dependent:** User profile data via Hive/shared_preferences unchanged.

### 9.7 DigitalTwinScreen — Make accessible, responsive
**Redesign:** Replace fixed-width panels with responsive width (percentage-based or `LayoutBuilder`). Add a non-3D fallback view (2D floor plan list) for users who cannot use WebView. Add room category labels alongside icons/colors. Keep WebView for those who can use it.
- **Visual:** Dark background retained; theme toggle retained.
- **Layout:** Responsive panels; floor selector collapsible on small screens.
- **Interaction:** Search/fly-to retained.
- **Functional:** WebView building load unchanged.
- **Backend-dependent:** 3D model loading unchanged.
- **Accessibility:** Add 2D fallback (this is the key fix).

### 9.8 _MainShell — Consider Material 3 NavigationBar
**Redesign:** Evaluate replacing the custom InkWell nav with Material 3 `NavigationBar` for consistent platform behavior, or keep custom but add semantics labels and screen-reader announcement for the badge. Reduce to 4 tabs if 5 feels crowded (consider merging Alerts into Profile or Map).
- **Visual:** Emergency tab color coding retained.
- **Layout:** SafeArea-aware; handle bottom nav height.
- **Interaction:** Branch navigation retained.
- **Accessibility:** Add semantics to nav items; announce badge count.

---

## 10. Suggested Reusable Design System

### 10.1 Foundation layer (build first)

1. **Theme tokens** — Already exists in `app_theme.dart` (`AppColors`, `AppTextStyles`, `AppSpacing`, `AppElevation`, `AppDurations`). Lock this down; add a `ThemeTokens` class exposing `ColorScheme`-derived values so widgets never reference raw `Colors.*`.
2. **Color usage rule** — No widget may reference `Colors.red/blue/green/etc.` directly; all color must come from `Theme.of(context).colorScheme` or `AppColors`.
3. **Component library** — Already exists in `shared/widgets/`. Fix the `material_ui`/`cupertino_ui` import (replace with Flutter Material or remove). Replace raw `FilledButton`/`OutlinedButton` in empty/error states with `AppFilledButton`/`AppOutlinedButton`.
4. **Navigation pattern** — Typed `AppRoutes` only; ban string-route pushes. Centralize in `app_router.dart`.
5. **Bottom sheet pattern** — One `AppBottomSheet` wrapper with handle bar, header, action row; all feature sheets use it.
6. **Empty/error/loading pattern** — Use the shared `EmptyState`/`ErrorState`/`LoadingOverlay` consistently; no inline `Center(child: Text(...))` fallbacks.

### 10.2 Component specifications

| Component | Spec | File |
|-----------|------|------|
| AppButton | Filled/Outlined/Text, size {sm/md/lg}, loading/disabled states, semanticLabel | `app_button.dart` |
| AppSosButton | Pulse animation, emergency red, haptic-ready | `app_button.dart` |
| AppCard | onTap/inkWell, elevation variants, semanticLabel | `app_card.dart` |
| AppChip | Severity {info/success/warning/error/emergency}, color from theme | `app_chip.dart` |
| SectionHeader | Style {standard/large/small/divider}, with count/action | `section_header.dart` |
| PageHeader | Style {standard/compact} | `page_header.dart` |
| AppAvatar | Shape/status/position, color-from-name-hash | `app_avatar.dart` |
| EmptyState | Icon/title/message/action, semanticLabel | `empty_state.dart` |
| ErrorState | Retry/dismiss, semanticLabel, liveRegion | `error_state.dart` |
| LoadingOverlay/InlineLoading/Skeleton | Animation, semanticLabel, liveRegion | `loading_state.dart` |

### 10.3 Shared utilities to create

- `lib/src/shared/utils/distance.dart` — Haversine + `_formatDistance`/`_formatDuration` (single source)
- `lib/src/shared/utils/instruction_icons.dart` — `_getInstructionIcon` (single source)
- `lib/src/shared/utils/alert_severity.dart` — Severity color/icon/label (single source)
- `lib/src/shared/widgets/app_bottom_sheet.dart` — Unified bottom sheet wrapper

---

## 11. Prioritized Implementation Roadmap

| Priority | Phase | Scope | Read-only? |
|----------|-------|-------|------------|
| P0 | Fix SOS auth contradiction (`_activateSos` userId/login) | `emergency_screen.dart` | No — requires code change |
| P0 | Remove/fix broken router routes (8 missing screens) | `app_router.dart` | No |
| P0 | Resolve `material_ui`/`cupertino_ui` dependency | `pubspec.yaml` + imports | No |
| P1 | Build shared design system (theme lock, color rule, utils) | `shared/widgets/`, `shared/utils/` | No |
| P1 | Consolidate bottom sheets (map) | `map_screen.dart` | No |
| P2 | Redesign NavigationScreen (extract duplicated helpers, finish/remove stubs) | `navigation/...` | No |
| P2 | Redesign AlertsScreen (centralize severity) | `alerts/...` | No |
| P3 | Split ProfileScreen into per-section files, remove stubs | `profile/...` | No |
| P3 | Redesign DigitalTwinScreen (responsive + 2D fallback) | `digital_twin/...` | No |
| P4 | Accessibility pass (map a11y, color-not-only, SOS fallbacks, nav badge semantics) | App-wide | No |
| P4 | Responsiveness pass (breakpoints, small-phone nav) | App-wide | No |

**This audit is Phase 0 (read-only). Implementation begins at P0 only after user approval.**

---

## 12. Phase-by-Phase Plan (starting with shared design system)

### Phase 1 — Shared Design System (foundation)
**Goal:** Lock the design system so all later screen work is consistent.

1. Fix `material_ui`/`cupertino_ui` dependency (replace with Flutter Material or remove).
2. Lock `app_theme.dart` tokens; add `ThemeTokens` color accessor; ban raw `Colors.*` in widgets.
3. Fix shared widget library inconsistencies (raw buttons → `App*` wrappers in empty/error states).
4. Create shared utils: `distance.dart` (Haversine + format), `instruction_icons.dart`, `alert_severity.dart`.
5. Create `app_bottom_sheet.dart` unified wrapper.
6. Establish navigation rule: typed `AppRoutes` only; no string-route pushes.

**Deliverable:** A consistent, locked design system with zero raw-color references and no duplicated helpers.

### Phase 2 — Critical Fixes (P0)
**Goal:** Make the app functional and safe.

1. Remove userId/login requirement from `_activateSos` in EmergencyScreen; add haptic/audio fallback.
2. Remove or stub out the 8 missing router routes (LanguagePreferencesScreen, etc.) so navigation doesn't break.
3. Make Digital ID QR/barcode functional or remove the feature.

### Phase 3 — Core Screens (P1/P2)
**Goal:** Bring Map, Navigate, Alerts to design-system standard.

1. Consolidate map bottom sheets into `FeatureBottomSheet` + `LayerOptionsSheet`.
2. Redesign NavigationScreen: extract duplicated helpers, replace "coming soon" stubs.
3. Redesign AlertsScreen: centralize severity/color via `AppChip`/`ChipSeverity`; add non-color severity indicators.

### Phase 4 — Profile & Digital Twin (P3)
**Goal:** Complete or de-scope incomplete features.

1. Split `profile_screen.dart` into per-section screens; remove "coming soon" stubs; replace string routes with `AppRoutes`.
2. Redesign DigitalTwinScreen: responsive panels, 2D fallback, accessibility labels.

### Phase 5 — Accessibility & Responsiveness (P4)
**Goal:** WCAG-aligned, adaptive experience.

1. Map screen-reader alternatives; digital twin 2D fallback already done.
2. Color-not-only severity indicators; SOS haptic/audio already done.
3. Bottom nav semantics + badge announcement.
4. Breakpoint-based layouts; small-phone nav (4 vs 5 tabs).

---

## 13. Approval Required

This report is **read-only and advisory**. No code has been modified. Before any implementation begins (starting with Phase 1 design system work), I require your approval of:

1. The prioritized roadmap (Section 11).
2. The decision to fix the SOS auth contradiction (P0) — this changes behavior of the core emergency feature.
3. Whether to remove missing router routes or implement them.
4. Whether to de-scope stubbed profile features or implement them.

Please confirm approval and which phase to start with, or share any adjustments to the roadmap.

---

## Appendix: File Reference

| File | Role |
|------|------|
| `lib/main.dart` | App entry, Firebase init gate, theme mode |
| `lib/src/core/router/app_router.dart` | GoRouter config, _MainShell, all placeholder screens |
| `lib/src/core/router/app_routes.dart` | Route name constants, `requiresAuth`/`requiresAdmin` |
| `lib/src/core/theme/app_theme.dart` | AppColors, AppTextStyles, AppSpacing, theme builder |
| `lib/src/core/theme/theme_provider.dart` | ThemeController, AppThemeMode persistence |
| `lib/src/features/onboarding/.../begin_screen.dart` | BeginScreen entry |
| `lib/src/features/map/.../map_screen.dart` | MapScreen + 6 bottom sheets |
| `lib/src/features/navigation/.../navigation_screen.dart` | NavigationScreen state machine |
| `lib/src/features/navigation/.../widgets/*.dart` | 5 navigation widgets |
| `lib/src/features/emergency/.../emergency_screen.dart` | EmergencyScreen, SOS, status view |
| `lib/src/features/alerts/.../alerts_screen.dart` | AlertsScreen, tabs, filter |
| `lib/src/features/profile/.../profile_screen.dart` | ProfileScreen (5,838 lines, all sub-screens inline) |
| `lib/src/features/digital_twin/.../digital_twin_screen.dart` | DigitalTwinScreen + 6 view widgets |
| `lib/src/shared/widgets/*.dart` | Shared component library (8 files) |
| `pubspec.yaml` | Dependencies, assets |
