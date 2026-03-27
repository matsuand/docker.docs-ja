%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Testing Quarkus applications with Testcontainers
linkTitle: Quarkus
description: Learn how to test a Quarkus REST API using Testcontainers with PostgreSQL, Hibernate ORM with Panache, and REST Assured.
keywords: testcontainers, java, quarkus, testing, postgresql, rest api, rest assured, panache, dev services
summary: |
  Learn how to create a Quarkus REST API with Hibernate ORM with Panache and PostgreSQL,
  then test it using Quarkus Dev Services, Testcontainers, and REST Assured.
@y
title: Testing Quarkus applications with Testcontainers
linkTitle: Quarkus
description: Learn how to test a Quarkus REST API using Testcontainers with PostgreSQL, Hibernate ORM with Panache, and REST Assured.
keywords: testcontainers, java, quarkus, testing, postgresql, rest api, rest assured, panache, dev services
summary: |
  Learn how to create a Quarkus REST API with Hibernate ORM with Panache and PostgreSQL,
  then test it using Quarkus Dev Services, Testcontainers, and REST Assured.
@z

@x
  time: 25 minutes
@y
  time: 25 minutes
@z

@x
<!-- Source: https://github.com/testcontainers/tc-guide-testcontainers-in-quarkus-applications -->
@y
<!-- Source: https://github.com/testcontainers/tc-guide-testcontainers-in-quarkus-applications -->
@z

@x
In this guide, you'll learn how to:
@y
In this guide, you'll learn how to:
@z

@x
- Create a Quarkus application with REST API endpoints
- Use Hibernate ORM with Panache and PostgreSQL for persistence
- Test the REST API using Quarkus Dev Services, which uses Testcontainers behind
  the scenes
- Test with services not supported by Dev Services using
  `QuarkusTestResourceLifecycleManager`
@y
- Create a Quarkus application with REST API endpoints
- Use Hibernate ORM with Panache and PostgreSQL for persistence
- Test the REST API using Quarkus Dev Services, which uses Testcontainers behind
  the scenes
- Test with services not supported by Dev Services using
  `QuarkusTestResourceLifecycleManager`
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
