%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Send values the API accepts"
linkTitle: "Send values the API accepts"
description: "Build a create request whose durations, counts, and flags mean what you intend, then read back the values the service settled on."
keywords: "cloud sandboxes, sandboxes api, send values the api accepts"
@y
title: "Send values the API accepts"
linkTitle: "Send values the API accepts"
description: "Build a create request whose durations, counts, and flags mean what you intend, then read back the values the service settled on."
keywords: "cloud sandboxes, sandboxes api, send values the api accepts"
@z

@x
Build SDK options without confusing an omitted value with an explicit false or zero. This matters for settings whose default is chosen by the service.
@y
Build SDK options without confusing an omitted value with an explicit false or zero. This matters for settings whose default is chosen by the service.
@z

@x
Start with an [authenticated client](connect-to-cloud-with-a-bearer-token.md). Use the option types exported by your SDK so your editor can show the supported inputs.
@y
Start with an [authenticated client](connect-to-cloud-with-a-bearer-token.md). Use the option types exported by your SDK so your editor can show the supported inputs.
@z

@x
## Construct creation options {#1-construct-creation-options}
@y
## Construct creation options {#1-construct-creation-options}
@z

@x
Supply the image source and lifecycle settings, using the duration units required by your SDK. The example accepts seconds and converts them at the boundary.
@y
Supply the image source and lifecycle settings, using the duration units required by your SDK. The example accepts seconds and converts them at the boundary.
@z

@x
This example uses a managed image, which supplies its resource defaults. For a registry image instead, use the image-reference option and provide a supported CPU and memory pair.
@y
This example uses a managed image, which supplies its resource defaults. For a registry image instead, use the image-reference option and provide a supported CPU and memory pair.
@z

@x
Preserve absence for an optional boolean when you want the service default. Explicit false is a choice, not a missing value. Validate user-supplied values before building the request.
@y
Preserve absence for an optional boolean when you want the service default. Explicit false is a choice, not a missing value. Validate user-supplied values before building the request.
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
return {
  displayName: name,
  image,
  platform,
  lifecycle: { timeoutMs: lifeSeconds * 1_000, autoResume },
};
```
@y
```typescript
return {
  displayName: name,
  image,
  platform,
  lifecycle: { timeoutMs: lifeSeconds * 1_000, autoResume },
};
```
@z

@x
<details>
<summary>Complete TypeScript example: values/build.ts</summary>
@y
<details>
<summary>Complete TypeScript example: values/build.ts</summary>
@z

@x
```typescript
import type { ClientCreateOptions, Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { ClientCreateOptions, Sandboxes } from '@docker/sandboxes';
@z

@x
export function createRequest(
  name: string,
  image: string,
  lifeSeconds: number,
  platform: ClientCreateOptions['platform'],
  autoResume: boolean | undefined,
): ClientCreateOptions {
  return {
    displayName: name,
    image,
    platform,
    lifecycle: { timeoutMs: lifeSeconds * 1_000, autoResume },
  };
}
@y
export function createRequest(
  name: string,
  image: string,
  lifeSeconds: number,
  platform: ClientCreateOptions['platform'],
  autoResume: boolean | undefined,
): ClientCreateOptions {
  return {
    displayName: name,
    image,
    platform,
    lifecycle: { timeoutMs: lifeSeconds * 1_000, autoResume },
  };
}
@z

@x
export async function sendCreate(
  client: Sandboxes,
  request: ClientCreateOptions,
) {
  const sandbox = await client.create(request, { timeoutMs: 300_000 });
  return sandbox.waitUntilRunning();
}
```
@y
export async function sendCreate(
  client: Sandboxes,
  request: ClientCreateOptions,
) {
  const sandbox = await client.create(request, { timeoutMs: 300_000 });
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
## Read the effective values {#2-read-the-effective-values}
@y
## Read the effective values {#2-read-the-effective-values}
@z

@x
Get the sandbox and inspect the reported platform, resources, and expiration. These describe what the service recorded, which can differ from omitted or defaulted input values.
@y
Get the sandbox and inspect the reported platform, resources, and expiration. These describe what the service recorded, which can differ from omitted or defaulted input values.
@z

@x
Keep the language's native numeric and duration representations. Avoid converting large integers through a floating-point type merely to display or serialize them.
@y
Keep the language's native numeric and duration representations. Avoid converting large integers through a floating-point type merely to display or serialize them.
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
return {
  expiresAt: sandbox.effectiveFeatures?.timeouts?.expiresAt,
  platform: sandbox.core.platform,
  cpus: sandbox.core.resources?.cpus ?? undefined,
};
```
@y
```typescript
return {
  expiresAt: sandbox.effectiveFeatures?.timeouts?.expiresAt,
  platform: sandbox.core.platform,
  cpus: sandbox.core.resources?.cpus ?? undefined,
};
```
@z

@x
<details>
<summary>Complete TypeScript example: values/read.ts</summary>
@y
<details>
<summary>Complete TypeScript example: values/read.ts</summary>
@z

@x
```typescript
import type { Sandbox, Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { Sandbox, Sandboxes } from '@docker/sandboxes';
@z

@x
export function reportedValues(sandbox: Sandbox) {
  return {
    expiresAt: sandbox.effectiveFeatures?.timeouts?.expiresAt,
    platform: sandbox.core.platform,
    cpus: sandbox.core.resources?.cpus ?? undefined,
  };
}
@y
export function reportedValues(sandbox: Sandbox) {
  return {
    expiresAt: sandbox.effectiveFeatures?.timeouts?.expiresAt,
    platform: sandbox.core.platform,
    cpus: sandbox.core.resources?.cpus ?? undefined,
  };
}
@z

@x
export async function readSandbox(client: Sandboxes, name: string) {
  return reportedValues(await client.get(name));
}
```
@y
export async function readSandbox(client: Sandboxes, name: string) {
  return reportedValues(await client.get(name));
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
