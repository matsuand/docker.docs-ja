%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Write tests with Testcontainers
linkTitle: Write tests
description: Test the Spring Boot REST API using Testcontainers and REST Assured.
@y
title: Write tests with Testcontainers
linkTitle: Write tests
description: Test the Spring Boot REST API using Testcontainers and REST Assured.
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
## Write the test
@y
## Write the test
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
