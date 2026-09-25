%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Work within the limits"
linkTitle: "Work within the limits"
description: "Choose a supported compute size, understand account quotas, and handle refusals without endless retries."
keywords: "cloud sandboxes, sandboxes api, work within the limits"
@y
title: "Work within the limits"
linkTitle: "Work within the limits"
description: "Choose a supported compute size, understand account quotas, and handle refusals without endless retries."
keywords: "cloud sandboxes, sandboxes api, work within the limits"
@z

@x
Bound work so account limits and temporary capacity refusals do not turn into unbounded retries.
@y
Bound work so account limits and temporary capacity refusals do not turn into unbounded retries.
@z

@x
Use an [authenticated client](connect-to-cloud-with-a-bearer-token.md). Account limits are separate from SDK configuration; changing the client does not grant additional capacity.
@y
Use an [authenticated client](connect-to-cloud-with-a-bearer-token.md). Account limits are separate from SDK configuration; changing the client does not grant additional capacity.
@z

@x
### Choose a compute size
@y
### Choose a compute size
@z

@x
Cloud Sandboxes uses fixed CPU and memory pairs as billing shapes:
@y
Cloud Sandboxes uses fixed CPU and memory pairs as billing shapes:
@z

@x
| Size   | vCPUs | Memory | SDK memory value (MiB) |
| ------ | ----: | -----: | ---------------------: |
| Micro  |     1 |  2 GiB |                   2048 |
| Small  |     2 |  4 GiB |                   4096 |
| Medium |     4 |  8 GiB |                   8192 |
| Large  |     8 | 16 GiB |                  16384 |
| XL     |    16 | 32 GiB |                  32768 |
@y
| Size   | vCPUs | Memory | SDK memory value (MiB) |
| ------ | ----: | -----: | ---------------------: |
| Micro  |     1 |  2 GiB |                   2048 |
| Small  |     2 |  4 GiB |                   4096 |
| Medium |     4 |  8 GiB |                   8192 |
| Large  |     8 | 16 GiB |                  16384 |
| XL     |    16 | 32 GiB |                  32768 |
@z

@x
Choose a size by name, for example, `resources: 'small'`. The supported names are `micro`, `small`, `medium`, `large`, and `xl`. Kit launches default to Small when you omit resources. Explicit settings take precedence.
@y
Choose a size by name, for example, `resources: 'small'`. The supported names are `micro`, `small`, `medium`, `large`, and `xl`. Kit launches default to Small when you omit resources. Explicit settings take precedence.
@z

@x
You can still supply both CPU and memory directly. Use a supported pair; 1 CPU with 1024 MiB is not supported in Cloud Sandboxes. A saved image supplies its own resources, so do not override them when creating from that image. Your account and available capacity determine whether a request can be accepted. Check your Docker billing terms for prices.
@y
You can still supply both CPU and memory directly. Use a supported pair; 1 CPU with 1024 MiB is not supported in Cloud Sandboxes. A saved image supplies its own resources, so do not override them when creating from that image. Your account and available capacity determine whether a request can be accepted. Check your Docker billing terms for prices.
@z

@x
### Understand account quotas
@y
### Understand account quotas
@z

@x
The default limits are 10 concurrent sandboxes, 50 stored sandboxes, 100 volumes, 100 secrets, and 3 images being prepared at once. These are account-wide defaults, not a separate allowance per user. Your account can have different limits; confirm them with Docker before sizing a large workload.
@y
The default limits are 10 concurrent sandboxes, 50 stored sandboxes, 100 volumes, 100 secrets, and 3 images being prepared at once. These are account-wide defaults, not a separate allowance per user. Your account can have different limits; confirm them with Docker before sizing a large workload.
@z

@x
Stopping an ordinary sandbox frees its concurrency slot but leaves it in stored usage. Starting or resuming it needs a slot again. An always-on sandbox, configured to restart automatically on timeout, retains its concurrency reservation even while stopped. Delete sandboxes you no longer need to release stored usage.
@y
Stopping an ordinary sandbox frees its concurrency slot but leaves it in stored usage. Starting or resuming it needs a slot again. An always-on sandbox, configured to restart automatically on timeout, retains its concurrency reservation even while stopped. Delete sandboxes you no longer need to release stored usage.
@z

@x
## Count existing sandboxes {#1-count-existing-sandboxes}
@y
## Count existing sandboxes {#1-count-existing-sandboxes}
@z

@x
Walk all sandbox pages and count resources visible to you. This gives your application a usage observation, not a reservation or authoritative quota balance. Other users can hold resources in the same account that your list does not show.
@y
Walk all sandbox pages and count resources visible to you. This gives your application a usage observation, not a reservation or authoritative quota balance. Other users can hold resources in the same account that your list does not show.
@z

@x
Another caller can create a sandbox immediately afterward. Treat the create response as the final decision, even when your count appears below a planned limit.
@y
Another caller can create a sandbox immediately afterward. Treat the create response as the final decision, even when your count appears below a planned limit.
@z

@x
{{< tabs >}}
{{< tab name="TypeScript" >}}
@y
{{< tabs >}}
{{< tab name="TypeScript" >}}
@z

@x
```typescript
let count = 0;
for await (const sandbox of client.all({ pageSize })) {
  if (sandbox.name) count++;
}
return count;
```
@y
```typescript
let count = 0;
for await (const sandbox of client.all({ pageSize })) {
  if (sandbox.name) count++;
}
return count;
```
@z

@x
<details>
<summary>Complete TypeScript example: limits/budget.ts</summary>
@y
<details>
<summary>Complete TypeScript example: limits/budget.ts</summary>
@z

@x
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@z

@x
export async function countSandboxes(client: Sandboxes, pageSize: number) {
  let count = 0;
  for await (const sandbox of client.all({ pageSize })) {
    if (sandbox.name) count++;
  }
  return count;
}
```
@y
export async function countSandboxes(client: Sandboxes, pageSize: number) {
  let count = 0;
  for await (const sandbox of client.all({ pageSize })) {
    if (sandbox.name) count++;
  }
  return count;
}
```
@z

@x
</details>
@y
</details>
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Back off after a refusal {#2-back-off-after-a-refusal}
@y
## Back off after a refusal {#2-back-off-after-a-refusal}
@z

@x
Use the server's retry delay when supplied and keep the same idempotency key for the same create request. Bound the number of attempts and give the overall operation a deadline.
@y
Use the server's retry delay when supplied and keep the same idempotency key for the same create request. Bound the number of attempts and give the overall operation a deadline.
@z

@x
The example owns the retry loop, disables automatic SDK retries, and sets an overall timeout. Do not layer two retry policies without accounting for their combined attempts and deadlines.
@y
The example owns the retry loop, disables automatic SDK retries, and sets an overall timeout. Do not layer two retry policies without accounting for their combined attempts and deadlines.
@z

@x
A quota refusal may need cleanup or an account change rather than another immediate request. Stop after the bound, report the failure, and keep any accepted sandbox identity available for inspection.
@y
A quota refusal may need cleanup or an account change rather than another immediate request. Stop after the bound, report the failure, and keep any accepted sandbox identity available for inspection.
@z

@x
{{< tabs >}}
{{< tab name="TypeScript" >}}
@y
{{< tabs >}}
{{< tab name="TypeScript" >}}
@z

@x
```typescript
for (let attempt = 0; attempt < attempts; attempt++) {
  try {
    return await client.kits.launch(
      'shell',
      { displayName, resources: { cpus: 2, memoryMib: 4096 } },
      {
        idempotencyKey: requestId,
        timeoutMs: 300_000,
        signal,
        maxRetries: 0,
      },
    );
  } catch (error) {
    if (
      !(error instanceof RequestError) ||
      error.raw.code !== 'resourceExhausted' ||
      attempt + 1 === attempts
    )
      throw error;
    await pause(retryAfter(error, fallbackMs), undefined, { signal });
  }
}
throw new Error('attempt count was validated');
```
@y
```typescript
for (let attempt = 0; attempt < attempts; attempt++) {
  try {
    return await client.kits.launch(
      'shell',
      { displayName, resources: { cpus: 2, memoryMib: 4096 } },
      {
        idempotencyKey: requestId,
        timeoutMs: 300_000,
        signal,
        maxRetries: 0,
      },
    );
  } catch (error) {
    if (
      !(error instanceof RequestError) ||
      error.raw.code !== 'resourceExhausted' ||
      attempt + 1 === attempts
    )
      throw error;
    await pause(retryAfter(error, fallbackMs), undefined, { signal });
  }
}
throw new Error('attempt count was validated');
```
@z

@x
<details>
<summary>Complete TypeScript example: limits/backoff.ts</summary>
@y
<details>
<summary>Complete TypeScript example: limits/backoff.ts</summary>
@z

@x
```typescript
import { setTimeout as pause } from 'node:timers/promises';
import {
  RequestError,
  type Sandbox,
  type Sandboxes,
} from '@docker/sandboxes';
@y
```typescript
import { setTimeout as pause } from 'node:timers/promises';
import {
  RequestError,
  type Sandbox,
  type Sandboxes,
} from '@docker/sandboxes';
@z

@x
export async function createWithBackoff(
  client: Sandboxes,
  displayName: string,
  attempts: number,
  fallbackMs: number,
  requestId: string,
): Promise<Sandbox> {
  if (!Number.isInteger(attempts) || attempts < 1)
    throw new Error(`attempts must be at least 1, got ${attempts}`);
  const signal = AbortSignal.timeout(300000);
  for (let attempt = 0; attempt < attempts; attempt++) {
    try {
      return await client.kits.launch(
        'shell',
        { displayName, resources: { cpus: 2, memoryMib: 4096 } },
        {
          idempotencyKey: requestId,
          timeoutMs: 300_000,
          signal,
          maxRetries: 0,
        },
      );
    } catch (error) {
      if (
        !(error instanceof RequestError) ||
        error.raw.code !== 'resourceExhausted' ||
        attempt + 1 === attempts
      )
        throw error;
      await pause(retryAfter(error, fallbackMs), undefined, { signal });
    }
  }
  throw new Error('attempt count was validated');
}
@y
export async function createWithBackoff(
  client: Sandboxes,
  displayName: string,
  attempts: number,
  fallbackMs: number,
  requestId: string,
): Promise<Sandbox> {
  if (!Number.isInteger(attempts) || attempts < 1)
    throw new Error(`attempts must be at least 1, got ${attempts}`);
  const signal = AbortSignal.timeout(300000);
  for (let attempt = 0; attempt < attempts; attempt++) {
    try {
      return await client.kits.launch(
        'shell',
        { displayName, resources: { cpus: 2, memoryMib: 4096 } },
        {
          idempotencyKey: requestId,
          timeoutMs: 300_000,
          signal,
          maxRetries: 0,
        },
      );
    } catch (error) {
      if (
        !(error instanceof RequestError) ||
        error.raw.code !== 'resourceExhausted' ||
        attempt + 1 === attempts
      )
        throw error;
      await pause(retryAfter(error, fallbackMs), undefined, { signal });
    }
  }
  throw new Error('attempt count was validated');
}
@z

@x
export function retryAfter(
  error: RequestError,
  fallbackMs: number,
): number {
  const header = error.retryAfter?.trim();
  if (header) {
    const delay = /^\d+(?:\.\d+)?$/.test(header)
      ? Number(header) * 1000
      : /^(?:Mon|Tue|Wed|Thu|Fri|Sat|Sun)[a-z]*,?\s/.test(header)
        ? Math.max(0, Date.parse(header) - Date.now())
        : NaN;
    if (Number.isFinite(delay) && delay >= 0) return delay;
  }
  return error.decoded.retryDelayMs ?? fallbackMs;
}
```
@y
export function retryAfter(
  error: RequestError,
  fallbackMs: number,
): number {
  const header = error.retryAfter?.trim();
  if (header) {
    const delay = /^\d+(?:\.\d+)?$/.test(header)
      ? Number(header) * 1000
      : /^(?:Mon|Tue|Wed|Thu|Fri|Sat|Sun)[a-z]*,?\s/.test(header)
        ? Math.max(0, Date.parse(header) - Date.now())
        : NaN;
    if (Number.isFinite(delay) && delay >= 0) return delay;
  }
  return error.decoded.retryDelayMs ?? fallbackMs;
}
```
@z

@x
</details>
@y
</details>
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z
