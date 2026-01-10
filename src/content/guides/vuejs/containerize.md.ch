%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Containerize an Vue.js Application
linkTitle: Containerize
@y
title: Containerize an Vue.js Application
linkTitle: Containerize
@z

@x
keywords: vue.js, vue, js, node, image, initialize, build
description: Learn how to containerize an Vue.js application with Docker by creating an optimized, production-ready image using best practices for performance, security, and scalability.
@y
keywords: vue.js, vue, js, node, image, initialize, build
description: Learn how to containerize an Vue.js application with Docker by creating an optimized, production-ready image using best practices for performance, security, and scalability.
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
## Overview
@y
## Overview
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
## Get the sample application
@y
## Get the sample application
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
To begin, navigate to the root of your project directory:
@y
To begin, navigate to the root of your project directory:
@z

% snip command...

@x
Then run the following command:
@y
Then run the following command:
@z

% snip command...

@x
You’ll see output similar to:
@y
You’ll see output similar to:
@z

% snip output...

@x
The CLI will prompt you with a few questions about your app setup.
For consistency, please use the same responses shown in the example below when prompted:
| Question                                                   | Answer          |
|------------------------------------------------------------|-----------------|
| What application platform does your project use?           | Node            |
| What version of Node do you want to use?                   | 24.12.0-alpine  |
| Which package manager do you want to use?                  | npm             |
| Do you want to run "npm run build" before starting server? | yes             |
| What directory is your build output to?                    | dist            |
| What command do you want to use to start the app?          | npm run build   |
| What port does your server listen on?                      | 8080            |
@y
The CLI will prompt you with a few questions about your app setup.
For consistency, please use the same responses shown in the example below when prompted:
| Question                                                   | Answer          |
|------------------------------------------------------------|-----------------|
| What application platform does your project use?           | Node            |
| What version of Node do you want to use?                   | 24.12.0-alpine |
| Which package manager do you want to use?                  | npm             |
| Do you want to run "npm run build" before starting server? | yes             |
| What directory is your build output to?                    | dist            |
| What command do you want to use to start the app?          | npm run build   |
| What port does your server listen on?                      | 8080            |
@z

@x
After completion, your project directory will contain the following new files:
@y
After completion, your project directory will contain the following new files:
@z

% snip text...

@x
## Build the Docker image
@y
## Build the Docker image
@z

@x
The default Dockerfile generated by `docker init` provides a solid foundation for typical Node.js applications. However, Vue.js is a front-end framework that compiles into static assets, which means the Dockerfile needs to be customized to align with how Vue.js applications are built and efficiently served in a production environment. Tailoring it properly ensures better performance, smaller image sizes, and a smoother deployment process.
@y
The default Dockerfile generated by `docker init` provides a solid foundation for typical Node.js applications. However, Vue.js is a front-end framework that compiles into static assets, which means the Dockerfile needs to be customized to align with how Vue.js applications are built and efficiently served in a production environment. Tailoring it properly ensures better performance, smaller image sizes, and a smoother deployment process.
@z

@x
### Step 1: Review the generated files
@y
### Step 1: Review the generated files
@z

@x
In this step, you’ll improve the Dockerfile and configuration files by following best practices:
@y
In this step, you’ll improve the Dockerfile and configuration files by following best practices:
@z

@x
- Use multi-stage builds to keep the final image clean and small  
- Serve the app using Nginx, a fast and secure web server  
- Improve performance and security by only including what’s needed  
@y
- Use multi-stage builds to keep the final image clean and small  
- Serve the app using Nginx, a fast and secure web server  
- Improve performance and security by only including what’s needed  
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
### Step 2: Configure the Dockerfile
@y
### Step 2: Configure the Dockerfile
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
Docker Hardened Images (DHIs) are available for Node.js in the [Docker Hardened Images catalog](https://hub.docker.com/hardened-images/catalog/dhi/node). Docker Hardened Images are freely available to everyone with no subscription required. You can pull and use them like any other Docker image after signing in to the DHI registry. For more information, see the [DHI quickstart](/dhi/get-started/) guide.
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

@x within code
# Stage 1: Build the Vue.js Application
@y
@z
@x
# Use a lightweight DHI Node.js image for building
@y
# Use a lightweight DHI Node.js image for building
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
# Install project dependencies using npm ci (ensures a clean, reproducible install)
@y
# Install project dependencies using npm ci (ensures a clean, reproducible install)
@z
@x
# Copy the rest of the application source code into the container
@y
# Copy the rest of the application source code into the container
@z
@x
# Build the Vue.js application
@y
# Build the Vue.js application
@z
@x
# Stage 2: Prepare Nginx to Serve Static Files
@y
# Stage 2: Prepare Nginx to Serve Static Files
@z
@x
# Copy custom Nginx config
@y
# Copy custom Nginx config
@z
@x
# Copy the static build output from the build stage to Nginx's default HTML serving directory
@y
# Copy the static build output from the build stage to Nginx's default HTML serving directory
@z
@x
# Use a built-in non-root user for security best practices
@y
# Use a built-in non-root user for security best practices
@z
@x
# Expose port 8080 to allow HTTP traffic
# Note: The default Nginx container now listens on port 8080 instead of 80 
@y
# Expose port 8080 to allow HTTP traffic
# Note: The default Nginx container now listens on port 8080 instead of 80 
@z
@x
# Start Nginx directly with custom config
@y
# Start Nginx directly with custom config
@z

@x
{{< /tab >}}
{{< tab name="Using the Docker Official Image" >}}
@y
{{< /tab >}}
{{< tab name="Using the Docker Official Image" >}}
@z

@x
Replace the contents of your current `Dockerfile` with the optimized configuration below. This setup is tailored specifically for building and serving Vue.js applications in a clean, efficient, and production-ready environment.
@y
Replace the contents of your current `Dockerfile` with the optimized configuration below. This setup is tailored specifically for building and serving Vue.js applications in a clean, efficient, and production-ready environment.
@z

@x within code
# Stage 1: Build the Vue.js Application
@y
# Stage 1: Build the Vue.js Application
@z
@x
# Use a lightweight Node.js image for building (customizable via ARG)
@y
# Use a lightweight Node.js image for building (customizable via ARG)
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
# Install project dependencies using npm ci (ensures a clean, reproducible install)
@y
# Install project dependencies using npm ci (ensures a clean, reproducible install)
@z
@x
# Copy the rest of the application source code into the container
@y
# Copy the rest of the application source code into the container
@z
@x
# Build the Vue.js application
@y
# Build the Vue.js application
@z
@x
# Stage 2: Prepare Nginx to Serve Static Files
@y
# Stage 2: Prepare Nginx to Serve Static Files
@z
@x
# Copy custom Nginx config
@y
# Copy custom Nginx config
@z
@x
# Copy the static build output from the build stage to Nginx's default HTML serving directory
@y
# Copy the static build output from the build stage to Nginx's default HTML serving directory
@z
@x
# Use a built-in non-root user for security best practices
@y
# Use a built-in non-root user for security best practices
@z
@x
# Expose port 8080 to allow HTTP traffic
# Note: The default Nginx container now listens on port 8080 instead of 80 
@y
# Expose port 8080 to allow HTTP traffic
# Note: The default Nginx container now listens on port 8080 instead of 80 
@z
@x
# Start Nginx directly with custom config
@y
# Start Nginx directly with custom config
@z

@x
> [!NOTE]
> We are using nginx-unprivileged instead of the standard Nginx image to follow security best practices.
> Running as a non-root user in the final image:
>- Reduces the attack surface
>- Aligns with Docker’s recommendations for container hardening
>- Helps comply with stricter security policies in production environments
@y
> [!NOTE]
> We are using nginx-unprivileged instead of the standard Nginx image to follow security best practices.
> Running as a non-root user in the final image:
>- Reduces the attack surface
>- Aligns with Docker’s recommendations for container hardening
>- Helps comply with stricter security policies in production environments
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z

@x
### Step 3: Configure the .dockerignore file
@y
### Step 3: Configure the .dockerignore file
@z

@x
The `.dockerignore` file plays a crucial role in optimizing your Docker image by specifying which files and directories should be excluded from the build context. 
@y
The `.dockerignore` file plays a crucial role in optimizing your Docker image by specifying which files and directories should be excluded from the build context. 
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
> To learn more, visit the [.dockerignore reference](/reference/dockerfile.md#dockerignore-file).
@z

@x
Copy and replace the contents of your existing `.dockerignore` with the configuration below:
@y
Copy and replace the contents of your existing `.dockerignore` with the configuration below:
@z

@x within code
# Dependency directories
@y
# Dependency directories
@z
@x
# Production and build outputs
@y
# Production and build outputs
@z
@x
# Vite, VuePress, and cache dirs
@y
# Vite, VuePress, and cache dirs
@z
@x
# Test output and coverage
@y
# Test output and coverage
@z
@x
# Environment and config files
@y
# Environment and config files
@z
@x
!.env.production    # Keep production env if needed
@y
!.env.production    # Keep production env if needed
@z
@x
# TypeScript artifacts
@y
# TypeScript artifacts
@z
@x
# Editor and IDE config
@y
# Editor and IDE config
@z
@x
# System files
@y
# System files
@z
@x
# Lockfiles (optional)
@y
# Lockfiles (optional)
@z
@x
# Git files
@y
# Git files
@z
@x
# Docker-related files
@y
# Docker-related files
@z

@x
### Step 4: Create the `nginx.conf` file
@y
### Step 4: Create the `nginx.conf` file
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

% snip code...

@x
### Step 5: Build the Vue.js application image
@y
### Step 5: Build the Vue.js application image
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
> The `docker build` command packages your application into an image using the instructions in the Dockerfile. It includes all necessary files from the current directory (called the [build context](/build/concepts/context/#what-is-a-build-context)).
@z

@x
Run the following command from the root of your project:
@y
Run the following command from the root of your project:
@z

% snip command...

@x
What this command does:
- Uses the Dockerfile in the current directory (.)
- Packages the application and its dependencies into a Docker image
- Tags the image as docker-vuejs-sample so you can reference it later
@y
What this command does:
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
After building your Docker image, you can check which images are available on your local machine using either the Docker CLI or [Docker Desktop](/manuals/desktop/use-desktop/images.md). Since you're already working in the terminal, let's use the Docker CLI.
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
## Run the containerized application
@y
## Run the containerized application
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
### Run the application in the background
@y
### Run the application in the background
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
> reference](/reference/cli/docker/compose/_index.md).
@y
> [!NOTE]
> For more information about Compose commands, see the [Compose CLI
> reference](/reference/cli/docker/compose/_index.md).
@z

@x
## Summary
@y
## Summary
@z

@x
In this guide, you learned how to containerize, build, and run an Vue.js application using Docker. By following best practices, you created a secure, optimized, and production-ready setup.
@y
In this guide, you learned how to containerize, build, and run an Vue.js application using Docker. By following best practices, you created a secure, optimized, and production-ready setup.
@z

@x
What you accomplished:
- Initialized your project using `docker init` to scaffold essential Docker configuration files.
- Replaced the default `Dockerfile` with a multi-stage build that compiles the Vue.js application and serves the static files using Nginx.
- Replaced the default `.dockerignore` file to exclude unnecessary files and keep the image clean and efficient.
- Built your Docker image using `docker build`.
- Ran the container using `docker compose up`, both in the foreground and in detached mode.
- Verified that the app was running by visiting [http://localhost:8080](http://localhost:8080).
- Learned how to stop the containerized application using `docker compose down`.
@y
What you accomplished:
- Initialized your project using `docker init` to scaffold essential Docker configuration files.
- Replaced the default `Dockerfile` with a multi-stage build that compiles the Vue.js application and serves the static files using Nginx.
- Replaced the default `.dockerignore` file to exclude unnecessary files and keep the image clean and efficient.
- Built your Docker image using `docker build`.
- Ran the container using `docker compose up`, both in the foreground and in detached mode.
- Verified that the app was running by visiting [http://localhost:8080](http://localhost:8080).
- Learned how to stop the containerized application using `docker compose down`.
@z

@x
You now have a fully containerized Vue.js application, running in a Docker container, and ready for deployment across any environment with confidence and consistency.
@y
You now have a fully containerized Vue.js application, running in a Docker container, and ready for deployment across any environment with confidence and consistency.
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
- [`docker init` CLI reference](/reference/cli/docker/init/) – Scaffold Docker assets automatically.
- [`docker build` CLI reference](/reference/cli/docker/build/) – Build Docker images from a Dockerfile.
- [`docker images` CLI reference](/reference/cli/docker/images/) – Manage and inspect local Docker images.
- [`docker compose up` CLI reference](/reference/cli/docker/compose/up/) – Start and run multi-container applications.
- [`docker compose down` CLI reference](/reference/cli/docker/compose/down/) – Stop and remove containers, networks, and volumes.
@y
- [Multi-stage builds](/build/building/multi-stage/) – Learn how to separate build and runtime stages.
- [Best practices for writing Dockerfiles](/develop/develop-images/dockerfile_best-practices/) – Write efficient, maintainable, and secure Dockerfiles.  
- [Build context in Docker](/build/concepts/context/) – Learn how context affects image builds.  
- [`docker init` CLI reference](/reference/cli/docker/init/) – Scaffold Docker assets automatically.
- [`docker build` CLI reference](/reference/cli/docker/build/) – Build Docker images from a Dockerfile.
- [`docker images` CLI reference](/reference/cli/docker/images/) – Manage and inspect local Docker images.
- [`docker compose up` CLI reference](/reference/cli/docker/compose/up/) – Start and run multi-container applications.
- [`docker compose down` CLI reference](/reference/cli/docker/compose/down/) – Stop and remove containers, networks, and volumes.
@z

@x
## Next steps
@y
## Next steps
@z

@x
With your Vue.js application now containerized, you're ready to move on to the next step.
@y
With your Vue.js application now containerized, you're ready to move on to the next step.
@z

@x
In the next section, you'll learn how to develop your application using Docker containers, enabling a consistent, isolated, and reproducible development environment across any machine.
@y
In the next section, you'll learn how to develop your application using Docker containers, enabling a consistent, isolated, and reproducible development environment across any machine.
@z
