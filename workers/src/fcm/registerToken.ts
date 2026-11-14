/** Cloudflare Worker: Register FCM Token HTTP Endpoint */

import { Hono } from 'hono';
import { cors } from 'hono/cors';

import { FirestoreRESTClient, FieldValue } from '../utils/firestore-rest';
import { writeTokenRegistrationAudit } from '../utils/audit';
import { validateRegisterTokenInput, RegisterTokenInput } from '../utils/validation';
import { verifyIdToken, extractIdToken, createJWKSCache } from '../utils/auth';
import { createOAuthCache } from '../utils/oauth';

const app = new Hono();

app.use('*', cors({
  origin: ['https://safenav-cavite.web.app', 'https://safenav-cavite-staging.web.app', 'http://localhost:*'],
  allowHeaders: ['Content-Type', 'Authorization'],
  allowMethods: ['POST', 'OPTIONS'],
}));

// Initialize clients lazily
let firestoreClient: FirestoreRESTClient | null = null;
let jwksCache: ReturnType<typeof createJWKSCache> | null = null;

function getClients(env: { FIREBASE_PROJECT_ID: string; KV: KVNamespace }) {
  if (!firestoreClient) {
    const oauthCache = createOAuthCache(env.KV, 'https://www.googleapis.com/auth/datastore');
    firestoreClient = new FirestoreRESTClient(env.FIREBASE_PROJECT_ID, oauthCache);
  }
  if (!jwksCache) {
    jwksCache = createJWKSCache(env.KV);
  }
  return { firestoreClient, jwksCache };
}

/**
 * POST /registerToken
 *
 * Registers FCM token for the current user.
 * Requires valid Firebase ID token.
 *
 * Request:
 *   Authorization: Bearer <Firebase ID Token>
 *   Content-Type: application/json
 *   Body: {
 *     token: string,
 *     platform: 'android' | 'ios' | 'web',
 *     appVersion: string
 *   }
 *
 * Response:
 *   { success: boolean, message: string }
 */
app.post('/registerToken', async (c) => {
  const env = c.env as { FIREBASE_PROJECT_ID: string; KV: KVNamespace };
  const { firestoreClient, jwksCache } = getClients(env);

  // 1. Verify authentication
  const authHeader = c.req.header('Authorization');
  const idToken = extractIdToken(authHeader);

  if (!idToken) {
    return c.json({ success: false, message: 'Authentication required' }, 401);
  }

  let decodedToken: { uid: string };
  try {
    decodedToken = await verifyIdToken(idToken, env.FIREBASE_PROJECT_ID, jwksCache);
  } catch {
    return c.json({ success: false, message: 'Invalid or expired token' }, 403);
  }

  const uid = decodedToken.uid;

  try {
    // 2. Validate input
    const body = await c.req.json();
    const input = validateRegisterTokenInput(body);

    // 3. Save token to Firestore
    await firestoreClient.createDocument('fcm_tokens', {
      uid,
      token: input.token,
      platform: input.platform,
      appVersion: input.appVersion,
      updatedAt: FieldValue.serverTimestamp(),
      createdAt: FieldValue.serverTimestamp(),
    }, uid);

    // 4. Write audit log
    await writeTokenRegistrationAudit(firestoreClient, uid, input.platform, true);

    console.log(`FCM token registered for user ${uid} (${input.platform})`);

    return c.json({
      success: true,
      message: 'FCM token registered successfully',
    });
  } catch (error) {
    console.error('registerToken error:', error);

    if (error instanceof Error && error.message.includes('Invalid')) {
      return c.json({ success: false, message: error.message }, 400);
    }

    // Write failed audit log
    try {
      await writeTokenRegistrationAudit(firestoreClient, uid, 'unknown', false);
    } catch {}

    return c.json(
      { success: false, message: `Failed to register token: ${error instanceof Error ? error.message : 'Unknown error'}` },
      500
    );
  }
});

export default app;