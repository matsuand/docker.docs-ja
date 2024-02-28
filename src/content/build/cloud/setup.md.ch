%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Docker Build Cloud setup
description: How to get started with Docker Build Cloud
keywords: build, cloud build
@y
title: Docker Build Cloud setup
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
- Download and install Docker Desktop version 4.26.0 or later.
- Sign up for a Docker Build Cloud subscription in the [Docker Build Cloud Dashboard](https://build.docker.com/).
@y
- Download and install Docker Desktop version 4.26.0 or later.
- Sign up for a Docker Build Cloud subscription in the [Docker Build Cloud Dashboard](https://build.docker.com/).
@z

@x
### Use Docker Build Cloud without Docker Desktop
@y
### Use Docker Build Cloud without Docker Desktop
@z

@x
To use Docker Build Cloud without Docker Desktop, you must download and install
a version of Buildx with support for Docker Build Cloud (the `cloud` driver).
You can find compatible Buildx binaries on the releases page of
[this repository](https://github.com/docker/buildx-desktop).
@y
To use Docker Build Cloud without Docker Desktop, you must download and install
a version of Buildx with support for Docker Build Cloud (the `cloud` driver).
You can find compatible Buildx binaries on the releases page of
[this repository](https://github.com/docker/buildx-desktop).
@z

@x
If you plan on building with Docker Build Cloud using the `docker compose
build` command, you also need a version of Docker Compose that supports Docker
Build Cloud. You can find compatible Docker Compose binaries on the releases
page of [this repository](https://github.com/docker/compose-desktop).
@y
If you plan on building with Docker Build Cloud using the `docker compose
build` command, you also need a version of Docker Compose that supports Docker
Build Cloud. You can find compatible Docker Compose binaries on the releases
page of [this repository](https://github.com/docker/compose-desktop).
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
2. Add the cloud builder endpoint.
@y
2. Add the cloud builder endpoint.
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
   Replace `ORG` with the Docker Hub namespace of your Docker organization.
@y
   Replace `ORG` with the Docker Hub namespace of your Docker organization.
@z

@x
This creates a builder named `cloud-ORG-BUILDER_NAME`.
@y
This creates a builder named `cloud-ORG-BUILDER_NAME`.
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
