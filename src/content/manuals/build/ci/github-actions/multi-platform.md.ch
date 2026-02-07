%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応
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
## Distribute build across multiple runners
@y
## Distribute build across multiple runners
@z

@x
Building multiple platforms on the same runner can significantly extend build
times, particularly when dealing with complex Dockerfiles or a high number of
target platforms. By distributing platform-specific builds across multiple
runners using a matrix strategy, you can drastically reduce build durations and
streamline your CI pipeline. These examples demonstrate how to allocate each
platform build to a dedicated runner, including ARM-native runners where
applicable, and create a unified manifest list using the
[`buildx imagetools create` command](/reference/cli/docker/buildx/imagetools/create.md).
@y
Building multiple platforms on the same runner can significantly extend build
times, particularly when dealing with complex Dockerfiles or a high number of
target platforms. By distributing platform-specific builds across multiple
runners using a matrix strategy, you can drastically reduce build durations and
streamline your CI pipeline. These examples demonstrate how to allocate each
platform build to a dedicated runner, including ARM-native runners where
applicable, and create a unified manifest list using the
[`buildx imagetools create` command](reference/cli/docker/buildx/imagetools/create.md).
@z

@x
The following workflow will build the image for each platform on a dedicated
runner using a matrix strategy and push by digest. Then, the `merge` job will
create manifest lists and push them to Docker Hub. The [`metadata` action](https://github.com/docker/metadata-action)
is used to set tags and labels.
@y
The following workflow will build the image for each platform on a dedicated
runner using a matrix strategy and push by digest. Then, the `merge` job will
create manifest lists and push them to Docker Hub. The [`metadata` action](https://github.com/docker/metadata-action)
is used to set tags and labels.
@z

% snip code...

@x
### With Bake
@y
### With Bake
@z

@x
It's also possible to build on multiple runners using Bake, with the
[bake action](https://github.com/docker/bake-action).
@y
It's also possible to build on multiple runners using Bake, with the
[bake action](https://github.com/docker/bake-action).
@z

@x
You can find a live example [in this GitHub repository](https://github.com/crazy-max/docker-linguist).
@y
You can find a live example [in this GitHub repository](https://github.com/crazy-max/docker-linguist).
@z

@x
The following example achieves the same results as described in
[the previous section](#distribute-build-across-multiple-runners).
@y
The following example achieves the same results as described in
[the previous section](#distribute-build-across-multiple-runners).
@z

% snip code...
