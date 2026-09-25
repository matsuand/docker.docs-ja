%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Run something that produces real output"
linkTitle: "Run something that produces real output"
description: "Choose between a call that returns a command's captured output when it finishes and a process whose output you read while it runs."
keywords: "cloud sandboxes, sandboxes api, run something that produces real output"
@y
title: "Run something that produces real output"
linkTitle: "Run something that produces real output"
description: "Choose between a call that returns a command's captured output when it finishes and a process whose output you read while it runs."
keywords: "cloud sandboxes, sandboxes api, run something that produces real output"
@z

@x
Choose how your application receives command output. Captured output is convenient for a short command; streaming lets you display progress or process output without waiting for completion.
@y
Choose how your application receives command output. Captured output is convenient for a short command; streaming lets you display progress or process output without waiting for completion.
@z

@x
Start with a running sandbox handle from [your first sandbox](create-your-first-sandbox.md). Supply the command as an argument array.
@y
Start with a running sandbox handle from [your first sandbox](create-your-first-sandbox.md). Supply the command as an argument array.
@z

@x
## Collect the result {#1-collect-the-result}
@y
## Collect the result {#1-collect-the-result}
@z

@x
Run the process and wait for its result. Inspect standard output, standard error, and the exit code. Use an application deadline so a command cannot hold your request open indefinitely.
@y
Run the process and wait for its result. Inspect standard output, standard error, and the exit code. Use an application deadline so a command cannot hold your request open indefinitely.
@z

@x
This form accumulates output for you. Prefer streaming when output could be large or your user needs progress updates.
@y
This form accumulates output for you. Prefer streaming when output could be large or your user needs progress updates.
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
<summary>Complete TypeScript example: longrun/choose.ts</summary>
@y
<details>
<summary>Complete TypeScript example: longrun/choose.ts</summary>
@z

@x
```typescript
import type { Sandbox } from '@docker/sandboxes';
@y
```typescript
import type { Sandbox } from '@docker/sandboxes';
@z

@x
export async function collectOutput(sandbox: Sandbox, args: string[]) {
  return sandbox.processes.run({ args }, { timeoutMs: 300_000 });
}
```
@y
export async function collectOutput(sandbox: Sandbox, args: string[]) {
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
## Stream output as it arrives {#2-stream-output-as-it-arrives}
@y
## Stream output as it arrives {#2-stream-output-as-it-arrives}
@z

@x
Start the process, connect to it, and consume output events. The example forwards each output chunk to a callback and returns the exit code from the exit event.
@y
Start the process, connect to it, and consume output events. The example forwards each output chunk to a callback and returns the exit code from the exit event.
@z

@x
The callback owns what happens to each chunk: display it, append it to a file, or send it to a client. Do not log sensitive output indiscriminately.
@y
The callback owns what happens to each chunk: display it, append it to a file, or send it to a client. Do not log sensitive output indiscriminately.
@z

@x
Always close the connection. A stream that ends before an exit event is an incomplete observation, not proof of success. Keep the process name to [reconnect](find-a-process-you-lost-track-of.md) rather than immediately starting a duplicate command.
@y
Always close the connection. A stream that ends before an exit event is an incomplete observation, not proof of success. Keep the process name to [reconnect](find-a-process-you-lost-track-of.md) rather than immediately starting a duplicate command.
@z

@x
Connections opened through TypeScript process handles reconnect after temporary disconnects while you consume output. They resume after the last delivered chunk and stop if recovery exceeds 30 seconds, without replaying process input. These connections have no default lifetime limit once connected, but a timeout you supply still limits the whole session. Raw streams require explicit reconnection.
@y
Connections opened through TypeScript process handles reconnect after temporary disconnects while you consume output. They resume after the last delivered chunk and stop if recovery exceeds 30 seconds, without replaying process input. These connections have no default lifetime limit once connected, but a timeout you supply still limits the whole session. Raw streams require explicit reconnection.
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
const process = await sandbox.processes.start(
  { args },
  { idempotencyKey: requestId },
);
const connection = await process.connect();
try {
  for await (const event of connection) {
    if (event.type === 'chunk') write(event.data ?? new Uint8Array());
    if (event.type === 'exited') return event.exitCode ?? 0;
  }
  throw new Error(
    `Output of ${process.name} ended before the command exited`,
  );
} finally {
  await connection.close();
}
```
@y
```typescript
const process = await sandbox.processes.start(
  { args },
  { idempotencyKey: requestId },
);
const connection = await process.connect();
try {
  for await (const event of connection) {
    if (event.type === 'chunk') write(event.data ?? new Uint8Array());
    if (event.type === 'exited') return event.exitCode ?? 0;
  }
  throw new Error(
    `Output of ${process.name} ended before the command exited`,
  );
} finally {
  await connection.close();
}
```
@z

@x
<details>
<summary>Complete TypeScript example: longrun/stream.ts</summary>
@y
<details>
<summary>Complete TypeScript example: longrun/stream.ts</summary>
@z

@x
```typescript
import type { Sandbox } from '@docker/sandboxes';
@y
```typescript
import type { Sandbox } from '@docker/sandboxes';
@z

@x
export async function streamOutput(
  sandbox: Sandbox,
  args: string[],
  requestId: string,
  write: (bytes: Uint8Array) => void,
) {
  const process = await sandbox.processes.start(
    { args },
    { idempotencyKey: requestId },
  );
  const connection = await process.connect();
  try {
    for await (const event of connection) {
      if (event.type === 'chunk') write(event.data ?? new Uint8Array());
      if (event.type === 'exited') return event.exitCode ?? 0;
    }
    throw new Error(
      `Output of ${process.name} ended before the command exited`,
    );
  } finally {
    await connection.close();
  }
}
```
@y
export async function streamOutput(
  sandbox: Sandbox,
  args: string[],
  requestId: string,
  write: (bytes: Uint8Array) => void,
) {
  const process = await sandbox.processes.start(
    { args },
    { idempotencyKey: requestId },
  );
  const connection = await process.connect();
  try {
    for await (const event of connection) {
      if (event.type === 'chunk') write(event.data ?? new Uint8Array());
      if (event.type === 'exited') return event.exitCode ?? 0;
    }
    throw new Error(
      `Output of ${process.name} ended before the command exited`,
    );
  } finally {
    await connection.close();
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
