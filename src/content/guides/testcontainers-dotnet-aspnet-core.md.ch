%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Testing an ASP.NET Core web app with Testcontainers
linkTitle: ASP.NET Core testing
description: Learn how to use Testcontainers for .NET to replace SQLite with a real Microsoft SQL Server in ASP.NET Core integration tests.
keywords: testcontainers, dotnet, csharp, testing, mssql, asp.net core, integration testing, entity framework
summary: |
  Learn how to test an ASP.NET Core web app using Testcontainers for .NET
  with a real Microsoft SQL Server instance instead of SQLite.
@y
title: Testing an ASP.NET Core web app with Testcontainers
linkTitle: ASP.NET Core testing
description: Learn how to use Testcontainers for .NET to replace SQLite with a real Microsoft SQL Server in ASP.NET Core integration tests.
keywords: testcontainers, dotnet, csharp, testing, mssql, asp.net core, integration testing, entity framework
summary: |
  Learn how to test an ASP.NET Core web app using Testcontainers for .NET
  with a real Microsoft SQL Server instance instead of SQLite.
@z

@x
  time: 25 minutes
@y
  time: 25 分
@z

@x
<!-- Source: https://github.com/testcontainers/tc-guide-testing-aspnet-core -->
@y
<!-- Source: https://github.com/testcontainers/tc-guide-testing-aspnet-core -->
@z

@x
In this guide, you'll learn how to:
@y
In this guide, you'll learn how to:
@z

@x
- Use Testcontainers for .NET to spin up a Microsoft SQL Server container for integration tests
- Replace SQLite with a production-like database provider in ASP.NET Core tests
- Customize `WebApplicationFactory` to configure test dependencies with Testcontainers
- Manage container lifecycle with xUnit's `IAsyncLifetime`
@y
- Use Testcontainers for .NET to spin up a Microsoft SQL Server container for integration tests
- Replace SQLite with a production-like database provider in ASP.NET Core tests
- Customize `WebApplicationFactory` to configure test dependencies with Testcontainers
- Manage container lifecycle with xUnit's `IAsyncLifetime`
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- .NET 8.0+ SDK
- A code editor or IDE (Visual Studio, VS Code, Rider)
- A Docker environment supported by Testcontainers. For details, see the
  [Testcontainers .NET system requirements](https://dotnet.testcontainers.org/supported_docker_environment/).
@y
- .NET 8.0+ SDK
- A code editor or IDE (Visual Studio, VS Code, Rider)
- A Docker environment supported by Testcontainers. For details, see the
  [Testcontainers .NET system requirements](https://dotnet.testcontainers.org/supported_docker_environment/).
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
## Set up the project
@y
## Set up the project
@z

@x
### Background
@y
### Background
@z

@x
This guide builds on top of Microsoft's
[Integration tests in ASP.NET Core](https://learn.microsoft.com/en-us/aspnet/core/test/integration-tests)
documentation. The original sample uses an in-memory SQLite database as the
backing store for integration tests. You'll replace SQLite with a real
Microsoft SQL Server instance running in a Docker container using
Testcontainers.
@y
This guide builds on top of Microsoft's
[Integration tests in ASP.NET Core](https://learn.microsoft.com/en-us/aspnet/core/test/integration-tests)
documentation. The original sample uses an in-memory SQLite database as the
backing store for integration tests. You'll replace SQLite with a real
Microsoft SQL Server instance running in a Docker container using
Testcontainers.
@z

@x
You can find the original code sample in the
[dotnet/AspNetCore.Docs.Samples](https://github.com/dotnet/AspNetCore.Docs.Samples/tree/main/test/integration-tests/IntegrationTestsSample)
repository.
@y
You can find the original code sample in the
[dotnet/AspNetCore.Docs.Samples](https://github.com/dotnet/AspNetCore.Docs.Samples/tree/main/test/integration-tests/IntegrationTestsSample)
repository.
@z

@x
### Clone the repository
@y
### Clone the repository
@z

@x
Clone the Testcontainers guide repository and change into the project
directory:
@y
Clone the Testcontainers guide repository and change into the project
directory:
@z

@x
```console
$ git clone https://github.com/testcontainers/tc-guide-testing-aspnet-core.git
$ cd tc-guide-testing-aspnet-core
```
@y
```console
$ git clone https://github.com/testcontainers/tc-guide-testing-aspnet-core.git
$ cd tc-guide-testing-aspnet-core
```
@z

@x
### Project structure
@y
### Project structure
@z

@x
The solution contains two projects:
@y
The solution contains two projects:
@z

@x
```text
RazorPagesProject.sln
├── src/RazorPagesProject/              # ASP.NET Core Razor Pages app
└── tests/RazorPagesProject.Tests/      # xUnit integration tests
```
@y
```text
RazorPagesProject.sln
├── src/RazorPagesProject/              # ASP.NET Core Razor Pages app
└── tests/RazorPagesProject.Tests/      # xUnit integration tests
```
@z

@x
#### Application project
@y
#### Application project
@z

@x
The application project (`src/RazorPagesProject/RazorPagesProject.csproj`)
is a Razor Pages web app that uses Entity Framework Core with SQLite as its
default database provider:
@y
The application project (`src/RazorPagesProject/RazorPagesProject.csproj`)
is a Razor Pages web app that uses Entity Framework Core with SQLite as its
default database provider:
@z

@x
```xml
<Project Sdk="Microsoft.NET.Sdk.Web">
@y
```xml
<Project Sdk="Microsoft.NET.Sdk.Web">
@z

@x
  <PropertyGroup>
    <TargetFramework>net9.0</TargetFramework>
    <ImplicitUsings>enable</ImplicitUsings>
  </PropertyGroup>
@y
  <PropertyGroup>
    <TargetFramework>net9.0</TargetFramework>
    <ImplicitUsings>enable</ImplicitUsings>
  </PropertyGroup>
@z

@x
  <ItemGroup>
    <PackageReference Include="Microsoft.EntityFrameworkCore.Sqlite" Version="7.0.0" />
    <PackageReference Include="Microsoft.AspNetCore.Diagnostics.EntityFrameworkCore" Version="7.0.0" />
    <PackageReference Include="Microsoft.AspNetCore.Identity.EntityFrameworkCore" Version="7.0.0" />
    <PackageReference Include="Microsoft.AspNetCore.Identity.UI" Version="7.0.0" />
    <PackageReference Include="Microsoft.EntityFrameworkCore.Tools" Version="7.0.0">
      <PrivateAssets>all</PrivateAssets>
      <IncludeAssets>runtime; build; native; contentfiles; analyzers; buildtransitive</IncludeAssets>
    </PackageReference>
  </ItemGroup>
@y
  <ItemGroup>
    <PackageReference Include="Microsoft.EntityFrameworkCore.Sqlite" Version="7.0.0" />
    <PackageReference Include="Microsoft.AspNetCore.Diagnostics.EntityFrameworkCore" Version="7.0.0" />
    <PackageReference Include="Microsoft.AspNetCore.Identity.EntityFrameworkCore" Version="7.0.0" />
    <PackageReference Include="Microsoft.AspNetCore.Identity.UI" Version="7.0.0" />
    <PackageReference Include="Microsoft.EntityFrameworkCore.Tools" Version="7.0.0">
      <PrivateAssets>all</PrivateAssets>
      <IncludeAssets>runtime; build; native; contentfiles; analyzers; buildtransitive</IncludeAssets>
    </PackageReference>
  </ItemGroup>
@z

@x
</Project>
```
@y
</Project>
```
@z

@x
The `ApplicationDbContext` stores `Message` entities and provides methods to
query and manage them:
@y
The `ApplicationDbContext` stores `Message` entities and provides methods to
query and manage them:
@z

@x
```csharp
public class ApplicationDbContext : IdentityDbContext
{
    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
        : base(options)
    {
    }
@y
```csharp
public class ApplicationDbContext : IdentityDbContext
{
    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
        : base(options)
    {
    }
@z

@x
    public virtual DbSet<Message> Messages { get; set; }
@y
    public virtual DbSet<Message> Messages { get; set; }
@z

@x
    public async virtual Task<List<Message>> GetMessagesAsync()
    {
        return await Messages
            .OrderBy(message => message.Text)
            .AsNoTracking()
            .ToListAsync();
    }
@y
    public async virtual Task<List<Message>> GetMessagesAsync()
    {
        return await Messages
            .OrderBy(message => message.Text)
            .AsNoTracking()
            .ToListAsync();
    }
@z

@x
    public async virtual Task AddMessageAsync(Message message)
    {
        await Messages.AddAsync(message);
        await SaveChangesAsync();
    }
@y
    public async virtual Task AddMessageAsync(Message message)
    {
        await Messages.AddAsync(message);
        await SaveChangesAsync();
    }
@z

@x
    public async virtual Task DeleteAllMessagesAsync()
    {
        foreach (Message message in Messages)
        {
            Messages.Remove(message);
        }
@y
    public async virtual Task DeleteAllMessagesAsync()
    {
        foreach (Message message in Messages)
        {
            Messages.Remove(message);
        }
@z

@x
        await SaveChangesAsync();
    }
@y
        await SaveChangesAsync();
    }
@z

@x
    public async virtual Task DeleteMessageAsync(int id)
    {
        var message = await Messages.FindAsync(id);
@y
    public async virtual Task DeleteMessageAsync(int id)
    {
        var message = await Messages.FindAsync(id);
@z

@x
        if (message != null)
        {
            Messages.Remove(message);
            await SaveChangesAsync();
        }
    }
@y
        if (message != null)
        {
            Messages.Remove(message);
            await SaveChangesAsync();
        }
    }
@z

@x
    public void Initialize()
    {
        Messages.AddRange(GetSeedingMessages());
        SaveChanges();
    }
@y
    public void Initialize()
    {
        Messages.AddRange(GetSeedingMessages());
        SaveChanges();
    }
@z

@x
    public static List<Message> GetSeedingMessages()
    {
        return new List<Message>()
        {
            new Message(){ Text = "You're standing on my scarf." },
            new Message(){ Text = "Would you like a jelly baby?" },
            new Message(){ Text = "To the rational mind, nothing is inexplicable; only unexplained." }
        };
    }
}
```
@y
    public static List<Message> GetSeedingMessages()
    {
        return new List<Message>()
        {
            new Message(){ Text = "You're standing on my scarf." },
            new Message(){ Text = "Would you like a jelly baby?" },
            new Message(){ Text = "To the rational mind, nothing is inexplicable; only unexplained." }
        };
    }
}
```
@z

@x
#### Test project
@y
#### Test project
@z

@x
The test project (`tests/RazorPagesProject.Tests/RazorPagesProject.Tests.csproj`)
includes xUnit, the ASP.NET Core testing infrastructure, and the
Testcontainers MSSQL module:
@y
The test project (`tests/RazorPagesProject.Tests/RazorPagesProject.Tests.csproj`)
includes xUnit, the ASP.NET Core testing infrastructure, and the
Testcontainers MSSQL module:
@z

@x
```xml
<Project Sdk="Microsoft.NET.Sdk.Web">
@y
```xml
<Project Sdk="Microsoft.NET.Sdk.Web">
@z

@x
  <PropertyGroup>
    <TargetFramework>net9.0</TargetFramework>
    <ImplicitUsings>enable</ImplicitUsings>
  </PropertyGroup>
@y
  <PropertyGroup>
    <TargetFramework>net9.0</TargetFramework>
    <ImplicitUsings>enable</ImplicitUsings>
  </PropertyGroup>
@z

@x
  <ItemGroup>
    <PackageReference Include="AngleSharp" Version="0.17.1" />
    <PackageReference Include="Microsoft.AspNetCore.Diagnostics.EntityFrameworkCore" Version="7.0.0" />
    <PackageReference Include="Microsoft.AspNetCore.Identity.EntityFrameworkCore" Version="7.0.0" />
    <PackageReference Include="Microsoft.AspNetCore.Identity.UI" Version="7.0.0" />
    <PackageReference Include="Microsoft.AspNetCore.Mvc.Testing" Version="7.0.0" />
    <PackageReference Include="Microsoft.EntityFrameworkCore" Version="7.0.0" />
    <PackageReference Include="Microsoft.EntityFrameworkCore.Sqlite" Version="7.0.0" />
    <PackageReference Include="Microsoft.EntityFrameworkCore.SqlServer" Version="7.0.0" />
    <PackageReference Include="Microsoft.EntityFrameworkCore.Tools" Version="7.0.0">
      <PrivateAssets>all</PrivateAssets>
      <IncludeAssets>runtime; build; native; contentfiles; analyzers; buildtransitive</IncludeAssets>
    </PackageReference>
@y
  <ItemGroup>
    <PackageReference Include="AngleSharp" Version="0.17.1" />
    <PackageReference Include="Microsoft.AspNetCore.Diagnostics.EntityFrameworkCore" Version="7.0.0" />
    <PackageReference Include="Microsoft.AspNetCore.Identity.EntityFrameworkCore" Version="7.0.0" />
    <PackageReference Include="Microsoft.AspNetCore.Identity.UI" Version="7.0.0" />
    <PackageReference Include="Microsoft.AspNetCore.Mvc.Testing" Version="7.0.0" />
    <PackageReference Include="Microsoft.EntityFrameworkCore" Version="7.0.0" />
    <PackageReference Include="Microsoft.EntityFrameworkCore.Sqlite" Version="7.0.0" />
    <PackageReference Include="Microsoft.EntityFrameworkCore.SqlServer" Version="7.0.0" />
    <PackageReference Include="Microsoft.EntityFrameworkCore.Tools" Version="7.0.0">
      <PrivateAssets>all</PrivateAssets>
      <IncludeAssets>runtime; build; native; contentfiles; analyzers; buildtransitive</IncludeAssets>
    </PackageReference>
@z

@x
    <PackageReference Include="Microsoft.NET.Test.Sdk" Version="17.4.0" />
@y
    <PackageReference Include="Microsoft.NET.Test.Sdk" Version="17.4.0" />
@z

@x
    <PackageReference Include="Testcontainers.MsSql" Version="3.0.0" />
    <PackageReference Include="xunit" Version="2.4.2" />
    <PackageReference Include="xunit.runner.visualstudio" Version="2.4.5">
      <PrivateAssets>all</PrivateAssets>
      <IncludeAssets>runtime; build; native; contentfiles; analyzers; buildtransitive</IncludeAssets>
    </PackageReference>
  </ItemGroup>
@y
    <PackageReference Include="Testcontainers.MsSql" Version="3.0.0" />
    <PackageReference Include="xunit" Version="2.4.2" />
    <PackageReference Include="xunit.runner.visualstudio" Version="2.4.5">
      <PrivateAssets>all</PrivateAssets>
      <IncludeAssets>runtime; build; native; contentfiles; analyzers; buildtransitive</IncludeAssets>
    </PackageReference>
  </ItemGroup>
@z

@x
  <ItemGroup>
    <ProjectReference Include="..\..\src\RazorPagesProject\RazorPagesProject.csproj" />
  </ItemGroup>
@y
  <ItemGroup>
    <ProjectReference Include="..\..\src\RazorPagesProject\RazorPagesProject.csproj" />
  </ItemGroup>
@z

@x
  <ItemGroup>
    <Content Update="xunit.runner.json">
      <CopyToOutputDirectory>Always</CopyToOutputDirectory>
    </Content>
  </ItemGroup>
@y
  <ItemGroup>
    <Content Update="xunit.runner.json">
      <CopyToOutputDirectory>Always</CopyToOutputDirectory>
    </Content>
  </ItemGroup>
@z

@x
</Project>
```
@y
</Project>
```
@z

@x
The key dependencies are:
@y
The key dependencies are:
@z

@x
- `Microsoft.AspNetCore.Mvc.Testing` - provides `WebApplicationFactory` for
  bootstrapping the app in tests
- `Microsoft.EntityFrameworkCore.SqlServer` - the SQL Server database provider
  for Entity Framework Core
- `Testcontainers.MsSql` - the Testcontainers module for Microsoft SQL Server
@y
- `Microsoft.AspNetCore.Mvc.Testing` - provides `WebApplicationFactory` for
  bootstrapping the app in tests
- `Microsoft.EntityFrameworkCore.SqlServer` - the SQL Server database provider
  for Entity Framework Core
- `Testcontainers.MsSql` - the Testcontainers module for Microsoft SQL Server
@z

@x
#### Existing SQLite-based test factory
@y
#### Existing SQLite-based test factory
@z

@x
The original project includes a `CustomWebApplicationFactory` that replaces
the application's database with an in-memory SQLite instance:
@y
The original project includes a `CustomWebApplicationFactory` that replaces
the application's database with an in-memory SQLite instance:
@z

@x
```csharp
public class CustomWebApplicationFactory<TProgram>
    : WebApplicationFactory<TProgram> where TProgram : class
{
    protected override void ConfigureWebHost(IWebHostBuilder builder)
    {
        builder.ConfigureServices(services =>
        {
            var dbContextDescriptor = services.SingleOrDefault(
                d => d.ServiceType ==
                    typeof(DbContextOptions<ApplicationDbContext>));
@y
```csharp
public class CustomWebApplicationFactory<TProgram>
    : WebApplicationFactory<TProgram> where TProgram : class
{
    protected override void ConfigureWebHost(IWebHostBuilder builder)
    {
        builder.ConfigureServices(services =>
        {
            var dbContextDescriptor = services.SingleOrDefault(
                d => d.ServiceType ==
                    typeof(DbContextOptions<ApplicationDbContext>));
@z

@x
            services.Remove(dbContextDescriptor);
@y
            services.Remove(dbContextDescriptor);
@z

@x
            var dbConnectionDescriptor = services.SingleOrDefault(
                d => d.ServiceType ==
                    typeof(DbConnection));
@y
            var dbConnectionDescriptor = services.SingleOrDefault(
                d => d.ServiceType ==
                    typeof(DbConnection));
@z

@x
            services.Remove(dbConnectionDescriptor);
@y
            services.Remove(dbConnectionDescriptor);
@z

@x
            // Create open SqliteConnection so EF won't automatically close it.
            services.AddSingleton<DbConnection>(container =>
            {
                var connection = new SqliteConnection("DataSource=:memory:");
                connection.Open();
@y
            // Create open SqliteConnection so EF won't automatically close it.
            services.AddSingleton<DbConnection>(container =>
            {
                var connection = new SqliteConnection("DataSource=:memory:");
                connection.Open();
@z

@x
                return connection;
            });
@y
                return connection;
            });
@z

@x
            services.AddDbContext<ApplicationDbContext>((container, options) =>
            {
                var connection = container.GetRequiredService<DbConnection>();
                options.UseSqlite(connection);
            });
        });
@y
            services.AddDbContext<ApplicationDbContext>((container, options) =>
            {
                var connection = container.GetRequiredService<DbConnection>();
                options.UseSqlite(connection);
            });
        });
@z

@x
        builder.UseEnvironment("Development");
    }
}
```
@y
        builder.UseEnvironment("Development");
    }
}
```
@z

@x
While this approach works, SQLite has behavioral differences from the database
you'd use in production. In the next section, you'll replace it with a
Testcontainers-managed Microsoft SQL Server instance.
@y
While this approach works, SQLite has behavioral differences from the database
you'd use in production. In the next section, you'll replace it with a
Testcontainers-managed Microsoft SQL Server instance.
@z

@x
## Write tests with Testcontainers
@y
## Write tests with Testcontainers
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
### Add dependencies
@y
### Add dependencies
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
### Create the test class
@y
### Create the test class
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
### Understand the test structure
@y
### Understand the test structure
@z

@x
#### Container lifecycle with IAsyncLifetime
@y
#### Container lifecycle with IAsyncLifetime
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
#### Nested test class with IClassFixture
@y
#### Nested test class with IClassFixture
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
#### Custom WebApplicationFactory
@y
#### Custom WebApplicationFactory
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
### Summary
@y
### Summary
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
### Further reading
@y
### Further reading
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
