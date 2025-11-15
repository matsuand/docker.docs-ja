%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Containerize an Angular Application
linkTitle: Containerize
@y
title: Containerize an Angular Application
linkTitle: Containerize
@z

@x
keywords: angular, node, image, initialize, build
description: Learn how to containerize an Angular application with Docker by creating an optimized, production-ready image using best practices for performance, security, and scalability.
@y
keywords: angular, node, image, initialize, build
description: Learn how to containerize an Angular application with Docker by creating an optimized, production-ready image using best practices for performance, security, and scalability.
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
This guide walks you through the complete process of containerizing an Angular application with Docker. You’ll learn how to create a production-ready Docker image using best practices that improve performance, security, scalability, and deployment efficiency.
@y
This guide walks you through the complete process of containerizing an Angular application with Docker. You’ll learn how to create a production-ready Docker image using best practices that improve performance, security, scalability, and deployment efficiency.
@z

@x
By the end of this guide, you will:
@y
By the end of this guide, you will:
@z

@x
- Containerize an Angular application using Docker.
- Create and optimize a Dockerfile for production builds. 
- Use multi-stage builds to minimize image size.
- Serve the application efficiently with a custom NGINX configuration.
- Build secure and maintainable Docker images by following best practices.
@y
- Containerize an Angular application using Docker.
- Create and optimize a Dockerfile for production builds. 
- Use multi-stage builds to minimize image size.
- Serve the application efficiently with a custom NGINX configuration.
- Build secure and maintainable Docker images by following best practices.
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
Clone the sample application to use with this guide. Open a terminal, navigate to the directory where you want to work, and run the following command
to clone the git repository:
@y
Clone the sample application to use with this guide. Open a terminal, navigate to the directory where you want to work, and run the following command
to clone the git repository:
@z

@x
```console
$ git clone https://github.com/kristiyan-velkov/docker-angular-sample
```
---
@y
```console
$ git clone https://github.com/kristiyan-velkov/docker-angular-sample
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
To begin, navigate to the root of your project directory:
@y
To begin, navigate to the root of your project directory:
@z

@x
```console
$ cd docker-angular-sample
```
@y
```console
$ cd docker-angular-sample
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
You’ll see output similar to:
@y
```console
$ docker init
```
You’ll see output similar to:
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
| What version of Node do you want to use?                   | 23.11.0-alpine  |
| Which package manager do you want to use?                  | npm             |
| Do you want to run "npm run build" before starting server? | yes             |
| What directory is your build output to?                    | dist            |
| What command do you want to use to start the app?          | npm run start   |
| What port does your server listen on?                      | 8080            |
@y
The CLI will prompt you with a few questions about your app setup.
For consistency, please use the same responses shown in the example below when prompted:
| Question                                                   | Answer          |
|------------------------------------------------------------|-----------------|
| What application platform does your project use?           | Node            |
| What version of Node do you want to use?                   | 23.11.0-alpine  |
| Which package manager do you want to use?                  | npm             |
| Do you want to run "npm run build" before starting server? | yes             |
| What directory is your build output to?                    | dist            |
| What command do you want to use to start the app?          | npm run start   |
| What port does your server listen on?                      | 8080            |
@z

@x
After completion, your project directory will contain the following new files:
@y
After completion, your project directory will contain the following new files:
@z

@x
```text
├── docker-angular-sample/
│ ├── Dockerfile
│ ├── .dockerignore
│ ├── compose.yaml
│ └── README.Docker.md
```
@y
```text
├── docker-angular-sample/
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
The default Dockerfile generated by `docker init` serves as a solid starting point for general Node.js applications. However, Angular is a front-end framework that compiles into static assets, so we need to tailor the Dockerfile to optimize for how Angular applications are built and served in a production environment.
@y
The default Dockerfile generated by `docker init` serves as a solid starting point for general Node.js applications. However, Angular is a front-end framework that compiles into static assets, so we need to tailor the Dockerfile to optimize for how Angular applications are built and served in a production environment.
@z

@x
### Step 1: Improve the generated Dockerfile and configuration
@y
### Step 1: Improve the generated Dockerfile and configuration
@z

@x
In this step, you’ll improve the Dockerfile and configuration files by following best practices:
@y
In this step, you’ll improve the Dockerfile and configuration files by following best practices:
@z

@x
- Use multi-stage builds to keep the final image clean and small  
- Serve the app using NGINX, a fast and secure web server  
- Improve performance and security by only including what’s needed  
@y
- Use multi-stage builds to keep the final image clean and small  
- Serve the app using NGINX, a fast and secure web server  
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
Copy and replace the contents of your existing `Dockerfile` with the configuration below:
@y
Copy and replace the contents of your existing `Dockerfile` with the configuration below:
@z

@x
```dockerfile
# =========================================
# Stage 1: Build the Angular Application
# =========================================
# =========================================
# Stage 1: Build the Angular Application
# =========================================
ARG NODE_VERSION=24.7.0-alpine
ARG NGINX_VERSION=alpine3.22
@y
```dockerfile
# =========================================
# Stage 1: Build the Angular Application
# =========================================
# =========================================
# Stage 1: Build the Angular Application
# =========================================
ARG NODE_VERSION=24.7.0-alpine
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
COPY package.json package-lock.json ./
@y
# Copy package-related files first to leverage Docker's caching mechanism
COPY package.json package-lock.json ./
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
# Build the Angular application
RUN npm run build 
@y
# Build the Angular application
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
# Use a built-in non-root user for security best practices
USER nginx
@y
# Use a built-in non-root user for security best practices
USER nginx
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
COPY --chown=nginx:nginx --from=builder /app/dist/*/browser /usr/share/nginx/html
@y
# Copy the static build output from the build stage to Nginx's default HTML serving directory
COPY --chown=nginx:nginx --from=builder /app/dist/*/browser /usr/share/nginx/html
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
@y
# Start Nginx directly with custom config
ENTRYPOINT ["nginx", "-c", "/etc/nginx/nginx.conf"]
CMD ["-g", "daemon off;"]
@z

@x
```
@y
```
@z

@x
> [!NOTE]
> We are using nginx-unprivileged instead of the standard NGINX image to follow security best practices.
> Running as a non-root user in the final image:
>- Reduces the attack surface
>- Aligns with Docker’s recommendations for container hardening
>- Helps comply with stricter security policies in production environments
@y
> [!NOTE]
> We are using nginx-unprivileged instead of the standard NGINX image to follow security best practices.
> Running as a non-root user in the final image:
>- Reduces the attack surface
>- Aligns with Docker’s recommendations for container hardening
>- Helps comply with stricter security policies in production environments
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
# ================================
# Node and build output
# ================================
node_modules
dist
out-tsc
.angular
.cache
.tmp
@y
```dockerignore
# ================================
# Node and build output
# ================================
node_modules
dist
out-tsc
.angular
.cache
.tmp
@z

@x
# ================================
# Testing & Coverage
# ================================
coverage
jest
cypress
cypress/screenshots
cypress/videos
reports
playwright-report
.vite
.vitepress
@y
# ================================
# Testing & Coverage
# ================================
coverage
jest
cypress
cypress/screenshots
cypress/videos
reports
playwright-report
.vite
.vitepress
@z

@x
# ================================
# Environment & log files
# ================================
*.env*
!*.env.production
*.log
*.tsbuildinfo
@y
# ================================
# Environment & log files
# ================================
*.env*
!*.env.production
*.log
*.tsbuildinfo
@z

@x
# ================================
# IDE & OS-specific files
# ================================
.vscode
.idea
.DS_Store
Thumbs.db
*.swp
@y
# ================================
# IDE & OS-specific files
# ================================
.vscode
.idea
.DS_Store
Thumbs.db
*.swp
@z

@x
# ================================
# Version control & CI files
# ================================
.git
.gitignore
@y
# ================================
# Version control & CI files
# ================================
.git
.gitignore
@z

@x
# ================================
# Docker & local orchestration
# ================================
Dockerfile
Dockerfile.*
.dockerignore
docker-compose.yml
docker-compose*.yml
@y
# ================================
# Docker & local orchestration
# ================================
Dockerfile
Dockerfile.*
.dockerignore
docker-compose.yml
docker-compose*.yml
@z

@x
# ================================
# Miscellaneous
# ================================
*.bak
*.old
*.tmp
```
@y
# ================================
# Miscellaneous
# ================================
*.bak
*.old
*.tmp
```
@z

@x
### Step 4: Create the `nginx.conf` file
@y
### Step 4: Create the `nginx.conf` file
@z

@x
To serve your Angular application efficiently inside the container, you’ll configure NGINX with a custom setup. This configuration is optimized for performance, browser caching, gzip compression, and support for client-side routing.
@y
To serve your Angular application efficiently inside the container, you’ll configure NGINX with a custom setup. This configuration is optimized for performance, browser caching, gzip compression, and support for client-side routing.
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
pid /tmp/nginx.pid;
@y
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
    # Logging
    access_log off;
    error_log  /dev/stderr warn;
@y
    # Logging
    access_log off;
    error_log  /dev/stderr warn;
@z

@x
    # Performance
    sendfile        on;
    tcp_nopush      on;
    tcp_nodelay     on;
    keepalive_timeout  65;
    keepalive_requests 1000;
@y
    # Performance
    sendfile        on;
    tcp_nopush      on;
    tcp_nodelay     on;
    keepalive_timeout  65;
    keepalive_requests 1000;
@z

@x
    # Compression
    gzip on;
    gzip_vary on;
    gzip_proxied any;
    gzip_min_length 256;
    gzip_comp_level 6;
    gzip_types
        text/plain
        text/css
        text/xml
        text/javascript
        application/javascript
        application/x-javascript
        application/json
        application/xml
        application/xml+rss
        font/ttf
        font/otf
        image/svg+xml;
@y
    # Compression
    gzip on;
    gzip_vary on;
    gzip_proxied any;
    gzip_min_length 256;
    gzip_comp_level 6;
    gzip_types
        text/plain
        text/css
        text/xml
        text/javascript
        application/javascript
        application/x-javascript
        application/json
        application/xml
        application/xml+rss
        font/ttf
        font/otf
        image/svg+xml;
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
        root /usr/share/nginx/html;
        index index.html;
@y
        root /usr/share/nginx/html;
        index index.html;
@z

@x
        # Angular Routing
        location / {
            try_files $uri $uri/ /index.html;
        }
@y
        # Angular Routing
        location / {
            try_files $uri $uri/ /index.html;
        }
@z

@x
        # Static Assets Caching
        location ~* \.(?:ico|css|js|gif|jpe?g|png|woff2?|eot|ttf|svg|map)$ {
            expires 1y;
            access_log off;
            add_header Cache-Control "public, immutable";
        }
@y
        # Static Assets Caching
        location ~* \.(?:ico|css|js|gif|jpe?g|png|woff2?|eot|ttf|svg|map)$ {
            expires 1y;
            access_log off;
            add_header Cache-Control "public, immutable";
        }
@z

@x
        # Optional: Explicit asset route
        location /assets/ {
            expires 1y;
            add_header Cache-Control "public, immutable";
        }
    }
}
```
@y
        # Optional: Explicit asset route
        location /assets/ {
            expires 1y;
            add_header Cache-Control "public, immutable";
        }
    }
}
```
@z

@x
### Step 5: Build the Angular application image
@y
### Step 5: Build the Angular application image
@z

@x
With your custom configuration in place, you're now ready to build the Docker image for your Angular application.
@y
With your custom configuration in place, you're now ready to build the Docker image for your Angular application.
@z

@x
The updated setup includes:
@y
The updated setup includes:
@z

@x
- The updated setup includes a clean, production-ready NGINX configuration tailored specifically for Angular.
- Efficient multi-stage Docker build, ensuring a small and secure final image.
@y
- The updated setup includes a clean, production-ready NGINX configuration tailored specifically for Angular.
- Efficient multi-stage Docker build, ensuring a small and secure final image.
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
│ ├── .dockerignore
│ ├── compose.yaml
│ ├── nginx.conf
│ └── README.Docker.md
```
@y
```text
├── docker-angular-sample/
│ ├── Dockerfile
│ ├── .dockerignore
│ ├── compose.yaml
│ ├── nginx.conf
│ └── README.Docker.md
```
@z

@x
Now that your Dockerfile is configured, you can build the Docker image for your Angular application.
@y
Now that your Dockerfile is configured, you can build the Docker image for your Angular application.
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
$ docker build --tag docker-angular-sample .
```
@y
```console
$ docker build --tag docker-angular-sample .
```
@z

@x
What this command does:
- Uses the Dockerfile in the current directory (.)
- Packages the application and its dependencies into a Docker image
- Tags the image as docker-angular-sample so you can reference it later
@y
What this command does:
- Uses the Dockerfile in the current directory (.)
- Packages the application and its dependencies into a Docker image
- Tags the image as docker-angular-sample so you can reference it later
@z

@x
#### Step 6:  View local images
@y
#### Step 6:  View local images
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
docker-angular-sample     latest            34e66bdb9d40   14 seconds ago   76.4MB
```
@y
```shell
REPOSITORY                TAG               IMAGE ID       CREATED         SIZE
docker-angular-sample     latest            34e66bdb9d40   14 seconds ago   76.4MB
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
If the build was successful, you should see `docker-angular-sample` image listed. 
@y
If the build was successful, you should see `docker-angular-sample` image listed. 
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
In the previous step, you created a Dockerfile for your Angular application and built a Docker image using the docker build command. Now it’s time to run that image in a container and verify that your application works as expected.
@y
In the previous step, you created a Dockerfile for your Angular application and built a Docker image using the docker build command. Now it’s time to run that image in a container and verify that your application works as expected.
@z

@x
Inside the `docker-angular-sample` directory, run the following command in a
terminal.
@y
Inside the `docker-angular-sample` directory, run the following command in a
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
Open a browser and view the application at [http://localhost:8080](http://localhost:8080). You should see a simple Angular web application.
@y
Open a browser and view the application at [http://localhost:8080](http://localhost:8080). You should see a simple Angular web application.
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
option. Inside the `docker-angular-sample` directory, run the following command
in a terminal.
@y
You can run the application detached from the terminal by adding the `-d`
option. Inside the `docker-angular-sample` directory, run the following command
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
Open a browser and view the application at [http://localhost:8080](http://localhost:8080). You should see your Angular application running in the browser.
@y
Open a browser and view the application at [http://localhost:8080](http://localhost:8080). You should see your Angular application running in the browser.
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
eb13026806d1   docker-angular-sample-server   "nginx -c /etc/nginx…"   About a minute ago  Up About a minute  0.0.0.0:8080->8080/tcp   docker-angular-sample-server-1
```
@y
```shell
CONTAINER ID   IMAGE                          COMMAND                  CREATED             STATUS             PORTS                    NAMES
eb13026806d1   docker-angular-sample-server   "nginx -c /etc/nginx…"   About a minute ago  Up About a minute  0.0.0.0:8080->8080/tcp   docker-angular-sample-server-1
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
> reference](/reference/cli/docker/compose/_index.md).
@y
> [!NOTE]
> For more information about Compose commands, see the [Compose CLI
> reference](reference/cli/docker/compose/_index.md).
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
In this guide, you learned how to containerize, build, and run an Angular application using Docker. By following best practices, you created a secure, optimized, and production-ready setup.
@y
In this guide, you learned how to containerize, build, and run an Angular application using Docker. By following best practices, you created a secure, optimized, and production-ready setup.
@z

@x
What you accomplished:
- Initialized your project using `docker init` to scaffold essential Docker configuration files.
- Replaced the default `Dockerfile` with a multi-stage build that compiles the Angular application and serves the static files using Nginx.
- Replaced the default `.dockerignore` file to exclude unnecessary files and keep the image clean and efficient.
- Built your Docker image using `docker build`.
- Ran the container using `docker compose up`, both in the foreground and in detached mode.
- Verified that the app was running by visiting [http://localhost:8080](http://localhost:8080).
- Learned how to stop the containerized application using `docker compose down`.
@y
What you accomplished:
- Initialized your project using `docker init` to scaffold essential Docker configuration files.
- Replaced the default `Dockerfile` with a multi-stage build that compiles the Angular application and serves the static files using Nginx.
- Replaced the default `.dockerignore` file to exclude unnecessary files and keep the image clean and efficient.
- Built your Docker image using `docker build`.
- Ran the container using `docker compose up`, both in the foreground and in detached mode.
- Verified that the app was running by visiting [http://localhost:8080](http://localhost:8080).
- Learned how to stop the containerized application using `docker compose down`.
@z

@x
You now have a fully containerized Angular application, running in a Docker container, and ready for deployment across any environment with confidence and consistency.
@y
You now have a fully containerized Angular application, running in a Docker container, and ready for deployment across any environment with confidence and consistency.
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
- [`docker init` CLI reference](/reference/cli/docker/init/) – Scaffold Docker assets automatically.
- [`docker build` CLI reference](/reference/cli/docker/build/) – Build Docker images from a Dockerfile.
- [`docker images` CLI reference](/reference/cli/docker/images/) – Manage and inspect local Docker images.
- [`docker compose up` CLI reference](/reference/cli/docker/compose/up/) – Start and run multi-container applications.
- [`docker compose down` CLI reference](/reference/cli/docker/compose/down/) – Stop and remove containers, networks, and volumes.
@y
- [Multi-stage builds](__SUBDIR__/build/building/multi-stage/) – Learn how to separate build and runtime stages.
- [Best practices for writing Dockerfiles](__SUBDIR__/develop/develop-images/dockerfile_best-practices/) – Write efficient, maintainable, and secure Dockerfiles.  
- [Build context in Docker](__SUBDIR__/build/concepts/context/) – Learn how context affects image builds.  
- [`docker init` CLI reference](__SUBDIR__/reference/cli/docker/init/) – Scaffold Docker assets automatically.
- [`docker build` CLI reference](__SUBDIR__/reference/cli/docker/build/) – Build Docker images from a Dockerfile.
- [`docker images` CLI reference](__SUBDIR__/reference/cli/docker/images/) – Manage and inspect local Docker images.
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
With your Angular application now containerized, you're ready to move on to the next step.
@y
With your Angular application now containerized, you're ready to move on to the next step.
@z

@x
In the next section, you'll learn how to develop your application using Docker containers, enabling a consistent, isolated, and reproducible development environment across any machine.
@y
In the next section, you'll learn how to develop your application using Docker containers, enabling a consistent, isolated, and reproducible development environment across any machine.
@z
