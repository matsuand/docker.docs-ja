%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Getting started with Testcontainers for Java
linkTitle: Testcontainers for Java
description: Learn how to use Testcontainers for Java to test a customer service with a real PostgreSQL database.
keywords: testcontainers, java, testing, postgresql, integration testing, junit, maven
summary: |
  Learn how to create a Java application and test database interactions
  using Testcontainers for Java with a real PostgreSQL instance.
@y
title: Getting started with Testcontainers for Java
linkTitle: Testcontainers for Java
description: Learn how to use Testcontainers for Java to test a customer service with a real PostgreSQL database.
keywords: testcontainers, java, testing, postgresql, integration testing, junit, maven
summary: |
  Learn how to create a Java application and test database interactions
  using Testcontainers for Java with a real PostgreSQL instance.
@z

@x
  time: 20 minutes
@y
  time: 20 分
@z

@x
<!-- Source: https://github.com/testcontainers/tc-guide-getting-started-with-testcontainers-for-java -->
@y
<!-- Source: https://github.com/testcontainers/tc-guide-getting-started-with-testcontainers-for-java -->
@z

@x
In this guide, you will learn how to:
@y
In this guide, you will learn how to:
@z

@x
- Create a Java project with Maven
- Implement a `CustomerService` that manages customer records in PostgreSQL
- Write integration tests using Testcontainers with a real Postgres database
- Run the tests and verify everything works
@y
- Create a Java project with Maven
- Implement a `CustomerService` that manages customer records in PostgreSQL
- Write integration tests using Testcontainers with a real Postgres database
- Run the tests and verify everything works
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
## Create the Java project
@y
## Create the Java project
@z

@x
### Set up the Maven project
@y
### Set up the Maven project
@z

@x
Create a Java project with Maven from your preferred IDE. This guide uses
Maven, but you can use Gradle if you prefer. Add the following dependencies
to `pom.xml`:
@y
Create a Java project with Maven from your preferred IDE. This guide uses
Maven, but you can use Gradle if you prefer. Add the following dependencies
to `pom.xml`:
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
</dependencies>
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
</dependencies>
@z

@x
<build>
    <plugins>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-surefire-plugin</artifactId>
            <version>3.2.5</version>
        </plugin>
    </plugins>
</build>
```
@y
<build>
    <plugins>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-surefire-plugin</artifactId>
            <version>3.2.5</version>
        </plugin>
    </plugins>
</build>
```
@z

@x
This adds the Postgres JDBC driver, logback for logging, JUnit 5 for testing,
and the latest `maven-surefire-plugin` for JUnit 5 support.
@y
This adds the Postgres JDBC driver, logback for logging, JUnit 5 for testing,
and the latest `maven-surefire-plugin` for JUnit 5 support.
@z

@x
### Implement the business logic
@y
### Implement the business logic
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
Create a `DBConnectionProvider` class to hold JDBC connection parameters and
provide a database `Connection`:
@y
Create a `DBConnectionProvider` class to hold JDBC connection parameters and
provide a database `Connection`:
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
@y
import java.sql.Connection;
import java.sql.DriverManager;
@z

@x
class DBConnectionProvider {
@y
class DBConnectionProvider {
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
  public DBConnectionProvider(String url, String username, String password) {
    this.url = url;
    this.username = username;
    this.password = password;
  }
@y
  public DBConnectionProvider(String url, String username, String password) {
    this.url = url;
    this.username = username;
    this.password = password;
  }
@z

@x
  Connection getConnection() {
    try {
      return DriverManager.getConnection(url, username, password);
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
  }
}
```
@y
  Connection getConnection() {
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
Create the `CustomerService` class:
@y
Create the `CustomerService` class:
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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
@y
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
@z

@x
public class CustomerService {
@y
public class CustomerService {
@z

@x
  private final DBConnectionProvider connectionProvider;
@y
  private final DBConnectionProvider connectionProvider;
@z

@x
  public CustomerService(DBConnectionProvider connectionProvider) {
    this.connectionProvider = connectionProvider;
    createCustomersTableIfNotExists();
  }
@y
  public CustomerService(DBConnectionProvider connectionProvider) {
    this.connectionProvider = connectionProvider;
    createCustomersTableIfNotExists();
  }
@z

@x
  public void createCustomer(Customer customer) {
    try (Connection conn = this.connectionProvider.getConnection()) {
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
    try (Connection conn = this.connectionProvider.getConnection()) {
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
@y
  public List<Customer> getAllCustomers() {
    List<Customer> customers = new ArrayList<>();
@z

@x
    try (Connection conn = this.connectionProvider.getConnection()) {
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
    try (Connection conn = this.connectionProvider.getConnection()) {
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
  private void createCustomersTableIfNotExists() {
    try (Connection conn = this.connectionProvider.getConnection()) {
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
}
```
@y
  private void createCustomersTableIfNotExists() {
    try (Connection conn = this.connectionProvider.getConnection()) {
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
}
```
@z

@x
Here's what `CustomerService` does:
@y
Here's what `CustomerService` does:
@z

@x
- The constructor calls `createCustomersTableIfNotExists()` to ensure the table exists.
- `createCustomer()` inserts a customer record into the database.
- `getAllCustomers()` fetches all rows from the `customers` table and returns a list of `Customer` objects.
@y
- The constructor calls `createCustomersTableIfNotExists()` to ensure the table exists.
- `createCustomer()` inserts a customer record into the database.
- `getAllCustomers()` fetches all rows from the `customers` table and returns a list of `Customer` objects.
@z

@x
## Write tests with Testcontainers
@y
## Write tests with Testcontainers
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
### Add Testcontainers dependencies
@y
### Add Testcontainers dependencies
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
### Write the test
@y
### Write the test
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
Run the tests using Maven:
@y
Run the tests using Maven:
@z

@x
```console
$ mvn test
```
@y
```console
$ mvn test
```
@z

@x
You can see in the logs that Testcontainers pulls the Postgres Docker image
from Docker Hub (if not already available locally), starts the container, and
runs the test.
@y
You can see in the logs that Testcontainers pulls the Postgres Docker image
from Docker Hub (if not already available locally), starts the container, and
runs the test.
@z

@x
Writing an integration test using Testcontainers works like writing a unit test
that you can run from your IDE. Your teammates can clone the project
and run tests without installing Postgres on their machines.
@y
Writing an integration test using Testcontainers works like writing a unit test
that you can run from your IDE. Your teammates can clone the project
and run tests without installing Postgres on their machines.
@z

@x
### Summary
@y
### Summary
@z

@x
The Testcontainers for Java library helps you write integration tests using the
same type of database (Postgres) that you use in production, instead of mocks.
Because you aren't using mocks and instead talk to real services, you're free
to refactor code and still verify that the application works as expected.
@y
The Testcontainers for Java library helps you write integration tests using the
same type of database (Postgres) that you use in production, instead of mocks.
Because you aren't using mocks and instead talk to real services, you're free
to refactor code and still verify that the application works as expected.
@z

@x
In addition to Postgres, Testcontainers provides dedicated modules for many
SQL databases, NoSQL databases, messaging queues, and more. You can use
Testcontainers to run any containerized dependency for your tests.
@y
In addition to Postgres, Testcontainers provides dedicated modules for many
SQL databases, NoSQL databases, messaging queues, and more. You can use
Testcontainers to run any containerized dependency for your tests.
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
- [Testcontainers container lifecycle management using JUnit 5](https://testcontainers.com/guides/testcontainers-container-lifecycle/)
- [Replace H2 with a real database for testing](https://testcontainers.com/guides/replace-h2-with-real-database-for-testing/)
- [Getting started with Testcontainers in a Java Spring Boot project](https://testcontainers.com/guides/testing-spring-boot-rest-api-using-testcontainers/)
@y
- [Testcontainers container lifecycle management using JUnit 5](https://testcontainers.com/guides/testcontainers-container-lifecycle/)
- [Replace H2 with a real database for testing](https://testcontainers.com/guides/replace-h2-with-real-database-for-testing/)
- [Getting started with Testcontainers in a Java Spring Boot project](https://testcontainers.com/guides/testing-spring-boot-rest-api-using-testcontainers/)
@z
