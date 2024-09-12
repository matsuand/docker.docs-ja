%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Multi-platform builds
linkTitle: Multi-platform
@y
title: Multi-platform builds
linkTitle: Multi-platform
@z

@x
description: Introduction to what multi-platform builds are and how to execute them using Docker Buildx.
keywords: build, buildx, buildkit, multi-platform, cross-platform, cross-compilation, emulation, QEMU, ARM, x86, Windows, Linux, macOS
@y
description: Introduction to what multi-platform builds are and how to execute them using Docker Buildx.
keywords: build, buildx, buildkit, multi-platform, cross-platform, cross-compilation, emulation, QEMU, ARM, x86, Windows, Linux, macOS
@z

@x
A multi-platform build refers to a single build invocation that targets
multiple different operating system or CPU architecture combinations. When
building images, this lets you create a single image that can run on multiple
platforms, such as `linux/amd64`, `linux/arm64`, and `windows/amd64`.
@y
A multi-platform build refers to a single build invocation that targets
multiple different operating system or CPU architecture combinations. When
building images, this lets you create a single image that can run on multiple
platforms, such as `linux/amd64`, `linux/arm64`, and `windows/amd64`.
@z

@x
## Why multi-platform builds?
@y
## Why multi-platform builds?
@z

@x
Docker solves the "it works on my machine" problem by packaging applications
and their dependencies into containers. This makes it easy to run the same
application on different environments, such as development, testing, and
production.
@y
Docker solves the "it works on my machine" problem by packaging applications
and their dependencies into containers. This makes it easy to run the same
application on different environments, such as development, testing, and
production.
@z

@x
But containerization by itself only solves part of the problem. Containers
share the host kernel, which means that the code that's running inside the
container must be compatible with the host's architecture. This is why you
can't run a `linux/amd64` container on a `linux/arm64` host, or a Windows
container on a Linux host.
@y
But containerization by itself only solves part of the problem. Containers
share the host kernel, which means that the code that's running inside the
container must be compatible with the host's architecture. This is why you
can't run a `linux/amd64` container on a `linux/arm64` host, or a Windows
container on a Linux host.
@z

@x
Multi-platform builds solve this problem by packaging multiple variants of the
same application into a single image. This enables you to run the same image on
different types of hardware, such as development machines running x86-64 or
ARM-based Amazon EC2 instances in the cloud, without the need for emulation.
@y
Multi-platform builds solve this problem by packaging multiple variants of the
same application into a single image. This enables you to run the same image on
different types of hardware, such as development machines running x86-64 or
ARM-based Amazon EC2 instances in the cloud, without the need for emulation.
@z

@x
{{< accordion title="How it works" >}}
@y
{{< accordion title="How it works" >}}
@z

@x
Multi-platform images have a different structure than single-platform images.
Single-platform images contain a single manifest that points to a single
configuration and a single set of layers. Multi-platform images contain a
manifest list, pointing to multiple manifests, each of which points to a
different configuration and set of layers.
@y
Multi-platform images have a different structure than single-platform images.
Single-platform images contain a single manifest that points to a single
configuration and a single set of layers. Multi-platform images contain a
manifest list, pointing to multiple manifests, each of which points to a
different configuration and set of layers.
@z

@x
![Multi-platform image structure](/build/images/single-vs-multiplatform-image.svg)
@y
![Multi-platform image structure](__SUBDIR__/build/images/single-vs-multiplatform-image.svg)
@z

@x
When you push a multi-platform image to a registry, the registry stores the
manifest list and all the individual manifests. When you pull the image, the
registry returns the manifest list, and Docker automatically selects the
correct variant based on the host's architecture. For example, if you run a
multi-platform image on an ARM-based Raspberry Pi, Docker selects the
`linux/arm64` variant. If you run the same image on an x86-64 laptop, Docker
selects the `linux/amd64` variant (if you're using Linux containers).
@y
When you push a multi-platform image to a registry, the registry stores the
manifest list and all the individual manifests. When you pull the image, the
registry returns the manifest list, and Docker automatically selects the
correct variant based on the host's architecture. For example, if you run a
multi-platform image on an ARM-based Raspberry Pi, Docker selects the
`linux/arm64` variant. If you run the same image on an x86-64 laptop, Docker
selects the `linux/amd64` variant (if you're using Linux containers).
@z

@x
{{< /accordion >}}
@y
{{< /accordion >}}
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
To build multi-platform images, you first need to make sure that your builder
and Docker Engine support multi-platform builds. The easiest way to do this is
to [enable the containerd image store](#enable-the-containerd-image-store).
@y
To build multi-platform images, you first need to make sure that your builder
and Docker Engine support multi-platform builds. The easiest way to do this is
to [enable the containerd image store](#enable-the-containerd-image-store).
@z

@x
Alternatively, you can [create a custom builder](#create-a-custom-builder) that
uses the `docker-container` driver, which supports multi-platform builds.
@y
Alternatively, you can [create a custom builder](#create-a-custom-builder) that
uses the `docker-container` driver, which supports multi-platform builds.
@z

@x
### Enable the containerd image store
@y
### Enable the containerd image store
@z

@x
{{< tabs >}}
{{< tab name="Docker Desktop" >}}
@y
{{< tabs >}}
{{< tab name="Docker Desktop" >}}
@z

@x
To enable the containerd image store in Docker Desktop,
go to **Settings** and select **Use containerd for pulling and storing images**
in the **General** tab.
@y
To enable the containerd image store in Docker Desktop,
go to **Settings** and select **Use containerd for pulling and storing images**
in the **General** tab.
@z

@x
Note that changing the image store means you'll temporarily lose access to
images and containers in the classic image store.
Those resources still exist, but to view them, you'll need to
disable the containerd image store.
@y
Note that changing the image store means you'll temporarily lose access to
images and containers in the classic image store.
Those resources still exist, but to view them, you'll need to
disable the containerd image store.
@z

@x
{{< /tab >}}
{{< tab name="Docker Engine" >}}
@y
{{< /tab >}}
{{< tab name="Docker Engine" >}}
@z

@x
If you're not using Docker Desktop,
enable the containerd image store by adding the following feature configuration
to your `/etc/docker/daemon.json` configuration file.
@y
If you're not using Docker Desktop,
enable the containerd image store by adding the following feature configuration
to your `/etc/docker/daemon.json` configuration file.
@z

@x
```json {hl_lines=3}
{
  "features": {
    "containerd-snapshotter": true
  }
}
```
@y
```json {hl_lines=3}
{
  "features": {
    "containerd-snapshotter": true
  }
}
```
@z

@x
Restart the daemon after updating the configuration file.
@y
Restart the daemon after updating the configuration file.
@z

@x
```console
$ systemctl restart docker
```
@y
```console
$ systemctl restart docker
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Create a custom builder
@y
### Create a custom builder
@z

@x
To create a custom builder, use the `docker buildx create` command to create a
builder that uses the `docker-container` driver. This driver runs the BuildKit
daemon in a container, as opposed to the default `docker` driver, which uses
the BuildKit library bundled with the Docker daemon. There isn't much
difference between the two drivers, but the `docker-container` driver provides
more flexibility and advanced features, including multi-platform support.
@y
To create a custom builder, use the `docker buildx create` command to create a
builder that uses the `docker-container` driver. This driver runs the BuildKit
daemon in a container, as opposed to the default `docker` driver, which uses
the BuildKit library bundled with the Docker daemon. There isn't much
difference between the two drivers, but the `docker-container` driver provides
more flexibility and advanced features, including multi-platform support.
@z

@x
```console
$ docker buildx create \
  --name container-builder \
  --driver docker-container \
  --use --bootstrap
```
@y
```console
$ docker buildx create \
  --name container-builder \
  --driver docker-container \
  --use --bootstrap
```
@z

@x
This command creates a new builder named `container-builder` that uses the
`docker-container` driver (default) and sets it as the active builder. The
`--bootstrap` flag pulls the BuildKit image and starts the build container.
@y
This command creates a new builder named `container-builder` that uses the
`docker-container` driver (default) and sets it as the active builder. The
`--bootstrap` flag pulls the BuildKit image and starts the build container.
@z

@x
## Build multi-platform images
@y
## Build multi-platform images
@z

@x
When triggering a build, use the `--platform` flag to define the target
platforms for the build output, such as `linux/amd64` and `linux/arm64`:
@y
When triggering a build, use the `--platform` flag to define the target
platforms for the build output, such as `linux/amd64` and `linux/arm64`:
@z

@x
```console
$ docker build --platform linux/amd64,linux/arm64 .
```
@y
```console
$ docker build --platform linux/amd64,linux/arm64 .
```
@z

@x
> [!NOTE]
> If you're using the `docker-container` driver, you need to specify the
> `--load` flag to load the image into the local image store after the build
> finishes. This is because images built using the `docker-container` driver
> aren't automatically loaded into the local image store.
@y
> [!NOTE]
> If you're using the `docker-container` driver, you need to specify the
> `--load` flag to load the image into the local image store after the build
> finishes. This is because images built using the `docker-container` driver
> aren't automatically loaded into the local image store.
@z

@x
## Strategies
@y
## Strategies
@z

@x
You can build multi-platform images using three different strategies,
depending on your use case:
@y
You can build multi-platform images using three different strategies,
depending on your use case:
@z

@x
1. Using emulation, via [QEMU](#qemu)
2. Use a builder with [multiple native nodes](#multiple-native-nodes)
3. Use [cross-compilation](#cross-compilation) with multi-stage builds
@y
1. Using emulation, via [QEMU](#qemu)
2. Use a builder with [multiple native nodes](#multiple-native-nodes)
3. Use [cross-compilation](#cross-compilation) with multi-stage builds
@z

@x
### QEMU
@y
### QEMU
@z

@x
Building multi-platform images under emulation with QEMU is the easiest way to
get started if your builder already supports it. Using emulation requires no
changes to your Dockerfile, and BuildKit automatically detects the
architectures that are available for emulation.
@y
Building multi-platform images under emulation with QEMU is the easiest way to
get started if your builder already supports it. Using emulation requires no
changes to your Dockerfile, and BuildKit automatically detects the
architectures that are available for emulation.
@z

@x
> [!NOTE]
>
> Emulation with QEMU can be much slower than native builds, especially for
> compute-heavy tasks like compilation and compression or decompression.
>
> Use [multiple native nodes](#multiple-native-nodes) or
> [cross-compilation](#cross-compilation) instead, if possible.
@y
> [!NOTE]
>
> Emulation with QEMU can be much slower than native builds, especially for
> compute-heavy tasks like compilation and compression or decompression.
>
> Use [multiple native nodes](#multiple-native-nodes) or
> [cross-compilation](#cross-compilation) instead, if possible.
@z

@x
Docker Desktop supports running and building multi-platform images under
emulation by default. No configuration is necessary as the builder uses the
QEMU that's bundled within the Docker Desktop VM.
@y
Docker Desktop supports running and building multi-platform images under
emulation by default. No configuration is necessary as the builder uses the
QEMU that's bundled within the Docker Desktop VM.
@z

@x
#### Install QEMU manually
@y
#### Install QEMU manually
@z

@x
If you're using a builder outside of Docker Desktop, such as if you're using
Docker Engine on Linux, or a custom remote builder, you need to install QEMU
and register the executable types on the host OS. The prerequisites for
installing QEMU are:
@y
If you're using a builder outside of Docker Desktop, such as if you're using
Docker Engine on Linux, or a custom remote builder, you need to install QEMU
and register the executable types on the host OS. The prerequisites for
installing QEMU are:
@z

@x
- Linux kernel version 4.8 or later
- `binfmt-support` version 2.1.7 or later
- The QEMU binaries must be statically compiled and registered with the
  `fix_binary` flag
@y
- Linux kernel version 4.8 or later
- `binfmt-support` version 2.1.7 or later
- The QEMU binaries must be statically compiled and registered with the
  `fix_binary` flag
@z

@x
Use the [`tonistiigi/binfmt`](https://github.com/tonistiigi/binfmt) image to
install QEMU and register the executable types on the host with a single
command:
@y
Use the [`tonistiigi/binfmt`](https://github.com/tonistiigi/binfmt) image to
install QEMU and register the executable types on the host with a single
command:
@z

@x
```console
$ docker run --privileged --rm tonistiigi/binfmt --install all
```
@y
```console
$ docker run --privileged --rm tonistiigi/binfmt --install all
```
@z

@x
This installs the QEMU binaries and registers them with
[`binfmt_misc`](https://en.wikipedia.org/wiki/Binfmt_misc), enabling QEMU to
execute non-native file formats for emulation.
@y
This installs the QEMU binaries and registers them with
[`binfmt_misc`](https://en.wikipedia.org/wiki/Binfmt_misc), enabling QEMU to
execute non-native file formats for emulation.
@z

@x
Once QEMU is installed and the executable types are registered on the host OS,
they work transparently inside containers. You can verify your registration by
checking if `F` is among the flags in `/proc/sys/fs/binfmt_misc/qemu-*`.
@y
Once QEMU is installed and the executable types are registered on the host OS,
they work transparently inside containers. You can verify your registration by
checking if `F` is among the flags in `/proc/sys/fs/binfmt_misc/qemu-*`.
@z

@x
### Multiple native nodes
@y
### Multiple native nodes
@z

@x
Using multiple native nodes provide better support for more complicated cases
that QEMU can't handle, and also provides better performance.
@y
Using multiple native nodes provide better support for more complicated cases
that QEMU can't handle, and also provides better performance.
@z

@x
You can add additional nodes to a builder using the `--append` flag.
@y
You can add additional nodes to a builder using the `--append` flag.
@z

@x
The following command creates a multi-node builder from Docker contexts named
`node-amd64` and `node-arm64`. This example assumes that you've already added
those contexts.
@y
The following command creates a multi-node builder from Docker contexts named
`node-amd64` and `node-arm64`. This example assumes that you've already added
those contexts.
@z

@x
```console
$ docker buildx create --use --name mybuild node-amd64
mybuild
$ docker buildx create --append --name mybuild node-arm64
$ docker buildx build --platform linux/amd64,linux/arm64 .
```
@y
```console
$ docker buildx create --use --name mybuild node-amd64
mybuild
$ docker buildx create --append --name mybuild node-arm64
$ docker buildx build --platform linux/amd64,linux/arm64 .
```
@z

@x
While this approach has advantages over emulation, managing multi-node builders
introduces some overhead of setting up and managing builder clusters.
Alternatively, you can use Docker Build Cloud, a service that provides managed
multi-node builders on Docker's infrastructure. With Docker Build Cloud, you
get native multi-platform ARM and X86 builders without the burden of
maintaining them. Using cloud builders also provides additional benefits, such
as a shared build cache.
@y
While this approach has advantages over emulation, managing multi-node builders
introduces some overhead of setting up and managing builder clusters.
Alternatively, you can use Docker Build Cloud, a service that provides managed
multi-node builders on Docker's infrastructure. With Docker Build Cloud, you
get native multi-platform ARM and X86 builders without the burden of
maintaining them. Using cloud builders also provides additional benefits, such
as a shared build cache.
@z

@x
After signing up for Docker Build Cloud, add the builder to your local
environment and start building.
@y
After signing up for Docker Build Cloud, add the builder to your local
environment and start building.
@z

@x
```console
$ docker buildx create --driver cloud <ORG>/<BUILDER_NAME>
cloud-<ORG>-<BUILDER_NAME>
$ docker build \
  --builder cloud-<ORG>-<BUILDER_NAME> \
  --platform linux/amd64,linux/arm64,linux/arm/v7 \
  --tag <IMAGE_NAME> \
  --push .
```
@y
```console
$ docker buildx create --driver cloud <ORG>/<BUILDER_NAME>
cloud-<ORG>-<BUILDER_NAME>
$ docker build \
  --builder cloud-<ORG>-<BUILDER_NAME> \
  --platform linux/amd64,linux/arm64,linux/arm/v7 \
  --tag <IMAGE_NAME> \
  --push .
```
@z

@x
For more information, see [Docker Build Cloud](/manuals/build-cloud/_index.md).
@y
For more information, see [Docker Build Cloud](manuals/build-cloud/_index.md).
@z

@x
### Cross-compilation
@y
### Cross-compilation
@z

@x
Depending on your project, if the programming language you use has good support
for cross-compilation, you can leverage multi-stage builds to build binaries
for target platforms from the native architecture of the builder. Special build
arguments, such as `BUILDPLATFORM` and `TARGETPLATFORM`, are automatically
available for use in your Dockerfile.
@y
Depending on your project, if the programming language you use has good support
for cross-compilation, you can leverage multi-stage builds to build binaries
for target platforms from the native architecture of the builder. Special build
arguments, such as `BUILDPLATFORM` and `TARGETPLATFORM`, are automatically
available for use in your Dockerfile.
@z

@x
In the following example, the `FROM` instruction is pinned to the native
platform of the builder (using the `--platform=$BUILDPLATFORM` option) to
prevent emulation from kicking in. Then the pre-defined `$BUILDPLATFORM` and
`$TARGETPLATFORM` build arguments are interpolated in a `RUN` instruction. In
this case, the values are just printed to stdout with `echo`, but this
illustrates how you would pass them to the compiler for cross-compilation.
@y
In the following example, the `FROM` instruction is pinned to the native
platform of the builder (using the `--platform=$BUILDPLATFORM` option) to
prevent emulation from kicking in. Then the pre-defined `$BUILDPLATFORM` and
`$TARGETPLATFORM` build arguments are interpolated in a `RUN` instruction. In
this case, the values are just printed to stdout with `echo`, but this
illustrates how you would pass them to the compiler for cross-compilation.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM --platform=$BUILDPLATFORM golang:alpine AS build
ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM" > /log
FROM alpine
COPY --from=build /log /log
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM --platform=$BUILDPLATFORM golang:alpine AS build
ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM" > /log
FROM alpine
COPY --from=build /log /log
```
@z

@x
## Examples
@y
## Examples
@z

@x
Here are some examples of multi-platform builds:
@y
Here are some examples of multi-platform builds:
@z

@x
- [Simple multi-platform build using emulation](#simple-multi-platform-build-using-emulation)
- [Multi-platform Neovim build using Docker Build Cloud](#multi-platform-neovim-build-using-docker-build-cloud)
- [Cross-compiling a Go application](#cross-compiling-a-go-application)
@y
- [Simple multi-platform build using emulation](#simple-multi-platform-build-using-emulation)
- [Multi-platform Neovim build using Docker Build Cloud](#multi-platform-neovim-build-using-docker-build-cloud)
- [Cross-compiling a Go application](#cross-compiling-a-go-application)
@z

@x
### Simple multi-platform build using emulation
@y
### Simple multi-platform build using emulation
@z

@x
This example demonstrates how to build a simple multi-platform image using
emulation with QEMU. The image contains a single file that prints the
architecture of the container.
@y
This example demonstrates how to build a simple multi-platform image using
emulation with QEMU. The image contains a single file that prints the
architecture of the container.
@z

@x
Prerequisites:
@y
Prerequisites:
@z

@x
- Docker Desktop, or Docker Engine with [QEMU installed](#install-qemu-manually)
- [containerd image store enabled](#enable-the-containerd-image-store)
@y
- Docker Desktop, or Docker Engine with [QEMU installed](#install-qemu-manually)
- [containerd image store enabled](#enable-the-containerd-image-store)
@z

@x
Steps:
@y
Steps:
@z

@x
1. Create an empty directory and navigate to it:
@y
1. Create an empty directory and navigate to it:
@z

@x
   ```console
   $ mkdir multi-platform
   $ cd multi-platform
   ```
@y
   ```console
   $ mkdir multi-platform
   $ cd multi-platform
   ```
@z

@x
2. Create a simple Dockerfile that prints the architecture of the container:
@y
2. Create a simple Dockerfile that prints the architecture of the container:
@z

@x
   ```dockerfile
   # syntax=docker/dockerfile:1
   FROM alpine
   RUN uname -m > /arch
   ```
@y
   ```dockerfile
   # syntax=docker/dockerfile:1
   FROM alpine
   RUN uname -m > /arch
   ```
@z

@x
3. Build the image for `linux/amd64` and `linux/arm64`:
@y
3. Build the image for `linux/amd64` and `linux/arm64`:
@z

@x
   ```console
   $ docker build --platform linux/amd64,linux/arm64 -t multi-platform .
   ```
@y
   ```console
   $ docker build --platform linux/amd64,linux/arm64 -t multi-platform .
   ```
@z

@x
4. Run the image and print the architecture:
@y
4. Run the image and print the architecture:
@z

@x
   ```console
   $ docker run --rm multi-platform cat /arch
   ```
@y
   ```console
   $ docker run --rm multi-platform cat /arch
   ```
@z

@x
   - If you're running on an x86-64 machine, you should see `x86_64`.
   - If you're running on an ARM machine, you should see `aarch64`.
@y
   - If you're running on an x86-64 machine, you should see `x86_64`.
   - If you're running on an ARM machine, you should see `aarch64`.
@z

@x
### Multi-platform Neovim build using Docker Build Cloud
@y
### Multi-platform Neovim build using Docker Build Cloud
@z

@x
This example demonstrates how run a multi-platform build using Docker Build
Cloud to compile and export [Neovim](https://github.com/neovim/neovim) binaries
for the `linux/amd64` and `linux/arm64` platforms.
@y
This example demonstrates how run a multi-platform build using Docker Build
Cloud to compile and export [Neovim](https://github.com/neovim/neovim) binaries
for the `linux/amd64` and `linux/arm64` platforms.
@z

@x
Docker Build Cloud provides managed multi-node builders that support native
multi-platform builds without the need for emulation, making it much faster to
do CPU-intensive tasks like compilation.
@y
Docker Build Cloud provides managed multi-node builders that support native
multi-platform builds without the need for emulation, making it much faster to
do CPU-intensive tasks like compilation.
@z

@x
Prerequisites:
@y
Prerequisites:
@z

@x
- You've [signed up for Docker Build Cloud and created a builder](/manuals/build-cloud/setup.md)
@y
- You've [signed up for Docker Build Cloud and created a builder](manuals/build-cloud/setup.md)
@z

@x
Steps:
@y
Steps:
@z

@x
1. Create an empty directory and navigate to it:
@y
1. Create an empty directory and navigate to it:
@z

@x
   ```console
   $ mkdir docker-build-neovim
   $ cd docker-build-neovim
   ```
@y
   ```console
   $ mkdir docker-build-neovim
   $ cd docker-build-neovim
   ```
@z

@x
2. Create a Dockerfile that builds Neovim.
@y
2. Create a Dockerfile that builds Neovim.
@z

@x
   ```dockerfile
   # syntax=docker/dockerfile:1
   FROM debian:bookworm AS build
   WORKDIR /work
   RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
       --mount=type=cache,target=/var/lib/apt,sharing=locked \
       apt-get update && apt-get install -y \
       build-essential \
       cmake \
       curl \
       gettext \
       ninja-build \
       unzip
   ADD https://github.com/neovim/neovim.git#stable .
   RUN make CMAKE_BUILD_TYPE=RelWithDebInfo
@y
   ```dockerfile
   # syntax=docker/dockerfile:1
   FROM debian:bookworm AS build
   WORKDIR /work
   RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
       --mount=type=cache,target=/var/lib/apt,sharing=locked \
       apt-get update && apt-get install -y \
       build-essential \
       cmake \
       curl \
       gettext \
       ninja-build \
       unzip
   ADD https://github.com/neovim/neovim.git#stable .
   RUN make CMAKE_BUILD_TYPE=RelWithDebInfo
@z

@x
   FROM scratch
   COPY --from=build /work/build/bin/nvim /
   ```
@y
   FROM scratch
   COPY --from=build /work/build/bin/nvim /
   ```
@z

@x
3. Build the image for `linux/amd64` and `linux/arm64` using Docker Build Cloud:
@y
3. Build the image for `linux/amd64` and `linux/arm64` using Docker Build Cloud:
@z

@x
   ```console
   $ docker build \
      --builder <cloud-builder> \
      --platform linux/amd64,linux/arm64 \
      --output ./bin
   ```
@y
   ```console
   $ docker build \
      --builder <cloud-builder> \
      --platform linux/amd64,linux/arm64 \
      --output ./bin
   ```
@z

@x
   This command builds the image using the cloud builder and exports the
   binaries to the `bin` directory.
@y
   This command builds the image using the cloud builder and exports the
   binaries to the `bin` directory.
@z

@x
4. Verify that the binaries are built for both platforms. You should see the
   `nvim` binary for both `linux/amd64` and `linux/arm64`.
@y
4. Verify that the binaries are built for both platforms. You should see the
   `nvim` binary for both `linux/amd64` and `linux/arm64`.
@z

@x
   ```console
   $ tree ./bin
   ./bin
   ├── linux_amd64
   │   └── nvim
   └── linux_arm64
       └── nvim
@y
   ```console
   $ tree ./bin
   ./bin
   ├── linux_amd64
   │   └── nvim
   └── linux_arm64
       └── nvim
@z

@x
   3 directories, 2 files
   ```
@y
   3 directories, 2 files
   ```
@z

@x
### Cross-compiling a Go application
@y
### Cross-compiling a Go application
@z

@x
This example demonstrates how to cross-compile a Go application for multiple
platforms using multi-stage builds. The application is a simple HTTP server
that listens on port 8080 and returns the architecture of the container.
This example uses Go, but the same principles apply to other programming
languages that support cross-compilation.
@y
This example demonstrates how to cross-compile a Go application for multiple
platforms using multi-stage builds. The application is a simple HTTP server
that listens on port 8080 and returns the architecture of the container.
This example uses Go, but the same principles apply to other programming
languages that support cross-compilation.
@z

@x
Cross-compilation with Docker builds works by leveraging a series of
pre-defined (in BuildKit) build arguments that give you information about
platforms of the builder and the build targets. You can use these pre-defined
arguments to pass the platform information to the compiler.
@y
Cross-compilation with Docker builds works by leveraging a series of
pre-defined (in BuildKit) build arguments that give you information about
platforms of the builder and the build targets. You can use these pre-defined
arguments to pass the platform information to the compiler.
@z

@x
In Go, you can use the `GOOS` and `GOARCH` environment variables to specify the
target platform to build for.
@y
In Go, you can use the `GOOS` and `GOARCH` environment variables to specify the
target platform to build for.
@z

@x
Prerequisites:
@y
Prerequisites:
@z

@x
- Docker Desktop or Docker Engine
@y
- Docker Desktop or Docker Engine
@z

@x
Steps:
@y
Steps:
@z

@x
1. Create an empty directory and navigate to it:
@y
1. Create an empty directory and navigate to it:
@z

@x
   ```console
   $ mkdir go-server
   $ cd go-server
   ```
@y
   ```console
   $ mkdir go-server
   $ cd go-server
   ```
@z

@x
2. Create a base Dockerfile that builds the Go application:
@y
2. Create a base Dockerfile that builds the Go application:
@z

@x
   ```dockerfile
   # syntax=docker/dockerfile:1
   FROM golang:alpine AS build
   WORKDIR /app
   ADD https://github.com/dvdksn/buildme.git#eb6279e0ad8a10003718656c6867539bd9426ad8 .
   RUN go build -o server .
@y
   ```dockerfile
   # syntax=docker/dockerfile:1
   FROM golang:alpine AS build
   WORKDIR /app
   ADD https://github.com/dvdksn/buildme.git#eb6279e0ad8a10003718656c6867539bd9426ad8 .
   RUN go build -o server .
@z

@x
   FROM alpine
   COPY --from=build /app/server /server
   ENTRYPOINT ["/server"]
   ```
@y
   FROM alpine
   COPY --from=build /app/server /server
   ENTRYPOINT ["/server"]
   ```
@z

@x
   This Dockerfile can't build multi-platform with cross-compilation yet. If
   you were to try to build this Dockerfile with `docker build`, the builder
   would attempt to use emulation to build the image for the specified
   platforms.
@y
   This Dockerfile can't build multi-platform with cross-compilation yet. If
   you were to try to build this Dockerfile with `docker build`, the builder
   would attempt to use emulation to build the image for the specified
   platforms.
@z

@x
3. To add cross-compilation support, update the Dockerfile to use the
   pre-defined `BUILDPLATFORM` and `TARGETPLATFORM` build arguments. These
   arguments are automatically available in the Dockerfile when you use the
   `--platform` flag with `docker build`.
@y
3. To add cross-compilation support, update the Dockerfile to use the
   pre-defined `BUILDPLATFORM` and `TARGETPLATFORM` build arguments. These
   arguments are automatically available in the Dockerfile when you use the
   `--platform` flag with `docker build`.
@z

@x
   - Pin the `golang` image to the platform of the builder using the
     `--platform=$BUILDPLATFORM` option.
   - Add `ARG` instructions for the Go compilation stages to make the
     `TARGETOS` and `TARGETARCH` build arguments available to the commands in
     this stage.
   - Set the `GOOS` and `GOARCH` environment variables to the values of
     `TARGETOS` and `TARGETARCH`. The Go compiler uses these variables to do
     cross-compilation.
@y
   - Pin the `golang` image to the platform of the builder using the
     `--platform=$BUILDPLATFORM` option.
   - Add `ARG` instructions for the Go compilation stages to make the
     `TARGETOS` and `TARGETARCH` build arguments available to the commands in
     this stage.
   - Set the `GOOS` and `GOARCH` environment variables to the values of
     `TARGETOS` and `TARGETARCH`. The Go compiler uses these variables to do
     cross-compilation.
@z

@x
   {{< tabs >}}
   {{< tab name="Updated Dockerfile" >}}
@y
   {{< tabs >}}
   {{< tab name="Updated Dockerfile" >}}
@z

@x
   ```dockerfile
   # syntax=docker/dockerfile:1
   FROM --platform=$BUILDPLATFORM golang:alpine AS build
   ARG TARGETOS
   ARG TARGETARCH
   WORKDIR /app
   ADD https://github.com/dvdksn/buildme.git#eb6279e0ad8a10003718656c6867539bd9426ad8 .
   RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -o server .
@y
   ```dockerfile
   # syntax=docker/dockerfile:1
   FROM --platform=$BUILDPLATFORM golang:alpine AS build
   ARG TARGETOS
   ARG TARGETARCH
   WORKDIR /app
   ADD https://github.com/dvdksn/buildme.git#eb6279e0ad8a10003718656c6867539bd9426ad8 .
   RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -o server .
@z

@x
   FROM alpine
   COPY --from=build /app/server /server
   ENTRYPOINT ["/server"]
   ```
@y
   FROM alpine
   COPY --from=build /app/server /server
   ENTRYPOINT ["/server"]
   ```
@z

@x
   {{< /tab >}}
   {{< tab name="Old Dockerfile" >}}
@y
   {{< /tab >}}
   {{< tab name="Old Dockerfile" >}}
@z

@x
   ```dockerfile
   # syntax=docker/dockerfile:1
   FROM golang:alpine AS build
   WORKDIR /app
   ADD https://github.com/dvdksn/buildme.git#eb6279e0ad8a10003718656c6867539bd9426ad8 .
   RUN go build -o server .
@y
   ```dockerfile
   # syntax=docker/dockerfile:1
   FROM golang:alpine AS build
   WORKDIR /app
   ADD https://github.com/dvdksn/buildme.git#eb6279e0ad8a10003718656c6867539bd9426ad8 .
   RUN go build -o server .
@z

@x
   FROM alpine
   COPY --from=build /app/server /server
   ENTRYPOINT ["/server"]
   ```
@y
   FROM alpine
   COPY --from=build /app/server /server
   ENTRYPOINT ["/server"]
   ```
@z

@x
   {{< /tab >}}
   {{< tab name="Diff" >}}
@y
   {{< /tab >}}
   {{< tab name="Diff" >}}
@z

@x
   ```diff
   # syntax=docker/dockerfile:1
   -FROM golang:alpine AS build
   +FROM --platform=$BUILDPLATFORM golang:alpine AS build
   +ARG TARGETOS
   +ARG TARGETARCH
   WORKDIR /app
   ADD https://github.com/dvdksn/buildme.git#eb6279e0ad8a10003718656c6867539bd9426ad8 .
   -RUN go build -o server .
   RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -o server .
@y
   ```diff
   # syntax=docker/dockerfile:1
   -FROM golang:alpine AS build
   +FROM --platform=$BUILDPLATFORM golang:alpine AS build
   +ARG TARGETOS
   +ARG TARGETARCH
   WORKDIR /app
   ADD https://github.com/dvdksn/buildme.git#eb6279e0ad8a10003718656c6867539bd9426ad8 .
   -RUN go build -o server .
   RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -o server .
@z

@x
   FROM alpine
   COPY --from=build /app/server /server
   ENTRYPOINT ["/server"]
   ```
@y
   FROM alpine
   COPY --from=build /app/server /server
   ENTRYPOINT ["/server"]
   ```
@z

@x
   {{< /tab >}}
   {{< /tabs >}}
@y
   {{< /tab >}}
   {{< /tabs >}}
@z

@x
4. Build the image for `linux/amd64` and `linux/arm64`:
@y
4. Build the image for `linux/amd64` and `linux/arm64`:
@z

@x
   ```console
   $ docker build --platform linux/amd64,linux/arm64 -t go-server .
   ```
@y
   ```console
   $ docker build --platform linux/amd64,linux/arm64 -t go-server .
   ```
@z

@x
This example has shown how to cross-compile a Go application for multiple
platforms with Docker builds. The specific steps on how to do cross-compilation
may vary depending on the programming language you're using. Consult the
documentation for your programming language to learn more about cross-compiling
for different platforms.
@y
This example has shown how to cross-compile a Go application for multiple
platforms with Docker builds. The specific steps on how to do cross-compilation
may vary depending on the programming language you're using. Consult the
documentation for your programming language to learn more about cross-compiling
for different platforms.
@z

@x
> [!TIP]
> You may also want to consider checking out
> [xx - Dockerfile cross-compilation helpers](https://github.com/tonistiigi/xx).
> `xx` is a Docker image containing utility scripts that make cross-compiling with Docker builds easier.
@y
> [!TIP]
> You may also want to consider checking out
> [xx - Dockerfile cross-compilation helpers](https://github.com/tonistiigi/xx).
> `xx` is a Docker image containing utility scripts that make cross-compiling with Docker builds easier.
@z
