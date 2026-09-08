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

@x
## Create the .NET project
@y
## Create the .NET project
@z

@x
### Set up the solution
@y
### Set up the solution
@z

@x
Create a .NET solution with source and test projects:
@y
Create a .NET solution with source and test projects:
@z

@x
```console
$ dotnet new sln -o TestcontainersDemo
$ cd TestcontainersDemo
$ dotnet new classlib -o CustomerService
$ dotnet sln add ./CustomerService/CustomerService.csproj
$ dotnet new xunit -o CustomerService.Tests
$ dotnet sln add ./CustomerService.Tests/CustomerService.Tests.csproj
$ dotnet add ./CustomerService.Tests/CustomerService.Tests.csproj reference ./CustomerService/CustomerService.csproj
```
@y
```console
$ dotnet new sln -o TestcontainersDemo
$ cd TestcontainersDemo
$ dotnet new classlib -o CustomerService
$ dotnet sln add ./CustomerService/CustomerService.csproj
$ dotnet new xunit -o CustomerService.Tests
$ dotnet sln add ./CustomerService.Tests/CustomerService.Tests.csproj
$ dotnet add ./CustomerService.Tests/CustomerService.Tests.csproj reference ./CustomerService/CustomerService.csproj
```
@z

@x
Add the Npgsql dependency to the source project:
@y
Add the Npgsql dependency to the source project:
@z

@x
```console
$ dotnet add ./CustomerService/CustomerService.csproj package Npgsql
```
@y
```console
$ dotnet add ./CustomerService/CustomerService.csproj package Npgsql
```
@z

@x
### Implement the business logic
@y
### Implement the business logic
@z

@x
Create a `Customer` record type:
@y
Create a `Customer` record type:
@z

@x
```csharp
namespace Customers;
@y
```csharp
namespace Customers;
@z

@x
public readonly record struct Customer(long Id, string Name);
```
@y
public readonly record struct Customer(long Id, string Name);
```
@z

@x
Create a `DbConnectionProvider` class to manage database connections:
@y
Create a `DbConnectionProvider` class to manage database connections:
@z

@x
```csharp
using System.Data.Common;
using Npgsql;
@y
```csharp
using System.Data.Common;
using Npgsql;
@z

@x
namespace Customers;
@y
namespace Customers;
@z

@x
public sealed class DbConnectionProvider
{
    private readonly string _connectionString;
@y
public sealed class DbConnectionProvider
{
    private readonly string _connectionString;
@z

@x
    public DbConnectionProvider(string connectionString)
    {
        _connectionString = connectionString;
    }
@y
    public DbConnectionProvider(string connectionString)
    {
        _connectionString = connectionString;
    }
@z

@x
    public DbConnection GetConnection()
    {
        return new NpgsqlConnection(_connectionString);
    }
}
```
@y
    public DbConnection GetConnection()
    {
        return new NpgsqlConnection(_connectionString);
    }
}
```
@z

@x
Create the `CustomerService` class:
@y
Create the `CustomerService` class:
@z

@x
```csharp
namespace Customers;
@y
```csharp
namespace Customers;
@z

@x
public sealed class CustomerService
{
    private readonly DbConnectionProvider _dbConnectionProvider;
@y
public sealed class CustomerService
{
    private readonly DbConnectionProvider _dbConnectionProvider;
@z

@x
    public CustomerService(DbConnectionProvider dbConnectionProvider)
    {
        _dbConnectionProvider = dbConnectionProvider;
        CreateCustomersTable();
    }
@y
    public CustomerService(DbConnectionProvider dbConnectionProvider)
    {
        _dbConnectionProvider = dbConnectionProvider;
        CreateCustomersTable();
    }
@z

@x
    public IEnumerable<Customer> GetCustomers()
    {
        IList<Customer> customers = new List<Customer>();
@y
    public IEnumerable<Customer> GetCustomers()
    {
        IList<Customer> customers = new List<Customer>();
@z

@x
        using var connection = _dbConnectionProvider.GetConnection();
        using var command = connection.CreateCommand();
        command.CommandText = "SELECT id, name FROM customers";
        command.Connection?.Open();
@y
        using var connection = _dbConnectionProvider.GetConnection();
        using var command = connection.CreateCommand();
        command.CommandText = "SELECT id, name FROM customers";
        command.Connection?.Open();
@z

@x
        using var dataReader = command.ExecuteReader();
        while (dataReader.Read())
        {
            var id = dataReader.GetInt64(0);
            var name = dataReader.GetString(1);
            customers.Add(new Customer(id, name));
        }
@y
        using var dataReader = command.ExecuteReader();
        while (dataReader.Read())
        {
            var id = dataReader.GetInt64(0);
            var name = dataReader.GetString(1);
            customers.Add(new Customer(id, name));
        }
@z

@x
        return customers;
    }
@y
        return customers;
    }
@z

@x
    public void Create(Customer customer)
    {
        using var connection = _dbConnectionProvider.GetConnection();
        using var command = connection.CreateCommand();
@y
    public void Create(Customer customer)
    {
        using var connection = _dbConnectionProvider.GetConnection();
        using var command = connection.CreateCommand();
@z

@x
        var id = command.CreateParameter();
        id.ParameterName = "@id";
        id.Value = customer.Id;
@y
        var id = command.CreateParameter();
        id.ParameterName = "@id";
        id.Value = customer.Id;
@z

@x
        var name = command.CreateParameter();
        name.ParameterName = "@name";
        name.Value = customer.Name;
@y
        var name = command.CreateParameter();
        name.ParameterName = "@name";
        name.Value = customer.Name;
@z

@x
        command.CommandText = "INSERT INTO customers (id, name) VALUES(@id, @name)";
        command.Parameters.Add(id);
        command.Parameters.Add(name);
        command.Connection?.Open();
        command.ExecuteNonQuery();
    }
@y
        command.CommandText = "INSERT INTO customers (id, name) VALUES(@id, @name)";
        command.Parameters.Add(id);
        command.Parameters.Add(name);
        command.Connection?.Open();
        command.ExecuteNonQuery();
    }
@z

@x
    private void CreateCustomersTable()
    {
        using var connection = _dbConnectionProvider.GetConnection();
        using var command = connection.CreateCommand();
        command.CommandText = "CREATE TABLE IF NOT EXISTS customers (id BIGINT NOT NULL, name VARCHAR NOT NULL, PRIMARY KEY (id))";
        command.Connection?.Open();
        command.ExecuteNonQuery();
    }
}
```
@y
    private void CreateCustomersTable()
    {
        using var connection = _dbConnectionProvider.GetConnection();
        using var command = connection.CreateCommand();
        command.CommandText = "CREATE TABLE IF NOT EXISTS customers (id BIGINT NOT NULL, name VARCHAR NOT NULL, PRIMARY KEY (id))";
        command.Connection?.Open();
        command.ExecuteNonQuery();
    }
}
```
@z

@x
Here's what `CustomerService` does:
@y
Here's what `CustomerService` does:
@z

@x
- The constructor calls `CreateCustomersTable()` to ensure the table exists.
- `GetCustomers()` fetches all rows from the `customers` table and returns them as `Customer` objects.
- `Create()` inserts a customer record into the database.
@y
- The constructor calls `CreateCustomersTable()` to ensure the table exists.
- `GetCustomers()` fetches all rows from the `customers` table and returns them as `Customer` objects.
- `Create()` inserts a customer record into the database.
@z

@x
## Write tests with Testcontainers
@y
## Write tests with Testcontainers
@z

@x
### Add Testcontainers dependencies
@y
### Add Testcontainers dependencies
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
### Write the test
@y
### Write the test
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

@x
## Run tests and next steps
@y
## Run tests and next steps
@z

@x
### Run the tests
@y
### Run the tests
@z

@x
Run the tests:
@y
Run the tests:
@z

@x
```console
$ dotnet test
```
@y
```console
$ dotnet test
```
@z

@x
You can see in the output that Testcontainers pulls the Postgres Docker image
from Docker Hub (if not already available locally), starts the container, and
runs the test.
@y
You can see in the output that Testcontainers pulls the Postgres Docker image
from Docker Hub (if not already available locally), starts the container, and
runs the test.
@z

@x
Writing an integration test using Testcontainers works like writing a unit test
that you can run from your IDE. Your teammates can clone the project and run
tests without installing Postgres on their machines.
@y
Writing an integration test using Testcontainers works like writing a unit test
that you can run from your IDE. Your teammates can clone the project and run
tests without installing Postgres on their machines.
@z

@x
### Summary
@y
### Summary
@z

@x
The Testcontainers for .NET library helps you write integration tests using the
same type of database (Postgres) that you use in production, instead of mocks.
Because you aren't using mocks and instead talk to real services, you're free
to refactor code and still verify that the application works as expected.
@y
The Testcontainers for .NET library helps you write integration tests using the
same type of database (Postgres) that you use in production, instead of mocks.
Because you aren't using mocks and instead talk to real services, you're free
to refactor code and still verify that the application works as expected.
@z

@x
In addition to Postgres, Testcontainers provides dedicated
[modules](https://www.nuget.org/profiles/Testcontainers) for many SQL
databases, NoSQL databases, messaging queues, and more.
@y
In addition to Postgres, Testcontainers provides dedicated
[modules](https://www.nuget.org/profiles/Testcontainers) for many SQL
databases, NoSQL databases, messaging queues, and more.
@z

@x
To learn more about Testcontainers, visit the
[Testcontainers overview](https://testcontainers.com/getting-started/).
@y
To learn more about Testcontainers, visit the
[Testcontainers overview](https://testcontainers.com/getting-started/).
@z

@x
### Further reading
@y
### Further reading
@z

@x
- [Testing an ASP.NET Core web app](https://testcontainers.com/guides/testing-an-aspnet-core-web-app/)
@y
- [Testing an ASP.NET Core web app](https://testcontainers.com/guides/testing-an-aspnet-core-web-app/)
@z
