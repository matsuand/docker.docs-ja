%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Run your own container image"
linkTitle: "Run your own container image"
description: "Start a sandbox from a container image in a registry you name, instead of from a managed image."
keywords: "cloud sandboxes, sandboxes api, run your own container image"
@y
title: "Run your own container image"
linkTitle: "Run your own container image"
description: "Start a sandbox from a container image in a registry you name, instead of from a managed image."
keywords: "cloud sandboxes, sandboxes api, run your own container image"
@z

@x
Run your own tools from a container image when a [bundled kit](add-tools-with-kits.md) does not fit the task. You supply the image reference and machine size; the SDK creates an isolated sandbox around it.
@y
Run your own tools from a container image when a [bundled kit](add-tools-with-kits.md) does not fit the task. You supply the image reference and machine size; the SDK creates an isolated sandbox around it.
@z

@x
You need an [authenticated client](connect-to-cloud-with-a-bearer-token.md) and an OCI image the service can pull. Use a versioned reference or digest when repeatability matters. The image must include `/bin/sh`.
@y
You need an [authenticated client](connect-to-cloud-with-a-bearer-token.md) and an OCI image the service can pull. Use a versioned reference or digest when repeatability matters. The image must include `/bin/sh`.
@z

@x
## Create from a registry image {#1-create-from-a-registry-image}
@y
## Create from a registry image {#1-create-from-a-registry-image}
@z

@x
Pass the image reference, CPU count, memory size, display name, and idempotency key. The SDK's image-reference option avoids assembling nested request fields. Do not also supply a managed image or named agent.
@y
Pass the image reference, CPU count, memory size, display name, and idempotency key. The SDK's image-reference option avoids assembling nested request fields. Do not also supply a managed image or named agent.
@z

@x
The example waits for the sandbox to run. A wait timeout stops your wait; it does not delete a sandbox that was already accepted. Save any sandbox handle retained by the error so you can inspect or clean it up.
@y
The example waits for the sandbox to run. A wait timeout stops your wait; it does not delete a sandbox that was already accepted. Save any sandbox handle retained by the error so you can inspect or clean it up.
@z

@x
The image's startup command runs inside the sandbox. Read `WORKSPACE_DIR` to find the workspace rather than assuming a path.
@y
The image's startup command runs inside the sandbox. Read `WORKSPACE_DIR` to find the workspace rather than assuming a path.
@z

@x
Next, [run a command](run-your-first-command.md) or [copy in your project files](copy-a-file-into-a-cloud-sandbox.md). [Delete the sandbox](delete-a-cloud-sandbox.md) when the work is complete.
@y
Next, [run a command](run-your-first-command.md) or [copy in your project files](copy-a-file-into-a-cloud-sandbox.md). [Delete the sandbox](delete-a-cloud-sandbox.md) when the work is complete.
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
  { displayName: name, imageRef, resources },
  { timeoutMs: 300_000, idempotencyKey: requestId },
);
return sandbox.waitUntilRunning();
```
@y
```typescript
const sandbox = await client.create(
  { displayName: name, imageRef, resources },
  { timeoutMs: 300_000, idempotencyKey: requestId },
);
return sandbox.waitUntilRunning();
```
@z

@x
<details>
<summary>Complete TypeScript example: rawimage/create.ts</summary>
@y
<details>
<summary>Complete TypeScript example: rawimage/create.ts</summary>
@z

@x
```typescript
import type { ClientCreateOptions, Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { ClientCreateOptions, Sandboxes } from '@docker/sandboxes';
@z

@x
export async function createFromImageRef(
  client: Sandboxes,
  name: string,
  imageRef: string,
  resources: ClientCreateOptions['resources'],
  requestId: string,
) {
  const sandbox = await client.create(
    { displayName: name, imageRef, resources },
    { timeoutMs: 300_000, idempotencyKey: requestId },
  );
  return sandbox.waitUntilRunning();
}
```
@y
export async function createFromImageRef(
  client: Sandboxes,
  name: string,
  imageRef: string,
  resources: ClientCreateOptions['resources'],
  requestId: string,
) {
  const sandbox = await client.create(
    { displayName: name, imageRef, resources },
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
