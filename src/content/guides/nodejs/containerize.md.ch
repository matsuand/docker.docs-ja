%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応
% snip 対応

@x
title: Containerize a Node.js application
linkTitle: Containerize
@y
title: Node.js アプリケーションのコンテナー化
linkTitle: コンテナー化
@z

%description: Node.js アプリケーションのコンテナー化について学びます。
@x
keywords: node.js, node, containerize, initialize
description: Learn how to containerize a Node.js application with Docker by creating an optimized, production-ready image using best practices for performance, security, and scalability.
@y
keywords: node.js, node, containerize, initialize
description: Learn how to containerize a Node.js application with Docker by creating an optimized, production-ready image using best practices for performance, security, and scalability.
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
Before you begin, make sure the following tools are installed and available on your system:
@y
Before you begin, make sure the following tools are installed and available on your system:
@z

@x
- You have installed the latest version of [Docker Desktop](/get-started/get-docker.md).
- You have a [Git client](https://git-scm.com/downloads). The examples in this section use a command-line based Git client, but you can use any client.
@y
- [Docker Desktop](get-started/get-docker.md) の最新版をインストールしていること。
- [git クライアント](https://git-scm.com/downloads) が利用可能であること。
  本節の利用例ではコマンドラインベースの git クライアントを用いていきますが、別のクライアントを用いてもかまいません。
@z

@x
## Overview
@y
## 概要 {#overview}
@z

%本節では Node.js アプリケーションをコンテナー化して実行する手順を示していきます。
@x
This guide walks you through the complete process of containerizing a Node.js application with Docker. You’ll learn how to create a production-ready Docker image using best practices that enhance performance, security, scalability, and operational efficiency.
@y
This guide walks you through the complete process of containerizing a Node.js application with Docker. You’ll learn how to create a production-ready Docker image using best practices that enhance performance, security, scalability, and operational efficiency.
@z

@x
By the end of this guide, you will:
@y
By the end of this guide, you will:
@z

@x
- Containerize a Node.js application using Docker.
- Create and optimize a Dockerfile tailored for Node.js environments.
- Use multi-stage builds to separate dependencies and reduce image size.
- Configure the container for secure, efficient runtime using a non-root user.
- Follow best practices for building secure, lightweight, and maintainable Docker images.
@y
- Containerize a Node.js application using Docker.
- Create and optimize a Dockerfile tailored for Node.js environments.
- Use multi-stage builds to separate dependencies and reduce image size.
- Configure the container for secure, efficient runtime using a non-root user.
- Follow best practices for building secure, lightweight, and maintainable Docker images.
@z

@x
## Get the sample application
@y
## サンプルアプリケーションの入手 {#get-the-sample-application}
@z

@x
Clone the sample application to use with this guide. Open a terminal, change
directory to a directory that you want to work in, and run the following command
to clone the Git repository:
@y
本ガイドにおいて利用するサンプルアプリケーションをクローンします。
端末画面を開いて、作業を行うディレクトリに移動します。
そして以下のコマンドを実行して Git リポジトリをクローンします。
@z

% snip command...

@x
## Build the Docker image
@y
## Build the Docker image
@z

@x
This project is a full-stack TypeScript application with both a backend API and frontend React components, so the Dockerfile is optimized for that architecture.
@y
This project is a full-stack TypeScript application with both a backend API and frontend React components, so the Dockerfile is optimized for that architecture.
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
### Step 1: Create the Dockerfile
@y
### Step 1: Create the Dockerfile
@z

@x
Before creating a Dockerfile, you need to choose a base image. You can either use the [Node.js Official Image](https://hub.docker.com/_/node) or a Docker Hardened Image (DHI) from the [Hardened Image catalog](https://hub.docker.com/hardened-images/catalog).
@y
Before creating a Dockerfile, you need to choose a base image. You can either use the [Node.js Official Image](https://hub.docker.com/_/node) or a Docker Hardened Image (DHI) from the [Hardened Image catalog](https://hub.docker.com/hardened-images/catalog).
@z

@x
Choosing DHI offers the advantage of a production-ready image that is lightweight and secure. For more information, see [Docker Hardened Images](https://docs.docker.com/dhi/).
@y
Choosing DHI offers the advantage of a production-ready image that is lightweight and secure. For more information, see [Docker Hardened Images](https://docs.docker.com/dhi/).
@z

@x
> [!IMPORTANT]
> This guide uses a stable Node.js LTS image tag that is considered secure when the guide is written. Because new releases and security patches are published regularly, the tag shown here may no longer be the safest option when you follow the guide. Always review the latest available image tags and select a secure, up-to-date version before building or deploying your application.
>
> Official Node.js Docker Images: https://hub.docker.com/_/node
@y
> [!IMPORTANT]
> This guide uses a stable Node.js LTS image tag that is considered secure when the guide is written. Because new releases and security patches are published regularly, the tag shown here may no longer be the safest option when you follow the guide. Always review the latest available image tags and select a secure, up-to-date version before building or deploying your application.
>
> Official Node.js Docker Images: https://hub.docker.com/_/node
@z

@x
{{< tabs >}}
{{< tab name="Using Docker Hardened Images" >}}
@y
{{< tabs >}}
{{< tab name="Using Docker Hardened Images" >}}
@z

@x
Docker Hardened Images (DHIs) are available for Node.js in the [Docker Hardened Images catalog](https://hub.docker.com/hardened-images/catalog/dhi/node). Docker Hardened Images are freely available to everyone with no subscription required. You can pull and use them like any other Docker image after signing in to the DHI registry. For more information, see the [DHI quickstart](/dhi/get-started/) guide.
@y
Docker Hardened Images (DHIs) are available for Node.js in the [Docker Hardened Images catalog](https://hub.docker.com/hardened-images/catalog/dhi/node). Docker Hardened Images are freely available to everyone with no subscription required. You can pull and use them like any other Docker image after signing in to the DHI registry. For more information, see the [DHI quickstart](__SUBDIR__/dhi/get-started/) guide.
@z

@x
1. Sign in to the DHI registry:
@y
1. Sign in to the DHI registry:
@z

% snip command...

@x
2. Pull the Node.js DHI (check the catalog for available versions):
@y
2. Pull the Node.js DHI (check the catalog for available versions):
@z

% snip command...

@x
Create a file named `Dockerfile` in your project root with the following contents. The `FROM` instruction uses `dhi.io/node:24-alpine3.22-dev` as the base image.
@y
Create a file named `Dockerfile` in your project root with the following contents. The `FROM` instruction uses `dhi.io/node:24-alpine3.22-dev` as the base image.
@z

@x within code
# Optimized Multi-Stage Dockerfile
# Node.js TypeScript Application (Using DHI)
@y
# Optimized Multi-Stage Dockerfile
# Node.js TypeScript Application (Using DHI)
@z
@x
# Set working directory
@y
# ワーキングディレクトリの設定
@z
@x
# Create non-root user for security
@y
# Create non-root user for security
@z
@x
# Dependencies Stage
@y
# 依存ステージ
@z
@x
# Copy package files
@y
# パッケージファイルのコピー
@z
@x
# Install production dependencies
@y
# 本番環境での依存パッケージインストール
@z
@x
# Set proper ownership
@y
# 所有者の適正設定
@z
@x
# Build Dependencies Stage
@y
# 依存ステージのビルド
@z
@x
# Copy package files
@y
# パッケージファイルのコピー
@z
@x
# Install all dependencies with build optimizations
@y
# Install all dependencies with build optimizations
@z
@x
# Create necessary directories and set permissions
@y
# Create necessary directories and set permissions
@z
@x
# Build Stage
@y
# ステージのビルド
@z
@x
# Copy only necessary files for building (respects .dockerignore)
@y
# Copy only necessary files for building (respects .dockerignore)
@z
@x
# Build the application
@y
# アプリケーションのビルド
@z
@x
# Set proper ownership
@y
# 所有者の適正設定
@z
@x
# Development Stage
@y
# 開発環境ステージ
@z
@x
# Set environment
@y
# 環境変数の設定
@z
@x
# Copy source files
@y
# ソースファイルのコピー
@z
@x
# Ensure all directories have proper permissions
@y
# Ensure all directories have proper permissions
@z
@x
# Switch to non-root user
@y
# 非ルートユーザーへの切り替え
@z
@x
# Expose ports
@y
# ポートの公開
@z
@x
# Start development server
@y
# 開発サーバーの起動
@z
@x
# Production Stage
@y
# 本番環境ステージ
@z
@x
# Set working directory
@y
# Set working directory
@z

@x
# Create non-root user for security
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001 -G nodejs && \
    chown -R nodejs:nodejs /app
@y
# Create non-root user for security
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001 -G nodejs && \
    chown -R nodejs:nodejs /app
@z

@x
# Set optimized environment variables
ENV NODE_ENV=production \
    NODE_OPTIONS="--max-old-space-size=256 --no-warnings" \
    NPM_CONFIG_LOGLEVEL=silent
@y
# Set optimized environment variables
ENV NODE_ENV=production \
    NODE_OPTIONS="--max-old-space-size=256 --no-warnings" \
    NPM_CONFIG_LOGLEVEL=silent
@z

@x
# Copy production dependencies from deps stage
COPY --from=deps --chown=nodejs:nodejs /app/node_modules ./node_modules
COPY --from=deps --chown=nodejs:nodejs /app/package*.json ./
# Copy built application from build stage
COPY --from=build --chown=nodejs:nodejs /app/dist ./dist
@y
# Copy production dependencies from deps stage
COPY --from=deps --chown=nodejs:nodejs /app/node_modules ./node_modules
COPY --from=deps --chown=nodejs:nodejs /app/package*.json ./
# Copy built application from build stage
COPY --from=build --chown=nodejs:nodejs /app/dist ./dist
@z

@x
# Switch to non-root user for security
USER nodejs
@y
# Switch to non-root user for security
USER nodejs
@z

@x
# Expose port
EXPOSE 3000
@y
# Expose port
EXPOSE 3000
@z

@x
# Start production server
CMD ["node", "dist/server.js"]
@y
# Start production server
CMD ["node", "dist/server.js"]
@z

@x
# ========================================
# Test Stage
# ========================================
FROM build-deps AS test
@y
# ========================================
# Test Stage
# ========================================
FROM build-deps AS test
@z

@x
# Set environment
ENV NODE_ENV=test \
    CI=true
@y
# Set environment
ENV NODE_ENV=test \
    CI=true
@z

@x
# Copy source files
COPY --chown=nodejs:nodejs . .
@y
# Copy source files
COPY --chown=nodejs:nodejs . .
@z

@x
# Switch to non-root user
USER nodejs
@y
# Switch to non-root user
USER nodejs
@z

@x
# Run tests with coverage
CMD ["npm", "run", "test:coverage"]
```
@y
# Run tests with coverage
CMD ["npm", "run", "test:coverage"]
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
Create a file named `Dockerfile` in your project root with the following contents:
@y
Create a file named `Dockerfile` in your project root with the following contents:
@z

@x
```dockerfile
# ========================================
# Optimized Multi-Stage Dockerfile
# Node.js TypeScript Application
# ========================================
@y
```dockerfile
# ========================================
# Optimized Multi-Stage Dockerfile
# Node.js TypeScript Application
# ========================================
@z

@x
ARG NODE_VERSION=24.11.1-alpine
FROM node:${NODE_VERSION} AS base
@y
ARG NODE_VERSION=24.11.1-alpine
FROM node:${NODE_VERSION} AS base
@z

@x
# Set working directory
WORKDIR /app
@y
# Set working directory
WORKDIR /app
@z

@x
# Create non-root user for security
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001 -G nodejs && \
    chown -R nodejs:nodejs /app
@y
# Create non-root user for security
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001 -G nodejs && \
    chown -R nodejs:nodejs /app
@z

@x
# ========================================
# Dependencies Stage
# ========================================
FROM base AS deps
@y
# ========================================
# Dependencies Stage
# ========================================
FROM base AS deps
@z

@x
# Copy package files
COPY package*.json ./
@y
# Copy package files
COPY package*.json ./
@z

@x
# Install production dependencies
RUN --mount=type=cache,target=/root/.npm,sharing=locked \
    npm ci --omit=dev && \
    npm cache clean --force
@y
# Install production dependencies
RUN --mount=type=cache,target=/root/.npm,sharing=locked \
    npm ci --omit=dev && \
    npm cache clean --force
@z

@x
# Set proper ownership
RUN chown -R nodejs:nodejs /app
@y
# Set proper ownership
RUN chown -R nodejs:nodejs /app
@z

@x
# ========================================
# Build Dependencies Stage
# ========================================
FROM base AS build-deps
@y
# ========================================
# Build Dependencies Stage
# ========================================
FROM base AS build-deps
@z

@x
# Copy package files
COPY package*.json ./
@y
# Copy package files
COPY package*.json ./
@z

@x
# Install all dependencies with build optimizations
RUN --mount=type=cache,target=/root/.npm,sharing=locked \
    npm ci --no-audit --no-fund && \
    npm cache clean --force
@y
# Install all dependencies with build optimizations
RUN --mount=type=cache,target=/root/.npm,sharing=locked \
    npm ci --no-audit --no-fund && \
    npm cache clean --force
@z

@x
# Create necessary directories and set permissions
RUN mkdir -p /app/node_modules/.vite && \
    chown -R nodejs:nodejs /app
@y
# Create necessary directories and set permissions
RUN mkdir -p /app/node_modules/.vite && \
    chown -R nodejs:nodejs /app
@z

@x
# ========================================
# Build Stage
# ========================================
FROM build-deps AS build
@y
# ========================================
# Build Stage
# ========================================
FROM build-deps AS build
@z

@x
# Copy only necessary files for building (respects .dockerignore)
COPY --chown=nodejs:nodejs . .
@y
# Copy only necessary files for building (respects .dockerignore)
COPY --chown=nodejs:nodejs . .
@z

@x
# Build the application
RUN npm run build
@y
# Build the application
RUN npm run build
@z

@x
# Set proper ownership
RUN chown -R nodejs:nodejs /app
@y
# Set proper ownership
RUN chown -R nodejs:nodejs /app
@z

@x
# ========================================
# Development Stage
# ========================================
FROM build-deps AS development
@y
# ========================================
# Development Stage
# ========================================
FROM build-deps AS development
@z

@x
# Set environment
ENV NODE_ENV=development \
    NPM_CONFIG_LOGLEVEL=warn
@y
# Set environment
ENV NODE_ENV=development \
    NPM_CONFIG_LOGLEVEL=warn
@z

@x
# Copy source files
COPY . .
@y
# Copy source files
COPY . .
@z

@x
# Ensure all directories have proper permissions
RUN mkdir -p /app/node_modules/.vite && \
    chown -R nodejs:nodejs /app && \
    chmod -R 755 /app
@y
# Ensure all directories have proper permissions
RUN mkdir -p /app/node_modules/.vite && \
    chown -R nodejs:nodejs /app && \
    chmod -R 755 /app
@z

@x
# Switch to non-root user
USER nodejs
@y
# Switch to non-root user
USER nodejs
@z

@x
# Expose ports
EXPOSE 3000 5173 9229
@y
# Expose ports
EXPOSE 3000 5173 9229
@z

@x
# Start development server
CMD ["npm", "run", "dev:docker"]
@y
# Start development server
CMD ["npm", "run", "dev:docker"]
@z

@x
# ========================================
# Production Stage
# ========================================
ARG NODE_VERSION=24.11.1-alpine
FROM node:${NODE_VERSION} AS production
@y
# ========================================
# Production Stage
# ========================================
ARG NODE_VERSION=24.11.1-alpine
FROM node:${NODE_VERSION} AS production
@z

@x
# Set working directory
WORKDIR /app
@y
# Set working directory
WORKDIR /app
@z

@x
# Create non-root user for security
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001 -G nodejs && \
    chown -R nodejs:nodejs /app
@y
# Create non-root user for security
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001 -G nodejs && \
    chown -R nodejs:nodejs /app
@z

@x
# Set optimized environment variables
ENV NODE_ENV=production \
    NODE_OPTIONS="--max-old-space-size=256 --no-warnings" \
    NPM_CONFIG_LOGLEVEL=silent
@y
# Set optimized environment variables
ENV NODE_ENV=production \
    NODE_OPTIONS="--max-old-space-size=256 --no-warnings" \
    NPM_CONFIG_LOGLEVEL=silent
@z

@x
# Copy production dependencies from deps stage
COPY --from=deps --chown=nodejs:nodejs /app/node_modules ./node_modules
COPY --from=deps --chown=nodejs:nodejs /app/package*.json ./
# Copy built application from build stage
COPY --from=build --chown=nodejs:nodejs /app/dist ./dist
@y
# Copy production dependencies from deps stage
COPY --from=deps --chown=nodejs:nodejs /app/node_modules ./node_modules
COPY --from=deps --chown=nodejs:nodejs /app/package*.json ./
# Copy built application from build stage
COPY --from=build --chown=nodejs:nodejs /app/dist ./dist
@z

@x
# Switch to non-root user for security
USER nodejs
@y
# Switch to non-root user for security
USER nodejs
@z

@x
# Expose port
EXPOSE 3000
@y
# Expose port
EXPOSE 3000
@z

@x
# Start production server
CMD ["node", "dist/server.js"]
@y
# Start production server
CMD ["node", "dist/server.js"]
@z

@x
# ========================================
# Test Stage
# ========================================
FROM build-deps AS test
@y
# ========================================
# Test Stage
# ========================================
FROM build-deps AS test
@z

@x
# Set environment
ENV NODE_ENV=test \
    CI=true
@y
# Set environment
ENV NODE_ENV=test \
    CI=true
@z

@x
# Copy source files
COPY --chown=nodejs:nodejs . .
@y
# Copy source files
COPY --chown=nodejs:nodejs . .
@z

@x
# Switch to non-root user
USER nodejs
@y
# Switch to non-root user
USER nodejs
@z

@x
# Run tests with coverage
CMD ["npm", "run", "test:coverage"]
```
@y
# Run tests with coverage
CMD ["npm", "run", "test:coverage"]
```
@z

@x
{{< /tab >}}
@y
{{< /tab >}}
@z

@x
{{< /tabs >}}
@y
{{< /tabs >}}
@z

@x
Key features of this Dockerfile:
@y
Key features of this Dockerfile:
@z

@x
- Multi-stage structure — Separate stages for dependencies, build, development, production, and testing to keep each phase clean and efficient.
- Lean production image — Optimized layering reduces size and keeps only what’s required to run the app.
- Security-minded setup — Uses a dedicated non-root user and excludes unnecessary packages.
- Performance-friendly design — Effective use of caching and well-structured layers for faster builds.
- Clean runtime environment — Removes files not needed in production, such as docs, tests, and build caches.
- Straightforward port usage — The app runs on port 3000 internally, exposed externally as port 8080.
- Memory-optimized runtime — Node.js is configured to run with a smaller memory limit than the default.
@y
- Multi-stage structure — Separate stages for dependencies, build, development, production, and testing to keep each phase clean and efficient.
- Lean production image — Optimized layering reduces size and keeps only what’s required to run the app.
- Security-minded setup — Uses a dedicated non-root user and excludes unnecessary packages.
- Performance-friendly design — Effective use of caching and well-structured layers for faster builds.
- Clean runtime environment — Removes files not needed in production, such as docs, tests, and build caches.
- Straightforward port usage — The app runs on port 3000 internally, exposed externally as port 8080.
- Memory-optimized runtime — Node.js is configured to run with a smaller memory limit than the default.
@z

@x
### Step 2: Create the compose.yaml file
@y
### Step 2: Create the compose.yaml file
@z

@x
Create a file named `compose.yaml` in your project root:
@y
Create a file named `compose.yaml` in your project root:
@z

@x
```yaml
# ========================================
# Docker Compose Configuration
# Modern Node.js Todo Application
# ========================================
@y
```yaml
# ========================================
# Docker Compose Configuration
# Modern Node.js Todo Application
# ========================================
@z

@x
services:
  # ========================================
  # Development Service
  # ========================================
  app-dev:
    build:
      context: .
      dockerfile: Dockerfile
      target: development
    container_name: todoapp-dev
    ports:
      - "${APP_PORT:-3000}:3000" # API server
      - "${VITE_PORT:-5173}:5173" # Vite dev server
      - "${DEBUG_PORT:-9229}:9229" # Node.js debugger
    environment:
      NODE_ENV: development
      DOCKER_ENV: "true"
      POSTGRES_HOST: db
      POSTGRES_PORT: 5432
      POSTGRES_DB: todoapp
      POSTGRES_USER: todoapp
      POSTGRES_PASSWORD: "${POSTGRES_PASSWORD:-todoapp_password}"
      ALLOWED_ORIGINS: "${ALLOWED_ORIGINS:-http://localhost:3000,http://localhost:5173}"
    volumes:
      - ./src:/app/src:ro
      - ./package.json:/app/package.json
      - ./vite.config.ts:/app/vite.config.ts:ro
      - ./tailwind.config.js:/app/tailwind.config.js:ro
      - ./postcss.config.js:/app/postcss.config.js:ro
    depends_on:
      db:
        condition: service_healthy
    develop:
      watch:
        - action: sync
          path: ./src
          target: /app/src
          ignore:
            - "**/*.test.*"
            - "**/__tests__/**"
        - action: rebuild
          path: ./package.json
        - action: sync
          path: ./vite.config.ts
          target: /app/vite.config.ts
        - action: sync
          path: ./tailwind.config.js
          target: /app/tailwind.config.js
        - action: sync
          path: ./postcss.config.js
          target: /app/postcss.config.js
    restart: unless-stopped
    networks:
      - todoapp-network
@y
services:
  # ========================================
  # Development Service
  # ========================================
  app-dev:
    build:
      context: .
      dockerfile: Dockerfile
      target: development
    container_name: todoapp-dev
    ports:
      - "${APP_PORT:-3000}:3000" # API server
      - "${VITE_PORT:-5173}:5173" # Vite dev server
      - "${DEBUG_PORT:-9229}:9229" # Node.js debugger
    environment:
      NODE_ENV: development
      DOCKER_ENV: "true"
      POSTGRES_HOST: db
      POSTGRES_PORT: 5432
      POSTGRES_DB: todoapp
      POSTGRES_USER: todoapp
      POSTGRES_PASSWORD: "${POSTGRES_PASSWORD:-todoapp_password}"
      ALLOWED_ORIGINS: "${ALLOWED_ORIGINS:-http://localhost:3000,http://localhost:5173}"
    volumes:
      - ./src:/app/src:ro
      - ./package.json:/app/package.json
      - ./vite.config.ts:/app/vite.config.ts:ro
      - ./tailwind.config.js:/app/tailwind.config.js:ro
      - ./postcss.config.js:/app/postcss.config.js:ro
    depends_on:
      db:
        condition: service_healthy
    develop:
      watch:
        - action: sync
          path: ./src
          target: /app/src
          ignore:
            - "**/*.test.*"
            - "**/__tests__/**"
        - action: rebuild
          path: ./package.json
        - action: sync
          path: ./vite.config.ts
          target: /app/vite.config.ts
        - action: sync
          path: ./tailwind.config.js
          target: /app/tailwind.config.js
        - action: sync
          path: ./postcss.config.js
          target: /app/postcss.config.js
    restart: unless-stopped
    networks:
      - todoapp-network
@z

@x
  # ========================================
  # Production Service
  # ========================================
  app-prod:
    build:
      context: .
      dockerfile: Dockerfile
      target: production
    container_name: todoapp-prod
    ports:
      - "${PROD_PORT:-8080}:3000"
    environment:
      NODE_ENV: production
      POSTGRES_HOST: db
      POSTGRES_PORT: 5432
      POSTGRES_DB: todoapp
      POSTGRES_USER: todoapp
      POSTGRES_PASSWORD: "${POSTGRES_PASSWORD:-todoapp_password}"
      ALLOWED_ORIGINS: "${ALLOWED_ORIGINS:-https://yourdomain.com}"
    depends_on:
      db:
        condition: service_healthy
    restart: unless-stopped
    deploy:
      resources:
        limits:
          memory: "${PROD_MEMORY_LIMIT:-2G}"
          cpus: "${PROD_CPU_LIMIT:-1.0}"
        reservations:
          memory: "${PROD_MEMORY_RESERVATION:-512M}"
          cpus: "${PROD_CPU_RESERVATION:-0.25}"
    security_opt:
      - no-new-privileges:true
    read_only: true
    tmpfs:
      - /tmp
    networks:
      - todoapp-network
    profiles:
      - prod
@y
  # ========================================
  # Production Service
  # ========================================
  app-prod:
    build:
      context: .
      dockerfile: Dockerfile
      target: production
    container_name: todoapp-prod
    ports:
      - "${PROD_PORT:-8080}:3000"
    environment:
      NODE_ENV: production
      POSTGRES_HOST: db
      POSTGRES_PORT: 5432
      POSTGRES_DB: todoapp
      POSTGRES_USER: todoapp
      POSTGRES_PASSWORD: "${POSTGRES_PASSWORD:-todoapp_password}"
      ALLOWED_ORIGINS: "${ALLOWED_ORIGINS:-https://yourdomain.com}"
    depends_on:
      db:
        condition: service_healthy
    restart: unless-stopped
    deploy:
      resources:
        limits:
          memory: "${PROD_MEMORY_LIMIT:-2G}"
          cpus: "${PROD_CPU_LIMIT:-1.0}"
        reservations:
          memory: "${PROD_MEMORY_RESERVATION:-512M}"
          cpus: "${PROD_CPU_RESERVATION:-0.25}"
    security_opt:
      - no-new-privileges:true
    read_only: true
    tmpfs:
      - /tmp
    networks:
      - todoapp-network
    profiles:
      - prod
@z

@x
  # ========================================
  # PostgreSQL Database Service
  # ========================================
  db:
    image: postgres:18-alpine
    container_name: todoapp-db
    environment:
      POSTGRES_DB: "${POSTGRES_DB:-todoapp}"
      POSTGRES_USER: "${POSTGRES_USER:-todoapp}"
      POSTGRES_PASSWORD: "${POSTGRES_PASSWORD:-todoapp_password}"
    volumes:
      - postgres_data:/var/lib/postgresql
    ports:
      - "${DB_PORT:-5432}:5432"
    restart: unless-stopped
    healthcheck:
      test:
        [
          "CMD-SHELL",
          "pg_isready -U ${POSTGRES_USER:-todoapp} -d ${POSTGRES_DB:-todoapp}",
        ]
      interval: 10s
      timeout: 5s
      retries: 5
      start_period: 5s
    networks:
      - todoapp-network
@y
  # ========================================
  # PostgreSQL Database Service
  # ========================================
  db:
    image: postgres:18-alpine
    container_name: todoapp-db
    environment:
      POSTGRES_DB: "${POSTGRES_DB:-todoapp}"
      POSTGRES_USER: "${POSTGRES_USER:-todoapp}"
      POSTGRES_PASSWORD: "${POSTGRES_PASSWORD:-todoapp_password}"
    volumes:
      - postgres_data:/var/lib/postgresql
    ports:
      - "${DB_PORT:-5432}:5432"
    restart: unless-stopped
    healthcheck:
      test:
        [
          "CMD-SHELL",
          "pg_isready -U ${POSTGRES_USER:-todoapp} -d ${POSTGRES_DB:-todoapp}",
        ]
      interval: 10s
      timeout: 5s
      retries: 5
      start_period: 5s
    networks:
      - todoapp-network
@z

@x
# ========================================
# Volume Configuration
# ========================================
volumes:
  postgres_data:
    name: todoapp-postgres-data
    driver: local
@y
# ========================================
# Volume Configuration
# ========================================
volumes:
  postgres_data:
    name: todoapp-postgres-data
    driver: local
@z

@x
# ========================================
# Network Configuration
# ========================================
networks:
  todoapp-network:
    name: todoapp-network
    driver: bridge
```
@y
# ========================================
# Network Configuration
# ========================================
networks:
  todoapp-network:
    name: todoapp-network
    driver: bridge
```
@z

@x
This Docker Compose configuration includes:
@y
This Docker Compose configuration includes:
@z

@x
- Development service (`app-dev`): Full development environment with hot reload, debugging support, and bind mounts
- Production service (`app-prod`): Optimized production deployment with resource limits and security hardening
- Database service (`db`): PostgreSQL 18 with persistent storage and health checks
- Networking: Isolated network for secure service communication
- Volumes: Persistent storage for database data
@y
- Development service (`app-dev`): Full development environment with hot reload, debugging support, and bind mounts
- Production service (`app-prod`): Optimized production deployment with resource limits and security hardening
- Database service (`db`): PostgreSQL 18 with persistent storage and health checks
- Networking: Isolated network for secure service communication
- Volumes: Persistent storage for database data
@z

@x
### Step 3: Create environment configuration
@y
### Step 3: Create environment configuration
@z

@x
Create a `.env` file to configure your application settings:
@y
Create a `.env` file to configure your application settings:
@z

@x
```console
$ cp .env.example .env
```
@y
```console
$ cp .env.example .env
```
@z

@x
Update the `.env` file with your preferred settings:
@y
Update the `.env` file with your preferred settings:
@z

@x
```env
# Application Configuration
NODE_ENV=development
APP_PORT=3000
VITE_PORT=5173
DEBUG_PORT=9229
@y
```env
# Application Configuration
NODE_ENV=development
APP_PORT=3000
VITE_PORT=5173
DEBUG_PORT=9229
@z

@x
# Production Configuration
PROD_PORT=8080
PROD_MEMORY_LIMIT=2G
PROD_CPU_LIMIT=1.0
PROD_MEMORY_RESERVATION=512M
PROD_CPU_RESERVATION=0.25
@y
# Production Configuration
PROD_PORT=8080
PROD_MEMORY_LIMIT=2G
PROD_CPU_LIMIT=1.0
PROD_MEMORY_RESERVATION=512M
PROD_CPU_RESERVATION=0.25
@z

@x
# Database Configuration
POSTGRES_HOST=db
POSTGRES_PORT=5432
POSTGRES_DB=todoapp
POSTGRES_USER=todoapp
POSTGRES_PASSWORD=todoapp_password
DB_PORT=5432
@y
# Database Configuration
POSTGRES_HOST=db
POSTGRES_PORT=5432
POSTGRES_DB=todoapp
POSTGRES_USER=todoapp
POSTGRES_PASSWORD=todoapp_password
DB_PORT=5432
@z

@x
# Security Configuration
ALLOWED_ORIGINS=http://localhost:3000,http://localhost:5173
```
@y
# Security Configuration
ALLOWED_ORIGINS=http://localhost:3000,http://localhost:5173
```
@z

@x
### Step 4: Configure the .dockerignore file
@y
### Step 4: Configure the .dockerignore file
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
# Optimized .dockerignore for Node.js + React Todo App
# Based on actual project structure
@y
```dockerignore
# Optimized .dockerignore for Node.js + React Todo App
# Based on actual project structure
@z

@x
# Version control
.git/
.github/
.gitignore
@y
# Version control
.git/
.github/
.gitignore
@z

@x
# Dependencies (installed in container)
node_modules/
@y
# Dependencies (installed in container)
node_modules/
@z

@x
# Build outputs (built in container)
dist/
@y
# Build outputs (built in container)
dist/
@z

@x
# Environment files
.env*
@y
# Environment files
.env*
@z

@x
# Development files
.vscode/
*.log
coverage/
.eslintcache
@y
# Development files
.vscode/
*.log
coverage/
.eslintcache
@z

@x
# OS files
.DS_Store
Thumbs.db
@y
# OS files
.DS_Store
Thumbs.db
@z

@x
# Documentation
*.md
docs/
@y
# Documentation
*.md
docs/
@z

@x
# Deployment configs
compose.yaml
Taskfile.yml
nodejs-sample-kubernetes.yaml
@y
# Deployment configs
compose.yaml
Taskfile.yml
nodejs-sample-kubernetes.yaml
@z

@x
# Non-essential configs (keep build configs)
*.config.js
!vite.config.ts
!esbuild.config.js
!tailwind.config.js
!postcss.config.js
!tsconfig.json
```
@y
# Non-essential configs (keep build configs)
*.config.js
!vite.config.ts
!esbuild.config.js
!tailwind.config.js
!postcss.config.js
!tsconfig.json
```
@z

@x
### Step 5: Build the Node.js application image
@y
### Step 5: Build the Node.js application image
@z

@x
After creating all the configuration files, your project directory should now contain all necessary Docker configuration files:
@y
After creating all the configuration files, your project directory should now contain all necessary Docker configuration files:
@z

@x
```text
├── docker-nodejs-sample/
│ ├── Dockerfile
│ ├── .dockerignore
│ ├── compose.yaml
│ └── .env
```
@y
```text
├── docker-nodejs-sample/
│ ├── Dockerfile
│ ├── .dockerignore
│ ├── compose.yaml
│ └── .env
```
@z

@x
Now you can build the Docker image for your Node.js application.
@y
Now you can build the Docker image for your Node.js application.
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
$ docker build --target production --tag docker-nodejs-sample .
```
@y
```console
$ docker build --target production --tag docker-nodejs-sample .
```
@z

@x
What this command does:
@y
What this command does:
@z

@x
- Uses the Dockerfile in the current directory (.)
- Targets the production stage of the multi-stage build
- Packages the application and its dependencies into a Docker image
- Tags the image as docker-nodejs-sample so you can reference it later
@y
- Uses the Dockerfile in the current directory (.)
- Targets the production stage of the multi-stage build
- Packages the application and its dependencies into a Docker image
- Tags the image as docker-nodejs-sample so you can reference it later
@z

@x
### Step 6: View local images
@y
### Step 6: View local images
@z

@x
After building your Docker image, you can check which images are available on your local machine using either the Docker CLI or [Docker Desktop](/manuals/desktop/use-desktop/images.md). Since you're already working in the terminal, use the Docker CLI.
@y
After building your Docker image, you can check which images are available on your local machine using either the Docker CLI or [Docker Desktop](manuals/desktop/use-desktop/images.md). Since you're already working in the terminal, use the Docker CLI.
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
REPOSITORY               TAG              IMAGE ID       CREATED         SIZE
docker-nodejs-sample     latest           423525528038   14 seconds ago  237.46MB
```
@y
```shell
REPOSITORY               TAG              IMAGE ID       CREATED         SIZE
docker-nodejs-sample     latest           423525528038   14 seconds ago  237.46MB
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
If the build was successful, you should see `docker-nodejs-sample` image listed.
@y
If the build was successful, you should see `docker-nodejs-sample` image listed.
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
In the previous step, you created a Dockerfile for your Node.js application and built a Docker image using the `docker build` command. Now it’s time to run that image in a container and verify that your application works as expected.
@y
In the previous step, you created a Dockerfile for your Node.js application and built a Docker image using the `docker build` command. Now it’s time to run that image in a container and verify that your application works as expected.
@z

@x
Inside the `docker-nodejs-sample` directory, run the following command in a terminal.
@y
Inside the `docker-nodejs-sample` directory, run the following command in a terminal.
@z

@x
```console
$ docker compose up app-dev --build
```
@y
```console
$ docker compose up app-dev --build
```
@z

@x
The development application will start with both servers:
@y
The development application will start with both servers:
@z

@x
- API Server: [http://localhost:3000](http://localhost:3000) - Express.js backend with REST API
- Frontend: [http://localhost:5173](http://localhost:5173) - Vite dev server with React frontend
- Health Check: [http://localhost:3000/health](http://localhost:3000/health) - Application health status
@y
- API Server: [http://localhost:3000](http://localhost:3000) - Express.js backend with REST API
- Frontend: [http://localhost:5173](http://localhost:5173) - Vite dev server with React frontend
- Health Check: [http://localhost:3000/health](http://localhost:3000/health) - Application health status
@z

@x
For production deployment, you can use:
@y
For production deployment, you can use:
@z

@x
```console
$ docker compose up app-prod --build
```
@y
```console
$ docker compose up app-prod --build
```
@z

@x
Which serves the full-stack app at [http://localhost:8080](http://localhost:8080) with the Express server running on port 3000 internally, mapped to port 8080 externally.
@y
Which serves the full-stack app at [http://localhost:8080](http://localhost:8080) with the Express server running on port 3000 internally, mapped to port 8080 externally.
@z

@x
You should see a modern Todo List application with React 19 and a fully functional REST API.
@y
You should see a modern Todo List application with React 19 and a fully functional REST API.
@z

@x
Press `CTRL + C` in the terminal to stop your application.
@y
Press `CTRL + C` in the terminal to stop your application.
@z

@x
### Run the application in the background
@y
### Run the application in the background
@z

@x
You can run the application detached from the terminal by adding the `-d` option. Inside the `docker-nodejs-sample` directory, run the following command in a terminal.
@y
You can run the application detached from the terminal by adding the `-d` option. Inside the `docker-nodejs-sample` directory, run the following command in a terminal.
@z

@x
```console
$ docker compose up app-dev --build -d
```
@y
```console
$ docker compose up app-dev --build -d
```
@z

@x
Open a browser and view the application at [http://localhost:3000](http://localhost:3000) (API) or [http://localhost:5173](http://localhost:5173) (frontend). You should see the Todo application running.
@y
Open a browser and view the application at [http://localhost:3000](http://localhost:3000) (API) or [http://localhost:5173](http://localhost:5173) (frontend). You should see the Todo application running.
@z

@x
To confirm that the container is running, use `docker ps` command:
@y
To confirm that the container is running, use `docker ps` command:
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
This will list all active containers along with their ports, names, and status. Look for a container exposing ports 3000, 5173, and 9229 for the development app.
@y
This will list all active containers along with their ports, names, and status. Look for a container exposing ports 3000, 5173, and 9229 for the development app.
@z

@x
Example Output:
@y
Example Output:
@z

@x
```shell
CONTAINER ID   IMAGE                          COMMAND                  CREATED          STATUS                 PORTS                                                                                                                                   NAMES
93f3faee32c3   docker-nodejs-sample-app-dev   "docker-entrypoint.s…"   33 seconds ago   Up 31 seconds          0.0.0.0:3000->3000/tcp, [::]:3000->3000/tcp, 0.0.0.0:5173->5173/tcp, [::]:5173->5173/tcp, 0.0.0.0:9230->9229/tcp, [::]:9230->9229/tcp   todoapp-dev
```
@y
```shell
CONTAINER ID   IMAGE                          COMMAND                  CREATED          STATUS                 PORTS                                                                                                                                   NAMES
93f3faee32c3   docker-nodejs-sample-app-dev   "docker-entrypoint.s…"   33 seconds ago   Up 31 seconds          0.0.0.0:3000->3000/tcp, [::]:3000->3000/tcp, 0.0.0.0:5173->5173/tcp, [::]:5173->5173/tcp, 0.0.0.0:9230->9229/tcp, [::]:9230->9229/tcp   todoapp-dev
```
@z

@x
### Run different profiles
@y
### Run different profiles
@z

@x
You can run different configurations using Docker Compose profiles:
@y
You can run different configurations using Docker Compose profiles:
@z

@x
```console
# Run production
$ docker compose up app-prod -d
@y
```console
# Run production
$ docker compose up app-prod -d
@z

@x
# Run tests
$ docker compose up app-test -d
```
@y
# Run tests
$ docker compose up app-test -d
```
@z

@x
To stop the application, run:
@y
To stop the application, run:
@z

@x
```console
$ docker compose down
```
@y
```console
$ docker compose down
```
@z

@x
> [!NOTE]
> For more information about Compose commands, see the [Compose CLI
> reference](/reference/cli/docker/compose/).
@y
> [!NOTE]
> For more information about Compose commands, see the [Compose CLI
> reference](__SUBDIR__/reference/cli/docker/compose/).
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
In this guide, you learned how to containerize, build, and run a Node.js application using Docker. By following best practices, you created a secure, optimized, and production-ready setup.
@y
In this guide, you learned how to containerize, build, and run a Node.js application using Docker. By following best practices, you created a secure, optimized, and production-ready setup.
@z

@x
What you accomplished:
@y
What you accomplished:
@z

@x
- Created a `Dockerfile` with a multi-stage build optimized for TypeScript and React.
- Created a `compose.yaml` file with development, production, and database services.
- Set up environment configuration with a `.env` file for flexible deployment settings.
- Created a `.dockerignore` file to exclude unnecessary files and keep the image clean and efficient.
- Built your Docker image using `docker build`.
- Ran the container using `docker compose up`, both in the foreground and in detached mode.
- Verified that the app was running by visiting [http://localhost:8080](http://localhost:8080) (production) or [http://localhost:3000](http://localhost:3000) (development).
- Learned how to stop the containerized application using `docker compose down`.
@y
- Created a `Dockerfile` with a multi-stage build optimized for TypeScript and React.
- Created a `compose.yaml` file with development, production, and database services.
- Set up environment configuration with a `.env` file for flexible deployment settings.
- Created a `.dockerignore` file to exclude unnecessary files and keep the image clean and efficient.
- Built your Docker image using `docker build`.
- Ran the container using `docker compose up`, both in the foreground and in detached mode.
- Verified that the app was running by visiting [http://localhost:8080](http://localhost:8080) (production) or [http://localhost:3000](http://localhost:3000) (development).
- Learned how to stop the containerized application using `docker compose down`.
@z

@x
You now have a fully containerized Node.js application, running in a Docker container, and ready for deployment across any environment with confidence and consistency.
@y
You now have a fully containerized Node.js application, running in a Docker container, and ready for deployment across any environment with confidence and consistency.
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
- [`docker build` CLI reference](/reference/cli/docker/image/build/) – Build Docker images from a Dockerfile.
- [`docker images` CLI reference](/reference/cli/docker/image/ls/) – Manage and inspect local Docker images.
- [`docker compose up` CLI reference](/reference/cli/docker/compose/up/) – Start and run multi-container applications.
- [`docker compose down` CLI reference](/reference/cli/docker/compose/down/) – Stop and remove containers, networks, and volumes.
@y
- [Multi-stage builds](__SUBDIR__/build/building/multi-stage/) – Learn how to separate build and runtime stages.
- [Best practices for writing Dockerfiles](__SUBDIR__/develop/develop-images/dockerfile_best-practices/) – Write efficient, maintainable, and secure Dockerfiles.
- [Build context in Docker](__SUBDIR__/build/concepts/context/) – Learn how context affects image builds.
- [`docker build` CLI reference](__SUBDIR__/reference/cli/docker/image/build/) – Build Docker images from a Dockerfile.
- [`docker images` CLI reference](__SUBDIR__/reference/cli/docker/image/ls/) – Manage and inspect local Docker images.
- [`docker compose up` CLI reference](__SUBDIR__/reference/cli/docker/compose/up/) – Start and run multi-container applications.
- [`docker compose down` CLI reference](__SUBDIR__/reference/cli/docker/compose/down/) – Stop and remove containers, networks, and volumes.
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
With your Node.js application now containerized, you're ready to move on to the next step.
@y
With your Node.js application now containerized, you're ready to move on to the next step.
@z

@x
In the next section, you'll learn how to develop your application using Docker containers, enabling a consistent, isolated, and reproducible development environment across any machine.
@y
In the next section, you'll learn how to develop your application using Docker containers, enabling a consistent, isolated, and reproducible development environment across any machine.
@z
