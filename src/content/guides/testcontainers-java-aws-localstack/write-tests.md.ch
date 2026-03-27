%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Write tests with Testcontainers
linkTitle: Write tests
description: Test Spring Cloud AWS S3 and SQS integration using Testcontainers and LocalStack.
@y
title: Write tests with Testcontainers
linkTitle: Write tests
description: Test Spring Cloud AWS S3 and SQS integration using Testcontainers and LocalStack.
@z

@x
To test the application, you need a running LocalStack instance that emulates
the AWS S3 and SQS services. Testcontainers spins up LocalStack in a Docker
container and `@DynamicPropertySource` connects it to Spring Cloud AWS.
@y
To test the application, you need a running LocalStack instance that emulates
the AWS S3 and SQS services. Testcontainers spins up LocalStack in a Docker
container and `@DynamicPropertySource` connects it to Spring Cloud AWS.
@z

@x
## Configure the test container
@y
## Configure the test container
@z

@x
You can start a LocalStack container and configure the Spring Cloud AWS
properties to talk to it instead of actual AWS services. The properties you
need to set are:
@y
You can start a LocalStack container and configure the Spring Cloud AWS
properties to talk to it instead of actual AWS services. The properties you
need to set are:
@z

@x
```properties
spring.cloud.aws.s3.endpoint=http://localhost:4566
spring.cloud.aws.sqs.endpoint=http://localhost:4566
spring.cloud.aws.credentials.access-key=noop
spring.cloud.aws.credentials.secret-key=noop
spring.cloud.aws.region.static=us-east-1
```
@y
```properties
spring.cloud.aws.s3.endpoint=http://localhost:4566
spring.cloud.aws.sqs.endpoint=http://localhost:4566
spring.cloud.aws.credentials.access-key=noop
spring.cloud.aws.credentials.secret-key=noop
spring.cloud.aws.region.static=us-east-1
```
@z

@x
For testing, use an ephemeral container that starts on a random available port
so that you can run multiple builds in CI in parallel without port conflicts.
@y
For testing, use an ephemeral container that starts on a random available port
so that you can run multiple builds in CI in parallel without port conflicts.
@z

@x
## Write the test
@y
## Write the test
@z

@x
Create `MessageListenerTest.java`:
@y
Create `MessageListenerTest.java`:
@z

@x
```java
package com.testcontainers.demo;
@y
```java
package com.testcontainers.demo;
@z

@x
import static org.assertj.core.api.Assertions.assertThat;
import static org.awaitility.Awaitility.await;
import static org.testcontainers.containers.localstack.LocalStackContainer.Service.S3;
import static org.testcontainers.containers.localstack.LocalStackContainer.Service.SQS;
@y
import static org.assertj.core.api.Assertions.assertThat;
import static org.awaitility.Awaitility.await;
import static org.testcontainers.containers.localstack.LocalStackContainer.Service.S3;
import static org.testcontainers.containers.localstack.LocalStackContainer.Service.SQS;
@z

@x
import java.io.IOException;
import java.time.Duration;
import java.util.UUID;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;
import org.testcontainers.containers.localstack.LocalStackContainer;
import org.testcontainers.junit.jupiter.Container;
import org.testcontainers.junit.jupiter.Testcontainers;
import org.testcontainers.utility.DockerImageName;
@y
import java.io.IOException;
import java.time.Duration;
import java.util.UUID;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;
import org.testcontainers.containers.localstack.LocalStackContainer;
import org.testcontainers.junit.jupiter.Container;
import org.testcontainers.junit.jupiter.Testcontainers;
import org.testcontainers.utility.DockerImageName;
@z

@x
@SpringBootTest
@Testcontainers
class MessageListenerTest {
@y
@SpringBootTest
@Testcontainers
class MessageListenerTest {
@z

@x
  @Container
  static LocalStackContainer localStack = new LocalStackContainer(
    DockerImageName.parse("localstack/localstack:3.0")
  );
@y
  @Container
  static LocalStackContainer localStack = new LocalStackContainer(
    DockerImageName.parse("localstack/localstack:3.0")
  );
@z

@x
  static final String BUCKET_NAME = UUID.randomUUID().toString();
  static final String QUEUE_NAME = UUID.randomUUID().toString();
@y
  static final String BUCKET_NAME = UUID.randomUUID().toString();
  static final String QUEUE_NAME = UUID.randomUUID().toString();
@z

@x
  @DynamicPropertySource
  static void overrideProperties(DynamicPropertyRegistry registry) {
    registry.add("app.bucket", () -> BUCKET_NAME);
    registry.add("app.queue", () -> QUEUE_NAME);
    registry.add(
      "spring.cloud.aws.region.static",
      () -> localStack.getRegion()
    );
    registry.add(
      "spring.cloud.aws.credentials.access-key",
      () -> localStack.getAccessKey()
    );
    registry.add(
      "spring.cloud.aws.credentials.secret-key",
      () -> localStack.getSecretKey()
    );
    registry.add(
      "spring.cloud.aws.s3.endpoint",
      () -> localStack.getEndpointOverride(S3).toString()
    );
    registry.add(
      "spring.cloud.aws.sqs.endpoint",
      () -> localStack.getEndpointOverride(SQS).toString()
    );
  }
@y
  @DynamicPropertySource
  static void overrideProperties(DynamicPropertyRegistry registry) {
    registry.add("app.bucket", () -> BUCKET_NAME);
    registry.add("app.queue", () -> QUEUE_NAME);
    registry.add(
      "spring.cloud.aws.region.static",
      () -> localStack.getRegion()
    );
    registry.add(
      "spring.cloud.aws.credentials.access-key",
      () -> localStack.getAccessKey()
    );
    registry.add(
      "spring.cloud.aws.credentials.secret-key",
      () -> localStack.getSecretKey()
    );
    registry.add(
      "spring.cloud.aws.s3.endpoint",
      () -> localStack.getEndpointOverride(S3).toString()
    );
    registry.add(
      "spring.cloud.aws.sqs.endpoint",
      () -> localStack.getEndpointOverride(SQS).toString()
    );
  }
@z

@x
  @BeforeAll
  static void beforeAll() throws IOException, InterruptedException {
    localStack.execInContainer("awslocal", "s3", "mb", "s3://" + BUCKET_NAME);
    localStack.execInContainer(
      "awslocal",
      "sqs",
      "create-queue",
      "--queue-name",
      QUEUE_NAME
    );
  }
@y
  @BeforeAll
  static void beforeAll() throws IOException, InterruptedException {
    localStack.execInContainer("awslocal", "s3", "mb", "s3://" + BUCKET_NAME);
    localStack.execInContainer(
      "awslocal",
      "sqs",
      "create-queue",
      "--queue-name",
      QUEUE_NAME
    );
  }
@z

@x
  @Autowired
  StorageService storageService;
@y
  @Autowired
  StorageService storageService;
@z

@x
  @Autowired
  MessageSender publisher;
@y
  @Autowired
  MessageSender publisher;
@z

@x
  @Autowired
  ApplicationProperties properties;
@y
  @Autowired
  ApplicationProperties properties;
@z

@x
  @Test
  void shouldHandleMessageSuccessfully() {
    Message message = new Message(UUID.randomUUID(), "Hello World");
    publisher.publish(properties.queue(), message);
@y
  @Test
  void shouldHandleMessageSuccessfully() {
    Message message = new Message(UUID.randomUUID(), "Hello World");
    publisher.publish(properties.queue(), message);
@z

@x
    await()
      .pollInterval(Duration.ofSeconds(2))
      .atMost(Duration.ofSeconds(10))
      .ignoreExceptions()
      .untilAsserted(() -> {
        String msg = storageService.downloadAsString(
          properties.bucket(),
          message.uuid().toString()
        );
        assertThat(msg).isEqualTo("Hello World");
      });
  }
}
```
@y
    await()
      .pollInterval(Duration.ofSeconds(2))
      .atMost(Duration.ofSeconds(10))
      .ignoreExceptions()
      .untilAsserted(() -> {
        String msg = storageService.downloadAsString(
          properties.bucket(),
          message.uuid().toString()
        );
        assertThat(msg).isEqualTo("Hello World");
      });
  }
}
```
@z

@x
Here's what the test does:
@y
Here's what the test does:
@z

@x
- `@SpringBootTest` starts the full Spring application context.
- The Testcontainers JUnit 5 annotations `@Testcontainers` and `@Container`
  manage the lifecycle of a `LocalStackContainer` instance.
- `@DynamicPropertySource` obtains the dynamic S3 and SQS endpoint URLs,
  region, access key, and secret key from the container, and registers them as
  Spring Cloud AWS configuration properties.
- `@BeforeAll` creates the required SQS queue and S3 bucket using the
  `awslocal` CLI tool that comes pre-installed in the LocalStack Docker image.
  The `localStack.execInContainer()` API runs commands inside the container.
- `shouldHandleMessageSuccessfully()` publishes a `Message` to the SQS queue.
  The listener receives the message and stores its content in the S3 bucket
  with the UUID as the key. Awaitility waits up to 10 seconds for the expected
  content to appear in the bucket.
@y
- `@SpringBootTest` starts the full Spring application context.
- The Testcontainers JUnit 5 annotations `@Testcontainers` and `@Container`
  manage the lifecycle of a `LocalStackContainer` instance.
- `@DynamicPropertySource` obtains the dynamic S3 and SQS endpoint URLs,
  region, access key, and secret key from the container, and registers them as
  Spring Cloud AWS configuration properties.
- `@BeforeAll` creates the required SQS queue and S3 bucket using the
  `awslocal` CLI tool that comes pre-installed in the LocalStack Docker image.
  The `localStack.execInContainer()` API runs commands inside the container.
- `shouldHandleMessageSuccessfully()` publishes a `Message` to the SQS queue.
  The listener receives the message and stores its content in the S3 bucket
  with the UUID as the key. Awaitility waits up to 10 seconds for the expected
  content to appear in the bucket.
@z
