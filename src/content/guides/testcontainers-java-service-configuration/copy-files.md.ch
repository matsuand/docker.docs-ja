%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Copy files into containers
linkTitle: Copy files
description: Initialize containers by copying files into specific locations.
@y
title: Copy files into containers
linkTitle: Copy files
description: Initialize containers by copying files into specific locations.
@z

@x
Sometimes you need to initialize a container by placing files in a specific
location. For example, PostgreSQL runs SQL scripts from
`/docker-entrypoint-initdb.d/` when the container starts.
@y
Sometimes you need to initialize a container by placing files in a specific
location. For example, PostgreSQL runs SQL scripts from
`/docker-entrypoint-initdb.d/` when the container starts.
@z

@x
## Create the initialization script
@y
## Create the initialization script
@z

@x
Create `src/test/resources/init-db.sql`:
@y
Create `src/test/resources/init-db.sql`:
@z

@x
```sql
create table customers (
     id bigint not null,
     name varchar not null,
     primary key (id)
);
```
@y
```sql
create table customers (
     id bigint not null,
     name varchar not null,
     primary key (id)
);
```
@z

@x
## Copy the file into the container
@y
## Copy the file into the container
@z

@x
Use `withCopyFileToContainer()` to copy the SQL script into the container's
init directory:
@y
Use `withCopyFileToContainer()` to copy the SQL script into the container's
init directory:
@z

@x
```java
package com.testcontainers.demo;
@y
```java
package com.testcontainers.demo;
@z

@x
import static org.junit.jupiter.api.Assertions.assertFalse;
@y
import static org.junit.jupiter.api.Assertions.assertFalse;
@z

@x
import java.util.List;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.testcontainers.postgresql.PostgreSQLContainer;
import org.testcontainers.junit.jupiter.Container;
import org.testcontainers.junit.jupiter.Testcontainers;
import org.testcontainers.utility.MountableFile;
@y
import java.util.List;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.testcontainers.postgresql.PostgreSQLContainer;
import org.testcontainers.junit.jupiter.Container;
import org.testcontainers.junit.jupiter.Testcontainers;
import org.testcontainers.utility.MountableFile;
@z

@x
@Testcontainers
class CustomerServiceTest {
@y
@Testcontainers
class CustomerServiceTest {
@z

@x
  @Container
  static PostgreSQLContainer postgres = new PostgreSQLContainer(
    "postgres:16-alpine"
  )
    .withCopyFileToContainer(
      MountableFile.forClasspathResource("init-db.sql"),
      "/docker-entrypoint-initdb.d/"
    );
@y
  @Container
  static PostgreSQLContainer postgres = new PostgreSQLContainer(
    "postgres:16-alpine"
  )
    .withCopyFileToContainer(
      MountableFile.forClasspathResource("init-db.sql"),
      "/docker-entrypoint-initdb.d/"
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
    assertFalse(customers.isEmpty());
  }
}
```
@y
    List<Customer> customers = customerService.getAllCustomers();
    assertFalse(customers.isEmpty());
  }
}
```
@z

@x
The `withCopyFileToContainer(MountableFile, String)` method copies `init-db.sql`
from the classpath into `/docker-entrypoint-initdb.d/` inside the container.
PostgreSQL executes scripts in that directory automatically at startup.
@y
The `withCopyFileToContainer(MountableFile, String)` method copies `init-db.sql`
from the classpath into `/docker-entrypoint-initdb.d/` inside the container.
PostgreSQL executes scripts in that directory automatically at startup.
@z

@x
You can also copy files from any path on the host:
@y
You can also copy files from any path on the host:
@z

@x
```java
.withCopyFileToContainer(
    MountableFile.forHostPath("/host/path/to/init-db.sql"),
    "/docker-entrypoint-initdb.d/"
);
```
@y
```java
.withCopyFileToContainer(
    MountableFile.forHostPath("/host/path/to/init-db.sql"),
    "/docker-entrypoint-initdb.d/"
);
```
@z
