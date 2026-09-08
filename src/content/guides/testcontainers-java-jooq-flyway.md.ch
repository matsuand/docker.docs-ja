%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
title: Working with jOOQ and Flyway using Testcontainers
linkTitle: jOOQ and Flyway
description: Learn how to generate jOOQ code from a database using Testcontainers and Flyway, then test your persistence layer.
keywords: testcontainers, java, testing, jooq, flyway, postgresql, spring boot, code generation
summary: |
  Generate typesafe jOOQ code from a real PostgreSQL database managed by
  Flyway migrations, then test repositories using Testcontainers.
@y
title: Working with jOOQ and Flyway using Testcontainers
linkTitle: jOOQ and Flyway
description: Learn how to generate jOOQ code from a database using Testcontainers and Flyway, then test your persistence layer.
keywords: testcontainers, java, testing, jooq, flyway, postgresql, spring boot, code generation
summary: |
  Generate typesafe jOOQ code from a real PostgreSQL database managed by
  Flyway migrations, then test repositories using Testcontainers.
@z

@x
  time: 25 minutes
@y
  time: 25 分
@z

@x
<!-- Source: https://github.com/testcontainers/tc-guide-working-with-jooq-flyway-using-testcontainers -->
@y
<!-- Source: https://github.com/testcontainers/tc-guide-working-with-jooq-flyway-using-testcontainers -->
@z

@x
In this guide, you will learn how to:
@y
In this guide, you will learn how to:
@z

@x
- Create a Spring Boot application with jOOQ support
- Generate jOOQ code using Testcontainers, Flyway, and a Maven plugin
- Implement basic database operations using jOOQ
- Load complex object graphs using jOOQ's MULTISET feature
- Test the jOOQ persistence layer using Testcontainers
@y
- Create a Spring Boot application with jOOQ support
- Generate jOOQ code using Testcontainers, Flyway, and a Maven plugin
- Implement basic database operations using jOOQ
- Load complex object graphs using jOOQ's MULTISET feature
- Test the jOOQ persistence layer using Testcontainers
@z

@x
## Prerequisites
@y
## Prerequisites
@z

@x
- Java 17+
- Maven
- A Docker environment supported by Testcontainers
@y
- Java 17+
- Maven
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
## Create the Spring Boot project
@y
## Create the Spring Boot project
@z

@x
### Set up the project
@y
### Set up the project
@z

@x
Create a Spring Boot project from [Spring Initializr](https://start.spring.io)
by selecting Maven as the build tool and adding the **JOOQ Access Layer**,
**Flyway Migration**, **Spring Boot DevTools**, **PostgreSQL Driver**, and
**Testcontainers** starters.
@y
Create a Spring Boot project from [Spring Initializr](https://start.spring.io)
by selecting Maven as the build tool and adding the **JOOQ Access Layer**,
**Flyway Migration**, **Spring Boot DevTools**, **PostgreSQL Driver**, and
**Testcontainers** starters.
@z

@x
Alternatively, clone the
[guide repository](https://github.com/testcontainers/tc-guide-working-with-jooq-flyway-using-testcontainers).
@y
Alternatively, clone the
[guide repository](https://github.com/testcontainers/tc-guide-working-with-jooq-flyway-using-testcontainers).
@z

@x
jOOQ (jOOQ Object Oriented Querying) provides a fluent API for building
typesafe SQL queries. To get the full benefit of its typesafe DSL, you need
to generate Java code from your database tables, views, and other objects.
@y
jOOQ (jOOQ Object Oriented Querying) provides a fluent API for building
typesafe SQL queries. To get the full benefit of its typesafe DSL, you need
to generate Java code from your database tables, views, and other objects.
@z

@x
> [!TIP]
> To learn more about how the jOOQ code generator helps, read
> [Why You Should Use jOOQ With Code Generation](https://blog.jooq.org/why-you-should-use-jooq-with-code-generation/).
@y
> [!TIP]
> To learn more about how the jOOQ code generator helps, read
> [Why You Should Use jOOQ With Code Generation](https://blog.jooq.org/why-you-should-use-jooq-with-code-generation/).
@z

@x
The typical process for building and testing the application with jOOQ code
generation is:
@y
The typical process for building and testing the application with jOOQ code
generation is:
@z

@x
1. Create a database instance using Testcontainers.
2. Apply Flyway database migrations.
3. Run the jOOQ code generator to produce Java code from the database objects.
4. Run integration tests.
@y
1. Create a database instance using Testcontainers.
2. Apply Flyway database migrations.
3. Run the jOOQ code generator to produce Java code from the database objects.
4. Run integration tests.
@z

@x
The
[testcontainers-jooq-codegen-maven-plugin](https://github.com/testcontainers/testcontainers-jooq-codegen-maven-plugin)
automates this as part of the Maven build.
@y
The
[testcontainers-jooq-codegen-maven-plugin](https://github.com/testcontainers/testcontainers-jooq-codegen-maven-plugin)
automates this as part of the Maven build.
@z

@x
### Create Flyway migration scripts
@y
### Create Flyway migration scripts
@z

@x
The sample application has `users`, `posts`, and `comments` tables. Create
the first migration script following the Flyway naming convention.
@y
The sample application has `users`, `posts`, and `comments` tables. Create
the first migration script following the Flyway naming convention.
@z

@x
Create `src/main/resources/db/migration/V1__create_tables.sql`:
@y
Create `src/main/resources/db/migration/V1__create_tables.sql`:
@z

@x
```sql
create table users
(
    id         bigserial not null,
    name       varchar   not null,
    email      varchar   not null,
    created_at timestamp,
    updated_at timestamp,
    primary key (id),
    constraint user_email_unique unique (email)
);
@y
```sql
create table users
(
    id         bigserial not null,
    name       varchar   not null,
    email      varchar   not null,
    created_at timestamp,
    updated_at timestamp,
    primary key (id),
    constraint user_email_unique unique (email)
);
@z

@x
create table posts
(
    id         bigserial                    not null,
    title      varchar                      not null,
    content    varchar                      not null,
    created_by bigint references users (id) not null,
    created_at timestamp,
    updated_at timestamp,
    primary key (id)
);
@y
create table posts
(
    id         bigserial                    not null,
    title      varchar                      not null,
    content    varchar                      not null,
    created_by bigint references users (id) not null,
    created_at timestamp,
    updated_at timestamp,
    primary key (id)
);
@z

@x
create table comments
(
    id         bigserial                    not null,
    name       varchar                      not null,
    content    varchar                      not null,
    post_id    bigint references posts (id) not null,
    created_at timestamp,
    updated_at timestamp,
    primary key (id)
);
@y
create table comments
(
    id         bigserial                    not null,
    name       varchar                      not null,
    content    varchar                      not null,
    post_id    bigint references posts (id) not null,
    created_at timestamp,
    updated_at timestamp,
    primary key (id)
);
@z

@x
ALTER SEQUENCE users_id_seq RESTART WITH 101;
ALTER SEQUENCE posts_id_seq RESTART WITH 101;
ALTER SEQUENCE comments_id_seq RESTART WITH 101;
```
@y
ALTER SEQUENCE users_id_seq RESTART WITH 101;
ALTER SEQUENCE posts_id_seq RESTART WITH 101;
ALTER SEQUENCE comments_id_seq RESTART WITH 101;
```
@z

@x
The sequence values restart at 101 so that you can insert sample data with
explicit primary key values for testing.
@y
The sequence values restart at 101 so that you can insert sample data with
explicit primary key values for testing.
@z

@x
### Configure jOOQ code generation
@y
### Configure jOOQ code generation
@z

@x
Add the `testcontainers-jooq-codegen-maven-plugin` to `pom.xml`:
@y
Add the `testcontainers-jooq-codegen-maven-plugin` to `pom.xml`:
@z

@x
```xml
<properties>
    <testcontainers.version>2.0.4</testcontainers.version>
    <testcontainers-jooq-codegen-maven-plugin.version>0.0.4</testcontainers-jooq-codegen-maven-plugin.version>
</properties>
@y
```xml
<properties>
    <testcontainers.version>2.0.4</testcontainers.version>
    <testcontainers-jooq-codegen-maven-plugin.version>0.0.4</testcontainers-jooq-codegen-maven-plugin.version>
</properties>
@z

@x
<build>
    <plugins>
        <plugin>
            <groupId>org.testcontainers</groupId>
            <artifactId>testcontainers-jooq-codegen-maven-plugin</artifactId>
            <version>${testcontainers-jooq-codegen-maven-plugin.version}</version>
            <dependencies>
                <dependency>
                    <groupId>org.testcontainers</groupId>
                    <artifactId>testcontainers-postgresql</artifactId>
                    <version>${testcontainers.version}</version>
                </dependency>
                <dependency>
                    <groupId>org.postgresql</groupId>
                    <artifactId>postgresql</artifactId>
                    <version>${postgresql.version}</version>
                </dependency>
            </dependencies>
            <executions>
                <execution>
                    <id>generate-jooq-sources</id>
                    <goals>
                        <goal>generate</goal>
                    </goals>
                    <phase>generate-sources</phase>
                    <configuration>
                        <database>
                            <type>POSTGRES</type>
                            <containerImage>postgres:16-alpine</containerImage>
                        </database>
                        <flyway>
                            <locations>
                                filesystem:src/main/resources/db/migration
                            </locations>
                        </flyway>
                        <jooq>
                            <generator>
                                <database>
                                    <includes>.*</includes>
                                    <excludes>flyway_schema_history</excludes>
                                    <inputSchema>public</inputSchema>
                                </database>
                                <target>
                                    <packageName>com.testcontainers.demo.jooq</packageName>
                                    <directory>target/generated-sources/jooq</directory>
                                </target>
                            </generator>
                        </jooq>
                    </configuration>
                </execution>
            </executions>
        </plugin>
    </plugins>
</build>
```
@y
<build>
    <plugins>
        <plugin>
            <groupId>org.testcontainers</groupId>
            <artifactId>testcontainers-jooq-codegen-maven-plugin</artifactId>
            <version>${testcontainers-jooq-codegen-maven-plugin.version}</version>
            <dependencies>
                <dependency>
                    <groupId>org.testcontainers</groupId>
                    <artifactId>testcontainers-postgresql</artifactId>
                    <version>${testcontainers.version}</version>
                </dependency>
                <dependency>
                    <groupId>org.postgresql</groupId>
                    <artifactId>postgresql</artifactId>
                    <version>${postgresql.version}</version>
                </dependency>
            </dependencies>
            <executions>
                <execution>
                    <id>generate-jooq-sources</id>
                    <goals>
                        <goal>generate</goal>
                    </goals>
                    <phase>generate-sources</phase>
                    <configuration>
                        <database>
                            <type>POSTGRES</type>
                            <containerImage>postgres:16-alpine</containerImage>
                        </database>
                        <flyway>
                            <locations>
                                filesystem:src/main/resources/db/migration
                            </locations>
                        </flyway>
                        <jooq>
                            <generator>
                                <database>
                                    <includes>.*</includes>
                                    <excludes>flyway_schema_history</excludes>
                                    <inputSchema>public</inputSchema>
                                </database>
                                <target>
                                    <packageName>com.testcontainers.demo.jooq</packageName>
                                    <directory>target/generated-sources/jooq</directory>
                                </target>
                            </generator>
                        </jooq>
                    </configuration>
                </execution>
            </executions>
        </plugin>
    </plugins>
</build>
```
@z

@x
Here's what the plugin configuration does:
@y
Here's what the plugin configuration does:
@z

@x
- The `<configuration>/<database>` section sets the database type to
  `POSTGRES` and the Docker image to `postgres:16-alpine`.
- The `<configuration>/<flyway>` section points to the Flyway migration
  scripts.
- The `<configuration>/<jooq>` section configures the package name and
  output directory for the generated code. You can use any configuration
  option that the official `jooq-code-generator` plugin supports.
@y
- The `<configuration>/<database>` section sets the database type to
  `POSTGRES` and the Docker image to `postgres:16-alpine`.
- The `<configuration>/<flyway>` section points to the Flyway migration
  scripts.
- The `<configuration>/<jooq>` section configures the package name and
  output directory for the generated code. You can use any configuration
  option that the official `jooq-code-generator` plugin supports.
@z

@x
When you run `./mvnw clean package`, the plugin uses Testcontainers to
spin up a PostgreSQL container, applies the Flyway migrations, and generates
Java code under `target/generated-sources/jooq`.
@y
When you run `./mvnw clean package`, the plugin uses Testcontainers to
spin up a PostgreSQL container, applies the Flyway migrations, and generates
Java code under `target/generated-sources/jooq`.
@z

@x
### Create model classes
@y
### Create model classes
@z

@x
Create model classes to represent the data structures for various use cases.
These records hold a subset of column values from the tables.
@y
Create model classes to represent the data structures for various use cases.
These records hold a subset of column values from the tables.
@z

@x
`User.java`:
@y
`User.java`:
@z

@x
```java
package com.testcontainers.demo.domain;
@y
```java
package com.testcontainers.demo.domain;
@z

@x
public record User(Long id, String name, String email) {}
```
@y
public record User(Long id, String name, String email) {}
```
@z

@x
`Post.java`:
@y
`Post.java`:
@z

@x
```java
package com.testcontainers.demo.domain;
@y
```java
package com.testcontainers.demo.domain;
@z

@x
import java.time.LocalDateTime;
import java.util.List;
@y
import java.time.LocalDateTime;
import java.util.List;
@z

@x
public record Post(
  Long id,
  String title,
  String content,
  User createdBy,
  List<Comment> comments,
  LocalDateTime createdAt,
  LocalDateTime updatedAt
) {}
```
@y
public record Post(
  Long id,
  String title,
  String content,
  User createdBy,
  List<Comment> comments,
  LocalDateTime createdAt,
  LocalDateTime updatedAt
) {}
```
@z

@x
`Comment.java`:
@y
`Comment.java`:
@z

@x
```java
package com.testcontainers.demo.domain;
@y
```java
package com.testcontainers.demo.domain;
@z

@x
import java.time.LocalDateTime;
@y
import java.time.LocalDateTime;
@z

@x
public record Comment(
  Long id,
  String name,
  String content,
  LocalDateTime createdAt,
  LocalDateTime updatedAt
) {}
```
@y
public record Comment(
  Long id,
  String name,
  String content,
  LocalDateTime createdAt,
  LocalDateTime updatedAt
) {}
```
@z

@x
### Implement repositories using jOOQ
@y
### Implement repositories using jOOQ
@z

@x
Create `UserRepository.java` with methods to create a user and look up a user
by email:
@y
Create `UserRepository.java` with methods to create a user and look up a user
by email:
@z

@x
```java
package com.testcontainers.demo.domain;
@y
```java
package com.testcontainers.demo.domain;
@z

@x
import static com.testcontainers.demo.jooq.tables.Users.USERS;
import static org.jooq.Records.mapping;
@y
import static com.testcontainers.demo.jooq.tables.Users.USERS;
import static org.jooq.Records.mapping;
@z

@x
import java.time.LocalDateTime;
import java.util.Optional;
import org.jooq.DSLContext;
import org.springframework.stereotype.Repository;
@y
import java.time.LocalDateTime;
import java.util.Optional;
import org.jooq.DSLContext;
import org.springframework.stereotype.Repository;
@z

@x
@Repository
class UserRepository {
@y
@Repository
class UserRepository {
@z

@x
  private final DSLContext dsl;
@y
  private final DSLContext dsl;
@z

@x
  UserRepository(DSLContext dsl) {
    this.dsl = dsl;
  }
@y
  UserRepository(DSLContext dsl) {
    this.dsl = dsl;
  }
@z

@x
  public User createUser(User user) {
    return this.dsl.insertInto(USERS)
      .set(USERS.NAME, user.name())
      .set(USERS.EMAIL, user.email())
      .set(USERS.CREATED_AT, LocalDateTime.now())
      .returningResult(USERS.ID, USERS.NAME, USERS.EMAIL)
      .fetchOne(mapping(User::new));
  }
@y
  public User createUser(User user) {
    return this.dsl.insertInto(USERS)
      .set(USERS.NAME, user.name())
      .set(USERS.EMAIL, user.email())
      .set(USERS.CREATED_AT, LocalDateTime.now())
      .returningResult(USERS.ID, USERS.NAME, USERS.EMAIL)
      .fetchOne(mapping(User::new));
  }
@z

@x
  public Optional<User> getUserByEmail(String email) {
    return this.dsl.select(USERS.ID, USERS.NAME, USERS.EMAIL)
      .from(USERS)
      .where(USERS.EMAIL.equalIgnoreCase(email))
      .fetchOptional(mapping(User::new));
  }
}
```
@y
  public Optional<User> getUserByEmail(String email) {
    return this.dsl.select(USERS.ID, USERS.NAME, USERS.EMAIL)
      .from(USERS)
      .where(USERS.EMAIL.equalIgnoreCase(email))
      .fetchOptional(mapping(User::new));
  }
}
```
@z

@x
The jOOQ DSL looks similar to SQL but written in Java. Because the code is
generated from the database schema, it stays in sync with the database
structure and provides type safety. For example,
`where(USERS.EMAIL.equalIgnoreCase(email))` expects a `String` value. If you
pass a non-string value like `123`, you get a compiler error.
@y
The jOOQ DSL looks similar to SQL but written in Java. Because the code is
generated from the database schema, it stays in sync with the database
structure and provides type safety. For example,
`where(USERS.EMAIL.equalIgnoreCase(email))` expects a `String` value. If you
pass a non-string value like `123`, you get a compiler error.
@z

@x
### Fetch complex object graphs
@y
### Fetch complex object graphs
@z

@x
jOOQ shines when it comes to complex queries. The database has a many-to-one
relationship from `Post` to `User` and a one-to-many relationship from `Post`
to `Comment`.
@y
jOOQ shines when it comes to complex queries. The database has a many-to-one
relationship from `Post` to `User` and a one-to-many relationship from `Post`
to `Comment`.
@z

@x
Create `PostRepository.java` to load a `Post` with its creator and comments
using a single query with jOOQ's MULTISET feature:
@y
Create `PostRepository.java` to load a `Post` with its creator and comments
using a single query with jOOQ's MULTISET feature:
@z

@x
```java
package com.testcontainers.demo.domain;
@y
```java
package com.testcontainers.demo.domain;
@z

@x
import static com.testcontainers.demo.jooq.Tables.COMMENTS;
import static com.testcontainers.demo.jooq.tables.Posts.POSTS;
import static org.jooq.Records.mapping;
import static org.jooq.impl.DSL.multiset;
import static org.jooq.impl.DSL.row;
import static org.jooq.impl.DSL.select;
@y
import static com.testcontainers.demo.jooq.Tables.COMMENTS;
import static com.testcontainers.demo.jooq.tables.Posts.POSTS;
import static org.jooq.Records.mapping;
import static org.jooq.impl.DSL.multiset;
import static org.jooq.impl.DSL.row;
import static org.jooq.impl.DSL.select;
@z

@x
import java.util.Optional;
import org.jooq.DSLContext;
import org.springframework.stereotype.Repository;
@y
import java.util.Optional;
import org.jooq.DSLContext;
import org.springframework.stereotype.Repository;
@z

@x
@Repository
class PostRepository {
@y
@Repository
class PostRepository {
@z

@x
  private final DSLContext dsl;
@y
  private final DSLContext dsl;
@z

@x
  PostRepository(DSLContext dsl) {
    this.dsl = dsl;
  }
@y
  PostRepository(DSLContext dsl) {
    this.dsl = dsl;
  }
@z

@x
  public Optional<Post> getPostById(Long id) {
    return this.dsl.select(
        POSTS.ID,
        POSTS.TITLE,
        POSTS.CONTENT,
        row(POSTS.users().ID, POSTS.users().NAME, POSTS.users().EMAIL)
          .mapping(User::new)
          .as("createdBy"),
        multiset(
          select(
            COMMENTS.ID,
            COMMENTS.NAME,
            COMMENTS.CONTENT,
            COMMENTS.CREATED_AT,
            COMMENTS.UPDATED_AT
          )
            .from(COMMENTS)
            .where(POSTS.ID.eq(COMMENTS.POST_ID))
        )
          .as("comments")
          .convertFrom(r -> r.map(mapping(Comment::new))),
        POSTS.CREATED_AT,
        POSTS.UPDATED_AT
      )
      .from(POSTS)
      .where(POSTS.ID.eq(id))
      .fetchOptional(mapping(Post::new));
  }
}
```
@y
  public Optional<Post> getPostById(Long id) {
    return this.dsl.select(
        POSTS.ID,
        POSTS.TITLE,
        POSTS.CONTENT,
        row(POSTS.users().ID, POSTS.users().NAME, POSTS.users().EMAIL)
          .mapping(User::new)
          .as("createdBy"),
        multiset(
          select(
            COMMENTS.ID,
            COMMENTS.NAME,
            COMMENTS.CONTENT,
            COMMENTS.CREATED_AT,
            COMMENTS.UPDATED_AT
          )
            .from(COMMENTS)
            .where(POSTS.ID.eq(COMMENTS.POST_ID))
        )
          .as("comments")
          .convertFrom(r -> r.map(mapping(Comment::new))),
        POSTS.CREATED_AT,
        POSTS.UPDATED_AT
      )
      .from(POSTS)
      .where(POSTS.ID.eq(id))
      .fetchOptional(mapping(Post::new));
  }
}
```
@z

@x
This uses jOOQ's
[nested records](https://www.jooq.org/doc/latest/manual/sql-building/column-expressions/nested-records/)
for the many-to-one `Post`-to-`User` association and
[MULTISET](https://www.jooq.org/doc/latest/manual/sql-building/column-expressions/multiset-value-constructor/)
for the one-to-many `Post`-to-`Comment` association.
@y
This uses jOOQ's
[nested records](https://www.jooq.org/doc/latest/manual/sql-building/column-expressions/nested-records/)
for the many-to-one `Post`-to-`User` association and
[MULTISET](https://www.jooq.org/doc/latest/manual/sql-building/column-expressions/multiset-value-constructor/)
for the one-to-many `Post`-to-`Comment` association.
@z

@x
## Write tests with Testcontainers
@y
## Write tests with Testcontainers
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
### Test with the @JooqTest slice
@y
### Test with the @JooqTest slice
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
### Integration test with @SpringBootTest
@y
### Integration test with @SpringBootTest
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
### Test PostRepository
@y
### Test PostRepository
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
You should see the PostgreSQL Docker container start, jOOQ code generation
complete, and all tests pass. After the tests finish, the container stops and
is removed automatically.
@y
You should see the PostgreSQL Docker container start, jOOQ code generation
complete, and all tests pass. After the tests finish, the container stops and
is removed automatically.
@z

@x
### Summary
@y
### Summary
@z

@x
The Testcontainers library helps you generate Java code from the database
using the jOOQ code generator and test your persistence layer against the
same type of database (PostgreSQL) that you use in production, instead of
mocks or in-memory databases.
@y
The Testcontainers library helps you generate Java code from the database
using the jOOQ code generator and test your persistence layer against the
same type of database (PostgreSQL) that you use in production, instead of
mocks or in-memory databases.
@z

@x
Because the code is always generated from the database's current state, you
can be confident that your code stays in sync with database changes. You're
free to refactor and still verify that the application works as expected.
@y
Because the code is always generated from the database's current state, you
can be confident that your code stays in sync with database changes. You're
free to refactor and still verify that the application works as expected.
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
- [jOOQ documentation](https://www.jooq.org/)
- [jOOQ code generation](https://www.jooq.org/doc/latest/manual/code-generation/)
- [Spring Boot Testcontainers support](https://docs.spring.io/spring-boot/reference/testing/testcontainers.html)
- [Replace H2 with a real database for testing](/guides/testcontainers-java-replace-h2/)
@y
- [jOOQ documentation](https://www.jooq.org/)
- [jOOQ code generation](https://www.jooq.org/doc/latest/manual/code-generation/)
- [Spring Boot Testcontainers support](https://docs.spring.io/spring-boot/reference/testing/testcontainers.html)
- [Replace H2 with a real database for testing](__SUBDIR__/guides/testcontainers-java-replace-h2/)
@z
