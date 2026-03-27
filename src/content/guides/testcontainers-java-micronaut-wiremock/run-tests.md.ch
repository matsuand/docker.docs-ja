%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

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
You built a Micronaut application that integrates with an external REST API
using declarative HTTP clients, then tested that integration using WireMock and
the Testcontainers WireMock module. Testing at the HTTP protocol level instead
of mocking Java methods lets you catch serialization issues and simulate
realistic failure scenarios.
@y
You built a Micronaut application that integrates with an external REST API
using declarative HTTP clients, then tested that integration using WireMock and
the Testcontainers WireMock module. Testing at the HTTP protocol level instead
of mocking Java methods lets you catch serialization issues and simulate
realistic failure scenarios.
@z

@x
> [!TIP]
> Testcontainers WireMock modules are available for Go and Python as well.
@y
> [!TIP]
> Testcontainers WireMock modules are available for Go and Python as well.
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
- [Testing REST API integrations in Spring Boot using WireMock](/guides/testcontainers-java-wiremock/)
@y
- [Testcontainers WireMock module](https://testcontainers.com/modules/wiremock/)
- [WireMock documentation](https://wiremock.org/docs/)
- [Testcontainers JUnit 5 quickstart](https://java.testcontainers.org/quickstart/junit_5_quickstart/)
- [Testing REST API integrations in Spring Boot using WireMock](__SUBDIR__/guides/testcontainers-java-wiremock/)
@z
