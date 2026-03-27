%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Getting started with Testcontainers for Go
linkTitle: Testcontainers for Go
description: Learn how to use Testcontainers for Go to test database interactions with a real PostgreSQL instance.
keywords: testcontainers, go, golang, testing, postgresql, integration testing
summary: |
  Learn how to create a Go application and test database interactions
  using Testcontainers for Go with a real PostgreSQL instance.
@y
title: Getting started with Testcontainers for Go
linkTitle: Testcontainers for Go
description: Learn how to use Testcontainers for Go to test database interactions with a real PostgreSQL instance.
keywords: testcontainers, go, golang, testing, postgresql, integration testing
summary: |
  Learn how to create a Go application and test database interactions
  using Testcontainers for Go with a real PostgreSQL instance.
@z

@x
  time: 20 minutes
@y
  time: 20 分
@z

@x
<!-- Source: https://github.com/testcontainers/tc-guide-getting-started-with-testcontainers-for-go -->
@y
<!-- Source: https://github.com/testcontainers/tc-guide-getting-started-with-testcontainers-for-go -->
@z

@x
In this guide, you will learn how to:
@y
In this guide, you will learn how to:
@z

@x
- Create a Go application with modules support
- Implement a Repository to manage customer data in a PostgreSQL database using the pgx driver
- Write integration tests using testcontainers-go
- Reuse containers across multiple tests using test suites
@y
- Create a Go application with modules support
- Implement a Repository to manage customer data in a PostgreSQL database using the pgx driver
- Write integration tests using testcontainers-go
- Reuse containers across multiple tests using test suites
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- Go 1.25+
- Your preferred IDE (VS Code, GoLand)
- A Docker environment supported by Testcontainers. For details, see
  the [testcontainers-go system requirements](https://golang.testcontainers.org/system_requirements/).
@y
- Go 1.25+
- Your preferred IDE (VS Code, GoLand)
- A Docker environment supported by Testcontainers. For details, see
  the [testcontainers-go system requirements](https://golang.testcontainers.org/system_requirements/).
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
