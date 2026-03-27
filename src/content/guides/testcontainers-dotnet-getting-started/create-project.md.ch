%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Create the .NET project
linkTitle: Create the project
description: Set up a .NET solution with a PostgreSQL-backed customer service.
@y
title: Create the .NET project
linkTitle: Create the project
description: Set up a .NET solution with a PostgreSQL-backed customer service.
@z

@x
## Set up the solution
@y
## Set up the solution
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
## Implement the business logic
@y
## Implement the business logic
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
