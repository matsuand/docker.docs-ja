%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応
% snip 対応

@x
title: Use containers for Node.js development
linkTitle: Develop your app
@y
title: コンテナーを利用した Node.js 開発
linkTitle: アプリの開発
@z

@x
keywords: node, node.js, development
description: Learn how to develop your Node.js application locally using containers.
@y
keywords: node, node.js, development
description: コンテナーを使ってローカル環境にて Node.js アプリケーションを開発する方法を学びます。
@z

@x
## Prerequisites
@y
## 前提条件 {#prerequisites}
@z

@x
Complete [Containerize a Node.js application](containerize.md).
@y
[Node.js アプリケーションのコンテナー化](containerize.md) を完了していること。
@z

@x
## Overview
@y
## 概要 {#overview}
@z

@x
In this section, you'll learn how to set up a development environment for your containerized application. This includes:
@y
本節ではコンテナー化したアプリケーションに対する開発環境の構築方法を学びます。
ここでは以下を行います。
@z

@x
- Adding a local database and persisting data
- Configuring your container to run a development environment
- Debugging your containerized application
@y
- ローカルデータベースを追加して、そのデータを維持します。
- 開発環境として実行するためにコンテナー設定を行います。
- コンテナー化したアプリケーションのデバッグを行います。
@z

@x
## Add a local database and persist data
@y
## ローカルデータベースの追加とデータ維持 {#add-a-local-database-and-persist-data}
@z

@x
The application uses PostgreSQL for data persistence. Add a database service to your Docker Compose configuration.
@y
The application uses PostgreSQL for data persistence. Add a database service to your Docker Compose configuration.
@z

@x
### Add database service to Docker Compose
@y
### Add database service to Docker Compose
@z

@x
If you haven't already created a `compose.yml` file in the previous section, or if you need to add the database service, update your `compose.yml` file to include the PostgreSQL database service:
@y
If you haven't already created a `compose.yml` file in the previous section, or if you need to add the database service, update your `compose.yml` file to include the PostgreSQL database service:
@z

@x within code
  # ... existing app services ...
@y
  # ... existing app services ...
@z
@x
  # ========================================
  # PostgreSQL Database Service
  # ========================================
@y
  # ========================================
  # PostgreSQL Database Service
  # ========================================
@z
@x
# ========================================
# Volume Configuration
# ========================================
@y
# ========================================
# Volume Configuration
# ========================================
@z
@x
# ========================================
# Network Configuration
# ========================================
@y
# ========================================
# Network Configuration
# ========================================
@z

@x
### Update your application service
@y
### Update your application service
@z

@x
Make sure your application service in `compose.yml` is configured to connect to the database:
@y
Make sure your application service in `compose.yml` is configured to connect to the database:
@z

@x within code
      - '${APP_PORT:-3000}:3000' # API server
      - '${VITE_PORT:-5173}:5173' # Vite dev server
      - '${DEBUG_PORT:-9229}:9229' # Node.js debugger
@y
      - '${APP_PORT:-3000}:3000' # API server
      - '${VITE_PORT:-5173}:5173' # Vite dev server
      - '${DEBUG_PORT:-9229}:9229' # Node.js debugger
@z

@x
1. The PostgreSQL database configuration is handled automatically by the application. The database is created and initialized when the application starts, with data persisted using the `postgres_data` volume.
@y
1. The PostgreSQL database configuration is handled automatically by the application. The database is created and initialized when the application starts, with data persisted using the `postgres_data` volume.
@z

@x
1. Configure your environment by copying the example file:
@y
1. Configure your environment by copying the example file:
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
   DEBUG_PORT=9230
@y
   ```env
   # Application Configuration
   NODE_ENV=development
   APP_PORT=3000
   VITE_PORT=5173
   DEBUG_PORT=9230
@z

@x
   # Database Configuration
   POSTGRES_HOST=db
   POSTGRES_PORT=5432
   POSTGRES_DB=todoapp
   POSTGRES_USER=todoapp
   POSTGRES_PASSWORD=todoapp_password
@y
   # Database Configuration
   POSTGRES_HOST=db
   POSTGRES_PORT=5432
   POSTGRES_DB=todoapp
   POSTGRES_USER=todoapp
   POSTGRES_PASSWORD=todoapp_password
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
1. Run the following command to start your application in development mode:
@y
1. Run the following command to start your application in development mode:
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
1. Open a browser and verify that the application is running at [http://localhost:5173](http://localhost:5173) for the frontend or [http://localhost:3000](http://localhost:3000) for the API. The React frontend is served by Vite dev server on port 5173, with API calls proxied to the Express server on port 3000.
@y
1. Open a browser and verify that the application is running at [http://localhost:5173](http://localhost:5173) for the frontend or [http://localhost:3000](http://localhost:3000) for the API. The React frontend is served by Vite dev server on port 5173, with API calls proxied to the Express server on port 3000.
@z

@x
1. Add some items to the todo list to test data persistence.
@y
1. Add some items to the todo list to test data persistence.
@z

@x
1. After adding some items to the todo list, press `CTRL + C` in the terminal to stop your application.
@y
1. After adding some items to the todo list, press `CTRL + C` in the terminal to stop your application.
@z

@x
1. Run the application again:
   ```console
   $ docker compose up app-dev
   ```
@y
1. Run the application again:
   ```console
   $ docker compose up app-dev
   ```
@z

@x
1. Refresh [http://localhost:5173](http://localhost:5173) in your browser and verify that the todo items persisted, even after the containers were removed and ran again.
@y
1. Refresh [http://localhost:5173](http://localhost:5173) in your browser and verify that the todo items persisted, even after the containers were removed and ran again.
@z

@x
## Configure and run a development container
@y
## Configure and run a development container
@z

@x
You can use a bind mount to mount your source code into the container. The container can then see the changes you make to the code immediately, as soon as you save a file. This means that you can run processes, like nodemon, in the container that watch for filesystem changes and respond to them. To learn more about bind mounts, see [Storage overview](/manuals/engine/storage/_index.md).
@y
You can use a bind mount to mount your source code into the container. The container can then see the changes you make to the code immediately, as soon as you save a file. This means that you can run processes, like nodemon, in the container that watch for filesystem changes and respond to them. To learn more about bind mounts, see [Storage overview](/manuals/engine/storage/_index.md).
@z

@x
In addition to adding a bind mount, you can configure your Dockerfile and `compose.yaml` file to install development dependencies and run development tools.
@y
In addition to adding a bind mount, you can configure your Dockerfile and `compose.yaml` file to install development dependencies and run development tools.
@z

@x
### Update your Dockerfile for development
@y
### Update your Dockerfile for development
@z

@x
Your Dockerfile should be configured as a multi-stage build with separate stages for development, production, and testing. If you followed the previous section, your Dockerfile already includes a development stage that has all development dependencies and runs the application with hot reload enabled.
@y
Your Dockerfile should be configured as a multi-stage build with separate stages for development, production, and testing. If you followed the previous section, your Dockerfile already includes a development stage that has all development dependencies and runs the application with hot reload enabled.
@z

@x
Here's the development stage from your multi-stage Dockerfile:
@y
Here's the development stage from your multi-stage Dockerfile:
@z

@x
```dockerfile {hl_lines="5-26",collapse=true,title=Dockerfile}
# ========================================
# Development Stage
# ========================================
FROM build-deps AS development
@y
```dockerfile {hl_lines="5-26",collapse=true,title=Dockerfile}
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
```
@y
# Start development server
CMD ["npm", "run", "dev:docker"]
```
@z

@x
The development stage:
@y
The development stage:
@z

@x
- Installs all dependencies including dev dependencies
- Exposes ports for the API server (3000), Vite dev server (5173), and Node.js debugger (9229)
- Runs `npm run dev` which starts both the Express server and Vite dev server concurrently
- Includes health checks for monitoring container status
@y
- Installs all dependencies including dev dependencies
- Exposes ports for the API server (3000), Vite dev server (5173), and Node.js debugger (9229)
- Runs `npm run dev` which starts both the Express server and Vite dev server concurrently
- Includes health checks for monitoring container status
@z

@x
Next, you'll need to update your Compose file to use the new stage.
@y
Next, you'll need to update your Compose file to use the new stage.
@z

@x
### Update your Compose file for development
@y
### Update your Compose file for development
@z

@x
Update your `compose.yml` file to run the development stage with bind mounts for hot reloading:
@y
Update your `compose.yml` file to run the development stage with bind mounts for hot reloading:
@z

@x
```yaml {hl_lines=[5,8-10,20-27],collapse=true,title=compose.yml}
services:
  app-dev:
    build:
      context: .
      dockerfile: Dockerfile
      target: development
    container_name: todoapp-dev
    ports:
      - '${APP_PORT:-3000}:3000' # API server
      - '${VITE_PORT:-5173}:5173' # Vite dev server
      - '${DEBUG_PORT:-9229}:9229' # Node.js debugger
    environment:
      NODE_ENV: development
      DOCKER_ENV: 'true'
      POSTGRES_HOST: db
      POSTGRES_PORT: 5432
      POSTGRES_DB: todoapp
      POSTGRES_USER: todoapp
      POSTGRES_PASSWORD: '${POSTGRES_PASSWORD:-todoapp_password}'
      ALLOWED_ORIGINS: '${ALLOWED_ORIGINS:-http://localhost:3000,http://localhost:5173}'
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
            - '**/*.test.*'
            - '**/__tests__/**'
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
```
@y
```yaml {hl_lines=[5,8-10,20-27],collapse=true,title=compose.yml}
services:
  app-dev:
    build:
      context: .
      dockerfile: Dockerfile
      target: development
    container_name: todoapp-dev
    ports:
      - '${APP_PORT:-3000}:3000' # API server
      - '${VITE_PORT:-5173}:5173' # Vite dev server
      - '${DEBUG_PORT:-9229}:9229' # Node.js debugger
    environment:
      NODE_ENV: development
      DOCKER_ENV: 'true'
      POSTGRES_HOST: db
      POSTGRES_PORT: 5432
      POSTGRES_DB: todoapp
      POSTGRES_USER: todoapp
      POSTGRES_PASSWORD: '${POSTGRES_PASSWORD:-todoapp_password}'
      ALLOWED_ORIGINS: '${ALLOWED_ORIGINS:-http://localhost:3000,http://localhost:5173}'
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
            - '**/*.test.*'
            - '**/__tests__/**'
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
```
@z

@x
Key features of the development configuration:
@y
Key features of the development configuration:
@z

@x
- **Multi-port exposure**: API server (3000), Vite dev server (5173), and debugger (9229)
- **Comprehensive bind mounts**: Source code, configuration files, and package files for hot reloading
- **Environment variables**: Configurable through `.env` file or defaults
- **PostgreSQL database**: Production-ready database with persistent storage
- **Docker Compose watch**: Automatic file synchronization and container rebuilds
- **Health checks**: Database health monitoring with automatic dependency management
@y
- **Multi-port exposure**: API server (3000), Vite dev server (5173), and debugger (9229)
- **Comprehensive bind mounts**: Source code, configuration files, and package files for hot reloading
- **Environment variables**: Configurable through `.env` file or defaults
- **PostgreSQL database**: Production-ready database with persistent storage
- **Docker Compose watch**: Automatic file synchronization and container rebuilds
- **Health checks**: Database health monitoring with automatic dependency management
@z

@x
### Run your development container and debug your application
@y
### Run your development container and debug your application
@z

@x
Run the following command to run your application with the development configuration:
@y
Run the following command to run your application with the development configuration:
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
Or with file watching for automatic updates:
@y
Or with file watching for automatic updates:
@z

@x
```console
$ docker compose up app-dev --watch
```
@y
```console
$ docker compose up app-dev --watch
```
@z

@x
For local development without Docker:
@y
For local development without Docker:
@z

@x
```console
$ npm run dev:with-db
```
@y
```console
$ npm run dev:with-db
```
@z

@x
Or start services separately:
@y
Or start services separately:
@z

@x
```console
$ npm run db:start    # Start PostgreSQL container
$ npm run dev         # Start both server and client
```
@y
```console
$ npm run db:start    # Start PostgreSQL container
$ npm run dev         # Start both server and client
```
@z

@x
### Using Task Runner (alternative)
@y
### Using Task Runner (alternative)
@z

@x
The project includes a Taskfile.yml for advanced workflows:
@y
The project includes a Taskfile.yml for advanced workflows:
@z

@x
```console
# Development
$ task dev              # Start development environment
$ task dev:build        # Build development image
$ task dev:run          # Run development container
@y
```console
# Development
$ task dev              # Start development environment
$ task dev:build        # Build development image
$ task dev:run          # Run development container
@z

@x
# Production
$ task build            # Build production image
$ task run              # Run production container
$ task build-run        # Build and run in one step
@y
# Production
$ task build            # Build production image
$ task run              # Run production container
$ task build-run        # Build and run in one step
@z

@x
# Testing
$ task test             # Run all tests
$ task test:unit        # Run unit tests with coverage
$ task test:lint        # Run linting
@y
# Testing
$ task test             # Run all tests
$ task test:unit        # Run unit tests with coverage
$ task test:lint        # Run linting
@z

@x
# Kubernetes
$ task k8s:deploy       # Deploy to Kubernetes
$ task k8s:status       # Check deployment status
$ task k8s:logs         # View pod logs
@y
# Kubernetes
$ task k8s:deploy       # Deploy to Kubernetes
$ task k8s:status       # Check deployment status
$ task k8s:logs         # View pod logs
@z

@x
# Utilities
$ task clean            # Clean up containers and images
$ task health           # Check application health
$ task logs             # View container logs
```
@y
# Utilities
$ task clean            # Clean up containers and images
$ task health           # Check application health
$ task logs             # View container logs
```
@z

@x
The application will start with both the Express API server and Vite development server:
@y
The application will start with both the Express API server and Vite development server:
@z

@x
- **API Server**: [http://localhost:3000](http://localhost:3000) - Express.js backend with REST API
- **Frontend**: [http://localhost:5173](http://localhost:5173) - Vite dev server with hot module replacement
- **Health Check**: [http://localhost:3000/health](http://localhost:3000/health) - Application health status
@y
- **API Server**: [http://localhost:3000](http://localhost:3000) - Express.js backend with REST API
- **Frontend**: [http://localhost:5173](http://localhost:5173) - Vite dev server with hot module replacement
- **Health Check**: [http://localhost:3000/health](http://localhost:3000/health) - Application health status
@z

@x
Any changes to the application's source files on your local machine will now be immediately reflected in the running container thanks to the bind mounts.
@y
Any changes to the application's source files on your local machine will now be immediately reflected in the running container thanks to the bind mounts.
@z

@x
Try making a change to test hot reloading:
@y
Try making a change to test hot reloading:
@z

@x
1. Open `src/client/components/TodoApp.tsx` in an IDE or text editor.
1. Update the main heading text:
@y
1. Open `src/client/components/TodoApp.tsx` in an IDE or text editor.
1. Update the main heading text:
@z

@x
    ```diff
    - <h1 className="text-3xl font-bold text-gray-900 mb-8">
    -   Modern Todo App
    - </h1>
    + <h1 className="text-3xl font-bold text-gray-900 mb-8">
    +   My Todo App
    + </h1>
    ```
@y
    ```diff
    - <h1 className="text-3xl font-bold text-gray-900 mb-8">
    -   Modern Todo App
    - </h1>
    + <h1 className="text-3xl font-bold text-gray-900 mb-8">
    +   My Todo App
    + </h1>
    ```
@z

@x
1. Save the file and the Vite dev server will automatically reload the page with your changes.
@y
1. Save the file and the Vite dev server will automatically reload the page with your changes.
@z

@x
**Debugging support:**
@y
**Debugging support:**
@z

@x
You can connect a debugger to your application on port 9229. The Node.js inspector is enabled with `--inspect=0.0.0.0:9230` in the development script (`dev:server`).
@y
You can connect a debugger to your application on port 9229. The Node.js inspector is enabled with `--inspect=0.0.0.0:9230` in the development script (`dev:server`).
@z

@x
### VS Code debugger setup
@y
### VS Code debugger setup
@z

@x
1. Create a launch configuration in `.vscode/launch.json`:
@y
1. Create a launch configuration in `.vscode/launch.json`:
@z

@x
    ```json
    {
      "version": "0.2.0",
      "configurations": [
        {
          "name": "Attach to Docker Container",
          "type": "node",
          "request": "attach",
          "port": 9229,
          "address": "localhost",
          "localRoot": "${workspaceFolder}",
          "remoteRoot": "/app",
          "protocol": "inspector",
          "restart": true,
          "sourceMaps": true,
          "skipFiles": ["<node_internals>/**"]
        }
      ]
    }
    ```
@y
    ```json
    {
      "version": "0.2.0",
      "configurations": [
        {
          "name": "Attach to Docker Container",
          "type": "node",
          "request": "attach",
          "port": 9229,
          "address": "localhost",
          "localRoot": "${workspaceFolder}",
          "remoteRoot": "/app",
          "protocol": "inspector",
          "restart": true,
          "sourceMaps": true,
          "skipFiles": ["<node_internals>/**"]
        }
      ]
    }
    ```
@z

@x
1. Start your development container:
@y
1. Start your development container:
@z

@x
    ```console
    docker compose up app-dev --build
    ```
@y
    ```console
    docker compose up app-dev --build
    ```
@z

@x
1. Attach the debugger:
   - Open VS Code
   - From the Debug panel (Ctrl/Cmd + Shift + D), select **Attach to Docker Container** from the drop-down
   - Select the green play button or press F5
@y
1. Attach the debugger:
   - Open VS Code
   - From the Debug panel (Ctrl/Cmd + Shift + D), select **Attach to Docker Container** from the drop-down
   - Select the green play button or press F5
@z

@x
### Chrome DevTools (alternative)
@y
### Chrome DevTools (alternative)
@z

@x
You can also use Chrome DevTools for debugging:
@y
You can also use Chrome DevTools for debugging:
@z

@x
1. Start your container (if not already running):
@y
1. Start your container (if not already running):
@z

@x
    ```console
    docker compose up app-dev --build
    ```
@y
    ```console
    docker compose up app-dev --build
    ```
@z

@x
1. Open Chrome and go to `chrome://inspect`.
@y
1. Open Chrome and go to `chrome://inspect`.
@z

@x
1. From the **Configure** option, add:
@y
1. From the **Configure** option, add:
@z

@x
    ```text
    localhost:9229
    ```
@y
    ```text
    localhost:9229
    ```
@z

@x
1. When your Node.js target appears, select **inspect**.
@y
1. When your Node.js target appears, select **inspect**.
@z

@x
### Debugging configuration details
@y
### Debugging configuration details
@z

@x
The debugger configuration:
@y
The debugger configuration:
@z

@x
- **Container port**: 9230 (internal debugger port)
- **Host port**: 9229 (mapped external port)
- **Script**: `tsx watch --inspect=0.0.0.0:9230 src/server/index.ts`
@y
- **Container port**: 9230 (internal debugger port)
- **Host port**: 9229 (mapped external port)
- **Script**: `tsx watch --inspect=0.0.0.0:9230 src/server/index.ts`
@z

@x
The debugger listens on all interfaces (`0.0.0.0`) inside the container on port 9230 and is accessible on port 9229 from your host machine.
@y
The debugger listens on all interfaces (`0.0.0.0`) inside the container on port 9230 and is accessible on port 9229 from your host machine.
@z

@x
### Troubleshooting debugger connection
@y
### Troubleshooting debugger connection
@z

@x
If the debugger doesn't connect:
@y
If the debugger doesn't connect:
@z

@x
1. Check if the container is running:
@y
1. Check if the container is running:
@z

@x
    ```console
    docker ps
    ```
@y
    ```console
    docker ps
    ```
@z

@x
1. Check if the port is exposed:
@y
1. Check if the port is exposed:
@z

@x
    ```console
    docker port todoapp-dev
    ```
@y
    ```console
    docker port todoapp-dev
    ```
@z

@x
1. Check container logs:
@y
1. Check container logs:
@z

@x
    ```console
    docker compose logs app-dev
    ```
@y
    ```console
    docker compose logs app-dev
    ```
@z

@x
    You should see a message like:
@y
    You should see a message like:
@z

@x
    ```text
    Debugger listening on ws://0.0.0.0:9230/...
    ```
@y
    ```text
    Debugger listening on ws://0.0.0.0:9230/...
    ```
@z

@x
Now you can set breakpoints in your TypeScript source files and debug your containerized Node.js application.
@y
Now you can set breakpoints in your TypeScript source files and debug your containerized Node.js application.
@z

@x
For more details about Node.js debugging, see the [Node.js documentation](https://nodejs.org/en/docs/guides/debugging-getting-started).
@y
For more details about Node.js debugging, see the [Node.js documentation](https://nodejs.org/en/docs/guides/debugging-getting-started).
@z

@x
## Summary
@y
## Summary
@z

@x
You've set up your Compose file with a PostgreSQL database and data persistence. You also created a multi-stage Dockerfile and configured bind mounts for development.
@y
You've set up your Compose file with a PostgreSQL database and data persistence. You also created a multi-stage Dockerfile and configured bind mounts for development.
@z

@x
Related information:
@y
Related information:
@z

@x
- [Volumes top-level element](/reference/compose-file/volumes/)
- [Services top-level element](/reference/compose-file/services/)
- [Multi-stage builds](/manuals/build/building/multi-stage.md)
@y
- [Volumes top-level element](/reference/compose-file/volumes/)
- [Services top-level element](/reference/compose-file/services/)
- [Multi-stage builds](/manuals/build/building/multi-stage.md)
@z

@x
## Next steps
@y
## Next steps
@z

@x
In the next section, you'll learn how to run unit tests using Docker.
@y
In the next section, you'll learn how to run unit tests using Docker.
@z
