%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Mounts
description: Introduction to cache mounts and bind mounts in builds
keywords: build, buildkit, buildx, guide, tutorial, mounts, cache mounts, bind mounts
@y
title: Mounts
description: Introduction to cache mounts and bind mounts in builds
keywords: build, buildkit, buildx, guide, tutorial, mounts, cache mounts, bind mounts
@z

@x
This section describes how to use cache mounts and bind mounts with Docker
builds.
@y
This section describes how to use cache mounts and bind mounts with Docker
builds.
@z

@x
Cache mounts let you specify a persistent package cache to be used during
builds. The persistent cache helps speed up build steps, especially steps that
involve installing packages using a package manager. Having a persistent cache
for packages means that even if you rebuild a layer, you only download new or
changed packages.
@y
Cache mounts let you specify a persistent package cache to be used during
builds. The persistent cache helps speed up build steps, especially steps that
involve installing packages using a package manager. Having a persistent cache
for packages means that even if you rebuild a layer, you only download new or
changed packages.
@z

@x
Cache mounts are created using the `--mount` flag together with the `RUN`
instruction in the Dockerfile. To use a cache mount, the format for the flag is
`--mount=type=cache,target=<path>`, where `<path>` is the location of the cache
directory that you wish to mount into the container.
@y
Cache mounts are created using the `--mount` flag together with the `RUN`
instruction in the Dockerfile. To use a cache mount, the format for the flag is
`--mount=type=cache,target=<path>`, where `<path>` is the location of the cache
directory that you wish to mount into the container.
@z

@x
## Add a cache mount
@y
## Add a cache mount
@z

@x
The target path to use for the cache mount depends on the package manager you’re
using. The application example in this guide uses Go modules. That means that
the target directory for the cache mount is the directory where the Go module
cache gets written to. According to the
[Go modules reference](https://go.dev/ref/mod#module-cache), the default
location for the module cache is `$GOPATH/pkg/mod`, and the default value for
`$GOPATH` is `/go`.
@y
The target path to use for the cache mount depends on the package manager you’re
using. The application example in this guide uses Go modules. That means that
the target directory for the cache mount is the directory where the Go module
cache gets written to. According to the
[Go modules reference](https://go.dev/ref/mod#module-cache), the default
location for the module cache is `$GOPATH/pkg/mod`, and the default value for
`$GOPATH` is `/go`.
@z

@x
Update the build steps for downloading packages and compiling the program to
mount the `/go/pkg/mod` directory as a cache mount:
@y
Update the build steps for downloading packages and compiling the program to
mount the `/go/pkg/mod` directory as a cache mount:
@z

@x
```diff
  # syntax=docker/dockerfile:1
  FROM golang:{{% param "example_go_version" %}}-alpine AS base
  WORKDIR /src
  COPY go.mod go.sum .
- RUN go mod download
+ RUN --mount=type=cache,target=/go/pkg/mod/ \
+     go mod download -x
  COPY . .
@y
```diff
  # syntax=docker/dockerfile:1
  FROM golang:{{% param "example_go_version" %}}-alpine AS base
  WORKDIR /src
  COPY go.mod go.sum .
- RUN go mod download
+ RUN --mount=type=cache,target=/go/pkg/mod/ \
+     go mod download -x
  COPY . .
@z

@x
  FROM base AS build-client
- RUN go build -o /bin/client ./cmd/client
+ RUN --mount=type=cache,target=/go/pkg/mod/ \
+     go build -o /bin/client ./cmd/client
@y
  FROM base AS build-client
- RUN go build -o /bin/client ./cmd/client
+ RUN --mount=type=cache,target=/go/pkg/mod/ \
+     go build -o /bin/client ./cmd/client
@z

@x
  FROM base AS build-server
- RUN go build -o /bin/server ./cmd/server
+ RUN --mount=type=cache,target=/go/pkg/mod/ \
+     go build -o /bin/server ./cmd/server
@y
  FROM base AS build-server
- RUN go build -o /bin/server ./cmd/server
+ RUN --mount=type=cache,target=/go/pkg/mod/ \
+     go build -o /bin/server ./cmd/server
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
The `-x` flag added to the `go mod download` command prints the download
executions that take place. Adding this flag lets you see how the cache mount is
being used in the next step.
@y
The `-x` flag added to the `go mod download` command prints the download
executions that take place. Adding this flag lets you see how the cache mount is
being used in the next step.
@z

@x
## Rebuild the image
@y
## Rebuild the image
@z

@x
Before you rebuild the image, clear your build cache. This ensures that you're
starting from a clean slate, making it easier to see exactly what the build is
doing.
@y
Before you rebuild the image, clear your build cache. This ensures that you're
starting from a clean slate, making it easier to see exactly what the build is
doing.
@z

@x
```console
$ docker builder prune -af
```
@y
```console
$ docker builder prune -af
```
@z

@x
Now it’s time to rebuild the image. Invoke the build command, this time together
with the `--progress=plain` flag, while also redirecting the output to a log
file.
@y
Now it’s time to rebuild the image. Invoke the build command, this time together
with the `--progress=plain` flag, while also redirecting the output to a log
file.
@z

@x
```console
$ docker build --target=client --progress=plain . 2> log1.txt
```
@y
```console
$ docker build --target=client --progress=plain . 2> log1.txt
```
@z

@x
When the build has finished, inspect the `log1.txt` file. The logs show how the
Go modules were downloaded as part of the build.
@y
When the build has finished, inspect the `log1.txt` file. The logs show how the
Go modules were downloaded as part of the build.
@z

@x
```console
$ awk '/proxy.golang.org/' log1.txt
#11 0.168 # get https://proxy.golang.org/github.com/charmbracelet/lipgloss/@v/v0.6.0.mod
#11 0.168 # get https://proxy.golang.org/github.com/aymanbagabas/go-osc52/@v/v1.0.3.mod
#11 0.168 # get https://proxy.golang.org/github.com/atotto/clipboard/@v/v0.1.4.mod
#11 0.168 # get https://proxy.golang.org/github.com/charmbracelet/bubbletea/@v/v0.23.1.mod
#11 0.169 # get https://proxy.golang.org/github.com/charmbracelet/bubbles/@v/v0.14.0.mod
#11 0.218 # get https://proxy.golang.org/github.com/charmbracelet/bubbles/@v/v0.14.0.mod: 200 OK (0.049s)
#11 0.218 # get https://proxy.golang.org/github.com/aymanbagabas/go-osc52/@v/v1.0.3.mod: 200 OK (0.049s)
#11 0.218 # get https://proxy.golang.org/github.com/containerd/console/@v/v1.0.3.mod
#11 0.218 # get https://proxy.golang.org/github.com/go-chi/chi/v5/@v/v5.0.0.mod
#11 0.219 # get https://proxy.golang.org/github.com/charmbracelet/bubbletea/@v/v0.23.1.mod: 200 OK (0.050s)
#11 0.219 # get https://proxy.golang.org/github.com/atotto/clipboard/@v/v0.1.4.mod: 200 OK (0.051s)
#11 0.219 # get https://proxy.golang.org/github.com/charmbracelet/lipgloss/@v/v0.6.0.mod: 200 OK (0.051s)
...
```
@y
```console
$ awk '/proxy.golang.org/' log1.txt
#11 0.168 # get https://proxy.golang.org/github.com/charmbracelet/lipgloss/@v/v0.6.0.mod
#11 0.168 # get https://proxy.golang.org/github.com/aymanbagabas/go-osc52/@v/v1.0.3.mod
#11 0.168 # get https://proxy.golang.org/github.com/atotto/clipboard/@v/v0.1.4.mod
#11 0.168 # get https://proxy.golang.org/github.com/charmbracelet/bubbletea/@v/v0.23.1.mod
#11 0.169 # get https://proxy.golang.org/github.com/charmbracelet/bubbles/@v/v0.14.0.mod
#11 0.218 # get https://proxy.golang.org/github.com/charmbracelet/bubbles/@v/v0.14.0.mod: 200 OK (0.049s)
#11 0.218 # get https://proxy.golang.org/github.com/aymanbagabas/go-osc52/@v/v1.0.3.mod: 200 OK (0.049s)
#11 0.218 # get https://proxy.golang.org/github.com/containerd/console/@v/v1.0.3.mod
#11 0.218 # get https://proxy.golang.org/github.com/go-chi/chi/v5/@v/v5.0.0.mod
#11 0.219 # get https://proxy.golang.org/github.com/charmbracelet/bubbletea/@v/v0.23.1.mod: 200 OK (0.050s)
#11 0.219 # get https://proxy.golang.org/github.com/atotto/clipboard/@v/v0.1.4.mod: 200 OK (0.051s)
#11 0.219 # get https://proxy.golang.org/github.com/charmbracelet/lipgloss/@v/v0.6.0.mod: 200 OK (0.051s)
...
```
@z

@x
Now, in order to see that the cache mount is being used, change the version of
one of the Go modules that your program imports. By changing the module version,
you're forcing Go to download the new version of the dependency the next time
you build. If you weren’t using cache mounts, your system would re-download all
modules. But because you've added a cache mount, Go can reuse most of the
modules and only download the package versions that doesn't already exist in the
`/go/pkg/mod` directory.
@y
Now, in order to see that the cache mount is being used, change the version of
one of the Go modules that your program imports. By changing the module version,
you're forcing Go to download the new version of the dependency the next time
you build. If you weren’t using cache mounts, your system would re-download all
modules. But because you've added a cache mount, Go can reuse most of the
modules and only download the package versions that doesn't already exist in the
`/go/pkg/mod` directory.
@z

@x
Update the version of the `chi` package that the server component of the
application uses:
@y
Update the version of the `chi` package that the server component of the
application uses:
@z

@x
```console
$ docker run -v $PWD:$PWD -w $PWD golang:{{% param "example_go_version" %}}-alpine \
    go get github.com/go-chi/chi/v5@v5.0.8
```
@y
```console
$ docker run -v $PWD:$PWD -w $PWD golang:{{% param "example_go_version" %}}-alpine \
    go get github.com/go-chi/chi/v5@v5.0.8
```
@z

@x
Now, run another build, and again redirect the build logs to a log file:
@y
Now, run another build, and again redirect the build logs to a log file:
@z

@x
```console
$ docker build --target=client --progress=plain . 2> log2.txt
```
@y
```console
$ docker build --target=client --progress=plain . 2> log2.txt
```
@z

@x
Now if you inspect the `log2.txt` file, you’ll find that only the `chi` package
that was changed has been downloaded:
@y
Now if you inspect the `log2.txt` file, you’ll find that only the `chi` package
that was changed has been downloaded:
@z

@x
```console
$ awk '/proxy.golang.org/' log2.txt
#10 0.143 # get https://proxy.golang.org/github.com/go-chi/chi/v5/@v/v5.0.8.mod
#10 0.190 # get https://proxy.golang.org/github.com/go-chi/chi/v5/@v/v5.0.8.mod: 200 OK (0.047s)
#10 0.190 # get https://proxy.golang.org/github.com/go-chi/chi/v5/@v/v5.0.8.info
#10 0.199 # get https://proxy.golang.org/github.com/go-chi/chi/v5/@v/v5.0.8.info: 200 OK (0.008s)
#10 0.201 # get https://proxy.golang.org/github.com/go-chi/chi/v5/@v/v5.0.8.zip
#10 0.209 # get https://proxy.golang.org/github.com/go-chi/chi/v5/@v/v5.0.8.zip: 200 OK (0.008s)
```
@y
```console
$ awk '/proxy.golang.org/' log2.txt
#10 0.143 # get https://proxy.golang.org/github.com/go-chi/chi/v5/@v/v5.0.8.mod
#10 0.190 # get https://proxy.golang.org/github.com/go-chi/chi/v5/@v/v5.0.8.mod: 200 OK (0.047s)
#10 0.190 # get https://proxy.golang.org/github.com/go-chi/chi/v5/@v/v5.0.8.info
#10 0.199 # get https://proxy.golang.org/github.com/go-chi/chi/v5/@v/v5.0.8.info: 200 OK (0.008s)
#10 0.201 # get https://proxy.golang.org/github.com/go-chi/chi/v5/@v/v5.0.8.zip
#10 0.209 # get https://proxy.golang.org/github.com/go-chi/chi/v5/@v/v5.0.8.zip: 200 OK (0.008s)
```
@z

@x
## Add bind mounts
@y
## Add bind mounts
@z

@x
There are a few more small optimizations that you can implement to improve the
Dockerfile. Currently, it's using the `COPY` instruction to pull in the `go.mod`
and `go.sum` files before downloading modules. Instead of copying those files
over to the container’s filesystem, you can use a bind mount. A bind mount makes
the files available to the container directly from the host. This change removes
the need for the additional `COPY` instruction (and layer) entirely.
@y
There are a few more small optimizations that you can implement to improve the
Dockerfile. Currently, it's using the `COPY` instruction to pull in the `go.mod`
and `go.sum` files before downloading modules. Instead of copying those files
over to the container’s filesystem, you can use a bind mount. A bind mount makes
the files available to the container directly from the host. This change removes
the need for the additional `COPY` instruction (and layer) entirely.
@z

@x
```diff
  # syntax=docker/dockerfile:1
  FROM golang:{{% param "example_go_version" %}}-alpine AS base
  WORKDIR /src
- COPY go.mod go.sum .
  RUN --mount=type=cache,target=/go/pkg/mod/ \
+     --mount=type=bind,source=go.sum,target=go.sum \
+     --mount=type=bind,source=go.mod,target=go.mod \
      go mod download -x
  COPY . .
@y
```diff
  # syntax=docker/dockerfile:1
  FROM golang:{{% param "example_go_version" %}}-alpine AS base
  WORKDIR /src
- COPY go.mod go.sum .
  RUN --mount=type=cache,target=/go/pkg/mod/ \
+     --mount=type=bind,source=go.sum,target=go.sum \
+     --mount=type=bind,source=go.mod,target=go.mod \
      go mod download -x
  COPY . .
@z

@x
  FROM base AS build-client
  RUN --mount=type=cache,target=/go/pkg/mod/ \
      go build -o /bin/client ./cmd/client
@y
  FROM base AS build-client
  RUN --mount=type=cache,target=/go/pkg/mod/ \
      go build -o /bin/client ./cmd/client
@z

@x
  FROM base AS build-server
  RUN --mount=type=cache,target=/go/pkg/mod/ \
      go build -o /bin/server ./cmd/server
@y
  FROM base AS build-server
  RUN --mount=type=cache,target=/go/pkg/mod/ \
      go build -o /bin/server ./cmd/server
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
Similarly, you can use the same technique to remove the need for the second
`COPY` instruction as well. Specify bind mounts in the `build-client` and
`build-server` stages for mounting the current working directory.
@y
Similarly, you can use the same technique to remove the need for the second
`COPY` instruction as well. Specify bind mounts in the `build-client` and
`build-server` stages for mounting the current working directory.
@z

@x
```diff
  # syntax=docker/dockerfile:1
  FROM golang:{{% param "example_go_version" %}}-alpine AS base
  WORKDIR /src
  RUN --mount=type=cache,target=/go/pkg/mod/ \
      --mount=type=bind,source=go.sum,target=go.sum \
      --mount=type=bind,source=go.mod,target=go.mod \
      go mod download -x
- COPY . .
@y
```diff
  # syntax=docker/dockerfile:1
  FROM golang:{{% param "example_go_version" %}}-alpine AS base
  WORKDIR /src
  RUN --mount=type=cache,target=/go/pkg/mod/ \
      --mount=type=bind,source=go.sum,target=go.sum \
      --mount=type=bind,source=go.mod,target=go.mod \
      go mod download -x
- COPY . .
@z

@x
  FROM base AS build-client
  RUN --mount=type=cache,target=/go/pkg/mod/ \
+     --mount=type=bind,target=. \
      go build -o /bin/client ./cmd/client
@y
  FROM base AS build-client
  RUN --mount=type=cache,target=/go/pkg/mod/ \
+     --mount=type=bind,target=. \
      go build -o /bin/client ./cmd/client
@z

@x
  FROM base AS build-server
  RUN --mount=type=cache,target=/go/pkg/mod/ \
+     --mount=type=bind,target=. \
      go build -o /bin/server ./cmd/server
@y
  FROM base AS build-server
  RUN --mount=type=cache,target=/go/pkg/mod/ \
+     --mount=type=bind,target=. \
      go build -o /bin/server ./cmd/server
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
## Summary
@y
## Summary
@z

@x
This section has shown how you can improve your build speed using cache and bind
mounts.
@y
This section has shown how you can improve your build speed using cache and bind
mounts.
@z

@x
Related information:
@y
Related information:
@z

@x
- [Dockerfile reference](../../reference/dockerfile.md#run---mount)
- [Bind mounts](/engine/storage/bind-mounts.md)
@y
- [Dockerfile reference](../../reference/dockerfile.md#run---mount)
- [Bind mounts](engine/storage/bind-mounts.md)
@z

@x
## Next steps
@y
## Next steps
@z

@x
The next section of this guide is an introduction to making your builds
configurable, using build arguments.
@y
The next section of this guide is an introduction to making your builds
configurable, using build arguments.
@z

@x
{{< button text="Build arguments" url="build-args.md" >}}
@y
{{< button text="Build arguments" url="build-args.md" >}}
@z
