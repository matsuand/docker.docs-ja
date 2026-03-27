%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Run tests and next steps
linkTitle: Run tests
description: Run your Testcontainers-based Quarkus integration tests and explore next steps.
@y
title: Run tests and next steps
linkTitle: Run tests
description: Run your Testcontainers-based Quarkus integration tests and explore next steps.
@z

@x
## Run the tests
@y
## Run the tests
@z

@x
```console
$ ./mvnw test
```
@y
```console
$ ./mvnw test
```
@z

@x
Or with Gradle:
@y
Or with Gradle:
@z

@x
```console
$ ./gradlew test
```
@y
```console
$ ./gradlew test
```
@z

@x
You should see the PostgreSQL Docker container start and all tests pass. After
the tests finish, the container stops and is removed automatically.
@y
You should see the PostgreSQL Docker container start and all tests pass. After
the tests finish, the container stops and is removed automatically.
@z

@x
## Run the application locally
@y
## Run the application locally
@z

@x
Quarkus Dev Services automatically provisions unconfigured services in
development mode. Start the Quarkus application in dev mode:
@y
Quarkus Dev Services automatically provisions unconfigured services in
development mode. Start the Quarkus application in dev mode:
@z

@x
```console
$ ./mvnw compile quarkus:dev
```
@y
```console
$ ./mvnw compile quarkus:dev
```
@z

@x
Or with Gradle:
@y
Or with Gradle:
@z

@x
```console
$ ./gradlew quarkusDev
```
@y
```console
$ ./gradlew quarkusDev
```
@z

@x
Dev Services starts a PostgreSQL container automatically. If you're running a
PostgreSQL database on your system and want to use that instead, configure the
datasource properties in `src/main/resources/application.properties`:
@y
Dev Services starts a PostgreSQL container automatically. If you're running a
PostgreSQL database on your system and want to use that instead, configure the
datasource properties in `src/main/resources/application.properties`:
@z

@x
```properties
quarkus.datasource.jdbc.url=jdbc:postgresql://localhost:5432/postgres
quarkus.datasource.username=postgres
quarkus.datasource.password=postgres
```
@y
```properties
quarkus.datasource.jdbc.url=jdbc:postgresql://localhost:5432/postgres
quarkus.datasource.username=postgres
quarkus.datasource.password=postgres
```
@z

@x
When these properties are set explicitly, Dev Services doesn't provision the
database container and instead connects to the configured database.
@y
When these properties are set explicitly, Dev Services doesn't provision the
database container and instead connects to the configured database.
@z

@x
## Summary
@y
## Summary
@z

@x
Quarkus Dev Services improves the developer experience by automatically
provisioning the required services using Testcontainers during development and
testing. This guide covered:
@y
Quarkus Dev Services improves the developer experience by automatically
provisioning the required services using Testcontainers during development and
testing. This guide covered:
@z

@x
- Building a REST API using JAX-RS with Hibernate ORM with Panache
- Testing API endpoints using REST Assured with Dev Services handling database
  provisioning
- Using `QuarkusTestResourceLifecycleManager` for services not supported by Dev
  Services
- Running the application locally with Dev Services
@y
- Building a REST API using JAX-RS with Hibernate ORM with Panache
- Testing API endpoints using REST Assured with Dev Services handling database
  provisioning
- Using `QuarkusTestResourceLifecycleManager` for services not supported by Dev
  Services
- Running the application locally with Dev Services
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
- [Quarkus Dev Services overview](https://quarkus.io/guides/dev-services)
- [Quarkus testing guide](https://quarkus.io/guides/getting-started-testing)
- [Testcontainers Postgres module](https://java.testcontainers.org/modules/databases/postgres/)
@y
- [Quarkus Dev Services overview](https://quarkus.io/guides/dev-services)
- [Quarkus testing guide](https://quarkus.io/guides/getting-started-testing)
- [Testcontainers Postgres module](https://java.testcontainers.org/modules/databases/postgres/)
@z
