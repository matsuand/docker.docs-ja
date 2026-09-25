%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Expose a port from a cloud sandbox"
linkTitle: "Expose a port from a cloud sandbox"
description: "Publish a TCP port that a program inside a cloud sandbox listens on, read back the URL that reaches it, list the sandbox's published ports, and withdraw the publication."
keywords: "cloud sandboxes, sandboxes api, expose a port from a cloud sandbox"
@y
title: "Expose a port from a cloud sandbox"
linkTitle: "Expose a port from a cloud sandbox"
description: "Publish a TCP port that a program inside a cloud sandbox listens on, read back the URL that reaches it, list the sandbox's published ports, and withdraw the publication."
keywords: "cloud sandboxes, sandboxes api, expose a port from a cloud sandbox"
@z

@x
Reach a web application running inside a sandbox through an HTTPS URL. Publishing creates a route to the application; it does not start the application.
@y
Reach a web application running inside a sandbox through an HTTPS URL. Publishing creates a route to the application; it does not start the application.
@z

@x
You need an [authenticated client](connect-to-cloud-with-a-bearer-token.md), the sandbox name, and an HTTP application listening on the port you will publish. Bind the application to an address reachable inside the sandbox, such as `0.0.0.0`.
@y
You need an [authenticated client](connect-to-cloud-with-a-bearer-token.md), the sandbox name, and an HTTP application listening on the port you will publish. Bind the application to an address reachable inside the sandbox, such as `0.0.0.0`.
@z

@x
## Publish the application's port {#1-publish-the-application-s-port}
@y
## Publish the application's port {#1-publish-the-application-s-port}
@z

@x
Supply the sandbox name and the application's port number. The example uses TCP. Use the URL returned by the service rather than constructing a hostname.
@y
Supply the sandbox name and the application's port number. The example uses TCP. Use the URL returned by the service rather than constructing a hostname.
@z

@x
This is HTTP application access, not a general-purpose TCP tunnel. Docker account authentication does not protect the application URL. Configure authentication in your application before exposing sensitive data, and never send your Docker account token to that URL.
@y
This is HTTP application access, not a general-purpose TCP tunnel. Docker account authentication does not protect the application URL. Configure authentication in your application before exposing sensitive data, and never send your Docker account token to that URL.
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
return sandbox.ports.create(
  { number, protocol: 'tcp' },
  { idempotencyKey: requestId },
);
```
@y
```typescript
return sandbox.ports.create(
  { number, protocol: 'tcp' },
  { idempotencyKey: requestId },
);
```
@z

@x
<details>
<summary>Complete TypeScript example: ports/publish.ts</summary>
@y
<details>
<summary>Complete TypeScript example: ports/publish.ts</summary>
@z

@x
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@z

@x
export async function createPort(
  client: Sandboxes,
  sandboxName: string,
  number: number,
  requestId: string,
) {
  const sandbox = await client.get(sandboxName);
  return sandbox.ports.create(
    { number, protocol: 'tcp' },
    { idempotencyKey: requestId },
  );
}
```
@y
export async function createPort(
  client: Sandboxes,
  sandboxName: string,
  number: number,
  requestId: string,
) {
  const sandbox = await client.get(sandboxName);
  return sandbox.ports.create(
    { number, protocol: 'tcp' },
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
## List published ports {#2-list-published-ports}
@y
## List published ports {#2-list-published-ports}
@z

@x
Read the sandbox's port collection to find existing publications and their URLs. Check the application's readiness separately: a published route does not prove the application has started.
@y
Read the sandbox's port collection to find existing publications and their URLs. Check the application's readiness separately: a published route does not prove the application has started.
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
return (await sandbox.ports.list()).published ?? [];
```
@y
```typescript
return (await sandbox.ports.list()).published ?? [];
```
@z

@x
<details>
<summary>Complete TypeScript example: ports/list.ts</summary>
@y
<details>
<summary>Complete TypeScript example: ports/list.ts</summary>
@z

@x
```typescript
import type { Sandbox } from '@docker/sandboxes';
@y
```typescript
import type { Sandbox } from '@docker/sandboxes';
@z

@x
export async function listPorts(sandbox: Sandbox) {
  return (await sandbox.ports.list()).published ?? [];
}
```
@y
export async function listPorts(sandbox: Sandbox) {
  return (await sandbox.ports.list()).published ?? [];
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
## Withdraw a publication {#3-withdraw-a-publication}
@y
## Withdraw a publication {#3-withdraw-a-publication}
@z

@x
Delete the published port when access is no longer needed. This removes the route but leaves the application process running.
@y
Delete the published port when access is no longer needed. This removes the route but leaves the application process running.
@z

@x
Stopping the sandbox does not remove its port publications. Deleting the sandbox does.
@y
Stopping the sandbox does not remove its port publications. Deleting the sandbox does.
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
await port.delete();
```
@y
```typescript
await port.delete();
```
@z

@x
<details>
<summary>Complete TypeScript example: ports/unpublish.ts</summary>
@y
<details>
<summary>Complete TypeScript example: ports/unpublish.ts</summary>
@z

@x
```typescript
import type { Port } from '@docker/sandboxes';
@y
```typescript
import type { Port } from '@docker/sandboxes';
@z

@x
export async function deletePort(port: Port) {
  await port.delete();
}
```
@y
export async function deletePort(port: Port) {
  await port.delete();
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
