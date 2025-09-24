%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Interface: NavigationIntents"
description: Docker extension API reference
keywords: Docker, extensions, sdk, API, reference
@y
title: "Interface: NavigationIntents"
description: Docker extension API reference
keywords: Docker, extensions, sdk, API, reference
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
## Container Methods
@y
## Container Methods
@z

@x
### viewContainers
@y
### viewContainers
@z

@x
▸ **viewContainers**(): `Promise`<`void`\>
@y
▸ **viewContainers**(): `Promise`<`void`\>
@z

@x
Navigate to the **Containers** tab in Docker Desktop.
@y
Navigate to the **Containers** tab in Docker Desktop.
@z

@x
```typescript
ddClient.desktopUI.navigate.viewContainers()
```
@y
```typescript
ddClient.desktopUI.navigate.viewContainers()
```
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
___
@y
___
@z

@x
### viewContainer
@y
### viewContainer
@z

@x
▸ **viewContainer**(`id`): `Promise`<`void`\>
@y
▸ **viewContainer**(`id`): `Promise`<`void`\>
@z

@x
Navigate to the **Container** tab in Docker Desktop.
@y
Navigate to the **Container** tab in Docker Desktop.
@z

@x
```typescript
await ddClient.desktopUI.navigate.viewContainer(id)
```
@y
```typescript
await ddClient.desktopUI.navigate.viewContainer(id)
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
___
@y
___
@z

@x
### viewContainerLogs
@y
### viewContainerLogs
@z

@x
▸ **viewContainerLogs**(`id`): `Promise`<`void`\>
@y
▸ **viewContainerLogs**(`id`): `Promise`<`void`\>
@z

@x
Navigate to the **Container logs** tab in Docker Desktop.
@y
Navigate to the **Container logs** tab in Docker Desktop.
@z

@x
```typescript
await ddClient.desktopUI.navigate.viewContainerLogs(id)
```
@y
```typescript
await ddClient.desktopUI.navigate.viewContainerLogs(id)
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
___
@y
___
@z

@x
### viewContainerInspect
@y
### viewContainerInspect
@z

@x
▸ **viewContainerInspect**(`id`): `Promise`<`void`\>
@y
▸ **viewContainerInspect**(`id`): `Promise`<`void`\>
@z

@x
Navigate to the **Inspect container** view in Docker Desktop.
@y
Navigate to the **Inspect container** view in Docker Desktop.
@z

@x
```typescript
await ddClient.desktopUI.navigate.viewContainerInspect(id)
```
@y
```typescript
await ddClient.desktopUI.navigate.viewContainerInspect(id)
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
___
@y
___
@z

@x
### viewContainerTerminal
@y
### viewContainerTerminal
@z

@x
▸ **viewContainerTerminal**(`id`): `Promise`<`void`\>
@y
▸ **viewContainerTerminal**(`id`): `Promise`<`void`\>
@z

@x
Navigate to the container terminal window in Docker Desktop.
@y
Navigate to the container terminal window in Docker Desktop.
@z

@x
```typescript
await ddClient.desktopUI.navigate.viewContainerTerminal(id)
```
@y
```typescript
await ddClient.desktopUI.navigate.viewContainerTerminal(id)
```
@z

@x
**`Since`**
@y
**`Since`**
@z

@x
0.3.4
@y
0.3.4
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
___
@y
___
@z

@x
### viewContainerStats
@y
### viewContainerStats
@z

@x
▸ **viewContainerStats**(`id`): `Promise`<`void`\>
@y
▸ **viewContainerStats**(`id`): `Promise`<`void`\>
@z

@x
Navigate to the container stats to see the CPU, memory, disk read/write and network I/O usage.
@y
Navigate to the container stats to see the CPU, memory, disk read/write and network I/O usage.
@z

@x
```typescript
await ddClient.desktopUI.navigate.viewContainerStats(id)
```
@y
```typescript
await ddClient.desktopUI.navigate.viewContainerStats(id)
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
___
@y
___
@z

@x
## Images Methods
@y
## Images Methods
@z

@x
### viewImages
@y
### viewImages
@z

@x
▸ **viewImages**(): `Promise`<`void`\>
@y
▸ **viewImages**(): `Promise`<`void`\>
@z

@x
Navigate to the **Images** tab in Docker Desktop.
@y
Navigate to the **Images** tab in Docker Desktop.
@z

@x
```typescript
await ddClient.desktopUI.navigate.viewImages()
```
@y
```typescript
await ddClient.desktopUI.navigate.viewImages()
```
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
___
@y
___
@z

@x
### viewImage
@y
### viewImage
@z

@x
▸ **viewImage**(`id`, `tag`): `Promise`<`void`\>
@y
▸ **viewImage**(`id`, `tag`): `Promise`<`void`\>
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
await ddClient.desktopUI.navigate.viewImage(id, tag)
```
@y
```typescript
await ddClient.desktopUI.navigate.viewImage(id, tag)
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
`Promise`<`void`\>
@y
`Promise`<`void`\>
@z

@x
A promise that fails if the image doesn't exist.
@y
A promise that fails if the image doesn't exist.
@z

@x
___
@y
___
@z

@x
## Volume Methods
@y
## Volume Methods
@z

@x
### viewVolumes
@y
### viewVolumes
@z

@x
▸ **viewVolumes**(): `Promise`<`void`\>
@y
▸ **viewVolumes**(): `Promise`<`void`\>
@z

@x
Navigate to the **Volumes** tab in Docker Desktop.
@y
Navigate to the **Volumes** tab in Docker Desktop.
@z

@x
```typescript
ddClient.desktopUI.navigate.viewVolumes()
```
@y
```typescript
ddClient.desktopUI.navigate.viewVolumes()
```
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
___
@y
___
@z

@x
### viewVolume
@y
### viewVolume
@z

@x
▸ **viewVolume**(`volume`): `Promise`<`void`\>
@y
▸ **viewVolume**(`volume`): `Promise`<`void`\>
@z

@x
Navigate to a specific volume in Docker Desktop.
@y
Navigate to a specific volume in Docker Desktop.
@z

@x
```typescript
await ddClient.desktopUI.navigate.viewVolume(volume)
```
@y
```typescript
await ddClient.desktopUI.navigate.viewVolume(volume)
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
`Promise`<`void`\>
@y
`Promise`<`void`\>
@z
