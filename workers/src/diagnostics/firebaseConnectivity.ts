/** Firebase Connectivity Diagnostic Endpoint for Cloudflare Workers */

import { Hono } from 'hono';
import { cors } from 'hono/cors';

import { FirestoreRESTClient } from '../utils/firestore-rest';
import { getServiceAccount, createOAuthCache, OAuthTokenCache } from '../utils/oauth';
import { verifyAdminToken, extractIdToken, createJWKSCache } from '../utils/auth';
import { writeAuditLog } from '../utils/audit';

const app = new Hono();

// Enable CORS for diagnostics endpoint
app.use('*', cors({
  origin: ['https://safenav-cavite.web.app', 'https://safenav-cavite-staging.web.app', 'http://localhost:*'],
  allowHeaders: ['Content-Type', 'Authorization'],
  allowMethods: ['GET', 'OPTIONS'],
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
 * Service Account Validation Result
 */
interface ServiceAccountStatus {
  loaded: boolean;
  projectId?: string;
  clientEmail?: string;
  error?: string;
}

/**
 * OAuth Status Result
 */
interface OAuthStatus {
  tokenGenerated: boolean;
  cached: boolean;
  error?: string;
}

/**
 * Firestore Status Result
 */
interface FirestoreStatus {
  reachable: boolean;
  permissions: 'read' | 'none' | 'unknown';
  testDocCount?: number;
  error?: string;
}

/**
 * Diagnostic Response
 */
interface DiagnosticResponse {
  success: boolean;
  serviceAccount: ServiceAccountStatus;
  oauth: OAuthStatus;
  firestore: FirestoreStatus;
  overall: 'healthy' | 'degraded' | 'unhealthy';
  timestamp: string;
}

/**
 * Validate service account credentials
 */
async function validateServiceAccount(): Promise<ServiceAccountStatus> {
  try {
    const serviceAccount = getServiceAccount();

    // Validate required fields
    const requiredFields = [
      'type', 'project_id', 'private_key_id', 'private_key',
      'client_email', 'client_id', 'auth_uri', 'token_uri',
      'auth_provider_x509_cert_url', 'client_x509_cert_url', 'universe_domain'
    ];

    for (const field of requiredFields) {
      if (!serviceAccount[field as keyof typeof serviceAccount]) {
        return {
          loaded: false,
          error: `Missing required field: ${field}`
        };
      }
    }

    // Verify project ID matches expected
    if (serviceAccount.project_id !== 'safenav-cavite') {
      return {
        loaded: false,
        error: `Project ID mismatch: expected 'safenav-cavite', got '${serviceAccount.project_id}'`
      };
    }

    return {
      loaded: true,
      projectId: serviceAccount.project_id,
      clientEmail: serviceAccount.client_email
    };
  } catch (error) {
    return {
      loaded: false,
      error: error instanceof Error ? error.message : 'Unknown error validating service account'
    };
  }
}

/**
 * Test OAuth token generation
 */
async function testOAuth(env: { FIREBASE_PROJECT_ID: string; KV: KVNamespace }): Promise<OAuthStatus> {
  try {
    const oauthCache = createOAuthCache(env.KV, 'https://www.googleapis.com/auth/datastore');

    // Try to get token (will use cache if available, otherwise generate new)
    const token = await oauthCache.getToken();

    // Check if token was from cache by checking KV directly
    // Note: We can't easily distinguish cached vs new without modifying OAuthTokenCache
    // For now, we'll report true for cached if token exists and is valid
    const cached = await env.KV.get(`oauth_token_${(await getServiceAccount()).client_email}`, 'json');

    return {
      tokenGenerated: !!token,
      cached: !!cached
    };
  } catch (error) {
    return {
      tokenGenerated: false,
      cached: false,
      error: error instanceof Error ? error.message : 'Unknown error generating OAuth token'
    };
  }
}

/**
 * Test Firestore read connectivity
 */
async function testFirestoreRead(
  firestoreClient: FirestoreRESTClient
): Promise<FirestoreStatus> {
  try {
    // Perform a minimal read-only operation: list documents with pageSize=1
    // We'll use a collection that should exist (users) but with minimal impact
    const result = await firestoreClient.listDocuments('users', { pageSize: 1 });

    return {
      reachable: true,
      permissions: 'read',
      testDocCount: result.documents.length
    };
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : 'Unknown error';

    // Classify error type
    let permissions: 'read' | 'none' | 'unknown' = 'unknown';
    if (errorMessage.includes('403') || errorMessage.includes('PERMISSION_DENIED') || errorMessage.includes('permission')) {
      permissions = 'none';
    } else if (errorMessage.includes('401') || errorMessage.includes('UNAUTHENTICATED')) {
      permissions = 'none';
    }

    return {
      reachable: false,
      permissions,
      error: errorMessage
    };
  }
}

/**
 * GET /api/diagnostics/firebase-connectivity
 *
 * Comprehensive Firebase connectivity diagnostic.
 * Requires admin authentication.
 */
app.get('/firebase-connectivity', async (c) => {
  const env = c.env as { FIREBASE_PROJECT_ID: string; KV: KVNamespace };
  const { firestoreClient, jwksCache } = getClients(env);

  const startTime = Date.now();

  // 1. Verify admin authentication
  const authHeader = c.req.header('Authorization');
  const idToken = extractIdToken(authHeader);

  if (!idToken) {
    return c.json(
      {
        success: false,
        error: 'Authentication required. Please provide Firebase ID token.',
        timestamp: new Date().toISOString()
      },
      401
    );
  }

  let decodedToken: { uid: string; role?: string };
  try {
    decodedToken = await verifyAdminToken(idToken, env.FIREBASE_PROJECT_ID, jwksCache);
  } catch (error) {
    return c.json(
      {
        success: false,
        error: error instanceof Error ? error.message : 'Invalid or expired token',
        timestamp: new Date().toISOString()
      },
      403
    );
  }

  const adminUid = decodedToken.uid;

  try {
    // 2. Run all diagnostic checks in parallel
    const [serviceAccountStatus, oauthStatus, firestoreStatus] = await Promise.all([
      validateServiceAccount(),
      testOAuth(env),
      testFirestoreRead(firestoreClient)
    ]);

    // 3. Determine overall health
    let overall: 'healthy' | 'degraded' | 'unhealthy' = 'healthy';

    if (!serviceAccountStatus.loaded || !oauthStatus.tokenGenerated || !firestoreStatus.reachable) {
      overall = 'unhealthy';
    } else if (firestoreStatus.permissions === 'none') {
      overall = 'degraded';
    }

    // 4. Build response
    const response: DiagnosticResponse = {
      success: overall !== 'unhealthy',
      serviceAccount: serviceAccountStatus,
      oauth: oauthStatus,
      firestore: firestoreStatus,
      overall,
      timestamp: new Date().toISOString()
    };

    // 5. Write audit log
    try {
      await writeAuditLog(firestoreClient, {
        actorId: adminUid,
        actorRole: 'admin',
        action: 'diagnostics.firebase_connectivity_checked',
        targetType: 'auth',
        targetId: 'firebase_connectivity',
        after: {
          overall,
          serviceAccountLoaded: serviceAccountStatus.loaded,
          oauthTokenGenerated: oauthStatus.tokenGenerated,
          firestoreReachable: firestoreStatus.reachable,
          durationMs: Date.now() - startTime,
          checkedAt: new Date().toISOString()
        }
      });
    } catch (auditError) {
      // Don't fail the request if audit logging fails
      console.error('Failed to write audit log for diagnostics:', auditError);
    }

    // 6. Return appropriate status code
    const statusCode = overall === 'unhealthy' ? 503 : overall === 'degraded' ? 200 : 200;

    return c.json(response, statusCode);

  } catch (error) {
    console.error('Diagnostic endpoint error:', error);

    return c.json(
      {
        success: false,
        error: 'Internal server error during diagnostics',
        timestamp: new Date().toISOString()
      },
      500
    );
  }
});

export default app;