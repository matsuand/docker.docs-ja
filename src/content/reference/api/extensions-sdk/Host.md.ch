%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Interface: Host"
description: Docker extension API reference
keywords: Docker, extensions, sdk, API, reference
aliases: 
 - /desktop/extensions-sdk/dev/api/reference/interfaces/Host/
 - /extensions/extensions-sdk/dev/api/reference/interfaces/Host/
---
@y
---
title: "Interface: Host"
description: Docker extension API reference
keywords: Docker, extensions, sdk, API, reference
aliases: 
 - /desktop/extensions-sdk/dev/api/reference/interfaces/Host/
 - /extensions/extensions-sdk/dev/api/reference/interfaces/Host/
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
## Methods
@y
## Methods
@z

@x
### openExternal
@y
### openExternal
@z

@x
▸ **openExternal**(`url`): `void`
@y
▸ **openExternal**(`url`): `void`
@z

@x
Opens an external URL with the system default browser.
@y
Opens an external URL with the system default browser.
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
```typescript
ddClient.host.openExternal("https://docker.com");
```
@y
```typescript
ddClient.host.openExternal("https://docker.com");
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
| `url` | `string` | The URL the browser will open (must have the protocol `http` or `https`). |
@y
| Name | Type | Description |
| :------ | :------ | :------ |
| `url` | `string` | The URL the browser will open (must have the protocol `http` or `https`). |
@z

@x
#### Returns
@y
#### Returns
@z

@x
`void`
@y
`void`
@z

@x
## Properties
@y
## Properties
@z

@x
### platform
@y
### platform
@z

@x
• **platform**: `string`
@y
• **platform**: `string`
@z

@x
Returns a string identifying the operating system platform. See https://nodejs.org/api/os.html#osplatform
@y
Returns a string identifying the operating system platform. See https://nodejs.org/api/os.html#osplatform
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
___
@y
___
@z

@x
### arch
@y
### arch
@z

@x
• **arch**: `string`
@y
• **arch**: `string`
@z

@x
Returns the operating system CPU architecture. See https://nodejs.org/api/os.html#osarch
@y
Returns the operating system CPU architecture. See https://nodejs.org/api/os.html#osarch
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
___
@y
___
@z

@x
### hostname
@y
### hostname
@z

@x
• **hostname**: `string`
@y
• **hostname**: `string`
@z

@x
Returns the host name of the operating system. See https://nodejs.org/api/os.html#oshostname
@y
Returns the host name of the operating system. See https://nodejs.org/api/os.html#oshostname
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
