%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Multi-platform images
description: Introduction to multi-platform images and how to build them
keywords: build, buildx, buildkit, multi-platform images
aliases:
- /build/buildx/multiplatform-images/
- /desktop/multi-arch/
- /docker-for-mac/multi-arch/
- /mackit/multi-arch/
---
@y
---
title: Multi-platform images
description: Introduction to multi-platform images and how to build them
keywords: build, buildx, buildkit, multi-platform images
aliases:
- /build/buildx/multiplatform-images/
- /desktop/multi-arch/
- /docker-for-mac/multi-arch/
- /mackit/multi-arch/
---
@z

@x
Docker images can support multiple platforms, which means that a single image
may contain variants for different architectures, and sometimes for different
operating systems, such as Windows.
@y
Docker images can support multiple platforms, which means that a single image
may contain variants for different architectures, and sometimes for different
operating systems, such as Windows.
@z

@x
When you run an image with multi-platform support, Docker automatically selects
the image that matches your OS and architecture.
@y
When you run an image with multi-platform support, Docker automatically selects
the image that matches your OS and architecture.
@z

@x
Most of the Docker Official Images on Docker Hub provide a [variety of architectures](https://github.com/docker-library/official-images#architectures-other-than-amd64).
For example, the `busybox` image supports `amd64`, `arm32v5`, `arm32v6`,
`arm32v7`, `arm64v8`, `i386`, `ppc64le`, and `s390x`. When running this image
on an `x86_64` / `amd64` machine, the `amd64` variant is pulled and run.
@y
Most of the Docker Official Images on Docker Hub provide a [variety of architectures](https://github.com/docker-library/official-images#architectures-other-than-amd64).
For example, the `busybox` image supports `amd64`, `arm32v5`, `arm32v6`,
`arm32v7`, `arm64v8`, `i386`, `ppc64le`, and `s390x`. When running this image
on an `x86_64` / `amd64` machine, the `amd64` variant is pulled and run.
@z

@x
## Building multi-platform images
@y
## Building multi-platform images
@z

@x
When you invoke a build, you can set the `--platform` flag to specify the target
platform for the build output. For example, `linux/amd64`, `linux/arm64`, or
`darwin/amd64`.
@y
When you invoke a build, you can set the `--platform` flag to specify the target
platform for the build output. For example, `linux/amd64`, `linux/arm64`, or
`darwin/amd64`.
@z

@x
By default, you can only build for a single platform at a time. If you want to
build for multiple platforms at once, you can:
@y
By default, you can only build for a single platform at a time. If you want to
build for multiple platforms at once, you can:
@z

@x
- Create a new builder that uses the [`docker-container` driver](../drivers/docker-container.md)
- Turn on the [containerd snapshotter storage](../../desktop/containerd/index.md)
@y
- Create a new builder that uses the [`docker-container` driver](../drivers/docker-container.md)
- Turn on the [containerd snapshotter storage](../../desktop/containerd/index.md)
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
1. Using the [QEMU emulation](#qemu) support in the kernel
2. Building on [multiple native nodes](#multiple-native-nodes) using the same
   builder instance
3. Using a stage in your Dockerfile to [cross-compile](#cross-compilation) to
   different architectures
@y
1. Using the [QEMU emulation](#qemu) support in the kernel
2. Building on [multiple native nodes](#multiple-native-nodes) using the same
   builder instance
3. Using a stage in your Dockerfile to [cross-compile](#cross-compilation) to
   different architectures
@z

@x
### QEMU
@y
### QEMU
@z

@x
Building multi-platform images under emulation with QEMU is the easiest way to
get started if your builder already supports it. Docker Desktop supports it out
of the box. It requires no changes to your Dockerfile, and BuildKit
automatically detects the secondary architectures that are available. When
BuildKit needs to run a binary for a different architecture, it automatically
loads it through a binary registered in the `binfmt_misc` handler.
@y
Building multi-platform images under emulation with QEMU is the easiest way to
get started if your builder already supports it. Docker Desktop supports it out
of the box. It requires no changes to your Dockerfile, and BuildKit
automatically detects the secondary architectures that are available. When
BuildKit needs to run a binary for a different architecture, it automatically
loads it through a binary registered in the `binfmt_misc` handler.
@z

@x
> **Note**
>
> Emulation with QEMU can be much slower than native builds, especially for
> compute-heavy tasks like compilation and compression or decompression.
>
> Use [cross-compilation](#cross-compilation) instead, if possible.
@y
> **Note**
>
> Emulation with QEMU can be much slower than native builds, especially for
> compute-heavy tasks like compilation and compression or decompression.
>
> Use [cross-compilation](#cross-compilation) instead, if possible.
@z

@x
For QEMU binaries registered with `binfmt_misc` on the host OS to work
transparently inside containers, they must be statically compiled and
registered with the `fix_binary` flag. This requires a kernel version 4.8 or
later, and `binfmt-support` version 2.1.7 or later.
@y
For QEMU binaries registered with `binfmt_misc` on the host OS to work
transparently inside containers, they must be statically compiled and
registered with the `fix_binary` flag. This requires a kernel version 4.8 or
later, and `binfmt-support` version 2.1.7 or later.
@z

@x
You can verify your registration by checking if `F` is among the flags in
`/proc/sys/fs/binfmt_misc/qemu-*`. While Docker Desktop comes preconfigured
with `binfmt_misc` support for additional platforms, for other installations it
likely needs to be installed using
[`tonistiigi/binfmt`](https://github.com/tonistiigi/binfmt) image:
@y
You can verify your registration by checking if `F` is among the flags in
`/proc/sys/fs/binfmt_misc/qemu-*`. While Docker Desktop comes preconfigured
with `binfmt_misc` support for additional platforms, for other installations it
likely needs to be installed using
[`tonistiigi/binfmt`](https://github.com/tonistiigi/binfmt) image:
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
### Multiple native nodes
@y
### Multiple native nodes
@z

@x
Using multiple native nodes provide better support for more complicated cases
that are not handled by QEMU and generally have better performance. You can
add additional nodes to the builder instance using the `--append` flag.
@y
Using multiple native nodes provide better support for more complicated cases
that are not handled by QEMU and generally have better performance. You can
add additional nodes to the builder instance using the `--append` flag.
@z

@x
Assuming contexts `node-amd64` and `node-arm64` exist in `docker context ls`;
@y
Assuming contexts `node-amd64` and `node-arm64` exist in `docker context ls`;
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
For information on using multiple native nodes in CI, with GitHub Actions,
refer to
[Configure your GitHub Actions builder](../ci/github-actions/configure-builder.md#append-additional-nodes-to-the-builder).
@y
For information on using multiple native nodes in CI, with GitHub Actions,
refer to
[Configure your GitHub Actions builder](../ci/github-actions/configure-builder.md#append-additional-nodes-to-the-builder).
@z

@x
### Cross-compilation
@y
### Cross-compilation
@z

@x
Depending on your project, if the programming language you use has good support
for cross-compilation, multi-stage builds in Dockerfiles can be effectively
used to build binaries for target platforms using the native architecture of
the build node. Build arguments such as `BUILDPLATFORM` and `TARGETPLATFORM`
are automatically available for use in your Dockerfile, and can be leveraged by
the processes running as part of your build.
@y
Depending on your project, if the programming language you use has good support
for cross-compilation, multi-stage builds in Dockerfiles can be effectively
used to build binaries for target platforms using the native architecture of
the build node. Build arguments such as `BUILDPLATFORM` and `TARGETPLATFORM`
are automatically available for use in your Dockerfile, and can be leveraged by
the processes running as part of your build.
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
## Getting started
@y
## Getting started
@z

@x
Run the [`docker buildx ls` command](../../engine/reference/commandline/buildx_ls.md)
to list the existing builders:
@y
Run the [`docker buildx ls` command](../../engine/reference/commandline/buildx_ls.md)
to list the existing builders:
@z

@x
```console
$ docker buildx ls
NAME/NODE  DRIVER/ENDPOINT  STATUS   BUILDKIT PLATFORMS
default *  docker
  default  default          running  v0.11.6  linux/amd64, linux/arm64, linux/arm/v7, linux/arm/v6
```
@y
```console
$ docker buildx ls
NAME/NODE  DRIVER/ENDPOINT  STATUS   BUILDKIT PLATFORMS
default *  docker
  default  default          running  v0.11.6  linux/amd64, linux/arm64, linux/arm/v7, linux/arm/v6
```
@z

@x
This displays the default builtin driver, that uses the BuildKit server
components built directly into the docker engine, also known as the [`docker` driver](../drivers/docker.md).
@y
This displays the default builtin driver, that uses the BuildKit server
components built directly into the docker engine, also known as the [`docker` driver](../drivers/docker.md).
@z

@x
Create a new builder using the [`docker-container` driver](../drivers/docker-container.md)
which gives you access to more complex features like multi-platform builds
and the more advanced cache exporters, which are currently unsupported in the
default `docker` driver:
@y
Create a new builder using the [`docker-container` driver](../drivers/docker-container.md)
which gives you access to more complex features like multi-platform builds
and the more advanced cache exporters, which are currently unsupported in the
default `docker` driver:
@z

@x
```console
$ docker buildx create --name mybuilder --bootstrap --use
```
@y
```console
$ docker buildx create --name mybuilder --bootstrap --use
```
@z

@x
Now listing the existing builders again, we can see our new builder is
registered:
@y
Now listing the existing builders again, we can see our new builder is
registered:
@z

@x
```console
$ docker buildx ls
NAME/NODE     DRIVER/ENDPOINT              STATUS   BUILDKIT PLATFORMS
mybuilder *   docker-container
  mybuilder0  unix:///var/run/docker.sock  running  v0.12.1  linux/amd64, linux/amd64/v2, linux/amd64/v3, linux/arm64, linux/riscv64, linux/ppc64le, linux/s390x, linux/386, linux/mips64le, linux/mips64, linux/arm/v7, linux/arm/v6
default       docker
  default     default                      running  v{{% param "buildkit_version" %}}  linux/amd64, linux/arm64, linux/arm/v7, linux/arm/v6
```
@y
```console
$ docker buildx ls
NAME/NODE     DRIVER/ENDPOINT              STATUS   BUILDKIT PLATFORMS
mybuilder *   docker-container
  mybuilder0  unix:///var/run/docker.sock  running  v0.12.1  linux/amd64, linux/amd64/v2, linux/amd64/v3, linux/arm64, linux/riscv64, linux/ppc64le, linux/s390x, linux/386, linux/mips64le, linux/mips64, linux/arm/v7, linux/arm/v6
default       docker
  default     default                      running  v{{% param "buildkit_version" %}}  linux/amd64, linux/arm64, linux/arm/v7, linux/arm/v6
```
@z

@x
## Example
@y
## Example
@z

@x
Test the workflow to ensure you can build, push, and run multi-platform images.
Create a simple example Dockerfile, build a couple of image variants, and push
them to Docker Hub.
@y
Test the workflow to ensure you can build, push, and run multi-platform images.
Create a simple example Dockerfile, build a couple of image variants, and push
them to Docker Hub.
@z

@x
The following example uses a single `Dockerfile` to build an Alpine image with
cURL installed for multiple architectures:
@y
The following example uses a single `Dockerfile` to build an Alpine image with
cURL installed for multiple architectures:
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine:3.16
RUN apk add curl
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine:3.16
RUN apk add curl
```
@z

@x
Build the Dockerfile with buildx, passing the list of architectures to
build for:
@y
Build the Dockerfile with buildx, passing the list of architectures to
build for:
@z

@x
```console
$ docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t <username>/<image>:latest --push .
...
#16 exporting to image
#16 exporting layers
#16 exporting layers 0.5s done
#16 exporting manifest sha256:71d7ecf3cd12d9a99e73ef448bf63ae12751fe3a436a007cb0969f0dc4184c8c 0.0s done
#16 exporting config sha256:a26f329a501da9e07dd9cffd9623e49229c3bb67939775f936a0eb3059a3d045 0.0s done
#16 exporting manifest sha256:5ba4ceea65579fdd1181dfa103cc437d8e19d87239683cf5040e633211387ccf 0.0s done
#16 exporting config sha256:9fcc6de03066ac1482b830d5dd7395da781bb69fe8f9873e7f9b456d29a9517c 0.0s done
#16 exporting manifest sha256:29666fb23261b1f77ca284b69f9212d69fe5b517392dbdd4870391b7defcc116 0.0s done
#16 exporting config sha256:92cbd688027227473d76e705c32f2abc18569c5cfabd00addd2071e91473b2e4 0.0s done
#16 exporting manifest list sha256:f3b552e65508d9203b46db507bb121f1b644e53a22f851185d8e53d873417c48 0.0s done
#16 ...
@y
```console
$ docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t <username>/<image>:latest --push .
...
#16 exporting to image
#16 exporting layers
#16 exporting layers 0.5s done
#16 exporting manifest sha256:71d7ecf3cd12d9a99e73ef448bf63ae12751fe3a436a007cb0969f0dc4184c8c 0.0s done
#16 exporting config sha256:a26f329a501da9e07dd9cffd9623e49229c3bb67939775f936a0eb3059a3d045 0.0s done
#16 exporting manifest sha256:5ba4ceea65579fdd1181dfa103cc437d8e19d87239683cf5040e633211387ccf 0.0s done
#16 exporting config sha256:9fcc6de03066ac1482b830d5dd7395da781bb69fe8f9873e7f9b456d29a9517c 0.0s done
#16 exporting manifest sha256:29666fb23261b1f77ca284b69f9212d69fe5b517392dbdd4870391b7defcc116 0.0s done
#16 exporting config sha256:92cbd688027227473d76e705c32f2abc18569c5cfabd00addd2071e91473b2e4 0.0s done
#16 exporting manifest list sha256:f3b552e65508d9203b46db507bb121f1b644e53a22f851185d8e53d873417c48 0.0s done
#16 ...
@z

@x
#17 [auth] <username>/<image>:pull,push token for registry-1.docker.io
#17 DONE 0.0s
@y
#17 [auth] <username>/<image>:pull,push token for registry-1.docker.io
#17 DONE 0.0s
@z

@x
#16 exporting to image
#16 pushing layers
#16 pushing layers 3.6s done
#16 pushing manifest for docker.io/<username>/<image>:latest@sha256:f3b552e65508d9203b46db507bb121f1b644e53a22f851185d8e53d873417c48
#16 pushing manifest for docker.io/<username>/<image>:latest@sha256:f3b552e65508d9203b46db507bb121f1b644e53a22f851185d8e53d873417c48 1.4s done
#16 DONE 5.6s
```
@y
#16 exporting to image
#16 pushing layers
#16 pushing layers 3.6s done
#16 pushing manifest for docker.io/<username>/<image>:latest@sha256:f3b552e65508d9203b46db507bb121f1b644e53a22f851185d8e53d873417c48
#16 pushing manifest for docker.io/<username>/<image>:latest@sha256:f3b552e65508d9203b46db507bb121f1b644e53a22f851185d8e53d873417c48 1.4s done
#16 DONE 5.6s
```
@z

@x
> **Note**
> 
> * `<username>` must be a valid Docker ID and `<image>` and valid repository on
>   Docker Hub.
> * The `--platform` flag informs buildx to create Linux images for AMD 64-bit,
>   Arm 64-bit, and Armv7 architectures.
> * The `--push` flag generates a multi-arch manifest and pushes all the images
>   to Docker Hub.
@y
> **Note**
> 
> * `<username>` must be a valid Docker ID and `<image>` and valid repository on
>   Docker Hub.
> * The `--platform` flag informs buildx to create Linux images for AMD 64-bit,
>   Arm 64-bit, and Armv7 architectures.
> * The `--push` flag generates a multi-arch manifest and pushes all the images
>   to Docker Hub.
@z

@x
Inspect the image using [`docker buildx imagetools` command](../../engine/reference/commandline/buildx_imagetools.md):
@y
Inspect the image using [`docker buildx imagetools` command](../../engine/reference/commandline/buildx_imagetools.md):
@z

@x
```console
$ docker buildx imagetools inspect <username>/<image>:latest
Name:      docker.io/<username>/<image>:latest
MediaType: application/vnd.docker.distribution.manifest.list.v2+json
Digest:    sha256:f3b552e65508d9203b46db507bb121f1b644e53a22f851185d8e53d873417c48
@y
```console
$ docker buildx imagetools inspect <username>/<image>:latest
Name:      docker.io/<username>/<image>:latest
MediaType: application/vnd.docker.distribution.manifest.list.v2+json
Digest:    sha256:f3b552e65508d9203b46db507bb121f1b644e53a22f851185d8e53d873417c48
@z

@x
Manifests:
  Name:      docker.io/<username>/<image>:latest@sha256:71d7ecf3cd12d9a99e73ef448bf63ae12751fe3a436a007cb0969f0dc4184c8c
  MediaType: application/vnd.docker.distribution.manifest.v2+json
  Platform:  linux/amd64
@y
Manifests:
  Name:      docker.io/<username>/<image>:latest@sha256:71d7ecf3cd12d9a99e73ef448bf63ae12751fe3a436a007cb0969f0dc4184c8c
  MediaType: application/vnd.docker.distribution.manifest.v2+json
  Platform:  linux/amd64
@z

@x
  Name:      docker.io/<username>/<image>:latest@sha256:5ba4ceea65579fdd1181dfa103cc437d8e19d87239683cf5040e633211387ccf
  MediaType: application/vnd.docker.distribution.manifest.v2+json
  Platform:  linux/arm64
@y
  Name:      docker.io/<username>/<image>:latest@sha256:5ba4ceea65579fdd1181dfa103cc437d8e19d87239683cf5040e633211387ccf
  MediaType: application/vnd.docker.distribution.manifest.v2+json
  Platform:  linux/arm64
@z

@x
  Name:      docker.io/<username>/<image>:latest@sha256:29666fb23261b1f77ca284b69f9212d69fe5b517392dbdd4870391b7defcc116
  MediaType: application/vnd.docker.distribution.manifest.v2+json
  Platform:  linux/arm/v7
```
@y
  Name:      docker.io/<username>/<image>:latest@sha256:29666fb23261b1f77ca284b69f9212d69fe5b517392dbdd4870391b7defcc116
  MediaType: application/vnd.docker.distribution.manifest.v2+json
  Platform:  linux/arm/v7
```
@z

@x
The image is now available on Docker Hub with the tag `<username>/<image>:latest`.
You can use this image to run a container on Intel laptops, Amazon EC2 Graviton
instances, Raspberry Pis, and on other architectures. Docker pulls the correct
image for the current architecture, so Raspberry PIs run the 32-bit Arm version
and EC2 Graviton instances run 64-bit Arm.
@y
The image is now available on Docker Hub with the tag `<username>/<image>:latest`.
You can use this image to run a container on Intel laptops, Amazon EC2 Graviton
instances, Raspberry Pis, and on other architectures. Docker pulls the correct
image for the current architecture, so Raspberry PIs run the 32-bit Arm version
and EC2 Graviton instances run 64-bit Arm.
@z

@x
The digest identifies a fully qualified image variant. You can also run images
targeted for a different architecture on Docker Desktop. For  example, when
you run the following on a macOS:
@y
The digest identifies a fully qualified image variant. You can also run images
targeted for a different architecture on Docker Desktop. For  example, when
you run the following on a macOS:
@z

@x
 ```console
$ docker run --rm docker.io/<username>/<image>:latest@sha256:2b77acdfea5dc5baa489ffab2a0b4a387666d1d526490e31845eb64e3e73ed20 uname -m
aarch64
```
@y
 ```console
$ docker run --rm docker.io/<username>/<image>:latest@sha256:2b77acdfea5dc5baa489ffab2a0b4a387666d1d526490e31845eb64e3e73ed20 uname -m
aarch64
```
@z

@x
```console
$ docker run --rm docker.io/<username>/<image>:latest@sha256:723c22f366ae44e419d12706453a544ae92711ae52f510e226f6467d8228d191 uname -m
armv7l
```
@y
```console
$ docker run --rm docker.io/<username>/<image>:latest@sha256:723c22f366ae44e419d12706453a544ae92711ae52f510e226f6467d8228d191 uname -m
armv7l
```
@z

@x
In the above example, `uname -m` returns `aarch64` and `armv7l` as expected,
even when running the commands on a native macOS or Windows developer machine.
@y
In the above example, `uname -m` returns `aarch64` and `armv7l` as expected,
even when running the commands on a native macOS or Windows developer machine.
@z

@x
## Support on Docker Desktop
@y
## Support on Docker Desktop
@z

@x
[Docker Desktop](../../desktop/index.md) provides `binfmt_misc`
multi-architecture support, which means you can run containers for different
Linux architectures such as `arm`, `mips`, `ppc64le`, and even `s390x`.
@y
[Docker Desktop](../../desktop/index.md) provides `binfmt_misc`
multi-architecture support, which means you can run containers for different
Linux architectures such as `arm`, `mips`, `ppc64le`, and even `s390x`.
@z

@x
This does not require any special configuration in the container itself as it
uses [qemu-static](https://wiki.qemu.org/Main_Page)
from the Docker Desktop VM. Because of this, you can run an ARM container,
like the `arm32v7` or `ppc64le` variants of the busybox image.
@y
This does not require any special configuration in the container itself as it
uses [qemu-static](https://wiki.qemu.org/Main_Page)
from the Docker Desktop VM. Because of this, you can run an ARM container,
like the `arm32v7` or `ppc64le` variants of the busybox image.
@z
