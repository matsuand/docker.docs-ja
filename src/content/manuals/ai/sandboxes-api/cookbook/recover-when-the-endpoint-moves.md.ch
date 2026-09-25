%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Recover when the endpoint moves"
linkTitle: "Recover when the endpoint moves"
description: "Read a sandbox again to learn its current endpoint, then run one command through a connection built for that endpoint."
keywords: "cloud sandboxes, sandboxes api, recover when the endpoint moves"
@y
title: "Recover when the endpoint moves"
linkTitle: "Recover when the endpoint moves"
description: "Read a sandbox again to learn its current endpoint, then run one command through a connection built for that endpoint."
keywords: "cloud sandboxes, sandboxes api, recover when the endpoint moves"
@z

@x
Refresh a sandbox handle after a restart or connection change. A saved address can become stale even though the sandbox still has the same resource name.
@y
Refresh a sandbox handle after a restart or connection change. A saved address can become stale even though the sandbox still has the same resource name.
@z

@x
Start with the handle your application already holds. Keep its name and UID; do not replace them with another sandbox's identity.
@y
Start with the handle your application already holds. Keep its name and UID; do not replace them with another sandbox's identity.
@z

@x
## Compare the current endpoint {#1-compare-the-current-endpoint}
@y
## Compare the current endpoint {#1-compare-the-current-endpoint}
@z

@x
Refresh the handle, then compare the old and new connection information. The SDK checks the resource identity while constructing the refreshed handle.
@y
Refresh the handle, then compare the old and new connection information. The SDK checks the resource identity while constructing the refreshed handle.
@z

@x
The example reports whether the endpoint changed and returns a refreshed handle. Use that handle for later process and file calls.
@y
The example reports whether the endpoint changed and returns a refreshed handle. Use that handle for later process and file calls.
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
const current = await held.refresh();
const before = held.core.endpoint;
const after = current.core.endpoint;
return {
  moved:
    before?.uri !== after?.uri || before?.protocol !== after?.protocol,
  current,
};
```
@y
```typescript
const current = await held.refresh();
const before = held.core.endpoint;
const after = current.core.endpoint;
return {
  moved:
    before?.uri !== after?.uri || before?.protocol !== after?.protocol,
  current,
};
```
@z

@x
<details>
<summary>Complete TypeScript example: rebind/detect.ts</summary>
@y
<details>
<summary>Complete TypeScript example: rebind/detect.ts</summary>
@z

@x
```typescript
import type { Sandbox } from '@docker/sandboxes';
@y
```typescript
import type { Sandbox } from '@docker/sandboxes';
@z

@x
export async function endpointMoved(held: Sandbox) {
  const current = await held.refresh();
  const before = held.core.endpoint;
  const after = current.core.endpoint;
  return {
    moved:
      before?.uri !== after?.uri || before?.protocol !== after?.protocol,
    current,
  };
}
```
@y
export async function endpointMoved(held: Sandbox) {
  const current = await held.refresh();
  const before = held.core.endpoint;
  const after = current.core.endpoint;
  return {
    moved:
      before?.uri !== after?.uri || before?.protocol !== after?.protocol,
    current,
  };
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
## Run through the refreshed handle {#2-run-through-the-refreshed-handle}
@y
## Run through the refreshed handle {#2-run-through-the-refreshed-handle}
@z

@x
Refresh before opening a new process connection. The SDK obtains the appropriate sandbox credential for the current endpoint; your application does not need to pass its Docker account token there.
@y
Refresh before opening a new process connection. The SDK obtains the appropriate sandbox credential for the current endpoint; your application does not need to pass its Docker account token there.
@z

@x
This example starts new work after refresh. It does not replay a command whose completion is unknown. If an earlier command may still be running, [find and reconnect to it](find-a-process-you-lost-track-of.md) first.
@y
This example starts new work after refresh. It does not replay a command whose completion is unknown. If an earlier command may still be running, [find and reconnect to it](find-a-process-you-lost-track-of.md) first.
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
const current = await held.refresh();
return current.processes.run({ args }, { timeoutMs: 300_000 });
```
@y
```typescript
const current = await held.refresh();
return current.processes.run({ args }, { timeoutMs: 300_000 });
```
@z

@x
<details>
<summary>Complete TypeScript example: rebind/rebuild.ts</summary>
@y
<details>
<summary>Complete TypeScript example: rebind/rebuild.ts</summary>
@z

@x
```typescript
import type { Sandbox } from '@docker/sandboxes';
@y
```typescript
import type { Sandbox } from '@docker/sandboxes';
@z

@x
export async function runAndRebind(held: Sandbox, args: string[]) {
  const current = await held.refresh();
  return current.processes.run({ args }, { timeoutMs: 300_000 });
}
```
@y
export async function runAndRebind(held: Sandbox, args: string[]) {
  const current = await held.refresh();
  return current.processes.run({ args }, { timeoutMs: 300_000 });
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
