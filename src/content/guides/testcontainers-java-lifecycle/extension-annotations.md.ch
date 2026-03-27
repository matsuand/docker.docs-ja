%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: JUnit 5 extension annotations
linkTitle: Extension annotations
description: Manage Testcontainers container lifecycle using @Testcontainers and @Container annotations.
@y
title: JUnit 5 extension annotations
linkTitle: Extension annotations
description: Manage Testcontainers container lifecycle using @Testcontainers and @Container annotations.
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
