%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Test
description: Running tests with Docker Build
keywords: build, buildkit, buildx, guide, tutorial, testing
---
@y
---
title: Test
description: Running tests with Docker Build
keywords: build, buildkit, buildx, guide, tutorial, testing
---
@z

@x
This section focuses on testing. The example in this section focuses on linting,
but the same principles apply for other kinds of tests as well, such as unit
tests. Code linting is a static analysis of code that helps you detect errors,
style violations, and anti-patterns.
@y
This section focuses on testing. The example in this section focuses on linting,
but the same principles apply for other kinds of tests as well, such as unit
tests. Code linting is a static analysis of code that helps you detect errors,
style violations, and anti-patterns.
@z

@x
The exact steps for how to test your code can vary a lot depending on the
programming language or framework that you use. The example application used in
this guide is written in Go. You will add a build step that uses
`golangci-lint`, a popular linters runner for Go.
@y
The exact steps for how to test your code can vary a lot depending on the
programming language or framework that you use. The example application used in
this guide is written in Go. You will add a build step that uses
`golangci-lint`, a popular linters runner for Go.
@z

@x
## Run tests
@y
## Run tests
@z

@x
The `golangci-lint` tool is available as an image on Docker Hub. Before you add
the lint step to the Dockerfile, you can try it out using a `docker run`
command.
@y
The `golangci-lint` tool is available as an image on Docker Hub. Before you add
the lint step to the Dockerfile, you can try it out using a `docker run`
command.
@z

@x
```console
$ docker run -v $PWD:/test -w /test \
  golangci/golangci-lint golangci-lint run
```
@y
```console
$ docker run -v $PWD:/test -w /test \
  golangci/golangci-lint golangci-lint run
```
@z

@x
You will notice that `golangci-lint` works: it finds an issue in the code where
there's a missing error check.
@y
You will notice that `golangci-lint` works: it finds an issue in the code where
there's a missing error check.
@z

@x
```text
cmd/server/main.go:23:10: Error return value of `w.Write` is not checked (errcheck)
		w.Write([]byte(translated))
		      ^
```
@y
```text
cmd/server/main.go:23:10: Error return value of `w.Write` is not checked (errcheck)
		w.Write([]byte(translated))
		      ^
```
@z

@x
Now you can add this as a step to the Dockerfile.
@y
Now you can add this as a step to the Dockerfile.
@z

@x
```diff
  # syntax=docker/dockerfile:1
  ARG GO_VERSION={{% param "example_go_version" %}}
+ ARG GOLANGCI_LINT_VERSION={{% param "example_golangci_lint_version" %}}
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
+ ARG GOLANGCI_LINT_VERSION={{% param "example_golangci_lint_version" %}}
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
  ARG APP_VERSION="0.0.0+unknown"
  RUN --mount=type=cache,target=/go/pkg/mod/ \
      --mount=type=bind,target=. \
      go build -ldflags "-X main.version=$APP_VERSION" -o /bin/server ./cmd/server
@y
  FROM base AS build-server
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
@y
  FROM scratch AS server
  COPY --from=build-server /bin/server /bin/
  ENTRYPOINT [ "/bin/server" ]
@z

@x
  FROM scratch AS binaries
  COPY --from=build-client /bin/client /
  COPY --from=build-server /bin/server /
+
+ FROM golangci/golangci-lint:${GOLANGCI_LINT_VERSION} as lint
+ WORKDIR /test
+ RUN --mount=type=bind,target=. \
+     golangci-lint run
```
@y
  FROM scratch AS binaries
  COPY --from=build-client /bin/client /
  COPY --from=build-server /bin/server /
+
+ FROM golangci/golangci-lint:${GOLANGCI_LINT_VERSION} as lint
+ WORKDIR /test
+ RUN --mount=type=bind,target=. \
+     golangci-lint run
```
@z

@x
The added `lint` stage uses the `golangci/golangci-lint` image from Docker Hub
to invoke the `golangci-lint run` command with a bind-mount for the build
context.
@y
The added `lint` stage uses the `golangci/golangci-lint` image from Docker Hub
to invoke the `golangci-lint run` command with a bind-mount for the build
context.
@z

@x
The lint stage is independent of any of the other stages in the Dockerfile.
Therefore, running a regular build won’t cause the lint step to run. To lint the
code, you must specify the `lint` stage:
@y
The lint stage is independent of any of the other stages in the Dockerfile.
Therefore, running a regular build won’t cause the lint step to run. To lint the
code, you must specify the `lint` stage:
@z

@x
```console
$ docker build --target=lint .
```
@y
```console
$ docker build --target=lint .
```
@z

@x
## Export test results
@y
## Export test results
@z

@x
In addition to running tests, it's sometimes useful to be able to export the
results of a test to a test report.
@y
In addition to running tests, it's sometimes useful to be able to export the
results of a test to a test report.
@z

@x
Exporting test results is no different to exporting binaries, as shown in the
previous section of this guide:
@y
Exporting test results is no different to exporting binaries, as shown in the
previous section of this guide:
@z

@x
1. Save the test results to a file.
2. Create a new stage in your Dockerfile using the `scratch` base image.
3. Export that stage using the `local` exporter.
@y
1. Save the test results to a file.
2. Create a new stage in your Dockerfile using the `scratch` base image.
3. Export that stage using the `local` exporter.
@z

@x
The exact steps on how to do this is left as a reader's exercise :-)
@y
The exact steps on how to do this is left as a reader's exercise :-)
@z

@x
## Summary
@y
## Summary
@z

@x
This section has shown an example on how you can use Docker builds to run tests
(or as shown in this section, linters).
@y
This section has shown an example on how you can use Docker builds to run tests
(or as shown in this section, linters).
@z

@x
## Next steps
@y
## Next steps
@z

@x
The next topic in this guide is multi-platform builds, using emulation and
cross-compilation.
@y
The next topic in this guide is multi-platform builds, using emulation and
cross-compilation.
@z

@x
{{< button text="Multi-platform" url="multi-platform.md" >}}
@y
{{< button text="Multi-platform" url="multi-platform.md" >}}
@z
