%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Local registry with GitHub Actions
description: Create and use a local OCI registry with GitHub Actions
keywords: ci, github actions, gha, buildkit, buildx, registry
---
@y
---
title: Local registry with GitHub Actions
description: Create and use a local OCI registry with GitHub Actions
keywords: ci, github actions, gha, buildkit, buildx, registry
---
@z

@x
For testing purposes you may need to create a [local registry](https://hub.docker.com/_/registry)
to push images into:
@y
For testing purposes you may need to create a [local registry](https://hub.docker.com/_/registry)
to push images into:
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
    services:
      registry:
        image: registry:2
        ports:
          - 5000:5000
    steps:
      - name: Checkout
        uses: actions/checkout@v4
@y
jobs:
  docker:
    runs-on: ubuntu-latest
    services:
      registry:
        image: registry:2
        ports:
          - 5000:5000
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
        with:
          driver-opts: network=host
@y
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
        with:
          driver-opts: network=host
@z

@x
      - name: Build and push to local registry
        uses: docker/build-push-action@v5
        with:
          context: .
          push: true
          tags: localhost:5000/name/app:latest
@y
      - name: Build and push to local registry
        uses: docker/build-push-action@v5
        with:
          context: .
          push: true
          tags: localhost:5000/name/app:latest
@z

@x
      - name: Inspect
        run: |
          docker buildx imagetools inspect localhost:5000/name/app:latest
```
@y
      - name: Inspect
        run: |
          docker buildx imagetools inspect localhost:5000/name/app:latest
```
@z
