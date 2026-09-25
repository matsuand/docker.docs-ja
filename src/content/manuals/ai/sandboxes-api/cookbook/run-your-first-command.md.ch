%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Run your first command"
linkTitle: "Run your first command"
description: "Connect to a running sandbox, run a command in it, and tell a command that exited unsuccessfully apart from a call that failed."
keywords: "cloud sandboxes, sandboxes api, run your first command"
@y
title: "Run your first command"
linkTitle: "Run your first command"
description: "Connect to a running sandbox, run a command in it, and tell a command that exited unsuccessfully apart from a call that failed."
keywords: "cloud sandboxes, sandboxes api, run your first command"
@z

@x
Run a command in an existing sandbox and collect its output. Start with an [authenticated client](connect-to-cloud-with-a-bearer-token.md) and the sandbox name returned by [your first launch](create-your-first-sandbox.md).
@y
Run a command in an existing sandbox and collect its output. Start with an [authenticated client](connect-to-cloud-with-a-bearer-token.md) and the sandbox name returned by [your first launch](create-your-first-sandbox.md).
@z

@x
For most commands, use the process collection's run helper. It starts the process and waits for its result.
@y
For most commands, use the process collection's run helper. It starts the process and waits for its result.
@z

@x
## Open the sandbox {#1-open-the-sandbox}
@y
## Open the sandbox {#1-open-the-sandbox}
@z

@x
Get the sandbox by its resource name. The returned handle exposes processes and files and manages their authenticated connections. You do not need to copy the sandbox address or Docker token into a second client.
@y
Get the sandbox by its resource name. The returned handle exposes processes and files and manages their authenticated connections. You do not need to copy the sandbox address or Docker token into a second client.
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
return client.get(name);
```
@y
```typescript
return client.get(name);
```
@z

@x
<details>
<summary>Complete TypeScript example: exec/endpoint.ts</summary>
@y
<details>
<summary>Complete TypeScript example: exec/endpoint.ts</summary>
@z

@x
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@z

@x
export async function processesAt(client: Sandboxes, name: string) {
  return client.get(name);
}
```
@y
export async function processesAt(client: Sandboxes, name: string) {
  return client.get(name);
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
## Use the process run helper {#2-use-the-process-run-helper}
@y
## Use the process run helper {#2-use-the-process-run-helper}
@z

@x
Pass an argument array: the program followed by its arguments, such as `['echo', 'Hello from Docker Sandboxes']`. Arguments are not shell syntax. For pipes, redirection, or variable expansion, run `sh -c` with your script as the next argument.
@y
Pass an argument array: the program followed by its arguments, such as `['echo', 'Hello from Docker Sandboxes']`. Arguments are not shell syntax. For pipes, redirection, or variable expansion, run `sh -c` with your script as the next argument.
@z

@x
The run helper returns the process result after collecting output. A successful SDK call does not mean the command succeeded: inspect its exit code. Standard error is diagnostic output and can be nonempty even when the exit code is zero.
@y
The run helper returns the process result after collecting output. A successful SDK call does not mean the command succeeded: inspect its exit code. Standard error is diagnostic output and can be nonempty even when the exit code is zero.
@z

@x
An SDK error means the request, wait, or connection failed. Keep the process handle carried by an error when available so you can inspect it instead of starting duplicate work. [Error handling](handle-errors-and-degradation.md) explains the distinction.
@y
An SDK error means the request, wait, or connection failed. Keep the process handle carried by an error when available so you can inspect it instead of starting duplicate work. [Error handling](handle-errors-and-degradation.md) explains the distinction.
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
return sandbox.processes.run({ args }, { timeoutMs: 300_000 });
```
@y
```typescript
return sandbox.processes.run({ args }, { timeoutMs: 300_000 });
```
@z

@x
<details>
<summary>Complete TypeScript example: exec/outcome.ts</summary>
@y
<details>
<summary>Complete TypeScript example: exec/outcome.ts</summary>
@z

@x
```typescript
import type { Sandbox } from '@docker/sandboxes';
@y
```typescript
import type { Sandbox } from '@docker/sandboxes';
@z

@x
export async function classifyOutcome(sandbox: Sandbox, args: string[]) {
  return sandbox.processes.run({ args }, { timeoutMs: 300_000 });
}
```
@y
export async function classifyOutcome(sandbox: Sandbox, args: string[]) {
  return sandbox.processes.run({ args }, { timeoutMs: 300_000 });
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
## Optional: execute a command directly {#3-optional-execute-a-command-directly}
@y
## Optional: execute a command directly {#3-optional-execute-a-command-directly}
@z

@x
For a short command whose output you only need after it exits, direct execution is simpler: one request waits for the command and returns its captured output and exit code, without a separate process-creation and output-reading sequence.
@y
For a short command whose output you only need after it exits, direct execution is simpler: one request waits for the command and returns its captured output and exit code, without a separate process-creation and output-reading sequence.
@z

@x
Check the incomplete flag before treating captured output as complete. Choose [streaming output](run-something-that-produces-real-output.md) when you need output while the command runs.
@y
Check the incomplete flag before treating captured output as complete. Choose [streaming output](run-something-that-produces-real-output.md) when you need output while the command runs.
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
const result = await endpoint.api.exec({ body: { cmd: args } });
```
@y
```typescript
const result = await endpoint.api.exec({ body: { cmd: args } });
```
@z

@x
<details>
<summary>Complete TypeScript example: exec/exec.ts</summary>
@y
<details>
<summary>Complete TypeScript example: exec/exec.ts</summary>
@z

@x
```typescript
import type { Sandbox } from '@docker/sandboxes';
@y
```typescript
import type { Sandbox } from '@docker/sandboxes';
@z

@x
export async function runCommand(sandbox: Sandbox, args: string[]) {
  const endpoint = await sandbox.endpointClient(['sandboxesExec'], 'exec');
  try {
    const result = await endpoint.api.exec({ body: { cmd: args } });
    return {
      exitCode: result.exitCode ?? 0,
      stdout: new TextDecoder().decode(result.stdout),
      stderr: new TextDecoder().decode(result.stderr),
      incomplete: result.incomplete ?? false,
    };
  } finally {
    await endpoint.close();
  }
}
```
@y
export async function runCommand(sandbox: Sandbox, args: string[]) {
  const endpoint = await sandbox.endpointClient(['sandboxesExec'], 'exec');
  try {
    const result = await endpoint.api.exec({ body: { cmd: args } });
    return {
      exitCode: result.exitCode ?? 0,
      stdout: new TextDecoder().decode(result.stdout),
      stderr: new TextDecoder().decode(result.stderr),
      incomplete: result.incomplete ?? false,
    };
  } finally {
    await endpoint.close();
  }
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
