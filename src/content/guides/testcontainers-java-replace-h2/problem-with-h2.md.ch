%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: The problem with H2 for testing
linkTitle: The H2 problem
description: Understand why using H2 in-memory databases for testing gives false confidence.
@y
title: The problem with H2 for testing
linkTitle: The H2 problem
description: Understand why using H2 in-memory databases for testing gives false confidence.
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
## Example: PostgreSQL-specific syntax
@y
## Example: PostgreSQL-specific syntax
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
## The Spring Boot test using H2
@y
## The Spring Boot test using H2
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
