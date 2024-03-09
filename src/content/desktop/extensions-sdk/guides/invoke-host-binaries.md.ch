%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Invoke host binaries
description: Add invocations to host binaries from the frontend with the extension
  SDK.
keywords: Docker, extensions, sdk, build
---
@y
---
title: Invoke host binaries
description: Add invocations to host binaries from the frontend with the extension
  SDK.
keywords: Docker, extensions, sdk, build
---
@z

@x
In some cases, your extension may need to invoke some command from the host. For example, you
might want to invoke the CLI of your cloud provider to create a new resource, or the CLI of a tool your extension
provides, or even a shell script that you want to run on the host. 
@y
In some cases, your extension may need to invoke some command from the host. For example, you
might want to invoke the CLI of your cloud provider to create a new resource, or the CLI of a tool your extension
provides, or even a shell script that you want to run on the host. 
@z

@x
You could do that by executing the CLI from a container with the extension SDK. But this CLI needs to access the host's filesystem, which isn't easy nor fast if it runs in a container.
@y
You could do that by executing the CLI from a container with the extension SDK. But this CLI needs to access the host's filesystem, which isn't easy nor fast if it runs in a container.
@z

@x
However host binaries invoke from the extension executables (as binaries, shell scripts)
shipped as part of your extension and deployed to the host. As extensions can run on multiple platforms, this
means that you need to ship the executables for all the platforms you want to support.
@y
However host binaries invoke from the extension executables (as binaries, shell scripts)
shipped as part of your extension and deployed to the host. As extensions can run on multiple platforms, this
means that you need to ship the executables for all the platforms you want to support.
@z

@x
Learn more about extensions [architecture](../architecture/index.md).
@y
Learn more about extensions [architecture](../architecture/index.md).
@z

@x
> **Note**
>
> Only executables shipped as part of the extension can be invoked with the SDK. 
@y
> **Note**
>
> Only executables shipped as part of the extension can be invoked with the SDK. 
@z

@x
In this example, the CLI is a simple `Hello world` script that must be invoked with a parameter and returns a 
string.
@y
In this example, the CLI is a simple `Hello world` script that must be invoked with a parameter and returns a 
string.
@z

@x
## Add the executables to the extension
@y
## Add the executables to the extension
@z

@x
{{< tabs >}}
{{< tab name="Mac and Linux" >}}
@y
{{< tabs >}}
{{< tab name="Mac and Linux" >}}
@z

@x
Create a `bash` script for macOS and Linux, in the file `binaries/unix/hello.sh` with the following content:
@y
Create a `bash` script for macOS and Linux, in the file `binaries/unix/hello.sh` with the following content:
@z

@x
```bash
#!/bin/sh
echo "Hello, $1!"
```
@y
```bash
#!/bin/sh
echo "Hello, $1!"
```
@z

@x
{{< /tab >}}
{{< tab name="Windows" >}}
@y
{{< /tab >}}
{{< tab name="Windows" >}}
@z

@x
Create a `batch script` for Windows in another file `binaries/windows/hello.cmd` with the following content:
@y
Create a `batch script` for Windows in another file `binaries/windows/hello.cmd` with the following content:
@z

@x
```bash
@echo off
echo "Hello, %1!"
```
@y
```bash
@echo off
echo "Hello, %1!"
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
Then update the `Dockerfile` to copy the `binaries` folder into the extension's container filesystem and make the
files executable.
@y
Then update the `Dockerfile` to copy the `binaries` folder into the extension's container filesystem and make the
files executable.
@z

@x
```dockerfile
# Copy the binaries into the right folder
COPY --chmod=0755 binaries/windows/hello.cmd /windows/hello.cmd
COPY --chmod=0755 binaries/unix/hello.sh /linux/hello.sh
COPY --chmod=0755 binaries/unix/hello.sh /darwin/hello.sh
```
@y
```dockerfile
# Copy the binaries into the right folder
COPY --chmod=0755 binaries/windows/hello.cmd /windows/hello.cmd
COPY --chmod=0755 binaries/unix/hello.sh /linux/hello.sh
COPY --chmod=0755 binaries/unix/hello.sh /darwin/hello.sh
```
@z

@x
## Invoke the executable from the UI
@y
## Invoke the executable from the UI
@z

@x
In your extension, use the Docker Desktop Client object to [invoke the shell script](../dev/api/backend.md#invoke-an-extension-binary-on-the-host)
provided by the extension with the `ddClient.extension.host.cli.exec()` function.
In this example, the binary returns a string as result, obtained by `result?.stdout`, as soon as the extension view is rendered.
@y
In your extension, use the Docker Desktop Client object to [invoke the shell script](../dev/api/backend.md#invoke-an-extension-binary-on-the-host)
provided by the extension with the `ddClient.extension.host.cli.exec()` function.
In this example, the binary returns a string as result, obtained by `result?.stdout`, as soon as the extension view is rendered.
@z

@x
{{< tabs group="framework" >}}
{{< tab name="React" >}}
@y
{{< tabs group="framework" >}}
{{< tab name="React" >}}
@z

@x
```typescript
export function App() {
  const ddClient = createDockerDesktopClient();
  const [hello, setHello] = useState("");
@y
```typescript
export function App() {
  const ddClient = createDockerDesktopClient();
  const [hello, setHello] = useState("");
@z

@x
  useEffect(() => {
    const run = async () => {
      let binary = "hello.sh";
      if (ddClient.host.platform === 'win32') {
        binary = "hello.cmd";
      }
@y
  useEffect(() => {
    const run = async () => {
      let binary = "hello.sh";
      if (ddClient.host.platform === 'win32') {
        binary = "hello.cmd";
      }
@z

@x
      const result = await ddClient.extension.host?.cli.exec(binary, ["world"]);
      setHello(result?.stdout);
@y
      const result = await ddClient.extension.host?.cli.exec(binary, ["world"]);
      setHello(result?.stdout);
@z

@x
    };
    run();
  }, [ddClient]);
@y
    };
    run();
  }, [ddClient]);
@z

@x
  return (
    <div>
      {hello}
    </div>
  );
}
```
@y
  return (
    <div>
      {hello}
    </div>
  );
}
```
@z

@x
{{< /tab >}}
{{< tab name="Vue" >}}
@y
{{< /tab >}}
{{< tab name="Vue" >}}
@z

@x
> **Important**
>
> We don't have an example for Vue yet. [Fill out the form](https://docs.google.com/forms/d/e/1FAIpQLSdxJDGFJl5oJ06rG7uqtw1rsSBZpUhv_s9HHtw80cytkh2X-Q/viewform?usp=pp_url&entry.1333218187=Vue)
> and let us know if you'd like a sample with Vue.
{ .important }
@y
> **Important**
>
> We don't have an example for Vue yet. [Fill out the form](https://docs.google.com/forms/d/e/1FAIpQLSdxJDGFJl5oJ06rG7uqtw1rsSBZpUhv_s9HHtw80cytkh2X-Q/viewform?usp=pp_url&entry.1333218187=Vue)
> and let us know if you'd like a sample with Vue.
{ .important }
@z

@x
{{< /tab >}}
{{< tab name="Angular" >}}
@y
{{< /tab >}}
{{< tab name="Angular" >}}
@z

@x
> **Important**
>
> We don't have an example for Angular yet. [Fill out the form](https://docs.google.com/forms/d/e/1FAIpQLSdxJDGFJl5oJ06rG7uqtw1rsSBZpUhv_s9HHtw80cytkh2X-Q/viewform?usp=pp_url&entry.1333218187=Angular)
> and let us know if you'd like a sample with Angular.
{ .important }
@y
> **Important**
>
> We don't have an example for Angular yet. [Fill out the form](https://docs.google.com/forms/d/e/1FAIpQLSdxJDGFJl5oJ06rG7uqtw1rsSBZpUhv_s9HHtw80cytkh2X-Q/viewform?usp=pp_url&entry.1333218187=Angular)
> and let us know if you'd like a sample with Angular.
{ .important }
@z

@x
{{< /tab >}}
{{< tab name="Svelte" >}}
@y
{{< /tab >}}
{{< tab name="Svelte" >}}
@z

@x
> **Important**
>
> We don't have an example for Svelte yet. [Fill out the form](https://docs.google.com/forms/d/e/1FAIpQLSdxJDGFJl5oJ06rG7uqtw1rsSBZpUhv_s9HHtw80cytkh2X-Q/viewform?usp=pp_url&entry.1333218187=Svelte)
> and let us know if you'd like a sample with Svelte.
{ .important }
@y
> **Important**
>
> We don't have an example for Svelte yet. [Fill out the form](https://docs.google.com/forms/d/e/1FAIpQLSdxJDGFJl5oJ06rG7uqtw1rsSBZpUhv_s9HHtw80cytkh2X-Q/viewform?usp=pp_url&entry.1333218187=Svelte)
> and let us know if you'd like a sample with Svelte.
{ .important }
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Configure the metadata file
@y
## Configure the metadata file
@z

@x
The host binaries must be specified in the `metadata.json` file so that Docker Desktop copies them on to the host when installing
the extension. Once the extension is uninstalled, the binaries that were copied are removed as well.
@y
The host binaries must be specified in the `metadata.json` file so that Docker Desktop copies them on to the host when installing
the extension. Once the extension is uninstalled, the binaries that were copied are removed as well.
@z

@x
```json
{
  "vm": {
    ...
  },
  "ui": {
    ...
  },
  "host": {
    "binaries": [
      {
        "darwin": [
          {
            "path": "/darwin/hello.sh"
          }
        ],
        "linux": [
          {
            "path": "/linux/hello.sh"
          }
        ],
        "windows": [
          {
            "path": "/windows/hello.cmd"
          }
        ]
      }
    ]
  }
}
```
@y
```json
{
  "vm": {
    ...
  },
  "ui": {
    ...
  },
  "host": {
    "binaries": [
      {
        "darwin": [
          {
            "path": "/darwin/hello.sh"
          }
        ],
        "linux": [
          {
            "path": "/linux/hello.sh"
          }
        ],
        "windows": [
          {
            "path": "/windows/hello.cmd"
          }
        ]
      }
    ]
  }
}
```
@z

@x
The `path` must reference the path of the binary inside the container.
@y
The `path` must reference the path of the binary inside the container.
@z
