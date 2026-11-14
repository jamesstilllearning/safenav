/** Firestore REST API client for Cloudflare Workers */

import { createOAuthCache, OAuthTokenCache } from './oauth';

export interface FirestoreValue {
  nullValue?: null;
  booleanValue?: boolean;
  integerValue?: string | number;
  doubleValue?: number;
  timestampValue?: string;
  stringValue?: string;
  bytesValue?: string;
  referenceValue?: string;
  geoPointValue?: { latitude: number; longitude: number };
  arrayValue?: { values: FirestoreValue[] };
  mapValue?: { fields: Record<string, FirestoreValue> };
}

export interface FirestoreDocument {
  name: string;
  fields: Record<string, FirestoreValue>;
  createTime: string;
  updateTime: string;
}

export interface FirestoreQueryRequest {
  structuredQuery?: {
    where?: FirestoreFilter;
    orderBy?: FirestoreOrderBy[];
    limit?: number;
    offset?: number;
  };
}

export interface FirestoreFilter {
  fieldFilter?: {
    field: { fieldPath: string };
    op: 'EQUAL' | 'LESS_THAN' | 'LESS_THAN_OR_EQUAL' | 'GREATER_THAN' | 'GREATER_THAN_OR_EQUAL' | 'ARRAY_CONTAINS' | 'ARRAY_CONTAINS_ANY' | 'IN' | 'NOT_IN';
    value: FirestoreValue;
  };
  compositeFilter?: {
    op: 'AND' | 'OR';
    filters: FirestoreFilter[];
  };
}

export interface FirestoreOrderBy {
  field: { fieldPath: string };
  direction?: 'ASCENDING' | 'DESCENDING';
}

export interface FirestoreWrite {
  update?: FirestoreDocument | { name: string; fields: Record<string, FirestoreValue> };
  delete?: string;
  updateMask?: { fieldPaths: string[] };
  currentDocument?: { exists?: boolean; updateTime?: string };
}

export interface FirestoreBatchWriteRequest {
  writes: FirestoreWrite[];
}

export interface FirestoreBatchWriteResponse {
  writeResults: Array<{ updateTime: string }>;
  commitTime: string;
}

export interface FirestoreRunQueryResponse {
  document?: {
    name: string;
    fields: Record<string, FirestoreValue>;
  };
}

export class FirestoreRESTClient {
  private baseUrl: string;
  private oauthCache: OAuthTokenCache;
  private projectId: string;
  private databaseId: string;

  constructor(projectId: string, oauthCache: OAuthTokenCache, databaseId = '(default)') {
    this.projectId = projectId;
    this.oauthCache = oauthCache;
    this.databaseId = databaseId;
    this.baseUrl = `https://firestore.googleapis.com/v1/projects/${projectId}/databases/${databaseId}`;
  }

  private async getHeaders(): Promise<HeadersInit> {
    const token = await this.oauthCache.getToken();
    return {
      'Authorization': `Bearer ${token}`,
      'Content-Type': 'application/json',
    };
  }

  /** Convert JS value to Firestore value */
  static toFirestoreValue(value: unknown): FirestoreValue {
    if (value === null || value === undefined) {
      return { nullValue: null };
    }
    if (typeof value === 'boolean') {
      return { booleanValue: value };
    }
    if (typeof value === 'number') {
      if (Number.isInteger(value)) {
        return { integerValue: value.toString() };
      }
      return { doubleValue: value };
    }
    if (typeof value === 'string') {
      return { stringValue: value };
    }
    if (value instanceof Date) {
      return { timestampValue: value.toISOString() };
    }
    if (Array.isArray(value)) {
      return { arrayValue: { values: value.map(FirestoreRESTClient.toFirestoreValue) } };
    }
    if (typeof value === 'object') {
      // Check for GeoPoint
      if ('latitude' in value && 'longitude' in value) {
        return {
          geoPointValue: {
            latitude: (value as { latitude: number }).latitude,
            longitude: (value as { longitude: number }).longitude,
          },
        };
      }
      // Check for FieldValue sentinels
      if ('__type__' in value) {
        const fv = value as { __type__: string; value?: unknown };
        switch (fv.__type__) {
          case 'serverTimestamp':
            return { timestampValue: new Date().toISOString() };
          case 'increment':
            return { doubleValue: fv.value as number };
          case 'arrayUnion':
            return { arrayValue: { values: (fv.value as unknown[]).map(FirestoreRESTClient.toFirestoreValue) } };
          case 'arrayRemove':
            return { arrayValue: { values: (fv.value as unknown[]).map(FirestoreRESTClient.toFirestoreValue) } };
        }
      }
      // Regular object
      const fields: Record<string, FirestoreValue> = {};
      for (const [k, v] of Object.entries(value as Record<string, unknown>)) {
        fields[k] = FirestoreRESTClient.toFirestoreValue(v);
      }
      return { mapValue: { fields } };
    }
    throw new Error(`Unsupported value type: ${typeof value}`);
  }

  /** Convert Firestore value to JS value */
  static fromFirestoreValue(value: FirestoreValue): unknown {
    if (value.nullValue !== undefined) return null;
    if (value.booleanValue !== undefined) return value.booleanValue;
    if (value.integerValue !== undefined) return parseInt(value.integerValue as string, 10);
    if (value.doubleValue !== undefined) return value.doubleValue;
    if (value.stringValue !== undefined) return value.stringValue;
    if (value.timestampValue !== undefined) return new Date(value.timestampValue);
    if (value.geoPointValue !== undefined) {
      return new GeoPoint(value.geoPointValue.latitude, value.geoPointValue.longitude);
    }
    if (value.arrayValue !== undefined) {
      return value.arrayValue.values.map(FirestoreRESTClient.fromFirestoreValue);
    }
    if (value.mapValue !== undefined) {
      const obj: Record<string, unknown> = {};
      for (const [k, v] of Object.entries(value.mapValue.fields)) {
        obj[k] = FirestoreRESTClient.fromFirestoreValue(v);
      }
      return obj;
    }
    return undefined;
  }

  /** Convert document to plain object */
  static documentToObject(doc: FirestoreDocument | { name: string; fields: Record<string, FirestoreValue> }): Record<string, unknown> {
    const obj: Record<string, unknown> = {};
    for (const [k, v] of Object.entries(doc.fields)) {
      obj[k] = FirestoreRESTClient.fromFirestoreValue(v);
    }
    // Extract document ID from name
    const id = doc.name.split('/').pop() || '';
    obj.id = id;
    return obj;
  }

  /** Create a new document */
  async createDocument(
    collectionPath: string,
    data: Record<string, unknown>,
    documentId?: string
  ): Promise<FirestoreDocument> {
    const url = documentId
      ? `${this.baseUrl}/documents/${collectionPath}?documentId=${documentId}`
      : `${this.baseUrl}/documents/${collectionPath}`;

    const document: Partial<FirestoreDocument> = {
      fields: {},
    };
    for (const [k, v] of Object.entries(data)) {
      document.fields![k] = FirestoreRESTClient.toFirestoreValue(v);
    }

    const response = await fetch(url, {
      method: documentId ? 'PATCH' : 'POST',
      headers: await this.getHeaders(),
      body: JSON.stringify(document),
    });

    if (!response.ok) {
      const error = await response.text();
      throw new Error(`Create document failed: ${response.status} ${error}`);
    }

    return response.json() as Promise<FirestoreDocument>;
  }

  /** Get a document by ID */
  async getDocument(collectionPath: string, documentId: string): Promise<FirestoreDocument | null> {
    const url = `${this.baseUrl}/documents/${collectionPath}/${documentId}`;
    const response = await fetch(url, { headers: await this.getHeaders() });

    if (response.status === 404) return null;
    if (!response.ok) {
      const error = await response.text();
      throw new Error(`Get document failed: ${response.status} ${error}`);
    }

    return response.json() as Promise<FirestoreDocument>;
  }

  /** Update a document */
  async updateDocument(
    collectionPath: string,
    documentId: string,
    data: Record<string, unknown>,
    updateMask?: string[]
  ): Promise<FirestoreDocument> {
    const url = `${this.baseUrl}/documents/${collectionPath}/${documentId}`;

    const document: Partial<FirestoreDocument> = {
      name: `${this.baseUrl}/documents/${collectionPath}/${documentId}`,
      fields: {},
    };
    for (const [k, v] of Object.entries(data)) {
      document.fields![k] = FirestoreRESTClient.toFirestoreValue(v);
    }

    let queryParams = '';
    if (updateMask) {
      queryParams = '?updateMask.fieldPaths=' + updateMask.join('&updateMask.fieldPaths=');
    }

    const response = await fetch(`${url}${queryParams}`, {
      method: 'PATCH',
      headers: await this.getHeaders(),
      body: JSON.stringify(document),
    });

    if (!response.ok) {
      const error = await response.text();
      throw new Error(`Update document failed: ${response.status} ${error}`);
    }

    return response.json() as Promise<FirestoreDocument>;
  }

  /** Delete a document */
  async deleteDocument(collectionPath: string, documentId: string): Promise<void> {
    const url = `${this.baseUrl}/documents/${collectionPath}/${documentId}`;
    const response = await fetch(url, { method: 'DELETE', headers: await this.getHeaders() });

    if (!response.ok && response.status !== 404) {
      const error = await response.text();
      throw new Error(`Delete document failed: ${response.status} ${error}`);
    }
  }

  /** List documents in a collection */
  async listDocuments(
    collectionPath: string,
    options?: { pageSize?: number; pageToken?: string; orderBy?: string }
  ): Promise<{ documents: FirestoreDocument[]; nextPageToken?: string }> {
    let url = `${this.baseUrl}/documents/${collectionPath}?pageSize=${options?.pageSize || 1000}`;
    if (options?.pageToken) {
      url += `&pageToken=${options.pageToken}`;
    }
    if (options?.orderBy) {
      url += `&orderBy=${options.orderBy}`;
    }

    const response = await fetch(url, { headers: await this.getHeaders() });
    if (!response.ok) {
      const error = await response.text();
      throw new Error(`List documents failed: ${response.status} ${error}`);
    }

    return response.json() as Promise<{ documents: FirestoreDocument[]; nextPageToken?: string }>;
  }

  /** Query documents */
  async queryDocuments(
    collectionPath: string,
    query: FirestoreQueryRequest
  ): Promise<Array<{ name: string; fields: Record<string, FirestoreValue> }>> {
    const url = `${this.baseUrl}/documents/${collectionPath}:runQuery`;
    const response = await fetch(url, {
      method: 'POST',
      headers: await this.getHeaders(),
      body: JSON.stringify(query),
    });

    if (!response.ok) {
      const error = await response.text();
      throw new Error(`Query documents failed: ${response.status} ${error}`);
    }

    const results = await response.json() as FirestoreRunQueryResponse[];
    return results
      .filter(r => r.document)
      .map(r => r.document!);
  }

  /** Batch write (create, update, delete) - max 500 writes */
  async batchWrite(writes: FirestoreWrite[]): Promise<FirestoreBatchWriteResponse> {
    if (writes.length > 500) {
      throw new Error('Batch write exceeds 500 writes limit');
    }

    const url = `${this.baseUrl}:commit`;
    const body: FirestoreBatchWriteRequest = { writes };

    const response = await fetch(url, {
      method: 'POST',
      headers: await this.getHeaders(),
      body: JSON.stringify(body),
    });

    if (!response.ok) {
      const error = await response.text();
      throw new Error(`Batch write failed: ${response.status} ${error}`);
    }

    return response.json() as Promise<FirestoreBatchWriteResponse>;
  }

  /** Helper: Create batch write for multiple documents */
  async batchSet(
    collectionPath: string,
    docs: Array<{ id?: string; data: Record<string, unknown> }>
  ): Promise<void> {
    const now = new Date().toISOString();
    const writes: FirestoreWrite[] = docs.map(doc => ({
      update: {
        name: doc.id
          ? `${this.baseUrl}/documents/${collectionPath}/${doc.id}`
          : `${this.baseUrl}/documents/${collectionPath}`,
        fields: Object.fromEntries(
          Object.entries(doc.data).map(([k, v]) => [k, FirestoreRESTClient.toFirestoreValue(v)])
        ),
        createTime: now,
        updateTime: now,
      },
    }));

    await this.batchWrite(writes);
  }

  /** Helper: Batch delete documents */
  async batchDelete(collectionPath: string, documentIds: string[]): Promise<void> {
    const writes: FirestoreWrite[] = documentIds.map(id => ({
      delete: `${this.baseUrl}/documents/${collectionPath}/${id}`,
    }));

    await this.batchWrite(writes);
  }

  /** Build equality filter */
  static where(fieldPath: string, op: 'EQUAL' | 'LESS_THAN' | 'LESS_THAN_OR_EQUAL' | 'GREATER_THAN' | 'GREATER_THAN_OR_EQUAL' | 'ARRAY_CONTAINS' | 'ARRAY_CONTAINS_ANY' | 'IN' | 'NOT_IN', value: unknown): FirestoreFilter {
    return {
      fieldFilter: {
        field: { fieldPath },
        op,
        value: FirestoreRESTClient.toFirestoreValue(value),
      },
    };
  }

  /** Build order by */
  static orderBy(fieldPath: string, direction: 'ASCENDING' | 'DESCENDING' = 'ASCENDING'): FirestoreOrderBy {
    return { field: { fieldPath }, direction };
  }
}

/** GeoPoint class for compatibility */
export class GeoPoint {
  constructor(
    public readonly latitude: number,
    public readonly longitude: number
  ) {}
}

/** FieldValue sentinels */
export const FieldValue = {
  serverTimestamp: () => ({ __type__: 'serverTimestamp' }),
  increment: (n: number) => ({ __type__: 'increment', value: n }),
  arrayUnion: (...elements: unknown[]) => ({ __type__: 'arrayUnion', value: elements }),
  arrayRemove: (...elements: unknown[]) => ({ __type__: 'arrayRemove', value: elements }),
};

/** Create Firestore client from environment */
export function createFirestoreClient(
  projectId: string,
  kv: KVNamespace,
  databaseId?: string
): FirestoreRESTClient {
  const oauthCache = createOAuthCache(kv, 'https://www.googleapis.com/auth/datastore');
  return new FirestoreRESTClient(projectId, oauthCache, databaseId);
}