%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: "Copy a file into a cloud sandbox"
linkTitle: "Copy a file into a cloud sandbox"
description: "Create a directory inside a running cloud sandbox, write one file into it from memory, and read the size the write reports back."
keywords: "cloud sandboxes, sandboxes api, copy a file into a cloud sandbox"
@y
title: "Copy a file into a cloud sandbox"
linkTitle: "Copy a file into a cloud sandbox"
description: "Create a directory inside a running cloud sandbox, write one file into it from memory, and read the size the write reports back."
keywords: "cloud sandboxes, sandboxes api, copy a file into a cloud sandbox"
@z

@x
Send project files, scripts, or input data to a running sandbox. Use its file collection instead of putting large file contents into command arguments.
@y
Send project files, scripts, or input data to a running sandbox. Use its file collection instead of putting large file contents into command arguments.
@z

@x
You need a sandbox handle from [your first sandbox](create-your-first-sandbox.md) and an absolute destination path. The paths in these examples are inside the sandbox, not on your computer.
@y
You need a sandbox handle from [your first sandbox](create-your-first-sandbox.md) and an absolute destination path. The paths in these examples are inside the sandbox, not on your computer.
@z

@x
## Create the destination directory {#1-create-the-destination-directory}
@y
## Create the destination directory {#1-create-the-destination-directory}
@z

@x
Create the destination directory with the desired permission mode. The example also creates missing parent directories.
@y
Create the destination directory with the desired permission mode. The example also creates missing parent directories.
@z

@x
Choose the narrowest permissions the workload needs. Remember that a file's contents and its executable permission are separate settings.
@y
Choose the narrowest permissions the workload needs. Remember that a file's contents and its executable permission are separate settings.
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
await sandbox.files.mkdir(path, { mode, parents: true });
```
@y
```typescript
await sandbox.files.mkdir(path, { mode, parents: true });
```
@z

@x
<details>
<summary>Complete TypeScript example: upload/mkdir.ts</summary>
@y
<details>
<summary>Complete TypeScript example: upload/mkdir.ts</summary>
@z

@x
```typescript
import type { Sandbox } from '@docker/sandboxes';
@y
```typescript
import type { Sandbox } from '@docker/sandboxes';
@z

@x
export async function makeDirectory(
  sandbox: Sandbox,
  path: string,
  mode: number,
) {
  await sandbox.files.mkdir(path, { mode, parents: true });
}
```
@y
export async function makeDirectory(
  sandbox: Sandbox,
  path: string,
  mode: number,
) {
  await sandbox.files.mkdir(path, { mode, parents: true });
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
## Write a small text file {#2-write-a-small-text-file}
@y
## Write a small text file {#2-write-a-small-text-file}
@z

@x
Use the write helper for a configuration file or short script already held as a string. Pass its destination path and content. For binary data or streamed transfers, use upload instead.
@y
Use the write helper for a configuration file or short script already held as a string. Pass its destination path and content. For binary data or streamed transfers, use upload instead.
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
return sandbox.files.write(path, content);
```
@y
```typescript
return sandbox.files.write(path, content);
```
@z

@x
<details>
<summary>Complete TypeScript example: upload/write.ts</summary>
@y
<details>
<summary>Complete TypeScript example: upload/write.ts</summary>
@z

@x
```typescript
import type { Sandbox } from '@docker/sandboxes';
@y
```typescript
import type { Sandbox } from '@docker/sandboxes';
@z

@x
export async function writeFile(
  sandbox: Sandbox,
  path: string,
  content: string,
) {
  return sandbox.files.write(path, content);
}
```
@y
export async function writeFile(
  sandbox: Sandbox,
  path: string,
  content: string,
) {
  return sandbox.files.write(path, content);
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
## Upload file content {#3-upload-file-content}
@y
## Upload file content {#3-upload-file-content}
@z

@x
Upload bytes to the destination and read its metadata afterward. The example accepts content from your application; read a local file first if that is your source.
@y
Upload bytes to the destination and read its metadata afterward. The example accepts content from your application; read a local file first if that is your source.
@z

@x
Choose a file mode explicitly when executable or restricted permissions matter. A failed upload may have written some data. Inspect the destination before retrying if replacing its contents would be unsafe.
@y
Choose a file mode explicitly when executable or restricted permissions matter. A failed upload may have written some data. Inspect the destination before retrying if replacing its contents would be unsafe.
@z

@x
Next, [run a command](run-your-first-command.md) that reads the file, or [read it back](read-files-out-of-a-sandbox.md) to verify the content.
@y
Next, [run a command](run-your-first-command.md) that reads the file, or [read it back](read-files-out-of-a-sandbox.md) to verify the content.
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
await sandbox.files.upload(path, content, { mode });
return (await sandbox.files.stat(path)).info;
```
@y
```typescript
await sandbox.files.upload(path, content, { mode });
return (await sandbox.files.stat(path)).info;
```
@z

@x
<details>
<summary>Complete TypeScript example: upload/upload.ts</summary>
@y
<details>
<summary>Complete TypeScript example: upload/upload.ts</summary>
@z

@x
```typescript
import type { Sandbox } from '@docker/sandboxes';
@y
```typescript
import type { Sandbox } from '@docker/sandboxes';
@z

@x
export async function uploadFile(
  sandbox: Sandbox,
  path: string,
  content: Uint8Array,
  mode: number,
) {
  await sandbox.files.upload(path, content, { mode });
  return (await sandbox.files.stat(path)).info;
}
```
@y
export async function uploadFile(
  sandbox: Sandbox,
  path: string,
  content: Uint8Array,
  mode: number,
) {
  await sandbox.files.upload(path, content, { mode });
  return (await sandbox.files.stat(path)).info;
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
