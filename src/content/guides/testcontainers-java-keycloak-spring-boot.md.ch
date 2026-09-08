%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Securing Spring Boot microservice using Keycloak and Testcontainers
linkTitle: Keycloak with Spring Boot
description: Learn how to secure a Spring Boot microservice using Keycloak and test it with the Testcontainers Keycloak module.
keywords: testcontainers, java, spring boot, testing, keycloak, security, oauth2, jwt
summary: |
  Learn how to create an OAuth 2.0 Resource Server using Spring Boot, secure API
  endpoints with Keycloak, and test the application using the Testcontainers Keycloak module.
@y
title: Securing Spring Boot microservice using Keycloak and Testcontainers
linkTitle: Keycloak with Spring Boot
description: Learn how to secure a Spring Boot microservice using Keycloak and test it with the Testcontainers Keycloak module.
keywords: testcontainers, java, spring boot, testing, keycloak, security, oauth2, jwt
summary: |
  Learn how to create an OAuth 2.0 Resource Server using Spring Boot, secure API
  endpoints with Keycloak, and test the application using the Testcontainers Keycloak module.
@z

@x
  time: 30 minutes
@y
  time: 30 分
@z

@x
<!-- Source: https://github.com/testcontainers/tc-guide-securing-spring-boot-microservice-using-keycloak-and-testcontainers -->
@y
<!-- Source: https://github.com/testcontainers/tc-guide-securing-spring-boot-microservice-using-keycloak-and-testcontainers -->
@z

@x
In this guide, you'll learn how to:
@y
In this guide, you'll learn how to:
@z

@x
- Create an OAuth 2.0 Resource Server using Spring Boot
- Secure API endpoints using Keycloak
- Test the APIs using the Testcontainers Keycloak module
- Run the application locally using the Testcontainers Keycloak module
@y
- Create an OAuth 2.0 Resource Server using Spring Boot
- Secure API endpoints using Keycloak
- Test the APIs using the Testcontainers Keycloak module
- Run the application locally using the Testcontainers Keycloak module
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
by selecting the **Spring Web**, **Validation**, **JDBC API**,
**PostgreSQL Driver**, **Spring Security**, **OAuth2 Resource Server**, and
**Testcontainers** starters.
@y
Create a Spring Boot project from [Spring Initializr](https://start.spring.io)
by selecting the **Spring Web**, **Validation**, **JDBC API**,
**PostgreSQL Driver**, **Spring Security**, **OAuth2 Resource Server**, and
**Testcontainers** starters.
@z

@x
Alternatively, clone the
[guide repository](https://github.com/testcontainers/tc-guide-securing-spring-boot-microservice-using-keycloak-and-testcontainers).
@y
Alternatively, clone the
[guide repository](https://github.com/testcontainers/tc-guide-securing-spring-boot-microservice-using-keycloak-and-testcontainers).
@z

@x
After generating the application, add the
[testcontainers-keycloak](https://github.com/dasniko/testcontainers-keycloak)
community module and [REST Assured](https://rest-assured.io/) as test
dependencies.
@y
After generating the application, add the
[testcontainers-keycloak](https://github.com/dasniko/testcontainers-keycloak)
community module and [REST Assured](https://rest-assured.io/) as test
dependencies.
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
        <artifactId>spring-boot-starter-web</artifactId>
    </dependency>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-validation</artifactId>
    </dependency>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-jdbc</artifactId>
    </dependency>
    <dependency>
        <groupId>org.postgresql</groupId>
        <artifactId>postgresql</artifactId>
        <scope>runtime</scope>
    </dependency>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-security</artifactId>
    </dependency>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-oauth2-resource-server</artifactId>
    </dependency>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-test</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.springframework.security</groupId>
        <artifactId>spring-security-test</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-testcontainers</artifactId>
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
        <groupId>com.github.dasniko</groupId>
        <artifactId>testcontainers-keycloak</artifactId>
        <version>3.4.0</version>
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
        <artifactId>spring-boot-starter-web</artifactId>
    </dependency>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-validation</artifactId>
    </dependency>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-jdbc</artifactId>
    </dependency>
    <dependency>
        <groupId>org.postgresql</groupId>
        <artifactId>postgresql</artifactId>
        <scope>runtime</scope>
    </dependency>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-security</artifactId>
    </dependency>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-oauth2-resource-server</artifactId>
    </dependency>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-test</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.springframework.security</groupId>
        <artifactId>spring-security-test</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-testcontainers</artifactId>
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
        <groupId>com.github.dasniko</groupId>
        <artifactId>testcontainers-keycloak</artifactId>
        <version>3.4.0</version>
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
### Create the domain model
@y
### Create the domain model
@z

@x
Create a `Product` record that represents the domain object:
@y
Create a `Product` record that represents the domain object:
@z

@x
```java
package com.testcontainers.products.domain;
@y
```java
package com.testcontainers.products.domain;
@z

@x
import jakarta.validation.constraints.NotEmpty;
@y
import jakarta.validation.constraints.NotEmpty;
@z

@x
public record Product(Long id, @NotEmpty String title, String description) {}
```
@y
public record Product(Long id, @NotEmpty String title, String description) {}
```
@z

@x
### Create the repository
@y
### Create the repository
@z

@x
Implement `ProductRepository` using Spring `JdbcClient` to interact with a
PostgreSQL database:
@y
Implement `ProductRepository` using Spring `JdbcClient` to interact with a
PostgreSQL database:
@z

@x
```java
package com.testcontainers.products.domain;
@y
```java
package com.testcontainers.products.domain;
@z

@x
import java.util.List;
import org.springframework.jdbc.core.simple.JdbcClient;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;
@y
import java.util.List;
import org.springframework.jdbc.core.simple.JdbcClient;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;
@z

@x
@Repository
public class ProductRepository {
@y
@Repository
public class ProductRepository {
@z

@x
  private final JdbcClient jdbcClient;
@y
  private final JdbcClient jdbcClient;
@z

@x
  public ProductRepository(JdbcClient jdbcClient) {
    this.jdbcClient = jdbcClient;
  }
@y
  public ProductRepository(JdbcClient jdbcClient) {
    this.jdbcClient = jdbcClient;
  }
@z

@x
  public List<Product> getAll() {
    return jdbcClient.sql("SELECT * FROM products").query(Product.class).list();
  }
@y
  public List<Product> getAll() {
    return jdbcClient.sql("SELECT * FROM products").query(Product.class).list();
  }
@z

@x
  public Product create(Product product) {
    String sql =
      "INSERT INTO products(title, description) VALUES (:title,:description) RETURNING id";
    KeyHolder keyHolder = new GeneratedKeyHolder();
    jdbcClient
      .sql(sql)
      .param("title", product.title())
      .param("description", product.description())
      .update(keyHolder);
    Long id = keyHolder.getKeyAs(Long.class);
    return new Product(id, product.title(), product.description());
  }
}
```
@y
  public Product create(Product product) {
    String sql =
      "INSERT INTO products(title, description) VALUES (:title,:description) RETURNING id";
    KeyHolder keyHolder = new GeneratedKeyHolder();
    jdbcClient
      .sql(sql)
      .param("title", product.title())
      .param("description", product.description())
      .update(keyHolder);
    Long id = keyHolder.getKeyAs(Long.class);
    return new Product(id, product.title(), product.description());
  }
}
```
@z

@x
### Add a schema creation script
@y
### Add a schema creation script
@z

@x
Create `src/main/resources/schema.sql` to initialize the `products` table:
@y
Create `src/main/resources/schema.sql` to initialize the `products` table:
@z

@x
```sql
CREATE TABLE products (
    id bigserial primary key,
    title varchar not null,
    description text
);
```
@y
```sql
CREATE TABLE products (
    id bigserial primary key,
    title varchar not null,
    description text
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
For production applications, use a database migration tool like Flyway or
Liquibase instead.
@y
For production applications, use a database migration tool like Flyway or
Liquibase instead.
@z

@x
### Implement the API endpoints
@y
### Implement the API endpoints
@z

@x
Create `ProductController` with endpoints to fetch all products and create a
product:
@y
Create `ProductController` with endpoints to fetch all products and create a
product:
@z

@x
```java
package com.testcontainers.products.api;
@y
```java
package com.testcontainers.products.api;
@z

@x
import com.testcontainers.products.domain.Product;
import com.testcontainers.products.domain.ProductRepository;
import jakarta.validation.Valid;
import java.util.List;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
@y
import com.testcontainers.products.domain.Product;
import com.testcontainers.products.domain.ProductRepository;
import jakarta.validation.Valid;
import java.util.List;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
@z

@x
@RestController
@RequestMapping("/api/products")
class ProductController {
@y
@RestController
@RequestMapping("/api/products")
class ProductController {
@z

@x
  private final ProductRepository productRepository;
@y
  private final ProductRepository productRepository;
@z

@x
  ProductController(ProductRepository productRepository) {
    this.productRepository = productRepository;
  }
@y
  ProductController(ProductRepository productRepository) {
    this.productRepository = productRepository;
  }
@z

@x
  @GetMapping
  List<Product> getAll() {
    return productRepository.getAll();
  }
@y
  @GetMapping
  List<Product> getAll() {
    return productRepository.getAll();
  }
@z

@x
  @PostMapping
  @ResponseStatus(HttpStatus.CREATED)
  Product createProduct(@RequestBody @Valid Product product) {
    return productRepository.create(product);
  }
}
```
@y
  @PostMapping
  @ResponseStatus(HttpStatus.CREATED)
  Product createProduct(@RequestBody @Valid Product product) {
    return productRepository.create(product);
  }
}
```
@z

@x
### Configure OAuth 2.0 security
@y
### Configure OAuth 2.0 security
@z

@x
Create a `SecurityConfig` class that protects the API endpoints using JWT
token-based authentication:
@y
Create a `SecurityConfig` class that protects the API endpoints using JWT
token-based authentication:
@z

@x
```java
package com.testcontainers.products.config;
@y
```java
package com.testcontainers.products.config;
@z

@x
import static org.springframework.security.config.Customizer.withDefaults;
@y
import static org.springframework.security.config.Customizer.withDefaults;
@z

@x
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.CorsConfigurer;
import org.springframework.security.config.annotation.web.configurers.CsrfConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;
@y
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.CorsConfigurer;
import org.springframework.security.config.annotation.web.configurers.CsrfConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;
@z

@x
@Configuration
@EnableWebSecurity
class SecurityConfig {
@y
@Configuration
@EnableWebSecurity
class SecurityConfig {
@z

@x
  @Bean
  SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
    http
      .authorizeHttpRequests(c ->
        c
          .requestMatchers(HttpMethod.GET, "/api/products")
          .permitAll()
          .requestMatchers(HttpMethod.POST, "/api/products")
          .authenticated()
          .anyRequest()
          .authenticated()
      )
      .sessionManagement(c ->
        c.sessionCreationPolicy(SessionCreationPolicy.STATELESS)
      )
      .cors(CorsConfigurer::disable)
      .csrf(CsrfConfigurer::disable)
      .oauth2ResourceServer(oauth2 -> oauth2.jwt(withDefaults()));
    return http.build();
  }
}
```
@y
  @Bean
  SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
    http
      .authorizeHttpRequests(c ->
        c
          .requestMatchers(HttpMethod.GET, "/api/products")
          .permitAll()
          .requestMatchers(HttpMethod.POST, "/api/products")
          .authenticated()
          .anyRequest()
          .authenticated()
      )
      .sessionManagement(c ->
        c.sessionCreationPolicy(SessionCreationPolicy.STATELESS)
      )
      .cors(CorsConfigurer::disable)
      .csrf(CsrfConfigurer::disable)
      .oauth2ResourceServer(oauth2 -> oauth2.jwt(withDefaults()));
    return http.build();
  }
}
```
@z

@x
This configuration:
@y
This configuration:
@z

@x
- Permits unauthenticated access to `GET /api/products`.
- Requires authentication for `POST /api/products` and all other endpoints.
- Configures the OAuth 2.0 Resource Server with JWT token-based authentication.
- Disables CORS and CSRF because this is a stateless API.
@y
- Permits unauthenticated access to `GET /api/products`.
- Requires authentication for `POST /api/products` and all other endpoints.
- Configures the OAuth 2.0 Resource Server with JWT token-based authentication.
- Disables CORS and CSRF because this is a stateless API.
@z

@x
Add the JWT issuer URI to `application.properties`:
@y
Add the JWT issuer URI to `application.properties`:
@z

@x
```properties
spring.security.oauth2.resourceserver.jwt.issuer-uri=http://localhost:9090/realms/keycloaktcdemo
```
@y
```properties
spring.security.oauth2.resourceserver.jwt.issuer-uri=http://localhost:9090/realms/keycloaktcdemo
```
@z

@x
### Export the Keycloak realm configuration
@y
### Export the Keycloak realm configuration
@z

@x
Before writing the tests, export a Keycloak realm configuration so that the test
environment can import it automatically. Start a temporary Keycloak instance:
@y
Before writing the tests, export a Keycloak realm configuration so that the test
environment can import it automatically. Start a temporary Keycloak instance:
@z

@x
```console
$ docker run -p 9090:8080 \
    -e KEYCLOAK_ADMIN=admin \
    -e KEYCLOAK_ADMIN_PASSWORD=admin \
    quay.io/keycloak/keycloak:25 start-dev
```
@y
```console
$ docker run -p 9090:8080 \
    -e KEYCLOAK_ADMIN=admin \
    -e KEYCLOAK_ADMIN_PASSWORD=admin \
    quay.io/keycloak/keycloak:25 start-dev
```
@z

@x
Open `http://localhost:9090` and sign in to the Admin Console with `admin/admin`.
Then set up the realm:
@y
Open `http://localhost:9090` and sign in to the Admin Console with `admin/admin`.
Then set up the realm:
@z

@x
1. In the top-left corner, select the realm drop-down and create a realm named
   `keycloaktcdemo`.
2. Under the `keycloaktcdemo` realm, create a client with the following
   settings:
   - **Client ID**: `product-service`
   - **Client Authentication**: `On`
   - **Authentication flow**: select only **Service accounts roles**
3. On the **Client details** screen, go to the **Credentials** tab and copy the
   **Client secret** value.
@y
1. In the top-left corner, select the realm drop-down and create a realm named
   `keycloaktcdemo`.
2. Under the `keycloaktcdemo` realm, create a client with the following
   settings:
   - **Client ID**: `product-service`
   - **Client Authentication**: `On`
   - **Authentication flow**: select only **Service accounts roles**
3. On the **Client details** screen, go to the **Credentials** tab and copy the
   **Client secret** value.
@z

@x
Export the realm configuration:
@y
Export the realm configuration:
@z

@x
```console
$ docker ps
# copy the keycloak container id
@y
```console
$ docker ps
# copy the keycloak container id
@z

@x
$ docker exec -it <container-id> /bin/bash
@y
$ docker exec -it <container-id> /bin/bash
@z

@x
$ /opt/keycloak/bin/kc.sh export --dir /opt/keycloak/data/import --realm keycloaktcdemo
@y
$ /opt/keycloak/bin/kc.sh export --dir /opt/keycloak/data/import --realm keycloaktcdemo
@z

@x
$ exit
@y
$ exit
@z

@x
$ docker cp <container-id>:/opt/keycloak/data/import/keycloaktcdemo-realm.json keycloaktcdemo-realm.json
```
@y
$ docker cp <container-id>:/opt/keycloak/data/import/keycloaktcdemo-realm.json keycloaktcdemo-realm.json
```
@z

@x
Copy the exported `keycloaktcdemo-realm.json` file into `src/test/resources`.
@y
Copy the exported `keycloaktcdemo-realm.json` file into `src/test/resources`.
@z

@x
## Write tests with Testcontainers
@y
## Write tests with Testcontainers
@z

@x
To test the secured API endpoints, you need a running Keycloak instance and a
PostgreSQL database, plus a started Spring context. Testcontainers spins up both
services in Docker containers and connects them to Spring through dynamic
property registration.
@y
To test the secured API endpoints, you need a running Keycloak instance and a
PostgreSQL database, plus a started Spring context. Testcontainers spins up both
services in Docker containers and connects them to Spring through dynamic
property registration.
@z

@x
### Configure the test containers
@y
### Configure the test containers
@z

@x
Spring Boot's Testcontainers support lets you declare containers as beans. For
Keycloak, `@ServiceConnection` isn't available, but you can use
`DynamicPropertyRegistry` to set the JWT issuer URI dynamically.
@y
Spring Boot's Testcontainers support lets you declare containers as beans. For
Keycloak, `@ServiceConnection` isn't available, but you can use
`DynamicPropertyRegistry` to set the JWT issuer URI dynamically.
@z

@x
Create `ContainersConfig.java` under `src/test/java`:
@y
Create `ContainersConfig.java` under `src/test/java`:
@z

@x
```java
package com.testcontainers.products;
@y
```java
package com.testcontainers.products;
@z

@x
import dasniko.testcontainers.keycloak.KeycloakContainer;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.boot.testcontainers.service.connection.ServiceConnection;
import org.springframework.context.annotation.Bean;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.testcontainers.postgresql.PostgreSQLContainer;
@y
import dasniko.testcontainers.keycloak.KeycloakContainer;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.boot.testcontainers.service.connection.ServiceConnection;
import org.springframework.context.annotation.Bean;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.testcontainers.postgresql.PostgreSQLContainer;
@z

@x
@TestConfiguration(proxyBeanMethods = false)
public class ContainersConfig {
@y
@TestConfiguration(proxyBeanMethods = false)
public class ContainersConfig {
@z

@x
  static String POSTGRES_IMAGE = "postgres:16-alpine";
  static String KEYCLOAK_IMAGE = "quay.io/keycloak/keycloak:25.0";
  static String realmImportFile = "/keycloaktcdemo-realm.json";
  static String realmName = "keycloaktcdemo";
@y
  static String POSTGRES_IMAGE = "postgres:16-alpine";
  static String KEYCLOAK_IMAGE = "quay.io/keycloak/keycloak:25.0";
  static String realmImportFile = "/keycloaktcdemo-realm.json";
  static String realmName = "keycloaktcdemo";
@z

@x
  @Bean
  @ServiceConnection
  PostgreSQLContainer postgres() {
    return new PostgreSQLContainer(POSTGRES_IMAGE);
  }
@y
  @Bean
  @ServiceConnection
  PostgreSQLContainer postgres() {
    return new PostgreSQLContainer(POSTGRES_IMAGE);
  }
@z

@x
  @Bean
  KeycloakContainer keycloak(DynamicPropertyRegistry registry) {
    var keycloak = new KeycloakContainer(KEYCLOAK_IMAGE)
      .withRealmImportFile(realmImportFile);
    registry.add(
      "spring.security.oauth2.resourceserver.jwt.issuer-uri",
      () -> keycloak.getAuthServerUrl() + "/realms/" + realmName
    );
    return keycloak;
  }
}
```
@y
  @Bean
  KeycloakContainer keycloak(DynamicPropertyRegistry registry) {
    var keycloak = new KeycloakContainer(KEYCLOAK_IMAGE)
      .withRealmImportFile(realmImportFile);
    registry.add(
      "spring.security.oauth2.resourceserver.jwt.issuer-uri",
      () -> keycloak.getAuthServerUrl() + "/realms/" + realmName
    );
    return keycloak;
  }
}
```
@z

@x
This configuration:
@y
This configuration:
@z

@x
- Declares a `PostgreSQLContainer` bean with `@ServiceConnection`, which starts
  a PostgreSQL container and automatically registers the datasource properties.
- Declares a `KeycloakContainer` bean using the `quay.io/keycloak/keycloak:25.0`
  image, imports the realm configuration file, and dynamically registers the JWT
  issuer URI from the Keycloak container's auth server URL.
@y
- Declares a `PostgreSQLContainer` bean with `@ServiceConnection`, which starts
  a PostgreSQL container and automatically registers the datasource properties.
- Declares a `KeycloakContainer` bean using the `quay.io/keycloak/keycloak:25.0`
  image, imports the realm configuration file, and dynamically registers the JWT
  issuer URI from the Keycloak container's auth server URL.
@z

@x
### Write the test
@y
### Write the test
@z

@x
Create `ProductControllerTests.java`:
@y
Create `ProductControllerTests.java`:
@z

@x
```java
package com.testcontainers.products.api;
@y
```java
package com.testcontainers.products.api;
@z

@x
import static io.restassured.RestAssured.given;
import static io.restassured.RestAssured.when;
import static java.util.Collections.singletonList;
import static org.springframework.boot.test.context.SpringBootTest.WebEnvironment.RANDOM_PORT;
@y
import static io.restassured.RestAssured.given;
import static io.restassured.RestAssured.when;
import static java.util.Collections.singletonList;
import static org.springframework.boot.test.context.SpringBootTest.WebEnvironment.RANDOM_PORT;
@z

@x
import com.fasterxml.jackson.annotation.JsonProperty;
import com.testcontainers.products.ContainersConfig;
import io.restassured.RestAssured;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.oauth2.resource.OAuth2ResourceServerProperties;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.context.annotation.Import;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
@y
import com.fasterxml.jackson.annotation.JsonProperty;
import com.testcontainers.products.ContainersConfig;
import io.restassured.RestAssured;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.oauth2.resource.OAuth2ResourceServerProperties;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.context.annotation.Import;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
@z

@x
@SpringBootTest(webEnvironment = RANDOM_PORT)
@Import(ContainersConfig.class)
class ProductControllerTests {
@y
@SpringBootTest(webEnvironment = RANDOM_PORT)
@Import(ContainersConfig.class)
class ProductControllerTests {
@z

@x
  static final String GRANT_TYPE_CLIENT_CREDENTIALS = "client_credentials";
  static final String CLIENT_ID = "product-service";
  static final String CLIENT_SECRET = "jTJJqdzeCSt3DmypfHZa42vX8U9rQKZ9";
@y
  static final String GRANT_TYPE_CLIENT_CREDENTIALS = "client_credentials";
  static final String CLIENT_ID = "product-service";
  static final String CLIENT_SECRET = "jTJJqdzeCSt3DmypfHZa42vX8U9rQKZ9";
@z

@x
  @LocalServerPort
  private int port;
@y
  @LocalServerPort
  private int port;
@z

@x
  @Autowired
  OAuth2ResourceServerProperties oAuth2ResourceServerProperties;
@y
  @Autowired
  OAuth2ResourceServerProperties oAuth2ResourceServerProperties;
@z

@x
  @BeforeEach
  void setup() {
    RestAssured.port = port;
  }
@y
  @BeforeEach
  void setup() {
    RestAssured.port = port;
  }
@z

@x
  @Test
  void shouldGetProductsWithoutAuthToken() {
    when().get("/api/products").then().statusCode(200);
  }
@y
  @Test
  void shouldGetProductsWithoutAuthToken() {
    when().get("/api/products").then().statusCode(200);
  }
@z

@x
  @Test
  void shouldGetUnauthorizedWhenCreateProductWithoutAuthToken() {
    given()
      .contentType("application/json")
      .body(
        """
            {
                "title": "New Product",
                "description": "Brand New Product"
            }
        """
      )
      .when()
      .post("/api/products")
      .then()
      .statusCode(401);
  }
@y
  @Test
  void shouldGetUnauthorizedWhenCreateProductWithoutAuthToken() {
    given()
      .contentType("application/json")
      .body(
        """
            {
                "title": "New Product",
                "description": "Brand New Product"
            }
        """
      )
      .when()
      .post("/api/products")
      .then()
      .statusCode(401);
  }
@z

@x
  @Test
  void shouldCreateProductWithAuthToken() {
    String token = getToken();
@y
  @Test
  void shouldCreateProductWithAuthToken() {
    String token = getToken();
@z

@x
    given()
      .header("Authorization", "Bearer " + token)
      .contentType("application/json")
      .body(
        """
            {
                "title": "New Product",
                "description": "Brand New Product"
            }
        """
      )
      .when()
      .post("/api/products")
      .then()
      .statusCode(201);
  }
@y
    given()
      .header("Authorization", "Bearer " + token)
      .contentType("application/json")
      .body(
        """
            {
                "title": "New Product",
                "description": "Brand New Product"
            }
        """
      )
      .when()
      .post("/api/products")
      .then()
      .statusCode(201);
  }
@z

@x
  private String getToken() {
    RestTemplate restTemplate = new RestTemplate();
    HttpHeaders httpHeaders = new HttpHeaders();
    httpHeaders.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
@y
  private String getToken() {
    RestTemplate restTemplate = new RestTemplate();
    HttpHeaders httpHeaders = new HttpHeaders();
    httpHeaders.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
@z

@x
    MultiValueMap<String, String> map = new LinkedMultiValueMap<>();
    map.put("grant_type", singletonList(GRANT_TYPE_CLIENT_CREDENTIALS));
    map.put("client_id", singletonList(CLIENT_ID));
    map.put("client_secret", singletonList(CLIENT_SECRET));
@y
    MultiValueMap<String, String> map = new LinkedMultiValueMap<>();
    map.put("grant_type", singletonList(GRANT_TYPE_CLIENT_CREDENTIALS));
    map.put("client_id", singletonList(CLIENT_ID));
    map.put("client_secret", singletonList(CLIENT_SECRET));
@z

@x
    String authServerUrl =
      oAuth2ResourceServerProperties.getJwt().getIssuerUri() +
      "/protocol/openid-connect/token";
@y
    String authServerUrl =
      oAuth2ResourceServerProperties.getJwt().getIssuerUri() +
      "/protocol/openid-connect/token";
@z

@x
    var request = new HttpEntity<>(map, httpHeaders);
    KeyCloakToken token = restTemplate.postForObject(
      authServerUrl,
      request,
      KeyCloakToken.class
    );
@y
    var request = new HttpEntity<>(map, httpHeaders);
    KeyCloakToken token = restTemplate.postForObject(
      authServerUrl,
      request,
      KeyCloakToken.class
    );
@z

@x
    assert token != null;
    return token.accessToken();
  }
@y
    assert token != null;
    return token.accessToken();
  }
@z

@x
  record KeyCloakToken(@JsonProperty("access_token") String accessToken) {}
}
```
@y
  record KeyCloakToken(@JsonProperty("access_token") String accessToken) {}
}
```
@z

@x
Here's what the tests cover:
@y
Here's what the tests cover:
@z

@x
- `shouldGetProductsWithoutAuthToken()` invokes `GET /api/products` without an
  `Authorization` header. Because this endpoint is configured to permit
  unauthenticated access, the response status code is 200.
- `shouldGetUnauthorizedWhenCreateProductWithoutAuthToken()` invokes the secured
  `POST /api/products` endpoint without an `Authorization` header and asserts
  the response status code is 401 (Unauthorized).
- `shouldCreateProductWithAuthToken()` first obtains an `access_token` using the
  Client Credentials flow. It then includes the token as a Bearer token in the
  `Authorization` header when invoking `POST /api/products` and asserts the
  response status code is 201 (Created).
@y
- `shouldGetProductsWithoutAuthToken()` invokes `GET /api/products` without an
  `Authorization` header. Because this endpoint is configured to permit
  unauthenticated access, the response status code is 200.
- `shouldGetUnauthorizedWhenCreateProductWithoutAuthToken()` invokes the secured
  `POST /api/products` endpoint without an `Authorization` header and asserts
  the response status code is 401 (Unauthorized).
- `shouldCreateProductWithAuthToken()` first obtains an `access_token` using the
  Client Credentials flow. It then includes the token as a Bearer token in the
  `Authorization` header when invoking `POST /api/products` and asserts the
  response status code is 201 (Created).
@z

@x
The `getToken()` helper method requests an access token from the Keycloak token
endpoint using the client ID and client secret that were configured in the
exported realm.
@y
The `getToken()` helper method requests an access token from the Keycloak token
endpoint using the client ID and client secret that were configured in the
exported realm.
@z

@x
### Use Testcontainers for local development
@y
### Use Testcontainers for local development
@z

@x
Spring Boot's Testcontainers support also works for local development. Create
`TestApplication.java` under `src/test/java`:
@y
Spring Boot's Testcontainers support also works for local development. Create
`TestApplication.java` under `src/test/java`:
@z

@x
```java
package com.testcontainers.products;
@y
```java
package com.testcontainers.products;
@z

@x
import org.springframework.boot.SpringApplication;
@y
import org.springframework.boot.SpringApplication;
@z

@x
public class TestApplication {
@y
public class TestApplication {
@z

@x
  public static void main(String[] args) {
    SpringApplication
      .from(Application::main)
      .with(ContainersConfig.class)
      .run(args);
  }
}
```
@y
  public static void main(String[] args) {
    SpringApplication
      .from(Application::main)
      .with(ContainersConfig.class)
      .run(args);
  }
}
```
@z

@x
Run `TestApplication.java` from your IDE instead of the main `Application.java`.
It starts the containers defined in `ContainersConfig` and configures the
application to use the dynamically registered properties, so you don't have to
install or configure PostgreSQL and Keycloak manually.
@y
Run `TestApplication.java` from your IDE instead of the main `Application.java`.
It starts the containers defined in `ContainersConfig` and configures the
application to use the dynamically registered properties, so you don't have to
install or configure PostgreSQL and Keycloak manually.
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
You should see the Keycloak and PostgreSQL Docker containers start with the
realm settings imported and the tests pass. After the tests finish, the
containers stop and are removed automatically.
@y
You should see the Keycloak and PostgreSQL Docker containers start with the
realm settings imported and the tests pass. After the tests finish, the
containers stop and are removed automatically.
@z

@x
### Summary
@y
### Summary
@z

@x
The Testcontainers Keycloak module lets you develop and test applications using a
real Keycloak server instead of mocks. Testing against a real OAuth 2.0
provider that mirrors your production setup gives you more confidence in your
security configuration and token-based authentication flows.
@y
The Testcontainers Keycloak module lets you develop and test applications using a
real Keycloak server instead of mocks. Testing against a real OAuth 2.0
provider that mirrors your production setup gives you more confidence in your
security configuration and token-based authentication flows.
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
- [Getting started with Testcontainers in a Java Spring Boot project](https://testcontainers.com/guides/testing-spring-boot-rest-api-using-testcontainers/)
- [Testcontainers Keycloak module](https://testcontainers.com/modules/keycloak/)
- [testcontainers-keycloak GitHub repository](https://github.com/dasniko/testcontainers-keycloak)
- [Spring Boot OAuth 2.0 Resource Server](https://docs.spring.io/spring-security/reference/servlet/oauth2/resource-server/index.html)
@y
- [Getting started with Testcontainers in a Java Spring Boot project](https://testcontainers.com/guides/testing-spring-boot-rest-api-using-testcontainers/)
- [Testcontainers Keycloak module](https://testcontainers.com/modules/keycloak/)
- [testcontainers-keycloak GitHub repository](https://github.com/dasniko/testcontainers-keycloak)
- [Spring Boot OAuth 2.0 Resource Server](https://docs.spring.io/spring-security/reference/servlet/oauth2/resource-server/index.html)
@z
