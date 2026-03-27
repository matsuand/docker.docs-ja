%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Testing Micronaut Kafka Listener using Testcontainers
linkTitle: Micronaut Kafka
description: Learn how to test a Micronaut Kafka listener using Testcontainers with Kafka and MySQL modules.
keywords: testcontainers, java, micronaut, testing, kafka, mysql, jpa, awaitility
summary: |
  Learn how to create a Micronaut application with a Kafka listener that persists data in MySQL,
  then test it using Testcontainers Kafka and MySQL modules with Awaitility.
@y
title: Testing Micronaut Kafka Listener using Testcontainers
linkTitle: Micronaut Kafka
description: Learn how to test a Micronaut Kafka listener using Testcontainers with Kafka and MySQL modules.
keywords: testcontainers, java, micronaut, testing, kafka, mysql, jpa, awaitility
summary: |
  Learn how to create a Micronaut application with a Kafka listener that persists data in MySQL,
  then test it using Testcontainers Kafka and MySQL modules with Awaitility.
@z

@x
  time: 25 minutes
@y
  time: 25 分
@z

@x
<!-- Source: https://github.com/testcontainers/tc-guide-testing-micronaut-kafka-listener -->
@y
<!-- Source: https://github.com/testcontainers/tc-guide-testing-micronaut-kafka-listener -->
@z

@x
In this guide, you'll learn how to:
@y
In this guide, you'll learn how to:
@z

@x
- Create a Micronaut application with Kafka integration
- Implement a Kafka listener and persist data in a MySQL database
- Test the Kafka listener using Testcontainers and Awaitility
@y
- Create a Micronaut application with Kafka integration
- Implement a Kafka listener and persist data in a MySQL database
- Test the Kafka listener using Testcontainers and Awaitility
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
