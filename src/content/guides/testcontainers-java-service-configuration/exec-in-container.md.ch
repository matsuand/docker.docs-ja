%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Execute commands inside containers
linkTitle: Execute commands
description: Run commands inside running containers to initialize services for testing.
@y
title: Execute commands inside containers
linkTitle: Execute commands
description: Run commands inside running containers to initialize services for testing.
@z

@x
Some Docker containers provide CLI tools for performing actions. You can use
`container.execInContainer(String...)` to run any available command inside a
running container.
@y
Some Docker containers provide CLI tools for performing actions. You can use
`container.execInContainer(String...)` to run any available command inside a
running container.
@z

@x
## Example: Create an S3 bucket in LocalStack
@y
## Example: Create an S3 bucket in LocalStack
@z

@x
The [LocalStack](https://localstack.cloud/) module emulates AWS services. To
test S3 file uploads, create a bucket before running tests:
@y
The [LocalStack](https://localstack.cloud/) module emulates AWS services. To
test S3 file uploads, create a bucket before running tests:
@z

@x
```java
package com.testcontainers.demo;
@y
```java
package com.testcontainers.demo;
@z

@x
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.testcontainers.containers.localstack.LocalStackContainer.Service.S3;
@y
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.testcontainers.containers.localstack.LocalStackContainer.Service.S3;
@z

@x
import java.io.IOException;
import java.net.URI;
import java.util.List;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.testcontainers.containers.localstack.LocalStackContainer;
import org.testcontainers.junit.jupiter.Container;
import org.testcontainers.junit.jupiter.Testcontainers;
import org.testcontainers.utility.DockerImageName;
import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.Bucket;
@y
import java.io.IOException;
import java.net.URI;
import java.util.List;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.testcontainers.containers.localstack.LocalStackContainer;
import org.testcontainers.junit.jupiter.Container;
import org.testcontainers.junit.jupiter.Testcontainers;
import org.testcontainers.utility.DockerImageName;
import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.Bucket;
@z

@x
@Testcontainers
class LocalStackTest {
@y
@Testcontainers
class LocalStackTest {
@z

@x
  static final String bucketName = "mybucket";
@y
  static final String bucketName = "mybucket";
@z

@x
  @Container
  static LocalStackContainer localStack = new LocalStackContainer(
    DockerImageName.parse("localstack/localstack:3.4.0")
  );
@y
  @Container
  static LocalStackContainer localStack = new LocalStackContainer(
    DockerImageName.parse("localstack/localstack:3.4.0")
  );
@z

@x
  @BeforeAll
  static void beforeAll() throws IOException, InterruptedException {
    localStack.execInContainer("awslocal", "s3", "mb", "s3://" + bucketName);
@y
  @BeforeAll
  static void beforeAll() throws IOException, InterruptedException {
    localStack.execInContainer("awslocal", "s3", "mb", "s3://" + bucketName);
@z

@x
    org.testcontainers.containers.Container.ExecResult execResult =
      localStack.execInContainer("awslocal", "s3", "ls");
    String stdout = execResult.getStdout();
    int exitCode = execResult.getExitCode();
    assertTrue(stdout.contains(bucketName));
    assertEquals(0, exitCode);
  }
@y
    org.testcontainers.containers.Container.ExecResult execResult =
      localStack.execInContainer("awslocal", "s3", "ls");
    String stdout = execResult.getStdout();
    int exitCode = execResult.getExitCode();
    assertTrue(stdout.contains(bucketName));
    assertEquals(0, exitCode);
  }
@z

@x
  @Test
  void shouldListBuckets() {
    URI s3Endpoint = localStack.getEndpointOverride(S3);
    StaticCredentialsProvider credentialsProvider =
      StaticCredentialsProvider.create(
        AwsBasicCredentials.create(
          localStack.getAccessKey(),
          localStack.getSecretKey()
        )
      );
    S3Client s3 = S3Client
      .builder()
      .endpointOverride(s3Endpoint)
      .credentialsProvider(credentialsProvider)
      .region(Region.of(localStack.getRegion()))
      .build();
@y
  @Test
  void shouldListBuckets() {
    URI s3Endpoint = localStack.getEndpointOverride(S3);
    StaticCredentialsProvider credentialsProvider =
      StaticCredentialsProvider.create(
        AwsBasicCredentials.create(
          localStack.getAccessKey(),
          localStack.getSecretKey()
        )
      );
    S3Client s3 = S3Client
      .builder()
      .endpointOverride(s3Endpoint)
      .credentialsProvider(credentialsProvider)
      .region(Region.of(localStack.getRegion()))
      .build();
@z

@x
    List<String> s3Buckets = s3
      .listBuckets()
      .buckets()
      .stream()
      .map(Bucket::name)
      .toList();
@y
    List<String> s3Buckets = s3
      .listBuckets()
      .buckets()
      .stream()
      .map(Bucket::name)
      .toList();
@z

@x
    assertTrue(s3Buckets.contains(bucketName));
  }
}
```
@y
    assertTrue(s3Buckets.contains(bucketName));
  }
}
```
@z

@x
The `execInContainer("awslocal", "s3", "mb", "s3://mybucket")` call runs the
`awslocal` CLI tool (provided by the LocalStack image) to create an S3 bucket.
@y
The `execInContainer("awslocal", "s3", "mb", "s3://mybucket")` call runs the
`awslocal` CLI tool (provided by the LocalStack image) to create an S3 bucket.
@z

@x
You can capture the output and exit code from any command:
@y
You can capture the output and exit code from any command:
@z

@x
```java
Container.ExecResult execResult =
    localStack.execInContainer("awslocal", "s3", "ls");
String stdout = execResult.getStdout();
int exitCode = execResult.getExitCode();
```
@y
```java
Container.ExecResult execResult =
    localStack.execInContainer("awslocal", "s3", "ls");
String stdout = execResult.getStdout();
int exitCode = execResult.getExitCode();
```
@z

@x
> [!NOTE]
> The `withCopyFileToContainer()` and `execInContainer()` methods are inherited
> from `GenericContainer`, so they're available for all Testcontainers modules.
@y
> [!NOTE]
> The `withCopyFileToContainer()` and `execInContainer()` methods are inherited
> from `GenericContainer`, so they're available for all Testcontainers modules.
@z

@x
## Summary
@y
## Summary
@z

@x
- Use `withCopyFileToContainer()` to place initialization files inside
  containers before they start.
- Use `execInContainer()` to run commands inside running containers for
  setup tasks like creating buckets, topics, or queues.
@y
- Use `withCopyFileToContainer()` to place initialization files inside
  containers before they start.
- Use `execInContainer()` to run commands inside running containers for
  setup tasks like creating buckets, topics, or queues.
@z

@x
## Further reading
@y
## Further reading
@z

@x
- [Getting started with Testcontainers for Java](/guides/testcontainers-java-getting-started/)
- [Testcontainers Postgres module](https://java.testcontainers.org/modules/databases/postgres/)
- [Testcontainers LocalStack module](https://java.testcontainers.org/modules/localstack/)
@y
- [Getting started with Testcontainers for Java](__SUBDIR__/guides/testcontainers-java-getting-started/)
- [Testcontainers Postgres module](https://java.testcontainers.org/modules/databases/postgres/)
- [Testcontainers LocalStack module](https://java.testcontainers.org/modules/localstack/)
@z
