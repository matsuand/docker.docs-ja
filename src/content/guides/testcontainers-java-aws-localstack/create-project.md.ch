%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Create the Spring Boot project
linkTitle: Create the project
description: Set up a Spring Boot project with Spring Cloud AWS, S3, and SQS.
@y
title: Create the Spring Boot project
linkTitle: Create the project
description: Set up a Spring Boot project with Spring Cloud AWS, S3, and SQS.
@z

@x
## Set up the project
@y
## Set up the project
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
## Create the configuration properties
@y
## Create the configuration properties
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
## Implement StorageService for S3
@y
## Implement StorageService for S3
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
## Create the SQS message model
@y
## Create the SQS message model
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
## Implement the message sender
@y
## Implement the message sender
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
## Implement the message listener
@y
## Implement the message listener
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
