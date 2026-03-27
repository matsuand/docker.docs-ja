%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Getting started with Testcontainers for Java
linkTitle: Testcontainers for Java
description: Learn how to use Testcontainers for Java to test a customer service with a real PostgreSQL database.
keywords: testcontainers, java, testing, postgresql, integration testing, junit, maven
summary: |
  Learn how to create a Java application and test database interactions
  using Testcontainers for Java with a real PostgreSQL instance.
@y
title: Getting started with Testcontainers for Java
linkTitle: Testcontainers for Java
description: Learn how to use Testcontainers for Java to test a customer service with a real PostgreSQL database.
keywords: testcontainers, java, testing, postgresql, integration testing, junit, maven
summary: |
  Learn how to create a Java application and test database interactions
  using Testcontainers for Java with a real PostgreSQL instance.
@z

@x
  time: 20 minutes
@y
  time: 20 minutes
@z

@x
<!-- Source: https://github.com/testcontainers/tc-guide-getting-started-with-testcontainers-for-java -->
@y
<!-- Source: https://github.com/testcontainers/tc-guide-getting-started-with-testcontainers-for-java -->
@z

@x
In this guide, you will learn how to:
@y
In this guide, you will learn how to:
@z

@x
- Create a Java project with Maven
- Implement a `CustomerService` that manages customer records in PostgreSQL
- Write integration tests using Testcontainers with a real Postgres database
- Run the tests and verify everything works
@y
- Create a Java project with Maven
- Implement a `CustomerService` that manages customer records in PostgreSQL
- Write integration tests using Testcontainers with a real Postgres database
- Run the tests and verify everything works
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
