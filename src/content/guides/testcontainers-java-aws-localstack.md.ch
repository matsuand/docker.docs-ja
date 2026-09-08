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

@x
## Create the Spring Boot project
@y
## Create the Spring Boot project
@z

@x
### Set up the project
@y
### Set up the project
@z

@x
Create a Spring Boot project from [Spring Initializr](https://start.spring.io)
by selecting the **Testcontainers** starter. Spring Cloud AWS starters are not
available on Spring Initializr, so you need to add them manually.
@y
Create a Spring Boot project from [Spring Initializr](https://start.spring.io)
by selecting the **Testcontainers** starter. Spring Cloud AWS starters are not
available on Spring Initializr, so you need to add them manually.
@z

@x
Alternatively, clone the
[guide repository](https://github.com/testcontainers/tc-guide-testing-aws-service-integrations-using-localstack).
@y
Alternatively, clone the
[guide repository](https://github.com/testcontainers/tc-guide-testing-aws-service-integrations-using-localstack).
@z

@x
Add the Spring Cloud AWS BOM to your dependency management and add the S3, SQS
starters as dependencies. Testcontainers provides a
[LocalStack module](https://testcontainers.com/modules/localstack/) for testing
AWS service integrations. You also need
[Awaitility](http://www.awaitility.org/) for testing asynchronous SQS
processing.
@y
Add the Spring Cloud AWS BOM to your dependency management and add the S3, SQS
starters as dependencies. Testcontainers provides a
[LocalStack module](https://testcontainers.com/modules/localstack/) for testing
AWS service integrations. You also need
[Awaitility](http://www.awaitility.org/) for testing asynchronous SQS
processing.
@z

@x
The key dependencies in `pom.xml` are:
@y
The key dependencies in `pom.xml` are:
@z

@x
```xml
<properties>
    <java.version>17</java.version>
    <testcontainers.version>2.0.4</testcontainers.version>
    <awspring.version>3.0.3</awspring.version>
</properties>
@y
```xml
<properties>
    <java.version>17</java.version>
    <testcontainers.version>2.0.4</testcontainers.version>
    <awspring.version>3.0.3</awspring.version>
</properties>
@z

@x
<dependencies>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-web</artifactId>
    </dependency>
    <dependency>
        <groupId>io.awspring.cloud</groupId>
        <artifactId>spring-cloud-aws-starter-s3</artifactId>
    </dependency>
    <dependency>
        <groupId>io.awspring.cloud</groupId>
        <artifactId>spring-cloud-aws-starter-sqs</artifactId>
    </dependency>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-test</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-testcontainers</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.testcontainers</groupId>
        <artifactId>testcontainers-junit-jupiter</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.testcontainers</groupId>
        <artifactId>testcontainers-localstack</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.awaitility</groupId>
        <artifactId>awaitility</artifactId>
        <scope>test</scope>
    </dependency>
</dependencies>
@y
<dependencies>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-web</artifactId>
    </dependency>
    <dependency>
        <groupId>io.awspring.cloud</groupId>
        <artifactId>spring-cloud-aws-starter-s3</artifactId>
    </dependency>
    <dependency>
        <groupId>io.awspring.cloud</groupId>
        <artifactId>spring-cloud-aws-starter-sqs</artifactId>
    </dependency>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-test</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-testcontainers</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.testcontainers</groupId>
        <artifactId>testcontainers-junit-jupiter</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.testcontainers</groupId>
        <artifactId>testcontainers-localstack</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.awaitility</groupId>
        <artifactId>awaitility</artifactId>
        <scope>test</scope>
    </dependency>
</dependencies>
@z

@x
<dependencyManagement>
    <dependencies>
        <dependency>
            <groupId>io.awspring.cloud</groupId>
            <artifactId>spring-cloud-aws-dependencies</artifactId>
            <version>${awspring.version}</version>
            <type>pom</type>
            <scope>import</scope>
        </dependency>
    </dependencies>
</dependencyManagement>
```
@y
<dependencyManagement>
    <dependencies>
        <dependency>
            <groupId>io.awspring.cloud</groupId>
            <artifactId>spring-cloud-aws-dependencies</artifactId>
            <version>${awspring.version}</version>
            <type>pom</type>
            <scope>import</scope>
        </dependency>
    </dependencies>
</dependencyManagement>
```
@z

@x
### Create the configuration properties
@y
### Create the configuration properties
@z

@x
To make the SQS queue and S3 bucket names configurable, create an
`ApplicationProperties` record:
@y
To make the SQS queue and S3 bucket names configurable, create an
`ApplicationProperties` record:
@z

@x
```java
package com.testcontainers.demo;
@y
```java
package com.testcontainers.demo;
@z

@x
import org.springframework.boot.context.properties.ConfigurationProperties;
@y
import org.springframework.boot.context.properties.ConfigurationProperties;
@z

@x
@ConfigurationProperties(prefix = "app")
public record ApplicationProperties(String queue, String bucket) {}
```
@y
@ConfigurationProperties(prefix = "app")
public record ApplicationProperties(String queue, String bucket) {}
```
@z

@x
Then add `@ConfigurationPropertiesScan` to the main application class so that
Spring automatically scans for `@ConfigurationProperties`-annotated classes and
registers them as beans:
@y
Then add `@ConfigurationPropertiesScan` to the main application class so that
Spring automatically scans for `@ConfigurationProperties`-annotated classes and
registers them as beans:
@z

@x
```java
package com.testcontainers.demo;
@y
```java
package com.testcontainers.demo;
@z

@x
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;
@y
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;
@z

@x
@SpringBootApplication
@ConfigurationPropertiesScan
public class Application {
@y
@SpringBootApplication
@ConfigurationPropertiesScan
public class Application {
@z

@x
  public static void main(String[] args) {
    SpringApplication.run(Application.class, args);
  }
}
```
@y
  public static void main(String[] args) {
    SpringApplication.run(Application.class, args);
  }
}
```
@z

@x
### Implement StorageService for S3
@y
### Implement StorageService for S3
@z

@x
Spring Cloud AWS provides higher-level abstractions like `S3Template` with
convenience methods for uploading and downloading files. Create a
`StorageService` class:
@y
Spring Cloud AWS provides higher-level abstractions like `S3Template` with
convenience methods for uploading and downloading files. Create a
`StorageService` class:
@z

@x
```java
package com.testcontainers.demo;
@y
```java
package com.testcontainers.demo;
@z

@x
import io.awspring.cloud.s3.S3Template;
import java.io.IOException;
import java.io.InputStream;
import org.springframework.stereotype.Service;
@y
import io.awspring.cloud.s3.S3Template;
import java.io.IOException;
import java.io.InputStream;
import org.springframework.stereotype.Service;
@z

@x
@Service
public class StorageService {
@y
@Service
public class StorageService {
@z

@x
  private final S3Template s3Template;
@y
  private final S3Template s3Template;
@z

@x
  public StorageService(S3Template s3Template) {
    this.s3Template = s3Template;
  }
@y
  public StorageService(S3Template s3Template) {
    this.s3Template = s3Template;
  }
@z

@x
  public void upload(String bucketName, String key, InputStream stream) {
    this.s3Template.upload(bucketName, key, stream);
  }
@y
  public void upload(String bucketName, String key, InputStream stream) {
    this.s3Template.upload(bucketName, key, stream);
  }
@z

@x
  public InputStream download(String bucketName, String key)
    throws IOException {
    return this.s3Template.download(bucketName, key).getInputStream();
  }
@y
  public InputStream download(String bucketName, String key)
    throws IOException {
    return this.s3Template.download(bucketName, key).getInputStream();
  }
@z

@x
  public String downloadAsString(String bucketName, String key)
    throws IOException {
    try (InputStream is = this.download(bucketName, key)) {
      return new String(is.readAllBytes());
    }
  }
}
```
@y
  public String downloadAsString(String bucketName, String key)
    throws IOException {
    try (InputStream is = this.download(bucketName, key)) {
      return new String(is.readAllBytes());
    }
  }
}
```
@z

@x
### Create the SQS message model
@y
### Create the SQS message model
@z

@x
Create a `Message` record that represents the payload you send to the SQS
queue:
@y
Create a `Message` record that represents the payload you send to the SQS
queue:
@z

@x
```java
package com.testcontainers.demo;
@y
```java
package com.testcontainers.demo;
@z

@x
import java.util.UUID;
@y
import java.util.UUID;
@z

@x
public record Message(UUID uuid, String content) {}
```
@y
public record Message(UUID uuid, String content) {}
```
@z

@x
### Implement the message sender
@y
### Implement the message sender
@z

@x
Create `MessageSender`, which uses `SqsTemplate` to publish messages:
@y
Create `MessageSender`, which uses `SqsTemplate` to publish messages:
@z

@x
```java
package com.testcontainers.demo;
@y
```java
package com.testcontainers.demo;
@z

@x
import io.awspring.cloud.sqs.operations.SqsTemplate;
import org.springframework.stereotype.Service;
@y
import io.awspring.cloud.sqs.operations.SqsTemplate;
import org.springframework.stereotype.Service;
@z

@x
@Service
public class MessageSender {
@y
@Service
public class MessageSender {
@z

@x
  private final SqsTemplate sqsTemplate;
@y
  private final SqsTemplate sqsTemplate;
@z

@x
  public MessageSender(SqsTemplate sqsTemplate) {
    this.sqsTemplate = sqsTemplate;
  }
@y
  public MessageSender(SqsTemplate sqsTemplate) {
    this.sqsTemplate = sqsTemplate;
  }
@z

@x
  public void publish(String queueName, Message message) {
    sqsTemplate.send(to -> to.queue(queueName).payload(message));
  }
}
```
@y
  public void publish(String queueName, Message message) {
    sqsTemplate.send(to -> to.queue(queueName).payload(message));
  }
}
```
@z

@x
### Implement the message listener
@y
### Implement the message listener
@z

@x
Create `MessageListener` with a handler method annotated with `@SqsListener`.
When a message arrives, the listener uploads the content to an S3 bucket using
the message UUID as the key:
@y
Create `MessageListener` with a handler method annotated with `@SqsListener`.
When a message arrives, the listener uploads the content to an S3 bucket using
the message UUID as the key:
@z

@x
```java
package com.testcontainers.demo;
@y
```java
package com.testcontainers.demo;
@z

@x
import io.awspring.cloud.sqs.annotation.SqsListener;
import java.io.ByteArrayInputStream;
import java.nio.charset.StandardCharsets;
import org.springframework.stereotype.Service;
@y
import io.awspring.cloud.sqs.annotation.SqsListener;
import java.io.ByteArrayInputStream;
import java.nio.charset.StandardCharsets;
import org.springframework.stereotype.Service;
@z

@x
@Service
public class MessageListener {
@y
@Service
public class MessageListener {
@z

@x
  private final StorageService storageService;
  private final ApplicationProperties properties;
@y
  private final StorageService storageService;
  private final ApplicationProperties properties;
@z

@x
  public MessageListener(
    StorageService storageService,
    ApplicationProperties properties
  ) {
    this.storageService = storageService;
    this.properties = properties;
  }
@y
  public MessageListener(
    StorageService storageService,
    ApplicationProperties properties
  ) {
    this.storageService = storageService;
    this.properties = properties;
  }
@z

@x
  @SqsListener(queueNames = { "${app.queue}" })
  public void handle(Message message) {
    String bucketName = this.properties.bucket();
    String key = message.uuid().toString();
    ByteArrayInputStream is = new ByteArrayInputStream(
      message.content().getBytes(StandardCharsets.UTF_8)
    );
    this.storageService.upload(bucketName, key, is);
  }
}
```
@y
  @SqsListener(queueNames = { "${app.queue}" })
  public void handle(Message message) {
    String bucketName = this.properties.bucket();
    String key = message.uuid().toString();
    ByteArrayInputStream is = new ByteArrayInputStream(
      message.content().getBytes(StandardCharsets.UTF_8)
    );
    this.storageService.upload(bucketName, key, is);
  }
}
```
@z

@x
The `${app.queue}` expression reads the queue name from application
configuration instead of hard-coding it.
@y
The `${app.queue}` expression reads the queue name from application
configuration instead of hard-coding it.
@z

@x
## Write tests with Testcontainers
@y
## Write tests with Testcontainers
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
### Configure the test container
@y
### Configure the test container
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
### Write the test
@y
### Write the test
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

@x
## Run tests and next steps
@y
## Run tests and next steps
@z

@x
### Run the tests
@y
### Run the tests
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
### Summary
@y
### Summary
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
### Further reading
@y
### Further reading
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
