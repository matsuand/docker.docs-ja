%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
title: Multi-platform image with GitHub Actions
linkTitle: Multi-platform image
description: Build multi-platform images with Docker GitHub Builder or individual actions using QEMU.
keywords: ci, github actions, gha, buildkit, buildx, multi-platform
@y
title: Multi-platform image with GitHub Actions
linkTitle: Multi-platform image
description: Build multi-platform images with Docker GitHub Builder or individual actions using QEMU.
keywords: ci, github actions, gha, buildkit, buildx, multi-platform
@z

@x
Use [Docker GitHub Builder](_index.md) to build multi-platform
images across native runners and publish a combined image manifest.
@y
Use [Docker GitHub Builder](_index.md) to build multi-platform
images across native runners and publish a combined image manifest.
@z

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
[Docker GitHub Builder](_index.md). The reusable workflows
compute the per-platform matrix, run each platform on its own runner, and
create the final manifest for you.
@y
Building multiple platforms on the same runner can significantly extend build
times, particularly when dealing with complex Dockerfiles or a high number of
target platforms. If you want to split platform builds across multiple runners
without maintaining a custom matrix and merge job, use the
[Docker GitHub Builder](_index.md). The reusable workflows
compute the per-platform matrix, run each platform on its own runner, and
create the final manifest for you.
@z

@x
The following workflow uses the [`build.yml` reusable workflow](build-workflow.md)
to distribute a multi-platform Dockerfile build:
@y
The following workflow uses the [`build.yml` reusable workflow](build-workflow.md)
to distribute a multi-platform Dockerfile build:
@z

% snip code...

@x
With `distribute: true`, which is the default, the workflow splits the build
into one platform per runner and assembles the final multi-platform image in
its finalize phase. The default `runner` mapping selects native GitHub-hosted
Linux runners for Arm and other platforms. To customize the mapping, see [runner selection](github-builder-architecture/index.md#runner-selection).
If you need to control the Docker build inputs directly, see
[Build with Docker GitHub Builder build.yml](build-workflow.md).
@y
With `distribute: true`, which is the default, the workflow splits the build
into one platform per runner and assembles the final multi-platform image in
its finalize phase. The default `runner` mapping selects native GitHub-hosted
Linux runners for Arm and other platforms. To customize the mapping, see [runner selection](github-builder-architecture/index.md#runner-selection).
If you need to control the Docker build inputs directly, see
[Build with Docker GitHub Builder build.yml](build-workflow.md).
@z

@x
### With Bake
@y
### With Bake
@z

@x
For builds defined in a Bake file, use the
[Bake reusable workflow](bake-workflow.md#build-and-push-a-bake-target).
It distributes the target's platforms and publishes the combined manifest.
@y
For builds defined in a Bake file, use the
[Bake reusable workflow](bake-workflow.md#build-and-push-a-bake-target).
It distributes the target's platforms and publishes the combined manifest.
@z

@x
## Build with individual actions and QEMU
@y
## Build with individual actions and QEMU
@z

@x
Use individual actions when you need to configure the job's Docker Engine or
run other steps alongside the build. The following example uses QEMU to build
both platforms on one runner.
@y
Use individual actions when you need to configure the job's Docker Engine or
run other steps alongside the build. The following example uses QEMU to build
both platforms on one runner.
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
The default Docker setup for GitHub Actions runners supports building and pushing multi-platform images to registries. However, it does not support loading multi-platform images to the local image store of the runner after building them. To load a multi-platform image locally, you need to enable the containerd image store option for the Docker Engine.
@y
The default Docker setup for GitHub Actions runners supports building and pushing multi-platform images to registries. However, it does not support loading multi-platform images to the local image store of the runner after building them. To load a multi-platform image locally, you need to enable the containerd image store option for the Docker Engine.
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
