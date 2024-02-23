%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Docker container build driver
description: The Docker container driver runs BuildKit in a container image.
keywords: build, buildx, driver, builder, docker-container
aliases:
  - /build/buildx/drivers/docker-container/
  - /build/building/drivers/docker-container/
---
@y
---
title: Docker container build driver
description: The Docker container driver runs BuildKit in a container image.
keywords: build, buildx, driver, builder, docker-container
aliases:
  - /build/buildx/drivers/docker-container/
  - /build/building/drivers/docker-container/
---
@z

@x
The Docker container driver allows creation of a managed and customizable
BuildKit environment in a dedicated Docker container.
@y
The Docker container driver allows creation of a managed and customizable
BuildKit environment in a dedicated Docker container.
@z

@x
Using the Docker container driver has a couple of advantages over the default
Docker driver. For example:
@y
Using the Docker container driver has a couple of advantages over the default
Docker driver. For example:
@z

@x
- Specify custom BuildKit versions to use.
- Build multi-arch images, see [QEMU](#qemu)
- Advanced options for [cache import and export](../cache/backends/index.md)
@y
- Specify custom BuildKit versions to use.
- Build multi-arch images, see [QEMU](#qemu)
- Advanced options for [cache import and export](../cache/backends/index.md)
@z

@x
## Synopsis
@y
## Synopsis
@z

@x
Run the following command to create a new builder, named `container`, that uses
the Docker container driver:
@y
Run the following command to create a new builder, named `container`, that uses
the Docker container driver:
@z

@x
```console
$ docker buildx create \
  --name container \
  --driver=docker-container \
  --driver-opt=[key=value,...]
container
```
@y
```console
$ docker buildx create \
  --name container \
  --driver=docker-container \
  --driver-opt=[key=value,...]
container
```
@z

@x
The following table describes the available driver-specific options that you can
pass to `--driver-opt`:
@y
The following table describes the available driver-specific options that you can
pass to `--driver-opt`:
@z

@x
| Parameter       | Type   | Default          | Description                                                                       |
| --------------- | ------ | ---------------- | --------------------------------------------------------------------------------- |
| `image`         | String |                  | Sets the BuildKit image to use for the container.                                 |
| `memory`        | String |                  | Sets the amount of memory the container can use.                                  |
| `memory-swap`   | String |                  | Sets the memory swap limit for the container.                                     |
| `cpu-quota`     | String |                  | Imposes a CPU CFS quota on the container.                                         |
| `cpu-period`    | String |                  | Sets the CPU CFS scheduler period for the container.                              |
| `cpu-shares`    | String |                  | Configures CPU shares (relative weight) of the container.                         |
| `cpuset-cpus`   | String |                  | Limits the set of CPU cores the container can use.                                |
| `cpuset-mems`   | String |                  | Limits the set of CPU memory nodes the container can use.                         |
| `network`       | String |                  | Sets the network mode for the container.                                          |
| `cgroup-parent` | String | `/docker/buildx` | Sets the cgroup parent of the container if Docker is using the "cgroupfs" driver. |
| `env.<key>`     | String |                  | Sets the environment variable `key` to the specified `value` in the container.    |
@y
| Parameter       | Type   | Default          | Description                                                                       |
| --------------- | ------ | ---------------- | --------------------------------------------------------------------------------- |
| `image`         | String |                  | Sets the BuildKit image to use for the container.                                 |
| `memory`        | String |                  | Sets the amount of memory the container can use.                                  |
| `memory-swap`   | String |                  | Sets the memory swap limit for the container.                                     |
| `cpu-quota`     | String |                  | Imposes a CPU CFS quota on the container.                                         |
| `cpu-period`    | String |                  | Sets the CPU CFS scheduler period for the container.                              |
| `cpu-shares`    | String |                  | Configures CPU shares (relative weight) of the container.                         |
| `cpuset-cpus`   | String |                  | Limits the set of CPU cores the container can use.                                |
| `cpuset-mems`   | String |                  | Limits the set of CPU memory nodes the container can use.                         |
| `network`       | String |                  | Sets the network mode for the container.                                          |
| `cgroup-parent` | String | `/docker/buildx` | Sets the cgroup parent of the container if Docker is using the "cgroupfs" driver. |
| `env.<key>`     | String |                  | Sets the environment variable `key` to the specified `value` in the container.    |
@z

@x
Before you configure the resource limits for the container,
read about [configuring runtime resource constraints for containers](../../config/containers/resource_constraints/).
@y
Before you configure the resource limits for the container,
read about [configuring runtime resource constraints for containers](../../config/containers/resource_constraints/).
@z

@x
## Usage
@y
## Usage
@z

@x
When you run a build, Buildx pulls the specified `image` (by default,
[`moby/buildkit`](https://hub.docker.com/r/moby/buildkit)).
When the container has started, Buildx submits the build submitted to the
containerized build server.
@y
When you run a build, Buildx pulls the specified `image` (by default,
[`moby/buildkit`](https://hub.docker.com/r/moby/buildkit)).
When the container has started, Buildx submits the build submitted to the
containerized build server.
@z

@x
```console
$ docker buildx build -t <image> --builder=container .
WARNING: No output specified with docker-container driver. Build result will only remain in the build cache. To push result image into registry use --push or to load image into docker use --load
#1 [internal] booting buildkit
#1 pulling image moby/buildkit:buildx-stable-1
#1 pulling image moby/buildkit:buildx-stable-1 1.9s done
#1 creating container buildx_buildkit_container0
#1 creating container buildx_buildkit_container0 0.5s done
#1 DONE 2.4s
...
```
@y
```console
$ docker buildx build -t <image> --builder=container .
WARNING: No output specified with docker-container driver. Build result will only remain in the build cache. To push result image into registry use --push or to load image into docker use --load
#1 [internal] booting buildkit
#1 pulling image moby/buildkit:buildx-stable-1
#1 pulling image moby/buildkit:buildx-stable-1 1.9s done
#1 creating container buildx_buildkit_container0
#1 creating container buildx_buildkit_container0 0.5s done
#1 DONE 2.4s
...
```
@z

@x
## Loading to local image store
@y
## Loading to local image store
@z

@x
Unlike when using the default `docker` driver, images built with the
`docker-container` driver must be explicitly loaded into the local image store.
Use the `--load` flag:
@y
Unlike when using the default `docker` driver, images built with the
`docker-container` driver must be explicitly loaded into the local image store.
Use the `--load` flag:
@z

@x
```console
$ docker buildx build --load -t <image> --builder=container .
...
 => exporting to oci image format                                                                                                      7.7s
 => => exporting layers                                                                                                                4.9s
 => => exporting manifest sha256:4e4ca161fa338be2c303445411900ebbc5fc086153a0b846ac12996960b479d3                                      0.0s
 => => exporting config sha256:adf3eec768a14b6e183a1010cb96d91155a82fd722a1091440c88f3747f1f53f                                        0.0s
 => => sending tarball                                                                                                                 2.8s
 => importing to docker
```
@y
```console
$ docker buildx build --load -t <image> --builder=container .
...
 => exporting to oci image format                                                                                                      7.7s
 => => exporting layers                                                                                                                4.9s
 => => exporting manifest sha256:4e4ca161fa338be2c303445411900ebbc5fc086153a0b846ac12996960b479d3                                      0.0s
 => => exporting config sha256:adf3eec768a14b6e183a1010cb96d91155a82fd722a1091440c88f3747f1f53f                                        0.0s
 => => sending tarball                                                                                                                 2.8s
 => importing to docker
```
@z

@x
The image becomes available in the image store when the build finishes:
@y
The image becomes available in the image store when the build finishes:
@z

@x
```console
$ docker image ls
REPOSITORY                       TAG               IMAGE ID       CREATED             SIZE
<image>                          latest            adf3eec768a1   2 minutes ago       197MB
```
@y
```console
$ docker image ls
REPOSITORY                       TAG               IMAGE ID       CREATED             SIZE
<image>                          latest            adf3eec768a1   2 minutes ago       197MB
```
@z

@x
## Cache persistence
@y
## Cache persistence
@z

@x
The `docker-container` driver supports cache persistence, as it stores all the
BuildKit state and related cache into a dedicated Docker volume.
@y
The `docker-container` driver supports cache persistence, as it stores all the
BuildKit state and related cache into a dedicated Docker volume.
@z

@x
To persist the `docker-container` driver's cache, even after recreating the
driver using `docker buildx rm` and `docker buildx create`, you can destroy the
builder using the `--keep-state` flag:
@y
To persist the `docker-container` driver's cache, even after recreating the
driver using `docker buildx rm` and `docker buildx create`, you can destroy the
builder using the `--keep-state` flag:
@z

@x
For example, to create a builder named `container` and then remove it while
persisting state:
@y
For example, to create a builder named `container` and then remove it while
persisting state:
@z

@x
```console
# setup a builder
$ docker buildx create --name=container --driver=docker-container --use --bootstrap
container
$ docker buildx ls
NAME/NODE       DRIVER/ENDPOINT              STATUS   BUILDKIT PLATFORMS
container *     docker-container
  container0    desktop-linux                running  v0.10.5  linux/amd64
$ docker volume ls
DRIVER    VOLUME NAME
local     buildx_buildkit_container0_state
@y
```console
# setup a builder
$ docker buildx create --name=container --driver=docker-container --use --bootstrap
container
$ docker buildx ls
NAME/NODE       DRIVER/ENDPOINT              STATUS   BUILDKIT PLATFORMS
container *     docker-container
  container0    desktop-linux                running  v0.10.5  linux/amd64
$ docker volume ls
DRIVER    VOLUME NAME
local     buildx_buildkit_container0_state
@z

@x
# remove the builder while persisting state
$ docker buildx rm --keep-state container
$ docker volume ls
DRIVER    VOLUME NAME
local     buildx_buildkit_container0_state
@y
# remove the builder while persisting state
$ docker buildx rm --keep-state container
$ docker volume ls
DRIVER    VOLUME NAME
local     buildx_buildkit_container0_state
@z

@x
# the newly created driver with the same name will have all the state of the previous one!
$ docker buildx create --name=container --driver=docker-container --use --bootstrap
container
```
@y
# the newly created driver with the same name will have all the state of the previous one!
$ docker buildx create --name=container --driver=docker-container --use --bootstrap
container
```
@z

@x
## QEMU
@y
## QEMU
@z

@x
The `docker-container` driver supports using [QEMU](https://www.qemu.org/)
(user mode) to build non-native platforms. Use the `--platform` flag to specify
which architectures that you want to build for.
@y
The `docker-container` driver supports using [QEMU](https://www.qemu.org/)
(user mode) to build non-native platforms. Use the `--platform` flag to specify
which architectures that you want to build for.
@z

@x
For example, to build a Linux image for `amd64` and `arm64`:
@y
For example, to build a Linux image for `amd64` and `arm64`:
@z

@x
```console
$ docker buildx build \
  --builder=container \
  --platform=linux/amd64,linux/arm64 \
  -t <registry>/<image> \
  --push .
```
@y
```console
$ docker buildx build \
  --builder=container \
  --platform=linux/amd64,linux/arm64 \
  -t <registry>/<image> \
  --push .
```
@z

@x
> **Note**
>
> Emulation with QEMU can be much slower than native builds, especially for
> compute-heavy tasks like compilation and compression or decompression.
@y
> **Note**
>
> Emulation with QEMU can be much slower than native builds, especially for
> compute-heavy tasks like compilation and compression or decompression.
@z

@x
## Custom network
@y
## Custom network
@z

@x
You can customize the network that the builder container uses. This is useful
if you need to use a specific network for your builds.
@y
You can customize the network that the builder container uses. This is useful
if you need to use a specific network for your builds.
@z

@x
For example, let's [create a network](../../reference/cli/docker/network/create.md)
named `foonet`:
@y
For example, let's [create a network](../../reference/cli/docker/network/create.md)
named `foonet`:
@z

@x
```console
$ docker network create foonet
```
@y
```console
$ docker network create foonet
```
@z

@x
Now create a [`docker-container` builder](../../reference/cli/docker/buildx/create.md)
that will use this network:
@y
Now create a [`docker-container` builder](../../reference/cli/docker/buildx/create.md)
that will use this network:
@z

@x
```console
$ docker buildx create --use \
  --name mybuilder \
  --driver docker-container \
  --driver-opt "network=foonet"
```
@y
```console
$ docker buildx create --use \
  --name mybuilder \
  --driver docker-container \
  --driver-opt "network=foonet"
```
@z

@x
Boot and [inspect `mybuilder`](../../reference/cli/docker/buildx/inspect.md):
@y
Boot and [inspect `mybuilder`](../../reference/cli/docker/buildx/inspect.md):
@z

@x
```console
$ docker buildx inspect --bootstrap
```
@y
```console
$ docker buildx inspect --bootstrap
```
@z

@x
[Inspect the builder container](../../reference/cli/docker/inspect.md)
and see what network is being used:
@y
[Inspect the builder container](../../reference/cli/docker/inspect.md)
and see what network is being used:
@z

@x
```console
$ docker inspect buildx_buildkit_mybuilder0 --format={{.NetworkSettings.Networks}}
map[foonet:0xc00018c0c0]
```
@y
```console
$ docker inspect buildx_buildkit_mybuilder0 --format={{.NetworkSettings.Networks}}
map[foonet:0xc00018c0c0]
```
@z

@x
## Further reading
@y
## Further reading
@z

@x
For more information on the Docker container driver, see the
[buildx reference](../../reference/cli/docker/buildx/create.md#driver).
@y
For more information on the Docker container driver, see the
[buildx reference](../../reference/cli/docker/buildx/create.md#driver).
@z
