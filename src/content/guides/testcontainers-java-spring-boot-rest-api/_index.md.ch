%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Testing a Spring Boot REST API with Testcontainers
linkTitle: Spring Boot REST API
description: Learn how to test a Spring Boot REST API using Testcontainers with PostgreSQL and REST Assured.
keywords: testcontainers, java, spring boot, testing, postgresql, rest api, rest assured, jpa
summary: |
  Learn how to create a Spring Boot REST API with Spring Data JPA and PostgreSQL,
  then test it using Testcontainers and REST Assured.
@y
title: Testing a Spring Boot REST API with Testcontainers
linkTitle: Spring Boot REST API
description: Learn how to test a Spring Boot REST API using Testcontainers with PostgreSQL and REST Assured.
keywords: testcontainers, java, spring boot, testing, postgresql, rest api, rest assured, jpa
summary: |
  Learn how to create a Spring Boot REST API with Spring Data JPA and PostgreSQL,
  then test it using Testcontainers and REST Assured.
@z

@x
  time: 25 minutes
@y
  time: 25 分
@z

@x
<!-- Source: https://github.com/testcontainers/tc-guide-testing-spring-boot-rest-api -->
@y
<!-- Source: https://github.com/testcontainers/tc-guide-testing-spring-boot-rest-api -->
@z

@x
In this guide, you will learn how to:
@y
In this guide, you will learn how to:
@z

@x
- Create a Spring Boot application with a REST API endpoint
- Use Spring Data JPA with PostgreSQL to store and retrieve data
- Test the REST API using Testcontainers and REST Assured
@y
- Create a Spring Boot application with a REST API endpoint
- Use Spring Data JPA with PostgreSQL to store and retrieve data
- Test the REST API using Testcontainers and REST Assured
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- Java 17+
- Maven or Gradle
- A Docker environment supported by Testcontainers
@y
- Java 17+
- Maven or Gradle
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
