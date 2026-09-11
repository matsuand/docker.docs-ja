%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: .NET
description: Migrate a .NET application to Docker Hardened Images
@y
title: .NET
description: Migrate a .NET application to Docker Hardened Images
@z

@x
keywords: dotnet, .net, csharp, aspnet, migration, dhi
@y
keywords: dotnet, .net, csharp, aspnet, migration, dhi
@z

@x
This example shows how to migrate a .NET application to Docker Hardened Images.
@y
This example shows how to migrate a .NET application to Docker Hardened Images.
@z

@x
The following examples show Dockerfiles before and after migration to Docker
Hardened Images. Each example includes four variations:
@y
The following examples show Dockerfiles before and after migration to Docker
Hardened Images. Each example includes four variations:
@z

@x
- Before (Wolfi): A sample Dockerfile using Wolfi distribution images, before migrating to DHI
- Before (DOI): A sample Dockerfile using Docker Official Images, before migrating to DHI
- After (multi-stage): A sample Dockerfile after migrating to DHI with multi-stage builds (recommended for minimal, secure images)
- After (single-stage): A sample Dockerfile after migrating to DHI with single-stage builds (simpler but results in a larger image with a broader attack surface)
@y
- Before (Wolfi): A sample Dockerfile using Wolfi distribution images, before migrating to DHI
- Before (DOI): A sample Dockerfile using Docker Official Images, before migrating to DHI
- After (multi-stage): A sample Dockerfile after migrating to DHI with multi-stage builds (recommended for minimal, secure images)
- After (single-stage): A sample Dockerfile after migrating to DHI with single-stage builds (simpler but results in a larger image with a broader attack surface)
@z

@x
> [!NOTE]
>
> Multi-stage builds are recommended for most use cases. Single-stage builds are
> supported for simplicity, but come with tradeoffs in size and security.
>
> You must authenticate to `dhi.io` before you can pull Docker Hardened Images.
> Use your Docker ID credentials (the same username and password you use for
> Docker Hub). If you don't have a Docker account, [create
> one](../../../accounts/individual/create-account.md) for free.
>
> Run `docker login dhi.io` to authenticate.
@y
> [!NOTE]
>
> Multi-stage builds are recommended for most use cases. Single-stage builds are
> supported for simplicity, but come with tradeoffs in size and security.
>
> You must authenticate to `dhi.io` before you can pull Docker Hardened Images.
> Use your Docker ID credentials (the same username and password you use for
> Docker Hub). If you don't have a Docker account, [create
> one](../../../accounts/individual/create-account.md) for free.
>
> Run `docker login dhi.io` to authenticate.
@z

@x
{{< tabs >}}
{{< tab name="Before (Wolfi)" >}}
@y
{{< tabs >}}
{{< tab name="Before (Wolfi)" >}}
@z

@x
```dockerfile
#syntax=docker/dockerfile:1
@y
```dockerfile
#syntax=docker/dockerfile:1
@z

@x
FROM cgr.dev/chainguard/dotnet-sdk:latest-dev AS builder
@y
FROM cgr.dev/chainguard/dotnet-sdk:latest-dev AS builder
@z

@x
WORKDIR /src
COPY . ./
@y
WORKDIR /src
COPY . ./
@z

@x
# Install any additional packages if needed using apk
# RUN apk add --no-cache git
@y
# Install any additional packages if needed using apk
# RUN apk add --no-cache git
@z

@x
RUN dotnet restore
RUN dotnet publish -c Release -o /src/out --no-restore
@y
RUN dotnet restore
RUN dotnet publish -c Release -o /src/out --no-restore
@z

@x
FROM cgr.dev/chainguard/aspnet-runtime:latest
@y
FROM cgr.dev/chainguard/aspnet-runtime:latest
@z

@x
WORKDIR /app
COPY --from=builder /src/out ./
@y
WORKDIR /app
COPY --from=builder /src/out ./
@z

@x
ENTRYPOINT ["dotnet", "app.dll"]
```
@y
ENTRYPOINT ["dotnet", "app.dll"]
```
@z

@x
{{< /tab >}}
{{< tab name="Before (DOI)" >}}
@y
{{< /tab >}}
{{< tab name="Before (DOI)" >}}
@z

@x
```dockerfile
#syntax=docker/dockerfile:1
@y
```dockerfile
#syntax=docker/dockerfile:1
@z

@x
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS builder
@y
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS builder
@z

@x
WORKDIR /src
COPY . ./
@y
WORKDIR /src
COPY . ./
@z

@x
# Install any additional packages if needed using apt
# RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*
@y
# Install any additional packages if needed using apt
# RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*
@z

@x
RUN dotnet restore
RUN dotnet publish -c Release -o /app --no-restore
@y
RUN dotnet restore
RUN dotnet publish -c Release -o /app --no-restore
@z

@x
FROM mcr.microsoft.com/dotnet/aspnet:8.0
@y
FROM mcr.microsoft.com/dotnet/aspnet:8.0
@z

@x
WORKDIR /app
COPY --from=builder /app ./
@y
WORKDIR /app
COPY --from=builder /app ./
@z

@x
ENTRYPOINT ["dotnet", "app.dll"]
```
@y
ENTRYPOINT ["dotnet", "app.dll"]
```
@z

@x
{{< /tab >}}
{{< tab name="After (multi-stage)" >}}
@y
{{< /tab >}}
{{< tab name="After (multi-stage)" >}}
@z

@x
```dockerfile
#syntax=docker/dockerfile:1
@y
```dockerfile
#syntax=docker/dockerfile:1
@z

@x
# === Build stage: Restore, build, and publish the .NET application ===
FROM dhi.io/dotnet:8-sdk-alpine3.22 AS builder
@y
# === Build stage: Restore, build, and publish the .NET application ===
FROM dhi.io/dotnet:8-sdk-alpine3.22 AS builder
@z

@x
WORKDIR /src
COPY . ./
@y
WORKDIR /src
COPY . ./
@z

@x
# Install any additional packages if needed using apk
# RUN apk add --no-cache git
@y
# Install any additional packages if needed using apk
# RUN apk add --no-cache git
@z

@x
RUN dotnet restore
RUN dotnet publish -c Release -o /app --no-restore
@y
RUN dotnet restore
RUN dotnet publish -c Release -o /app --no-restore
@z

@x
# === Final stage: Create minimal runtime image ===
FROM dhi.io/aspnetcore:8-alpine3.22
@y
# === Final stage: Create minimal runtime image ===
FROM dhi.io/aspnetcore:8-alpine3.22
@z

@x
WORKDIR /app
COPY --from=builder /app ./
@y
WORKDIR /app
COPY --from=builder /app ./
@z

@x
ENTRYPOINT ["dotnet", "app.dll"]
```
@y
ENTRYPOINT ["dotnet", "app.dll"]
```
@z

@x
{{< /tab >}}
{{< tab name="After (single-stage)" >}}
@y
{{< /tab >}}
{{< tab name="After (single-stage)" >}}
@z

@x
```dockerfile
#syntax=docker/dockerfile:1
@y
```dockerfile
#syntax=docker/dockerfile:1
@z

@x
FROM dhi.io/dotnet:8-sdk-alpine3.22
@y
FROM dhi.io/dotnet:8-sdk-alpine3.22
@z

@x
WORKDIR /src
COPY . ./
@y
WORKDIR /src
COPY . ./
@z

@x
# Install any additional packages if needed using apk
# RUN apk add --no-cache git
@y
# Install any additional packages if needed using apk
# RUN apk add --no-cache git
@z

@x
RUN dotnet restore
RUN dotnet publish -c Release -o /app --no-restore
@y
RUN dotnet restore
RUN dotnet publish -c Release -o /app --no-restore
@z

@x
WORKDIR /app
@y
WORKDIR /app
@z

@x
ENTRYPOINT ["dotnet", "/app/app.dll"]
```
@y
ENTRYPOINT ["dotnet", "/app/app.dll"]
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z
