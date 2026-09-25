%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Give a sandbox an MCP gateway"
linkTitle: "Give a sandbox an MCP gateway"
description: "Configure MCP tools when launching a kit, then inspect, authorize, and manage the gateway."
keywords: "cloud sandboxes, sandboxes api, give a sandbox an mcp gateway"
@y
title: "Give a sandbox an MCP gateway"
linkTitle: "Give a sandbox an MCP gateway"
description: "Configure MCP tools when launching a kit, then inspect, authorize, and manage the gateway."
keywords: "cloud sandboxes, sandboxes api, give a sandbox an mcp gateway"
@z

@x
Give an agent access to external tools through MCP, the Model Context Protocol. A gateway presents several tool servers through one endpoint.
@y
Give an agent access to external tools through MCP, the Model Context Protocol. A gateway presents several tool servers through one endpoint.
@z

@x
Use an [authenticated client](connect-to-cloud-with-a-bearer-token.md) and server IDs available to your account. Choose servers from the [Docker MCP Catalog](https://docs.docker.com/ai/mcp-catalog-and-toolkit/catalog/) and use their catalog IDs, not display names invented by your application. Provider sign-in and permission to use each tool may be required.
@y
Use an [authenticated client](connect-to-cloud-with-a-bearer-token.md) and server IDs available to your account. Choose servers from the [Docker MCP Catalog](https://docs.docker.com/ai/mcp-catalog-and-toolkit/catalog/) and use their catalog IDs, not display names invented by your application. Provider sign-in and permission to use each tool may be required.
@z

@x
## Configure MCP when launching a kit {#1-configure-mcp-when-launching-a-kit}
@y
## Configure MCP when launching a kit {#1-configure-mcp-when-launching-a-kit}
@z

@x
Supply the server IDs in the kit's MCP options when creating the sandbox. This makes gateway configuration available when the agent starts. Attach any model-provider secrets the agent needs separately.
@y
Supply the server IDs in the kit's MCP options when creating the sandbox. This makes gateway configuration available when the agent starts. Attach any model-provider secrets the agent needs separately.
@z

@x
Use this creation-time path for Cloud Sandboxes. Adding a gateway after creation can be rejected for a governed sandbox; recreating it with MCP configured avoids that limitation.
@y
Use this creation-time path for Cloud Sandboxes. Adding a gateway after creation can be rejected for a governed sandbox; recreating it with MCP configured avoids that limitation.
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
const sandbox = await client.kits.launch(
  kitName,
  {
    resources: { cpus: 2, memoryMib: 4096 },
    mcp: { servers, static: true },
    storage: { secrets },
  },
  { timeoutMs: 300_000 },
);
return sandbox.waitUntilRunning();
```
@y
```typescript
const sandbox = await client.kits.launch(
  kitName,
  {
    resources: { cpus: 2, memoryMib: 4096 },
    mcp: { servers, static: true },
    storage: { secrets },
  },
  { timeoutMs: 300_000 },
);
return sandbox.waitUntilRunning();
```
@z

@x
<details>
<summary>Complete TypeScript example: mcp/create.ts</summary>
@y
<details>
<summary>Complete TypeScript example: mcp/create.ts</summary>
@z

@x
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@z

@x
export async function launchMcpKit(
  client: Sandboxes,
  kitName: string,
  servers: string[],
  secrets: string[] = [],
) {
  const sandbox = await client.kits.launch(
    kitName,
    {
      resources: { cpus: 2, memoryMib: 4096 },
      mcp: { servers, static: true },
      storage: { secrets },
    },
    { timeoutMs: 300_000 },
  );
  return sandbox.waitUntilRunning();
}
```
@y
export async function launchMcpKit(
  client: Sandboxes,
  kitName: string,
  servers: string[],
  secrets: string[] = [],
) {
  const sandbox = await client.kits.launch(
    kitName,
    {
      resources: { cpus: 2, memoryMib: 4096 },
      mcp: { servers, static: true },
      storage: { secrets },
    },
    { timeoutMs: 300_000 },
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
## Alternatively, start a gateway after creation {#2-alternatively-start-a-gateway-after-creation}
@y
## Alternatively, start a gateway after creation {#2-alternatively-start-a-gateway-after-creation}
@z

@x
For an existing sandbox that supports gateway creation, use its MCP collection and wait until the gateway is ready. The sandbox must already have the required Docker credential. If startup is refused, do not assume that retrying will add missing credentials or change its policy configuration.
@y
For an existing sandbox that supports gateway creation, use its MCP collection and wait until the gateway is ready. The sandbox must already have the required Docker credential. If startup is refused, do not assume that retrying will add missing credentials or change its policy configuration.
@z

@x
Inspect the returned server list and skipped-server reasons. A ready gateway does not guarantee that every requested server was accepted.
@y
Inspect the returned server list and skipped-server reasons. A ready gateway does not guarantee that every requested server was accepted.
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
const gateway = await sandbox.mcp.start({ servers, static: true });
return gateway.waitUntilReady({ timeoutMs: 120_000 });
```
@y
```typescript
const gateway = await sandbox.mcp.start({ servers, static: true });
return gateway.waitUntilReady({ timeoutMs: 120_000 });
```
@z

@x
<details>
<summary>Complete TypeScript example: mcp/start.ts</summary>
@y
<details>
<summary>Complete TypeScript example: mcp/start.ts</summary>
@z

@x
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@z

@x
export async function startMcpGateway(
  client: Sandboxes,
  name: string,
  servers: string[],
) {
  const sandbox = await client.get(name.replace(/\/mcp-gateway$/, ''));
  const gateway = await sandbox.mcp.start({ servers, static: true });
  return gateway.waitUntilReady({ timeoutMs: 120_000 });
}
```
@y
export async function startMcpGateway(
  client: Sandboxes,
  name: string,
  servers: string[],
) {
  const sandbox = await client.get(name.replace(/\/mcp-gateway$/, ''));
  const gateway = await sandbox.mcp.start({ servers, static: true });
  return gateway.waitUntilReady({ timeoutMs: 120_000 });
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
## Read the gateway address {#3-read-the-gateway-address}
@y
## Read the gateway address {#3-read-the-gateway-address}
@z

@x
Get the gateway and use its returned URL only when it is ready. The example checks readiness before returning the URL.
@y
Get the gateway and use its returned URL only when it is ready. The example checks readiness before returning the URL.
@z

@x
Keep gateway credentials private. The gateway's address and the published URL of an application inside the sandbox are different endpoints.
@y
Keep gateway credentials private. The gateway's address and the published URL of an application inside the sandbox are different endpoints.
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
const gateway = await sandbox.mcp.get();
if (gateway.state !== 'ready' || !gateway.url)
  throw new Error('MCP gateway is not ready');
return gateway.url;
```
@y
```typescript
const gateway = await sandbox.mcp.get();
if (gateway.state !== 'ready' || !gateway.url)
  throw new Error('MCP gateway is not ready');
return gateway.url;
```
@z

@x
<details>
<summary>Complete TypeScript example: mcp/read.ts</summary>
@y
<details>
<summary>Complete TypeScript example: mcp/read.ts</summary>
@z

@x
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@z

@x
export async function readGatewayUrl(client: Sandboxes, name: string) {
  const sandbox = await client.get(name.replace(/\/mcp-gateway$/, ''));
  const gateway = await sandbox.mcp.get();
  if (gateway.state !== 'ready' || !gateway.url)
    throw new Error('MCP gateway is not ready');
  return gateway.url;
}
```
@y
export async function readGatewayUrl(client: Sandboxes, name: string) {
  const sandbox = await client.get(name.replace(/\/mcp-gateway$/, ''));
  const gateway = await sandbox.mcp.get();
  if (gateway.state !== 'ready' || !gateway.url)
    throw new Error('MCP gateway is not ready');
  return gateway.url;
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
## Add a catalog server {#4-add-a-catalog-server}
@y
## Add a catalog server {#4-add-a-catalog-server}
@z

@x
Add a server to a ready, writable gateway. Adding a server already present does not add a second copy. A shared gateway attached by URL cannot be modified through this sandbox.
@y
Add a server to a ready, writable gateway. Adding a server already present does not add a second copy. A shared gateway attached by URL cannot be modified through this sandbox.
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
await sandbox.mcp.servers.add({ server });
```
@y
```typescript
await sandbox.mcp.servers.add({ server });
```
@z

@x
<details>
<summary>Complete TypeScript example: mcp/add.ts</summary>
@y
<details>
<summary>Complete TypeScript example: mcp/add.ts</summary>
@z

@x
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@z

@x
export async function addMcpGatewayServer(
  client: Sandboxes,
  name: string,
  server: string,
) {
  const sandbox = await client.get(name.replace(/\/mcp-gateway$/, ''));
  await sandbox.mcp.servers.add({ server });
}
```
@y
export async function addMcpGatewayServer(
  client: Sandboxes,
  name: string,
  server: string,
) {
  const sandbox = await client.get(name.replace(/\/mcp-gateway$/, ''));
  await sandbox.mcp.servers.add({ server });
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
## Complete a server's sign-in {#5-complete-a-server-s-sign-in}
@y
## Complete a server's sign-in {#5-complete-a-server-s-sign-in}
@z

@x
Start authorization for a server that requires user sign-in. Present its authorization URL to the user, then read the authorization resource to check progress. The example performs the start and read calls; your application decides how to display and poll the flow.
@y
Start authorization for a server that requires user sign-in. Present its authorization URL to the user, then read the authorization resource to check progress. The example performs the start and read calls; your application decides how to display and poll the flow.
@z

@x
Only an authorized result means the credential is ready. Keep the authorization identity so a later attempt is not mistaken for completion of an earlier one. Request reauthorization only when you intend a new sign-in.
@y
Only an authorized result means the credential is ready. Keep the authorization identity so a later attempt is not mistaken for completion of an earlier one. Request reauthorization only when you intend a new sign-in.
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
return client.mcp.authorizations.authorize({
  server: name,
  forceReauth,
});
```
@y
```typescript
return client.mcp.authorizations.authorize({
  server: name,
  forceReauth,
});
```
@z

@x
<details>
<summary>Complete TypeScript example: mcp/authorize.ts</summary>
@y
<details>
<summary>Complete TypeScript example: mcp/authorize.ts</summary>
@z

@x
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@z

@x
export async function authorizeMcpServer(
  client: Sandboxes,
  name: string,
  forceReauth: boolean,
) {
  return client.mcp.authorizations.authorize({
    server: name,
    forceReauth,
  });
}
@y
export async function authorizeMcpServer(
  client: Sandboxes,
  name: string,
  forceReauth: boolean,
) {
  return client.mcp.authorizations.authorize({
    server: name,
    forceReauth,
  });
}
@z

@x
export async function getMcpAuthorization(
  client: Sandboxes,
  name: string,
) {
  return client.mcp.authorizations.get(name);
}
```
@y
export async function getMcpAuthorization(
  client: Sandboxes,
  name: string,
) {
  return client.mcp.authorizations.get(name);
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
## Stop the gateway {#6-stop-the-gateway}
@y
## Stop the gateway {#6-stop-the-gateway}
@z

@x
Stop the gateway when the sandbox no longer needs its tools. This does not delete the sandbox. Detaching from a shared gateway does not remove that gateway for its other users.
@y
Stop the gateway when the sandbox no longer needs its tools. This does not delete the sandbox. Detaching from a shared gateway does not remove that gateway for its other users.
@z

@x
Existing agent processes may still hold old connection settings. Plan their restart or reconfiguration when changing the gateway.
@y
Existing agent processes may still hold old connection settings. Plan their restart or reconfiguration when changing the gateway.
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
await sandbox.mcp.stop();
```
@y
```typescript
await sandbox.mcp.stop();
```
@z

@x
<details>
<summary>Complete TypeScript example: mcp/stop.ts</summary>
@y
<details>
<summary>Complete TypeScript example: mcp/stop.ts</summary>
@z

@x
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@z

@x
export async function stopMcpGateway(client: Sandboxes, name: string) {
  const sandbox = await client.get(name.replace(/\/mcp-gateway$/, ''));
  await sandbox.mcp.stop();
}
```
@y
export async function stopMcpGateway(client: Sandboxes, name: string) {
  const sandbox = await client.get(name.replace(/\/mcp-gateway$/, ''));
  await sandbox.mcp.stop();
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
