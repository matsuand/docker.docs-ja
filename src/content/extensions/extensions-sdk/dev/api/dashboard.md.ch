%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Dashboard
description: Docker extension API
keywords: Docker, extensions, sdk, API
aliases:
 - /desktop/extensions-sdk/dev/api/dashboard/
---
@y
---
title: Dashboard
description: Docker extension API
keywords: Docker, extensions, sdk, API
aliases:
 - /desktop/extensions-sdk/dev/api/dashboard/
---
@z

@x
## User notifications
@y
## User notifications
@z

@x
Toasts provide a brief notification to the user. They appear temporarily and
shouldn't interrupt the user experience. They also don't require user input to disappear.
@y
Toasts provide a brief notification to the user. They appear temporarily and
shouldn't interrupt the user experience. They also don't require user input to disappear.
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
Use to display a toast message of type success.
@y
Use to display a toast message of type success.
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
Use to display a toast message of type warning.
@y
Use to display a toast message of type warning.
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
Use to display a toast message of type error.
@y
Use to display a toast message of type error.
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
For more details about method parameters and the return types available, see [Toast API reference](reference/interfaces/Toast.md).
@y
For more details about method parameters and the return types available, see [Toast API reference](reference/interfaces/Toast.md).
@z

@x
> Deprecated user notifications
>
> These methods are deprecated and will be removed in a future version. Use the methods specified above.
@y
> Deprecated user notifications
>
> These methods are deprecated and will be removed in a future version. Use the methods specified above.
@z

@x
```typescript
window.ddClient.toastSuccess("message");
window.ddClient.toastWarning("message");
window.ddClient.toastError("message");
```
@y
```typescript
window.ddClient.toastSuccess("message");
window.ddClient.toastWarning("message");
window.ddClient.toastError("message");
```
@z

@x
## Open a file selection dialog
@y
## Open a file selection dialog
@z

@x
This function opens a file selector dialog that asks the user to select a file or folder.
@y
This function opens a file selector dialog that asks the user to select a file or folder.
@z

@x
▸ **showOpenDialog**(`dialogProperties`): `Promise`<[`OpenDialogResult`](reference/interfaces/OpenDialogResult.md)\>:
@y
▸ **showOpenDialog**(`dialogProperties`): `Promise`<[`OpenDialogResult`](reference/interfaces/OpenDialogResult.md)\>:
@z

@x
The `dialogProperties` parameter is a list of flags passed to Electron to customize the dialog's behaviour. For example, you can pass `multiSelections` to allow a user to select multiple files. See [Electron's documentation](https://www.electronjs.org/docs/latest/api/dialog) for a full list.
@y
The `dialogProperties` parameter is a list of flags passed to Electron to customize the dialog's behaviour. For example, you can pass `multiSelections` to allow a user to select multiple files. See [Electron's documentation](https://www.electronjs.org/docs/latest/api/dialog) for a full list.
@z

@x
```typescript
const result = await ddClient.desktopUI.dialog.showOpenDialog({
  properties: ["openDirectory"],
});
if (!result.canceled) {
  console.log(result.paths);
}
```
@y
```typescript
const result = await ddClient.desktopUI.dialog.showOpenDialog({
  properties: ["openDirectory"],
});
if (!result.canceled) {
  console.log(result.paths);
}
```
@z

@x
## Open a URL
@y
## Open a URL
@z

@x
This function opens an external URL with the system default browser.
@y
This function opens an external URL with the system default browser.
@z

@x
▸ **openExternal**(`url`): `void`
@y
▸ **openExternal**(`url`): `void`
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
> The URL must have the protocol `http` or `https`.
@y
> The URL must have the protocol `http` or `https`.
@z

@x
For more details about method parameters and the return types available, see [Desktop host API reference](reference/interfaces/Host.md).
@y
For more details about method parameters and the return types available, see [Desktop host API reference](reference/interfaces/Host.md).
@z

@x
> Deprecated user notifications
>
> This method is deprecated and will be removed in a future version. Use the methods specified above.
@y
> Deprecated user notifications
>
> This method is deprecated and will be removed in a future version. Use the methods specified above.
@z

@x
```typescript
window.ddClient.openExternal("https://docker.com");
```
@y
```typescript
window.ddClient.openExternal("https://docker.com");
```
@z

@x
## Navigation to Dashboard routes
@y
## Navigation to Dashboard routes
@z

@x
From your extension, you can also [navigate](dashboard-routes-navigation.md) to other parts of the Docker Desktop Dashboard.
@y
From your extension, you can also [navigate](dashboard-routes-navigation.md) to other parts of the Docker Desktop Dashboard.
@z
