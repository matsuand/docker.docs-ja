%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Defining additional build contexts and linking targets
description: |
  Additional contexts are useful when you want to pin image versions,
  or reference the output of other targets
keywords: build, buildx, bake, buildkit, hcl
aliases:
  - /build/customize/bake/build-contexts/
---
@y
---
title: Defining additional build contexts and linking targets
description: |
  Additional contexts are useful when you want to pin image versions,
  or reference the output of other targets
keywords: build, buildx, bake, buildkit, hcl
aliases:
  - /build/customize/bake/build-contexts/
---
@z

@x
In addition to the main `context` key that defines the build context, each
target can also define additional named contexts with a map defined with key
`contexts`. These values map to the `--build-context` flag in the [build
command](../../reference/cli/docker/buildx/build.md#build-context).
@y
In addition to the main `context` key that defines the build context, each
target can also define additional named contexts with a map defined with key
`contexts`. These values map to the `--build-context` flag in the [build
command](../../reference/cli/docker/buildx/build.md#build-context).
@z

@x
Inside the Dockerfile these contexts can be used with the `FROM` instruction or
`--from` flag.
@y
Inside the Dockerfile these contexts can be used with the `FROM` instruction or
`--from` flag.
@z

@x
Supported context values are:
@y
Supported context values are:
@z

@x
- Local filesystem directories
- Container images
- Git URLs
- HTTP URLs
- Name of another target in the Bake file
@y
- Local filesystem directories
- Container images
- Git URLs
- HTTP URLs
- Name of another target in the Bake file
@z

@x
## Pinning alpine image
@y
## Pinning alpine image
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine
RUN echo "Hello world"
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM alpine
RUN echo "Hello world"
```
@z

@x
```hcl
# docker-bake.hcl
target "app" {
  contexts = {
    alpine = "docker-image://alpine:3.13"
  }
}
```
@y
```hcl
# docker-bake.hcl
target "app" {
  contexts = {
    alpine = "docker-image://alpine:3.13"
  }
}
```
@z

@x
## Using a secondary source directory
@y
## Using a secondary source directory
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM scratch AS src
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM scratch AS src
@z

@x
FROM golang
COPY --from=src . .
```
@y
FROM golang
COPY --from=src . .
```
@z

@x
```hcl
# docker-bake.hcl
target "app" {
  contexts = {
    src = "../path/to/source"
  }
}
```
@y
```hcl
# docker-bake.hcl
target "app" {
  contexts = {
    src = "../path/to/source"
  }
}
```
@z

@x
## Using a result of one target as a base image in another target
@y
## Using a result of one target as a base image in another target
@z

@x
To use a result of one target as a build context of another, specity the target
name with `target:` prefix.
@y
To use a result of one target as a build context of another, specity the target
name with `target:` prefix.
@z

@x
```dockerfile
# syntax=docker/dockerfile:1
FROM baseapp
RUN echo "Hello world"
```
@y
```dockerfile
# syntax=docker/dockerfile:1
FROM baseapp
RUN echo "Hello world"
```
@z

@x
```hcl
# docker-bake.hcl
target "base" {
  dockerfile = "baseapp.Dockerfile"
}
@y
```hcl
# docker-bake.hcl
target "base" {
  dockerfile = "baseapp.Dockerfile"
}
@z

@x
target "app" {
  contexts = {
    baseapp = "target:base"
  }
}
```
@y
target "app" {
  contexts = {
    baseapp = "target:base"
  }
}
```
@z

@x
In most cases you should just use a single multi-stage Dockerfile with multiple
targets for similar behavior. This case is only recommended when you have
multiple Dockerfiles that can't be easily merged into one.
@y
In most cases you should just use a single multi-stage Dockerfile with multiple
targets for similar behavior. This case is only recommended when you have
multiple Dockerfiles that can't be easily merged into one.
@z
