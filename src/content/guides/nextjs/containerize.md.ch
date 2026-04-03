%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Containerize a Next.js Application
linkTitle: Containerize
@y
title: Containerize a Next.js Application
linkTitle: Containerize
@z

@x
keywords: next.js, node, image, initialize, build
description: Learn how to containerize a Next.js application with Docker by creating an optimized, production-ready image using best practices for performance, security, and scalability.
@y
keywords: next.js, node, image, initialize, build
description: Learn how to containerize a Next.js application with Docker by creating an optimized, production-ready image using best practices for performance, security, and scalability.
@z

@x
## Prerequisites
@y
## Prerequisites
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
> **New to Docker?**  
> Start with the [Docker basics](/get-started/docker-concepts/the-basics/what-is-a-container.md) guide to get familiar with key concepts like images, containers, and Dockerfiles.
@y
> **New to Docker?**  
> Start with the [Docker basics](get-started/docker-concepts/the-basics/what-is-a-container.md) guide to get familiar with key concepts like images, containers, and Dockerfiles.
@z

@x
---
@y
---
@z

@x
## Overview
@y
## Overview
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
## Get the sample application
@y
## Get the sample application
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
---
@y
```console
$ git clone https://github.com/kristiyan-velkov/docker-nextjs-sample
```
---
@z

@x
## Generate a Dockerfile
@y
## Generate a Dockerfile
@z

@x
Docker provides an interactive CLI tool called `docker init` that helps scaffold the necessary configuration files for containerizing your application. This includes generating a `Dockerfile`, `.dockerignore`, `compose.yaml`, and `README.Docker.md`.
@y
Docker provides an interactive CLI tool called `docker init` that helps scaffold the necessary configuration files for containerizing your application. This includes generating a `Dockerfile`, `.dockerignore`, `compose.yaml`, and `README.Docker.md`.
@z

@x
To begin, navigate to the project directory:
@y
To begin, navigate to the project directory:
@z

@x
```console
$ cd docker-nextjs-sample
```
@y
```console
$ cd docker-nextjs-sample
```
@z

@x
Then run the following command:
@y
Then run the following command:
@z

@x
```console
$ docker init
```
You'll see output similar to:
@y
```console
$ docker init
```
You'll see output similar to:
@z

@x
```text
Welcome to the Docker Init CLI!
@y
```text
Welcome to the Docker Init CLI!
@z

@x
This utility will walk you through creating the following files with sensible defaults for your project:
  - .dockerignore
  - Dockerfile
  - compose.yaml
  - README.Docker.md
@y
This utility will walk you through creating the following files with sensible defaults for your project:
  - .dockerignore
  - Dockerfile
  - compose.yaml
  - README.Docker.md
@z

@x
Let's get started!
```
@y
Let's get started!
```
@z

@x
The CLI will prompt you with a few questions about your app setup.
For consistency, please use the same responses shown in the example below when prompted:
| Question                                                   | Answer          |
|------------------------------------------------------------|-----------------|
| What application platform does your project use?           | Node            |
| What version of Node do you want to use?                   | 24.14.0-alpine  |
| Which package manager do you want to use?                  | npm             |
| Do you want to run "npm run build" before starting server? | yes             |
| What directory is your build output to?                    | .next           |
| What command do you want to use to start the app?          | npm run start   |
| What port does your server listen on?                      | 3000            |
@y
The CLI will prompt you with a few questions about your app setup.
For consistency, please use the same responses shown in the example below when prompted:
| Question                                                   | Answer          |
|------------------------------------------------------------|-----------------|
| What application platform does your project use?           | Node            |
| What version of Node do you want to use?                   | 24.14.0-alpine  |
| Which package manager do you want to use?                  | npm             |
| Do you want to run "npm run build" before starting server? | yes             |
| What directory is your build output to?                    | .next           |
| What command do you want to use to start the app?          | npm run start   |
| What port does your server listen on?                      | 3000            |
@z

@x
After completion, your project directory will contain the following new files:
@y
After completion, your project directory will contain the following new files:
@z

@x
```text
├── docker-nextjs-sample/
│ ├── Dockerfile
│ ├── .dockerignore
│ ├── compose.yaml
│ └── README.Docker.md
```
@y
```text
├── docker-nextjs-sample/
│ ├── Dockerfile
│ ├── .dockerignore
│ ├── compose.yaml
│ └── README.Docker.md
```
@z

@x
---
@y
---
@z

@x
## Build the Docker image
@y
## Build the Docker image
@z

@x
The default Dockerfile generated by `docker init` serves as a solid starting point for general Node.js applications. However, Next.js has specific requirements for production deployments. This guide shows two approaches: **standalone** output (Node.js server) and **export** output (static files with NGINX).
@y
The default Dockerfile generated by `docker init` serves as a solid starting point for general Node.js applications. However, Next.js has specific requirements for production deployments. This guide shows two approaches: **standalone** output (Node.js server) and **export** output (static files with NGINX).
@z

@x
### Step 1: Review the generated files
@y
### Step 1: Review the generated files
@z

@x
In this step, you'll add a Dockerfile and configuration files by following best practices:
@y
In this step, you'll add a Dockerfile and configuration files by following best practices:
@z

@x
- Use multi-stage builds to keep the final image clean and small  
- **Standalone**: Node.js runs the Next.js server; **Export**: NGINX serves static files from the export  
- Improve performance and security by only including what's needed  
@y
- Use multi-stage builds to keep the final image clean and small  
- **Standalone**: Node.js runs the Next.js server; **Export**: NGINX serves static files from the export  
- Improve performance and security by only including what's needed  
@z

@x
These updates help ensure your app is easy to deploy, fast to load, and production-ready.
@y
These updates help ensure your app is easy to deploy, fast to load, and production-ready.
@z

@x
> [!NOTE]
> A `Dockerfile` is a plain text file that contains step-by-step instructions to build a Docker image. It automates packaging your application along with its dependencies and runtime environment.  
> For full details, see the [Dockerfile reference](/reference/dockerfile/).
@y
> [!NOTE]
> A `Dockerfile` is a plain text file that contains step-by-step instructions to build a Docker image. It automates packaging your application along with its dependencies and runtime environment.  
> For full details, see the [Dockerfile reference](__SUBDIR__/reference/dockerfile/).
@z

@x
### Step 2: Configure Next.js output and Dockerfile
@y
### Step 2: Configure Next.js output and Dockerfile
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
#### 2.1 Next.js with standalone output
@y
#### 2.1 Next.js with standalone output
@z

@x
**Standalone output** (`output: "standalone"`) makes Next.js build a self-contained output that includes only the files and dependencies needed to run the application. A single `node server.js` can serve the app, which is ideal for Docker and supports server-side rendering, API routes, and incremental static regeneration. For details, see the [Next.js output configuration documentation](https://nextjs.org/docs/app/api-reference/config/next-config-js/output) (including the "standalone" option).
@y
**Standalone output** (`output: "standalone"`) makes Next.js build a self-contained output that includes only the files and dependencies needed to run the application. A single `node server.js` can serve the app, which is ideal for Docker and supports server-side rendering, API routes, and incremental static regeneration. For details, see the [Next.js output configuration documentation](https://nextjs.org/docs/app/api-reference/config/next-config-js/output) (including the "standalone" option).
@z

@x
The container runs the Next.js server with Node.js on **port 3000**.
@y
The container runs the Next.js server with Node.js on **port 3000**.
@z

@x
**Configure Next.js** — Open or create `next.config.ts` in your project root:
@y
**Configure Next.js** — Open or create `next.config.ts` in your project root:
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
Choose either a Docker Hardened Image or the Docker Official Image, then create or replace your `Dockerfile` with the content from the selected tab below.
@y
Choose either a Docker Hardened Image or the Docker Official Image, then create or replace your `Dockerfile` with the content from the selected tab below.
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
   ```console
   $ docker login dhi.io
   ```
@y
1. Sign in to the DHI registry:
   ```console
   $ docker login dhi.io
   ```
@z

@x
2. Pull the Node.js DHI (check the catalog for available versions):
   ```console
   $ docker pull dhi.io/node:24-alpine3.22-dev
   ```
@y
2. Pull the Node.js DHI (check the catalog for available versions):
   ```console
   $ docker pull dhi.io/node:24-alpine3.22-dev
   ```
@z

@x
3. Replace the generated Dockerfile with the following. The `FROM` instructions use `dhi.io/node:24-alpine3.22-dev`. Check the [Docker Hardened Images catalog](https://hub.docker.com/hardened-images/catalog) for the latest versions and update the image tags as needed for security and compatibility.
@y
3. Replace the generated Dockerfile with the following. The `FROM` instructions use `dhi.io/node:24-alpine3.22-dev`. Check the [Docker Hardened Images catalog](https://hub.docker.com/hardened-images/catalog) for the latest versions and update the image tags as needed for security and compatibility.
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
Create a production-ready multi-stage Dockerfile. Replace the generated Dockerfile with the following (uses `node`):
@y
Create a production-ready multi-stage Dockerfile. Replace the generated Dockerfile with the following (uses `node`):
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
> This Dockerfile uses three stages: **dependencies**, **builder**, and **runner**. The final image runs `node server.js` and listens on port 3000.
@y
> [!NOTE]
> This Dockerfile uses three stages: **dependencies**, **builder**, and **runner**. The final image runs `node server.js` and listens on port 3000.
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
#### 2.2 Next.js with export output
@y
#### 2.2 Next.js with export output
@z

@x
**Output export** (`output: "export"`) makes Next.js build a fully static site at build time. It generates HTML, CSS, and JavaScript into an `out` directory that can be served by any static host or CDN—no Node.js server at runtime. Use this when you don't need server-side rendering or API routes. For details, see the [Next.js output configuration documentation](https://nextjs.org/docs/app/api-reference/config/next-config-js/output).
@y
**Output export** (`output: "export"`) makes Next.js build a fully static site at build time. It generates HTML, CSS, and JavaScript into an `out` directory that can be served by any static host or CDN—no Node.js server at runtime. Use this when you don't need server-side rendering or API routes. For details, see the [Next.js output configuration documentation](https://nextjs.org/docs/app/api-reference/config/next-config-js/output).
@z

@x
**Configure Next.js** — Open  `next.config.ts` in your project root and add the following code:
@y
**Configure Next.js** — Open  `next.config.ts` in your project root and add the following code:
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
Choose either a Docker Hardened Image or the Docker Official Image, then replace your `Dockerfile` with the content from the selected tab below.
@y
Choose either a Docker Hardened Image or the Docker Official Image, then replace your `Dockerfile` with the content from the selected tab below.
@z

@x
{{< tabs >}}
{{< tab name="Using Docker Hardened Images" >}}
@y
{{< tabs >}}
{{< tab name="Using Docker Hardened Images" >}}
@z

@x
Docker Hardened Images (DHIs) are available for Node.js and NGINX in the [Docker Hardened Images catalog](https://hub.docker.com/hardened-images/catalog). For more information, see the [DHI quickstart](/dhi/get-started/) guide.
@y
Docker Hardened Images (DHIs) are available for Node.js and NGINX in the [Docker Hardened Images catalog](https://hub.docker.com/hardened-images/catalog). For more information, see the [DHI quickstart](__SUBDIR__/dhi/get-started/) guide.
@z

@x
1. Sign in to the DHI registry:
   ```console
   $ docker login dhi.io
   ```
@y
1. Sign in to the DHI registry:
   ```console
   $ docker login dhi.io
   ```
@z

@x
2. Pull the Node.js DHI (check the catalog for available versions):
   ```console
   $ docker pull dhi.io/node:24-alpine3.22-dev
   ```
@y
2. Pull the Node.js DHI (check the catalog for available versions):
   ```console
   $ docker pull dhi.io/node:24-alpine3.22-dev
   ```
@z

@x
3. Pull the Nginx DHI (check the catalog for available versions):
   ```console
   $ docker pull dhi.io/nginx:1.28.0-alpine3.21-dev
   ```
@y
3. Pull the Nginx DHI (check the catalog for available versions):
   ```console
   $ docker pull dhi.io/nginx:1.28.0-alpine3.21-dev
   ```
@z

@x
4. Replace the generated Dockerfile with the following. The `FROM` instructions use Docker Hardened Images: `dhi.io/node:24-alpine3.22-dev` and `dhi.io/nginx:1.28.0-alpine3.21-dev`. Check the [Docker Hardened Images catalog](https://hub.docker.com/hardened-images/catalog) for the latest versions and update the image tags as needed for security and compatibility.
@y
4. Replace the generated Dockerfile with the following. The `FROM` instructions use Docker Hardened Images: `dhi.io/node:24-alpine3.22-dev` and `dhi.io/nginx:1.28.0-alpine3.21-dev`. Check the [Docker Hardened Images catalog](https://hub.docker.com/hardened-images/catalog) for the latest versions and update the image tags as needed for security and compatibility.
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
Create a production-ready multi-stage Dockerfile. Replace the generated Dockerfile with the following (uses `node` and `nginxinc/nginx-unprivileged`):
@y
Create a production-ready multi-stage Dockerfile. Replace the generated Dockerfile with the following (uses `node` and `nginxinc/nginx-unprivileged`):
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
> We use [nginx-unprivileged](https://hub.docker.com/r/nginxinc/nginx-unprivileged) instead of the standard NGINX image to run as a non-root user, following security best practices.
@y
> [!NOTE]
> We use [nginx-unprivileged](https://hub.docker.com/r/nginxinc/nginx-unprivileged) instead of the standard NGINX image to run as a non-root user, following security best practices.
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
1. **Create `nginx.conf`** (required for export output only) — Create a file named `nginx.conf` in the root of your project:
@y
1. **Create `nginx.conf`** (required for export output only) — Create a file named `nginx.conf` in the root of your project:
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
      > Export uses **port 8080**. For more details, see the [Next.js output configuration](https://nextjs.org/docs/app/api-reference/config/next-config-js/output) and [NGINX documentation](https://nginx.org/en/docs/).
@y
      > [!NOTE]
      > Export uses **port 8080**. For more details, see the [Next.js output configuration](https://nextjs.org/docs/app/api-reference/config/next-config-js/output) and [NGINX documentation](https://nginx.org/en/docs/).
@z

@x
### Step 3: Configure the .dockerignore file
@y
### Step 3: Configure the .dockerignore file
@z

@x
The `.dockerignore` file tells Docker which files and folders to exclude when building the image.
@y
The `.dockerignore` file tells Docker which files and folders to exclude when building the image.
@z

@x
> [!NOTE]
>This helps:
>- Reduce image size  
>- Speed up the build process  
>- Prevent sensitive or unnecessary files (like `.env`, `.git`, or `node_modules`) from being added to the final image.
>
> To learn more, visit the [.dockerignore reference](/reference/dockerfile.md#dockerignore-file).
@y
> [!NOTE]
>This helps:
>- Reduce image size  
>- Speed up the build process  
>- Prevent sensitive or unnecessary files (like `.env`, `.git`, or `node_modules`) from being added to the final image.
>
> To learn more, visit the [.dockerignore reference](reference/dockerfile.md#dockerignore-file).
@z

@x
Copy and replace the contents of your existing `.dockerignore` with the configuration below:
@y
Copy and replace the contents of your existing `.dockerignore` with the configuration below:
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
### Step 4: Build the Next.js application image
@y
### Step 4: Build the Next.js application image
@z

@x
With your custom configuration in place, you're now ready to build the Docker image. Use the Dockerfile you chose in Step 3 (standalone or export).
@y
With your custom configuration in place, you're now ready to build the Docker image. Use the Dockerfile you chose in Step 3 (standalone or export).
@z

@x
The setup includes:
@y
The setup includes:
@z

@x
- Multi-stage builds for optimized image size  
- Standalone: Node.js server on port 3000; Export: NGINX serving static files on port 8080  
- Non-root user for enhanced security  
- Proper file permissions and ownership  
@y
- Multi-stage builds for optimized image size  
- Standalone: Node.js server on port 3000; Export: NGINX serving static files on port 8080  
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
│ ├── next.config.ts
│ └── README.Docker.md
```
@y
```text
├── docker-nextjs-sample/
│ ├── Dockerfile
│ ├── .dockerignore
│ ├── compose.yaml
│ ├── next.config.ts
│ └── README.Docker.md
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
- Uses the Dockerfile in the current directory (.)
- Packages the application and its dependencies into a Docker image
- Tags the image as nextjs-sample so you can reference it later
@y
What this command does:
- Uses the Dockerfile in the current directory (.)
- Packages the application and its dependencies into a Docker image
- Tags the image as nextjs-sample so you can reference it later
@z

@x
### Step 5: View local images
@y
### Step 5: View local images
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
- **Repository** – The name assigned to the image.
- **Tag** – A version label that helps identify different builds (e.g., latest).
- **Image ID** – A unique identifier for the image.
- **Created** – The timestamp indicating when the image was built.
- **Size** – The total disk space used by the image.
@y
- **Repository** – The name assigned to the image.
- **Tag** – A version label that helps identify different builds (e.g., latest).
- **Image ID** – A unique identifier for the image.
- **Created** – The timestamp indicating when the image was built.
- **Size** – The total disk space used by the image.
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
## Run the containerized application
@y
## Run the containerized application
@z

@x
In the previous step, you created a Dockerfile for your Next.js application and built a Docker image using the docker build command. Now it's time to run that image in a container and verify that your application works as expected.
@y
In the previous step, you created a Dockerfile for your Next.js application and built a Docker image using the docker build command. Now it's time to run that image in a container and verify that your application works as expected.
@z

@x
Run the following command in a terminal. Use the port that matches your setup: **standalone** uses port 3000, **export** uses port 8080.
@y
Run the following command in a terminal. Use the port that matches your setup: **standalone** uses port 3000, **export** uses port 8080.
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
For **export** output, use port 8080 instead:
@y
For **export** output, use port 8080 instead:
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
Open a browser and view the application: [http://localhost:3000](http://localhost:3000) for **standalone** or [http://localhost:8080](http://localhost:8080) for **export**. You should see your Next.js web application.
@y
Open a browser and view the application: [http://localhost:3000](http://localhost:3000) for **standalone** or [http://localhost:8080](http://localhost:8080) for **export**. You should see your Next.js web application.
@z

@x
Press `ctrl+c` in the terminal to stop your application.
@y
Press `ctrl+c` in the terminal to stop your application.
@z

@x
### Run the application in the background
@y
### Run the application in the background
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
For **export** output, use port 8080:
@y
For **export** output, use port 8080:
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
Open a browser and view the application: [http://localhost:3000](http://localhost:3000) for **standalone** or [http://localhost:8080](http://localhost:8080) for **export**. You should see your web application.
@y
Open a browser and view the application: [http://localhost:3000](http://localhost:3000) for **standalone** or [http://localhost:8080](http://localhost:8080) for **export**. You should see your web application.
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
## Summary
@y
## Summary
@z

@x
In this guide, you learned how to containerize, build, and run a Next.js application using Docker. By following best practices, you created a secure, optimized, and production-ready setup.
@y
In this guide, you learned how to containerize, build, and run a Next.js application using Docker. By following best practices, you created a secure, optimized, and production-ready setup.
@z

@x
What you accomplished:
- Initialized your project using `docker init` to scaffold essential Docker configuration files.
- Configured Next.js for either standalone output (Node.js server) or export output (static files with NGINX).
- Added a multi-stage Dockerfile for your chosen approach: standalone (port 3000) or export (port 8080, with `nginx.conf`).
- Replaced the default `.dockerignore` file to exclude unnecessary files and keep the image clean and efficient.
- Built your Docker image using `docker build`.
- Ran the container using `docker run` with the image name `nextjs-sample`, both in the foreground and in detached mode.
- Verified that the app was running by visiting [http://localhost:3000](http://localhost:3000) (standalone) or [http://localhost:8080](http://localhost:8080) (export).
- Learned how to stop the containerized application using `docker stop nextjs-app`.
@y
What you accomplished:
- Initialized your project using `docker init` to scaffold essential Docker configuration files.
- Configured Next.js for either standalone output (Node.js server) or export output (static files with NGINX).
- Added a multi-stage Dockerfile for your chosen approach: standalone (port 3000) or export (port 8080, with `nginx.conf`).
- Replaced the default `.dockerignore` file to exclude unnecessary files and keep the image clean and efficient.
- Built your Docker image using `docker build`.
- Ran the container using `docker run` with the image name `nextjs-sample`, both in the foreground and in detached mode.
- Verified that the app was running by visiting [http://localhost:3000](http://localhost:3000) (standalone) or [http://localhost:8080](http://localhost:8080) (export).
- Learned how to stop the containerized application using `docker stop nextjs-app`.
@z

@x
You now have a fully containerized Next.js application, running in a Docker container, and ready for deployment across any environment with confidence and consistency.
@y
You now have a fully containerized Next.js application, running in a Docker container, and ready for deployment across any environment with confidence and consistency.
@z

@x
---
@y
---
@z

@x
## Related resources
@y
## Related resources
@z

@x
Explore official references and best practices to sharpen your Docker workflow:
@y
Explore official references and best practices to sharpen your Docker workflow:
@z

@x
- [Multi-stage builds](/build/building/multi-stage/) – Learn how to separate build and runtime stages.
- [Best practices for writing Dockerfiles](/develop/develop-images/dockerfile_best-practices/) – Write efficient, maintainable, and secure Dockerfiles.  
- [Build context in Docker](/build/concepts/context/) – Learn how context affects image builds.  
- [Next.js output configuration](https://nextjs.org/docs/app/api-reference/config/next-config-js/output) – Learn about Next.js production optimization (standalone and export).
- [Next.js with Docker (standalone)](https://github.com/vercel/next.js/tree/canary/examples/with-docker) – Official Next.js example: standalone output with Node.js.
- [Next.js with Docker (export)](https://github.com/vercel/next.js/tree/canary/examples/with-docker-export-output) – Official Next.js example: static export with Nginx or serve.
- [`docker init` CLI reference](/reference/cli/docker/init/) – Scaffold Docker assets automatically.
- [`docker build` CLI reference](/reference/cli/docker/image/build/) – Build Docker images from a Dockerfile.
- [`docker images` CLI reference](/reference/cli/docker/image/ls/) – Manage and inspect local Docker images.
- [`docker run` CLI reference](/reference/cli/docker/container/run/) – Run a command in a new container.
- [`docker stop` CLI reference](/reference/cli/docker/container/stop/) – Stop one or more running containers.
@y
- [Multi-stage builds](__SUBDIR__/build/building/multi-stage/) – Learn how to separate build and runtime stages.
- [Best practices for writing Dockerfiles](__SUBDIR__/develop/develop-images/dockerfile_best-practices/) – Write efficient, maintainable, and secure Dockerfiles.  
- [Build context in Docker](__SUBDIR__/build/concepts/context/) – Learn how context affects image builds.  
- [Next.js output configuration](https://nextjs.org/docs/app/api-reference/config/next-config-js/output) – Learn about Next.js production optimization (standalone and export).
- [Next.js with Docker (standalone)](https://github.com/vercel/next.js/tree/canary/examples/with-docker) – Official Next.js example: standalone output with Node.js.
- [Next.js with Docker (export)](https://github.com/vercel/next.js/tree/canary/examples/with-docker-export-output) – Official Next.js example: static export with Nginx or serve.
- [`docker init` CLI reference](__SUBDIR__/reference/cli/docker/init/) – Scaffold Docker assets automatically.
- [`docker build` CLI reference](__SUBDIR__/reference/cli/docker/image/build/) – Build Docker images from a Dockerfile.
- [`docker images` CLI reference](__SUBDIR__/reference/cli/docker/image/ls/) – Manage and inspect local Docker images.
- [`docker run` CLI reference](__SUBDIR__/reference/cli/docker/container/run/) – Run a command in a new container.
- [`docker stop` CLI reference](__SUBDIR__/reference/cli/docker/container/stop/) – Stop one or more running containers.
@z

@x
---
@y
---
@z

@x
## Next steps
@y
## Next steps
@z

@x
With your Next.js application now containerized, you're ready to move on to the next step.
@y
With your Next.js application now containerized, you're ready to move on to the next step.
@z

@x
In the next section, you'll learn how to develop your application using Docker containers, enabling a consistent, isolated, and reproducible development environment across any machine.
@y
In the next section, you'll learn how to develop your application using Docker containers, enabling a consistent, isolated, and reproducible development environment across any machine.
@z
