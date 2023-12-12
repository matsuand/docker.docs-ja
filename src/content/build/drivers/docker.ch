%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Docker driver
description: |
  The Docker driver is the default driver.
  It uses the BuildKit bundled with the Docker Engine.
keywords: build, buildx, driver, builder, docker
aliases:
  - /build/buildx/drivers/docker/
  - /build/building/drivers/docker/
---
@y
---
title: Docker driver
description: |
  The Docker driver is the default driver.
  It uses the BuildKit bundled with the Docker Engine.
keywords: build, buildx, driver, builder, docker
aliases:
  - /build/buildx/drivers/docker/
  - /build/building/drivers/docker/
---
@z

@x
The Buildx Docker driver is the default driver. It uses the BuildKit server
components built directly into the Docker engine. The Docker driver requires no
configuration.
@y
The Buildx Docker driver is the default driver. It uses the BuildKit server
components built directly into the Docker engine. The Docker driver requires no
configuration.
@z

@x
Unlike the other drivers, builders using the Docker driver can't be manually
created. They're only created automatically from the Docker context.
@y
Unlike the other drivers, builders using the Docker driver can't be manually
created. They're only created automatically from the Docker context.
@z

@x
Images built with the Docker driver are automatically loaded to the local image
store.
@y
Images built with the Docker driver are automatically loaded to the local image
store.
@z

@x
## Synopsis
@y
## Synopsis
@z

@x
```console
# The Docker driver is used by buildx by default
docker buildx build .
```
@y
```console
# The Docker driver is used by buildx by default
docker buildx build .
```
@z

@x
It's not possible to configure which BuildKit version to use, or to pass any
additional BuildKit parameters to a builder using the Docker driver. The
BuildKit version and parameters are preset by the Docker engine internally.
@y
It's not possible to configure which BuildKit version to use, or to pass any
additional BuildKit parameters to a builder using the Docker driver. The
BuildKit version and parameters are preset by the Docker engine internally.
@z

@x
If you need additional configuration and flexibility, consider using the
[Docker container driver](./docker-container.md).
@y
If you need additional configuration and flexibility, consider using the
[Docker container driver](./docker-container.md).
@z

@x
## Further reading
@y
## Further reading
@z

@x
For more information on the Docker driver, see the
[buildx reference](../../engine/reference/commandline/buildx_create.md#driver).
@y
For more information on the Docker driver, see the
[buildx reference](../../engine/reference/commandline/buildx_create.md#driver).
@z
