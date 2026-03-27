%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Run tests and next steps
linkTitle: Run tests
description: Run your Testcontainers-based Spring Boot integration tests and explore next steps.
@y
title: Run tests and next steps
linkTitle: Run tests
description: Run your Testcontainers-based Spring Boot integration tests and explore next steps.
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
You should see the Postgres Docker container start and all tests pass. After
the tests finish, the container stops and is removed automatically.
@y
You should see the Postgres Docker container start and all tests pass. After
the tests finish, the container stops and is removed automatically.
@z

@x
## Summary
@y
## Summary
@z

@x
The Testcontainers library helps you write integration tests by using the same
type of database (Postgres) that you use in production, instead of mocks or
in-memory databases. Because you test against real services, you're free to
refactor code and still verify that the application works as expected.
@y
The Testcontainers library helps you write integration tests by using the same
type of database (Postgres) that you use in production, instead of mocks or
in-memory databases. Because you test against real services, you're free to
refactor code and still verify that the application works as expected.
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
- [Testcontainers JUnit 5 quickstart](https://java.testcontainers.org/quickstart/junit_5_quickstart/)
- [Testcontainers Postgres module](https://java.testcontainers.org/modules/databases/postgres/)
- [Testcontainers JDBC support](https://java.testcontainers.org/modules/databases/jdbc/)
@y
- [Testcontainers JUnit 5 quickstart](https://java.testcontainers.org/quickstart/junit_5_quickstart/)
- [Testcontainers Postgres module](https://java.testcontainers.org/modules/databases/postgres/)
- [Testcontainers JDBC support](https://java.testcontainers.org/modules/databases/jdbc/)
@z
