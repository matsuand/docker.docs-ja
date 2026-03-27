%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Run tests and next steps
linkTitle: Run tests
description: Run the Testcontainers-based integration tests and explore next steps.
@y
title: Run tests and next steps
linkTitle: Run tests
description: Run the Testcontainers-based integration tests and explore next steps.
@z

@x
## Run the tests
@y
## Run the tests
@z

@x
Run the tests from the solution root:
@y
Run the tests from the solution root:
@z

@x
```console
$ dotnet test ./RazorPagesProject.sln
```
@y
```console
$ dotnet test ./RazorPagesProject.sln
```
@z

@x
The first run may take longer because Docker needs to pull the Microsoft SQL
Server image. On subsequent runs, the image is cached locally.
@y
The first run may take longer because Docker needs to pull the Microsoft SQL
Server image. On subsequent runs, the image is cached locally.
@z

@x
You should see xUnit discover and run the tests, including the
`MsSqlTests.IndexPageTests` class. Testcontainers starts a SQL Server
container, the tests execute against it, and the container is stopped and
removed automatically after the tests finish.
@y
You should see xUnit discover and run the tests, including the
`MsSqlTests.IndexPageTests` class. Testcontainers starts a SQL Server
container, the tests execute against it, and the container is stopped and
removed automatically after the tests finish.
@z

@x
## Summary
@y
## Summary
@z

@x
By replacing SQLite with a Testcontainers-managed Microsoft SQL Server
instance, the integration tests run against the same type of database used in
production. This approach catches database-specific issues early, such as
differences in SQL dialect, transaction behavior, or data type handling between
SQLite and SQL Server.
@y
By replacing SQLite with a Testcontainers-managed Microsoft SQL Server
instance, the integration tests run against the same type of database used in
production. This approach catches database-specific issues early, such as
differences in SQL dialect, transaction behavior, or data type handling between
SQLite and SQL Server.
@z

@x
The `MsSqlTests` class uses `IAsyncLifetime` to manage the container lifecycle,
and a nested `CustomWebApplicationFactory` wires the container's connection
string into the application's service configuration. You can apply this same
pattern to any database or service that Testcontainers supports.
@y
The `MsSqlTests` class uses `IAsyncLifetime` to manage the container lifecycle,
and a nested `CustomWebApplicationFactory` wires the container's connection
string into the application's service configuration. You can apply this same
pattern to any database or service that Testcontainers supports.
@z

@x
To learn more about Testcontainers, visit the
[Testcontainers overview](https://testcontainers.com/getting-started/).
@y
To learn more about Testcontainers, visit the
[Testcontainers overview](https://testcontainers.com/getting-started/).
@z

@x
## Further reading
@y
## Further reading
@z

@x
- [Testcontainers for .NET documentation](https://dotnet.testcontainers.org/)
- [Testcontainers for .NET modules](https://dotnet.testcontainers.org/modules/)
- [Microsoft SQL Server module](https://www.nuget.org/packages/Testcontainers.MsSql)
- [Integration tests in ASP.NET Core](https://learn.microsoft.com/en-us/aspnet/core/test/integration-tests)
@y
- [Testcontainers for .NET documentation](https://dotnet.testcontainers.org/)
- [Testcontainers for .NET modules](https://dotnet.testcontainers.org/modules/)
- [Microsoft SQL Server module](https://www.nuget.org/packages/Testcontainers.MsSql)
- [Integration tests in ASP.NET Core](https://learn.microsoft.com/en-us/aspnet/core/test/integration-tests)
@z
