/** Firebase Admin SDK initialization for Cloudflare Workers */

import * as admin from 'firebase-admin';

let firebaseApp: admin.app.App | null = null;

/**
 * Get or initialize Firebase Admin SDK
 * Uses service account key from Cloudflare Worker secret
 */
export function getFirebaseAdmin(): admin.app.App {
  if (firebaseApp) {
    return firebaseApp;
  }

  // Get service account key from environment variable (set as secret in Cloudflare)
  const serviceAccountKey = (globalThis as any).FIREBASE_SERVICE_ACCOUNT_KEY;

  if (!serviceAccountKey) {
    throw new Error(
      'FIREBASE_SERVICE_ACCOUNT_KEY secret not configured. ' +
      'Add it in Cloudflare Dashboard > Workers > Settings > Secrets'
    );
  }

  let parsedKey: admin.ServiceAccount;
  try {
    // Secret is stored as base64-encoded JSON
    const decoded = atob(serviceAccountKey);
    parsedKey = JSON.parse(decoded);
  } catch (error) {
    throw new Error(`Failed to parse FIREBASE_SERVICE_ACCOUNT_KEY: ${error}`);
  }

  firebaseApp = admin.initializeApp({
    credential: admin.credential.cert(parsedKey),
    projectId: parsedKey.projectId,
    // Firestore settings
    databaseURL: `https://${parsedKey.projectId}.firebaseio.com`,
  });

  // Configure Firestore settings
  const firestore = firebaseApp.firestore();
  firestore.settings({
    ignoreUndefinedProperties: true,
  });

  console.log('[Firebase] Admin SDK initialized for project:', parsedKey.projectId);

  return firebaseApp;
}

/**
 * Get Firestore instance
 */
export function getFirestore(): admin.firestore.Firestore {
  return getFirebaseAdmin().firestore();
}

/**
 * Get Auth instance
 */
export function getAuth(): admin.auth.Auth {
  return getFirebaseAdmin().auth();
}

/**
 * Get Messaging (FCM) instance
 */
export function getMessaging(): admin.messaging.Messaging {
  return getFirebaseAdmin().messaging();
}

/**
 * Verify Firebase ID token and return decoded claims
 */
export async function verifyIdToken(idToken: string): Promise<admin.auth.DecodedIdToken> {
  const auth = getAuth();
  return auth.verifyIdToken(idToken);
}

/**
 * Verify ID token and check for admin role
 */
export async function verifyAdminToken(idToken: string): Promise<admin.auth.DecodedIdToken> {
  const decoded = await verifyIdToken(idToken);

  if (decoded.role !== 'admin') {
    throw new Error('Admin role required');
  }

  return decoded;
}