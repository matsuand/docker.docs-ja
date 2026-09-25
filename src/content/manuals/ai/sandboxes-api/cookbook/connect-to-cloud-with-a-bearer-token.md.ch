%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Authenticate to Docker"
linkTitle: "Authenticate to Docker"
description: "Sign in interactively, use a Docker personal access token, or supply an access token from your application."
keywords: "cloud sandboxes, sandboxes api, authenticate to docker"
@y
title: "Authenticate to Docker"
linkTitle: "Authenticate to Docker"
description: "Sign in interactively, use a Docker personal access token, or supply an access token from your application."
keywords: "cloud sandboxes, sandboxes api, authenticate to docker"
@z

@x
Choose an authenticator when your application creates its client. The client obtains a credential when its first request needs one, then uses it for requests to Docker Cloud Sandboxes. You need an [installed SDK](https://docs.docker.com/ai/sandboxes-api/install/) and a Docker account with Cloud Sandboxes access.
@y
Choose an authenticator when your application creates its client. The client obtains a credential when its first request needs one, then uses it for requests to Docker Cloud Sandboxes. You need an [installed SDK](https://docs.docker.com/ai/sandboxes-api/install/) and a Docker account with Cloud Sandboxes access.
@z

@x
Choose interactive sign-in when running an example yourself. Use a personal access token (PAT) for a service or CI job. If your application already manages Docker access tokens, pass a token or a token provider.
@y
Choose interactive sign-in when running an example yourself. Use a personal access token (PAT) for a service or CI job. If your application already manages Docker access tokens, pass a token or a token provider.
@z

@x
## Sign in interactively {#1-sign-in-interactively}
@y
## Sign in interactively {#1-sign-in-interactively}
@z

@x
The helper creates a client with an OAuth authenticator. Call an SDK method, such as listing sandboxes, to start sign-in. Open the printed verification URL in your browser and enter the displayed code. Sign in to your Docker account and approve the request. The SDK request proceeds when verification succeeds; a denied or expired request fails. The [complete program](run-a-complete-example.md) shows this flow from start to finish.
@y
The helper creates a client with an OAuth authenticator. Call an SDK method, such as listing sandboxes, to start sign-in. Open the printed verification URL in your browser and enter the displayed code. Sign in to your Docker account and approve the request. The SDK request proceeds when verification succeeds; a denied or expired request fails. The [complete program](run-a-complete-example.md) shows this flow from start to finish.
@z

@x
The request that starts sign-in also sets its deadline. Pass `{ timeoutMs: 300_000 }` as that call's request options to give yourself five minutes to sign in and complete the request.
@y
The request that starts sign-in also sets its deadline. Pass `{ timeoutMs: 300_000 }` as that call's request options to give yourself five minutes to sign in and complete the request.
@z

@x
The SDK holds credentials in memory by default and refreshes the access token as later requests need it, while refresh credentials remain valid. Close the client when finished to release SDK-owned resources. This does not delete sandboxes or revoke Docker sign-in.
@y
The SDK holds credentials in memory by default and refreshes the access token as later requests need it, while refresh credentials remain valid. Close the client when finished to release SDK-owned resources. This does not delete sandboxes or revoke Docker sign-in.
@z

@x
You can pass the same authenticator to several clients to reuse their sign-in. Closing one client leaves the authenticator usable by the others.
@y
You can pass the same authenticator to several clients to reuse their sign-in. Closing one client leaves the authenticator usable by the others.
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
const auth = oauth({
  onVerification: ({ verificationUri, userCode }) => {
    console.log(`Open ${verificationUri} and enter ${userCode}`);
  },
});
return new Sandboxes({ auth });
```
@y
```typescript
const auth = oauth({
  onVerification: ({ verificationUri, userCode }) => {
    console.log(`Open ${verificationUri} and enter ${userCode}`);
  },
});
return new Sandboxes({ auth });
```
@z

@x
<details>
<summary>Complete TypeScript example: cloudauth/login.ts</summary>
@y
<details>
<summary>Complete TypeScript example: cloudauth/login.ts</summary>
@z

@x
```typescript
import {
  fileOAuthCredentialStore,
  oauth,
  Sandboxes,
} from '@docker/sandboxes';
@y
```typescript
import {
  fileOAuthCredentialStore,
  oauth,
  Sandboxes,
} from '@docker/sandboxes';
@z

@x
export function login() {
  const auth = oauth({
    onVerification: ({ verificationUri, userCode }) => {
      console.log(`Open ${verificationUri} and enter ${userCode}`);
    },
  });
  return new Sandboxes({ auth });
}
@y
export function login() {
  const auth = oauth({
    onVerification: ({ verificationUri, userCode }) => {
      console.log(`Open ${verificationUri} and enter ${userCode}`);
    },
  });
  return new Sandboxes({ auth });
}
@z

@x
export function loginWithSavedCredentials(path: string) {
  const storedAuth = oauth({
    store: fileOAuthCredentialStore({ path }),
    onVerification: ({ verificationUri, userCode }) => {
      console.log(`Open ${verificationUri} and enter ${userCode}`);
    },
  });
  return new Sandboxes({ auth: storedAuth });
}
```
@y
export function loginWithSavedCredentials(path: string) {
  const storedAuth = oauth({
    store: fileOAuthCredentialStore({ path }),
    onVerification: ({ verificationUri, userCode }) => {
      console.log(`Open ${verificationUri} and enter ${userCode}`);
    },
  });
  return new Sandboxes({ auth: storedAuth });
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
## Optional: save credentials between runs {#2-optional-save-credentials-between-runs}
@y
## Optional: save credentials between runs {#2-optional-save-credentials-between-runs}
@z

@x
To avoid signing in each time a Node.js program starts, expand the complete example above and use `loginWithSavedCredentials(path)`. It passes `fileOAuthCredentialStore` to the OAuth authenticator.
@y
To avoid signing in each time a Node.js program starts, expand the complete example above and use `loginWithSavedCredentials(path)`. It passes `fileOAuthCredentialStore` to the OAuth authenticator.
@z

@x
The file store supports Node.js on POSIX systems, not browsers or Windows. Its file contains plaintext access and refresh credentials: keep it out of source control, use a private directory, and do not share it between processes. For a keychain or secret manager, implement `OAuthCredentialStore` with `load` and `save` instead.
@y
The file store supports Node.js on POSIX systems, not browsers or Windows. Its file contains plaintext access and refresh credentials: keep it out of source control, use a private directory, and do not share it between processes. For a keychain or secret manager, implement `OAuthCredentialStore` with `load` and `save` instead.
@z

@x
Remove the stored credentials when your application no longer needs them. Your application owns that removal; closing a client does not remove the file or revoke the credentials.
@y
Remove the stored credentials when your application no longer needs them. Your application owns that removal; closing a client does not remove the file or revoke the credentials.
@z

@x
## Use a personal access token {#3-use-a-personal-access-token}
@y
## Use a personal access token {#3-use-a-personal-access-token}
@z

@x
Create a [Docker personal access token](https://docs.docker.com/security/access-tokens/) for the Docker account your application will use. Provide your Docker username and PAT through your application's secret manager or environment, then pass them to the SDK's PAT authentication option.
@y
Create a [Docker personal access token](https://docs.docker.com/security/access-tokens/) for the Docker account your application will use. Provide your Docker username and PAT through your application's secret manager or environment, then pass them to the SDK's PAT authentication option.
@z

@x
The SDK exchanges the PAT for a short-lived access token and repeats the exchange when needed. Supply the PAT as a PAT credential, not as an access token or an Authorization header. A revoked or expired PAT requires a replacement credential.
@y
The SDK exchanges the PAT for a short-lived access token and repeats the exchange when needed. Supply the PAT as a PAT credential, not as an access token or an Authorization header. A revoked or expired PAT requires a replacement credential.
@z

@x
Managed OAuth and PAT authentication use the default Docker service address. Use a caller-supplied access token or provider when you need to override that address.
@y
Managed OAuth and PAT authentication use the default Docker service address. Use a caller-supplied access token or provider when you need to override that address.
@z

@x
Your PAT needs the `sandbox:use` permission. Select it when you create the token, at `https://app.docker.com/accounts/[username]/settings/personal-access-tokens`.
@y
Your PAT needs the `sandbox:use` permission. Select it when you create the token, at `https://app.docker.com/accounts/[username]/settings/personal-access-tokens`.
@z

@x
Keep the PAT on the machine running your application. Do not put it in a sandbox's environment, source code, or logs.
@y
Keep the PAT on the machine running your application. Do not put it in a sandbox's environment, source code, or logs.
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
return new Sandboxes({
  auth: pat({ username, personalAccessToken }),
});
```
@y
```typescript
return new Sandboxes({
  auth: pat({ username, personalAccessToken }),
});
```
@z

@x
<details>
<summary>Complete TypeScript example: cloudauth/pat.ts</summary>
@y
<details>
<summary>Complete TypeScript example: cloudauth/pat.ts</summary>
@z

@x
```typescript
import { pat, Sandboxes } from '@docker/sandboxes';
@y
```typescript
import { pat, Sandboxes } from '@docker/sandboxes';
@z

@x
export function connectWithPAT(
  username: string,
  personalAccessToken: string,
) {
  return new Sandboxes({
    auth: pat({ username, personalAccessToken }),
  });
}
```
@y
export function connectWithPAT(
  username: string,
  personalAccessToken: string,
) {
  return new Sandboxes({
    auth: pat({ username, personalAccessToken }),
  });
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
## Supply an access token {#4-supply-an-access-token}
@y
## Supply an access token {#4-supply-an-access-token}
@z

@x
If you already hold a Docker access-token JWT, pass it as the client's access token. The SDK sends it as a bearer credential. A raw PAT is not an access-token JWT.
@y
If you already hold a Docker access-token JWT, pass it as the client's access token. The SDK sends it as a bearer credential. A raw PAT is not an access-token JWT.
@z

@x
A fixed token has no refresh credential. Once it expires, create a client with a fresh token, or use the provider option below. The example accepts a service URL for applications that need an override; the default is `https://connect.docker.com/sandboxes`.
@y
A fixed token has no refresh credential. Once it expires, create a client with a fresh token, or use the provider option below. The example accepts a service URL for applications that need an override; the default is `https://connect.docker.com/sandboxes`.
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
return new Sandboxes({
  baseUrl: endpoint,
  auth: bearer(accessToken),
});
```
@y
```typescript
return new Sandboxes({
  baseUrl: endpoint,
  auth: bearer(accessToken),
});
```
@z

@x
<details>
<summary>Complete TypeScript example: cloudauth/connect.ts</summary>
@y
<details>
<summary>Complete TypeScript example: cloudauth/connect.ts</summary>
@z

@x
```typescript
import { bearer, Sandboxes } from '@docker/sandboxes';
@y
```typescript
import { bearer, Sandboxes } from '@docker/sandboxes';
@z

@x
export function connectToCloud(endpoint: string, accessToken: string) {
  return new Sandboxes({
    baseUrl: endpoint,
    auth: bearer(accessToken),
  });
}
```
@y
export function connectToCloud(endpoint: string, accessToken: string) {
  return new Sandboxes({
    baseUrl: endpoint,
    auth: bearer(accessToken),
  });
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
## Supply a token provider {#5-supply-a-token-provider}
@y
## Supply a token provider {#5-supply-a-token-provider}
@z

@x
Pass a callback that obtains a current Docker access token from your credential system. The callback returns the token string; your application owns its acquisition, storage, and renewal. Do not return an expired token.
@y
Pass a callback that obtains a current Docker access token from your credential system. The callback returns the token string; your application owns its acquisition, storage, and renewal. Do not return an expired token.
@z

@x
Use one credential source per client. The SDK does not read environment variables or credentials saved by Docker command-line tools automatically.
@y
Use one credential source per client. The SDK does not read environment variables or credentials saved by Docker command-line tools automatically.
@z

@x
Authentication errors mean the credential is missing, rejected, or expired. Sign in again or replace the credential. A permission error means the account cannot perform the requested action; check its Cloud Sandboxes access and resource permissions before retrying.
@y
Authentication errors mean the credential is missing, rejected, or expired. Sign in again or replace the credential. A permission error means the account cannot perform the requested action; check its Cloud Sandboxes access and resource permissions before retrying.
@z

@x
When you run commands or transfer files through a sandbox handle, the SDK obtains a credential scoped to that sandbox. You do not need to copy your account token into a second client.
@y
When you run commands or transfer files through a sandbox handle, the SDK obtains a credential scoped to that sandbox. You do not need to copy your account token into a second client.
@z

@x
The client reuses valid sandbox credentials. Concurrent requests share acquisition only within the same management client and for the same resolved Docker credential, sandbox endpoint and permissions. A later request renews the credential shortly before expiry. Renewal happens when needed, not on a five-minute timer, and does not change a request or stream already in progress.
@y
The client reuses valid sandbox credentials. Concurrent requests share acquisition only within the same management client and for the same resolved Docker credential, sandbox endpoint and permissions. A later request renews the credential shortly before expiry. Renewal happens when needed, not on a five-minute timer, and does not change a request or stream already in progress.
@z

@x
Docker sign-in is separate from an agent's provider credential. To let an agent call its model provider, follow [Use secrets in a sandbox](get-a-stored-secret-into-a-sandbox.md).
@y
Docker sign-in is separate from an agent's provider credential. To let an agent call its model provider, follow [Use secrets in a sandbox](get-a-stored-secret-into-a-sandbox.md).
@z

@x
Next, [run a complete program](run-a-complete-example.md) that signs in and launches a kit.
@y
Next, [run a complete program](run-a-complete-example.md) that signs in and launches a kit.
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
return new Sandboxes({
  auth: { getAccessToken: tokenProvider },
});
```
@y
```typescript
return new Sandboxes({
  auth: { getAccessToken: tokenProvider },
});
```
@z

@x
<details>
<summary>Complete TypeScript example: cloudauth/provider.ts</summary>
@y
<details>
<summary>Complete TypeScript example: cloudauth/provider.ts</summary>
@z

@x
```typescript
import { Sandboxes, type Authenticator } from '@docker/sandboxes';
@y
```typescript
import { Sandboxes, type Authenticator } from '@docker/sandboxes';
@z

@x
export function connectWithTokenProvider(
  tokenProvider: Authenticator['getAccessToken'],
) {
  return new Sandboxes({
    auth: { getAccessToken: tokenProvider },
  });
}
```
@y
export function connectWithTokenProvider(
  tokenProvider: Authenticator['getAccessToken'],
) {
  return new Sandboxes({
    auth: { getAccessToken: tokenProvider },
  });
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
