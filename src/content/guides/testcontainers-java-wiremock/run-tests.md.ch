%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Run tests and next steps
linkTitle: Run tests
description: Run your Testcontainers WireMock integration tests and explore next steps.
@y
title: Run tests and next steps
linkTitle: Run tests
description: Run your Testcontainers WireMock integration tests and explore next steps.
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
You should see the WireMock Docker container start in the console output. It
acts as the photo service, serving mock responses based on the configured
expectations. All tests should pass.
@y
You should see the WireMock Docker container start in the console output. It
acts as the photo service, serving mock responses based on the configured
expectations. All tests should pass.
@z

@x
## Summary
@y
## Summary
@z

@x
You built a Spring Boot application that integrates with an external REST API,
then tested that integration using three different approaches:
@y
You built a Spring Boot application that integrates with an external REST API,
then tested that integration using three different approaches:
@z

@x
- WireMock JUnit 5 extension with inline stubs
- WireMock JUnit 5 extension with JSON mapping files
- Testcontainers WireMock module running WireMock in a Docker container
@y
- WireMock JUnit 5 extension with inline stubs
- WireMock JUnit 5 extension with JSON mapping files
- Testcontainers WireMock module running WireMock in a Docker container
@z

@x
Testing at the HTTP protocol level instead of mocking Java methods lets you
catch serialization issues and simulate realistic failure scenarios.
@y
Testing at the HTTP protocol level instead of mocking Java methods lets you
catch serialization issues and simulate realistic failure scenarios.
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
- [Testcontainers WireMock module](https://testcontainers.com/modules/wiremock/)
- [WireMock documentation](https://wiremock.org/docs/)
- [Testcontainers JUnit 5 quickstart](https://java.testcontainers.org/quickstart/junit_5_quickstart/)
@y
- [Testcontainers WireMock module](https://testcontainers.com/modules/wiremock/)
- [WireMock documentation](https://wiremock.org/docs/)
- [Testcontainers JUnit 5 quickstart](https://java.testcontainers.org/quickstart/junit_5_quickstart/)
@z
