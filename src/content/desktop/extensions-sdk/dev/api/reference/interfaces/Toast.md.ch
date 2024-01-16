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
# Interface: Toast
@y
# Interface: Toast
@z

@x
Toasts provide a brief notification to the user.
They appear temporarily and shouldn't interrupt the user experience.
They also don't require user input to disappear.
@y
Toasts provide a brief notification to the user.
They appear temporarily and shouldn't interrupt the user experience.
They also don't require user input to disappear.
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
### success
@y
### success
@z

@x
▸ **success**(`msg`): `void`
@y
▸ **success**(`msg`): `void`
@z

@x
Display a toast message of type success.
@y
Display a toast message of type success.
@z

@x
```typescript
ddClient.desktopUI.toast.success("message");
```
@y
```typescript
ddClient.desktopUI.toast.success("message");
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
| `msg` | `string` | The message to display in the toast. |
@y
| Name | Type | Description |
| :------ | :------ | :------ |
| `msg` | `string` | The message to display in the toast. |
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
___
@y
___
@z

@x
### warning
@y
### warning
@z

@x
▸ **warning**(`msg`): `void`
@y
▸ **warning**(`msg`): `void`
@z

@x
Display a toast message of type warning.
@y
Display a toast message of type warning.
@z

@x
```typescript
ddClient.desktopUI.toast.warning("message");
```
@y
```typescript
ddClient.desktopUI.toast.warning("message");
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
| `msg` | `string` | The message to display in the warning. |
@y
| Name | Type | Description |
| :------ | :------ | :------ |
| `msg` | `string` | The message to display in the warning. |
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
___
@y
___
@z

@x
### error
@y
### error
@z

@x
▸ **error**(`msg`): `void`
@y
▸ **error**(`msg`): `void`
@z

@x
Display a toast message of type error.
@y
Display a toast message of type error.
@z

@x
```typescript
ddClient.desktopUI.toast.error("message");
```
@y
```typescript
ddClient.desktopUI.toast.error("message");
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
| `msg` | `string` | The message to display in the toast. |
@y
| Name | Type | Description |
| :------ | :------ | :------ |
| `msg` | `string` | The message to display in the toast. |
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
