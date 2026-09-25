%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Authentication and authorization
description: Authenticate requests to the Docker Sandboxes API with access tokens and learn which permissions your application needs.
keywords: docker sandboxes API authentication, sandbox authorization, bearer token, sandbox permissions, owner scope
@y
title: Authentication and authorization
description: Authenticate requests to the Docker Sandboxes API with access tokens and learn which permissions your application needs.
keywords: docker sandboxes API authentication, sandbox authorization, bearer token, sandbox permissions, owner scope
@z

@x
> [!NOTE]
> The Docker Sandboxes API and SDK are experimental. Features, interfaces,
> and behavior may change.
@y
> [!NOTE]
> The Docker Sandboxes API and SDK are experimental. Features, interfaces,
> and behavior may change.
@z

@x
Use browser sign-in when running an application interactively, or a personal
access token (PAT) for automation. The SDK obtains short-lived access tokens
and renews them as needed.
@y
Use browser sign-in when running an application interactively, or a personal
access token (PAT) for automation. The SDK obtains short-lived access tokens
and renews them as needed.
@z

@x
You need an active [Docker Agentic Platform subscription](/manuals/agentic-platform/signup.md#activate-cloud-access).
Authenticate with the Docker account you used to subscribe.
@y
You need an active [Docker Agentic Platform subscription](manuals/agentic-platform/signup.md#activate-cloud-access).
Authenticate with the Docker account you used to subscribe.
@z

@x
## Sign in through your browser
@y
## Sign in through your browser
@z

@x
Use the OAuth helper to sign in with your Docker account:
@y
Use the OAuth helper to sign in with your Docker account:
@z

@x
```typescript
import { oauth, Sandboxes } from '@docker/sandboxes';
@y
```typescript
import { oauth, Sandboxes } from '@docker/sandboxes';
@z

@x
const auth = oauth({
  onVerification({ verificationUriComplete, verificationUri, userCode }) {
    console.log(`Open ${verificationUriComplete ?? verificationUri}`);
    console.log(`Verification code: ${userCode}`);
  },
});
await auth.getAccessToken();
const client = new Sandboxes({ auth });
```
@y
const auth = oauth({
  onVerification({ verificationUriComplete, verificationUri, userCode }) {
    console.log(`Open ${verificationUriComplete ?? verificationUri}`);
    console.log(`Verification code: ${userCode}`);
  },
});
await auth.getAccessToken();
const client = new Sandboxes({ auth });
```
@z

@x
Open the printed URL and complete sign-in. Browser sign-in supports single
sign-on and two-factor authentication. The `getAccessToken()` call waits for
you to finish before the program continues.
@y
Open the printed URL and complete sign-in. Browser sign-in supports single
sign-on and two-factor authentication. The `getAccessToken()` call waits for
you to finish before the program continues.
@z

@x
The SDK keeps credentials in memory and refreshes them while your application
runs. With the default configuration, you sign in again each time you start
the application. SDK sign-in is separate from `docker login` and `sbx login`.
@y
The SDK keeps credentials in memory and refreshes them while your application
runs. With the default configuration, you sign in again each time you start
the application. SDK sign-in is separate from `docker login` and `sbx login`.
@z

@x
## Authenticate automation with a PAT
@y
## Authenticate automation with a PAT
@z

@x
Use a [personal access token](/manuals/security/access-tokens/personal-access-tokens.md)
for CI jobs and unattended applications. When creating the token, select the
`sandbox:use` permission in your Docker account's personal access token
settings. Registry permissions alone don't grant Cloud Sandboxes access.
@y
Use a [personal access token](manuals/security/access-tokens/personal-access-tokens.md)
for CI jobs and unattended applications. When creating the token, select the
`sandbox:use` permission in your Docker account's personal access token
settings. Registry permissions alone don't grant Cloud Sandboxes access.
@z

@x
Provide your Docker ID and PAT to the SDK. For example, read them from your
application's environment:
@y
Provide your Docker ID and PAT to the SDK. For example, read them from your
application's environment:
@z

@x
```typescript
import { pat, Sandboxes } from '@docker/sandboxes';
@y
```typescript
import { pat, Sandboxes } from '@docker/sandboxes';
@z

@x
const username = process.env.DOCKER_ID;
const personalAccessToken = process.env.DOCKER_PAT;
if (!username || !personalAccessToken) {
  throw new Error('Set DOCKER_ID and DOCKER_PAT');
}
@y
const username = process.env.DOCKER_ID;
const personalAccessToken = process.env.DOCKER_PAT;
if (!username || !personalAccessToken) {
  throw new Error('Set DOCKER_ID and DOCKER_PAT');
}
@z

@x
const client = new Sandboxes({
  auth: pat({ username, personalAccessToken }),
});
```
@y
const client = new Sandboxes({
  auth: pat({ username, personalAccessToken }),
});
```
@z

@x
The SDK exchanges the PAT for a short-lived access token and repeats the
exchange when needed. If the PAT is invalid or revoked, authentication fails.
@y
The SDK exchanges the PAT for a short-lived access token and repeats the
exchange when needed. If the PAT is invalid or revoked, authentication fails.
@z

@x
Store the PAT in your CI or application's secret store and keep it out of
source control and logs.
@y
Store the PAT in your CI or application's secret store and keep it out of
source control and logs.
@z

@x
## Authenticate agents
@y
## Authenticate agents
@z

@x
An AI agent needs credentials for its model provider in addition to your
Docker sign-in. For example, Claude Code can use an Anthropic API key, and
Codex can use an OpenAI API key.
@y
An AI agent needs credentials for its model provider in addition to your
Docker sign-in. For example, Claude Code can use an Anthropic API key, and
Codex can use an OpenAI API key.
@z

@x
Store the provider key as a secret and attach it when creating the sandbox.
For example, with an authenticated `client` and an Anthropic API key in
`providerKey`:
@y
Store the provider key as a secret and attach it when creating the sandbox.
For example, with an authenticated `client` and an Anthropic API key in
`providerKey`:
@z

@x
```typescript
const secret = await client.secrets.create({
  displayName: 'anthropic-key',
  serviceType: 'anthropic',
  token: { value: providerKey },
});
@y
```typescript
const secret = await client.secrets.create({
  displayName: 'anthropic-key',
  serviceType: 'anthropic',
  token: { value: providerKey },
});
@z

@x
const sandbox = await client.kits.launchAndWait('claude', {
  storage: { secrets: [secret.name] },
});
```
@y
const sandbox = await client.kits.launchAndWait('claude', {
  storage: { secrets: [secret.name] },
});
```
@z

@x
The secret is attached before the agent runs. Keep the key out of command
arguments, source files, and plain environment variables inside the sandbox.
@y
The secret is attached before the agent runs. Keep the key out of command
arguments, source files, and plain environment variables inside the sandbox.
@z

@x
## Resource access and permissions
@y
## Resource access and permissions
@z

@x
Your credentials determine which account's resources you can access. Cloud
uses them to identify the account, so leave the optional `parent` field empty
in requests.
@y
Your credentials determine which account's resources you can access. Cloud
uses them to identify the account, so leave the optional `parent` field empty
in requests.
@z

@x
Each request also checks whether you have permission for the action on the
target resource. For example, creating a sandbox requires `sandboxesCreate`,
reading it requires `sandboxesRead`, and deleting it requires
`sandboxesDelete`.
@y
Each request also checks whether you have permission for the action on the
target resource. For example, creating a sandbox requires `sandboxesCreate`,
reading it requires `sandboxesRead`, and deleting it requires
`sandboxesDelete`.
@z

@x
Account permissions also control access to optional features. See
[Supported Cloud options](concepts.md#choose-supported-cloud-options).
@y
Account permissions also control access to optional features. See
[Supported Cloud options](concepts.md#choose-supported-cloud-options).
@z

@x
## Authenticate direct API requests
@y
## Authenticate direct API requests
@z

@x
If you call the REST API without the SDK, obtain and renew access tokens in
your application. Exchange your Docker ID and a PAT with `sandbox:use`
permission using the [Docker Hub authentication API](/reference/api/hub/latest/operations/AuthCreateAccessToken/):
@y
If you call the REST API without the SDK, obtain and renew access tokens in
your application. Exchange your Docker ID and a PAT with `sandbox:use`
permission using the [Docker Hub authentication API](__SUBDIR__/reference/api/hub/latest/operations/AuthCreateAccessToken/):
@z

@x
```console
$ ACCESS_TOKEN=$(curl --silent --show-error --fail --request POST \
  --url https://hub.docker.com/v2/auth/token \
  --header "Content-Type: application/json" \
  --data '{"identifier":"<DOCKER_ID>","secret":"<PERSONAL_ACCESS_TOKEN>"}' \
  | jq -er '.access_token')
```
@y
```console
$ ACCESS_TOKEN=$(curl --silent --show-error --fail --request POST \
  --url https://hub.docker.com/v2/auth/token \
  --header "Content-Type: application/json" \
  --data '{"identifier":"<DOCKER_ID>","secret":"<PERSONAL_ACCESS_TOKEN>"}' \
  | jq -er '.access_token')
```
@z

@x
Send the returned access token in the `Authorization` header when calling
`https://connect.docker.com/sandboxes`:
@y
Send the returned access token in the `Authorization` header when calling
`https://connect.docker.com/sandboxes`:
@z

@x
```http
Authorization: Bearer <access_token>
```
@y
```http
Authorization: Bearer <access_token>
```
@z

@x
The Sandboxes API accepts the access token returned by the exchange, not the
PAT itself.
@y
The Sandboxes API accepts the access token returned by the exchange, not the
PAT itself.
@z

@x
If you manage access tokens but use the SDK for requests, import `bearer` from
`@docker/sandboxes` and configure the client with `auth: bearer(accessToken)`.
Create a client with a fresh token when the previous token expires.
@y
If you manage access tokens but use the SDK for requests, import `bearer` from
`@docker/sandboxes` and configure the client with `auth: bearer(accessToken)`.
Create a client with a fresh token when the previous token expires.
@z

@x
## Authenticate sandbox requests
@y
## Authenticate sandbox requests
@z

@x
The SDK handles authentication when you run commands or transfer files using
a sandbox's methods. It obtains a token scoped to that sandbox and the
operation, then reuses or renews the token as needed.
@y
The SDK handles authentication when you run commands or transfer files using
a sandbox's methods. It obtains a token scoped to that sandbox and the
operation, then reuses or renews the token as needed.
@z

@x
For example, running a command requires `sandboxesExec` and obtaining its
token requires `sandboxesCredential`. Your account must have both permissions.
@y
For example, running a command requires `sandboxesExec` and obtaining its
token requires `sandboxesCredential`. Your account must have both permissions.
@z

@x
If you call a sandbox endpoint directly, use a token issued for that sandbox.
Don't send the Docker Hub token used for management requests to a sandbox
endpoint. See [Management and sandbox endpoints](concepts.md#management-and-sandbox-endpoints).
@y
If you call a sandbox endpoint directly, use a token issued for that sandbox.
Don't send the Docker Hub token used for management requests to a sandbox
endpoint. See [Management and sandbox endpoints](concepts.md#management-and-sandbox-endpoints).
@z
