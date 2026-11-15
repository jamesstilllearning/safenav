/** Cloudflare Workers Entry Point for SAFENAV CAVITE */

import { Hono } from 'hono';
import { cors } from 'hono/cors';
import { logger } from 'hono/logger';

// Import route handlers
import importCampusData from './admin/importCampusData';
import registerToken from './fcm/registerToken';
import firebaseConnectivity from './diagnostics/firebaseConnectivity';

// Import scheduled functions
import { cleanupExpiredAlerts } from './scheduled/cleanupExpiredAlerts';
import { dailyAnalytics } from './scheduled/dailyAnalytics';
import { cleanupStaleTokens } from './scheduled/cleanupStaleTokens';
import { refreshFCMTopics } from './scheduled/refreshFCMTopics';

// Import auth utilities for middleware
import { verifyAdminToken, extractIdToken, createJWKSCache } from './utils/auth';

// Environment bindings type
interface Env {
  FIREBASE_PROJECT_ID: string;
  FIREBASE_REGION: string;
  ENVIRONMENT: string;
  FIREBASE_SERVICE_ACCOUNT_KEY: string;
  KV: KVNamespace;
}

// Main app
const app = new Hono<{ Bindings: Env }>();

// Global middleware
app.use('*', logger());
app.use('*', cors({
  origin: ['https://safenav-cavite.web.app', 'https://safenav-cavite-staging.web.app', 'http://localhost:*'],
  allowHeaders: ['Content-Type', 'Authorization'],
  allowMethods: ['GET', 'POST', 'OPTIONS'],
}));

// Initialize JWKS cache for admin authentication
let jwksCache: ReturnType<typeof createJWKSCache> | null = null;
function getJWKSCache(kv: KVNamespace) {
  if (!jwksCache) {
    jwksCache = createJWKSCache(kv);
  }
  return jwksCache;
}

// Admin authentication middleware
async function requireAdminAuth(c: any, next: () => Promise<void>) {
  const authHeader = c.req.header('Authorization');
  const idToken = extractIdToken(authHeader);

  if (!idToken) {
    return c.json(
      { success: false, message: 'Authentication required. Please provide Firebase ID token.' },
      401
    );
  }

  try {
    await verifyAdminToken(idToken, c.env.FIREBASE_PROJECT_ID, getJWKSCache(c.env.KV));
    await next();
  } catch (error) {
    return c.json(
      { success: false, message: error instanceof Error ? error.message : 'Invalid or expired token' },
      403
    );
  }
}

// Health check
app.get('/health', (c) => {
  return c.json({
    status: 'ok',
    service: 'safenav-cavite-workers',
    timestamp: new Date().toISOString(),
    environment: c.env.ENVIRONMENT || 'unknown',
  });
});

// API Routes
app.route('/api', importCampusData);
app.route('/api', registerToken);

// Diagnostics endpoint (admin only)
app.route('/api/diagnostics', firebaseConnectivity);

// Scheduled function endpoints (admin only for HTTP access)
// Note: Cron triggers bypass HTTP and call functions directly via the scheduled handler
app.get('/api/scheduled/cleanup-expired-alerts', requireAdminAuth, async (c) => {
  const result = await cleanupExpiredAlerts(c.env);
  return c.json(result);
});

app.get('/api/scheduled/daily-analytics', requireAdminAuth, async (c) => {
  const result = await dailyAnalytics(c.env);
  return c.json(result);
});

app.get('/api/scheduled/cleanup-stale-tokens', requireAdminAuth, async (c) => {
  const result = await cleanupStaleTokens(c.env);
  return c.json(result);
});

app.get('/api/scheduled/refresh-fcm-topics', requireAdminAuth, async (c) => {
  const result = await refreshFCMTopics(c.env);
  return c.json(result);
});

// 404 handler
app.notFound((c) => {
  return c.json({ error: 'Not found', path: c.req.path }, 404);
});

// Error handler
app.onError((err, c) => {
  console.error('Worker error:', err);
  return c.json({ error: 'Internal server error', message: err.message }, 500);
});

// Cloudflare Workers scheduled handler
export default {
  fetch: app.fetch,

  // Scheduled event handlers (triggered by cron)
  async scheduled(event: ScheduledEvent, env: Env, ctx: ExecutionContext) {
    console.log(`[Scheduled] Cron triggered: ${event.cron}`);

    try {
      switch (event.cron) {
        case '0 2 * * *': // Daily 02:00 UTC - Cleanup expired alerts
          await cleanupExpiredAlerts(env);
          break;

        case '0 3 * * *': // Daily 03:00 UTC - Daily analytics
          await dailyAnalytics(env);
          break;

        case '0 4 * * *': // Daily 04:00 UTC - Cleanup stale tokens
          await cleanupStaleTokens(env);
          break;

        case '0 * * * *': // Hourly - Refresh FCM topics
          await refreshFCMTopics(env);
          break;

        default:
          console.log(`[Scheduled] Unknown cron: ${event.cron}`);
      }
    } catch (error) {
      console.error('[Scheduled] Error:', error);
    }
  },
};