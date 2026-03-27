%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Testcontainers container lifecycle management using JUnit 5
linkTitle: Container lifecycle (Java)
description: Learn how to manage Testcontainers container lifecycle using JUnit 5 callbacks, extension annotations, and the singleton containers pattern.
keywords: testcontainers, java, testing, junit, lifecycle, singleton containers, postgresql
summary: |
  Learn different approaches to manage container lifecycle with Testcontainers
  using JUnit 5 lifecycle callbacks, extension annotations, and the singleton
  containers pattern.
@y
@z

@x
  time: 20 minutes
@y
  time: 20 minutes
@z

@x
<!-- Source: https://github.com/testcontainers/tc-guide-testcontainers-lifecycle -->
@y
<!-- Source: https://github.com/testcontainers/tc-guide-testcontainers-lifecycle -->
@z

@x
In this guide, you will learn how to:
@y
In this guide, you will learn how to:
@z

@x
- Start and stop containers using JUnit 5 lifecycle callbacks
- Manage containers using JUnit 5 extension annotations (`@Testcontainers` and `@Container`)
- Share containers across multiple test classes using the singleton containers pattern
- Avoid a common misconfiguration when combining extension annotations with singleton containers
@y
- Start and stop containers using JUnit 5 lifecycle callbacks
- Manage containers using JUnit 5 extension annotations (`@Testcontainers` and `@Container`)
- Share containers across multiple test classes using the singleton containers pattern
- Avoid a common misconfiguration when combining extension annotations with singleton containers
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- Java 17+
- Your preferred IDE
- A Docker environment supported by Testcontainers
@y
- Java 17+
- Your preferred IDE
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
