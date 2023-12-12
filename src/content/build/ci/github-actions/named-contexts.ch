%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Named contexts with GitHub Actions
description: Use additional contexts in multi-stage builds with GitHub Actions
keywords: ci, github actions, gha, buildkit, buildx, context
---
@y
---
title: Named contexts with GitHub Actions
description: Use additional contexts in multi-stage builds with GitHub Actions
keywords: ci, github actions, gha, buildkit, buildx, context
---
@z

@x
You can define [additional build contexts](../../../engine/reference/commandline/buildx_build.md#build-context),
and access them in your Dockerfile with `FROM name` or `--from=name`. When
Dockerfile defines a stage with the same name it's overwritten.
@y
You can define [additional build contexts](../../../engine/reference/commandline/buildx_build.md#build-context),
and access them in your Dockerfile with `FROM name` or `--from=name`. When
Dockerfile defines a stage with the same name it's overwritten.
@z

@x
This can be useful with GitHub Actions to reuse results from other builds or pin
an image to a specific tag in your workflow.
@y
This can be useful with GitHub Actions to reuse results from other builds or pin
an image to a specific tag in your workflow.
@z

@x
## Pin image to a tag
@y
## Pin image to a tag
@z

@x
Replace `alpine:latest` with a pinned one:
@y
Replace `alpine:latest` with a pinned one:
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine
RUN echo "Hello World"
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine
RUN echo "Hello World"
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
          build-contexts: |
            alpine=docker-image://alpine:3.16
          tags: myimage:latest
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
          build-contexts: |
            alpine=docker-image://alpine:3.16
          tags: myimage:latest
```
@z

@x
## Use image in subsequent steps
@y
## Use image in subsequent steps
@z

@x
By default, the [Docker Setup Buildx](https://github.com/marketplace/actions/docker-setup-buildx)
action uses `docker-container` as a build driver, so built Docker images aren't
loaded automatically.
@y
By default, the [Docker Setup Buildx](https://github.com/marketplace/actions/docker-setup-buildx)
action uses `docker-container` as a build driver, so built Docker images aren't
loaded automatically.
@z

@x
With named contexts you can reuse the built image:
@y
With named contexts you can reuse the built image:
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine
RUN echo "Hello World"
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine
RUN echo "Hello World"
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
        with:
          driver: docker
      - name: Build base image
        uses: docker/build-push-action@v5
        with:
          context: ./base
          file: ./base/Dockerfile
          load: true
          tags: my-base-image:latest
      - name: Build
        uses: docker/build-push-action@v5
        with:
          context: .
          build-contexts: |
            alpine=docker-image://my-base-image:latest
          tags: myimage:latest
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
        with:
          driver: docker
      - name: Build base image
        uses: docker/build-push-action@v5
        with:
          context: ./base
          file: ./base/Dockerfile
          load: true
          tags: my-base-image:latest
      - name: Build
        uses: docker/build-push-action@v5
        with:
          context: .
          build-contexts: |
            alpine=docker-image://my-base-image:latest
          tags: myimage:latest
```
@z

@x
## Using with a container builder
@y
## Using with a container builder
@z

@x
As shown in the previous section we are not using the default
[`docker-container` driver](../../drivers/docker-container.md) for building with
named contexts. That's because this driver can't load an image from the Docker
store as it's isolated. To solve this problem you can use a [local registry](local-registry.md)
to push your base image in your workflow:
@y
As shown in the previous section we are not using the default
[`docker-container` driver](../../drivers/docker-container.md) for building with
named contexts. That's because this driver can't load an image from the Docker
store as it's isolated. To solve this problem you can use a [local registry](local-registry.md)
to push your base image in your workflow:
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine
RUN echo "Hello World"
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine
RUN echo "Hello World"
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
    services:
      registry:
        image: registry:2
        ports:
          - 5000:5000
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      - name: Set up QEMU
        uses: docker/setup-qemu-action@v3
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
        with:
          # network=host driver-opt needed to push to local registry
          driver-opts: network=host
      - name: Build base image
        uses: docker/build-push-action@v5
        with:
          context: ./base
          file: ./base/Dockerfile
          tags: localhost:5000/my-base-image:latest
          push: true
      - name: Build
        uses: docker/build-push-action@v5
        with:
          context: .
          build-contexts: |
            alpine=docker-image://localhost:5000/my-base-image:latest
          tags: myimage:latest
```
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
      - name: Set up QEMU
        uses: docker/setup-qemu-action@v3
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
        with:
          # network=host driver-opt needed to push to local registry
          driver-opts: network=host
      - name: Build base image
        uses: docker/build-push-action@v5
        with:
          context: ./base
          file: ./base/Dockerfile
          tags: localhost:5000/my-base-image:latest
          push: true
      - name: Build
        uses: docker/build-push-action@v5
        with:
          context: .
          build-contexts: |
            alpine=docker-image://localhost:5000/my-base-image:latest
          tags: myimage:latest
```
@z
