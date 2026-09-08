%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応
% snip 対応 (一部)

@x
title: Vue.js language-specific guide
linkTitle: Vue.js
description: Containerize and develop Vue.js apps using Docker
keywords: getting started, vue, vuejs docker, language, Dockerfile
summary: |
  This guide explains how to containerize Vue.js applications using Docker.
@y
title: Vue.js language-specific guide
linkTitle: Vue.js
description: Containerize and develop Vue.js apps using Docker
keywords: getting started, vue, vuejs docker, language, Dockerfile
summary: |
  This guide explains how to containerize Vue.js applications using Docker.
@z

@x
  time: 20 minutes
@y
  time: 20 分
@z

@x
The Vue.js language-specific guide shows you how to containerize an Vue.js application using Docker, following best practices for creating efficient, production-ready containers.
@y
The Vue.js language-specific guide shows you how to containerize an Vue.js application using Docker, following best practices for creating efficient, production-ready containers.
@z

@x
[Vue.js](https://vuejs.org/) is a progressive and flexible framework for building modern, interactive web applications. However, as applications scale, managing dependencies, environments, and deployments can become complex. Docker simplifies these challenges by providing a consistent, isolated environment for both development and production.
@y
[Vue.js](https://vuejs.org/) is a progressive and flexible framework for building modern, interactive web applications. However, as applications scale, managing dependencies, environments, and deployments can become complex. Docker simplifies these challenges by providing a consistent, isolated environment for both development and production.
@z

@x
> **Acknowledgment**
>
> Docker extends its sincere gratitude to [Kristiyan Velkov](https://www.linkedin.com/in/kristiyan-velkov-763130b3/) for authoring this guide. As a Docker Captain and highly skilled Front-end engineer, Kristiyan brings exceptional expertise in modern web development, Docker, and DevOps. His hands-on approach and clear, actionable guidance make this guide an essential resource for developers aiming to build, optimize, and secure Vue.js applications with Docker.
@y
> **Acknowledgment**
>
> Docker extends its sincere gratitude to [Kristiyan Velkov](https://www.linkedin.com/in/kristiyan-velkov-763130b3/) for authoring this guide. As a Docker Captain and highly skilled Front-end engineer, Kristiyan brings exceptional expertise in modern web development, Docker, and DevOps. His hands-on approach and clear, actionable guidance make this guide an essential resource for developers aiming to build, optimize, and secure Vue.js applications with Docker.
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
- Containerize and run an Vue.js application using Docker.
- Set up a local development environment for Vue.js inside a container.
- Run tests for your Vue.js application within a Docker container.
@y
- Containerize and run an Vue.js application using Docker.
- Set up a local development environment for Vue.js inside a container.
- Run tests for your Vue.js application within a Docker container.
@z

@x
You'll start by containerizing an existing Vue.js application and work your way up to production-level deployments.
@y
You'll start by containerizing an existing Vue.js application and work your way up to production-level deployments.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Before you begin, ensure you have a working knowledge of:
@y
Before you begin, ensure you have a working knowledge of:
@z

@x
- Basic understanding of [TypeScript](https://www.typescriptlang.org/) and [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript).
- Familiarity with [Node.js](https://nodejs.org/en) and [npm](https://docs.npmjs.com/about-npm) for managing dependencies and running scripts.
- Familiarity with [Vue.js](https://vuejs.org/) fundamentals.
- Understanding of core Docker concepts such as images, containers, and Dockerfiles. If you're new to Docker, start with the [Docker basics](/get-started/docker-concepts/the-basics/what-is-a-container.md) guide.
@y
- Basic understanding of [TypeScript](https://www.typescriptlang.org/) and [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript).
- Familiarity with [Node.js](https://nodejs.org/en) and [npm](https://docs.npmjs.com/about-npm) for managing dependencies and running scripts.
- Familiarity with [Vue.js](https://vuejs.org/) fundamentals.
- Understanding of core Docker concepts such as images, containers, and Dockerfiles. If you're new to Docker, start with the [Docker basics](get-started/docker-concepts/the-basics/what-is-a-container.md) guide.
@z

@x
Once you've completed the Vue.js getting started modules, you’ll be fully prepared to containerize your own Vue.js application using the detailed examples and best practices outlined in this guide.
@y
Once you've completed the Vue.js getting started modules, you’ll be fully prepared to containerize your own Vue.js application using the detailed examples and best practices outlined in this guide.
@z

@x
## Containerize an Vue.js Application
@y
## Containerize an Vue.js Application
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
> **New to Docker?**  
> Start with the [Docker basics](/get-started/docker-concepts/the-basics/what-is-a-container.md) guide to get familiar with key concepts like images, containers, and Dockerfiles.
@y
> **New to Docker?**  
> Start with the [Docker basics](get-started/docker-concepts/the-basics/what-is-a-container.md) guide to get familiar with key concepts like images, containers, and Dockerfiles.
@z

@x
### Overview
@y
### Overview
@z

@x
This guide walks you through the complete process of containerizing an Vue.js application with Docker. You’ll learn how to create a production-ready Docker image using best practices that improve performance, security, scalability, and deployment efficiency.
@y
This guide walks you through the complete process of containerizing an Vue.js application with Docker. You’ll learn how to create a production-ready Docker image using best practices that improve performance, security, scalability, and deployment efficiency.
@z

@x
By the end of this guide, you will:
@y
By the end of this guide, you will:
@z

@x
- Containerize an Vue.js application using Docker.
- Create and optimize a Dockerfile for production builds.
- Use multi-stage builds to minimize image size.
- Serve the application efficiently with a custom Nginx configuration.
- Build secure and maintainable Docker images by following best practices.
@y
- Containerize an Vue.js application using Docker.
- Create and optimize a Dockerfile for production builds.
- Use multi-stage builds to minimize image size.
- Serve the application efficiently with a custom Nginx configuration.
- Build secure and maintainable Docker images by following best practices.
@z

@x
### Get the sample application
@y
### Get the sample application
@z

@x
Clone the sample application to use with this guide. Open a terminal, navigate to the directory where you want to work, and run the following command
to clone the git repository:
@y
Clone the sample application to use with this guide. Open a terminal, navigate to the directory where you want to work, and run the following command
to clone the git repository:
@z

% snip command...

@x
### Build the Docker image
@y
### Build the Docker image
@z

@x
Vue.js is a front-end framework that compiles into static assets, so the Dockerfile is customized to align with how Vue.js applications are built and efficiently served in a production environment.
@y
Vue.js is a front-end framework that compiles into static assets, so the Dockerfile is customized to align with how Vue.js applications are built and efficiently served in a production environment.
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
#### Step 1: Create the Dockerfile
@y
#### Step 1: Create the Dockerfile
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
Docker Hardened Images (DHIs) are available for Node.js in the [Docker Hardened Images catalog](https://hub.docker.com/hardened-images/catalog/dhi/node). Docker Hardened Images are freely available to everyone with no subscription required. You can pull and use them like any other Docker image after signing in to the DHI registry. For more information, see the [DHI quickstart](/dhi/get-started/) guide.
@y
{{< tabs >}}
{{< tab name="Using Docker Hardened Images" >}}
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
3. Pull the Nginx DHI (check the catalog for available versions):
@y
3. Pull the Nginx DHI (check the catalog for available versions):
@z

% snip command...

@x
In the following Dockerfile, the `FROM` instructions use `dhi.io/node:24-alpine3.22-dev` and `dhi.io/nginx:1.28.0-alpine3.21-dev` as the base images.
@y
In the following Dockerfile, the `FROM` instructions use `dhi.io/node:24-alpine3.22-dev` and `dhi.io/nginx:1.28.0-alpine3.21-dev` as the base images.
@z

@x
```dockerfile
# =========================================
# Stage 1: Build the Vue.js Application
# =========================================
# Use a lightweight DHI Node.js image for building
FROM dhi.io/node:24-alpine3.22-dev AS builder
@y
```dockerfile
# =========================================
# Stage 1: Build the Vue.js Application
# =========================================
# Use a lightweight DHI Node.js image for building
FROM dhi.io/node:24-alpine3.22-dev AS builder
@z

@x
# Set the working directory inside the container
WORKDIR /app
@y
# Set the working directory inside the container
WORKDIR /app
@z

@x
# Copy package-related files first to leverage Docker's caching mechanism
COPY package.json package-lock.json* ./
@y
# Copy package-related files first to leverage Docker's caching mechanism
COPY package.json package-lock.json* ./
@z

@x
# Install project dependencies using npm ci (ensures a clean, reproducible install)
RUN --mount=type=cache,target=/root/.npm npm ci
@y
# Install project dependencies using npm ci (ensures a clean, reproducible install)
RUN --mount=type=cache,target=/root/.npm npm ci
@z

@x
# Copy the rest of the application source code into the container
COPY . .
@y
# Copy the rest of the application source code into the container
COPY . .
@z

@x
# Build the Vue.js application
RUN npm run build
@y
# Build the Vue.js application
RUN npm run build
@z

@x
# =========================================
# Stage 2: Prepare Nginx to Serve Static Files
# =========================================
@y
# =========================================
# Stage 2: Prepare Nginx to Serve Static Files
# =========================================
@z

@x
FROM dhi.io/nginx:1.28.0-alpine3.21-dev AS runner
@y
FROM dhi.io/nginx:1.28.0-alpine3.21-dev AS runner
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
COPY --chown=nginx:nginx --from=builder /app/dist /usr/share/nginx/html
@y
# Copy the static build output from the build stage to Nginx's default HTML serving directory
COPY --chown=nginx:nginx --from=builder /app/dist /usr/share/nginx/html
@z

@x
# Use a built-in non-root user for security best practices
USER nginx
@y
# Use a built-in non-root user for security best practices
USER nginx
@z

@x
# Expose port 8080 to allow HTTP traffic
# Note: The default Nginx container now listens on port 8080 instead of 80
EXPOSE 8080
@y
# Expose port 8080 to allow HTTP traffic
# Note: The default Nginx container now listens on port 8080 instead of 80
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
Create a file named `Dockerfile` with the following contents:
@y
Create a file named `Dockerfile` with the following contents:
@z

@x
```dockerfile
# =========================================
# Stage 1: Build the Vue.js Application
# =========================================
ARG NODE_VERSION=24.12.0-alpine
ARG NGINX_VERSION=alpine3.22
@y
```dockerfile
# =========================================
# Stage 1: Build the Vue.js Application
# =========================================
ARG NODE_VERSION=24.12.0-alpine
ARG NGINX_VERSION=alpine3.22
@z

@x
# Use a lightweight Node.js image for building (customizable via ARG)
FROM node:${NODE_VERSION} AS builder
@y
# Use a lightweight Node.js image for building (customizable via ARG)
FROM node:${NODE_VERSION} AS builder
@z

@x
# Set the working directory inside the container
WORKDIR /app
@y
# Set the working directory inside the container
WORKDIR /app
@z

@x
# Copy package-related files first to leverage Docker's caching mechanism
COPY package.json package-lock.json* ./
@y
# Copy package-related files first to leverage Docker's caching mechanism
COPY package.json package-lock.json* ./
@z

@x
# Install project dependencies using npm ci (ensures a clean, reproducible install)
RUN --mount=type=cache,target=/root/.npm npm ci
@y
# Install project dependencies using npm ci (ensures a clean, reproducible install)
RUN --mount=type=cache,target=/root/.npm npm ci
@z

@x
# Copy the rest of the application source code into the container
COPY . .
@y
# Copy the rest of the application source code into the container
COPY . .
@z

@x
# Build the Vue.js application
RUN npm run build
@y
# Build the Vue.js application
RUN npm run build
@z

@x
# =========================================
# Stage 2: Prepare Nginx to Serve Static Files
# =========================================
@y
# =========================================
# Stage 2: Prepare Nginx to Serve Static Files
# =========================================
@z

@x
FROM nginxinc/nginx-unprivileged:${NGINX_VERSION} AS runner
@y
FROM nginxinc/nginx-unprivileged:${NGINX_VERSION} AS runner
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
COPY --chown=nginx:nginx --from=builder /app/dist /usr/share/nginx/html
@y
# Copy the static build output from the build stage to Nginx's default HTML serving directory
COPY --chown=nginx:nginx --from=builder /app/dist /usr/share/nginx/html
@z

@x
# Use a built-in non-root user for security best practices
USER nginx
@y
# Use a built-in non-root user for security best practices
USER nginx
@z

@x
# Expose port 8080 to allow HTTP traffic
# Note: The default Nginx container now listens on port 8080 instead of 80
EXPOSE 8080
@y
# Expose port 8080 to allow HTTP traffic
# Note: The default Nginx container now listens on port 8080 instead of 80
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
> We are using nginx-unprivileged instead of the standard Nginx image to follow security best practices.
> Running as a non-root user in the final image:
>
> - Reduces the attack surface
> - Aligns with Docker’s recommendations for container hardening
> - Helps comply with stricter security policies in production environments
@y
> [!NOTE]
> We are using nginx-unprivileged instead of the standard Nginx image to follow security best practices.
> Running as a non-root user in the final image:
>
> - Reduces the attack surface
> - Aligns with Docker’s recommendations for container hardening
> - Helps comply with stricter security policies in production environments
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
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
      - 8080:8080
```
@y
```yaml {collapse=true,title=compose.yaml}
services:
  server:
    build:
      context: .
    ports:
      - 8080:8080
```
@z

@x
#### Step 3: Create the .dockerignore file
@y
#### Step 3: Create the .dockerignore file
@z

@x
The `.dockerignore` file plays a crucial role in optimizing your Docker image by specifying which files and directories should be excluded from the build context.
@y
The `.dockerignore` file plays a crucial role in optimizing your Docker image by specifying which files and directories should be excluded from the build context.
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
# -------------------------------
# Dependency directories
# -------------------------------
node_modules/
@y
```dockerignore
# -------------------------------
# Dependency directories
# -------------------------------
node_modules/
@z

@x
# -------------------------------
# Production and build outputs
# -------------------------------
dist/
out/
build/
public/build/
@y
# -------------------------------
# Production and build outputs
# -------------------------------
dist/
out/
build/
public/build/
@z

@x
# -------------------------------
# Vite, VuePress, and cache dirs
# -------------------------------
.vite/
.vitepress/
.cache/
.tmp/
@y
# -------------------------------
# Vite, VuePress, and cache dirs
# -------------------------------
.vite/
.vitepress/
.cache/
.tmp/
@z

@x
# -------------------------------
# Test output and coverage
# -------------------------------
coverage/
reports/
jest/
cypress/
cypress/screenshots/
cypress/videos/
@y
# -------------------------------
# Test output and coverage
# -------------------------------
coverage/
reports/
jest/
cypress/
cypress/screenshots/
cypress/videos/
@z

@x
# -------------------------------
# Environment and config files
# -------------------------------
*.env*
!.env.production    # Keep production env if needed
*.local
*.log
@y
# -------------------------------
# Environment and config files
# -------------------------------
*.env*
!.env.production    # Keep production env if needed
*.local
*.log
@z

@x
# -------------------------------
# TypeScript artifacts
# -------------------------------
*.tsbuildinfo
@y
# -------------------------------
# TypeScript artifacts
# -------------------------------
*.tsbuildinfo
@z

@x
# -------------------------------
# Editor and IDE config
# -------------------------------
.vscode/
.idea/
*.swp
@y
# -------------------------------
# Editor and IDE config
# -------------------------------
.vscode/
.idea/
*.swp
@z

@x
# -------------------------------
# System files
# -------------------------------
.DS_Store
Thumbs.db
@y
# -------------------------------
# System files
# -------------------------------
.DS_Store
Thumbs.db
@z

@x
# -------------------------------
# Lockfiles (optional)
# -------------------------------
npm-debug.log*
yarn-debug.log*
yarn-error.log*
pnpm-debug.log*
@y
# -------------------------------
# Lockfiles (optional)
# -------------------------------
npm-debug.log*
yarn-debug.log*
yarn-error.log*
pnpm-debug.log*
@z

@x
# -------------------------------
# Git files
# -------------------------------
.git/
.gitignore
@y
# -------------------------------
# Git files
# -------------------------------
.git/
.gitignore
@z

@x
# -------------------------------
# Docker-related files
# -------------------------------
Dockerfile
.dockerignore
docker-compose.yml
docker-compose.override.yml
```
@y
# -------------------------------
# Docker-related files
# -------------------------------
Dockerfile
.dockerignore
docker-compose.yml
docker-compose.override.yml
```
@z

@x
#### Step 4: Create the `nginx.conf` file
@y
#### Step 4: Create the `nginx.conf` file
@z

@x
To serve your Vue.js application efficiently inside the container, you’ll configure Nginx with a custom setup. This configuration is optimized for performance, browser caching, gzip compression, and support for client-side routing.
@y
To serve your Vue.js application efficiently inside the container, you’ll configure Nginx with a custom setup. This configuration is optimized for performance, browser caching, gzip compression, and support for client-side routing.
@z

@x
Create a file named `nginx.conf` in the root of your project directory, and add the following content:
@y
Create a file named `nginx.conf` in the root of your project directory, and add the following content:
@z

@x
> [!NOTE]
> To learn more about configuring Nginx, see the [official Nginx documentation](https://nginx.org/en/docs/).
@y
> [!NOTE]
> To learn more about configuring Nginx, see the [official Nginx documentation](https://nginx.org/en/docs/).
@z

@x
```nginx
worker_processes auto;
pid /tmp/nginx.pid;
@y
```nginx
worker_processes auto;
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
    charset       utf-8;
@y
http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;
    charset       utf-8;
@z

@x
    access_log    off;
    error_log     /dev/stderr warn;
@y
    access_log    off;
    error_log     /dev/stderr warn;
@z

@x
    sendfile        on;
    tcp_nopush      on;
    tcp_nodelay     on;
    keepalive_timeout  65;
    keepalive_requests 1000;
@y
    sendfile        on;
    tcp_nopush      on;
    tcp_nodelay     on;
    keepalive_timeout  65;
    keepalive_requests 1000;
@z

@x
    gzip on;
    gzip_comp_level 6;
    gzip_proxied any;
    gzip_min_length 256;
    gzip_vary on;
    gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript image/svg+xml;
@y
    gzip on;
    gzip_comp_level 6;
    gzip_proxied any;
    gzip_min_length 256;
    gzip_vary on;
    gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript image/svg+xml;
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
        root   /usr/share/nginx/html;
        index  index.html;
@y
        root   /usr/share/nginx/html;
        index  index.html;
@z

@x
        location / {
            try_files $uri $uri/ /index.html;
        }
@y
        location / {
            try_files $uri $uri/ /index.html;
        }
@z

@x
        location ~* \.(?:ico|css|js|gif|jpe?g|png|woff2?|eot|ttf|svg|map)$ {
            expires 1y;
            access_log off;
            add_header Cache-Control "public, immutable";
            add_header X-Content-Type-Options nosniff;
        }
@y
        location ~* \.(?:ico|css|js|gif|jpe?g|png|woff2?|eot|ttf|svg|map)$ {
            expires 1y;
            access_log off;
            add_header Cache-Control "public, immutable";
            add_header X-Content-Type-Options nosniff;
        }
@z

@x
        location /assets/ {
            expires 1y;
            add_header Cache-Control "public, immutable";
            add_header X-Content-Type-Options nosniff;
        }
@y
        location /assets/ {
            expires 1y;
            add_header Cache-Control "public, immutable";
            add_header X-Content-Type-Options nosniff;
        }
@z

@x
        error_page 404 /index.html;
    }
}
```
@y
        error_page 404 /index.html;
    }
}
```
@z

@x
#### Step 5: Build the Vue.js application image
@y
#### Step 5: Build the Vue.js application image
@z

@x
With your custom configuration in place, you're now ready to build the Docker image for your Vue.js application.
@y
With your custom configuration in place, you're now ready to build the Docker image for your Vue.js application.
@z

@x
The updated setup includes:
@y
The updated setup includes:
@z

@x
- The updated setup includes a clean, production-ready Nginx configuration tailored specifically for Vue.js.
- Efficient multi-stage Docker build, ensuring a small and secure final image.
@y
- The updated setup includes a clean, production-ready Nginx configuration tailored specifically for Vue.js.
- Efficient multi-stage Docker build, ensuring a small and secure final image.
@z

@x
After completing the previous steps, your project directory should now contain the following files:
@y
After completing the previous steps, your project directory should now contain the following files:
@z

% snip text...

@x
Now that your Dockerfile is configured, you can build the Docker image for your Vue.js application.
@y
Now that your Dockerfile is configured, you can build the Docker image for your Vue.js application.
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

% snip command...

@x
What this command does:
@y
What this command does:
@z

@x
- Uses the Dockerfile in the current directory (.)
- Packages the application and its dependencies into a Docker image
- Tags the image as docker-vuejs-sample so you can reference it later
@y
- Uses the Dockerfile in the current directory (.)
- Packages the application and its dependencies into a Docker image
- Tags the image as docker-vuejs-sample so you can reference it later
@z

@x
#### Step 6: View local images
@y
#### Step 6: View local images
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

% snip command...

@x
Example Output:
@y
Example Output:
@z

% snip output...

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
If the build was successful, you should see `docker-vuejs-sample` image listed.
@y
If the build was successful, you should see `docker-vuejs-sample` image listed.
@z

@x
### Run the containerized application
@y
### Run the containerized application
@z

@x
In the previous step, you created a Dockerfile for your Vue.js application and built a Docker image using the docker build command. Now it’s time to run that image in a container and verify that your application works as expected.
@y
In the previous step, you created a Dockerfile for your Vue.js application and built a Docker image using the docker build command. Now it’s time to run that image in a container and verify that your application works as expected.
@z

@x
Inside the `docker-vuejs-sample` directory, run the following command in a
terminal.
@y
Inside the `docker-vuejs-sample` directory, run the following command in a
terminal.
@z

% snip command...

@x
Open a browser and view the application at [http://localhost:8080](http://localhost:8080). You should see a simple Vue.js web application.
@y
Open a browser and view the application at [http://localhost:8080](http://localhost:8080). You should see a simple Vue.js web application.
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
You can run the application detached from the terminal by adding the `-d`
option. Inside the `docker-vuejs-sample` directory, run the following command
in a terminal.
@y
You can run the application detached from the terminal by adding the `-d`
option. Inside the `docker-vuejs-sample` directory, run the following command
in a terminal.
@z

% snip command...

@x
Open a browser and view the application at [http://localhost:8080](http://localhost:8080). You should see your Vue.js application running in the browser.
@y
Open a browser and view the application at [http://localhost:8080](http://localhost:8080). You should see your Vue.js application running in the browser.
@z

@x
To confirm that the container is running, use `docker ps` command:
@y
To confirm that the container is running, use `docker ps` command:
@z

% snip command...

@x
This will list all active containers along with their ports, names, and status. Look for a container exposing port 8080.
@y
This will list all active containers along with their ports, names, and status. Look for a container exposing port 8080.
@z

@x
Example Output:
@y
Example Output:
@z

% snip output...

@x
To stop the application, run:
@y
To stop the application, run:
@z

% snip command...

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
## Use containers for Vue.js development
@y
## Use containers for Vue.js development
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
Complete [Containerize Vue.js application](#containerize-an-vuejs-application).
@y
Complete [Containerize Vue.js application](#containerize-an-vuejs-application).
@z

@x
### Overview
@y
### Overview
@z

@x
In this section, you'll set up both production and development environments for your Vue.js application using Docker Compose. This approach streamlines your workflow—delivering a lightweight, static site via Nginx in production, and providing a fast, live-reloading dev server with Compose Watch for efficient local development.
@y
In this section, you'll set up both production and development environments for your Vue.js application using Docker Compose. This approach streamlines your workflow—delivering a lightweight, static site via Nginx in production, and providing a fast, live-reloading dev server with Compose Watch for efficient local development.
@z

@x
You’ll learn how to:
@y
You’ll learn how to:
@z

@x
- Configure isolated environments: Set up separate containers optimized for production and development use cases.
- Live-reload in development: Use Compose Watch to automatically sync file changes, enabling real-time updates without manual intervention.
- Preview and debug with ease: Develop inside containers with a seamless preview and debug experience—no rebuilds required after every change.
@y
- Configure isolated environments: Set up separate containers optimized for production and development use cases.
- Live-reload in development: Use Compose Watch to automatically sync file changes, enabling real-time updates without manual intervention.
- Preview and debug with ease: Develop inside containers with a seamless preview and debug experience—no rebuilds required after every change.
@z

@x
### Automatically update services (development mode)
@y
### Automatically update services (development mode)
@z

@x
Leverage Compose Watch to enable real-time file synchronization between your local machine and the containerized Vue.js development environment. This powerful feature eliminates the need to manually rebuild or restart containers, providing a fast, seamless, and efficient development workflow.
@y
Leverage Compose Watch to enable real-time file synchronization between your local machine and the containerized Vue.js development environment. This powerful feature eliminates the need to manually rebuild or restart containers, providing a fast, seamless, and efficient development workflow.
@z

@x
With Compose Watch, your code updates are instantly reflected inside the container—perfect for rapid testing, debugging, and live previewing changes.
@y
With Compose Watch, your code updates are instantly reflected inside the container—perfect for rapid testing, debugging, and live previewing changes.
@z

@x
### Step 1: Create a development Dockerfile
@y
### Step 1: Create a development Dockerfile
@z

@x
Create a file named `Dockerfile.dev` in your project root with the following content:
@y
Create a file named `Dockerfile.dev` in your project root with the following content:
@z

@x
```dockerfile
# =========================================
# Stage 1: Develop the Vue.js Application
# =========================================
ARG NODE_VERSION=24.12.0-alpine
@y
```dockerfile
# =========================================
# Stage 1: Develop the Vue.js Application
# =========================================
ARG NODE_VERSION=24.12.0-alpine
@z

@x
# Use a lightweight Node.js image for development
FROM node:${NODE_VERSION} AS dev
@y
# Use a lightweight Node.js image for development
FROM node:${NODE_VERSION} AS dev
@z

@x
# Set environment variable to indicate development mode
ENV NODE_ENV=development
@y
# Set environment variable to indicate development mode
ENV NODE_ENV=development
@z

@x
# Set the working directory inside the container
WORKDIR /app
@y
# Set the working directory inside the container
WORKDIR /app
@z

@x
# Copy package-related files first to leverage Docker's caching mechanism
COPY package.json package-lock.json* ./
@y
# Copy package-related files first to leverage Docker's caching mechanism
COPY package.json package-lock.json* ./
@z

@x
# Install project dependencies
RUN --mount=type=cache,target=/root/.npm npm install
@y
# Install project dependencies
RUN --mount=type=cache,target=/root/.npm npm install
@z

@x
# Copy the rest of the application source code into the container
COPY . .
@y
# Copy the rest of the application source code into the container
COPY . .
@z

@x
# Change ownership of the application directory to the node user
RUN chown -R node:node /app
@y
# Change ownership of the application directory to the node user
RUN chown -R node:node /app
@z

@x
# Switch to the node user
USER node
@y
# Switch to the node user
USER node
@z

@x
# Expose the port used by the Vite development server
EXPOSE 5173
@y
# Expose the port used by the Vite development server
EXPOSE 5173
@z

@x
# Use a default command, can be overridden in Docker compose.yml file
CMD [ "npm", "run", "dev", "--", "--host" ]
@y
# Use a default command, can be overridden in Docker compose.yml file
CMD [ "npm", "run", "dev", "--", "--host" ]
@z

@x
```
@y
```
@z

@x
This file sets up a lightweight development environment for your Vue.js application using the dev server.
@y
This file sets up a lightweight development environment for your Vue.js application using the dev server.
@z

@x
#### Step 2: Update your `compose.yaml` file
@y
#### Step 2: Update your `compose.yaml` file
@z

@x
Open your `compose.yaml` file and define two services: one for production (`vuejs-prod`) and one for development (`vuejs-dev`).
@y
Open your `compose.yaml` file and define two services: one for production (`vuejs-prod`) and one for development (`vuejs-dev`).
@z

@x
Here’s an example configuration for an Vue.js application:
@y
Here’s an example configuration for an Vue.js application:
@z

@x
```yaml
services:
  vuejs-prod:
    build:
      context: .
      dockerfile: Dockerfile
    image: docker-vuejs-sample
    ports:
      - "8080:8080"
@y
```yaml
services:
  vuejs-prod:
    build:
      context: .
      dockerfile: Dockerfile
    image: docker-vuejs-sample
    ports:
      - "8080:8080"
@z

@x
  vuejs-dev:
    build:
      context: .
      dockerfile: Dockerfile.dev
    ports:
      - "5173:5173"
    develop:
      watch:
        - path: ./src
          target: /app/src
          action: sync
        - path: ./package.json
          target: /app/package.json
          action: restart
        - path: ./vite.config.js
          target: /app/vite.config.js
          action: restart
```
@y
  vuejs-dev:
    build:
      context: .
      dockerfile: Dockerfile.dev
    ports:
      - "5173:5173"
    develop:
      watch:
        - path: ./src
          target: /app/src
          action: sync
        - path: ./package.json
          target: /app/package.json
          action: restart
        - path: ./vite.config.js
          target: /app/vite.config.js
          action: restart
```
@z

@x
- The `vuejs-prod` service builds and serves your static production app using Nginx.
- The `vuejs-dev` service runs your Vue.js development server with live reload and hot module replacement.
- `watch` triggers file sync with Compose Watch.
@y
- The `vuejs-prod` service builds and serves your static production app using Nginx.
- The `vuejs-dev` service runs your Vue.js development server with live reload and hot module replacement.
- `watch` triggers file sync with Compose Watch.
@z

@x
> [!NOTE]
> For more details, see the official guide: [Use Compose Watch](/manuals/compose/how-tos/file-watch.md).
@y
> [!NOTE]
> For more details, see the official guide: [Use Compose Watch](manuals/compose/how-tos/file-watch.md).
@z

@x
After completing the previous steps, your project directory should now contain the following files:
@y
After completing the previous steps, your project directory should now contain the following files:
@z

% snip text...

@x
#### Step 4: Start Compose Watch
@y
#### Step 4: Start Compose Watch
@z

@x
Run the following command from the project root to start the container in watch mode
@y
Run the following command from the project root to start the container in watch mode
@z

% snip command...

@x
#### Step 5: Test Compose Watch with Vue.js
@y
#### Step 5: Test Compose Watch with Vue.js
@z

@x
To confirm that Compose Watch is functioning correctly:
@y
To confirm that Compose Watch is functioning correctly:
@z

@x
1. Open the `src/App.vue` file in your text editor.
@y
1. Open the `src/App.vue` file in your text editor.
@z

@x
2. Locate the following line:
@y
2. Locate the following line:
@z

@x
   ```html
   <HelloWorld msg="You did it!" />
   ```
@y
   ```html
   <HelloWorld msg="You did it!" />
   ```
@z

@x
3. Change it to:
@y
3. Change it to:
@z

@x
   ```html
   <HelloWorld msg="Hello from Docker Compose Watch" />
   ```
@y
   ```html
   <HelloWorld msg="Hello from Docker Compose Watch" />
   ```
@z

@x
4. Save the file.
@y
4. Save the file.
@z

@x
5. Open your browser at [http://localhost:5173](http://localhost:5173).
@y
5. Open your browser at [http://localhost:5173](http://localhost:5173).
@z

@x
You should see the updated text appear instantly, without needing to rebuild the container manually. This confirms that file watching and automatic synchronization are working as expected.
@y
You should see the updated text appear instantly, without needing to rebuild the container manually. This confirms that file watching and automatic synchronization are working as expected.
@z

@x
## Run vue.js tests in a container
@y
## Run vue.js tests in a container
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
Complete all the previous sections of this guide, starting with [Containerize Vue.js application](#containerize-an-vuejs-application).
@y
Complete all the previous sections of this guide, starting with [Containerize Vue.js application](#containerize-an-vuejs-application).
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
- Run unit tests using Vitest inside a Docker container.
- Use Docker Compose to run tests in an isolated, reproducible environment.
@y
- Run unit tests using Vitest inside a Docker container.
- Use Docker Compose to run tests in an isolated, reproducible environment.
@z

@x
You’ll use [Vitest](https://vitest.dev) — a blazing fast test runner designed for Vite — together with [@vue/test-utils](https://test-utils.vuejs.org/) to write unit tests that validate your component logic, props, events, and reactive behavior.
@y
You’ll use [Vitest](https://vitest.dev) — a blazing fast test runner designed for Vite — together with [@vue/test-utils](https://test-utils.vuejs.org/) to write unit tests that validate your component logic, props, events, and reactive behavior.
@z

@x
This setup ensures your Vue.js components are tested in an environment that mirrors how users actually interact with your application.
@y
This setup ensures your Vue.js components are tested in an environment that mirrors how users actually interact with your application.
@z

@x
### Run tests during development
@y
### Run tests during development
@z

@x
`docker-vuejs-sample` application includes a sample test file at location:
@y
`docker-vuejs-sample` application includes a sample test file at location:
@z

% snip command...

@x
This test uses Vitest and Vue Test Utils to verify the behavior of the HelloWorld component.
@y
This test uses Vitest and Vue Test Utils to verify the behavior of the HelloWorld component.
@z

@x
#### Step 1: Update compose.yaml
@y
#### Step 1: Update compose.yaml
@z

@x
Add a new service named `vuejs-test` to your `compose.yaml` file. This service allows you to run your test suite in an isolated containerized environment.
@y
Add a new service named `vuejs-test` to your `compose.yaml` file. This service allows you to run your test suite in an isolated containerized environment.
@z

@x
```yaml {hl_lines="22-26",linenos=true}
services:
  vuejs-prod:
    build:
      context: .
      dockerfile: Dockerfile
    image: docker-vuejs-sample
    ports:
      - "8080:8080"
@y
```yaml {hl_lines="22-26",linenos=true}
services:
  vuejs-prod:
    build:
      context: .
      dockerfile: Dockerfile
    image: docker-vuejs-sample
    ports:
      - "8080:8080"
@z

@x
  vuejs-dev:
    build:
      context: .
      dockerfile: Dockerfile.dev
    ports:
      - "5173:5173"
    develop:
      watch:
        - action: sync
          path: .
          target: /app
@y
  vuejs-dev:
    build:
      context: .
      dockerfile: Dockerfile.dev
    ports:
      - "5173:5173"
    develop:
      watch:
        - action: sync
          path: .
          target: /app
@z

@x
  vuejs-test:
    build:
      context: .
      dockerfile: Dockerfile.dev
    command: ["npm", "run", "test:unit"]
```
@y
  vuejs-test:
    build:
      context: .
      dockerfile: Dockerfile.dev
    command: ["npm", "run", "test:unit"]
```
@z

@x
The vuejs-test service reuses the same `Dockerfile.dev` used for [development](#use-containers-for-vuejs-development) and overrides the default command to run tests with `npm run test`. This setup ensures a consistent test environment that matches your local development configuration.
@y
The vuejs-test service reuses the same `Dockerfile.dev` used for [development](#use-containers-for-vuejs-development) and overrides the default command to run tests with `npm run test`. This setup ensures a consistent test environment that matches your local development configuration.
@z

@x
After completing the previous steps, your project directory should contain the following files:
@y
After completing the previous steps, your project directory should contain the following files:
@z

% snip text...

@x
#### Step 2: Run the tests
@y
#### Step 2: Run the tests
@z

@x
To execute your test suite inside the container, run the following command from your project root:
@y
To execute your test suite inside the container, run the following command from your project root:
@z

% snip command...

@x
This command will:
@y
This command will:
@z

@x
- Start the `vuejs-test` service defined in your `compose.yaml` file.
- Execute the `npm run test` script using the same environment as development.
- Automatically remove the container after the tests complete [`docker compose run --rm`](/reference/cli/docker/compose/run/) command.
@y
- Start the `vuejs-test` service defined in your `compose.yaml` file.
- Execute the `npm run test` script using the same environment as development.
- Automatically remove the container after the tests complete [`docker compose run --rm`](__SUBDIR__/reference/cli/docker/compose/run/) command.
@z

@x
You should see output similar to the following:
@y
You should see output similar to the following:
@z

% snip output...

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
### Summary
@y
### Summary
@z

@x
In this section, you learned how to run unit tests for your Vue.js application inside a Docker container using Vitest and Docker Compose.
@y
In this section, you learned how to run unit tests for your Vue.js application inside a Docker container using Vitest and Docker Compose.
@z

@x
What you accomplished:
@y
What you accomplished:
@z

@x
- Created a `vuejs-test` service in `compose.yaml` to isolate test execution.
- Reused the development `Dockerfile.dev` to ensure consistency between dev and test environments.
- Ran tests inside the container using `docker compose run --rm vuejs-test`.
- Ensured reliable, repeatable testing across environments without depending on your local machine setup.
@y
- Created a `vuejs-test` service in `compose.yaml` to isolate test execution.
- Reused the development `Dockerfile.dev` to ensure consistency between dev and test environments.
- Ran tests inside the container using `docker compose run --rm vuejs-test`.
- Ensured reliable, repeatable testing across environments without depending on your local machine setup.
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
@y
- [Dockerfile reference](__SUBDIR__/reference/dockerfile/) – Understand all Dockerfile instructions and syntax.
- [Best practices for writing Dockerfiles](__SUBDIR__/develop/develop-images/dockerfile_best-practices/) – Write efficient, maintainable, and secure Dockerfiles.
- [Compose file reference](__SUBDIR__/compose/compose-file/) – Learn the full syntax and options available for configuring services in `compose.yaml`.
- [`docker compose run` CLI reference](__SUBDIR__/reference/cli/docker/compose/run/) – Run one-off commands in a service container.
@z
