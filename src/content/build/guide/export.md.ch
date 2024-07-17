%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Export binaries
description: Using Docker builds to create and export executable binaries
keywords: build, buildkit, buildx, guide, tutorial, build arguments, arg
---
@y
---
title: Export binaries
description: Using Docker builds to create and export executable binaries
keywords: build, buildkit, buildx, guide, tutorial, build arguments, arg
---
@z

@x
Did you know that you can use Docker to build your application to standalone
binaries? Sometimes, you don’t want to package and distribute your application
as a Docker image. Use Docker to build your application, and use exporters to
save the output to disk.
@y
Did you know that you can use Docker to build your application to standalone
binaries? Sometimes, you don’t want to package and distribute your application
as a Docker image. Use Docker to build your application, and use exporters to
save the output to disk.
@z

@x
The default output format for `docker build` is a container image. That image is
automatically loaded to your local image store, where you can run a container
from that image, or push it to a registry. Under the hood, this uses the default
exporter, called the `docker` exporter.
@y
The default output format for `docker build` is a container image. That image is
automatically loaded to your local image store, where you can run a container
from that image, or push it to a registry. Under the hood, this uses the default
exporter, called the `docker` exporter.
@z

@x
To export your build results as files instead, you can use the `local` exporter.
The `local` exporter saves the filesystem of the build container to the
specified directory on the host machine.
@y
To export your build results as files instead, you can use the `local` exporter.
The `local` exporter saves the filesystem of the build container to the
specified directory on the host machine.
@z

@x
## Export binaries
@y
## Export binaries
@z

@x
To use the `local` exporter, pass the `--output` option to the `docker build`
command. The `--output` flag takes one argument: the destination on the host
machine where you want to save the files.
@y
To use the `local` exporter, pass the `--output` option to the `docker build`
command. The `--output` flag takes one argument: the destination on the host
machine where you want to save the files.
@z

@x
The following commands exports the files from of the `server` target to the
current working directory on the host filesystem:
@y
The following commands exports the files from of the `server` target to the
current working directory on the host filesystem:
@z

@x
```console
$ docker build --output=. --target=server .
```
@y
```console
$ docker build --output=. --target=server .
```
@z

@x
Running this command creates a binary at `./bin/server`. It’s created under the
`bin/` directory because that’s where the file was located inside the build
container.
@y
Running this command creates a binary at `./bin/server`. It’s created under the
`bin/` directory because that’s where the file was located inside the build
container.
@z

@x
```console
$ ls -l ./bin
total 14576
-rwxr-xr-x  1 user  user  7459368 Apr  6 09:27 server
```
@y
```console
$ ls -l ./bin
total 14576
-rwxr-xr-x  1 user  user  7459368 Apr  6 09:27 server
```
@z

@x
If you want to create a build that exports both binaries, you can create another
build stage in the Dockerfile that copies both of the binaries from each build
stage:
@y
If you want to create a build that exports both binaries, you can create another
build stage in the Dockerfile that copies both of the binaries from each build
stage:
@z

@x
```diff
  # syntax=docker/dockerfile:1
  ARG GO_VERSION={{% param "example_go_version" %}}
  FROM golang:${GO_VERSION}-alpine AS base
  WORKDIR /src
  RUN --mount=type=cache,target=/go/pkg/mod/ \
      --mount=type=bind,source=go.sum,target=go.sum \
      --mount=type=bind,source=go.mod,target=go.mod \
      go mod download -x
@y
```diff
  # syntax=docker/dockerfile:1
  ARG GO_VERSION={{% param "example_go_version" %}}
  FROM golang:${GO_VERSION}-alpine AS base
  WORKDIR /src
  RUN --mount=type=cache,target=/go/pkg/mod/ \
      --mount=type=bind,source=go.sum,target=go.sum \
      --mount=type=bind,source=go.mod,target=go.mod \
      go mod download -x
@z

@x
  FROM base as build-client
  RUN --mount=type=cache,target=/go/pkg/mod/ \
      --mount=type=bind,target=. \
      go build -o /bin/client ./cmd/client
@y
  FROM base as build-client
  RUN --mount=type=cache,target=/go/pkg/mod/ \
      --mount=type=bind,target=. \
      go build -o /bin/client ./cmd/client
@z

@x
  FROM base as build-server
  ARG APP_VERSION="0.0.0+unknown"
  RUN --mount=type=cache,target=/go/pkg/mod/ \
      --mount=type=bind,target=. \
      go build -ldflags "-X main.version=$APP_VERSION" -o /bin/server ./cmd/server
@y
  FROM base as build-server
  ARG APP_VERSION="0.0.0+unknown"
  RUN --mount=type=cache,target=/go/pkg/mod/ \
      --mount=type=bind,target=. \
      go build -ldflags "-X main.version=$APP_VERSION" -o /bin/server ./cmd/server
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
+
+ FROM scratch AS binaries
+ COPY --from=build-client /bin/client /
+ COPY --from=build-server /bin/server /
```
@y
  FROM scratch AS server
  COPY --from=build-server /bin/server /bin/
  ENTRYPOINT [ "/bin/server" ]
+
+ FROM scratch AS binaries
+ COPY --from=build-client /bin/client /
+ COPY --from=build-server /bin/server /
```
@z

@x
Now you can build the `binaries` target using the `--output` option to export
both the client and server binaries.
@y
Now you can build the `binaries` target using the `--output` option to export
both the client and server binaries.
@z

@x
```console
$ docker build --output=bin --target=binaries .
$ ls -l ./bin
total 29392
-rwxr-xr-x  1 user  user  7581933 Apr  6 09:33 client
-rwxr-xr-x  1 user  user  7459368 Apr  6 09:33 server
```
@y
```console
$ docker build --output=bin --target=binaries .
$ ls -l ./bin
total 29392
-rwxr-xr-x  1 user  user  7581933 Apr  6 09:33 client
-rwxr-xr-x  1 user  user  7459368 Apr  6 09:33 server
```
@z

@x
## Summary
@y
## Summary
@z

@x
This section has demonstrated how you can use Docker to build and export
standalone binaries. These binaries can be distributed freely, and don’t require
a container runtime like the Docker daemon.
@y
This section has demonstrated how you can use Docker to build and export
standalone binaries. These binaries can be distributed freely, and don’t require
a container runtime like the Docker daemon.
@z

@x
The binaries you've generated so far are Linux binaries. That's because the
build environment is Linux. If your host OS is Linux, you can run these files.
Building binaries that work on Mac or Windows machines requires cross-compilation.
This is explored later on in this guide.
@y
The binaries you've generated so far are Linux binaries. That's because the
build environment is Linux. If your host OS is Linux, you can run these files.
Building binaries that work on Mac or Windows machines requires cross-compilation.
This is explored later on in this guide.
@z

@x
Related information:
@y
Related information:
@z

@x
- [`docker build --output` CLI reference](../../reference/cli/docker/buildx/build.md#output)
- [Build exporters](../exporters/index.md)
@y
- [`docker build --output` CLI reference](../../reference/cli/docker/buildx/build.md#output)
- [Build exporters](../exporters/index.md)
@z

@x
## Next steps
@y
## Next steps
@z

@x
The next topic of this guide is testing: how you can use Docker to run
application tests.
@y
The next topic of this guide is testing: how you can use Docker to run
application tests.
@z

@x
{{< button text="Test" url="test.md" >}}
@y
{{< button text="Test" url="test.md" >}}
@z
