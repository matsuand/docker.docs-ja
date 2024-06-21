%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Multi-platform image with GitHub Actions
description: Build for multiple architectures with GitHub Actions using QEMU emulation or multiple native builders
keywords: ci, github actions, gha, buildkit, buildx, multi-platform
---
@y
---
title: Multi-platform image with GitHub Actions
description: Build for multiple architectures with GitHub Actions using QEMU emulation or multiple native builders
keywords: ci, github actions, gha, buildkit, buildx, multi-platform
---
@z

@x
You can build [multi-platform images](../../building/multi-platform.md) using
the `platforms` option, as shown in the following example:
@y
You can build [multi-platform images](../../building/multi-platform.md) using
the `platforms` option, as shown in the following example:
@z

@x
> **Note**
>
> - For a list of available platforms, see the [Docker Setup Buildx](https://github.com/marketplace/actions/docker-setup-buildx)
>   action.
> - If you want support for more platforms, you can use QEMU with the [Docker Setup QEMU](https://github.com/docker/setup-qemu-action)
>   action.
@y
> **Note**
>
> - For a list of available platforms, see the [Docker Setup Buildx](https://github.com/marketplace/actions/docker-setup-buildx)
>   action.
> - If you want support for more platforms, you can use QEMU with the [Docker Setup QEMU](https://github.com/docker/setup-qemu-action)
>   action.
@z

@x
```yaml
name: ci
@y
```yaml
name: ci
@z

@x
on:
  push:
@y
on:
  push:
@z

@x
jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
      - name: Set up QEMU
        uses: docker/setup-qemu-action@v3
@y
jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
      - name: Set up QEMU
        uses: docker/setup-qemu-action@v3
@z

@x
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
@y
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
@z

@x
      - name: Login to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ vars.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
@y
      - name: Login to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ vars.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
@z

@x
      - name: Build and push
        uses: docker/build-push-action@v6
        with:
          platforms: linux/amd64,linux/arm64
          push: true
          tags: user/app:latest
```
@y
      - name: Build and push
        uses: docker/build-push-action@v6
        with:
          platforms: linux/amd64,linux/arm64
          push: true
          tags: user/app:latest
```
@z

@x
## Distribute build across multiple runners
@y
## Distribute build across multiple runners
@z

@x
In the previous example, each platform is built on the same runner which can
take a long time depending on the number of platforms and your Dockerfile.
@y
In the previous example, each platform is built on the same runner which can
take a long time depending on the number of platforms and your Dockerfile.
@z

@x
To solve this issue you can use a matrix strategy to distribute the build for
each platform across multiple runners and create manifest list using the
[`buildx imagetools create` command](../../../reference/cli/docker/buildx/imagetools/create.md).
@y
To solve this issue you can use a matrix strategy to distribute the build for
each platform across multiple runners and create manifest list using the
[`buildx imagetools create` command](../../../reference/cli/docker/buildx/imagetools/create.md).
@z

@x
The following workflow will build the image for each platform on a dedicated
runner using a matrix strategy and push by digest. Then, the `merge` job will
create a manifest list and push it to Docker Hub.
@y
The following workflow will build the image for each platform on a dedicated
runner using a matrix strategy and push by digest. Then, the `merge` job will
create a manifest list and push it to Docker Hub.
@z

@x
This example also uses the [`metadata` action](https://github.com/docker/metadata-action)
to set tags and labels.
@y
This example also uses the [`metadata` action](https://github.com/docker/metadata-action)
to set tags and labels.
@z

@x
```yaml
name: ci
@y
```yaml
name: ci
@z

@x
on:
  push:
@y
on:
  push:
@z

@x
env:
  REGISTRY_IMAGE: user/app
@y
env:
  REGISTRY_IMAGE: user/app
@z

@x
jobs:
  build:
    runs-on: ubuntu-latest
    strategy:
      fail-fast: false
      matrix:
        platform:
          - linux/amd64
          - linux/arm/v6
          - linux/arm/v7
          - linux/arm64
    steps:
      - name: Prepare
        run: |
          platform=${{ matrix.platform }}
          echo "PLATFORM_PAIR=${platform//\//-}" >> $GITHUB_ENV
@y
jobs:
  build:
    runs-on: ubuntu-latest
    strategy:
      fail-fast: false
      matrix:
        platform:
          - linux/amd64
          - linux/arm/v6
          - linux/arm/v7
          - linux/arm64
    steps:
      - name: Prepare
        run: |
          platform=${{ matrix.platform }}
          echo "PLATFORM_PAIR=${platform//\//-}" >> $GITHUB_ENV
@z

@x
      - name: Docker meta
        id: meta
        uses: docker/metadata-action@v5
        with:
          images: ${{ env.REGISTRY_IMAGE }}
@y
      - name: Docker meta
        id: meta
        uses: docker/metadata-action@v5
        with:
          images: ${{ env.REGISTRY_IMAGE }}
@z

@x
      - name: Set up QEMU
        uses: docker/setup-qemu-action@v3
@y
      - name: Set up QEMU
        uses: docker/setup-qemu-action@v3
@z

@x
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
@y
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
@z

@x
      - name: Login to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ vars.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
@y
      - name: Login to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ vars.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
@z

@x
      - name: Build and push by digest
        id: build
        uses: docker/build-push-action@v6
        with:
          platforms: ${{ matrix.platform }}
          labels: ${{ steps.meta.outputs.labels }}
          outputs: type=image,name=${{ env.REGISTRY_IMAGE }},push-by-digest=true,name-canonical=true,push=true
@y
      - name: Build and push by digest
        id: build
        uses: docker/build-push-action@v6
        with:
          platforms: ${{ matrix.platform }}
          labels: ${{ steps.meta.outputs.labels }}
          outputs: type=image,name=${{ env.REGISTRY_IMAGE }},push-by-digest=true,name-canonical=true,push=true
@z

@x
      - name: Export digest
        run: |
          mkdir -p /tmp/digests
          digest="${{ steps.build.outputs.digest }}"
          touch "/tmp/digests/${digest#sha256:}"
@y
      - name: Export digest
        run: |
          mkdir -p /tmp/digests
          digest="${{ steps.build.outputs.digest }}"
          touch "/tmp/digests/${digest#sha256:}"
@z

@x
      - name: Upload digest
        uses: actions/upload-artifact@v4
        with:
          name: digests-${{ env.PLATFORM_PAIR }}
          path: /tmp/digests/*
          if-no-files-found: error
          retention-days: 1
@y
      - name: Upload digest
        uses: actions/upload-artifact@v4
        with:
          name: digests-${{ env.PLATFORM_PAIR }}
          path: /tmp/digests/*
          if-no-files-found: error
          retention-days: 1
@z

@x
  merge:
    runs-on: ubuntu-latest
    needs:
      - build
    steps:
      - name: Download digests
        uses: actions/download-artifact@v4
        with:
          path: /tmp/digests
          pattern: digests-*
          merge-multiple: true
@y
  merge:
    runs-on: ubuntu-latest
    needs:
      - build
    steps:
      - name: Download digests
        uses: actions/download-artifact@v4
        with:
          path: /tmp/digests
          pattern: digests-*
          merge-multiple: true
@z

@x
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
@y
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
@z

@x
      - name: Docker meta
        id: meta
        uses: docker/metadata-action@v5
        with:
          images: ${{ env.REGISTRY_IMAGE }}
@y
      - name: Docker meta
        id: meta
        uses: docker/metadata-action@v5
        with:
          images: ${{ env.REGISTRY_IMAGE }}
@z

@x
      - name: Login to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ vars.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
@y
      - name: Login to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ vars.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
@z

@x
      - name: Create manifest list and push
        working-directory: /tmp/digests
        run: |
          docker buildx imagetools create $(jq -cr '.tags | map("-t " + .) | join(" ")' <<< "$DOCKER_METADATA_OUTPUT_JSON") \
            $(printf '${{ env.REGISTRY_IMAGE }}@sha256:%s ' *)
@y
      - name: Create manifest list and push
        working-directory: /tmp/digests
        run: |
          docker buildx imagetools create $(jq -cr '.tags | map("-t " + .) | join(" ")' <<< "$DOCKER_METADATA_OUTPUT_JSON") \
            $(printf '${{ env.REGISTRY_IMAGE }}@sha256:%s ' *)
@z

@x
      - name: Inspect image
        run: |
          docker buildx imagetools inspect ${{ env.REGISTRY_IMAGE }}:${{ steps.meta.outputs.version }}
```
@y
      - name: Inspect image
        run: |
          docker buildx imagetools inspect ${{ env.REGISTRY_IMAGE }}:${{ steps.meta.outputs.version }}
```
@z

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

@x
```hcl
variable "DEFAULT_TAG" {
  default = "app:local"
}
@y
```hcl
variable "DEFAULT_TAG" {
  default = "app:local"
}
@z

@x
// Special target: https://github.com/docker/metadata-action#bake-definition
target "docker-metadata-action" {
  tags = ["${DEFAULT_TAG}"]
}
@y
// Special target: https://github.com/docker/metadata-action#bake-definition
target "docker-metadata-action" {
  tags = ["${DEFAULT_TAG}"]
}
@z

@x
// Default target if none specified
group "default" {
  targets = ["image-local"]
}
@y
// Default target if none specified
group "default" {
  targets = ["image-local"]
}
@z

@x
target "image" {
  inherits = ["docker-metadata-action"]
}
@y
target "image" {
  inherits = ["docker-metadata-action"]
}
@z

@x
target "image-local" {
  inherits = ["image"]
  output = ["type=docker"]
}
@y
target "image-local" {
  inherits = ["image"]
  output = ["type=docker"]
}
@z

@x
target "image-all" {
  inherits = ["image"]
  platforms = [
    "linux/amd64",
    "linux/arm/v6",
    "linux/arm/v7",
    "linux/arm64"
  ]
}
```
@y
target "image-all" {
  inherits = ["image"]
  platforms = [
    "linux/amd64",
    "linux/arm/v6",
    "linux/arm/v7",
    "linux/arm64"
  ]
}
```
@z

@x
```yaml
name: ci
@y
```yaml
name: ci
@z

@x
on:
  push:
@y
on:
  push:
@z

@x
env:
  REGISTRY_IMAGE: user/app
@y
env:
  REGISTRY_IMAGE: user/app
@z

@x
jobs:
  prepare:
    runs-on: ubuntu-latest
    outputs:
      matrix: ${{ steps.platforms.outputs.matrix }}
    steps:
      - name: Checkout
        uses: actions/checkout@v4
@y
jobs:
  prepare:
    runs-on: ubuntu-latest
    outputs:
      matrix: ${{ steps.platforms.outputs.matrix }}
    steps:
      - name: Checkout
        uses: actions/checkout@v4
@z

@x
      - name: Create matrix
        id: platforms
        run: |
          echo "matrix=$(docker buildx bake image-all --print | jq -cr '.target."image-all".platforms')" >>${GITHUB_OUTPUT}
@y
      - name: Create matrix
        id: platforms
        run: |
          echo "matrix=$(docker buildx bake image-all --print | jq -cr '.target."image-all".platforms')" >>${GITHUB_OUTPUT}
@z

@x
      - name: Show matrix
        run: |
          echo ${{ steps.platforms.outputs.matrix }}
@y
      - name: Show matrix
        run: |
          echo ${{ steps.platforms.outputs.matrix }}
@z

@x
      - name: Docker meta
        id: meta
        uses: docker/metadata-action@v5
        with:
          images: ${{ env.REGISTRY_IMAGE }}
@y
      - name: Docker meta
        id: meta
        uses: docker/metadata-action@v5
        with:
          images: ${{ env.REGISTRY_IMAGE }}
@z

@x
      - name: Rename meta bake definition file
        run: |
          mv "${{ steps.meta.outputs.bake-file }}" "/tmp/bake-meta.json"
@y
      - name: Rename meta bake definition file
        run: |
          mv "${{ steps.meta.outputs.bake-file }}" "/tmp/bake-meta.json"
@z

@x
      - name: Upload meta bake definition
        uses: actions/upload-artifact@v4
        with:
          name: bake-meta
          path: /tmp/bake-meta.json
          if-no-files-found: error
          retention-days: 1
@y
      - name: Upload meta bake definition
        uses: actions/upload-artifact@v4
        with:
          name: bake-meta
          path: /tmp/bake-meta.json
          if-no-files-found: error
          retention-days: 1
@z

@x
  build:
    runs-on: ubuntu-latest
    needs:
      - prepare
    strategy:
      fail-fast: false
      matrix:
        platform: ${{ fromJson(needs.prepare.outputs.matrix) }}
    steps:
      - name: Prepare
        run: |
          platform=${{ matrix.platform }}
          echo "PLATFORM_PAIR=${platform//\//-}" >> $GITHUB_ENV
@y
  build:
    runs-on: ubuntu-latest
    needs:
      - prepare
    strategy:
      fail-fast: false
      matrix:
        platform: ${{ fromJson(needs.prepare.outputs.matrix) }}
    steps:
      - name: Prepare
        run: |
          platform=${{ matrix.platform }}
          echo "PLATFORM_PAIR=${platform//\//-}" >> $GITHUB_ENV
@z

@x
      - name: Checkout
        uses: actions/checkout@v4
@y
      - name: Checkout
        uses: actions/checkout@v4
@z

@x
      - name: Download meta bake definition
        uses: actions/download-artifact@v4
        with:
          name: bake-meta
          path: /tmp
@y
      - name: Download meta bake definition
        uses: actions/download-artifact@v4
        with:
          name: bake-meta
          path: /tmp
@z

@x
      - name: Set up QEMU
        uses: docker/setup-qemu-action@v3
@y
      - name: Set up QEMU
        uses: docker/setup-qemu-action@v3
@z

@x
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
@y
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
@z

@x
      - name: Login to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ vars.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
@y
      - name: Login to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ vars.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
@z

@x
      - name: Build
        id: bake
        uses: docker/bake-action@v5
        with:
          files: |
            ./docker-bake.hcl
            /tmp/bake-meta.json
          targets: image
          set: |
            *.tags=
            *.platform=${{ matrix.platform }}
            *.output=type=image,"name=${{ env.REGISTRY_IMAGE }}",push-by-digest=true,name-canonical=true,push=true
@y
      - name: Build
        id: bake
        uses: docker/bake-action@v5
        with:
          files: |
            ./docker-bake.hcl
            /tmp/bake-meta.json
          targets: image
          set: |
            *.tags=
            *.platform=${{ matrix.platform }}
            *.output=type=image,"name=${{ env.REGISTRY_IMAGE }}",push-by-digest=true,name-canonical=true,push=true
@z

@x
      - name: Export digest
        run: |
          mkdir -p /tmp/digests
          digest="${{ fromJSON(steps.bake.outputs.metadata).image['containerimage.digest'] }}"
          touch "/tmp/digests/${digest#sha256:}"
@y
      - name: Export digest
        run: |
          mkdir -p /tmp/digests
          digest="${{ fromJSON(steps.bake.outputs.metadata).image['containerimage.digest'] }}"
          touch "/tmp/digests/${digest#sha256:}"
@z

@x
      - name: Upload digest
        uses: actions/upload-artifact@v4
        with:
          name: digests-${{ env.PLATFORM_PAIR }}
          path: /tmp/digests/*
          if-no-files-found: error
          retention-days: 1
@y
      - name: Upload digest
        uses: actions/upload-artifact@v4
        with:
          name: digests-${{ env.PLATFORM_PAIR }}
          path: /tmp/digests/*
          if-no-files-found: error
          retention-days: 1
@z

@x
  merge:
    runs-on: ubuntu-latest
    needs:
      - build
    steps:
      - name: Download meta bake definition
        uses: actions/download-artifact@v4
        with:
          name: bake-meta
          path: /tmp
@y
  merge:
    runs-on: ubuntu-latest
    needs:
      - build
    steps:
      - name: Download meta bake definition
        uses: actions/download-artifact@v4
        with:
          name: bake-meta
          path: /tmp
@z

@x
      - name: Download digests
        uses: actions/download-artifact@v4
        with:
          path: /tmp/digests
          pattern: digests-*
          merge-multiple: true
@y
      - name: Download digests
        uses: actions/download-artifact@v4
        with:
          path: /tmp/digests
          pattern: digests-*
          merge-multiple: true
@z

@x
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
@y
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
@z

@x
      - name: Login to DockerHub
        uses: docker/login-action@v3
        with:
          username: ${{ vars.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
@y
      - name: Login to DockerHub
        uses: docker/login-action@v3
        with:
          username: ${{ vars.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
@z

@x
      - name: Create manifest list and push
        working-directory: /tmp/digests
        run: |
          docker buildx imagetools create $(jq -cr '.target."docker-metadata-action".tags | map(select(startswith("${{ env.REGISTRY_IMAGE }}")) | "-t " + .) | join(" ")' /tmp/bake-meta.json) \
            $(printf '${{ env.REGISTRY_IMAGE }}@sha256:%s ' *)
@y
      - name: Create manifest list and push
        working-directory: /tmp/digests
        run: |
          docker buildx imagetools create $(jq -cr '.target."docker-metadata-action".tags | map(select(startswith("${{ env.REGISTRY_IMAGE }}")) | "-t " + .) | join(" ")' /tmp/bake-meta.json) \
            $(printf '${{ env.REGISTRY_IMAGE }}@sha256:%s ' *)
@z

@x
      - name: Inspect image
        run: |
          docker buildx imagetools inspect ${{ env.REGISTRY_IMAGE }}:$(jq -r '.target."docker-metadata-action".args.DOCKER_META_VERSION' /tmp/bake-meta.json)
```
@y
      - name: Inspect image
        run: |
          docker buildx imagetools inspect ${{ env.REGISTRY_IMAGE }}:$(jq -r '.target."docker-metadata-action".args.DOCKER_META_VERSION' /tmp/bake-meta.json)
```
@z
