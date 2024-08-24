%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker extension API reference
keywords: Docker, extensions, sdk, API, reference
aliases:
 - /desktop/extensions-sdk/dev/api/reference/interfaces/HttpService/
 - /extensions/extensions-sdk/dev/api/reference/interfaces/HttpService/
---
@y
---
description: Docker extension API reference
keywords: Docker, extensions, sdk, API, reference
aliases:
 - /desktop/extensions-sdk/dev/api/reference/interfaces/HttpService/
 - /extensions/extensions-sdk/dev/api/reference/interfaces/HttpService/
---
@z

@x
# Interface: HttpService
@y
# Interface: HttpService
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
ddClient.extension.vm.service
 .get("/some/service")
 .then((value: any) => console.log(value)
```
@y
```typescript
ddClient.extension.vm.service
 .get("/some/service")
 .then((value: any) => console.log(value)
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
ddClient.extension.vm.service
 .post("/some/service", { ... })
 .then((value: any) => console.log(value));
```
@y
```typescript
ddClient.extension.vm.service
 .post("/some/service", { ... })
 .then((value: any) => console.log(value));
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
ddClient.extension.vm.service
 .put("/some/service", { ... })
 .then((value: any) => console.log(value));
```
@y
```typescript
ddClient.extension.vm.service
 .put("/some/service", { ... })
 .then((value: any) => console.log(value));
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
ddClient.extension.vm.service
 .patch("/some/service", { ... })
 .then((value: any) => console.log(value));
```
@y
```typescript
ddClient.extension.vm.service
 .patch("/some/service", { ... })
 .then((value: any) => console.log(value));
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
ddClient.extension.vm.service
 .delete("/some/service")
 .then((value: any) => console.log(value));
```
@y
```typescript
ddClient.extension.vm.service
 .delete("/some/service")
 .then((value: any) => console.log(value));
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
ddClient.extension.vm.service
 .head("/some/service")
 .then((value: any) => console.log(value));
```
@y
```typescript
ddClient.extension.vm.service
 .head("/some/service")
 .then((value: any) => console.log(value));
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
ddClient.extension.vm.service
 .request({ url: "/url", method: "GET", headers: { 'header-key': 'header-value' }, data: { ... }})
 .then((value: any) => console.log(value));
```
@y
```typescript
ddClient.extension.vm.service
 .request({ url: "/url", method: "GET", headers: { 'header-key': 'header-value' }, data: { ... }})
 .then((value: any) => console.log(value));
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
| `config` | [`RequestConfig`](RequestConfig.md) | The URL of the backend service. |
@y
| Name | Type | Description |
| :------ | :------ | :------ |
| `config` | [`RequestConfig`](RequestConfig.md) | The URL of the backend service. |
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
