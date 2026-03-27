%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Write tests with Testcontainers
linkTitle: Write tests
description: Write your first integration test using Testcontainers for Java and PostgreSQL.
@y
title: Write tests with Testcontainers
linkTitle: Write tests
description: Write your first integration test using Testcontainers for Java and PostgreSQL.
@z

@x
You have the `CustomerService` implementation ready, but for testing you need a
PostgreSQL database. You can use Testcontainers to spin up a Postgres database
in a Docker container and run your tests against it.
@y
You have the `CustomerService` implementation ready, but for testing you need a
PostgreSQL database. You can use Testcontainers to spin up a Postgres database
in a Docker container and run your tests against it.
@z

@x
## Add Testcontainers dependencies
@y
## Add Testcontainers dependencies
@z

@x
Add the Testcontainers PostgreSQL module as a test dependency in `pom.xml`:
@y
Add the Testcontainers PostgreSQL module as a test dependency in `pom.xml`:
@z

@x
```xml
<dependency>
    <groupId>org.testcontainers</groupId>
    <artifactId>testcontainers-postgresql</artifactId>
    <version>2.0.4</version>
    <scope>test</scope>
</dependency>
```
@y
```xml
<dependency>
    <groupId>org.testcontainers</groupId>
    <artifactId>testcontainers-postgresql</artifactId>
    <version>2.0.4</version>
    <scope>test</scope>
</dependency>
```
@z

@x
Since the application uses a Postgres database, the Testcontainers Postgres
module provides a `PostgreSQLContainer` class for managing the container.
@y
Since the application uses a Postgres database, the Testcontainers Postgres
module provides a `PostgreSQLContainer` class for managing the container.
@z

@x
## Write the test
@y
## Write the test
@z

@x
Create `CustomerServiceTest.java` under `src/test/java`:
@y
Create `CustomerServiceTest.java` under `src/test/java`:
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
@y
import static org.junit.jupiter.api.Assertions.assertEquals;
@z

@x
import java.util.List;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.testcontainers.postgresql.PostgreSQLContainer;
@y
import java.util.List;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.testcontainers.postgresql.PostgreSQLContainer;
@z

@x
class CustomerServiceTest {
@y
class CustomerServiceTest {
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
  static void beforeAll() {
    postgres.start();
  }
@y
  @BeforeAll
  static void beforeAll() {
    postgres.start();
  }
@z

@x
  @AfterAll
  static void afterAll() {
    postgres.stop();
  }
@y
  @AfterAll
  static void afterAll() {
    postgres.stop();
  }
@z

@x
  @BeforeEach
  void setUp() {
    DBConnectionProvider connectionProvider = new DBConnectionProvider(
      postgres.getJdbcUrl(),
      postgres.getUsername(),
      postgres.getPassword()
    );
    customerService = new CustomerService(connectionProvider);
  }
@y
  @BeforeEach
  void setUp() {
    DBConnectionProvider connectionProvider = new DBConnectionProvider(
      postgres.getJdbcUrl(),
      postgres.getUsername(),
      postgres.getPassword()
    );
    customerService = new CustomerService(connectionProvider);
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
Here's what the test does:
@y
Here's what the test does:
@z

@x
- Declares a `PostgreSQLContainer` with the `postgres:16-alpine` Docker image.
- The `@BeforeAll` callback starts the Postgres container before any test
  methods run.
- The `@BeforeEach` callback creates a `DBConnectionProvider` using the JDBC
  connection parameters from the container, then creates a `CustomerService`.
  The `CustomerService` constructor creates the `customers` table if it
  doesn't exist.
- `shouldGetCustomers()` inserts 2 customer records, fetches all customers,
  and asserts the count.
- The `@AfterAll` callback stops the container after all test methods finish.
@y
- Declares a `PostgreSQLContainer` with the `postgres:16-alpine` Docker image.
- The `@BeforeAll` callback starts the Postgres container before any test
  methods run.
- The `@BeforeEach` callback creates a `DBConnectionProvider` using the JDBC
  connection parameters from the container, then creates a `CustomerService`.
  The `CustomerService` constructor creates the `customers` table if it
  doesn't exist.
- `shouldGetCustomers()` inserts 2 customer records, fetches all customers,
  and asserts the count.
- The `@AfterAll` callback stops the container after all test methods finish.
@z
