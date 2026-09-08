%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Testing a Spring Boot REST API with Testcontainers
linkTitle: Spring Boot REST API
description: Learn how to test a Spring Boot REST API using Testcontainers with PostgreSQL and REST Assured.
keywords: testcontainers, java, spring boot, testing, postgresql, rest api, rest assured, jpa
summary: |
  Learn how to create a Spring Boot REST API with Spring Data JPA and PostgreSQL,
  then test it using Testcontainers and REST Assured.
@y
title: Testing a Spring Boot REST API with Testcontainers
linkTitle: Spring Boot REST API
description: Learn how to test a Spring Boot REST API using Testcontainers with PostgreSQL and REST Assured.
keywords: testcontainers, java, spring boot, testing, postgresql, rest api, rest assured, jpa
summary: |
  Learn how to create a Spring Boot REST API with Spring Data JPA and PostgreSQL,
  then test it using Testcontainers and REST Assured.
@z

@x
  time: 25 minutes
@y
  time: 25 分
@z

@x
<!-- Source: https://github.com/testcontainers/tc-guide-testing-spring-boot-rest-api -->
@y
<!-- Source: https://github.com/testcontainers/tc-guide-testing-spring-boot-rest-api -->
@z

@x
In this guide, you will learn how to:
@y
In this guide, you will learn how to:
@z

@x
- Create a Spring Boot application with a REST API endpoint
- Use Spring Data JPA with PostgreSQL to store and retrieve data
- Test the REST API using Testcontainers and REST Assured
@y
- Create a Spring Boot application with a REST API endpoint
- Use Spring Data JPA with PostgreSQL to store and retrieve data
- Test the REST API using Testcontainers and REST Assured
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
by selecting the **Spring Web**, **Spring Data JPA**, **PostgreSQL Driver**, and
**Testcontainers** starters.
@y
Create a Spring Boot project from [Spring Initializr](https://start.spring.io)
by selecting the **Spring Web**, **Spring Data JPA**, **PostgreSQL Driver**, and
**Testcontainers** starters.
@z

@x
Alternatively, clone the
[guide repository](https://github.com/testcontainers/tc-guide-testing-spring-boot-rest-api).
@y
Alternatively, clone the
[guide repository](https://github.com/testcontainers/tc-guide-testing-spring-boot-rest-api).
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
</properties>
<dependencies>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-data-jpa</artifactId>
    </dependency>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-web</artifactId>
    </dependency>
    <dependency>
        <groupId>org.postgresql</groupId>
        <artifactId>postgresql</artifactId>
        <scope>runtime</scope>
    </dependency>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-test</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.testcontainers</groupId>
        <artifactId>testcontainers-junit-jupiter</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.testcontainers</groupId>
        <artifactId>testcontainers-postgresql</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>io.rest-assured</groupId>
        <artifactId>rest-assured</artifactId>
        <scope>test</scope>
    </dependency>
</dependencies>
```
@y
```xml
<properties>
    <java.version>17</java.version>
    <testcontainers.version>2.0.4</testcontainers.version>
</properties>
<dependencies>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-data-jpa</artifactId>
    </dependency>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-web</artifactId>
    </dependency>
    <dependency>
        <groupId>org.postgresql</groupId>
        <artifactId>postgresql</artifactId>
        <scope>runtime</scope>
    </dependency>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-test</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.testcontainers</groupId>
        <artifactId>testcontainers-junit-jupiter</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.testcontainers</groupId>
        <artifactId>testcontainers-postgresql</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>io.rest-assured</groupId>
        <artifactId>rest-assured</artifactId>
        <scope>test</scope>
    </dependency>
</dependencies>
```
@z

@x
Using the Testcontainers BOM (Bill of Materials) is recommended so that you
don't have to repeat the version for every Testcontainers module dependency.
@y
Using the Testcontainers BOM (Bill of Materials) is recommended so that you
don't have to repeat the version for every Testcontainers module dependency.
@z

@x
### Create the JPA entity
@y
### Create the JPA entity
@z

@x
Create `Customer.java`:
@y
Create `Customer.java`:
@z

@x
```java
package com.testcontainers.demo;
@y
```java
package com.testcontainers.demo;
@z

@x
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
@y
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
@z

@x
@Entity
@Table(name = "customers")
class Customer {
@y
@Entity
@Table(name = "customers")
class Customer {
@z

@x
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;
@y
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;
@z

@x
  @Column(nullable = false)
  private String name;
@y
  @Column(nullable = false)
  private String name;
@z

@x
  @Column(nullable = false, unique = true)
  private String email;
@y
  @Column(nullable = false, unique = true)
  private String email;
@z

@x
  public Customer() {}
@y
  public Customer() {}
@z

@x
  public Customer(Long id, String name, String email) {
    this.id = id;
    this.name = name;
    this.email = email;
  }
@y
  public Customer(Long id, String name, String email) {
    this.id = id;
    this.name = name;
    this.email = email;
  }
@z

@x
  public Long getId() {
    return id;
  }
@y
  public Long getId() {
    return id;
  }
@z

@x
  public void setId(Long id) {
    this.id = id;
  }
@y
  public void setId(Long id) {
    this.id = id;
  }
@z

@x
  public String getName() {
    return name;
  }
@y
  public String getName() {
    return name;
  }
@z

@x
  public void setName(String name) {
    this.name = name;
  }
@y
  public void setName(String name) {
    this.name = name;
  }
@z

@x
  public String getEmail() {
    return email;
  }
@y
  public String getEmail() {
    return email;
  }
@z

@x
  public void setEmail(String email) {
    this.email = email;
  }
}
```
@y
  public void setEmail(String email) {
    this.email = email;
  }
}
```
@z

@x
### Create the Spring Data JPA repository
@y
### Create the Spring Data JPA repository
@z

@x
```java
package com.testcontainers.demo;
@y
```java
package com.testcontainers.demo;
@z

@x
import org.springframework.data.jpa.repository.JpaRepository;
@y
import org.springframework.data.jpa.repository.JpaRepository;
@z

@x
interface CustomerRepository extends JpaRepository<Customer, Long> {}
```
@y
interface CustomerRepository extends JpaRepository<Customer, Long> {}
```
@z

@x
### Add the schema creation script
@y
### Add the schema creation script
@z

@x
Create `src/main/resources/schema.sql`:
@y
Create `src/main/resources/schema.sql`:
@z

@x
```sql
create table if not exists customers (
    id bigserial not null,
    name varchar not null,
    email varchar not null,
    primary key (id),
    UNIQUE (email)
);
```
@y
```sql
create table if not exists customers (
    id bigserial not null,
    name varchar not null,
    email varchar not null,
    primary key (id),
    UNIQUE (email)
);
```
@z

@x
Enable schema initialization in `src/main/resources/application.properties`:
@y
Enable schema initialization in `src/main/resources/application.properties`:
@z

@x
```properties
spring.sql.init.mode=always
```
@y
```properties
spring.sql.init.mode=always
```
@z

@x
### Create the REST API endpoint
@y
### Create the REST API endpoint
@z

@x
Create `CustomerController.java`:
@y
Create `CustomerController.java`:
@z

@x
```java
package com.testcontainers.demo;
@y
```java
package com.testcontainers.demo;
@z

@x
import java.util.List;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
@y
import java.util.List;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
@z

@x
@RestController
class CustomerController {
@y
@RestController
class CustomerController {
@z

@x
  private final CustomerRepository repo;
@y
  private final CustomerRepository repo;
@z

@x
  CustomerController(CustomerRepository repo) {
    this.repo = repo;
  }
@y
  CustomerController(CustomerRepository repo) {
    this.repo = repo;
  }
@z

@x
  @GetMapping("/api/customers")
  List<Customer> getAll() {
    return repo.findAll();
  }
}
```
@y
  @GetMapping("/api/customers")
  List<Customer> getAll() {
    return repo.findAll();
  }
}
```
@z

@x
## Write tests with Testcontainers
@y
## Write tests with Testcontainers
@z

@x
To test the REST API, you need a running Postgres database and a started
Spring context. Testcontainers spins up Postgres in a Docker container and
`@DynamicPropertySource` connects it to Spring.
@y
To test the REST API, you need a running Postgres database and a started
Spring context. Testcontainers spins up Postgres in a Docker container and
`@DynamicPropertySource` connects it to Spring.
@z

@x
### Write the test
@y
### Write the test
@z

@x
Create `CustomerControllerTest.java`:
@y
Create `CustomerControllerTest.java`:
@z

@x
```java
package com.testcontainers.demo;
@y
```java
package com.testcontainers.demo;
@z

@x
import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.hasSize;
@y
import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.hasSize;
@z

@x
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import java.util.List;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;
import org.testcontainers.postgresql.PostgreSQLContainer;
@y
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import java.util.List;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;
import org.testcontainers.postgresql.PostgreSQLContainer;
@z

@x
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
class CustomerControllerTest {
@y
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
class CustomerControllerTest {
@z

@x
  @LocalServerPort
  private Integer port;
@y
  @LocalServerPort
  private Integer port;
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
  @DynamicPropertySource
  static void configureProperties(DynamicPropertyRegistry registry) {
    registry.add("spring.datasource.url", postgres::getJdbcUrl);
    registry.add("spring.datasource.username", postgres::getUsername);
    registry.add("spring.datasource.password", postgres::getPassword);
  }
@y
  @DynamicPropertySource
  static void configureProperties(DynamicPropertyRegistry registry) {
    registry.add("spring.datasource.url", postgres::getJdbcUrl);
    registry.add("spring.datasource.username", postgres::getUsername);
    registry.add("spring.datasource.password", postgres::getPassword);
  }
@z

@x
  @Autowired
  CustomerRepository customerRepository;
@y
  @Autowired
  CustomerRepository customerRepository;
@z

@x
  @BeforeEach
  void setUp() {
    RestAssured.baseURI = "http://localhost:" + port;
    customerRepository.deleteAll();
  }
@y
  @BeforeEach
  void setUp() {
    RestAssured.baseURI = "http://localhost:" + port;
    customerRepository.deleteAll();
  }
@z

@x
  @Test
  void shouldGetAllCustomers() {
    List<Customer> customers = List.of(
      new Customer(null, "John", "john@mail.com"),
      new Customer(null, "Dennis", "dennis@mail.com")
    );
    customerRepository.saveAll(customers);
@y
  @Test
  void shouldGetAllCustomers() {
    List<Customer> customers = List.of(
      new Customer(null, "John", "john@mail.com"),
      new Customer(null, "Dennis", "dennis@mail.com")
    );
    customerRepository.saveAll(customers);
@z

@x
    given()
      .contentType(ContentType.JSON)
      .when()
      .get("/api/customers")
      .then()
      .statusCode(200)
      .body(".", hasSize(2));
  }
}
```
@y
    given()
      .contentType(ContentType.JSON)
      .when()
      .get("/api/customers")
      .then()
      .statusCode(200)
      .body(".", hasSize(2));
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
- `@SpringBootTest` starts the full application on a random port.
- A `PostgreSQLContainer` starts in `@BeforeAll` and stops in `@AfterAll`.
- `@DynamicPropertySource` registers the container's JDBC URL, username, and
  password with Spring so that the datasource connects to the test container.
- `@BeforeEach` deletes all customer rows before each test to prevent test
  pollution.
- `shouldGetAllCustomers()` inserts two customers, calls `GET /api/customers`,
  and verifies the response contains 2 records.
@y
- `@SpringBootTest` starts the full application on a random port.
- A `PostgreSQLContainer` starts in `@BeforeAll` and stops in `@AfterAll`.
- `@DynamicPropertySource` registers the container's JDBC URL, username, and
  password with Spring so that the datasource connects to the test container.
- `@BeforeEach` deletes all customer rows before each test to prevent test
  pollution.
- `shouldGetAllCustomers()` inserts two customers, calls `GET /api/customers`,
  and verifies the response contains 2 records.
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
You should see the Postgres Docker container start and all tests pass. After
the tests finish, the container stops and is removed automatically.
@y
You should see the Postgres Docker container start and all tests pass. After
the tests finish, the container stops and is removed automatically.
@z

@x
### Summary
@y
### Summary
@z

@x
The Testcontainers library helps you write integration tests by using the same
type of database (Postgres) that you use in production, instead of mocks or
in-memory databases. Because you test against real services, you're free to
refactor code and still verify that the application works as expected.
@y
The Testcontainers library helps you write integration tests by using the same
type of database (Postgres) that you use in production, instead of mocks or
in-memory databases. Because you test against real services, you're free to
refactor code and still verify that the application works as expected.
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
- [Testcontainers JUnit 5 quickstart](https://java.testcontainers.org/quickstart/junit_5_quickstart/)
- [Testcontainers Postgres module](https://java.testcontainers.org/modules/databases/postgres/)
- [Testcontainers JDBC support](https://java.testcontainers.org/modules/databases/jdbc/)
@y
- [Testcontainers JUnit 5 quickstart](https://java.testcontainers.org/quickstart/junit_5_quickstart/)
- [Testcontainers Postgres module](https://java.testcontainers.org/modules/databases/postgres/)
- [Testcontainers JDBC support](https://java.testcontainers.org/modules/databases/jdbc/)
@z
