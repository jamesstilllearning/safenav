/** Cloudflare Worker: Register FCM Token HTTP Endpoint */

import { Hono } from 'hono';
import { cors } from 'hono/cors';
import * as admin from 'firebase-admin';

import { getFirestore, serverTimestamp } from '../utils/firestore';
import { writeTokenRegistrationAudit } from '../utils/audit';
import { validateRegisterTokenInput, RegisterTokenInput } from '../utils/validation';
import { verifyIdToken } from '../utils/firebase';

const app = new Hono();

app.use('*', cors({
  origin: ['https://safenav-cavite.web.app', 'https://safenav-cavite-staging.web.app', 'http://localhost:*'],
  allowHeaders: ['Content-Type', 'Authorization'],
  allowMethods: ['POST', 'OPTIONS'],
}));

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
  // 1. Verify authentication
  const authHeader = c.req.header('Authorization');
  const idToken = authHeader?.replace('Bearer ', '');

  if (!idToken) {
    return c.json({ success: false, message: 'Authentication required' }, 401);
  }

  let decodedToken: admin.auth.DecodedIdToken;
  try {
    decodedToken = await verifyIdToken(idToken);
  } catch {
    return c.json({ success: false, message: 'Invalid or expired token' }, 403);
  }

  const uid = decodedToken.uid;

  try {
    // 2. Validate input
    const body = await c.req.json();
    const input = validateRegisterTokenInput(body);

    // 3. Save token to Firestore
    const db = getFirestore();
    const tokenRef = db.collection('fcm_tokens').doc(uid);

    await tokenRef.set({
      uid,
      token: input.token,
      platform: input.platform,
      appVersion: input.appVersion,
      updatedAt: serverTimestamp(),
      createdAt: serverTimestamp(),
    }, { merge: true });

    // 4. Write audit log
    await writeTokenRegistrationAudit(uid, input.platform, true);

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
      await writeTokenRegistrationAudit(uid, 'unknown', false);
    } catch {}

    return c.json(
      { success: false, message: `Failed to register token: ${error instanceof Error ? error.message : 'Unknown error'}` },
      500
    );
  }
});

export default app;