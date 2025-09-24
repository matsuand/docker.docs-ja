%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Migrate an existing application to use Docker Hardened Images
linktitle: Migrate an app
description: Follow a step-by-step guide to update your Dockerfiles and adopt Docker Hardened Images for secure, minimal, and production-ready builds.
@y
title: Migrate an existing application to use Docker Hardened Images
linktitle: Migrate an app
description: Follow a step-by-step guide to update your Dockerfiles and adopt Docker Hardened Images for secure, minimal, and production-ready builds.
@z

@x
keywords: migrate dockerfile, hardened base image, multi-stage build, non-root containers, secure container build
@y
keywords: migrate dockerfile, hardened base image, multi-stage build, non-root containers, secure container build
@z

@x
{{< summary-bar feature_name="Docker Hardened Images" >}}
@y
{{< summary-bar feature_name="Docker Hardened Images" >}}
@z

@x
This guide helps you migrate your existing Dockerfiles to use Docker Hardened
Images (DHIs) [manually](#step-1-update-the-base-image-in-your-dockerfile),
or with [Gordon](#use-gordon).
DHIs are minimal and security-focused, which may require
adjustments to your base images, build process, and runtime configuration.
@y
This guide helps you migrate your existing Dockerfiles to use Docker Hardened
Images (DHIs) [manually](#step-1-update-the-base-image-in-your-dockerfile),
or with [Gordon](#use-gordon).
DHIs are minimal and security-focused, which may require
adjustments to your base images, build process, and runtime configuration.
@z

@x
This guide focuses on migrating framework images, such as images for building
applications from source using languages like Go, Python, or Node.js. If you're
migrating application images, such as databases, proxies, or other prebuilt
services, many of the same principles still apply.
@y
This guide focuses on migrating framework images, such as images for building
applications from source using languages like Go, Python, or Node.js. If you're
migrating application images, such as databases, proxies, or other prebuilt
services, many of the same principles still apply.
@z

@x
## Migration considerations
@y
## Migration considerations
@z

@x
DHIs omit common tools such as shells and package managers to
reduce the attack surface. They also default to running as a nonroot user. As a
result, migrating to DHI typically requires the following changes to your
Dockerfile:
@y
DHIs omit common tools such as shells and package managers to
reduce the attack surface. They also default to running as a nonroot user. As a
result, migrating to DHI typically requires the following changes to your
Dockerfile:
@z

@x
| Item               | Migration note                                                                                                                                                                                                                                                                                                                 |
|:-------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Base image         | Replace your base images in your Dockerfile with a Docker Hardened Image.                                                                                                                                                                                                                                                      |
| Package management | Images intended for runtime, don't contain package managers. Use package managers only in images with a `dev` tag. Utilize multi-stage builds and copy necessary artifacts from the build stage to the runtime stage.                                                                                                                                                                        |
| Non-root user      | By default, images intended for runtime, run as the nonroot user. Ensure that necessary files and directories are accessible to the nonroot user.                                                                                                                                                                              |
| Multi-stage build  | Utilize images with a `dev` or `sdk` tags for build stages and non-dev images for runtime.                                                                                                                                                                                                                                     |
| TLS certificates   | DHIs contain standard TLS certificates by default. There is no need to install TLS certificates.                                                                                                                                                                                                                               |
| Ports              | DHIs intented for runtime run as a nonroot user by default. As a result, applications in these images can't bind to privileged ports (below 1024) when running in Kubernetes or in Docker Engine versions older than 20.10. To avoid issues, configure your application to listen on port 1025 or higher inside the container. |
| Entry point        | DHIs may have different entry points than images such as Docker Official Images. Inspect entry points for DHIs and update your Dockerfile if necessary.                                                                                                                                                                        |
| No shell           | DHIs intended for runtime don't contain a shell. Use dev images in build stages to run shell commands and then copy artifacts to the runtime stage.                                                                                                                                                                            |
@y
| Item               | Migration note                                                                                                                                                                                                                                                                                                                 |
|:-------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Base image         | Replace your base images in your Dockerfile with a Docker Hardened Image.                                                                                                                                                                                                                                                      |
| Package management | Images intended for runtime, don't contain package managers. Use package managers only in images with a `dev` tag. Utilize multi-stage builds and copy necessary artifacts from the build stage to the runtime stage.                                                                                                                                                                        |
| Non-root user      | By default, images intended for runtime, run as the nonroot user. Ensure that necessary files and directories are accessible to the nonroot user.                                                                                                                                                                              |
| Multi-stage build  | Utilize images with a `dev` or `sdk` tags for build stages and non-dev images for runtime.                                                                                                                                                                                                                                     |
| TLS certificates   | DHIs contain standard TLS certificates by default. There is no need to install TLS certificates.                                                                                                                                                                                                                               |
| Ports              | DHIs intented for runtime run as a nonroot user by default. As a result, applications in these images can't bind to privileged ports (below 1024) when running in Kubernetes or in Docker Engine versions older than 20.10. To avoid issues, configure your application to listen on port 1025 or higher inside the container. |
| Entry point        | DHIs may have different entry points than images such as Docker Official Images. Inspect entry points for DHIs and update your Dockerfile if necessary.                                                                                                                                                                        |
| No shell           | DHIs intended for runtime don't contain a shell. Use dev images in build stages to run shell commands and then copy artifacts to the runtime stage.                                                                                                                                                                            |
@z

@x
For more details and troubleshooting tips, see the [Troubleshoot](/manuals/dhi/troubleshoot.md).
@y
For more details and troubleshooting tips, see the [Troubleshoot](manuals/dhi/troubleshoot.md).
@z

@x
## Migrate an existing application
@y
## Migrate an existing application
@z

@x
The following steps outline the migration process.
@y
The following steps outline the migration process.
@z

@x
### Step 1: Update the base image in your Dockerfile
@y
### Step 1: Update the base image in your Dockerfile
@z

@x
Update the base image in your application’s Dockerfile to a hardened image. This
is typically going to be an image tagged as `dev` or `sdk` because it has the tools
needed to install packages and dependencies.
@y
Update the base image in your application’s Dockerfile to a hardened image. This
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
```diff
- ## Original base image
- FROM golang:1.22
@y
```diff
- ## Original base image
- FROM golang:1.22
@z

@x
+ ## Updated to use hardened base image
+ FROM <your-namespace>/dhi-golang:1.22-dev
```
@y
+ ## Updated to use hardened base image
+ FROM <your-namespace>/dhi-golang:1.22-dev
```
@z

@x
### Step 2: Update the runtime image in your Dockerfile
@y
### Step 2: Update the runtime image in your Dockerfile
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
See the [Example Dockerfile migrations](#example-dockerfile-migrations) section for
examples of how to update your Dockerfile.
@y
See the [Example Dockerfile migrations](#example-dockerfile-migrations) section for
examples of how to update your Dockerfile.
@z

@x
## Example Dockerfile migrations
@y
## Example Dockerfile migrations
@z

@x
The following migration examples show a Dockerfile before the migration and
after the migration.
@y
The following migration examples show a Dockerfile before the migration and
after the migration.
@z

@x
### Go example
@y
### Go example
@z

@x
{{< tabs >}}
{{< tab name="Before" >}}
@y
{{< tabs >}}
{{< tab name="Before" >}}
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
RUN CGO_ENABLED=0 GOOS=linux go build -a -ldflags="-s -w" --installsuffix cgo -o main .
@y
WORKDIR /app
ADD . ./
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
{{< tab name="After" >}}
@y
{{< /tab >}}
{{< tab name="After" >}}
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
FROM <your-namespace>/dhi-golang:1-alpine3.21-dev AS builder
@y
# === Build stage: Compile Go application ===
FROM <your-namespace>/dhi-golang:1-alpine3.21-dev AS builder
@z

@x
WORKDIR /app
ADD . ./
RUN CGO_ENABLED=0 GOOS=linux go build -a -ldflags="-s -w" --installsuffix cgo -o main .
@y
WORKDIR /app
ADD . ./
RUN CGO_ENABLED=0 GOOS=linux go build -a -ldflags="-s -w" --installsuffix cgo -o main .
@z

@x
# === Final stage: Create minimal runtime image ===
FROM <your-namespace>/dhi-golang:1-alpine3.21
@y
# === Final stage: Create minimal runtime image ===
FROM <your-namespace>/dhi-golang:1-alpine3.21
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
{{< /tab >}}
{{< /tabs >}}
@y
ENTRYPOINT ["/app/main"]
```
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Node.js example
@y
### Node.js example
@z

@x
{{< tabs >}}
{{< tab name="Before" >}}
@y
{{< tabs >}}
{{< tab name="Before" >}}
@z

@x
```dockerfile
#syntax=docker/dockerfile:1
@y
```dockerfile
#syntax=docker/dockerfile:1
@z

@x
FROM node:latest
WORKDIR /usr/src/app
@y
FROM node:latest
WORKDIR /usr/src/app
@z

@x
COPY package*.json ./
RUN npm install
@y
COPY package*.json ./
RUN npm install
@z

@x
COPY image.jpg ./image.jpg
COPY . .
@y
COPY image.jpg ./image.jpg
COPY . .
@z

@x
CMD ["node", "index.js"]
```
@y
CMD ["node", "index.js"]
```
@z

@x
{{< /tab >}}
{{< tab name="After" >}}
@y
{{< /tab >}}
{{< tab name="After" >}}
@z

@x
```dockerfile
#syntax=docker/dockerfile:1
@y
```dockerfile
#syntax=docker/dockerfile:1
@z

@x
#=== Build stage: Install dependencies and build application ===#
FROM <your-namespace>/dhi-node:23-alpine3.21-dev AS builder
WORKDIR /usr/src/app
@y
#=== Build stage: Install dependencies and build application ===#
FROM <your-namespace>/dhi-node:23-alpine3.21-dev AS builder
WORKDIR /usr/src/app
@z

@x
COPY package*.json ./
RUN npm install
@y
COPY package*.json ./
RUN npm install
@z

@x
COPY image.jpg ./image.jpg
COPY . .
@y
COPY image.jpg ./image.jpg
COPY . .
@z

@x
#=== Final stage: Create minimal runtime image ===#
FROM <your-namespace>/dhi-node:23-alpine3.21
ENV PATH=/app/node_modules/.bin:$PATH
@y
#=== Final stage: Create minimal runtime image ===#
FROM <your-namespace>/dhi-node:23-alpine3.21
ENV PATH=/app/node_modules/.bin:$PATH
@z

@x
COPY --from=builder --chown=node:node /usr/src/app /app
@y
COPY --from=builder --chown=node:node /usr/src/app /app
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
CMD ["index.js"]
```
{{< /tab >}}
{{< /tabs >}}
@y
CMD ["index.js"]
```
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Python example
@y
### Python example
@z

@x
{{< tabs >}}
{{< tab name="Before" >}}
@y
{{< tabs >}}
{{< tab name="Before" >}}
@z

@x
```dockerfile
#syntax=docker/dockerfile:1
@y
```dockerfile
#syntax=docker/dockerfile:1
@z

@x
FROM python:latest AS builder
@y
FROM python:latest AS builder
@z

@x
ENV LANG=C.UTF-8
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PATH="/app/venv/bin:$PATH"
@y
ENV LANG=C.UTF-8
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PATH="/app/venv/bin:$PATH"
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
RUN python -m venv /app/venv
COPY requirements.txt .
@y
RUN python -m venv /app/venv
COPY requirements.txt .
@z

@x
RUN pip install --no-cache-dir -r requirements.txt
@y
RUN pip install --no-cache-dir -r requirements.txt
@z

@x
FROM python:latest
@y
FROM python:latest
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
ENV PYTHONUNBUFFERED=1
ENV PATH="/app/venv/bin:$PATH"
@y
ENV PYTHONUNBUFFERED=1
ENV PATH="/app/venv/bin:$PATH"
@z

@x
COPY image.py image.png ./
COPY --from=builder /app/venv /app/venv
@y
COPY image.py image.png ./
COPY --from=builder /app/venv /app/venv
@z

@x
ENTRYPOINT [ "python", "/app/image.py" ]
```
@y
ENTRYPOINT [ "python", "/app/image.py" ]
```
@z

@x
{{< /tab >}}
{{< tab name="After" >}}
@y
{{< /tab >}}
{{< tab name="After" >}}
@z

@x
```dockerfile
#syntax=docker/dockerfile:1
@y
```dockerfile
#syntax=docker/dockerfile:1
@z

@x
#=== Build stage: Install dependencies and create virtual environment ===#
FROM <your-namespace>/dhi-python:3.13-alpine3.21-dev AS builder
@y
#=== Build stage: Install dependencies and create virtual environment ===#
FROM <your-namespace>/dhi-python:3.13-alpine3.21-dev AS builder
@z

@x
ENV LANG=C.UTF-8
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PATH="/app/venv/bin:$PATH"
@y
ENV LANG=C.UTF-8
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PATH="/app/venv/bin:$PATH"
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
RUN python -m venv /app/venv
COPY requirements.txt .
@y
RUN python -m venv /app/venv
COPY requirements.txt .
@z

@x
RUN pip install --no-cache-dir -r requirements.txt
@y
RUN pip install --no-cache-dir -r requirements.txt
@z

@x
#=== Final stage: Create minimal runtime image ===#
FROM <your-namespace>/dhi-python:3.13-alpine3.21
@y
#=== Final stage: Create minimal runtime image ===#
FROM <your-namespace>/dhi-python:3.13-alpine3.21
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
ENV PYTHONUNBUFFERED=1
ENV PATH="/app/venv/bin:$PATH"
@y
ENV PYTHONUNBUFFERED=1
ENV PATH="/app/venv/bin:$PATH"
@z

@x
COPY image.py image.png ./
COPY --from=builder /app/venv /app/venv
@y
COPY image.py image.png ./
COPY --from=builder /app/venv /app/venv
@z

@x
ENTRYPOINT [ "python", "/app/image.py" ]
```
@y
ENTRYPOINT [ "python", "/app/image.py" ]
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
### Use Gordon
@y
### Use Gordon
@z

@x
Alternatively, you can request assistance to 
[Gordon](/manuals/ai/gordon/_index.md), Docker's AI-powered assistant, to migrate your Dockerfile:
@y
Alternatively, you can request assistance to 
[Gordon](manuals/ai/gordon/_index.md), Docker's AI-powered assistant, to migrate your Dockerfile:
@z

@x
{{% include "gordondhi.md" %}}
@y
{{% include "gordondhi.md" %}}
@z
