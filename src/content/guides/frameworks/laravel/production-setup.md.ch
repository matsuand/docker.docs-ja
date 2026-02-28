%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Laravel Production Setup with Docker Compose
description: Set up a production-ready environment for Laravel using Docker Compose.
@y
title: Laravel Production Setup with Docker Compose
description: Set up a production-ready environment for Laravel using Docker Compose.
@z

@x
This guide demonstrates how to set up a production-ready Laravel environment using Docker and Docker Compose. This configuration is designed for streamlined, scalable, and secure Laravel application deployments.
@y
This guide demonstrates how to set up a production-ready Laravel environment using Docker and Docker Compose. This configuration is designed for streamlined, scalable, and secure Laravel application deployments.
@z

@x
> [!NOTE]
> To experiment with a ready-to-run configuration, download the [Laravel Docker Examples](https://github.com/dockersamples/laravel-docker-examples) repository. It contains pre-configured setups for both development and production.
@y
> [!NOTE]
> To experiment with a ready-to-run configuration, download the [Laravel Docker Examples](https://github.com/dockersamples/laravel-docker-examples) repository. It contains pre-configured setups for both development and production.
@z

@x
## Project structure
@y
## Project structure
@z

% snip text...

@x
This layout represents a typical Laravel project, with Docker configurations stored in a unified `docker` directory. You’ll find **two** Compose files — `compose.dev.yaml` (for development) and `compose.prod.yaml` (for production) — to keep your environments separate and manageable.
@y
This layout represents a typical Laravel project, with Docker configurations stored in a unified `docker` directory. You’ll find **two** Compose files — `compose.dev.yaml` (for development) and `compose.prod.yaml` (for production) — to keep your environments separate and manageable.
@z

@x
## Create a Dockerfile for PHP-FPM (production)
@y
## Create a Dockerfile for PHP-FPM (production)
@z

@x
For production, the `php-fpm` Dockerfile creates an optimized image with only the PHP extensions and libraries your application needs. As demonstrated in the [GitHub example](https://github.com/dockersamples/laravel-docker-examples), a single Dockerfile with multi-stage builds maintains consistency and reduces duplication between development and production. The following snippet shows only the production-related stages:
@y
For production, the `php-fpm` Dockerfile creates an optimized image with only the PHP extensions and libraries your application needs. As demonstrated in the [GitHub example](https://github.com/dockersamples/laravel-docker-examples), a single Dockerfile with multi-stage builds maintains consistency and reduces duplication between development and production. The following snippet shows only the production-related stages:
@z

@x within code
# Stage 1: Build environment and Composer dependencies
@y
# Stage 1: Build environment and Composer dependencies
@z
@x
# Install system dependencies and PHP extensions for Laravel with MySQL/PostgreSQL support.
# Dependencies in this stage are only required for building the final image.
# Node.js and asset building are handled in the Nginx stage, not here.
@y
# Install system dependencies and PHP extensions for Laravel with MySQL/PostgreSQL support.
# Dependencies in this stage are only required for building the final image.
# Node.js and asset building are handled in the Nginx stage, not here.
@z
@x
# Set the working directory inside the container
@y
# Set the working directory inside the container
@z
@x
# Copy the entire Laravel application code into the container
# -----------------------------------------------------------
# In Laravel, `composer install` may trigger scripts
# needing access to application code.
# For example, the `post-autoload-dump` event might execute
# Artisan commands like `php artisan package:discover`. If the
# application code (including the `artisan` file) is not
# present, these commands will fail, leading to build errors.
#
# By copying the entire application code before running
# `composer install`, we ensure that all necessary files are
# available, allowing these scripts to run successfully.
# In other cases, it would be possible to copy composer files
# first, to leverage Docker's layer caching mechanism.
# -----------------------------------------------------------
@y
# Copy the entire Laravel application code into the container
# -----------------------------------------------------------
# In Laravel, `composer install` may trigger scripts
# needing access to application code.
# For example, the `post-autoload-dump` event might execute
# Artisan commands like `php artisan package:discover`. If the
# application code (including the `artisan` file) is not
# present, these commands will fail, leading to build errors.
#
# By copying the entire application code before running
# `composer install`, we ensure that all necessary files are
# available, allowing these scripts to run successfully.
# In other cases, it would be possible to copy composer files
# first, to leverage Docker's layer caching mechanism.
# -----------------------------------------------------------
@z
@x
# Install Composer and dependencies
@y
# Install Composer and dependencies
@z
@x
# Stage 2: Production environment
@y
# Stage 2: Production environment
@z
@x
# Install only runtime libraries needed in production
# libfcgi-bin and procps are required for the php-fpm-healthcheck script
@y
# Install only runtime libraries needed in production
# libfcgi-bin and procps are required for the php-fpm-healthcheck script
@z
@x
# Download and install php-fpm health check script
@y
# Download and install php-fpm health check script
@z
@x
# Copy the initialization script
@y
# Copy the initialization script
@z
@x
# Copy the initial storage structure
@y
# Copy the initial storage structure
@z
@x
# Copy PHP extensions and libraries from the builder stage
@y
# Copy PHP extensions and libraries from the builder stage
@z
@x
# Use the recommended production PHP configuration
# -----------------------------------------------------------
# PHP provides development and production configurations.
# Here, we replace the default php.ini with the production
# version to apply settings optimized for performance and
# security in a live environment.
# -----------------------------------------------------------
@y
# Use the recommended production PHP configuration
# -----------------------------------------------------------
# PHP provides development and production configurations.
# Here, we replace the default php.ini with the production
# version to apply settings optimized for performance and
# security in a live environment.
# -----------------------------------------------------------
@z
@x
# Keep the image-provided FPM global config intact and add pool overrides separately
@y
# Keep the image-provided FPM global config intact and add pool overrides separately
@z
@x
# Update the variables_order to include E (for ENV)
@y
# Update the variables_order to include E (for ENV)
@z
@x
# Copy the application code and dependencies from the build stage
@y
# Copy the application code and dependencies from the build stage
@z
@x
# Set working directory
@y
# Set working directory
@z
@x
# Ensure correct permissions
@y
# Ensure correct permissions
@z
@x
# Switch to the non-privileged user to run the application
@y
# Switch to the non-privileged user to run the application
@z
@x
# Change the default command to run the entrypoint script
@y
# Change the default command to run the entrypoint script
@z
@x
# Expose port 9000 and start php-fpm server
@y
# Expose port 9000 and start php-fpm server
@z

@x
## Create a Dockerfile for PHP-CLI (production)
@y
## Create a Dockerfile for PHP-CLI (production)
@z

@x
For production, you often need a separate container to run Artisan commands, migrations, and other CLI tasks. In most cases you can run these commands by reusing existing PHP-FPM container:
@y
For production, you often need a separate container to run Artisan commands, migrations, and other CLI tasks. In most cases you can run these commands by reusing existing PHP-FPM container:
@z

@x
```console
$ docker compose -f compose.prod.yaml exec php-fpm php artisan route:list
```
@y
```console
$ docker compose -f compose.prod.yaml exec php-fpm php artisan route:list
```
@z

@x
If you need a separate CLI container with different extensions or strict separation of concerns, consider a php-cli Dockerfile:
@y
If you need a separate CLI container with different extensions or strict separation of concerns, consider a php-cli Dockerfile:
@z

@x within code
# Stage 1: Build environment and Composer dependencies
@y
# Stage 1: Build environment and Composer dependencies
@z
@x
# Install system dependencies and PHP extensions required for Laravel + MySQL/PostgreSQL support
# Some dependencies are required for PHP extensions only in the build stage
@y
# Install system dependencies and PHP extensions required for Laravel + MySQL/PostgreSQL support
# Some dependencies are required for PHP extensions only in the build stage
@z
@x
# Set the working directory inside the container
@y
# Set the working directory inside the container
@z
@x
# Copy the entire Laravel application code into the container
@y
# Copy the entire Laravel application code into the container
@z
@x
# Install Composer and dependencies
@y
# Install Composer and dependencies
@z
@x
# Stage 2: Production environment
@y
# Stage 2: Production environment
@z
@x
# Install client libraries required for php extensions in runtime
@y
# Install client libraries required for php extensions in runtime
@z
@x
# Copy PHP extensions and libraries from the builder stage
@y
# Copy PHP extensions and libraries from the builder stage
@z
@x
# Use the default production configuration for PHP runtime arguments
@y
# Use the default production configuration for PHP runtime arguments
@z
@x
# Copy the application code and dependencies from the build stage
@y
# Copy the application code and dependencies from the build stage
@z
@x
# Set working directory
@y
# Set working directory
@z
@x
# Ensure correct permissions
@y
# Ensure correct permissions
@z
@x
# Switch to the non-privileged user to run the application
@y
# Switch to the non-privileged user to run the application
@z
@x
# Default command: Provide a bash shell to allow running any command
@y
# Default command: Provide a bash shell to allow running any command
@z

@x
This Dockerfile is similar to the PHP-FPM Dockerfile, but it uses the `php:8.5-cli` image as the base image and sets up the container for running CLI commands.
@y
This Dockerfile is similar to the PHP-FPM Dockerfile, but it uses the `php:8.5-cli` image as the base image and sets up the container for running CLI commands.
@z

@x
## Create a Dockerfile for Nginx (production)
@y
## Create a Dockerfile for Nginx (production)
@z

@x
Nginx serves as the web server for the Laravel application. You can include static assets directly to the container. Here's an example of possible Dockerfile for Nginx:
@y
Nginx serves as the web server for the Laravel application. You can include static assets directly to the container. Here's an example of possible Dockerfile for Nginx:
@z

@x within code
# Stage 1: Build assets
@y
# Stage 1: Build assets
@z
@x
# Install Node.js and build tools
@y
# Install Node.js and build tools
@z
@x
# Set working directory
@y
# Set working directory
@z
@x
# Copy Laravel application code
@y
# Copy Laravel application code
@z
@x
# Install Node.js dependencies and build assets
@y
# Install Node.js dependencies and build assets
@z
@x
# Stage 2: Nginx production image
@y
# Stage 2: Nginx production image
@z
@x
# Copy custom Nginx configuration
@y
# Copy custom Nginx configuration
@z
@x
# Replace the default Nginx configuration with our custom one
# that is optimized for serving a Laravel application.
@y
# Replace the default Nginx configuration with our custom one
# that is optimized for serving a Laravel application.
@z
@x
# Copy Laravel's public assets from the builder stage
@y
# Copy Laravel's public assets from the builder stage
@z
@x
# We only need the 'public' directory from our Laravel app.
@y
# We only need the 'public' directory from our Laravel app.
@z
@x
# Set the working directory to the public folder
@y
# Set the working directory to the public folder
@z
@x
# Expose port 80 and start Nginx
@y
# Expose port 80 and start Nginx
@z

@x
This Dockerfile uses a multi-stage build to separate the asset building process from the final production image. The first stage installs Node.js and builds the assets, while the second stage sets up the Nginx production image with the optimized configuration and the built assets.
@y
This Dockerfile uses a multi-stage build to separate the asset building process from the final production image. The first stage installs Node.js and builds the assets, while the second stage sets up the Nginx production image with the optimized configuration and the built assets.
@z

@x
## Create a Docker Compose configuration for production
@y
## Create a Docker Compose configuration for production
@z

@x
To bring all the services together, create a `compose.prod.yaml` file that defines the services, volumes, and networks for the production environment. Here's an example configuration:
@y
To bring all the services together, create a `compose.prod.yaml` file that defines the services, volumes, and networks for the production environment. Here's an example configuration:
@z

@x within code
      # Mount the 'laravel-storage' volume to '/var/www/storage' inside the container.
@y
      # Mount the 'laravel-storage' volume to '/var/www/storage' inside the container.
@z
@x
      # This volume stores persistent data like uploaded files and cache.
      # The ':ro' option mounts it as read-only in the 'web' service because Nginx only needs to read these files.
      # The 'php-fpm' service mounts the same volume without ':ro' to allow write operations.
@y
      # This volume stores persistent data like uploaded files and cache.
      # The ':ro' option mounts it as read-only in the 'web' service because Nginx only needs to read these files.
      # The 'php-fpm' service mounts the same volume without ':ro' to allow write operations.
@z
@x
      # Map port 80 inside the container to the port specified by 'NGINX_PORT' on the host machine.
@y
      # Map port 80 inside the container to the port specified by 'NGINX_PORT' on the host machine.
@z
@x
      # This allows external access to the Nginx web server running inside the container.
      # For example, if 'NGINX_PORT' is set to '8080', accessing 'http://localhost:8080' will reach the application.
@y
      # This allows external access to the Nginx web server running inside the container.
      # For example, if 'NGINX_PORT' is set to '8080', accessing 'http://localhost:8080' will reach the application.
@z
@x
    # For the php-fpm service, we will create a custom image to install the necessary PHP extensions and setup proper permissions.
@y
    # For the php-fpm service, we will create a custom image to install the necessary PHP extensions and setup proper permissions.
@z
@x
    # The 'depends_on' attribute with 'condition: service_healthy' ensures that
    # this service will not start until the 'postgres' service passes its health check.
    # This prevents the application from trying to connect to the database before it's ready.
@y
    # The 'depends_on' attribute with 'condition: service_healthy' ensures that
    # this service will not start until the 'postgres' service passes its health check.
    # This prevents the application from trying to connect to the database before it's ready.
@z
@x
  # The 'php-cli' service provides a command-line interface for running Artisan commands and other CLI tasks.
@y
  # The 'php-cli' service provides a command-line interface for running Artisan commands and other CLI tasks.
@z
@x
  # This is useful for running migrations, seeders, or any custom scripts.
  # It shares the same codebase and environment as the 'php-fpm' service.
@y
  # This is useful for running migrations, seeders, or any custom scripts.
  # It shares the same codebase and environment as the 'php-fpm' service.
@z
@x
    # Health check for PostgreSQL
@y
    # Health check for PostgreSQL
@z
@x
    # Health checks allow Docker to determine if a service is operational.
    # The 'pg_isready' command checks if PostgreSQL is ready to accept connections.
    # This prevents dependent services from starting before the database is ready.
@y
    # Health checks allow Docker to determine if a service is operational.
    # The 'pg_isready' command checks if PostgreSQL is ready to accept connections.
    # This prevents dependent services from starting before the database is ready.
@z
@x
    # Health check for Redis
@y
    # Health check for Redis
@z
@x
    # Checks if Redis is responding to the 'PING' command.
    # This ensures that the service is not only running but also operational.
@y
    # Checks if Redis is responding to the 'PING' command.
    # This ensures that the service is not only running but also operational.
@z
@x
  # Attach the service to the 'laravel-production' network.
@y
  # Attach the service to the 'laravel-production' network.
@z
@x
  # This custom network allows all services within it to communicate using their service names as hostnames.
  # For example, 'php-fpm' can connect to 'postgres' by using 'postgres' as the hostname.
@y
  # This custom network allows all services within it to communicate using their service names as hostnames.
  # For example, 'php-fpm' can connect to 'postgres' by using 'postgres' as the hostname.
@z

@x
> [!NOTE]
> Ensure you have an `.env` file at the root of your Laravel project with the necessary configurations to match the Docker Compose setup.
@y
> [!NOTE]
> Ensure you have an `.env` file at the root of your Laravel project with the necessary configurations to match the Docker Compose setup.
@z

@x
## Running your production environment
@y
## Running your production environment
@z

@x
To start the production environment, run:
@y
To start the production environment, run:
@z

@x
```console
$ docker compose -f compose.prod.yaml up --build -d
```
@y
```console
$ docker compose -f compose.prod.yaml up --build -d
```
@z

@x
This command will build and start all the services in detached mode, providing a scalable and production-ready setup for your Laravel application.
@y
This command will build and start all the services in detached mode, providing a scalable and production-ready setup for your Laravel application.
@z

@x
## Summary
@y
## Summary
@z

@x
By setting up a Docker Compose environment for Laravel in production, you ensure that your application is optimized for performance, scalable, and secure. This setup makes deployments consistent and easier to manage, reducing the likelihood of errors due to differences between environments.
@y
By setting up a Docker Compose environment for Laravel in production, you ensure that your application is optimized for performance, scalable, and secure. This setup makes deployments consistent and easier to manage, reducing the likelihood of errors due to differences between environments.
@z
