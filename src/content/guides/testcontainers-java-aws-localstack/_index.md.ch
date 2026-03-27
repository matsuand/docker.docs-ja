%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Testing AWS service integrations using LocalStack
linkTitle: AWS LocalStack
description: Learn how to test Spring Cloud AWS applications using LocalStack and Testcontainers.
keywords: testcontainers, java, spring boot, testing, aws, localstack, s3, sqs, spring cloud aws
summary: |
  Learn how to create a Spring Boot application with Spring Cloud AWS,
  then test S3 and SQS integrations using Testcontainers and LocalStack.
@y
title: Testing AWS service integrations using LocalStack
linkTitle: AWS LocalStack
description: Learn how to test Spring Cloud AWS applications using LocalStack and Testcontainers.
keywords: testcontainers, java, spring boot, testing, aws, localstack, s3, sqs, spring cloud aws
summary: |
  Learn how to create a Spring Boot application with Spring Cloud AWS,
  then test S3 and SQS integrations using Testcontainers and LocalStack.
@z

@x
  time: 25 minutes
@y
  time: 25 分
@z

@x
<!-- Source: https://github.com/testcontainers/tc-guide-testing-aws-service-integrations-using-localstack -->
@y
<!-- Source: https://github.com/testcontainers/tc-guide-testing-aws-service-integrations-using-localstack -->
@z

@x
In this guide, you will learn how to:
@y
In this guide, you will learn how to:
@z

@x
- Create a Spring Boot application with Spring Cloud AWS integration
- Use AWS S3 and SQS services
- Test the application using Testcontainers and LocalStack
@y
- Create a Spring Boot application with Spring Cloud AWS integration
- Use AWS S3 and SQS services
- Test the application using Testcontainers and LocalStack
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
