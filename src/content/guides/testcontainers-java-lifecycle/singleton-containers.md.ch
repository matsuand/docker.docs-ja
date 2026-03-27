%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Singleton containers pattern
linkTitle: Singleton containers
description: Share containers across multiple test classes using the singleton containers pattern.
@y
title: Singleton containers pattern
linkTitle: Singleton containers
description: Share containers across multiple test classes using the singleton containers pattern.
@z

@x
As the number of test classes grows, starting containers for each class adds
up. The singleton containers pattern starts all required containers once in a
common base class and reuses them across all integration tests.
@y
As the number of test classes grows, starting containers for each class adds
up. The singleton containers pattern starts all required containers once in a
common base class and reuses them across all integration tests.
@z

@x
## Define the base class
@y
## Define the base class
@z

@x
Create an abstract base class that starts the containers in a static
initializer:
@y
Create an abstract base class that starts the containers in a static
initializer:
@z

@x
```java
package com.testcontainers.demo;
@y
```java
package com.testcontainers.demo;
@z

@x
import org.testcontainers.postgresql.PostgreSQLContainer;
import org.testcontainers.kafka.ConfluentKafkaContainer;
@y
import org.testcontainers.postgresql.PostgreSQLContainer;
import org.testcontainers.kafka.ConfluentKafkaContainer;
@z

@x
public abstract class AbstractIntegrationTest {
@y
public abstract class AbstractIntegrationTest {
@z

@x
   static PostgreSQLContainer postgres = new PostgreSQLContainer(
           "postgres:16-alpine");
   static ConfluentKafkaContainer kafka = new ConfluentKafkaContainer(
           "confluentinc/cp-kafka:7.8.0");
@y
   static PostgreSQLContainer postgres = new PostgreSQLContainer(
           "postgres:16-alpine");
   static ConfluentKafkaContainer kafka = new ConfluentKafkaContainer(
           "confluentinc/cp-kafka:7.8.0");
@z

@x
   static {
       postgres.start();
       kafka.start();
   }
}
```
@y
   static {
       postgres.start();
       kafka.start();
   }
}
```
@z

@x
The containers start once when the class loads and Testcontainers uses the
[Ryuk container](https://github.com/testcontainers/moby-ryuk) to remove them
after the JVM exits.
@y
The containers start once when the class loads and Testcontainers uses the
[Ryuk container](https://github.com/testcontainers/moby-ryuk) to remove them
after the JVM exits.
@z

@x
> [!TIP]
> Instead of starting containers sequentially, start them in parallel using
> `Startables.deepStart(postgres, kafka).join();`
@y
> [!TIP]
> Instead of starting containers sequentially, start them in parallel using
> `Startables.deepStart(postgres, kafka).join();`
@z

@x
## Extend the base class
@y
## Extend the base class
@z

@x
Each test class inherits from the base class and reuses the same containers:
@y
Each test class inherits from the base class and reuses the same containers:
@z

@x
```java
class ProductControllerTest extends AbstractIntegrationTest {
@y
```java
class ProductControllerTest extends AbstractIntegrationTest {
@z

@x
   ProductRepository productRepository;
@y
   ProductRepository productRepository;
@z

@x
   @BeforeEach
   void setUp() {
       productRepository = new ProductRepository(...);
       productRepository.deleteAll();
   }
@y
   @BeforeEach
   void setUp() {
       productRepository = new ProductRepository(...);
       productRepository.deleteAll();
   }
@z

@x
   @Test
   void shouldGetAllProducts() {
       // test logic using the shared postgres container
   }
}
```
@y
   @Test
   void shouldGetAllProducts() {
       // test logic using the shared postgres container
   }
}
```
@z

@x
## Avoid a common misconfiguration
@y
## Avoid a common misconfiguration
@z

@x
A common mistake is combining singleton containers with the `@Testcontainers`
and `@Container` annotations:
@y
A common mistake is combining singleton containers with the `@Testcontainers`
and `@Container` annotations:
@z

@x
```java
// DON'T DO THIS — containers will stop after each test class
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@Testcontainers
public abstract class AbstractIntegrationTest {
@y
```java
// DON'T DO THIS — containers will stop after each test class
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@Testcontainers
public abstract class AbstractIntegrationTest {
@z

@x
   @Container
   static PostgreSQLContainer<?> postgres = new PostgreSQLContainer<>(
           DockerImageName.parse("postgres:16-alpine"));
@y
   @Container
   static PostgreSQLContainer<?> postgres = new PostgreSQLContainer<>(
           DockerImageName.parse("postgres:16-alpine"));
@z

@x
   @DynamicPropertySource
   static void configureProperties(DynamicPropertyRegistry registry) {
       registry.add("spring.datasource.url", postgres::getJdbcUrl);
       registry.add("spring.datasource.username", postgres::getUsername);
       registry.add("spring.datasource.password", postgres::getPassword);
   }
}
```
@y
   @DynamicPropertySource
   static void configureProperties(DynamicPropertyRegistry registry) {
       registry.add("spring.datasource.url", postgres::getJdbcUrl);
       registry.add("spring.datasource.username", postgres::getUsername);
       registry.add("spring.datasource.password", postgres::getPassword);
   }
}
```
@z

@x
The `@Testcontainers` extension stops containers at the end of **each test
class**. Subsequent test classes reuse the cached Spring context, but the
containers are already stopped — causing connection failures.
@y
The `@Testcontainers` extension stops containers at the end of **each test
class**. Subsequent test classes reuse the cached Spring context, but the
containers are already stopped — causing connection failures.
@z

@x
Instead, use a static initializer or `@BeforeAll` to start the containers,
without the `@Testcontainers` and `@Container` annotations.
@y
Instead, use a static initializer or `@BeforeAll` to start the containers,
without the `@Testcontainers` and `@Container` annotations.
@z

@x
## Summary
@y
## Summary
@z

@x
- Use **JUnit 5 lifecycle callbacks** (`@BeforeAll`/`@AfterAll`) for
  explicit control over container startup and shutdown.
- Use **extension annotations** (`@Testcontainers`/`@Container`) for less
  boilerplate in single test classes.
- Use the **singleton containers pattern** (static initializer in a base class)
  to share containers across multiple test classes.
- Don't mix singleton containers with `@Testcontainers`/`@Container`
  annotations.
@y
- Use **JUnit 5 lifecycle callbacks** (`@BeforeAll`/`@AfterAll`) for
  explicit control over container startup and shutdown.
- Use **extension annotations** (`@Testcontainers`/`@Container`) for less
  boilerplate in single test classes.
- Use the **singleton containers pattern** (static initializer in a base class)
  to share containers across multiple test classes.
- Don't mix singleton containers with `@Testcontainers`/`@Container`
  annotations.
@z

@x
## Further reading
@y
## Further reading
@z

@x
- [Testcontainers JUnit 5 quickstart](https://java.testcontainers.org/quickstart/junit_5_quickstart/)
- [Testcontainers singleton containers pattern](https://java.testcontainers.org/test_framework_integration/manual_lifecycle_control/#singleton-containers)
- [Testing a Spring Boot REST API with Testcontainers](/guides/testcontainers-java-spring-boot-rest-api/)
@y
- [Testcontainers JUnit 5 quickstart](https://java.testcontainers.org/quickstart/junit_5_quickstart/)
- [Testcontainers singleton containers pattern](https://java.testcontainers.org/test_framework_integration/manual_lifecycle_control/#singleton-containers)
- [Testing a Spring Boot REST API with Testcontainers](__SUBDIR__/guides/testcontainers-java-spring-boot-rest-api/)
@z
