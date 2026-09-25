%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Run an interactive shell in a cloud sandbox"
linkTitle: "Run an interactive shell in a cloud sandbox"
description: "Start a shell on a pseudo-terminal, send it input and read its output over one connection, connect again and pick up the output the service kept, and stop it."
keywords: "cloud sandboxes, sandboxes api, run an interactive shell in a cloud sandbox"
@y
title: "Run an interactive shell in a cloud sandbox"
linkTitle: "Run an interactive shell in a cloud sandbox"
description: "Start a shell on a pseudo-terminal, send it input and read its output over one connection, connect again and pick up the output the service kept, and stop it."
keywords: "cloud sandboxes, sandboxes api, run an interactive shell in a cloud sandbox"
@z

@x
Run a process with a terminal when it expects interactive input. A terminal session differs from a captured command: you manage input, output, and connection lifetime.
@y
Run a process with a terminal when it expects interactive input. A terminal session differs from a captured command: you manage input, output, and connection lifetime.
@z

@x
Use a running sandbox handle from [your first sandbox](create-your-first-sandbox.md). Pass the command as an argument array, such as `['sh']`.
@y
Use a running sandbox handle from [your first sandbox](create-your-first-sandbox.md). Pass the command as an argument array, such as `['sh']`.
@z

@x
## Start a terminal process {#1-start-a-terminal-process}
@y
## Start a terminal process {#1-start-a-terminal-process}
@z

@x
Start the process with a pseudo-terminal and an initial terminal size. The returned process handle identifies this session. Save its resource name if you want to reconnect later.
@y
Start the process with a pseudo-terminal and an initial terminal size. The returned process handle identifies this session. Save its resource name if you want to reconnect later.
@z

@x
Use one idempotency key for this start request. Reconnecting does not require starting another process.
@y
Use one idempotency key for this start request. Reconnecting does not require starting another process.
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
return sandbox.processes.start(
  { args, pty: { initialSize: { rows: 40, cols: 120 } } },
  { idempotencyKey: requestId },
);
```
@y
```typescript
return sandbox.processes.start(
  { args, pty: { initialSize: { rows: 40, cols: 120 } } },
  { idempotencyKey: requestId },
);
```
@z

@x
<details>
<summary>Complete TypeScript example: shell/create.ts</summary>
@y
<details>
<summary>Complete TypeScript example: shell/create.ts</summary>
@z

@x
```typescript
import type { Sandbox } from '@docker/sandboxes';
@y
```typescript
import type { Sandbox } from '@docker/sandboxes';
@z

@x
export async function createProcess(
  sandbox: Sandbox,
  args: string[],
  requestId: string,
) {
  return sandbox.processes.start(
    { args, pty: { initialSize: { rows: 40, cols: 120 } } },
    { idempotencyKey: requestId },
  );
}
```
@y
export async function createProcess(
  sandbox: Sandbox,
  args: string[],
  requestId: string,
) {
  return sandbox.processes.start(
    { args, pty: { initialSize: { rows: 40, cols: 120 } } },
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
## Send input and read output {#2-send-input-and-read-output}
@y
## Send input and read output {#2-send-input-and-read-output}
@z

@x
Connect to the process, write input, and consume output events. This example sends a finite input buffer and closes standard input; a terminal application should keep input open until the user finishes.
@y
Connect to the process, write input, and consume output events. This example sends a finite input buffer and closes standard input; a terminal application should keep input open until the user finishes.
@z

@x
Forward output chunks to your terminal or callback. An exit event reports the process exit code. A connection ending without that event does not establish that the command finished.
@y
Forward output chunks to your terminal or callback. An exit event reports the process exit code. A connection ending without that event does not establish that the command finished.
@z

@x
Close the connection when you stop consuming it. Closing a connection and terminating the process are separate actions.
@y
Close the connection when you stop consuming it. Closing a connection and terminating the process are separate actions.
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
const connection = await process.connect();
try {
  await connection.write(stdin);
  await connection.closeStdin();
  for await (const event of connection) {
    if (event.type === 'chunk')
      write(
        event.data ?? new Uint8Array(),
        BigInt(event.streamSequence ?? '0'),
      );
    if (event.type === 'exited') return event.exitCode ?? 0;
  }
  throw new Error(
    `Stream for ${process.name} ended before the process exited`,
  );
} finally {
  await connection.close();
}
```
@y
```typescript
const connection = await process.connect();
try {
  await connection.write(stdin);
  await connection.closeStdin();
  for await (const event of connection) {
    if (event.type === 'chunk')
      write(
        event.data ?? new Uint8Array(),
        BigInt(event.streamSequence ?? '0'),
      );
    if (event.type === 'exited') return event.exitCode ?? 0;
  }
  throw new Error(
    `Stream for ${process.name} ended before the process exited`,
  );
} finally {
  await connection.close();
}
```
@z

@x
<details>
<summary>Complete TypeScript example: shell/attach.ts</summary>
@y
<details>
<summary>Complete TypeScript example: shell/attach.ts</summary>
@z

@x
```typescript
import type { Process } from '@docker/sandboxes';
@y
```typescript
import type { Process } from '@docker/sandboxes';
@z

@x
export async function attachToProcess(
  process: Process,
  stdin: Uint8Array,
  write: (bytes: Uint8Array, sequence: bigint) => void,
) {
  const connection = await process.connect();
  try {
    await connection.write(stdin);
    await connection.closeStdin();
    for await (const event of connection) {
      if (event.type === 'chunk')
        write(
          event.data ?? new Uint8Array(),
          BigInt(event.streamSequence ?? '0'),
        );
      if (event.type === 'exited') return event.exitCode ?? 0;
    }
    throw new Error(
      `Stream for ${process.name} ended before the process exited`,
    );
  } finally {
    await connection.close();
  }
}
```
@y
export async function attachToProcess(
  process: Process,
  stdin: Uint8Array,
  write: (bytes: Uint8Array, sequence: bigint) => void,
) {
  const connection = await process.connect();
  try {
    await connection.write(stdin);
    await connection.closeStdin();
    for await (const event of connection) {
      if (event.type === 'chunk')
        write(
          event.data ?? new Uint8Array(),
          BigInt(event.streamSequence ?? '0'),
        );
      if (event.type === 'exited') return event.exitCode ?? 0;
    }
    throw new Error(
      `Stream for ${process.name} ended before the process exited`,
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

@x
## Resume output after a disconnect {#3-resume-output-after-a-disconnect}
@y
## Resume output after a disconnect {#3-resume-output-after-a-disconnect}
@z

@x
Record the sequence number after handling each output chunk. On reconnect, pass the last handled sequence number to resume after that point.
@y
Record the sequence number after handling each output chunk. On reconnect, pass the last handled sequence number to resume after that point.
@z

@x
Connections opened through TypeScript process handles resume automatically after temporary disconnects while you consume output. They use the last chunk delivered to your application, not the last chunk your application saved elsewhere. Raw streams require explicit reconnection. Keep your own cursor if you need to resume after an application restart. Input is never replayed; if a write fails, check the process before sending that input again.
@y
Connections opened through TypeScript process handles resume automatically after temporary disconnects while you consume output. They use the last chunk delivered to your application, not the last chunk your application saved elsewhere. Raw streams require explicit reconnection. Keep your own cursor if you need to resume after an application restart. Input is never replayed; if a write fails, check the process before sending that input again.
@z

@x
Retain the process name with the cursor. A cursor from one process cannot identify output from another. Persist the cursor only after your application has handled the corresponding output.
@y
Retain the process name with the cursor. A cursor from one process cannot identify output from another. Persist the cursor only after your application has handled the corresponding output.
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
const connection = await process.connect({ resumeFrom });
let lastSequence = BigInt(resumeFrom);
try {
  for await (const event of connection) {
    if (event.type === 'chunk') {
      write(
        event.data ?? new Uint8Array(),
        (lastSequence = BigInt(event.streamSequence ?? '0')),
      );
    }
  }
  return lastSequence;
} finally {
  await connection.close();
}
```
@y
```typescript
const connection = await process.connect({ resumeFrom });
let lastSequence = BigInt(resumeFrom);
try {
  for await (const event of connection) {
    if (event.type === 'chunk') {
      write(
        event.data ?? new Uint8Array(),
        (lastSequence = BigInt(event.streamSequence ?? '0')),
      );
    }
  }
  return lastSequence;
} finally {
  await connection.close();
}
```
@z

@x
<details>
<summary>Complete TypeScript example: shell/resume.ts</summary>
@y
<details>
<summary>Complete TypeScript example: shell/resume.ts</summary>
@z

@x
```typescript
import type { Process } from '@docker/sandboxes';
@y
```typescript
import type { Process } from '@docker/sandboxes';
@z

@x
export async function resumeProcessOutput(
  process: Process,
  resumeFrom: bigint,
  write: (bytes: Uint8Array, sequence: bigint) => void,
) {
  const connection = await process.connect({ resumeFrom });
  let lastSequence = BigInt(resumeFrom);
  try {
    for await (const event of connection) {
      if (event.type === 'chunk') {
        write(
          event.data ?? new Uint8Array(),
          (lastSequence = BigInt(event.streamSequence ?? '0')),
        );
      }
    }
    return lastSequence;
  } finally {
    await connection.close();
  }
}
```
@y
export async function resumeProcessOutput(
  process: Process,
  resumeFrom: bigint,
  write: (bytes: Uint8Array, sequence: bigint) => void,
) {
  const connection = await process.connect({ resumeFrom });
  let lastSequence = BigInt(resumeFrom);
  try {
    for await (const event of connection) {
      if (event.type === 'chunk') {
        write(
          event.data ?? new Uint8Array(),
          (lastSequence = BigInt(event.streamSequence ?? '0')),
        );
      }
    }
    return lastSequence;
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

@x
## Send a signal {#4-send-a-signal}
@y
## Send a signal {#4-send-a-signal}
@z

@x
Get the process by name and send the signal your application intends. Use a graceful termination signal when the process should clean up its own files.
@y
Get the process by name and send the signal your application intends. Use a graceful termination signal when the process should clean up its own files.
@z

@x
Signals operate on the process; they do not delete the sandbox. [Delete the sandbox](delete-a-cloud-sandbox.md) separately when all work is finished.
@y
Signals operate on the process; they do not delete the sandbox. [Delete the sandbox](delete-a-cloud-sandbox.md) separately when all work is finished.
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
const process = await sandbox.processes.get(name);
await process.signal(signal);
```
@y
```typescript
const process = await sandbox.processes.get(name);
await process.signal(signal);
```
@z

@x
<details>
<summary>Complete TypeScript example: shell/signal.ts</summary>
@y
<details>
<summary>Complete TypeScript example: shell/signal.ts</summary>
@z

@x
```typescript
import type { Sandbox, Process } from '@docker/sandboxes';
@y
```typescript
import type { Sandbox, Process } from '@docker/sandboxes';
@z

@x
export async function signalProcess(
  sandbox: Sandbox,
  name: string,
  signal: Parameters<Process['signal']>[0],
) {
  const process = await sandbox.processes.get(name);
  await process.signal(signal);
}
```
@y
export async function signalProcess(
  sandbox: Sandbox,
  name: string,
  signal: Parameters<Process['signal']>[0],
) {
  const process = await sandbox.processes.get(name);
  await process.signal(signal);
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
