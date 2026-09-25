%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Install the Docker Sandboxes SDK
linkTitle: Install the SDK
description: Install and use the Docker Sandboxes SDK in your JavaScript or TypeScript application.
keywords: docker sandboxes SDK, TypeScript SDK, JavaScript, npm, install sandbox SDK
@y
title: Install the Docker Sandboxes SDK
linkTitle: Install the SDK
description: Install and use the Docker Sandboxes SDK in your JavaScript or TypeScript application.
keywords: docker sandboxes SDK, TypeScript SDK, JavaScript, npm, install sandbox SDK
@z

@x
> [!NOTE]
> The Docker Sandboxes API and SDK are experimental. Features, interfaces,
> and behavior may change.
@y
> [!NOTE]
> The Docker Sandboxes API and SDK are experimental. Features, interfaces,
> and behavior may change.
@z

@x
Use the Docker Sandboxes SDK to create and manage cloud sandboxes from
JavaScript or TypeScript. The SDK includes methods for running commands,
transferring files, and waiting for a sandbox to start or stop.
@y
Use the Docker Sandboxes SDK to create and manage cloud sandboxes from
JavaScript or TypeScript. The SDK includes methods for running commands,
transferring files, and waiting for a sandbox to start or stop.
@z

@x
You don't need the Docker CLI to use the SDK.
@y
You don't need the Docker CLI to use the SDK.
@z

@x
## Install the SDK
@y
## Install the SDK
@z

@x
With Node.js 20 or later, install the SDK in your project:
@y
With Node.js 20 or later, install the SDK in your project:
@z

@x
```console
$ npm install @docker/sandboxes
```
@y
```console
$ npm install @docker/sandboxes
```
@z

@x
Import `Sandboxes` from `@docker/sandboxes`.
@y
Import `Sandboxes` from `@docker/sandboxes`.
@z

@x
## Connect to Cloud Sandboxes
@y
## Connect to Cloud Sandboxes
@z

@x
Before connecting, [activate a Docker Agentic Platform subscription](/manuals/agentic-platform/signup.md#activate-cloud-access)
for your Docker account.
@y
Before connecting, [activate a Docker Agentic Platform subscription](manuals/agentic-platform/signup.md#activate-cloud-access)
for your Docker account.
@z

@x
Configure your client with browser sign-in for interactive use or a personal
access token for automation. The SDK supplies the service URL and manages
access tokens. See [Authentication and authorization](authentication.md) for
setup instructions.
@y
Configure your client with browser sign-in for interactive use or a personal
access token for automation. The SDK supplies the service URL and manages
access tokens. See [Authentication and authorization](authentication.md) for
setup instructions.
@z

@x
Follow [Run your first cloud sandbox](get-started.md) for a complete TypeScript
example that creates a sandbox, runs a command, and deletes it.
@y
Follow [Run your first cloud sandbox](get-started.md) for a complete TypeScript
example that creates a sandbox, runs a command, and deletes it.
@z
