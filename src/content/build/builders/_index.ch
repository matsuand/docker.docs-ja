%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Builders
keywords: build, buildx, builders, buildkit, drivers, backend
description: Learn about builders and how to manage them
---
@y
---
title: Builders
keywords: build, buildx, builders, buildkit, drivers, backend
description: Learn about builders and how to manage them
---
@z

@x
A builder is a BuildKit daemon that you can use to run your builds. BuildKit
is the build engine that solves the build steps in a Dockerfile to produce a
container image or other artifacts.
@y
A builder is a BuildKit daemon that you can use to run your builds. BuildKit
is the build engine that solves the build steps in a Dockerfile to produce a
container image or other artifacts.
@z

@x
You can create and manage builders, inspect them, and even connect to builders
running remotely. You interact with builders using the Docker CLI.
@y
You can create and manage builders, inspect them, and even connect to builders
running remotely. You interact with builders using the Docker CLI.
@z

@x
## Default builder
@y
## Default builder
@z

@x
Docker Engine automatically creates a builder that becomes the default backend
for your builds. This builder uses the BuildKit library bundled with the
daemon. This builder requires no configuration.
@y
Docker Engine automatically creates a builder that becomes the default backend
for your builds. This builder uses the BuildKit library bundled with the
daemon. This builder requires no configuration.
@z

@x
The default builder is directly bound to the Docker daemon and its
[context](../../engine/context/working-with-contexts.md). If you change the
Docker context, your `default` builder refers to the new Docker context.
@y
The default builder is directly bound to the Docker daemon and its
[context](../../engine/context/working-with-contexts.md). If you change the
Docker context, your `default` builder refers to the new Docker context.
@z

@x
## Build drivers
@y
## Build drivers
@z

@x
Buildx implements a concept of [build drivers](../drivers/index.md) to refer to
different builder configurations. The default builder created by the daemon
uses the [`docker` driver](../drivers/docker.md).
@y
Buildx implements a concept of [build drivers](../drivers/index.md) to refer to
different builder configurations. The default builder created by the daemon
uses the [`docker` driver](../drivers/docker.md).
@z

@x
Buildx supports the following build drivers:
@y
Buildx supports the following build drivers:
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
## Selected builder
@y
## Selected builder
@z

@x
Selected builder refers to the builder that's used by default when you run
build commands.
@y
Selected builder refers to the builder that's used by default when you run
build commands.
@z

@x
When you run a build, or interact with builders in some way using the CLI,
you can use the optional `--builder` flag, or the `BUILDX_BUILDER`
[environment variable](../building/env-vars.md#buildx_builder),
to specify a builder by name. If you don't specify a builder,
the selected builder is used.
@y
When you run a build, or interact with builders in some way using the CLI,
you can use the optional `--builder` flag, or the `BUILDX_BUILDER`
[environment variable](../building/env-vars.md#buildx_builder),
to specify a builder by name. If you don't specify a builder,
the selected builder is used.
@z

@x
Use the `docker buildx ls` command to see the available builder instances.
The asterisk (`*`) next to a builder name indicates the selected builder.
@y
Use the `docker buildx ls` command to see the available builder instances.
The asterisk (`*`) next to a builder name indicates the selected builder.
@z

@x
```console
$ docker buildx ls
NAME/NODE       DRIVER/ENDPOINT      STATUS   BUILDKIT PLATFORMS
default *       docker
  default       default              running  v0.11.6  linux/amd64, linux/amd64/v2, linux/amd64/v3, linux/386
my_builder      docker-container
  my_builder0   default              running  v0.11.6  linux/amd64, linux/amd64/v2, linux/amd64/v3, linux/386
```
@y
```console
$ docker buildx ls
NAME/NODE       DRIVER/ENDPOINT      STATUS   BUILDKIT PLATFORMS
default *       docker
  default       default              running  v0.11.6  linux/amd64, linux/amd64/v2, linux/amd64/v3, linux/386
my_builder      docker-container
  my_builder0   default              running  v0.11.6  linux/amd64, linux/amd64/v2, linux/amd64/v3, linux/386
```
@z

@x
### Select a different builder
@y
### Select a different builder
@z

@x
To switch between builders, use the `docker buildx use <name>` command.
@y
To switch between builders, use the `docker buildx use <name>` command.
@z

@x
After running this command, the builder you specify is automatically
selected when you invoke builds.
@y
After running this command, the builder you specify is automatically
selected when you invoke builds.
@z

@x
## Additional information
@y
## Additional information
@z

@x
- For information about how to interact with and manage builders,
  see [Manage builders](./manage.md)
- To learn about different types of builders,
  see [Build drivers](../drivers/index.md)
@y
- For information about how to interact with and manage builders,
  see [Manage builders](./manage.md)
- To learn about different types of builders,
  see [Build drivers](../drivers/index.md)
@z
