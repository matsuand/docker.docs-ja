%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Copy image between registries with GitHub Actions
description: Build multi-platform images and copy them between registries with GitHub Actions
keywords: ci, github actions, gha, buildkit, buildx, registry
---
@y
---
title: Copy image between registries with GitHub Actions
description: Build multi-platform images and copy them between registries with GitHub Actions
keywords: ci, github actions, gha, buildkit, buildx, registry
---
@z

@x
[Multi-platform images](../../building/multi-platform.md) built using Buildx can
be copied from one registry to another using the [`buildx imagetools create` command](../../../reference/cli/docker/buildx/imagetools/create.md):
@y
[Multi-platform images](../../building/multi-platform.md) built using Buildx can
be copied from one registry to another using the [`buildx imagetools create` command](../../../reference/cli/docker/buildx/imagetools/create.md):
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
      - name: Login to GitHub Container Registry
        uses: docker/login-action@v3
        with:
          registry: ghcr.io
          username: ${{ github.repository_owner }}
          password: ${{ secrets.GITHUB_TOKEN }}
@y
      - name: Login to GitHub Container Registry
        uses: docker/login-action@v3
        with:
          registry: ghcr.io
          username: ${{ github.repository_owner }}
          password: ${{ secrets.GITHUB_TOKEN }}
@z

@x
      - name: Build and push
        uses: docker/build-push-action@v5
        with:
          context: .
          platforms: linux/amd64,linux/arm64
          push: true
          tags: |
            user/app:latest
            user/app:1.0.0
@y
      - name: Build and push
        uses: docker/build-push-action@v5
        with:
          context: .
          platforms: linux/amd64,linux/arm64
          push: true
          tags: |
            user/app:latest
            user/app:1.0.0
@z

@x
      - name: Push image to GHCR
        run: |
          docker buildx imagetools create \
            --tag ghcr.io/user/app:latest \
            --tag ghcr.io/user/app:1.0.0 \
            user/app:latest
```
@y
      - name: Push image to GHCR
        run: |
          docker buildx imagetools create \
            --tag ghcr.io/user/app:latest \
            --tag ghcr.io/user/app:1.0.0 \
            user/app:latest
```
@z
