%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リン クへの (no slash) 対応

@x
title: Docker Build Overview
@y
title: Docker Build Overview
@z

@x
description: Learn about Docker Build and its components.
keywords: build, buildkit, buildx, architecture
@y
description: Learn about Docker Build and its components.
keywords: build, buildkit, buildx, architecture
@z

@x
Docker Build implements a client-server architecture, where:
@y
Docker Build implements a client-server architecture, where:
@z

@x
- Client: Buildx is the client and the user interface for running and managing builds.
- Server: BuildKit is the server, or builder, that handles the build execution.
@y
- Client: Buildx is the client and the user interface for running and managing builds.
- Server: BuildKit is the server, or builder, that handles the build execution.
@z

@x
When you invoke a build, the Buildx client sends a build request to the
BuildKit backend. BuildKit resolves the build instructions and executes the
build steps. The build output is either sent back to the client or uploaded to
a registry, such as Docker Hub.
@y
When you invoke a build, the Buildx client sends a build request to the
BuildKit backend. BuildKit resolves the build instructions and executes the
build steps. The build output is either sent back to the client or uploaded to
a registry, such as Docker Hub.
@z

@x
Buildx and BuildKit are both installed with Docker Desktop and Docker Engine
out-of-the-box. When you invoke the `docker build` command, you're using Buildx
to run a build using the default BuildKit bundled with Docker.
@y
Buildx and BuildKit are both installed with Docker Desktop and Docker Engine
out-of-the-box. When you invoke the `docker build` command, you're using Buildx
to run a build using the default BuildKit bundled with Docker.
@z

@x
## Buildx
@y
## Buildx
@z

@x
Buildx is the CLI tool that you use to run builds. The `docker build` command
is a wrapper around Buildx. When you invoke `docker build`, Buildx interprets
the build options and sends a build request to the BuildKit backend.
@y
Buildx is the CLI tool that you use to run builds. The `docker build` command
is a wrapper around Buildx. When you invoke `docker build`, Buildx interprets
the build options and sends a build request to the BuildKit backend.
@z

@x
The Buildx client can do more than just run builds. You can also use Buildx to
create and manage BuildKit backends, referred to as builders. It also supports
features for managing images in registries, and for running multiple builds
concurrently.
@y
The Buildx client can do more than just run builds. You can also use Buildx to
create and manage BuildKit backends, referred to as builders. It also supports
features for managing images in registries, and for running multiple builds
concurrently.
@z

@x
Docker Buildx is installed by default with Docker Desktop. You can also build
the CLI plugin from source, or grab a binary from the GitHub repository and
install it manually. See [Buildx README](https://github.com/docker/buildx#manual-download)
on GitHub for more information.
@y
Docker Buildx is installed by default with Docker Desktop. You can also build
the CLI plugin from source, or grab a binary from the GitHub repository and
install it manually. See [Buildx README](https://github.com/docker/buildx#manual-download)
on GitHub for more information.
@z

@x
## BuildKit
@y
## BuildKit
@z

@x
BuildKit is the daemon process that executes the build workloads.
@y
BuildKit is the daemon process that executes the build workloads.
@z

@x
A build execution starts with the invocation of a `docker build` command.
Buildx interprets your build command and sends a build request to the BuildKit
backend. The build request includes:
@y
A build execution starts with the invocation of a `docker build` command.
Buildx interprets your build command and sends a build request to the BuildKit
backend. The build request includes:
@z

@x
- The Dockerfile
- Build arguments
- Export options
- Caching options
@y
- The Dockerfile
- Build arguments
- Export options
- Caching options
@z

@x
BuildKit resolves the build instructions and executes the build steps. While
BuildKit is executing the build, Buildx monitors the build status and prints
the progress to the terminal.
@y
BuildKit resolves the build instructions and executes the build steps. While
BuildKit is executing the build, Buildx monitors the build status and prints
the progress to the terminal.
@z

@x
If the build requires resources from the client, such as local files or build
secrets, BuildKit requests the resources that it needs from Buildx.
@y
If the build requires resources from the client, such as local files or build
secrets, BuildKit requests the resources that it needs from Buildx.
@z

@x
This is one way in which BuildKit is more efficient compared to the legacy
builder used in earlier versions of Docker. BuildKit only requests the
resources that the build needs when they're needed. The legacy builder, in
comparison, always takes a copy of the local filesystem.
@y
This is one way in which BuildKit is more efficient compared to the legacy
builder used in earlier versions of Docker. BuildKit only requests the
resources that the build needs when they're needed. The legacy builder, in
comparison, always takes a copy of the local filesystem.
@z

@x
Examples of resources that BuildKit can request from Buildx include:
@y
Examples of resources that BuildKit can request from Buildx include:
@z

@x
- Local filesystem build contexts
- Build secrets
- SSH sockets
- Registry authentication tokens
@y
- Local filesystem build contexts
- Build secrets
- SSH sockets
- Registry authentication tokens
@z

@x
For more information about BuildKit, see [BuildKit](/manuals/build/buildkit/_index.md).
@y
For more information about BuildKit, see [BuildKit](manuals/build/buildkit/_index.md).
@z
