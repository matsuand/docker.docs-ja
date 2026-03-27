%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Securing Spring Boot microservice using Keycloak and Testcontainers
linkTitle: Keycloak with Spring Boot
description: Learn how to secure a Spring Boot microservice using Keycloak and test it with the Testcontainers Keycloak module.
keywords: testcontainers, java, spring boot, testing, keycloak, security, oauth2, jwt
summary: |
  Learn how to create an OAuth 2.0 Resource Server using Spring Boot, secure API
  endpoints with Keycloak, and test the application using the Testcontainers Keycloak module.
@y
title: Securing Spring Boot microservice using Keycloak and Testcontainers
linkTitle: Keycloak with Spring Boot
description: Learn how to secure a Spring Boot microservice using Keycloak and test it with the Testcontainers Keycloak module.
keywords: testcontainers, java, spring boot, testing, keycloak, security, oauth2, jwt
summary: |
  Learn how to create an OAuth 2.0 Resource Server using Spring Boot, secure API
  endpoints with Keycloak, and test the application using the Testcontainers Keycloak module.
@z

@x
  time: 30 minutes
@y
  time: 30 分
@z

@x
<!-- Source: https://github.com/testcontainers/tc-guide-securing-spring-boot-microservice-using-keycloak-and-testcontainers -->
@y
<!-- Source: https://github.com/testcontainers/tc-guide-securing-spring-boot-microservice-using-keycloak-and-testcontainers -->
@z

@x
In this guide, you'll learn how to:
@y
In this guide, you'll learn how to:
@z

@x
- Create an OAuth 2.0 Resource Server using Spring Boot
- Secure API endpoints using Keycloak
- Test the APIs using the Testcontainers Keycloak module
- Run the application locally using the Testcontainers Keycloak module
@y
- Create an OAuth 2.0 Resource Server using Spring Boot
- Secure API endpoints using Keycloak
- Test the APIs using the Testcontainers Keycloak module
- Run the application locally using the Testcontainers Keycloak module
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
