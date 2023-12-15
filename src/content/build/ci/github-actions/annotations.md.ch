%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Add image annotations with GitHub Actions
description: Add OCI annotations to image components using GitHub Actions
keywords: ci, github actions, gha, buildkit, buildx, annotations, oci
---
@y
---
title: Add image annotations with GitHub Actions
description: Add OCI annotations to image components using GitHub Actions
keywords: ci, github actions, gha, buildkit, buildx, annotations, oci
---
@z

@x
Annotations let you specify arbitrary metadata for OCI image components, such
as manifests, indexes, and descriptors.
@y
Annotations let you specify arbitrary metadata for OCI image components, such
as manifests, indexes, and descriptors.
@z

@x
To add annotations when building images with GitHub Actions, use the
[metadata-action] to automatically create OCI-compliant annotations. The
metadata action creates an `annotations` output that you can reference, both
with [build-push-action] and [bake-action].
@y
To add annotations when building images with GitHub Actions, use the
[metadata-action] to automatically create OCI-compliant annotations. The
metadata action creates an `annotations` output that you can reference, both
with [build-push-action] and [bake-action].
@z

@x
[metadata-action]: https://github.com/docker/metadata-action#overwrite-labels-and-annotations
[build-push-action]: https://github.com/docker/build-push-action/
[bake-action]: https://github.com/docker/bake-action/
@y
[metadata-action]: https://github.com/docker/metadata-action#overwrite-labels-and-annotations
[build-push-action]: https://github.com/docker/build-push-action/
[bake-action]: https://github.com/docker/bake-action/
@z

@x
{{< tabs >}}
{{< tab name="build-push-action" >}}
@y
{{< tabs >}}
{{< tab name="build-push-action" >}}
@z

@x
```yaml {hl_lines=37}
name: ci
@y
```yaml {hl_lines=37}
name: ci
@z

@x
on:
  push:
    branches:
      - "main"
@y
on:
  push:
    branches:
      - "main"
@z

@x
env:
  IMAGE_NAME: user/app
@y
env:
  IMAGE_NAME: user/app
@z

@x
jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
@y
jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
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
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
@y
      - name: Login to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
@z

@x
      - name: Extract metadata
        id: meta
        uses: docker/metadata-action@v4
        with:
          images: ${{ env.IMAGE_NAME }}
@y
      - name: Extract metadata
        id: meta
        uses: docker/metadata-action@v4
        with:
          images: ${{ env.IMAGE_NAME }}
@z

@x
      - name: Build and push
        uses: docker/build-push-action@v5
        with:
          tags: ${{ steps.meta.outputs.tags }}
          annotations: ${{ steps.meta.outputs.annotations }}
          push: true
```
@y
      - name: Build and push
        uses: docker/build-push-action@v5
        with:
          tags: ${{ steps.meta.outputs.tags }}
          annotations: ${{ steps.meta.outputs.annotations }}
          push: true
```
@z

@x
{{< /tab >}}
{{< tab name="bake-action" >}}
@y
{{< /tab >}}
{{< tab name="bake-action" >}}
@z

@x
```yaml {hl_lines=39}
name: ci
@y
```yaml {hl_lines=39}
name: ci
@z

@x
on:
  push:
    branches:
      - "main"
@y
on:
  push:
    branches:
      - "main"
@z

@x
env:
  IMAGE_NAME: user/app
@y
env:
  IMAGE_NAME: user/app
@z

@x
jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
@y
jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
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
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
@y
      - name: Login to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
@z

@x
      - name: Extract metadata
        id: meta
        uses: docker/metadata-action@v4
        with:
          images: ${{ env.IMAGE_NAME }}
@y
      - name: Extract metadata
        id: meta
        uses: docker/metadata-action@v4
        with:
          images: ${{ env.IMAGE_NAME }}
@z

@x
      - name: Build
        uses: docker/bake-action@v3
        with:
          files: |
            ./docker-bake.hcl
            ${{ steps.meta.outputs.bake-file-tags }}
            ${{ steps.meta.outputs.bake-file-annotations }}
          push: true
```
@y
      - name: Build
        uses: docker/bake-action@v3
        with:
          files: |
            ./docker-bake.hcl
            ${{ steps.meta.outputs.bake-file-tags }}
            ${{ steps.meta.outputs.bake-file-annotations }}
          push: true
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
## Configure annotation level
@y
## Configure annotation level
@z

@x
By default, annotations are placed on image manifests. To configure the
[annotation level](../../building/annotations.md#specify-annotation-level), set
the `DOCKER_METADATA_ANNOTATIONS_LEVELS` environment variable on the
`metadata-action` step to a comma-separated list of all the levels that you
want to annotate. For example, setting `DOCKER_METADATA_ANNOTATIONS_LEVELS` to
`index` results in annotations on the image index instead of the manifests.
@y
By default, annotations are placed on image manifests. To configure the
[annotation level](../../building/annotations.md#specify-annotation-level), set
the `DOCKER_METADATA_ANNOTATIONS_LEVELS` environment variable on the
`metadata-action` step to a comma-separated list of all the levels that you
want to annotate. For example, setting `DOCKER_METADATA_ANNOTATIONS_LEVELS` to
`index` results in annotations on the image index instead of the manifests.
@z

@x
The following example creates annotations on both the image index and
manifests.
@y
The following example creates annotations on both the image index and
manifests.
@z

@x
```yaml {hl_lines=33}
name: ci
@y
```yaml {hl_lines=33}
name: ci
@z

@x
on:
  push:
    branches:
      - "main"
@y
on:
  push:
    branches:
      - "main"
@z

@x
env:
  IMAGE_NAME: user/app
@y
env:
  IMAGE_NAME: user/app
@z

@x
jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
@y
jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
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
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
@y
      - name: Login to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
@z

@x
      - name: Extract metadata
        id: meta
        uses: docker/metadata-action@v4
        with:
          images: ${{ env.IMAGE_NAME }}
        env:
          DOCKER_METADATA_ANNOTATIONS_LEVELS: manifest,index
@y
      - name: Extract metadata
        id: meta
        uses: docker/metadata-action@v4
        with:
          images: ${{ env.IMAGE_NAME }}
        env:
          DOCKER_METADATA_ANNOTATIONS_LEVELS: manifest,index
@z

@x
      - name: Build and push
        uses: docker/build-push-action@v5
        with:
          tags: ${{ steps.meta.outputs.tags }}
          annotations: ${{ steps.meta.outputs.annotations }}
          push: true
```
@y
      - name: Build and push
        uses: docker/build-push-action@v5
        with:
          tags: ${{ steps.meta.outputs.tags }}
          annotations: ${{ steps.meta.outputs.annotations }}
          push: true
```
@z
