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
# Interface: Dialog
@y
# Interface: Dialog
@z

@x
Allows opening native dialog boxes.
@y
Allows opening native dialog boxes.
@z

@x
**`Since`**
@y
**`Since`**
@z

@x
0.2.3
@y
0.2.3
@z

@x
## Methods
@y
## Methods
@z

@x
### showOpenDialog
@y
### showOpenDialog
@z

@x
▸ **showOpenDialog**(`dialogProperties`): `Promise`<[`OpenDialogResult`](OpenDialogResult.md)\>
@y
▸ **showOpenDialog**(`dialogProperties`): `Promise`<[`OpenDialogResult`](OpenDialogResult.md)\>
@z

@x
Display a native open dialog. Lets you select a file or a folder.
@y
Display a native open dialog. Lets you select a file or a folder.
@z

@x
```typescript
ddClient.desktopUI.dialog.showOpenDialog({properties: ['openFile']});
```
@y
```typescript
ddClient.desktopUI.dialog.showOpenDialog({properties: ['openFile']});
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
| `dialogProperties` | `any` | Properties to specify the open dialog behaviour, see https://www.electronjs.org/docs/latest/api/dialog#dialogshowopendialogbrowserwindow-options. |
@y
| Name | Type | Description |
| :------ | :------ | :------ |
| `dialogProperties` | `any` | Properties to specify the open dialog behaviour, see https://www.electronjs.org/docs/latest/api/dialog#dialogshowopendialogbrowserwindow-options. |
@z

@x
#### Returns
@y
#### Returns
@z

@x
`Promise`<[`OpenDialogResult`](OpenDialogResult.md)\>
@y
`Promise`<[`OpenDialogResult`](OpenDialogResult.md)\>
@z
