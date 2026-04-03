%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Use containers for Next.js development
linkTitle: Develop your app
@y
title: Use containers for Next.js development
linkTitle: Develop your app
@z

@x
keywords: next.js, development, node
description: Learn how to develop your Next.js application locally using containers.
@y
keywords: next.js, development, node
description: Learn how to develop your Next.js application locally using containers.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Complete [Containerize Next.js application](containerize.md).
@y
Complete [Containerize Next.js application](containerize.md).
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
In this section, you'll learn how to set up both production and development environments for your containerized Next.js application using Docker Compose. This setup allows you to run a production build using the standalone server and to develop efficiently inside containers using Next.js's built-in hot reloading with Compose Watch.
@y
In this section, you'll learn how to set up both production and development environments for your containerized Next.js application using Docker Compose. This setup allows you to run a production build using the standalone server and to develop efficiently inside containers using Next.js's built-in hot reloading with Compose Watch.
@z

@x
You'll learn how to:
- Configure separate containers for production and development
- Enable automatic file syncing using Compose Watch in development
- Debug and live-preview your changes in real-time without manual rebuilds
@y
You'll learn how to:
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
## Automatically update services (Development Mode)
@y
## Automatically update services (Development Mode)
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
## Step 1: Create a development Dockerfile
@y
## Step 1: Create a development Dockerfile
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
### Step 2: Update your `compose.yaml` file
@y
### Step 2: Update your `compose.yaml` file
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
### Step 3: Configure Next.js for Docker development
@y
### Step 3: Configure Next.js for Docker development
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
> - Enables Hot Module Replacement (HMR) for instant updates
> - Watches for file changes and recompiles automatically
> - Provides detailed error messages in the browser
>
> The `WATCHPACK_POLLING=true` environment variable in the compose file ensures file watching works correctly inside Docker containers.
@y
> [!NOTE]
> The Next.js development server automatically:
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
│ ├── next.config.ts
│ └── README.Docker.md
```
@y
```text
├── docker-nextjs-sample/
│ ├── Dockerfile
│ ├── Dockerfile.dev
│ ├── .dockerignore
│ ├── compose.yaml
│ ├── next.config.ts
│ └── README.Docker.md
```
@z

@x
### Step 4: Start Compose Watch
@y
### Step 4: Start Compose Watch
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
### Step 5: Test Compose Watch with Next.js
@y
### Step 5: Test Compose Watch with Next.js
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
## Summary
@y
## Summary
@z

@x
In this section, you set up a complete development and production workflow for your Next.js application using Docker and Docker Compose.
@y
In this section, you set up a complete development and production workflow for your Next.js application using Docker and Docker Compose.
@z

@x
Here's what you achieved:
- Created a `Dockerfile.dev` to streamline local development with hot reloading  
- Defined separate `nextjs-dev` and `nextjs-prod-standalone` services in your `compose.yaml` file  
- Enabled real-time file syncing using Compose Watch for a smoother development experience  
- Verified that live updates work seamlessly by modifying and previewing a component
@y
Here's what you achieved:
- Created a `Dockerfile.dev` to streamline local development with hot reloading  
- Defined separate `nextjs-dev` and `nextjs-prod-standalone` services in your `compose.yaml` file  
- Enabled real-time file syncing using Compose Watch for a smoother development experience  
- Verified that live updates work seamlessly by modifying and previewing a component
@z

@x
With this setup, you can build, run, and iterate on your Next.js app
entirely within containers across environments.
@y
With this setup, you can build, run, and iterate on your Next.js app
entirely within containers across environments.
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
Deepen your knowledge and improve your containerized development workflow with these guides:
@y
Deepen your knowledge and improve your containerized development workflow with these guides:
@z

@x
- [Using Compose Watch](/manuals/compose/how-tos/file-watch.md) – Automatically sync source changes during development  
- [Multi-stage builds](/manuals/build/building/multi-stage.md) – Create efficient, production-ready Docker images  
- [Dockerfile best practices](/build/building/best-practices/) – Write clean, secure, and optimized Dockerfiles.
- [Compose file reference](/compose/compose-file/) – Learn the full syntax and options available for configuring services in `compose.yaml`.
- [Docker volumes](/storage/volumes/) – Persist and manage data between container runs  
@y
- [Using Compose Watch](manuals/compose/how-tos/file-watch.md) – Automatically sync source changes during development  
- [Multi-stage builds](manuals/build/building/multi-stage.md) – Create efficient, production-ready Docker images  
- [Dockerfile best practices](__SUBDIR__/build/building/best-practices/) – Write clean, secure, and optimized Dockerfiles.
- [Compose file reference](__SUBDIR__/compose/compose-file/) – Learn the full syntax and options available for configuring services in `compose.yaml`.
- [Docker volumes](__SUBDIR__/storage/volumes/) – Persist and manage data between container runs  
@z

@x
## Next steps
@y
## Next steps
@z

@x
In the next section, you'll learn how to run unit tests for your Next.js application inside Docker containers. This ensures consistent testing across all environments and removes dependencies on local machine setup.
@y
In the next section, you'll learn how to run unit tests for your Next.js application inside Docker containers. This ensures consistent testing across all environments and removes dependencies on local machine setup.
@z
