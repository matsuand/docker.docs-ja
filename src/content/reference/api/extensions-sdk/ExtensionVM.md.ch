%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Interface: ExtensionVM"
description: Docker extension API reference
keywords: Docker, extensions, sdk, API, reference
aliases:
 - /desktop/extensions-sdk/dev/api/reference/interfaces/ExtensionVM/
 - /extensions/extensions-sdk/dev/api/reference/interfaces/ExtensionVM/
---
@y
---
title: "Interface: ExtensionVM"
description: Docker extension API reference
keywords: Docker, extensions, sdk, API, reference
aliases:
 - /desktop/extensions-sdk/dev/api/reference/interfaces/ExtensionVM/
 - /extensions/extensions-sdk/dev/api/reference/interfaces/ExtensionVM/
---
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
Executes a command in the backend container.
@y
Executes a command in the backend container.
@z

@x
Example: Execute the command `ls -l` inside the backend container:
@y
Example: Execute the command `ls -l` inside the backend container:
@z

@x
```typescript
await ddClient.extension.vm.cli.exec(
  "ls",
  ["-l"]
);
```
@y
```typescript
await ddClient.extension.vm.cli.exec(
  "ls",
  ["-l"]
);
```
@z

@x
Streams the output of the command executed in the backend container.
@y
Streams the output of the command executed in the backend container.
@z

@x
When the extension defines its own `compose.yaml` file
with multiple containers, the command is executed on the first container defined.
Change the order in which containers are defined to execute commands on another
container.
@y
When the extension defines its own `compose.yaml` file
with multiple containers, the command is executed on the first container defined.
Change the order in which containers are defined to execute commands on another
container.
@z

@x
Example: Spawn the command `ls -l` inside the backend container:
@y
Example: Spawn the command `ls -l` inside the backend container:
@z

@x
```typescript
await ddClient.extension.vm.cli.exec("ls", ["-l"], {
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
await ddClient.extension.vm.cli.exec("ls", ["-l"], {
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
**`Param`**
@y
**`Param`**
@z

@x
Command to execute.
@y
Command to execute.
@z

@x
**`Param`**
@y
**`Param`**
@z

@x
Arguments of the command to execute.
@y
Arguments of the command to execute.
@z

@x
**`Param`**
@y
**`Param`**
@z

@x
The callback function where to listen from the command output data and errors.
@y
The callback function where to listen from the command output data and errors.
@z

@x
___
@y
___
@z

@x
### service
@y
### service
@z

@x
• `Optional` `Readonly` **service**: [`HttpService`](HttpService.md)
@y
• `Optional` `Readonly` **service**: [`HttpService`](HttpService.md)
@z
