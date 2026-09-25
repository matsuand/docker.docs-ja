%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Snapshot and fork a sandbox"
linkTitle: "Snapshot and fork a sandbox"
description: "Capture the state of a running sandbox as a snapshot, then start a new sandbox from that snapshot."
keywords: "cloud sandboxes, sandboxes api, snapshot and fork a sandbox"
@y
title: "Snapshot and fork a sandbox"
linkTitle: "Snapshot and fork a sandbox"
description: "Capture the state of a running sandbox as a snapshot, then start a new sandbox from that snapshot."
keywords: "cloud sandboxes, sandboxes api, snapshot and fork a sandbox"
@z

@x
Save a sandbox's state so you can start another sandbox from the same point later. A snapshot is separate from its source sandbox; restoring it creates a new sandbox with its own identity.
@y
Save a sandbox's state so you can start another sandbox from the same point later. A snapshot is separate from its source sandbox; restoring it creates a new sandbox with its own identity.
@z

@x
Use an [authenticated client](connect-to-cloud-with-a-bearer-token.md) and the resource name of a running sandbox.
@y
Use an [authenticated client](connect-to-cloud-with-a-bearer-token.md) and the resource name of a running sandbox.
@z

@x
## Capture a snapshot {#1-capture-a-snapshot}
@y
## Capture a snapshot {#1-capture-a-snapshot}
@z

@x
Choose a display name, capture mode, and idempotency key. Use disk-only capture when you need the filesystem. Request memory only when your environment supports it and you need the running state.
@y
Choose a display name, capture mode, and idempotency key. Use disk-only capture when you need the filesystem. Request memory only when your environment supports it and you need the running state.
@z

@x
The example waits until capture finishes and returns a snapshot handle. Keep the returned name for restoration.
@y
The example waits until capture finishes and returns a snapshot handle. Keep the returned name for restoration.
@z

@x
A failed capture carries failure details; a timed-out wait does not prove the capture was cancelled.
@y
A failed capture carries failure details; a timed-out wait does not prove the capture was cancelled.
@z

@x
Snapshots can contain credentials and private project data. Restrict access to them, especially when capturing memory.
@y
Snapshots can contain credentials and private project data. Restrict access to them, especially when capturing memory.
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
const snapshot = await sandbox.snapshot(
  {
    displayName: snapshotName,
    captureMode: withMemory ? 'all' : 'disk',
  },
  { idempotencyKey: requestId },
);
return snapshot.waitUntilReady();
```
@y
```typescript
const snapshot = await sandbox.snapshot(
  {
    displayName: snapshotName,
    captureMode: withMemory ? 'all' : 'disk',
  },
  { idempotencyKey: requestId },
);
return snapshot.waitUntilReady();
```
@z

@x
<details>
<summary>Complete TypeScript example: snapshots/create.ts</summary>
@y
<details>
<summary>Complete TypeScript example: snapshots/create.ts</summary>
@z

@x
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@z

@x
export async function createSnapshot(
  client: Sandboxes,
  sandboxName: string,
  snapshotName: string,
  withMemory: boolean,
  requestId: string,
) {
  const sandbox = await client.get(sandboxName);
  const snapshot = await sandbox.snapshot(
    {
      displayName: snapshotName,
      captureMode: withMemory ? 'all' : 'disk',
    },
    { idempotencyKey: requestId },
  );
  return snapshot.waitUntilReady();
}
```
@y
export async function createSnapshot(
  client: Sandboxes,
  sandboxName: string,
  snapshotName: string,
  withMemory: boolean,
  requestId: string,
) {
  const sandbox = await client.get(sandboxName);
  const snapshot = await sandbox.snapshot(
    {
      displayName: snapshotName,
      captureMode: withMemory ? 'all' : 'disk',
    },
    { idempotencyKey: requestId },
  );
  return snapshot.waitUntilReady();
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
## Restore into another sandbox {#2-restore-into-another-sandbox}
@y
## Restore into another sandbox {#2-restore-into-another-sandbox}
@z

@x
Use a ready snapshot's name and a display name for the new sandbox. The example waits for the restored sandbox to run.
@y
Use a ready snapshot's name and a display name for the new sandbox. The example waits for the restored sandbox to run.
@z

@x
The call returns a sandbox handle, ready for running commands or transferring files.
@y
The call returns a sandbox handle, ready for running commands or transferring files.
@z

@x
The source sandbox does not need to remain running. Restoration does not replace it. Save the new sandbox's name and delete it separately when you finish.
@y
The source sandbox does not need to remain running. Restoration does not replace it. Save the new sandbox's name and delete it separately when you finish.
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
const sandbox = await snapshot.restore(
  { displayName: newSandboxName },
  { timeoutMs: 300_000, idempotencyKey: requestId },
);
return sandbox.waitUntilRunning();
```
@y
```typescript
const sandbox = await snapshot.restore(
  { displayName: newSandboxName },
  { timeoutMs: 300_000, idempotencyKey: requestId },
);
return sandbox.waitUntilRunning();
```
@z

@x
<details>
<summary>Complete TypeScript example: snapshots/restore.ts</summary>
@y
<details>
<summary>Complete TypeScript example: snapshots/restore.ts</summary>
@z

@x
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@z

@x
export async function restoreSnapshot(
  client: Sandboxes,
  snapshotName: string,
  newSandboxName: string,
  requestId: string,
) {
  const snapshot = await client.snapshots.get(snapshotName);
  const sandbox = await snapshot.restore(
    { displayName: newSandboxName },
    { timeoutMs: 300_000, idempotencyKey: requestId },
  );
  return sandbox.waitUntilRunning();
}
```
@y
export async function restoreSnapshot(
  client: Sandboxes,
  snapshotName: string,
  newSandboxName: string,
  requestId: string,
) {
  const snapshot = await client.snapshots.get(snapshotName);
  const sandbox = await snapshot.restore(
    { displayName: newSandboxName },
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

@x
## Find saved snapshots {#3-find-saved-snapshots}
@y
## Find saved snapshots {#3-find-saved-snapshots}
@z

@x
List snapshots for the source sandbox. The example follows all pages and returns summaries. Read a selected snapshot before restoring it if you need its current status or complete metadata.
@y
List snapshots for the source sandbox. The example follows all pages and returns summaries. Read a selected snapshot before restoring it if you need its current status or complete metadata.
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
return client.snapshots.all({ sandbox: sandboxName }).collect();
```
@y
```typescript
return client.snapshots.all({ sandbox: sandboxName }).collect();
```
@z

@x
<details>
<summary>Complete TypeScript example: snapshots/list.ts</summary>
@y
<details>
<summary>Complete TypeScript example: snapshots/list.ts</summary>
@z

@x
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@z

@x
export async function listSnapshots(
  client: Sandboxes,
  sandboxName: string,
) {
  return client.snapshots.all({ sandbox: sandboxName }).collect();
}
```
@y
export async function listSnapshots(
  client: Sandboxes,
  sandboxName: string,
) {
  return client.snapshots.all({ sandbox: sandboxName }).collect();
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
## Delete a snapshot {#4-delete-a-snapshot}
@y
## Delete a snapshot {#4-delete-a-snapshot}
@z

@x
Delete through a handle when you no longer need that restore point. Deletion removes the snapshot, not sandboxes that have already been restored from it. Snapshot deletion is refused while a sandbox restored from it is still running.
@y
Delete through a handle when you no longer need that restore point. Deletion removes the snapshot, not sandboxes that have already been restored from it. Snapshot deletion is refused while a sandbox restored from it is still running.
@z

@x
Deleting the source sandbox and deleting its snapshots are separate cleanup steps.
@y
Deleting the source sandbox and deleting its snapshots are separate cleanup steps.
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
await snapshot.delete();
```
@y
```typescript
await snapshot.delete();
```
@z

@x
<details>
<summary>Complete TypeScript example: snapshots/delete.ts</summary>
@y
<details>
<summary>Complete TypeScript example: snapshots/delete.ts</summary>
@z

@x
```typescript
import type { Snapshot } from '@docker/sandboxes';
@y
```typescript
import type { Snapshot } from '@docker/sandboxes';
@z

@x
export async function deleteSnapshot(snapshot: Snapshot) {
  await snapshot.delete();
}
```
@y
export async function deleteSnapshot(snapshot: Snapshot) {
  await snapshot.delete();
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
