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
# Interface: ExecResultV0
@y
# Interface: ExecResultV0
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
