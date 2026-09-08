%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Java
description: Migrate a Java application to Docker Hardened Images
@y
title: Java
description: Migrate a Java application to Docker Hardened Images
@z

@x
keywords: java, jvm, jdk, jre, maven, migration, dhi
@y
keywords: java, jvm, jdk, jre, maven, migration, dhi
@z

@x
This example shows how to migrate a Java application to Docker Hardened Images.
@y
This example shows how to migrate a Java application to Docker Hardened Images.
@z

@x
The following examples show Dockerfiles before and after migration to Docker
Hardened Images. Each example includes five variations:
@y
The following examples show Dockerfiles before and after migration to Docker
Hardened Images. Each example includes five variations:
@z

@x
- Before (Ubuntu): A sample Dockerfile using Ubuntu-based images, before migrating to DHI
- Before (Wolfi): A sample Dockerfile using Wolfi distribution images, before migrating to DHI
- Before (DOI): A sample Dockerfile using Docker Official Images, before migrating to DHI
- After (multi-stage): A sample Dockerfile after migrating to DHI with multi-stage builds (recommended for minimal, secure images)
- After (single-stage): A sample Dockerfile after migrating to DHI with single-stage builds (simpler but results in a larger image with a broader attack surface)
@y
- Before (Ubuntu): A sample Dockerfile using Ubuntu-based images, before migrating to DHI
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
> one](../../../accounts/create-account.md) for free.
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
> one](../../../accounts/create-account.md) for free.
>
> Run `docker login dhi.io` to authenticate.
@z

@x
{{< tabs >}}
{{< tab name="Before (Ubuntu)" >}}
@y
{{< tabs >}}
{{< tab name="Before (Ubuntu)" >}}
@z

@x
```dockerfile
#syntax=docker/dockerfile:1
@y
```dockerfile
#syntax=docker/dockerfile:1
@z

@x
FROM ubuntu:24.04 AS builder
@y
FROM ubuntu:24.04 AS builder
@z

@x
WORKDIR /app
COPY . ./
@y
WORKDIR /app
COPY . ./
@z

@x
RUN apt-get update && apt-get install -y default-jdk maven --no-install-recommends && rm -rf /var/lib/apt/lists/*
@y
RUN apt-get update && apt-get install -y default-jdk maven --no-install-recommends && rm -rf /var/lib/apt/lists/*
@z

@x
RUN mvn -B package -DskipTests
@y
RUN mvn -B package -DskipTests
@z

@x
FROM ubuntu:24.04
@y
FROM ubuntu:24.04
@z

@x
RUN apt-get update && apt-get install -y default-jre --no-install-recommends && rm -rf /var/lib/apt/lists/*
@y
RUN apt-get update && apt-get install -y default-jre --no-install-recommends && rm -rf /var/lib/apt/lists/*
@z

@x
WORKDIR /app
COPY --from=builder /app/target/app.jar /app/app.jar
@y
WORKDIR /app
COPY --from=builder /app/target/app.jar /app/app.jar
@z

@x
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
```
@y
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
```
@z

@x
{{< /tab >}}
{{< tab name="Before (Wolfi)" >}}
@y
{{< /tab >}}
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
FROM cgr.dev/chainguard/maven:latest-dev AS builder
@y
FROM cgr.dev/chainguard/maven:latest-dev AS builder
@z

@x
WORKDIR /app
COPY . ./
@y
WORKDIR /app
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
RUN mvn -B package -DskipTests
@y
RUN mvn -B package -DskipTests
@z

@x
FROM cgr.dev/chainguard/jre:latest
@y
FROM cgr.dev/chainguard/jre:latest
@z

@x
WORKDIR /app
COPY --from=builder /app/target/app.jar /app/app.jar
@y
WORKDIR /app
COPY --from=builder /app/target/app.jar /app/app.jar
@z

@x
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
```
@y
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
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
FROM maven:3.9-eclipse-temurin-21 AS builder
@y
FROM maven:3.9-eclipse-temurin-21 AS builder
@z

@x
WORKDIR /app
COPY . ./
@y
WORKDIR /app
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
RUN mvn -B package -DskipTests
@y
RUN mvn -B package -DskipTests
@z

@x
FROM eclipse-temurin:21-jre
@y
FROM eclipse-temurin:21-jre
@z

@x
WORKDIR /app
COPY --from=builder /app/target/app.jar /app/app.jar
@y
WORKDIR /app
COPY --from=builder /app/target/app.jar /app/app.jar
@z

@x
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
```
@y
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
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
# === Build stage: Compile and package the Java application with Maven ===
FROM dhi.io/maven:3-jdk21-alpine3.22-dev AS builder
@y
# === Build stage: Compile and package the Java application with Maven ===
FROM dhi.io/maven:3-jdk21-alpine3.22-dev AS builder
@z

@x
WORKDIR /app
COPY . ./
@y
WORKDIR /app
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
RUN mvn -B package -DskipTests
@y
RUN mvn -B package -DskipTests
@z

@x
# === Final stage: Create minimal runtime image ===
FROM dhi.io/eclipse-temurin:21-alpine3.22
@y
# === Final stage: Create minimal runtime image ===
FROM dhi.io/eclipse-temurin:21-alpine3.22
@z

@x
WORKDIR /app
COPY --from=builder /app/target/app.jar /app/app.jar
@y
WORKDIR /app
COPY --from=builder /app/target/app.jar /app/app.jar
@z

@x
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
```
@y
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
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
FROM dhi.io/maven:3-jdk21-alpine3.22-dev
@y
FROM dhi.io/maven:3-jdk21-alpine3.22-dev
@z

@x
WORKDIR /app
COPY . ./
@y
WORKDIR /app
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
RUN mvn -B package -DskipTests
@y
RUN mvn -B package -DskipTests
@z

@x
ENTRYPOINT ["java", "-jar", "/app/target/app.jar"]
```
@y
ENTRYPOINT ["java", "-jar", "/app/target/app.jar"]
```
@z

@x
{{< /tab >}}
{{< /tabs >}}
@y
{{< /tab >}}
{{< /tabs >}}
@z
