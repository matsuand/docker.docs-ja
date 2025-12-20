%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Node.js
description: Migrate a Node.js application to Docker Hardened Images
@y
title: Node.js
description: Migrate a Node.js application to Docker Hardened Images
@z

@x
keywords: nodejs, node, migration, dhi
@y
keywords: nodejs, node, migration, dhi
@z

@x
This example shows how to migrate a Node.js application to Docker Hardened Images.
@y
This example shows how to migrate a Node.js application to Docker Hardened Images.
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
> Use your Docker ID credentials (the same username and password you use for
> Docker Hub). If you don't have a Docker account, [create
> one](../../../accounts/create-account.md) for free.
>
> Run `docker login dhi.io` to authenticate.
@y
> [!NOTE]
>
> Multi-stage builds are recommended for most use cases. Single-stage builds are
> supported for simplicity, but come with tradeoffs in size and security.
>
> You must authenticate to `dhi.io` before you can pull Docker Hardened Images.
> Use your Docker ID credentials (the same username and password you use for
> Docker Hub). If you don't have a Docker account, [create
> one](../../../accounts/create-account.md) for free.
>
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
FROM cgr.dev/chainguard/node:latest-dev
WORKDIR /usr/src/app
@y
FROM cgr.dev/chainguard/node:latest-dev
WORKDIR /usr/src/app
@z

@x
COPY package*.json ./
@y
COPY package*.json ./
@z

@x
# Install any additional packages if needed using apk
# RUN apk add --no-cache python3 make g++
@y
# Install any additional packages if needed using apk
# RUN apk add --no-cache python3 make g++
@z

@x
RUN npm install
@y
RUN npm install
@z

@x
COPY . .
@y
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
FROM node:latest
WORKDIR /usr/src/app
@y
FROM node:latest
WORKDIR /usr/src/app
@z

@x
COPY package*.json ./
@y
COPY package*.json ./
@z

@x
# Install any additional packages if needed using apt
# RUN apt-get update && apt-get install -y python3 make g++ && rm -rf /var/lib/apt/lists/*
@y
# Install any additional packages if needed using apt
# RUN apt-get update && apt-get install -y python3 make g++ && rm -rf /var/lib/apt/lists/*
@z

@x
RUN npm install
@y
RUN npm install
@z

@x
COPY . .
@y
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
# === Build stage: Install dependencies and build application ===
FROM dhi.io/node:23-alpine3.21-dev AS builder
WORKDIR /usr/src/app
@y
# === Build stage: Install dependencies and build application ===
FROM dhi.io/node:23-alpine3.21-dev AS builder
WORKDIR /usr/src/app
@z

@x
COPY package*.json ./
@y
COPY package*.json ./
@z

@x
# Install any additional packages if needed using apk
# RUN apk add --no-cache python3 make g++
@y
# Install any additional packages if needed using apk
# RUN apk add --no-cache python3 make g++
@z

@x
RUN npm install
@y
RUN npm install
@z

@x
COPY . .
@y
COPY . .
@z

@x
# === Final stage: Create minimal runtime image ===
FROM dhi.io/node:23-alpine3.21
ENV PATH=/app/node_modules/.bin:$PATH
@y
# === Final stage: Create minimal runtime image ===
FROM dhi.io/node:23-alpine3.21
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
@y
CMD ["index.js"]
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
FROM dhi.io/node:23-alpine3.21-dev
WORKDIR /usr/src/app
@y
FROM dhi.io/node:23-alpine3.21-dev
WORKDIR /usr/src/app
@z

@x
COPY package*.json ./
@y
COPY package*.json ./
@z

@x
# Install any additional packages if needed using apk
# RUN apk add --no-cache python3 make g++
@y
# Install any additional packages if needed using apk
# RUN apk add --no-cache python3 make g++
@z

@x
RUN npm install
@y
RUN npm install
@z

@x
COPY . .
@y
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
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z
