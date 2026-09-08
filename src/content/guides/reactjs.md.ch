%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: React.js language-specific guide
linkTitle: React.js
description: Containerize and develop React.js apps using Docker
keywords: getting started, React.js, react.js, docker, language, Dockerfile
summary: |
  This guide explains how to containerize React.js applications using Docker.
@y
title: React.js language-specific guide
linkTitle: React.js
description: Containerize and develop React.js apps using Docker
keywords: getting started, React.js, react.js, docker, language, Dockerfile
summary: |
  This guide explains how to containerize React.js applications using Docker.
@z

@x
  time: 20 minutes
@y
  time: 20 分
@z

@x
The React.js language-specific guide shows you how to containerize a React.js application using Docker, following best practices for creating efficient, production-ready containers.
@y
The React.js language-specific guide shows you how to containerize a React.js application using Docker, following best practices for creating efficient, production-ready containers.
@z

@x
[React.js](https://react.dev/) is a widely used library for building interactive user interfaces. However, managing dependencies, environments, and deployments efficiently can be complex. Docker simplifies this process by providing a consistent and containerized environment.
@y
[React.js](https://react.dev/) is a widely used library for building interactive user interfaces. However, managing dependencies, environments, and deployments efficiently can be complex. Docker simplifies this process by providing a consistent and containerized environment.
@z

@x
> **Acknowledgment**
>
> Docker extends its sincere gratitude to [Kristiyan Velkov](https://www.linkedin.com/in/kristiyan-velkov-763130b3/) for authoring this guide. As a Docker Captain and experienced Front-end engineer, his expertise in Docker, DevOps, and modern web development has made this resource invaluable for the community, helping developers navigate and optimize their Docker workflows.
@y
> **Acknowledgment**
>
> Docker extends its sincere gratitude to [Kristiyan Velkov](https://www.linkedin.com/in/kristiyan-velkov-763130b3/) for authoring this guide. As a Docker Captain and experienced Front-end engineer, his expertise in Docker, DevOps, and modern web development has made this resource invaluable for the community, helping developers navigate and optimize their Docker workflows.
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
- Containerize and run a React.js application using Docker.
- Set up a local development environment for React.js inside a container.
- Run tests for your React.js application within a Docker container.
@y
- Containerize and run a React.js application using Docker.
- Set up a local development environment for React.js inside a container.
- Run tests for your React.js application within a Docker container.
@z

@x
To begin, you’ll start by containerizing an existing React.js application.
@y
To begin, you’ll start by containerizing an existing React.js application.
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
- Familiarity with [React.js](https://react.dev/) fundamentals.
- Understanding of Docker concepts such as images, containers, and Dockerfiles. If you're new to Docker, start with the [Docker basics](/get-started/docker-concepts/the-basics/what-is-a-container.md) guide.
@y
- Basic understanding of [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript) or [TypeScript](https://www.typescriptlang.org/).
- Basic knowledge of [Node.js](https://nodejs.org/en) and [npm](https://docs.npmjs.com/about-npm) for managing dependencies and running scripts.
- Familiarity with [React.js](https://react.dev/) fundamentals.
- Understanding of Docker concepts such as images, containers, and Dockerfiles. If you're new to Docker, start with the [Docker basics](get-started/docker-concepts/the-basics/what-is-a-container.md) guide.
@z

@x
Once you've completed the React.js getting started modules, you’ll be ready to containerize your own React.js application using the examples and instructions provided in this guide.
@y
Once you've completed the React.js getting started modules, you’ll be ready to containerize your own React.js application using the examples and instructions provided in this guide.
@z

@x
## Containerize a React.js Application
@y
## Containerize a React.js Application
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
This guide walks you through the complete process of containerizing a React.js application with Docker. You’ll learn how to create a production-ready Docker image using best practices that improve performance, security, scalability, and deployment efficiency.
@y
This guide walks you through the complete process of containerizing a React.js application with Docker. You’ll learn how to create a production-ready Docker image using best practices that improve performance, security, scalability, and deployment efficiency.
@z

@x
By the end of this guide, you will:
@y
By the end of this guide, you will:
@z

@x
- Containerize a React.js application using Docker.
- Create and optimize a Dockerfile for production builds.
- Use multi-stage builds to minimize image size.
- Serve the application efficiently with a custom NGINX configuration.
- Follow best practices for building secure and maintainable Docker images.
@y
- Containerize a React.js application using Docker.
- Create and optimize a Dockerfile for production builds.
- Use multi-stage builds to minimize image size.
- Serve the application efficiently with a custom NGINX configuration.
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
$ git clone https://github.com/kristiyan-velkov/docker-reactjs-sample
```
@y
```console
$ git clone https://github.com/kristiyan-velkov/docker-reactjs-sample
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
React.js is a front-end library that compiles into static assets, so the Dockerfile is tailored to optimize how React applications are built and served in a production environment.
@y
React.js is a front-end library that compiles into static assets, so the Dockerfile is tailored to optimize how React applications are built and served in a production environment.
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
In the following Dockerfile, the `FROM` instructions use `dhi.io/node:24-alpine3.22-dev` and `dhi.io/nginx:1.28.0-alpine3.21-dev` as the base images.
@y
In the following Dockerfile, the `FROM` instructions use `dhi.io/node:24-alpine3.22-dev` and `dhi.io/nginx:1.28.0-alpine3.21-dev` as the base images.
@z

@x
```dockerfile
# =========================================
# Stage 1: Build the React.js Application
# =========================================
@y
```dockerfile
# =========================================
# Stage 1: Build the React.js Application
# =========================================
@z

@x
# Use a lightweight Node.js image for building (customizable via ARG)
FROM dhi.io/node:24-alpine3.22-dev AS builder
@y
# Use a lightweight Node.js image for building (customizable via ARG)
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
# Build the React.js application (outputs to /app/dist)
RUN npm run build
@y
# Build the React.js application (outputs to /app/dist)
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
# Use a non-root user for security best practices
USER nginx
@y
# Use a non-root user for security best practices
USER nginx
@z

@x
# Expose port 8080 to allow HTTP traffic
# Note: The default NGINX container now listens on port 8080 instead of 80
EXPOSE 8080
@y
# Expose port 8080 to allow HTTP traffic
# Note: The default NGINX container now listens on port 8080 instead of 80
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
# Stage 1: Build the React.js Application
# =========================================
ARG NODE_VERSION=24.12.0-alpine
ARG NGINX_VERSION=alpine3.22
@y
```dockerfile
# =========================================
# Stage 1: Build the React.js Application
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
# Build the React.js application (outputs to /app/dist)
RUN npm run build
@y
# Build the React.js application (outputs to /app/dist)
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
# Note: The default NGINX container now listens on port 8080 instead of 80
EXPOSE 8080
@y
# Expose port 8080 to allow HTTP traffic
# Note: The default NGINX container now listens on port 8080 instead of 80
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
> We are using nginx-unprivileged instead of the standard NGINX image to follow security best practices.
> Running as a non-root user in the final image:
>
> - Reduces the attack surface
> - Aligns with Docker’s recommendations for container hardening
> - Helps comply with stricter security policies in production environments
@y
> [!NOTE]
> We are using nginx-unprivileged instead of the standard NGINX image to follow security best practices.
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
# Ignore dependencies and build output
node_modules/
dist/
out/
.tmp/
.cache/
@y
```dockerignore
# Ignore dependencies and build output
node_modules/
dist/
out/
.tmp/
.cache/
@z

@x
# Ignore Vite, Webpack, and React-specific build artifacts
.vite/
.vitepress/
.eslintcache
.npm/
coverage/
jest/
cypress/
cypress/screenshots/
cypress/videos/
reports/
@y
# Ignore Vite, Webpack, and React-specific build artifacts
.vite/
.vitepress/
.eslintcache
.npm/
coverage/
jest/
cypress/
cypress/screenshots/
cypress/videos/
reports/
@z

@x
# Ignore environment and config files (sensitive data)
*.env*
*.log
@y
# Ignore environment and config files (sensitive data)
*.env*
*.log
@z

@x
# Ignore TypeScript build artifacts (if using TypeScript)
*.tsbuildinfo
@y
# Ignore TypeScript build artifacts (if using TypeScript)
*.tsbuildinfo
@z

@x
# Ignore lockfiles (optional if using Docker for package installation)
npm-debug.log*
yarn-debug.log*
yarn-error.log*
pnpm-debug.log*
@y
# Ignore lockfiles (optional if using Docker for package installation)
npm-debug.log*
yarn-debug.log*
yarn-error.log*
pnpm-debug.log*
@z

@x
# Ignore local development files
.git/
.gitignore
.vscode/
.idea/
*.swp
.DS_Store
Thumbs.db
@y
# Ignore local development files
.git/
.gitignore
.vscode/
.idea/
*.swp
.DS_Store
Thumbs.db
@z

@x
# Ignore Docker-related files (to avoid copying unnecessary configs)
Dockerfile
.dockerignore
docker-compose.yml
docker-compose.override.yml
@y
# Ignore Docker-related files (to avoid copying unnecessary configs)
Dockerfile
.dockerignore
docker-compose.yml
docker-compose.override.yml
@z

@x
# Ignore build-specific cache files
*.lock
@y
# Ignore build-specific cache files
*.lock
@z

@x
```
@y
```
@z

@x
#### Step 4: Create the `nginx.conf` file
@y
#### Step 4: Create the `nginx.conf` file
@z

@x
To serve your React.js application efficiently inside the container, you’ll configure NGINX with a custom setup. This configuration is optimized for performance, browser caching, gzip compression, and support for client-side routing.
@y
To serve your React.js application efficiently inside the container, you’ll configure NGINX with a custom setup. This configuration is optimized for performance, browser caching, gzip compression, and support for client-side routing.
@z

@x
Create a file named `nginx.conf` in the root of your project directory, and add the following content:
@y
Create a file named `nginx.conf` in the root of your project directory, and add the following content:
@z

@x
> [!NOTE]
> To learn more about configuring NGINX, see the [official NGINX documentation](https://nginx.org/en/docs/).
@y
> [!NOTE]
> To learn more about configuring NGINX, see the [official NGINX documentation](https://nginx.org/en/docs/).
@z

@x
```nginx
worker_processes auto;
@y
```nginx
worker_processes auto;
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
    error_log  /dev/stderr warn;
@y
    # Disable logging to avoid permission issues
    access_log off;
    error_log  /dev/stderr warn;
@z

@x
    # Optimize static file serving
    sendfile        on;
    tcp_nopush      on;
    tcp_nodelay     on;
    keepalive_timeout  65;
    keepalive_requests 1000;
@y
    # Optimize static file serving
    sendfile        on;
    tcp_nopush      on;
    tcp_nodelay     on;
    keepalive_timeout  65;
    keepalive_requests 1000;
@z

@x
    # Gzip compression for optimized delivery
    gzip on;
    gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript image/svg+xml;
    gzip_min_length 256;
    gzip_vary on;
@y
    # Gzip compression for optimized delivery
    gzip on;
    gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript image/svg+xml;
    gzip_min_length 256;
    gzip_vary on;
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
        # Root directory where React.js build files are placed
        root /usr/share/nginx/html;
        index index.html;
@y
        # Root directory where React.js build files are placed
        root /usr/share/nginx/html;
        index index.html;
@z

@x
        # Serve React.js static files with proper caching
        location / {
            try_files $uri /index.html;
        }
@y
        # Serve React.js static files with proper caching
        location / {
            try_files $uri /index.html;
        }
@z

@x
        # Serve static assets with long cache expiration
        location ~* \.(?:ico|css|js|gif|jpe?g|png|woff2?|eot|ttf|svg|map)$ {
            expires 1y;
            access_log off;
            add_header Cache-Control "public, immutable";
        }
@y
        # Serve static assets with long cache expiration
        location ~* \.(?:ico|css|js|gif|jpe?g|png|woff2?|eot|ttf|svg|map)$ {
            expires 1y;
            access_log off;
            add_header Cache-Control "public, immutable";
        }
@z

@x
        # Handle React.js client-side routing
        location /static/ {
            expires 1y;
            add_header Cache-Control "public, immutable";
        }
    }
}
```
@y
        # Handle React.js client-side routing
        location /static/ {
            expires 1y;
            add_header Cache-Control "public, immutable";
        }
    }
}
```
@z

@x
#### Step 5: Build the React.js application image
@y
#### Step 5: Build the React.js application image
@z

@x
With your custom configuration in place, you're now ready to build the Docker image for your React.js application.
@y
With your custom configuration in place, you're now ready to build the Docker image for your React.js application.
@z

@x
The updated setup includes:
@y
The updated setup includes:
@z

@x
- Optimized browser caching and gzip compression
- Secure, non-root logging to avoid permission issues
- Support for React client-side routing by redirecting unmatched routes to `index.html`
@y
- Optimized browser caching and gzip compression
- Secure, non-root logging to avoid permission issues
- Support for React client-side routing by redirecting unmatched routes to `index.html`
@z

@x
After completing the previous steps, your project directory should now contain the following files:
@y
After completing the previous steps, your project directory should now contain the following files:
@z

@x
```text
├── docker-reactjs-sample/
│ ├── Dockerfile
│ ├── .dockerignore
│ ├── compose.yaml
│ └── nginx.conf
```
@y
```text
├── docker-reactjs-sample/
│ ├── Dockerfile
│ ├── .dockerignore
│ ├── compose.yaml
│ └── nginx.conf
```
@z

@x
Now that your Dockerfile is configured, you can build the Docker image for your React.js application.
@y
Now that your Dockerfile is configured, you can build the Docker image for your React.js application.
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
$ docker build --tag docker-reactjs-sample .
```
@y
```console
$ docker build --tag docker-reactjs-sample .
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
- Tags the image as docker-reactjs-sample so you can reference it later
@y
- Uses the Dockerfile in the current directory (.)
- Packages the application and its dependencies into a Docker image
- Tags the image as docker-reactjs-sample so you can reference it later
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
docker-reactjs-sample     latest            f39b47a97156   14 seconds ago   75.8MB
```
@y
```shell
REPOSITORY                TAG               IMAGE ID       CREATED         SIZE
docker-reactjs-sample     latest            f39b47a97156   14 seconds ago   75.8MB
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
If the build was successful, you should see `docker-reactjs-sample` image listed.
@y
If the build was successful, you should see `docker-reactjs-sample` image listed.
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
In the previous step, you created a Dockerfile for your React.js application and built a Docker image using the docker build command. Now it’s time to run that image in a container and verify that your application works as expected.
@y
In the previous step, you created a Dockerfile for your React.js application and built a Docker image using the docker build command. Now it’s time to run that image in a container and verify that your application works as expected.
@z

@x
Inside the `docker-reactjs-sample` directory, run the following command in a
terminal.
@y
Inside the `docker-reactjs-sample` directory, run the following command in a
terminal.
@z

@x
```console
$ docker compose up --build
```
@y
```console
$ docker compose up --build
```
@z

@x
Open a browser and view the application at [http://localhost:8080](http://localhost:8080). You should see a simple React.js web application.
@y
Open a browser and view the application at [http://localhost:8080](http://localhost:8080). You should see a simple React.js web application.
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
option. Inside the `docker-reactjs-sample` directory, run the following command
in a terminal.
@y
You can run the application detached from the terminal by adding the `-d`
option. Inside the `docker-reactjs-sample` directory, run the following command
in a terminal.
@z

@x
```console
$ docker compose up --build -d
```
@y
```console
$ docker compose up --build -d
```
@z

@x
Open a browser and view the application at [http://localhost:8080](http://localhost:8080). You should see a simple web application preview.
@y
Open a browser and view the application at [http://localhost:8080](http://localhost:8080). You should see a simple web application preview.
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
This will list all active containers along with their ports, names, and status. Look for a container exposing port 8080.
@y
This will list all active containers along with their ports, names, and status. Look for a container exposing port 8080.
@z

@x
Example Output:
@y
Example Output:
@z

@x
```shell
CONTAINER ID   IMAGE                          COMMAND                  CREATED             STATUS             PORTS                    NAMES
88bced6ade95   docker-reactjs-sample-server   "nginx -c /etc/nginx…"   About a minute ago  Up About a minute  0.0.0.0:8080->8080/tcp   docker-reactjs-sample-server-1
```
@y
```shell
CONTAINER ID   IMAGE                          COMMAND                  CREATED             STATUS             PORTS                    NAMES
88bced6ade95   docker-reactjs-sample-server   "nginx -c /etc/nginx…"   About a minute ago  Up About a minute  0.0.0.0:8080->8080/tcp   docker-reactjs-sample-server-1
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
## Use containers for React.js development
@y
## Use containers for React.js development
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
Complete [Containerize React.js application](#containerize-a-reactjs-application).
@y
Complete [Containerize React.js application](#containerize-a-reactjs-application).
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
In this section, you'll learn how to set up both production and development environments for your containerized React.js application using Docker Compose. This setup allows you to serve a static production build via Nginx and to develop efficiently inside containers using a live-reloading dev server with Compose Watch.
@y
In this section, you'll learn how to set up both production and development environments for your containerized React.js application using Docker Compose. This setup allows you to serve a static production build via Nginx and to develop efficiently inside containers using a live-reloading dev server with Compose Watch.
@z

@x
You’ll learn how to:
@y
You’ll learn how to:
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
Use Compose Watch to automatically sync source file changes into your containerized development environment. This provides a seamless, efficient development experience without needing to restart or rebuild containers manually.
@y
Use Compose Watch to automatically sync source file changes into your containerized development environment. This provides a seamless, efficient development experience without needing to restart or rebuild containers manually.
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
# Stage 1: Develop the React.js Application
# =========================================
ARG NODE_VERSION=24.12.0-alpine
@y
```dockerfile
# =========================================
# Stage 1: Develop the React.js Application
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
# Expose the port used by the Vite development server
EXPOSE 5173
@y
# Expose the port used by the Vite development server
EXPOSE 5173
@z

@x
# Use a default command, can be overridden in Docker compose.yml file
CMD ["npm", "run", "dev"]
```
@y
# Use a default command, can be overridden in Docker compose.yml file
CMD ["npm", "run", "dev"]
```
@z

@x
This file sets up a lightweight development environment for your React app using the dev server.
@y
This file sets up a lightweight development environment for your React app using the dev server.
@z

@x
#### Step 2: Update your `compose.yaml` file
@y
#### Step 2: Update your `compose.yaml` file
@z

@x
Open your `compose.yaml` file and define two services: one for production (`react-prod`) and one for development (`react-dev`).
@y
Open your `compose.yaml` file and define two services: one for production (`react-prod`) and one for development (`react-dev`).
@z

@x
Here’s an example configuration for a React.js application:
@y
Here’s an example configuration for a React.js application:
@z

@x
```yaml
services:
  react-prod:
    build:
      context: .
      dockerfile: Dockerfile
    image: docker-reactjs-sample
    ports:
      - "8080:8080"
@y
```yaml
services:
  react-prod:
    build:
      context: .
      dockerfile: Dockerfile
    image: docker-reactjs-sample
    ports:
      - "8080:8080"
@z

@x
  react-dev:
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
```
@y
  react-dev:
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
```
@z

@x
- The `react-prod` service builds and serves your static production app using Nginx.
- The `react-dev` service runs your React development server with live reload and hot module replacement.
- `watch` triggers file sync with Compose Watch.
@y
- The `react-prod` service builds and serves your static production app using Nginx.
- The `react-dev` service runs your React development server with live reload and hot module replacement.
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
#### Step 3: Update vite.config.ts to ensure it works properly inside Docker
@y
#### Step 3: Update vite.config.ts to ensure it works properly inside Docker
@z

@x
To make Vite’s development server work reliably inside Docker, you need to update your vite.config.ts with the correct settings.
@y
To make Vite’s development server work reliably inside Docker, you need to update your vite.config.ts with the correct settings.
@z

@x
Open the `vite.config.ts` file in your project root and update it as follows:
@y
Open the `vite.config.ts` file in your project root and update it as follows:
@z

@x
```ts
/// <reference types="vitest" />
@y
```ts
/// <reference types="vitest" />
@z

@x
import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
@y
import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
@z

@x
export default defineConfig({
  base: "/",
  plugins: [react()],
  server: {
    host: true,
    port: 5173,
    strictPort: true,
  },
});
```
@y
export default defineConfig({
  base: "/",
  plugins: [react()],
  server: {
    host: true,
    port: 5173,
    strictPort: true,
  },
});
```
@z

@x
> [!NOTE]
> The `server` options in `vite.config.ts` are essential for running Vite inside Docker:
>
> - `host: true` allows the dev server to be accessible from outside the container.
> - `port: 5173` sets a consistent development port (must match the one exposed in Docker).
> - `strictPort: true` ensures Vite fails clearly if the port is unavailable, rather than switching silently.
>
> For full details, refer to the [Vite server configuration docs](https://vitejs.dev/config/server-options.html).
@y
> [!NOTE]
> The `server` options in `vite.config.ts` are essential for running Vite inside Docker:
>
> - `host: true` allows the dev server to be accessible from outside the container.
> - `port: 5173` sets a consistent development port (must match the one exposed in Docker).
> - `strictPort: true` ensures Vite fails clearly if the port is unavailable, rather than switching silently.
>
> For full details, refer to the [Vite server configuration docs](https://vitejs.dev/config/server-options.html).
@z

@x
After completing the previous steps, your project directory should now contain the following files:
@y
After completing the previous steps, your project directory should now contain the following files:
@z

@x
```text
├── docker-reactjs-sample/
│ ├── Dockerfile
│ ├── Dockerfile.dev
│ ├── .dockerignore
│ ├── compose.yaml
│ └── nginx.conf
```
@y
```text
├── docker-reactjs-sample/
│ ├── Dockerfile
│ ├── Dockerfile.dev
│ ├── .dockerignore
│ ├── compose.yaml
│ └── nginx.conf
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
$ docker compose watch react-dev
```
@y
```console
$ docker compose watch react-dev
```
@z

@x
#### Step 5: Test Compose Watch with React
@y
#### Step 5: Test Compose Watch with React
@z

@x
To verify that Compose Watch is working correctly:
@y
To verify that Compose Watch is working correctly:
@z

@x
1. Open the `src/App.tsx` file in your text editor.
@y
1. Open the `src/App.tsx` file in your text editor.
@z

@x
2. Locate the following line:
@y
2. Locate the following line:
@z

@x
   ```html
   <h1>Vite + React</h1>
   ```
@y
   ```html
   <h1>Vite + React</h1>
   ```
@z

@x
3. Change it to:
@y
3. Change it to:
@z

@x
   ```html
   <h1>Hello from Docker Compose Watch</h1>
   ```
@y
   ```html
   <h1>Hello from Docker Compose Watch</h1>
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
---
@y
---
@z

@x
## Run React.js tests in a container
@y
## Run React.js tests in a container
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
Complete all the previous sections of this guide, starting with [Containerize React.js application](#containerize-a-reactjs-application).
@y
Complete all the previous sections of this guide, starting with [Containerize React.js application](#containerize-a-reactjs-application).
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
You’ll use [Vitest](https://vitest.dev) — a blazing fast test runner designed for Vite — along with [Testing Library](https://testing-library.com/) for assertions.
@y
You’ll use [Vitest](https://vitest.dev) — a blazing fast test runner designed for Vite — along with [Testing Library](https://testing-library.com/) for assertions.
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
`docker-reactjs-sample` application includes a sample test file at location:
@y
`docker-reactjs-sample` application includes a sample test file at location:
@z

@x
```console
$ src/App.test.tsx
```
@y
```console
$ src/App.test.tsx
```
@z

@x
This file uses Vitest and React Testing Library to verify the behavior of `App` component.
@y
This file uses Vitest and React Testing Library to verify the behavior of `App` component.
@z

@x
#### Step 1: Install Vitest and React Testing Library
@y
#### Step 1: Install Vitest and React Testing Library
@z

@x
If you haven’t already added the necessary testing tools, install them by running:
@y
If you haven’t already added the necessary testing tools, install them by running:
@z

@x
```console
$ npm install --save-dev vitest @testing-library/react @testing-library/jest-dom jsdom
```
@y
```console
$ npm install --save-dev vitest @testing-library/react @testing-library/jest-dom jsdom
```
@z

@x
Then, update the scripts section of your `package.json` file to include the following:
@y
Then, update the scripts section of your `package.json` file to include the following:
@z

@x
```json
"scripts": {
  "test": "vitest run"
}
```
@y
```json
"scripts": {
  "test": "vitest run"
}
```
@z

@x
---
@y
---
@z

@x
#### Step 2: Configure Vitest
@y
#### Step 2: Configure Vitest
@z

@x
Update `vitest.config.ts` file in your project root with the following configuration:
@y
Update `vitest.config.ts` file in your project root with the following configuration:
@z

@x
```ts {hl_lines="14-18",linenos=true}
/// <reference types="vitest" />
@y
```ts {hl_lines="14-18",linenos=true}
/// <reference types="vitest" />
@z

@x
import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
@y
import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
@z

@x
export default defineConfig({
  base: "/",
  plugins: [react()],
  server: {
    host: true,
    port: 5173,
    strictPort: true,
  },
  test: {
    environment: "jsdom",
    setupFiles: "./src/setupTests.ts",
    globals: true,
  },
});
```
@y
export default defineConfig({
  base: "/",
  plugins: [react()],
  server: {
    host: true,
    port: 5173,
    strictPort: true,
  },
  test: {
    environment: "jsdom",
    setupFiles: "./src/setupTests.ts",
    globals: true,
  },
});
```
@z

@x
> [!NOTE]
> The `test` options in `vitest.config.ts` are essential for reliable testing inside Docker:
>
> - `environment: "jsdom"` simulates a browser-like environment for rendering and DOM interactions.
> - `setupFiles: "./src/setupTests.ts"` loads global configuration or mocks before each test file (optional but recommended).
> - `globals: true` enables global test functions like `describe`, `it`, and `expect` without importing them.
>
> For more details, see the official [Vitest configuration docs](https://vitest.dev/config/).
@y
> [!NOTE]
> The `test` options in `vitest.config.ts` are essential for reliable testing inside Docker:
>
> - `environment: "jsdom"` simulates a browser-like environment for rendering and DOM interactions.
> - `setupFiles: "./src/setupTests.ts"` loads global configuration or mocks before each test file (optional but recommended).
> - `globals: true` enables global test functions like `describe`, `it`, and `expect` without importing them.
>
> For more details, see the official [Vitest configuration docs](https://vitest.dev/config/).
@z

@x
#### Step 3: Update compose.yaml
@y
#### Step 3: Update compose.yaml
@z

@x
Add a new service named `react-test` to your `compose.yaml` file. This service allows you to run your test suite in an isolated containerized environment.
@y
Add a new service named `react-test` to your `compose.yaml` file. This service allows you to run your test suite in an isolated containerized environment.
@z

@x
```yaml {hl_lines="22-26",linenos=true}
services:
  react-dev:
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
```yaml {hl_lines="22-26",linenos=true}
services:
  react-dev:
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
  react-prod:
    build:
      context: .
      dockerfile: Dockerfile
    image: docker-reactjs-sample
    ports:
      - "8080:8080"
@y
  react-prod:
    build:
      context: .
      dockerfile: Dockerfile
    image: docker-reactjs-sample
    ports:
      - "8080:8080"
@z

@x
  react-test:
    build:
      context: .
      dockerfile: Dockerfile.dev
    command: ["npm", "run", "test"]
```
@y
  react-test:
    build:
      context: .
      dockerfile: Dockerfile.dev
    command: ["npm", "run", "test"]
```
@z

@x
The react-test service reuses the same `Dockerfile.dev` used for [development](#use-containers-for-reactjs-development) and overrides the default command to run tests with `npm run test`. This setup ensures a consistent test environment that matches your local development configuration.
@y
The react-test service reuses the same `Dockerfile.dev` used for [development](#use-containers-for-reactjs-development) and overrides the default command to run tests with `npm run test`. This setup ensures a consistent test environment that matches your local development configuration.
@z

@x
After completing the previous steps, your project directory should contain the following files:
@y
After completing the previous steps, your project directory should contain the following files:
@z

@x
```text
├── docker-reactjs-sample/
│ ├── Dockerfile
│ ├── Dockerfile.dev
│ ├── .dockerignore
│ ├── compose.yaml
│ └── nginx.conf
```
@y
```text
├── docker-reactjs-sample/
│ ├── Dockerfile
│ ├── Dockerfile.dev
│ ├── .dockerignore
│ ├── compose.yaml
│ └── nginx.conf
```
@z

@x
#### Step 4: Run the tests
@y
#### Step 4: Run the tests
@z

@x
To execute your test suite inside the container, run the following command from your project root:
@y
To execute your test suite inside the container, run the following command from your project root:
@z

@x
```console
$ docker compose run --rm react-test
```
@y
```console
$ docker compose run --rm react-test
```
@z

@x
This command will:
@y
This command will:
@z

@x
- Start the `react-test` service defined in your `compose.yaml` file.
- Execute the `npm run test` script using the same environment as development.
- Automatically remove the container after the tests complete [`docker compose run --rm`](/reference/cli/docker/compose/run/) command.
@y
- Start the `react-test` service defined in your `compose.yaml` file.
- Execute the `npm run test` script using the same environment as development.
- Automatically remove the container after the tests complete [`docker compose run --rm`](__SUBDIR__/reference/cli/docker/compose/run/) command.
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
### Summary
@y
### Summary
@z

@x
In this section, you learned how to run unit tests for your React.js application inside a Docker container using Vitest and Docker Compose.
@y
In this section, you learned how to run unit tests for your React.js application inside a Docker container using Vitest and Docker Compose.
@z

@x
What you accomplished:
@y
What you accomplished:
@z

@x
- Installed and configured Vitest and React Testing Library for testing React components.
- Created a `react-test` service in `compose.yaml` to isolate test execution.
- Reused the development `Dockerfile.dev` to ensure consistency between dev and test environments.
- Ran tests inside the container using `docker compose run --rm react-test`.
- Ensured reliable, repeatable testing across environments without relying on local machine setup.
@y
- Installed and configured Vitest and React Testing Library for testing React components.
- Created a `react-test` service in `compose.yaml` to isolate test execution.
- Reused the development `Dockerfile.dev` to ensure consistency between dev and test environments.
- Ran tests inside the container using `docker compose run --rm react-test`.
- Ensured reliable, repeatable testing across environments without relying on local machine setup.
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
@y
- [Dockerfile reference](__SUBDIR__/reference/dockerfile/) – Understand all Dockerfile instructions and syntax.
- [Best practices for writing Dockerfiles](__SUBDIR__/develop/develop-images/dockerfile_best-practices/) – Write efficient, maintainable, and secure Dockerfiles.
- [Compose file reference](__SUBDIR__/compose/compose-file/) – Learn the full syntax and options available for configuring services in `compose.yaml`.
- [`docker compose run` CLI reference](__SUBDIR__/reference/cli/docker/compose/run/) – Run one-off commands in a service container.
@z
