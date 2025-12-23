%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ / .md リンクへの (no slash) 対応

@x
title: Migrate from Wolfi
description: Step-by-step guide to migrate from Wolfi distribution images to Docker Hardened Images
@y
title: Wolfi からの移行
description: Step-by-step guide to migrate from Wolfi distribution images to Docker Hardened Images
@z

@x
keywords: wolfi, chainguard, migration, dhi
@y
keywords: wolfi, chainguard, migration, dhi
@z

@x
This guide helps you migrate from Wolfi-based images to Docker Hardened
Images (DHI). Generally, the migration process is straightforward since Wolfi is
Alpine-like and DHI provides an Alpine-based hardened image.
@y
This guide helps you migrate from Wolfi-based images to Docker Hardened
Images (DHI). Generally, the migration process is straightforward since Wolfi is
Alpine-like and DHI provides an Alpine-based hardened image.
@z

@x
Like other hardened images, DHI provides comprehensive
[attestations](/dhi/core-concepts/attestations/) including SBOMs and provenance,
allowing you to [verify](/manuals/dhi/how-to/verify.md) image signatures and
[scan](/manuals/dhi/how-to/scan.md) for vulnerabilities to ensure the security
and integrity of your images.
@y
Like other hardened images, DHI provides comprehensive
[attestations](__SUBDIR__/dhi/core-concepts/attestations/) including SBOMs and provenance,
allowing you to [verify](manuals/dhi/how-to/verify.md) image signatures and
[scan](manuals/dhi/how-to/scan.md) for vulnerabilities to ensure the security
and integrity of your images.
@z

@x
## Migration steps
@y
## Migration steps
@z

@x
The following example demonstrates how to migrate a Dockerfile from a
Wolfi-based image to an Alpine-based Docker Hardened Image.
@y
The following example demonstrates how to migrate a Dockerfile from a
Wolfi-based image to an Alpine-based Docker Hardened Image.
@z

@x
### Step 1: Update the base image in your Dockerfile
@y
### Step 1: Update the base image in your Dockerfile
@z

@x
Update the base image in your application's Dockerfile to a hardened image. This
is typically going to be an image tagged as `dev` or `sdk` because it has the tools
needed to install packages and dependencies.
@y
Update the base image in your application's Dockerfile to a hardened image. This
is typically going to be an image tagged as `dev` or `sdk` because it has the tools
needed to install packages and dependencies.
@z

@x
The following example diff snippet from a Dockerfile shows the old base image
replaced by the new hardened image.
@y
The following example diff snippet from a Dockerfile shows the old base image
replaced by the new hardened image.
@z

@x
> [!NOTE]
>
> You must authenticate to `dhi.io` before you can pull Docker Hardened Images.
> Use your Docker ID credentials (the same username and password you use for
> Docker Hub). If you don't have a Docker account, [create
> one](../../accounts/create-account.md) for free.
>
> Run `docker login dhi.io` to authenticate.
@y
> [!NOTE]
>
> You must authenticate to `dhi.io` before you can pull Docker Hardened Images.
> Use your Docker ID credentials (the same username and password you use for
> Docker Hub). If you don't have a Docker account, [create
> one](../../accounts/create-account.md) for free.
>
> Run `docker login dhi.io` to authenticate.
@z

@x
```diff
- ## Original base image
- FROM cgr.dev/chainguard/go:latest-dev
@y
```diff
- ## Original base image
- FROM cgr.dev/chainguard/go:latest-dev
@z

@x
+ ## Updated to use hardened base image
+ FROM dhi.io/golang:1.25-alpine3.22-dev
```
@y
+ ## Updated to use hardened base image
+ FROM dhi.io/golang:1.25-alpine3.22-dev
```
@z

@x
Note that DHI does not have a `latest` tag in order to promote best practices
around image versioning. Ensure that you specify the appropriate version tag for your image. To find the right tag, explore the available tags in the [DHI Catalog](https://hub.docker.com/hardened-images/catalog/).
@y
Note that DHI does not have a `latest` tag in order to promote best practices
around image versioning. Ensure that you specify the appropriate version tag for your image. To find the right tag, explore the available tags in the [DHI Catalog](https://hub.docker.com/hardened-images/catalog/).
@z

@x
### Step 2: Update the runtime image in your Dockerfile
@y
### Step 2: Update the runtime image in your Dockerfile
@z

@x
> [!NOTE]
>
> Multi-stage builds are recommended to keep your final image minimal and
> secure. Single-stage builds are supported, but they include the full `dev` image
> and therefore result in a larger image with a broader attack surface.
@y
> [!NOTE]
>
> Multi-stage builds are recommended to keep your final image minimal and
> secure. Single-stage builds are supported, but they include the full `dev` image
> and therefore result in a larger image with a broader attack surface.
@z

@x
To ensure that your final image is as minimal as possible, you should use a
[multi-stage build](/manuals/build/building/multi-stage.md). All stages in your
Dockerfile should use a hardened image. While intermediary stages will typically
use images tagged as `dev` or `sdk`, your final runtime stage should use a runtime image.
@y
To ensure that your final image is as minimal as possible, you should use a
[multi-stage build](manuals/build/building/multi-stage.md). All stages in your
Dockerfile should use a hardened image. While intermediary stages will typically
use images tagged as `dev` or `sdk`, your final runtime stage should use a runtime image.
@z

@x
Utilize the build stage to compile your application and copy the resulting
artifacts to the final runtime stage. This ensures that your final image is
minimal and secure.
@y
Utilize the build stage to compile your application and copy the resulting
artifacts to the final runtime stage. This ensures that your final image is
minimal and secure.
@z

@x
The following example shows a multi-stage Dockerfile with a build stage and runtime stage:
@y
The following example shows a multi-stage Dockerfile with a build stage and runtime stage:
@z

@x
```dockerfile
# Build stage
FROM dhi.io/golang:1.25-alpine3.22-dev AS builder
WORKDIR /app
COPY . .
RUN go build -o myapp
@y
```dockerfile
# Build stage
FROM dhi.io/golang:1.25-alpine3.22-dev AS builder
WORKDIR /app
COPY . .
RUN go build -o myapp
@z

@x
# Runtime stage
FROM dhi.io/golang:1.25-alpine3.22
WORKDIR /app
COPY --from=builder /app/myapp .
ENTRYPOINT ["/app/myapp"]
```
@y
# Runtime stage
FROM dhi.io/golang:1.25-alpine3.22
WORKDIR /app
COPY --from=builder /app/myapp .
ENTRYPOINT ["/app/myapp"]
```
@z

@x
After updating your Dockerfile, build and test your application. If you encounter
issues, see the [Troubleshoot](/manuals/dhi/troubleshoot.md) guide for common
problems and solutions.
@y
After updating your Dockerfile, build and test your application. If you encounter
issues, see the [Troubleshoot](manuals/dhi/troubleshoot.md) guide for common
problems and solutions.
@z

@x
## Language-specific examples
@y
## Language-specific examples
@z

@x
See the examples section for language-specific migration examples:
@y
See the examples section for language-specific migration examples:
@z

@x
- [Go](examples/go.md)
- [Python](examples/python.md)
- [Node.js](examples/node.md)
@y
- [Go](examples/go.md)
- [Python](examples/python.md)
- [Node.js](examples/node.md)
@z
