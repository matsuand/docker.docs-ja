%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Migrate from Alpine or Debian
description: Step-by-step guide to migrate from Docker Official Images to Docker Hardened Images
@y
title: Migrate from Alpine or Debian
description: Step-by-step guide to migrate from Docker Official Images to Docker Hardened Images
@z

@x
keywords: docker official images, doi, migration, dhi, alpine, debian
@y
keywords: docker official images, doi, migration, dhi, alpine, debian
@z

@x
Docker Hardened Images (DHI) come in both [Alpine-based and Debian-based
variants](../explore/available.md). In many cases, migrating from another image
based on these distributions is as simple as changing the base image in your
Dockerfile.
@y
Docker Hardened Images (DHI) come in both [Alpine-based and Debian-based
variants](../explore/available.md). In many cases, migrating from another image
based on these distributions is as simple as changing the base image in your
Dockerfile.
@z

@x
This guide helps you migrate from an existing Alpine-based or Debian-based
Docker Official Image (DOI) to DHI.
@y
This guide helps you migrate from an existing Alpine-based or Debian-based
Docker Official Image (DOI) to DHI.
@z

@x
If you're currently using a Debian-based Docker Official Image, migrate to the
Debian-based DHI variant. If you're using an Alpine-based image, migrate to the
Alpine-based DHI variant. This minimizes changes to package management and
dependencies during migration.
@y
If you're currently using a Debian-based Docker Official Image, migrate to the
Debian-based DHI variant. If you're using an Alpine-based image, migrate to the
Alpine-based DHI variant. This minimizes changes to package management and
dependencies during migration.
@z

@x
## Key differences
@y
## Key differences
@z

@x
When migrating from non-hardened images to DHI, be aware of these key differences:
@y
When migrating from non-hardened images to DHI, be aware of these key differences:
@z

@x
| Item               | Non-hardened images                                                                                                                                                                                                                                                                                                         | Docker Hardened Images                                                                                                                                                                                                                                                                                                         |
|:-------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Package management | Package managers generally available in all images.                                                                                                                                                                                                                                  | Package managers generally only available in images with a `dev` tag. Runtime images don't contain package managers. Use multi-stage builds and copy necessary artifacts from the build stage to the runtime stage.                                                                  |
| Non-root user      | Usually runs as root by default                                                                                                                                                                                                                                                                                                | Runtime variants run as the nonroot user by default. Ensure that necessary files and directories are accessible to the nonroot user.                                                                                                                                                                                                          |
| Multi-stage build  | Optional                                                                                                                                                                                                                                                                                                                       | Recommended. Use images with a `dev` or `sdk` tags for build stages and non-dev images for runtime.                                                                                                                                                                                                                           |
| TLS certificates   | May need to be installed                                                                                                                                                                                                                                                                                                       | Contain standard TLS certificates by default. There is no need to install TLS certificates.                                                                                                                                                                                                                                   |
| Ports              | Can bind to privileged ports (below 1024) when running as root                                                                                                                                                                                                                                                                 | Run as a nonroot user by default. Applications can't bind to privileged ports (below 1024) when running in Kubernetes or in Docker Engine versions older than 20.10. Configure your application to listen on port 1025 or higher inside the container.                                                                        |
| Entry point        | Varies by image                                                                                                                                                                                                                                                                                                                | May have different entry points than Docker Official Images. Inspect entry points and update your Dockerfile if necessary.                                                                                                                                                                                                    |
| No shell           | Shell generally available in all images                                                                                                                                                                                                                                                                                                  | Runtime images don't contain a shell. Use `dev` images in build stages to run shell commands and then copy artifacts to the runtime stage.                                                                                                                                                                                      |
@y
| Item               | Non-hardened images                                                                                                                                                                                                                                                                                                         | Docker Hardened Images                                                                                                                                                                                                                                                                                                         |
|:-------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Package management | Package managers generally available in all images.                                                                                                                                                                                                                                  | Package managers generally only available in images with a `dev` tag. Runtime images don't contain package managers. Use multi-stage builds and copy necessary artifacts from the build stage to the runtime stage.                                                                  |
| Non-root user      | Usually runs as root by default                                                                                                                                                                                                                                                                                                | Runtime variants run as the nonroot user by default. Ensure that necessary files and directories are accessible to the nonroot user.                                                                                                                                                                                                          |
| Multi-stage build  | Optional                                                                                                                                                                                                                                                                                                                       | Recommended. Use images with a `dev` or `sdk` tags for build stages and non-dev images for runtime.                                                                                                                                                                                                                           |
| TLS certificates   | May need to be installed                                                                                                                                                                                                                                                                                                       | Contain standard TLS certificates by default. There is no need to install TLS certificates.                                                                                                                                                                                                                                   |
| Ports              | Can bind to privileged ports (below 1024) when running as root                                                                                                                                                                                                                                                                 | Run as a nonroot user by default. Applications can't bind to privileged ports (below 1024) when running in Kubernetes or in Docker Engine versions older than 20.10. Configure your application to listen on port 1025 or higher inside the container.                                                                        |
| Entry point        | Varies by image                                                                                                                                                                                                                                                                                                                | May have different entry points than Docker Official Images. Inspect entry points and update your Dockerfile if necessary.                                                                                                                                                                                                    |
| No shell           | Shell generally available in all images                                                                                                                                                                                                                                                                                                  | Runtime images don't contain a shell. Use `dev` images in build stages to run shell commands and then copy artifacts to the runtime stage.                                                                                                                                                                                      |
@z

@x
## Migration steps
@y
## Migration steps
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
- FROM golang:1.25
@y
```diff
- ## Original base image
- FROM golang:1.25
@z

@x
+ ## Updated to use hardened base image
+ FROM dhi.io/golang:1.25-debian12-dev
```
@y
+ ## Updated to use hardened base image
+ FROM dhi.io/golang:1.25-debian12-dev
```
@z

@x
Note that DHI does not have a `latest` tag in order to promote best practices
around image versioning. Ensure that you specify the appropriate version tag for
your image. To find the right tag, explore the available tags in the [DHI
Catalog](https://hub.docker.com/hardened-images/catalog/). In addition, the
distribution base is specified in the tag (for example, `-alpine3.22` or
`-debian12`), so be sure to select the correct variant for your application.
@y
Note that DHI does not have a `latest` tag in order to promote best practices
around image versioning. Ensure that you specify the appropriate version tag for
your image. To find the right tag, explore the available tags in the [DHI
Catalog](https://hub.docker.com/hardened-images/catalog/). In addition, the
distribution base is specified in the tag (for example, `-alpine3.22` or
`-debian12`), so be sure to select the correct variant for your application.
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
FROM dhi.io/golang:1.25-debian12-dev AS builder
WORKDIR /app
COPY . .
RUN go build -o myapp
@y
```dockerfile
# Build stage
FROM dhi.io/golang:1.25-debian12-dev AS builder
WORKDIR /app
COPY . .
RUN go build -o myapp
@z

@x
# Runtime stage
FROM dhi.io/golang:1.25-debian12
WORKDIR /app
COPY --from=builder /app/myapp .
ENTRYPOINT ["/app/myapp"]
```
@y
# Runtime stage
FROM dhi.io/golang:1.25-debian12
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
