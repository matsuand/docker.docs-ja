%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker extension API reference
keywords: Docker, extensions, sdk, API, reference
aliases: 
 - /desktop/extensions-sdk/dev/api/reference/interfaces/Exec/
 - /extensions/extensions-sdk/dev/api/reference/interfaces/Exec/
---
@y
---
description: Docker extension API reference
keywords: Docker, extensions, sdk, API, reference
aliases: 
 - /desktop/extensions-sdk/dev/api/reference/interfaces/Exec/
 - /extensions/extensions-sdk/dev/api/reference/interfaces/Exec/
---
@z

@x
# Interface: Exec
@y
# Interface: Exec
@z

@x
## Callable
@y
## Callable
@z

@x
### Exec
@y
### Exec
@z

@x
▸ **Exec**(`cmd`, `args`, `options?`): `Promise`<[`ExecResult`](ExecResult.md)\>
@y
▸ **Exec**(`cmd`, `args`, `options?`): `Promise`<[`ExecResult`](ExecResult.md)\>
@z

@x
Executes a command.
@y
Executes a command.
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
#### Parameters
@y
#### Parameters
@z

@x
| Name | Type | Description |
| :------ | :------ | :------ |
| `cmd` | `string` | The command to execute. |
| `args` | `string`[] | The arguments of the command to execute. |
| `options?` | [`ExecOptions`](ExecOptions.md) | The list of options. |
@y
| Name | Type | Description |
| :------ | :------ | :------ |
| `cmd` | `string` | The command to execute. |
| `args` | `string`[] | The arguments of the command to execute. |
| `options?` | [`ExecOptions`](ExecOptions.md) | The list of options. |
@z

@x
#### Returns
@y
#### Returns
@z

@x
`Promise`<[`ExecResult`](ExecResult.md)\>
@y
`Promise`<[`ExecResult`](ExecResult.md)\>
@z

@x
A promise that will resolve once the command finishes.
@y
A promise that will resolve once the command finishes.
@z

@x
### Exec
@y
### Exec
@z

@x
▸ **Exec**(`cmd`, `args`, `options`): [`ExecProcess`](ExecProcess.md)
@y
▸ **Exec**(`cmd`, `args`, `options`): [`ExecProcess`](ExecProcess.md)
@z

@x
Streams the result of a command if `stream` is specified in the `options` parameter.
@y
Streams the result of a command if `stream` is specified in the `options` parameter.
@z

@x
Specify the `stream` if the output of your command is too long or if you need to stream things indefinitely (for example container logs).
@y
Specify the `stream` if the output of your command is too long or if you need to stream things indefinitely (for example container logs).
@z

@x
**`Since`**
@y
**`Since`**
@z

@x
0.2.2
@y
0.2.2
@z

@x
#### Parameters
@y
#### Parameters
@z

@x
| Name | Type | Description |
| :------ | :------ | :------ |
| `cmd` | `string` | The command to execute. |
| `args` | `string`[] | The arguments of the command to execute. |
| `options` | [`SpawnOptions`](SpawnOptions.md) | The list of options. |
@y
| Name | Type | Description |
| :------ | :------ | :------ |
| `cmd` | `string` | The command to execute. |
| `args` | `string`[] | The arguments of the command to execute. |
| `options` | [`SpawnOptions`](SpawnOptions.md) | The list of options. |
@z

@x
#### Returns
@y
#### Returns
@z

@x
[`ExecProcess`](ExecProcess.md)
@y
[`ExecProcess`](ExecProcess.md)
@z

@x
The spawned process.
@y
The spawned process.
@z
