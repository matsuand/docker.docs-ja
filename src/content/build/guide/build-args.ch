%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Build arguments
description: Introduction to configurable builds, using build args
keywords: build, buildkit, buildx, guide, tutorial, build arguments, arg
---
@y
---
title: Build arguments
description: Introduction to configurable builds, using build args
keywords: build, buildkit, buildx, guide, tutorial, build arguments, arg
---
@z

@x
Build arguments is a great way to add flexibility to your builds. You can pass
build arguments at build-time, and you can set a default value that the builder
uses as a fallback.
@y
Build arguments is a great way to add flexibility to your builds. You can pass
build arguments at build-time, and you can set a default value that the builder
uses as a fallback.
@z

@x
## Change runtime versions
@y
## Change runtime versions
@z

@x
A practical use case for build arguments is to specify runtime versions for
build stages. Your image uses the `golang:{{% param "example_go_version" %}}-alpine`
image as a base image.
But what if someone wanted to use a different version of Go for building the
application? They could update the version number inside the Dockerfile, but
that’s inconvenient, it makes switching between versions more tedious than it
has to be. Build arguments make life easier:
@y
A practical use case for build arguments is to specify runtime versions for
build stages. Your image uses the `golang:{{% param "example_go_version" %}}-alpine`
image as a base image.
But what if someone wanted to use a different version of Go for building the
application? They could update the version number inside the Dockerfile, but
that’s inconvenient, it makes switching between versions more tedious than it
has to be. Build arguments make life easier:
@z

@x
```diff
  # syntax=docker/dockerfile:1
- FROM golang:{{% param "example_go_version" %}}-alpine AS base
+ ARG GO_VERSION={{% param "example_go_version" %}}
+ FROM golang:${GO_VERSION}-alpine AS base
  WORKDIR /src
  RUN --mount=type=cache,target=/go/pkg/mod/ \
      --mount=type=bind,source=go.sum,target=go.sum \
      --mount=type=bind,source=go.mod,target=go.mod \
      go mod download -x
@y
```diff
  # syntax=docker/dockerfile:1
- FROM golang:{{% param "example_go_version" %}}-alpine AS base
+ ARG GO_VERSION={{% param "example_go_version" %}}
+ FROM golang:${GO_VERSION}-alpine AS base
  WORKDIR /src
  RUN --mount=type=cache,target=/go/pkg/mod/ \
      --mount=type=bind,source=go.sum,target=go.sum \
      --mount=type=bind,source=go.mod,target=go.mod \
      go mod download -x
@z

@x
  FROM base AS build-client
  RUN --mount=type=cache,target=/go/pkg/mod/ \
      --mount=type=bind,target=. \
      go build -o /bin/client ./cmd/client
@y
  FROM base AS build-client
  RUN --mount=type=cache,target=/go/pkg/mod/ \
      --mount=type=bind,target=. \
      go build -o /bin/client ./cmd/client
@z

@x
  FROM base AS build-server
  RUN --mount=type=cache,target=/go/pkg/mod/ \
      --mount=type=bind,target=. \
      go build -o /bin/server ./cmd/server
@y
  FROM base AS build-server
  RUN --mount=type=cache,target=/go/pkg/mod/ \
      --mount=type=bind,target=. \
      go build -o /bin/server ./cmd/server
@z

@x
  FROM scratch AS client
  COPY --from=build /bin/client /bin/
  ENTRYPOINT [ "/bin/client" ]
@y
  FROM scratch AS client
  COPY --from=build /bin/client /bin/
  ENTRYPOINT [ "/bin/client" ]
@z

@x
  FROM scratch AS server
  COPY --from=build /bin/server /bin/
  ENTRYPOINT [ "/bin/server" ]
```
@y
  FROM scratch AS server
  COPY --from=build /bin/server /bin/
  ENTRYPOINT [ "/bin/server" ]
```
@z

@x
The `ARG` keyword is interpolated in the image name in the `FROM` instruction.
The default value of the `GO_VERSION` build argument is set to `{{% param "example_go_version" %}}`.
If the build doesn't receive a `GO_VERSION` build argument, the `FROM` instruction
resolves to `golang:{{% param "example_go_version" %}}-alpine`.
@y
The `ARG` keyword is interpolated in the image name in the `FROM` instruction.
The default value of the `GO_VERSION` build argument is set to `{{% param "example_go_version" %}}`.
If the build doesn't receive a `GO_VERSION` build argument, the `FROM` instruction
resolves to `golang:{{% param "example_go_version" %}}-alpine`.
@z

@x
Try setting a different version of Go to use for building, using the
`--build-arg` flag for the build command:
@y
Try setting a different version of Go to use for building, using the
`--build-arg` flag for the build command:
@z

@x
```console
$ docker build --build-arg="GO_VERSION=1.19" .
```
@y
```console
$ docker build --build-arg="GO_VERSION=1.19" .
```
@z

@x
Running this command results in a build using the `golang:1.19-alpine` image.
@y
Running this command results in a build using the `golang:1.19-alpine` image.
@z

@x
## Inject values
@y
## Inject values
@z

@x
You can also make use of build arguments to modify values in the source code of
your program, at build time. This is useful for dynamically injecting
information, avoiding hard-coded values. With Go, consuming external values at
build time is done using linker flags, or `-ldflags`.
@y
You can also make use of build arguments to modify values in the source code of
your program, at build time. This is useful for dynamically injecting
information, avoiding hard-coded values. With Go, consuming external values at
build time is done using linker flags, or `-ldflags`.
@z

@x
The server part of the application contains a conditional statement to print the
app version, if a version is specified:
@y
The server part of the application contains a conditional statement to print the
app version, if a version is specified:
@z

@x
```go
// cmd/server/main.go
var version string
@y
```go
// cmd/server/main.go
var version string
@z

@x
func main() {
	if version != "" {
		log.Printf("Version: %s", version)
	}
```
@y
func main() {
	if version != "" {
		log.Printf("Version: %s", version)
	}
```
@z

@x
You could declare the version string value directly in the code. But, updating
the version to line up with the release version of the application would require
updating the code ahead of every release. That would be both tedious and
error-prone. A better solution is to pass the version string as a build
argument, and inject the build argument into the code.
@y
You could declare the version string value directly in the code. But, updating
the version to line up with the release version of the application would require
updating the code ahead of every release. That would be both tedious and
error-prone. A better solution is to pass the version string as a build
argument, and inject the build argument into the code.
@z

@x
The following example adds an `APP_VERSION` build argument to the `build-server`
stage. The Go compiler uses the value of the build argument to set the value of
a variable in the code.
@y
The following example adds an `APP_VERSION` build argument to the `build-server`
stage. The Go compiler uses the value of the build argument to set the value of
a variable in the code.
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
  FROM base AS build-client
  RUN --mount=type=cache,target=/go/pkg/mod/ \
      --mount=type=bind,target=. \
      go build -o /bin/client ./cmd/client
@y
  FROM base AS build-client
  RUN --mount=type=cache,target=/go/pkg/mod/ \
      --mount=type=bind,target=. \
      go build -o /bin/client ./cmd/client
@z

@x
  FROM base AS build-server
+ ARG APP_VERSION="v0.0.0+unknown"
  RUN --mount=type=cache,target=/go/pkg/mod/ \
      --mount=type=bind,target=. \
-     go build -o /bin/server ./cmd/server
+     go build -ldflags "-X main.version=$APP_VERSION" -o /bin/server ./cmd/server
@y
  FROM base AS build-server
+ ARG APP_VERSION="v0.0.0+unknown"
  RUN --mount=type=cache,target=/go/pkg/mod/ \
      --mount=type=bind,target=. \
-     go build -o /bin/server ./cmd/server
+     go build -ldflags "-X main.version=$APP_VERSION" -o /bin/server ./cmd/server
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
```
@y
  FROM scratch AS server
  COPY --from=build-server /bin/server /bin/
  ENTRYPOINT [ "/bin/server" ]
```
@z

@x
Now the version of the server is injected when building the binary, without having to update
the source code. To verify this, you can build the `server` target and start a
container with `docker run`. The server outputs `v0.0.1` as the version on
startup.
@y
Now the version of the server is injected when building the binary, without having to update
the source code. To verify this, you can build the `server` target and start a
container with `docker run`. The server outputs `v0.0.1` as the version on
startup.
@z

@x
```console
$ docker build --target=server --build-arg="APP_VERSION=v0.0.1" --tag=buildme-server .
$ docker run buildme-server
2023/04/06 08:54:27 Version: v0.0.1
2023/04/06 08:54:27 Starting server...
2023/04/06 08:54:27 Listening on HTTP port 3000
```
@y
```console
$ docker build --target=server --build-arg="APP_VERSION=v0.0.1" --tag=buildme-server .
$ docker run buildme-server
2023/04/06 08:54:27 Version: v0.0.1
2023/04/06 08:54:27 Starting server...
2023/04/06 08:54:27 Listening on HTTP port 3000
```
@z

@x
## Summary
@y
## Summary
@z

@x
This section showed how you can use build arguments to make builds more
configurable, and inject values at build-time.
@y
This section showed how you can use build arguments to make builds more
configurable, and inject values at build-time.
@z

@x
Related information:
@y
Related information:
@z

@x
- [`ARG` Dockerfile reference](../../engine/reference/builder.md#arg)
@y
- [`ARG` Dockerfile reference](../../engine/reference/builder.md#arg)
@z

@x
## Next steps
@y
## Next steps
@z

@x
The next section of this guide shows how you can use Docker builds to create not
only container images, but executable binaries as well.
@y
The next section of this guide shows how you can use Docker builds to create not
only container images, but executable binaries as well.
@z

@x
{{< button text="Export binaries" url="export.md" >}}
@y
{{< button text="Export binaries" url="export.md" >}}
@z
