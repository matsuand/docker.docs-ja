%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Multi-platform
description: Building for multiple operating systems and architectures
keywords: build, buildkit, buildx, guide, tutorial, multi-platform, emulation, cross-compilation
---
@y
---
title: Multi-platform
description: Building for multiple operating systems and architectures
keywords: build, buildkit, buildx, guide, tutorial, multi-platform, emulation, cross-compilation
---
@z

@x
Up until this point in the guide, you've built Linux binaries. This section
describes how you can support other operating systems, and architectures, using
multi-platform builds via emulation and cross-compilation.
@y
Up until this point in the guide, you've built Linux binaries. This section
describes how you can support other operating systems, and architectures, using
multi-platform builds via emulation and cross-compilation.
@z

@x
The easiest way to get started with building for multiple platforms is using
emulation. With emulation, you can build your app to multiple architectures
without having to make any changes to your Dockerfile. All you need to do is to
pass the `--platform` flag to the build command, specifying the OS and
architecture you want to build for.
@y
The easiest way to get started with building for multiple platforms is using
emulation. With emulation, you can build your app to multiple architectures
without having to make any changes to your Dockerfile. All you need to do is to
pass the `--platform` flag to the build command, specifying the OS and
architecture you want to build for.
@z

@x
The following command builds the server image for the `linux/arm/v7` platform:
@y
The following command builds the server image for the `linux/arm/v7` platform:
@z

@x
```console
$ docker build --target=server --platform=linux/arm/v7 .
```
@y
```console
$ docker build --target=server --platform=linux/arm/v7 .
```
@z

@x
You can also use emulation to produce outputs for multiple platforms at once.
However, the default image store in Docker Engine doesn't support building
and loading multi-platform images. You need to enable the containerd image store
which supports concurrent multi-platform builds.
@y
You can also use emulation to produce outputs for multiple platforms at once.
However, the default image store in Docker Engine doesn't support building
and loading multi-platform images. You need to enable the containerd image store
which supports concurrent multi-platform builds.
@z

@x
## Enable the containerd image store
@y
## Enable the containerd image store
@z

@x
{{< tabs >}}
{{< tab name="Docker Desktop" >}}
@y
{{< tabs >}}
{{< tab name="Docker Desktop" >}}
@z

@x
To enable the containerd image store in Docker Desktop,
go to **Settings** and select **Use containerd for pulling and storing images**
in the **General** tab.
@y
To enable the containerd image store in Docker Desktop,
go to **Settings** and select **Use containerd for pulling and storing images**
in the **General** tab.
@z

@x
Note that changing the image store means you'll temporarily lose access to
images and containers in the classic image store.
Those resources still exist, but to view them, you'll need to
disable the containerd image store.
@y
Note that changing the image store means you'll temporarily lose access to
images and containers in the classic image store.
Those resources still exist, but to view them, you'll need to
disable the containerd image store.
@z

@x
{{< /tab >}}
{{< tab name="Docker Engine" >}}
@y
{{< /tab >}}
{{< tab name="Docker Engine" >}}
@z

@x
If you're not using Docker Desktop,
enable the containerd image store by adding the following feature configuration
to your `/etc/docker/daemon.json` configuration file.
@y
If you're not using Docker Desktop,
enable the containerd image store by adding the following feature configuration
to your `/etc/docker/daemon.json` configuration file.
@z

@x
```json {hl_lines=3}
{
  "features": {
    "containerd-snapshotters": true
  }
}
```
@y
```json {hl_lines=3}
{
  "features": {
    "containerd-snapshotters": true
  }
}
```
@z

@x
Restart the daemon after updating the configuration file.
@y
Restart the daemon after updating the configuration file.
@z

@x
```console
$ systemctl restart docker
```
@y
```console
$ systemctl restart docker
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
## Build using emulation
@y
## Build using emulation
@z

@x
To run multi-platform builds, invoke the `docker build` command,
and pass it the same arguments as you did before.
Only this time, also add a `--platform` flag specifying multiple architectures.
@y
To run multi-platform builds, invoke the `docker build` command,
and pass it the same arguments as you did before.
Only this time, also add a `--platform` flag specifying multiple architectures.
@z

@x
```console {hl_lines=4}
$ docker build \
    --target=binaries \
    --output=bin \
    --platform=linux/amd64,linux/arm64,linux/arm/v7 .
```
@y
```console {hl_lines=4}
$ docker build \
    --target=binaries \
    --output=bin \
    --platform=linux/amd64,linux/arm64,linux/arm/v7 .
```
@z

@x
This command uses emulation to run the same build three times, once for each
platform. The build results are exported to a `bin` directory.
@y
This command uses emulation to run the same build three times, once for each
platform. The build results are exported to a `bin` directory.
@z

@x
```text
bin
├── linux_amd64
│   ├── client
│   └── server
├── linux_arm64
│   ├── client
│   └── server
└── linux_arm_v7
    ├── client
    └── server
```
@y
```text
bin
├── linux_amd64
│   ├── client
│   └── server
├── linux_arm64
│   ├── client
│   └── server
└── linux_arm_v7
    ├── client
    └── server
```
@z

@x
When you build for multiple platforms concurrently,
BuildKit runs all of the build steps under emulation for each platform that you specify.
Effectively forking the build into multiple concurrent processes.
@y
When you build for multiple platforms concurrently,
BuildKit runs all of the build steps under emulation for each platform that you specify.
Effectively forking the build into multiple concurrent processes.
@z

@x
![Build pipelines using emulation](./images/emulation.png)
@y
![Build pipelines using emulation](./images/emulation.png)
@z

@x
There are, however, a few downsides to running multi-platform builds using
emulation:
@y
There are, however, a few downsides to running multi-platform builds using
emulation:
@z

@x
- If you tried running the command above, you may have noticed that it took a
  long time to finish. Emulation can be much slower than native execution for
  CPU-intensive tasks.
- Emulation only works when the architecture is supported by the base image
  you’re using. The example in this guide uses the Alpine Linux version of the
  `golang` image, which means you can only build Linux images this way, for a
  limited set of CPU architectures, without having to change the base image.
@y
- If you tried running the command above, you may have noticed that it took a
  long time to finish. Emulation can be much slower than native execution for
  CPU-intensive tasks.
- Emulation only works when the architecture is supported by the base image
  you’re using. The example in this guide uses the Alpine Linux version of the
  `golang` image, which means you can only build Linux images this way, for a
  limited set of CPU architectures, without having to change the base image.
@z

@x
As an alternative to emulation, the next step explores cross-compilation.
Cross-compiling makes multi-platform builds much faster and versatile.
@y
As an alternative to emulation, the next step explores cross-compilation.
Cross-compiling makes multi-platform builds much faster and versatile.
@z

@x
## Build using cross-compilation
@y
## Build using cross-compilation
@z

@x
Using cross-compilation means leveraging the capabilities of a compiler to build
for multiple platforms, without the need for emulation.
@y
Using cross-compilation means leveraging the capabilities of a compiler to build
for multiple platforms, without the need for emulation.
@z

@x
The first thing you'll need to do is pinning the builder to use the node’s
native architecture as the build platform. This is to prevent emulation. Then,
from the node's native architecture, the builder cross-compiles the application
to a number of other target platforms.
@y
The first thing you'll need to do is pinning the builder to use the node’s
native architecture as the build platform. This is to prevent emulation. Then,
from the node's native architecture, the builder cross-compiles the application
to a number of other target platforms.
@z

@x
### Platform build arguments
@y
### Platform build arguments
@z

@x
This approach involves using a few pre-defined build arguments that you have
access to in your Docker builds: `BUILDPLATFORM` and `TARGETPLATFORM` (and
derivatives, like `TARGETOS`). These build arguments reflect the values you pass
to the `--platform` flag.
@y
This approach involves using a few pre-defined build arguments that you have
access to in your Docker builds: `BUILDPLATFORM` and `TARGETPLATFORM` (and
derivatives, like `TARGETOS`). These build arguments reflect the values you pass
to the `--platform` flag.
@z

@x
For example, if you invoke a build with `--platform=linux/amd64`, then the build
arguments resolve to:
@y
For example, if you invoke a build with `--platform=linux/amd64`, then the build
arguments resolve to:
@z

@x
- `TARGETPLATFORM=linux/amd64`
- `TARGETOS=linux`
- `TARGETARCH=amd64`
@y
- `TARGETPLATFORM=linux/amd64`
- `TARGETOS=linux`
- `TARGETARCH=amd64`
@z

@x
When you pass more than one value to the platform flag, build stages that use
the pre-defined platform arguments are forked automatically for each platform.
This is in contrast to builds running under emulation, where the entire build
pipeline runs per platform.
@y
When you pass more than one value to the platform flag, build stages that use
the pre-defined platform arguments are forked automatically for each platform.
This is in contrast to builds running under emulation, where the entire build
pipeline runs per platform.
@z

@x
![Build pipelines using cross-compilation](./images/cross-compilation.png)
@y
![Build pipelines using cross-compilation](./images/cross-compilation.png)
@z

@x
### Update the Dockerfile
@y
### Update the Dockerfile
@z

@x
To build the app using the cross-compilation technique, update the Dockerfile as
follows:
@y
To build the app using the cross-compilation technique, update the Dockerfile as
follows:
@z

@x
- Add `--platform=$BUILDPLATFORM` to the `FROM` instruction for the initial
  `base` stage, pinning the platform of the `golang` image to match the
  architecture of the host machine.
- Add `ARG` instructions for the Go compilation stages, making the `TARGETOS`
  and `TARGETARCH` build arguments available to the commands in this stage.
- Set the `GOOS` and `GOARCH` environment variables to the values of `TARGETOS`
  and `TARGETARCH`. The Go compiler uses these variables to do
  cross-compilation.
@y
- Add `--platform=$BUILDPLATFORM` to the `FROM` instruction for the initial
  `base` stage, pinning the platform of the `golang` image to match the
  architecture of the host machine.
- Add `ARG` instructions for the Go compilation stages, making the `TARGETOS`
  and `TARGETARCH` build arguments available to the commands in this stage.
- Set the `GOOS` and `GOARCH` environment variables to the values of `TARGETOS`
  and `TARGETARCH`. The Go compiler uses these variables to do
  cross-compilation.
@z

@x
```diff
  # syntax=docker/dockerfile:1
  ARG GO_VERSION={{% param "example_go_version" %}}
  ARG GOLANGCI_LINT_VERSION={{% param "example_golangci_lint_version" %}}
- FROM golang:${GO_VERSION}-alpine AS base
+ FROM --platform=$BUILDPLATFORM golang:${GO_VERSION}-alpine AS base
  WORKDIR /src
  RUN --mount=type=cache,target=/go/pkg/mod \
      --mount=type=bind,source=go.mod,target=go.mod \
      --mount=type=bind,source=go.sum,target=go.sum \
      go mod download -x
@y
```diff
  # syntax=docker/dockerfile:1
  ARG GO_VERSION={{% param "example_go_version" %}}
  ARG GOLANGCI_LINT_VERSION={{% param "example_golangci_lint_version" %}}
- FROM golang:${GO_VERSION}-alpine AS base
+ FROM --platform=$BUILDPLATFORM golang:${GO_VERSION}-alpine AS base
  WORKDIR /src
  RUN --mount=type=cache,target=/go/pkg/mod \
      --mount=type=bind,source=go.mod,target=go.mod \
      --mount=type=bind,source=go.sum,target=go.sum \
      go mod download -x
@z

@x
  FROM base AS build-client
+ ARG TARGETOS
+ ARG TARGETARCH
  RUN --mount=type=cache,target=/go/pkg/mod \
      --mount=type=bind,target=. \
-     go build -o /bin/client ./cmd/client
+     GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -o /bin/client ./cmd/client
@y
  FROM base AS build-client
+ ARG TARGETOS
+ ARG TARGETARCH
  RUN --mount=type=cache,target=/go/pkg/mod \
      --mount=type=bind,target=. \
-     go build -o /bin/client ./cmd/client
+     GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -o /bin/client ./cmd/client
@z

@x
  FROM base AS build-server
+ ARG TARGETOS
+ ARG TARGETARCH
  RUN --mount=type=cache,target=/go/pkg/mod \
      --mount=type=bind,target=. \
-     go build -o /bin/server ./cmd/server
+     GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -o /bin/server ./cmd/server
@y
  FROM base AS build-server
+ ARG TARGETOS
+ ARG TARGETARCH
  RUN --mount=type=cache,target=/go/pkg/mod \
      --mount=type=bind,target=. \
-     go build -o /bin/server ./cmd/server
+     GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -o /bin/server ./cmd/server
@z

@x
  FROM scratch AS client
  COPY --from=build-client /bin/client /bin/
  ENTRYPOINT [ "/bin/client" ]
@y
  FROM scratch AS client
  COPY --from=build-client /bin/client /bin/
  ENTRYPOINT [ "/bin/client" ]
@z

@x
  FROM scratch AS server
  COPY --from=build-server /bin/server /bin/
  ENTRYPOINT [ "/bin/server" ]
@y
  FROM scratch AS server
  COPY --from=build-server /bin/server /bin/
  ENTRYPOINT [ "/bin/server" ]
@z

@x
  FROM scratch AS binaries
  COPY --from=build-client /bin/client /
  COPY --from=build-server /bin/server /
@y
  FROM scratch AS binaries
  COPY --from=build-client /bin/client /
  COPY --from=build-server /bin/server /
@z

@x
  FROM golangci/golangci-lint:${GOLANGCI_LINT_VERSION} as lint
  WORKDIR /test
  RUN --mount=type=bind,target=. \
      golangci-lint run
```
@y
  FROM golangci/golangci-lint:${GOLANGCI_LINT_VERSION} as lint
  WORKDIR /test
  RUN --mount=type=bind,target=. \
      golangci-lint run
```
@z

@x
The only thing left to do now is to run the actual build. To run a
multi-platform build, set the `--platform` option, and specify a CSV string of
the OS and architectures that you want to build for. The following command
illustrates how to build, and export, binaries for Mac (ARM64), Windows, and
Linux:
@y
The only thing left to do now is to run the actual build. To run a
multi-platform build, set the `--platform` option, and specify a CSV string of
the OS and architectures that you want to build for. The following command
illustrates how to build, and export, binaries for Mac (ARM64), Windows, and
Linux:
@z

@x
```console
$ docker build \
  --target=binaries \
  --output=bin \
  --platform=darwin/arm64,windows/amd64,linux/amd64 .
```
@y
```console
$ docker build \
  --target=binaries \
  --output=bin \
  --platform=darwin/arm64,windows/amd64,linux/amd64 .
```
@z

@x
When the build finishes, you’ll find client and server binaries for all of the
selected platforms in the `bin` directory:
@y
When the build finishes, you’ll find client and server binaries for all of the
selected platforms in the `bin` directory:
@z

@x
```diff
bin
├── darwin_arm64
│   ├── client
│   └── server
├── linux_amd64
│   ├── client
│   └── server
└── windows_amd64
    ├── client
    └── server
```
@y
```diff
bin
├── darwin_arm64
│   ├── client
│   └── server
├── linux_amd64
│   ├── client
│   └── server
└── windows_amd64
    ├── client
    └── server
```
@z

@x
## Summary
@y
## Summary
@z

@x
This section has demonstrated how you can get started with multi-platform builds
using emulation and cross-compilation.
@y
This section has demonstrated how you can get started with multi-platform builds
using emulation and cross-compilation.
@z

@x
Related information:
@y
Related information:
@z

@x
- [Multi-platfom images](../building/multi-platform.md)
- [containerd image store (Docker Desktop)](../../desktop/containerd.md)
- [containerd image store (Docker Engine)](../../storage/containerd.md)
@y
- [Multi-platfom images](../building/multi-platform.md)
- [containerd image store (Docker Desktop)](../../desktop/containerd.md)
- [containerd image store (Docker Engine)](../../storage/containerd.md)
@z

@x
You may also want to consider checking out
[xx - Dockerfile cross-compilation helpers](https://github.com/tonistiigi/xx).
`xx` is a Docker image containing utility scripts that make cross-compiling with Docker builds easier.
@y
You may also want to consider checking out
[xx - Dockerfile cross-compilation helpers](https://github.com/tonistiigi/xx).
`xx` is a Docker image containing utility scripts that make cross-compiling with Docker builds easier.
@z

@x
## Next steps
@y
## Next steps
@z

@x
This section is the final part of the Build with Docker guide. The following
page contains some pointers for where to go next.
@y
This section is the final part of the Build with Docker guide. The following
page contains some pointers for where to go next.
@z

@x
{{< button text="Next steps" url="next-steps.md" >}}
@y
{{< button text="Next steps" url="next-steps.md" >}}
@z
