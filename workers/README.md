# SAFENAV CAVITE — Cloudflare Workers

Cloudflare Workers implementation replacing Firebase Cloud Functions for free-tier hosting.

## Why Cloudflare Workers?

- **Free tier**: 100,000 requests/day, unlimited cron triggers
- **No Blaze plan required** - Works with Firebase Spark plan
- **Edge network**: Fast for Philippines users
- **TypeScript native**: Same codebase as Firebase Functions
- **Firebase Admin SDK compatible**: Full access to Auth, Firestore, FCM

## Architecture

```
Flutter App → Cloudflare Workers (HTTP) → Firebase Admin SDK → Firebase Services
                    ↑
            Cloudflare Worker Secrets
            (Firebase Service Account Key)
```

## Project Structure

```
workers/
├── wrangler.toml           # Cloudflare Workers config
├── package.json            # Dependencies
├── tsconfig.json           # TypeScript config
└── src/
    ├── index.ts            # Main entry point, routes
    ├── admin/
    │   └── importCampusData.ts   # POST /api/importCampusData
    ├── fcm/
    │   └── registerToken.ts      # POST /api/registerToken
    ├── scheduled/
    │   ├── cleanupExpiredAlerts.ts   # Cron: 0 2 * * *
    │   ├── dailyAnalytics.ts         # Cron: 0 3 * * *
    │   ├── cleanupStaleTokens.ts     # Cron: 0 4 * * *
    │   └── refreshFCMTopics.ts       # Cron: 0 * * * *
    └── utils/
        ├── firebase.ts        # Firebase Admin SDK init
        ├── firestore.ts       # Firestore helpers
        ├── validation.ts      # Zod validation schemas
        └── audit.ts           # Audit logging
```

## Setup

### 1. Prerequisites

- Cloudflare account (free)
- Wrangler CLI: `npm install -g wrangler`
- Firebase project with Service Account

### 2. Generate Firebase Service Account Key

1. Go to Firebase Console → Project Settings → Service Accounts
2. Click "Generate new private key"
3. Save the JSON file securely
4. **Encode as base64**:
   ```bash
   # macOS/Linux
   cat service-account.json | base64 -w 0
   
   # Windows PowerShell
   [Convert]::ToBase64String([IO.File]::ReadAllBytes("service-account.json"))
   ```

### 3. Configure Cloudflare Worker Secrets

1. Go to Cloudflare Dashboard → Workers & Pages → safenav-cavite-workers
2. Settings → Variables and Secrets → Add Secret
3. Name: `FIREBASE_SERVICE_ACCOUNT_KEY`
4. Value: (paste the base64-encoded JSON from step 2)

### 4. Local Development

```bash
cd workers
npm install
npm run dev
```

This starts a local development server at `http://localhost:8787`

### 5. Deploy

```bash
# Deploy to staging
npm run deploy:staging

# Deploy to production
npm run deploy:production
```

Or via GitHub Actions:
- Push to `develop` branch → auto-deploys to staging
- Push to `main` branch → auto-deploys to production
- Manual trigger via workflow_dispatch

## API Endpoints

### POST /api/importCampusData

Imports campus GeoJSON data (buildings, pathways, boundary).

**Headers:**
```
Authorization: Bearer <Firebase ID Token>
Content-Type: application/json
```

**Body:**
```json
{
  "buildings": { "type": "FeatureCollection", "features": [...] },
  "pathways": { "type": "FeatureCollection", "features": [...] },
  "boundary": { "type": "FeatureCollection", "features": [...] },
  "clearExisting": false
}
```

**Requires:** Admin role (Custom Claim `role: 'admin'`)

**Response:**
```json
{
  "success": true,
  "message": "Campus data imported successfully",
  "counts": { "buildings": 4, "pathways": 10, "boundary": 1 }
}
```

### POST /api/registerToken

Registers FCM token for the current user.

**Headers:**
```
Authorization: Bearer <Firebase ID Token>
Content-Type: application/json
```

**Body:**
```json
{
  "token": "fcm-token-string",
  "platform": "android",
  "appVersion": "1.0.0"
}
```

### Scheduled Function Endpoints (Manual Testing)

- `GET /api/scheduled/cleanup-expired-alerts`
- `GET /api/scheduled/daily-analytics`
- `GET /api/scheduled/cleanup-stale-tokens`
- `GET /api/scheduled/refresh-fcm-topics`

## Scheduled Functions (Cron Triggers)

| Function | Schedule (UTC) | Description |
|----------|----------------|-------------|
| `cleanupExpiredAlerts` | `0 2 * * *` (Daily 02:00) | Set `status=expired` for alerts past `expiresAt` |
| `dailyAnalytics` | `0 3 * * *` (Daily 03:00) | Aggregate stats → `analytics/{date}` |
| `cleanupStaleTokens` | `0 4 * * *` (Daily 04:00) | Remove tokens inactive > 90 days |
| `refreshFCMTopics` | `0 * * * *` (Hourly) | Sync user roles → FCM topic subscriptions |

## Firebase Integration

### Flutter App Changes

Update `CampusImportService` to use `CloudflareWorkerClient`:

```dart
// In main.dart or app initialization
final campusImportService = CampusImportService.instance;
campusImportService.initialize(ref); // Sets up auth token getter

// Later, when importing:
final result = await campusImportService.importFromAssets(clearExisting: true);
```

The `CloudflareWorkerClient` automatically gets the Firebase ID token from `AuthService`.

### Firestore Security Rules

No changes needed - Workers use Firebase Admin SDK (bypasses security rules).

### FCM Topic Management

The `refreshFCMTopics` scheduled function handles topic subscriptions:
- All users → `all` topic
- Students → `students` topic
- Faculty → `faculty` topic
- Security → `security` topic
- Admins → `admins` topic

## Monitoring

- **Logs**: Cloudflare Dashboard → Workers → Logs
- **Metrics**: Cloudflare Dashboard → Workers → Metrics
- **Audit Logs**: Firestore `audit_logs` collection

## Troubleshooting

### "FIREBASE_SERVICE_ACCOUNT_KEY secret not configured"
Add the secret in Cloudflare Dashboard → Workers → Settings → Secrets.

### "Invalid or expired token"
- Ensure Flutter app passes valid Firebase ID token
- Check token hasn't expired (auto-refreshed by `getIdToken(forceRefresh: true)`)

### CORS errors
Allowed origins in `src/index.ts`:
- `https://safenav-cavite.web.app`
- `https://safenav-cavite-staging.web.app`
- `http://localhost:*`

Add your custom domain if needed.

### Worker exceeds CPU limit (10ms)
- GeoJSON parsing and batch writes are optimized
- Large imports (1000+ features) may need chunking
- Check logs for execution time

## Migration from Firebase Cloud Functions

| Firebase Function | Cloudflare Worker |
|-------------------|-------------------|
| `importCampusData` (callable) | `POST /api/importCampusData` |
| `registerToken` (callable) | `POST /api/registerToken` |
| `onUserCreate` (auth trigger) | ⚠️ Client-driven or Firebase Extension |
| `onAlertCreate` (firestore trigger) | ⚠️ Client-driven or Firebase Extension |
| `onReportCreate` (firestore trigger) | ⚠️ Client-driven or Firebase Extension |
| Scheduled functions | ✅ Native cron triggers |

**Note**: Firestore/Auth triggers require workarounds:
1. **Client-driven**: Flutter calls Worker after write
2. **Firebase Extensions**: "Firestore to HTTP" / "Auth Triggers" → Worker URL
3. **Polling**: Scheduled Worker queries recent changes

## Cost

| Component | Cost |
|-----------|------|
| Cloudflare Workers Free | $0/month (100K requests/day) |
| Firebase Spark (Auth, Firestore, FCM, Storage) | $0/month |
| **Total** | **$0/month** |

## GitHub Actions Secrets Required

| Secret | Description |
|--------|-------------|
| `CLOUDFLARE_API_TOKEN` | Cloudflare API token with Workers edit permission |
| `CLOUDFLARE_ACCOUNT_ID` | Cloudflare account ID |

## Useful Commands

```bash
# View logs
wrangler tail --env staging
wrangler tail --env production

# Test locally
wrangler dev

# Check deployed routes
wrangler routes list --env production

# View KV namespaces
wrangler kv:namespace list
```