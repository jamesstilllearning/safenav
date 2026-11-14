# SAFENAV CAVITE — Backend Architecture Audit Report

**Project:** SAFENAV CAVITE  
**Location:** `F:\My Projects\SAFENAV CAVITE\safenav`  
**Frontend:** Flutter / Dart  
**Audit Date:** 2025-11-15  
**Auditor:** Claude Fable 5 (AI Assistant)

---

## Table of Contents

1. [Executive Summary](#1-executive-summary)
2. [Existing Backend Technologies Discovered](#2-existing-backend-technologies-discovered)
3. [Current Architecture Overview](#3-current-architecture-overview)
4. [Feature-by-Feature Backend Assessment](#4-feature-by-feature-backend-assessment)
5. [Identified Architecture Gaps](#5-identified-architecture-gaps)
6. [Backend Technology Comparison](#6-backend-technology-comparison)
7. [Recommended Backend and Database](#7-recommended-backend-and-database)
8. [Whether Dart is Recommended for the Backend](#8-whether-dart-is-recommended-for-the-backend)
9. [Proposed Architecture Diagram](#9-proposed-architecture-diagram)
10. [Proposed Database Structure](#10-proposed-database-structure)
11. [Proposed API Endpoints](#11-proposed-api-endpoints)
12. [Security Recommendations](#12-security-recommendations)
13. [Estimated Complexity and Possible Costs](#13-estimated-complexity-and-possible-costs)
14. [Recommended Implementation Roadmap](#14-recommended-implementation-roadmap)
15. [Risks and Unanswered Questions](#15-risks-and-unanswered-questions)

---

## 1. Executive Summary

SAFENAV CAVITE is a **Flutter-based campus navigation and emergency evacuation system** for EARIST Cavite Campus. The application is well-architected with a clean feature-based structure using Riverpod for state management and follows offline-first principles.

**Key Finding:** The application **already has a Firebase backend** configured and partially implemented. Firebase services (Authentication, Firestore, Cloud Messaging, Storage) are integrated at the code level with proper service abstractions. However, several critical features rely on **mock/hardcoded data** rather than live backend integration, and the backend infrastructure (Firestore security rules, Cloud Functions, FCM topics) appears not yet fully deployed or configured.

**Current State:**
- ✅ Firebase SDKs integrated (Auth, Firestore, Messaging, Storage)
- ✅ Service layer abstractions for all Firebase services
- ✅ User authentication flow implemented (email/password)
- ✅ User profiles stored in Firestore
- ✅ FCM service for push notifications with local notification fallback
- ✅ Local storage via Hive + SharedPreferences for offline support
- ✅ Campus map data loaded from **local GeoJSON assets** (not from backend)
- ✅ Navigation routing computed **client-side** using Dijkstra's algorithm
- ⚠️ Admin dashboard uses **hardcoded mock data**
- ⚠️ Emergency alerts use **hardcoded mock data**
- ⚠️ Evacuation graphs use **hardcoded mock data**
- ⚠️ No Cloud Functions for server-side logic
- ⚠️ No Firestore security rules visible in codebase
- ⚠️ No backend API for emergency report processing

**Recommendation:** Continue with **Firebase as the primary backend** but invest in:
1. Firestore security rules and data modeling
2. Cloud Functions for emergency processing, admin operations, and notification distribution
3. Proper FCM topic management and server-side alert creation
4. Migration of mock data to live Firestore collections

Dart as a **custom backend language is NOT recommended** for this project. Firebase + Flutter provides the best developer experience, cost efficiency, and time-to-market for a student/campus project.

---

## 2. Existing Backend Technologies Discovered

### 2.1 Firebase Services (Configured & Partially Implemented)

| Service | Package | Version | Implementation Status |
|---------|---------|---------|----------------------|
| **Firebase Core** | `firebase_core` | ^3.15.2 | ✅ Initialized in `firebase_init.dart:38` |
| **Firebase Auth** | `firebase_auth` | ^5.3.1 | ✅ Full implementation in `auth_service.dart` |
| **Cloud Firestore** | `cloud_firestore` | ^5.4.4 | ✅ Service layer in `firestore_service.dart` |
| **Firebase Messaging** | `firebase_messaging` | ^15.1.3 | ✅ FCM service in `fcm_service.dart` + `notification_service.dart` |
| **Firebase Storage** | `firebase_storage` | ^12.3.4 | ✅ Storage service in `storage_service.dart` |

**Firebase Configuration:** `firebase_options.dart` and `firebase.json` confirm project `safenav-cavite` with:
- Android app: `1:131210697374:android:8e51f3249e94149ebdf98f`
- iOS app: `1:131210697374:ios:8e425b60c86b2d3ebdf98f`
- Web app: `1:131210697374:web:a3deb7a5f34eee4bbdf98f`

### 2.2 Local Storage (Fully Implemented)

| Technology | Package | Purpose |
|------------|---------|---------|
| **Hive** | `hive: ^2.2.3`, `hive_flutter: ^1.1.0` | Offline cache, map data, evacuation graphs |
| **SharedPreferences** | `shared_preferences: ^2.3.2` | User preferences, simple flags |

**Storage Service:** `storage_service.dart` provides:
- Cache with TTL support
- Persistent settings
- Map data (evacuation graphs, locations)
- SharedPreferences wrapper

### 2.3 Map & Location (Client-Side Only)

| Technology | Package | Purpose |
|------------|---------|---------|
| **flutter_map** | ^7.0.2 | OpenStreetMap rendering (no Google Maps API) |
| **latlong2** | ^0.9.1 | Coordinate handling |
| **geolocator** | ^13.0.1 | GPS location |
| **geocoding** | ^3.0.0 | Address ↔ coordinate conversion |

**Map Data Source:** Local GeoJSON assets in `lib/src/features/map/data/`:
- `campus_boundary.geojson` (1.3 KB)
- `campus_buildings.geojson` (3.3 KB)
- `campus_pathways.geojson` (7.5 KB)

### 2.4 State Management & Architecture

| Technology | Package | Purpose |
|------------|---------|---------|
| **Riverpod** | `flutter_riverpod: ^2.6.1` | State management (providers, notifiers) |
| **go_router** | ^14.3.0 | Navigation with auth guards |
| **freezed** | ^4.0.3 | Immutable data models with JSON serialization |

### 2.5 Notifications

| Technology | Package | Purpose |
|------------|---------|---------|
| **flutter_local_notifications** | ^18.0.1 | Local notifications with critical alert support |
| **FCM Topics** | Built-in | `all_users`, `students`, `faculty`, `security`, `admins`, `emergency`, `building_{id}`, `user_{id}` |

---

## 3. Current Architecture Overview

### 3.1 High-Level Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                      FLUTTER APP (Client)                       │
├─────────────────────────────────────────────────────────────────┤
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐              │
│  │   Map/Nav   │  │ Emergency/  │  │   Admin/    │  Features    │
│  │  Features   │  │  Alerts     │  │  Profile    │              │
│  └──────┬──────┘  └──────┬──────┘  └──────┬──────┘              │
│         │                │                │                      │
│  ┌──────▼────────────────▼────────────────▼──────┐              │
│  │           Riverpod State Layer                │              │
│  │  (AuthNotifier, Providers, StateNotifiers)   │              │
│  └──────┬────────────────┬────────────────┬──────┘              │
│         │                │                │                      │
│  ┌──────▼──────┐  ┌──────▼──────┐  ┌──────▼──────┐              │
│  │AuthService  │  │FirestoreSvc │  │  FCM/Notif  │  Core Services│
│  │             │  │             │  │  Service    │              │
│  └──────┬──────┘  └──────┬──────┘  └──────┬──────┘              │
│         │                │                │                      │
│  ┌──────▼────────────────▼────────────────▼──────┐              │
│  │              FIREBASE BACKEND                 │              │
│  │  Auth  │  Firestore  │  FCM  │  Storage      │              │
│  └──────────────────────────────────────────────┘              │
│         │                                                    │
│  ┌──────▼──────┐                                             │
│  │  Local DB   │  (Hive + SharedPreferences)                 │
│  └─────────────┘                                             │
└─────────────────────────────────────────────────────────────────┘
```

### 3.2 Data Flow Patterns

| Pattern | Implementation | Example |
|---------|---------------|---------|
| **Auth → Firestore** | AuthService creates user, then FirestoreService saves profile | `auth_service.dart:236` |
| **FCM → Local Notif** | FCM foreground handler shows local notification | `fcm_service.dart:157` |
| **Offline-First** | Hive caches map data; app works without network | `storage_service.dart:228-260` |
| **Client-Side Routing** | NavigationService builds graph from local GeoJSON | `navigation_service.dart:108` |

### 3.3 Service Layer Architecture

All core services follow the **singleton pattern** with Riverpod providers:

```dart
// Pattern used in all core services
class AuthService {
  static final AuthService _instance = AuthService._();
  static AuthService get instance => _instance;
}
final authServiceProvider = Provider<AuthService>((ref) => AuthService.instance);
```

**Services:** `AuthService`, `FirestoreService`, `FCMService`, `NotificationService`, `StorageService`, `LocationService`, `ConnectivityService`

---

## 4. Feature-by-Feature Backend Assessment

### Classification Legend
- **Frontend Only** — Pure UI/client logic, no data persistence
- **Local Storage** — Hive/SharedPreferences only
- **Firebase-Backed** — Uses Firebase services (Auth, Firestore, FCM, Storage)
- **External API** — Calls external REST APIs
- **Custom Backend** — Would need custom server
- **Mock/Hardcoded** — Uses static test data
- **Not Implemented** — Feature placeholder only

---

### 4.1 User Registration & Login
**Status: Firebase-Backed** ✅

| Component | Implementation |
|-----------|----------------|
| Email/Password Auth | `AuthService.signInWithEmailAndPassword()` → Firebase Auth |
| Registration | `AuthService.registerWithEmailAndPassword()` → Firebase Auth + Firestore profile |
| Password Reset | `AuthService.sendPasswordResetEmail()` → Firebase Auth |
| Email Verification | `AuthService.sendEmailVerification()` → Firebase Auth |
| Session Management | `AuthService.authStateChanges` stream → Riverpod `AuthNotifier` |

**Evidence:** `auth_service.dart:164-260`, `auth_state.dart:84-144`

**Gaps:** No social login (Google, Apple), no MFA, no account lockout policy beyond Firebase defaults.

---

### 4.2 User Profiles & Account Management
**Status: Firebase-Backed (Firestore)** ✅

| Operation | Implementation |
|-----------|----------------|
| Create Profile | `FirestoreService.createUserProfile()` on registration |
| Read Profile | `FirestoreService.getUserProfile()` on auth state change |
| Update Profile | `FirestoreService.updateUserProfile()` + Firebase Auth displayName/photoURL |
| Delete Profile | `FirestoreService.deleteUserProfile()` + Firebase Auth delete |

**Data Model:** `user.dart` — 16 fields including role, student/employee ID, department, emergency contacts, FCM token, notification preferences.

**Gaps:** Profile image upload to Firebase Storage not implemented; no profile versioning/audit trail.

---

### 4.3 Campus Map & Building Information
**Status: Frontend Only (Local Assets)** 📱

| Data Source | Implementation |
|-------------|----------------|
| Campus Boundary | `MapDataService.loadCampusBoundary()` → `campus_boundary.geojson` asset |
| Buildings | `MapDataService.loadCampusBuildings()` → `campus_buildings.geojson` asset |
| Pathways | `MapDataService.loadCampusPathways()` → `campus_pathways.geojson` asset |

**Models:** `campus_building.dart`, `campus_pathway.dart`, `campus_boundary.dart` — rich models with polygon geometry, categories, OSM metadata.

**Gaps:** No backend synchronization; map updates require app release. No dynamic POI management.

---

### 4.4 GPS Location & Navigation
**Status: Frontend Only + Local Storage** 📱

| Component | Implementation |
|-----------|----------------|
| GPS Acquisition | `LocationService.getCurrentPosition()` → geolocator |
| Permissions | `LocationService.checkAndRequestPermission()` |
| Reverse Geocoding | `LocationService.getAddressFromCoordinates()` → geocoding |
| Route Calculation | `NavigationService.computeRoute()` — **Dijkstra's algorithm client-side** |
| Graph Building | `NavigationService.buildGraph()` from local pathway GeoJSON |
| Turn-by-Turn | `NavigationService._generateInstructions()` — bearing-based |

**Evidence:** `location_service.dart`, `navigation_service.dart:108-394`

**Gaps:** No server-side routing; no real-time traffic/incident avoidance; no multi-modal routing.

---

### 4.5 Route Calculation & Rerouting
**Status: Frontend Only** 📱

- Entire routing logic runs on device using `NavigationService`
- Graph built from static GeoJSON pathways
- Dijkstra's algorithm with path preferences (main paths, avoid emergency)
- No backend route validation or optimization

---

### 4.6 Emergency Reporting & Emergency Notifications
**Status: Mock/Hardcoded** ⚠️

| Feature | Current State |
|---------|---------------|
| Emergency Screen | `emergency_screen.dart` — placeholder |
| Evacuation Routes | `admin_providers.dart:548-739` — **hardcoded mock EvacuationGraph data** |
| Emergency Alerts | `admin_providers.dart:337-433` — **hardcoded mock Alert data** |
| Report Submission | Not implemented |
| Server Processing | Not implemented |

**Evidence:** `admin_providers.dart` lines 337-739 contain 5 mock alerts and 2 mock evacuation graphs with full data.

**Critical Gap:** No way for users to submit emergency reports; no backend to process, validate, or distribute emergency alerts.

---

### 4.7 Alerts & Announcements
**Status: Mock/Hardcoded** ⚠️

| Feature | Current State |
|---------|---------------|
| Alerts Screen | `alerts_screen.dart` — placeholder |
| Alert List | `admin_providers.dart:304-308` — mock data from `_generateMockAlerts()` |
| Alert Detail | Placeholder in router |
| Real-time Updates | Not implemented (would need Firestore listeners) |

**Data Model:** `alert.dart` — comprehensive model with severity, type, status, targeting, attachments, acknowledgment tracking.

**Gaps:** No Firestore integration for live alerts; no admin UI to create alerts; no FCM topic-based distribution logic.

---

### 4.8 Push Notifications
**Status: Firebase-Backed (FCM) + Local Fallback** ✅

| Component | Implementation |
|-----------|----------------|
| FCM Token | `FCMService.getToken()` / `NotificationService.fcmToken` |
| Permissions | Critical alert permission requested (`criticalAlert: true`) |
| Topics | Defined in `FirebaseConfig`: `all_users`, `students`, `faculty`, `security`, `admins`, `emergency`, `building_{id}`, `user_{id}` |
| Foreground Handling | `FCMService._handleForegroundMessage()` → local notification |
| Background/Terminated | `FirebaseMessaging.onBackgroundMessage` + `onMessageOpenedApp` |
| Channels | Emergency (max), Warning (high), Info (default) — Android & iOS |

**Evidence:** `fcm_service.dart`, `notification_service.dart`, `firebase.dart:89-101`

**Gaps:** No server-side topic subscription management; no Cloud Function to send alerts to topics; token-to-user mapping not persisted in Firestore.

---

### 4.9 Admin Management
**Status: Mock/Hardcoded** ⚠️

| Feature | Current State |
|---------|---------------|
| Dashboard | `admin_providers.dart` — `adminAnalyticsProvider`, `adminAlertsProvider`, `adminUsersProvider`, `adminEvacuationGraphsProvider` all return **mock data** |
| User Management | Mock user list in `_generateMockUsers()` (7 users) |
| Alert Management | Mock alerts in `_generateMockAlerts()` (5 alerts) |
| Evacuation Graphs | Mock graphs in `_generateMockEvacuationGraphs()` (2 graphs) |
| Settings | `AdminSettingsNotifier` — in-memory only, not persisted |

**Routes:** Defined in router (`admin-dashboard`, `admin-users`, `admin-alerts`, etc.) but screens are placeholders.

**Gaps:** No Firestore integration; no role-based access control enforcement beyond router guards; no audit logging.

---

### 4.10 Campus Evacuation Information
**Status: Mock/Hardcoded** ⚠️

- `EvacuationGraph` model is well-designed (`evacuation_graph.dart`) with nodes, edges, multi-floor support, hazards, capacity
- Two mock graphs: "Main Campus" (campus-wide) and "Engineering Building" (building-specific)
- No Firestore persistence; no admin editor; no real-time blockage reporting

---

### 4.11 Features Requiring Server-Side Processing

| Feature | Why Server-Side Needed |
|---------|------------------------|
| Emergency report intake & validation | Prevent spam/fake reports; notify security immediately |
| Alert creation & distribution | Only authorized roles (security/admin) should create emergency alerts |
| FCM topic management | Subscribe users to building/role topics on profile update |
| User role assignment | Custom claims via Admin SDK / Cloud Functions |
| Audit logging | Track who created/resolved alerts, accessed admin features |
| Evacuation graph versioning | Validate and publish graph updates safely |
| Cross-device synchronization | User preferences, offline queue sync |

---

## 5. Identified Architecture Gaps

### 5.1 Critical Gaps (Blocking Production)

| Gap | Impact | File References |
|-----|--------|-----------------|
| **No Firestore Security Rules** | Data exposed to unauthorized reads/writes | Not in codebase |
| **No Cloud Functions** | No server-side logic for emergencies, admin ops | Not in codebase |
| **Mock Admin Data** | Admin dashboard non-functional | `admin_providers.dart:101-739` |
| **No Emergency Report Submission** | Core feature missing | `emergency` feature empty |
| **No Alert Creation API** | Cannot send real alerts | `alerts` feature presentation only |
| **FCM Tokens Not Linked to Users** | Cannot target specific users | `user.dart` has `fcmToken` but not saved |

### 5.2 Significant Gaps

| Gap | Impact | File References |
|-----|--------|-----------------|
| Map data not synced from backend | Cannot update maps without app release | `map_data_service.dart` loads from assets |
| No offline queue for emergency reports | Reports lost if offline | `offline_alert_queue.dart` exists but unused |
| No user presence/online status | Cannot show real-time security staff | Not implemented |
| No analytics/event tracking | No usage insights | Not implemented |
| Image upload not implemented | Profile photos, alert attachments | `storage_service.dart` exists but unused |

### 5.3 Minor Gaps

| Gap | Impact |
|-----|--------|
| No automated testing for services | Regression risk |
| No CI/CD pipeline configuration | Manual deployment |
| No error monitoring (Sentry, etc.) | Production debugging difficult |
| Development auth bypass flag committed | `dev_config.dart:48` set to `false` but present |

---

## 6. Backend Technology Comparison

### Option A: Dart Backend (Dart Frog / Serverpod / Shelf)

| Criterion | Assessment |
|-----------|------------|
| **Flutter Compatibility** | ✅ Same language, shared models |
| **Development Complexity** | ⚠️ High — need to build auth, DB, real-time, push from scratch |
| **Learning Curve** | ⚠️ Medium — Serverpod has opinionated patterns; Dart Frog minimal |
| **Free Tier** | ❌ No managed free hosting; need VPS/Cloud Run ($5-20/mo minimum) |
| **Hosting** | ❌ Self-managed (Cloud Run, VPS, Railway, etc.) |
| **Database** | ❌ Must choose separately (PostgreSQL, MongoDB) |
| **Real-time** | ⚠️ Serverpod has real-time; Dart Frog needs WebSocket impl |
| **Push Notifications** | ❌ Must integrate FCM/APNs manually |
| **Security** | ⚠️ Must implement auth, RBAC, rate limiting yourself |
| **Scalability** | ⚠️ Depends on hosting; manual scaling config |
| **Maintenance** | ❌ High — you own the server, updates, patches |
| **Suitability for College Project** | ❌ Poor — too much infrastructure work |
| **Long-term Expansion** | ✅ Full control, but high ongoing cost |

**Verdict:** Not recommended. Re-inventing Firebase features (auth, real-time DB, FCM, storage) in Dart would take months and require DevOps expertise.

---

### Option B: Firebase (Current — Recommended Enhancement)

| Criterion | Assessment |
|-----------|------------|
| **Flutter Compatibility** | ✅ Official FlutterFire plugins, first-class support |
| **Development Complexity** | ✅ Low — services already integrated |
| **Learning Curve** | ✅ Low — team already using it |
| **Free Tier (Spark)** | ✅ Generous: 10GB Firestore, 10GB Storage, 20K Auth/mo, 125K FCM/mo |
| **Hosting** | ✅ Included (Firebase Hosting for web) |
| **Database** | ✅ Firestore (NoSQL, real-time, offline sync) |
| **Real-time Updates** | ✅ Native listeners, offline-first |
| **Push Notifications** | ✅ FCM integrated, topics, critical alerts |
| **Security** | ✅ Security Rules, App Check, Custom Claims |
| **Scalability** | ✅ Auto-scales; Blaze plan pay-as-you-go |
| **Maintenance** | ✅ Zero-ops (managed) |
| **Suitability for College Project** | ✅ Excellent — free tier covers campus scale |
| **Long-term Expansion** | ✅ Blaze plan scales to millions of users |

**Costs at Scale (Blaze Plan):**
- Firestore: $0.18/GB/day stored, $0.06/100K reads, $0.18/100K writes
- Auth: Free up to 50K MAU, then $0.0055/MAU
- FCM: Free
- Storage: $0.026/GB stored, $0.12/GB downloaded
- Functions: 2M invocations free, then $0.40/M

**Estimated Monthly Cost (10K users, moderate usage):** ~$15-30/month

---

### Option C: Supabase

| Criterion | Assessment |
|-----------|------------|
| **Flutter Compatibility** | ✅ `supabase_flutter` package, good support |
| **Development Complexity** | ⚠️ Medium — migration from Firebase needed |
| **Learning Curve** | ⚠️ Medium — PostgreSQL + PostgREST + Realtime |
| **Free Tier** | ✅ 500MB DB, 1GB storage, 50K MAU Auth, 2M Realtime messages |
| **Hosting** | ⚠️ Edge Functions only; no static hosting (use Vercel/Netlify) |
| **Database** | ✅ PostgreSQL (relational, better for structured campus data) |
| **Real-time** | ✅ Postgres Changes (websocket), but less mature than Firestore |
| **Push Notifications** | ⚠️ No built-in FCM; must use external (FCM, OneSignal) |
| **Security** | ✅ Row Level Security (RLS), JWT, policies |
| **Scalability** | ✅ Auto-scales; Pro plan $25/mo |
| **Maintenance** | ✅ Managed PostgreSQL |
| **Suitability for College Project** | ⚠️ Good but migration cost high |
| **Long-term Expansion** | ✅ PostgreSQL scales well for complex queries |

**Migration Effort:** High — rewrite all Firestore services, auth flow, data models.

---

### Option D: Custom REST API (Node.js/Python/Dart + PostgreSQL)

| Criterion | Assessment |
|-----------|------------|
| **Flutter Compatibility** | ✅ Via `http`/`dio` |
| **Development Complexity** | ❌ Very High — build everything |
| **Learning Curve** | ❌ High — backend + DevOps + DB admin |
| **Free Tier** | ❌ No managed free tier; VPS ~$5-10/mo minimum |
| **Hosting** | ❌ Self-managed (VPS, Kubernetes, Cloud Run) |
| **Database** | ✅ PostgreSQL (best for relational campus data) |
| **Real-time** | ❌ Must add WebSocket server (Socket.io, etc.) |
| **Push Notifications** | ❌ Must integrate FCM/APNs manually |
| **Security** | ❌ Must implement from scratch |
| **Scalability** | ⚠️ Manual |
| **Maintenance** | ❌ Very High |
| **Suitability for College Project** | ❌ Poor |
| **Long-term Expansion** | ✅ Full control |

---

### Comparison Summary

| Factor | Firebase (Enhanced) | Supabase | Custom API | Dart Backend |
|--------|---------------------|----------|------------|--------------|
| **Time to Production** | ✅ Weeks | ⚠️ Months | ❌ Months | ❌ Months |
| **Current Code Reuse** | ✅ 90% | ❌ 20% | ❌ 10% | ❌ 30% |
| **Free Tier Adequacy** | ✅ Yes | ✅ Yes | ❌ No | ❌ No |
| **Real-time/Offline** | ✅ Native | ✅ Good | ❌ Manual | ⚠️ Serverpod |
| **Push Notifications** | ✅ Native FCM | ⚠️ External | ❌ Manual | ❌ Manual |
| **Admin Dashboard** | ✅ Firebase Console | ✅ Supabase Dashboard | ❌ Build it | ❌ Build it |
| **Security Rules/RLS** | ✅ Firestore Rules | ✅ PostgreSQL RLS | ❌ Manual | ❌ Manual |
| **Cost at 10K Users** | ~$20/mo | ~$25/mo | ~$50+/mo | ~$50+/mo |
| **Recommended** | ✅ **YES** | Alternative | No | No |

---

## 7. Recommended Backend and Database

### Primary Recommendation: **Firebase (Enhanced Current Implementation)**

**Why Firebase fits SAFENAV:**

1. **Already Integrated** — 90% of Firebase services are wired up in code
2. **Offline-First Architecture** — Firestore's offline persistence matches the app's Hive-based offline design
3. **Real-time Alerts** — FCM + Firestore listeners enable instant emergency notification distribution
4. **Role-Based Access** — Custom Claims + Firestore Security Rules map perfectly to `UserRole` enum
5. **Campus Scale** — Free tier (Spark) handles 10K+ users; Blaze plan affordable for growth
6. **Zero DevOps** — Critical for student project with limited backend expertise
7. **Map Data Migration Path** — GeoJSON can be imported to Firestore for dynamic updates

### Database: **Cloud Firestore (NoSQL)**

**Why not PostgreSQL/Supabase?**
- Firestore's document model fits the hierarchical campus data (buildings → floors → rooms → pathways)
- Real-time listeners work out of the box for live alert/evacuation updates
- Offline sync is automatic — critical for emergency scenarios with poor connectivity
- Current `User`, `Alert`, `EvacuationGraph` models map cleanly to Firestore documents

**When to Consider Supabase Instead:**
- Complex relational queries (e.g., "all users in buildings adjacent to Building X")
- Need for ACID transactions across multiple collections
- Team has strong PostgreSQL expertise
- Budget requires predictable fixed pricing at scale

---

## 8. Whether Dart is Recommended for the Backend

**❌ NO — Dart is NOT recommended as the backend language for SAFENAV.**

### Reasons:

| Reason | Explanation |
|--------|-------------|
| **Firebase Already Provides Backend** | Auth, Database, Storage, Functions, Messaging — all managed |
| **No Custom Server Needed** | Cloud Functions (TypeScript/Node.js) handle server-side logic |
| **Shared Models ≠ Shared Runtime** | Freezed models serialize to JSON; no need for same language on server |
| **DevOps Burden** | Dart backend requires container hosting, scaling, monitoring, SSL, backups |
| **Ecosystem Maturity** | Node.js/TypeScript Cloud Functions have better libraries, examples, community |
| **Team Expertise** | Flutter team knows Dart; backend requires different skills (SQL, infra, security) |
| **Cost** | Firebase Functions free tier (2M invocations) vs. always-on Dart server ($5-20/mo) |

### When Dart Backend *Would* Make Sense:
- Building a **custom real-time engine** (e.g., multiplayer game server)
- **Edge computing** with Dart Frog on Cloudflare Workers
- Team has **strong Dart backend experience** and no Firebase budget
- Need **full control** over data locality/compliance (on-premise)

**For SAFENAV:** Use **TypeScript for Cloud Functions** (server-side logic) + **Dart for Flutter frontend**. This is the standard FlutterFire pattern.

---

## 9. Proposed Architecture Diagram

```mermaid
graph TB
    subgraph Client["📱 Flutter App (Android, iOS, Web)"]
        UI[UI Layer\nMap, Nav, Emergency, Alerts, Profile, Admin]
        State[Riverpod State\nAuthNotifier, Providers]
        Services[Core Services\nAuth, Firestore, FCM, Storage, Location, Cache]
        LocalDB[(Hive + SharedPrefs\nOffline Cache, Maps, Settings)]
    end

    subgraph Firebase["☁️ Firebase Backend"]
        Auth[Firebase Auth\nEmail/Password, Custom Claims]
        Firestore[(Cloud Firestore\nUsers, Alerts, EvacuationGraphs, Buildings, Pathways, AuditLogs)]
        FCM[Firebase Cloud Messaging\nTopics: all_users, emergency, security, admins, building_{id}]
        Storage[Firebase Storage\nProfile Photos, Alert Attachments, Evacuation Maps]
        Functions[Cloud Functions (TypeScript)\n• onUserCreate → setCustomClaims\n• onAlertCreate → sendFCM to topics\n• onEmergencyReport → validate, notify security\n• onEvacuationGraphUpdate → version, publish\n• scheduled: cleanupExpiredAlerts, refreshFCMTopics]
        Hosting[Firebase Hosting\nWeb App Deploy]
        Console[Firebase Console\nAdmin Dashboard, Analytics, Logs]
    end

    subgraph External["🌐 External Services"]
        OSM[OpenStreetMap\nMap Tiles]
        Geocoder[Geocoding API\nAddress ↔ Coordinates]
    end

    UI --> State
    State --> Services
    Services --> LocalDB
    Services --> Auth
    Services --> Firestore
    Services --> FCM
    Services --> Storage
    Services --> OSM
    Services --> Geocoder
    
    Firestore --> Functions
    Functions --> FCM
    Functions --> Firestore
    Functions --> Storage
    
    Auth -.->|Custom Claims| Functions
    FCM -.->|Topics| Functions
    
    style Client fill:#e3f2fd,stroke:#1976d2
    style Firebase fill:#fff3e0,stroke:#f57c00
    style External fill:#f3e5f5,stroke:#7b1fa2
```

### Responsibility Division

| Layer | Flutter (Client) Responsibilities | Firebase (Backend) Responsibilities |
|-------|-----------------------------------|-------------------------------------|
| **Authentication** | UI forms, token storage, auth state UI | User management, password reset, email verification, custom claims |
| **User Profiles** | Display, edit forms, local cache | Persistent storage, security rules, role enforcement |
| **Campus Map** | Rendering (flutter_map), GPS display, local GeoJSON fallback | **Source of truth** for buildings, pathways, boundaries (Firestore); dynamic updates |
| **Navigation** | Route calculation (Dijkstra), turn-by-turn, voice guidance | **Graph data storage**, versioning, admin editing, validation |
| **Emergency Reports** | Report UI, GPS attachment, offline queue | **Intake validation**, priority queue, security notification, audit log |
| **Emergency Alerts** | Display, acknowledgment, local critical notification | **Creation authorization**, FCM topic distribution, expiration, status tracking |
| **Push Notifications** | Token registration, foreground handling, local display | **Topic management**, server-side send, delivery tracking |
| **Admin Management** | Dashboard UI, forms, data visualization | **RBAC enforcement**, audit logging, analytics aggregation, settings persistence |
| **Offline Support** | Hive cache, queue mutations, sync on reconnect | Conflict resolution (server wins), offline persistence (Firestore) |

---

## 10. Proposed Database Structure

### Firestore Collections

```
firestore/
├── users/{userId}                    # User profiles (mirrors User model)
├── buildings/{buildingId}            # Campus buildings (from GeoJSON + admin edits)
├── pathways/{pathwayId}              # Campus pathways (from GeoJSON + admin edits)
├── campus_boundary/{boundaryId}      # Single campus boundary document
├── evacuation_graphs/{graphId}       # EvacuationGraph documents (versioned)
├── alerts/{alertId}                  # Alert documents (real-time listener target)
├── emergency_reports/{reportId}      # Emergency reports from users
├── audit_logs/{logId}                # Immutable audit trail
├── fcm_tokens/{userId}               # FCM token → user mapping (for targeted sends)
├── settings/{settingId}              # App-wide settings (admin configurable)
└── analytics/{date}_daily            # Aggregated analytics (written by Functions)
```

### Entity Definitions

#### 1. `users/{userId}`
```typescript
interface UserDoc {
  id: string;                    // Firebase Auth UID
  email: string;
  firstName: string;
  lastName: string;
  middleInitial?: string;
  role: 'student' | 'faculty' | 'security' | 'admin';
  studentId?: string;
  employeeId?: string;
  department?: string;
  phoneNumber?: string;
  photoUrl?: string;
  isActive: boolean;
  emailVerified: boolean;
  lastLoginAt: Timestamp;
  createdAt: Timestamp;
  updatedAt: Timestamp;
  fcmToken?: string;             // Current FCM token
  emergencyContactName?: string;
  emergencyContactPhone?: string;
  language: string;              // 'en', 'tl', etc.
  notificationPrefs: {           // User preferences
    emergency: boolean;
    warning: boolean;
    info: boolean;
    email: boolean;
    push: boolean;
  };
}
```
**Security Rules:** Users read own; admins/security read all; users write own (except role, isActive).

#### 2. `buildings/{buildingId}`
```typescript
interface BuildingDoc {
  id: string;                    // e.g., 'ENG-001'
  osmWayId?: number;
  name: string;
  buildingType: string;          // 'college', 'dormitory', etc.
  category: 'academic' | 'administrative' | 'library' | 'laboratory' | 'gymnasium' | 'cafeteria' | 'dormitory' | 'parking' | 'other';
  description: string;
  polygon: GeoPoint[];           // Building footprint
  centroid: GeoPoint;            // Center for markers
  floors: number;
  address?: string;
  areaSqMeters?: number;
  verificationStatus: 'verified_osm' | 'admin_verified' | 'pending';
  source: string;                // 'OpenStreetMap' | 'admin'
  sourceDate: string;
  createdAt: Timestamp;
  updatedAt: Timestamp;
  updatedBy: string;             // Admin UID
  additionalTags: Map<string, any>;
}
```

#### 3. `pathways/{pathwayId}`
```typescript
interface PathwayDoc {
  id: string;
  name: string;
  highway: string;               // 'footway', 'path', 'steps', 'corridor'
  surface: string;               // 'concrete', 'asphalt', 'tiles', 'grass'
  width: number;                 // meters
  category: 'main' | 'secondary' | 'emergency' | 'connector' | 'indoor' | 'stairway' | 'ramp' | 'other';
  description: string;
  coordinates: GeoPoint[];       // LineString geometry
  geometryType: 'LineString' | 'Polygon';
  capacity?: number;             // People per minute
  verificationStatus: string;
  source: string;
  sourceDate: string;
  createdAt: Timestamp;
  updatedAt: Timestamp;
  updatedBy: string;
  additionalTags: Map<string, any>;
}
```

#### 4. `evacuation_graphs/{graphId}`
```typescript
interface EvacuationGraphDoc {
  id: string;                    // e.g., 'EVAC-MAIN', 'EVAC-ENG'
  name: string;
  buildingId?: string;           // null = campus-wide
  version: number;               // Increment on each update
  nodes: EvacuationNode[];       // Full node list
  edges: EvacuationEdge[];       // Full edge list
  defaultAssemblyPointIds: string[];
  defaultShelterIds: string[];
  bounds: [number, number, number, number]; // [minLat, minLng, maxLat, maxLng]
  dataSource: string;            // 'OSM_import' | 'admin_designed' | 'survey'
  createdAt: Timestamp;
  updatedAt: Timestamp;
  updatedBy: string;
  metadata: Map<string, any>;
}

interface EvacuationNode {
  id: string;
  label: string;
  type: 'entrance' | 'stairwell' | 'corridor' | 'intersection' | 'assembly_point' | 'shelter' | 'emergency_exit' | 'fire_extinguisher' | 'first_aid' | 'other';
  latitude: number;
  longitude: number;
  floor?: number;
  buildingId?: string;
  roomId?: string;
  isExit: boolean;
  isAssemblyPoint: boolean;
  isShelter: boolean;
  capacity?: number;
  currentOccupancy: number;
  accessibilityFeatures: string[];
  emergencyEquipment: string[];
  connectedEdgeIds: string[];
}

interface EvacuationEdge {
  id: string;
  fromNodeId: string;
  toNodeId: string;
  distance: number;              // meters
  estimatedTimeSeconds: number;
  isWheelchairAccessible: boolean;
  isEmergencyRoute: boolean;
  floor?: number;
  description?: string;
  hazards: string[];             // ['fire', 'debris', 'smoke']
  isBlocked: boolean;
  blockReason?: string;
  blockedAt?: Timestamp;
}
```

#### 5. `alerts/{alertId}`
```typescript
interface AlertDoc {
  id: string;                    // Auto-generated
  title: string;
  message: string;
  type: 'fire' | 'earthquake' | 'flood' | 'security' | 'medical' | 'weather' | 'infrastructure' | 'suspicious_activity' | 'evacuation' | 'lockdown' | 'all_clear' | 'test' | 'other';
  severity: 'info' | 'warning' | 'critical' | 'emergency';
  status: 'active' | 'acknowledged' | 'resolved' | 'expired';
  locationName?: string;
  latitude?: number;
  longitude?: number;
  buildingId?: string;
  floor?: number;
  affectedArea?: string;
  createdBy: string;             // User UID
  createdByRole: string;         // 'security' | 'admin' | 'system'
  isSystemGenerated: boolean;
  isTest: boolean;
  instructions?: string;
  evacuationRouteId?: string;    // Links to evacuation_graphs
  assemblyPointId?: string;
  shelterId?: string;
  relatedAlertIds: string[];
  attachmentUrls: string[];      // Firebase Storage URLs
  tags: string[];
  targetRoles: string[];         // ['student', 'faculty', 'security', 'admin']
  targetBuildingIds: string[];
  expiresAt?: Timestamp;
  acknowledgedBy: string[];      // User UIDs
  resolvedBy?: string;
  resolutionNotes?: string;
  createdAt: Timestamp;
  updatedAt: Timestamp;
  metadata: Map<string, any>;
}
```

#### 6. `emergency_reports/{reportId}`
```typescript
interface EmergencyReportDoc {
  id: string;
  reporterId: string;            // User UID
  reporterRole: string;
  type: 'fire' | 'medical' | 'security' | 'structural' | 'hazardous_material' | 'other';
  severity: 'low' | 'medium' | 'high' | 'critical';
  title: string;
  description: string;
  latitude: number;
  longitude: number;
  buildingId?: string;
  floor?: number;
  room?: string;
  photos: string[];              // Storage URLs
  audioUrl?: string;             // Voice note
  status: 'submitted' | 'acknowledged' | 'investigating' | 'resolved' | 'false_alarm';
  priority: number;              // 1-10, for security queue
  acknowledgedBy?: string;       // Security UID
  acknowledgedAt?: Timestamp;
  resolvedBy?: string;
  resolvedAt?: Timestamp;
  resolutionNotes?: string;
  createdAt: Timestamp;
  updatedAt: Timestamp;
}
```

#### 7. `audit_logs/{logId}` (immutable, write-once)
```typescript
interface AuditLogDoc {
  id: string;
  actorId: string;               // User UID or 'system'
  actorRole: string;
  action: string;                // 'alert.created', 'user.role_changed', 'evacuation_graph.updated', etc.
  targetType: string;            // 'alert' | 'user' | 'evacuation_graph' | 'building' | 'settings'
  targetId: string;
  before?: Map<string, any>;     // Previous state (for updates)
  after?: Map<string, any>;      // New state
  metadata: Map<string, any>;    // IP, user agent, etc.
  timestamp: Timestamp;
}
```

#### 8. `fcm_tokens/{userId}`
```typescript
interface FcmTokenDoc {
  userId: string;
  token: string;
  platform: 'android' | 'ios' | 'web';
  updatedAt: Timestamp;
  // TTL index: auto-delete after 90 days inactivity
}
```

#### 9. `settings/{settingId}`
```typescript
interface SettingsDoc {
  id: string;                    // e.g., 'app', 'notifications', 'evacuation'
  key: string;
  value: any;
  updatedBy: string;
  updatedAt: Timestamp;
  description: string;
}
```

---

## 11. Proposed API Endpoints

> **Note:** With Firebase, most "API endpoints" are **Firestore document operations** or **Callable Cloud Functions**. REST API is not the primary pattern. Below are the logical operations mapped to Firebase patterns.

### 11.1 Authentication (Firebase Auth — No Custom Endpoints)

| Operation | Firebase Method |
|-----------|-----------------|
| Sign Up | `createUserWithEmailAndPassword()` |
| Sign In | `signInWithEmailAndPassword()` |
| Sign Out | `signOut()` |
| Password Reset | `sendPasswordResetEmail()` |
| Email Verification | `sendEmailVerification()` |
| Get ID Token | `currentUser.getIdToken()` |
| Delete Account | `currentUser.delete()` |

### 11.2 User Profiles (Firestore Document Operations)

| Operation | Firestore Path | Security Rule |
|-----------|----------------|---------------|
| Create Profile | `POST /users/{uid}` (on auth create) | `allow create: if request.auth.uid == uid` |
| Get Profile | `GET /users/{uid}` | `allow read: if request.auth.uid == uid || isAdminOrSecurity()` |
| Update Profile | `PATCH /users/{uid}` | `allow update: if request.auth.uid == uid || isAdmin()` |
| Update FCM Token | `PATCH /users/{uid}` + `fcm_tokens/{uid}` | `allow update: if request.auth.uid == uid` |
| Delete Profile | `DELETE /users/{uid}` (on account delete) | `allow delete: if isAdmin()` |
| List Users (Admin) | `GET /users?role=student&limit=50` | `allow list: if isAdmin()` |

### 11.3 Campus Data (Firestore + Admin SDK)

| Operation | Firestore Path | Notes |
|-----------|----------------|-------|
| Get Campus Boundary | `GET /campus_boundary/main` | Public read |
| List Buildings | `GET /buildings?category=academic` | Public read; admin write |
| Get Building | `GET /buildings/{buildingId}` | Public read |
| Create Building | `POST /buildings` | Admin only |
| Update Building | `PATCH /buildings/{buildingId}` | Admin only |
| List Pathways | `GET /pathways?category=main` | Public read; admin write |
| Bulk Import (Admin) | `Callable: importCampusData(geojson)` | Cloud Function, admin only |

### 11.4 Navigation & Evacuation (Firestore)

| Operation | Firestore Path | Notes |
|-----------|----------------|-------|
| Get Evacuation Graph | `GET /evacuation_graphs/{graphId}` | Public read |
| List Graphs | `GET /evacuation_graphs?buildingId=ENG-001` | Public read |
| Create/Update Graph | `PUT /evacuation_graphs/{graphId}` | Admin/Security only |
| Validate Graph | `Callable: validateEvacuationGraph(graph)` | Cloud Function |
| Report Blockage | `PATCH /evacuation_graphs/{graphId}/edges/{edgeId}` | Security/Admin: `isBlocked=true` |

### 11.5 Emergency Reports (Firestore + Cloud Functions)

| Operation | Method | Notes |
|-----------|--------|-------|
| Submit Report | `POST /emergency_reports` (add doc) | Authenticated users; triggers Function |
| Get My Reports | `GET /emergency_reports?reporterId={uid}` | User owns |
| Get Active Reports (Security) | `GET /emergency_reports?status=submitted` | Security/Admin only |
| Acknowledge Report | `PATCH /emergency_reports/{reportId}` | Security only |
| Resolve Report | `PATCH /emergency_reports/{reportId}` | Security only |

**Cloud Function Trigger:** `onCreate emergency_reports` → validate, assign priority, send FCM to `security` topic, create audit log.

### 11.6 Alerts & Notifications (Firestore + Cloud Functions)

| Operation | Method | Notes |
|-----------|--------|-------|
| Create Alert | `POST /alerts` (add doc) | Security/Admin only; triggers Function |
| Get Active Alerts | `GET /alerts?status=active` | Public read (filtered by targetRoles) |
| Get Alert | `GET /alerts/{alertId}` | Public read |
| Acknowledge Alert | `PATCH /alerts/{alertId}` (add to acknowledgedBy) | Authenticated user |
| Resolve Alert | `PATCH /alerts/{alertId}` | Security/Admin only |
| Expire Alert | `PATCH /alerts/{alertId}` (status=expired) | System (scheduled Function) |
| List Alerts (Admin) | `GET /alerts?limit=100&orderBy=createdAt` | Admin only |

**Cloud Function Trigger:** `onCreate alerts` → determine FCM topics from `targetRoles`/`targetBuildingIds`, send FCM message, create audit log.

### 11.7 Admin Management (Cloud Functions + Firestore)

| Operation | Method | Notes |
|-----------|--------|-------|
| Get Analytics | `Callable: getAdminAnalytics()` | Admin only; aggregates from Firestore |
| Update User Role | `Callable: setUserRole(uid, role)` | Admin only; sets Custom Claims + Firestore |
| Deactivate User | `Callable: deactivateUser(uid)` | Admin only |
| Get Audit Logs | `GET /audit_logs?actorId=X&action=Y&limit=100` | Admin only |
| Update Settings | `PUT /settings/{settingId}` | Admin only |
| Export Data | `Callable: exportData(collections[], dateRange)` | Admin only; generates CSV in Storage |

---

## 12. Security Recommendations

### 12.1 Firestore Security Rules (Critical — Not Yet Implemented)

```javascript
// firestore.rules — MUST BE DEPLOYED BEFORE PRODUCTION
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Helper functions
    function isAuthenticated() { return request.auth != null; }
    function isAdmin() { return isAuthenticated() && request.auth.token.role == 'admin'; }
    function isSecurity() { return isAuthenticated() && request.auth.token.role == 'security'; }
    function isAdminOrSecurity() { return isAdmin() || isSecurity(); }
    function isOwner(uid) { return isAuthenticated() && request.auth.uid == uid; }
    function hasRole(roles) { return isAuthenticated() && request.auth.token.role in roles; }
    
    // Users: own profile read/write; admins/security read all; admins write all
    match /users/{uid} {
      allow read: if isOwner(uid) || isAdminOrSecurity();
      allow create: if isOwner(uid) && request.resource.data.keys().hasOnly(['email','firstName','lastName','role','studentId','employeeId','department','phoneNumber','isActive','emailVerified','createdAt','updatedAt','language','notificationPrefs']);
      allow update: if isOwner(uid) && request.resource.data.diff(resource.data).affectedKeys().hasOnly(['firstName','lastName','middleInitial','phoneNumber','photoUrl','emergencyContactName','emergencyContactPhone','language','notificationPrefs','fcmToken','lastLoginAt','updatedAt']) || isAdmin();
      allow delete: if isAdmin();
    }
    
    // FCM Tokens: user writes own; system reads for sending
    match /fcm_tokens/{uid} {
      allow read: if isAdminOrSecurity(); // For Cloud Functions
      allow write: if isOwner(uid);
    }
    
    // Buildings & Pathways: public read; admin write
    match /buildings/{buildingId} {
      allow read: if true;
      allow write: if isAdmin();
    }
    match /pathways/{pathwayId} {
      allow read: if true;
      allow write: if isAdmin();
    }
    
    // Campus Boundary: public read; admin write
    match /campus_boundary/{boundaryId} {
      allow read: if true;
      allow write: if isAdmin();
    }
    
    // Evacuation Graphs: public read; admin/security write
    match /evacuation_graphs/{graphId} {
      allow read: if true;
      allow write: if isAdminOrSecurity();
    }
    
    // Alerts: public read (filtered by targetRoles in query); admin/security create/update
    match /alerts/{alertId} {
      allow read: if isAuthenticated() && (resource.data.targetRoles.hasAny([request.auth.token.role]) || resource.data.targetRoles.size() == 0);
      allow create: if isAdminOrSecurity() && request.resource.data.createdBy == request.auth.uid;
      allow update: if isAdminOrSecurity() || (isAuthenticated() && request.resource.data.diff(resource.data).affectedKeys().hasOnly(['acknowledgedBy']));
      allow delete: if isAdmin();
    }
    
    // Emergency Reports: reporter creates; security/admin read all; security updates status
    match /emergency_reports/{reportId} {
      allow read: if isOwner(resource.data.reporterId) || isAdminOrSecurity();
      allow create: if isAuthenticated() && request.resource.data.reporterId == request.auth.uid;
      allow update: if isAdminOrSecurity() || (isOwner(resource.data.reporterId) && request.resource.data.diff(resource.data).affectedKeys().hasOnly(['description','photos','audioUrl']));
      allow delete: if isAdmin();
    }
    
    // Audit Logs: admin read only; system write only (via Functions)
    match /audit_logs/{logId} {
      allow read: if isAdmin();
      allow write: if false; // Only Cloud Functions (admin SDK) can write
    }
    
    // Settings: public read; admin write
    match /settings/{settingId} {
      allow read: if true;
      allow write: if isAdmin();
    }
    
    // Analytics: admin read only
    match /analytics/{docId} {
      allow read: if isAdmin();
      allow write: if false; // Only scheduled Functions
    }
  }
}
```

### 12.2 Firebase Authentication Security

| Measure | Implementation |
|---------|----------------|
| **Custom Claims** | Set `role` claim via Cloud Function `onCreate users` → `setCustomUserClaims(uid, {role})` |
| **App Check** | Enable **App Check** with **Play Integrity (Android)**, **DeviceCheck (iOS)**, **reCAPTCHA v3 (Web)** |
| **Password Policy** | Enforce minimum 8 chars via Firebase Auth config |
| **Session Management** | Short ID token TTL (1hr); refresh tokens rotate |
| **Account Lockout** | Firebase default (10 failed attempts → temporary lock) |
| **MFA** | Enable TOTP MFA for admin/security roles (optional) |

### 12.3 Emergency Notification Security

| Risk | Mitigation |
|------|------------|
| **Unauthorized emergency alerts** | Only `security`/`admin` custom claims can create `severity: emergency` alerts (enforced in Cloud Function + Security Rules) |
| **Fake emergency reports** | Rate-limit reports per user (Cloud Function); require photo/audio for critical types; security acknowledgment required |
| **Notification spam** | FCM topic subscription managed by server; users cannot self-subscribe to `emergency`/`security` topics |
| **Alert spoofing** | All alerts signed by Cloud Function; client verifies `createdByRole` in `security`/`admin` |
| **FCM token hijacking** | Tokens stored in `fcm_tokens/{uid}` with owner-only write; rotated on login |

### 12.4 Data Protection

| Data | Protection |
|------|------------|
| **User PII** | Firestore rules restrict to owner + admin/security; no PII in FCM payloads |
| **Emergency Reports** | Encrypted in transit (TLS); at rest (Google-managed keys); audit logged |
| **Admin Credentials** | Never in client; Custom Claims via Admin SDK only |
| **API Keys** | `firebase_options.dart` contains **public** config only (API keys are safe for client); **Private keys** (Admin SDK) only in Cloud Functions / CI secrets |
| **Storage** | Profile photos: `user_photos/{uid}/profile.jpg` — owner read/write; Alert attachments: `alert_attachments/{alertId}/...` — security/admin write, targetRoles read |

### 12.5 Secrets Management

| Secret | Where Stored | Access |
|--------|--------------|--------|
| **Firebase Admin SDK Private Key** | GitHub Secrets / Cloud Secret Manager | Cloud Functions only |
| **FCM Server Key (legacy)** | Not needed (OAuth2 via Admin SDK) | N/A |
| **Geocoding API Key** | Cloud Secret Manager | Cloud Functions only |
| **Third-party API Keys** | Cloud Secret Manager | Cloud Functions only |

**Never commit:** `google-services.json`, `GoogleService-Info.plist`, service account keys.

---

## 13. Estimated Complexity and Possible Costs

### 13.1 Implementation Complexity

| Phase | Tasks | Estimated Effort |
|-------|-------|------------------|
| **Phase 1: Firestore Security & Data Model** | Write/deploy security rules; create collections; migrate mock data | 1-2 weeks |
| **Phase 2: Cloud Functions Core** | `onUserCreate`, `onAlertCreate`, `onEmergencyReport`, scheduled cleanup | 2-3 weeks |
| **Phase 3: Admin Features** | Real admin dashboard connected to Firestore; user management, alert creation, graph editor | 3-4 weeks |
| **Phase 4: Emergency Flow** | Emergency report submission UI; security acknowledgment workflow; FCM integration testing | 2-3 weeks |
| **Phase 5: Map Data Sync** | Import GeoJSON to Firestore; admin editor for buildings/pathways; versioning | 2-3 weeks |
| **Phase 6: Testing & Polish** | Security rules testing; load testing; offline sync verification; App Check | 1-2 weeks |
| **Total** | | **11-17 weeks** (3-4 months) |

### 13.2 Cost Estimation (Firebase Blaze Plan)

| Usage Scenario | Monthly Cost | Notes |
|----------------|--------------|-------|
| **Development (Spark Free Tier)** | $0 | 10GB Firestore, 10GB Storage, 20K Auth, 125K FCM |
| **Campus Pilot (500 users, low traffic)** | $0-5 | Within free tier |
| **Full Campus (5,000 users, moderate)** | $15-30 | ~2GB Firestore, 500K reads/day, 50K writes/day |
| **Multi-Campus (20,000 users, high)** | $80-150 | ~10GB Firestore, 2M reads/day, 200K writes/day |
| **Cloud Functions** | $0-20 | 2M invocations free; ~$0.40/M after |
| **Firebase Hosting (Web)** | $0-5 | 10GB free; $0.15/GB after |

**Cost Drivers to Monitor:**
- Firestore reads/writes (use `limit()`, caching, offline persistence)
- Cloud Function invocations (batch operations, avoid per-document triggers at scale)
- Storage downloads (optimize images, use CDN)

### 13.3 Cost Control Recommendations

1. **Enable Firestore TTL indexes** on `alerts.expiresAt`, `emergency_reports.createdAt` (90 days), `fcm_tokens.updatedAt` (90 days)
2. **Use Firestore Bundles** for static campus data (buildings, pathways) — serve from CDN, not per-device reads
3. **Aggregate Analytics** via scheduled Functions (daily) — not real-time queries
4. **Cache FCM Topics** in Functions — don't query Firestore per send
5. **Monitor via Firebase Console** → Usage tab; set budget alerts

---

## 14. Recommended Implementation Roadmap

### Phase 0: Prerequisites (Week 1)
- [ ] Create Firebase project `safenav-cavite` (already exists)
- [ ] Enable **App Check** with debug tokens for development
- [ ] Set up **GitHub Actions** for CI/CD (lint, test, deploy rules/functions)
- [ ] Configure **Cloud Secret Manager** for Admin SDK key
- [ ] Create `firestore.rules` and `storage.rules` files in repo

### Phase 1: Security Rules & Data Foundation (Weeks 2-3)
- [ ] Deploy Firestore security rules (start with test mode, then lock down)
- [ ] Create initial collections via Admin SDK script: `users`, `buildings`, `pathways`, `campus_boundary`
- [ ] Import GeoJSON data to `buildings` and `pathways` collections
- [ ] Create `evacuation_graphs` from mock data
- [ ] Verify offline persistence works with security rules

### Phase 2: Cloud Functions — Core Triggers (Weeks 4-6)
- [ ] `onUserCreate` → set custom claims (`role`), create `fcm_tokens` doc, welcome notification
- [ ] `onAlertCreate` → determine FCM topics, send multicast, create audit log
- [ ] `onEmergencyReportCreate` → validate, prioritize, notify `security` topic, create audit log
- [ ] `onEvacuationGraphUpdate` → increment version, validate connectivity, notify `admins` topic
- [ ] Scheduled: `cleanupExpiredAlerts` (daily), `refreshFCMTopics` (hourly), `dailyAnalytics` (nightly)

### Phase 3: Admin Dashboard — Real Backend (Weeks 7-10)
- [ ] Replace all mock providers with Firestore listeners (`adminAnalyticsProvider`, `adminAlertsProvider`, etc.)
- [ ] Implement **User Management**: list, search, role change (Callable), deactivate
- [ ] Implement **Alert Management**: create/edit (with FCM topic preview), resolve, expire
- [ ] Implement **Evacuation Graph Editor**: visual node/edge editor, validation, version publish
- [ ] Implement **Campus Map Editor**: building/pathway CRUD, GeoJSON import/export
- [ ] Implement **Settings**: persist `AdminSettings` to `settings/app`

### Phase 4: Emergency Features — User-Facing (Weeks 11-13)
- [ ] **Emergency Report Screen**: form with type, severity, location (GPS), photo, audio
- [ ] **Offline Queue**: `offline_alert_queue.dart` → queue reports when offline, sync on reconnect
- [ ] **Security Acknowledgment UI**: dedicated security view for incoming reports
- [ ] **Evacuation Navigation**: integrate `EvacuationGraph` with `NavigationService` for guided evacuation
- [ ] **Alert Acknowledgment**: user taps "Acknowledge" → updates `alerts/{id}.acknowledgedBy`

### Phase 5: Map Data Synchronization (Weeks 14-16)
- [ ] Migrate `MapDataService` to load from Firestore (with Hive cache fallback)
- [ ] Background sync: check `buildings.updatedAt` > local cache → refresh
- [ ] Admin: visual map editor for pathways (drag-and-drop nodes)
- [ ] Versioning: `campus_data_version` in settings; client checks on startup

### Phase 6: Testing, Security Hardening, Launch (Weeks 17-18)
- [ ] **Security Rules Testing**: `firebase firestore:test` with unit tests
- [ ] **Load Testing**: simulate 5K concurrent users; monitor Functions, Firestore
- [ ] **Penetration Testing**: verify no unauthorized access to admin/emergency functions
- [ ] **App Check Enforcement**: production tokens (Play Integrity, DeviceCheck, reCAPTCHA)
- [ ] **Monitoring**: Firebase Crashlytics, Performance Monitoring, Alerting
- [ ] **Documentation**: API docs (Callable Functions), security rules explanation, runbooks
- [ ] **Production Deploy**: promote to production Firebase project

---

## 15. Risks and Unanswered Questions

### 15.1 Technical Risks

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| **Firestore read costs spike** | Medium | High | Use bundles for static data; aggressive caching; monitor daily |
| **FCM delivery delays on iOS** | Medium | Medium | Use critical alerts (iOS); test with APNs priority; fallback to local notifications |
| **Offline conflict resolution** | Low | High | Server-wins strategy; last-write-wins with timestamp; audit log for manual review |
| **Security rules too permissive** | High | Critical | Write comprehensive rule tests; audit with `firebase firestore:test` |
| **Cloud Functions cold starts** | Medium | Low | Keep functions warm (min instances=1 for critical); optimize imports |
| **Map data size exceeds Firestore doc limit (1MB)** | Low | Medium | Split large pathways into chunks; use Storage for raw GeoJSON |

### 15.2 Unanswered Questions (Require Stakeholder Input)

| Question | Decision Needed |
|----------|-----------------|
| **Who manages admin users?** | Self-service registration with email domain verification (`@earist.edu.ph`) vs. manual admin creation |
| **Emergency report anonymity?** | Allow anonymous reports? (Requires separate flow without `reporterId`) |
| **Multi-campus support?** | Single Firestore project with `campusId` field, or separate projects? |
| **Data retention policy?** | How long to keep emergency reports, alerts, audit logs? (Legal/compliance) |
| **Language support?** | English + Tagalog? FCM message localization strategy? |
| **Integration with campus security systems?** | Existing CCTV, access control, PA systems? API requirements? |
| **Disaster recovery?** | Backup strategy for Firestore (managed export), Functions source control |
| **Budget approval?** | Blaze plan billing account setup; monthly budget alerts |

### 15.3 Assumptions Made

1. **Firebase project `safenav-cavite` is the production project** — separate dev/staging projects recommended
2. **Team has Flutter/Dart expertise** — backend will use TypeScript for Cloud Functions
3. **Campus has reliable internet** — but offline-first design maintained for emergencies
4. **EARIST email domain (`@earist.edu.ph`)** — used for role inference; custom claims for precise roles
5. **OpenStreetMap tiles** — no Google Maps API key costs; `flutter_map` with OSM tiles
6. **Student project timeline** — 3-4 months for backend completion; MVP can launch with core features

---

## Appendix A: Key File References

| Area | File Path | Description |
|------|-----------|-------------|
| Firebase Init | `lib/src/core/firebase/firebase_init.dart` | Firebase initialization provider |
| Firebase Config | `lib/src/core/firebase/firebase.dart` | Collection names, storage paths, FCM topics |
| Auth Service | `lib/src/core/services/auth_service.dart` | Full Firebase Auth implementation |
| Firestore Service | `lib/src/core/services/firestore_service.dart` | User profile CRUD |
| FCM Service | `lib/src/core/services/fcm_service.dart` | FCM + local notification channels |
| Notification Service | `lib/src/core/services/notification_service.dart` | High-priority local notifications |
| Storage Service | `lib/src/core/services/storage_service.dart` | Hive + SharedPreferences |
| Location Service | `lib/src/core/services/location_service.dart` | GPS, geocoding, permissions |
| Auth State | `lib/src/features/auth/auth_state.dart` | Riverpod AuthNotifier |
| Map Data Service | `lib/src/features/map/data/services/map_data_service.dart` | GeoJSON parsing from assets |
| Navigation Service | `lib/src/features/navigation/data/services/navigation_service.dart` | Client-side Dijkstra routing |
| Admin Providers | `lib/src/features/admin/data/providers/admin_providers.dart` | Mock data for admin dashboard |
| User Model | `lib/src/shared/models/user.dart` | User data model |
| Alert Model | `lib/src/shared/models/alert.dart` | Emergency alert model |
| Evacuation Graph | `lib/src/shared/models/evacuation_graph.dart` | Graph model for evacuation |
| Router | `lib/src/core/router/app_router.dart` | GoRouter with auth guards |
| Dev Config | `lib/src/core/constants/dev_config.dart` | Development auth bypass |

---

## Appendix B: Firebase Free Tier Limits (Spark Plan)

| Resource | Limit | SAFENAV Context |
|----------|-------|-----------------|
| Firestore Stored Data | 1 GB | ~50 MB for campus data + users |
| Firestore Reads/Day | 50,000 | ~500 users × 50 reads = 25K/day |
| Firestore Writes/Day | 20,000 | Low (user updates, alerts) |
| Firestore Deletes/Day | 20,000 | Negligible |
| Authentication (MAU) | 50,000 | Well within limit |
| Cloud Storage | 5 GB | Profile photos + alert attachments |
| Cloud Storage Downloads/Day | 1 GB | Map tiles from OSM (not Storage) |
| FCM Messages | Unlimited | Free |
| Cloud Functions | 2M invocations/mo | Sufficient for campus scale |
| Hosting | 10 GB | Web app deployment |

---

**Report Prepared By:** Claude Fable 5 (AI Assistant)  
**Date:** 2025-11-15  
**Classification:** Internal — Project Documentation  
**Next Review:** After Phase 1 implementation (approx. 3 weeks)

---

*This audit is based on static code analysis of the SAFENAV CAVITE codebase as of the audit date. No runtime testing or Firebase project inspection was performed. Recommendations should be validated against actual Firebase project configuration and stakeholder requirements before implementation.*