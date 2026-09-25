%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Attach persistent storage"
linkTitle: "Attach persistent storage"
description: "Create a volume, mount it into a new sandbox so its data outlives the sandbox, and delete the volume when you no longer need it."
keywords: "cloud sandboxes, sandboxes api, attach persistent storage"
@y
title: "Attach persistent storage"
linkTitle: "Attach persistent storage"
description: "Create a volume, mount it into a new sandbox so its data outlives the sandbox, and delete the volume when you no longer need it."
keywords: "cloud sandboxes, sandboxes api, attach persistent storage"
@z

@x
Keep project data after a sandbox is deleted by mounting a persistent volume. A volume is an independent resource: deleting a sandbox does not delete the volume.
@y
Keep project data after a sandbox is deleted by mounting a persistent volume. A volume is an independent resource: deleting a sandbox does not delete the volume.
@z

@x
Start with an [authenticated client](connect-to-cloud-with-a-bearer-token.md), a managed image from [Register and manage an image](register-and-manage-an-image.md), and an absolute mount path such as `/workspace/data`.
@y
Start with an [authenticated client](connect-to-cloud-with-a-bearer-token.md), a managed image from [Register and manage an image](register-and-manage-an-image.md), and an absolute mount path such as `/workspace/data`.
@z

@x
## Create a volume {#1-create-a-volume}
@y
## Create a volume {#1-create-a-volume}
@z

@x
Choose a display name and an idempotency key for the create request. Save the returned volume name, such as `volumes/…`. That name identifies the volume in later requests; its display name is only a label.
@y
Choose a display name and an idempotency key for the create request. Save the returned volume name, such as `volumes/…`. That name identifies the volume in later requests; its display name is only a label.
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
return client.volumes.create(
  { displayName: name },
  { idempotencyKey: requestId },
);
```
@y
```typescript
return client.volumes.create(
  { displayName: name },
  { idempotencyKey: requestId },
);
```
@z

@x
<details>
<summary>Complete TypeScript example: volumes/create.ts</summary>
@y
<details>
<summary>Complete TypeScript example: volumes/create.ts</summary>
@z

@x
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@z

@x
export async function createVolume(
  client: Sandboxes,
  name: string,
  requestId: string,
) {
  return client.volumes.create(
    { displayName: name },
    { idempotencyKey: requestId },
  );
}
```
@y
export async function createVolume(
  client: Sandboxes,
  name: string,
  requestId: string,
) {
  return client.volumes.create(
    { displayName: name },
    { idempotencyKey: requestId },
  );
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
## Mount it in a new sandbox {#2-mount-it-in-a-new-sandbox}
@y
## Mount it in a new sandbox {#2-mount-it-in-a-new-sandbox}
@z

@x
Supply the volume name and destination path when creating the sandbox. The example accepts a map of volume names to mount paths and waits for the sandbox to run. For Cloud Sandboxes, supply one entry and use exclusive attachment. Volume access must be enabled for your account; memory-snapshot images do not support volume attachment.
@y
Supply the volume name and destination path when creating the sandbox. The example accepts a map of volume names to mount paths and waits for the sandbox to run. For Cloud Sandboxes, supply one entry and use exclusive attachment. Volume access must be enabled for your account; memory-snapshot images do not support volume attachment.
@z

@x
Attachments belong to the sandbox's creation settings. To mount the volume elsewhere, create another sandbox with the attachment. With exclusive attachment, release the first sandbox before attaching the volume to another one. Avoid overlapping mount paths.
@y
Attachments belong to the sandbox's creation settings. To mount the volume elsewhere, create another sandbox with the attachment. With exclusive attachment, release the first sandbox before attaching the volume to another one. Avoid overlapping mount paths.
@z

@x
Write a file under the mount path, delete the sandbox, then attach the volume to a new sandbox to read it again. Files outside the mount remain on the sandbox's own disk.
@y
Write a file under the mount path, delete the sandbox, then attach the volume to a new sandbox to read it again. Files outside the mount remain on the sandbox's own disk.
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
    storage: {
      volumes: [...mountPaths].map(([volume, target]) => ({
        volume,
        target,
      })),
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
    storage: {
      volumes: [...mountPaths].map(([volume, target]) => ({
        volume,
        target,
      })),
    },
  },
  { timeoutMs: 300_000, idempotencyKey: requestId },
);
return sandbox.waitUntilRunning();
```
@z

@x
<details>
<summary>Complete TypeScript example: volumes/attach.ts</summary>
@y
<details>
<summary>Complete TypeScript example: volumes/attach.ts</summary>
@z

@x
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@z

@x
export async function createWithVolumes(
  client: Sandboxes,
  name: string,
  image: string,
  mountPaths: Map<string, string>,
  requestId: string,
) {
  const sandbox = await client.create(
    {
      displayName: name,
      image,
      storage: {
        volumes: [...mountPaths].map(([volume, target]) => ({
          volume,
          target,
        })),
      },
    },
    { timeoutMs: 300_000, idempotencyKey: requestId },
  );
  return sandbox.waitUntilRunning();
}
```
@y
export async function createWithVolumes(
  client: Sandboxes,
  name: string,
  image: string,
  mountPaths: Map<string, string>,
  requestId: string,
) {
  const sandbox = await client.create(
    {
      displayName: name,
      image,
      storage: {
        volumes: [...mountPaths].map(([volume, target]) => ({
          volume,
          target,
        })),
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
## Delete the volume {#3-delete-the-volume}
@y
## Delete the volume {#3-delete-the-volume}
@z

@x
Delete the sandbox using the volume first, then delete the volume through its handle. If the service reports that it is still in use, wait for sandbox deletion to finish before retrying.
@y
Delete the sandbox using the volume first, then delete the volume through its handle. If the service reports that it is still in use, wait for sandbox deletion to finish before retrying.
@z

@x
Deleting the volume permanently removes its contents. Copy out anything you need to keep.
@y
Deleting the volume permanently removes its contents. Copy out anything you need to keep.
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
await volume.delete();
```
@y
```typescript
await volume.delete();
```
@z

@x
<details>
<summary>Complete TypeScript example: volumes/delete.ts</summary>
@y
<details>
<summary>Complete TypeScript example: volumes/delete.ts</summary>
@z

@x
```typescript
import type { Volume } from '@docker/sandboxes';
@y
```typescript
import type { Volume } from '@docker/sandboxes';
@z

@x
export async function deleteVolume(volume: Volume) {
  await volume.delete();
}
```
@y
export async function deleteVolume(volume: Volume) {
  await volume.delete();
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
