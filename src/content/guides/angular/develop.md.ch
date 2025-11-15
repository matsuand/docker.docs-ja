%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Use containers for Angular development
linkTitle: Develop your app
@y
title: Use containers for Angular development
linkTitle: Develop your app
@z

@x
keywords: angular, development, node
description: Learn how to develop your Angular application locally using containers.
@y
keywords: angular, development, node
description: Learn how to develop your Angular application locally using containers.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Complete [Containerize Angular application](containerize.md).
@y
Complete [Containerize Angular application](containerize.md).
@z

@x
## Overview
@y
## Overview
@z

@x
In this section, you'll learn how to set up both production and development environments for your containerized Angular application using Docker Compose. This setup allows you to serve a static production build via Nginx and to develop efficiently inside containers using a live-reloading dev server with Compose Watch.
@y
In this section, you'll learn how to set up both production and development environments for your containerized Angular application using Docker Compose. This setup allows you to serve a static production build via Nginx and to develop efficiently inside containers using a live-reloading dev server with Compose Watch.
@z

@x
You’ll learn how to:
- Configure separate containers for production and development
- Enable automatic file syncing using Compose Watch in development
- Debug and live-preview your changes in real-time without manual rebuilds
@y
You’ll learn how to:
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
Use Compose Watch to automatically sync source file changes into your containerized development environment. This provides a seamless, efficient development experience without restarting or rebuilding containers manually.
@y
Use Compose Watch to automatically sync source file changes into your containerized development environment. This provides a seamless, efficient development experience without restarting or rebuilding containers manually.
@z

@x
## Step 1: Create a development Dockerfile
@y
## Step 1: Create a development Dockerfile
@z

@x
Create a file named `Dockerfile.dev` in your project root with the following content:
@y
Create a file named `Dockerfile.dev` in your project root with the following content:
@z

@x
```dockerfile
# =========================================
# Stage 1: Development - Angular Application
# =========================================
@y
```dockerfile
# =========================================
# Stage 1: Development - Angular Application
# =========================================
@z

@x
# Define the Node.js version to use (Alpine for a small footprint)
ARG NODE_VERSION=24.7.0-alpine
@y
# Define the Node.js version to use (Alpine for a small footprint)
ARG NODE_VERSION=24.7.0-alpine
@z

@x
# Set the base image for development
FROM node:${NODE_VERSION} AS dev
@y
# Set the base image for development
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
# Copy only the dependency files first to optimize Docker caching
COPY package.json package-lock.json ./
@y
# Copy only the dependency files first to optimize Docker caching
COPY package.json package-lock.json ./
@z

@x
# Install dependencies using npm with caching to speed up subsequent builds
RUN --mount=type=cache,target=/root/.npm npm install
@y
# Install dependencies using npm with caching to speed up subsequent builds
RUN --mount=type=cache,target=/root/.npm npm install
@z

@x
# Copy all application source files into the container
COPY . .
@y
# Copy all application source files into the container
COPY . .
@z

@x
# Expose the port Angular uses for the dev server (default is 4200)
EXPOSE 4200
@y
# Expose the port Angular uses for the dev server (default is 4200)
EXPOSE 4200
@z

@x
# Start the Angular dev server and bind it to all network interfaces
CMD ["npm", "start", "--", "--host=0.0.0.0"]
@y
# Start the Angular dev server and bind it to all network interfaces
CMD ["npm", "start", "--", "--host=0.0.0.0"]
@z

@x
```
@y
```
@z

@x
This file sets up a lightweight development environment for your Angular application using the dev server.
@y
This file sets up a lightweight development environment for your Angular application using the dev server.
@z

@x
### Step 2: Update your `compose.yaml` file
@y
### Step 2: Update your `compose.yaml` file
@z

@x
Open your `compose.yaml` file and define two services: one for production (`angular-prod`) and one for development (`angular-dev`).
@y
Open your `compose.yaml` file and define two services: one for production (`angular-prod`) and one for development (`angular-dev`).
@z

@x
Here’s an example configuration for an Angular application:
@y
Here’s an example configuration for an Angular application:
@z

@x
```yaml
services:
  angular-prod:
    build:
      context: .
      dockerfile: Dockerfile
    image: docker-angular-sample
    ports:
      - "8080:8080"
@y
```yaml
services:
  angular-prod:
    build:
      context: .
      dockerfile: Dockerfile
    image: docker-angular-sample
    ports:
      - "8080:8080"
@z

@x
  angular-dev:
    build:
      context: .
      dockerfile: Dockerfile.dev
    ports:
      - "4200:4200"
    develop:
      watch:
        - action: sync
          path: .
          target: /app
```
- The `angular-prod` service builds and serves your static production app using Nginx.
- The `angular-dev` service runs your Angular development server with live reload and hot module replacement.
- `watch` triggers file sync with Compose Watch.
@y
  angular-dev:
    build:
      context: .
      dockerfile: Dockerfile.dev
    ports:
      - "4200:4200"
    develop:
      watch:
        - action: sync
          path: .
          target: /app
```
- The `angular-prod` service builds and serves your static production app using Nginx.
- The `angular-dev` service runs your Angular development server with live reload and hot module replacement.
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

@x
```text
├── docker-angular-sample/
│ ├── Dockerfile
│ ├── Dockerfile.dev
│ ├── .dockerignore
│ ├── compose.yaml
│ ├── nginx.conf
│ └── README.Docker.md
```
@y
```text
├── docker-angular-sample/
│ ├── Dockerfile
│ ├── Dockerfile.dev
│ ├── .dockerignore
│ ├── compose.yaml
│ ├── nginx.conf
│ └── README.Docker.md
```
@z

@x
### Step 4: Start Compose Watch
@y
### Step 4: Start Compose Watch
@z

@x
Run the following command from the project root to start the container in watch mode
@y
Run the following command from the project root to start the container in watch mode
@z

@x
```console
$ docker compose watch angular-dev
```
@y
```console
$ docker compose watch angular-dev
```
@z

@x
### Step 5: Test Compose Watch with Angular
@y
### Step 5: Test Compose Watch with Angular
@z

@x
To verify that Compose Watch is working correctly:
@y
To verify that Compose Watch is working correctly:
@z

@x
1. Open the `src/app/app.component.html` file in your text editor.
@y
1. Open the `src/app/app.component.html` file in your text editor.
@z

@x
2. Locate the following line:
@y
2. Locate the following line:
@z

@x
    ```html
    <h1>Docker Angular Sample Application</h1>
    ```
@y
    ```html
    <h1>Docker Angular Sample Application</h1>
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
5. Open your browser at [http://localhost:4200](http://localhost:4200).
@y
5. Open your browser at [http://localhost:4200](http://localhost:4200).
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
In this section, you set up a complete development and production workflow for your Angular application using Docker and Docker Compose.
@y
In this section, you set up a complete development and production workflow for your Angular application using Docker and Docker Compose.
@z

@x
Here’s what you accomplished:
- Created a `Dockerfile.dev` to streamline local development with hot reloading  
- Defined separate `angular-dev` and `angular-prod` services in your `compose.yaml` file  
- Enabled real-time file syncing using Compose Watch for a smoother development experience  
- Verified that live updates work seamlessly by modifying and previewing a component
@y
Here’s what you accomplished:
- Created a `Dockerfile.dev` to streamline local development with hot reloading  
- Defined separate `angular-dev` and `angular-prod` services in your `compose.yaml` file  
- Enabled real-time file syncing using Compose Watch for a smoother development experience  
- Verified that live updates work seamlessly by modifying and previewing a component
@z

@x
With this setup, you're now equipped to build, run, and iterate on your Angular app entirely within containers—efficiently and consistently across environments.
@y
With this setup, you're now equipped to build, run, and iterate on your Angular app entirely within containers—efficiently and consistently across environments.
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
In the next section, you'll learn how to run unit tests for your Angular application inside Docker containers. This ensures consistent testing across all environments and removes dependencies on local machine setup.
@y
In the next section, you'll learn how to run unit tests for your Angular application inside Docker containers. This ensures consistent testing across all environments and removes dependencies on local machine setup.
@z
