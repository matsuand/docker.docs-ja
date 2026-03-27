%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Create the Spring Boot project
linkTitle: Create the project
description: Set up a Spring Boot project with Spring Data JPA, PostgreSQL, and a REST API.
@y
title: Create the Spring Boot project
linkTitle: Create the project
description: Set up a Spring Boot project with Spring Data JPA, PostgreSQL, and a REST API.
@z

@x
## Set up the project
@y
## Set up the project
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
## Create the JPA entity
@y
## Create the JPA entity
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
## Create the Spring Data JPA repository
@y
## Create the Spring Data JPA repository
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
## Add the schema creation script
@y
## Add the schema creation script
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
## Create the REST API endpoint
@y
## Create the REST API endpoint
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
