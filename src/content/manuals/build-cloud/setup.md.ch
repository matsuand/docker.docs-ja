%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Docker Build Cloud setup
linkTitle: Setup
@y
title: Docker Build Cloud setup
linkTitle: Setup
@z

@x
description: How to get started with Docker Build Cloud
keywords: build, cloud build
@y
description: How to get started with Docker Build Cloud
keywords: build, cloud build
@z

@x
Before you can start using Docker Build Cloud, you must add the builder to your local
environment.
@y
Before you can start using Docker Build Cloud, you must add the builder to your local
environment.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
To get started with Docker Build Cloud, you need to:
@y
To get started with Docker Build Cloud, you need to:
@z

@x
- Install Docker Desktop version 4.26.0 or later, or Buildx version 0.37.0 or
  later.
- Create a cloud builder on the [Docker Build Cloud Dashboard](https://app.docker.com/build/).
  - When you create the builder, choose a name for it (for example, `default`). You will use this name as `BUILDER_NAME` in the CLI steps below.
@y
- Install Docker Desktop version 4.26.0 or later, or Buildx version 0.37.0 or
  later.
- Create a cloud builder on the [Docker Build Cloud Dashboard](https://app.docker.com/build/).
  - When you create the builder, choose a name for it (for example, `default`). You will use this name as `BUILDER_NAME` in the CLI steps below.
@z

@x
### Use Docker Build Cloud without Docker Desktop
@y
### Use Docker Build Cloud without Docker Desktop
@z

@x
Buildx version 0.37.0 or later includes the
[`cloud` driver](/manuals/build/builders/drivers/cloud.md). To use Docker Build
Cloud without Docker Desktop, check your installed version:
@y
Buildx version 0.37.0 or later includes the
[`cloud` driver](manuals/build/builders/drivers/cloud.md). To use Docker Build
Cloud without Docker Desktop, check your installed version:
@z

@x
```console
$ docker buildx version
```
@y
```console
$ docker buildx version
```
@z

@x
If your Docker CLI installation doesn't include a compatible Buildx version,
[install Buildx](https://github.com/docker/buildx#manual-download) as a Docker
CLI plugin.
@y
If your Docker CLI installation doesn't include a compatible Buildx version,
[install Buildx](https://github.com/docker/buildx#manual-download) as a Docker
CLI plugin.
@z

@x
## Steps
@y
## Steps
@z

@x
You can add a cloud builder using the CLI, with the `docker buildx create`
command, or using the Docker Desktop settings GUI.
@y
You can add a cloud builder using the CLI, with the `docker buildx create`
command, or using the Docker Desktop settings GUI.
@z

@x
{{< tabs >}}
{{< tab name="CLI" >}}
@y
{{< tabs >}}
{{< tab name="CLI" >}}
@z

@x
1. Sign in to your Docker account.
@y
1. Sign in to your Docker account.
@z

@x
   ```console
   $ docker login
   ```
@y
   ```console
   $ docker login
   ```
@z

@x
2. Connect Buildx to your cloud builder.
@y
2. Connect Buildx to your cloud builder.
@z

@x
   ```console
   $ docker buildx create --driver cloud <ORG>/<BUILDER_NAME>
   ```
@y
   ```console
   $ docker buildx create --driver cloud <ORG>/<BUILDER_NAME>
   ```
@z

@x
   Replace `<ORG>` with the Docker Hub namespace of your Docker organization (or your username if you are using a personal account), and `<BUILDER_NAME>` with the name you chose when creating the builder in the dashboard.
@y
   Replace `<ORG>` with the Docker Hub namespace of your Docker organization (or your username if you are using a personal account), and `<BUILDER_NAME>` with the name you chose when creating the builder in the dashboard.
@z

@x
   This registers a local endpoint for the cloud builder named `cloud-ORG-BUILDER_NAME`.
@y
   This registers a local endpoint for the cloud builder named `cloud-ORG-BUILDER_NAME`.
@z

@x
   > [!NOTE]
   >
   > This command connects Buildx to an existing Docker Build Cloud builder. It
   > does not create a new cloud builder. To add a new builder, use the
   > [Docker Build Cloud Dashboard](https://app.docker.com/build/).
@y
   > [!NOTE]
   >
   > This command connects Buildx to an existing Docker Build Cloud builder. It
   > does not create a new cloud builder. To add a new builder, use the
   > [Docker Build Cloud Dashboard](https://app.docker.com/build/).
@z

@x
   > [!NOTE]
   >
   > If your organization is `acme` and you named your builder `default`, use:
   >
   > ```console
   > $ docker buildx create --driver cloud acme/default
   > ```
@y
   > [!NOTE]
   >
   > If your organization is `acme` and you named your builder `default`, use:
   >
   > ```console
   > $ docker buildx create --driver cloud acme/default
   > ```
@z

@x
{{< /tab >}}
{{< tab name="Docker Desktop" >}}
@y
{{< /tab >}}
{{< tab name="Docker Desktop" >}}
@z

@x
1. Sign in to your Docker account using the **Sign in** button in Docker Desktop.
@y
1. Sign in to your Docker account using the **Sign in** button in Docker Desktop.
@z

@x
2. Open the Docker Desktop settings and navigate to the **Builders** tab.
@y
2. Open the Docker Desktop settings and navigate to the **Builders** tab.
@z

@x
3. Under **Available builders**, select **Connect to builder**.
@y
3. Under **Available builders**, select **Connect to builder**.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
The builder has native support for the `linux/amd64` and `linux/arm64`
architectures. This gives you a high-performance build cluster for building
multi-platform images natively.
@y
The builder has native support for the `linux/amd64` and `linux/arm64`
architectures. This gives you a high-performance build cluster for building
multi-platform images natively.
@z

@x
## Firewall configuration
@y
## Firewall configuration
@z

@x
To use Docker Build Cloud behind a firewall, ensure that your firewall allows
traffic to the following addresses:
@y
To use Docker Build Cloud behind a firewall, ensure that your firewall allows
traffic to the following addresses:
@z

@x
- 3.211.38.21
- https://auth.docker.io
- https://build-cloud.docker.com
- https://hub.docker.com
@y
- 3.211.38.21
- https://auth.docker.io
- https://build-cloud.docker.com
- https://hub.docker.com
@z

@x
## What's next
@y
## What's next
@z

@x
- See [Building with Docker Build Cloud](usage.md) for examples on how to use Docker Build Cloud.
- See [Use Docker Build Cloud in CI](ci.md) for examples on how to use Docker Build Cloud with CI systems.
@y
- See [Building with Docker Build Cloud](usage.md) for examples on how to use Docker Build Cloud.
- See [Use Docker Build Cloud in CI](ci.md) for examples on how to use Docker Build Cloud with CI systems.
@z
