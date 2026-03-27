%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Working with jOOQ and Flyway using Testcontainers
linkTitle: jOOQ and Flyway
description: Learn how to generate jOOQ code from a database using Testcontainers and Flyway, then test your persistence layer.
keywords: testcontainers, java, testing, jooq, flyway, postgresql, spring boot, code generation
summary: |
  Generate typesafe jOOQ code from a real PostgreSQL database managed by
  Flyway migrations, then test repositories using Testcontainers.
@y
title: Working with jOOQ and Flyway using Testcontainers
linkTitle: jOOQ and Flyway
description: Learn how to generate jOOQ code from a database using Testcontainers and Flyway, then test your persistence layer.
keywords: testcontainers, java, testing, jooq, flyway, postgresql, spring boot, code generation
summary: |
  Generate typesafe jOOQ code from a real PostgreSQL database managed by
  Flyway migrations, then test repositories using Testcontainers.
@z

@x
  time: 25 minutes
@y
  time: 25 分
@z

@x
<!-- Source: https://github.com/testcontainers/tc-guide-working-with-jooq-flyway-using-testcontainers -->
@y
<!-- Source: https://github.com/testcontainers/tc-guide-working-with-jooq-flyway-using-testcontainers -->
@z

@x
In this guide, you will learn how to:
@y
In this guide, you will learn how to:
@z

@x
- Create a Spring Boot application with jOOQ support
- Generate jOOQ code using Testcontainers, Flyway, and a Maven plugin
- Implement basic database operations using jOOQ
- Load complex object graphs using jOOQ's MULTISET feature
- Test the jOOQ persistence layer using Testcontainers
@y
- Create a Spring Boot application with jOOQ support
- Generate jOOQ code using Testcontainers, Flyway, and a Maven plugin
- Implement basic database operations using jOOQ
- Load complex object graphs using jOOQ's MULTISET feature
- Test the jOOQ persistence layer using Testcontainers
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- Java 17+
- Maven
- A Docker environment supported by Testcontainers
@y
- Java 17+
- Maven
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
