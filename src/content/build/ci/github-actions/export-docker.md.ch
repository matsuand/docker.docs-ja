%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Export to Docker with GitHub Actions
description: Load the build results to the image store with GitHub Actions
keywords: ci, github actions, gha, buildkit, buildx, docker, export, load
---
@y
---
title: Export to Docker with GitHub Actions
description: Load the build results to the image store with GitHub Actions
keywords: ci, github actions, gha, buildkit, buildx, docker, export, load
---
@z

@x
You may want your build result to be available in the Docker client through
`docker images` to be able to use it in another step of your workflow:
@y
You may want your build result to be available in the Docker client through
`docker images` to be able to use it in another step of your workflow:
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
    branches:
      - "main"
@y
on:
  push:
    branches:
      - "main"
@z

@x
jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
      - name: Build
        uses: docker/build-push-action@v5
        with:
          context: .
          load: true
          tags: myimage:latest
      - name: Inspect
        run: |
          docker image inspect myimage:latest
```
@y
jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
      - name: Build
        uses: docker/build-push-action@v5
        with:
          context: .
          load: true
          tags: myimage:latest
      - name: Inspect
        run: |
          docker image inspect myimage:latest
```
@z
