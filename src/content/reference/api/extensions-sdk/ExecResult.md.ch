%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker extension API reference
keywords: Docker, extensions, sdk, API, reference
aliases:
 - /desktop/extensions-sdk/dev/api/reference/interfaces/ExecResult/
 - /extensions/extensions-sdk/dev/api/reference/interfaces/ExecResult/
---
@y
---
description: Docker extension API reference
keywords: Docker, extensions, sdk, API, reference
aliases:
 - /desktop/extensions-sdk/dev/api/reference/interfaces/ExecResult/
 - /extensions/extensions-sdk/dev/api/reference/interfaces/ExecResult/
---
@z

@x
# Interface: ExecResult
@y
# Interface: ExecResult
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
## Hierarchy
@y
## Hierarchy
@z

@x
- [`RawExecResult`](RawExecResult.md)
@y
- [`RawExecResult`](RawExecResult.md)
@z

@x
  ↳ **`ExecResult`**
@y
  ↳ **`ExecResult`**
@z

@x
## Methods
@y
## Methods
@z

@x
### lines
@y
### lines
@z

@x
▸ **lines**(): `string`[]
@y
▸ **lines**(): `string`[]
@z

@x
Split output lines.
@y
Split output lines.
@z

@x
#### Returns
@y
#### Returns
@z

@x
`string`[]
@y
`string`[]
@z

@x
The list of lines.
@y
The list of lines.
@z

@x
___
@y
___
@z

@x
### parseJsonLines
@y
### parseJsonLines
@z

@x
▸ **parseJsonLines**(): `any`[]
@y
▸ **parseJsonLines**(): `any`[]
@z

@x
Parse each output line as a JSON object.
@y
Parse each output line as a JSON object.
@z

@x
#### Returns
@y
#### Returns
@z

@x
`any`[]
@y
`any`[]
@z

@x
The list of lines where each line is a JSON object.
@y
The list of lines where each line is a JSON object.
@z

@x
___
@y
___
@z

@x
### parseJsonObject
@y
### parseJsonObject
@z

@x
▸ **parseJsonObject**(): `any`
@y
▸ **parseJsonObject**(): `any`
@z

@x
Parse a well-formed JSON output.
@y
Parse a well-formed JSON output.
@z

@x
#### Returns
@y
#### Returns
@z

@x
`any`
@y
`any`
@z

@x
The JSON object.
@y
The JSON object.
@z

@x
## Properties
@y
## Properties
@z

@x
### cmd
@y
### cmd
@z

@x
• `Optional` `Readonly` **cmd**: `string`
@y
• `Optional` `Readonly` **cmd**: `string`
@z

@x
#### Inherited from
@y
#### Inherited from
@z

@x
[RawExecResult](RawExecResult.md).[cmd](RawExecResult.md#cmd)
@y
[RawExecResult](RawExecResult.md).[cmd](RawExecResult.md#cmd)
@z

@x
___
@y
___
@z

@x
### killed
@y
### killed
@z

@x
• `Optional` `Readonly` **killed**: `boolean`
@y
• `Optional` `Readonly` **killed**: `boolean`
@z

@x
#### Inherited from
@y
#### Inherited from
@z

@x
[RawExecResult](RawExecResult.md).[killed](RawExecResult.md#killed)
@y
[RawExecResult](RawExecResult.md).[killed](RawExecResult.md#killed)
@z

@x
___
@y
___
@z

@x
### signal
@y
### signal
@z

@x
• `Optional` `Readonly` **signal**: `string`
@y
• `Optional` `Readonly` **signal**: `string`
@z

@x
#### Inherited from
@y
#### Inherited from
@z

@x
[RawExecResult](RawExecResult.md).[signal](RawExecResult.md#signal)
@y
[RawExecResult](RawExecResult.md).[signal](RawExecResult.md#signal)
@z

@x
___
@y
___
@z

@x
### code
@y
### code
@z

@x
• `Optional` `Readonly` **code**: `number`
@y
• `Optional` `Readonly` **code**: `number`
@z

@x
#### Inherited from
@y
#### Inherited from
@z

@x
[RawExecResult](RawExecResult.md).[code](RawExecResult.md#code)
@y
[RawExecResult](RawExecResult.md).[code](RawExecResult.md#code)
@z

@x
___
@y
___
@z

@x
### stdout
@y
### stdout
@z

@x
• `Readonly` **stdout**: `string`
@y
• `Readonly` **stdout**: `string`
@z

@x
#### Inherited from
@y
#### Inherited from
@z

@x
[RawExecResult](RawExecResult.md).[stdout](RawExecResult.md#stdout)
@y
[RawExecResult](RawExecResult.md).[stdout](RawExecResult.md#stdout)
@z

@x
___
@y
___
@z

@x
### stderr
@y
### stderr
@z

@x
• `Readonly` **stderr**: `string`
@y
• `Readonly` **stderr**: `string`
@z

@x
#### Inherited from
@y
#### Inherited from
@z

@x
[RawExecResult](RawExecResult.md).[stderr](RawExecResult.md#stderr)
@y
[RawExecResult](RawExecResult.md).[stderr](RawExecResult.md#stderr)
@z
