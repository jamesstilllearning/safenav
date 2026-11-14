/** Firebase Authentication ID token verification for Cloudflare Workers */

import { createOAuthCache } from './oauth';

export interface DecodedIdToken {
  uid: string;
  email?: string;
  email_verified?: boolean;
  name?: string;
  picture?: string;
  role?: string;
  admin?: boolean;
  [key: string]: unknown;
}

interface JWK {
  kty: string;
  kid: string;
  use: string;
  alg: string;
  n: string;
  e: string;
}

interface JWKS {
  keys: JWK[];
}

const FIREBASE_JWKS_URL = 'https://www.googleapis.com/robot/v1/metadata/x509/securetoken@system.gserviceaccount.com';
const FIREBASE_ISSUER_PREFIX = 'https://securetoken.google.com/';

/** JWKS cache with 1-hour TTL */
class JWKSCache {
  private kv: KVNamespace;
  private cacheKey = 'firebase_jwks';
  private jwks: JWKS | null = null;
  private fetchedAt = 0;

  constructor(kv: KVNamespace) {
    this.kv = kv;
  }

  async getJWKS(): Promise<JWKS> {
    // Check memory cache (5 min)
    if (this.jwks && Date.now() - this.fetchedAt < 5 * 60 * 1000) {
      return this.jwks;
    }

    // Check KV cache (1 hour)
    const cached = await this.kv.get(this.cacheKey, 'json') as { jwks: JWKS; fetchedAt: number } | null;
    if (cached && Date.now() - cached.fetchedAt < 60 * 60 * 1000) {
      this.jwks = cached.jwks;
      this.fetchedAt = cached.fetchedAt;
      return this.jwks;
    }

    // Fetch from Google
    const response = await fetch(FIREBASE_JWKS_URL);
    if (!response.ok) {
      throw new Error(`Failed to fetch JWKS: ${response.status}`);
    }

    this.jwks = await response.json() as JWKS;
    this.fetchedAt = Date.now();

    // Store in KV
    await this.kv.put(this.cacheKey, JSON.stringify({ jwks: this.jwks, fetchedAt: this.fetchedAt }), {
      expirationTtl: 3600,
    });

    return this.jwks;
  }

  async getKey(kid: string): Promise<CryptoKey> {
    const jwks = await this.getJWKS();
    const jwk = jwks.keys.find(k => k.kid === kid);
    if (!jwk) {
      // Force refresh and try once more
      this.jwks = null;
      const freshJwks = await this.getJWKS();
      const freshJwk = freshJwks.keys.find(k => k.kid === kid);
      if (!freshJwk) {
        throw new Error(`Key not found: ${kid}`);
      }
      return this.importJWK(freshJwk);
    }
    return this.importJWK(jwk);
  }

  private async importJWK(jwk: JWK): Promise<CryptoKey> {
    return crypto.subtle.importKey(
      'jwk',
      {
        kty: jwk.kty,
        use: jwk.use,
        alg: jwk.alg,
        n: jwk.n,
        e: jwk.e,
      },
      { name: 'RSASSA-PKCS1-v1_5', hash: 'SHA-256' },
      false,
      ['verify']
    );
  }
}

/** Base64URL decode */
function base64urlDecode(str: string): Uint8Array {
  const padded = str + '='.repeat((4 - (str.length % 4)) % 4);
  const base64 = padded.replace(/-/g, '+').replace(/_/g, '/');
  const binary = atob(base64);
  return new Uint8Array(binary.length).map((_, i) => binary.charCodeAt(i));
}

/** Parse JWT header and payload without verification */
function parseJWT(token: string): { header: Record<string, unknown>; payload: Record<string, unknown> } | null {
  const parts = token.split('.');
  if (parts.length !== 3) return null;

  try {
    const header = JSON.parse(new TextDecoder().decode(base64urlDecode(parts[0])));
    const payload = JSON.parse(new TextDecoder().decode(base64urlDecode(parts[1])));
    return { header, payload };
  } catch {
    return null;
  }
}

/** Verify Firebase ID token */
export async function verifyIdToken(
  idToken: string,
  projectId: string,
  jwksCache: JWKSCache
): Promise<DecodedIdToken> {
  const parsed = parseJWT(idToken);
  if (!parsed) {
    throw new Error('Invalid token format');
  }

  const { header, payload } = parsed;

  // Verify algorithm
  if (header.alg !== 'RS256') {
    throw new Error('Unsupported algorithm');
  }

  // Verify key ID
  const kid = header.kid as string;
  if (!kid) {
    throw new Error('Missing key ID');
  }

  // Get public key and verify signature
  const publicKey = await jwksCache.getKey(kid);
  const signingInput = idToken.substring(0, idToken.lastIndexOf('.'));
  const signature = base64urlDecode(idToken.split('.')[2]);

  const valid = await crypto.subtle.verify(
    'RSASSA-PKCS1-v1_5',
    publicKey,
    signature,
    new TextEncoder().encode(signingInput)
  );

  if (!valid) {
    throw new Error('Invalid signature');
  }

  // Verify standard claims
  const now = Math.floor(Date.now() / 1000);

  if (payload.iss !== `${FIREBASE_ISSUER_PREFIX}${projectId}`) {
    throw new Error('Invalid issuer');
  }

  if (payload.aud !== projectId) {
    throw new Error('Invalid audience');
  }

  const exp = Number(payload.exp);
  const iat = Number(payload.iat);
  const authTime = payload.auth_time ? Number(payload.auth_time) : undefined;

  if (exp < now) {
    throw new Error('Token expired');
  }

  if (iat > now + 60) {
    throw new Error('Token issued in future');
  }

  // Verify auth_time if present (max 30 days)
  if (authTime && authTime < now - 30 * 24 * 60 * 60) {
    throw new Error('Authentication too old');
  }

  return payload as DecodedIdToken;
}

/** Verify ID token and check admin role */
export async function verifyAdminToken(
  idToken: string,
  projectId: string,
  jwksCache: JWKSCache
): Promise<DecodedIdToken> {
  const decoded = await verifyIdToken(idToken, projectId, jwksCache);

  // Check custom claims for admin role
  // Firebase Admin SDK sets 'admin' claim, or check 'role' claim
  const isAdmin = decoded.admin === true || decoded.role === 'admin';

  if (!isAdmin) {
    throw new Error('Admin role required');
  }

  return decoded;
}

/** Create JWKS cache from environment */
export function createJWKSCache(kv: KVNamespace): JWKSCache {
  return new JWKSCache(kv);
}

/** Extract ID token from Authorization header */
export function extractIdToken(authHeader: string | undefined): string | null {
  if (!authHeader) return null;
  const parts = authHeader.split(' ');
  if (parts.length !== 2 || parts[0].toLowerCase() !== 'bearer') return null;
  return parts[1];
}