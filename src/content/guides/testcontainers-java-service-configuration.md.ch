%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Configuration of services running in a container
linkTitle: Service configuration (Java)
description: Learn how to configure services running in Testcontainers by copying files and executing commands inside containers.
keywords: testcontainers, java, testing, postgresql, localstack, container configuration
summary: |
  Learn how to initialize and configure Docker containers for testing
  by copying files into containers and executing commands inside them.
@y
title: Configuration of services running in a container
linkTitle: Service configuration (Java)
description: Learn how to configure services running in Testcontainers by copying files and executing commands inside containers.
keywords: testcontainers, java, testing, postgresql, localstack, container configuration
summary: |
  Learn how to initialize and configure Docker containers for testing
  by copying files into containers and executing commands inside them.
@z

@x
  time: 15 minutes
@y
  time: 15 分
@z

@x
<!-- Source: https://github.com/testcontainers/tc-guide-configuration-of-services-running-in-container -->
@y
<!-- Source: https://github.com/testcontainers/tc-guide-configuration-of-services-running-in-container -->
@z

@x
In this guide, you will learn how to:
@y
In this guide, you will learn how to:
@z

@x
- Initialize containers by copying files into them
- Run commands inside running containers using `execInContainer()`
- Set up a PostgreSQL database with SQL scripts
- Create AWS S3 buckets in LocalStack containers
@y
- Initialize containers by copying files into them
- Run commands inside running containers using `execInContainer()`
- Set up a PostgreSQL database with SQL scripts
- Create AWS S3 buckets in LocalStack containers
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

@x
## Copy files into containers
@y
## Copy files into containers
@z

@x
Sometimes you need to initialize a container by placing files in a specific
location. For example, PostgreSQL runs SQL scripts from
`/docker-entrypoint-initdb.d/` when the container starts.
@y
Sometimes you need to initialize a container by placing files in a specific
location. For example, PostgreSQL runs SQL scripts from
`/docker-entrypoint-initdb.d/` when the container starts.
@z

@x
### Create the initialization script
@y
### Create the initialization script
@z

@x
Create `src/test/resources/init-db.sql`:
@y
Create `src/test/resources/init-db.sql`:
@z

@x
```sql
create table customers (
     id bigint not null,
     name varchar not null,
     primary key (id)
);
```
@y
```sql
create table customers (
     id bigint not null,
     name varchar not null,
     primary key (id)
);
```
@z

@x
### Copy the file into the container
@y
### Copy the file into the container
@z

@x
Use `withCopyFileToContainer()` to copy the SQL script into the container's
init directory:
@y
Use `withCopyFileToContainer()` to copy the SQL script into the container's
init directory:
@z

@x
```java
package com.testcontainers.demo;
@y
```java
package com.testcontainers.demo;
@z

@x
import static org.junit.jupiter.api.Assertions.assertFalse;
@y
import static org.junit.jupiter.api.Assertions.assertFalse;
@z

@x
import java.util.List;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.testcontainers.postgresql.PostgreSQLContainer;
import org.testcontainers.junit.jupiter.Container;
import org.testcontainers.junit.jupiter.Testcontainers;
import org.testcontainers.utility.MountableFile;
@y
import java.util.List;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.testcontainers.postgresql.PostgreSQLContainer;
import org.testcontainers.junit.jupiter.Container;
import org.testcontainers.junit.jupiter.Testcontainers;
import org.testcontainers.utility.MountableFile;
@z

@x
@Testcontainers
class CustomerServiceTest {
@y
@Testcontainers
class CustomerServiceTest {
@z

@x
  @Container
  static PostgreSQLContainer postgres = new PostgreSQLContainer(
    "postgres:16-alpine"
  )
    .withCopyFileToContainer(
      MountableFile.forClasspathResource("init-db.sql"),
      "/docker-entrypoint-initdb.d/"
    );
@y
  @Container
  static PostgreSQLContainer postgres = new PostgreSQLContainer(
    "postgres:16-alpine"
  )
    .withCopyFileToContainer(
      MountableFile.forClasspathResource("init-db.sql"),
      "/docker-entrypoint-initdb.d/"
    );
@z

@x
  CustomerService customerService;
@y
  CustomerService customerService;
@z

@x
  @BeforeEach
  void setUp() {
    customerService =
    new CustomerService(
      postgres.getJdbcUrl(),
      postgres.getUsername(),
      postgres.getPassword()
    );
  }
@y
  @BeforeEach
  void setUp() {
    customerService =
    new CustomerService(
      postgres.getJdbcUrl(),
      postgres.getUsername(),
      postgres.getPassword()
    );
  }
@z

@x
  @Test
  void shouldGetCustomers() {
    customerService.createCustomer(new Customer(1L, "George"));
    customerService.createCustomer(new Customer(2L, "John"));
@y
  @Test
  void shouldGetCustomers() {
    customerService.createCustomer(new Customer(1L, "George"));
    customerService.createCustomer(new Customer(2L, "John"));
@z

@x
    List<Customer> customers = customerService.getAllCustomers();
    assertFalse(customers.isEmpty());
  }
}
```
@y
    List<Customer> customers = customerService.getAllCustomers();
    assertFalse(customers.isEmpty());
  }
}
```
@z

@x
The `withCopyFileToContainer(MountableFile, String)` method copies `init-db.sql`
from the classpath into `/docker-entrypoint-initdb.d/` inside the container.
PostgreSQL executes scripts in that directory automatically at startup.
@y
The `withCopyFileToContainer(MountableFile, String)` method copies `init-db.sql`
from the classpath into `/docker-entrypoint-initdb.d/` inside the container.
PostgreSQL executes scripts in that directory automatically at startup.
@z

@x
You can also copy files from any path on the host:
@y
You can also copy files from any path on the host:
@z

@x
```java
.withCopyFileToContainer(
    MountableFile.forHostPath("/host/path/to/init-db.sql"),
    "/docker-entrypoint-initdb.d/"
);
```
@y
```java
.withCopyFileToContainer(
    MountableFile.forHostPath("/host/path/to/init-db.sql"),
    "/docker-entrypoint-initdb.d/"
);
```
@z

@x
## Execute commands inside containers
@y
## Execute commands inside containers
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
### Example: Create an S3 bucket in LocalStack
@y
### Example: Create an S3 bucket in LocalStack
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
### Summary
@y
### Summary
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
### Further reading
@y
### Further reading
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
