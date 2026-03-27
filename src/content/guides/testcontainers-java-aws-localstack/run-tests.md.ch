%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Run tests and next steps
linkTitle: Run tests
description: Run your Testcontainers-based Spring Cloud AWS integration tests and explore next steps.
@y
title: Run tests and next steps
linkTitle: Run tests
description: Run your Testcontainers-based Spring Cloud AWS integration tests and explore next steps.
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
You should see the LocalStack Docker container start and the test pass. After
the tests finish, the container stops and is removed automatically.
@y
You should see the LocalStack Docker container start and the test pass. After
the tests finish, the container stops and is removed automatically.
@z

@x
## Summary
@y
## Summary
@z

@x
LocalStack lets you develop and test AWS-based applications locally.
The Testcontainers LocalStack module makes it straightforward to write
integration tests by using ephemeral LocalStack containers that start on random
ports with no external setup required.
@y
LocalStack lets you develop and test AWS-based applications locally.
The Testcontainers LocalStack module makes it straightforward to write
integration tests by using ephemeral LocalStack containers that start on random
ports with no external setup required.
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
- [Testcontainers LocalStack module](https://java.testcontainers.org/modules/localstack/)
- [Getting started with Testcontainers for Java](https://java.testcontainers.org/quickstart/junit_5_quickstart/)
- [Spring Cloud AWS documentation](https://docs.awspring.io/spring-cloud-aws/docs/3.0.3/reference/html/index.html)
@y
- [Testcontainers LocalStack module](https://java.testcontainers.org/modules/localstack/)
- [Getting started with Testcontainers for Java](https://java.testcontainers.org/quickstart/junit_5_quickstart/)
- [Spring Cloud AWS documentation](https://docs.awspring.io/spring-cloud-aws/docs/3.0.3/reference/html/index.html)
@z
