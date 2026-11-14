# SAFENAV CAVITE — Cloud Functions

TypeScript Cloud Functions for Firebase backend logic.

## Setup

```bash
cd functions
npm install
```

## Development

```bash
# Build TypeScript
npm run build

# Watch mode for development
npm run build:watch

# Run linter
npm run lint

# Start local emulator
npm run serve
```

## Deployment

```bash
# Deploy to staging
firebase deploy --only functions --project safenav-cavite-staging

# Deploy to production
firebase deploy --only functions --project safenav-cavite
```

## Project Structure

```
functions/
├── src/
│   ├── index.ts                 # Main entry point, exports all functions
│   ├── admin/
│   │   └── importCampusData.ts  # Callable: Import campus GeoJSON data
│   ├── auth/
│   │   ├── onUserCreate.ts      # Auth trigger: Set custom claims
│   │   └── onUserDelete.ts      # Auth trigger: Cleanup
│   ├── alerts/
│   │   ├── onAlertCreate.ts     # Firestore trigger: FCM distribution
│   │   └── onAlertUpdate.ts     # Firestore trigger: Audit log
│   ├── emergency/
│   │   ├── onReportCreate.ts    # Firestore trigger: Process emergency report
│   │   └── onReportUpdate.ts    # Firestore trigger: Status changes
│   ├── fcm/
│   │   ├── registerToken.ts     # Callable: Register FCM token
│   │   └── cleanupTokens.ts     # Scheduled: Remove stale tokens
│   ├── scheduled/
│   │   ├── cleanupExpiredAlerts.ts   # Daily: Expire old alerts
│   │   └── dailyAnalytics.ts         # Daily: Aggregate analytics
│   └── utils/
│       ├── firestore.ts         # Firestore helpers
│       ├── validation.ts        # Zod validation schemas
│       └── audit.ts             # Audit logging
├── package.json
├── tsconfig.json
└── .eslintrc.js
```

## Callable Functions

### `importCampusData`

Imports campus GeoJSON data (buildings, pathways, boundary) into Firestore.

**Input:**
```typescript
{
  buildings?: GeoJSON.FeatureCollection,
  pathways?: GeoJSON.FeatureCollection,
  boundary?: GeoJSON.FeatureCollection,
  clearExisting?: boolean
}
```

**Requires:** Admin role (Custom Claim `role: 'admin'`)

**Returns:**
```typescript
{
  success: boolean,
  message: string,
  counts: { buildings: number, pathways: number, boundary: number }
}
```

### `registerToken`

Registers FCM token for the current user.

**Input:**
```typescript
{
  token: string,
  platform: 'android' | 'ios' | 'web',
  appVersion: string
}
```

### `setUserRole` (Phase 2)

Sets user role and updates Custom Claims.

**Input:**
```typescript
{
  targetUid: string,
  role: 'student' | 'faculty' | 'security' | 'admin'
}
```

### `getAnalytics` (Phase 2)

Returns aggregated analytics for admin dashboard.

## Auth Triggers

### `onUserCreate`

Runs when a new user is created in Firebase Auth.

Actions:
1. Infers role from email domain (`@earist.edu.ph` → student/faculty)
2. Sets Custom Claims (`role`)
3. Creates `fcm_tokens/{uid}` document
4. Writes audit log

### `onUserDelete`

Runs when a user is deleted.

Actions:
1. Cleans up user data (optional - soft delete preferred)

## Firestore Triggers

### `onAlertCreate`

Runs when an alert document is created.

Actions:
1. Determines FCM topics from `targetRoles` and `targetBuildingIds`
2. Sends FCM multicast message
3. Writes audit log with delivery results

### `onReportCreate`

Runs when an emergency report is created.

Actions:
1. Rate limits reports per user
2. Calculates priority (1-10)
3. Sends FCM to `security` topic
4. Auto-escalates critical fire reports to campus-wide alert
5. Writes audit log

## Scheduled Functions

| Function | Schedule | Description |
|----------|----------|-------------|
| `cleanupExpiredAlerts` | Daily 02:00 | Set `status=expired` for alerts past `expiresAt` |
| `dailyAnalytics` | Daily 03:00 | Aggregate stats → `analytics/{date}` |
| `refreshFCMTopics` | Hourly | Sync user roles → FCM topic subscriptions |
| `cleanupStaleTokens` | Daily 04:00 | Remove tokens inactive > 90 days |

## Local Testing

1. Start emulators:
   ```bash
   firebase emulators:start --project safenav-cavite-staging
   ```

2. Call functions from Flutter (emulator mode):
   ```dart
   FirebaseFunctions.instance.useFunctionsEmulator('localhost', 5001);
   ```

## Environment Variables

Set in Firebase Console → Functions → Configuration:

| Variable | Description |
|----------|-------------|
| `GEOCODING_API_KEY` | Google Maps Geocoding API key (for reverse geocoding) |

## Secrets

Stored in Google Cloud Secret Manager (not in repo):

| Secret | Used By |
|--------|---------|
| `firebase-admin-sdk` | Admin SDK initialization (CI/CD) |

## Firestore Collections Used

| Collection | Read | Write |
|------------|------|-------|
| `users` | Triggers, Callables | Auth trigger |
| `buildings` | - | importCampusData |
| `pathways` | - | importCampusData |
| `campus_boundary` | - | importCampusData |
| `evacuation_graphs` | Triggers | Admin callables |
| `alerts` | Triggers | Admin callables |
| `emergency_reports` | Triggers | - |
| `fcm_tokens` | Triggers | registerToken |
| `audit_logs` | - | All triggers |
| `settings` | - | Admin callables |
| `analytics` | - | dailyAnalytics |

## Phase 1 Implementation Status

✅ **Completed:**
- `firestore.rules` - Security rules
- `storage.rules` - Storage rules
- `.firebaserc` - Project config
- `functions/package.json` - Dependencies
- `functions/tsconfig.json` - TypeScript config
- `functions/.eslintrc.js` - ESLint config
- `functions/src/index.ts` - Entry point
- `functions/src/utils/firestore.ts` - Firestore helpers
- `functions/src/utils/validation.ts` - Zod validation
- `functions/src/utils/audit.ts` - Audit logging
- `functions/src/admin/importCampusData.ts` - Import callable
- `.github/workflows/firebase.yml` - CI/CD pipeline
- `lib/src/features/admin/data/services/campus_import_service.dart` - Flutter integration

⏳ **Pending (Phase 2+):**
- Auth triggers (`onUserCreate`, `onUserDelete`)
- Alert triggers (`onAlertCreate`, `onAlertUpdate`)
- Emergency triggers (`onReportCreate`, `onReportUpdate`)
- FCM callables (`registerToken`, `cleanupTokens`)
- Scheduled functions
- Admin callables (`setUserRole`, `getAnalytics`, etc.)

## Testing Phase 1

1. Deploy to staging:
   ```bash
   firebase deploy --only firestore:rules,storage:rules --project safenav-cavite-staging
   firebase deploy --only functions --project safenav-cavite-staging
   ```

2. In Flutter app (Chrome):
   ```dart
   // Sign in as admin user
   // Call import function
   final result = await CampusImportService.instance.importFromAssets(clearExisting: true);
   print(result);
   ```

3. Verify in Firestore Console:
   - `buildings` collection has 4 documents
   - `pathways` collection has 10 documents
   - `campus_boundary/main` document exists

## Useful Commands

```bash
# View function logs
firebase functions:log --project safenav-cavite-staging

# Test function in shell
firebase functions:shell --project safenav-cavite-staging
> importCampusData({buildings: {...}, pathways: {...}, boundary: {...}, clearExisting: true})

# Get current rules
firebase firestore:rules:get --project safenav-cavite-staging

# Run security rules tests
firebase firestore:test --project safenav-cavite-staging
```