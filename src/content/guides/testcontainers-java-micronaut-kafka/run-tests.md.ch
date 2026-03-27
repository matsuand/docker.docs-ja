%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Run tests and next steps
linkTitle: Run tests
description: Run your Testcontainers-based Micronaut Kafka integration tests and explore next steps.
@y
title: Run tests and next steps
linkTitle: Run tests
description: Run your Testcontainers-based Micronaut Kafka integration tests and explore next steps.
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
You should see the Kafka and MySQL Docker containers start and all tests pass.
After the tests finish, the containers stop and are removed automatically.
@y
You should see the Kafka and MySQL Docker containers start and all tests pass.
After the tests finish, the containers stop and are removed automatically.
@z

@x
## Summary
@y
## Summary
@z

@x
Testing with real Kafka and MySQL instances gives you more confidence in the
correctness of your code than mocks or embedded alternatives. The
Testcontainers library manages the container lifecycle so that your integration
tests run against the same services you use in production.
@y
Testing with real Kafka and MySQL instances gives you more confidence in the
correctness of your code than mocks or embedded alternatives. The
Testcontainers library manages the container lifecycle so that your integration
tests run against the same services you use in production.
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
- [Testing REST API integrations in Micronaut apps using WireMock](/guides/testcontainers-java-micronaut-wiremock/)
- [Testing Spring Boot Kafka Listener using Testcontainers](/guides/testcontainers-java-spring-boot-kafka/)
- [Getting started with Testcontainers in a Java Spring Boot project](https://testcontainers.com/guides/testing-spring-boot-rest-api-using-testcontainers/)
- [Awaitility](http://www.awaitility.org/)
- [Testcontainers Kafka module](https://java.testcontainers.org/modules/kafka/)
- [Testcontainers MySQL module](https://java.testcontainers.org/modules/databases/mysql/)
@y
- [Testing REST API integrations in Micronaut apps using WireMock](__SUBDIR__/guides/testcontainers-java-micronaut-wiremock/)
- [Testing Spring Boot Kafka Listener using Testcontainers](__SUBDIR__/guides/testcontainers-java-spring-boot-kafka/)
- [Getting started with Testcontainers in a Java Spring Boot project](https://testcontainers.com/guides/testing-spring-boot-rest-api-using-testcontainers/)
- [Awaitility](http://www.awaitility.org/)
- [Testcontainers Kafka module](https://java.testcontainers.org/modules/kafka/)
- [Testcontainers MySQL module](https://java.testcontainers.org/modules/databases/mysql/)
@z
