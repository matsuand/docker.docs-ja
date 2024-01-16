%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker extension API reference
keywords: Docker, extensions, sdk, API, reference
---
@y
---
description: Docker extension API reference
keywords: Docker, extensions, sdk, API, reference
---
@z

@x
# Interface: Docker
@y
# Interface: Docker
@z

@x
**`Since`**
@y
**`Since`**
@z

@x
0.2.0
@y
0.2.0
@z

@x
## Properties
@y
## Properties
@z

@x
### cli
@y
### cli
@z

@x
• `Readonly` **cli**: [`DockerCommand`](DockerCommand.md)
@y
• `Readonly` **cli**: [`DockerCommand`](DockerCommand.md)
@z

@x
You can also directly execute the Docker binary.
@y
You can also directly execute the Docker binary.
@z

@x
```typescript
const output = await ddClient.docker.cli.exec("volume", [
  "ls",
  "--filter",
  "dangling=true"
]);
```
@y
```typescript
const output = await ddClient.docker.cli.exec("volume", [
  "ls",
  "--filter",
  "dangling=true"
]);
```
@z

@x
Output:
@y
Output:
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
For convenience, the command result object also has methods to easily parse it depending on output format. See [ExecResult](ExecResult.md) instead.
@y
For convenience, the command result object also has methods to easily parse it depending on output format. See [ExecResult](ExecResult.md) instead.
@z

@x
---
@y
---
@z

@x
Streams the output as a result of the execution of a Docker command.
It is useful when the output of the command is too long, or you need to get the output as a stream.
@y
Streams the output as a result of the execution of a Docker command.
It is useful when the output of the command is too long, or you need to get the output as a stream.
@z

@x
```typescript
await ddClient.docker.cli.exec("logs", ["-f", "..."], {
  stream: {
    onOutput(data): void {
        // As we can receive both `stdout` and `stderr`, we wrap them in a JSON object
        JSON.stringify(
          {
            stdout: data.stdout,
            stderr: data.stderr,
          },
          null,
          "  "
        );
    },
    onError(error: any): void {
      console.error(error);
    },
    onClose(exitCode: number): void {
      console.log("onClose with exit code " + exitCode);
    },
  },
});
```
@y
```typescript
await ddClient.docker.cli.exec("logs", ["-f", "..."], {
  stream: {
    onOutput(data): void {
        // As we can receive both `stdout` and `stderr`, we wrap them in a JSON object
        JSON.stringify(
          {
            stdout: data.stdout,
            stderr: data.stderr,
          },
          null,
          "  "
        );
    },
    onError(error: any): void {
      console.error(error);
    },
    onClose(exitCode: number): void {
      console.log("onClose with exit code " + exitCode);
    },
  },
});
```
@z

@x
## Methods
@y
## Methods
@z

@x
### listContainers
@y
### listContainers
@z

@x
▸ **listContainers**(`options?`): `Promise`<`unknown`\>
@y
▸ **listContainers**(`options?`): `Promise`<`unknown`\>
@z

@x
Get the list of running containers (same as `docker ps`).
@y
Get the list of running containers (same as `docker ps`).
@z

@x
By default, this will not list stopped containers.
You can use the option `{"all": true}` to list all the running and stopped containers.
@y
By default, this will not list stopped containers.
You can use the option `{"all": true}` to list all the running and stopped containers.
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
#### Parameters
@y
#### Parameters
@z

@x
| Name | Type | Description |
| :------ | :------ | :------ |
| `options?` | `any` | (Optional). A JSON like `{ "all": true, "limit": 10, "size": true, "filters": JSON.stringify({ status: ["exited"] }), }` For more information about the different properties see [the Docker API endpoint documentation](https://docs.docker.com/engine/api/v1.41/#operation/ContainerList). |
@y
| Name | Type | Description |
| :------ | :------ | :------ |
| `options?` | `any` | (Optional). A JSON like `{ "all": true, "limit": 10, "size": true, "filters": JSON.stringify({ status: ["exited"] }), }` For more information about the different properties see [the Docker API endpoint documentation](https://docs.docker.com/engine/api/v1.41/#operation/ContainerList). |
@z

@x
#### Returns
@y
#### Returns
@z

@x
`Promise`<`unknown`\>
@y
`Promise`<`unknown`\>
@z

@x
---
@y
---
@z

@x
### listImages
@y
### listImages
@z

@x
▸ **listImages**(`options?`): `Promise`<`unknown`\>
@y
▸ **listImages**(`options?`): `Promise`<`unknown`\>
@z

@x
Get the list of local container images
@y
Get the list of local container images
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
#### Parameters
@y
#### Parameters
@z

@x
| Name | Type | Description |
| :------ | :------ | :------ |
| `options?` | `any` | (Optional). A JSON like `{ "all": true, "filters": JSON.stringify({ dangling: ["true"] }), "digests": true * }` For more information about the different properties see [the Docker API endpoint documentation](https://docs.docker.com/engine/api/v1.41/#tag/Image). |
@y
| Name | Type | Description |
| :------ | :------ | :------ |
| `options?` | `any` | (Optional). A JSON like `{ "all": true, "filters": JSON.stringify({ dangling: ["true"] }), "digests": true * }` For more information about the different properties see [the Docker API endpoint documentation](https://docs.docker.com/engine/api/v1.41/#tag/Image). |
@z

@x
#### Returns
@y
#### Returns
@z

@x
`Promise`<`unknown`\>
@y
`Promise`<`unknown`\>
@z
