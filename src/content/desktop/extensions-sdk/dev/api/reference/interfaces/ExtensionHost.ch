%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker extension API reference
keywords: Docker, extensions, sdk, API, reference
skip_read_time: true
---
@y
---
description: Docker extension API reference
keywords: Docker, extensions, sdk, API, reference
skip_read_time: true
---
@z

@x
# Interface: ExtensionHost
@y
# Interface: ExtensionHost
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
• `Readonly` **cli**: [`ExtensionCli`](ExtensionCli.md)
@y
• `Readonly` **cli**: [`ExtensionCli`](ExtensionCli.md)
@z

@x
Executes a command in the host.
@y
Executes a command in the host.
@z

@x
For example, execute the shipped binary `kubectl -h` command in the **host**:
@y
For example, execute the shipped binary `kubectl -h` command in the **host**:
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
---
@y
---
@z

@x
Streams the output of the command executed in the backend container or in the host.
@y
Streams the output of the command executed in the backend container or in the host.
@z

@x
Provided the `kubectl` binary is shipped as part of your extension, you can spawn the `kubectl -h` command in the **host**:
@y
Provided the `kubectl` binary is shipped as part of your extension, you can spawn the `kubectl -h` command in the **host**:
@z

@x
```typescript
await ddClient.extension.host.cli.exec("kubectl", ["-h"], {
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
await ddClient.extension.host.cli.exec("kubectl", ["-h"], {
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
