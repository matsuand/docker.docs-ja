%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Write tests with Testcontainers
linkTitle: Write tests
description: Replace SQLite with a real Microsoft SQL Server using Testcontainers for .NET.
@y
title: Write tests with Testcontainers
linkTitle: Write tests
description: Replace SQLite with a real Microsoft SQL Server using Testcontainers for .NET.
@z

@x
The existing tests use an in-memory SQLite database. While convenient, this
doesn't match production behavior. You can replace it with a real Microsoft SQL
Server instance managed by Testcontainers.
@y
The existing tests use an in-memory SQLite database. While convenient, this
doesn't match production behavior. You can replace it with a real Microsoft SQL
Server instance managed by Testcontainers.
@z

@x
## Add dependencies
@y
## Add dependencies
@z

@x
Change to the test project directory and add the SQL Server Entity Framework
provider and the Testcontainers MSSQL module:
@y
Change to the test project directory and add the SQL Server Entity Framework
provider and the Testcontainers MSSQL module:
@z

@x
```console
$ cd tests/RazorPagesProject.Tests
$ dotnet add package Microsoft.EntityFrameworkCore.SqlServer --version 7.0.0
$ dotnet add package Testcontainers.MsSql --version 3.0.0
```
@y
```console
$ cd tests/RazorPagesProject.Tests
$ dotnet add package Microsoft.EntityFrameworkCore.SqlServer --version 7.0.0
$ dotnet add package Testcontainers.MsSql --version 3.0.0
```
@z

@x
> [!NOTE]
> Testcontainers for .NET offers a range of
> [modules](https://www.nuget.org/profiles/Testcontainers) that follow best
> practice configurations.
@y
> [!NOTE]
> Testcontainers for .NET offers a range of
> [modules](https://www.nuget.org/profiles/Testcontainers) that follow best
> practice configurations.
@z

@x
## Create the test class
@y
## Create the test class
@z

@x
Create a `MsSqlTests.cs` file in the `IntegrationTests` directory. This class
manages the SQL Server container lifecycle and contains a nested test class.
@y
Create a `MsSqlTests.cs` file in the `IntegrationTests` directory. This class
manages the SQL Server container lifecycle and contains a nested test class.
@z

@x
```csharp
using System.Data.Common;
using System.Net;
using AngleSharp.Html.Dom;
using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.EntityFrameworkCore;
using RazorPagesProject.Data;
using RazorPagesProject.Tests.Helpers;
using Testcontainers.MsSql;
using Xunit;
@y
```csharp
using System.Data.Common;
using System.Net;
using AngleSharp.Html.Dom;
using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.EntityFrameworkCore;
using RazorPagesProject.Data;
using RazorPagesProject.Tests.Helpers;
using Testcontainers.MsSql;
using Xunit;
@z

@x
namespace RazorPagesProject.Tests.IntegrationTests;
@y
namespace RazorPagesProject.Tests.IntegrationTests;
@z

@x
public sealed class MsSqlTests : IAsyncLifetime
{
    private readonly MsSqlContainer _msSqlContainer = new MsSqlBuilder().Build();
@y
public sealed class MsSqlTests : IAsyncLifetime
{
    private readonly MsSqlContainer _msSqlContainer = new MsSqlBuilder().Build();
@z

@x
    public Task InitializeAsync()
    {
        return _msSqlContainer.StartAsync();
    }
@y
    public Task InitializeAsync()
    {
        return _msSqlContainer.StartAsync();
    }
@z

@x
    public Task DisposeAsync()
    {
        return _msSqlContainer.DisposeAsync().AsTask();
    }
@y
    public Task DisposeAsync()
    {
        return _msSqlContainer.DisposeAsync().AsTask();
    }
@z

@x
    public sealed class IndexPageTests : IClassFixture<MsSqlTests>, IDisposable
    {
        private readonly WebApplicationFactory<Program> _webApplicationFactory;
@y
    public sealed class IndexPageTests : IClassFixture<MsSqlTests>, IDisposable
    {
        private readonly WebApplicationFactory<Program> _webApplicationFactory;
@z

@x
        private readonly HttpClient _httpClient;
@y
        private readonly HttpClient _httpClient;
@z

@x
        public IndexPageTests(MsSqlTests fixture)
        {
            var clientOptions = new WebApplicationFactoryClientOptions();
            clientOptions.AllowAutoRedirect = false;
@y
        public IndexPageTests(MsSqlTests fixture)
        {
            var clientOptions = new WebApplicationFactoryClientOptions();
            clientOptions.AllowAutoRedirect = false;
@z

@x
            _webApplicationFactory = new CustomWebApplicationFactory(fixture);
            _httpClient = _webApplicationFactory.CreateClient(clientOptions);
        }
@y
            _webApplicationFactory = new CustomWebApplicationFactory(fixture);
            _httpClient = _webApplicationFactory.CreateClient(clientOptions);
        }
@z

@x
        public void Dispose()
        {
            _webApplicationFactory.Dispose();
        }
@y
        public void Dispose()
        {
            _webApplicationFactory.Dispose();
        }
@z

@x
        [Fact]
        public async Task Post_DeleteAllMessagesHandler_ReturnsRedirectToRoot()
        {
            // Arrange
            var defaultPage = await _httpClient.GetAsync("/")
                .ConfigureAwait(false);
@y
        [Fact]
        public async Task Post_DeleteAllMessagesHandler_ReturnsRedirectToRoot()
        {
            // Arrange
            var defaultPage = await _httpClient.GetAsync("/")
                .ConfigureAwait(false);
@z

@x
            var document = await HtmlHelpers.GetDocumentAsync(defaultPage)
                .ConfigureAwait(false);
@y
            var document = await HtmlHelpers.GetDocumentAsync(defaultPage)
                .ConfigureAwait(false);
@z

@x
            // Act
            var form = (IHtmlFormElement)document.QuerySelector("form[id='messages']");
            var submitButton = (IHtmlButtonElement)document.QuerySelector("button[id='deleteAllBtn']");
@y
            // Act
            var form = (IHtmlFormElement)document.QuerySelector("form[id='messages']");
            var submitButton = (IHtmlButtonElement)document.QuerySelector("button[id='deleteAllBtn']");
@z

@x
            var response = await _httpClient.SendAsync(form, submitButton)
                .ConfigureAwait(false);
@y
            var response = await _httpClient.SendAsync(form, submitButton)
                .ConfigureAwait(false);
@z

@x
            // Assert
            Assert.Equal(HttpStatusCode.OK, defaultPage.StatusCode);
            Assert.Equal(HttpStatusCode.Redirect, response.StatusCode);
            Assert.Equal("/", response.Headers.Location.OriginalString);
        }
@y
            // Assert
            Assert.Equal(HttpStatusCode.OK, defaultPage.StatusCode);
            Assert.Equal(HttpStatusCode.Redirect, response.StatusCode);
            Assert.Equal("/", response.Headers.Location.OriginalString);
        }
@z

@x
        private sealed class CustomWebApplicationFactory : WebApplicationFactory<Program>
        {
            private readonly string _connectionString;
@y
        private sealed class CustomWebApplicationFactory : WebApplicationFactory<Program>
        {
            private readonly string _connectionString;
@z

@x
            public CustomWebApplicationFactory(MsSqlTests fixture)
            {
                _connectionString = fixture._msSqlContainer.GetConnectionString();
            }
@y
            public CustomWebApplicationFactory(MsSqlTests fixture)
            {
                _connectionString = fixture._msSqlContainer.GetConnectionString();
            }
@z

@x
            protected override void ConfigureWebHost(IWebHostBuilder builder)
            {
                builder.ConfigureServices(services =>
                {
                    services.Remove(services.SingleOrDefault(service => typeof(DbContextOptions<ApplicationDbContext>) == service.ServiceType));
                    services.Remove(services.SingleOrDefault(service => typeof(DbConnection) == service.ServiceType));
                    services.AddDbContext<ApplicationDbContext>((_, option) => option.UseSqlServer(_connectionString));
                });
            }
        }
    }
}
```
@y
            protected override void ConfigureWebHost(IWebHostBuilder builder)
            {
                builder.ConfigureServices(services =>
                {
                    services.Remove(services.SingleOrDefault(service => typeof(DbContextOptions<ApplicationDbContext>) == service.ServiceType));
                    services.Remove(services.SingleOrDefault(service => typeof(DbConnection) == service.ServiceType));
                    services.AddDbContext<ApplicationDbContext>((_, option) => option.UseSqlServer(_connectionString));
                });
            }
        }
    }
}
```
@z

@x
## Understand the test structure
@y
## Understand the test structure
@z

@x
### Container lifecycle with IAsyncLifetime
@y
### Container lifecycle with IAsyncLifetime
@z

@x
The outer `MsSqlTests` class implements `IAsyncLifetime`. xUnit calls
`InitializeAsync()` right after creating the class instance, which starts the
SQL Server container. After all tests complete, `DisposeAsync()` stops and
removes the container.
@y
The outer `MsSqlTests` class implements `IAsyncLifetime`. xUnit calls
`InitializeAsync()` right after creating the class instance, which starts the
SQL Server container. After all tests complete, `DisposeAsync()` stops and
removes the container.
@z

@x
```csharp
private readonly MsSqlContainer _msSqlContainer = new MsSqlBuilder().Build();
```
@y
```csharp
private readonly MsSqlContainer _msSqlContainer = new MsSqlBuilder().Build();
```
@z

@x
`MsSqlBuilder().Build()` creates a pre-configured Microsoft SQL Server
container. Testcontainers modules follow best practices, so you don't need
to configure ports, passwords, or startup wait strategies yourself.
@y
`MsSqlBuilder().Build()` creates a pre-configured Microsoft SQL Server
container. Testcontainers modules follow best practices, so you don't need
to configure ports, passwords, or startup wait strategies yourself.
@z

@x
### Nested test class with IClassFixture
@y
### Nested test class with IClassFixture
@z

@x
The `IndexPageTests` class is nested inside `MsSqlTests` and implements
`IClassFixture<MsSqlTests>`. This gives the test class access to the
container's private field and creates a clean hierarchy in the test explorer.
@y
The `IndexPageTests` class is nested inside `MsSqlTests` and implements
`IClassFixture<MsSqlTests>`. This gives the test class access to the
container's private field and creates a clean hierarchy in the test explorer.
@z

@x
### Custom WebApplicationFactory
@y
### Custom WebApplicationFactory
@z

@x
Instead of using the SQLite-based factory, the nested
`CustomWebApplicationFactory` retrieves the connection string from the running
SQL Server container and passes it to `UseSqlServer()`:
@y
Instead of using the SQLite-based factory, the nested
`CustomWebApplicationFactory` retrieves the connection string from the running
SQL Server container and passes it to `UseSqlServer()`:
@z

@x
```csharp
private sealed class CustomWebApplicationFactory : WebApplicationFactory<Program>
{
    private readonly string _connectionString;
@y
```csharp
private sealed class CustomWebApplicationFactory : WebApplicationFactory<Program>
{
    private readonly string _connectionString;
@z

@x
    public CustomWebApplicationFactory(MsSqlTests fixture)
    {
        _connectionString = fixture._msSqlContainer.GetConnectionString();
    }
@y
    public CustomWebApplicationFactory(MsSqlTests fixture)
    {
        _connectionString = fixture._msSqlContainer.GetConnectionString();
    }
@z

@x
    protected override void ConfigureWebHost(IWebHostBuilder builder)
    {
        builder.ConfigureServices(services =>
        {
            services.Remove(services.SingleOrDefault(service => typeof(DbContextOptions<ApplicationDbContext>) == service.ServiceType));
            services.Remove(services.SingleOrDefault(service => typeof(DbConnection) == service.ServiceType));
            services.AddDbContext<ApplicationDbContext>((_, option) => option.UseSqlServer(_connectionString));
        });
    }
}
```
@y
    protected override void ConfigureWebHost(IWebHostBuilder builder)
    {
        builder.ConfigureServices(services =>
        {
            services.Remove(services.SingleOrDefault(service => typeof(DbContextOptions<ApplicationDbContext>) == service.ServiceType));
            services.Remove(services.SingleOrDefault(service => typeof(DbConnection) == service.ServiceType));
            services.AddDbContext<ApplicationDbContext>((_, option) => option.UseSqlServer(_connectionString));
        });
    }
}
```
@z

@x
This factory:
@y
This factory:
@z

@x
1. Removes the existing `DbContextOptions<ApplicationDbContext>` registration
2. Removes the existing `DbConnection` registration
3. Adds a new `ApplicationDbContext` configured with the SQL Server connection
   string from the Testcontainers-managed container
@y
1. Removes the existing `DbContextOptions<ApplicationDbContext>` registration
2. Removes the existing `DbConnection` registration
3. Adds a new `ApplicationDbContext` configured with the SQL Server connection
   string from the Testcontainers-managed container
@z

@x
> [!NOTE]
> The Microsoft SQL Server Docker image isn't compatible with ARM devices, such
> as Macs with Apple Silicon. You can use the
> [SqlEdge](https://www.nuget.org/packages/Testcontainers.SqlEdge) module or
> [Testcontainers Cloud](https://www.testcontainers.cloud/) as alternatives.
@y
> [!NOTE]
> The Microsoft SQL Server Docker image isn't compatible with ARM devices, such
> as Macs with Apple Silicon. You can use the
> [SqlEdge](https://www.nuget.org/packages/Testcontainers.SqlEdge) module or
> [Testcontainers Cloud](https://www.testcontainers.cloud/) as alternatives.
@z
