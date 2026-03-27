%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Use the JUnit 5 extension for more control
linkTitle: JUnit 5 extension
description: Use the Testcontainers JUnit 5 extension for more control over the PostgreSQL container.
@y
title: Use the JUnit 5 extension for more control
linkTitle: JUnit 5 extension
description: Use the Testcontainers JUnit 5 extension for more control over the PostgreSQL container.
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
## Summary
@y
## Summary
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
## Further reading
@y
## Further reading
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
