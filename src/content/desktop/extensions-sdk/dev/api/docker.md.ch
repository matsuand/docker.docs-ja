%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Docker
description: Docker extension API
keywords: Docker, extensions, sdk, API
---
@y
---
title: Docker
description: Docker extension API
keywords: Docker, extensions, sdk, API
---
@z

@x
## Docker objects
@y
## Docker objects
@z

@x
▸ **listContainers**(`options?`): `Promise`<`unknown`\>
@y
▸ **listContainers**(`options?`): `Promise`<`unknown`\>
@z

@x
To get the list of containers:
@y
To get the list of containers:
@z

@x
```typescript
const containers = await ddClient.docker.listContainers();
```
@y
```typescript
const containers = await ddClient.docker.listContainers();
```
@z

@x
▸ **listImages**(`options?`): `Promise`<`unknown`\>
@y
▸ **listImages**(`options?`): `Promise`<`unknown`\>
@z

@x
To get the list of local container images:
@y
To get the list of local container images:
@z

@x
```typescript
const images = await ddClient.docker.listImages();
```
@y
```typescript
const images = await ddClient.docker.listImages();
```
@z

@x
See the [Docker API reference](reference/interfaces/Docker.md) for details about these methods.
@y
See the [Docker API reference](reference/interfaces/Docker.md) for details about these methods.
@z

@x
> Deprecated access to Docker objects
>
> The methods below are deprecated and will be removed in a future version. Use the methods specified above.
@y
> Deprecated access to Docker objects
>
> The methods below are deprecated and will be removed in a future version. Use the methods specified above.
@z

@x
```typescript
const containers = await window.ddClient.listContainers();
@y
```typescript
const containers = await window.ddClient.listContainers();
@z

@x
const images = await window.ddClient.listImages();
```
@y
const images = await window.ddClient.listImages();
```
@z

@x
## Docker commands
@y
## Docker commands
@z

@x
Extensions can also directly execute the `docker` command line.
@y
Extensions can also directly execute the `docker` command line.
@z

@x
▸ **exec**(`cmd`, `args`): `Promise`<[`ExecResult`](reference/interfaces/ExecResult.md)\>
@y
▸ **exec**(`cmd`, `args`): `Promise`<[`ExecResult`](reference/interfaces/ExecResult.md)\>
@z

@x
```typescript
const result = await ddClient.docker.cli.exec("info", [
  "--format",
  '"{{ json . }}"',
]);
```
@y
```typescript
const result = await ddClient.docker.cli.exec("info", [
  "--format",
  '"{{ json . }}"',
]);
```
@z

@x
The result contains both the standard output and the standard error of the executed command:
@y
The result contains both the standard output and the standard error of the executed command:
@z

@x
```json
{
  "stderr": "...",
  "stdout": "..."
}
```
@y
```json
{
  "stderr": "...",
  "stdout": "..."
}
```
@z

@x
In this example, the command output is JSON.
For convenience, the command result object also has methods to easily parse it:
@y
In this example, the command output is JSON.
For convenience, the command result object also has methods to easily parse it:
@z

@x
- `result.lines(): string[]` splits output lines.
- `result.parseJsonObject(): any` parses a well-formed json output.
- `result.parseJsonLines(): any[]` parses each output line as a json object.
@y
- `result.lines(): string[]` splits output lines.
- `result.parseJsonObject(): any` parses a well-formed json output.
- `result.parseJsonLines(): any[]` parses each output line as a json object.
@z

@x
▸ **exec**(`cmd`, `args`, `options`): `void`
@y
▸ **exec**(`cmd`, `args`, `options`): `void`
@z

@x
The command above streams the output as a result of the execution of a Docker command.
This is useful if you need to get the output as a stream or the output of the command is too long.
@y
The command above streams the output as a result of the execution of a Docker command.
This is useful if you need to get the output as a stream or the output of the command is too long.
@z

@x
```typescript
await ddClient.docker.cli.exec("logs", ["-f", "..."], {
  stream: {
    onOutput(data) {
      if (data.stdout) {
        console.error(data.stdout);
      } else {
        console.log(data.stderr);
      }
    },
    onError(error) {
      console.error(error);
    },
    onClose(exitCode) {
      console.log("onClose with exit code " + exitCode);
    },
    splitOutputLines: true,
  },
});
```
@y
```typescript
await ddClient.docker.cli.exec("logs", ["-f", "..."], {
  stream: {
    onOutput(data) {
      if (data.stdout) {
        console.error(data.stdout);
      } else {
        console.log(data.stderr);
      }
    },
    onError(error) {
      console.error(error);
    },
    onClose(exitCode) {
      console.log("onClose with exit code " + exitCode);
    },
    splitOutputLines: true,
  },
});
```
@z

@x
The child process created by the extension is killed (`SIGTERM`) automatically when you close the dashboard in Docker Desktop or when you exit the extension UI.
If needed, you can also use the result of the `exec(streamOptions)` call in order to kill (`SIGTERM`) the process.
@y
The child process created by the extension is killed (`SIGTERM`) automatically when you close the dashboard in Docker Desktop or when you exit the extension UI.
If needed, you can also use the result of the `exec(streamOptions)` call in order to kill (`SIGTERM`) the process.
@z

@x
```typescript
const logListener = await ddClient.docker.cli.exec("logs", ["-f", "..."], {
  stream: {
    // ...
  },
});
@y
```typescript
const logListener = await ddClient.docker.cli.exec("logs", ["-f", "..."], {
  stream: {
    // ...
  },
});
@z

@x
// when done listening to logs or before starting a new one, kill the process
logListener.close();
```
@y
// when done listening to logs or before starting a new one, kill the process
logListener.close();
```
@z

@x
This `exec(streamOptions)` API can also be used to listen to docker events:
@y
This `exec(streamOptions)` API can also be used to listen to docker events:
@z

@x
```typescript
await ddClient.docker.cli.exec(
  "events",
  ["--format", "{{ json . }}", "--filter", "container=my-container"],
  {
    stream: {
      onOutput(data) {
        if (data.stdout) {
          const event = JSON.parse(data.stdout);
          console.log(event);
        } else {
          console.log(data.stderr);
        }
      },
      onClose(exitCode) {
        console.log("onClose with exit code " + exitCode);
      },
      splitOutputLines: true,
    },
  }
);
```
@y
```typescript
await ddClient.docker.cli.exec(
  "events",
  ["--format", "{{ json . }}", "--filter", "container=my-container"],
  {
    stream: {
      onOutput(data) {
        if (data.stdout) {
          const event = JSON.parse(data.stdout);
          console.log(event);
        } else {
          console.log(data.stderr);
        }
      },
      onClose(exitCode) {
        console.log("onClose with exit code " + exitCode);
      },
      splitOutputLines: true,
    },
  }
);
```
@z

@x
> **Note**
>
>You cannot use this to chain commands in a single `exec()` invocation (like `docker kill $(docker ps -q)` or using pipe between commands).
>
> You need to invoke `exec()` for each command and parse results to pass parameters to the next command if needed.
@y
> **Note**
>
>You cannot use this to chain commands in a single `exec()` invocation (like `docker kill $(docker ps -q)` or using pipe between commands).
>
> You need to invoke `exec()` for each command and parse results to pass parameters to the next command if needed.
@z

@x
See the [Exec API reference](reference/interfaces/Exec.md) for details about these methods.
@y
See the [Exec API reference](reference/interfaces/Exec.md) for details about these methods.
@z

@x
> Deprecated execution of Docker commands
>
> This method is deprecated and will be removed in a future version. Use the one specified just below.
@y
> Deprecated execution of Docker commands
>
> This method is deprecated and will be removed in a future version. Use the one specified just below.
@z

@x
```typescript
const output = await window.ddClient.execDockerCmd(
  "info",
  "--format",
  '"{{ json . }}"'
);
@y
```typescript
const output = await window.ddClient.execDockerCmd(
  "info",
  "--format",
  '"{{ json . }}"'
);
@z

@x
window.ddClient.spawnDockerCmd("logs", ["-f", "..."], (data, error) => {
  console.log(data.stdout);
});
```
@y
window.ddClient.spawnDockerCmd("logs", ["-f", "..."], (data, error) => {
  console.log(data.stdout);
});
```
@z
