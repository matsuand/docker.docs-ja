%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Share built image between jobs with GitHub Actions
description: Share an image between runners without pushing to a registry
keywords: ci, github actions, gha, buildkit, buildx
---
@y
---
title: Share built image between jobs with GitHub Actions
description: Share an image between runners without pushing to a registry
keywords: ci, github actions, gha, buildkit, buildx
---
@z

@x
As each job is isolated in its own runner, you can't use your built image
between jobs, except if you're using [self-hosted runners](https://docs.github.com/en/actions/hosting-your-own-runners/about-self-hosted-runners)
However, you can [pass data between jobs](https://docs.github.com/en/actions/using-workflows/storing-workflow-data-as-artifacts#passing-data-between-jobs-in-a-workflow)
in a workflow using the [actions/upload-artifact](https://github.com/actions/upload-artifact)
and [actions/download-artifact](https://github.com/actions/download-artifact)
actions:
@y
As each job is isolated in its own runner, you can't use your built image
between jobs, except if you're using [self-hosted runners](https://docs.github.com/en/actions/hosting-your-own-runners/about-self-hosted-runners)
However, you can [pass data between jobs](https://docs.github.com/en/actions/using-workflows/storing-workflow-data-as-artifacts#passing-data-between-jobs-in-a-workflow)
in a workflow using the [actions/upload-artifact](https://github.com/actions/upload-artifact)
and [actions/download-artifact](https://github.com/actions/download-artifact)
actions:
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
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
@y
jobs:
  build:
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
      - name: Build and export
        uses: docker/build-push-action@v5
        with:
          context: .
          tags: myimage:latest
          outputs: type=docker,dest=/tmp/myimage.tar
@y
      - name: Build and export
        uses: docker/build-push-action@v5
        with:
          context: .
          tags: myimage:latest
          outputs: type=docker,dest=/tmp/myimage.tar
@z

@x
      - name: Upload artifact
        uses: actions/upload-artifact@v4
        with:
          name: myimage
          path: /tmp/myimage.tar
@y
      - name: Upload artifact
        uses: actions/upload-artifact@v4
        with:
          name: myimage
          path: /tmp/myimage.tar
@z

@x
  use:
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Download artifact
        uses: actions/download-artifact@v4
        with:
          name: myimage
          path: /tmp
@y
  use:
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Download artifact
        uses: actions/download-artifact@v4
        with:
          name: myimage
          path: /tmp
@z

@x
      - name: Load image
        run: |
          docker load --input /tmp/myimage.tar
          docker image ls -a
```
@y
      - name: Load image
        run: |
          docker load --input /tmp/myimage.tar
          docker image ls -a
```
@z
