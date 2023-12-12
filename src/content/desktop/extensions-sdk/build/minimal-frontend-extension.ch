%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Create a simple extension
description: Minimal frontend extension tutorial
keywords: Docker, extensions, sdk, build
aliases:
- /desktop/extensions-sdk/tutorials/minimal-frontend-extension/
- /desktop/extensions-sdk/build/set-up/minimal-frontend-extension/
---
@y
---
title: Create a simple extension
description: Minimal frontend extension tutorial
keywords: Docker, extensions, sdk, build
aliases:
- /desktop/extensions-sdk/tutorials/minimal-frontend-extension/
- /desktop/extensions-sdk/build/set-up/minimal-frontend-extension/
---
@z

@x
To start creating your extension, you first need a directory with files which range from the extension’s source code to the required extension-specific files. This page provides information on how to set up a minimal frontend extension based on plain HTML.
@y
To start creating your extension, you first need a directory with files which range from the extension’s source code to the required extension-specific files. This page provides information on how to set up a minimal frontend extension based on plain HTML.
@z

@x
Before you start, make sure you have installed the latest version of [Docker Desktop](../../release-notes.md).
@y
Before you start, make sure you have installed the latest version of [Docker Desktop](../../release-notes.md).
@z

@x
> Note
>
> If you want to start a codebase for your new extension, our [Quickstart guide](../quickstart.md) and `docker extension init <my-extension>` provides a better base for your extension.
@y
> Note
>
> If you want to start a codebase for your new extension, our [Quickstart guide](../quickstart.md) and `docker extension init <my-extension>` provides a better base for your extension.
@z

@x
## Extension folder structure
@y
## Extension folder structure
@z

@x
In the `minimal-frontend` [sample folder](https://github.com/docker/extensions-sdk/tree/main/samples), you can find a ready-to-go example that represents a UI Extension built on HTML. We will go through this code example in this tutorial.
@y
In the `minimal-frontend` [sample folder](https://github.com/docker/extensions-sdk/tree/main/samples), you can find a ready-to-go example that represents a UI Extension built on HTML. We will go through this code example in this tutorial.
@z

@x
Although you can start from an empty directory, it is highly recommended that you start from the template below and change it accordingly to suit your needs.
@y
Although you can start from an empty directory, it is highly recommended that you start from the template below and change it accordingly to suit your needs.
@z

@x
```bash
.
├── Dockerfile # (1)
├── metadata.json # (2)
└── ui # (3)
    └── index.html
```
@y
```bash
.
├── Dockerfile # (1)
├── metadata.json # (2)
└── ui # (3)
    └── index.html
```
@z

@x
1. Contains everything required to build the extension and run it in Docker Desktop.
2. A file that provides information about the extension such as the name, description, and version.
3. The source folder that contains all your HTML, CSS and JS files. There can also be other static assets such as logos
   and icons. For more information and guidelines on building the UI, see the [Design and UI styling section](../design/design-guidelines.md).
@y
1. Contains everything required to build the extension and run it in Docker Desktop.
2. A file that provides information about the extension such as the name, description, and version.
3. The source folder that contains all your HTML, CSS and JS files. There can also be other static assets such as logos
   and icons. For more information and guidelines on building the UI, see the [Design and UI styling section](../design/design-guidelines.md).
@z

@x
## Create a Dockerfile
@y
## Create a Dockerfile
@z

@x
At a minimum, your Dockerfile needs:
@y
At a minimum, your Dockerfile needs:
@z

@x
- [Labels](../extensions/labels.md) which provide extra information about the extension, icon and screenshots.
- The source code which in this case is an `index.html` that sits within the `ui` folder.
- The `metadata.json` file.
@y
- [Labels](../extensions/labels.md) which provide extra information about the extension, icon and screenshots.
- The source code which in this case is an `index.html` that sits within the `ui` folder.
- The `metadata.json` file.
@z

@x
```Dockerfile
# syntax=docker/dockerfile:1
FROM scratch
@y
```Dockerfile
# syntax=docker/dockerfile:1
FROM scratch
@z

@x
LABEL org.opencontainers.image.title="Minimal frontend" \
    org.opencontainers.image.description="A sample extension to show how easy it's to get started with Desktop Extensions." \
    org.opencontainers.image.vendor="Awesome Inc." \
    com.docker.desktop.extension.api.version="0.3.3" \
    com.docker.desktop.extension.icon="https://www.docker.com/wp-content/uploads/2022/03/Moby-logo.png"
@y
LABEL org.opencontainers.image.title="Minimal frontend" \
    org.opencontainers.image.description="A sample extension to show how easy it's to get started with Desktop Extensions." \
    org.opencontainers.image.vendor="Awesome Inc." \
    com.docker.desktop.extension.api.version="0.3.3" \
    com.docker.desktop.extension.icon="https://www.docker.com/wp-content/uploads/2022/03/Moby-logo.png"
@z

@x
COPY ui ./ui
COPY metadata.json .
```
@y
COPY ui ./ui
COPY metadata.json .
```
@z

@x
## Configure the metadata file
@y
## Configure the metadata file
@z

@x
A `metadata.json` file is required at the root of the image filesystem.
@y
A `metadata.json` file is required at the root of the image filesystem.
@z

@x
```json
{
  "ui": {
    "dashboard-tab": {
      "title": "Minimal frontend",
      "root": "/ui",
      "src": "index.html"
    }
  }
}
```
@y
```json
{
  "ui": {
    "dashboard-tab": {
      "title": "Minimal frontend",
      "root": "/ui",
      "src": "index.html"
    }
  }
}
```
@z

@x
For more information on the `metadata.json`, see [Metadata](../architecture/metadata.md).
@y
For more information on the `metadata.json`, see [Metadata](../architecture/metadata.md).
@z

@x
## Build the extension and install it
@y
## Build the extension and install it
@z

@x
Now that you have configured the extension, you need to build the extension image that Docker Desktop will use to
install it.
@y
Now that you have configured the extension, you need to build the extension image that Docker Desktop will use to
install it.
@z

@x
```console
$ docker build --tag=awesome-inc/my-extension:latest .
```
@y
```console
$ docker build --tag=awesome-inc/my-extension:latest .
```
@z

@x
This built an image tagged `awesome-inc/my-extension:latest`, you can run `docker inspect awesome-inc/my-extension:latest` to see more details about it.
@y
This built an image tagged `awesome-inc/my-extension:latest`, you can run `docker inspect awesome-inc/my-extension:latest` to see more details about it.
@z

@x
Finally, you can install the extension and see it appearing in the Docker Desktop Dashboard.
@y
Finally, you can install the extension and see it appearing in the Docker Desktop Dashboard.
@z

@x
```console
$ docker extension install awesome-inc/my-extension:latest
```
@y
```console
$ docker extension install awesome-inc/my-extension:latest
```
@z

@x
## Preview the extension
@y
## Preview the extension
@z

@x
To preview the extension in Docker Desktop, close and open Docker Dashboard once the installation is complete.
@y
To preview the extension in Docker Desktop, close and open Docker Dashboard once the installation is complete.
@z

@x
The left-hand menu displays a new tab with the name of your extension.
@y
The left-hand menu displays a new tab with the name of your extension.
@z

@x
![Minimal frontend extension](images/ui-minimal-extension.png)
@y
![Minimal frontend extension](images/ui-minimal-extension.png)
@z

@x
## What's next?
@y
## What's next?
@z

@x
- Build a more [advanced frontend](./frontend-extension-tutorial.md) extension.
- Learn how to [test and debug](../dev/test-debug.md) your extension.
- Learn how to [setup CI for your extension](../dev/continuous-integration.md).
- Learn more about extensions [architecture](../architecture/index.md).
@y
- Build a more [advanced frontend](./frontend-extension-tutorial.md) extension.
- Learn how to [test and debug](../dev/test-debug.md) your extension.
- Learn how to [setup CI for your extension](../dev/continuous-integration.md).
- Learn more about extensions [architecture](../architecture/index.md).
@z
