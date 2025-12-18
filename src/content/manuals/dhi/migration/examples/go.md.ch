%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Go
description: Migrate a Go application to Docker Hardened Images
@y
title: Go
description: Migrate a Go application to Docker Hardened Images
@z

@x
keywords: go, golang, migration, dhi
@y
keywords: go, golang, migration, dhi
@z

@x
This example shows how to migrate a Go application to Docker Hardened Images.
@y
This example shows how to migrate a Go application to Docker Hardened Images.
@z

@x
The following examples show Dockerfiles before and after migration to Docker
Hardened Images. Each example includes four variations:
@y
The following examples show Dockerfiles before and after migration to Docker
Hardened Images. Each example includes four variations:
@z

@x
- Before (Wolfi): A sample Dockerfile using Wolfi distribution images, before migrating to DHI
- Before (DOI): A sample Dockerfile using Docker Official Images, before migrating to DHI
- After (multi-stage): A sample Dockerfile after migrating to DHI with multi-stage builds (recommended for minimal, secure images)
- After (single-stage): A sample Dockerfile after migrating to DHI with single-stage builds (simpler but results in a larger image with a broader attack surface)
@y
- Before (Wolfi): A sample Dockerfile using Wolfi distribution images, before migrating to DHI
- Before (DOI): A sample Dockerfile using Docker Official Images, before migrating to DHI
- After (multi-stage): A sample Dockerfile after migrating to DHI with multi-stage builds (recommended for minimal, secure images)
- After (single-stage): A sample Dockerfile after migrating to DHI with single-stage builds (simpler but results in a larger image with a broader attack surface)
@z

@x
> [!NOTE]
>
> Multi-stage builds are recommended for most use cases. Single-stage builds are
> supported for simplicity, but come with tradeoffs in size and security.
>
> You must authenticate to `dhi.io` before you can pull Docker Hardened Images.
> Run `docker login dhi.io` to authenticate.
@y
> [!NOTE]
>
> Multi-stage builds are recommended for most use cases. Single-stage builds are
> supported for simplicity, but come with tradeoffs in size and security.
>
> You must authenticate to `dhi.io` before you can pull Docker Hardened Images.
> Run `docker login dhi.io` to authenticate.
@z

@x
{{< tabs >}}
{{< tab name="Before (Wolfi)" >}}
@y
{{< tabs >}}
{{< tab name="Before (Wolfi)" >}}
@z

@x
```dockerfile
#syntax=docker/dockerfile:1
@y
```dockerfile
#syntax=docker/dockerfile:1
@z

@x
FROM cgr.dev/chainguard/go:latest-dev
@y
FROM cgr.dev/chainguard/go:latest-dev
@z

@x
WORKDIR /app
ADD . ./
@y
WORKDIR /app
ADD . ./
@z

@x
# Install any additional packages if needed using apk
# RUN apk add --no-cache git
@y
# Install any additional packages if needed using apk
# RUN apk add --no-cache git
@z

@x
RUN CGO_ENABLED=0 GOOS=linux go build -a -ldflags="-s -w" --installsuffix cgo -o main .
@y
RUN CGO_ENABLED=0 GOOS=linux go build -a -ldflags="-s -w" --installsuffix cgo -o main .
@z

@x
ENTRYPOINT ["/app/main"]
```
@y
ENTRYPOINT ["/app/main"]
```
@z

@x
{{< /tab >}}
{{< tab name="Before (DOI)" >}}
@y
{{< /tab >}}
{{< tab name="Before (DOI)" >}}
@z

@x
```dockerfile
#syntax=docker/dockerfile:1
@y
```dockerfile
#syntax=docker/dockerfile:1
@z

@x
FROM golang:latest
@y
FROM golang:latest
@z

@x
WORKDIR /app
ADD . ./
@y
WORKDIR /app
ADD . ./
@z

@x
# Install any additional packages if needed using apt
# RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*
@y
# Install any additional packages if needed using apt
# RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*
@z

@x
RUN CGO_ENABLED=0 GOOS=linux go build -a -ldflags="-s -w" --installsuffix cgo -o main .
@y
RUN CGO_ENABLED=0 GOOS=linux go build -a -ldflags="-s -w" --installsuffix cgo -o main .
@z

@x
ENTRYPOINT ["/app/main"]
```
@y
ENTRYPOINT ["/app/main"]
```
@z

@x
{{< /tab >}}
{{< tab name="After (multi-stage)" >}}
@y
{{< /tab >}}
{{< tab name="After (multi-stage)" >}}
@z

@x
```dockerfile
#syntax=docker/dockerfile:1
@y
```dockerfile
#syntax=docker/dockerfile:1
@z

@x
# === Build stage: Compile Go application ===
FROM dhi.io/golang:1-alpine3.21-dev AS builder
@y
# === Build stage: Compile Go application ===
FROM dhi.io/golang:1-alpine3.21-dev AS builder
@z

@x
WORKDIR /app
ADD . ./
@y
WORKDIR /app
ADD . ./
@z

@x
# Install any additional packages if needed using apk
# RUN apk add --no-cache git
@y
# Install any additional packages if needed using apk
# RUN apk add --no-cache git
@z

@x
RUN CGO_ENABLED=0 GOOS=linux go build -a -ldflags="-s -w" --installsuffix cgo -o main .
@y
RUN CGO_ENABLED=0 GOOS=linux go build -a -ldflags="-s -w" --installsuffix cgo -o main .
@z

@x
# === Final stage: Create minimal runtime image ===
FROM dhi.io/golang:1-alpine3.21
@y
# === Final stage: Create minimal runtime image ===
FROM dhi.io/golang:1-alpine3.21
@z

@x
WORKDIR /app
COPY --from=builder /app/main  /app/main
@y
WORKDIR /app
COPY --from=builder /app/main  /app/main
@z

@x
ENTRYPOINT ["/app/main"]
```
@y
ENTRYPOINT ["/app/main"]
```
@z

@x
{{< /tab >}}
{{< tab name="After (single-stage)" >}}
@y
{{< /tab >}}
{{< tab name="After (single-stage)" >}}
@z

@x
```dockerfile
#syntax=docker/dockerfile:1
@y
```dockerfile
#syntax=docker/dockerfile:1
@z

@x
FROM dhi.io/golang:1-alpine3.21-dev
@y
FROM dhi.io/golang:1-alpine3.21-dev
@z

@x
WORKDIR /app
ADD . ./
@y
WORKDIR /app
ADD . ./
@z

@x
# Install any additional packages if needed using apk
# RUN apk add --no-cache git
@y
# Install any additional packages if needed using apk
# RUN apk add --no-cache git
@z

@x
RUN CGO_ENABLED=0 GOOS=linux go build -a -ldflags="-s -w" --installsuffix cgo -o main .
@y
RUN CGO_ENABLED=0 GOOS=linux go build -a -ldflags="-s -w" --installsuffix cgo -o main .
@z

@x
ENTRYPOINT ["/app/main"]
```
@y
ENTRYPOINT ["/app/main"]
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z
