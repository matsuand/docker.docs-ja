%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Testing REST API integrations using MockServer
linkTitle: MockServer
description: Learn how to test REST API integrations in a Spring Boot application using the Testcontainers MockServer module.
keywords: testcontainers, java, spring boot, testing, mockserver, rest api, rest assured
summary: |
  Learn how to create a Spring Boot application that integrates with
  external REST APIs, then test those integrations using Testcontainers
  and MockServer.
@y
title: Testing REST API integrations using MockServer
linkTitle: MockServer
description: Learn how to test REST API integrations in a Spring Boot application using the Testcontainers MockServer module.
keywords: testcontainers, java, spring boot, testing, mockserver, rest api, rest assured
summary: |
  Learn how to create a Spring Boot application that integrates with
  external REST APIs, then test those integrations using Testcontainers
  and MockServer.
@z

@x
  time: 20 minutes
@y
  time: 20 分
@z

@x
<!-- Source: https://github.com/testcontainers/tc-guide-testing-rest-api-integrations-using-mockserver -->
@y
<!-- Source: https://github.com/testcontainers/tc-guide-testing-rest-api-integrations-using-mockserver -->
@z

@x
In this guide, you will learn how to:
@y
In this guide, you will learn how to:
@z

@x
- Create a Spring Boot application that talks to external REST APIs
- Test external API integrations using the Testcontainers MockServer module
@y
- Create a Spring Boot application that talks to external REST APIs
- Test external API integrations using the Testcontainers MockServer module
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
by selecting the **Spring Web**, **Spring Reactive Web**, and **Testcontainers**
starters.
@y
Create a Spring Boot project from [Spring Initializr](https://start.spring.io)
by selecting the **Spring Web**, **Spring Reactive Web**, and **Testcontainers**
starters.
@z

@x
Alternatively, clone the
[guide repository](https://github.com/testcontainers/tc-guide-testing-rest-api-integrations-using-mockserver).
@y
Alternatively, clone the
[guide repository](https://github.com/testcontainers/tc-guide-testing-rest-api-integrations-using-mockserver).
@z

@x
After generating the project, add the **REST Assured** and **MockServer**
libraries as test dependencies. The key dependencies in `pom.xml` are:
@y
After generating the project, add the **REST Assured** and **MockServer**
libraries as test dependencies. The key dependencies in `pom.xml` are:
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
        <artifactId>spring-boot-starter-webflux</artifactId>
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
        <artifactId>testcontainers-mockserver</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.mock-server</groupId>
        <artifactId>mockserver-netty</artifactId>
        <version>5.15.0</version>
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
        <artifactId>spring-boot-starter-webflux</artifactId>
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
        <artifactId>testcontainers-mockserver</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.mock-server</groupId>
        <artifactId>mockserver-netty</artifactId>
        <version>5.15.0</version>
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
This guide builds an application that manages video albums. A third-party REST
API handles photo assets. For demonstration purposes, the application uses the
publicly available [JSONPlaceholder](https://jsonplaceholder.typicode.com/) API
as a photo service.
@y
This guide builds an application that manages video albums. A third-party REST
API handles photo assets. For demonstration purposes, the application uses the
publicly available [JSONPlaceholder](https://jsonplaceholder.typicode.com/) API
as a photo service.
@z

@x
The application exposes a `GET /api/albums/{albumId}` endpoint that calls the
photo service to fetch photos for a given album.
[MockServer](https://www.mock-server.com/) is a library for mocking HTTP-based
services. Testcontainers provides a
[MockServer module](https://java.testcontainers.org/modules/mockserver/) that
runs MockServer as a Docker container.
@y
The application exposes a `GET /api/albums/{albumId}` endpoint that calls the
photo service to fetch photos for a given album.
[MockServer](https://www.mock-server.com/) is a library for mocking HTTP-based
services. Testcontainers provides a
[MockServer module](https://java.testcontainers.org/modules/mockserver/) that
runs MockServer as a Docker container.
@z

@x
### Create the Album and Photo models
@y
### Create the Album and Photo models
@z

@x
Create `Album.java` using Java records:
@y
Create `Album.java` using Java records:
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
@y
import java.util.List;
@z

@x
public record Album(Long albumId, List<Photo> photos) {}
@y
public record Album(Long albumId, List<Photo> photos) {}
@z

@x
record Photo(Long id, String title, String url, String thumbnailUrl) {}
```
@y
record Photo(Long id, String title, String url, String thumbnailUrl) {}
```
@z

@x
### Create the PhotoServiceClient interface
@y
### Create the PhotoServiceClient interface
@z

@x
Spring Framework 6 introduced
[declarative HTTP client support](https://docs.spring.io/spring-framework/reference/integration/rest-clients.html#rest-http-interface).
Create an interface with a method that fetches photos for a given album ID:
@y
Spring Framework 6 introduced
[declarative HTTP client support](https://docs.spring.io/spring-framework/reference/integration/rest-clients.html#rest-http-interface).
Create an interface with a method that fetches photos for a given album ID:
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.service.annotation.GetExchange;
@y
import java.util.List;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.service.annotation.GetExchange;
@z

@x
interface PhotoServiceClient {
  @GetExchange("/albums/{albumId}/photos")
  List<Photo> getPhotos(@PathVariable Long albumId);
}
```
@y
interface PhotoServiceClient {
  @GetExchange("/albums/{albumId}/photos")
  List<Photo> getPhotos(@PathVariable Long albumId);
}
```
@z

@x
### Register PhotoServiceClient as a bean
@y
### Register PhotoServiceClient as a bean
@z

@x
To generate a runtime implementation of `PhotoServiceClient`, register it as a
Spring bean using `HttpServiceProxyFactory`. The factory requires an
`HttpClientAdapter` implementation. Spring Boot provides `WebClientAdapter` as
part of the `spring-webflux` library:
@y
To generate a runtime implementation of `PhotoServiceClient`, register it as a
Spring bean using `HttpServiceProxyFactory`. The factory requires an
`HttpClientAdapter` implementation. Spring Boot provides `WebClientAdapter` as
part of the `spring-webflux` library:
@z

@x
```java
package com.testcontainers.demo;
@y
```java
package com.testcontainers.demo;
@z

@x
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.reactive.function.client.support.WebClientAdapter;
import org.springframework.web.service.invoker.HttpServiceProxyFactory;
@y
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.reactive.function.client.support.WebClientAdapter;
import org.springframework.web.service.invoker.HttpServiceProxyFactory;
@z

@x
@Configuration
public class AppConfig {
@y
@Configuration
public class AppConfig {
@z

@x
  @Bean
  public PhotoServiceClient photoServiceClient(
    @Value("${photos.api.base-url}") String photosApiBaseUrl
  ) {
    WebClient client = WebClient.builder().baseUrl(photosApiBaseUrl).build();
    HttpServiceProxyFactory factory = HttpServiceProxyFactory
      .builder(WebClientAdapter.forClient(client))
      .build();
    return factory.createClient(PhotoServiceClient.class);
  }
}
```
@y
  @Bean
  public PhotoServiceClient photoServiceClient(
    @Value("${photos.api.base-url}") String photosApiBaseUrl
  ) {
    WebClient client = WebClient.builder().baseUrl(photosApiBaseUrl).build();
    HttpServiceProxyFactory factory = HttpServiceProxyFactory
      .builder(WebClientAdapter.forClient(client))
      .build();
    return factory.createClient(PhotoServiceClient.class);
  }
}
```
@z

@x
The photo service base URL is externalized as a configuration property. Add the
following entry to `src/main/resources/application.properties`:
@y
The photo service base URL is externalized as a configuration property. Add the
following entry to `src/main/resources/application.properties`:
@z

@x
```properties
photos.api.base-url=https://jsonplaceholder.typicode.com
```
@y
```properties
photos.api.base-url=https://jsonplaceholder.typicode.com
```
@z

@x
### Create the REST API endpoint
@y
### Create the REST API endpoint
@z

@x
Create `AlbumController.java`:
@y
Create `AlbumController.java`:
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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.reactive.function.client.WebClientResponseException;
@y
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.reactive.function.client.WebClientResponseException;
@z

@x
@RestController
@RequestMapping("/api")
class AlbumController {
@y
@RestController
@RequestMapping("/api")
class AlbumController {
@z

@x
  private static final Logger logger = LoggerFactory.getLogger(
    AlbumController.class
  );
@y
  private static final Logger logger = LoggerFactory.getLogger(
    AlbumController.class
  );
@z

@x
  private final PhotoServiceClient photoServiceClient;
@y
  private final PhotoServiceClient photoServiceClient;
@z

@x
  AlbumController(PhotoServiceClient photoServiceClient) {
    this.photoServiceClient = photoServiceClient;
  }
@y
  AlbumController(PhotoServiceClient photoServiceClient) {
    this.photoServiceClient = photoServiceClient;
  }
@z

@x
  @GetMapping("/albums/{albumId}")
  public ResponseEntity<Album> getAlbumById(@PathVariable Long albumId) {
    try {
      List<Photo> photos = photoServiceClient.getPhotos(albumId);
      return ResponseEntity.ok(new Album(albumId, photos));
    } catch (WebClientResponseException e) {
      logger.error("Failed to get photos", e);
      return new ResponseEntity<>(e.getStatusCode());
    }
  }
}
```
@y
  @GetMapping("/albums/{albumId}")
  public ResponseEntity<Album> getAlbumById(@PathVariable Long albumId) {
    try {
      List<Photo> photos = photoServiceClient.getPhotos(albumId);
      return ResponseEntity.ok(new Album(albumId, photos));
    } catch (WebClientResponseException e) {
      logger.error("Failed to get photos", e);
      return new ResponseEntity<>(e.getStatusCode());
    }
  }
}
```
@z

@x
This endpoint calls the photo service for a given album ID and returns a
response like:
@y
This endpoint calls the photo service for a given album ID and returns a
response like:
@z

@x
```json
{
  "albumId": 1,
  "photos": [
    {
      "id": 51,
      "title": "non sunt voluptatem placeat consequuntur rem incidunt",
      "url": "https://via.placeholder.com/600/8e973b",
      "thumbnailUrl": "https://via.placeholder.com/150/8e973b"
    },
    {
      "id": 52,
      "title": "eveniet pariatur quia nobis reiciendis laboriosam ea",
      "url": "https://via.placeholder.com/600/121fa4",
      "thumbnailUrl": "https://via.placeholder.com/150/121fa4"
    }
  ]
}
```
@y
```json
{
  "albumId": 1,
  "photos": [
    {
      "id": 51,
      "title": "non sunt voluptatem placeat consequuntur rem incidunt",
      "url": "https://via.placeholder.com/600/8e973b",
      "thumbnailUrl": "https://via.placeholder.com/150/8e973b"
    },
    {
      "id": 52,
      "title": "eveniet pariatur quia nobis reiciendis laboriosam ea",
      "url": "https://via.placeholder.com/600/121fa4",
      "thumbnailUrl": "https://via.placeholder.com/150/121fa4"
    }
  ]
}
```
@z

@x
## Write tests with Testcontainers MockServer
@y
## Write tests with Testcontainers MockServer
@z

@x
Mocking external API interactions at the HTTP protocol level, rather than
mocking Java methods, lets you verify marshalling and unmarshalling behavior and
simulate network issues.
@y
Mocking external API interactions at the HTTP protocol level, rather than
mocking Java methods, lets you verify marshalling and unmarshalling behavior and
simulate network issues.
@z

@x
Testcontainers provides a MockServer module that starts a
[MockServer](https://www.mock-server.com/) instance inside a Docker container.
You can then use `MockServerClient` to configure mock expectations.
@y
Testcontainers provides a MockServer module that starts a
[MockServer](https://www.mock-server.com/) instance inside a Docker container.
You can then use `MockServerClient` to configure mock expectations.
@z

@x
### Write the test
@y
### Write the test
@z

@x
Create `AlbumControllerTest.java`:
@y
Create `AlbumControllerTest.java`:
@z

@x
```java
package com.testcontainers.demo;
@y
```java
package com.testcontainers.demo;
@z

@x
import static io.restassured.RestAssured.given;
import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.Matchers.hasSize;
import static org.mockserver.model.HttpRequest.request;
import static org.mockserver.model.HttpResponse.response;
import static org.mockserver.model.JsonBody.json;
@y
import static io.restassured.RestAssured.given;
import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.Matchers.hasSize;
import static org.mockserver.model.HttpRequest.request;
import static org.mockserver.model.HttpResponse.response;
import static org.mockserver.model.JsonBody.json;
@z

@x
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockserver.client.MockServerClient;
import org.mockserver.model.Header;
import org.mockserver.verify.VerificationTimes;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;
import org.testcontainers.mockserver.MockServerContainer;
import org.testcontainers.junit.jupiter.Container;
import org.testcontainers.junit.jupiter.Testcontainers;
@y
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockserver.client.MockServerClient;
import org.mockserver.model.Header;
import org.mockserver.verify.VerificationTimes;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;
import org.testcontainers.mockserver.MockServerContainer;
import org.testcontainers.junit.jupiter.Container;
import org.testcontainers.junit.jupiter.Testcontainers;
@z

@x
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@Testcontainers
class AlbumControllerTest {
@y
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@Testcontainers
class AlbumControllerTest {
@z

@x
  @LocalServerPort
  private Integer port;
@y
  @LocalServerPort
  private Integer port;
@z

@x
  @Container
  static MockServerContainer mockServerContainer =
    new MockServerContainer("mockserver/mockserver:5.15.0");
@y
  @Container
  static MockServerContainer mockServerContainer =
    new MockServerContainer("mockserver/mockserver:5.15.0");
@z

@x
  static MockServerClient mockServerClient;
@y
  static MockServerClient mockServerClient;
@z

@x
  @DynamicPropertySource
  static void overrideProperties(DynamicPropertyRegistry registry) {
    mockServerClient =
    new MockServerClient(
      mockServerContainer.getHost(),
      mockServerContainer.getServerPort()
    );
    registry.add("photos.api.base-url", mockServerContainer::getEndpoint);
  }
@y
  @DynamicPropertySource
  static void overrideProperties(DynamicPropertyRegistry registry) {
    mockServerClient =
    new MockServerClient(
      mockServerContainer.getHost(),
      mockServerContainer.getServerPort()
    );
    registry.add("photos.api.base-url", mockServerContainer::getEndpoint);
  }
@z

@x
  @BeforeEach
  void setUp() {
    RestAssured.port = port;
    mockServerClient.reset();
  }
@y
  @BeforeEach
  void setUp() {
    RestAssured.port = port;
    mockServerClient.reset();
  }
@z

@x
  @Test
  void shouldGetAlbumById() {
    Long albumId = 1L;
@y
  @Test
  void shouldGetAlbumById() {
    Long albumId = 1L;
@z

@x
    mockServerClient
      .when(
        request().withMethod("GET").withPath("/albums/" + albumId + "/photos")
      )
      .respond(
        response()
          .withStatusCode(200)
          .withHeaders(
            new Header("Content-Type", "application/json; charset=utf-8")
          )
          .withBody(
            json(
              """
              [
                   {
                       "id": 1,
                       "title": "accusamus beatae ad facilis cum similique qui sunt",
                       "url": "https://via.placeholder.com/600/92c952",
                       "thumbnailUrl": "https://via.placeholder.com/150/92c952"
                   },
                   {
                       "id": 2,
                       "title": "reprehenderit est deserunt velit ipsam",
                       "url": "https://via.placeholder.com/600/771796",
                       "thumbnailUrl": "https://via.placeholder.com/150/771796"
                   }
               ]
              """
            )
          )
      );
@y
    mockServerClient
      .when(
        request().withMethod("GET").withPath("/albums/" + albumId + "/photos")
      )
      .respond(
        response()
          .withStatusCode(200)
          .withHeaders(
            new Header("Content-Type", "application/json; charset=utf-8")
          )
          .withBody(
            json(
              """
              [
                   {
                       "id": 1,
                       "title": "accusamus beatae ad facilis cum similique qui sunt",
                       "url": "https://via.placeholder.com/600/92c952",
                       "thumbnailUrl": "https://via.placeholder.com/150/92c952"
                   },
                   {
                       "id": 2,
                       "title": "reprehenderit est deserunt velit ipsam",
                       "url": "https://via.placeholder.com/600/771796",
                       "thumbnailUrl": "https://via.placeholder.com/150/771796"
                   }
               ]
              """
            )
          )
      );
@z

@x
    given()
      .contentType(ContentType.JSON)
      .when()
      .get("/api/albums/{albumId}", albumId)
      .then()
      .statusCode(200)
      .body("albumId", is(albumId.intValue()))
      .body("photos", hasSize(2));
@y
    given()
      .contentType(ContentType.JSON)
      .when()
      .get("/api/albums/{albumId}", albumId)
      .then()
      .statusCode(200)
      .body("albumId", is(albumId.intValue()))
      .body("photos", hasSize(2));
@z

@x
    verifyMockServerRequest("GET", "/albums/" + albumId + "/photos", 1);
  }
@y
    verifyMockServerRequest("GET", "/albums/" + albumId + "/photos", 1);
  }
@z

@x
  @Test
  void shouldReturn404StatusWhenAlbumNotFound() {
    Long albumId = 1L;
    mockServerClient
      .when(
        request().withMethod("GET").withPath("/albums/" + albumId + "/photos")
      )
      .respond(response().withStatusCode(404));
@y
  @Test
  void shouldReturn404StatusWhenAlbumNotFound() {
    Long albumId = 1L;
    mockServerClient
      .when(
        request().withMethod("GET").withPath("/albums/" + albumId + "/photos")
      )
      .respond(response().withStatusCode(404));
@z

@x
    given()
      .contentType(ContentType.JSON)
      .when()
      .get("/api/albums/{albumId}", albumId)
      .then()
      .statusCode(404);
@y
    given()
      .contentType(ContentType.JSON)
      .when()
      .get("/api/albums/{albumId}", albumId)
      .then()
      .statusCode(404);
@z

@x
    verifyMockServerRequest("GET", "/albums/" + albumId + "/photos", 1);
  }
@y
    verifyMockServerRequest("GET", "/albums/" + albumId + "/photos", 1);
  }
@z

@x
  private void verifyMockServerRequest(String method, String path, int times) {
    mockServerClient.verify(
      request().withMethod(method).withPath(path),
      VerificationTimes.exactly(times)
    );
  }
}
```
@y
  private void verifyMockServerRequest(String method, String path, int times) {
    mockServerClient.verify(
      request().withMethod(method).withPath(path),
      VerificationTimes.exactly(times)
    );
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
- `@SpringBootTest` starts the full application on a random port.
- The `@Testcontainers` and `@Container` annotations start a
  `MockServerContainer` and create a `MockServerClient` connected to it.
- `@DynamicPropertySource` overrides `photos.api.base-url` to point at the
  MockServer endpoint, so the application talks to MockServer instead of the
  real photo service.
- `@BeforeEach` resets the `MockServerClient` before every test so that
  expectations from one test don't affect another.
- `shouldGetAlbumById()` configures a mock response for
  `/albums/{albumId}/photos`, sends a request to the application's
  `/api/albums/{albumId}` endpoint, and verifies the response body. It also
  uses `mockServerClient.verify()` to confirm that the expected API call
  reached MockServer.
- `shouldReturn404StatusWhenAlbumNotFound()` configures MockServer to return a
  404 status and verifies the application propagates that status to the caller.
@y
- `@SpringBootTest` starts the full application on a random port.
- The `@Testcontainers` and `@Container` annotations start a
  `MockServerContainer` and create a `MockServerClient` connected to it.
- `@DynamicPropertySource` overrides `photos.api.base-url` to point at the
  MockServer endpoint, so the application talks to MockServer instead of the
  real photo service.
- `@BeforeEach` resets the `MockServerClient` before every test so that
  expectations from one test don't affect another.
- `shouldGetAlbumById()` configures a mock response for
  `/albums/{albumId}/photos`, sends a request to the application's
  `/api/albums/{albumId}` endpoint, and verifies the response body. It also
  uses `mockServerClient.verify()` to confirm that the expected API call
  reached MockServer.
- `shouldReturn404StatusWhenAlbumNotFound()` configures MockServer to return a
  404 status and verifies the application propagates that status to the caller.
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
You should see the MockServer Docker container start in the console output. It
acts as the photo service, serving mock responses based on the configured
expectations. All tests should pass.
@y
You should see the MockServer Docker container start in the console output. It
acts as the photo service, serving mock responses based on the configured
expectations. All tests should pass.
@z

@x
### Summary
@y
### Summary
@z

@x
You built a Spring Boot application that integrates with an external REST API
using declarative HTTP clients, then tested that integration using the
Testcontainers MockServer module. Testing at the HTTP protocol level instead of
mocking Java methods lets you catch serialization issues and simulate realistic
failure scenarios.
@y
You built a Spring Boot application that integrates with an external REST API
using declarative HTTP clients, then tested that integration using the
Testcontainers MockServer module. Testing at the HTTP protocol level instead of
mocking Java methods lets you catch serialization issues and simulate realistic
failure scenarios.
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
- [Testcontainers MockServer module](https://java.testcontainers.org/modules/mockserver/)
- [MockServer documentation](https://www.mock-server.com/)
- [Testcontainers JUnit 5 quickstart](https://java.testcontainers.org/quickstart/junit_5_quickstart/)
@y
- [Testcontainers MockServer module](https://java.testcontainers.org/modules/mockserver/)
- [MockServer documentation](https://www.mock-server.com/)
- [Testcontainers JUnit 5 quickstart](https://java.testcontainers.org/quickstart/junit_5_quickstart/)
@z
