%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Configuration of services running in a container
linkTitle: Service configuration (Java)
description: Learn how to configure services running in Testcontainers by copying files and executing commands inside containers.
keywords: testcontainers, java, testing, postgresql, localstack, container configuration
summary: |
  Learn how to initialize and configure Docker containers for testing
  by copying files into containers and executing commands inside them.
@y
title: Configuration of services running in a container
linkTitle: Service configuration (Java)
description: Learn how to configure services running in Testcontainers by copying files and executing commands inside containers.
keywords: testcontainers, java, testing, postgresql, localstack, container configuration
summary: |
  Learn how to initialize and configure Docker containers for testing
  by copying files into containers and executing commands inside them.
@z

@x
  time: 15 minutes
@y
  time: 15 分
@z

@x
<!-- Source: https://github.com/testcontainers/tc-guide-configuration-of-services-running-in-container -->
@y
<!-- Source: https://github.com/testcontainers/tc-guide-configuration-of-services-running-in-container -->
@z

@x
In this guide, you will learn how to:
@y
In this guide, you will learn how to:
@z

@x
- Initialize containers by copying files into them
- Run commands inside running containers using `execInContainer()`
- Set up a PostgreSQL database with SQL scripts
- Create AWS S3 buckets in LocalStack containers
@y
- Initialize containers by copying files into them
- Run commands inside running containers using `execInContainer()`
- Set up a PostgreSQL database with SQL scripts
- Create AWS S3 buckets in LocalStack containers
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- Java 17+
- Your preferred IDE
- A Docker environment supported by Testcontainers
@y
- Java 17+
- Your preferred IDE
- A Docker environment supported by Testcontainers
@z

@x
> [!NOTE]
> If you're new to Testcontainers, visit the
> [Testcontainers overview](https://testcontainers.com/getting-started/) to learn more about
> Testcontainers and the benefits of using it.
@y
> [!NOTE]
> If you're new to Testcontainers, visit the
> [Testcontainers overview](https://testcontainers.com/getting-started/) to learn more about
> Testcontainers and the benefits of using it.
@z
