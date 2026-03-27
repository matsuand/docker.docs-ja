%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Write tests with Testcontainers MockServer
linkTitle: Write tests
description: Test external REST API integrations using the Testcontainers MockServer module and REST Assured.
@y
title: Write tests with Testcontainers MockServer
linkTitle: Write tests
description: Test external REST API integrations using the Testcontainers MockServer module and REST Assured.
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
## Write the test
@y
## Write the test
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
