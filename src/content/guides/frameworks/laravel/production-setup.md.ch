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

@x
```plaintext
my-laravel-app/
├── app/
├── bootstrap/
├── config/
├── database/
├── public/
├── docker/
│   ├── common/
│   │   └── php-fpm/
│   │       └── Dockerfile
│   ├── development/
│   ├── production/
│   │   ├── php-fpm/
│   │   │   └── entrypoint.sh
│   │   └── nginx
│   │       ├── Dockerfile
│   │       └── nginx.conf
├── compose.dev.yaml
├── compose.prod.yaml
├── .dockerignore
├── .env
├── vendor/
├── ...
```
@y
```plaintext
my-laravel-app/
├── app/
├── bootstrap/
├── config/
├── database/
├── public/
├── docker/
│   ├── common/
│   │   └── php-fpm/
│   │       └── Dockerfile
│   ├── development/
│   ├── production/
│   │   ├── php-fpm/
│   │   │   └── entrypoint.sh
│   │   └── nginx
│   │       ├── Dockerfile
│   │       └── nginx.conf
├── compose.dev.yaml
├── compose.prod.yaml
├── .dockerignore
├── .env
├── vendor/
├── ...
```
@z

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
# Enable PHP-FPM status page by modifying zz-docker.conf with sed
@y
# Enable PHP-FPM status page by modifying zz-docker.conf with sed
@z
@x
# Update the variables_order to include E (for ENV)
#RUN sed -i 's/variables_order = "GPCS"/variables_order = "EGPCS"/' "$PHP_INI_DIR/php.ini"
@y
# Update the variables_order to include E (for ENV)
#RUN sed -i 's/variables_order = "GPCS"/variables_order = "EGPCS"/' "$PHP_INI_DIR/php.ini"
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

@x
```dockerfile
# Stage 1: Build environment and Composer dependencies
FROM php:8.4-cli AS builder
@y
```dockerfile
# Stage 1: Build environment and Composer dependencies
FROM php:8.4-cli AS builder
@z

@x
# Install system dependencies and PHP extensions required for Laravel + MySQL/PostgreSQL support
# Some dependencies are required for PHP extensions only in the build stage
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    unzip \
    libpq-dev \
    libonig-dev \
    libssl-dev \
    libxml2-dev \
    libcurl4-openssl-dev \
    libicu-dev \
    libzip-dev \
    && docker-php-ext-install -j$(nproc) \
    pdo_mysql \
    pdo_pgsql \
    pgsql \
    opcache \
    intl \
    zip \
    bcmath \
    soap \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
@y
# Install system dependencies and PHP extensions required for Laravel + MySQL/PostgreSQL support
# Some dependencies are required for PHP extensions only in the build stage
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    unzip \
    libpq-dev \
    libonig-dev \
    libssl-dev \
    libxml2-dev \
    libcurl4-openssl-dev \
    libicu-dev \
    libzip-dev \
    && docker-php-ext-install -j$(nproc) \
    pdo_mysql \
    pdo_pgsql \
    pgsql \
    opcache \
    intl \
    zip \
    bcmath \
    soap \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
@z

@x
# Set the working directory inside the container
WORKDIR /var/www
@y
# Set the working directory inside the container
WORKDIR /var/www
@z

@x
# Copy the entire Laravel application code into the container
COPY . /var/www
@y
# Copy the entire Laravel application code into the container
COPY . /var/www
@z

@x
# Install Composer and dependencies
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer install --no-dev --optimize-autoloader --no-interaction --no-progress --prefer-dist
@y
# Install Composer and dependencies
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer install --no-dev --optimize-autoloader --no-interaction --no-progress --prefer-dist
@z

@x
# Stage 2: Production environment
FROM php:8.4-cli
@y
# Stage 2: Production environment
FROM php:8.4-cli
@z

@x
# Install client libraries required for php extensions in runtime
RUN apt-get update && apt-get install -y --no-install-recommends \
    libpq-dev \
    libicu-dev \
    libzip-dev \
    && apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
@y
# Install client libraries required for php extensions in runtime
RUN apt-get update && apt-get install -y --no-install-recommends \
    libpq-dev \
    libicu-dev \
    libzip-dev \
    && apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
@z

@x
# Copy PHP extensions and libraries from the builder stage
COPY --from=builder /usr/local/lib/php/extensions/ /usr/local/lib/php/extensions/
COPY --from=builder /usr/local/etc/php/conf.d/ /usr/local/etc/php/conf.d/
COPY --from=builder /usr/local/bin/docker-php-ext-* /usr/local/bin/
@y
# Copy PHP extensions and libraries from the builder stage
COPY --from=builder /usr/local/lib/php/extensions/ /usr/local/lib/php/extensions/
COPY --from=builder /usr/local/etc/php/conf.d/ /usr/local/etc/php/conf.d/
COPY --from=builder /usr/local/bin/docker-php-ext-* /usr/local/bin/
@z

@x
# Use the default production configuration for PHP runtime arguments
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
@y
# Use the default production configuration for PHP runtime arguments
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
@z

@x
# Copy the application code and dependencies from the build stage
COPY --from=builder /var/www /var/www
@y
# Copy the application code and dependencies from the build stage
COPY --from=builder /var/www /var/www
@z

@x
# Set working directory
WORKDIR /var/www
@y
# Set working directory
WORKDIR /var/www
@z

@x
# Ensure correct permissions
RUN chown -R www-data:www-data /var/www
@y
# Ensure correct permissions
RUN chown -R www-data:www-data /var/www
@z

@x
# Switch to the non-privileged user to run the application
USER www-data
@y
# Switch to the non-privileged user to run the application
USER www-data
@z

@x
# Default command: Provide a bash shell to allow running any command
CMD ["bash"]
```
@y
# Default command: Provide a bash shell to allow running any command
CMD ["bash"]
```
@z

@x
This Dockerfile is similar to the PHP-FPM Dockerfile, but it uses the `php:8.4-cli` image as the base image and sets up the container for running CLI commands.
@y
This Dockerfile is similar to the PHP-FPM Dockerfile, but it uses the `php:8.4-cli` image as the base image and sets up the container for running CLI commands.
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

@x
```dockerfile
# docker/nginx/Dockerfile
# Stage 1: Build assets
FROM debian AS builder
@y
```dockerfile
# docker/nginx/Dockerfile
# Stage 1: Build assets
FROM debian AS builder
@z

@x
# Install Node.js and build tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    nodejs \
    npm \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
@y
# Install Node.js and build tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    nodejs \
    npm \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
@z

@x
# Set working directory
WORKDIR /var/www
@y
# Set working directory
WORKDIR /var/www
@z

@x
# Copy Laravel application code
COPY . /var/www
@y
# Copy Laravel application code
COPY . /var/www
@z

@x
# Install Node.js dependencies and build assets
RUN npm install && npm run build
@y
# Install Node.js dependencies and build assets
RUN npm install && npm run build
@z

@x
# Stage 2: Nginx production image
FROM nginx:alpine
@y
# Stage 2: Nginx production image
FROM nginx:alpine
@z

@x
# Copy custom Nginx configuration
# -----------------------------------------------------------
# Replace the default Nginx configuration with our custom one
# that is optimized for serving a Laravel application.
# -----------------------------------------------------------
COPY ./docker/nginx/nginx.conf /etc/nginx/nginx.conf
@y
# Copy custom Nginx configuration
# -----------------------------------------------------------
# Replace the default Nginx configuration with our custom one
# that is optimized for serving a Laravel application.
# -----------------------------------------------------------
COPY ./docker/nginx/nginx.conf /etc/nginx/nginx.conf
@z

@x
# Copy Laravel's public assets from the builder stage
# -----------------------------------------------------------
# We only need the 'public' directory from our Laravel app.
# -----------------------------------------------------------
COPY --from=builder /var/www/public /var/www/public
@y
# Copy Laravel's public assets from the builder stage
# -----------------------------------------------------------
# We only need the 'public' directory from our Laravel app.
# -----------------------------------------------------------
COPY --from=builder /var/www/public /var/www/public
@z

@x
# Set the working directory to the public folder
WORKDIR /var/www/public
@y
# Set the working directory to the public folder
WORKDIR /var/www/public
@z

@x
# Expose port 80 and start Nginx
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```
@y
# Expose port 80 and start Nginx
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```
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

@x
```yaml
services:
  web:
    build:
      context: .
      dockerfile: ./docker/production/nginx/Dockerfile
    restart: unless-stopped # Automatically restart unless the service is explicitly stopped
    volumes:
      # Mount the 'laravel-storage' volume to '/var/www/storage' inside the container.
      # -----------------------------------------------------------
      # This volume stores persistent data like uploaded files and cache.
      # The ':ro' option mounts it as read-only in the 'web' service because Nginx only needs to read these files.
      # The 'php-fpm' service mounts the same volume without ':ro' to allow write operations.
      # -----------------------------------------------------------
      - laravel-storage-production:/var/www/storage:ro
    networks:
      - laravel-production
    ports:
      # Map port 80 inside the container to the port specified by 'NGINX_PORT' on the host machine.
      # -----------------------------------------------------------
      # This allows external access to the Nginx web server running inside the container.
      # For example, if 'NGINX_PORT' is set to '8080', accessing 'http://localhost:8080' will reach the application.
      # -----------------------------------------------------------
      - "${NGINX_PORT:-80}:80"
    depends_on:
      php-fpm:
        condition: service_healthy # Wait for php-fpm health check
@y
```yaml
services:
  web:
    build:
      context: .
      dockerfile: ./docker/production/nginx/Dockerfile
    restart: unless-stopped # Automatically restart unless the service is explicitly stopped
    volumes:
      # Mount the 'laravel-storage' volume to '/var/www/storage' inside the container.
      # -----------------------------------------------------------
      # This volume stores persistent data like uploaded files and cache.
      # The ':ro' option mounts it as read-only in the 'web' service because Nginx only needs to read these files.
      # The 'php-fpm' service mounts the same volume without ':ro' to allow write operations.
      # -----------------------------------------------------------
      - laravel-storage-production:/var/www/storage:ro
    networks:
      - laravel-production
    ports:
      # Map port 80 inside the container to the port specified by 'NGINX_PORT' on the host machine.
      # -----------------------------------------------------------
      # This allows external access to the Nginx web server running inside the container.
      # For example, if 'NGINX_PORT' is set to '8080', accessing 'http://localhost:8080' will reach the application.
      # -----------------------------------------------------------
      - "${NGINX_PORT:-80}:80"
    depends_on:
      php-fpm:
        condition: service_healthy # Wait for php-fpm health check
@z

@x
  php-fpm:
    # For the php-fpm service, we will create a custom image to install the necessary PHP extensions and setup proper permissions.
    build:
      context: .
      dockerfile: ./docker/common/php-fpm/Dockerfile
      target: production # Use the 'production' stage in the Dockerfile
    restart: unless-stopped
    volumes:
      - laravel-storage-production:/var/www/storage # Mount the storage volume
    env_file:
      - .env
    networks:
      - laravel-production
    healthcheck:
      test: ["CMD-SHELL", "php-fpm-healthcheck || exit 1"]
      interval: 10s
      timeout: 5s
      retries: 3
    # The 'depends_on' attribute with 'condition: service_healthy' ensures that
    # this service will not start until the 'postgres' service passes its health check.
    # This prevents the application from trying to connect to the database before it's ready.
    depends_on:
      postgres:
        condition: service_healthy
@y
  php-fpm:
    # For the php-fpm service, we will create a custom image to install the necessary PHP extensions and setup proper permissions.
    build:
      context: .
      dockerfile: ./docker/common/php-fpm/Dockerfile
      target: production # Use the 'production' stage in the Dockerfile
    restart: unless-stopped
    volumes:
      - laravel-storage-production:/var/www/storage # Mount the storage volume
    env_file:
      - .env
    networks:
      - laravel-production
    healthcheck:
      test: ["CMD-SHELL", "php-fpm-healthcheck || exit 1"]
      interval: 10s
      timeout: 5s
      retries: 3
    # The 'depends_on' attribute with 'condition: service_healthy' ensures that
    # this service will not start until the 'postgres' service passes its health check.
    # This prevents the application from trying to connect to the database before it's ready.
    depends_on:
      postgres:
        condition: service_healthy
@z

@x
  # The 'php-cli' service provides a command-line interface for running Artisan commands and other CLI tasks.
  # -----------------------------------------------------------
  # This is useful for running migrations, seeders, or any custom scripts.
  # It shares the same codebase and environment as the 'php-fpm' service.
  # -----------------------------------------------------------
  php-cli:
    build:
      context: .
      dockerfile: ./docker/php-cli/Dockerfile
    tty: true # Enables an interactive terminal
    stdin_open: true # Keeps standard input open for 'docker exec'
    env_file:
      - .env
    networks:
      - laravel
@y
  # The 'php-cli' service provides a command-line interface for running Artisan commands and other CLI tasks.
  # -----------------------------------------------------------
  # This is useful for running migrations, seeders, or any custom scripts.
  # It shares the same codebase and environment as the 'php-fpm' service.
  # -----------------------------------------------------------
  php-cli:
    build:
      context: .
      dockerfile: ./docker/php-cli/Dockerfile
    tty: true # Enables an interactive terminal
    stdin_open: true # Keeps standard input open for 'docker exec'
    env_file:
      - .env
    networks:
      - laravel
@z

@x
  postgres:
    image: postgres:18
    restart: unless-stopped
    user: postgres
    ports:
      - "${POSTGRES_PORT}:5432"
    environment:
      - POSTGRES_DB=${POSTGRES_DATABASE}
      - POSTGRES_USER=${POSTGRES_USERNAME}
      - POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
    volumes:
      - postgres-data-production:/var/lib/postgresql
    networks:
      - laravel-production
    # Health check for PostgreSQL
    # -----------------------------------------------------------
    # Health checks allow Docker to determine if a service is operational.
    # The 'pg_isready' command checks if PostgreSQL is ready to accept connections.
    # This prevents dependent services from starting before the database is ready.
    # -----------------------------------------------------------
    healthcheck:
      test: ["CMD", "pg_isready"]
      interval: 10s
      timeout: 5s
      retries: 5
@y
  postgres:
    image: postgres:18
    restart: unless-stopped
    user: postgres
    ports:
      - "${POSTGRES_PORT}:5432"
    environment:
      - POSTGRES_DB=${POSTGRES_DATABASE}
      - POSTGRES_USER=${POSTGRES_USERNAME}
      - POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
    volumes:
      - postgres-data-production:/var/lib/postgresql
    networks:
      - laravel-production
    # Health check for PostgreSQL
    # -----------------------------------------------------------
    # Health checks allow Docker to determine if a service is operational.
    # The 'pg_isready' command checks if PostgreSQL is ready to accept connections.
    # This prevents dependent services from starting before the database is ready.
    # -----------------------------------------------------------
    healthcheck:
      test: ["CMD", "pg_isready"]
      interval: 10s
      timeout: 5s
      retries: 5
@z

@x
  redis:
    image: redis:alpine
    restart: unless-stopped # Automatically restart unless the service is explicitly stopped
    networks:
      - laravel-production
    # Health check for Redis
    # -----------------------------------------------------------
    # Checks if Redis is responding to the 'PING' command.
    # This ensures that the service is not only running but also operational.
    # -----------------------------------------------------------
    healthcheck:
      test: ["CMD", "redis-cli", "ping"]
      interval: 10s
      timeout: 5s
      retries: 3
@y
  redis:
    image: redis:alpine
    restart: unless-stopped # Automatically restart unless the service is explicitly stopped
    networks:
      - laravel-production
    # Health check for Redis
    # -----------------------------------------------------------
    # Checks if Redis is responding to the 'PING' command.
    # This ensures that the service is not only running but also operational.
    # -----------------------------------------------------------
    healthcheck:
      test: ["CMD", "redis-cli", "ping"]
      interval: 10s
      timeout: 5s
      retries: 3
@z

@x
networks:
  # Attach the service to the 'laravel-production' network.
  # -----------------------------------------------------------
  # This custom network allows all services within it to communicate using their service names as hostnames.
  # For example, 'php-fpm' can connect to 'postgres' by using 'postgres' as the hostname.
  # -----------------------------------------------------------
  laravel-production:
@y
networks:
  # Attach the service to the 'laravel-production' network.
  # -----------------------------------------------------------
  # This custom network allows all services within it to communicate using their service names as hostnames.
  # For example, 'php-fpm' can connect to 'postgres' by using 'postgres' as the hostname.
  # -----------------------------------------------------------
  laravel-production:
@z

@x
volumes:
  postgres-data-production:
  laravel-storage-production:
```
@y
volumes:
  postgres-data-production:
  laravel-storage-production:
```
@z

@x
> [!NOTE]
> Ensure you have an `.env` file at the root of your Laravel project with the necessary configurations (e.g., database and Xdebug settings) to match the Docker Compose setup.
@y
> [!NOTE]
> Ensure you have an `.env` file at the root of your Laravel project with the necessary configurations (e.g., database and Xdebug settings) to match the Docker Compose setup.
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
