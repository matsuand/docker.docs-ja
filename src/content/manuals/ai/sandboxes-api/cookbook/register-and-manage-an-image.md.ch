%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Register and manage an image"
linkTitle: "Register and manage an image"
description: "Register an image with Cloud Sandboxes, get the target to push its content to, check when it is ready, list your images, and delete one you no longer need."
keywords: "cloud sandboxes, sandboxes api, register and manage an image"
@y
title: "Register and manage an image"
linkTitle: "Register and manage an image"
description: "Register an image with Cloud Sandboxes, get the target to push its content to, check when it is ready, list your images, and delete one you no longer need."
keywords: "cloud sandboxes, sandboxes api, register and manage an image"
@z

@x
Reuse an image across sandboxes by registering it with Docker Cloud Sandboxes. Registration creates an image record and a temporary upload destination. You must push the image content separately with an OCI-compatible registry client.
@y
Reuse an image across sandboxes by registering it with Docker Cloud Sandboxes. Registration creates an image record and a temporary upload destination. You must push the image content separately with an OCI-compatible registry client.
@z

@x
Start with an [authenticated client](connect-to-cloud-with-a-bearer-token.md) and a built image. If you already have an image in a registry, [run it directly](run-your-own-container-image.md) instead.
@y
Start with an [authenticated client](connect-to-cloud-with-a-bearer-token.md) and a built image. If you already have an image in a registry, [run it directly](run-your-own-container-image.md) instead.
@z

@x
## Register an upload destination {#1-register-an-upload-destination}
@y
## Register an upload destination {#1-register-an-upload-destination}
@z

@x
Choose a display name, startup command, CPU and memory preferences, and an idempotency key. The returned image includes its resource name and a push target.
@y
Choose a display name, startup command, CPU and memory preferences, and an idempotency key. The returned image includes its resource name and a push target.
@z

@x
Use the target's registry reference and temporary credential to push your image. Keep that credential private and finish before it expires. Save the target from the initial response: later image reads do not issue a replacement upload credential.
@y
Use the target's registry reference and temporary credential to push your image. Keep that credential private and finish before it expires. Save the target from the initial response: later image reads do not issue a replacement upload credential.
@z

@x
This example registers the destination. It does not build or push image content.
@y
This example registers the destination. It does not build or push image content.
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
return client.images.create(
  { displayName: name, fromImage: { resources }, startCmd },
  { idempotencyKey: requestId },
);
```
@y
```typescript
return client.images.create(
  { displayName: name, fromImage: { resources }, startCmd },
  { idempotencyKey: requestId },
);
```
@z

@x
<details>
<summary>Complete TypeScript example: images/create.ts</summary>
@y
<details>
<summary>Complete TypeScript example: images/create.ts</summary>
@z

@x
```typescript
import type {
  ClientImagesCreateOptions,
  Sandboxes,
} from '@docker/sandboxes';
@y
```typescript
import type {
  ClientImagesCreateOptions,
  Sandboxes,
} from '@docker/sandboxes';
@z

@x
export async function createImage(
  client: Sandboxes,
  name: string,
  startCmd: string[],
  resources: Extract<
    ClientImagesCreateOptions,
    { fromImage: unknown }
  >['fromImage']['resources'],
  requestId: string,
) {
  return client.images.create(
    { displayName: name, fromImage: { resources }, startCmd },
    { idempotencyKey: requestId },
  );
}
```
@y
export async function createImage(
  client: Sandboxes,
  name: string,
  startCmd: string[],
  resources: Extract<
    ClientImagesCreateOptions,
    { fromImage: unknown }
  >['fromImage']['resources'],
  requestId: string,
) {
  return client.images.create(
    { displayName: name, fromImage: { resources }, startCmd },
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
## Check preparation status {#2-check-preparation-status}
@y
## Check preparation status {#2-check-preparation-status}
@z

@x
After the push finishes, read the image by its resource name. A `COMPLETED` status means it is ready to use. `WAITING_FOR_PUSH` means content has not arrived, `PREPARING` means preparation is in progress, and `FAILED` includes failure details.
@y
After the push finishes, read the image by its resource name. A `COMPLETED` status means it is ready to use. `WAITING_FOR_PUSH` means content has not arrived, `PREPARING` means preparation is in progress, and `FAILED` includes failure details.
@z

@x
The example performs one read. If preparation is still in progress, repeat the read with a delay and deadline. Repeating creation would register another image rather than advance this one.
@y
The example performs one read. If preparation is still in progress, repeat the read with a delay and deadline. Repeating creation would register another image rather than advance this one.
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
return client.images.get(name);
```
@y
```typescript
return client.images.get(name);
```
@z

@x
<details>
<summary>Complete TypeScript example: images/ready.ts</summary>
@y
<details>
<summary>Complete TypeScript example: images/ready.ts</summary>
@z

@x
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@z

@x
export async function getImage(client: Sandboxes, name: string) {
  return client.images.get(name);
}
```
@y
export async function getImage(client: Sandboxes, name: string) {
  return client.images.get(name);
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
## Find registered images {#3-find-registered-images}
@y
## Find registered images {#3-find-registered-images}
@z

@x
List images with an optional filter, such as `status=completed`. The example follows all pages. List entries are summaries; get the image by name when you need its complete record.
@y
List images with an optional filter, such as `status=completed`. The example follows all pages. List entries are summaries; get the image by name when you need its complete record.
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
return client.images.all({ filter }).collect();
```
@y
```typescript
return client.images.all({ filter }).collect();
```
@z

@x
<details>
<summary>Complete TypeScript example: images/list.ts</summary>
@y
<details>
<summary>Complete TypeScript example: images/list.ts</summary>
@z

@x
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@z

@x
export async function listImages(client: Sandboxes, filter: string) {
  return client.images.all({ filter }).collect();
}
```
@y
export async function listImages(client: Sandboxes, filter: string) {
  return client.images.all({ filter }).collect();
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
## Remove an image {#4-remove-an-image}
@y
## Remove an image {#4-remove-an-image}
@z

@x
Read the image and delete through its handle. The SDK supplies its name and version to protect against deleting a newer record you have not read.
@y
Read the image and delete through its handle. The SDK supplies its name and version to protect against deleting a newer record you have not read.
@z

@x
Keep images that future sandbox creations still depend on. Deleting an already absent image is safe for cleanup.
@y
Keep images that future sandbox creations still depend on. Deleting an already absent image is safe for cleanup.
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
await image.delete();
```
@y
```typescript
await image.delete();
```
@z

@x
<details>
<summary>Complete TypeScript example: images/delete.ts</summary>
@y
<details>
<summary>Complete TypeScript example: images/delete.ts</summary>
@z

@x
```typescript
import type { Image } from '@docker/sandboxes';
@y
```typescript
import type { Image } from '@docker/sandboxes';
@z

@x
export async function deleteImage(image: Image) {
  await image.delete();
}
```
@y
export async function deleteImage(image: Image) {
  await image.delete();
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
