%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Write tests with Testcontainers
linkTitle: Write tests
description: Write integration tests using Testcontainers for .NET and xUnit with a real PostgreSQL database.
@y
title: Write tests with Testcontainers
linkTitle: Write tests
description: Write integration tests using Testcontainers for .NET and xUnit with a real PostgreSQL database.
@z

@x
## Add Testcontainers dependencies
@y
## Add Testcontainers dependencies
@z

@x
Add the Testcontainers PostgreSQL module to the test project:
@y
Add the Testcontainers PostgreSQL module to the test project:
@z

@x
```console
$ dotnet add ./CustomerService.Tests/CustomerService.Tests.csproj package Testcontainers.PostgreSql
```
@y
```console
$ dotnet add ./CustomerService.Tests/CustomerService.Tests.csproj package Testcontainers.PostgreSql
```
@z

@x
## Write the test
@y
## Write the test
@z

@x
Create `CustomerServiceTest.cs` in the test project:
@y
Create `CustomerServiceTest.cs` in the test project:
@z

@x
```csharp
using Testcontainers.PostgreSql;
@y
```csharp
using Testcontainers.PostgreSql;
@z

@x
namespace Customers.Tests;
@y
namespace Customers.Tests;
@z

@x
public sealed class CustomerServiceTest : IAsyncLifetime
{
    private readonly PostgreSqlContainer _postgres = new PostgreSqlBuilder()
        .WithImage("postgres:16-alpine")
        .Build();
@y
public sealed class CustomerServiceTest : IAsyncLifetime
{
    private readonly PostgreSqlContainer _postgres = new PostgreSqlBuilder()
        .WithImage("postgres:16-alpine")
        .Build();
@z

@x
    public Task InitializeAsync()
    {
        return _postgres.StartAsync();
    }
@y
    public Task InitializeAsync()
    {
        return _postgres.StartAsync();
    }
@z

@x
    public Task DisposeAsync()
    {
        return _postgres.DisposeAsync().AsTask();
    }
@y
    public Task DisposeAsync()
    {
        return _postgres.DisposeAsync().AsTask();
    }
@z

@x
    [Fact]
    public void ShouldReturnTwoCustomers()
    {
        // Given
        var customerService = new CustomerService(new DbConnectionProvider(_postgres.GetConnectionString()));
@y
    [Fact]
    public void ShouldReturnTwoCustomers()
    {
        // Given
        var customerService = new CustomerService(new DbConnectionProvider(_postgres.GetConnectionString()));
@z

@x
        // When
        customerService.Create(new Customer(1, "George"));
        customerService.Create(new Customer(2, "John"));
        var customers = customerService.GetCustomers();
@y
        // When
        customerService.Create(new Customer(1, "George"));
        customerService.Create(new Customer(2, "John"));
        var customers = customerService.GetCustomers();
@z

@x
        // Then
        Assert.Equal(2, customers.Count());
    }
}
```
@y
        // Then
        Assert.Equal(2, customers.Count());
    }
}
```
@z

@x
Here's what the test does:
@y
Here's what the test does:
@z

@x
- Declares a `PostgreSqlContainer` using the `PostgreSqlBuilder` with the
  `postgres:16-alpine` Docker image.
- Implements `IAsyncLifetime` for container lifecycle management:
  - `InitializeAsync()` starts the container before the test runs.
  - `DisposeAsync()` stops and removes the container after the test finishes.
- `ShouldReturnTwoCustomers()` creates a `CustomerService` with connection
  details from the container, inserts two customers, fetches all customers, and
  asserts the count.
@y
- Declares a `PostgreSqlContainer` using the `PostgreSqlBuilder` with the
  `postgres:16-alpine` Docker image.
- Implements `IAsyncLifetime` for container lifecycle management:
  - `InitializeAsync()` starts the container before the test runs.
  - `DisposeAsync()` stops and removes the container after the test finishes.
- `ShouldReturnTwoCustomers()` creates a `CustomerService` with connection
  details from the container, inserts two customers, fetches all customers, and
  asserts the count.
@z
