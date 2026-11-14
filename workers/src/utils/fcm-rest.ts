/** Firebase Cloud Messaging HTTP v1 API client for Cloudflare Workers */

import { createOAuthCache, OAuthTokenCache } from './oauth';

export interface FCMMessage {
  token?: string;
  topic?: string;
  condition?: string;
  notification?: {
    title?: string;
    body?: string;
    image?: string;
  };
  data?: Record<string, string>;
  android?: {
    collapseKey?: string;
    priority?: 'normal' | 'high';
    ttl?: string;
    restrictedPackageName?: string;
    data?: Record<string, string>;
    notification?: {
      title?: string;
      body?: string;
      icon?: string;
      color?: string;
      sound?: string;
      tag?: string;
      clickAction?: string;
      channelId?: string;
      notificationPriority?: 'PRIORITY_UNSPECIFIED' | 'PRIORITY_MIN' | 'PRIORITY_LOW' | 'PRIORITY_DEFAULT' | 'PRIORITY_HIGH' | 'PRIORITY_MAX';
      defaultSound?: boolean;
      defaultVibrateTimings?: boolean;
      defaultLightSettings?: boolean;
      visibility?: 'VISIBILITY_UNSPECIFIED' | 'PRIVATE' | 'PUBLIC' | 'SECRET';
      notificationCount?: number;
    };
    fcmOptions?: {
      analyticsLabel?: string;
    };
  };
  apns?: {
    headers?: Record<string, string>;
    payload?: {
      aps: {
        alert?: string | { title: string; body: string };
        badge?: number;
        sound?: string;
        contentAvailable?: boolean;
        mutableContent?: boolean;
        category?: string;
        threadId?: string;
      };
    };
    fcmOptions?: {
      analyticsLabel?: string;
      image?: string;
    };
  };
  webpush?: {
    headers?: Record<string, string>;
    data?: Record<string, string>;
    notification?: {
      title?: string;
      body?: string;
      icon?: string;
      badge?: string;
      image?: string;
      language?: string;
      tag?: string;
      direction?: 'auto' | 'ltr' | 'rtl';
      renotify?: boolean;
      requireInteraction?: boolean;
      silent?: boolean;
      vibrate?: number[];
      timestamp?: number;
    };
    fcmOptions?: {
      link?: string;
      analyticsLabel?: string;
    };
  };
  fcmOptions?: {
    analyticsLabel?: string;
  };
}

export interface FCMSendResponse {
  name: string; // projects/{project_id}/messages/{message_id}
}

export interface FCMBatchSendRequest {
  messages: Array<{ message: FCMMessage }>;
}

export interface FCMBatchSendResponse {
  responses: Array<{
    success: boolean;
    messageId?: string;
    error?: { code: string; message: string };
  }>;
}

export interface FCMTopicManagementResponse {
  successCount: number;
  failureCount: number;
  errors: Array<{ index: number; error: { code: string; message: string } }>;
}

export class FCMRESTClient {
  private baseUrl: string;
  private oauthCache: OAuthTokenCache;
  private projectId: string;

  constructor(projectId: string, oauthCache: OAuthTokenCache) {
    this.projectId = projectId;
    this.oauthCache = oauthCache;
    this.baseUrl = `https://fcm.googleapis.com/v1/projects/${projectId}`;
  }

  private async getHeaders(): Promise<HeadersInit> {
    const token = await this.oauthCache.getToken();
    return {
      'Authorization': `Bearer ${token}`,
      'Content-Type': 'application/json',
    };
  }

  /** Send a single message */
  async send(message: FCMMessage): Promise<FCMSendResponse> {
    const url = `${this.baseUrl}/messages:send`;
    const response = await fetch(url, {
      method: 'POST',
      headers: await this.getHeaders(),
      body: JSON.stringify({ message }),
    });

    if (!response.ok) {
      const error = await response.text();
      throw new Error(`FCM send failed: ${response.status} ${error}`);
    }

    return response.json() as Promise<FCMSendResponse>;
  }

  /** Send multicast message (up to 500 tokens) */
  async sendMulticast(tokens: string[], message: Omit<FCMMessage, 'token'>): Promise<FCMBatchSendResponse> {
    if (tokens.length > 500) {
      throw new Error('Multicast exceeds 500 token limit');
    }

    const messages = tokens.map(token => ({
      message: { ...message, token },
    }));

    return this.sendBatch(messages);
  }

  /** Send batch of messages */
  async sendBatch(messages: Array<{ message: FCMMessage }>): Promise<FCMBatchSendResponse> {
    if (messages.length > 500) {
      throw new Error('Batch send exceeds 500 message limit');
    }

    const url = `${this.baseUrl}/messages:batchSend`;
    const body: FCMBatchSendRequest = { messages };

    const response = await fetch(url, {
      method: 'POST',
      headers: await this.getHeaders(),
      body: JSON.stringify(body),
    });

    if (!response.ok) {
      const error = await response.text();
      throw new Error(`FCM batch send failed: ${response.status} ${error}`);
    }

    return response.json() as Promise<FCMBatchSendResponse>;
  }

  /** Send to topic */
  async sendToTopic(topic: string, message: Omit<FCMMessage, 'topic'>): Promise<FCMSendResponse> {
    return this.send({ ...message, topic });
  }

  /** Send with condition */
  async sendWithCondition(condition: string, message: Omit<FCMMessage, 'condition'>): Promise<FCMSendResponse> {
    return this.send({ ...message, condition });
  }

  /** Subscribe tokens to topic */
  async subscribeToTopic(tokens: string[], topic: string): Promise<FCMTopicManagementResponse> {
    if (tokens.length > 1000) {
      throw new Error('Subscribe exceeds 1000 token limit');
    }

    const url = `${this.baseUrl}/topics/${topic}:subscribe`;
    const response = await fetch(url, {
      method: 'POST',
      headers: await this.getHeaders(),
      body: JSON.stringify({ registration_tokens: tokens }),
    });

    if (!response.ok) {
      const error = await response.text();
      throw new Error(`FCM subscribe failed: ${response.status} ${error}`);
    }

    return response.json() as Promise<FCMTopicManagementResponse>;
  }

  /** Unsubscribe tokens from topic */
  async unsubscribeFromTopic(tokens: string[], topic: string): Promise<FCMTopicManagementResponse> {
    if (tokens.length > 1000) {
      throw new Error('Unsubscribe exceeds 1000 token limit');
    }

    const url = `${this.baseUrl}/topics/${topic}:unsubscribe`;
    const response = await fetch(url, {
      method: 'POST',
      headers: await this.getHeaders(),
      body: JSON.stringify({ registration_tokens: tokens }),
    });

    if (!response.ok) {
      const error = await response.text();
      throw new Error(`FCM unsubscribe failed: ${response.status} ${error}`);
    }

    return response.json() as Promise<FCMTopicManagementResponse>;
  }

  /** Build notification message */
  static buildNotification(
    title: string,
    body: string,
    options?: { image?: string; data?: Record<string, string> }
  ): FCMMessage {
    return {
      notification: { title, body, image: options?.image },
      data: options?.data,
    };
  }

  /** Build data-only message */
  static buildDataMessage(data: Record<string, string>): FCMMessage {
    return { data };
  }

  /** Build high-priority Android message for emergency alerts */
  static buildEmergencyMessage(
    title: string,
    body: string,
    data: Record<string, string>
  ): FCMMessage {
    return {
      android: {
        priority: 'high',
        notification: { title, body, channelId: 'emergency', notificationPriority: 'PRIORITY_MAX' },
        data,
      },
      apns: {
        payload: {
          aps: { alert: { title, body }, sound: 'critical', contentAvailable: true, badge: 1 },
        },
      },
      data,
    };
  }
}

/** Create FCM client from environment */
export function createFCMClient(projectId: string, kv: KVNamespace): FCMRESTClient {
  const oauthCache = createOAuthCache(kv, 'https://www.googleapis.com/auth/firebase.messaging');
  return new FCMRESTClient(projectId, oauthCache);
}