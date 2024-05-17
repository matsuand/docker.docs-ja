%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Test before push with GitHub Actions
description: Here's how you can validate an image, before pushing it to a registry
keywords: ci, github actions, gha, buildkit, buildx, test
---
@y
---
title: Test before push with GitHub Actions
description: Here's how you can validate an image, before pushing it to a registry
keywords: ci, github actions, gha, buildkit, buildx, test
---
@z

@x
In some cases, you might want to validate that the image works as expected
before pushing it. The following workflow implements several steps to achieve
this:
@y
In some cases, you might want to validate that the image works as expected
before pushing it. The following workflow implements several steps to achieve
this:
@z

@x
1. Build and export the image to Docker
2. Test your image
3. Multi-platform build and push the image
@y
1. Build and export the image to Docker
2. Test your image
3. Multi-platform build and push the image
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
  TEST_TAG: user/app:test
  LATEST_TAG: user/app:latest
@y
env:
  TEST_TAG: user/app:test
  LATEST_TAG: user/app:latest
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
      - name: Build and export to Docker
        uses: docker/build-push-action@v5
        with:
          context: .
          load: true
          tags: ${{ env.TEST_TAG }}
@y
      - name: Build and export to Docker
        uses: docker/build-push-action@v5
        with:
          context: .
          load: true
          tags: ${{ env.TEST_TAG }}
@z

@x
      - name: Test
        run: |
          docker run --rm ${{ env.TEST_TAG }}
@y
      - name: Test
        run: |
          docker run --rm ${{ env.TEST_TAG }}
@z

@x
      - name: Build and push
        uses: docker/build-push-action@v5
        with:
          context: .
          platforms: linux/amd64,linux/arm64
          push: true
          tags: ${{ env.LATEST_TAG }}
```
@y
      - name: Build and push
        uses: docker/build-push-action@v5
        with:
          context: .
          platforms: linux/amd64,linux/arm64
          push: true
          tags: ${{ env.LATEST_TAG }}
```
@z

@x
> **Note**
>
> The `linux/amd64` image is only built once in this workflow. The image is
> built once, and the following steps use the internal cache from the first
> `Build and push` step. The second `Build and push` step only builds
> `linux/arm64`.
@y
> **Note**
>
> The `linux/amd64` image is only built once in this workflow. The image is
> built once, and the following steps use the internal cache from the first
> `Build and push` step. The second `Build and push` step only builds
> `linux/arm64`.
@z
