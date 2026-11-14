/** OAuth 2.0 and Service Account JWT utilities for Cloudflare Workers */

export interface ServiceAccount {
  type: string;
  project_id: string;
  private_key_id: string;
  private_key: string;
  client_email: string;
  client_id: string;
  auth_uri: string;
  token_uri: string;
  auth_provider_x509_cert_url: string;
  client_x509_cert_url: string;
  universe_domain: string;
}

export interface OAuthToken {
  access_token: string;
  token_type: string;
  expires_in: number;
  expires_at: number;
}

export interface JWTPayload {
  iss: string;
  scope: string;
  aud: string;
  iat: number;
  exp: number;
}

/** Base64URL encode without padding */
function base64urlEncode(data: ArrayBuffer | string): string {
  let bytes: Uint8Array;
  if (typeof data === 'string') {
    bytes = new TextEncoder().encode(data);
  } else {
    bytes = new Uint8Array(data);
  }
  return btoa(String.fromCharCode(...bytes))
    .replace(/\+/g, '-')
    .replace(/\//g, '_')
    .replace(/=/g, '');
}

/** Base64URL decode */
function base64urlDecode(str: string): Uint8Array {
  const padded = str + '='.repeat((4 - (str.length % 4)) % 4);
  const base64 = padded.replace(/-/g, '+').replace(/_/g, '/');
  const binary = atob(base64);
  return new Uint8Array(binary.length).map((_, i) => binary.charCodeAt(i));
}

/** Import PKCS#8 private key for Web Crypto */
async function importPrivateKey(privateKeyPem: string): Promise<CryptoKey> {
  // Remove header/footer and newlines
  const pemContents = privateKeyPem
    .replace('-----BEGIN PRIVATE KEY-----', '')
    .replace('-----END PRIVATE KEY-----', '')
    .replace(/\s/g, '');

  const binaryDer = base64urlDecode(pemContents);

  return crypto.subtle.importKey(
    'pkcs8',
    binaryDer.buffer,
    {
      name: 'RSASSA-PKCS1-v1_5',
      hash: 'SHA-256',
    },
    false,
    ['sign']
  );
}

/** Generate JWT for service account */
export async function generateServiceAccountJWT(
  serviceAccount: ServiceAccount,
  scope: string = 'https://www.googleapis.com/auth/datastore https://www.googleapis.com/auth/firebase.messaging'
): Promise<string> {
  const now = Math.floor(Date.now() / 1000);
  const payload: JWTPayload = {
    iss: serviceAccount.client_email,
    scope,
    aud: serviceAccount.token_uri,
    iat: now,
    exp: now + 3600, // 1 hour
  };

  const header = { alg: 'RS256', typ: 'JWT' };

  const encodedHeader = base64urlEncode(JSON.stringify(header));
  const encodedPayload = base64urlEncode(JSON.stringify(payload));
  const signingInput = `${encodedHeader}.${encodedPayload}`;

  const privateKey = await importPrivateKey(serviceAccount.private_key);
  const signature = await crypto.subtle.sign(
    'RSASSA-PKCS1-v1_5',
    privateKey,
    new TextEncoder().encode(signingInput)
  );

  const encodedSignature = base64urlEncode(signature);
  return `${signingInput}.${encodedSignature}`;
}

/** Exchange JWT for OAuth 2.0 access token */
export async function exchangeJWTForToken(
  serviceAccount: ServiceAccount,
  jwt: string
): Promise<OAuthToken> {
  const response = await fetch(serviceAccount.token_uri, {
    method: 'POST',
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    body: new URLSearchParams({
      grant_type: 'urn:ietf:params:oauth:grant-type:jwt-bearer',
      assertion: jwt,
    }),
  });

  if (!response.ok) {
    const error = await response.text();
    throw new Error(`Token exchange failed: ${response.status} ${error}`);
  }

  const data = await response.json() as OAuthToken;
  return {
    ...data,
    expires_at: Date.now() + (data.expires_in - 60) * 1000, // 60s buffer
  };
}

/** OAuth token cache using Workers KV */
export class OAuthTokenCache {
  private kv: KVNamespace;
  private serviceAccount: ServiceAccount;
  private scope: string;
  private cacheKey: string;

  constructor(kv: KVNamespace, serviceAccount: ServiceAccount, scope?: string) {
    this.kv = kv;
    this.serviceAccount = serviceAccount;
    this.scope = scope || 'https://www.googleapis.com/auth/datastore https://www.googleapis.com/auth/firebase.messaging';
    this.cacheKey = `oauth_token_${serviceAccount.client_email}`;
  }

  async getToken(): Promise<string> {
    // Try to get from cache
    const cached = await this.kv.get(this.cacheKey, 'json') as OAuthToken | null;
    if (cached && cached.expires_at > Date.now()) {
      return cached.access_token;
    }

    // Generate new token
    const jwt = await generateServiceAccountJWT(this.serviceAccount, this.scope);
    const token = await exchangeJWTForToken(this.serviceAccount, jwt);

    // Cache with TTL
    await this.kv.put(this.cacheKey, JSON.stringify(token), {
      expirationTtl: token.expires_in - 60,
    });

    return token.access_token;
  }

  async invalidate(): Promise<void> {
    await this.kv.delete(this.cacheKey);
  }
}

/** Get service account from Cloudflare secret */
export function getServiceAccount(): ServiceAccount {
  const secret = (globalThis as any).FIREBASE_SERVICE_ACCOUNT_KEY;
  if (!secret) {
    throw new Error('FIREBASE_SERVICE_ACCOUNT_KEY secret not configured');
  }

  try {
    const decoded = atob(secret);
    return JSON.parse(decoded) as ServiceAccount;
  } catch (error) {
    throw new Error(`Failed to parse FIREBASE_SERVICE_ACCOUNT_KEY: ${error}`);
  }
}

/** Create OAuth token cache from environment */
export function createOAuthCache(kv: KVNamespace, scope?: string): OAuthTokenCache {
  const serviceAccount = getServiceAccount();
  return new OAuthTokenCache(kv, serviceAccount, scope);
}