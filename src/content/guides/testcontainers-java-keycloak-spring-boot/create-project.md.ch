%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Create the Spring Boot project
linkTitle: Create the project
description: Set up a Spring Boot OAuth 2.0 Resource Server with Keycloak, PostgreSQL, and Testcontainers.
@y
title: Create the Spring Boot project
linkTitle: Create the project
description: Set up a Spring Boot OAuth 2.0 Resource Server with Keycloak, PostgreSQL, and Testcontainers.
@z

@x
## Set up the project
@y
## Set up the project
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
## Create the domain model
@y
## Create the domain model
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
## Create the repository
@y
## Create the repository
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
## Add a schema creation script
@y
## Add a schema creation script
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
## Implement the API endpoints
@y
## Implement the API endpoints
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
## Configure OAuth 2.0 security
@y
## Configure OAuth 2.0 security
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
## Export the Keycloak realm configuration
@y
## Export the Keycloak realm configuration
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
   - **Client Authentication**: **On**
   - **Authentication flow**: select only **Service accounts roles**
3. On the **Client details** screen, go to the **Credentials** tab and copy the
   **Client secret** value.
@y
1. In the top-left corner, select the realm drop-down and create a realm named
   `keycloaktcdemo`.
2. Under the `keycloaktcdemo` realm, create a client with the following
   settings:
   - **Client ID**: `product-service`
   - **Client Authentication**: **On**
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
