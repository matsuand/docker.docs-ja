%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Docker Build architecture
description: Learn about Docker Build and its components.
keywords: build, buildkit, buildx, architecture
@y
title: Docker Build アーキテクチャー
description: Learn about Docker Build and its components.
keywords: build, buildkit, buildx, architecture
@z

@x
Docker Build implements a client-server architecture, where:
@y
Docker Build はクライアントサーバーアーキテクチャーを実装しています。
これは以下により構成されます。
@z

@x
- Buildx is the client and the user interface for running and managing builds
- BuildKit is the server, or builder, that handles the build execution.
@y
- Buildx はクライアントであり、ビルドを実行し管理するためのユーザーインターフェースです。
- BuildKit はサーバーであり builder とも言います。
  ビルド実行を制御します。
@z

@x
![Build high-level architecture](./images/build-high-level-arch.png)
@y
![Build ハイレベルアーキテクチャー](./images/build-high-level-arch.png)
@z

@x
As of Docker Engine 23.0 and Docker Desktop 4.19, Buildx is the default build
client.
@y
Docker Engine 23.0 と Docker Desktop 4.19 において Buildx はデフォルトのビルドクライアントとなっています。
@z

@x
## Buildx
@y
## Buildx
@z

@x
Buildx is a CLI tool that provides a user interface for working with builds.
Buildx is a drop-in replacement for the legacy build client used in earlier
versions of Docker Engine and Docker Desktop. In newer versions of Docker
Desktop and Docker Engine, you're using Buildx by default when you invoke the
`docker build` command. In earlier versions, to build using Buildx you would
use the `docker buildx build` command.
@y
Buildx は CLI ツールであり、ビルド操作を行うユーザーインターフェースを提供します。
Buildx は Docker Engine や Docker Desktop の従来版において用いられていた古いビルドクライアントに置き換わるものです。
Docker Desktop や Docker Engine の最新版では、`docker build` コマンドを実行する際のデフォルトとして Buildx が利用されています。
従来版において Buildx を使ったビルドを行うには `docker buildx build` コマンドを用いることになります。
@z

@x
Buildx is more than just an updated `build` command. It also contains utilities
for creating and managing [builders](#builders).
@y
Buildx は単に `build` コマンドが改善されただけではありません。
Buildx には [ビルダー](#builders) の生成や管理を行うユーティリティーが含まれています。
@z

@x
### Install Buildx
@y
### Buildx のインストール {#install-buildx}
@z

@x
Docker Buildx is installed by default with Docker Desktop. Docker Engine
version 23.0 and later requires that you install Buildx from a separate
package. Buildx is included in the Docker Engine installation instructions, see
[Install Docker Engine](../engine/install/index.md).
@y
Docker Buildx is installed by default with Docker Desktop. Docker Engine
version 23.0 and later requires that you install Buildx from a separate
package. Buildx is included in the Docker Engine installation instructions, see
[Install Docker Engine](../engine/install/index.md).
@z

@x
You can also build the CLI plugin from source, or grab a binary from the GitHub
repository and install it manually. See
[docker/buildx README](https://github.com/docker/buildx#manual-download)
for more information
@y
You can also build the CLI plugin from source, or grab a binary from the GitHub
repository and install it manually. See
[docker/buildx README](https://github.com/docker/buildx#manual-download)
for more information
@z

@x
## Builders
@y
## ビルダー {#builders}
@z

@x
"Builder" is a term used to describe an instance of a BuildKit backend.
@y
"Builder" is a term used to describe an instance of a BuildKit backend.
@z

@x
A builder may run on the same system as the Buildx client, or it may run
remotely, on a different system. You can run it as a single node, or as a cluster
of nodes. Builder nodes may be containers, virtual machines, or physical machines.
@y
A builder may run on the same system as the Buildx client, or it may run
remotely, on a different system. You can run it as a single node, or as a cluster
of nodes. Builder nodes may be containers, virtual machines, or physical machines.
@z

@x
For more information, see [Builders](./builders/index.md).
@y
For more information, see [Builders](./builders/index.md).
@z

@x
## BuildKit
@y
## BuildKit
@z

@x
BuildKit, or `buildkitd`, is the daemon process that executes the build
workloads.
@y
BuildKit, or `buildkitd`, is the daemon process that executes the build
workloads.
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
BuildKit resolves the build instruction and executes the build steps.
For the duration of the build, Buildx monitors the build status and prints
the progress to the terminal.
@y
BuildKit resolves the build instruction and executes the build steps.
For the duration of the build, Buildx monitors the build status and prints
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
builder it replaces. BuildKit only requests the resources that the build needs,
when they're needed. The legacy builder, in comparison, always takes a copy of
the local filesystem.
@y
This is one way in which BuildKit is more efficient compared to the legacy
builder it replaces. BuildKit only requests the resources that the build needs,
when they're needed. The legacy builder, in comparison, always takes a copy of
the local filesystem.
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
For more information about BuildKit, see [BuildKit](buildkit/index.md).
@y
For more information about BuildKit, see [BuildKit](buildkit/index.md).
@z

@x
## Example build sequence
@y
## Example build sequence
@z

@x
The following diagram shows an example build sequence involving Buildx and
BuildKit.
@y
The following diagram shows an example build sequence involving Buildx and
BuildKit.
@z

@x
![Buildx and BuildKit sequence diagram](./images/build-execution.png)
@y
![Buildx and BuildKit sequence diagram](./images/build-execution.png)
@z
