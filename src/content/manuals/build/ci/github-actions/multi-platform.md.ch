%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
title: Multi-platform image with GitHub Actions
linkTitle: Multi-platform image
description: Build for multiple architectures with GitHub Actions using QEMU emulation or multiple native builders
keywords: ci, github actions, gha, buildkit, buildx, multi-platform
@y
title: Multi-platform image with GitHub Actions
linkTitle: Multi-platform image
description: Build for multiple architectures with GitHub Actions using QEMU emulation or multiple native builders
keywords: ci, github actions, gha, buildkit, buildx, multi-platform
@z

@x
You can build [multi-platform images](../../building/multi-platform.md) using
the `platforms` option, as shown in the following example:
@y
You can build [multi-platform images](../../building/multi-platform.md) using
the `platforms` option, as shown in the following example:
@z

@x
> [!NOTE]
>
> - For a list of available platforms, see the [Docker Setup Buildx](https://github.com/marketplace/actions/docker-setup-buildx)
>   action.
> - If you want support for more platforms, you can use QEMU with the [Docker Setup QEMU](https://github.com/docker/setup-qemu-action)
>   action.
@y
> [!NOTE]
>
> - For a list of available platforms, see the [Docker Setup Buildx](https://github.com/marketplace/actions/docker-setup-buildx)
>   action.
> - If you want support for more platforms, you can use QEMU with the [Docker Setup QEMU](https://github.com/docker/setup-qemu-action)
>   action.
@z

% snip code...

@x
## Build and load multi-platform images
@y
## Build and load multi-platform images
@z

@x
The default Docker setup for GitHub Actions runners does not support loading
multi-platform images to the local image store of the runner after building
them. To load a multi-platform image, you need to enable the containerd image
store option for the Docker Engine.
@y
The default Docker setup for GitHub Actions runners does not support loading
multi-platform images to the local image store of the runner after building
them. To load a multi-platform image, you need to enable the containerd image
store option for the Docker Engine.
@z

@x
There is no way to configure the default Docker setup in the GitHub Actions
runners directly, but you can use `docker/setup-docker-action` to customize the
Docker Engine and CLI settings for a job.
@y
There is no way to configure the default Docker setup in the GitHub Actions
runners directly, but you can use `docker/setup-docker-action` to customize the
Docker Engine and CLI settings for a job.
@z

@x
The following example workflow enables the containerd image store, builds a
multi-platform image, and loads the results into the GitHub runner's local
image store.
@y
The following example workflow enables the containerd image store, builds a
multi-platform image, and loads the results into the GitHub runner's local
image store.
@z

% snip code...

@x
## Distribute build across multiple runners
@y
## Distribute build across multiple runners
@z

@x
Building multiple platforms on the same runner can significantly extend build
times, particularly when dealing with complex Dockerfiles or a high number of
target platforms. If you want to split platform builds across multiple runners
without maintaining a custom matrix and merge job, use the
[Docker GitHub Builder](github-builder/_index.md). The reusable workflows
compute the per-platform matrix, run each platform on its own runner, and
create the final manifest for you.
@y
Building multiple platforms on the same runner can significantly extend build
times, particularly when dealing with complex Dockerfiles or a high number of
target platforms. If you want to split platform builds across multiple runners
without maintaining a custom matrix and merge job, use the
[Docker GitHub Builder](github-builder/_index.md). The reusable workflows
compute the per-platform matrix, run each platform on its own runner, and
create the final manifest for you.
@z

@x
The following workflow uses the [`build.yml` reusable workflow](github-builder/build.md)
to distribute a multi-platform Dockerfile build:
@y
The following workflow uses the [`build.yml` reusable workflow](github-builder/build.md)
to distribute a multi-platform Dockerfile build:
@z

% snip code...

@x
With `runner: auto` and `distribute: true`, which are the defaults, the
workflow splits the build into one platform per runner and assembles the final
multi-platform image in its finalize phase. If you need to control the Docker
build inputs directly, see [Build with Docker GitHub Builder build.yml](github-builder/build.md).
@y
With `runner: auto` and `distribute: true`, which are the defaults, the
workflow splits the build into one platform per runner and assembles the final
multi-platform image in its finalize phase. If you need to control the Docker
build inputs directly, see [Build with Docker GitHub Builder build.yml](github-builder/build.md).
@z

@x
### With Bake
@y
### With Bake
@z

@x
You can use the [`bake.yml` reusable workflow](github-builder/bake.md) for the
same pattern when your build is defined in a Bake file. The workflow reads the
target platforms from the Bake definition, distributes the per-platform builds,
and publishes the final manifest without a separate prepare or merge job.
@y
You can use the [`bake.yml` reusable workflow](github-builder/bake.md) for the
same pattern when your build is defined in a Bake file. The workflow reads the
target platforms from the Bake definition, distributes the per-platform builds,
and publishes the final manifest without a separate prepare or merge job.
@z

@x within code
// Special target: https://github.com/docker/metadata-action#bake-definition
@y
// Special target: https://github.com/docker/metadata-action#bake-definition
@z
@x
// Default target if none specified
@y
// Default target if none specified
@z

% snip code...
