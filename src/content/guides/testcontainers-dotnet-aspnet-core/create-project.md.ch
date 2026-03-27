%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Set up the project
linkTitle: Create the project
description: Set up an ASP.NET Core Razor Pages project with integration test dependencies.
@y
title: Set up the project
linkTitle: Create the project
description: Set up an ASP.NET Core Razor Pages project with integration test dependencies.
@z

@x
## Background
@y
## Background
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
## Clone the repository
@y
## Clone the repository
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
## Project structure
@y
## Project structure
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
### Application project
@y
### Application project
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
### Test project
@y
### Test project
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
### Existing SQLite-based test factory
@y
### Existing SQLite-based test factory
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
