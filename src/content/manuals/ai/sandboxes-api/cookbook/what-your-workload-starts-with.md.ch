%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "What your workload starts with"
linkTitle: "What your workload starts with"
description: "Read the environment variables every command in a sandbox starts with, and see which source wins when two of them set the same name."
keywords: "cloud sandboxes, sandboxes api, what your workload starts with"
@y
title: "What your workload starts with"
linkTitle: "What your workload starts with"
description: "Read the environment variables every command in a sandbox starts with, and see which source wins when two of them set the same name."
keywords: "cloud sandboxes, sandboxes api, what your workload starts with"
@z

@x
Inspect the environment a process receives and override a value for one command. This helps diagnose a missing workspace path or configuration setting.
@y
Inspect the environment a process receives and override a value for one command. This helps diagnose a missing workspace path or configuration setting.
@z

@x
Use a running sandbox handle. The environment can contain credentials, so do not dump the full result into logs or send it to an untrusted client.
@y
Use a running sandbox handle. The environment can contain credentials, so do not dump the full result into logs or send it to an untrusted client.
@z

@x
## Read the process environment {#1-read-the-process-environment}
@y
## Read the process environment {#1-read-the-process-environment}
@z

@x
Run `env` and parse its output. Read `WORKSPACE_DIR` to locate the workspace rather than assuming a fixed path.
@y
Run `env` and parse its output. Read `WORKSPACE_DIR` to locate the workspace rather than assuming a fixed path.
@z

@x
This reports the environment seen by that process. It is a diagnostic example, not a way to retrieve stored secret values.
@y
This reports the environment seen by that process. It is a diagnostic example, not a way to retrieve stored secret values.
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
export async function readFloor(sandbox: Sandbox) {
  const result = requireSuccess(
    await sandbox.processes.run({ args: ['env'] }, { timeoutMs: 300_000 }),
  );
  return Object.fromEntries(
    result.stdout
      .split('\n')
      .filter((line) => line.includes('='))
      .map((line) => {
        const delimiter = line.indexOf('=');
        return [line.slice(0, delimiter), line.slice(delimiter + 1)];
      }),
  );
}
```
@y
```typescript
export async function readFloor(sandbox: Sandbox) {
  const result = requireSuccess(
    await sandbox.processes.run({ args: ['env'] }, { timeoutMs: 300_000 }),
  );
  return Object.fromEntries(
    result.stdout
      .split('\n')
      .filter((line) => line.includes('='))
      .map((line) => {
        const delimiter = line.indexOf('=');
        return [line.slice(0, delimiter), line.slice(delimiter + 1)];
      }),
  );
}
```
@z

@x
<details>
<summary>Complete TypeScript example: runtime/read.ts</summary>
@y
<details>
<summary>Complete TypeScript example: runtime/read.ts</summary>
@z

@x
```typescript
import { requireSuccess, type Sandbox } from '@docker/sandboxes';
@y
```typescript
import { requireSuccess, type Sandbox } from '@docker/sandboxes';
@z

@x
export async function readFloor(sandbox: Sandbox) {
  const result = requireSuccess(
    await sandbox.processes.run({ args: ['env'] }, { timeoutMs: 300_000 }),
  );
  return Object.fromEntries(
    result.stdout
      .split('\n')
      .filter((line) => line.includes('='))
      .map((line) => {
        const delimiter = line.indexOf('=');
        return [line.slice(0, delimiter), line.slice(delimiter + 1)];
      }),
  );
}
```
@y
export async function readFloor(sandbox: Sandbox) {
  const result = requireSuccess(
    await sandbox.processes.run({ args: ['env'] }, { timeoutMs: 300_000 }),
  );
  return Object.fromEntries(
    result.stdout
      .split('\n')
      .filter((line) => line.includes('='))
      .map((line) => {
        const delimiter = line.indexOf('=');
        return [line.slice(0, delimiter), line.slice(delimiter + 1)];
      }),
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
## Override a variable for one command {#2-override-a-variable-for-one-command}
@y
## Override a variable for one command {#2-override-a-variable-for-one-command}
@z

@x
Supply a value in the process request's environment map. The first command reads that override. A second command without the override reads the sandbox's original value.
@y
Supply a value in the process request's environment map. The first command reads that override. A second command without the override reads the sandbox's original value.
@z

@x
The override belongs to the process request and does not change the sandbox's environment for later commands. Use it for task-specific configuration. For provider credentials, prefer [stored secrets](get-a-stored-secret-into-a-sandbox.md).
@y
The override belongs to the process request and does not change the sandbox's environment for later commands. Use it for task-specific configuration. For provider credentials, prefer [stored secrets](get-a-stored-secret-into-a-sandbox.md).
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
const fromRequest = requireSuccess(
  await sandbox.processes.run(
    {
      args: ['printenv', name],
      env: { [name]: value },
    },
    { timeoutMs: 300_000 },
  ),
);
const fromSandbox = await sandbox.processes.run(
  {
    args: ['printenv', name],
  },
  { timeoutMs: 300_000 },
);
return {
  fromRequest: fromRequest.stdout.trimEnd(),
  fromSandbox: fromSandbox.stdout.trimEnd(),
};
```
@y
```typescript
const fromRequest = requireSuccess(
  await sandbox.processes.run(
    {
      args: ['printenv', name],
      env: { [name]: value },
    },
    { timeoutMs: 300_000 },
  ),
);
const fromSandbox = await sandbox.processes.run(
  {
    args: ['printenv', name],
  },
  { timeoutMs: 300_000 },
);
return {
  fromRequest: fromRequest.stdout.trimEnd(),
  fromSandbox: fromSandbox.stdout.trimEnd(),
};
```
@z

@x
<details>
<summary>Complete TypeScript example: runtime/precedence.ts</summary>
@y
<details>
<summary>Complete TypeScript example: runtime/precedence.ts</summary>
@z

@x
```typescript
import { requireSuccess, type Sandbox } from '@docker/sandboxes';
@y
```typescript
import { requireSuccess, type Sandbox } from '@docker/sandboxes';
@z

@x
export async function overrideVariable(
  sandbox: Sandbox,
  name: string,
  value: string,
) {
  const fromRequest = requireSuccess(
    await sandbox.processes.run(
      {
        args: ['printenv', name],
        env: { [name]: value },
      },
      { timeoutMs: 300_000 },
    ),
  );
  const fromSandbox = await sandbox.processes.run(
    {
      args: ['printenv', name],
    },
    { timeoutMs: 300_000 },
  );
  return {
    fromRequest: fromRequest.stdout.trimEnd(),
    fromSandbox: fromSandbox.stdout.trimEnd(),
  };
}
```
@y
export async function overrideVariable(
  sandbox: Sandbox,
  name: string,
  value: string,
) {
  const fromRequest = requireSuccess(
    await sandbox.processes.run(
      {
        args: ['printenv', name],
        env: { [name]: value },
      },
      { timeoutMs: 300_000 },
    ),
  );
  const fromSandbox = await sandbox.processes.run(
    {
      args: ['printenv', name],
    },
    { timeoutMs: 300_000 },
  );
  return {
    fromRequest: fromRequest.stdout.trimEnd(),
    fromSandbox: fromSandbox.stdout.trimEnd(),
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
