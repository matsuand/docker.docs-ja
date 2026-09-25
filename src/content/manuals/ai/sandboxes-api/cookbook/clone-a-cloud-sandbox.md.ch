%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Clone a cloud sandbox"
linkTitle: "Clone a cloud sandbox"
description: "Read how a running sandbox was configured, then create a second sandbox with the same image and environment."
keywords: "cloud sandboxes, sandboxes api, clone a cloud sandbox"
@y
title: "Clone a cloud sandbox"
linkTitle: "Clone a cloud sandbox"
description: "Read how a running sandbox was configured, then create a second sandbox with the same image and environment."
keywords: "cloud sandboxes, sandboxes api, clone a cloud sandbox"
@z

@x
Create another sandbox using selected settings from an existing one. This example copies the image source and environment, not the sandbox's files or running processes. For a saved filesystem or memory state, use a [snapshot](snapshot-and-fork-a-sandbox.md).
@y
Create another sandbox using selected settings from an existing one. This example copies the image source and environment, not the sandbox's files or running processes. For a saved filesystem or memory state, use a [snapshot](snapshot-and-fork-a-sandbox.md).
@z

@x
You need an [authenticated client](connect-to-cloud-with-a-bearer-token.md), the source sandbox's resource name, and a display name for the new sandbox.
@y
You need an [authenticated client](connect-to-cloud-with-a-bearer-token.md), the source sandbox's resource name, and a display name for the new sandbox.
@z

@x
## Read the source configuration {#1-read-the-source-configuration}
@y
## Read the source configuration {#1-read-the-source-configuration}
@z

@x
Get the source sandbox and inspect its image and environment. Review environment values before copying them; they may contain credentials or settings specific to the original job.
@y
Get the source sandbox and inspect its image and environment. Review environment values before copying them; they may contain credentials or settings specific to the original job.
@z

@x
Do not treat the complete response as a create request. It includes read-only state and connection details.
@y
Do not treat the complete response as a create request. It includes read-only state and connection details.
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
return sandbox.core;
```
@y
```typescript
const sandbox = await client.get(name);
return sandbox.core;
```
@z

@x
<details>
<summary>Complete TypeScript example: clone/inspect.ts</summary>
@y
<details>
<summary>Complete TypeScript example: clone/inspect.ts</summary>
@z

@x
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@z

@x
export async function inspectSandbox(client: Sandboxes, name: string) {
  const sandbox = await client.get(name);
  return sandbox.core;
}
```
@y
export async function inspectSandbox(client: Sandboxes, name: string) {
  const sandbox = await client.get(name);
  return sandbox.core;
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
## Create a fresh sandbox {#2-create-a-fresh-sandbox}
@y
## Create a fresh sandbox {#2-create-a-fresh-sandbox}
@z

@x
The example copies the image source and environment. For a registry image it also copies resource settings. It waits for the new sandbox to run.
@y
The example copies the image source and environment. For a registry image it also copies resource settings. It waits for the new sandbox to run.
@z

@x
The call returns the new sandbox's handle, ready for running commands or transferring files.
@y
The call returns the new sandbox's handle, ready for running commands or transferring files.
@z

@x
This is a limited configuration copy, not a complete clone. It does not copy kits, attached policies, secrets, volumes, files, or process state. A copied image alone may not reproduce a kit's setup. For repeated agent environments, launch the same [named kit](add-tools-with-kits.md) with the options your application saved.
@y
This is a limited configuration copy, not a complete clone. It does not copy kits, attached policies, secrets, volumes, files, or process state. A copied image alone may not reproduce a kit's setup. For repeated agent environments, launch the same [named kit](add-tools-with-kits.md) with the options your application saved.
@z

@x
Attach required network policies and credentials before running work in the new sandbox. The source is unchanged, and both sandboxes need their own cleanup.
@y
Attach required network policies and credentials before running work in the new sandbox. The source is unchanged, and both sandboxes need their own cleanup.
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
const copy = await client.create(
  {
    displayName: name,
    ...(core.image
      ? { image: core.image, agent: core.agent }
      : {
          imageRef: core.imageRef!,
          resources: core.resources,
        }),
    environment: core.environment,
  },
  { timeoutMs: 300_000, idempotencyKey: requestId },
);
return copy.waitUntilRunning();
```
@y
```typescript
const copy = await client.create(
  {
    displayName: name,
    ...(core.image
      ? { image: core.image, agent: core.agent }
      : {
          imageRef: core.imageRef!,
          resources: core.resources,
        }),
    environment: core.environment,
  },
  { timeoutMs: 300_000, idempotencyKey: requestId },
);
return copy.waitUntilRunning();
```
@z

@x
<details>
<summary>Complete TypeScript example: clone/rebuild.ts</summary>
@y
<details>
<summary>Complete TypeScript example: clone/rebuild.ts</summary>
@z

@x
```typescript
import type { Sandbox, Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { Sandbox, Sandboxes } from '@docker/sandboxes';
@z

@x
export async function rebuildSandbox(
  client: Sandboxes,
  core: Sandbox['core'],
  name: string,
  requestId: string,
) {
  if (!core.image && !core.imageRef)
    throw new TypeError('Source has no image');
  const copy = await client.create(
    {
      displayName: name,
      ...(core.image
        ? { image: core.image, agent: core.agent }
        : {
            imageRef: core.imageRef!,
            resources: core.resources,
          }),
      environment: core.environment,
    },
    { timeoutMs: 300_000, idempotencyKey: requestId },
  );
  return copy.waitUntilRunning();
}
```
@y
export async function rebuildSandbox(
  client: Sandboxes,
  core: Sandbox['core'],
  name: string,
  requestId: string,
) {
  if (!core.image && !core.imageRef)
    throw new TypeError('Source has no image');
  const copy = await client.create(
    {
      displayName: name,
      ...(core.image
        ? { image: core.image, agent: core.agent }
        : {
            imageRef: core.imageRef!,
            resources: core.resources,
          }),
      environment: core.environment,
    },
    { timeoutMs: 300_000, idempotencyKey: requestId },
  );
  return copy.waitUntilRunning();
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
