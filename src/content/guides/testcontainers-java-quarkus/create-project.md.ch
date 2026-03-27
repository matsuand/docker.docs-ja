%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Create the Quarkus project
linkTitle: Create the project
description: Set up a Quarkus project with Hibernate ORM with Panache, PostgreSQL, Flyway, and REST API endpoints.
@y
title: Create the Quarkus project
linkTitle: Create the project
description: Set up a Quarkus project with Hibernate ORM with Panache, PostgreSQL, Flyway, and REST API endpoints.
@z

@x
## Set up the project
@y
## Set up the project
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
## Create the JPA entity
@y
## Create the JPA entity
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
## Create the CustomerService CDI bean
@y
## Create the CustomerService CDI bean
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
## Add the Flyway database migration script
@y
## Add the Flyway database migration script
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
## Create the REST API endpoints
@y
## Create the REST API endpoints
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
