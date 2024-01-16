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
# Interface: ExecStreamOptions
@y
# Interface: ExecStreamOptions
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
## Properties
@y
## Properties
@z

@x
### onOutput
@y
### onOutput
@z

@x
• `Optional` **onOutput**: (`data`: { `stdout`: `string` ; `stderr?`: `undefined`  } \| { `stdout?`: `undefined` ; `stderr`: `string`  }) => `void`
@y
• `Optional` **onOutput**: (`data`: { `stdout`: `string` ; `stderr?`: `undefined`  } \| { `stdout?`: `undefined` ; `stderr`: `string`  }) => `void`
@z

@x
#### Type declaration
@y
#### Type declaration
@z

@x
▸ (`data`): `void`
@y
▸ (`data`): `void`
@z

@x
Invoked when receiving output from command execution.
By default, the output is split into chunks at arbitrary boundaries.
If you prefer the output to be split into complete lines, set `splitOutputLines`
to true. The callback is then invoked once for each line.
@y
Invoked when receiving output from command execution.
By default, the output is split into chunks at arbitrary boundaries.
If you prefer the output to be split into complete lines, set `splitOutputLines`
to true. The callback is then invoked once for each line.
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
##### Parameters
@y
##### Parameters
@z

@x
| Name | Type | Description |
| :------ | :------ | :------ |
| `data` | `{ stdout: string; stderr?: undefined } \| { stdout?: undefined; stderr: string }` | Output content. Can include either stdout string, or stderr string, one at a time. |
@y
| Name | Type | Description |
| :------ | :------ | :------ |
| `data` | `{ stdout: string; stderr?: undefined } \| { stdout?: undefined; stderr: string }` | Output content. Can include either stdout string, or stderr string, one at a time. |
@z

@x
##### Returns
@y
##### Returns
@z

@x
`void`
@y
`void`
@z

@x
___
@y
___
@z

@x
### onError
@y
### onError
@z

@x
• `Optional` **onError**: (`error`: `any`) => `void`
@y
• `Optional` **onError**: (`error`: `any`) => `void`
@z

@x
#### Type declaration
@y
#### Type declaration
@z

@x
▸ (`error`): `void`
@y
▸ (`error`): `void`
@z

@x
Invoked to report error if the executed command errors.
@y
Invoked to report error if the executed command errors.
@z

@x
##### Parameters
@y
##### Parameters
@z

@x
| Name | Type | Description |
| :------ | :------ | :------ |
| `error` | `any` | The error happening in the executed command |
@y
| Name | Type | Description |
| :------ | :------ | :------ |
| `error` | `any` | The error happening in the executed command |
@z

@x
##### Returns
@y
##### Returns
@z

@x
`void`
@y
`void`
@z

@x
___
@y
___
@z

@x
### onClose
@y
### onClose
@z

@x
• `Optional` **onClose**: (`exitCode`: `number`) => `void`
@y
• `Optional` **onClose**: (`exitCode`: `number`) => `void`
@z

@x
#### Type declaration
@y
#### Type declaration
@z

@x
▸ (`exitCode`): `void`
@y
▸ (`exitCode`): `void`
@z

@x
Invoked when process exits.
@y
Invoked when process exits.
@z

@x
##### Parameters
@y
##### Parameters
@z

@x
| Name | Type | Description |
| :------ | :------ | :------ |
| `exitCode` | `number` | The process exit code |
@y
| Name | Type | Description |
| :------ | :------ | :------ |
| `exitCode` | `number` | The process exit code |
@z

@x
##### Returns
@y
##### Returns
@z

@x
`void`
@y
`void`
@z

@x
___
@y
___
@z

@x
### splitOutputLines
@y
### splitOutputLines
@z

@x
• `Optional` `Readonly` **splitOutputLines**: `boolean`
@y
• `Optional` `Readonly` **splitOutputLines**: `boolean`
@z

@x
Specifies the behaviour invoking `onOutput(data)`. Raw output by default, splitting output at any position. If set to true, `onOutput` will be invoked once for each line.
@y
Specifies the behaviour invoking `onOutput(data)`. Raw output by default, splitting output at any position. If set to true, `onOutput` will be invoked once for each line.
@z
