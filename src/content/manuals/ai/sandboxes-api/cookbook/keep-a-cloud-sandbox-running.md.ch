%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Keep a cloud sandbox running"
linkTitle: "Keep a cloud sandbox running"
description: "Choose a sandbox's lifetime and what happens when it ends, then renew the lifetime before the deadline passes."
keywords: "cloud sandboxes, sandboxes api, keep a cloud sandbox running"
@y
title: "Keep a cloud sandbox running"
linkTitle: "Keep a cloud sandbox running"
description: "Choose a sandbox's lifetime and what happens when it ends, then renew the lifetime before the deadline passes."
keywords: "cloud sandboxes, sandboxes api, keep a cloud sandbox running"
@z

@x
Set a sandbox lifetime to prevent abandoned work from running indefinitely, and choose what happens when it expires.
@y
Set a sandbox lifetime to prevent abandoned work from running indefinitely, and choose what happens when it expires.
@z

@x
You need an [authenticated client](connect-to-cloud-with-a-bearer-token.md) and a managed image. The same lifecycle options can be supplied when launching a kit.
@y
You need an [authenticated client](connect-to-cloud-with-a-bearer-token.md) and a managed image. The same lifecycle options can be supplied when launching a kit.
@z

@x
## Set the lifetime at creation {#1-set-the-lifetime-at-creation}
@y
## Set the lifetime at creation {#1-set-the-lifetime-at-creation}
@z

@x
Pass the lifetime in the units shown by your SDK and choose the expiry action. The example accepts seconds and converts to the SDK's duration representation.
@y
Pass the lifetime in the units shown by your SDK and choose the expiry action. The example accepts seconds and converts to the SDK's duration representation.
@z

@x
Stopping preserves the sandbox for later use; deletion removes it. Check that your choice matches whether the application needs the sandbox's files after expiry. Account limits may restrict permitted durations and actions.
@y
Stopping preserves the sandbox for later use; deletion removes it. Check that your choice matches whether the application needs the sandbox's files after expiry. Account limits may restrict permitted durations and actions.
@z

@x
Accounts with always-on access can instead select the restart action. This preserves memory through automatic stop-and-resume cycles. It retains a concurrency reservation while stopped and is different from restarting in response to an incoming request.
@y
Accounts with always-on access can instead select the restart action. This preserves memory through automatic stop-and-resume cycles. It retains a concurrency reservation while stopped and is different from restarting in response to an incoming request.
@z

@x
The example waits for startup. Its wait deadline is separate from the sandbox lifetime: ending a client wait does not delete the sandbox.
@y
The example waits for startup. Its wait deadline is separate from the sandbox lifetime: ending a client wait does not delete the sandbox.
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
const sandbox = await client.create(
  {
    displayName: name,
    image,
    lifecycle: {
      timeoutMs: lifeSeconds * 1_000,
      onTimeout: stopOnTimeout ? 'stop' : 'delete',
    },
  },
  { timeoutMs: 300_000, idempotencyKey: requestId },
);
return sandbox.waitUntilRunning();
```
@y
```typescript
const sandbox = await client.create(
  {
    displayName: name,
    image,
    lifecycle: {
      timeoutMs: lifeSeconds * 1_000,
      onTimeout: stopOnTimeout ? 'stop' : 'delete',
    },
  },
  { timeoutMs: 300_000, idempotencyKey: requestId },
);
return sandbox.waitUntilRunning();
```
@z

@x
<details>
<summary>Complete TypeScript example: timeout/deadline.ts</summary>
@y
<details>
<summary>Complete TypeScript example: timeout/deadline.ts</summary>
@z

@x
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@z

@x
export async function createWithDeadline(
  client: Sandboxes,
  name: string,
  image: string,
  lifeSeconds: number,
  stopOnTimeout: boolean,
  requestId: string,
) {
  const sandbox = await client.create(
    {
      displayName: name,
      image,
      lifecycle: {
        timeoutMs: lifeSeconds * 1_000,
        onTimeout: stopOnTimeout ? 'stop' : 'delete',
      },
    },
    { timeoutMs: 300_000, idempotencyKey: requestId },
  );
  return sandbox.waitUntilRunning();
}
```
@y
export async function createWithDeadline(
  client: Sandboxes,
  name: string,
  image: string,
  lifeSeconds: number,
  stopOnTimeout: boolean,
  requestId: string,
) {
  const sandbox = await client.create(
    {
      displayName: name,
      image,
      lifecycle: {
        timeoutMs: lifeSeconds * 1_000,
        onTimeout: stopOnTimeout ? 'stop' : 'delete',
      },
    },
    { timeoutMs: 300_000, idempotencyKey: requestId },
  );
  return sandbox.waitUntilRunning();
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
## Extend the remaining lifetime {#2-extend-the-remaining-lifetime}
@y
## Extend the remaining lifetime {#2-extend-the-remaining-lifetime}
@z

@x
Use `renewTimeout()` to extend the sandbox's remaining lifetime. Pass the desired duration from the time the service accepts the renewal, not an increment to add to the existing deadline. Renewal can only extend the lifetime; it cannot shorten it.
@y
Use `renewTimeout()` to extend the sandbox's remaining lifetime. Pass the desired duration from the time the service accepts the renewal, not an increment to add to the existing deadline. Renewal can only extend the lifetime; it cannot shorten it.
@z

@x
Renew a configured timeout before it expires. If the call fails, inspect the sandbox's current state instead of assuming that renewal took effect.
@y
Renew a configured timeout before it expires. If the call fails, inspect the sandbox's current state instead of assuming that renewal took effect.
@z

@x
The service manages timeouts for automatically restarting sandboxes; do not renew those yourself.
@y
The service manages timeouts for automatically restarting sandboxes; do not renew those yourself.
@z

@x
For request-triggered restart after a stop, see [Resume on demand](let-a-stopped-sandbox-resume-on-demand.md).
@y
For request-triggered restart after a stop, see [Resume on demand](let-a-stopped-sandbox-resume-on-demand.md).
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
return sandbox.renewTimeout({ timeoutMs: remainingSeconds * 1_000 });
```
@y
```typescript
return sandbox.renewTimeout({ timeoutMs: remainingSeconds * 1_000 });
```
@z

@x
<details>
<summary>Complete TypeScript example: timeout/renew.ts</summary>
@y
<details>
<summary>Complete TypeScript example: timeout/renew.ts</summary>
@z

@x
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@z

@x
export async function renewSandboxTimeout(
  client: Sandboxes,
  name: string,
  remainingSeconds: number,
) {
  const sandbox = await client.get(name);
  return sandbox.renewTimeout({ timeoutMs: remainingSeconds * 1_000 });
}
```
@y
export async function renewSandboxTimeout(
  client: Sandboxes,
  name: string,
  remainingSeconds: number,
) {
  const sandbox = await client.get(name);
  return sandbox.renewTimeout({ timeoutMs: remainingSeconds * 1_000 });
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
