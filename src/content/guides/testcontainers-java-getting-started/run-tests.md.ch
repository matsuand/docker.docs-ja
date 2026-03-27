%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Run tests and next steps
linkTitle: Run tests
description: Run your Testcontainers-based integration tests and explore next steps.
@y
title: Run tests and next steps
linkTitle: Run tests
description: Run your Testcontainers-based integration tests and explore next steps.
@z

@x
## Run the tests
@y
## Run the tests
@z

@x
Run the tests using Maven:
@y
Run the tests using Maven:
@z

@x
```console
$ mvn test
```
@y
```console
$ mvn test
```
@z

@x
You can see in the logs that Testcontainers pulls the Postgres Docker image
from Docker Hub (if not already available locally), starts the container, and
runs the test.
@y
You can see in the logs that Testcontainers pulls the Postgres Docker image
from Docker Hub (if not already available locally), starts the container, and
runs the test.
@z

@x
Writing an integration test using Testcontainers works like writing a unit test
that you can run from your IDE. Your teammates can clone the project
and run tests without installing Postgres on their machines.
@y
Writing an integration test using Testcontainers works like writing a unit test
that you can run from your IDE. Your teammates can clone the project
and run tests without installing Postgres on their machines.
@z

@x
## Summary
@y
## Summary
@z

@x
The Testcontainers for Java library helps you write integration tests using the
same type of database (Postgres) that you use in production, instead of mocks.
Because you aren't using mocks and instead talk to real services, you're free
to refactor code and still verify that the application works as expected.
@y
The Testcontainers for Java library helps you write integration tests using the
same type of database (Postgres) that you use in production, instead of mocks.
Because you aren't using mocks and instead talk to real services, you're free
to refactor code and still verify that the application works as expected.
@z

@x
In addition to Postgres, Testcontainers provides dedicated modules for many
SQL databases, NoSQL databases, messaging queues, and more. You can use
Testcontainers to run any containerized dependency for your tests.
@y
In addition to Postgres, Testcontainers provides dedicated modules for many
SQL databases, NoSQL databases, messaging queues, and more. You can use
Testcontainers to run any containerized dependency for your tests.
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
- [Testcontainers container lifecycle management using JUnit 5](https://testcontainers.com/guides/testcontainers-container-lifecycle/)
- [Replace H2 with a real database for testing](https://testcontainers.com/guides/replace-h2-with-real-database-for-testing/)
- [Getting started with Testcontainers in a Java Spring Boot project](https://testcontainers.com/guides/testing-spring-boot-rest-api-using-testcontainers/)
@y
- [Testcontainers container lifecycle management using JUnit 5](https://testcontainers.com/guides/testcontainers-container-lifecycle/)
- [Replace H2 with a real database for testing](https://testcontainers.com/guides/replace-h2-with-real-database-for-testing/)
- [Getting started with Testcontainers in a Java Spring Boot project](https://testcontainers.com/guides/testing-spring-boot-rest-api-using-testcontainers/)
@z
