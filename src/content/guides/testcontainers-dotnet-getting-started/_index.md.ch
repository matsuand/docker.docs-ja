%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Getting started with Testcontainers for .NET
linkTitle: Testcontainers for .NET
description: Learn how to use Testcontainers for .NET to test database interactions with a real PostgreSQL instance.
keywords: testcontainers, dotnet, csharp, testing, postgresql, integration testing, xunit
summary: |
  Learn how to create a .NET application and test database interactions
  using Testcontainers for .NET with a real PostgreSQL instance.
@y
title: Getting started with Testcontainers for .NET
linkTitle: Testcontainers for .NET
description: Learn how to use Testcontainers for .NET to test database interactions with a real PostgreSQL instance.
keywords: testcontainers, dotnet, csharp, testing, postgresql, integration testing, xunit
summary: |
  Learn how to create a .NET application and test database interactions
  using Testcontainers for .NET with a real PostgreSQL instance.
@z

@x
  time: 20 minutes
@y
  time: 20 分
@z

@x
<!-- Source: https://github.com/testcontainers/tc-guide-getting-started-with-testcontainers-for-dotnet -->
@y
<!-- Source: https://github.com/testcontainers/tc-guide-getting-started-with-testcontainers-for-dotnet -->
@z

@x
In this guide, you will learn how to:
@y
In this guide, you will learn how to:
@z

@x
- Create a .NET solution with a source and test project
- Implement a `CustomerService` that manages customer records in PostgreSQL
- Write integration tests using Testcontainers and xUnit
- Manage container lifecycle with `IAsyncLifetime`
@y
- Create a .NET solution with a source and test project
- Implement a `CustomerService` that manages customer records in PostgreSQL
- Write integration tests using Testcontainers and xUnit
- Manage container lifecycle with `IAsyncLifetime`
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- .NET 8.0+ SDK
- A Docker environment supported by Testcontainers
@y
- .NET 8.0+ SDK
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
