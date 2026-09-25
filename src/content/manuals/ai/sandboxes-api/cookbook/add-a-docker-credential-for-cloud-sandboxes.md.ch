%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Add a Docker credential for cloud sandboxes"
linkTitle: "Add a Docker credential for cloud sandboxes"
description: "Exchange a Docker OIDC identity token for a credential that the service stores for your sandboxes to use."
keywords: "cloud sandboxes, sandboxes api, add a docker credential for cloud sandboxes"
@y
title: "Add a Docker credential for cloud sandboxes"
linkTitle: "Add a Docker credential for cloud sandboxes"
description: "Exchange a Docker OIDC identity token for a credential that the service stores for your sandboxes to use."
keywords: "cloud sandboxes, sandboxes api, add a docker credential for cloud sandboxes"
@z

@x
Store a Docker credential for workloads that need Docker access. This is separate from [signing your application in](connect-to-cloud-with-a-bearer-token.md): the application's access token authenticates SDK calls, while this exchange stores a credential for sandboxes.
@y
Store a Docker credential for workloads that need Docker access. This is separate from [signing your application in](connect-to-cloud-with-a-bearer-token.md): the application's access token authenticates SDK calls, while this exchange stores a credential for sandboxes.
@z

@x
You need an authenticated client and a fresh Docker OpenID Connect identity token for the same identity. The example accepts that identity token; it does not perform the sign-in that issues it.
@y
You need an authenticated client and a fresh Docker OpenID Connect identity token for the same identity. The example accepts that identity token; it does not perform the sign-in that issues it.
@z

@x
## Exchange the token {#1-exchange-the-token}
@y
## Exchange the token {#1-exchange-the-token}
@z

@x
Pass the identity token to the identity collection. The service stores the resulting credential as `secrets/docker`, replacing its previous value. It returns no credential material.
@y
Pass the identity token to the identity collection. The service stores the resulting credential as `secrets/docker`, replacing its previous value. It returns no credential material.
@z

@x
Treat the identity token as single-use. If you lose the response, obtain a new identity token before trying again. Never log either token.
@y
Treat the identity token as single-use. If you lose the response, obtain a new identity token before trying again. Never log either token.
@z

@x
Use [stored secrets](get-a-stored-secret-into-a-sandbox.md) for other workload credentials. For an automation client that needs to call the SDK, use [PAT authentication](connect-to-cloud-with-a-bearer-token.md) instead of this exchange.
@y
Use [stored secrets](get-a-stored-secret-into-a-sandbox.md) for other workload credentials. For an automation client that needs to call the SDK, use [PAT authentication](connect-to-cloud-with-a-bearer-token.md) instead of this exchange.
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
return client.identity.exchangeDockerCredential({ idToken });
```
@y
```typescript
return client.identity.exchangeDockerCredential({ idToken });
```
@z

@x
<details>
<summary>Complete TypeScript example: credentials/exchange.ts</summary>
@y
<details>
<summary>Complete TypeScript example: credentials/exchange.ts</summary>
@z

@x
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@z

@x
export async function exchangeDockerCredential(
  client: Sandboxes,
  idToken: string,
) {
  return client.identity.exchangeDockerCredential({ idToken });
}
```
@y
export async function exchangeDockerCredential(
  client: Sandboxes,
  idToken: string,
) {
  return client.identity.exchangeDockerCredential({ idToken });
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
