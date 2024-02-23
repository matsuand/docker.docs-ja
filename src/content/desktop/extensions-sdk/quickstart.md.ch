%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Quickstart
description: Guide on how to build an extension quickly
keywords: quickstart, extensions
aliases:
- desktop/extensions-sdk/tutorials/initialize/
---
@y
---
title: Quickstart
description: Guide on how to build an extension quickly
keywords: quickstart, extensions
aliases:
- desktop/extensions-sdk/tutorials/initialize/
---
@z

@x
Follow this guide to get started with creating a basic Docker extension. The Quickstart guide automatically generates boilerplate files for you.
@y
Follow this guide to get started with creating a basic Docker extension. The Quickstart guide automatically generates boilerplate files for you.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- [Docker Desktop](../release-notes.md)
- [NodeJS](https://nodejs.org/)
- [Go](https://go.dev/dl/)
@y
- [Docker Desktop](../release-notes.md)
- [NodeJS](https://nodejs.org/)
- [Go](https://go.dev/dl/)
@z

@x
> Note
>
> NodeJS and Go are only required when you follow the quickstart guide to create an extension. It uses the `docker extension init` command to automatically generate boilerplate files. This command uses a template based on a ReactJS and Go application.
@y
> Note
>
> NodeJS and Go are only required when you follow the quickstart guide to create an extension. It uses the `docker extension init` command to automatically generate boilerplate files. This command uses a template based on a ReactJS and Go application.
@z

@x
## Step one: Set up your directory
@y
## Step one: Set up your directory
@z

@x
To set up your directory, use the `init` subcommand and provide a name for your extension.
@y
To set up your directory, use the `init` subcommand and provide a name for your extension.
@z

@x
```console
$ docker extension init <my-extension>
```
@y
```console
$ docker extension init <my-extension>
```
@z

@x
The command asks a series of questions about your extension, such as its name, a description, and the name of your Hub repository. This helps the CLI generate a set of boilerplate files for you to get started. It stores the boilerplate files in the `my-extension` directory.
@y
The command asks a series of questions about your extension, such as its name, a description, and the name of your Hub repository. This helps the CLI generate a set of boilerplate files for you to get started. It stores the boilerplate files in the `my-extension` directory.
@z

@x
The automatically generated extension contains:
@y
The automatically generated extension contains:
@z

@x
- A Go backend service in the `backend` folder that listens on a socket. It has one endpoint `/hello` that returns a JSON payload.
- A React frontend in the `frontend` folder that can call the backend and output the backend’s response.
@y
- A Go backend service in the `backend` folder that listens on a socket. It has one endpoint `/hello` that returns a JSON payload.
- A React frontend in the `frontend` folder that can call the backend and output the backend’s response.
@z

@x
For more information and guidelines on building the UI, see the [Design and UI styling section](design/design-guidelines.md).
@y
For more information and guidelines on building the UI, see the [Design and UI styling section](design/design-guidelines.md).
@z

@x
## Step two: Build the extension
@y
## Step two: Build the extension
@z

@x
To build the extension, move into the newly created directory and run:
@y
To build the extension, move into the newly created directory and run:
@z

@x
```console
$ docker build -t <name-of-your-extension> .
```
@y
```console
$ docker build -t <name-of-your-extension> .
```
@z

@x
`docker build` builds the extension and generates an image named the same as the chosen hub repository. For example, if you typed `john/my-extension` as the answer to the following question:
@y
`docker build` builds the extension and generates an image named the same as the chosen hub repository. For example, if you typed `john/my-extension` as the answer to the following question:
@z

@x
```console
? Hub repository (eg. namespace/repository on hub): john/my-extension`
```
@y
```console
? Hub repository (eg. namespace/repository on hub): john/my-extension`
```
@z

@x
The `docker build` generates an image with name `john/my-extension`.
@y
The `docker build` generates an image with name `john/my-extension`.
@z

@x
## Step three: Install and preview the extension
@y
## Step three: Install and preview the extension
@z

@x
To install the extension in Docker Desktop, run:
@y
To install the extension in Docker Desktop, run:
@z

@x
```console
$ docker extension install <name-of-your-extension>
```
@y
```console
$ docker extension install <name-of-your-extension>
```
@z

@x
To preview the extension in Docker Desktop, once the installation is complete and you should
see a **Quickstart** item underneath the **Extensions** menu. Selecting this item opens the extension's frontend.
@y
To preview the extension in Docker Desktop, once the installation is complete and you should
see a **Quickstart** item underneath the **Extensions** menu. Selecting this item opens the extension's frontend.
@z

@x
> **Tip**
>
> During UI development, it’s helpful to use hot reloading to test your changes without rebuilding your entire
> extension. See [Preview whilst developing the UI](dev/test-debug.md#hot-reloading-whilst-developing-the-ui) for more information.
{ .tip }
@y
> **Tip**
>
> During UI development, it’s helpful to use hot reloading to test your changes without rebuilding your entire
> extension. See [Preview whilst developing the UI](dev/test-debug.md#hot-reloading-whilst-developing-the-ui) for more information.
{ .tip }
@z

@x
You may also want to inspect the containers that belong to the extension. By default, extension containers are
hidden from the Docker Dashboard. You can change this in **Settings**, see
[how to show extension containers](dev/test-debug.md#show-the-extension-containers) for more information.
@y
You may also want to inspect the containers that belong to the extension. By default, extension containers are
hidden from the Docker Dashboard. You can change this in **Settings**, see
[how to show extension containers](dev/test-debug.md#show-the-extension-containers) for more information.
@z

@x
## Step four: Submit and publish your extension to the Marketplace
@y
## Step four: Submit and publish your extension to the Marketplace
@z

@x
If you want to make your extension available to all Docker Desktop users, you can submit it for publication in the Marketplace. For more information, see [Publish](extensions/index.md).
@y
If you want to make your extension available to all Docker Desktop users, you can submit it for publication in the Marketplace. For more information, see [Publish](extensions/index.md).
@z

@x
## Clean up
@y
## Clean up
@z

@x
To remove the extension, run:
@y
To remove the extension, run:
@z

@x
```console
$ docker extension rm <name-of-your-extension>
```
@y
```console
$ docker extension rm <name-of-your-extension>
```
@z

@x
## What's next
@y
## What's next
@z

@x
- Build a more [advanced frontend](build/frontend-extension-tutorial.md) for your extension.
- Learn how to [test and debug](dev/test-debug.md) your extension.
- Learn how to [setup CI for your extension](dev/continuous-integration.md).
- Learn more about extensions [architecture](architecture/index.md).
- Learn more about [designing the UI](design/design-guidelines.md).
@y
- Build a more [advanced frontend](build/frontend-extension-tutorial.md) for your extension.
- Learn how to [test and debug](dev/test-debug.md) your extension.
- Learn how to [setup CI for your extension](dev/continuous-integration.md).
- Learn more about extensions [architecture](architecture/index.md).
- Learn more about [designing the UI](design/design-guidelines.md).
@z
