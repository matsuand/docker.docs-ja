%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Delete a cloud sandbox"
linkTitle: "Delete a cloud sandbox"
description: "Delete a sandbox you have read back and wait until it is gone, with the option to override a refusal based on its current state."
keywords: "cloud sandboxes, sandboxes api, delete a cloud sandbox"
@y
title: "Delete a cloud sandbox"
linkTitle: "Delete a cloud sandbox"
description: "Delete a sandbox you have read back and wait until it is gone, with the option to override a refusal based on its current state."
keywords: "cloud sandboxes, sandboxes api, delete a cloud sandbox"
@z

@x
Delete a sandbox when its work is finished. Deletion removes its processes and sandbox-local files, so download results or save a snapshot first.
@y
Delete a sandbox when its work is finished. Deletion removes its processes and sandbox-local files, so download results or save a snapshot first.
@z

@x
Use a current sandbox handle from creation or from reading its resource name. Closing the SDK client does not delete the sandbox.
@y
Use a current sandbox handle from creation or from reading its resource name. Closing the SDK client does not delete the sandbox.
@z

@x
## Delete and wait {#1-delete-and-wait}
@y
## Delete and wait {#1-delete-and-wait}
@z

@x
Delete through the sandbox handle, then wait until the sandbox is absent. Deletion can terminate running work. If you choose to [stop the sandbox](stop-and-restart-a-sandbox.md) first, wait for that transition to finish before deleting it: deletion during a stop or resume can be refused.
@y
Delete through the sandbox handle, then wait until the sandbox is absent. Deletion can terminate running work. If you choose to [stop the sandbox](stop-and-restart-a-sandbox.md) first, wait for that transition to finish before deleting it: deletion during a stop or resume can be refused.
@z

@x
The example takes an idempotency key and a wait deadline. Its optional force setting requests deletion when the service would otherwise refuse the sandbox's state. It does not guarantee that every state can be deleted immediately; handle a refusal rather than assuming cleanup succeeded.
@y
The example takes an idempotency key and a wait deadline. Its optional force setting requests deletion when the service would otherwise refuse the sandbox's state. It does not guarantee that every state can be deleted immediately; handle a refusal rather than assuming cleanup succeeded.
@z

@x
The handle supplies the resource version it read. When an operation returns an updated handle, keep that handle for your next operation; older handles do not update themselves.
@y
The handle supplies the resource version it read. When an operation returns an updated handle, keep that handle for your next operation; older handles do not update themselves.
@z

@x
If deletion fails because the resource version changed, call `refresh()`. Inspect the returned handle and decide whether deletion is still appropriate. Refreshing does not change the original handle, so call delete on the returned one. If you supply idempotency keys, use a new key: deleting the refreshed version is a new logical operation, not a retry of the refused request.
@y
If deletion fails because the resource version changed, call `refresh()`. Inspect the returned handle and decide whether deletion is still appropriate. Refreshing does not change the original handle, so call delete on the returned one. If you supply idempotency keys, use a new key: deleting the refreshed version is a new logical operation, not a retry of the refused request.
@z

@x
If the wait times out, read the sandbox again to check its state. Keep its name so you can retry cleanup if needed. Repeating a completed deletion is safe.
@y
If the wait times out, read the sandbox again to check its state. Keep its name so you can retry cleanup if needed. Repeating a completed deletion is safe.
@z

@x
Separate resources such as volumes, snapshots, and stored secrets have their own lifetimes. Delete those only when nothing still needs them.
@y
Separate resources such as volumes, snapshots, and stored secrets have their own lifetimes. Delete those only when nothing still needs them.
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
const deleting = await sandbox.delete(
  { force },
  { idempotencyKey: requestId },
);
if (deleting) await deleting.waitUntilDeleted({ timeoutMs });
```
@y
```typescript
const deleting = await sandbox.delete(
  { force },
  { idempotencyKey: requestId },
);
if (deleting) await deleting.waitUntilDeleted({ timeoutMs });
```
@z

@x
<details>
<summary>Complete TypeScript example: removal/delete.ts</summary>
@y
<details>
<summary>Complete TypeScript example: removal/delete.ts</summary>
@z

@x
```typescript
import type { Sandbox } from '@docker/sandboxes';
@y
```typescript
import type { Sandbox } from '@docker/sandboxes';
@z

@x
export async function deleteSandbox(
  sandbox: Sandbox,
  requestId: string,
  force = false,
  timeoutMs = 300_000,
) {
  const deleting = await sandbox.delete(
    { force },
    { idempotencyKey: requestId },
  );
  if (deleting) await deleting.waitUntilDeleted({ timeoutMs });
}
```
@y
export async function deleteSandbox(
  sandbox: Sandbox,
  requestId: string,
  force = false,
  timeoutMs = 300_000,
) {
  const deleting = await sandbox.delete(
    { force },
    { idempotencyKey: requestId },
  );
  if (deleting) await deleting.waitUntilDeleted({ timeoutMs });
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
