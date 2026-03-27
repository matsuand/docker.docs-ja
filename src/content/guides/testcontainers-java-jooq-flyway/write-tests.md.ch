%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Write tests with Testcontainers
linkTitle: Write tests
description: Test jOOQ repositories using Testcontainers with the @JooqTest slice and @SpringBootTest.
@y
title: Write tests with Testcontainers
linkTitle: Write tests
description: Test jOOQ repositories using Testcontainers with the @JooqTest slice and @SpringBootTest.
@z

@x
Before writing the tests, create an SQL script to seed test data at
`src/test/resources/test-data.sql`:
@y
Before writing the tests, create an SQL script to seed test data at
`src/test/resources/test-data.sql`:
@z

@x
```sql
DELETE FROM comments;
DELETE FROM posts;
DELETE FROM users;
@y
```sql
DELETE FROM comments;
DELETE FROM posts;
DELETE FROM users;
@z

@x
INSERT INTO users(id, name, email) VALUES
(1, 'Siva', 'siva@gmail.com'),
(2, 'Oleg', 'oleg@gmail.com');
@y
INSERT INTO users(id, name, email) VALUES
(1, 'Siva', 'siva@gmail.com'),
(2, 'Oleg', 'oleg@gmail.com');
@z

@x
INSERT INTO posts(id, title, content, created_by, created_at) VALUES
(1, 'Post 1 Title', 'Post 1 content', 1, CURRENT_TIMESTAMP),
(2, 'Post 2 Title', 'Post 2 content', 2, CURRENT_TIMESTAMP);
@y
INSERT INTO posts(id, title, content, created_by, created_at) VALUES
(1, 'Post 1 Title', 'Post 1 content', 1, CURRENT_TIMESTAMP),
(2, 'Post 2 Title', 'Post 2 content', 2, CURRENT_TIMESTAMP);
@z

@x
INSERT INTO comments(id, name, content, post_id, created_at) VALUES
(1, 'Ron', 'Comment 1', 1, CURRENT_TIMESTAMP),
(2, 'James', 'Comment 2', 1, CURRENT_TIMESTAMP),
(3, 'Robert', 'Comment 3', 2, CURRENT_TIMESTAMP);
```
@y
INSERT INTO comments(id, name, content, post_id, created_at) VALUES
(1, 'Ron', 'Comment 1', 1, CURRENT_TIMESTAMP),
(2, 'James', 'Comment 2', 1, CURRENT_TIMESTAMP),
(3, 'Robert', 'Comment 3', 2, CURRENT_TIMESTAMP);
```
@z

@x
## Test with the @JooqTest slice
@y
## Test with the @JooqTest slice
@z

@x
The `@JooqTest` annotation loads only the persistence layer components and
auto-configures jOOQ's `DSLContext`. Use the Testcontainers special JDBC URL
to start a Postgres container.
@y
The `@JooqTest` annotation loads only the persistence layer components and
auto-configures jOOQ's `DSLContext`. Use the Testcontainers special JDBC URL
to start a Postgres container.
@z

@x
Create `UserRepositoryJooqTest.java`:
@y
Create `UserRepositoryJooqTest.java`:
@z

@x
```java
package com.testcontainers.demo.domain;
@y
```java
package com.testcontainers.demo.domain;
@z

@x
import static org.assertj.core.api.Assertions.assertThat;
@y
import static org.assertj.core.api.Assertions.assertThat;
@z

@x
import org.jooq.DSLContext;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jooq.JooqTest;
import org.springframework.test.context.jdbc.Sql;
@y
import org.jooq.DSLContext;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jooq.JooqTest;
import org.springframework.test.context.jdbc.Sql;
@z

@x
@JooqTest(
  properties = {
    "spring.test.database.replace=none",
    "spring.datasource.url=jdbc:tc:postgresql:16-alpine:///db",
  }
)
@Sql("/test-data.sql")
class UserRepositoryJooqTest {
@y
@JooqTest(
  properties = {
    "spring.test.database.replace=none",
    "spring.datasource.url=jdbc:tc:postgresql:16-alpine:///db",
  }
)
@Sql("/test-data.sql")
class UserRepositoryJooqTest {
@z

@x
  @Autowired
  DSLContext dsl;
@y
  @Autowired
  DSLContext dsl;
@z

@x
  UserRepository repository;
@y
  UserRepository repository;
@z

@x
  @BeforeEach
  void setUp() {
    this.repository = new UserRepository(dsl);
  }
@y
  @BeforeEach
  void setUp() {
    this.repository = new UserRepository(dsl);
  }
@z

@x
  @Test
  void shouldCreateUserSuccessfully() {
    User user = new User(null, "John", "john@gmail.com");
@y
  @Test
  void shouldCreateUserSuccessfully() {
    User user = new User(null, "John", "john@gmail.com");
@z

@x
    User savedUser = repository.createUser(user);
@y
    User savedUser = repository.createUser(user);
@z

@x
    assertThat(savedUser.id()).isNotNull();
    assertThat(savedUser.name()).isEqualTo("John");
    assertThat(savedUser.email()).isEqualTo("john@gmail.com");
  }
@y
    assertThat(savedUser.id()).isNotNull();
    assertThat(savedUser.name()).isEqualTo("John");
    assertThat(savedUser.email()).isEqualTo("john@gmail.com");
  }
@z

@x
  @Test
  void shouldGetUserByEmail() {
    User user = repository.getUserByEmail("siva@gmail.com").orElseThrow();
@y
  @Test
  void shouldGetUserByEmail() {
    User user = repository.getUserByEmail("siva@gmail.com").orElseThrow();
@z

@x
    assertThat(user.id()).isEqualTo(1L);
    assertThat(user.name()).isEqualTo("Siva");
    assertThat(user.email()).isEqualTo("siva@gmail.com");
  }
}
```
@y
    assertThat(user.id()).isEqualTo(1L);
    assertThat(user.name()).isEqualTo("Siva");
    assertThat(user.email()).isEqualTo("siva@gmail.com");
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
- `@JooqTest` loads only the persistence layer and auto-configures
  `DSLContext`.
- The Testcontainers special JDBC URL
  (`jdbc:tc:postgresql:16-alpine:///db`) starts a PostgreSQL container
  automatically.
- Because `flyway-core` is on the classpath, Spring Boot runs the Flyway
  migrations from `src/main/resources/db/migration` on startup.
- `@Sql("/test-data.sql")` loads the test data before each test.
- The `UserRepository` is instantiated manually with the injected
  `DSLContext`.
@y
- `@JooqTest` loads only the persistence layer and auto-configures
  `DSLContext`.
- The Testcontainers special JDBC URL
  (`jdbc:tc:postgresql:16-alpine:///db`) starts a PostgreSQL container
  automatically.
- Because `flyway-core` is on the classpath, Spring Boot runs the Flyway
  migrations from `src/main/resources/db/migration` on startup.
- `@Sql("/test-data.sql")` loads the test data before each test.
- The `UserRepository` is instantiated manually with the injected
  `DSLContext`.
@z

@x
## Integration test with @SpringBootTest
@y
## Integration test with @SpringBootTest
@z

@x
For a full integration test, use `@SpringBootTest` with the Testcontainers
`@ServiceConnection` support introduced in Spring Boot 3.1.
@y
For a full integration test, use `@SpringBootTest` with the Testcontainers
`@ServiceConnection` support introduced in Spring Boot 3.1.
@z

@x
Create `UserRepositoryTest.java`:
@y
Create `UserRepositoryTest.java`:
@z

@x
```java
package com.testcontainers.demo.domain;
@y
```java
package com.testcontainers.demo.domain;
@z

@x
import static org.assertj.core.api.Assertions.assertThat;
@y
import static org.assertj.core.api.Assertions.assertThat;
@z

@x
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.testcontainers.service.connection.ServiceConnection;
import org.springframework.test.context.jdbc.Sql;
import org.testcontainers.postgresql.PostgreSQLContainer;
import org.testcontainers.junit.jupiter.Container;
import org.testcontainers.junit.jupiter.Testcontainers;
@y
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.testcontainers.service.connection.ServiceConnection;
import org.springframework.test.context.jdbc.Sql;
import org.testcontainers.postgresql.PostgreSQLContainer;
import org.testcontainers.junit.jupiter.Container;
import org.testcontainers.junit.jupiter.Testcontainers;
@z

@x
@SpringBootTest
@Sql("/test-data.sql")
@Testcontainers
class UserRepositoryTest {
@y
@SpringBootTest
@Sql("/test-data.sql")
@Testcontainers
class UserRepositoryTest {
@z

@x
  @Container
  @ServiceConnection
  static PostgreSQLContainer postgres = new PostgreSQLContainer(
    "postgres:16-alpine"
  );
@y
  @Container
  @ServiceConnection
  static PostgreSQLContainer postgres = new PostgreSQLContainer(
    "postgres:16-alpine"
  );
@z

@x
  @Autowired
  UserRepository repository;
@y
  @Autowired
  UserRepository repository;
@z

@x
  @Test
  void shouldCreateUserSuccessfully() {
    User user = new User(null, "John", "john@gmail.com");
@y
  @Test
  void shouldCreateUserSuccessfully() {
    User user = new User(null, "John", "john@gmail.com");
@z

@x
    User savedUser = repository.createUser(user);
@y
    User savedUser = repository.createUser(user);
@z

@x
    assertThat(savedUser.id()).isNotNull();
    assertThat(savedUser.name()).isEqualTo("John");
    assertThat(savedUser.email()).isEqualTo("john@gmail.com");
  }
@y
    assertThat(savedUser.id()).isNotNull();
    assertThat(savedUser.name()).isEqualTo("John");
    assertThat(savedUser.email()).isEqualTo("john@gmail.com");
  }
@z

@x
  @Test
  void shouldGetUserByEmail() {
    User user = repository.getUserByEmail("siva@gmail.com").orElseThrow();
@y
  @Test
  void shouldGetUserByEmail() {
    User user = repository.getUserByEmail("siva@gmail.com").orElseThrow();
@z

@x
    assertThat(user.id()).isEqualTo(1L);
    assertThat(user.name()).isEqualTo("Siva");
    assertThat(user.email()).isEqualTo("siva@gmail.com");
  }
}
```
@y
    assertThat(user.id()).isEqualTo(1L);
    assertThat(user.name()).isEqualTo("Siva");
    assertThat(user.email()).isEqualTo("siva@gmail.com");
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
- `@SpringBootTest` loads the entire application context, so
  `UserRepository` is injected directly.
- `@Testcontainers` and `@Container` manage the PostgreSQL container
  lifecycle.
- `@ServiceConnection` auto-configures the datasource properties from the
  running container, replacing the need for `@DynamicPropertySource`.
- `@Sql("/test-data.sql")` initializes the test data.
@y
- `@SpringBootTest` loads the entire application context, so
  `UserRepository` is injected directly.
- `@Testcontainers` and `@Container` manage the PostgreSQL container
  lifecycle.
- `@ServiceConnection` auto-configures the datasource properties from the
  running container, replacing the need for `@DynamicPropertySource`.
- `@Sql("/test-data.sql")` initializes the test data.
@z

@x
## Test PostRepository
@y
## Test PostRepository
@z

@x
Test the `PostRepository` that fetches complex object graphs using the
Testcontainers special JDBC URL.
@y
Test the `PostRepository` that fetches complex object graphs using the
Testcontainers special JDBC URL.
@z

@x
Create `PostRepositoryTest.java`:
@y
Create `PostRepositoryTest.java`:
@z

@x
```java
package com.testcontainers.demo.domain;
@y
```java
package com.testcontainers.demo.domain;
@z

@x
import static org.assertj.core.api.Assertions.assertThat;
@y
import static org.assertj.core.api.Assertions.assertThat;
@z

@x
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.jdbc.Sql;
@y
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.jdbc.Sql;
@z

@x
@SpringBootTest(
  properties = {
    "spring.test.database.replace=none",
    "spring.datasource.url=jdbc:tc:postgresql:16-alpine:///db",
  }
)
@Sql("/test-data.sql")
class PostRepositoryTest {
@y
@SpringBootTest(
  properties = {
    "spring.test.database.replace=none",
    "spring.datasource.url=jdbc:tc:postgresql:16-alpine:///db",
  }
)
@Sql("/test-data.sql")
class PostRepositoryTest {
@z

@x
  @Autowired
  PostRepository repository;
@y
  @Autowired
  PostRepository repository;
@z

@x
  @Test
  void shouldGetPostById() {
    Post post = repository.getPostById(1L).orElseThrow();
@y
  @Test
  void shouldGetPostById() {
    Post post = repository.getPostById(1L).orElseThrow();
@z

@x
    assertThat(post.id()).isEqualTo(1L);
    assertThat(post.title()).isEqualTo("Post 1 Title");
    assertThat(post.content()).isEqualTo("Post 1 content");
    assertThat(post.createdBy().id()).isEqualTo(1L);
    assertThat(post.createdBy().name()).isEqualTo("Siva");
    assertThat(post.createdBy().email()).isEqualTo("siva@gmail.com");
    assertThat(post.comments()).hasSize(2);
  }
}
```
@y
    assertThat(post.id()).isEqualTo(1L);
    assertThat(post.title()).isEqualTo("Post 1 Title");
    assertThat(post.content()).isEqualTo("Post 1 content");
    assertThat(post.createdBy().id()).isEqualTo(1L);
    assertThat(post.createdBy().name()).isEqualTo("Siva");
    assertThat(post.createdBy().email()).isEqualTo("siva@gmail.com");
    assertThat(post.comments()).hasSize(2);
  }
}
```
@z

@x
This test verifies that `getPostById` loads the post along with its creator
and comments in a single query using jOOQ's MULTISET feature.
@y
This test verifies that `getPostById` loads the post along with its creator
and comments in a single query using jOOQ's MULTISET feature.
@z
