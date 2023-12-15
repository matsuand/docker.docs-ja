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
# Interface: DockerDesktopClient
@y
# Interface: DockerDesktopClient
@z

@x
An amalgam of the v0 and v1 interfaces of the Docker Desktop API client,
provided for backwards compatibility reasons. Unless you're working with
a legacy extension, use the v1 type instead.
@y
An amalgam of the v0 and v1 interfaces of the Docker Desktop API client,
provided for backwards compatibility reasons. Unless you're working with
a legacy extension, use the v1 type instead.
@z

@x
## Properties
@y
## Properties
@z

@x
### backend
@y
### backend
@z

@x
• `Readonly` **backend**: `undefined` \| [`BackendV0`](BackendV0.md)
@y
• `Readonly` **backend**: `undefined` \| [`BackendV0`](BackendV0.md)
@z

@x
The `window.ddClient.backend` object can be used to communicate with the backend defined in the vm section of
the extension metadata.
The client is already connected to the backend.
@y
The `window.ddClient.backend` object can be used to communicate with the backend defined in the vm section of
the extension metadata.
The client is already connected to the backend.
@z

@x
>**Warning**
>
> It will be removed in a future version. Use [extension](DockerDesktopClient.md#extension) instead.
{ .warning }
@y
>**Warning**
>
> It will be removed in a future version. Use [extension](DockerDesktopClient.md#extension) instead.
{ .warning }
@z

@x
#### Inherited from
@y
#### Inherited from
@z

@x
DockerDesktopClientV0.backend
@y
DockerDesktopClientV0.backend
@z

@x
___
@y
___
@z

@x
### extension
@y
### extension
@z

@x
• `Readonly` **extension**: [`Extension`](Extension.md)
@y
• `Readonly` **extension**: [`Extension`](Extension.md)
@z

@x
The `ddClient.extension` object can be used to communicate with the backend defined in the vm section of the
extension metadata.
The client is already connected to the backend.
@y
The `ddClient.extension` object can be used to communicate with the backend defined in the vm section of the
extension metadata.
The client is already connected to the backend.
@z

@x
#### Inherited from
@y
#### Inherited from
@z

@x
DockerDesktopClientV1.extension
@y
DockerDesktopClientV1.extension
@z

@x
___
@y
___
@z

@x
### desktopUI
@y
### desktopUI
@z

@x
• `Readonly` **desktopUI**: [`DesktopUI`](DesktopUI.md)
@y
• `Readonly` **desktopUI**: [`DesktopUI`](DesktopUI.md)
@z

@x
#### Inherited from
@y
#### Inherited from
@z

@x
DockerDesktopClientV1.desktopUI
@y
DockerDesktopClientV1.desktopUI
@z

@x
___
@y
___
@z

@x
### host
@y
### host
@z

@x
• `Readonly` **host**: [`Host`](Host.md)
@y
• `Readonly` **host**: [`Host`](Host.md)
@z

@x
#### Inherited from
@y
#### Inherited from
@z

@x
DockerDesktopClientV1.host
@y
DockerDesktopClientV1.host
@z

@x
___
@y
___
@z

@x
### docker
@y
### docker
@z

@x
• `Readonly` **docker**: [`Docker`](Docker.md)
@y
• `Readonly` **docker**: [`Docker`](Docker.md)
@z

@x
#### Inherited from
@y
#### Inherited from
@z

@x
DockerDesktopClientV1.docker
@y
DockerDesktopClientV1.docker
@z

@x
## Container Methods
@y
## Container Methods
@z

@x
### listContainers
@y
### listContainers
@z

@x
▸ **listContainers**(`options`): `Promise`<`unknown`\>
@y
▸ **listContainers**(`options`): `Promise`<`unknown`\>
@z

@x
Get the list of running containers (same as `docker ps`).
@y
Get the list of running containers (same as `docker ps`).
@z

@x
By default, this will not list stopped containers.
You can use the option `{"all": true}` to list all the running and stopped containers.
@y
By default, this will not list stopped containers.
You can use the option `{"all": true}` to list all the running and stopped containers.
@z

@x
```typescript
const containers = await window.ddClient.listContainers();
```
@y
```typescript
const containers = await window.ddClient.listContainers();
```
@z

@x
>**Warning**
>
> It will be removed in a future version. Use [listContainers](Docker.md#listcontainers) instead.
{ .warning }
@y
>**Warning**
>
> It will be removed in a future version. Use [listContainers](Docker.md#listcontainers) instead.
{ .warning }
@z

@x
#### Parameters
@y
#### Parameters
@z

@x
| Name | Type | Description |
| :------ | :------ | :------ |
| `options` | `never` | (Optional). A JSON like `{ "all": true, "limit": 10, "size": true, "filters": JSON.stringify({ status: ["exited"] }), }` For more information about the different properties see [the Docker API endpoint documentation](https://docs.docker.com/engine/api/v1.41/#operation/ContainerList). |
@y
| Name | Type | Description |
| :------ | :------ | :------ |
| `options` | `never` | (Optional). A JSON like `{ "all": true, "limit": 10, "size": true, "filters": JSON.stringify({ status: ["exited"] }), }` For more information about the different properties see [the Docker API endpoint documentation](https://docs.docker.com/engine/api/v1.41/#operation/ContainerList). |
@z

@x
#### Returns
@y
#### Returns
@z

@x
`Promise`<`unknown`\>
@y
`Promise`<`unknown`\>
@z

@x
#### Inherited from
@y
#### Inherited from
@z

@x
DockerDesktopClientV0.listContainers
@y
DockerDesktopClientV0.listContainers
@z

@x
___
@y
___
@z

@x
## Image Methods
@y
## Image Methods
@z

@x
### listImages
@y
### listImages
@z

@x
▸ **listImages**(`options`): `Promise`<`unknown`\>
@y
▸ **listImages**(`options`): `Promise`<`unknown`\>
@z

@x
Get the list of images
@y
Get the list of images
@z

@x
```typescript
const images = await window.ddClient.listImages();
```
@y
```typescript
const images = await window.ddClient.listImages();
```
@z

@x
> **Warning**
> 
> It will be removed in a future version. Use [listImages](Docker.md#listimages) instead.
{ .warning }
@y
> **Warning**
> 
> It will be removed in a future version. Use [listImages](Docker.md#listimages) instead.
{ .warning }
@z

@x
#### Parameters
@y
#### Parameters
@z

@x
| Name | Type | Description |
| :------ | :------ | :------ |
| `options` | `never` | (Optional). A JSON like `{ "all": true, "filters": JSON.stringify({ dangling: ["true"] }), "digests": true }` For more information about the different properties see [the Docker API endpoint documentation](https://docs.docker.com/engine/api/v1.41/#tag/Image). |
@y
| Name | Type | Description |
| :------ | :------ | :------ |
| `options` | `never` | (Optional). A JSON like `{ "all": true, "filters": JSON.stringify({ dangling: ["true"] }), "digests": true }` For more information about the different properties see [the Docker API endpoint documentation](https://docs.docker.com/engine/api/v1.41/#tag/Image). |
@z

@x
#### Returns
@y
#### Returns
@z

@x
`Promise`<`unknown`\>
@y
`Promise`<`unknown`\>
@z

@x
#### Inherited from
@y
#### Inherited from
@z

@x
DockerDesktopClientV0.listImages
@y
DockerDesktopClientV0.listImages
@z

@x
___
@y
___
@z

@x
## Navigation Methods
@y
## Navigation Methods
@z

@x
### navigateToContainers
@y
### navigateToContainers
@z

@x
▸ **navigateToContainers**(): `void`
@y
▸ **navigateToContainers**(): `void`
@z

@x
Navigate to the container's window in Docker Desktop.
```typescript
window.ddClient.navigateToContainers();
```
@y
Navigate to the container's window in Docker Desktop.
```typescript
window.ddClient.navigateToContainers();
```
@z

@x
> **Warning**
> 
> It will be removed in a future version. Use [viewContainers](NavigationIntents.md#viewcontainers) instead.
{ .warning }
@y
> **Warning**
> 
> It will be removed in a future version. Use [viewContainers](NavigationIntents.md#viewcontainers) instead.
{ .warning }
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
#### Inherited from
@y
#### Inherited from
@z

@x
DockerDesktopClientV0.navigateToContainers
@y
DockerDesktopClientV0.navigateToContainers
@z

@x
___
@y
___
@z

@x
### navigateToContainer
@y
### navigateToContainer
@z

@x
▸ **navigateToContainer**(`id`): `Promise`<`any`\>
@y
▸ **navigateToContainer**(`id`): `Promise`<`any`\>
@z

@x
Navigate to the container window in Docker Desktop.
```typescript
await window.ddClient.navigateToContainer(id);
```
@y
Navigate to the container window in Docker Desktop.
```typescript
await window.ddClient.navigateToContainer(id);
```
@z

@x
> **Warning**
>
> It will be removed in a future version.
{ .warning }
@y
> **Warning**
>
> It will be removed in a future version.
{ .warning }
@z

@x
#### Parameters
@y
#### Parameters
@z

@x
| Name | Type | Description |
| :------ | :------ | :------ |
| `id` | `string` | The full container id, e.g. `46b57e400d801762e9e115734bf902a2450d89669d85881058a46136520aca28`. You can use the `--no-trunc` flag as part of the `docker ps` command to display the full container id. |
@y
| Name | Type | Description |
| :------ | :------ | :------ |
| `id` | `string` | The full container id, e.g. `46b57e400d801762e9e115734bf902a2450d89669d85881058a46136520aca28`. You can use the `--no-trunc` flag as part of the `docker ps` command to display the full container id. |
@z

@x
#### Returns
@y
#### Returns
@z

@x
`Promise`<`any`\>
@y
`Promise`<`any`\>
@z

@x
A promise that fails if the container doesn't exist.
@y
A promise that fails if the container doesn't exist.
@z

@x
#### Inherited from
@y
#### Inherited from
@z

@x
DockerDesktopClientV0.navigateToContainer
@y
DockerDesktopClientV0.navigateToContainer
@z

@x
___
@y
___
@z

@x
### navigateToContainerLogs
@y
### navigateToContainerLogs
@z

@x
▸ **navigateToContainerLogs**(`id`): `Promise`<`any`\>
@y
▸ **navigateToContainerLogs**(`id`): `Promise`<`any`\>
@z

@x
Navigate to the container logs window in Docker Desktop.
```typescript
await window.ddClient.navigateToContainerLogs(id);
```
@y
Navigate to the container logs window in Docker Desktop.
```typescript
await window.ddClient.navigateToContainerLogs(id);
```
@z

@x
> **Warning**
>
> It will be removed in a future version.
{ .warning }
@y
> **Warning**
>
> It will be removed in a future version.
{ .warning }
@z

@x
#### Parameters
@y
#### Parameters
@z

@x
| Name | Type | Description |
| :------ | :------ | :------ |
| `id` | `string` | The full container id, e.g. `46b57e400d801762e9e115734bf902a2450d89669d85881058a46136520aca28`. You can use the `--no-trunc` flag as part of the `docker ps` command to display the full container id. |
@y
| Name | Type | Description |
| :------ | :------ | :------ |
| `id` | `string` | The full container id, e.g. `46b57e400d801762e9e115734bf902a2450d89669d85881058a46136520aca28`. You can use the `--no-trunc` flag as part of the `docker ps` command to display the full container id. |
@z

@x
#### Returns
@y
#### Returns
@z

@x
`Promise`<`any`\>
@y
`Promise`<`any`\>
@z

@x
A promise that fails if the container doesn't exist.
@y
A promise that fails if the container doesn't exist.
@z

@x
#### Inherited from
@y
#### Inherited from
@z

@x
DockerDesktopClientV0.navigateToContainerLogs
@y
DockerDesktopClientV0.navigateToContainerLogs
@z

@x
___
@y
___
@z

@x
### navigateToContainerInspect
@y
### navigateToContainerInspect
@z

@x
▸ **navigateToContainerInspect**(`id`): `Promise`<`any`\>
@y
▸ **navigateToContainerInspect**(`id`): `Promise`<`any`\>
@z

@x
Navigate to the container inspect window in Docker Desktop.
```typescript
await window.ddClient.navigateToContainerInspect(id);
```
@y
Navigate to the container inspect window in Docker Desktop.
```typescript
await window.ddClient.navigateToContainerInspect(id);
```
@z

@x
> **Warning**
>
> It will be removed in a future version.
{ .warning }
@y
> **Warning**
>
> It will be removed in a future version.
{ .warning }
@z

@x
#### Parameters
@y
#### Parameters
@z

@x
| Name | Type | Description |
| :------ | :------ | :------ |
| `id` | `string` | The full container id, e.g. `46b57e400d801762e9e115734bf902a2450d89669d85881058a46136520aca28`. You can use the `--no-trunc` flag as part of the `docker ps` command to display the full container id. |
@y
| Name | Type | Description |
| :------ | :------ | :------ |
| `id` | `string` | The full container id, e.g. `46b57e400d801762e9e115734bf902a2450d89669d85881058a46136520aca28`. You can use the `--no-trunc` flag as part of the `docker ps` command to display the full container id. |
@z

@x
#### Returns
@y
#### Returns
@z

@x
`Promise`<`any`\>
@y
`Promise`<`any`\>
@z

@x
A promise that fails if the container doesn't exist.
@y
A promise that fails if the container doesn't exist.
@z

@x
#### Inherited from
@y
#### Inherited from
@z

@x
DockerDesktopClientV0.navigateToContainerInspect
@y
DockerDesktopClientV0.navigateToContainerInspect
@z

@x
___
@y
___
@z

@x
### navigateToContainerStats
@y
### navigateToContainerStats
@z

@x
▸ **navigateToContainerStats**(`id`): `Promise`<`any`\>
@y
▸ **navigateToContainerStats**(`id`): `Promise`<`any`\>
@z

@x
Navigate to the container stats to see the CPU, memory, disk read/write and network I/O usage.
@y
Navigate to the container stats to see the CPU, memory, disk read/write and network I/O usage.
@z

@x
```typescript
await window.ddClient.navigateToContainerStats(id);
```
@y
```typescript
await window.ddClient.navigateToContainerStats(id);
```
@z

@x
> **Warning**
> 
> It will be removed in a future version.
{ .warning }
@y
> **Warning**
> 
> It will be removed in a future version.
{ .warning }
@z

@x
#### Parameters
@y
#### Parameters
@z

@x
| Name | Type | Description |
| :------ | :------ | :------ |
| `id` | `string` | The full container id, e.g. `46b57e400d801762e9e115734bf902a2450d89669d85881058a46136520aca28`. You can use the `--no-trunc` flag as part of the `docker ps` command to display the full container id. |
@y
| Name | Type | Description |
| :------ | :------ | :------ |
| `id` | `string` | The full container id, e.g. `46b57e400d801762e9e115734bf902a2450d89669d85881058a46136520aca28`. You can use the `--no-trunc` flag as part of the `docker ps` command to display the full container id. |
@z

@x
#### Returns
@y
#### Returns
@z

@x
`Promise`<`any`\>
@y
`Promise`<`any`\>
@z

@x
A promise that fails if the container doesn't exist.
@y
A promise that fails if the container doesn't exist.
@z

@x
#### Inherited from
@y
#### Inherited from
@z

@x
DockerDesktopClientV0.navigateToContainerStats
@y
DockerDesktopClientV0.navigateToContainerStats
@z

@x
___
@y
___
@z

@x
### navigateToImages
@y
### navigateToImages
@z

@x
▸ **navigateToImages**(): `void`
@y
▸ **navigateToImages**(): `void`
@z

@x
Navigate to the images window in Docker Desktop.
```typescript
await window.ddClient.navigateToImages(id);
```
@y
Navigate to the images window in Docker Desktop.
```typescript
await window.ddClient.navigateToImages(id);
```
@z

@x
> **Warning**
>
> It will be removed in a future version. Use [viewImages](NavigationIntents.md#viewimages) instead.
{ .warning }
@y
> **Warning**
>
> It will be removed in a future version. Use [viewImages](NavigationIntents.md#viewimages) instead.
{ .warning }
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
#### Inherited from
@y
#### Inherited from
@z

@x
DockerDesktopClientV0.navigateToImages
@y
DockerDesktopClientV0.navigateToImages
@z

@x
___
@y
___
@z

@x
### navigateToImage
@y
### navigateToImage
@z

@x
▸ **navigateToImage**(`id`, `tag`): `Promise`<`any`\>
@y
▸ **navigateToImage**(`id`, `tag`): `Promise`<`any`\>
@z

@x
Navigate to a specific image referenced by `id` and `tag` in Docker Desktop.
In this navigation route you can find the image layers, commands, created time and size.
@y
Navigate to a specific image referenced by `id` and `tag` in Docker Desktop.
In this navigation route you can find the image layers, commands, created time and size.
@z

@x
```typescript
await window.ddClient.navigateToImage(id, tag);
```
@y
```typescript
await window.ddClient.navigateToImage(id, tag);
```
@z

@x
> **Warning**
>
> It will be removed in a future version. Use [viewImage](NavigationIntents.md#viewimage) instead.
{ .warning }
@y
> **Warning**
>
> It will be removed in a future version. Use [viewImage](NavigationIntents.md#viewimage) instead.
{ .warning }
@z

@x
#### Parameters
@y
#### Parameters
@z

@x
| Name | Type | Description |
| :------ | :------ | :------ |
| `id` | `string` | The full image id (including sha), e.g. `sha256:34ab3ae068572f4e85c448b4035e6be5e19cc41f69606535cd4d768a63432673`. |
| `tag` | `string` | The tag of the image, e.g. `latest`, `0.0.1`, etc. |
@y
| Name | Type | Description |
| :------ | :------ | :------ |
| `id` | `string` | The full image id (including sha), e.g. `sha256:34ab3ae068572f4e85c448b4035e6be5e19cc41f69606535cd4d768a63432673`. |
| `tag` | `string` | The tag of the image, e.g. `latest`, `0.0.1`, etc. |
@z

@x
#### Returns
@y
#### Returns
@z

@x
`Promise`<`any`\>
@y
`Promise`<`any`\>
@z

@x
A promise that fails if the container doesn't exist.
@y
A promise that fails if the container doesn't exist.
@z

@x
#### Inherited from
@y
#### Inherited from
@z

@x
DockerDesktopClientV0.navigateToImage
@y
DockerDesktopClientV0.navigateToImage
@z

@x
___
@y
___
@z

@x
### navigateToVolumes
@y
### navigateToVolumes
@z

@x
▸ **navigateToVolumes**(): `void`
@y
▸ **navigateToVolumes**(): `void`
@z

@x
Navigate to the volumes window in Docker Desktop.
@y
Navigate to the volumes window in Docker Desktop.
@z

@x
```typescript
await window.ddClient.navigateToVolumes();
```
@y
```typescript
await window.ddClient.navigateToVolumes();
```
@z

@x
> **Warning**
>
> It will be removed in a future version. Use [viewVolumes](NavigationIntents.md#viewvolumes) instead.
{ .warning }
@y
> **Warning**
>
> It will be removed in a future version. Use [viewVolumes](NavigationIntents.md#viewvolumes) instead.
{ .warning }
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
#### Inherited from
@y
#### Inherited from
@z

@x
DockerDesktopClientV0.navigateToVolumes
@y
DockerDesktopClientV0.navigateToVolumes
@z

@x
___
@y
___
@z

@x
### navigateToVolume
@y
### navigateToVolume
@z

@x
▸ **navigateToVolume**(`volume`): `void`
@y
▸ **navigateToVolume**(`volume`): `void`
@z

@x
Navigate to a specific volume in Docker Desktop.
@y
Navigate to a specific volume in Docker Desktop.
@z

@x
```typescript
window.ddClient.navigateToVolume(volume);
```
@y
```typescript
window.ddClient.navigateToVolume(volume);
```
@z

@x
> **Warning**
>
> It will be removed in a future version. Use [viewVolume](NavigationIntents.md#viewvolume) instead.
{ .warning }
@y
> **Warning**
>
> It will be removed in a future version. Use [viewVolume](NavigationIntents.md#viewvolume) instead.
{ .warning }
@z

@x
#### Parameters
@y
#### Parameters
@z

@x
| Name | Type | Description |
| :------ | :------ | :------ |
| `volume` | `string` | The name of the volume, e.g. `my-volume`. |
@y
| Name | Type | Description |
| :------ | :------ | :------ |
| `volume` | `string` | The name of the volume, e.g. `my-volume`. |
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
#### Inherited from
@y
#### Inherited from
@z

@x
DockerDesktopClientV0.navigateToVolume
@y
DockerDesktopClientV0.navigateToVolume
@z

@x
___
@y
___
@z

@x
### navigateToDevEnvironments
@y
### navigateToDevEnvironments
@z

@x
▸ **navigateToDevEnvironments**(): `void`
@y
▸ **navigateToDevEnvironments**(): `void`
@z

@x
Navigate to the Dev Environments window in Docker Desktop.
@y
Navigate to the Dev Environments window in Docker Desktop.
@z

@x
```typescript
window.ddClient.navigateToDevEnvironments();
```
@y
```typescript
window.ddClient.navigateToDevEnvironments();
```
@z

@x
> **Warning**
> 
> It will be removed in a future version. Use [viewDevEnvironments](NavigationIntents.md#viewdevenvironments) instead.
{ .warning }
@y
> **Warning**
> 
> It will be removed in a future version. Use [viewDevEnvironments](NavigationIntents.md#viewdevenvironments) instead.
{ .warning }
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
#### Inherited from
@y
#### Inherited from
@z

@x
DockerDesktopClientV0.navigateToDevEnvironments
@y
DockerDesktopClientV0.navigateToDevEnvironments
@z

@x
___
@y
___
@z

@x
## Other Methods
@y
## Other Methods
@z

@x
### execHostCmd
@y
### execHostCmd
@z

@x
▸ **execHostCmd**(`cmd`): `Promise`<[`ExecResultV0`](ExecResultV0.md)\>
@y
▸ **execHostCmd**(`cmd`): `Promise`<[`ExecResultV0`](ExecResultV0.md)\>
@z

@x
You can run binaries defined in the host section in the extension metadata.
@y
You can run binaries defined in the host section in the extension metadata.
@z

@x
```typescript
window.ddClient.execHostCmd(`cliShippedOnHost xxx`).then((cmdResult: any) => {
 console.log(cmdResult);
});
```
@y
```typescript
window.ddClient.execHostCmd(`cliShippedOnHost xxx`).then((cmdResult: any) => {
 console.log(cmdResult);
});
```
@z

@x
> **Warning**
> 
> It will be removed in a future version. Use [exec](ExtensionCli.md#exec) instead.
{ .warning }
@y
> **Warning**
> 
> It will be removed in a future version. Use [exec](ExtensionCli.md#exec) instead.
{ .warning }
@z

@x
#### Parameters
@y
#### Parameters
@z

@x
| Name | Type | Description |
| :------ | :------ | :------ |
| `cmd` | `string` | The command to be executed. |
@y
| Name | Type | Description |
| :------ | :------ | :------ |
| `cmd` | `string` | The command to be executed. |
@z

@x
#### Returns
@y
#### Returns
@z

@x
`Promise`<[`ExecResultV0`](ExecResultV0.md)\>
@y
`Promise`<[`ExecResultV0`](ExecResultV0.md)\>
@z

@x
#### Inherited from
@y
#### Inherited from
@z

@x
DockerDesktopClientV0.execHostCmd
@y
DockerDesktopClientV0.execHostCmd
@z

@x
___
@y
___
@z

@x
### spawnHostCmd
@y
### spawnHostCmd
@z

@x
▸ **spawnHostCmd**(`cmd`, `args`, `callback`): `void`
@y
▸ **spawnHostCmd**(`cmd`, `args`, `callback`): `void`
@z

@x
Invoke an extension binary on your host and get the output stream.
@y
Invoke an extension binary on your host and get the output stream.
@z

@x
```typescript
window.ddClient.spawnHostCmd(
  `cliShippedOnHost`,
  [`arg1`, `arg2`],
  (data: any, err: any) => {
    console.log(data.stdout, data.stderr);
    // Once the command exits we get the status code
    if (data.code) {
      console.log(data.code);
    }
  }
);
```
@y
```typescript
window.ddClient.spawnHostCmd(
  `cliShippedOnHost`,
  [`arg1`, `arg2`],
  (data: any, err: any) => {
    console.log(data.stdout, data.stderr);
    // Once the command exits we get the status code
    if (data.code) {
      console.log(data.code);
    }
  }
);
```
@z

@x
> **Warning**
>
> It will be removed in a future version. Use [exec](ExtensionCli.md#exec) instead.
{ .warning }
@y
> **Warning**
>
> It will be removed in a future version. Use [exec](ExtensionCli.md#exec) instead.
{ .warning }
@z

@x
#### Parameters
@y
#### Parameters
@z

@x
| Name | Type | Description |
| :------ | :------ | :------ |
| `cmd` | `string` | The command to be executed. |
| `args` | `string`[] | The arguments of the command to execute. |
| `callback` | (`data`: `any`, `error`: `any`) => `void` | The callback function where to listen from the command output data and errors. |
@y
| Name | Type | Description |
| :------ | :------ | :------ |
| `cmd` | `string` | The command to be executed. |
| `args` | `string`[] | The arguments of the command to execute. |
| `callback` | (`data`: `any`, `error`: `any`) => `void` | The callback function where to listen from the command output data and errors. |
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
#### Inherited from
@y
#### Inherited from
@z

@x
DockerDesktopClientV0.spawnHostCmd
@y
DockerDesktopClientV0.spawnHostCmd
@z

@x
___
@y
___
@z

@x
### execDockerCmd
@y
### execDockerCmd
@z

@x
▸ **execDockerCmd**(`cmd`, `...args`): `Promise`<[`ExecResultV0`](ExecResultV0.md)\>
@y
▸ **execDockerCmd**(`cmd`, `...args`): `Promise`<[`ExecResultV0`](ExecResultV0.md)\>
@z

@x
You can also directly execute the Docker binary.
@y
You can also directly execute the Docker binary.
@z

@x
```typescript
const output = await window.ddClient.execDockerCmd("info");
```
@y
```typescript
const output = await window.ddClient.execDockerCmd("info");
```
@z

@x
> **Warning**
>
> It will be removed in a future version. Use [exec](DockerCommand.md#exec) instead.
{ .warning }
@y
> **Warning**
>
> It will be removed in a future version. Use [exec](DockerCommand.md#exec) instead.
{ .warning }
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
| `...args` | `string`[] | The arguments of the command to execute. |
@y
| Name | Type | Description |
| :------ | :------ | :------ |
| `cmd` | `string` | The command to execute. |
| `...args` | `string`[] | The arguments of the command to execute. |
@z

@x
#### Returns
@y
#### Returns
@z

@x
`Promise`<[`ExecResultV0`](ExecResultV0.md)\>
@y
`Promise`<[`ExecResultV0`](ExecResultV0.md)\>
@z

@x
The result will contain both the standard output and the standard error of the executed command:
```json
{
  "stderr": "...",
  "stdout": "..."
}
```
For convenience, the command result object also has methods to easily parse it depending on the output format:
@y
The result will contain both the standard output and the standard error of the executed command:
```json
{
  "stderr": "...",
  "stdout": "..."
}
```
For convenience, the command result object also has methods to easily parse it depending on the output format:
@z

@x
- `output.lines(): string[]` splits output lines.
- `output.parseJsonObject(): any` parses a well-formed JSON output.
- `output.parseJsonLines(): any[]` parses each output line as a JSON object.
@y
- `output.lines(): string[]` splits output lines.
- `output.parseJsonObject(): any` parses a well-formed JSON output.
- `output.parseJsonLines(): any[]` parses each output line as a JSON object.
@z

@x
If the output of the command is too long, or you need to get the output as a stream you can use the
 * spawnDockerCmd function:
@y
If the output of the command is too long, or you need to get the output as a stream you can use the
 * spawnDockerCmd function:
@z

@x
```typescript
window.ddClient.spawnDockerCmd("logs", ["-f", "..."], (data, error) => {
  console.log(data.stdout);
});
```
@y
```typescript
window.ddClient.spawnDockerCmd("logs", ["-f", "..."], (data, error) => {
  console.log(data.stdout);
});
```
@z

@x
#### Inherited from
@y
#### Inherited from
@z

@x
DockerDesktopClientV0.execDockerCmd
@y
DockerDesktopClientV0.execDockerCmd
@z

@x
___
@y
___
@z

@x
### spawnDockerCmd
@y
### spawnDockerCmd
@z

@x
▸ **spawnDockerCmd**(`cmd`, `args`, `callback`): `void`
@y
▸ **spawnDockerCmd**(`cmd`, `args`, `callback`): `void`
@z

@x
> **Warning**
>
> It will be removed in a future version. Use [exec](DockerCommand.md#exec) instead.
{ .warning }
@y
> **Warning**
>
> It will be removed in a future version. Use [exec](DockerCommand.md#exec) instead.
{ .warning }
@z

@x
#### Parameters
@y
#### Parameters
@z

@x
| Name | Type |
| :------ | :------ |
| `cmd` | `string` |
| `args` | `string`[] |
| `callback` | (`data`: `any`, `error`: `any`) => `void` |
@y
| Name | Type |
| :------ | :------ |
| `cmd` | `string` |
| `args` | `string`[] |
| `callback` | (`data`: `any`, `error`: `any`) => `void` |
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
#### Inherited from
@y
#### Inherited from
@z

@x
DockerDesktopClientV0.spawnDockerCmd
@y
DockerDesktopClientV0.spawnDockerCmd
@z

@x
___
@y
___
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
```typescript
window.ddClient.openExternal("https://docker.com");
```
@y
```typescript
window.ddClient.openExternal("https://docker.com");
```
@z

@x
**Warning**
>
> It will be removed in a future version. Use [openExternal](Host.md#openexternal) instead.
{ .warning }
@y
**Warning**
>
> It will be removed in a future version. Use [openExternal](Host.md#openexternal) instead.
{ .warning }
@z

@x
#### Parameters
@y
#### Parameters
@z

@x
| Name | Type | Description |
| :------ | :------ | :------ |
| `url` | `string` | The URL the browser opens (must have the protocol `http` or `https`). |
@y
| Name | Type | Description |
| :------ | :------ | :------ |
| `url` | `string` | The URL the browser opens (must have the protocol `http` or `https`). |
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
#### Inherited from
@y
#### Inherited from
@z

@x
DockerDesktopClientV0.openExternal
@y
DockerDesktopClientV0.openExternal
@z

@x
___
@y
___
@z

@x
## Toast Methods
@y
## Toast Methods
@z

@x
### toastSuccess
@y
### toastSuccess
@z

@x
▸ **toastSuccess**(`msg`): `void`
@y
▸ **toastSuccess**(`msg`): `void`
@z

@x
Display a toast message of type success.
@y
Display a toast message of type success.
@z

@x
```typescript
window.ddClient.toastSuccess("message");
```
@y
```typescript
window.ddClient.toastSuccess("message");
```
@z

@x
>**Warning`**
>
> It will be removed in a future version. Use [success](Toast.md#success) instead.
{ .warning }
@y
>**Warning`**
>
> It will be removed in a future version. Use [success](Toast.md#success) instead.
{ .warning }
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
#### Inherited from
@y
#### Inherited from
@z

@x
DockerDesktopClientV0.toastSuccess
@y
DockerDesktopClientV0.toastSuccess
@z

@x
___
@y
___
@z

@x
### toastWarning
@y
### toastWarning
@z

@x
▸ **toastWarning**(`msg`): `void`
@y
▸ **toastWarning**(`msg`): `void`
@z

@x
Display a toast message of type warning.
@y
Display a toast message of type warning.
@z

@x
```typescript
window.ddClient.toastWarning("message");
```
@y
```typescript
window.ddClient.toastWarning("message");
```
@z

@x
> **Warning**
>
> It will be removed in a future version. Use [warning](Toast.md#warning) instead.
{ .warning }
@y
> **Warning**
>
> It will be removed in a future version. Use [warning](Toast.md#warning) instead.
{ .warning }
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
#### Inherited from
@y
#### Inherited from
@z

@x
DockerDesktopClientV0.toastWarning
@y
DockerDesktopClientV0.toastWarning
@z

@x
___
@y
___
@z

@x
### toastError
@y
### toastError
@z

@x
▸ **toastError**(`msg`): `void`
@y
▸ **toastError**(`msg`): `void`
@z

@x
Display a toast message of type error.
@y
Display a toast message of type error.
@z

@x
```typescript
window.ddClient.toastError("message");
```
@y
```typescript
window.ddClient.toastError("message");
```
@z

@x
>**Warning**
>
> It will be removed in a future version. Use [error](Toast.md#error) instead.
{ .warning }
@y
>**Warning**
>
> It will be removed in a future version. Use [error](Toast.md#error) instead.
{ .warning }
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
#### Inherited from
@y
#### Inherited from
@z

@x
DockerDesktopClientV0.toastError
@y
DockerDesktopClientV0.toastError
@z
