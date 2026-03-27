%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Testing REST API integrations using MockServer
linkTitle: MockServer
description: Learn how to test REST API integrations in a Spring Boot application using the Testcontainers MockServer module.
keywords: testcontainers, java, spring boot, testing, mockserver, rest api, rest assured
summary: |
  Learn how to create a Spring Boot application that integrates with
  external REST APIs, then test those integrations using Testcontainers
  and MockServer.
@y
title: Testing REST API integrations using MockServer
linkTitle: MockServer
description: Learn how to test REST API integrations in a Spring Boot application using the Testcontainers MockServer module.
keywords: testcontainers, java, spring boot, testing, mockserver, rest api, rest assured
summary: |
  Learn how to create a Spring Boot application that integrates with
  external REST APIs, then test those integrations using Testcontainers
  and MockServer.
@z

@x
  time: 20 minutes
@y
  time: 20 分
@z

@x
<!-- Source: https://github.com/testcontainers/tc-guide-testing-rest-api-integrations-using-mockserver -->
@y
<!-- Source: https://github.com/testcontainers/tc-guide-testing-rest-api-integrations-using-mockserver -->
@z

@x
In this guide, you will learn how to:
@y
In this guide, you will learn how to:
@z

@x
- Create a Spring Boot application that talks to external REST APIs
- Test external API integrations using the Testcontainers MockServer module
@y
- Create a Spring Boot application that talks to external REST APIs
- Test external API integrations using the Testcontainers MockServer module
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
