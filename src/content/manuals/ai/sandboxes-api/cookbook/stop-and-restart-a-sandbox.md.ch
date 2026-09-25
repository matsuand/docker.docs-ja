%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Stop and restart a sandbox"
linkTitle: "Stop and restart a sandbox"
description: "Stop a running sandbox without deleting it, wait for the stop to settle, and start the same sandbox again when you need it."
keywords: "cloud sandboxes, sandboxes api, stop and restart a sandbox"
@y
title: "Stop and restart a sandbox"
linkTitle: "Stop and restart a sandbox"
description: "Stop a running sandbox without deleting it, wait for the stop to settle, and start the same sandbox again when you need it."
keywords: "cloud sandboxes, sandboxes api, stop and restart a sandbox"
@z

@x
Stop a sandbox when you want to keep its disk but pause its execution. Start the same sandbox later to continue working with those files.
@y
Stop a sandbox when you want to keep its disk but pause its execution. Start the same sandbox later to continue working with those files.
@z

@x
Use a sandbox handle obtained by creation or by reading its resource name. Stopping is different from [deleting](delete-a-cloud-sandbox.md), which removes the sandbox.
@y
Use a sandbox handle obtained by creation or by reading its resource name. Stopping is different from [deleting](delete-a-cloud-sandbox.md), which removes the sandbox.
@z

@x
## Stop the sandbox {#1-stop-the-sandbox}
@y
## Stop the sandbox {#1-stop-the-sandbox}
@z

@x
Call stop and wait for the stopped state. The example returns a handle with the updated resource version.
@y
Call stop and wait for the stopped state. The example returns a handle with the updated resource version.
@z

@x
Wait completion confirms the state change. A timeout means your client stopped waiting; read the sandbox to learn whether the operation completed.
@y
Wait completion confirms the state change. A timeout means your client stopped waiting; read the sandbox to learn whether the operation completed.
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
const changed = await sandbox.stop({ idempotencyKey: requestId });
return changed.waitUntilStopped();
```
@y
```typescript
const changed = await sandbox.stop({ idempotencyKey: requestId });
return changed.waitUntilStopped();
```
@z

@x
<details>
<summary>Complete TypeScript example: lifecycle/stop.ts</summary>
@y
<details>
<summary>Complete TypeScript example: lifecycle/stop.ts</summary>
@z

@x
```typescript
import type { Sandbox } from '@docker/sandboxes';
@y
```typescript
import type { Sandbox } from '@docker/sandboxes';
@z

@x
export async function stopSandbox(sandbox: Sandbox, requestId: string) {
  const changed = await sandbox.stop({ idempotencyKey: requestId });
  return changed.waitUntilStopped();
}
```
@y
export async function stopSandbox(sandbox: Sandbox, requestId: string) {
  const changed = await sandbox.stop({ idempotencyKey: requestId });
  return changed.waitUntilStopped();
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
## Start it again {#2-start-it-again}
@y
## Start it again {#2-start-it-again}
@z

@x
Do not reuse a handle whose version predates the stop.
@y
Do not reuse a handle whose version predates the stop.
@z

@x
Start the stopped sandbox and wait for it to run. As with stopping, the call returns a handle.
@y
Start the stopped sandbox and wait for it to run. As with stopping, the call returns a handle.
@z

@x
Do not assume that a process connection from before the stop remains usable. [Find an existing process](find-a-process-you-lost-track-of.md) or start the work again as appropriate for the application.
@y
Do not assume that a process connection from before the stop remains usable. [Find an existing process](find-a-process-you-lost-track-of.md) or start the work again as appropriate for the application.
@z

@x
A stopped sandbox still exists. Delete it when you no longer need its disk, and clean up separate snapshots or volumes only when their data is no longer needed.
@y
A stopped sandbox still exists. Delete it when you no longer need its disk, and clean up separate snapshots or volumes only when their data is no longer needed.
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
const changed = await sandbox.start({ idempotencyKey: requestId });
return changed.waitUntilRunning();
```
@y
```typescript
const changed = await sandbox.start({ idempotencyKey: requestId });
return changed.waitUntilRunning();
```
@z

@x
<details>
<summary>Complete TypeScript example: lifecycle/start.ts</summary>
@y
<details>
<summary>Complete TypeScript example: lifecycle/start.ts</summary>
@z

@x
```typescript
import type { Sandbox } from '@docker/sandboxes';
@y
```typescript
import type { Sandbox } from '@docker/sandboxes';
@z

@x
export async function startSandbox(sandbox: Sandbox, requestId: string) {
  const changed = await sandbox.start({ idempotencyKey: requestId });
  return changed.waitUntilRunning();
}
```
@y
export async function startSandbox(sandbox: Sandbox, requestId: string) {
  const changed = await sandbox.start({ idempotencyKey: requestId });
  return changed.waitUntilRunning();
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
