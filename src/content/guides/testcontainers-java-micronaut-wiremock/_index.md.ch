%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Testing REST API integrations in Micronaut apps using WireMock
linkTitle: Micronaut WireMock
description: Learn how to test REST API integrations in a Micronaut application using the Testcontainers WireMock module.
keywords: testcontainers, java, micronaut, testing, wiremock, rest api
summary: |
  Learn how to create a Micronaut application that integrates with
  external REST APIs, then test those integrations using WireMock
  and the Testcontainers WireMock module.
@y
title: Testing REST API integrations in Micronaut apps using WireMock
linkTitle: Micronaut WireMock
description: Learn how to test REST API integrations in a Micronaut application using the Testcontainers WireMock module.
keywords: testcontainers, java, micronaut, testing, wiremock, rest api
summary: |
  Learn how to create a Micronaut application that integrates with
  external REST APIs, then test those integrations using WireMock
  and the Testcontainers WireMock module.
@z

@x
  time: 20 minutes
@y
  time: 20 分
@z

@x
<!-- Source: https://github.com/testcontainers/tc-guide-testing-rest-api-integrations-in-micronaut-apps-using-wiremock -->
@y
<!-- Source: https://github.com/testcontainers/tc-guide-testing-rest-api-integrations-in-micronaut-apps-using-wiremock -->
@z

@x
In this guide, you'll learn how to:
@y
In this guide, you'll learn how to:
@z

@x
- Create a Micronaut application that talks to external REST APIs
- Test external API integrations using WireMock
- Use the Testcontainers WireMock module to run WireMock as a Docker container
@y
- Create a Micronaut application that talks to external REST APIs
- Test external API integrations using WireMock
- Use the Testcontainers WireMock module to run WireMock as a Docker container
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- Java 17+
- Maven or Gradle
- A Docker environment supported by Testcontainers
@y
- Java 17+
- Maven or Gradle
- A Docker environment supported by Testcontainers
@z

@x
> [!NOTE]
> If you're new to Testcontainers, visit the
> [Testcontainers overview](https://testcontainers.com/getting-started/) to learn more about
> Testcontainers and the benefits of using it.
@y
> [!NOTE]
> If you're new to Testcontainers, visit the
> [Testcontainers overview](https://testcontainers.com/getting-started/) to learn more about
> Testcontainers and the benefits of using it.
@z
