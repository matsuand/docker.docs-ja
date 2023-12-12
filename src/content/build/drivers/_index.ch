%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Build drivers
description: Build drivers are configurations for how and where the BuildKit backend runs.
keywords: build, buildx, driver, builder, docker-container, kubernetes, remote
aliases:
  - /build/buildx/drivers/
  - /build/building/drivers/
  - /build/buildx/multiple-builders/
---
@y
---
title: Build drivers
description: Build drivers are configurations for how and where the BuildKit backend runs.
keywords: build, buildx, driver, builder, docker-container, kubernetes, remote
aliases:
  - /build/buildx/drivers/
  - /build/building/drivers/
  - /build/buildx/multiple-builders/
---
@z

@x
Build drivers are configurations for how and where the BuildKit backend runs.
Driver settings are customizable and allows fine-grained control of the builder.
Buildx supports the following drivers:
@y
Build drivers are configurations for how and where the BuildKit backend runs.
Driver settings are customizable and allows fine-grained control of the builder.
Buildx supports the following drivers:
@z

@x
- `docker`: uses the BuildKit library bundled into the Docker daemon.
- `docker-container`: creates a dedicated BuildKit container using Docker.
- `kubernetes`: creates BuildKit pods in a Kubernetes cluster.
- `remote`: connects directly to a manually managed BuildKit daemon.
@y
- `docker`: uses the BuildKit library bundled into the Docker daemon.
- `docker-container`: creates a dedicated BuildKit container using Docker.
- `kubernetes`: creates BuildKit pods in a Kubernetes cluster.
- `remote`: connects directly to a manually managed BuildKit daemon.
@z

@x
Different drivers support different use cases. The default `docker` driver
prioritizes simplicity and ease of use. It has limited support for advanced
features like caching and output formats, and isn't configurable. Other drivers
provide more flexibility and are better at handling advanced scenarios.
@y
Different drivers support different use cases. The default `docker` driver
prioritizes simplicity and ease of use. It has limited support for advanced
features like caching and output formats, and isn't configurable. Other drivers
provide more flexibility and are better at handling advanced scenarios.
@z

@x
The following table outlines some differences between drivers.
@y
The following table outlines some differences between drivers.
@z

@x
| Feature                      |  `docker`   | `docker-container` | `kubernetes` |      `remote`      |
| :--------------------------- | :---------: | :----------------: | :----------: | :----------------: |
| **Automatically load image** |     ✅      |                    |              |                    |
| **Cache export**             | Inline only |         ✅         |      ✅      |         ✅         |
| **Tarball output**           |             |         ✅         |      ✅      |         ✅         |
| **Multi-arch images**        |             |         ✅         |      ✅      |         ✅         |
| **BuildKit configuration**   |             |         ✅         |      ✅      | Managed externally |
@y
| Feature                      |  `docker`   | `docker-container` | `kubernetes` |      `remote`      |
| :--------------------------- | :---------: | :----------------: | :----------: | :----------------: |
| **Automatically load image** |     ✅      |                    |              |                    |
| **Cache export**             | Inline only |         ✅         |      ✅      |         ✅         |
| **Tarball output**           |             |         ✅         |      ✅      |         ✅         |
| **Multi-arch images**        |             |         ✅         |      ✅      |         ✅         |
| **BuildKit configuration**   |             |         ✅         |      ✅      | Managed externally |
@z

@x
## What's next
@y
## What's next
@z

@x
Read about each driver:
@y
Read about each driver:
@z

@x
- [Docker driver](./docker.md)
- [Docker container driver](./docker-container.md)
- [Kubernetes driver](./kubernetes.md)
- [Remote driver](./remote.md)
@y
- [Docker driver](./docker.md)
- [Docker container driver](./docker-container.md)
- [Kubernetes driver](./kubernetes.md)
- [Remote driver](./remote.md)
@z
