%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Containerize a Next.js application
linkTitle: Next.js
description: Containerize, develop, and test Next.js apps with Docker
keywords: getting started, Next.js, next.js, docker, language, Dockerfile
summary: |
  This guide explains how to containerize Next.js applications and set up
  development and testing in containers.
@y
title: Containerize a Next.js application
linkTitle: Next.js
description: Containerize, develop, and test Next.js apps with Docker
keywords: getting started, Next.js, next.js, docker, language, Dockerfile
summary: |
  This guide explains how to containerize Next.js applications and set up
  development and testing in containers.
@z

@x
  time: 20 minutes
@y
  time: 20 分
@z

@x
This guide shows you how to containerize a Next.js application using Docker, following best practices for creating efficient, production-ready containers.
@y
This guide shows you how to containerize a Next.js application using Docker, following best practices for creating efficient, production-ready containers.
@z

@x
[Next.js](https://nextjs.org/) is a React framework that enables server-side
rendering, static site generation, and full-stack capabilities. Docker
provides a consistent containerized environment from development to
production.
@y
[Next.js](https://nextjs.org/) is a React framework that enables server-side
rendering, static site generation, and full-stack capabilities. Docker
provides a consistent containerized environment from development to
production.
@z

@x
> **Acknowledgment**
>
> Docker extends its sincere gratitude to [Kristiyan Velkov](https://www.linkedin.com/in/kristiyan-velkov-763130b3/) for authoring this guide and contributing the official [Next.js Docker examples](https://github.com/vercel/next.js/tree/canary/examples/with-docker) to the Vercel Next.js repository, including the standalone and export output examples. As a Docker Captain and experienced engineer, his expertise in Docker, DevOps, and modern web development has made this resource invaluable for the community, helping developers navigate and optimize their Docker workflows.
@y
> **Acknowledgment**
>
> Docker extends its sincere gratitude to [Kristiyan Velkov](https://www.linkedin.com/in/kristiyan-velkov-763130b3/) for authoring this guide and contributing the official [Next.js Docker examples](https://github.com/vercel/next.js/tree/canary/examples/with-docker) to the Vercel Next.js repository, including the standalone and export output examples. As a Docker Captain and experienced engineer, his expertise in Docker, DevOps, and modern web development has made this resource invaluable for the community, helping developers navigate and optimize their Docker workflows.
@z

@x
---
@y
---
@z

@x
## What will you learn?
@y
## What will you learn?
@z

@x
In this guide, you will learn how to:
@y
In this guide, you will learn how to:
@z

@x
- Containerize and run a Next.js application using Docker.
- Set up a local development environment for Next.js inside a container.
- Run tests for your Next.js application within a Docker container.
@y
- Containerize and run a Next.js application using Docker.
- Set up a local development environment for Next.js inside a container.
- Run tests for your Next.js application within a Docker container.
@z

@x
To begin, you'll start by containerizing an existing Next.js application.
@y
To begin, you'll start by containerizing an existing Next.js application.
@z

@x
---
@y
---
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Before you begin, make sure you're familiar with the following:
@y
Before you begin, make sure you're familiar with the following:
@z

@x
- Basic understanding of [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript) or [TypeScript](https://www.typescriptlang.org/).
- Basic knowledge of [Node.js](https://nodejs.org/en) and [npm](https://docs.npmjs.com/about-npm) for managing dependencies and running scripts.
- Familiarity with [React](https://react.dev/) and [Next.js](https://nextjs.org/) fundamentals.
- Understanding of Docker concepts such as images, containers, and Dockerfiles. If you're new to Docker, start with the [Docker basics](/get-started/docker-concepts/the-basics/what-is-a-container.md) guide.
@y
- Basic understanding of [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript) or [TypeScript](https://www.typescriptlang.org/).
- Basic knowledge of [Node.js](https://nodejs.org/en) and [npm](https://docs.npmjs.com/about-npm) for managing dependencies and running scripts.
- Familiarity with [React](https://react.dev/) and [Next.js](https://nextjs.org/) fundamentals.
- Understanding of Docker concepts such as images, containers, and Dockerfiles. If you're new to Docker, start with the [Docker basics](get-started/docker-concepts/the-basics/what-is-a-container.md) guide.
@z

@x
Once you've completed the Next.js getting started modules, you'll be ready to containerize your own Next.js application using the examples and instructions provided in this guide.
@y
Once you've completed the Next.js getting started modules, you'll be ready to containerize your own Next.js application using the examples and instructions provided in this guide.
@z

@x
## Containerize a Next.js Application
@y
## Containerize a Next.js Application
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
Before you begin, make sure the following tools are installed and available on your system:
@y
Before you begin, make sure the following tools are installed and available on your system:
@z

@x
- You have installed the latest version of [Docker Desktop](/get-started/get-docker.md).
- You have a [git client](https://git-scm.com/downloads). The examples in this section use a command-line based git client, but you can use any client.
@y
- You have installed the latest version of [Docker Desktop](get-started/get-docker.md).
- You have a [git client](https://git-scm.com/downloads). The examples in this section use a command-line based git client, but you can use any client.
@z

@x
> [!NOTE]
> New to Docker? Start with the [Docker basics](/get-started/docker-concepts/the-basics/what-is-a-container.md) guide to get familiar with key concepts like images, containers, and Dockerfiles.
@y
> [!NOTE]
> New to Docker? Start with the [Docker basics](get-started/docker-concepts/the-basics/what-is-a-container.md) guide to get familiar with key concepts like images, containers, and Dockerfiles.
@z

@x
---
@y
---
@z

@x
### Overview
@y
### Overview
@z

@x
This guide walks you through containerizing a Next.js application with Docker.
You'll learn how to create a production-ready Docker image using best
practices that improve performance, security, scalability, and deployment
efficiency.
@y
This guide walks you through containerizing a Next.js application with Docker.
You'll learn how to create a production-ready Docker image using best
practices that improve performance, security, scalability, and deployment
efficiency.
@z

@x
By the end of this guide, you will:
@y
By the end of this guide, you will:
@z

@x
- Containerize a Next.js application using Docker.
- Create and optimize a Dockerfile for production builds.
- Use multi-stage builds to minimize image size.
- Leverage Next.js standalone or export output for efficient containerization.
- Follow best practices for building secure and maintainable Docker images.
@y
- Containerize a Next.js application using Docker.
- Create and optimize a Dockerfile for production builds.
- Use multi-stage builds to minimize image size.
- Leverage Next.js standalone or export output for efficient containerization.
- Follow best practices for building secure and maintainable Docker images.
@z

@x
---
@y
---
@z

@x
### Get the sample application
@y
### Get the sample application
@z

@x
Clone the sample application to use with this guide. Open a terminal, change
directory to a directory that you want to work in, and run the following command
to clone the git repository:
@y
Clone the sample application to use with this guide. Open a terminal, change
directory to a directory that you want to work in, and run the following command
to clone the git repository:
@z

@x
```console
$ git clone https://github.com/kristiyan-velkov/docker-nextjs-sample
```
@y
```console
$ git clone https://github.com/kristiyan-velkov/docker-nextjs-sample
```
@z

@x
---
@y
---
@z

@x
### Build the Docker image
@y
### Build the Docker image
@z

@x
Next.js has specific requirements for production deployments. This guide shows two approaches: `standalone` output (Node.js server) and `export` output (static files with Nginx).
@y
Next.js has specific requirements for production deployments. This guide shows two approaches: `standalone` output (Node.js server) and `export` output (static files with Nginx).
@z

@x
> [!TIP]
>
> [Gordon](/ai/gordon/), Docker's AI assistant, can generate Docker assets for your project. Ask Gordon to create a Dockerfile, Compose file, and `.dockerignore` tailored to your application.
@y
> [!TIP]
>
> [Gordon](__SUBDIR__/ai/gordon/), Docker's AI assistant, can generate Docker assets for your project. Ask Gordon to create a Dockerfile, Compose file, and `.dockerignore` tailored to your application.
@z

@x
#### Step 1: Configure Next.js and create the Dockerfile
@y
#### Step 1: Configure Next.js and create the Dockerfile
@z

@x
Before creating a Dockerfile, choose a base image: the [Node.js Official Image](https://hub.docker.com/_/node) or a [Docker Hardened Image (DHI)](https://hub.docker.com/hardened-images/catalog) from the Hardened Image catalog. Choosing DHI gives you a production-ready, lightweight, and secure image. For more information, see [Docker Hardened Images](https://docs.docker.com/dhi/).
@y
Before creating a Dockerfile, choose a base image: the [Node.js Official Image](https://hub.docker.com/_/node) or a [Docker Hardened Image (DHI)](https://hub.docker.com/hardened-images/catalog) from the Hardened Image catalog. Choosing DHI gives you a production-ready, lightweight, and secure image. For more information, see [Docker Hardened Images](https://docs.docker.com/dhi/).
@z

@x
> [!IMPORTANT]
> This guide uses stable Node.js LTS image tags that are considered secure when the guide is written. Because new releases and security patches are published regularly, always review the [official Node.js Docker images](https://hub.docker.com/_/node) and select a secure, up-to-date version before building or deploying.
@y
> [!IMPORTANT]
> This guide uses stable Node.js LTS image tags that are considered secure when the guide is written. Because new releases and security patches are published regularly, always review the [official Node.js Docker images](https://hub.docker.com/_/node) and select a secure, up-to-date version before building or deploying.
@z

@x
---
@y
---
@z

@x
##### 1.1 Next.js with standalone output
@y
##### 1.1 Next.js with standalone output
@z

@x
Standalone output (`output: "standalone"`) makes Next.js build a self-contained output that includes only the files and dependencies needed to run the application. A single `node server.js` can serve the app, which is ideal for Docker and supports server-side rendering, API routes, and incremental static regeneration. For details, see the [Next.js output configuration documentation](https://nextjs.org/docs/app/api-reference/config/next-config-js/output) (including the "standalone" option).
@y
Standalone output (`output: "standalone"`) makes Next.js build a self-contained output that includes only the files and dependencies needed to run the application. A single `node server.js` can serve the app, which is ideal for Docker and supports server-side rendering, API routes, and incremental static regeneration. For details, see the [Next.js output configuration documentation](https://nextjs.org/docs/app/api-reference/config/next-config-js/output) (including the "standalone" option).
@z

@x
The container runs the Next.js server with Node.js on port 3000.
@y
The container runs the Next.js server with Node.js on port 3000.
@z

@x
Configure Next.js — Open or create `next.config.ts` in your project root:
@y
Configure Next.js — Open or create `next.config.ts` in your project root:
@z

@x
```ts
import type { NextConfig } from "next";
@y
```ts
import type { NextConfig } from "next";
@z

@x
const nextConfig: NextConfig = {
  output: "standalone",
};
@y
const nextConfig: NextConfig = {
  output: "standalone",
};
@z

@x
export default nextConfig;
```
@y
export default nextConfig;
```
@z

@x
Choose either a Docker Hardened Image or the Docker Official Image, then create a `Dockerfile` using the content from the selected tab below.
@y
Choose either a Docker Hardened Image or the Docker Official Image, then create a `Dockerfile` using the content from the selected tab below.
@z

@x
{{< tabs >}}
{{< tab name="Using Docker Hardened Images" >}}
@y
{{< tabs >}}
{{< tab name="Using Docker Hardened Images" >}}
@z

@x
Docker Hardened Images (DHIs) are available for Node.js in the [Docker Hardened Images catalog](https://hub.docker.com/hardened-images/catalog/dhi/node). For more information, see the [DHI quickstart](/dhi/get-started/) guide.
@y
Docker Hardened Images (DHIs) are available for Node.js in the [Docker Hardened Images catalog](https://hub.docker.com/hardened-images/catalog/dhi/node). For more information, see the [DHI quickstart](__SUBDIR__/dhi/get-started/) guide.
@z

@x
1. Sign in to the DHI registry:
@y
1. Sign in to the DHI registry:
@z

@x
   ```console
   $ docker login dhi.io
   ```
@y
   ```console
   $ docker login dhi.io
   ```
@z

@x
2. Pull the Node.js DHI (check the catalog for available versions):
@y
2. Pull the Node.js DHI (check the catalog for available versions):
@z

@x
   ```console
   $ docker pull dhi.io/node:24-alpine3.22-dev
   ```
@y
   ```console
   $ docker pull dhi.io/node:24-alpine3.22-dev
   ```
@z

@x
3. Create a file named `Dockerfile` with the following contents. The `FROM` instructions use `dhi.io/node:24-alpine3.22-dev`. Check the [Docker Hardened Images catalog](https://hub.docker.com/hardened-images/catalog) for the latest versions and update the image tags as needed for security and compatibility.
@y
3. Create a file named `Dockerfile` with the following contents. The `FROM` instructions use `dhi.io/node:24-alpine3.22-dev`. Check the [Docker Hardened Images catalog](https://hub.docker.com/hardened-images/catalog) for the latest versions and update the image tags as needed for security and compatibility.
@z

@x
   ```dockerfile
   # ============================================
   # Stage 1: Dependencies Installation Stage
   # ============================================
@y
   ```dockerfile
   # ============================================
   # Stage 1: Dependencies Installation Stage
   # ============================================
@z

@x
   # IMPORTANT: Docker Hardened Image (DHI) Version Maintenance
   # This Dockerfile uses dhi.io/node. Regularly validate and update to the latest DHI versions in the catalog for security and compatibility.
@y
   # IMPORTANT: Docker Hardened Image (DHI) Version Maintenance
   # This Dockerfile uses dhi.io/node. Regularly validate and update to the latest DHI versions in the catalog for security and compatibility.
@z

@x
   FROM dhi.io/node:24-alpine3.22-dev AS dependencies
@y
   FROM dhi.io/node:24-alpine3.22-dev AS dependencies
@z

@x
   # Set working directory
   WORKDIR /app
@y
   # Set working directory
   WORKDIR /app
@z

@x
   # Copy package-related files first to leverage Docker's caching mechanism
   COPY package.json yarn.lock* package-lock.json* pnpm-lock.yaml* .npmrc* ./
@y
   # Copy package-related files first to leverage Docker's caching mechanism
   COPY package.json yarn.lock* package-lock.json* pnpm-lock.yaml* .npmrc* ./
@z

@x
   # Install project dependencies with frozen lockfile for reproducible builds
   RUN --mount=type=cache,target=/root/.npm \
       --mount=type=cache,target=/usr/local/share/.cache/yarn \
       --mount=type=cache,target=/root/.local/share/pnpm/store \
     if [ -f package-lock.json ]; then \
       npm ci --no-audit --no-fund; \
     elif [ -f yarn.lock ]; then \
       corepack enable yarn && yarn install --frozen-lockfile --production=false; \
     elif [ -f pnpm-lock.yaml ]; then \
       corepack enable pnpm && pnpm install --frozen-lockfile; \
     else \
       echo "No lockfile found." && exit 1; \
     fi
@y
   # Install project dependencies with frozen lockfile for reproducible builds
   RUN --mount=type=cache,target=/root/.npm \
       --mount=type=cache,target=/usr/local/share/.cache/yarn \
       --mount=type=cache,target=/root/.local/share/pnpm/store \
     if [ -f package-lock.json ]; then \
       npm ci --no-audit --no-fund; \
     elif [ -f yarn.lock ]; then \
       corepack enable yarn && yarn install --frozen-lockfile --production=false; \
     elif [ -f pnpm-lock.yaml ]; then \
       corepack enable pnpm && pnpm install --frozen-lockfile; \
     else \
       echo "No lockfile found." && exit 1; \
     fi
@z

@x
   # ============================================
   # Stage 2: Build Next.js application in standalone mode
   # ============================================
@y
   # ============================================
   # Stage 2: Build Next.js application in standalone mode
   # ============================================
@z

@x
   FROM dhi.io/node:24-alpine3.22-dev AS builder
@y
   FROM dhi.io/node:24-alpine3.22-dev AS builder
@z

@x
   # Set working directory
   WORKDIR /app
@y
   # Set working directory
   WORKDIR /app
@z

@x
   # Copy project dependencies from dependencies stage
   COPY --from=dependencies /app/node_modules ./node_modules
@y
   # Copy project dependencies from dependencies stage
   COPY --from=dependencies /app/node_modules ./node_modules
@z

@x
   # Copy application source code
   COPY . .
@y
   # Copy application source code
   COPY . .
@z

@x
   ENV NODE_ENV=production
@y
   ENV NODE_ENV=production
@z

@x
   # Next.js collects completely anonymous telemetry data about general usage.
   # Learn more here: https://nextjs.org/telemetry
   # Uncomment the following line in case you want to disable telemetry during the build.
   # ENV NEXT_TELEMETRY_DISABLED=1
@y
   # Next.js collects completely anonymous telemetry data about general usage.
   # Learn more here: https://nextjs.org/telemetry
   # Uncomment the following line in case you want to disable telemetry during the build.
   # ENV NEXT_TELEMETRY_DISABLED=1
@z

@x
   # Build Next.js application
   # If you want to speed up Docker rebuilds, you can cache the build artifacts
   # by adding: --mount=type=cache,target=/app/.next/cache
   # This caches the .next/cache directory across builds, but it also prevents
   # .next/cache/fetch-cache from being included in the final image, meaning
   # cached fetch responses from the build won't be available at runtime.
   RUN if [ -f package-lock.json ]; then \
       npm run build; \
     elif [ -f yarn.lock ]; then \
       corepack enable yarn && yarn build; \
     elif [ -f pnpm-lock.yaml ]; then \
       corepack enable pnpm && pnpm build; \
     else \
       echo "No lockfile found." && exit 1; \
     fi
@y
   # Build Next.js application
   # If you want to speed up Docker rebuilds, you can cache the build artifacts
   # by adding: --mount=type=cache,target=/app/.next/cache
   # This caches the .next/cache directory across builds, but it also prevents
   # .next/cache/fetch-cache from being included in the final image, meaning
   # cached fetch responses from the build won't be available at runtime.
   RUN if [ -f package-lock.json ]; then \
       npm run build; \
     elif [ -f yarn.lock ]; then \
       corepack enable yarn && yarn build; \
     elif [ -f pnpm-lock.yaml ]; then \
       corepack enable pnpm && pnpm build; \
     else \
       echo "No lockfile found." && exit 1; \
     fi
@z

@x
   # ============================================
   # Stage 3: Run Next.js application
   # ============================================
@y
   # ============================================
   # Stage 3: Run Next.js application
   # ============================================
@z

@x
   FROM dhi.io/node:24-alpine3.22-dev AS runner
@y
   FROM dhi.io/node:24-alpine3.22-dev AS runner
@z

@x
   # Set working directory
   WORKDIR /app
@y
   # Set working directory
   WORKDIR /app
@z

@x
   # Set production environment variables
   ENV NODE_ENV=production
   ENV PORT=3000
   ENV HOSTNAME="0.0.0.0"
@y
   # Set production environment variables
   ENV NODE_ENV=production
   ENV PORT=3000
   ENV HOSTNAME="0.0.0.0"
@z

@x
   # Next.js collects completely anonymous telemetry data about general usage.
   # Learn more here: https://nextjs.org/telemetry
   # Uncomment the following line in case you want to disable telemetry during the run time.
   # ENV NEXT_TELEMETRY_DISABLED=1
@y
   # Next.js collects completely anonymous telemetry data about general usage.
   # Learn more here: https://nextjs.org/telemetry
   # Uncomment the following line in case you want to disable telemetry during the run time.
   # ENV NEXT_TELEMETRY_DISABLED=1
@z

@x
   # Copy production assets
   COPY --from=builder --chown=node:node /app/public ./public
@y
   # Copy production assets
   COPY --from=builder --chown=node:node /app/public ./public
@z

@x
   # Set the correct permission for prerender cache
   RUN mkdir .next
   RUN chown node:node .next
@y
   # Set the correct permission for prerender cache
   RUN mkdir .next
   RUN chown node:node .next
@z

@x
   # Automatically leverage output traces to reduce image size
   # https://nextjs.org/docs/advanced-features/output-file-tracing
   COPY --from=builder --chown=node:node /app/.next/standalone ./
   COPY --from=builder --chown=node:node /app/.next/static ./.next/static
@y
   # Automatically leverage output traces to reduce image size
   # https://nextjs.org/docs/advanced-features/output-file-tracing
   COPY --from=builder --chown=node:node /app/.next/standalone ./
   COPY --from=builder --chown=node:node /app/.next/static ./.next/static
@z

@x
   # If you want to persist the fetch cache generated during the build so that
   # cached responses are available immediately on startup, uncomment this line:
   # COPY --from=builder --chown=node:node /app/.next/cache ./.next/cache
@y
   # If you want to persist the fetch cache generated during the build so that
   # cached responses are available immediately on startup, uncomment this line:
   # COPY --from=builder --chown=node:node /app/.next/cache ./.next/cache
@z

@x
   # Switch to non-root user for security best practices
   USER node
@y
   # Switch to non-root user for security best practices
   USER node
@z

@x
   # Expose port 3000 to allow HTTP traffic
   EXPOSE 3000
@y
   # Expose port 3000 to allow HTTP traffic
   EXPOSE 3000
@z

@x
   # Start Next.js standalone server
   CMD ["node", "server.js"]
   ```
@y
   # Start Next.js standalone server
   CMD ["node", "server.js"]
   ```
@z

@x
{{< /tab >}}
{{< tab name="Using the Docker Official Image" >}}
@y
{{< /tab >}}
{{< tab name="Using the Docker Official Image" >}}
@z

@x
Create a file named `Dockerfile` with the following contents (uses `node`):
@y
Create a file named `Dockerfile` with the following contents (uses `node`):
@z

@x
```dockerfile
  # ============================================
  # Stage 1: Dependencies Installation Stage
  # ============================================
@y
```dockerfile
  # ============================================
  # Stage 1: Dependencies Installation Stage
  # ============================================
@z

@x
  ARG NODE_VERSION=24.14.0-slim
@y
  ARG NODE_VERSION=24.14.0-slim
@z

@x
  FROM node:${NODE_VERSION} AS dependencies
@y
  FROM node:${NODE_VERSION} AS dependencies
@z

@x
  # Set working directory
  WORKDIR /app
@y
  # Set working directory
  WORKDIR /app
@z

@x
  # Copy package-related files first to leverage Docker's caching mechanism
  COPY package.json yarn.lock* package-lock.json* pnpm-lock.yaml* .npmrc* ./
@y
  # Copy package-related files first to leverage Docker's caching mechanism
  COPY package.json yarn.lock* package-lock.json* pnpm-lock.yaml* .npmrc* ./
@z

@x
  # Install project dependencies with frozen lockfile for reproducible builds
  RUN --mount=type=cache,target=/root/.npm \
      --mount=type=cache,target=/usr/local/share/.cache/yarn \
      --mount=type=cache,target=/root/.local/share/pnpm/store \
    if [ -f package-lock.json ]; then \
      npm ci --no-audit --no-fund; \
    elif [ -f yarn.lock ]; then \
      corepack enable yarn && yarn install --frozen-lockfile --production=false; \
    elif [ -f pnpm-lock.yaml ]; then \
      corepack enable pnpm && pnpm install --frozen-lockfile; \
    else \
      echo "No lockfile found." && exit 1; \
    fi
@y
  # Install project dependencies with frozen lockfile for reproducible builds
  RUN --mount=type=cache,target=/root/.npm \
      --mount=type=cache,target=/usr/local/share/.cache/yarn \
      --mount=type=cache,target=/root/.local/share/pnpm/store \
    if [ -f package-lock.json ]; then \
      npm ci --no-audit --no-fund; \
    elif [ -f yarn.lock ]; then \
      corepack enable yarn && yarn install --frozen-lockfile --production=false; \
    elif [ -f pnpm-lock.yaml ]; then \
      corepack enable pnpm && pnpm install --frozen-lockfile; \
    else \
      echo "No lockfile found." && exit 1; \
    fi
@z

@x
  # ============================================
  # Stage 2: Build Next.js application in standalone mode
  # ============================================
@y
  # ============================================
  # Stage 2: Build Next.js application in standalone mode
  # ============================================
@z

@x
  FROM node:${NODE_VERSION} AS builder
@y
  FROM node:${NODE_VERSION} AS builder
@z

@x
  # Set working directory
  WORKDIR /app
@y
  # Set working directory
  WORKDIR /app
@z

@x
  # Copy project dependencies from dependencies stage
  COPY --from=dependencies /app/node_modules ./node_modules
@y
  # Copy project dependencies from dependencies stage
  COPY --from=dependencies /app/node_modules ./node_modules
@z

@x
  # Copy application source code
  COPY . .
@y
  # Copy application source code
  COPY . .
@z

@x
  ENV NODE_ENV=production
@y
  ENV NODE_ENV=production
@z

@x
  # Next.js collects completely anonymous telemetry data about general usage.
  # Learn more here: https://nextjs.org/telemetry
  # Uncomment the following line in case you want to disable telemetry during the build.
  # ENV NEXT_TELEMETRY_DISABLED=1
@y
  # Next.js collects completely anonymous telemetry data about general usage.
  # Learn more here: https://nextjs.org/telemetry
  # Uncomment the following line in case you want to disable telemetry during the build.
  # ENV NEXT_TELEMETRY_DISABLED=1
@z

@x
  # Build Next.js application
  # If you want to speed up Docker rebuilds, you can cache the build artifacts
  # by adding: --mount=type=cache,target=/app/.next/cache
  # This caches the .next/cache directory across builds, but it also prevents
  # .next/cache/fetch-cache from being included in the final image, meaning
  # cached fetch responses from the build won't be available at runtime.
  RUN if [ -f package-lock.json ]; then \
      npm run build; \
    elif [ -f yarn.lock ]; then \
      corepack enable yarn && yarn build; \
    elif [ -f pnpm-lock.yaml ]; then \
      corepack enable pnpm && pnpm build; \
    else \
      echo "No lockfile found." && exit 1; \
    fi
@y
  # Build Next.js application
  # If you want to speed up Docker rebuilds, you can cache the build artifacts
  # by adding: --mount=type=cache,target=/app/.next/cache
  # This caches the .next/cache directory across builds, but it also prevents
  # .next/cache/fetch-cache from being included in the final image, meaning
  # cached fetch responses from the build won't be available at runtime.
  RUN if [ -f package-lock.json ]; then \
      npm run build; \
    elif [ -f yarn.lock ]; then \
      corepack enable yarn && yarn build; \
    elif [ -f pnpm-lock.yaml ]; then \
      corepack enable pnpm && pnpm build; \
    else \
      echo "No lockfile found." && exit 1; \
    fi
@z

@x
  # ============================================
  # Stage 3: Run Next.js application
  # ============================================
@y
  # ============================================
  # Stage 3: Run Next.js application
  # ============================================
@z

@x
  FROM node:${NODE_VERSION} AS runner
@y
  FROM node:${NODE_VERSION} AS runner
@z

@x
  # Set working directory
  WORKDIR /app
@y
  # Set working directory
  WORKDIR /app
@z

@x
  # Set production environment variables
  ENV NODE_ENV=production
  ENV PORT=3000
  ENV HOSTNAME="0.0.0.0"
@y
  # Set production environment variables
  ENV NODE_ENV=production
  ENV PORT=3000
  ENV HOSTNAME="0.0.0.0"
@z

@x
  # Next.js collects completely anonymous telemetry data about general usage.
  # Learn more here: https://nextjs.org/telemetry
  # Uncomment the following line in case you want to disable telemetry during the run time.
  # ENV NEXT_TELEMETRY_DISABLED=1
@y
  # Next.js collects completely anonymous telemetry data about general usage.
  # Learn more here: https://nextjs.org/telemetry
  # Uncomment the following line in case you want to disable telemetry during the run time.
  # ENV NEXT_TELEMETRY_DISABLED=1
@z

@x
  # Copy production assets
  COPY --from=builder --chown=node:node /app/public ./public
@y
  # Copy production assets
  COPY --from=builder --chown=node:node /app/public ./public
@z

@x
  # Set the correct permission for prerender cache
  RUN mkdir .next
  RUN chown node:node .next
@y
  # Set the correct permission for prerender cache
  RUN mkdir .next
  RUN chown node:node .next
@z

@x
  # Automatically leverage output traces to reduce image size
  # https://nextjs.org/docs/advanced-features/output-file-tracing
  COPY --from=builder --chown=node:node /app/.next/standalone ./
  COPY --from=builder --chown=node:node /app/.next/static ./.next/static
@y
  # Automatically leverage output traces to reduce image size
  # https://nextjs.org/docs/advanced-features/output-file-tracing
  COPY --from=builder --chown=node:node /app/.next/standalone ./
  COPY --from=builder --chown=node:node /app/.next/static ./.next/static
@z

@x
  # If you want to persist the fetch cache generated during the build so that
  # cached responses are available immediately on startup, uncomment this line:
  # COPY --from=builder --chown=node:node /app/.next/cache ./.next/cache
@y
  # If you want to persist the fetch cache generated during the build so that
  # cached responses are available immediately on startup, uncomment this line:
  # COPY --from=builder --chown=node:node /app/.next/cache ./.next/cache
@z

@x
  # Switch to non-root user for security best practices
  USER node
@y
  # Switch to non-root user for security best practices
  USER node
@z

@x
  # Expose port 3000 to allow HTTP traffic
  EXPOSE 3000
@y
  # Expose port 3000 to allow HTTP traffic
  EXPOSE 3000
@z

@x
  # Start Next.js standalone server
  CMD ["node", "server.js"]
```
@y
  # Start Next.js standalone server
  CMD ["node", "server.js"]
```
@z

@x
> [!NOTE]
> This Dockerfile uses three stages: `dependencies`, `builder`, and `runner`. The final image runs `node server.js` and listens on port 3000.
@y
> [!NOTE]
> This Dockerfile uses three stages: `dependencies`, `builder`, and `runner`. The final image runs `node server.js` and listens on port 3000.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
---
@y
---
@z

@x
##### 1.2 Next.js with export output
@y
##### 1.2 Next.js with export output
@z

@x
Output export (`output: "export"`) makes Next.js build a fully static site at build time. It generates HTML, CSS, and JavaScript into an `out` directory that can be served by any static host or CDN—no Node.js server at runtime. Use this when you don't need server-side rendering or API routes. For details, see the [Next.js output configuration documentation](https://nextjs.org/docs/app/api-reference/config/next-config-js/output).
@y
Output export (`output: "export"`) makes Next.js build a fully static site at build time. It generates HTML, CSS, and JavaScript into an `out` directory that can be served by any static host or CDN—no Node.js server at runtime. Use this when you don't need server-side rendering or API routes. For details, see the [Next.js output configuration documentation](https://nextjs.org/docs/app/api-reference/config/next-config-js/output).
@z

@x
Configure Next.js — Open `next.config.ts` in your project root and add the following code:
@y
Configure Next.js — Open `next.config.ts` in your project root and add the following code:
@z

@x
```ts
import type { NextConfig } from "next";
@y
```ts
import type { NextConfig } from "next";
@z

@x
const nextConfig: NextConfig = {
  output: "export",
  trailingSlash: true,
  images: {
    unoptimized: true,
  },
};
@y
const nextConfig: NextConfig = {
  output: "export",
  trailingSlash: true,
  images: {
    unoptimized: true,
  },
};
@z

@x
export default nextConfig;
```
@y
export default nextConfig;
```
@z

@x
Choose either a Docker Hardened Image or the Docker Official Image, then create a `Dockerfile` using the content from the selected tab below.
@y
Choose either a Docker Hardened Image or the Docker Official Image, then create a `Dockerfile` using the content from the selected tab below.
@z

@x
{{< tabs >}}
{{< tab name="Using Docker Hardened Images" >}}
@y
{{< tabs >}}
{{< tab name="Using Docker Hardened Images" >}}
@z

@x
Docker Hardened Images (DHIs) are available for Node.js and Nginx in the [Docker Hardened Images catalog](https://hub.docker.com/hardened-images/catalog). For more information, see the [DHI quickstart](/dhi/get-started/) guide.
@y
Docker Hardened Images (DHIs) are available for Node.js and Nginx in the [Docker Hardened Images catalog](https://hub.docker.com/hardened-images/catalog). For more information, see the [DHI quickstart](__SUBDIR__/dhi/get-started/) guide.
@z

@x
1. Sign in to the DHI registry:
@y
1. Sign in to the DHI registry:
@z

@x
   ```console
   $ docker login dhi.io
   ```
@y
   ```console
   $ docker login dhi.io
   ```
@z

@x
2. Pull the Node.js DHI (check the catalog for available versions):
@y
2. Pull the Node.js DHI (check the catalog for available versions):
@z

@x
   ```console
   $ docker pull dhi.io/node:24-alpine3.22-dev
   ```
@y
   ```console
   $ docker pull dhi.io/node:24-alpine3.22-dev
   ```
@z

@x
3. Pull the Nginx DHI (check the catalog for available versions):
@y
3. Pull the Nginx DHI (check the catalog for available versions):
@z

@x
   ```console
   $ docker pull dhi.io/nginx:1.28.0-alpine3.21-dev
   ```
@y
   ```console
   $ docker pull dhi.io/nginx:1.28.0-alpine3.21-dev
   ```
@z

@x
4. Create a file named `Dockerfile` with the following contents. The `FROM` instructions use Docker Hardened Images: `dhi.io/node:24-alpine3.22-dev` and `dhi.io/nginx:1.28.0-alpine3.21-dev`. Check the [Docker Hardened Images catalog](https://hub.docker.com/hardened-images/catalog) for the latest versions and update the image tags as needed for security and compatibility.
@y
4. Create a file named `Dockerfile` with the following contents. The `FROM` instructions use Docker Hardened Images: `dhi.io/node:24-alpine3.22-dev` and `dhi.io/nginx:1.28.0-alpine3.21-dev`. Check the [Docker Hardened Images catalog](https://hub.docker.com/hardened-images/catalog) for the latest versions and update the image tags as needed for security and compatibility.
@z

@x
   ```dockerfile
   # ============================================
   # Stage 1: Dependencies Installation Stage
   # ============================================
@y
   ```dockerfile
   # ============================================
   # Stage 1: Dependencies Installation Stage
   # ============================================
@z

@x
   # IMPORTANT: Docker Hardened Image (DHI) Version Maintenance
   # This Dockerfile uses dhi.io/node and dhi.io/nginx. Regularly validate and update to the latest DHI versions in the catalog for security and compatibility.
@y
   # IMPORTANT: Docker Hardened Image (DHI) Version Maintenance
   # This Dockerfile uses dhi.io/node and dhi.io/nginx. Regularly validate and update to the latest DHI versions in the catalog for security and compatibility.
@z

@x
   FROM dhi.io/node:24-alpine3.22-dev AS dependencies
@y
   FROM dhi.io/node:24-alpine3.22-dev AS dependencies
@z

@x
   # Set the working directory
   WORKDIR /app
@y
   # Set the working directory
   WORKDIR /app
@z

@x
   # Copy package-related files first to leverage Docker's caching mechanism
   COPY package.json yarn.lock* package-lock.json* pnpm-lock.yaml* .npmrc* ./
@y
   # Copy package-related files first to leverage Docker's caching mechanism
   COPY package.json yarn.lock* package-lock.json* pnpm-lock.yaml* .npmrc* ./
@z

@x
   # Install project dependencies with frozen lockfile for reproducible builds
   RUN --mount=type=cache,target=/root/.npm \
       --mount=type=cache,target=/usr/local/share/.cache/yarn \
       --mount=type=cache,target=/root/.local/share/pnpm/store \
     if [ -f package-lock.json ]; then \
       npm ci --no-audit --no-fund; \
     elif [ -f yarn.lock ]; then \
       corepack enable yarn && yarn install --frozen-lockfile --production=false; \
     elif [ -f pnpm-lock.yaml ]; then \
       corepack enable pnpm && pnpm install --frozen-lockfile; \
     else \
       echo "No lockfile found." && exit 1; \
     fi
@y
   # Install project dependencies with frozen lockfile for reproducible builds
   RUN --mount=type=cache,target=/root/.npm \
       --mount=type=cache,target=/usr/local/share/.cache/yarn \
       --mount=type=cache,target=/root/.local/share/pnpm/store \
     if [ -f package-lock.json ]; then \
       npm ci --no-audit --no-fund; \
     elif [ -f yarn.lock ]; then \
       corepack enable yarn && yarn install --frozen-lockfile --production=false; \
     elif [ -f pnpm-lock.yaml ]; then \
       corepack enable pnpm && pnpm install --frozen-lockfile; \
     else \
       echo "No lockfile found." && exit 1; \
     fi
@z

@x
   # ============================================
   # Stage 2: Build Next.js Application
   # ============================================
@y
   # ============================================
   # Stage 2: Build Next.js Application
   # ============================================
@z

@x
   FROM dhi.io/node:24-alpine3.22-dev AS builder
@y
   FROM dhi.io/node:24-alpine3.22-dev AS builder
@z

@x
   # Set the working directory
   WORKDIR /app
@y
   # Set the working directory
   WORKDIR /app
@z

@x
   # Copy project dependencies from dependencies stage
   COPY --from=dependencies /app/node_modules ./node_modules
@y
   # Copy project dependencies from dependencies stage
   COPY --from=dependencies /app/node_modules ./node_modules
@z

@x
   # Copy application source code
   COPY . .
@y
   # Copy application source code
   COPY . .
@z

@x
   ENV NODE_ENV=production
@y
   ENV NODE_ENV=production
@z

@x
   # Next.js collects completely anonymous telemetry data about general usage.
   # Learn more here: https://nextjs.org/telemetry
   # Uncomment the following line in case you want to disable telemetry during the build.
   # ENV NEXT_TELEMETRY_DISABLED=1
@y
   # Next.js collects completely anonymous telemetry data about general usage.
   # Learn more here: https://nextjs.org/telemetry
   # Uncomment the following line in case you want to disable telemetry during the build.
   # ENV NEXT_TELEMETRY_DISABLED=1
@z

@x
   # Build Next.js application
   RUN --mount=type=cache,target=/app/.next/cache \
     if [ -f package-lock.json ]; then \
       npm run build; \
     elif [ -f yarn.lock ]; then \
       corepack enable yarn && yarn build; \
     elif [ -f pnpm-lock.yaml ]; then \
       corepack enable pnpm && pnpm build; \
     else \
       echo "No lockfile found." && exit 1; \
     fi
@y
   # Build Next.js application
   RUN --mount=type=cache,target=/app/.next/cache \
     if [ -f package-lock.json ]; then \
       npm run build; \
     elif [ -f yarn.lock ]; then \
       corepack enable yarn && yarn build; \
     elif [ -f pnpm-lock.yaml ]; then \
       corepack enable pnpm && pnpm build; \
     else \
       echo "No lockfile found." && exit 1; \
     fi
@z

@x
   # =========================================
   # Stage 3: Serve Static Files with Nginx
   # =========================================
@y
   # =========================================
   # Stage 3: Serve Static Files with Nginx
   # =========================================
@z

@x
   FROM dhi.io/nginx:1.28.0-alpine3.21-dev AS runner
@y
   FROM dhi.io/nginx:1.28.0-alpine3.21-dev AS runner
@z

@x
   # Set the working directory
   WORKDIR /app
@y
   # Set the working directory
   WORKDIR /app
@z

@x
   # Next.js collects completely anonymous telemetry data about general usage.
   # Learn more here: https://nextjs.org/telemetry
   # Uncomment the following line in case you want to disable telemetry during the run time.
   # ENV NEXT_TELEMETRY_DISABLED=1
@y
   # Next.js collects completely anonymous telemetry data about general usage.
   # Learn more here: https://nextjs.org/telemetry
   # Uncomment the following line in case you want to disable telemetry during the run time.
   # ENV NEXT_TELEMETRY_DISABLED=1
@z

@x
   # Copy custom Nginx config
   COPY nginx.conf /etc/nginx/nginx.conf
@y
   # Copy custom Nginx config
   COPY nginx.conf /etc/nginx/nginx.conf
@z

@x
   # Copy the static build output from the build stage to Nginx's default HTML serving directory
   COPY --chown=nginx:nginx --from=builder /app/out /usr/share/nginx/html
@y
   # Copy the static build output from the build stage to Nginx's default HTML serving directory
   COPY --chown=nginx:nginx --from=builder /app/out /usr/share/nginx/html
@z

@x
   # Non-root user for security best practices
   USER nginx
@y
   # Non-root user for security best practices
   USER nginx
@z

@x
   # Expose port 8080 to allow HTTP traffic
   EXPOSE 8080
@y
   # Expose port 8080 to allow HTTP traffic
   EXPOSE 8080
@z

@x
   # Start Nginx directly with custom config
   ENTRYPOINT ["nginx", "-c", "/etc/nginx/nginx.conf"]
   CMD ["-g", "daemon off;"]
   ```
@y
   # Start Nginx directly with custom config
   ENTRYPOINT ["nginx", "-c", "/etc/nginx/nginx.conf"]
   CMD ["-g", "daemon off;"]
   ```
@z

@x
{{< /tab >}}
{{< tab name="Using the Docker Official Image" >}}
@y
{{< /tab >}}
{{< tab name="Using the Docker Official Image" >}}
@z

@x
Create a file named `Dockerfile` with the following contents (uses `node` and `nginxinc/nginx-unprivileged`):
@y
Create a file named `Dockerfile` with the following contents (uses `node` and `nginxinc/nginx-unprivileged`):
@z

@x
```dockerfile
# ============================================
# Stage 1: Dependencies Installation Stage
# ============================================
@y
```dockerfile
# ============================================
# Stage 1: Dependencies Installation Stage
# ============================================
@z

@x
ARG NODE_VERSION=24.14.0-slim
ARG NGINXINC_IMAGE_TAG=alpine3.22
@y
ARG NODE_VERSION=24.14.0-slim
ARG NGINXINC_IMAGE_TAG=alpine3.22
@z

@x
FROM node:${NODE_VERSION} AS dependencies
@y
FROM node:${NODE_VERSION} AS dependencies
@z

@x
# Set the working directory
WORKDIR /app
@y
# Set the working directory
WORKDIR /app
@z

@x
# Copy package-related files first to leverage Docker's caching mechanism
COPY package.json yarn.lock* package-lock.json* pnpm-lock.yaml* .npmrc* ./
@y
# Copy package-related files first to leverage Docker's caching mechanism
COPY package.json yarn.lock* package-lock.json* pnpm-lock.yaml* .npmrc* ./
@z

@x
# Install project dependencies with frozen lockfile for reproducible builds
RUN --mount=type=cache,target=/root/.npm \
    --mount=type=cache,target=/usr/local/share/.cache/yarn \
    --mount=type=cache,target=/root/.local/share/pnpm/store \
  if [ -f package-lock.json ]; then \
    npm ci --no-audit --no-fund; \
  elif [ -f yarn.lock ]; then \
    corepack enable yarn && yarn install --frozen-lockfile --production=false; \
  elif [ -f pnpm-lock.yaml ]; then \
    corepack enable pnpm && pnpm install --frozen-lockfile; \
  else \
    echo "No lockfile found." && exit 1; \
  fi
@y
# Install project dependencies with frozen lockfile for reproducible builds
RUN --mount=type=cache,target=/root/.npm \
    --mount=type=cache,target=/usr/local/share/.cache/yarn \
    --mount=type=cache,target=/root/.local/share/pnpm/store \
  if [ -f package-lock.json ]; then \
    npm ci --no-audit --no-fund; \
  elif [ -f yarn.lock ]; then \
    corepack enable yarn && yarn install --frozen-lockfile --production=false; \
  elif [ -f pnpm-lock.yaml ]; then \
    corepack enable pnpm && pnpm install --frozen-lockfile; \
  else \
    echo "No lockfile found." && exit 1; \
  fi
@z

@x
# ============================================
# Stage 2: Build Next.js Application
# ============================================
@y
# ============================================
# Stage 2: Build Next.js Application
# ============================================
@z

@x
FROM node:${NODE_VERSION} AS builder
@y
FROM node:${NODE_VERSION} AS builder
@z

@x
# Set the working directory
WORKDIR /app
@y
# Set the working directory
WORKDIR /app
@z

@x
# Copy project dependencies from dependencies stage
COPY --from=dependencies /app/node_modules ./node_modules
@y
# Copy project dependencies from dependencies stage
COPY --from=dependencies /app/node_modules ./node_modules
@z

@x
# Copy application source code
COPY . .
@y
# Copy application source code
COPY . .
@z

@x
ENV NODE_ENV=production
@y
ENV NODE_ENV=production
@z

@x
# Next.js collects completely anonymous telemetry data about general usage.
# Learn more here: https://nextjs.org/telemetry
# Uncomment the following line in case you want to disable telemetry during the build.
# ENV NEXT_TELEMETRY_DISABLED=1
@y
# Next.js collects completely anonymous telemetry data about general usage.
# Learn more here: https://nextjs.org/telemetry
# Uncomment the following line in case you want to disable telemetry during the build.
# ENV NEXT_TELEMETRY_DISABLED=1
@z

@x
# Build Next.js application
RUN --mount=type=cache,target=/app/.next/cache \
  if [ -f package-lock.json ]; then \
    npm run build; \
  elif [ -f yarn.lock ]; then \
    corepack enable yarn && yarn build; \
  elif [ -f pnpm-lock.yaml ]; then \
    corepack enable pnpm && pnpm build; \
  else \
    echo "No lockfile found." && exit 1; \
  fi
@y
# Build Next.js application
RUN --mount=type=cache,target=/app/.next/cache \
  if [ -f package-lock.json ]; then \
    npm run build; \
  elif [ -f yarn.lock ]; then \
    corepack enable yarn && yarn build; \
  elif [ -f pnpm-lock.yaml ]; then \
    corepack enable pnpm && pnpm build; \
  else \
    echo "No lockfile found." && exit 1; \
  fi
@z

@x
# =========================================
# Stage 3: Serve Static Files with Nginx
# =========================================
@y
# =========================================
# Stage 3: Serve Static Files with Nginx
# =========================================
@z

@x
FROM nginxinc/nginx-unprivileged:${NGINXINC_IMAGE_TAG} AS runner
@y
FROM nginxinc/nginx-unprivileged:${NGINXINC_IMAGE_TAG} AS runner
@z

@x
# Set the working directory
WORKDIR /app
@y
# Set the working directory
WORKDIR /app
@z

@x
# Next.js collects completely anonymous telemetry data about general usage.
# Learn more here: https://nextjs.org/telemetry
# Uncomment the following line in case you want to disable telemetry during the run time.
# ENV NEXT_TELEMETRY_DISABLED=1
@y
# Next.js collects completely anonymous telemetry data about general usage.
# Learn more here: https://nextjs.org/telemetry
# Uncomment the following line in case you want to disable telemetry during the run time.
# ENV NEXT_TELEMETRY_DISABLED=1
@z

@x
# Copy custom Nginx config
COPY nginx.conf /etc/nginx/nginx.conf
@y
# Copy custom Nginx config
COPY nginx.conf /etc/nginx/nginx.conf
@z

@x
# Copy the static build output from the build stage to Nginx's default HTML serving directory
COPY --from=builder /app/out /usr/share/nginx/html
@y
# Copy the static build output from the build stage to Nginx's default HTML serving directory
COPY --from=builder /app/out /usr/share/nginx/html
@z

@x
# Non-root user for security best practices
USER nginx
@y
# Non-root user for security best practices
USER nginx
@z

@x
# Expose port 8080 to allow HTTP traffic
EXPOSE 8080
@y
# Expose port 8080 to allow HTTP traffic
EXPOSE 8080
@z

@x
# Start Nginx directly with custom config
ENTRYPOINT ["nginx", "-c", "/etc/nginx/nginx.conf"]
CMD ["-g", "daemon off;"]
```
@y
# Start Nginx directly with custom config
ENTRYPOINT ["nginx", "-c", "/etc/nginx/nginx.conf"]
CMD ["-g", "daemon off;"]
```
@z

@x
> [!NOTE]
> This guide uses [nginx-unprivileged](https://hub.docker.com/r/nginxinc/nginx-unprivileged) instead of the standard Nginx image to run as a non-root user, following security best practices.
@y
> [!NOTE]
> This guide uses [nginx-unprivileged](https://hub.docker.com/r/nginxinc/nginx-unprivileged) instead of the standard Nginx image to run as a non-root user, following security best practices.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
1. Create `nginx.conf` (required for export output only) — Create a file named `nginx.conf` in the root of your project:
@y
1. Create `nginx.conf` (required for export output only) — Create a file named `nginx.conf` in the root of your project:
@z

@x
   ```nginx
   # Minimal Nginx config for static Next.js app
   worker_processes 1;
@y
   ```nginx
   # Minimal Nginx config for static Next.js app
   worker_processes 1;
@z

@x
   # Store PID in /tmp (always writable)
   pid /tmp/nginx.pid;
@y
   # Store PID in /tmp (always writable)
   pid /tmp/nginx.pid;
@z

@x
   events {
       worker_connections 1024;
   }
@y
   events {
       worker_connections 1024;
   }
@z

@x
   http {
       include       /etc/nginx/mime.types;
       default_type  application/octet-stream;
@y
   http {
       include       /etc/nginx/mime.types;
       default_type  application/octet-stream;
@z

@x
       # Disable logging to avoid permission issues
       access_log off;
       error_log  /dev/stderr;
@y
       # Disable logging to avoid permission issues
       access_log off;
       error_log  /dev/stderr;
@z

@x
       # Optimize static file serving
       sendfile        on;
       tcp_nopush      on;
       tcp_nodelay     on;
       keepalive_timeout  65;
@y
       # Optimize static file serving
       sendfile        on;
       tcp_nopush      on;
       tcp_nodelay     on;
       keepalive_timeout  65;
@z

@x
       # Gzip compression
       gzip on;
       gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;
       gzip_min_length 256;
@y
       # Gzip compression
       gzip on;
       gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;
       gzip_min_length 256;
@z

@x
       server {
           listen       8080;
           server_name  localhost;
@y
       server {
           listen       8080;
           server_name  localhost;
@z

@x
           # Serve static files
           root /usr/share/nginx/html;
           index index.html;
@y
           # Serve static files
           root /usr/share/nginx/html;
           index index.html;
@z

@x
           # Handle Next.js static export routing
           # See: https://nextjs.org/docs/app/guides/static-exports#deploying
           location / {
               try_files $uri $uri.html $uri/ =404;
           }
@y
           # Handle Next.js static export routing
           # See: https://nextjs.org/docs/app/guides/static-exports#deploying
           location / {
               try_files $uri $uri.html $uri/ =404;
           }
@z

@x
           # This is necessary when `trailingSlash: false` (default).
           # You can omit this when `trailingSlash: true` in next.config.
           # Handles nested routes like /blog/post -> /blog/post.html
           location ~ ^/(.+)/$ {
               rewrite ^/(.+)/$ /$1.html break;
           }
@y
           # This is necessary when `trailingSlash: false` (default).
           # You can omit this when `trailingSlash: true` in next.config.
           # Handles nested routes like /blog/post -> /blog/post.html
           location ~ ^/(.+)/$ {
               rewrite ^/(.+)/$ /$1.html break;
           }
@z

@x
           # Serve Next.js static assets
           location ~ ^/_next/ {
               try_files $uri =404;
               expires 1y;
               add_header Cache-Control "public, immutable";
           }
@y
           # Serve Next.js static assets
           location ~ ^/_next/ {
               try_files $uri =404;
               expires 1y;
               add_header Cache-Control "public, immutable";
           }
@z

@x
           # Optional 404 handling
           error_page 404 /404.html;
           location = /404.html {
               internal;
           }
       }
   }
   ```
@y
           # Optional 404 handling
           error_page 404 /404.html;
           location = /404.html {
               internal;
           }
       }
   }
   ```
@z

@x
   > [!NOTE]
   > Export uses port 8080. For more details, see the [Next.js output configuration](https://nextjs.org/docs/app/api-reference/config/next-config-js/output) and [Nginx documentation](https://nginx.org/en/docs/).
@y
   > [!NOTE]
   > Export uses port 8080. For more details, see the [Next.js output configuration](https://nextjs.org/docs/app/api-reference/config/next-config-js/output) and [Nginx documentation](https://nginx.org/en/docs/).
@z

@x
#### Step 2: Create the compose.yaml file
@y
#### Step 2: Create the compose.yaml file
@z

@x
Create a file named `compose.yaml` with the following contents:
@y
Create a file named `compose.yaml` with the following contents:
@z

@x
```yaml {collapse=true,title=compose.yaml}
services:
  server:
    build:
      context: .
    ports:
      - 3000:3000
```
@y
```yaml {collapse=true,title=compose.yaml}
services:
  server:
    build:
      context: .
    ports:
      - 3000:3000
```
@z

@x
> [!NOTE]
> If using export output (Nginx), change the port mapping to `8080:8080`.
@y
> [!NOTE]
> If using export output (Nginx), change the port mapping to `8080:8080`.
@z

@x
#### Step 3: Create the .dockerignore file
@y
#### Step 3: Create the .dockerignore file
@z

@x
The `.dockerignore` file tells Docker which files and folders to exclude when building the image.
@y
The `.dockerignore` file tells Docker which files and folders to exclude when building the image.
@z

@x
> [!NOTE]
> This helps:
>
> - Reduce image size
> - Speed up the build process
> - Prevent sensitive or unnecessary files (like `.env`, `.git`, or `node_modules`) from being added to the final image.
>
> To learn more, visit the [.dockerignore reference](/reference/dockerfile.md#dockerignore-file).
@y
> [!NOTE]
> This helps:
>
> - Reduce image size
> - Speed up the build process
> - Prevent sensitive or unnecessary files (like `.env`, `.git`, or `node_modules`) from being added to the final image.
>
> To learn more, visit the [.dockerignore reference](reference/dockerfile.md#dockerignore-file).
@z

@x
Create a file named `.dockerignore` with the following contents:
@y
Create a file named `.dockerignore` with the following contents:
@z

@x
```dockerignore
# Dependencies (installed inside the image, never copy from host)
node_modules/
.pnp/
.pnp.js
.pnpm-store/
@y
```dockerignore
# Dependencies (installed inside the image, never copy from host)
node_modules/
.pnp/
.pnp.js
.pnpm-store/
@z

@x
# Next.js build output (generated during the image build)
.next/
out/
dist/
build/
.vercel/
@y
# Next.js build output (generated during the image build)
.next/
out/
dist/
build/
.vercel/
@z

@x
# Testing (not needed in the production image)
coverage/
.nyc_output/
__tests__/
__mocks__/
jest/
cypress/
playwright-report/
test-results/
.vitest/
@y
# Testing (not needed in the production image)
coverage/
.nyc_output/
__tests__/
__mocks__/
jest/
cypress/
playwright-report/
test-results/
.vitest/
@z

@x
# Environment files (avoid leaking secrets into the build context)
.env
.env*
.env.local
.env.development.local
.env.test.local
.env.production.local
@y
# Environment files (avoid leaking secrets into the build context)
.env
.env*
.env.local
.env.development.local
.env.test.local
.env.production.local
@z

@x
# Debug and log files
npm-debug.log*
yarn-debug.log*
yarn-error.log*
pnpm-debug.log*
lerna-debug.log*
*.log
@y
# Debug and log files
npm-debug.log*
yarn-debug.log*
yarn-error.log*
pnpm-debug.log*
lerna-debug.log*
*.log
@z

@x
# IDE and editor files
.vscode/
.idea/
.cursor/
.cursorrules
.copilot/
*.swp
*.swo
*~
@y
# IDE and editor files
.vscode/
.idea/
.cursor/
.cursorrules
.copilot/
*.swp
*.swo
*~
@z

@x
# Git
.git/
.gitignore
.gitattributes
@y
# Git
.git/
.gitignore
.gitattributes
@z

@x
# Docker files (reduce build context; not needed inside the image)
Dockerfile*
.dockerignore
docker-compose*.yml
compose*.yaml
@y
# Docker files (reduce build context; not needed inside the image)
Dockerfile*
.dockerignore
docker-compose*.yml
compose*.yaml
@z

@x
# Documentation (not needed in the image)
*.md
docs/
@y
# Documentation (not needed in the image)
*.md
docs/
@z

@x
# CI/CD (not needed in the image)
.github/
.gitlab-ci.yml
.travis.yml
.circleci/
Jenkinsfile
@y
# CI/CD (not needed in the image)
.github/
.gitlab-ci.yml
.travis.yml
.circleci/
Jenkinsfile
@z

@x
# TypeScript and build metadata
*.tsbuildinfo
@y
# TypeScript and build metadata
*.tsbuildinfo
@z

@x
# Cache and temporary directories
.cache/
.parcel-cache/
.eslintcache
.stylelintcache
.turbo/
.tmp/
.temp/
@y
# Cache and temporary directories
.cache/
.parcel-cache/
.eslintcache
.stylelintcache
.turbo/
.tmp/
.temp/
@z

@x
# Sensitive or dev-only config (optional; omit if your build needs these)
.pem
.editorconfig
.prettierrc*
.eslintrc*
.stylelintrc*
.babelrc*
*.iml
@y
# Sensitive or dev-only config (optional; omit if your build needs these)
.pem
.editorconfig
.prettierrc*
.eslintrc*
.stylelintrc*
.babelrc*
*.iml
@z

@x
# OS-specific files
.DS_Store
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db
Desktop.ini
```
@y
# OS-specific files
.DS_Store
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db
Desktop.ini
```
@z

@x
#### Step 4: Build the Next.js application image
@y
#### Step 4: Build the Next.js application image
@z

@x
With your custom configuration in place, you're now ready to build the Docker image. Use the Dockerfile you created in Step 1 (standalone or export).
@y
With your custom configuration in place, you're now ready to build the Docker image. Use the Dockerfile you created in Step 1 (standalone or export).
@z

@x
The setup includes:
@y
The setup includes:
@z

@x
- Multi-stage builds for optimized image size
- Standalone: Node.js server on port 3000; Export: Nginx serving static files on port 8080
- Non-root user for enhanced security
- Proper file permissions and ownership
@y
- Multi-stage builds for optimized image size
- Standalone: Node.js server on port 3000; Export: Nginx serving static files on port 8080
- Non-root user for enhanced security
- Proper file permissions and ownership
@z

@x
After completing the previous steps, your project directory should contain at least the following files (export also requires `nginx.conf`):
@y
After completing the previous steps, your project directory should contain at least the following files (export also requires `nginx.conf`):
@z

@x
```text
├── docker-nextjs-sample/
│ ├── Dockerfile
│ ├── .dockerignore
│ ├── compose.yaml
│ └── next.config.ts
```
@y
```text
├── docker-nextjs-sample/
│ ├── Dockerfile
│ ├── .dockerignore
│ ├── compose.yaml
│ └── next.config.ts
```
@z

@x
Now that your Dockerfile is configured, you can build the Docker image for your Next.js application.
@y
Now that your Dockerfile is configured, you can build the Docker image for your Next.js application.
@z

@x
> [!NOTE]
> The `docker build` command packages your application into an image using the instructions in the Dockerfile. It includes all necessary files from the current directory (called the [build context](/build/concepts/context/#what-is-a-build-context)).
@y
> [!NOTE]
> The `docker build` command packages your application into an image using the instructions in the Dockerfile. It includes all necessary files from the current directory (called the [build context](__SUBDIR__/build/concepts/context/#what-is-a-build-context)).
@z

@x
Run the following command from the root of your project:
@y
Run the following command from the root of your project:
@z

@x
```console
$ docker build --tag nextjs-sample .
```
@y
```console
$ docker build --tag nextjs-sample .
```
@z

@x
What this command does:
@y
What this command does:
@z

@x
- Uses the Dockerfile in the current directory (.)
- Packages the application and its dependencies into a Docker image
- Tags the image as nextjs-sample so you can reference it later
@y
- Uses the Dockerfile in the current directory (.)
- Packages the application and its dependencies into a Docker image
- Tags the image as nextjs-sample so you can reference it later
@z

@x
#### Step 5: View local images
@y
#### Step 5: View local images
@z

@x
After building your Docker image, you can check which images are available on your local machine using either the Docker CLI or [Docker Desktop](/manuals/desktop/use-desktop/images.md). Since you're already working in the terminal, let's use the Docker CLI.
@y
After building your Docker image, you can check which images are available on your local machine using either the Docker CLI or [Docker Desktop](manuals/desktop/use-desktop/images.md). Since you're already working in the terminal, let's use the Docker CLI.
@z

@x
To list all locally available Docker images, run the following command:
@y
To list all locally available Docker images, run the following command:
@z

@x
```console
$ docker images
```
@y
```console
$ docker images
```
@z

@x
Example Output:
@y
Example Output:
@z

@x
```shell
REPOSITORY                TAG               IMAGE ID       CREATED         SIZE
nextjs-sample             latest            8c5fc80f098e   14 seconds ago   130MB
```
@y
```shell
REPOSITORY                TAG               IMAGE ID       CREATED         SIZE
nextjs-sample             latest            8c5fc80f098e   14 seconds ago   130MB
```
@z

@x
This output provides key details about your images:
@y
This output provides key details about your images:
@z

@x
- Repository – The name assigned to the image.
- Tag – A version label that helps identify different builds (e.g., latest).
- Image ID – A unique identifier for the image.
- Created – The timestamp indicating when the image was built.
- Size – The total disk space used by the image.
@y
- Repository – The name assigned to the image.
- Tag – A version label that helps identify different builds (e.g., latest).
- Image ID – A unique identifier for the image.
- Created – The timestamp indicating when the image was built.
- Size – The total disk space used by the image.
@z

@x
If the build was successful, you should see `nextjs-sample` image listed.
@y
If the build was successful, you should see `nextjs-sample` image listed.
@z

@x
---
@y
---
@z

@x
### Run the containerized application
@y
### Run the containerized application
@z

@x
In the previous step, you created a Dockerfile for your Next.js application and built a Docker image using the docker build command. Now it's time to run that image in a container and verify that your application works as expected.
@y
In the previous step, you created a Dockerfile for your Next.js application and built a Docker image using the docker build command. Now it's time to run that image in a container and verify that your application works as expected.
@z

@x
Run the following command in a terminal. Use the port that matches your setup: standalone uses port 3000, export uses port 8080.
@y
Run the following command in a terminal. Use the port that matches your setup: standalone uses port 3000, export uses port 8080.
@z

@x
```console
$ docker run -p 3000:3000 nextjs-sample
```
@y
```console
$ docker run -p 3000:3000 nextjs-sample
```
@z

@x
For export output, use port 8080 instead:
@y
For export output, use port 8080 instead:
@z

@x
```console
$ docker run -p 8080:8080 nextjs-sample
```
@y
```console
$ docker run -p 8080:8080 nextjs-sample
```
@z

@x
Open a browser and view the application: [http://localhost:3000](http://localhost:3000) for standalone or [http://localhost:8080](http://localhost:8080) for export. You should see your Next.js web application.
@y
Open a browser and view the application: [http://localhost:3000](http://localhost:3000) for standalone or [http://localhost:8080](http://localhost:8080) for export. You should see your Next.js web application.
@z

@x
Press `ctrl+c` in the terminal to stop your application.
@y
Press `ctrl+c` in the terminal to stop your application.
@z

@x
#### Run the application in the background
@y
#### Run the application in the background
@z

@x
You can run the application detached from the terminal by adding the `-d` option and `--name` to give the container a name so you can stop it later:
@y
You can run the application detached from the terminal by adding the `-d` option and `--name` to give the container a name so you can stop it later:
@z

@x
```console
$ docker run -d -p 3000:3000 --name nextjs-app nextjs-sample
```
@y
```console
$ docker run -d -p 3000:3000 --name nextjs-app nextjs-sample
```
@z

@x
For export output, use port 8080:
@y
For export output, use port 8080:
@z

@x
```console
$ docker run -d -p 8080:8080 --name nextjs-app nextjs-sample
```
@y
```console
$ docker run -d -p 8080:8080 --name nextjs-app nextjs-sample
```
@z

@x
Open a browser and view the application: [http://localhost:3000](http://localhost:3000) for standalone or [http://localhost:8080](http://localhost:8080) for export. You should see your web application.
@y
Open a browser and view the application: [http://localhost:3000](http://localhost:3000) for standalone or [http://localhost:8080](http://localhost:8080) for export. You should see your web application.
@z

@x
To confirm that the container is running, use the `docker ps` command:
@y
To confirm that the container is running, use the `docker ps` command:
@z

@x
```console
$ docker ps
```
@y
```console
$ docker ps
```
@z

@x
This will list all active containers along with their ports, names, and status. Look for a container exposing port 3000 (standalone) or 8080 (export).
@y
This will list all active containers along with their ports, names, and status. Look for a container exposing port 3000 (standalone) or 8080 (export).
@z

@x
Example Output:
@y
Example Output:
@z

@x
```shell
CONTAINER ID   IMAGE           COMMAND                  CREATED             STATUS             PORTS                    NAMES
f49b74736a9d   nextjs-sample   "node server.js"         About a minute ago   Up About a minute   0.0.0.0:3000->3000/tcp nextjs-app
```
@y
```shell
CONTAINER ID   IMAGE           COMMAND                  CREATED             STATUS             PORTS                    NAMES
f49b74736a9d   nextjs-sample   "node server.js"         About a minute ago   Up About a minute   0.0.0.0:3000->3000/tcp nextjs-app
```
@z

@x
To stop the application, run:
@y
To stop the application, run:
@z

@x
```console
$ docker stop nextjs-app
```
@y
```console
$ docker stop nextjs-app
```
@z

@x
> [!NOTE]
> For more information about running containers, see the [`docker run` CLI reference](/reference/cli/docker/container/run/) and the [`docker stop` CLI reference](/reference/cli/docker/container/stop/).
@y
> [!NOTE]
> For more information about running containers, see the [`docker run` CLI reference](__SUBDIR__/reference/cli/docker/container/run/) and the [`docker stop` CLI reference](__SUBDIR__/reference/cli/docker/container/stop/).
@z

@x
---
@y
---
@z

@x
## Use containers for Next.js development
@y
## Use containers for Next.js development
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
Complete [Containerize Next.js application](#containerize-a-nextjs-application).
@y
Complete [Containerize Next.js application](#containerize-a-nextjs-application).
@z

@x
---
@y
---
@z

@x
### Overview
@y
### Overview
@z

@x
In this section, you'll learn how to set up both production and development environments for your containerized Next.js application using Docker Compose. This setup allows you to run a production build using the standalone server and to develop efficiently inside containers using Next.js's built-in hot reloading with Compose Watch.
@y
In this section, you'll learn how to set up both production and development environments for your containerized Next.js application using Docker Compose. This setup allows you to run a production build using the standalone server and to develop efficiently inside containers using Next.js's built-in hot reloading with Compose Watch.
@z

@x
You'll learn how to:
@y
You'll learn how to:
@z

@x
- Configure separate containers for production and development
- Enable automatic file syncing using Compose Watch in development
- Debug and live-preview your changes in real-time without manual rebuilds
@y
- Configure separate containers for production and development
- Enable automatic file syncing using Compose Watch in development
- Debug and live-preview your changes in real-time without manual rebuilds
@z

@x
---
@y
---
@z

@x
### Automatically update services (development mode)
@y
### Automatically update services (development mode)
@z

@x
Use Compose Watch to automatically sync source file changes into your
containerized development environment. This automatically syncs file changes
without needing to restart or rebuild containers manually.
@y
Use Compose Watch to automatically sync source file changes into your
containerized development environment. This automatically syncs file changes
without needing to restart or rebuild containers manually.
@z

@x
### Step 1: Create a development Dockerfile
@y
### Step 1: Create a development Dockerfile
@z

@x
Create a file named `Dockerfile.dev` in your project root with the following content (matching the [sample project](https://github.com/kristiyan-velkov/docker-nextjs-sample)):
@y
Create a file named `Dockerfile.dev` in your project root with the following content (matching the [sample project](https://github.com/kristiyan-velkov/docker-nextjs-sample)):
@z

@x
```dockerfile
# ============================================
# Development Dockerfile for Next.js
# ============================================
ARG NODE_VERSION=24.14.0-slim
@y
```dockerfile
# ============================================
# Development Dockerfile for Next.js
# ============================================
ARG NODE_VERSION=24.14.0-slim
@z

@x
FROM node:${NODE_VERSION} AS dev
@y
FROM node:${NODE_VERSION} AS dev
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
COPY package.json yarn.lock* package-lock.json* pnpm-lock.yaml* .npmrc* ./
@y
COPY package.json yarn.lock* package-lock.json* pnpm-lock.yaml* .npmrc* ./
@z

@x
RUN --mount=type=cache,target=/root/.npm \
    --mount=type=cache,target=/usr/local/share/.cache/yarn \
    --mount=type=cache,target=/root/.local/share/pnpm/store \
  if [ -f package-lock.json ]; then \
    npm ci --no-audit --no-fund; \
  elif [ -f yarn.lock ]; then \
    corepack enable yarn && yarn install --frozen-lockfile --production=false; \
  elif [ -f pnpm-lock.yaml ]; then \
    corepack enable pnpm && pnpm install --frozen-lockfile; \
  else \
    echo "No lockfile found." && exit 1; \
  fi
@y
RUN --mount=type=cache,target=/root/.npm \
    --mount=type=cache,target=/usr/local/share/.cache/yarn \
    --mount=type=cache,target=/root/.local/share/pnpm/store \
  if [ -f package-lock.json ]; then \
    npm ci --no-audit --no-fund; \
  elif [ -f yarn.lock ]; then \
    corepack enable yarn && yarn install --frozen-lockfile --production=false; \
  elif [ -f pnpm-lock.yaml ]; then \
    corepack enable pnpm && pnpm install --frozen-lockfile; \
  else \
    echo "No lockfile found." && exit 1; \
  fi
@z

@x
COPY . .
@y
COPY . .
@z

@x
ENV WATCHPACK_POLLING=true
ENV HOSTNAME="0.0.0.0"
@y
ENV WATCHPACK_POLLING=true
ENV HOSTNAME="0.0.0.0"
@z

@x
RUN chown -R node:node /app
USER node
@y
RUN chown -R node:node /app
USER node
@z

@x
EXPOSE 3000
@y
EXPOSE 3000
@z

@x
CMD ["sh", "-c", "if [ -f package-lock.json ]; then npm run dev; elif [ -f yarn.lock ]; then yarn dev; elif [ -f pnpm-lock.yaml ]; then pnpm dev; else npm run dev; fi"]
```
@y
CMD ["sh", "-c", "if [ -f package-lock.json ]; then npm run dev; elif [ -f yarn.lock ]; then yarn dev; elif [ -f pnpm-lock.yaml ]; then pnpm dev; else npm run dev; fi"]
```
@z

@x
This file sets up a development environment for your Next.js app with hot module replacement and supports npm, yarn, and pnpm.
@y
This file sets up a development environment for your Next.js app with hot module replacement and supports npm, yarn, and pnpm.
@z

@x
#### Step 2: Update your `compose.yaml` file
@y
#### Step 2: Update your `compose.yaml` file
@z

@x
Open your `compose.yaml` file and define two services: one for production (`nextjs-prod-standalone`) and one for development (`nextjs-dev`). This matches the [sample project](https://github.com/kristiyan-velkov/docker-nextjs-sample) structure.
@y
Open your `compose.yaml` file and define two services: one for production (`nextjs-prod-standalone`) and one for development (`nextjs-dev`). This matches the [sample project](https://github.com/kristiyan-velkov/docker-nextjs-sample) structure.
@z

@x
Here's an example configuration for a Next.js application:
@y
Here's an example configuration for a Next.js application:
@z

@x
```yaml
services:
  nextjs-prod-standalone:
    build:
      context: .
      dockerfile: Dockerfile
    image: nextjs-sample:prod
    container_name: nextjs-sample-prod
    ports:
      - "3000:3000"
@y
```yaml
services:
  nextjs-prod-standalone:
    build:
      context: .
      dockerfile: Dockerfile
    image: nextjs-sample:prod
    container_name: nextjs-sample-prod
    ports:
      - "3000:3000"
@z

@x
  nextjs-dev:
    build:
      context: .
      dockerfile: Dockerfile.dev
    image: nextjs-sample:dev
    container_name: nextjs-sample-dev
    ports:
      - "3000:3000"
    environment:
      - WATCHPACK_POLLING=true
    develop:
      watch:
        - action: sync
          path: .
          target: /app
          ignore:
            - node_modules/
            - .next/
        - action: rebuild
          path: package.json
```
@y
  nextjs-dev:
    build:
      context: .
      dockerfile: Dockerfile.dev
    image: nextjs-sample:dev
    container_name: nextjs-sample-dev
    ports:
      - "3000:3000"
    environment:
      - WATCHPACK_POLLING=true
    develop:
      watch:
        - action: sync
          path: .
          target: /app
          ignore:
            - node_modules/
            - .next/
        - action: rebuild
          path: package.json
```
@z

@x
- The `nextjs-prod-standalone` service builds and runs your production Next.js app using the standalone output.
- The `nextjs-dev` service runs your Next.js development server with hot module replacement.
- `watch` triggers file sync with Compose Watch.
- `WATCHPACK_POLLING=true` ensures file changes are detected properly inside Docker.
- The `rebuild` action for `package.json` ensures dependencies are reinstalled when the file changes.
@y
- The `nextjs-prod-standalone` service builds and runs your production Next.js app using the standalone output.
- The `nextjs-dev` service runs your Next.js development server with hot module replacement.
- `watch` triggers file sync with Compose Watch.
- `WATCHPACK_POLLING=true` ensures file changes are detected properly inside Docker.
- The `rebuild` action for `package.json` ensures dependencies are reinstalled when the file changes.
@z

@x
> [!NOTE]
> For more details, see the official guide: [Use Compose Watch](/manuals/compose/how-tos/file-watch.md).
@y
> [!NOTE]
> For more details, see the official guide: [Use Compose Watch](manuals/compose/how-tos/file-watch.md).
@z

@x
#### Step 3: Configure Next.js for Docker development
@y
#### Step 3: Configure Next.js for Docker development
@z

@x
Next.js works well inside Docker containers out of the box, but there are a few configurations that can improve the development experience.
@y
Next.js works well inside Docker containers out of the box, but there are a few configurations that can improve the development experience.
@z

@x
The `next.config.ts` file you created during containerization already includes the `output: "standalone"` option for production. For development, Next.js automatically uses its built-in development server with hot reloading enabled.
@y
The `next.config.ts` file you created during containerization already includes the `output: "standalone"` option for production. For development, Next.js automatically uses its built-in development server with hot reloading enabled.
@z

@x
> [!NOTE]
> The Next.js development server automatically:
>
> - Enables Hot Module Replacement (HMR) for instant updates
> - Watches for file changes and recompiles automatically
> - Provides detailed error messages in the browser
>
> The `WATCHPACK_POLLING=true` environment variable in the compose file ensures file watching works correctly inside Docker containers.
@y
> [!NOTE]
> The Next.js development server automatically:
>
> - Enables Hot Module Replacement (HMR) for instant updates
> - Watches for file changes and recompiles automatically
> - Provides detailed error messages in the browser
>
> The `WATCHPACK_POLLING=true` environment variable in the compose file ensures file watching works correctly inside Docker containers.
@z

@x
After completing the previous steps, your project directory should now contain the following files:
@y
After completing the previous steps, your project directory should now contain the following files:
@z

@x
```text
├── docker-nextjs-sample/
│ ├── Dockerfile
│ ├── Dockerfile.dev
│ ├── .dockerignore
│ ├── compose.yaml
│ └── next.config.ts
```
@y
```text
├── docker-nextjs-sample/
│ ├── Dockerfile
│ ├── Dockerfile.dev
│ ├── .dockerignore
│ ├── compose.yaml
│ └── next.config.ts
```
@z

@x
#### Step 4: Start Compose Watch
@y
#### Step 4: Start Compose Watch
@z

@x
Run the following command from your project root to start your container in watch mode:
@y
Run the following command from your project root to start your container in watch mode:
@z

@x
```console
$ docker compose watch nextjs-dev
```
@y
```console
$ docker compose watch nextjs-dev
```
@z

@x
#### Step 5: Test Compose Watch with Next.js
@y
#### Step 5: Test Compose Watch with Next.js
@z

@x
To verify that Compose Watch is working correctly:
@y
To verify that Compose Watch is working correctly:
@z

@x
1. Open the `app/page.tsx` file in your text editor (or `src/app/page.tsx` if your project uses a `src` directory).
@y
1. Open the `app/page.tsx` file in your text editor (or `src/app/page.tsx` if your project uses a `src` directory).
@z

@x
2. Locate the main content area and find a text element to modify.
@y
2. Locate the main content area and find a text element to modify.
@z

@x
3. Make a visible change, for example, update a heading:
@y
3. Make a visible change, for example, update a heading:
@z

@x
   ```tsx
   <h1>Hello from Docker Compose Watch!</h1>
   ```
@y
   ```tsx
   <h1>Hello from Docker Compose Watch!</h1>
   ```
@z

@x
4. Save the file.
@y
4. Save the file.
@z

@x
5. Open your browser at [http://localhost:3000](http://localhost:3000).
@y
5. Open your browser at [http://localhost:3000](http://localhost:3000).
@z

@x
You should see the updated text appear instantly, without needing to rebuild the container manually. This confirms that file watching and automatic synchronization are working as expected.
@y
You should see the updated text appear instantly, without needing to rebuild the container manually. This confirms that file watching and automatic synchronization are working as expected.
@z

@x
---
@y
---
@z

@x
## Run Next.js tests in a container
@y
## Run Next.js tests in a container
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
Complete all the previous sections of this guide, starting with [Containerize Next.js application](#containerize-a-nextjs-application).
@y
Complete all the previous sections of this guide, starting with [Containerize Next.js application](#containerize-a-nextjs-application).
@z

@x
### Overview
@y
### Overview
@z

@x
Testing is a critical part of the development process. In this section, you'll learn how to:
@y
Testing is a critical part of the development process. In this section, you'll learn how to:
@z

@x
- Run unit tests using Vitest (or Jest) inside a Docker container.
- Run lint (e.g. ESLint) inside a Docker container.
- Use Docker Compose to run tests and lint in an isolated, reproducible environment.
@y
- Run unit tests using Vitest (or Jest) inside a Docker container.
- Run lint (e.g. ESLint) inside a Docker container.
- Use Docker Compose to run tests and lint in an isolated, reproducible environment.
@z

@x
The [sample project](https://github.com/kristiyan-velkov/docker-nextjs-sample) uses [Vitest](https://vitest.dev/) with [Testing Library](https://testing-library.com/) for component testing. You can use the same setup or follow the alternative Jest configuration later.
@y
The [sample project](https://github.com/kristiyan-velkov/docker-nextjs-sample) uses [Vitest](https://vitest.dev/) with [Testing Library](https://testing-library.com/) for component testing. You can use the same setup or follow the alternative Jest configuration later.
@z

@x
---
@y
---
@z

@x
### Run tests during development
@y
### Run tests during development
@z

@x
The [sample project](https://github.com/kristiyan-velkov/docker-nextjs-sample) already includes lint (ESLint) and sample tests (Vitest, `app/page.test.tsx`) in place. If you're using the sample app, you can skip to **Step 3: Update compose.yaml** and run tests or lint with the commands below. If you're using your own project, follow the install and configuration steps to add the packages and scripts.
@y
The [sample project](https://github.com/kristiyan-velkov/docker-nextjs-sample) already includes lint (ESLint) and sample tests (Vitest, `app/page.test.tsx`) in place. If you're using the sample app, you can skip to **Step 3: Update compose.yaml** and run tests or lint with the commands below. If you're using your own project, follow the install and configuration steps to add the packages and scripts.
@z

@x
The sample includes a test file at:
@y
The sample includes a test file at:
@z

@x
```text
app/page.test.tsx
```
@y
```text
app/page.test.tsx
```
@z

@x
This file uses Vitest and React Testing Library to verify the behavior of page components.
@y
This file uses Vitest and React Testing Library to verify the behavior of page components.
@z

@x
#### Step 1: Install Vitest and React Testing Library (custom projects)
@y
#### Step 1: Install Vitest and React Testing Library (custom projects)
@z

@x
If you're using a custom project and haven't already added the necessary testing tools, install them by running:
@y
If you're using a custom project and haven't already added the necessary testing tools, install them by running:
@z

@x
```console
$ npm install --save-dev vitest @vitejs/plugin-react @testing-library/react @testing-library/dom jsdom
```
@y
```console
$ npm install --save-dev vitest @vitejs/plugin-react @testing-library/react @testing-library/dom jsdom
```
@z

@x
Then, update the scripts section of your `package.json` file to include:
@y
Then, update the scripts section of your `package.json` file to include:
@z

@x
```json
"scripts": {
  "test": "vitest",
  "test:run": "vitest run"
}
```
@y
```json
"scripts": {
  "test": "vitest",
  "test:run": "vitest run"
}
```
@z

@x
For lint, add a `lint` script (and optionally `lint:fix`). For example, with [ESLint](https://eslint.org/):
@y
For lint, add a `lint` script (and optionally `lint:fix`). For example, with [ESLint](https://eslint.org/):
@z

@x
```json
"scripts": {
  "test": "vitest",
  "test:run": "vitest run",
  "lint": "eslint .",
  "lint:fix": "eslint . --fix"
}
```
@y
```json
"scripts": {
  "test": "vitest",
  "test:run": "vitest run",
  "lint": "eslint .",
  "lint:fix": "eslint . --fix"
}
```
@z

@x
The sample project uses `eslint` and `eslint-config-next` for Next.js. Install them in a custom project with:
@y
The sample project uses `eslint` and `eslint-config-next` for Next.js. Install them in a custom project with:
@z

@x
```console
$ npm install --save-dev eslint eslint-config-next @eslint/eslintrc
```
@y
```console
$ npm install --save-dev eslint eslint-config-next @eslint/eslintrc
```
@z

@x
Create an ESLint config file (e.g. `eslint.config.cjs`) in your project root with Next.js rules and global ignores:
@y
Create an ESLint config file (e.g. `eslint.config.cjs`) in your project root with Next.js rules and global ignores:
@z

@x
```js
const { defineConfig, globalIgnores } = require("eslint/config");
const { FlatCompat } = require("@eslint/eslintrc");
@y
```js
const { defineConfig, globalIgnores } = require("eslint/config");
const { FlatCompat } = require("@eslint/eslintrc");
@z

@x
const compat = new FlatCompat({ baseDirectory: __dirname });
@y
const compat = new FlatCompat({ baseDirectory: __dirname });
@z

@x
module.exports = defineConfig([
  ...compat.extends(
    "eslint-config-next/core-web-vitals",
    "eslint-config-next/typescript",
  ),
  globalIgnores([
    ".next/**",
    "out/**",
    "build/**",
    "next-env.d.ts",
    "node_modules/**",
    "eslint.config.cjs",
  ]),
]);
```
@y
module.exports = defineConfig([
  ...compat.extends(
    "eslint-config-next/core-web-vitals",
    "eslint-config-next/typescript",
  ),
  globalIgnores([
    ".next/**",
    "out/**",
    "build/**",
    "next-env.d.ts",
    "node_modules/**",
    "eslint.config.cjs",
  ]),
]);
```
@z

@x
---
@y
---
@z

@x
#### Step 2: Configure Vitest (custom projects)
@y
#### Step 2: Configure Vitest (custom projects)
@z

@x
If you're using a custom project, create a `vitest.config.ts` file in your project root (matching the [sample project](https://github.com/kristiyan-velkov/docker-nextjs-sample)):
@y
If you're using a custom project, create a `vitest.config.ts` file in your project root (matching the [sample project](https://github.com/kristiyan-velkov/docker-nextjs-sample)):
@z

@x
```ts
import { defineConfig } from "vitest/config";
import react from "@vitejs/plugin-react";
@y
```ts
import { defineConfig } from "vitest/config";
import react from "@vitejs/plugin-react";
@z

@x
export default defineConfig({
  plugins: [react()],
  test: {
    environment: "jsdom",
    setupFiles: "./vitest.setup.ts",
    globals: true,
  },
});
```
@y
export default defineConfig({
  plugins: [react()],
  test: {
    environment: "jsdom",
    setupFiles: "./vitest.setup.ts",
    globals: true,
  },
});
```
@z

@x
Create a `vitest.setup.ts` file in your project root:
@y
Create a `vitest.setup.ts` file in your project root:
@z

@x
```ts
import "@testing-library/jest-dom/vitest";
```
@y
```ts
import "@testing-library/jest-dom/vitest";
```
@z

@x
> [!NOTE]
> Vitest works well with Next.js and provides fast execution and ESM support. For more details, see the [Next.js testing documentation](https://nextjs.org/docs/app/building-your-application/testing) and [Vitest docs](https://vitest.dev/).
@y
> [!NOTE]
> Vitest works well with Next.js and provides fast execution and ESM support. For more details, see the [Next.js testing documentation](https://nextjs.org/docs/app/building-your-application/testing) and [Vitest docs](https://vitest.dev/).
@z

@x
#### Step 3: Update compose.yaml
@y
#### Step 3: Update compose.yaml
@z

@x
Add `nextjs-test` and `nextjs-lint` services to your `compose.yaml` file. In the sample project these services use the `tools` profile so they don't start with a normal `docker compose up`. Both reuse `Dockerfile.dev` and run the test or lint command:
@y
Add `nextjs-test` and `nextjs-lint` services to your `compose.yaml` file. In the sample project these services use the `tools` profile so they don't start with a normal `docker compose up`. Both reuse `Dockerfile.dev` and run the test or lint command:
@z

@x
```yaml
services:
  nextjs-prod-standalone:
    build:
      context: .
      dockerfile: Dockerfile
    image: nextjs-sample:prod
    container_name: nextjs-sample-prod
    ports:
      - "3000:3000"
@y
```yaml
services:
  nextjs-prod-standalone:
    build:
      context: .
      dockerfile: Dockerfile
    image: nextjs-sample:prod
    container_name: nextjs-sample-prod
    ports:
      - "3000:3000"
@z

@x
  nextjs-dev:
    build:
      context: .
      dockerfile: Dockerfile.dev
    image: nextjs-sample:dev
    container_name: nextjs-sample-dev
    ports:
      - "3000:3000"
    environment:
      - WATCHPACK_POLLING=true
    develop:
      watch:
        - action: sync
          path: .
          target: /app
          ignore:
            - node_modules/
            - .next/
        - action: rebuild
          path: package.json
@y
  nextjs-dev:
    build:
      context: .
      dockerfile: Dockerfile.dev
    image: nextjs-sample:dev
    container_name: nextjs-sample-dev
    ports:
      - "3000:3000"
    environment:
      - WATCHPACK_POLLING=true
    develop:
      watch:
        - action: sync
          path: .
          target: /app
          ignore:
            - node_modules/
            - .next/
        - action: rebuild
          path: package.json
@z

@x
  nextjs-test:
    build:
      context: .
      dockerfile: Dockerfile.dev
    image: nextjs-sample:dev
    container_name: nextjs-sample-test
    command:
      [
        "sh",
        "-c",
        "if [ -f package-lock.json ]; then npm run test:run 2>/dev/null || npm run test -- --run; elif [ -f yarn.lock ]; then yarn test:run 2>/dev/null || yarn test --run; elif [ -f pnpm-lock.yaml ]; then pnpm run test:run; else npm run test -- --run; fi",
      ]
    profiles:
      - tools
@y
  nextjs-test:
    build:
      context: .
      dockerfile: Dockerfile.dev
    image: nextjs-sample:dev
    container_name: nextjs-sample-test
    command:
      [
        "sh",
        "-c",
        "if [ -f package-lock.json ]; then npm run test:run 2>/dev/null || npm run test -- --run; elif [ -f yarn.lock ]; then yarn test:run 2>/dev/null || yarn test --run; elif [ -f pnpm-lock.yaml ]; then pnpm run test:run; else npm run test -- --run; fi",
      ]
    profiles:
      - tools
@z

@x
  nextjs-lint:
    build:
      context: .
      dockerfile: Dockerfile.dev
    image: nextjs-sample:dev
    container_name: nextjs-sample-lint
    command:
      [
        "sh",
        "-c",
        "if [ -f package-lock.json ]; then npm run lint; elif [ -f yarn.lock ]; then yarn lint; elif [ -f pnpm-lock.yaml ]; then pnpm lint; else npm run lint; fi",
      ]
    profiles:
      - tools
```
@y
  nextjs-lint:
    build:
      context: .
      dockerfile: Dockerfile.dev
    image: nextjs-sample:dev
    container_name: nextjs-sample-lint
    command:
      [
        "sh",
        "-c",
        "if [ -f package-lock.json ]; then npm run lint; elif [ -f yarn.lock ]; then yarn lint; elif [ -f pnpm-lock.yaml ]; then pnpm lint; else npm run lint; fi",
      ]
    profiles:
      - tools
```
@z

@x
The `nextjs-test` and `nextjs-lint` services reuse the same `Dockerfile.dev` used for [development](#use-containers-for-nextjs-development) and override the default command to run tests or lint. The `profiles: [tools]` means these services only run when you use the `--profile tools` option.
@y
The `nextjs-test` and `nextjs-lint` services reuse the same `Dockerfile.dev` used for [development](#use-containers-for-nextjs-development) and override the default command to run tests or lint. The `profiles: [tools]` means these services only run when you use the `--profile tools` option.
@z

@x
After completing the previous steps, your project directory should contain:
@y
After completing the previous steps, your project directory should contain:
@z

@x
```text
├── docker-nextjs-sample/
│ ├── Dockerfile
│ ├── Dockerfile.dev
│ ├── .dockerignore
│ ├── compose.yaml
│ ├── vitest.config.ts
│ ├── vitest.setup.ts
│ └── next.config.ts
```
@y
```text
├── docker-nextjs-sample/
│ ├── Dockerfile
│ ├── Dockerfile.dev
│ ├── .dockerignore
│ ├── compose.yaml
│ ├── vitest.config.ts
│ ├── vitest.setup.ts
│ └── next.config.ts
```
@z

@x
#### Step 4: Run the tests
@y
#### Step 4: Run the tests
@z

@x
To execute your test suite inside the container, run from your project root:
@y
To execute your test suite inside the container, run from your project root:
@z

@x
```console
$ docker compose --profile tools run --rm nextjs-test
```
@y
```console
$ docker compose --profile tools run --rm nextjs-test
```
@z

@x
This command will:
@y
This command will:
@z

@x
- Start the `nextjs-test` service (because of `--profile tools`).
- Run your test script (`test:run` or `test -- --run`) in the same environment as development.
- Remove the container after the tests complete ([`docker compose run --rm`](/reference/cli/docker/compose/run/)).
@y
- Start the `nextjs-test` service (because of `--profile tools`).
- Run your test script (`test:run` or `test -- --run`) in the same environment as development.
- Remove the container after the tests complete ([`docker compose run --rm`](__SUBDIR__/reference/cli/docker/compose/run/)).
@z

@x
> [!NOTE]
> For more information about Compose commands and profiles, see the [Compose CLI reference](/reference/cli/docker/compose/).
@y
> [!NOTE]
> For more information about Compose commands and profiles, see the [Compose CLI reference](__SUBDIR__/reference/cli/docker/compose/).
@z

@x
#### Step 5: Run lint in the container
@y
#### Step 5: Run lint in the container
@z

@x
To run your linter (e.g. ESLint) inside the container, use the `nextjs-lint` service with the same `tools` profile:
@y
To run your linter (e.g. ESLint) inside the container, use the `nextjs-lint` service with the same `tools` profile:
@z

@x
```console
$ docker compose --profile tools run --rm nextjs-lint
```
@y
```console
$ docker compose --profile tools run --rm nextjs-lint
```
@z

@x
This command will:
@y
This command will:
@z

@x
- Start the `nextjs-lint` service (because of `--profile tools`).
- Run your lint script (`npm run lint`, `yarn lint`, or `pnpm lint` depending on your lockfile) in the same environment as development.
- Remove the container after lint completes.
@y
- Start the `nextjs-lint` service (because of `--profile tools`).
- Run your lint script (`npm run lint`, `yarn lint`, or `pnpm lint` depending on your lockfile) in the same environment as development.
- Remove the container after lint completes.
@z

@x
Ensure your `package.json` includes a `lint` script. The sample project already has `"lint": "eslint ."` and `"lint:fix": "eslint . --fix"`; for a custom project, add the same and install `eslint` and `eslint-config-next` if needed.
@y
Ensure your `package.json` includes a `lint` script. The sample project already has `"lint": "eslint ."` and `"lint:fix": "eslint . --fix"`; for a custom project, add the same and install `eslint` and `eslint-config-next` if needed.
@z

@x
---
@y
---
@z

@x
### Summary
@y
### Summary
@z

@x
In this section, you learned how to run unit tests for your Next.js application inside a Docker container using Vitest and Docker Compose.
@y
In this section, you learned how to run unit tests for your Next.js application inside a Docker container using Vitest and Docker Compose.
@z

@x
What you accomplished:
@y
What you accomplished:
@z

@x
- Installed and configured Vitest and React Testing Library for testing Next.js components.
- Created `nextjs-test` and `nextjs-lint` services in `compose.yaml` (with `tools` profile) to isolate test and lint execution.
- Reused the development `Dockerfile.dev` to ensure consistency between dev, test, and lint environments.
- Ran tests inside the container using `docker compose --profile tools run --rm nextjs-test`.
- Ran lint inside the container using `docker compose --profile tools run --rm nextjs-lint`.
- Ensured reliable, repeatable testing and linting across environments without relying on local machine setup.
@y
- Installed and configured Vitest and React Testing Library for testing Next.js components.
- Created `nextjs-test` and `nextjs-lint` services in `compose.yaml` (with `tools` profile) to isolate test and lint execution.
- Reused the development `Dockerfile.dev` to ensure consistency between dev, test, and lint environments.
- Ran tests inside the container using `docker compose --profile tools run --rm nextjs-test`.
- Ran lint inside the container using `docker compose --profile tools run --rm nextjs-lint`.
- Ensured reliable, repeatable testing and linting across environments without relying on local machine setup.
@z

@x
---
@y
---
@z

@x
### Related resources
@y
### Related resources
@z

@x
Explore official references and best practices to sharpen your Docker testing workflow:
@y
Explore official references and best practices to sharpen your Docker testing workflow:
@z

@x
- [Dockerfile reference](/reference/dockerfile/) – Understand all Dockerfile instructions and syntax.
- [Best practices for writing Dockerfiles](/develop/develop-images/dockerfile_best-practices/) – Write efficient, maintainable, and secure Dockerfiles.
- [Compose file reference](/compose/compose-file/) – Learn the full syntax and options available for configuring services in `compose.yaml`.
- [`docker compose run` CLI reference](/reference/cli/docker/compose/run/) – Run one-off commands in a service container.
- [Next.js Testing Documentation](https://nextjs.org/docs/app/building-your-application/testing) – Official Next.js testing guide.
@y
- [Dockerfile reference](__SUBDIR__/reference/dockerfile/) – Understand all Dockerfile instructions and syntax.
- [Best practices for writing Dockerfiles](__SUBDIR__/develop/develop-images/dockerfile_best-practices/) – Write efficient, maintainable, and secure Dockerfiles.
- [Compose file reference](__SUBDIR__/compose/compose-file/) – Learn the full syntax and options available for configuring services in `compose.yaml`.
- [`docker compose run` CLI reference](__SUBDIR__/reference/cli/docker/compose/run/) – Run one-off commands in a service container.
- [Next.js Testing Documentation](https://nextjs.org/docs/app/building-your-application/testing) – Official Next.js testing guide.
@z
