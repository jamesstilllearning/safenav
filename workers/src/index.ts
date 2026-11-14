/** Cloudflare Workers Entry Point for SAFENAV CAVITE */

import { Hono } from 'hono';
import { cors } from 'hono/cors';
import { logger } from 'hono/logger';

// Import route handlers
import importCampusData from './admin/importCampusData';
import registerToken from './fcm/registerToken';

// Import scheduled functions
import { cleanupExpiredAlerts } from './scheduled/cleanupExpiredAlerts';
import { dailyAnalytics } from './scheduled/dailyAnalytics';
import { cleanupStaleTokens } from './scheduled/cleanupStaleTokens';
import { refreshFCMTopics } from './scheduled/refreshFCMTopics';

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

// Scheduled function endpoints (for manual testing)
app.get('/api/scheduled/cleanup-expired-alerts', async (c) => {
  const result = await cleanupExpiredAlerts(c.env);
  return c.json(result);
});

app.get('/api/scheduled/daily-analytics', async (c) => {
  const result = await dailyAnalytics(c.env);
  return c.json(result);
});

app.get('/api/scheduled/cleanup-stale-tokens', async (c) => {
  const result = await cleanupStaleTokens(c.env);
  return c.json(result);
});

app.get('/api/scheduled/refresh-fcm-topics', async (c) => {
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