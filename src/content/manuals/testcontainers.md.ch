%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Testcontainers
description: Learn how to use Testcontainers to run containers programmatically in your preferred programming language.
keywords: docker APIs, docker, testcontainers documentation, testcontainers, testcontainers oss, testcontainers oss documentation,
  docker compose, docker-compose, java, golang, go
@y
title: Testcontainers
description: Learn how to use Testcontainers to run containers programmatically in your preferred programming language.
keywords: docker APIs, docker, testcontainers documentation, testcontainers, testcontainers oss, testcontainers oss documentation,
  docker compose, docker-compose, java, golang, go
@z

@x
params:
  sidebar:
    group: Open source
@y
params:
  sidebar:
    group: Open source
@z

% intro:

@x
- title: What is Testcontainers?
  description: Learn about what Testcontainers does and its key benefits
  icon: feature_search
  link: https://testcontainers.com/getting-started/#what-is-testcontainers
@y
- title: What is Testcontainers?
  description: Learn about what Testcontainers does and its key benefits
  icon: feature_search
  link: https://testcontainers.com/getting-started/#what-is-testcontainers
@z

@x
- title: The Testcontainers workflow
  description: Understand the Testcontainers workflow 
  icon: explore
  link: https://testcontainers.com/getting-started/#testcontainers-workflow
@y
- title: The Testcontainers workflow
  description: Understand the Testcontainers workflow 
  icon: explore
  link: https://testcontainers.com/getting-started/#testcontainers-workflow
@z

% quickstart:

@x
- title: Testcontainers for Go
  description: A Go package that makes it simple to create and clean up container-based dependencies for automated integration/smoke tests.
  icon: /assets/icons/go.svg
  link: https://golang.testcontainers.org/quickstart/
@y
- title: Testcontainers for Go
  description: A Go package that makes it simple to create and clean up container-based dependencies for automated integration/smoke tests.
  icon: /assets/icons/go.svg
  link: https://golang.testcontainers.org/quickstart/
@z

@x
- title: Testcontainers for Java
  description: A Java library that supports JUnit tests, providing lightweight, throwaway instances of anything that can run in a Docker container.
  icon: /assets/icons/java.svg
  link: https://java.testcontainers.org/
@y
- title: Testcontainers for Java
  description: A Java library that supports JUnit tests, providing lightweight, throwaway instances of anything that can run in a Docker container.
  icon: /assets/icons/java.svg
  link: https://java.testcontainers.org/
@z

@x
Testcontainers is a set of open source libraries that provides easy and lightweight APIs for bootstrapping local development and test dependencies with real services wrapped in Docker containers.
Using Testcontainers, you can write tests that depend on the same services you use in production without mocks or in-memory services.
@y
Testcontainers is a set of open source libraries that provides easy and lightweight APIs for bootstrapping local development and test dependencies with real services wrapped in Docker containers.
Using Testcontainers, you can write tests that depend on the same services you use in production without mocks or in-memory services.
@z

@x
{{< grid items=intro >}}
@y
{{< grid items=intro >}}
@z

@x
## Quickstart
@y
## Quickstart
@z

@x
### Supported languages
@y
### Supported languages
@z

@x
Testcontainers provide support for the most popular languages, and Docker sponsors the development of the following Testcontainers implementations:
@y
Testcontainers provide support for the most popular languages, and Docker sponsors the development of the following Testcontainers implementations:
@z

@x
- [Go](https://golang.testcontainers.org/quickstart/)
- [Java](https://java.testcontainers.org/quickstart/junit_5_quickstart/)
@y
- [Go](https://golang.testcontainers.org/quickstart/)
- [Java](https://java.testcontainers.org/quickstart/junit_5_quickstart/)
@z

@x
The rest are community-driven and maintained by independent contributors.
@y
The rest are community-driven and maintained by independent contributors.
@z

@x
### Prerequisites
@y
### Prerequisites
@z

@x
Testcontainers requires a Docker-API compatible container runtime. 
During development, Testcontainers is actively tested against recent versions of Docker on Linux, as well as against Docker Desktop on Mac and Windows. 
These Docker environments are automatically detected and used by Testcontainers without any additional configuration being necessary.
@y
Testcontainers requires a Docker-API compatible container runtime. 
During development, Testcontainers is actively tested against recent versions of Docker on Linux, as well as against Docker Desktop on Mac and Windows. 
These Docker environments are automatically detected and used by Testcontainers without any additional configuration being necessary.
@z

@x
It is possible to configure Testcontainers to work for other Docker setups, such as a remote Docker host or Docker alternatives.
However, these are not actively tested in the main development workflow, so not all Testcontainers features might be available
and additional manual configuration might be necessary.
@y
It is possible to configure Testcontainers to work for other Docker setups, such as a remote Docker host or Docker alternatives.
However, these are not actively tested in the main development workflow, so not all Testcontainers features might be available
and additional manual configuration might be necessary.
@z

@x
If you have further questions about configuration details for your setup or whether it supports running Testcontainers-based tests,
 contact the Testcontainers team and other users from the Testcontainers community on [Slack](https://slack.testcontainers.org/).
@y
If you have further questions about configuration details for your setup or whether it supports running Testcontainers-based tests,
 contact the Testcontainers team and other users from the Testcontainers community on [Slack](https://slack.testcontainers.org/).
@z

@x
 {{< grid items=quickstart >}}
@y
 {{< grid items=quickstart >}}
@z
