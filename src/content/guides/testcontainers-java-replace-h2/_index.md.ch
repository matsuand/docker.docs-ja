%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Replace H2 with a real database for testing
linkTitle: Replace H2 database
description: Learn how to replace an H2 in-memory database with a real PostgreSQL database for testing using Testcontainers.
keywords: testcontainers, java, testing, h2, postgresql, spring boot, spring data jpa, jdbc
summary: |
  Replace your H2 in-memory test database with a real PostgreSQL instance
  using the Testcontainers special JDBC URL — a one-line change.
@y
title: Replace H2 with a real database for testing
linkTitle: Replace H2 database
description: Learn how to replace an H2 in-memory database with a real PostgreSQL database for testing using Testcontainers.
keywords: testcontainers, java, testing, h2, postgresql, spring boot, spring data jpa, jdbc
summary: |
  Replace your H2 in-memory test database with a real PostgreSQL instance
  using the Testcontainers special JDBC URL — a one-line change.
@z

@x
  time: 15 minutes
@y
  time: 15 分
@z

@x
<!-- Source: https://github.com/testcontainers/tc-guide-replace-h2-with-real-database-for-testing -->
@y
<!-- Source: https://github.com/testcontainers/tc-guide-replace-h2-with-real-database-for-testing -->
@z

@x
In this guide, you will learn how to:
@y
In this guide, you will learn how to:
@z

@x
- Understand the drawbacks of using H2 in-memory databases for testing
- Replace H2 with a real PostgreSQL database using the Testcontainers special JDBC URL
- Use the Testcontainers JUnit 5 extension for more control over the container
- Test both Spring Data JPA and JdbcTemplate-based repositories
@y
- Understand the drawbacks of using H2 in-memory databases for testing
- Replace H2 with a real PostgreSQL database using the Testcontainers special JDBC URL
- Use the Testcontainers JUnit 5 extension for more control over the container
- Test both Spring Data JPA and JdbcTemplate-based repositories
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
