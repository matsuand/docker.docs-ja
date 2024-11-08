%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Mastering multi-platform builds, testing, and more with Docker Buildx Bake
linkTitle: Mastering Docker Buildx Bake
description: >
  Learn how to manage simple and complex build configurations with Buildx Bake.
summary: >
  Learn to automate Docker builds and testing with declarative configurations using Buildx Bake.
@y
title: Mastering multi-platform builds, testing, and more with Docker Buildx Bake
linkTitle: Mastering Docker Buildx Bake
description: >
  Learn how to manage simple and complex build configurations with Buildx Bake.
summary: >
  Learn to automate Docker builds and testing with declarative configurations using Buildx Bake.
@z

@x
tags: [devops]
languages: [go]
@y
tags: [devops]
languages: [go]
@z

% params:
@x
  time: 30 minutes
@y
  time: 30 分
@z

@x
This guide demonstrates how to simplify and automate the process of building
images, testing, and generating build artifacts using Docker Buildx Bake. By
defining build configurations in a declarative `docker-bake.hcl` file, you can
eliminate manual scripts and enable efficient workflows for complex builds,
testing, and artifact generation.
@y
This guide demonstrates how to simplify and automate the process of building
images, testing, and generating build artifacts using Docker Buildx Bake. By
defining build configurations in a declarative `docker-bake.hcl` file, you can
eliminate manual scripts and enable efficient workflows for complex builds,
testing, and artifact generation.
@z

@x
## Assumptions
@y
## Assumptions
@z

@x
This guide assumes that you're familiar with:
@y
This guide assumes that you're familiar with:
@z

@x
- Docker
- [Buildx](/manuals/build/concepts/overview.md#buildx)
- [BuildKit](/manuals/build/concepts/overview.md#buildkit)
- [Multi-stage builds](/manuals/build/building/multi-stage.md)
- [Multi-platform builds](/manuals/build/building/multi-platform.md)
@y
- Docker
- [Buildx](manuals/build/concepts/overview.md#buildx)
- [BuildKit](manuals/build/concepts/overview.md#buildkit)
- [Multi-stage builds](manuals/build/building/multi-stage.md)
- [Multi-platform builds](manuals/build/building/multi-platform.md)
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- You have a recent version of Docker installed on your machine.
- You have Git installed for cloning repositories.
- You're using the [containerd](/manuals/desktop/features/containerd.md) image store.
@y
- You have a recent version of Docker installed on your machine.
- You have Git installed for cloning repositories.
- You're using the [containerd](manuals/desktop/features/containerd.md) image store.
@z

@x
## Introduction
@y
## Introduction
@z

@x
This guide uses an example project to demonstrate how Docker Buildx Bake can
streamline your build and test workflows. The repository includes both a
Dockerfile and a `docker-bake.hcl` file, giving you a ready-to-use setup to try
out Bake commands.
@y
This guide uses an example project to demonstrate how Docker Buildx Bake can
streamline your build and test workflows. The repository includes both a
Dockerfile and a `docker-bake.hcl` file, giving you a ready-to-use setup to try
out Bake commands.
@z

@x
Start by cloning the example repository:
@y
Start by cloning the example repository:
@z

@x
```bash
git clone https://github.com/dvdksn/bakeme.git
cd bakeme
```
@y
```bash
git clone https://github.com/dvdksn/bakeme.git
cd bakeme
```
@z

@x
The Bake file, `docker-bake.hcl`, defines the build targets in a declarative
syntax, using targets and groups, allowing you to manage complex builds
efficiently.
@y
The Bake file, `docker-bake.hcl`, defines the build targets in a declarative
syntax, using targets and groups, allowing you to manage complex builds
efficiently.
@z

@x
Here's what the Bake file looks like out-of-the-box:
@y
Here's what the Bake file looks like out-of-the-box:
@z

@x
```hcl
target "default" {
  target = "image"
  tags = [
    "bakeme:latest",
  ]
  attest = [
    "type=provenance,mode=max",
    "type=sbom",
  ]
  platforms = [
    "linux/amd64",
    "linux/arm64",
    "linux/riscv64",
  ]
}
```
@y
```hcl
target "default" {
  target = "image"
  tags = [
    "bakeme:latest",
  ]
  attest = [
    "type=provenance,mode=max",
    "type=sbom",
  ]
  platforms = [
    "linux/amd64",
    "linux/arm64",
    "linux/riscv64",
  ]
}
```
@z

@x
The `target` keyword defines a build target for Bake. The `default` target
defines the target to build when no specific target is specified on the command
line. Here's a quick summary of the options for the `default` target:
@y
The `target` keyword defines a build target for Bake. The `default` target
defines the target to build when no specific target is specified on the command
line. Here's a quick summary of the options for the `default` target:
@z

@x
- `target`: The target build stage in the Dockerfile.
- `tags`: Tags to assign to the image.
- `attest`: [Attestations](/manuals/build/metadata/attestations/_index.md) to attach to the image.
@y
- `target`: The target build stage in the Dockerfile.
- `tags`: Tags to assign to the image.
- `attest`: [Attestations](manuals/build/metadata/attestations/_index.md) to attach to the image.
@z

@x
  > [!TIP]
  > The attestations provide metadata such as build provenance, which tracks
  > the source of the image's build, and an SBOM (Software Bill of Materials),
  > useful for security audits and compliance.
@y
  > [!TIP]
  > The attestations provide metadata such as build provenance, which tracks
  > the source of the image's build, and an SBOM (Software Bill of Materials),
  > useful for security audits and compliance.
@z

@x
- `platforms`: Platform variants to build.
@y
- `platforms`: Platform variants to build.
@z

@x
To execute this build, simply run the following command in the root of the
repository:
@y
To execute this build, simply run the following command in the root of the
repository:
@z

@x
```console
$ docker buildx bake
```
@y
```console
$ docker buildx bake
```
@z

@x
With Bake, you avoid long, hard-to-remember command-line incantations,
simplifying build configuration management by replacing manual, error-prone
scripts with a structured configuration file.
@y
With Bake, you avoid long, hard-to-remember command-line incantations,
simplifying build configuration management by replacing manual, error-prone
scripts with a structured configuration file.
@z

@x
For contrast, here's what this build command would look like without Bake:
@y
For contrast, here's what this build command would look like without Bake:
@z

@x
```console
$ docker buildx build \
  --target=image \
  --tag=bakeme:latest \
  --provenance=true \
  --sbom=true \
  --platform=linux/amd64,linux/arm64,linux/riscv64 \
  .
```
@y
```console
$ docker buildx build \
  --target=image \
  --tag=bakeme:latest \
  --provenance=true \
  --sbom=true \
  --platform=linux/amd64,linux/arm64,linux/riscv64 \
  .
```
@z

@x
## Testing and linting
@y
## Testing and linting
@z

@x
Bake isn't just for defining build configurations and running builds. You can
also use Bake to run your tests, effectively using BuildKit as a task runner.
Running your tests in containers is great for ensuring reproducible results.
This section shows how to add two types of tests:
@y
Bake isn't just for defining build configurations and running builds. You can
also use Bake to run your tests, effectively using BuildKit as a task runner.
Running your tests in containers is great for ensuring reproducible results.
This section shows how to add two types of tests:
@z

@x
- Unit testing with `go test`.
- Linting for style violations with `golangci-lint`.
@y
- Unit testing with `go test`.
- Linting for style violations with `golangci-lint`.
@z

@x
In Test-Driven Development (TDD) fashion, start by adding a new `test` target
to the Bake file:
@y
In Test-Driven Development (TDD) fashion, start by adding a new `test` target
to the Bake file:
@z

@x
```hcl
target "test" {
  target = "test"
  output = ["type=cacheonly"]
}
```
@y
```hcl
target "test" {
  target = "test"
  output = ["type=cacheonly"]
}
```
@z

@x
> [!TIP]
> Using `type=cacheonly` ensures that the build output is effectively
> discarded; the layers are saved to BuildKit's cache, but Buildx will not
> attempt to load the result to the Docker Engine's image store.
>
> For test runs, you don't need to export the build output — only the test
> execution matters.
@y
> [!TIP]
> Using `type=cacheonly` ensures that the build output is effectively
> discarded; the layers are saved to BuildKit's cache, but Buildx will not
> attempt to load the result to the Docker Engine's image store.
>
> For test runs, you don't need to export the build output — only the test
> execution matters.
@z

@x
To execute this Bake target, run `docker buildx bake test`. At this time,
you'll receive an error indicating that the `test` stage does not exist in the
Dockerfile.
@y
To execute this Bake target, run `docker buildx bake test`. At this time,
you'll receive an error indicating that the `test` stage does not exist in the
Dockerfile.
@z

@x
```console
$ docker buildx bake test
[+] Building 1.2s (6/6) FINISHED
 => [internal] load local bake definitions
...
ERROR: failed to solve: target stage "test" could not be found
```
@y
```console
$ docker buildx bake test
[+] Building 1.2s (6/6) FINISHED
 => [internal] load local bake definitions
...
ERROR: failed to solve: target stage "test" could not be found
```
@z

@x
To satisfy this target, add the corresponding Dockerfile target. The `test`
stage here is based on the same base stage as the build stage.
@y
To satisfy this target, add the corresponding Dockerfile target. The `test`
stage here is based on the same base stage as the build stage.
@z

@x
```dockerfile
FROM base AS test
RUN --mount=target=. \
    --mount=type=cache,target=/go/pkg/mod \
    go test .
```
@y
```dockerfile
FROM base AS test
RUN --mount=target=. \
    --mount=type=cache,target=/go/pkg/mod \
    go test .
```
@z

@x
> [!TIP]
> The [`--mount=type=cache` directive](/manuals/build/cache/optimize.md#use-cache-mounts)
> caches Go modules between builds, improving build performance by avoiding the
> need to re-download dependencies. This shared cache ensures that the same
> dependency set is available across build, test, and other stages.
@y
> [!TIP]
> The [`--mount=type=cache` directive](manuals/build/cache/optimize.md#use-cache-mounts)
> caches Go modules between builds, improving build performance by avoiding the
> need to re-download dependencies. This shared cache ensures that the same
> dependency set is available across build, test, and other stages.
@z

@x
Now, running the `test` target with Bake will evaluate the unit tests for this
project. If you want to verify that it works, you can make an arbitrary change
to `main_test.go` to cause the test to fail.
@y
Now, running the `test` target with Bake will evaluate the unit tests for this
project. If you want to verify that it works, you can make an arbitrary change
to `main_test.go` to cause the test to fail.
@z

@x
Next, to enable linting, add another target to the Bake file, named `lint`:
@y
Next, to enable linting, add another target to the Bake file, named `lint`:
@z

@x
```hcl
target "lint" {
  target = "lint"
  output = ["type=cacheonly"]
}
```
@y
```hcl
target "lint" {
  target = "lint"
  output = ["type=cacheonly"]
}
```
@z

@x
And in the Dockerfile, add the build stage. This stage will use the official
`golangci-lint` image on Docker Hub.
@y
And in the Dockerfile, add the build stage. This stage will use the official
`golangci-lint` image on Docker Hub.
@z

@x
> [!TIP]
> Because this stage relies on executing an external dependency, it's generally
> a good idea to define the version you want to use as a build argument. This
> lets you more easily manage version upgrades in the future by collocating
> dependency versions to the beginning of the Dockerfile.
@y
> [!TIP]
> Because this stage relies on executing an external dependency, it's generally
> a good idea to define the version you want to use as a build argument. This
> lets you more easily manage version upgrades in the future by collocating
> dependency versions to the beginning of the Dockerfile.
@z

@x
```dockerfile {hl_lines=[2,"6-8"]}
ARG GO_VERSION="1.23"
ARG GOLANGCI_LINT_VERSION="1.61"
@y
```dockerfile {hl_lines=[2,"6-8"]}
ARG GO_VERSION="1.23"
ARG GOLANGCI_LINT_VERSION="1.61"
@z

@x
#...
@y
#...
@z

@x
FROM golangci/golangci-lint:v${GOLANGCI_LINT_VERSION}-alpine AS lint
RUN --mount=target=.,rw \
    golangci-lint run
```
@y
FROM golangci/golangci-lint:v${GOLANGCI_LINT_VERSION}-alpine AS lint
RUN --mount=target=.,rw \
    golangci-lint run
```
@z

@x
Lastly, to enable running both tests simultaneously, you can use the `groups`
construct in the Bake file. A group can specify multiple targets to run with a
single invocation.
@y
Lastly, to enable running both tests simultaneously, you can use the `groups`
construct in the Bake file. A group can specify multiple targets to run with a
single invocation.
@z

@x
```hcl
group "validate" {
  targets = ["test", "lint"]
}
```
@y
```hcl
group "validate" {
  targets = ["test", "lint"]
}
```
@z

@x
Now, running both tests is as simple as:
@y
Now, running both tests is as simple as:
@z

@x
```console
$ docker buildx bake validate
```
@y
```console
$ docker buildx bake validate
```
@z

@x
## Building variants
@y
## Building variants
@z

@x
Sometimes you need to build more than one version of a program. The following
example uses Bake to build separate "release" and "debug" variants of the
program, using [matrices](/manuals/build/bake/matrices.md). Using matrices lets
you run parallel builds with different configurations, saving time and ensuring
consistency.
@y
Sometimes you need to build more than one version of a program. The following
example uses Bake to build separate "release" and "debug" variants of the
program, using [matrices](manuals/build/bake/matrices.md). Using matrices lets
you run parallel builds with different configurations, saving time and ensuring
consistency.
@z

@x
A matrix expands a single build into multiple builds, each representing a
unique combination of matrix parameters. This means you can orchestrate Bake
into building both the production and development build of your program in
parallel, with minimal configuration changes.
@y
A matrix expands a single build into multiple builds, each representing a
unique combination of matrix parameters. This means you can orchestrate Bake
into building both the production and development build of your program in
parallel, with minimal configuration changes.
@z

@x
The example project for this guide is set up to use a build-time option to
conditionally enable debug logging and tracing capabilities.
@y
The example project for this guide is set up to use a build-time option to
conditionally enable debug logging and tracing capabilities.
@z

@x
- If you compile the program with `go build -tags="debug"`, the additional
  logging and tracing capabilities are enabled (development mode).
- If you build without the `debug` tag, the program is compiled with a default
  logger (production mode).
@y
- If you compile the program with `go build -tags="debug"`, the additional
  logging and tracing capabilities are enabled (development mode).
- If you build without the `debug` tag, the program is compiled with a default
  logger (production mode).
@z

@x
Update the Bake file by adding a matrix attribute which defines the variable
combinations to build:
@y
Update the Bake file by adding a matrix attribute which defines the variable
combinations to build:
@z

@x
```diff {title="docker-bake.hcl"}
 target "default" {
+  matrix = {
+    mode = ["release", "debug"]
+  }
+  name = "image-${mode}"
   target = "image"
```
@y
```diff {title="docker-bake.hcl"}
 target "default" {
+  matrix = {
+    mode = ["release", "debug"]
+  }
+  name = "image-${mode}"
   target = "image"
```
@z

@x
The `matrix` attribute defines the variants to build ("release" and "debug").
The `name` attribute defines how the matrix gets expanded into multiple
distinct build targets. In this case, the matrix attribute expands the build
into two workflows: `image-release` and `image-debug`, each using different
configuration parameters.
@y
The `matrix` attribute defines the variants to build ("release" and "debug").
The `name` attribute defines how the matrix gets expanded into multiple
distinct build targets. In this case, the matrix attribute expands the build
into two workflows: `image-release` and `image-debug`, each using different
configuration parameters.
@z

@x
Next, define a build argument named `BUILD_TAGS` which takes the value of the
matrix variable.
@y
Next, define a build argument named `BUILD_TAGS` which takes the value of the
matrix variable.
@z

@x
```diff {title="docker-bake.hcl"}
   target = "image"
+  args = {
+    BUILD_TAGS = mode
+  }
   tags = [
```
@y
```diff {title="docker-bake.hcl"}
   target = "image"
+  args = {
+    BUILD_TAGS = mode
+  }
   tags = [
```
@z

@x
You'll also want to change how the image tags are assigned to these builds.
Currently, both matrix paths would generate the same image tag names, and
overwrite each other. Update the `tags` attribute use a conditional operator to
set the tag depending on the matrix variable value.
@y
You'll also want to change how the image tags are assigned to these builds.
Currently, both matrix paths would generate the same image tag names, and
overwrite each other. Update the `tags` attribute use a conditional operator to
set the tag depending on the matrix variable value.
@z

@x
```diff {title="docker-bake.hcl"}
   tags = [
-    "bakeme:latest",
+    mode == "release" ? "bakeme:latest" : "bakeme:dev"
   ]
```
@y
```diff {title="docker-bake.hcl"}
   tags = [
-    "bakeme:latest",
+    mode == "release" ? "bakeme:latest" : "bakeme:dev"
   ]
```
@z

@x
- If `mode` is `release`, the tag name is `bakeme:latest`
- If `mode` is `debug`, the tag name is `bakeme:dev`
@y
- If `mode` is `release`, the tag name is `bakeme:latest`
- If `mode` is `debug`, the tag name is `bakeme:dev`
@z

@x
Finally, update the Dockerfile to consume the `BUILD_TAGS` argument during the
compilation stage. When the `-tags="${BUILD_TAGS}"` option evaluates to
`-tags="debug"`, the compiler uses the `configureLogging` function in the
[`debug.go`](https://github.com/dvdksn/bakeme/blob/75c8a41e613829293c4bd3fc3b4f0c573f458f42/debug.go#L1)
file.
@y
Finally, update the Dockerfile to consume the `BUILD_TAGS` argument during the
compilation stage. When the `-tags="${BUILD_TAGS}"` option evaluates to
`-tags="debug"`, the compiler uses the `configureLogging` function in the
[`debug.go`](https://github.com/dvdksn/bakeme/blob/75c8a41e613829293c4bd3fc3b4f0c573f458f42/debug.go#L1)
file.
@z

@x
```diff {title=Dockerfile}
 # build compiles the program
 FROM base AS build
-ARG TARGETOS TARGETARCH
+ARG TARGETOS TARGETARCH BUILD_TAGS
 ENV GOOS=$TARGETOS
 ENV GOARCH=$TARGETARCH
 RUN --mount=target=. \
        --mount=type=cache,target=/go/pkg/mod \
-       go build -o "/usr/bin/bakeme" .
+       go build -tags="${BUILD_TAGS}" -o "/usr/bin/bakeme" .
```
@y
```diff {title=Dockerfile}
 # build compiles the program
 FROM base AS build
-ARG TARGETOS TARGETARCH
+ARG TARGETOS TARGETARCH BUILD_TAGS
 ENV GOOS=$TARGETOS
 ENV GOARCH=$TARGETARCH
 RUN --mount=target=. \
        --mount=type=cache,target=/go/pkg/mod \
-       go build -o "/usr/bin/bakeme" .
+       go build -tags="${BUILD_TAGS}" -o "/usr/bin/bakeme" .
```
@z

@x
That's all. With these changes, your `docker buildx bake` command now builds
two multi-platform image variants. You can introspect the canonical build
configuration that Bake generates using the `docker buildx bake --print`
command. Running this command shows that Bake will run a `default` group with
two targets with different build arguments and image tags.
@y
That's all. With these changes, your `docker buildx bake` command now builds
two multi-platform image variants. You can introspect the canonical build
configuration that Bake generates using the `docker buildx bake --print`
command. Running this command shows that Bake will run a `default` group with
two targets with different build arguments and image tags.
@z

@x
```json {collapse=true}
{
  "group": {
    "default": {
      "targets": ["image-release", "image-debug"]
    }
  },
  "target": {
    "image-debug": {
      "attest": ["type=provenance,mode=max", "type=sbom"],
      "context": ".",
      "dockerfile": "Dockerfile",
      "args": {
        "BUILD_TAGS": "debug"
      },
      "tags": ["bakeme:dev"],
      "target": "image",
      "platforms": ["linux/amd64", "linux/arm64", "linux/riscv64"]
    },
    "image-release": {
      "attest": ["type=provenance,mode=max", "type=sbom"],
      "context": ".",
      "dockerfile": "Dockerfile",
      "args": {
        "BUILD_TAGS": "release"
      },
      "tags": ["bakeme:latest"],
      "target": "image",
      "platforms": ["linux/amd64", "linux/arm64", "linux/riscv64"]
    }
  }
}
```
@y
```json {collapse=true}
{
  "group": {
    "default": {
      "targets": ["image-release", "image-debug"]
    }
  },
  "target": {
    "image-debug": {
      "attest": ["type=provenance,mode=max", "type=sbom"],
      "context": ".",
      "dockerfile": "Dockerfile",
      "args": {
        "BUILD_TAGS": "debug"
      },
      "tags": ["bakeme:dev"],
      "target": "image",
      "platforms": ["linux/amd64", "linux/arm64", "linux/riscv64"]
    },
    "image-release": {
      "attest": ["type=provenance,mode=max", "type=sbom"],
      "context": ".",
      "dockerfile": "Dockerfile",
      "args": {
        "BUILD_TAGS": "release"
      },
      "tags": ["bakeme:latest"],
      "target": "image",
      "platforms": ["linux/amd64", "linux/arm64", "linux/riscv64"]
    }
  }
}
```
@z

@x
Factoring in all of the platform variants as well, this means that the build
configuration generates 6 different images.
@y
Factoring in all of the platform variants as well, this means that the build
configuration generates 6 different images.
@z

@x
```console
$ docker buildx bake
$ docker image ls --tree
@y
```console
$ docker buildx bake
$ docker image ls --tree
@z

@x
IMAGE                   ID             DISK USAGE   CONTENT SIZE   USED
bakeme:dev              f7cb5c08beac       49.3MB         28.9MB
├─ linux/riscv64        0eae8ba0367a       9.18MB         9.18MB
├─ linux/arm64          56561051c49a         30MB         9.89MB
└─ linux/amd64          e8ca65079c1f        9.8MB          9.8MB
@y
IMAGE                   ID             DISK USAGE   CONTENT SIZE   USED
bakeme:dev              f7cb5c08beac       49.3MB         28.9MB
├─ linux/riscv64        0eae8ba0367a       9.18MB         9.18MB
├─ linux/arm64          56561051c49a         30MB         9.89MB
└─ linux/amd64          e8ca65079c1f        9.8MB          9.8MB
@z

@x
bakeme:latest           20065d2c4d22       44.4MB         25.9MB
├─ linux/riscv64        7cc82872695f       8.21MB         8.21MB
├─ linux/arm64          e42220c2b7a3       27.1MB         8.93MB
└─ linux/amd64          af5b2dd64fde       8.78MB         8.78MB
```
@y
bakeme:latest           20065d2c4d22       44.4MB         25.9MB
├─ linux/riscv64        7cc82872695f       8.21MB         8.21MB
├─ linux/arm64          e42220c2b7a3       27.1MB         8.93MB
└─ linux/amd64          af5b2dd64fde       8.78MB         8.78MB
```
@z

@x
## Exporting build artifacts
@y
## Exporting build artifacts
@z

@x
Exporting build artifacts like binaries can be useful for deploying to
environments without Docker or Kubernetes. For example, if your programs are
meant to be run on a user's local machine.
@y
Exporting build artifacts like binaries can be useful for deploying to
environments without Docker or Kubernetes. For example, if your programs are
meant to be run on a user's local machine.
@z

@x
> [!TIP]
> The techniques discussed in this section can be applied not only to build
> output like binaries, but to any type of artifacts, such as test reports.
@y
> [!TIP]
> The techniques discussed in this section can be applied not only to build
> output like binaries, but to any type of artifacts, such as test reports.
@z

@x
With programming languages like Go and Rust where the compiled binaries are
usually portable, creating alternate build targets for exporting only the
binary is trivial. All you need to do is add an empty stage in the Dockerfile
containing nothing but the binary that you want to export.
@y
With programming languages like Go and Rust where the compiled binaries are
usually portable, creating alternate build targets for exporting only the
binary is trivial. All you need to do is add an empty stage in the Dockerfile
containing nothing but the binary that you want to export.
@z

@x
First, let's add a quick way to build a binary for your local platform and
export it to `./build/local` on the local filesystem.
@y
First, let's add a quick way to build a binary for your local platform and
export it to `./build/local` on the local filesystem.
@z

@x
In the `docker-bake.hcl` file, create a new `bin` target. In this stage, set
the `output` attribute to a local filesystem path. Buildx automatically detects
that the output looks like a filepath, and exports the results to the specified
path using the [local exporter](/manuals/build/exporters/local-tar.md).
@y
In the `docker-bake.hcl` file, create a new `bin` target. In this stage, set
the `output` attribute to a local filesystem path. Buildx automatically detects
that the output looks like a filepath, and exports the results to the specified
path using the [local exporter](manuals/build/exporters/local-tar.md).
@z

@x
```hcl
target "bin" {
  target = "bin"
  output = ["build/bin"]
  platforms = ["local"]
}
```
@y
```hcl
target "bin" {
  target = "bin"
  output = ["build/bin"]
  platforms = ["local"]
}
```
@z

@x
Notice that this stage specifies a `local` platform. By default, if `platforms`
is unspecified, builds target the OS and architecture of the BuildKit host. If
you're using Docker Desktop, this often means builds target `linux/amd64` or
`linux/arm64`, even if your local machine is macOS or Windows, because Docker
runs in a Linux VM. Using the `local` platform forces the target platform to
match your local environment.
@y
Notice that this stage specifies a `local` platform. By default, if `platforms`
is unspecified, builds target the OS and architecture of the BuildKit host. If
you're using Docker Desktop, this often means builds target `linux/amd64` or
`linux/arm64`, even if your local machine is macOS or Windows, because Docker
runs in a Linux VM. Using the `local` platform forces the target platform to
match your local environment.
@z

@x
Next, add the `bin` stage to the Dockerfile which copies the compiled binary
from the build stage.
@y
Next, add the `bin` stage to the Dockerfile which copies the compiled binary
from the build stage.
@z

@x
```dockerfile
FROM scratch AS bin
COPY --from=build "/usr/bin/bakeme" /
```
@y
```dockerfile
FROM scratch AS bin
COPY --from=build "/usr/bin/bakeme" /
```
@z

@x
Now you can export your local platform version of the binary with `docker
buildx bake bin`. For example, on macOS, this build target generates an
executable in the [Mach-O format](https://en.wikipedia.org/wiki/Mach-O) — the
standard executable format for macOS.
@y
Now you can export your local platform version of the binary with `docker
buildx bake bin`. For example, on macOS, this build target generates an
executable in the [Mach-O format](https://en.wikipedia.org/wiki/Mach-O) — the
standard executable format for macOS.
@z

@x
```console
$ docker buildx bake bin
$ file ./build/bin/bakeme
./build/bin/bakeme: Mach-O 64-bit executable arm64
```
@y
```console
$ docker buildx bake bin
$ file ./build/bin/bakeme
./build/bin/bakeme: Mach-O 64-bit executable arm64
```
@z

@x
Next, let's add a target to build all of the platform variants of the program.
To do this, you can [inherit](/manuals/build/bake/inheritance.md) the `bin`
target that you just created, and extend it by adding the desired platforms.
@y
Next, let's add a target to build all of the platform variants of the program.
To do this, you can [inherit](manuals/build/bake/inheritance.md) the `bin`
target that you just created, and extend it by adding the desired platforms.
@z

@x
```hcl
target "bin-cross" {
  inherits = ["bin"]
  platforms = [
    "linux/amd64",
    "linux/arm64",
    "linux/riscv64",
  ]
}
```
@y
```hcl
target "bin-cross" {
  inherits = ["bin"]
  platforms = [
    "linux/amd64",
    "linux/arm64",
    "linux/riscv64",
  ]
}
```
@z

@x
Now, building the `bin-cross` target creates binaries for all platforms.
Subdirectories are automatically created for each variant.
@y
Now, building the `bin-cross` target creates binaries for all platforms.
Subdirectories are automatically created for each variant.
@z

@x
```console
$ docker buildx bake bin-cross
$ tree build/
build/
└── bin
    ├── bakeme
    ├── linux_amd64
    │   └── bakeme
    ├── linux_arm64
    │   └── bakeme
    └── linux_riscv64
        └── bakeme
@y
```console
$ docker buildx bake bin-cross
$ tree build/
build/
└── bin
    ├── bakeme
    ├── linux_amd64
    │   └── bakeme
    ├── linux_arm64
    │   └── bakeme
    └── linux_riscv64
        └── bakeme
@z

@x
5 directories, 4 files
```
@y
5 directories, 4 files
```
@z

@x
To also generate "release" and "debug" variants, you can use a matrix just like
you did with the default target. When using a matrix, you also need to
differentiate the output directory based on the matrix value, otherwise the
binary gets written to the same location for each matrix run.
@y
To also generate "release" and "debug" variants, you can use a matrix just like
you did with the default target. When using a matrix, you also need to
differentiate the output directory based on the matrix value, otherwise the
binary gets written to the same location for each matrix run.
@z

@x
```hcl
target "bin-all" {
  inherits = ["bin-cross"]
  matrix = {
    mode = ["release", "debug"]
  }
  name = "bin-${mode}"
  args = {
    BUILD_TAGS = mode
  }
  output = ["build/bin/${mode}"]
}
```
@y
```hcl
target "bin-all" {
  inherits = ["bin-cross"]
  matrix = {
    mode = ["release", "debug"]
  }
  name = "bin-${mode}"
  args = {
    BUILD_TAGS = mode
  }
  output = ["build/bin/${mode}"]
}
```
@z

@x
```console
$ rm -r ./build/
$ docker buildx bake bin-all
$ tree build/
build/
└── bin
    ├── debug
    │   ├── linux_amd64
    │   │   └── bakeme
    │   ├── linux_arm64
    │   │   └── bakeme
    │   └── linux_riscv64
    │       └── bakeme
    └── release
        ├── linux_amd64
        │   └── bakeme
        ├── linux_arm64
        │   └── bakeme
        └── linux_riscv64
            └── bakeme
@y
```console
$ rm -r ./build/
$ docker buildx bake bin-all
$ tree build/
build/
└── bin
    ├── debug
    │   ├── linux_amd64
    │   │   └── bakeme
    │   ├── linux_arm64
    │   │   └── bakeme
    │   └── linux_riscv64
    │       └── bakeme
    └── release
        ├── linux_amd64
        │   └── bakeme
        ├── linux_arm64
        │   └── bakeme
        └── linux_riscv64
            └── bakeme
@z

@x
10 directories, 6 files
```
@y
10 directories, 6 files
```
@z

@x
## Conclusion
@y
## Conclusion
@z

@x
Docker Buildx Bake streamlines complex build workflows, enabling efficient
multi-platform builds, testing, and artifact export. By integrating Buildx Bake
into your projects, you can simplify your Docker builds, make your build
configuration portable, and wrangle complex configurations more easily.
@y
Docker Buildx Bake streamlines complex build workflows, enabling efficient
multi-platform builds, testing, and artifact export. By integrating Buildx Bake
into your projects, you can simplify your Docker builds, make your build
configuration portable, and wrangle complex configurations more easily.
@z

@x
Experiment with different configurations and extend your Bake files to suit
your project's needs. You might consider integrating Bake into your CI/CD
pipelines to automate builds, testing, and artifact deployment. The flexibility
and power of Buildx Bake can significantly improve your development and
deployment processes.
@y
Experiment with different configurations and extend your Bake files to suit
your project's needs. You might consider integrating Bake into your CI/CD
pipelines to automate builds, testing, and artifact deployment. The flexibility
and power of Buildx Bake can significantly improve your development and
deployment processes.
@z

@x
### Further reading
@y
### Further reading
@z

@x
For more information about how to use Bake, check out these resources:
@y
For more information about how to use Bake, check out these resources:
@z

@x
- [Bake documentation](/manuals/build/bake/_index.md)
- [Matrix targets](/manuals/build/bake/matrices.md)
- [Bake file reference](/manuals/build/bake/reference.md)
- [Bake GitHub Action](https://github.com/docker/bake-action)
@y
- [Bake documentation](manuals/build/bake/_index.md)
- [Matrix targets](manuals/build/bake/matrices.md)
- [Bake file reference](manuals/build/bake/reference.md)
- [Bake GitHub Action](https://github.com/docker/bake-action)
@z
