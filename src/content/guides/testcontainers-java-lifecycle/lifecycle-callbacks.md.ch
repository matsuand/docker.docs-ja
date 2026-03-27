%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: JUnit 5 lifecycle callbacks
linkTitle: Lifecycle callbacks
description: Manage Testcontainers container lifecycle using JUnit 5 @BeforeAll and @AfterAll callbacks.
@y
title: JUnit 5 lifecycle callbacks
linkTitle: Lifecycle callbacks
description: Manage Testcontainers container lifecycle using JUnit 5 @BeforeAll and @AfterAll callbacks.
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
