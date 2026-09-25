%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Let a stopped sandbox resume on demand"
linkTitle: "Let a stopped sandbox resume on demand"
description: "Choose at creation whether a stopped cloud sandbox starts itself when a request arrives at one of its published ports, then read back the setting in force."
keywords: "cloud sandboxes, sandboxes api, let a stopped sandbox resume on demand"
@y
title: "Let a stopped sandbox resume on demand"
linkTitle: "Let a stopped sandbox resume on demand"
description: "Choose at creation whether a stopped cloud sandbox starts itself when a request arrives at one of its published ports, then read back the setting in force."
keywords: "cloud sandboxes, sandboxes api, let a stopped sandbox resume on demand"
@z

@x
Let a request to a published application start a stopped sandbox. This can suit an application that should be available on demand without remaining active between uses.
@y
Let a request to a published application start a stopped sandbox. This can suit an application that should be available on demand without remaining active between uses.
@z

@x
Use an [authenticated client](connect-to-cloud-with-a-bearer-token.md) and a managed image that starts the application. [Publish its port](expose-a-port-from-a-cloud-sandbox.md) before relying on requests to reach it.
@y
Use an [authenticated client](connect-to-cloud-with-a-bearer-token.md) and a managed image that starts the application. [Publish its port](expose-a-port-from-a-cloud-sandbox.md) before relying on requests to reach it.
@z

@x
## Configure resume on creation {#1-configure-resume-on-creation}
@y
## Configure resume on creation {#1-configure-resume-on-creation}
@z

@x
Set automatic resume in the sandbox's lifecycle options. Omit the value when you want the service default; explicitly set false to disable it.
@y
Set automatic resume in the sandbox's lifecycle options. Omit the value when you want the service default; explicitly set false to disable it.
@z

@x
The example waits for the initial startup. Automatic resume does not recover a deleted sandbox, and it does not replace application startup configuration.
@y
The example waits for the initial startup. Automatic resume does not recover a deleted sandbox, and it does not replace application startup configuration.
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
  { displayName: name, image, lifecycle: { autoResume } },
  { timeoutMs: 300_000, idempotencyKey: requestId },
);
return sandbox.waitUntilRunning();
```
@y
```typescript
const sandbox = await client.create(
  { displayName: name, image, lifecycle: { autoResume } },
  { timeoutMs: 300_000, idempotencyKey: requestId },
);
return sandbox.waitUntilRunning();
```
@z

@x
<details>
<summary>Complete TypeScript example: wake/configure.ts</summary>
@y
<details>
<summary>Complete TypeScript example: wake/configure.ts</summary>
@z

@x
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@z

@x
export async function createWithAutoResume(
  client: Sandboxes,
  name: string,
  image: string,
  autoResume: boolean | undefined,
  requestId: string,
) {
  const sandbox = await client.create(
    { displayName: name, image, lifecycle: { autoResume } },
    { timeoutMs: 300_000, idempotencyKey: requestId },
  );
  return sandbox.waitUntilRunning();
}
```
@y
export async function createWithAutoResume(
  client: Sandboxes,
  name: string,
  image: string,
  autoResume: boolean | undefined,
  requestId: string,
) {
  const sandbox = await client.create(
    { displayName: name, image, lifecycle: { autoResume } },
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
## Read the effective setting {#2-read-the-effective-setting}
@y
## Read the effective setting {#2-read-the-effective-setting}
@z

@x
Get the sandbox and inspect the effective automatic-resume value together with its state. This checks what the service recorded; it does not send a request to the application or prove that the application can start.
@y
Get the sandbox and inspect the effective automatic-resume value together with its state. This checks what the service recorded; it does not send a request to the application or prove that the application can start.
@z

@x
To verify the whole flow, stop the sandbox, request its published application URL, and confirm that the application becomes ready. Allow for startup time and keep the application's own authentication enabled.
@y
To verify the whole flow, stop the sandbox, request its published application URL, and confirm that the application becomes ready. Allow for startup time and keep the application's own authentication enabled.
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
const sandbox = await client.get(name);
return {
  autoResume: sandbox.effectiveFeatures?.timeouts?.autoResume ?? false,
  status: sandbox.status,
};
```
@y
```typescript
const sandbox = await client.get(name);
return {
  autoResume: sandbox.effectiveFeatures?.timeouts?.autoResume ?? false,
  status: sandbox.status,
};
```
@z

@x
<details>
<summary>Complete TypeScript example: wake/verify.ts</summary>
@y
<details>
<summary>Complete TypeScript example: wake/verify.ts</summary>
@z

@x
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@z

@x
export async function autoResumeInForce(client: Sandboxes, name: string) {
  const sandbox = await client.get(name);
  return {
    autoResume: sandbox.effectiveFeatures?.timeouts?.autoResume ?? false,
    status: sandbox.status,
  };
}
```
@y
export async function autoResumeInForce(client: Sandboxes, name: string) {
  const sandbox = await client.get(name);
  return {
    autoResume: sandbox.effectiveFeatures?.timeouts?.autoResume ?? false,
    status: sandbox.status,
  };
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
