%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Use containers for Vue.js development
linkTitle: Develop your app
@y
title: Use containers for Vue.js development
linkTitle: Develop your app
@z

@x
keywords: vuejs, development, node
description: Learn how to develop your Vue.js application locally using containers.
@y
keywords: vuejs, development, node
description: Learn how to develop your Vue.js application locally using containers.
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
Complete [Containerize Vue.js application](containerize.md).
@y
Complete [Containerize Vue.js application](containerize.md).
@z

@x
## Overview
@y
## Overview
@z

@x
In this section, you'll set up both production and development environments for your Vue.js application using Docker Compose. This approach streamlines your workflow—delivering a lightweight, static site via Nginx in production, and providing a fast, live-reloading dev server with Compose Watch for efficient local development.
@y
In this section, you'll set up both production and development environments for your Vue.js application using Docker Compose. This approach streamlines your workflow—delivering a lightweight, static site via Nginx in production, and providing a fast, live-reloading dev server with Compose Watch for efficient local development.
@z

@x
You’ll learn how to:
- Configure isolated environments: Set up separate containers optimized for production and development use cases.
- Live-reload in development: Use Compose Watch to automatically sync file changes, enabling real-time updates without manual intervention.
- Preview and debug with ease: Develop inside containers with a seamless preview and debug experience—no rebuilds required after every change.
@y
You’ll learn how to:
- Configure isolated environments: Set up separate containers optimized for production and development use cases.
- Live-reload in development: Use Compose Watch to automatically sync file changes, enabling real-time updates without manual intervention.
- Preview and debug with ease: Develop inside containers with a seamless preview and debug experience—no rebuilds required after every change.
@z

@x
## Automatically update services (Development Mode)
@y
## Automatically update services (Development Mode)
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
## Step 1: Create a development Dockerfile
@y
## Step 1: Create a development Dockerfile
@z

@x
Create a file named `Dockerfile.dev` in your project root with the following content:
@y
Create a file named `Dockerfile.dev` in your project root with the following content:
@z

@x within code
# Stage 1: Develop the Vue.js Application
@y
# Stage 1: Develop the Vue.js Application
@z
@x
# Use a lightweight Node.js image for development
@y
# Use a lightweight Node.js image for development
@z
@x
# Set environment variable to indicate development mode
@y
# Set environment variable to indicate development mode
@z
@x
# Set the working directory inside the container
@y
# Set the working directory inside the container
@z
@x
# Copy package-related files first to leverage Docker's caching mechanism
@y
# Copy package-related files first to leverage Docker's caching mechanism
@z
@x
# Install project dependencies
@y
# Install project dependencies
@z
@x
# Copy the rest of the application source code into the container
@y
# Copy the rest of the application source code into the container
@z
@x
# Change ownership of the application directory to the node user
@y
# Change ownership of the application directory to the node user
@z
@x
# Switch to the node user
@y
# Switch to the node user
@z
@x
# Expose the port used by the Vite development server
@y
# Expose the port used by the Vite development server
@z
@x
# Use a default command, can be overridden in Docker compose.yml file
@y
# Use a default command, can be overridden in Docker compose.yml file
@z

@x
This file sets up a lightweight development environment for your Vue.js application using the dev server.
@y
This file sets up a lightweight development environment for your Vue.js application using the dev server.
@z

@x
### Step 2: Update your `compose.yaml` file
@y
### Step 2: Update your `compose.yaml` file
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

% snip code...

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
### Step 4: Start Compose Watch
@y
### Step 4: Start Compose Watch
@z

@x
Run the following command from the project root to start the container in watch mode
@y
Run the following command from the project root to start the container in watch mode
@z

% snip command...

@x
### Step 5: Test Compose Watch with Vue.js
@y
### Step 5: Test Compose Watch with Vue.js
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
## Summary
@y
## Summary
@z

@x
In this section, you set up a complete development and production workflow for your Vue.js application using Docker and Docker Compose.
@y
In this section, you set up a complete development and production workflow for your Vue.js application using Docker and Docker Compose.
@z

@x
Here’s what you accomplished:
- Created a `Dockerfile.dev` to streamline local development with hot reloading  
- Defined separate `vuejs-dev` and `vuejs-prod` services in your `compose.yaml` file  
- Enabled real-time file syncing using Compose Watch for a smoother development experience  
- Verified that live updates work seamlessly by modifying and previewing a component
@y
Here’s what you accomplished:
- Created a `Dockerfile.dev` to streamline local development with hot reloading  
- Defined separate `vuejs-dev` and `vuejs-prod` services in your `compose.yaml` file  
- Enabled real-time file syncing using Compose Watch for a smoother development experience  
- Verified that live updates work seamlessly by modifying and previewing a component
@z

@x
With this setup, you're now equipped to build, run, and iterate on your Vue.js app entirely within containers—efficiently and consistently across environments.
@y
With this setup, you're now equipped to build, run, and iterate on your Vue.js app entirely within containers—efficiently and consistently across environments.
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
In the next section, you'll learn how to run unit tests for your Vue.js application inside Docker containers. This ensures consistent testing across all environments and removes dependencies on local machine setup.
@y
In the next section, you'll learn how to run unit tests for your Vue.js application inside Docker containers. This ensures consistent testing across all environments and removes dependencies on local machine setup.
@z
