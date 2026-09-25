%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Read files out of a sandbox"
linkTitle: "Read files out of a sandbox"
description: "List a directory in a running cloud sandbox, download files from it into memory, then move or remove paths inside it."
keywords: "cloud sandboxes, sandboxes api, read files out of a sandbox"
@y
title: "Read files out of a sandbox"
linkTitle: "Read files out of a sandbox"
description: "List a directory in a running cloud sandbox, download files from it into memory, then move or remove paths inside it."
keywords: "cloud sandboxes, sandboxes api, read files out of a sandbox"
@z

@x
Read build results, inspect project files, or copy data out before deleting a sandbox. Start with a running sandbox handle and an absolute path inside it.
@y
Read build results, inspect project files, or copy data out before deleting a sandbox. Start with a running sandbox handle and an absolute path inside it.
@z

@x
The examples return content to your application. To keep it on your machine, write the received bytes to a local file.
@y
The examples return content to your application. To keep it on your machine, write the received bytes to a local file.
@z

@x
## List a directory {#1-list-a-directory}
@y
## List a directory {#1-list-a-directory}
@z

@x
Walk the directory through the file collection's iterator. It follows pagination and returns the entries. Listing gives metadata, not file content.
@y
Walk the directory through the file collection's iterator. It follows pagination and returns the entries. Listing gives metadata, not file content.
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
return sandbox.files.all(path).collect();
```
@y
```typescript
return sandbox.files.all(path).collect();
```
@z

@x
<details>
<summary>Complete TypeScript example: download/list.ts</summary>
@y
<details>
<summary>Complete TypeScript example: download/list.ts</summary>
@z

@x
```typescript
import type { Sandbox } from '@docker/sandboxes';
@y
```typescript
import type { Sandbox } from '@docker/sandboxes';
@z

@x
export async function listDirectory(sandbox: Sandbox, path: string) {
  return sandbox.files.all(path).collect();
}
```
@y
export async function listDirectory(sandbox: Sandbox, path: string) {
  return sandbox.files.all(path).collect();
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
## Read a small text file {#2-read-a-small-text-file}
@y
## Read a small text file {#2-read-a-small-text-file}
@z

@x
Use the bounded read helper for text you want in memory. The example limits the read to one MiB. Choose a bound that fits your application's memory budget, or download a larger file as a stream.
@y
Use the bounded read helper for text you want in memory. The example limits the read to one MiB. Choose a bound that fits your application's memory budget, or download a larger file as a stream.
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
return sandbox.files.read(path, {
  encoding: 'utf8',
  maxBytes: 1024 * 1024,
});
```
@y
```typescript
return sandbox.files.read(path, {
  encoding: 'utf8',
  maxBytes: 1024 * 1024,
});
```
@z

@x
<details>
<summary>Complete TypeScript example: download/read.ts</summary>
@y
<details>
<summary>Complete TypeScript example: download/read.ts</summary>
@z

@x
```typescript
import type { Sandbox } from '@docker/sandboxes';
@y
```typescript
import type { Sandbox } from '@docker/sandboxes';
@z

@x
export async function readFile(sandbox: Sandbox, path: string) {
  return sandbox.files.read(path, {
    encoding: 'utf8',
    maxBytes: 1024 * 1024,
  });
}
```
@y
export async function readFile(sandbox: Sandbox, path: string) {
  return sandbox.files.read(path, {
    encoding: 'utf8',
    maxBytes: 1024 * 1024,
  });
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
## Inspect a path {#3-inspect-a-path}
@y
## Inspect a path {#3-inspect-a-path}
@z

@x
Read metadata before deciding whether to download, move, or remove a path. A successful metadata read does not reserve the file: another process may change it afterward.
@y
Read metadata before deciding whether to download, move, or remove a path. A successful metadata read does not reserve the file: another process may change it afterward.
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
return sandbox.files.stat(path);
```
@y
```typescript
return sandbox.files.stat(path);
```
@z

@x
<details>
<summary>Complete TypeScript example: download/stat.ts</summary>
@y
<details>
<summary>Complete TypeScript example: download/stat.ts</summary>
@z

@x
```typescript
import type { Sandbox } from '@docker/sandboxes';
@y
```typescript
import type { Sandbox } from '@docker/sandboxes';
@z

@x
export async function statFile(sandbox: Sandbox, path: string) {
  return sandbox.files.stat(path);
}
```
@y
export async function statFile(sandbox: Sandbox, path: string) {
  return sandbox.files.stat(path);
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
## Download a file as a stream {#4-download-a-file-as-a-stream}
@y
## Download a file as a stream {#4-download-a-file-as-a-stream}
@z

@x
Pass the sandbox path and a callback or writer that consumes bytes. The example closes the transfer when it finishes or fails.
@y
Pass the sandbox path and a callback or writer that consumes bytes. The example closes the transfer when it finishes or fails.
@z

@x
Treat the download as complete only when it ends successfully. If it fails halfway through, discard or separately identify the partial local file before retrying.
@y
Treat the download as complete only when it ends successfully. If it fails halfway through, discard or separately identify the partial local file before retrying.
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
const download = await sandbox.files.download(path);
try {
  for await (const chunk of download) write(chunk);
} finally {
  await download.close();
}
```
@y
```typescript
const download = await sandbox.files.download(path);
try {
  for await (const chunk of download) write(chunk);
} finally {
  await download.close();
}
```
@z

@x
<details>
<summary>Complete TypeScript example: download/download.ts</summary>
@y
<details>
<summary>Complete TypeScript example: download/download.ts</summary>
@z

@x
```typescript
import type { Sandbox } from '@docker/sandboxes';
@y
```typescript
import type { Sandbox } from '@docker/sandboxes';
@z

@x
export async function downloadFiles(
  sandbox: Sandbox,
  path: string,
  write: (bytes: Uint8Array) => void,
) {
  const download = await sandbox.files.download(path);
  try {
    for await (const chunk of download) write(chunk);
  } finally {
    await download.close();
  }
}
```
@y
export async function downloadFiles(
  sandbox: Sandbox,
  path: string,
  write: (bytes: Uint8Array) => void,
) {
  const download = await sandbox.files.download(path);
  try {
    for await (const chunk of download) write(chunk);
  } finally {
    await download.close();
  }
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
## Move a path {#5-move-a-path}
@y
## Move a path {#5-move-a-path}
@z

@x
Pass the current path and destination. This moves data inside the sandbox; it does not download anything to your computer.
@y
Pass the current path and destination. This moves data inside the sandbox; it does not download anything to your computer.
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
await sandbox.files.move(from, to);
```
@y
```typescript
await sandbox.files.move(from, to);
```
@z

@x
<details>
<summary>Complete TypeScript example: download/move.ts</summary>
@y
<details>
<summary>Complete TypeScript example: download/move.ts</summary>
@z

@x
```typescript
import type { Sandbox } from '@docker/sandboxes';
@y
```typescript
import type { Sandbox } from '@docker/sandboxes';
@z

@x
export async function movePath(
  sandbox: Sandbox,
  from: string,
  to: string,
) {
  await sandbox.files.move(from, to);
}
```
@y
export async function movePath(
  sandbox: Sandbox,
  from: string,
  to: string,
) {
  await sandbox.files.move(from, to);
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
## Remove a path {#6-remove-a-path}
@y
## Remove a path {#6-remove-a-path}
@z

@x
Remove a file, or enable recursive removal for a directory tree. Check the result for a failed path rather than assuming that every requested removal succeeded.
@y
Remove a file, or enable recursive removal for a directory tree. Check the result for a failed path rather than assuming that every requested removal succeeded.
@z

@x
Recursive removal is destructive. Keep user-supplied paths constrained to the directory your application owns.
@y
Recursive removal is destructive. Keep user-supplied paths constrained to the directory your application owns.
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
const result = await sandbox.files.remove(path, { recursive });
if (result.failedPath)
  throw new Error(`Remove ${path} stopped at ${result.failedPath}`);
```
@y
```typescript
const result = await sandbox.files.remove(path, { recursive });
if (result.failedPath)
  throw new Error(`Remove ${path} stopped at ${result.failedPath}`);
```
@z

@x
<details>
<summary>Complete TypeScript example: download/remove.ts</summary>
@y
<details>
<summary>Complete TypeScript example: download/remove.ts</summary>
@z

@x
```typescript
import type { Sandbox } from '@docker/sandboxes';
@y
```typescript
import type { Sandbox } from '@docker/sandboxes';
@z

@x
export async function removePath(
  sandbox: Sandbox,
  path: string,
  recursive: boolean,
) {
  const result = await sandbox.files.remove(path, { recursive });
  if (result.failedPath)
    throw new Error(`Remove ${path} stopped at ${result.failedPath}`);
}
```
@y
export async function removePath(
  sandbox: Sandbox,
  path: string,
  recursive: boolean,
) {
  const result = await sandbox.files.remove(path, { recursive });
  if (result.failedPath)
    throw new Error(`Remove ${path} stopped at ${result.failedPath}`);
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
