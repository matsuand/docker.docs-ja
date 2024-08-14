%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Navigation
description: Docker extension API
keywords: Docker, extensions, sdk, API
aliases:
 - /desktop/extensions-sdk/dev/api/dashboard-routes-navigation/
---
@y
---
title: Navigation
description: Docker extension API
keywords: Docker, extensions, sdk, API
aliases:
 - /desktop/extensions-sdk/dev/api/dashboard-routes-navigation/
---
@z

@x
`ddClient.desktopUI.navigate` enables navigation to specific screens of Docker Desktop such as the containers tab, the images tab, or a specific container's logs.
@y
`ddClient.desktopUI.navigate` enables navigation to specific screens of Docker Desktop such as the containers tab, the images tab, or a specific container's logs.
@z

@x
For example, navigate to a given container logs:
@y
For example, navigate to a given container logs:
@z

@x
```typescript
const id = '8c7881e6a107';
try {
  await ddClient.desktopUI.navigate.viewContainerLogs(id);
} catch (e) {
  console.error(e);
  ddClient.desktopUI.toast.error(
    `Failed to navigate to logs for container "${id}".`
  );
}
```
@y
```typescript
const id = '8c7881e6a107';
try {
  await ddClient.desktopUI.navigate.viewContainerLogs(id);
} catch (e) {
  console.error(e);
  ddClient.desktopUI.toast.error(
    `Failed to navigate to logs for container "${id}".`
  );
}
```
@z

@x
#### Parameters
@y
#### Parameters
@z

@x
| Name | Type     | Description                                                                                                                                                                                            |
| :--- | :------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `id` | `string` | The full container id, e.g. `46b57e400d801762e9e115734bf902a2450d89669d85881058a46136520aca28`. You can use the `--no-trunc` flag as part of the `docker ps` command to display the full container id. |
@y
| Name | Type     | Description                                                                                                                                                                                            |
| :--- | :------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `id` | `string` | The full container id, e.g. `46b57e400d801762e9e115734bf902a2450d89669d85881058a46136520aca28`. You can use the `--no-trunc` flag as part of the `docker ps` command to display the full container id. |
@z

@x
#### Returns
@y
#### Returns
@z

@x
`Promise`<`void`\>
@y
`Promise`<`void`\>
@z

@x
A promise that fails if the container doesn't exist.
@y
A promise that fails if the container doesn't exist.
@z

@x
For more details about all navigation methods, see the [Navigation API reference](reference/interfaces/NavigationIntents.md).
@y
For more details about all navigation methods, see the [Navigation API reference](reference/interfaces/NavigationIntents.md).
@z

@x
> Deprecated navigation methods
>
> These methods are deprecated and will be removed in a future version. Use the methods specified above.
@y
> Deprecated navigation methods
>
> These methods are deprecated and will be removed in a future version. Use the methods specified above.
@z

@x
```typescript
window.ddClient.navigateToContainers();
// id - the full container id, e.g. `46b57e400d801762e9e115734bf902a2450d89669d85881058a46136520aca28`
window.ddClient.navigateToContainer(id);
window.ddClient.navigateToContainerLogs(id);
window.ddClient.navigateToContainerInspect(id);
window.ddClient.navigateToContainerStats(id);
@y
```typescript
window.ddClient.navigateToContainers();
// id - the full container id, e.g. `46b57e400d801762e9e115734bf902a2450d89669d85881058a46136520aca28`
window.ddClient.navigateToContainer(id);
window.ddClient.navigateToContainerLogs(id);
window.ddClient.navigateToContainerInspect(id);
window.ddClient.navigateToContainerStats(id);
@z

@x
window.ddClient.navigateToImages();
window.ddClient.navigateToImage(id, tag);
@y
window.ddClient.navigateToImages();
window.ddClient.navigateToImage(id, tag);
@z

@x
window.ddClient.navigateToVolumes();
window.ddClient.navigateToVolume(volume);
@y
window.ddClient.navigateToVolumes();
window.ddClient.navigateToVolume(volume);
@z

@x
window.ddClient.navigateToDevEnvironments();
```
@y
window.ddClient.navigateToDevEnvironments();
```
@z
