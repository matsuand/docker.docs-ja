%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Update Docker Hub description with GitHub Actions
description: How to update the repository README in Docker Hub using with GitHub Actions
keywords: ci, github actions, gha, buildkit, buildx, docker hub
---
@y
---
title: Update Docker Hub description with GitHub Actions
description: How to update the repository README in Docker Hub using with GitHub Actions
keywords: ci, github actions, gha, buildkit, buildx, docker hub
---
@z

@x
You can update the Docker Hub repository description using a third party action
called [Docker Hub Description](https://github.com/peter-evans/dockerhub-description)
with this action:
@y
You can update the Docker Hub repository description using a third party action
called [Docker Hub Description](https://github.com/peter-evans/dockerhub-description)
with this action:
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
      - name: Build and push
        uses: docker/build-push-action@v5
        with:
          context: .
          push: true
          tags: user/app:latest
@y
      - name: Build and push
        uses: docker/build-push-action@v5
        with:
          context: .
          push: true
          tags: user/app:latest
@z

@x
      - name: Update repo description
        uses: peter-evans/dockerhub-description@e98e4d1628a5f3be2be7c231e50981aee98723ae # v4.0.0
        with:
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
          repository: user/app
```
@y
      - name: Update repo description
        uses: peter-evans/dockerhub-description@e98e4d1628a5f3be2be7c231e50981aee98723ae # v4.0.0
        with:
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
          repository: user/app
```
@z
