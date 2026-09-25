%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Page through and filter lists"
linkTitle: "Page through and filter lists"
description: "Walk every page of a list with the SDK's iterators, and narrow a list on the server with a filter and an ordering."
keywords: "cloud sandboxes, sandboxes api, page through and filter lists"
@y
title: "Page through and filter lists"
linkTitle: "Page through and filter lists"
description: "Walk every page of a list with the SDK's iterators, and narrow a list on the server with a filter and an ordering."
keywords: "cloud sandboxes, sandboxes api, page through and filter lists"
@z

@x
List resources without losing results at page boundaries. SDK collection iterators request each page for you; collecting materializes the complete result in memory.
@y
List resources without losing results at page boundaries. SDK collection iterators request each page for you; collecting materializes the complete result in memory.
@z

@x
Use an [authenticated client](connect-to-cloud-with-a-bearer-token.md). For a large account, process iterator items as they arrive instead of collecting them all.
@y
Use an [authenticated client](connect-to-cloud-with-a-bearer-token.md). For a large account, process iterator items as they arrive instead of collecting them all.
@z

@x
## Walk every sandbox {#1-walk-every-sandbox}
@y
## Walk every sandbox {#1-walk-every-sandbox}
@z

@x
Set a page size and iterate the sandbox collection. The example collects the results for convenience. A page size controls each request, not the total number of returned resources.
@y
Set a page size and iterate the sandbox collection. The example collects the results for convenience. A page size controls each request, not the total number of returned resources.
@z

@x
When using one-page methods directly, pass the returned next-page token unchanged and keep the filter, order, and page size stable. Stop when no next token is returned, not when a page contains fewer items than requested.
@y
When using one-page methods directly, pass the returned next-page token unchanged and keep the filter, order, and page size stable. Stop when no next token is returned, not when a page contains fewer items than requested.
@z

@x
{{< tabs >}}
{{< tab name="TypeScript" >}}
@y
{{< tabs >}}
{{< tab name="TypeScript" >}}
@z

@x
```typescript
return client.all({ pageSize }).collect();
```
@y
```typescript
return client.all({ pageSize }).collect();
```
@z

@x
<details>
<summary>Complete TypeScript example: pagination/walk.ts</summary>
@y
<details>
<summary>Complete TypeScript example: pagination/walk.ts</summary>
@z

@x
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@z

@x
export async function walkSandboxes(client: Sandboxes, pageSize: number) {
  return client.all({ pageSize }).collect();
}
```
@y
export async function walkSandboxes(client: Sandboxes, pageSize: number) {
  return client.all({ pageSize }).collect();
}
```
@z

@x
</details>
@y
</details>
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Filter and order the result {#2-filter-and-order-the-result}
@y
## Filter and order the result {#2-filter-and-order-the-result}
@z

@x
Pass a filter and ordering supported by the collection. The example uses images; choose a filter such as `status=completed` to select ready images.
@y
Pass a filter and ordering supported by the collection. The example uses images; choose a filter such as `status=completed` to select ready images.
@z

@x
Filters are strings interpreted by the service. Use the field names and operators documented for that list method rather than a language object's property names. An invalid filter should be fixed, not silently removed and retried as an unfiltered list.
@y
Filters are strings interpreted by the service. Use the field names and operators documented for that list method rather than a language object's property names. An invalid filter should be fixed, not silently removed and retried as an unfiltered list.
@z

@x
{{< tabs >}}
{{< tab name="TypeScript" >}}
@y
{{< tabs >}}
{{< tab name="TypeScript" >}}
@z

@x
```typescript
return client.images.all({ filter, orderBy }).collect();
```
@y
```typescript
return client.images.all({ filter, orderBy }).collect();
```
@z

@x
<details>
<summary>Complete TypeScript example: pagination/filter.ts</summary>
@y
<details>
<summary>Complete TypeScript example: pagination/filter.ts</summary>
@z

@x
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@y
```typescript
import type { Sandboxes } from '@docker/sandboxes';
@z

@x
export async function filterImages(
  client: Sandboxes,
  filter: string,
  orderBy: string,
) {
  return client.images.all({ filter, orderBy }).collect();
}
```
@y
export async function filterImages(
  client: Sandboxes,
  filter: string,
  orderBy: string,
) {
  return client.images.all({ filter, orderBy }).collect();
}
```
@z

@x
</details>
@y
</details>
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z
