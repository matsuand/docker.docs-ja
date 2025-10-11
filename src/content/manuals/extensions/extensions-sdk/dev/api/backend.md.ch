%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Extension Backend
description: Docker extension API
keywords: Docker, extensions, sdk, API
@y
title: Extension Backend
description: Docker extension API
keywords: Docker, extensions, sdk, API
@z

@x
The `ddClient.extension.vm` object can be used to communicate with the backend defined in the [vm section](../../architecture/metadata.md#vm-section) of the extension metadata.
@y
The `ddClient.extension.vm` object can be used to communicate with the backend defined in the [vm section](../../architecture/metadata.md#vm-section) of the extension metadata.
@z

@x
## get
@y
## get
@z

@x
▸ **get**(`url`): `Promise`<`unknown`\>
@y
▸ **get**(`url`): `Promise`<`unknown`\>
@z

@x
Performs an HTTP GET request to a backend service.
@y
Performs an HTTP GET request to a backend service.
@z

@x
```typescript
ddClient.extension.vm.service
 .get("/some/service")
 .then((value: any) => console.log(value)
```
@y
```typescript
ddClient.extension.vm.service
 .get("/some/service")
 .then((value: any) => console.log(value)
```
@z

@x
See [Service API Reference](/reference/api/extensions-sdk/HttpService.md) for other methods such as POST, UPDATE, and DELETE.
@y
See [Service API Reference](reference/api/extensions-sdk/HttpService.md) for other methods such as POST, UPDATE, and DELETE.
@z

@x
> Deprecated extension backend communication
>
> The methods below that use `window.ddClient.backend` are deprecated and will be removed in a future version. Use the methods specified above.
@y
> Deprecated extension backend communication
>
> The methods below that use `window.ddClient.backend` are deprecated and will be removed in a future version. Use the methods specified above.
@z

@x
The `window.ddClient.backend` object can be used to communicate with the backend
defined in the [vm section](../../architecture/metadata.md#vm-section) of the
extension metadata. The client is already connected to the backend.
@y
The `window.ddClient.backend` object can be used to communicate with the backend
defined in the [vm section](../../architecture/metadata.md#vm-section) of the
extension metadata. The client is already connected to the backend.
@z

@x
Example usages:
@y
Example usages:
@z

@x
```typescript
window.ddClient.backend
  .get("/some/service")
  .then((value: any) => console.log(value));
@y
```typescript
window.ddClient.backend
  .get("/some/service")
  .then((value: any) => console.log(value));
@z

@x
window.ddClient.backend
  .post("/some/service", { ... })
  .then((value: any) => console.log(value));
@y
window.ddClient.backend
  .post("/some/service", { ... })
  .then((value: any) => console.log(value));
@z

@x
window.ddClient.backend
  .put("/some/service", { ... })
  .then((value: any) => console.log(value));
@y
window.ddClient.backend
  .put("/some/service", { ... })
  .then((value: any) => console.log(value));
@z

@x
window.ddClient.backend
  .patch("/some/service", { ... })
  .then((value: any) => console.log(value));
@y
window.ddClient.backend
  .patch("/some/service", { ... })
  .then((value: any) => console.log(value));
@z

@x
window.ddClient.backend
  .delete("/some/service")
  .then((value: any) => console.log(value));
@y
window.ddClient.backend
  .delete("/some/service")
  .then((value: any) => console.log(value));
@z

@x
window.ddClient.backend
  .head("/some/service")
  .then((value: any) => console.log(value));
@y
window.ddClient.backend
  .head("/some/service")
  .then((value: any) => console.log(value));
@z

@x
window.ddClient.backend
  .request({ url: "/url", method: "GET", headers: { 'header-key': 'header-value' }, data: { ... }})
  .then((value: any) => console.log(value));
```
@y
window.ddClient.backend
  .request({ url: "/url", method: "GET", headers: { 'header-key': 'header-value' }, data: { ... }})
  .then((value: any) => console.log(value));
```
@z

@x
## Run a command in the extension backend container
@y
## Run a command in the extension backend container
@z

@x
For example, execute the command `ls -l` inside the backend container:
@y
For example, execute the command `ls -l` inside the backend container:
@z

@x
```typescript
await ddClient.extension.vm.cli.exec("ls", ["-l"]);
```
@y
```typescript
await ddClient.extension.vm.cli.exec("ls", ["-l"]);
```
@z

@x
Stream the output of the command executed in the backend container. For example, spawn the command `ls -l` inside the backend container:
@y
Stream the output of the command executed in the backend container. For example, spawn the command `ls -l` inside the backend container:
@z

@x
```typescript
await ddClient.extension.vm.cli.exec("ls", ["-l"], {
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
  },
});
```
@y
```typescript
await ddClient.extension.vm.cli.exec("ls", ["-l"], {
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
  },
});
```
@z

@x
For more details, refer to the [Extension VM API Reference](/reference/api/extensions-sdk/ExtensionVM.md)
@y
For more details, refer to the [Extension VM API Reference](reference/api/extensions-sdk/ExtensionVM.md)
@z

@x
> Deprecated extension backend command execution
>
> This method is deprecated and will be removed in a future version. Use the specified method above.
@y
> Deprecated extension backend command execution
>
> This method is deprecated and will be removed in a future version. Use the specified method above.
@z

@x
If your extension ships with additional binaries that should be run inside the
backend container, you can use the `execInVMExtension` function:
@y
If your extension ships with additional binaries that should be run inside the
backend container, you can use the `execInVMExtension` function:
@z

@x
```typescript
const output = await window.ddClient.backend.execInVMExtension(
  `cliShippedInTheVm xxx`
);
console.log(output);
```
@y
```typescript
const output = await window.ddClient.backend.execInVMExtension(
  `cliShippedInTheVm xxx`
);
console.log(output);
```
@z

@x
## Invoke an extension binary on the host
@y
## Invoke an extension binary on the host
@z

@x
Invoke a binary on the host. The binary is typically shipped with your extension using the [host section](../../architecture/metadata.md#host-section) in the extension metadata. Note that extensions run with user access rights, this API is not restricted to binaries listed in the [host section](../../architecture/metadata.md#host-section) of the extension metadata (some extensions might install software during user interaction, and invoke newly installed binaries even if not listed in the extension metadata).
@y
Invoke a binary on the host. The binary is typically shipped with your extension using the [host section](../../architecture/metadata.md#host-section) in the extension metadata. Note that extensions run with user access rights, this API is not restricted to binaries listed in the [host section](../../architecture/metadata.md#host-section) of the extension metadata (some extensions might install software during user interaction, and invoke newly installed binaries even if not listed in the extension metadata).
@z

@x
For example, execute the shipped binary `kubectl -h` command in the host:
@y
For example, execute the shipped binary `kubectl -h` command in the host:
@z

@x
```typescript
await ddClient.extension.host.cli.exec("kubectl", ["-h"]);
```
@y
```typescript
await ddClient.extension.host.cli.exec("kubectl", ["-h"]);
```
@z

@x
As long as the `kubectl` binary is shipped as part of your extension, you can spawn the `kubectl -h` command in the host and get the output stream:
@y
As long as the `kubectl` binary is shipped as part of your extension, you can spawn the `kubectl -h` command in the host and get the output stream:
@z

@x
```typescript
await ddClient.extension.host.cli.exec("kubectl", ["-h"], {
  stream: {
    onOutput(data: { stdout: string } | { stderr: string }): void {
      if (data.stdout) {
        console.error(data.stdout);
      } else {
        console.log(data.stderr);
      }
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
await ddClient.extension.host.cli.exec("kubectl", ["-h"], {
  stream: {
    onOutput(data: { stdout: string } | { stderr: string }): void {
      if (data.stdout) {
        console.error(data.stdout);
      } else {
        console.log(data.stderr);
      }
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
You can stream the output of the command executed in the backend container or in the host.
@y
You can stream the output of the command executed in the backend container or in the host.
@z

@x
For more details, refer to the [Extension Host API Reference](/reference/api/extensions-sdk/ExtensionHost.md)
@y
For more details, refer to the [Extension Host API Reference](reference/api/extensions-sdk/ExtensionHost.md)
@z

@x
> Deprecated invocation of extension binary
>
> This method is deprecated and will be removed in a future version. Use the method specified above.
@y
> Deprecated invocation of extension binary
>
> This method is deprecated and will be removed in a future version. Use the method specified above.
@z

@x
To execute a command in the host:
@y
To execute a command in the host:
@z

@x
```typescript
window.ddClient.execHostCmd(`cliShippedOnHost xxx`).then((cmdResult: any) => {
  console.log(cmdResult);
});
```
@y
```typescript
window.ddClient.execHostCmd(`cliShippedOnHost xxx`).then((cmdResult: any) => {
  console.log(cmdResult);
});
```
@z

@x
To stream the output of the command executed in the backend container or in the host:
@y
To stream the output of the command executed in the backend container or in the host:
@z

@x
```typescript
window.ddClient.spawnHostCmd(
  `cliShippedOnHost`,
  [`arg1`, `arg2`],
  (data: any, err: any) => {
    console.log(data.stdout, data.stderr);
    // Once the command exits we get the status code
    if (data.code) {
      console.log(data.code);
    }
  }
);
```
@y
```typescript
window.ddClient.spawnHostCmd(
  `cliShippedOnHost`,
  [`arg1`, `arg2`],
  (data: any, err: any) => {
    console.log(data.stdout, data.stderr);
    // Once the command exits we get the status code
    if (data.code) {
      console.log(data.code);
    }
  }
);
```
@z

@x
> [!NOTE]
> 
>You cannot use this to chain commands in a single `exec()` invocation (like `cmd1 $(cmd2)` or using pipe between commands).
>
> You need to invoke `exec()` for each command and parse results to pass parameters to the next command if needed.
@y
> [!NOTE]
> 
>You cannot use this to chain commands in a single `exec()` invocation (like `cmd1 $(cmd2)` or using pipe between commands).
>
> You need to invoke `exec()` for each command and parse results to pass parameters to the next command if needed.
@z
