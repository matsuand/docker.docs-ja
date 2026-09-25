%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Manage cloud secrets"
linkTitle: "Manage cloud secrets"
description: "Store a token as a stored secret, list your secrets' metadata, replace the token, and delete the secret."
keywords: "cloud sandboxes, sandboxes api, manage cloud secrets"
@y
title: "Manage cloud secrets"
linkTitle: "Manage cloud secrets"
description: "Store a token as a stored secret, list your secrets' metadata, replace the token, and delete the secret."
keywords: "cloud sandboxes, sandboxes api, manage cloud secrets"
@z

@x
Store workload credentials separately from application code. Secret reads return metadata only, so keep the original credential in your secret manager if you need it elsewhere.
@y
Store workload credentials separately from application code. Secret reads return metadata only, so keep the original credential in your secret manager if you need it elsewhere.
@z

@x
Use an [authenticated client](connect-to-cloud-with-a-bearer-token.md). These examples store a token for a named service. For instructions on giving a kit access to that token, see [Get a stored secret into a sandbox](get-a-stored-secret-into-a-sandbox.md).
@y
Use an [authenticated client](connect-to-cloud-with-a-bearer-token.md). These examples store a token for a named service. For instructions on giving a kit access to that token, see [Get a stored secret into a sandbox](get-a-stored-secret-into-a-sandbox.md).
@z

@x
## Create a secret {#1-create-a-secret}
@y
## Create a secret {#1-create-a-secret}
@z

@x
Pass a display name, service type, token value, and idempotency key. Save the returned resource name for attachments and future updates. Do not log the request or token.
@y
Pass a display name, service type, token value, and idempotency key. Save the returned resource name for attachments and future updates. Do not log the request or token.
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
return client.secrets.create(
  { displayName: name, serviceType, token: { value: token } },
  { idempotencyKey: requestId },
);
```
@y
```typescript
return client.secrets.create(
  { displayName: name, serviceType, token: { value: token } },
  { idempotencyKey: requestId },
);
```
@z

@x
<details>
<summary>Complete TypeScript example: secrets/create.ts</summary>
@y
<details>
<summary>Complete TypeScript example: secrets/create.ts</summary>
@z

@x
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@z

@x
export async function createSecret(
  client: Sandboxes,
  name: string,
  serviceType: string,
  token: string,
  requestId: string,
) {
  return client.secrets.create(
    { displayName: name, serviceType, token: { value: token } },
    { idempotencyKey: requestId },
  );
}
```
@y
export async function createSecret(
  client: Sandboxes,
  name: string,
  serviceType: string,
  token: string,
  requestId: string,
) {
  return client.secrets.create(
    { displayName: name, serviceType, token: { value: token } },
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
## List stored credentials {#2-list-stored-credentials}
@y
## List stored credentials {#2-list-stored-credentials}
@z

@x
List secret metadata to find a credential by name or label. The example follows each page. Listing does not reveal secret values.
@y
List secret metadata to find a credential by name or label. The example follows each page. Listing does not reveal secret values.
@z

@x
Use the resource name, not the display name, when attaching a secret to a sandbox.
@y
Use the resource name, not the display name, when attaching a secret to a sandbox.
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
return client.secrets.all().collect();
```
@y
```typescript
return client.secrets.all().collect();
```
@z

@x
<details>
<summary>Complete TypeScript example: secrets/list.ts</summary>
@y
<details>
<summary>Complete TypeScript example: secrets/list.ts</summary>
@z

@x
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@z

@x
export async function listSecrets(client: Sandboxes) {
  return client.secrets.all().collect();
}
```
@y
export async function listSecrets(client: Sandboxes) {
  return client.secrets.all().collect();
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
## Rotate the credential {#3-rotate-the-credential}
@y
## Rotate the credential {#3-rotate-the-credential}
@z

@x
Read the existing secret, then update it through a handle with the replacement value and service type. The handle carries the version it read so an intervening change is detected.
@y
Read the existing secret, then update it through a handle with the replacement value and service type. The handle carries the version it read so an intervening change is detected.
@z

@x
The update replaces the record's writable content. Send the service type again instead of assuming omitted values are preserved. Keep the returned metadata for subsequent operations.
@y
The update replaces the record's writable content. Send the service type again instead of assuming omitted values are preserved. Keep the returned metadata for subsequent operations.
@z

@x
If another writer changed the secret, read it again and decide whether to apply your replacement. Do not silently overwrite another rotation.
@y
If another writer changed the secret, read it again and decide whether to apply your replacement. Do not silently overwrite another rotation.
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
return secret.update(
  { serviceType, token: { value: token } },
  { idempotencyKey: requestId },
);
```
@y
```typescript
return secret.update(
  { serviceType, token: { value: token } },
  { idempotencyKey: requestId },
);
```
@z

@x
<details>
<summary>Complete TypeScript example: secrets/update.ts</summary>
@y
<details>
<summary>Complete TypeScript example: secrets/update.ts</summary>
@z

@x
```typescript
import type { Secret } from '@docker/sandboxes';
@y
```typescript
import type { Secret } from '@docker/sandboxes';
@z

@x
export async function updateSecret(
  secret: Secret,
  serviceType: string,
  token: string,
  requestId: string,
) {
  return secret.update(
    { serviceType, token: { value: token } },
    { idempotencyKey: requestId },
  );
}
```
@y
export async function updateSecret(
  secret: Secret,
  serviceType: string,
  token: string,
  requestId: string,
) {
  return secret.update(
    { serviceType, token: { value: token } },
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
## Delete a secret {#4-delete-a-secret}
@y
## Delete a secret {#4-delete-a-secret}
@z

@x
Delete through the secret handle when no workload needs the credential. Deleting an already absent secret is safe for repeated cleanup.
@y
Delete through the secret handle when no workload needs the credential. Deleting an already absent secret is safe for repeated cleanup.
@z

@x
Removing a stored secret is not a substitute for revoking a leaked credential with its provider. Revoke compromised credentials and replace them before starting new workloads.
@y
Removing a stored secret is not a substitute for revoking a leaked credential with its provider. Revoke compromised credentials and replace them before starting new workloads.
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
await secret.delete();
```
@y
```typescript
await secret.delete();
```
@z

@x
<details>
<summary>Complete TypeScript example: secrets/delete.ts</summary>
@y
<details>
<summary>Complete TypeScript example: secrets/delete.ts</summary>
@z

@x
```typescript
import type { Secret } from '@docker/sandboxes';
@y
```typescript
import type { Secret } from '@docker/sandboxes';
@z

@x
export async function deleteSecret(secret: Secret) {
  await secret.delete();
}
```
@y
export async function deleteSecret(secret: Secret) {
  await secret.delete();
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
