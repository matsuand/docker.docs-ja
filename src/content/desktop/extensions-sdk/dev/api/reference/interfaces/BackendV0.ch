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
# Interface: BackendV0
@y
# Interface: BackendV0
@z

@x
## Container Methods
@y
## Container Methods
@z

@x
### execInContainer
@y
### execInContainer
@z

@x
▸ **execInContainer**(`container`, `cmd`): `Promise`<[`ExecResultV0`](ExecResultV0.md)\>
@y
▸ **execInContainer**(`container`, `cmd`): `Promise`<[`ExecResultV0`](ExecResultV0.md)\>
@z

@x
Executes a command inside a container.
@y
Executes a command inside a container.
@z

@x
```typescript
const output = await window.ddClient.backend.execInContainer(container, cmd);
@y
```typescript
const output = await window.ddClient.backend.execInContainer(container, cmd);
@z

@x
console.log(output);
```
@y
console.log(output);
```
@z

@x
> **Warning**
>
> It will be removed in a future version.
@y
> **Warning**
>
> It will be removed in a future version.
@z

@x
#### Parameters
@y
#### Parameters
@z

@x
| Name | Type | Description |
| :------ | :------ | :------ |
| `container` | `string` | - |
| `cmd` | `string` | The command to be executed. |
@y
| Name | Type | Description |
| :------ | :------ | :------ |
| `container` | `string` | - |
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
___
@y
___
@z

@x
## HTTP Methods
@y
## HTTP Methods
@z

@x
### get
@y
### get
@z

@x
▸ **get**(`url`): `Promise`<`unknown`\>
@y
▸ **get**(`url`): `Promise`<`unknown`\>
@z

@x
Performs an HTTP GET request to a backend service.
@y
Performs an HTTP GET request to a backend service.
@z

@x
```typescript
window.ddClient.backend
 .get("/some/service")
 .then((value: any) => console.log(value));
```
@y
```typescript
window.ddClient.backend
 .get("/some/service")
 .then((value: any) => console.log(value));
```
@z

@x
> **Warning**
>
> It will be removed in a future version. Use [get](HttpService.md#get) instead.
@y
> **Warning**
>
> It will be removed in a future version. Use [get](HttpService.md#get) instead.
@z

@x
#### Parameters
@y
#### Parameters
@z

@x
| Name | Type | Description |
| :------ | :------ | :------ |
| `url` | `string` | The URL of the backend service. |
@y
| Name | Type | Description |
| :------ | :------ | :------ |
| `url` | `string` | The URL of the backend service. |
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
___
@y
___
@z

@x
### post
@y
### post
@z

@x
▸ **post**(`url`, `data`): `Promise`<`unknown`\>
@y
▸ **post**(`url`, `data`): `Promise`<`unknown`\>
@z

@x
Performs an HTTP POST request to a backend service.
@y
Performs an HTTP POST request to a backend service.
@z

@x
```typescript
window.ddClient.backend
 .post("/some/service", { ... })
 .then((value: any) => console.log(value));
```
@y
```typescript
window.ddClient.backend
 .post("/some/service", { ... })
 .then((value: any) => console.log(value));
```
@z

@x
> **Warning**
>
> It will be removed in a future version. Use [post](HttpService.md#post) instead.
@y
> **Warning**
>
> It will be removed in a future version. Use [post](HttpService.md#post) instead.
@z

@x
#### Parameters
@y
#### Parameters
@z

@x
| Name | Type | Description |
| :------ | :------ | :------ |
| `url` | `string` | The URL of the backend service. |
| `data` | `any` | The body of the request. |
@y
| Name | Type | Description |
| :------ | :------ | :------ |
| `url` | `string` | The URL of the backend service. |
| `data` | `any` | The body of the request. |
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
___
@y
___
@z

@x
### put
@y
### put
@z

@x
▸ **put**(`url`, `data`): `Promise`<`unknown`\>
@y
▸ **put**(`url`, `data`): `Promise`<`unknown`\>
@z

@x
Performs an HTTP PUT request to a backend service.
@y
Performs an HTTP PUT request to a backend service.
@z

@x
```typescript
window.ddClient.backend
 .put("/some/service", { ... })
 .then((value: any) => console.log(value));
```
@y
```typescript
window.ddClient.backend
 .put("/some/service", { ... })
 .then((value: any) => console.log(value));
```
@z

@x
> **Warning**
> 
> It will be removed in a future version. Use [put](HttpService.md#put) instead.
@y
> **Warning**
> 
> It will be removed in a future version. Use [put](HttpService.md#put) instead.
@z

@x
#### Parameters
@y
#### Parameters
@z

@x
| Name | Type | Description |
| :------ | :------ | :------ |
| `url` | `string` | The URL of the backend service. |
| `data` | `any` | The body of the request. |
@y
| Name | Type | Description |
| :------ | :------ | :------ |
| `url` | `string` | The URL of the backend service. |
| `data` | `any` | The body of the request. |
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
___
@y
___
@z

@x
### patch
@y
### patch
@z

@x
▸ **patch**(`url`, `data`): `Promise`<`unknown`\>
@y
▸ **patch**(`url`, `data`): `Promise`<`unknown`\>
@z

@x
Performs an HTTP PATCH request to a backend service.
@y
Performs an HTTP PATCH request to a backend service.
@z

@x
```typescript
window.ddClient.backend
 .patch("/some/service", { ... })
 .then((value: any) => console.log(value));
```
@y
```typescript
window.ddClient.backend
 .patch("/some/service", { ... })
 .then((value: any) => console.log(value));
```
@z

@x
> **Warning**
>
> It will be removed in a future version. Use [patch](HttpService.md#patch) instead.
@y
> **Warning**
>
> It will be removed in a future version. Use [patch](HttpService.md#patch) instead.
@z

@x
#### Parameters
@y
#### Parameters
@z

@x
| Name | Type | Description |
| :------ | :------ | :------ |
| `url` | `string` | The URL of the backend service. |
| `data` | `any` | The body of the request. |
@y
| Name | Type | Description |
| :------ | :------ | :------ |
| `url` | `string` | The URL of the backend service. |
| `data` | `any` | The body of the request. |
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
___
@y
___
@z

@x
### delete
@y
### delete
@z

@x
▸ **delete**(`url`): `Promise`<`unknown`\>
@y
▸ **delete**(`url`): `Promise`<`unknown`\>
@z

@x
Performs an HTTP DELETE request to a backend service.
@y
Performs an HTTP DELETE request to a backend service.
@z

@x
```typescript
window.ddClient.backend
 .delete("/some/service")
 .then((value: any) => console.log(value));
```
@y
```typescript
window.ddClient.backend
 .delete("/some/service")
 .then((value: any) => console.log(value));
```
@z

@x
> **Warning**
>
> It will be removed in a future version. Use [delete](HttpService.md#delete) instead.
@y
> **Warning**
>
> It will be removed in a future version. Use [delete](HttpService.md#delete) instead.
@z

@x
#### Parameters
@y
#### Parameters
@z

@x
| Name | Type | Description |
| :------ | :------ | :------ |
| `url` | `string` | The URL of the backend service. |
@y
| Name | Type | Description |
| :------ | :------ | :------ |
| `url` | `string` | The URL of the backend service. |
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
___
@y
___
@z

@x
### head
@y
### head
@z

@x
▸ **head**(`url`): `Promise`<`unknown`\>
@y
▸ **head**(`url`): `Promise`<`unknown`\>
@z

@x
Performs an HTTP HEAD request to a backend service.
@y
Performs an HTTP HEAD request to a backend service.
@z

@x
```typescript
window.ddClient.backend
 .head("/some/service")
 .then((value: any) => console.log(value));
```
@y
```typescript
window.ddClient.backend
 .head("/some/service")
 .then((value: any) => console.log(value));
```
@z

@x
> **Warning**
>
> It will be removed in a future version. Use [head](HttpService.md#head) instead.
@y
> **Warning**
>
> It will be removed in a future version. Use [head](HttpService.md#head) instead.
@z

@x
#### Parameters
@y
#### Parameters
@z

@x
| Name | Type | Description |
| :------ | :------ | :------ |
| `url` | `string` | The URL of the backend service. |
@y
| Name | Type | Description |
| :------ | :------ | :------ |
| `url` | `string` | The URL of the backend service. |
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
___
@y
___
@z

@x
### request
@y
### request
@z

@x
▸ **request**(`config`): `Promise`<`unknown`\>
@y
▸ **request**(`config`): `Promise`<`unknown`\>
@z

@x
Performs an HTTP request to a backend service.
@y
Performs an HTTP request to a backend service.
@z

@x
```typescript
window.ddClient.backend
 .request({ url: "/url", method: "GET", headers: { 'header-key': 'header-value' }, data: { ... }})
 .then((value: any) => console.log(value));
```
@y
```typescript
window.ddClient.backend
 .request({ url: "/url", method: "GET", headers: { 'header-key': 'header-value' }, data: { ... }})
 .then((value: any) => console.log(value));
```
@z

@x
> **Warning**
>
> It will be removed in a future version. Use [request](HttpService.md#request) instead.
@y
> **Warning**
>
> It will be removed in a future version. Use [request](HttpService.md#request) instead.
@z

@x
#### Parameters
@y
#### Parameters
@z

@x
| Name | Type | Description |
| :------ | :------ | :------ |
| `config` | [`RequestConfigV0`](RequestConfigV0.md) | The URL of the backend service. |
@y
| Name | Type | Description |
| :------ | :------ | :------ |
| `config` | [`RequestConfigV0`](RequestConfigV0.md) | The URL of the backend service. |
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
___
@y
___
@z

@x
## VM Methods
@y
## VM Methods
@z

@x
### execInVMExtension
@y
### execInVMExtension
@z

@x
▸ **execInVMExtension**(`cmd`): `Promise`<[`ExecResultV0`](ExecResultV0.md)\>
@y
▸ **execInVMExtension**(`cmd`): `Promise`<[`ExecResultV0`](ExecResultV0.md)\>
@z

@x
Executes a command inside the backend container.
If your extensions ships with additional binaries that should be run inside the backend container you can use the `execInVMExtension` function.
@y
Executes a command inside the backend container.
If your extensions ships with additional binaries that should be run inside the backend container you can use the `execInVMExtension` function.
@z

@x
```typescript
const output = await window.ddClient.backend.execInVMExtension(
  `cliShippedInTheVm xxx`
);
@y
```typescript
const output = await window.ddClient.backend.execInVMExtension(
  `cliShippedInTheVm xxx`
);
@z

@x
console.log(output);
```
@y
console.log(output);
```
@z

@x
> **Warning**
>
> It will be removed in a future version. Use [exec](ExtensionCli.md#exec) instead.
@y
> **Warning**
>
> It will be removed in a future version. Use [exec](ExtensionCli.md#exec) instead.
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
___
@y
___
@z

@x
### spawnInVMExtension
@y
### spawnInVMExtension
@z

@x
▸ **spawnInVMExtension**(`cmd`, `args`, `callback`): `void`
@y
▸ **spawnInVMExtension**(`cmd`, `args`, `callback`): `void`
@z

@x
Returns a stream from the command executed in the backend container.
@y
Returns a stream from the command executed in the backend container.
@z

@x
```typescript
window.ddClient.spawnInVMExtension(
  `cmd`,
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
window.ddClient.spawnInVMExtension(
  `cmd`,
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
> It will be removed in a future version.
@y
> **Warning**
>
> It will be removed in a future version.
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
