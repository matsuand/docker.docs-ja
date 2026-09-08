%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Replace H2 with a real database for testing
linkTitle: Replace H2 database
description: Learn how to replace an H2 in-memory database with a real PostgreSQL database for testing using Testcontainers.
keywords: testcontainers, java, testing, h2, postgresql, spring boot, spring data jpa, jdbc
summary: |
  Replace your H2 in-memory test database with a real PostgreSQL instance
  using the Testcontainers special JDBC URL — a one-line change.
@y
title: Replace H2 with a real database for testing
linkTitle: Replace H2 database
description: Learn how to replace an H2 in-memory database with a real PostgreSQL database for testing using Testcontainers.
keywords: testcontainers, java, testing, h2, postgresql, spring boot, spring data jpa, jdbc
summary: |
  Replace your H2 in-memory test database with a real PostgreSQL instance
  using the Testcontainers special JDBC URL — a one-line change.
@z

@x
  time: 15 minutes
@y
  time: 15 分
@z

@x
<!-- Source: https://github.com/testcontainers/tc-guide-replace-h2-with-real-database-for-testing -->
@y
<!-- Source: https://github.com/testcontainers/tc-guide-replace-h2-with-real-database-for-testing -->
@z

@x
In this guide, you will learn how to:
@y
In this guide, you will learn how to:
@z

@x
- Understand the drawbacks of using H2 in-memory databases for testing
- Replace H2 with a real PostgreSQL database using the Testcontainers special JDBC URL
- Use the Testcontainers JUnit 5 extension for more control over the container
- Test both Spring Data JPA and JdbcTemplate-based repositories
@y
- Understand the drawbacks of using H2 in-memory databases for testing
- Replace H2 with a real PostgreSQL database using the Testcontainers special JDBC URL
- Use the Testcontainers JUnit 5 extension for more control over the container
- Test both Spring Data JPA and JdbcTemplate-based repositories
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
## The problem with H2 for testing
@y
## The problem with H2 for testing
@z

@x
A common practice is to use lightweight databases like H2 or HSQL as
in-memory databases for testing while using PostgreSQL, MySQL, or Oracle in
production. This approach has significant drawbacks:
@y
A common practice is to use lightweight databases like H2 or HSQL as
in-memory databases for testing while using PostgreSQL, MySQL, or Oracle in
production. This approach has significant drawbacks:
@z

@x
- The test database might not support all features of your production database.
- SQL syntax might not be compatible between H2 and your production database.
- Tests passing with H2 don't guarantee they'll work in production.
@y
- The test database might not support all features of your production database.
- SQL syntax might not be compatible between H2 and your production database.
- Tests passing with H2 don't guarantee they'll work in production.
@z

@x
### Example: PostgreSQL-specific syntax
@y
### Example: PostgreSQL-specific syntax
@z

@x
Consider implementing an "upsert" — insert a product only if it doesn't
already exist. In PostgreSQL, you can use:
@y
Consider implementing an "upsert" — insert a product only if it doesn't
already exist. In PostgreSQL, you can use:
@z

@x
```sql
INSERT INTO products(id, code, name) VALUES(?,?,?) ON CONFLICT DO NOTHING;
```
@y
```sql
INSERT INTO products(id, code, name) VALUES(?,?,?) ON CONFLICT DO NOTHING;
```
@z

@x
This query doesn't work with H2 by default:
@y
This query doesn't work with H2 by default:
@z

@x
```text
Caused by: org.h2.jdbc.JdbcSQLException: Syntax error in SQL statement
"INSERT INTO products (id, code, name) VALUES (?, ?, ?) ON[*] CONFLICT DO NOTHING";
```
@y
```text
Caused by: org.h2.jdbc.JdbcSQLException: Syntax error in SQL statement
"INSERT INTO products (id, code, name) VALUES (?, ?, ?) ON[*] CONFLICT DO NOTHING";
```
@z

@x
You can run H2 in PostgreSQL compatibility mode, but not all features are
supported. The inverse is also true — H2 supports `ROWNUM()` which PostgreSQL
doesn't.
@y
You can run H2 in PostgreSQL compatibility mode, but not all features are
supported. The inverse is also true — H2 supports `ROWNUM()` which PostgreSQL
doesn't.
@z

@x
Testing with a different database than production means you can't trust your
test results and must verify after deployment, defeating the purpose of
automated tests.
@y
Testing with a different database than production means you can't trust your
test results and must verify after deployment, defeating the purpose of
automated tests.
@z

@x
### The Spring Boot test using H2
@y
### The Spring Boot test using H2
@z

@x
A typical H2-based test looks like this:
@y
A typical H2-based test looks like this:
@z

@x
```java
@DataJpaTest
class ProductRepositoryTest {
@y
```java
@DataJpaTest
class ProductRepositoryTest {
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
Spring Boot uses H2 automatically when it's on the classpath. The test passes,
but it doesn't catch PostgreSQL-specific issues.
@y
Spring Boot uses H2 automatically when it's on the classpath. The test passes,
but it doesn't catch PostgreSQL-specific issues.
@z

@x
## Replace H2 with the Testcontainers JDBC URL
@y
## Replace H2 with the Testcontainers JDBC URL
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
### How the special JDBC URL works
@y
### How the special JDBC URL works
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
### Initialize the database with a script
@y
### Initialize the database with a script
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
### Testing JdbcTemplate-based repositories
@y
### Testing JdbcTemplate-based repositories
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

@x
## Use the JUnit 5 extension for more control
@y
## Use the JUnit 5 extension for more control
@z

@x
If the special JDBC URL doesn't meet your needs, or you need more control over
container creation (for example, to copy initialization scripts), use the
Testcontainers JUnit 5 extension:
@y
If the special JDBC URL doesn't meet your needs, or you need more control over
container creation (for example, to copy initialization scripts), use the
Testcontainers JUnit 5 extension:
@z

@x
```java
@DataJpaTest
@TestPropertySource(properties = {
    "spring.test.database.replace=none"
})
@Testcontainers
class ProductRepositoryTest {
@y
```java
@DataJpaTest
@TestPropertySource(properties = {
    "spring.test.database.replace=none"
})
@Testcontainers
class ProductRepositoryTest {
@z

@x
  @Container
  static PostgreSQLContainer postgres =
    new PostgreSQLContainer("postgres:16-alpine")
      .withCopyFileToContainer(
        MountableFile.forClasspathResource("sql/init-db.sql"),
        "/docker-entrypoint-initdb.d/init-db.sql");
@y
  @Container
  static PostgreSQLContainer postgres =
    new PostgreSQLContainer("postgres:16-alpine")
      .withCopyFileToContainer(
        MountableFile.forClasspathResource("sql/init-db.sql"),
        "/docker-entrypoint-initdb.d/init-db.sql");
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
  ProductRepository productRepository;
@y
  @Autowired
  ProductRepository productRepository;
@z

@x
  @Test
  @Sql("/sql/seed-data.sql")
  void shouldGetAllProducts() {
    List<Product> products = productRepository.findAll();
    assertEquals(2, products.size());
  }
@y
  @Test
  @Sql("/sql/seed-data.sql")
  void shouldGetAllProducts() {
    List<Product> products = productRepository.findAll();
    assertEquals(2, products.size());
  }
@z

@x
  @Test
  @Sql("/sql/seed-data.sql")
  void shouldNotCreateAProductWithDuplicateCode() {
    Product product = new Product(3L, "p101", "Test Product");
    productRepository.createProductIfNotExists(product);
    Optional<Product> optionalProduct = productRepository.findById(
      product.getId()
    );
    assertThat(optionalProduct).isEmpty();
  }
}
```
@y
  @Test
  @Sql("/sql/seed-data.sql")
  void shouldNotCreateAProductWithDuplicateCode() {
    Product product = new Product(3L, "p101", "Test Product");
    productRepository.createProductIfNotExists(product);
    Optional<Product> optionalProduct = productRepository.findById(
      product.getId()
    );
    assertThat(optionalProduct).isEmpty();
  }
}
```
@z

@x
This approach:
@y
This approach:
@z

@x
- Uses `@Testcontainers` and `@Container` to manage the container lifecycle.
- Copies `init-db.sql` into the container's init directory so PostgreSQL
  runs it at startup.
- Uses `@DynamicPropertySource` to register the container's connection details
  with Spring Boot.
- Tests PostgreSQL-specific features like `ON CONFLICT DO NOTHING` that
  wouldn't work with H2.
@y
- Uses `@Testcontainers` and `@Container` to manage the container lifecycle.
- Copies `init-db.sql` into the container's init directory so PostgreSQL
  runs it at startup.
- Uses `@DynamicPropertySource` to register the container's connection details
  with Spring Boot.
- Tests PostgreSQL-specific features like `ON CONFLICT DO NOTHING` that
  wouldn't work with H2.
@z

@x
### Summary
@y
### Summary
@z

@x
- Use the **special JDBC URL** (`jdbc:tc:postgresql:...`) for the quickest way
  to switch from H2 to a real database — it's a one-property change.
- Use the **JUnit 5 extension** when you need more control over the container
  (custom init scripts, environment variables, etc.).
- Both approaches work with Spring Data JPA (`@DataJpaTest`) and JdbcTemplate
  (`@JdbcTest`) tests.
@y
- Use the **special JDBC URL** (`jdbc:tc:postgresql:...`) for the quickest way
  to switch from H2 to a real database — it's a one-property change.
- Use the **JUnit 5 extension** when you need more control over the container
  (custom init scripts, environment variables, etc.).
- Both approaches work with Spring Data JPA (`@DataJpaTest`) and JdbcTemplate
  (`@JdbcTest`) tests.
@z

@x
### Further reading
@y
### Further reading
@z

@x
- [Testcontainers Postgres module](https://java.testcontainers.org/modules/databases/postgres/)
- [Testcontainers JDBC support](https://java.testcontainers.org/modules/databases/jdbc/)
- [Testing a Spring Boot REST API with Testcontainers](/guides/testcontainers-java-spring-boot-rest-api/)
@y
- [Testcontainers Postgres module](https://java.testcontainers.org/modules/databases/postgres/)
- [Testcontainers JDBC support](https://java.testcontainers.org/modules/databases/jdbc/)
- [Testing a Spring Boot REST API with Testcontainers](__SUBDIR__/guides/testcontainers-java-spring-boot-rest-api/)
@z
