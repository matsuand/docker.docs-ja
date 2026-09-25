%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Get a stored secret into a sandbox"
linkTitle: "Get a stored secret into a sandbox"
description: "Store a credential once, then pass its resource name when creating a sandbox so the sandbox starts with that secret attached."
keywords: "cloud sandboxes, sandboxes api, get a stored secret into a sandbox"
@y
title: "Get a stored secret into a sandbox"
linkTitle: "Get a stored secret into a sandbox"
description: "Store a credential once, then pass its resource name when creating a sandbox so the sandbox starts with that secret attached."
keywords: "cloud sandboxes, sandboxes api, get a stored secret into a sandbox"
@z

@x
Give an agent access to its provider without placing the real credential in its command arguments or source files. Store the credential once, then attach its secret name when creating each sandbox.
@y
Give an agent access to its provider without placing the real credential in its command arguments or source files. Store the credential once, then attach its secret name when creating each sandbox.
@z

@x
Start with an [authenticated client](connect-to-cloud-with-a-bearer-token.md). Obtain the provider credential from that provider and read it from your application's secret manager. For Claude Code, use an Anthropic API key and service type `anthropic`; the Docker login token is not an Anthropic key.
@y
Start with an [authenticated client](connect-to-cloud-with-a-bearer-token.md). Obtain the provider credential from that provider and read it from your application's secret manager. For Claude Code, use an Anthropic API key and service type `anthropic`; the Docker login token is not an Anthropic key.
@z

@x
## Store the provider credential {#1-store-the-provider-credential}
@y
## Store the provider credential {#1-store-the-provider-credential}
@z

@x
Supply a display name, service type, token value, and an idempotency key. Save the returned secret name. The response contains metadata, never the stored token.
@y
Supply a display name, service type, token value, and an idempotency key. Save the returned secret name. The response contains metadata, never the stored token.
@z

@x
Choose the service type that matches the workload's provider. A token for one provider does not authenticate another agent.
@y
Choose the service type that matches the workload's provider. A token for one provider does not authenticate another agent.
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
<summary>Complete TypeScript example: credinject/store.ts</summary>
@y
<details>
<summary>Complete TypeScript example: credinject/store.ts</summary>
@z

@x
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@z

@x
export async function storeSecret(
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
export async function storeSecret(
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
## Attach the secret at creation {#2-attach-the-secret-at-creation}
@y
## Attach the secret at creation {#2-attach-the-secret-at-creation}
@z

@x
Put the secret name in the sandbox's storage options. This example uses a managed image; the same storage options can be passed when [launching a named kit](add-tools-with-kits.md).
@y
Put the secret name in the sandbox's storage options. This example uses a managed image; the same storage options can be passed when [launching a named kit](add-tools-with-kits.md).
@z

@x
Attach the secret when creating the sandbox, before starting the agent. Passing a secret's display name instead of its resource name will not select it. Keep the real token on the client side of the storage step rather than duplicating it in environment variables.
@y
Attach the secret when creating the sandbox, before starting the agent. Passing a secret's display name instead of its resource name will not select it. Keep the real token on the client side of the storage step rather than duplicating it in environment variables.
@z

@x
The SDK returns a handle after the example waits for the sandbox to run. Use that handle to run the agent. To replace or delete the credential later, follow [Manage cloud secrets](manage-cloud-secrets.md).
@y
The SDK returns a handle after the example waits for the sandbox to run. Use that handle to run the agent. To replace or delete the credential later, follow [Manage cloud secrets](manage-cloud-secrets.md).
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
  { displayName: name, image, storage: { secrets: secretNames } },
  { timeoutMs: 300_000, idempotencyKey: requestId },
);
return sandbox.waitUntilRunning();
```
@y
```typescript
const sandbox = await client.create(
  { displayName: name, image, storage: { secrets: secretNames } },
  { timeoutMs: 300_000, idempotencyKey: requestId },
);
return sandbox.waitUntilRunning();
```
@z

@x
<details>
<summary>Complete TypeScript example: credinject/attach.ts</summary>
@y
<details>
<summary>Complete TypeScript example: credinject/attach.ts</summary>
@z

@x
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@z

@x
export async function createWithSecrets(
  client: Sandboxes,
  name: string,
  image: string,
  secretNames: string[],
  requestId: string,
) {
  const sandbox = await client.create(
    { displayName: name, image, storage: { secrets: secretNames } },
    { timeoutMs: 300_000, idempotencyKey: requestId },
  );
  return sandbox.waitUntilRunning();
}
```
@y
export async function createWithSecrets(
  client: Sandboxes,
  name: string,
  image: string,
  secretNames: string[],
  requestId: string,
) {
  const sandbox = await client.create(
    { displayName: name, image, storage: { secrets: secretNames } },
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
