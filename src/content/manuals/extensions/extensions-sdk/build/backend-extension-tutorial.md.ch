%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Add a backend to your extension
description: Learn how to add a backend to your extension.
keywords: Docker, extensions, sdk, build
aliases:
 - /desktop/extensions-sdk/tutorials/minimal-backend-extension/
 - /desktop/extensions-sdk/build/minimal-backend-extension/
 - /desktop/extensions-sdk/build/set-up/backend-extension-tutorial/
 - /desktop/extensions-sdk/build/backend-extension-tutorial/
---
@y
---
title: Add a backend to your extension
description: Learn how to add a backend to your extension.
keywords: Docker, extensions, sdk, build
aliases:
 - /desktop/extensions-sdk/tutorials/minimal-backend-extension/
 - /desktop/extensions-sdk/build/minimal-backend-extension/
 - /desktop/extensions-sdk/build/set-up/backend-extension-tutorial/
 - /desktop/extensions-sdk/build/backend-extension-tutorial/
---
@z

@x
Your extension can ship a backend part with which the frontend can interact with. This page provides information on why and how to add a backend.
@y
Your extension can ship a backend part with which the frontend can interact with. This page provides information on why and how to add a backend.
@z

@x
Before you start, make sure you have installed the latest version of [Docker Desktop](https://www.docker.com/products/docker-desktop/).
@y
Before you start, make sure you have installed the latest version of [Docker Desktop](https://www.docker.com/products/docker-desktop/).
@z

@x
> Tip
>
> Check the [Quickstart guide](../quickstart.md) and `docker extension init <my-extension>`. They provide a better base for your extension as it's more up-to-date and related to your install of Docker Desktop.
@y
> Tip
>
> Check the [Quickstart guide](../quickstart.md) and `docker extension init <my-extension>`. They provide a better base for your extension as it's more up-to-date and related to your install of Docker Desktop.
@z

@x
## Why add a backend?
@y
## Why add a backend?
@z

@x
Thanks to the Docker Extensions SDK, most of the time you should be able to do what you need from the Docker CLI
directly from [the frontend](frontend-extension-tutorial.md#use-the-extension-apis-client).
@y
Thanks to the Docker Extensions SDK, most of the time you should be able to do what you need from the Docker CLI
directly from [the frontend](frontend-extension-tutorial.md#use-the-extension-apis-client).
@z

@x
Nonetheless, there are some cases where you might need to add a backend to your extension. So far, extension
builders have used the backend to:
- Store data in a local database and serve them back with a REST API.
- Store the extension state, for example when a button starts a long-running process, so that if you navigate away from the extension user interface and comes back, the frontend can pick up where it left off.
@y
Nonetheless, there are some cases where you might need to add a backend to your extension. So far, extension
builders have used the backend to:
- Store data in a local database and serve them back with a REST API.
- Store the extension state, for example when a button starts a long-running process, so that if you navigate away from the extension user interface and comes back, the frontend can pick up where it left off.
@z

@x
For more information about extension backends, see [Architecture](../architecture/_index.md#the-backend).
@y
For more information about extension backends, see [Architecture](../architecture/_index.md#the-backend).
@z

@x
## Add a backend to the extension
@y
## Add a backend to the extension
@z

@x
If you created your extension using the `docker extension init` command, you already have a backend setup. Otherwise, you have to first create a `vm` directory that contains the code and updates the Dockerfile to
containerize it.
@y
If you created your extension using the `docker extension init` command, you already have a backend setup. Otherwise, you have to first create a `vm` directory that contains the code and updates the Dockerfile to
containerize it.
@z

@x
Here is the extension folder structure with a backend:
@y
Here is the extension folder structure with a backend:
@z

@x
```bash
.
├── Dockerfile # (1)
├── Makefile
├── metadata.json
├── ui
    └── index.html
└── vm # (2)
    ├── go.mod
    └── main.go
```
@y
```bash
.
├── Dockerfile # (1)
├── Makefile
├── metadata.json
├── ui
    └── index.html
└── vm # (2)
    ├── go.mod
    └── main.go
```
@z

@x
1. Contains everything required to build the backend and copy it in the extension's container filesystem.
2. The source folder that contains the backend code of the extension.
@y
1. Contains everything required to build the backend and copy it in the extension's container filesystem.
2. The source folder that contains the backend code of the extension.
@z

@x
Although you can start from an empty directory or from the `vm-ui extension` [sample](https://github.com/docker/extensions-sdk/tree/main/samples),
it is highly recommended that you start from the `docker extension init` command and change it to suit your needs.
@y
Although you can start from an empty directory or from the `vm-ui extension` [sample](https://github.com/docker/extensions-sdk/tree/main/samples),
it is highly recommended that you start from the `docker extension init` command and change it to suit your needs.
@z

@x
> [!TIP]
>
> The `docker extension init` generates a Go backend. But you can still use it as a starting point for
> your own extension and use any other language like Node.js, Python, Java, .Net, or any other language and framework.
@y
> [!TIP]
>
> The `docker extension init` generates a Go backend. But you can still use it as a starting point for
> your own extension and use any other language like Node.js, Python, Java, .Net, or any other language and framework.
@z

@x
In this tutorial, the backend service simply exposes one route that returns a JSON payload that says "Hello".
@y
In this tutorial, the backend service simply exposes one route that returns a JSON payload that says "Hello".
@z

@x
```json
{ "Message": "Hello" }
```
@y
```json
{ "Message": "Hello" }
```
@z

@x
> [!IMPORTANT]
>
> We recommend that, the frontend and the backend communicate through sockets, and named pipes on Windows, instead of
> HTTP. This prevents port collision with any other running application or container running
> on the host. Also, some Docker Desktop users are running in constrained environments where they
> can't open ports on their machines. When choosing the language and framework for your backend, make sure it
> supports sockets connection.
@y
> [!IMPORTANT]
>
> We recommend that, the frontend and the backend communicate through sockets, and named pipes on Windows, instead of
> HTTP. This prevents port collision with any other running application or container running
> on the host. Also, some Docker Desktop users are running in constrained environments where they
> can't open ports on their machines. When choosing the language and framework for your backend, make sure it
> supports sockets connection.
@z

@x
{{< tabs group="lang" >}}
{{< tab name="Go" >}}
@y
{{< tabs group="lang" >}}
{{< tab name="Go" >}}
@z

@x
```go
package main
@y
```go
package main
@z

@x
import (
	"flag"
	"log"
	"net"
	"net/http"
	"os"
@y
import (
	"flag"
	"log"
	"net"
	"net/http"
	"os"
@z

@x
	"github.com/labstack/echo"
	"github.com/sirupsen/logrus"
)
@y
	"github.com/labstack/echo"
	"github.com/sirupsen/logrus"
)
@z

@x
func main() {
	var socketPath string
	flag.StringVar(&socketPath, "socket", "/run/guest/volumes-service.sock", "Unix domain socket to listen on")
	flag.Parse()
@y
func main() {
	var socketPath string
	flag.StringVar(&socketPath, "socket", "/run/guest/volumes-service.sock", "Unix domain socket to listen on")
	flag.Parse()
@z

@x
	os.RemoveAll(socketPath)
@y
	os.RemoveAll(socketPath)
@z

@x
	logrus.New().Infof("Starting listening on %s\n", socketPath)
	router := echo.New()
	router.HideBanner = true
@y
	logrus.New().Infof("Starting listening on %s\n", socketPath)
	router := echo.New()
	router.HideBanner = true
@z

@x
	startURL := ""
@y
	startURL := ""
@z

@x
	ln, err := listen(socketPath)
	if err != nil {
		log.Fatal(err)
	}
	router.Listener = ln
@y
	ln, err := listen(socketPath)
	if err != nil {
		log.Fatal(err)
	}
	router.Listener = ln
@z

@x
	router.GET("/hello", hello)
@y
	router.GET("/hello", hello)
@z

@x
	log.Fatal(router.Start(startURL))
}
@y
	log.Fatal(router.Start(startURL))
}
@z

@x
func listen(path string) (net.Listener, error) {
	return net.Listen("unix", path)
}
@y
func listen(path string) (net.Listener, error) {
	return net.Listen("unix", path)
}
@z

@x
func hello(ctx echo.Context) error {
	return ctx.JSON(http.StatusOK, HTTPMessageBody{Message: "hello world"})
}
@y
func hello(ctx echo.Context) error {
	return ctx.JSON(http.StatusOK, HTTPMessageBody{Message: "hello world"})
}
@z

@x
type HTTPMessageBody struct {
	Message string
}
```
@y
type HTTPMessageBody struct {
	Message string
}
```
@z

@x
{{< /tab >}}
{{< tab name="Node" >}}
@y
{{< /tab >}}
{{< tab name="Node" >}}
@z

@x
> [!IMPORTANT]
>
> We don't have a working example for Node yet. [Fill out the form](https://docs.google.com/forms/d/e/1FAIpQLSdxJDGFJl5oJ06rG7uqtw1rsSBZpUhv_s9HHtw80cytkh2X-Q/viewform?usp=pp_url&entry.25798127=Node)
> and let us know if you'd like a sample for Node.
@y
> [!IMPORTANT]
>
> We don't have a working example for Node yet. [Fill out the form](https://docs.google.com/forms/d/e/1FAIpQLSdxJDGFJl5oJ06rG7uqtw1rsSBZpUhv_s9HHtw80cytkh2X-Q/viewform?usp=pp_url&entry.25798127=Node)
> and let us know if you'd like a sample for Node.
@z

@x
{{< /tab >}}
{{< tab name="Python" >}}
@y
{{< /tab >}}
{{< tab name="Python" >}}
@z

@x
> [!IMPORTANT]
>
> We don't have a working example for Python yet. [Fill out the form](https://docs.google.com/forms/d/e/1FAIpQLSdxJDGFJl5oJ06rG7uqtw1rsSBZpUhv_s9HHtw80cytkh2X-Q/viewform?usp=pp_url&entry.25798127=Python)
> and let us know if you'd like a sample for Python.
@y
> [!IMPORTANT]
>
> We don't have a working example for Python yet. [Fill out the form](https://docs.google.com/forms/d/e/1FAIpQLSdxJDGFJl5oJ06rG7uqtw1rsSBZpUhv_s9HHtw80cytkh2X-Q/viewform?usp=pp_url&entry.25798127=Python)
> and let us know if you'd like a sample for Python.
@z

@x
{{< /tab >}}
{{< tab name="Java" >}}
@y
{{< /tab >}}
{{< tab name="Java" >}}
@z

@x
> [!IMPORTANT]
>
> We don't have a working example for Java yet. [Fill out the form](https://docs.google.com/forms/d/e/1FAIpQLSdxJDGFJl5oJ06rG7uqtw1rsSBZpUhv_s9HHtw80cytkh2X-Q/viewform?usp=pp_url&entry.25798127=Java)
> and let us know if you'd like a sample for Java.
@y
> [!IMPORTANT]
>
> We don't have a working example for Java yet. [Fill out the form](https://docs.google.com/forms/d/e/1FAIpQLSdxJDGFJl5oJ06rG7uqtw1rsSBZpUhv_s9HHtw80cytkh2X-Q/viewform?usp=pp_url&entry.25798127=Java)
> and let us know if you'd like a sample for Java.
@z

@x
{{< /tab >}}
{{< tab name=".NET" >}}
@y
{{< /tab >}}
{{< tab name=".NET" >}}
@z

@x
> [!IMPORTANT]
>
> We don't have a working example for .NET. [Fill out the form](https://docs.google.com/forms/d/e/1FAIpQLSdxJDGFJl5oJ06rG7uqtw1rsSBZpUhv_s9HHtw80cytkh2X-Q/viewform?usp=pp_url&entry.25798127=.Net)
> and let us know if you'd like a sample for .NET.
@y
> [!IMPORTANT]
>
> We don't have a working example for .NET. [Fill out the form](https://docs.google.com/forms/d/e/1FAIpQLSdxJDGFJl5oJ06rG7uqtw1rsSBZpUhv_s9HHtw80cytkh2X-Q/viewform?usp=pp_url&entry.25798127=.Net)
> and let us know if you'd like a sample for .NET.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Adapt the Dockerfile
@y
## Adapt the Dockerfile
@z

@x
> [!NOTE]
>
> When using the `docker extension init`, it creates a `Dockerfile` that already contains what is needed for a Go backend.
@y
> [!NOTE]
>
> When using the `docker extension init`, it creates a `Dockerfile` that already contains what is needed for a Go backend.
@z

@x
{{< tabs group="lang" >}}
{{< tab name="Go" >}}
@y
{{< tabs group="lang" >}}
{{< tab name="Go" >}}
@z

@x
To deploy your Go backend when installing the extension, you need first to configure the `Dockerfile`, so that it:
- Builds the backend application
- Copies the binary in the extension's container filesystem
- Starts the binary when the container starts listening on the extension socket
@y
To deploy your Go backend when installing the extension, you need first to configure the `Dockerfile`, so that it:
- Builds the backend application
- Copies the binary in the extension's container filesystem
- Starts the binary when the container starts listening on the extension socket
@z

@x
> [!TIP]
> 
> To ease version management, you can reuse the same image to build the frontend, build the
backend service, and package the extension.
@y
> [!TIP]
> 
> To ease version management, you can reuse the same image to build the frontend, build the
backend service, and package the extension.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM node:17.7-alpine3.14 AS client-builder
# ... build frontend application
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM node:17.7-alpine3.14 AS client-builder
# ... build frontend application
@z

@x
# Build the Go backend
FROM golang:1.17-alpine AS builder
ENV CGO_ENABLED=0
WORKDIR /backend
COPY vm/go.* .
RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    go mod download
COPY vm/. .
RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    go build -trimpath -ldflags="-s -w" -o bin/service
@y
# Build the Go backend
FROM golang:1.17-alpine AS builder
ENV CGO_ENABLED=0
WORKDIR /backend
COPY vm/go.* .
RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    go mod download
COPY vm/. .
RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    go build -trimpath -ldflags="-s -w" -o bin/service
@z

@x
FROM alpine:3.15
# ... add labels and copy the frontend application
@y
FROM alpine:3.15
# ... add labels and copy the frontend application
@z

@x
COPY --from=builder /backend/bin/service /
CMD /service -socket /run/guest-services/extension-allthethings-extension.sock
```
@y
COPY --from=builder /backend/bin/service /
CMD /service -socket /run/guest-services/extension-allthethings-extension.sock
```
@z

@x
{{< /tab >}}
{{< tab name="Node" >}}
@y
{{< /tab >}}
{{< tab name="Node" >}}
@z

@x
> [!IMPORTANT]
>
> We don't have a working Dockerfile for Node yet. [Fill out the form](https://docs.google.com/forms/d/e/1FAIpQLSdxJDGFJl5oJ06rG7uqtw1rsSBZpUhv_s9HHtw80cytkh2X-Q/viewform?usp=pp_url&entry.25798127=Node)
> and let us know if you'd like a Dockerfile for Node.
@y
> [!IMPORTANT]
>
> We don't have a working Dockerfile for Node yet. [Fill out the form](https://docs.google.com/forms/d/e/1FAIpQLSdxJDGFJl5oJ06rG7uqtw1rsSBZpUhv_s9HHtw80cytkh2X-Q/viewform?usp=pp_url&entry.25798127=Node)
> and let us know if you'd like a Dockerfile for Node.
@z

@x
{{< /tab >}}
{{< tab name="Python" >}}
@y
{{< /tab >}}
{{< tab name="Python" >}}
@z

@x
> [!IMPORTANT]
>
> We don't have a working Dockerfile for Python yet. [Fill out the form](https://docs.google.com/forms/d/e/1FAIpQLSdxJDGFJl5oJ06rG7uqtw1rsSBZpUhv_s9HHtw80cytkh2X-Q/viewform?usp=pp_url&entry.25798127=Python)
> and let us know if you'd like a Dockerfile for Python.
@y
> [!IMPORTANT]
>
> We don't have a working Dockerfile for Python yet. [Fill out the form](https://docs.google.com/forms/d/e/1FAIpQLSdxJDGFJl5oJ06rG7uqtw1rsSBZpUhv_s9HHtw80cytkh2X-Q/viewform?usp=pp_url&entry.25798127=Python)
> and let us know if you'd like a Dockerfile for Python.
@z

@x
{{< /tab >}}
{{< tab name="Java" >}}
@y
{{< /tab >}}
{{< tab name="Java" >}}
@z

@x
> [!IMPORTANT]
>
> We don't have a working Dockerfile for Java yet. [Fill out the form](https://docs.google.com/forms/d/e/1FAIpQLSdxJDGFJl5oJ06rG7uqtw1rsSBZpUhv_s9HHtw80cytkh2X-Q/viewform?usp=pp_url&entry.25798127=Java)
> and let us know if you'd like a Dockerfile for Java.
@y
> [!IMPORTANT]
>
> We don't have a working Dockerfile for Java yet. [Fill out the form](https://docs.google.com/forms/d/e/1FAIpQLSdxJDGFJl5oJ06rG7uqtw1rsSBZpUhv_s9HHtw80cytkh2X-Q/viewform?usp=pp_url&entry.25798127=Java)
> and let us know if you'd like a Dockerfile for Java.
@z

@x
{{< /tab >}}
{{< tab name=".NET" >}}
@y
{{< /tab >}}
{{< tab name=".NET" >}}
@z

@x
> [!IMPORTANT]
>
> We don't have a working Dockerfile for .Net. [Fill out the form](https://docs.google.com/forms/d/e/1FAIpQLSdxJDGFJl5oJ06rG7uqtw1rsSBZpUhv_s9HHtw80cytkh2X-Q/viewform?usp=pp_url&entry.25798127=.Net)
> and let us know if you'd like a Dockerfile for .Net.
@y
> [!IMPORTANT]
>
> We don't have a working Dockerfile for .Net. [Fill out the form](https://docs.google.com/forms/d/e/1FAIpQLSdxJDGFJl5oJ06rG7uqtw1rsSBZpUhv_s9HHtw80cytkh2X-Q/viewform?usp=pp_url&entry.25798127=.Net)
> and let us know if you'd like a Dockerfile for .Net.
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
To start the backend service of your extension inside the VM of Docker Desktop, you have to configure the image name
in the `vm` section of the `metadata.json` file.
@y
To start the backend service of your extension inside the VM of Docker Desktop, you have to configure the image name
in the `vm` section of the `metadata.json` file.
@z

@x
```json
{
  "vm": {
    "image": "${DESKTOP_PLUGIN_IMAGE}"
  },
  "icon": "docker.svg",
  "ui": {
    ...
  }
}
```
@y
```json
{
  "vm": {
    "image": "${DESKTOP_PLUGIN_IMAGE}"
  },
  "icon": "docker.svg",
  "ui": {
    ...
  }
}
```
@z

@x
For more information on the `vm` section of the `metadata.json`, see [Metadata](../architecture/metadata.md).
@y
For more information on the `vm` section of the `metadata.json`, see [Metadata](../architecture/metadata.md).
@z

@x
> [!WARNING]
>
> Do not replace the `${DESKTOP_PLUGIN_IMAGE}` placeholder in the `metadata.json` file. The placeholder is replaced automatically with the correct image name when the extension is installed.
@y
> [!WARNING]
>
> Do not replace the `${DESKTOP_PLUGIN_IMAGE}` placeholder in the `metadata.json` file. The placeholder is replaced automatically with the correct image name when the extension is installed.
@z

@x
## Invoke the extension backend from your frontend
@y
## Invoke the extension backend from your frontend
@z

@x
Using the [advanced frontend extension example](frontend-extension-tutorial.md), we can invoke our extension backend.
@y
Using the [advanced frontend extension example](frontend-extension-tutorial.md), we can invoke our extension backend.
@z

@x
Use the Docker Desktop Client object and then invoke the `/hello` route from the backend service with `ddClient.
extension.vm.service.get` that returns the body of the response.
@y
Use the Docker Desktop Client object and then invoke the `/hello` route from the backend service with `ddClient.
extension.vm.service.get` that returns the body of the response.
@z

@x
{{< tabs group="framework" >}}
{{< tab name="React" >}}
@y
{{< tabs group="framework" >}}
{{< tab name="React" >}}
@z

@x
Replace the `ui/src/App.tsx` file with the following code:
@y
Replace the `ui/src/App.tsx` file with the following code:
@z

@x
```tsx
@y
```tsx
@z

@x
// ui/src/App.tsx
import React, { useEffect } from 'react';
import { createDockerDesktopClient } from "@docker/extension-api-client";
@y
// ui/src/App.tsx
import React, { useEffect } from 'react';
import { createDockerDesktopClient } from "@docker/extension-api-client";
@z

@x
//obtain docker destkop extension client
const ddClient = createDockerDesktopClient();
@y
//obtain docker destkop extension client
const ddClient = createDockerDesktopClient();
@z

@x
export function App() {
  const ddClient = createDockerDesktopClient();
  const [hello, setHello] = useState<string>();
@y
export function App() {
  const ddClient = createDockerDesktopClient();
  const [hello, setHello] = useState<string>();
@z

@x
  useEffect(() => {
    const getHello = async () => {
      const result = await ddClient.extension.vm?.service?.get('/hello');
      setHello(JSON.stringify(result));
    }
    getHello()
  }, []);
@y
  useEffect(() => {
    const getHello = async () => {
      const result = await ddClient.extension.vm?.service?.get('/hello');
      setHello(JSON.stringify(result));
    }
    getHello()
  }, []);
@z

@x
  return (
    <Typography>{hello}</Typography>
  );
}
@y
  return (
    <Typography>{hello}</Typography>
  );
}
@z

@x
```
@y
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
> [!IMPORTANT]
>
> We don't have an example for Vue yet. [Fill out the form](https://docs.google.com/forms/d/e/1FAIpQLSdxJDGFJl5oJ06rG7uqtw1rsSBZpUhv_s9HHtw80cytkh2X-Q/viewform?usp=pp_url&entry.1333218187=Vue)
> and let us know if you'd like a sample with Vue.
@y
> [!IMPORTANT]
>
> We don't have an example for Vue yet. [Fill out the form](https://docs.google.com/forms/d/e/1FAIpQLSdxJDGFJl5oJ06rG7uqtw1rsSBZpUhv_s9HHtw80cytkh2X-Q/viewform?usp=pp_url&entry.1333218187=Vue)
> and let us know if you'd like a sample with Vue.
@z

@x
{{< /tab >}}
{{< tab name="Angular" >}}
@y
{{< /tab >}}
{{< tab name="Angular" >}}
@z

@x
> [!IMPORTANT]
>
> We don't have an example for Angular yet. [Fill out the form](https://docs.google.com/forms/d/e/1FAIpQLSdxJDGFJl5oJ06rG7uqtw1rsSBZpUhv_s9HHtw80cytkh2X-Q/viewform?usp=pp_url&entry.1333218187=Angular)
> and let us know if you'd like a sample with Angular.
@y
> [!IMPORTANT]
>
> We don't have an example for Angular yet. [Fill out the form](https://docs.google.com/forms/d/e/1FAIpQLSdxJDGFJl5oJ06rG7uqtw1rsSBZpUhv_s9HHtw80cytkh2X-Q/viewform?usp=pp_url&entry.1333218187=Angular)
> and let us know if you'd like a sample with Angular.
@z

@x
{{< /tab >}}
{{< tab name="Svelte" >}}
@y
{{< /tab >}}
{{< tab name="Svelte" >}}
@z

@x
> [!IMPORTANT]
>
> We don't have an example for Svelte yet. [Fill out the form](https://docs.google.com/forms/d/e/1FAIpQLSdxJDGFJl5oJ06rG7uqtw1rsSBZpUhv_s9HHtw80cytkh2X-Q/viewform?usp=pp_url&entry.1333218187=Svelte)
> and let us know if you'd like a sample with Svelte.
@y
> [!IMPORTANT]
>
> We don't have an example for Svelte yet. [Fill out the form](https://docs.google.com/forms/d/e/1FAIpQLSdxJDGFJl5oJ06rG7uqtw1rsSBZpUhv_s9HHtw80cytkh2X-Q/viewform?usp=pp_url&entry.1333218187=Svelte)
> and let us know if you'd like a sample with Svelte.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Re-build the extension and update it
@y
## Re-build the extension and update it
@z

@x
Since you have modified the configuration of the extension and added a stage in the Dockerfile, you must re-build the extension.
@y
Since you have modified the configuration of the extension and added a stage in the Dockerfile, you must re-build the extension.
@z

@x
```bash
docker build --tag=awesome-inc/my-extension:latest .
```
@y
```bash
docker build --tag=awesome-inc/my-extension:latest .
```
@z

@x
Once built, you need to update it, or install it if you haven't already done so.
@y
Once built, you need to update it, or install it if you haven't already done so.
@z

@x
```bash
docker extension update awesome-inc/my-extension:latest
```
@y
```bash
docker extension update awesome-inc/my-extension:latest
```
@z

@x
Now you can see the backend service running in the **Containers** view of the Docker Desktop Dashboard and watch the logs when you need to debug it.
@y
Now you can see the backend service running in the **Containers** view of the Docker Desktop Dashboard and watch the logs when you need to debug it.
@z

@x
> [!TIP]
>
> You may need to turn on the **Show system containers** option in **Settings** to see the backend container running.
> See [Show extension containers](../dev/test-debug.md#show-the-extension-containers) for more information.
@y
> [!TIP]
>
> You may need to turn on the **Show system containers** option in **Settings** to see the backend container running.
> See [Show extension containers](../dev/test-debug.md#show-the-extension-containers) for more information.
@z

@x
Open the Docker Desktop Dashboard and select the **Containers** tab. You should see the response from the backend service
call displayed.
@y
Open the Docker Desktop Dashboard and select the **Containers** tab. You should see the response from the backend service
call displayed.
@z

@x
## What's next?
@y
## What's next?
@z

@x
- Learn how to [share and publish your extension](../extensions/_index.md).
- Learn more about extensions [architecture](../architecture/_index.md).
@y
- Learn how to [share and publish your extension](../extensions/_index.md).
- Learn more about extensions [architecture](../architecture/_index.md).
@z
