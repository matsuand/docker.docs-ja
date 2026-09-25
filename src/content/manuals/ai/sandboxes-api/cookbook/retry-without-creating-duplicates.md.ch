%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Retry without creating duplicates"
linkTitle: "Retry without creating duplicates"
description: "Retry a sandbox or process create under one request ID so a failure you can't interpret never leaves two copies behind."
keywords: "cloud sandboxes, sandboxes api, retry without creating duplicates"
@y
title: "Retry without creating duplicates"
linkTitle: "Retry without creating duplicates"
description: "Retry a sandbox or process create under one request ID so a failure you can't interpret never leaves two copies behind."
keywords: "cloud sandboxes, sandboxes api, retry without creating duplicates"
@z

@x
Retry a request without creating duplicate work. An idempotency key identifies one logical operation, such as creating the sandbox for a particular job.
@y
Retry a request without creating duplicate work. An idempotency key identifies one logical operation, such as creating the sandbox for a particular job.
@z

@x
Use an [authenticated client](connect-to-cloud-with-a-bearer-token.md). Generate the key once, then persist it with the job if retries can happen in another program run.
@y
Use an [authenticated client](connect-to-cloud-with-a-bearer-token.md). Generate the key once, then persist it with the job if retries can happen in another program run.
@z

@x
## Retry the same create request {#1-retry-the-same-create-request}
@y
## Retry the same create request {#1-retry-the-same-create-request}
@z

@x
Reuse the same key and payload on every attempt. The example retries a transient availability refusal and disables automatic SDK retries. Do not run your own retry loop and the SDK's together without accounting for their total attempts.
@y
Reuse the same key and payload on every attempt. The example retries a transient availability refusal and disables automatic SDK retries. Do not run your own retry loop and the SDK's together without accounting for their total attempts.
@z

@x
Use a deadline and a bounded attempt count. For production retry scheduling, add delay and jitter or use the SDK's configured retry behavior. Changing the payload while keeping the key is not an update; it conflicts with the original request.
@y
Use a deadline and a bounded attempt count. For production retry scheduling, add delay and jitter or use the SDK's configured retry behavior. Changing the payload while keeping the key is not an update; it conflicts with the original request.
@z

@x
An accepted creation returns the sandbox's resource data. Save its name and use the client's get method to obtain a handle. Read or wait on that resource to follow progress instead of repeating creation to make it advance.
@y
An accepted creation returns the sandbox's resource data. Save its name and use the client's get method to obtain a handle. Read or wait on that resource to follow progress instead of repeating creation to make it advance.
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
      error.raw.code !== 'unavailable' ||
      attempt + 1 === attempts
    )
      throw error;
  }
}
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
      error.raw.code !== 'unavailable' ||
      attempt + 1 === attempts
    )
      throw error;
  }
}
```
@z

@x
<details>
<summary>Complete TypeScript example: idempotency/retry.ts</summary>
@y
<details>
<summary>Complete TypeScript example: idempotency/retry.ts</summary>
@z

@x
```typescript
import { RequestError, type Sandboxes } from '@docker/sandboxes';
@y
```typescript
import { RequestError, type Sandboxes } from '@docker/sandboxes';
@z

@x
export async function createWithRetry(
  client: Sandboxes,
  displayName: string,
  requestId: string,
  attempts: number,
) {
  if (!Number.isInteger(attempts) || attempts < 1)
    throw new RangeError('attempts must be at least 1');
  const signal = AbortSignal.timeout(300_000);
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
        error.raw.code !== 'unavailable' ||
        attempt + 1 === attempts
      )
        throw error;
    }
  }
  throw new Error('attempt count was validated');
}
```
@y
export async function createWithRetry(
  client: Sandboxes,
  displayName: string,
  requestId: string,
  attempts: number,
) {
  if (!Number.isInteger(attempts) || attempts < 1)
    throw new RangeError('attempts must be at least 1');
  const signal = AbortSignal.timeout(300_000);
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
        error.raw.code !== 'unavailable' ||
        attempt + 1 === attempts
      )
        throw error;
    }
  }
  throw new Error('attempt count was validated');
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
## Start a process once {#2-start-a-process-once}
@y
## Start a process once {#2-start-a-process-once}
@z

@x
Start the process with its own idempotency key and keep the returned process name. After losing a response or connection, find that process before starting another one.
@y
Start the process with its own idempotency key and keep the returned process name. After losing a response or connection, find that process before starting another one.
@z

@x
Keys do not make every operation safe to replay. Repeating process input, a signal, or a file write can have a second effect. Use [process reconnection](find-a-process-you-lost-track-of.md) for a lost stream and inspect files before repeating an uncertain write.
@y
Keys do not make every operation safe to replay. Repeating process input, a signal, or a file write can have a second effect. Use [process reconnection](find-a-process-you-lost-track-of.md) for a lost stream and inspect files before repeating an uncertain write.
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
return sandbox.processes.start({ args }, { idempotencyKey: requestId });
```
@y
```typescript
return sandbox.processes.start({ args }, { idempotencyKey: requestId });
```
@z

@x
<details>
<summary>Complete TypeScript example: idempotency/unsafe.ts</summary>
@y
<details>
<summary>Complete TypeScript example: idempotency/unsafe.ts</summary>
@z

@x
```typescript
import type { Sandbox } from '@docker/sandboxes';
@y
```typescript
import type { Sandbox } from '@docker/sandboxes';
@z

@x
export async function createProcessOnce(
  sandbox: Sandbox,
  args: string[],
  requestId: string,
) {
  return sandbox.processes.start({ args }, { idempotencyKey: requestId });
}
```
@y
export async function createProcessOnce(
  sandbox: Sandbox,
  args: string[],
  requestId: string,
) {
  return sandbox.processes.start({ args }, { idempotencyKey: requestId });
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
