%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Validating build configuration with GitHub Actions
linkTitle: Build checks
description: Discover how to validate your build configuration and identify best practice violations using build checks in GitHub Actions.
keywords: github actions, gha, build, checks
@y
title: Validating build configuration with GitHub Actions
linkTitle: Build checks
description: Discover how to validate your build configuration and identify best practice violations using build checks in GitHub Actions.
keywords: github actions, gha, build, checks
@z

@x
[Build checks](/manuals/build/checks.md) let you validate your `docker build`
configuration without actually running the build.
@y
[Build checks](manuals/build/checks.md) let you validate your `docker build`
configuration without actually running the build.
@z

@x
## Run checks with `docker/build-push-action`
@y
## Run checks with `docker/build-push-action`
@z

@x
To run build checks in a GitHub Actions workflow with the `build-push-action`,
set the `call` input parameter to `check`. With this set, the workflow fails if
any check warnings are detected for your build's configuration.
@y
To run build checks in a GitHub Actions workflow with the `build-push-action`,
set the `call` input parameter to `check`. With this set, the workflow fails if
any check warnings are detected for your build's configuration.
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
      - name: Login to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
@y
jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
      - name: Login to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
@z

@x
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
@y
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
@z

@x
      - name: Validate build configuration
        uses: docker/build-push-action@v6
        with:
          call: check
@y
      - name: Validate build configuration
        uses: docker/build-push-action@v6
        with:
          call: check
@z

@x
      - name: Build and push
        uses: docker/build-push-action@v6
        with:
          push: true
          tags: user/app:latest
```
@y
      - name: Build and push
        uses: docker/build-push-action@v6
        with:
          push: true
          tags: user/app:latest
```
@z

@x
## Run checks with `docker/bake-action`
@y
## Run checks with `docker/bake-action`
@z

@x
If you're using Bake and `docker/bake-action` to run your builds, you don't
need to specify any special inputs in your GitHub Actions workflow
configuration. Instead, define a Bake target that calls the `check` method,
and invoke that target in your CI.
@y
If you're using Bake and `docker/bake-action` to run your builds, you don't
need to specify any special inputs in your GitHub Actions workflow
configuration. Instead, define a Bake target that calls the `check` method,
and invoke that target in your CI.
@z

@x
```hcl
target "build" {
  dockerfile = "Dockerfile"
  args = {
    FOO = "bar"
  }
}
target "validate-build" {
  inherits = ["build"]
  call = "check"
}
```
@y
```hcl
target "build" {
  dockerfile = "Dockerfile"
  args = {
    FOO = "bar"
  }
}
target "validate-build" {
  inherits = ["build"]
  call = "check"
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
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
@y
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v3
@z

@x
      - name: Validate build configuration
        uses: docker/bake-action@v5
        with:
          targets: validate-build
@y
      - name: Validate build configuration
        uses: docker/bake-action@v5
        with:
          targets: validate-build
@z

@x
      - name: Build
        uses: docker/bake-action@v5
        with:
          targets: build
          push: true
```
@y
      - name: Build
        uses: docker/bake-action@v5
        with:
          targets: build
          push: true
```
@z
