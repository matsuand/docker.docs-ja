%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Run work across many sandboxes"
linkTitle: "Run work across many sandboxes"
description: "Run one command on every running sandbox you hold, a bounded number at a time, and read one answer per sandbox even when some of them fail."
keywords: "cloud sandboxes, sandboxes api, run work across many sandboxes"
@y
title: "Run work across many sandboxes"
linkTitle: "Run work across many sandboxes"
description: "Run one command on every running sandbox you hold, a bounded number at a time, and read one answer per sandbox even when some of them fail."
keywords: "cloud sandboxes, sandboxes api, run work across many sandboxes"
@z

@x
Run a command across several existing sandboxes while keeping concurrency bounded. This can collect diagnostics or apply the same task to a group of independent workspaces.
@y
Run a command across several existing sandboxes while keeping concurrency bounded. This can collect diagnostics or apply the same task to a group of independent workspaces.
@z

@x
Use an [authenticated client](connect-to-cloud-with-a-bearer-token.md) and an argument array. Only run the command in sandboxes your application owns for this task.
@y
Use an [authenticated client](connect-to-cloud-with-a-bearer-token.md) and an argument array. Only run the command in sandboxes your application owns for this task.
@z

@x
## Select running sandboxes {#1-select-running-sandboxes}
@y
## Select running sandboxes {#1-select-running-sandboxes}
@z

@x
Walk the sandbox collection and retain running handles. The example selects all running sandboxes visible to the client; narrow that selection to your application's jobs before executing a command with side effects.
@y
Walk the sandbox collection and retain running handles. The example selects all running sandboxes visible to the client; narrow that selection to your application's jobs before executing a command with side effects.
@z

@x
Listing and execution are separate requests. A sandbox can change state between them, so the execution step still needs to handle failures.
@y
Listing and execution are separate requests. A sandbox can change state between them, so the execution step still needs to handle failures.
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
const running: Sandbox[] = [];
for await (const sandbox of client.all()) {
  if (sandbox.status === 'running') running.push(sandbox);
}
return running;
```
@y
```typescript
const running: Sandbox[] = [];
for await (const sandbox of client.all()) {
  if (sandbox.status === 'running') running.push(sandbox);
}
return running;
```
@z

@x
<details>
<summary>Complete TypeScript example: fanout/spread.ts</summary>
@y
<details>
<summary>Complete TypeScript example: fanout/spread.ts</summary>
@z

@x
```typescript
import type { Sandbox, Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { Sandbox, Sandboxes } from '@docker/sandboxes';
@z

@x
export async function runningSandboxes(client: Sandboxes) {
  const running: Sandbox[] = [];
  for await (const sandbox of client.all()) {
    if (sandbox.status === 'running') running.push(sandbox);
  }
  return running;
}
```
@y
export async function runningSandboxes(client: Sandboxes) {
  const running: Sandbox[] = [];
  for await (const sandbox of client.all()) {
    if (sandbox.status === 'running') running.push(sandbox);
  }
  return running;
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
## Collect individual results {#2-collect-individual-results}
@y
## Collect individual results {#2-collect-individual-results}
@z

@x
Choose a concurrency bound and run the command on each selected sandbox. The example keeps each result or failure alongside the sandbox name, so one failed request does not discard every other result.
@y
Choose a concurrency bound and run the command on each selected sandbox. The example keeps each result or failure alongside the sandbox name, so one failed request does not discard every other result.
@z

@x
Inspect both request failures and process exit codes. A returned process result can contain a nonzero exit code.
@y
Inspect both request failures and process exit codes. A returned process result can contain a nonzero exit code.
@z

@x
Keep concurrency below your account's limits and your application's memory budget. For large output, stream results instead of collecting them all. The example does not delete the existing sandboxes.
@y
Keep concurrency below your account's limits and your application's memory budget. For large output, stream results instead of collecting them all. The example does not delete the existing sandboxes.
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
const outcomes: Outcome[] = [];
const size = Number.isFinite(bound) ? Math.max(1, Math.trunc(bound)) : 1;
for (let start = 0; start < sandboxes.length; start += size) {
  const group = sandboxes.slice(start, start + size);
  const settled = await Promise.allSettled(
    group.map((sandbox) =>
      sandbox.processes.run({ args }, { timeoutMs: 300_000 }),
    ),
  );
  settled.forEach((result, index) => {
    outcomes.push(
      result.status === 'fulfilled'
        ? { sandboxName: group[index].name, response: result.value }
        : { sandboxName: group[index].name, failure: result.reason },
    );
  });
}
return outcomes;
```
@y
```typescript
const outcomes: Outcome[] = [];
const size = Number.isFinite(bound) ? Math.max(1, Math.trunc(bound)) : 1;
for (let start = 0; start < sandboxes.length; start += size) {
  const group = sandboxes.slice(start, start + size);
  const settled = await Promise.allSettled(
    group.map((sandbox) =>
      sandbox.processes.run({ args }, { timeoutMs: 300_000 }),
    ),
  );
  settled.forEach((result, index) => {
    outcomes.push(
      result.status === 'fulfilled'
        ? { sandboxName: group[index].name, response: result.value }
        : { sandboxName: group[index].name, failure: result.reason },
    );
  });
}
return outcomes;
```
@z

@x
<details>
<summary>Complete TypeScript example: fanout/gather.ts</summary>
@y
<details>
<summary>Complete TypeScript example: fanout/gather.ts</summary>
@z

@x
```typescript
import type { RunResult, Sandbox } from '@docker/sandboxes';
@y
```typescript
import type { RunResult, Sandbox } from '@docker/sandboxes';
@z

@x
export type Outcome = {
  sandboxName: string;
  response?: RunResult;
  failure?: unknown;
};
@y
export type Outcome = {
  sandboxName: string;
  response?: RunResult;
  failure?: unknown;
};
@z

@x
export async function runOnEach(
  sandboxes: Sandbox[],
  args: string[],
  bound: number,
) {
  const outcomes: Outcome[] = [];
  const size = Number.isFinite(bound) ? Math.max(1, Math.trunc(bound)) : 1;
  for (let start = 0; start < sandboxes.length; start += size) {
    const group = sandboxes.slice(start, start + size);
    const settled = await Promise.allSettled(
      group.map((sandbox) =>
        sandbox.processes.run({ args }, { timeoutMs: 300_000 }),
      ),
    );
    settled.forEach((result, index) => {
      outcomes.push(
        result.status === 'fulfilled'
          ? { sandboxName: group[index].name, response: result.value }
          : { sandboxName: group[index].name, failure: result.reason },
      );
    });
  }
  return outcomes;
}
```
@y
export async function runOnEach(
  sandboxes: Sandbox[],
  args: string[],
  bound: number,
) {
  const outcomes: Outcome[] = [];
  const size = Number.isFinite(bound) ? Math.max(1, Math.trunc(bound)) : 1;
  for (let start = 0; start < sandboxes.length; start += size) {
    const group = sandboxes.slice(start, start + size);
    const settled = await Promise.allSettled(
      group.map((sandbox) =>
        sandbox.processes.run({ args }, { timeoutMs: 300_000 }),
      ),
    );
    settled.forEach((result, index) => {
      outcomes.push(
        result.status === 'fulfilled'
          ? { sandboxName: group[index].name, response: result.value }
          : { sandboxName: group[index].name, failure: result.reason },
      );
    });
  }
  return outcomes;
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
