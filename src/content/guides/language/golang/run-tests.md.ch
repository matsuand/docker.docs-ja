%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Run your tests using Go test
linkTitle: Run your tests
weight: 30
keywords: build, go, golang, test
description: How to build and run your Go tests in a container
aliases:
- /get-started/golang/run-tests/
- /language/golang/run-tests/
---
@y
---
title: Run your tests using Go test
linkTitle: Run your tests
weight: 30
keywords: build, go, golang, test
description: How to build and run your Go tests in a container
aliases:
- /get-started/golang/run-tests/
- /language/golang/run-tests/
---
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Complete the [Build your Go image](build-images.md) section of this guide.
@y
Complete the [Build your Go image](build-images.md) section of this guide.
@z

@x
## Overview
@y
## Overview
@z

@x
Testing is an essential part of modern software development. Testing can mean a
lot of things to different development teams. There are unit tests, integration
tests and end-to-end testing. In this guide you take a look at running your unit
tests in Docker when building.
@y
Testing is an essential part of modern software development. Testing can mean a
lot of things to different development teams. There are unit tests, integration
tests and end-to-end testing. In this guide you take a look at running your unit
tests in Docker when building.
@z

@x
For this section, use the `docker-gs-ping` project that you cloned in [Build
your Go image](build-images.md).
@y
For this section, use the `docker-gs-ping` project that you cloned in [Build
your Go image](build-images.md).
@z

@x
## Run tests when building
@y
## Run tests when building
@z

@x
To run your tests when building, you need to add a test stage to the
`Dockerfile.multistage`. The `Dockerfile.multistage` in the sample application's
repository already has the following content:
@y
To run your tests when building, you need to add a test stage to the
`Dockerfile.multistage`. The `Dockerfile.multistage` in the sample application's
repository already has the following content:
@z

@x
```dockerfile {hl_lines="15-17"}
# syntax=docker/dockerfile:1
@y
```dockerfile {hl_lines="15-17"}
# syntax=docker/dockerfile:1
@z

@x
# Build the application from source
FROM golang:1.19 AS build-stage
@y
# Build the application from source
FROM golang:1.19 AS build-stage
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
COPY go.mod go.sum ./
RUN go mod download
@y
COPY go.mod go.sum ./
RUN go mod download
@z

@x
COPY *.go ./
@y
COPY *.go ./
@z

@x
RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-gs-ping
@y
RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-gs-ping
@z

@x
# Run the tests in the container
FROM build-stage AS run-test-stage
RUN go test -v ./...
@y
# Run the tests in the container
FROM build-stage AS run-test-stage
RUN go test -v ./...
@z

@x
# Deploy the application binary into a lean image
FROM gcr.io/distroless/base-debian11 AS build-release-stage
@y
# Deploy the application binary into a lean image
FROM gcr.io/distroless/base-debian11 AS build-release-stage
@z

@x
WORKDIR /
@y
WORKDIR /
@z

@x
COPY --from=build-stage /docker-gs-ping /docker-gs-ping
@y
COPY --from=build-stage /docker-gs-ping /docker-gs-ping
@z

@x
EXPOSE 8080
@y
EXPOSE 8080
@z

@x
USER nonroot:nonroot
@y
USER nonroot:nonroot
@z

@x
ENTRYPOINT ["/docker-gs-ping"]
```
@y
ENTRYPOINT ["/docker-gs-ping"]
```
@z

@x
Run the following command to build an image using the `run-test-stage` stage as the target and view the test results. Include `--progress plain` to view the build output, `--no-cache` to ensure the tests always run, and `--target run-test-stage` to target the test stage.
@y
Run the following command to build an image using the `run-test-stage` stage as the target and view the test results. Include `--progress plain` to view the build output, `--no-cache` to ensure the tests always run, and `--target run-test-stage` to target the test stage.
@z

@x
```console
$ docker build -f Dockerfile.multistage -t docker-gs-ping-test --progress plain --no-cache --target run-test-stage .
```
@y
```console
$ docker build -f Dockerfile.multistage -t docker-gs-ping-test --progress plain --no-cache --target run-test-stage .
```
@z

@x
You should see output containing the following.
@y
You should see output containing the following.
@z

@x
```text
#13 [run-test-stage 1/1] RUN go test -v ./...
#13 4.915 === RUN   TestIntMinBasic
#13 4.915 --- PASS: TestIntMinBasic (0.00s)
#13 4.915 === RUN   TestIntMinTableDriven
#13 4.915 === RUN   TestIntMinTableDriven/0,1
#13 4.915 === RUN   TestIntMinTableDriven/1,0
#13 4.915 === RUN   TestIntMinTableDriven/2,-2
#13 4.915 === RUN   TestIntMinTableDriven/0,-1
#13 4.915 === RUN   TestIntMinTableDriven/-1,0
#13 4.915 --- PASS: TestIntMinTableDriven (0.00s)
#13 4.915     --- PASS: TestIntMinTableDriven/0,1 (0.00s)
#13 4.915     --- PASS: TestIntMinTableDriven/1,0 (0.00s)
#13 4.915     --- PASS: TestIntMinTableDriven/2,-2 (0.00s)
#13 4.915     --- PASS: TestIntMinTableDriven/0,-1 (0.00s)
#13 4.915     --- PASS: TestIntMinTableDriven/-1,0 (0.00s)
#13 4.915 PASS
```
@y
```text
#13 [run-test-stage 1/1] RUN go test -v ./...
#13 4.915 === RUN   TestIntMinBasic
#13 4.915 --- PASS: TestIntMinBasic (0.00s)
#13 4.915 === RUN   TestIntMinTableDriven
#13 4.915 === RUN   TestIntMinTableDriven/0,1
#13 4.915 === RUN   TestIntMinTableDriven/1,0
#13 4.915 === RUN   TestIntMinTableDriven/2,-2
#13 4.915 === RUN   TestIntMinTableDriven/0,-1
#13 4.915 === RUN   TestIntMinTableDriven/-1,0
#13 4.915 --- PASS: TestIntMinTableDriven (0.00s)
#13 4.915     --- PASS: TestIntMinTableDriven/0,1 (0.00s)
#13 4.915     --- PASS: TestIntMinTableDriven/1,0 (0.00s)
#13 4.915     --- PASS: TestIntMinTableDriven/2,-2 (0.00s)
#13 4.915     --- PASS: TestIntMinTableDriven/0,-1 (0.00s)
#13 4.915     --- PASS: TestIntMinTableDriven/-1,0 (0.00s)
#13 4.915 PASS
```
@z

@x
## Next steps
@y
## Next steps
@z

@x
In this section, you learned how to run tests when building your image. Next,
you’ll learn how to set up a CI/CD pipeline using GitHub Actions.
@y
In this section, you learned how to run tests when building your image. Next,
you’ll learn how to set up a CI/CD pipeline using GitHub Actions.
@z

@x
{{< button text="Configure CI/CD" url="configure-ci-cd.md" >}}
@y
{{< button text="Configure CI/CD" url="configure-ci-cd.md" >}}
@z
