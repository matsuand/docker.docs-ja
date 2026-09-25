%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Get image pull URLs"
linkTitle: "Get image pull URLs"
description: "Get the manifest details and short-lived download URLs for a managed image so a registry tool can pull its contents."
keywords: "cloud sandboxes, sandboxes api, get image pull urls"
@y
title: "Get image pull URLs"
linkTitle: "Get image pull URLs"
description: "Get the manifest details and short-lived download URLs for a managed image so a registry tool can pull its contents."
keywords: "cloud sandboxes, sandboxes api, get image pull urls"
@z

@x
Obtain the registry references needed to pull a managed image with an OCI-compatible tool. This is useful when another part of your workflow needs the image content outside a sandbox.
@y
Obtain the registry references needed to pull a managed image with an OCI-compatible tool. This is useful when another part of your workflow needs the image content outside a sandbox.
@z

@x
You need an [authenticated client](connect-to-cloud-with-a-bearer-token.md) and the image name returned by [image registration](register-and-manage-an-image.md).
@y
You need an [authenticated client](connect-to-cloud-with-a-bearer-token.md) and the image name returned by [image registration](register-and-manage-an-image.md).
@z

@x
## Get the pull information {#1-get-the-pull-information}
@y
## Get the pull information {#1-get-the-pull-information}
@z

@x
Read the image's pull specification. The result identifies its manifest digest and image references.
@y
Read the image's pull specification. The result identifies its manifest digest and image references.
@z

@x
Pass those references to your OCI client. This example only retrieves the pull information; it does not download layers or authenticate a separate registry client. Treat any returned access information as sensitive, and do not publish it in logs.
@y
Pass those references to your OCI client. This example only retrieves the pull information; it does not download layers or authenticate a separate registry client. Treat any returned access information as sensitive, and do not publish it in logs.
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
const image = await client.images.get(name);
return image.getPullSpec();
```
@y
```typescript
const image = await client.images.get(name);
return image.getPullSpec();
```
@z

@x
<details>
<summary>Complete TypeScript example: pullspec/spec.ts</summary>
@y
<details>
<summary>Complete TypeScript example: pullspec/spec.ts</summary>
@z

@x
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@z

@x
export async function getImagePullSpec(client: Sandboxes, name: string) {
  const image = await client.images.get(name);
  return image.getPullSpec();
}
```
@y
export async function getImagePullSpec(client: Sandboxes, name: string) {
  const image = await client.images.get(name);
  return image.getPullSpec();
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
