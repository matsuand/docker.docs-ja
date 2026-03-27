%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Replace H2 with the Testcontainers JDBC URL
linkTitle: JDBC URL approach
description: Use the Testcontainers special JDBC URL to swap H2 for a real PostgreSQL database.
@y
title: Replace H2 with the Testcontainers JDBC URL
linkTitle: JDBC URL approach
description: Use the Testcontainers special JDBC URL to swap H2 for a real PostgreSQL database.
@z

@x
Replacing H2 with a real PostgreSQL database requires two test properties:
@y
Replacing H2 with a real PostgreSQL database requires two test properties:
@z

@x
```java
@DataJpaTest
@TestPropertySource(properties = {
  "spring.test.database.replace=none",
  "spring.datasource.url=jdbc:tc:postgresql:16-alpine:///db"
})
class ProductRepositoryWithJdbcUrlTest {
@y
```java
@DataJpaTest
@TestPropertySource(properties = {
  "spring.test.database.replace=none",
  "spring.datasource.url=jdbc:tc:postgresql:16-alpine:///db"
})
class ProductRepositoryWithJdbcUrlTest {
@z

@x
  @Autowired
  ProductRepository productRepository;
@y
  @Autowired
  ProductRepository productRepository;
@z

@x
  @Test
  @Sql("classpath:/sql/seed-data.sql")
  void shouldGetAllProducts() {
    List<Product> products = productRepository.findAll();
    assertEquals(2, products.size());
  }
}
```
@y
  @Test
  @Sql("classpath:/sql/seed-data.sql")
  void shouldGetAllProducts() {
    List<Product> products = productRepository.findAll();
    assertEquals(2, products.size());
  }
}
```
@z

@x
That's it — two properties and your tests run against a real PostgreSQL
database.
@y
That's it — two properties and your tests run against a real PostgreSQL
database.
@z

@x
## How the special JDBC URL works
@y
## How the special JDBC URL works
@z

@x
A standard PostgreSQL JDBC URL looks like:
@y
A standard PostgreSQL JDBC URL looks like:
@z

@x
```text
jdbc:postgresql://localhost:5432/postgres
```
@y
```text
jdbc:postgresql://localhost:5432/postgres
```
@z

@x
The Testcontainers special JDBC URL inserts `tc:` after `jdbc:`:
@y
The Testcontainers special JDBC URL inserts `tc:` after `jdbc:`:
@z

@x
```text
jdbc:tc:postgresql:///db
```
@y
```text
jdbc:tc:postgresql:///db
```
@z

@x
The hostname, port, and database name are ignored — Testcontainers manages them
automatically. You can specify the Docker image tag after the database name:
@y
The hostname, port, and database name are ignored — Testcontainers manages them
automatically. You can specify the Docker image tag after the database name:
@z

@x
```text
jdbc:tc:postgresql:16-alpine:///db
```
@y
```text
jdbc:tc:postgresql:16-alpine:///db
```
@z

@x
This creates a container from the `postgres:16-alpine` image.
@y
This creates a container from the `postgres:16-alpine` image.
@z

@x
## Initialize the database with a script
@y
## Initialize the database with a script
@z

@x
Pass `TC_INITSCRIPT` to run an SQL script when the container starts:
@y
Pass `TC_INITSCRIPT` to run an SQL script when the container starts:
@z

@x
```text
jdbc:tc:postgresql:16-alpine:///db?TC_INITSCRIPT=sql/init-db.sql
```
@y
```text
jdbc:tc:postgresql:16-alpine:///db?TC_INITSCRIPT=sql/init-db.sql
```
@z

@x
Testcontainers runs the script automatically. For production applications,
use a database migration tool like Flyway or Liquibase instead.
@y
Testcontainers runs the script automatically. For production applications,
use a database migration tool like Flyway or Liquibase instead.
@z

@x
The special JDBC URL also works for MySQL, MariaDB, PostGIS, YugabyteDB,
CockroachDB, and other databases with Testcontainers JDBC support.
@y
The special JDBC URL also works for MySQL, MariaDB, PostGIS, YugabyteDB,
CockroachDB, and other databases with Testcontainers JDBC support.
@z

@x
## Testing JdbcTemplate-based repositories
@y
## Testing JdbcTemplate-based repositories
@z

@x
The same approach works for `JdbcTemplate`-based repositories. Use `@JdbcTest`
instead of `@DataJpaTest`:
@y
The same approach works for `JdbcTemplate`-based repositories. Use `@JdbcTest`
instead of `@DataJpaTest`:
@z

@x
```java
@JdbcTest
@TestPropertySource(properties = {
  "spring.test.database.replace=none",
  "spring.datasource.url=jdbc:tc:postgresql:16-alpine:///db?TC_INITSCRIPT=sql/init-db.sql"
})
class JdbcProductRepositoryTest {
@y
```java
@JdbcTest
@TestPropertySource(properties = {
  "spring.test.database.replace=none",
  "spring.datasource.url=jdbc:tc:postgresql:16-alpine:///db?TC_INITSCRIPT=sql/init-db.sql"
})
class JdbcProductRepositoryTest {
@z

@x
  @Autowired
  private JdbcTemplate jdbcTemplate;
@y
  @Autowired
  private JdbcTemplate jdbcTemplate;
@z

@x
  private JdbcProductRepository productRepository;
@y
  private JdbcProductRepository productRepository;
@z

@x
  @BeforeEach
  void setUp() {
    productRepository = new JdbcProductRepository(jdbcTemplate);
  }
@y
  @BeforeEach
  void setUp() {
    productRepository = new JdbcProductRepository(jdbcTemplate);
  }
@z

@x
  @Test
  @Sql("/sql/seed-data.sql")
  void shouldGetAllProducts() {
    List<Product> products = productRepository.getAllProducts();
    assertEquals(2, products.size());
  }
}
```
@y
  @Test
  @Sql("/sql/seed-data.sql")
  void shouldGetAllProducts() {
    List<Product> products = productRepository.getAllProducts();
    assertEquals(2, products.size());
  }
}
```
@z
