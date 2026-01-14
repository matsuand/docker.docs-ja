%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Use containers for React.js development
linkTitle: Develop your app
@y
title: Use containers for React.js development
linkTitle: Develop your app
@z

@x
keywords: react.js, development, node
description: Learn how to develop your React.js application locally using containers.
@y
keywords: react.js, development, node
description: Learn how to develop your React.js application locally using containers.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Complete [Containerize React.js application](containerize.md).
@y
Complete [Containerize React.js application](containerize.md).
@z

@x
## Overview
@y
## Overview
@z

@x
In this section, you'll learn how to set up both production and development environments for your containerized React.js application using Docker Compose. This setup allows you to serve a static production build via Nginx and to develop efficiently inside containers using a live-reloading dev server with Compose Watch.
@y
In this section, you'll learn how to set up both production and development environments for your containerized React.js application using Docker Compose. This setup allows you to serve a static production build via Nginx and to develop efficiently inside containers using a live-reloading dev server with Compose Watch.
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
## Automatically update services (Development Mode)
@y
## Automatically update services (Development Mode)
@z

@x
Use Compose Watch to automatically sync source file changes into your containerized development environment. This provides a seamless, efficient development experience without needing to restart or rebuild containers manually.
@y
Use Compose Watch to automatically sync source file changes into your containerized development environment. This provides a seamless, efficient development experience without needing to restart or rebuild containers manually.
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
### Step 2: Update your `compose.yaml` file
@y
### Step 2: Update your `compose.yaml` file
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
@z

@x
```
- The `react-prod` service builds and serves your static production app using Nginx.
- The `react-dev` service runs your React development server with live reload and hot module replacement.
- `watch` triggers file sync with Compose Watch.
@y
```
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
### Step 3: Update vite.config.ts to ensure it works properly inside Docker
@y
### Step 3: Update vite.config.ts to ensure it works properly inside Docker
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
> - `host: true` allows the dev server to be accessible from outside the container.
> - `port: 5173` sets a consistent development port (must match the one exposed in Docker).
> - `strictPort: true` ensures Vite fails clearly if the port is unavailable, rather than switching silently.
> 
> For full details, refer to the [Vite server configuration docs](https://vitejs.dev/config/server-options.html).
@y
> [!NOTE]
> The `server` options in `vite.config.ts` are essential for running Vite inside Docker:
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
│ ├── nginx.conf
│ └── README.Docker.md
```
@y
```text
├── docker-reactjs-sample/
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
### Step 5: Test Compose Watch with React
@y
### Step 5: Test Compose Watch with React
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
## Summary
@y
## Summary
@z

@x
In this section, you set up a complete development and production workflow for your React.js application using Docker and Docker Compose.
@y
In this section, you set up a complete development and production workflow for your React.js application using Docker and Docker Compose.
@z

@x
Here's what you achieved:
- Created a `Dockerfile.dev` to streamline local development with hot reloading  
- Defined separate `react-dev` and `react-prod` services in your `compose.yaml` file  
- Enabled real-time file syncing using Compose Watch for a smoother development experience  
- Verified that live updates work seamlessly by modifying and previewing a component
@y
Here's what you achieved:
- Created a `Dockerfile.dev` to streamline local development with hot reloading  
- Defined separate `react-dev` and `react-prod` services in your `compose.yaml` file  
- Enabled real-time file syncing using Compose Watch for a smoother development experience  
- Verified that live updates work seamlessly by modifying and previewing a component
@z

@x
With this setup, you're now equipped to build, run, and iterate on your React.js app entirely within containers—efficiently and consistently across environments.
@y
With this setup, you're now equipped to build, run, and iterate on your React.js app entirely within containers—efficiently and consistently across environments.
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
In the next section, you'll learn how to run unit tests for your React.js application inside Docker containers. This ensures consistent testing across all environments and removes dependencies on local machine setup.
@y
In the next section, you'll learn how to run unit tests for your React.js application inside Docker containers. This ensures consistent testing across all environments and removes dependencies on local machine setup.
@z
