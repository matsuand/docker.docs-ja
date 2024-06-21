%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Multi-platform images
description: Introduction to multi-platform images and how to build them
keywords: build, buildx, buildkit, multi-platform images
@y
title: マルチプラットフォームイメージ
description: Introduction to multi-platform images and how to build them
keywords: build, buildx, buildkit, multi-platform images
@z

@x
A multi-platform image refers to a single image that includes variants for
multiple different architectures and, in some cases, different operating
systems, like Windows. This means that whether you are using an ARM-based
system or an x86 machine, Docker automatically detects and selects the
appropriate variant for your hosts's operating system and architecture.
@y
マルチプラットフォームイメージとは、一つのイメージ内に複数の異なるアーキテクチャーを含むもの、また場合によっては Windows のような異なるオペレーティングシステムを含むもののことを指します。
たとえば ARM ベースのシステムと x86 マシンを利用している場合に、ホストのオペレーティングシステムやアーキテクチャーに合わせて、Docker が自動的に適切なものを検出して利用するというものです。
@z

@x
Many of the Docker Official Images available on Docker Hub support various
architectures. For instance, the `busybox` image includes support for these
platforms:
@y
Docker Hub から入手できる Docker の公式イメージでは、さまざまなアーキテクチャーに対応するものが多々あります。
たとえば `busybox` イメージでは、以下のようなプラットフォームへのサポートが含まれています。
@z

@x
- x86-64 (`linux/amd64`, `linux/i386`)
- ARM architectures (`linux/arm/v5`, `linux/arm/v6`, `linux/arm/v7`, `linux/arm64`)
- PowerPC and IBM Z (`linux/ppc64le`, `linux/s390x`)
@y
- x86-64 (`linux/amd64`, `linux/i386`)
- ARM アーキテクチャー (`linux/arm/v5`, `linux/arm/v6`, `linux/arm/v7`, `linux/arm64`)
- PowerPC と IBM Z (`linux/ppc64le`, `linux/s390x`)
@z

@x
On an x86 machine, Docker will automatically use the `linux/amd64` variant
when you run a container or invoke a build.
@y
x86 マシンにおいて Docker は、コンテナー起動時やビルド処理時に自動的に `linux/amd64` を利用します。
@z

@x
Most Docker images use the `linux/` OS prefix to indicate they are Linux-based.
While Docker Desktop on macOS or Windows typically runs Linux containers using
a Linux VM, Docker also supports Windows containers if you're operating in
Windows container mode.
@y
Docker イメージのほとんどは、Linux ベースであることを表す OS プレフィックス `linux/` がついています。
macOS あるいは Windows 上の Docker Desktop では、Linux VM を使って Linux コンテナーを動作させていますが、Windows コンテナーモードを利用していれば Windows コンテナーもサポートします。
@z

@x
## Building multi-platform images
@y
## マルチプラットフォームイメージのビルド {#building-multi-platform-images}
@z

@x
When triggering a build, use the `--platform` flag to define the target
platforms for the build output, such as `linux/amd64` and `linux/arm64`:
@y
ビルドを実行する際に `--platform` フラグを用いれば、ビルド出力を行うターゲットプラットフォーム、たとえば `linux/amd64` や `linux/arm64` などを指定することができます。
@z

% snip command...

@x
By default, Docker can build for only one platform at a time.
To build for multiple platforms concurrently, you can:
@y
デフォルトで Docker は一度に一つのプラットフォームのみをビルドします。
マルチプラットフォーム向けに正しくビルドするには、以下を行います。
@z

@x
- **Enable the containerd image store**:
  The default image store in Docker Engine doesn't support multi-platform images.
  The containerd image store does, and lets you create multi-platform images using the default builder.
  Refer to the [containerd in Docker Desktop documentation](../../desktop/containerd.md).
@y
- **Enable the containerd image store**:
  The default image store in Docker Engine doesn't support multi-platform images.
  The containerd image store does, and lets you create multi-platform images using the default builder.
  Refer to the [containerd in Docker Desktop documentation](../../desktop/containerd.md).
@z

@x
- **Create a custom builder**:
  Initialize a [builder](../builders/_index.md) that uses the `docker-container` driver, which supports multi-platform builds.
  For more details, see the [`docker-container` driver documentation](../drivers/docker-container.md).
@y
- **Create a custom builder**:
  Initialize a [builder](../builders/_index.md) that uses the `docker-container` driver, which supports multi-platform builds.
  For more details, see the [`docker-container` driver documentation](../drivers/docker-container.md).
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
1. Using emulation, via [QEMU](#qemu) support in the Linux kernel
2. Building on a single builder backed by
   [multiple nodes of different architectures](#multiple-native-nodes).
3. Using a stage in your Dockerfile to [cross-compile](#cross-compilation) to
   different architectures
@y
1. Using emulation, via [QEMU](#qemu) support in the Linux kernel
2. Building on a single builder backed by
   [multiple nodes of different architectures](#multiple-native-nodes).
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
> Use [multiple native nodes](#multiple-native-nodes) or
> [cross-compilation](#cross-compilation) instead, if possible.
@y
> **Note**
>
> Emulation with QEMU can be much slower than native builds, especially for
> compute-heavy tasks like compilation and compression or decompression.
>
> Use [multiple native nodes](#multiple-native-nodes) or
> [cross-compilation](#cross-compilation) instead, if possible.
@z

@x
#### Support on Docker Desktop
@y
#### Support on Docker Desktop
@z

@x
[Docker Desktop](../../desktop/_index.md) provides support for running and
building multi-platform images under emulation by default, which means you can
run containers for different Linux architectures such as `arm`, `mips`,
`ppc64le`, and even `s390x`.
@y
[Docker Desktop](../../desktop/_index.md) provides support for running and
building multi-platform images under emulation by default, which means you can
run containers for different Linux architectures such as `arm`, `mips`,
`ppc64le`, and even `s390x`.
@z

@x
This doesn't require any special configuration in the container itself as it
uses QEMU bundled within the Docker Desktop VM. Because of this, you can run
containers of non-native architectures like the `arm32v7` or `ppc64le`
automatically.
@y
This doesn't require any special configuration in the container itself as it
uses QEMU bundled within the Docker Desktop VM. Because of this, you can run
containers of non-native architectures like the `arm32v7` or `ppc64le`
automatically.
@z

@x
#### QEMU without Docker Desktop
@y
#### QEMU without Docker Desktop
@z

@x
If you're running Docker Engine on Linux, without Docker Desktop, you must
install statically compiled QEMU binaries and register them with
[`binfmt_misc`](https://en.wikipedia.org/wiki/Binfmt_misc). This enables QEMU
to execute non-native file formats for emulation. The QEMU binaries must be
statically compiled and registered with the `fix_binary` flag. This requires a
kernel version 4.8 or later, and `binfmt-support` version 2.1.7 or later.
@y
If you're running Docker Engine on Linux, without Docker Desktop, you must
install statically compiled QEMU binaries and register them with
[`binfmt_misc`](https://en.wikipedia.org/wiki/Binfmt_misc). This enables QEMU
to execute non-native file formats for emulation. The QEMU binaries must be
statically compiled and registered with the `fix_binary` flag. This requires a
kernel version 4.8 or later, and `binfmt-support` version 2.1.7 or later.
@z

@x
Once QEMU is installed and the executable types are registered on the host OS,
they work transparently inside containers. You can verify your registration by
checking if `F` is among the flags in `/proc/sys/fs/binfmt_misc/qemu-*`. While
Docker Desktop comes preconfigured with `binfmt_misc` support for additional
platforms, for other installations it likely needs to be installed using
[`tonistiigi/binfmt`](https://github.com/tonistiigi/binfmt) image:
@y
Once QEMU is installed and the executable types are registered on the host OS,
they work transparently inside containers. You can verify your registration by
checking if `F` is among the flags in `/proc/sys/fs/binfmt_misc/qemu-*`. While
Docker Desktop comes preconfigured with `binfmt_misc` support for additional
platforms, for other installations it likely needs to be installed using
[`tonistiigi/binfmt`](https://github.com/tonistiigi/binfmt) image:
@z

% snip command...

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

% snip command...

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

% snip command...

@x
For more information, see [Docker Build Cloud](../cloud/_index.md).
@y
For more information, see [Docker Build Cloud](../cloud/_index.md).
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

% snip code...

@x
## Getting started
@y
## Getting started
@z

@x
Run the [`docker buildx ls` command](../../reference/cli/docker/buildx/ls.md)
to list the existing builders:
@y
Run the [`docker buildx ls` command](../../reference/cli/docker/buildx/ls.md)
to list the existing builders:
@z

% snip command...

@x
This displays the default builtin driver, that uses the BuildKit server
components built directly into the Docker Engine, also known as the [`docker` driver](../drivers/docker.md).
@y
This displays the default builtin driver, that uses the BuildKit server
components built directly into the Docker Engine, also known as the [`docker` driver](../drivers/docker.md).
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

% snip command...

@x
Now listing the existing builders again, you can see that the new builder is
registered:
@y
Now listing the existing builders again, you can see that the new builder is
registered:
@z

% snip command...

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

% snip code...

@x
Build the Dockerfile with buildx, passing the list of architectures to
build for:
@y
Build the Dockerfile with buildx, passing the list of architectures to
build for:
@z

% snip command...

@x
> **Note**
> 
> * `<username>` must be a valid Docker ID and `<image>` and valid repository on
>   Docker Hub.
> * The `--platform` flag informs buildx to create Linux images for x86 64-bit,
>   ARM 64-bit, and ARMv7 architectures.
> * The `--push` flag generates a multi-arch manifest and pushes all the images
>   to Docker Hub.
@y
> **Note**
> 
> * `<username>` must be a valid Docker ID and `<image>` and valid repository on
>   Docker Hub.
> * The `--platform` flag informs buildx to create Linux images for x86 64-bit,
>   ARM 64-bit, and ARMv7 architectures.
> * The `--push` flag generates a multi-arch manifest and pushes all the images
>   to Docker Hub.
@z

@x
Inspect the image using [`docker buildx imagetools` command](../../reference/cli/docker/buildx/imagetools/_index.md):
@y
Inspect the image using [`docker buildx imagetools` command](../../reference/cli/docker/buildx/imagetools/_index.md):
@z

% snip command...

@x
The image is now available on Docker Hub with the tag `<username>/<image>:latest`.
You can use this image to run a container on Intel laptops, Amazon EC2 Graviton
instances, Raspberry Pis, and on other architectures. Docker pulls the correct
image for the current architecture, so Raspberry PIs run the 32-bit ARM version
and EC2 Graviton instances run 64-bit ARM.
@y
The image is now available on Docker Hub with the tag `<username>/<image>:latest`.
You can use this image to run a container on Intel laptops, Amazon EC2 Graviton
instances, Raspberry Pis, and on other architectures. Docker pulls the correct
image for the current architecture, so Raspberry PIs run the 32-bit ARM version
and EC2 Graviton instances run 64-bit ARM.
@z

@x
The digest identifies a fully qualified image variant. You can also run images
targeted for a different architecture on Docker Desktop. For example, when
you run the following on a macOS:
@y
The digest identifies a fully qualified image variant. You can also run images
targeted for a different architecture on Docker Desktop. For example, when
you run the following on a macOS:
@z

% snip command...
% snip command...

@x
In the previous example, `uname -m` returns `aarch64` and `armv7l` as expected,
even when running the commands on a native macOS or Windows developer machine.
@y
In the previous example, `uname -m` returns `aarch64` and `armv7l` as expected,
even when running the commands on a native macOS or Windows developer machine.
@z
