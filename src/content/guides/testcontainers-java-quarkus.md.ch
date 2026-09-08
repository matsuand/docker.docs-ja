%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Testing Quarkus applications with Testcontainers
linkTitle: Quarkus
description: Learn how to test a Quarkus REST API using Testcontainers with PostgreSQL, Hibernate ORM with Panache, and REST Assured.
keywords: testcontainers, java, quarkus, testing, postgresql, rest api, rest assured, panache, dev services
summary: |
  Learn how to create a Quarkus REST API with Hibernate ORM with Panache and PostgreSQL,
  then test it using Quarkus Dev Services, Testcontainers, and REST Assured.
@y
title: Testing Quarkus applications with Testcontainers
linkTitle: Quarkus
description: Learn how to test a Quarkus REST API using Testcontainers with PostgreSQL, Hibernate ORM with Panache, and REST Assured.
keywords: testcontainers, java, quarkus, testing, postgresql, rest api, rest assured, panache, dev services
summary: |
  Learn how to create a Quarkus REST API with Hibernate ORM with Panache and PostgreSQL,
  then test it using Quarkus Dev Services, Testcontainers, and REST Assured.
@z

@x
  time: 25 minutes
@y
  time: 25 分
@z

@x
<!-- Source: https://github.com/testcontainers/tc-guide-testcontainers-in-quarkus-applications -->
@y
<!-- Source: https://github.com/testcontainers/tc-guide-testcontainers-in-quarkus-applications -->
@z

@x
In this guide, you'll learn how to:
@y
In this guide, you'll learn how to:
@z

@x
- Create a Quarkus application with REST API endpoints
- Use Hibernate ORM with Panache and PostgreSQL for persistence
- Test the REST API using Quarkus Dev Services, which uses Testcontainers behind
  the scenes
- Test with services not supported by Dev Services using
  `QuarkusTestResourceLifecycleManager`
@y
- Create a Quarkus application with REST API endpoints
- Use Hibernate ORM with Panache and PostgreSQL for persistence
- Test the REST API using Quarkus Dev Services, which uses Testcontainers behind
  the scenes
- Test with services not supported by Dev Services using
  `QuarkusTestResourceLifecycleManager`
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
## Create the Quarkus project
@y
## Create the Quarkus project
@z

@x
### Set up the project
@y
### Set up the project
@z

@x
Create a Quarkus project from [code.quarkus.io](https://code.quarkus.io/) by
selecting the **RESTEasy Classic**, **RESTEasy Classic Jackson**,
**Hibernate Validator**, **Hibernate ORM with Panache**, **JDBC Driver -
PostgreSQL**, and **Flyway** extensions.
@y
Create a Quarkus project from [code.quarkus.io](https://code.quarkus.io/) by
selecting the **RESTEasy Classic**, **RESTEasy Classic Jackson**,
**Hibernate Validator**, **Hibernate ORM with Panache**, **JDBC Driver -
PostgreSQL**, and **Flyway** extensions.
@z

@x
Alternatively, clone the
[guide repository](https://github.com/testcontainers/tc-guide-testcontainers-in-quarkus-applications).
@y
Alternatively, clone the
[guide repository](https://github.com/testcontainers/tc-guide-testcontainers-in-quarkus-applications).
@z

@x
The key dependencies in `pom.xml` are:
@y
The key dependencies in `pom.xml` are:
@z

@x
```xml
<properties>
    <quarkus.platform.version>3.22.3</quarkus.platform.version>
</properties>
<dependencies>
    <dependency>
        <groupId>io.quarkus</groupId>
        <artifactId>quarkus-hibernate-orm-panache</artifactId>
    </dependency>
    <dependency>
        <groupId>io.quarkus</groupId>
        <artifactId>quarkus-flyway</artifactId>
    </dependency>
    <dependency>
        <groupId>io.quarkus</groupId>
        <artifactId>quarkus-hibernate-validator</artifactId>
    </dependency>
    <dependency>
        <groupId>io.quarkus</groupId>
        <artifactId>quarkus-resteasy</artifactId>
    </dependency>
    <dependency>
        <groupId>io.quarkus</groupId>
        <artifactId>quarkus-resteasy-jackson</artifactId>
    </dependency>
    <dependency>
        <groupId>io.quarkus</groupId>
        <artifactId>quarkus-jdbc-postgresql</artifactId>
    </dependency>
    <dependency>
        <groupId>io.quarkus</groupId>
        <artifactId>quarkus-junit5</artifactId>
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
    <quarkus.platform.version>3.22.3</quarkus.platform.version>
</properties>
<dependencies>
    <dependency>
        <groupId>io.quarkus</groupId>
        <artifactId>quarkus-hibernate-orm-panache</artifactId>
    </dependency>
    <dependency>
        <groupId>io.quarkus</groupId>
        <artifactId>quarkus-flyway</artifactId>
    </dependency>
    <dependency>
        <groupId>io.quarkus</groupId>
        <artifactId>quarkus-hibernate-validator</artifactId>
    </dependency>
    <dependency>
        <groupId>io.quarkus</groupId>
        <artifactId>quarkus-resteasy</artifactId>
    </dependency>
    <dependency>
        <groupId>io.quarkus</groupId>
        <artifactId>quarkus-resteasy-jackson</artifactId>
    </dependency>
    <dependency>
        <groupId>io.quarkus</groupId>
        <artifactId>quarkus-jdbc-postgresql</artifactId>
    </dependency>
    <dependency>
        <groupId>io.quarkus</groupId>
        <artifactId>quarkus-junit5</artifactId>
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
### Create the JPA entity
@y
### Create the JPA entity
@z

@x
Hibernate ORM with Panache supports the Active Record pattern and the
Repository pattern to simplify JPA usage. This guide uses the Active Record
pattern.
@y
Hibernate ORM with Panache supports the Active Record pattern and the
Repository pattern to simplify JPA usage. This guide uses the Active Record
pattern.
@z

@x
Create `Customer.java` by extending `PanacheEntity`. This gives the entity
built-in persistence methods such as `persist()`, `listAll()`, and
`findById()`.
@y
Create `Customer.java` by extending `PanacheEntity`. This gives the entity
built-in persistence methods such as `persist()`, `listAll()`, and
`findById()`.
@z

@x
```java
package com.testcontainers.demo;
@y
```java
package com.testcontainers.demo;
@z

@x
import io.quarkus.hibernate.orm.panache.PanacheEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
@y
import io.quarkus.hibernate.orm.panache.PanacheEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
@z

@x
@Entity
@Table(name = "customers")
public class Customer extends PanacheEntity {
@y
@Entity
@Table(name = "customers")
public class Customer extends PanacheEntity {
@z

@x
    @Column(nullable = false)
    public String name;
@y
    @Column(nullable = false)
    public String name;
@z

@x
    @Column(nullable = false, unique = true)
    public String email;
@y
    @Column(nullable = false, unique = true)
    public String email;
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
}
```
@y
    public Customer(Long id, String name, String email) {
        this.id = id;
        this.name = name;
        this.email = email;
    }
}
```
@z

@x
### Create the CustomerService CDI bean
@y
### Create the CustomerService CDI bean
@z

@x
Create a `CustomerService` class annotated with `@ApplicationScoped` and
`@Transactional` to handle persistence operations:
@y
Create a `CustomerService` class annotated with `@ApplicationScoped` and
`@Transactional` to handle persistence operations:
@z

@x
```java
package com.testcontainers.demo;
@y
```java
package com.testcontainers.demo;
@z

@x
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.transaction.Transactional;
import java.util.List;
@y
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.transaction.Transactional;
import java.util.List;
@z

@x
@ApplicationScoped
@Transactional
public class CustomerService {
@y
@ApplicationScoped
@Transactional
public class CustomerService {
@z

@x
    public List<Customer> getAll() {
        return Customer.listAll();
    }
@y
    public List<Customer> getAll() {
        return Customer.listAll();
    }
@z

@x
    public Customer create(Customer customer) {
        customer.persist();
        return customer;
    }
}
```
@y
    public Customer create(Customer customer) {
        customer.persist();
        return customer;
    }
}
```
@z

@x
### Add the Flyway database migration script
@y
### Add the Flyway database migration script
@z

@x
Create `src/main/resources/db/migration/V1__init_database.sql`:
@y
Create `src/main/resources/db/migration/V1__init_database.sql`:
@z

@x
```sql
create sequence customers_seq start with 1 increment by 50;
@y
```sql
create sequence customers_seq start with 1 increment by 50;
@z

@x
create table customers
(
    id    bigint DEFAULT nextval('customers_seq') not null,
    name  varchar                                 not null,
    email varchar                                 not null,
    primary key (id)
);
@y
create table customers
(
    id    bigint DEFAULT nextval('customers_seq') not null,
    name  varchar                                 not null,
    email varchar                                 not null,
    primary key (id)
);
@z

@x
insert into customers(name, email)
values ('john', 'john@mail.com'),
       ('rambo', 'rambo@mail.com');
```
@y
insert into customers(name, email)
values ('john', 'john@mail.com'),
       ('rambo', 'rambo@mail.com');
```
@z

@x
Enable Flyway migrations in `src/main/resources/application.properties`:
@y
Enable Flyway migrations in `src/main/resources/application.properties`:
@z

@x
```properties
quarkus.flyway.migrate-at-start=true
```
@y
```properties
quarkus.flyway.migrate-at-start=true
```
@z

@x
### Create the REST API endpoints
@y
### Create the REST API endpoints
@z

@x
Create `CustomerResource.java` with endpoints for fetching all customers and
creating a customer:
@y
Create `CustomerResource.java` with endpoints for fetching all customers and
creating a customer:
@z

@x
```java
package com.testcontainers.demo;
@y
```java
package com.testcontainers.demo;
@z

@x
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import java.util.List;
@y
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import java.util.List;
@z

@x
@Path("/api/customers")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class CustomerResource {
    private final CustomerService customerService;
@y
@Path("/api/customers")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class CustomerResource {
    private final CustomerService customerService;
@z

@x
    public CustomerResource(CustomerService customerService) {
        this.customerService = customerService;
    }
@y
    public CustomerResource(CustomerService customerService) {
        this.customerService = customerService;
    }
@z

@x
    @GET
    public List<Customer> getAllCustomers() {
        return customerService.getAll();
    }
@y
    @GET
    public List<Customer> getAllCustomers() {
        return customerService.getAll();
    }
@z

@x
    @POST
    public Response createCustomer(Customer customer) {
        var savedCustomer = customerService.create(customer);
        return Response.status(Response.Status.CREATED).entity(savedCustomer).build();
    }
}
```
@y
    @POST
    public Response createCustomer(Customer customer) {
        var savedCustomer = customerService.create(customer);
        return Response.status(Response.Status.CREATED).entity(savedCustomer).build();
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
### Quarkus Dev Services
@y
### Quarkus Dev Services
@z

@x
Quarkus Dev Services automatically provisions unconfigured services in
development and test mode. When you include an extension and don't configure it,
Quarkus starts the relevant service using
[Testcontainers](https://www.testcontainers.org/) behind the scenes and wires
the application to use that service.
@y
Quarkus Dev Services automatically provisions unconfigured services in
development and test mode. When you include an extension and don't configure it,
Quarkus starts the relevant service using
[Testcontainers](https://www.testcontainers.org/) behind the scenes and wires
the application to use that service.
@z

@x
> [!NOTE]
> Dev Services requires a
> [supported Docker environment](https://www.testcontainers.org/supported_docker_environment/).
@y
> [!NOTE]
> Dev Services requires a
> [supported Docker environment](https://www.testcontainers.org/supported_docker_environment/).
@z

@x
Quarkus Dev Services supports most commonly used services like SQL databases,
Kafka, RabbitMQ, Redis, and MongoDB. For more information, see the
[Quarkus Dev Services guide](https://quarkus.io/guides/dev-services).
@y
Quarkus Dev Services supports most commonly used services like SQL databases,
Kafka, RabbitMQ, Redis, and MongoDB. For more information, see the
[Quarkus Dev Services guide](https://quarkus.io/guides/dev-services).
@z

@x
### Write tests for the API endpoints
@y
### Write tests for the API endpoints
@z

@x
Test the `GET /api/customers` and `POST /api/customers` endpoints using REST
Assured. The `io.rest-assured:rest-assured` library was already added as a test
dependency when you generated the project.
@y
Test the `GET /api/customers` and `POST /api/customers` endpoints using REST
Assured. The `io.rest-assured:rest-assured` library was already added as a test
dependency when you generated the project.
@z

@x
Create `CustomerResourceTest.java` and annotate it with `@QuarkusTest`. This
bootstraps the application along with the required services using Dev Services.
Because you haven't configured datasource properties, Dev Services automatically
starts a PostgreSQL database using Testcontainers.
@y
Create `CustomerResourceTest.java` and annotate it with `@QuarkusTest`. This
bootstraps the application along with the required services using Dev Services.
Because you haven't configured datasource properties, Dev Services automatically
starts a PostgreSQL database using Testcontainers.
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
import static org.hamcrest.CoreMatchers.is;
import static org.junit.jupiter.api.Assertions.assertFalse;
@y
import static io.restassured.RestAssured.given;
import static org.hamcrest.CoreMatchers.is;
import static org.junit.jupiter.api.Assertions.assertFalse;
@z

@x
import io.quarkus.test.junit.QuarkusTest;
import io.restassured.common.mapper.TypeRef;
import io.restassured.http.ContentType;
import java.util.List;
import org.junit.jupiter.api.Test;
@y
import io.quarkus.test.junit.QuarkusTest;
import io.restassured.common.mapper.TypeRef;
import io.restassured.http.ContentType;
import java.util.List;
import org.junit.jupiter.api.Test;
@z

@x
@QuarkusTest
class CustomerResourceTest {
@y
@QuarkusTest
class CustomerResourceTest {
@z

@x
    @Test
    void shouldGetAllCustomers() {
        List<Customer> customers = given().when()
                .get("/api/customers")
                .then()
                .statusCode(200)
                .extract()
                .as(new TypeRef<>() {});
        assertFalse(customers.isEmpty());
    }
@y
    @Test
    void shouldGetAllCustomers() {
        List<Customer> customers = given().when()
                .get("/api/customers")
                .then()
                .statusCode(200)
                .extract()
                .as(new TypeRef<>() {});
        assertFalse(customers.isEmpty());
    }
@z

@x
    @Test
    void shouldCreateCustomerSuccessfully() {
        Customer customer = new Customer(null, "John", "john@gmail.com");
        given().contentType(ContentType.JSON)
                .body(customer)
                .when()
                .post("/api/customers")
                .then()
                .statusCode(201)
                .body("name", is("John"))
                .body("email", is("john@gmail.com"));
    }
}
```
@y
    @Test
    void shouldCreateCustomerSuccessfully() {
        Customer customer = new Customer(null, "John", "john@gmail.com");
        given().contentType(ContentType.JSON)
                .body(customer)
                .when()
                .post("/api/customers")
                .then()
                .statusCode(201)
                .body("name", is("John"))
                .body("email", is("john@gmail.com"));
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
- `@QuarkusTest` starts the full Quarkus application with Dev Services enabled.
- Dev Services starts a PostgreSQL container using Testcontainers and configures
  the datasource automatically.
- `shouldGetAllCustomers()` calls `GET /api/customers` and verifies that seeded
  data from the Flyway migration is returned.
- `shouldCreateCustomerSuccessfully()` sends a `POST /api/customers` request and
  verifies the response contains the created customer data.
@y
- `@QuarkusTest` starts the full Quarkus application with Dev Services enabled.
- Dev Services starts a PostgreSQL container using Testcontainers and configures
  the datasource automatically.
- `shouldGetAllCustomers()` calls `GET /api/customers` and verifies that seeded
  data from the Flyway migration is returned.
- `shouldCreateCustomerSuccessfully()` sends a `POST /api/customers` request and
  verifies the response contains the created customer data.
@z

@x
### Customize test configuration
@y
### Customize test configuration
@z

@x
By default, the Quarkus test instance starts on port 8081 and uses a
`postgres:14` Docker image. Customize both by adding these properties to
`src/main/resources/application.properties`:
@y
By default, the Quarkus test instance starts on port 8081 and uses a
`postgres:14` Docker image. Customize both by adding these properties to
`src/main/resources/application.properties`:
@z

@x
```properties
quarkus.http.test-port=0
quarkus.datasource.devservices.image-name=postgres:15.2-alpine
```
@y
```properties
quarkus.http.test-port=0
quarkus.datasource.devservices.image-name=postgres:15.2-alpine
```
@z

@x
Setting `quarkus.http.test-port=0` starts the application on a random available
port, avoiding port conflicts. The `devservices.image-name` property lets you
pin the PostgreSQL image to a specific version that matches production.
@y
Setting `quarkus.http.test-port=0` starts the application on a random available
port, avoiding port conflicts. The `devservices.image-name` property lets you
pin the PostgreSQL image to a specific version that matches production.
@z

@x
### Test with services not supported by Dev Services
@y
### Test with services not supported by Dev Services
@z

@x
Your application might use a service that Dev Services doesn't support out of
the box. In that case, use `QuarkusTestResourceLifecycleManager` to start the
service before the Quarkus application starts for testing.
@y
Your application might use a service that Dev Services doesn't support out of
the box. In that case, use `QuarkusTestResourceLifecycleManager` to start the
service before the Quarkus application starts for testing.
@z

@x
For example, suppose the application uses CockroachDB. First, add the
CockroachDB Testcontainers module dependency:
@y
For example, suppose the application uses CockroachDB. First, add the
CockroachDB Testcontainers module dependency:
@z

@x
```xml
<dependency>
    <groupId>org.testcontainers</groupId>
    <artifactId>cockroachdb</artifactId>
    <scope>test</scope>
</dependency>
```
@y
```xml
<dependency>
    <groupId>org.testcontainers</groupId>
    <artifactId>cockroachdb</artifactId>
    <scope>test</scope>
</dependency>
```
@z

@x
Create a `CockroachDBTestResource` that implements
`QuarkusTestResourceLifecycleManager`:
@y
Create a `CockroachDBTestResource` that implements
`QuarkusTestResourceLifecycleManager`:
@z

@x
```java
package com.testcontainers.demo;
@y
```java
package com.testcontainers.demo;
@z

@x
import io.quarkus.test.common.QuarkusTestResourceLifecycleManager;
import java.util.HashMap;
import java.util.Map;
import org.testcontainers.containers.CockroachContainer;
@y
import io.quarkus.test.common.QuarkusTestResourceLifecycleManager;
import java.util.HashMap;
import java.util.Map;
import org.testcontainers.containers.CockroachContainer;
@z

@x
public class CockroachDBTestResource implements QuarkusTestResourceLifecycleManager {
@y
public class CockroachDBTestResource implements QuarkusTestResourceLifecycleManager {
@z

@x
    CockroachContainer cockroachdb;
@y
    CockroachContainer cockroachdb;
@z

@x
    @Override
    public Map<String, String> start() {
        cockroachdb = new CockroachContainer("cockroachdb/cockroach:v22.2.0");
        cockroachdb.start();
        Map<String, String> conf = new HashMap<>();
        conf.put("quarkus.datasource.jdbc.url", cockroachdb.getJdbcUrl());
        conf.put("quarkus.datasource.username", cockroachdb.getUsername());
        conf.put("quarkus.datasource.password", cockroachdb.getPassword());
        return conf;
    }
@y
    @Override
    public Map<String, String> start() {
        cockroachdb = new CockroachContainer("cockroachdb/cockroach:v22.2.0");
        cockroachdb.start();
        Map<String, String> conf = new HashMap<>();
        conf.put("quarkus.datasource.jdbc.url", cockroachdb.getJdbcUrl());
        conf.put("quarkus.datasource.username", cockroachdb.getUsername());
        conf.put("quarkus.datasource.password", cockroachdb.getPassword());
        return conf;
    }
@z

@x
    @Override
    public void stop() {
        cockroachdb.stop();
    }
}
```
@y
    @Override
    public void stop() {
        cockroachdb.stop();
    }
}
```
@z

@x
Use the `CockroachDBTestResource` with `@QuarkusTestResource` in a test class:
@y
Use the `CockroachDBTestResource` with `@QuarkusTestResource` in a test class:
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
import static org.junit.jupiter.api.Assertions.assertFalse;
@y
import static io.restassured.RestAssured.given;
import static org.junit.jupiter.api.Assertions.assertFalse;
@z

@x
import io.quarkus.test.common.QuarkusTestResource;
import io.quarkus.test.junit.QuarkusTest;
import io.restassured.common.mapper.TypeRef;
import java.util.List;
import org.junit.jupiter.api.Test;
@y
import io.quarkus.test.common.QuarkusTestResource;
import io.quarkus.test.junit.QuarkusTest;
import io.restassured.common.mapper.TypeRef;
import java.util.List;
import org.junit.jupiter.api.Test;
@z

@x
@QuarkusTest
@QuarkusTestResource(value = CockroachDBTestResource.class, restrictToAnnotatedClass = true)
class CockroachDBTest {
@y
@QuarkusTest
@QuarkusTestResource(value = CockroachDBTestResource.class, restrictToAnnotatedClass = true)
class CockroachDBTest {
@z

@x
    @Test
    void shouldGetAllCustomers() {
        List<Customer> customers = given().when()
                .get("/api/customers")
                .then()
                .statusCode(200)
                .extract()
                .as(new TypeRef<>() {});
        assertFalse(customers.isEmpty());
    }
}
```
@y
    @Test
    void shouldGetAllCustomers() {
        List<Customer> customers = given().when()
                .get("/api/customers")
                .then()
                .statusCode(200)
                .extract()
                .as(new TypeRef<>() {});
        assertFalse(customers.isEmpty());
    }
}
```
@z

@x
The `restrictToAnnotatedClass = true` attribute ensures the CockroachDB
container only starts when running this specific test class, rather than being
activated for all tests.
@y
The `restrictToAnnotatedClass = true` attribute ensures the CockroachDB
container only starts when running this specific test class, rather than being
activated for all tests.
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
You should see the PostgreSQL Docker container start and all tests pass. After
the tests finish, the container stops and is removed automatically.
@y
You should see the PostgreSQL Docker container start and all tests pass. After
the tests finish, the container stops and is removed automatically.
@z

@x
### Run the application locally
@y
### Run the application locally
@z

@x
Quarkus Dev Services automatically provisions unconfigured services in
development mode. Start the Quarkus application in dev mode:
@y
Quarkus Dev Services automatically provisions unconfigured services in
development mode. Start the Quarkus application in dev mode:
@z

@x
```console
$ ./mvnw compile quarkus:dev
```
@y
```console
$ ./mvnw compile quarkus:dev
```
@z

@x
Or with Gradle:
@y
Or with Gradle:
@z

@x
```console
$ ./gradlew quarkusDev
```
@y
```console
$ ./gradlew quarkusDev
```
@z

@x
Dev Services starts a PostgreSQL container automatically. If you're running a
PostgreSQL database on your system and want to use that instead, configure the
datasource properties in `src/main/resources/application.properties`:
@y
Dev Services starts a PostgreSQL container automatically. If you're running a
PostgreSQL database on your system and want to use that instead, configure the
datasource properties in `src/main/resources/application.properties`:
@z

@x
```properties
quarkus.datasource.jdbc.url=jdbc:postgresql://localhost:5432/postgres
quarkus.datasource.username=postgres
quarkus.datasource.password=postgres
```
@y
```properties
quarkus.datasource.jdbc.url=jdbc:postgresql://localhost:5432/postgres
quarkus.datasource.username=postgres
quarkus.datasource.password=postgres
```
@z

@x
When these properties are set explicitly, Dev Services doesn't provision the
database container and instead connects to the configured database.
@y
When these properties are set explicitly, Dev Services doesn't provision the
database container and instead connects to the configured database.
@z

@x
### Summary
@y
### Summary
@z

@x
Quarkus Dev Services improves the developer experience by automatically
provisioning the required services using Testcontainers during development and
testing. This guide covered:
@y
Quarkus Dev Services improves the developer experience by automatically
provisioning the required services using Testcontainers during development and
testing. This guide covered:
@z

@x
- Building a REST API using JAX-RS with Hibernate ORM with Panache
- Testing API endpoints using REST Assured with Dev Services handling database
  provisioning
- Using `QuarkusTestResourceLifecycleManager` for services not supported by Dev
  Services
- Running the application locally with Dev Services
@y
- Building a REST API using JAX-RS with Hibernate ORM with Panache
- Testing API endpoints using REST Assured with Dev Services handling database
  provisioning
- Using `QuarkusTestResourceLifecycleManager` for services not supported by Dev
  Services
- Running the application locally with Dev Services
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
- [Quarkus Dev Services overview](https://quarkus.io/guides/dev-services)
- [Quarkus testing guide](https://quarkus.io/guides/getting-started-testing)
- [Testcontainers Postgres module](https://java.testcontainers.org/modules/databases/postgres/)
@y
- [Quarkus Dev Services overview](https://quarkus.io/guides/dev-services)
- [Quarkus testing guide](https://quarkus.io/guides/getting-started-testing)
- [Testcontainers Postgres module](https://java.testcontainers.org/modules/databases/postgres/)
@z
