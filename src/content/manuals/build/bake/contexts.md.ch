%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リン クへの (no slash) 対応

@x
title: Using Bake with additional contexts
linkTitle: Contexts
@y
title: Using Bake with additional contexts
linkTitle: Contexts
@z

@x
description: |
  Additional contexts are useful when you want to pin image versions,
  or reference the output of other targets
keywords: build, buildx, bake, buildkit, hcl
@y
description: |
  Additional contexts are useful when you want to pin image versions,
  or reference the output of other targets
keywords: build, buildx, bake, buildkit, hcl
@z

@x
In addition to the main `context` key that defines the build context, each
target can also define additional named contexts with a map defined with key
`contexts`. These values map to the `--build-context` flag in the [build
command](/reference/cli/docker/buildx/build.md#build-context).
@y
In addition to the main `context` key that defines the build context, each
target can also define additional named contexts with a map defined with key
`contexts`. These values map to the `--build-context` flag in the [build
command](reference/cli/docker/buildx/build.md#build-context).
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
## Using a target as a build context
@y
## Using a target as a build context
@z

@x
To use a result of one target as a build context of another, specify the target
name with `target:` prefix.
@y
To use a result of one target as a build context of another, specify the target
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

@x
## Deduplicate context transfer
@y
## Deduplicate context transfer
@z

@x
> [!NOTE]
>
> As of Buildx version 0.17.0 and later, Bake automatically de-duplicates
> context transfer for targets that share the same context. In addition to
> Buildx version 0.17.0, the builder must be running BuildKit version 0.16.0 or
> later, and the Dockerfile syntax must be `docker/dockerfile:1.10` or later.
>
> If you meet these requirements, you don't need to manually de-duplicate
> context transfer as described in this section.
>
> - To check your Buildx version, run `docker buildx version`.
> - To check your BuildKit version, run `docker buildx inspect --bootstrap` and
>   look for the `BuildKit version` field.
> - To check your Dockerfile syntax version, check the `syntax`
>   [parser directive](/reference/dockerfile.md#syntax) in your Dockerfile. If
>   it's not present, the default version whatever comes bundled with your
>   current version of BuildKit. To set the version explicitly, add
>   `#syntax=docker/dockerfile:1.10` at the top of your Dockerfile.
@y
> [!NOTE]
>
> As of Buildx version 0.17.0 and later, Bake automatically de-duplicates
> context transfer for targets that share the same context. In addition to
> Buildx version 0.17.0, the builder must be running BuildKit version 0.16.0 or
> later, and the Dockerfile syntax must be `docker/dockerfile:1.10` or later.
>
> If you meet these requirements, you don't need to manually de-duplicate
> context transfer as described in this section.
>
> - To check your Buildx version, run `docker buildx version`.
> - To check your BuildKit version, run `docker buildx inspect --bootstrap` and
>   look for the `BuildKit version` field.
> - To check your Dockerfile syntax version, check the `syntax`
>   [parser directive](reference/dockerfile.md#syntax) in your Dockerfile. If
>   it's not present, the default version whatever comes bundled with your
>   current version of BuildKit. To set the version explicitly, add
>   `#syntax=docker/dockerfile:1.10` at the top of your Dockerfile.
@z

@x
When you build targets concurrently, using groups, build contexts are loaded
independently for each target. If the same context is used by multiple targets
in a group, that context is transferred once for each time it's used. This can
result in significant impact on build time, depending on your build
configuration. For example, say you have a Bake file that defines the following
group of targets:
@y
When you build targets concurrently, using groups, build contexts are loaded
independently for each target. If the same context is used by multiple targets
in a group, that context is transferred once for each time it's used. This can
result in significant impact on build time, depending on your build
configuration. For example, say you have a Bake file that defines the following
group of targets:
@z

@x
```hcl
group "default" {
  targets = ["target1", "target2"]
}
@y
```hcl
group "default" {
  targets = ["target1", "target2"]
}
@z

@x
target "target1" {
  target = "target1"
  context = "."
}
@y
target "target1" {
  target = "target1"
  context = "."
}
@z

@x
target "target2" {
  target = "target2"
  context = "."
}
```
@y
target "target2" {
  target = "target2"
  context = "."
}
```
@z

@x
In this case, the context `.` is transferred twice when you build the default
group: once for `target1` and once for `target2`.
@y
In this case, the context `.` is transferred twice when you build the default
group: once for `target1` and once for `target2`.
@z

@x
If your context is small, and if you are using a local builder, duplicate
context transfers may not be a big deal. But if your build context is big, or
you have a large number of targets, or you're transferring the context over a
network to a remote builder, context transfer becomes a performance bottleneck.
@y
If your context is small, and if you are using a local builder, duplicate
context transfers may not be a big deal. But if your build context is big, or
you have a large number of targets, or you're transferring the context over a
network to a remote builder, context transfer becomes a performance bottleneck.
@z

@x
To avoid transferring the same context multiple times, you can define a named
context that only loads the context files, and have each target that needs
those files reference that named context. For example, the following Bake file
defines a named target `ctx`, which is used by both `target1` and `target2`:
@y
To avoid transferring the same context multiple times, you can define a named
context that only loads the context files, and have each target that needs
those files reference that named context. For example, the following Bake file
defines a named target `ctx`, which is used by both `target1` and `target2`:
@z

@x
```hcl
group "default" {
  targets = ["target1", "target2"]
}
@y
```hcl
group "default" {
  targets = ["target1", "target2"]
}
@z

@x
target "ctx" {
  context = "."
  target = "ctx"
}
@y
target "ctx" {
  context = "."
  target = "ctx"
}
@z

@x
target "target1" {
  target = "target1"
  contexts = {
    ctx = "target:ctx"
  }
}
@y
target "target1" {
  target = "target1"
  contexts = {
    ctx = "target:ctx"
  }
}
@z

@x
target "target2" {
  target = "target2"
  contexts = {
    ctx = "target:ctx"
  }
}
```
@y
target "target2" {
  target = "target2"
  contexts = {
    ctx = "target:ctx"
  }
}
```
@z

@x
The named context `ctx` represents a Dockerfile stage, which copies the files
from its context (`.`). Other stages in the Dockerfile can now reference the
`ctx` named context and, for example, mount its files with `--mount=from=ctx`.
@y
The named context `ctx` represents a Dockerfile stage, which copies the files
from its context (`.`). Other stages in the Dockerfile can now reference the
`ctx` named context and, for example, mount its files with `--mount=from=ctx`.
@z

@x
```dockerfile
FROM scratch AS ctx
COPY --link . .
@y
```dockerfile
FROM scratch AS ctx
COPY --link . .
@z

@x
FROM golang:alpine AS target1
WORKDIR /work
RUN --mount=from=ctx \
    go build -o /out/client ./cmd/client \
@y
FROM golang:alpine AS target1
WORKDIR /work
RUN --mount=from=ctx \
    go build -o /out/client ./cmd/client \
@z

@x
FROM golang:alpine AS target2
WORKDIR /work
RUN --mount=from=ctx \
    go build -o /out/server ./cmd/server
```
@y
FROM golang:alpine AS target2
WORKDIR /work
RUN --mount=from=ctx \
    go build -o /out/server ./cmd/server
```
@z
