%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

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
title: Testcontainers container lifecycle management using JUnit 5
linkTitle: Container lifecycle (Java)
description: Learn how to manage Testcontainers container lifecycle using JUnit 5 callbacks, extension annotations, and the singleton containers pattern.
keywords: testcontainers, java, testing, junit, lifecycle, singleton containers, postgresql
summary: |
  Learn different approaches to manage container lifecycle with Testcontainers
  using JUnit 5 lifecycle callbacks, extension annotations, and the singleton
  containers pattern.
@z

@x
  time: 20 minutes
@y
  time: 20 分
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

@x
## Create the project and business logic
@y
## Create the project and business logic
@z

@x
### Set up the project
@y
### Set up the project
@z

@x
Create a Java project with Maven and add the required dependencies:
@y
Create a Java project with Maven and add the required dependencies:
@z

@x
```xml
<dependencies>
    <dependency>
        <groupId>org.postgresql</groupId>
        <artifactId>postgresql</artifactId>
        <version>42.7.3</version>
    </dependency>
    <dependency>
        <groupId>ch.qos.logback</groupId>
        <artifactId>logback-classic</artifactId>
        <version>1.5.6</version>
    </dependency>
    <dependency>
        <groupId>org.junit.jupiter</groupId>
        <artifactId>junit-jupiter</artifactId>
        <version>5.10.2</version>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.testcontainers</groupId>
        <artifactId>testcontainers-junit-jupiter</artifactId>
        <version>2.0.4</version>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.testcontainers</groupId>
        <artifactId>testcontainers-postgresql</artifactId>
        <version>2.0.4</version>
        <scope>test</scope>
    </dependency>
</dependencies>
```
@y
```xml
<dependencies>
    <dependency>
        <groupId>org.postgresql</groupId>
        <artifactId>postgresql</artifactId>
        <version>42.7.3</version>
    </dependency>
    <dependency>
        <groupId>ch.qos.logback</groupId>
        <artifactId>logback-classic</artifactId>
        <version>1.5.6</version>
    </dependency>
    <dependency>
        <groupId>org.junit.jupiter</groupId>
        <artifactId>junit-jupiter</artifactId>
        <version>5.10.2</version>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.testcontainers</groupId>
        <artifactId>testcontainers-junit-jupiter</artifactId>
        <version>2.0.4</version>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.testcontainers</groupId>
        <artifactId>testcontainers-postgresql</artifactId>
        <version>2.0.4</version>
        <scope>test</scope>
    </dependency>
</dependencies>
```
@z

@x
### Create the business logic
@y
### Create the business logic
@z

@x
Create a `Customer` record:
@y
Create a `Customer` record:
@z

@x
```java
package com.testcontainers.demo;
@y
```java
package com.testcontainers.demo;
@z

@x
public record Customer(Long id, String name) {}
```
@y
public record Customer(Long id, String name) {}
```
@z

@x
Create a `CustomerService` class with methods to create, retrieve, and delete
customers:
@y
Create a `CustomerService` class with methods to create, retrieve, and delete
customers:
@z

@x
```java
package com.testcontainers.demo;
@y
```java
package com.testcontainers.demo;
@z

@x
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
@y
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
@z

@x
public class CustomerService {
@y
public class CustomerService {
@z

@x
  private final String url;
  private final String username;
  private final String password;
@y
  private final String url;
  private final String username;
  private final String password;
@z

@x
  public CustomerService(String url, String username, String password) {
    this.url = url;
    this.username = username;
    this.password = password;
    createCustomersTableIfNotExists();
  }
@y
  public CustomerService(String url, String username, String password) {
    this.url = url;
    this.username = username;
    this.password = password;
    createCustomersTableIfNotExists();
  }
@z

@x
  public void createCustomer(Customer customer) {
    try (Connection conn = this.getConnection()) {
      PreparedStatement pstmt = conn.prepareStatement(
        "insert into customers(id,name) values(?,?)"
      );
      pstmt.setLong(1, customer.id());
      pstmt.setString(2, customer.name());
      pstmt.execute();
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }
@y
  public void createCustomer(Customer customer) {
    try (Connection conn = this.getConnection()) {
      PreparedStatement pstmt = conn.prepareStatement(
        "insert into customers(id,name) values(?,?)"
      );
      pstmt.setLong(1, customer.id());
      pstmt.setString(2, customer.name());
      pstmt.execute();
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }
@z

@x
  public List<Customer> getAllCustomers() {
    List<Customer> customers = new ArrayList<>();
    try (Connection conn = this.getConnection()) {
      PreparedStatement pstmt = conn.prepareStatement(
        "select id,name from customers"
      );
      ResultSet rs = pstmt.executeQuery();
      while (rs.next()) {
        long id = rs.getLong("id");
        String name = rs.getString("name");
        customers.add(new Customer(id, name));
      }
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
    return customers;
  }
@y
  public List<Customer> getAllCustomers() {
    List<Customer> customers = new ArrayList<>();
    try (Connection conn = this.getConnection()) {
      PreparedStatement pstmt = conn.prepareStatement(
        "select id,name from customers"
      );
      ResultSet rs = pstmt.executeQuery();
      while (rs.next()) {
        long id = rs.getLong("id");
        String name = rs.getString("name");
        customers.add(new Customer(id, name));
      }
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
    return customers;
  }
@z

@x
  public Optional<Customer> getCustomer(Long customerId) {
    try (Connection conn = this.getConnection()) {
      PreparedStatement pstmt = conn.prepareStatement(
        "select id,name from customers where id = ?"
      );
      pstmt.setLong(1, customerId);
      ResultSet rs = pstmt.executeQuery();
      if (rs.next()) {
        long id = rs.getLong("id");
        String name = rs.getString("name");
        return Optional.of(new Customer(id, name));
      }
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
    return Optional.empty();
  }
@y
  public Optional<Customer> getCustomer(Long customerId) {
    try (Connection conn = this.getConnection()) {
      PreparedStatement pstmt = conn.prepareStatement(
        "select id,name from customers where id = ?"
      );
      pstmt.setLong(1, customerId);
      ResultSet rs = pstmt.executeQuery();
      if (rs.next()) {
        long id = rs.getLong("id");
        String name = rs.getString("name");
        return Optional.of(new Customer(id, name));
      }
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
    return Optional.empty();
  }
@z

@x
  public void deleteAllCustomers() {
    try (Connection conn = this.getConnection()) {
      PreparedStatement pstmt = conn.prepareStatement("delete from customers");
      pstmt.execute();
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }
@y
  public void deleteAllCustomers() {
    try (Connection conn = this.getConnection()) {
      PreparedStatement pstmt = conn.prepareStatement("delete from customers");
      pstmt.execute();
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }
@z

@x
  private void createCustomersTableIfNotExists() {
    try (Connection conn = this.getConnection()) {
      PreparedStatement pstmt = conn.prepareStatement(
        """
        create table if not exists customers (
            id bigint not null,
            name varchar not null,
            primary key (id)
        )
        """
      );
      pstmt.execute();
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }
@y
  private void createCustomersTableIfNotExists() {
    try (Connection conn = this.getConnection()) {
      PreparedStatement pstmt = conn.prepareStatement(
        """
        create table if not exists customers (
            id bigint not null,
            name varchar not null,
            primary key (id)
        )
        """
      );
      pstmt.execute();
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }
@z

@x
  private Connection getConnection() {
    try {
      return DriverManager.getConnection(url, username, password);
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
  }
}
```
@y
  private Connection getConnection() {
    try {
      return DriverManager.getConnection(url, username, password);
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
  }
}
```
@z

@x
## JUnit 5 lifecycle callbacks
@y
## JUnit 5 lifecycle callbacks
@z

@x
When testing with Testcontainers, you want to start the required containers
before executing any tests and remove them afterwards. You can use JUnit 5
`@BeforeAll` and `@AfterAll` lifecycle callback methods for this:
@y
When testing with Testcontainers, you want to start the required containers
before executing any tests and remove them afterwards. You can use JUnit 5
`@BeforeAll` and `@AfterAll` lifecycle callback methods for this:
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
@y
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
@z

@x
import java.util.List;
import java.util.Optional;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.testcontainers.postgresql.PostgreSQLContainer;
@y
import java.util.List;
import java.util.Optional;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.testcontainers.postgresql.PostgreSQLContainer;
@z

@x
class CustomerServiceWithLifeCycleCallbacksTest {
@y
class CustomerServiceWithLifeCycleCallbacksTest {
@z

@x
  static PostgreSQLContainer postgres = new PostgreSQLContainer(
    "postgres:16-alpine"
  );
@y
  static PostgreSQLContainer postgres = new PostgreSQLContainer(
    "postgres:16-alpine"
  );
@z

@x
  CustomerService customerService;
@y
  CustomerService customerService;
@z

@x
  @BeforeAll
  static void startContainers() {
    postgres.start();
  }
@y
  @BeforeAll
  static void startContainers() {
    postgres.start();
  }
@z

@x
  @AfterAll
  static void stopContainers() {
    postgres.stop();
  }
@y
  @AfterAll
  static void stopContainers() {
    postgres.stop();
  }
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
    customerService.deleteAllCustomers();
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
    customerService.deleteAllCustomers();
  }
@z

@x
  @Test
  void shouldCreateCustomer() {
    customerService.createCustomer(new Customer(1L, "George"));
@y
  @Test
  void shouldCreateCustomer() {
    customerService.createCustomer(new Customer(1L, "George"));
@z

@x
    Optional<Customer> customer = customerService.getCustomer(1L);
    assertTrue(customer.isPresent());
    assertEquals(1L, customer.get().id());
    assertEquals("George", customer.get().name());
  }
@y
    Optional<Customer> customer = customerService.getCustomer(1L);
    assertTrue(customer.isPresent());
    assertEquals(1L, customer.get().id());
    assertEquals("George", customer.get().name());
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
    assertEquals(2, customers.size());
  }
}
```
@y
    List<Customer> customers = customerService.getAllCustomers();
    assertEquals(2, customers.size());
  }
}
```
@z

@x
Here's what the code does:
@y
Here's what the code does:
@z

@x
- `PostgreSQLContainer` is declared as a **static field**. The container starts
  before all tests and stops after all tests in this class.
- `@BeforeAll` starts the container, `@AfterAll` stops it.
- `@BeforeEach` initializes `CustomerService` with the container's JDBC
  parameters and deletes all rows to give each test a clean database.
@y
- `PostgreSQLContainer` is declared as a **static field**. The container starts
  before all tests and stops after all tests in this class.
- `@BeforeAll` starts the container, `@AfterAll` stops it.
- `@BeforeEach` initializes `CustomerService` with the container's JDBC
  parameters and deletes all rows to give each test a clean database.
@z

@x
Key observations:
@y
Key observations:
@z

@x
- Because the container is a **static field**, it's shared across all test
  methods in the class. You can declare it as a non-static field and use
  `@BeforeEach`/`@AfterEach` to start a new container per test, but this
  isn't recommended as it's resource-intensive.
- Even without explicitly stopping the container in `@AfterAll`, Testcontainers
  uses the [Ryuk container](https://github.com/testcontainers/moby-ryuk) to
  clean up containers automatically when the JVM exits.
@y
- Because the container is a **static field**, it's shared across all test
  methods in the class. You can declare it as a non-static field and use
  `@BeforeEach`/`@AfterEach` to start a new container per test, but this
  isn't recommended as it's resource-intensive.
- Even without explicitly stopping the container in `@AfterAll`, Testcontainers
  uses the [Ryuk container](https://github.com/testcontainers/moby-ryuk) to
  clean up containers automatically when the JVM exits.
@z

@x
## JUnit 5 extension annotations
@y
## JUnit 5 extension annotations
@z

@x
The Testcontainers library provides a JUnit 5 extension that simplifies
starting and stopping containers using annotations. To use it, add the
`org.testcontainers:testcontainers-junit-jupiter` test dependency.
@y
The Testcontainers library provides a JUnit 5 extension that simplifies
starting and stopping containers using annotations. To use it, add the
`org.testcontainers:testcontainers-junit-jupiter` test dependency.
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
@y
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
@z

@x
import java.util.List;
import java.util.Optional;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.testcontainers.postgresql.PostgreSQLContainer;
import org.testcontainers.junit.jupiter.Container;
import org.testcontainers.junit.jupiter.Testcontainers;
@y
import java.util.List;
import java.util.Optional;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.testcontainers.postgresql.PostgreSQLContainer;
import org.testcontainers.junit.jupiter.Container;
import org.testcontainers.junit.jupiter.Testcontainers;
@z

@x
@Testcontainers
class CustomerServiceWithJUnit5ExtensionTest {
@y
@Testcontainers
class CustomerServiceWithJUnit5ExtensionTest {
@z

@x
  @Container
  static PostgreSQLContainer postgres = new PostgreSQLContainer(
    "postgres:16-alpine"
  );
@y
  @Container
  static PostgreSQLContainer postgres = new PostgreSQLContainer(
    "postgres:16-alpine"
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
    customerService.deleteAllCustomers();
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
    customerService.deleteAllCustomers();
  }
@z

@x
  @Test
  void shouldCreateCustomer() {
    customerService.createCustomer(new Customer(1L, "George"));
@y
  @Test
  void shouldCreateCustomer() {
    customerService.createCustomer(new Customer(1L, "George"));
@z

@x
    Optional<Customer> customer = customerService.getCustomer(1L);
    assertTrue(customer.isPresent());
    assertEquals(1L, customer.get().id());
    assertEquals("George", customer.get().name());
  }
@y
    Optional<Customer> customer = customerService.getCustomer(1L);
    assertTrue(customer.isPresent());
    assertEquals(1L, customer.get().id());
    assertEquals("George", customer.get().name());
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
    assertEquals(2, customers.size());
  }
}
```
@y
    List<Customer> customers = customerService.getAllCustomers();
    assertEquals(2, customers.size());
  }
}
```
@z

@x
Instead of manually starting and stopping the container in `@BeforeAll` and
`@AfterAll`, the `@Testcontainers` annotation on the class and the
`@Container` annotation on the field handle it automatically:
@y
Instead of manually starting and stopping the container in `@BeforeAll` and
`@AfterAll`, the `@Testcontainers` annotation on the class and the
`@Container` annotation on the field handle it automatically:
@z

@x
- The extension finds all `@Container`-annotated fields.
- **Static fields** start once before all tests and stop after all tests.
- **Instance fields** start before each test and stop after each test (not
  recommended — it's resource-intensive).
@y
- The extension finds all `@Container`-annotated fields.
- **Static fields** start once before all tests and stop after all tests.
- **Instance fields** start before each test and stop after each test (not
  recommended — it's resource-intensive).
@z

@x
## Singleton containers pattern
@y
## Singleton containers pattern
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
### Define the base class
@y
### Define the base class
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
### Extend the base class
@y
### Extend the base class
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
### Avoid a common misconfiguration
@y
### Avoid a common misconfiguration
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
### Summary
@y
### Summary
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
### Further reading
@y
### Further reading
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
