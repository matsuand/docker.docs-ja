%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Common Questions on Using Laravel with Docker
description: Find answers to common questions about setting up and managing Laravel environments with Docker Compose, including troubleshooting and best practices.
@y
title: Common Questions on Using Laravel with Docker
description: Find answers to common questions about setting up and managing Laravel environments with Docker Compose, including troubleshooting and best practices.
@z

@x
<!-- vale Docker.HeadingLength = NO -->
@y
<!-- vale Docker.HeadingLength = NO -->
@z

@x
## 1. Why should I use Docker Compose for Laravel?
@y
## 1. Why should I use Docker Compose for Laravel?
@z

@x
Docker Compose is a powerful tool for managing multi-container environments, particularly in development due to its simplicity. With Docker Compose, you can define and connect all necessary services for Laravel, such as PHP, Nginx, and databases, in a single configuration (`compose.*.yaml`). This setup ensures consistency across development, testing, and production environments, streamlining onboarding and reducing discrepancies between local and server setups.
@y
Docker Compose is a powerful tool for managing multi-container environments, particularly in development due to its simplicity. With Docker Compose, you can define and connect all necessary services for Laravel, such as PHP, Nginx, and databases, in a single configuration (`compose.*.yaml`). This setup ensures consistency across development, testing, and production environments, streamlining onboarding and reducing discrepancies between local and server setups.
@z

@x
While Docker Compose is a great choice for development, tools like **Docker Swarm** or **Kubernetes** offer advanced scaling and orchestration features, which may be beneficial for complex production deployments.
@y
While Docker Compose is a great choice for development, tools like **Docker Swarm** or **Kubernetes** offer advanced scaling and orchestration features, which may be beneficial for complex production deployments.
@z

@x
## 2. How do I debug my Laravel application with Docker Compose?
@y
## 2. How do I debug my Laravel application with Docker Compose?
@z

@x
To debug your Laravel application in a Docker environment, use **Xdebug**. In the development setup, Xdebug is installed in the `php-fpm` container to enable debugging. Ensure Xdebug is enabled in your `compose.dev.yaml` file by setting the environment variable `XDEBUG_ENABLED=true` and configuring your IDE (e.g., Visual Studio Code or PHPStorm) to connect to the remote container for debugging.
@y
To debug your Laravel application in a Docker environment, use **Xdebug**. In the development setup, Xdebug is installed in the `php-fpm` container to enable debugging. Ensure Xdebug is enabled in your `compose.dev.yaml` file by setting the environment variable `XDEBUG_ENABLED=true` and configuring your IDE (e.g., Visual Studio Code or PHPStorm) to connect to the remote container for debugging.
@z

@x
## 3. Can I use Docker Compose with databases other than PostgreSQL?
@y
## 3. Can I use Docker Compose with databases other than PostgreSQL?
@z

@x
Yes, Docker Compose supports various database services for Laravel. While PostgreSQL is used in the examples, you can easily substitute **MySQL**, **MariaDB**, or even **SQLite**. Update the `compose.*.yaml` file to specify the required Docker image and adjust your `.env` file to reflect the new database configuration.
@y
Yes, Docker Compose supports various database services for Laravel. While PostgreSQL is used in the examples, you can easily substitute **MySQL**, **MariaDB**, or even **SQLite**. Update the `compose.*.yaml` file to specify the required Docker image and adjust your `.env` file to reflect the new database configuration.
@z

@x
## 4. How can I persist data in development and production?
@y
## 4. How can I persist data in development and production?
@z

@x
In both development and production, Docker volumes are used to persist data. For instance, in the `compose.*.yaml` file, the `postgres-data-*` volume stores PostgreSQL data, ensuring that data is retained even if the container restarts. You can also define named volumes for other services where data persistence is essential.
@y
In both development and production, Docker volumes are used to persist data. For instance, in the `compose.*.yaml` file, the `postgres-data-*` volume stores PostgreSQL data, ensuring that data is retained even if the container restarts. You can also define named volumes for other services where data persistence is essential.
@z

@x
## 5. What is the difference between development and production Docker configurations?
@y
## 5. What is the difference between development and production Docker configurations?
@z

@x
In a development environment, Docker configurations include tools that streamline coding and debugging, such as Xdebug for debugging, and volume mounts to enable real-time code updates without requiring image rebuilds.
@y
In a development environment, Docker configurations include tools that streamline coding and debugging, such as Xdebug for debugging, and volume mounts to enable real-time code updates without requiring image rebuilds.
@z

@x
In production, the configuration is optimized for performance, security, and efficiency. This setup uses multi-stage builds to keep the image lightweight and includes only essential tools, packages, and libraries.
@y
In production, the configuration is optimized for performance, security, and efficiency. This setup uses multi-stage builds to keep the image lightweight and includes only essential tools, packages, and libraries.
@z

@x
It’s recommended to use `alpine`-based images in production for smaller image sizes, enhancing deployment speed and security.
@y
It’s recommended to use `alpine`-based images in production for smaller image sizes, enhancing deployment speed and security.
@z

@x
Additionally, consider using [Docker Scout](/manuals/scout/_index.md) to detect and analyze vulnerabilities, especially in production environments.
@y
Additionally, consider using [Docker Scout](manuals/scout/_index.md) to detect and analyze vulnerabilities, especially in production environments.
@z

@x
For additional information about using Docker Compose in production, see [this guide](/compose/how-tos/production/).
@y
For additional information about using Docker Compose in production, see [this guide](__SUBDIR__/compose/how-tos/production/).
@z
