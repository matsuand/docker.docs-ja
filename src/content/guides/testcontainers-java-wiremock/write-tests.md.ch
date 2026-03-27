%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Write tests with WireMock and Testcontainers
linkTitle: Write tests
description: Test external REST API integrations using WireMock with both the JUnit 5 extension and the Testcontainers WireMock module.
@y
title: Write tests with WireMock and Testcontainers
linkTitle: Write tests
description: Test external REST API integrations using WireMock with both the JUnit 5 extension and the Testcontainers WireMock module.
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
## Test using WireMock JUnit 5 extension
@y
## Test using WireMock JUnit 5 extension
@z

@x
WireMock provides a JUnit 5 extension that starts an in-process WireMock server.
You can configure stub responses using the WireMock Java API.
@y
WireMock provides a JUnit 5 extension that starts an in-process WireMock server.
You can configure stub responses using the WireMock Java API.
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
import static com.github.tomakehurst.wiremock.client.WireMock.aResponse;
import static com.github.tomakehurst.wiremock.client.WireMock.urlMatching;
import static com.github.tomakehurst.wiremock.core.WireMockConfiguration.wireMockConfig;
import static io.restassured.RestAssured.given;
import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.Matchers.hasSize;
import static org.springframework.boot.test.context.SpringBootTest.WebEnvironment.RANDOM_PORT;
@y
import static com.github.tomakehurst.wiremock.client.WireMock.aResponse;
import static com.github.tomakehurst.wiremock.client.WireMock.urlMatching;
import static com.github.tomakehurst.wiremock.core.WireMockConfiguration.wireMockConfig;
import static io.restassured.RestAssured.given;
import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.Matchers.hasSize;
import static org.springframework.boot.test.context.SpringBootTest.WebEnvironment.RANDOM_PORT;
@z

@x
import com.github.tomakehurst.wiremock.client.WireMock;
import com.github.tomakehurst.wiremock.junit5.WireMockExtension;
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.RegisterExtension;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.http.MediaType;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;
@y
import com.github.tomakehurst.wiremock.client.WireMock;
import com.github.tomakehurst.wiremock.junit5.WireMockExtension;
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.RegisterExtension;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.http.MediaType;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;
@z

@x
@SpringBootTest(webEnvironment = RANDOM_PORT)
class AlbumControllerTest {
@y
@SpringBootTest(webEnvironment = RANDOM_PORT)
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
  @RegisterExtension
  static WireMockExtension wireMock = WireMockExtension
    .newInstance()
    .options(wireMockConfig().dynamicPort())
    .build();
@y
  @RegisterExtension
  static WireMockExtension wireMock = WireMockExtension
    .newInstance()
    .options(wireMockConfig().dynamicPort())
    .build();
@z

@x
  @DynamicPropertySource
  static void configureProperties(DynamicPropertyRegistry registry) {
    registry.add("photos.api.base-url", wireMock::baseUrl);
  }
@y
  @DynamicPropertySource
  static void configureProperties(DynamicPropertyRegistry registry) {
    registry.add("photos.api.base-url", wireMock::baseUrl);
  }
@z

@x
  @BeforeEach
  void setUp() {
    RestAssured.port = port;
  }
@y
  @BeforeEach
  void setUp() {
    RestAssured.port = port;
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
    wireMock.stubFor(
      WireMock
        .get(urlMatching("/albums/" + albumId + "/photos"))
        .willReturn(
          aResponse()
            .withHeader("Content-Type", MediaType.APPLICATION_JSON_VALUE)
            .withBody(
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
    wireMock.stubFor(
      WireMock
        .get(urlMatching("/albums/" + albumId + "/photos"))
        .willReturn(
          aResponse()
            .withHeader("Content-Type", MediaType.APPLICATION_JSON_VALUE)
            .withBody(
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
  }
@y
    given()
      .contentType(ContentType.JSON)
      .when()
      .get("/api/albums/{albumId}", albumId)
      .then()
      .statusCode(200)
      .body("albumId", is(albumId.intValue()))
      .body("photos", hasSize(2));
  }
@z

@x
  @Test
  void shouldReturnServerErrorWhenPhotoServiceCallFailed() {
    Long albumId = 2L;
    wireMock.stubFor(
      WireMock
        .get(urlMatching("/albums/" + albumId + "/photos"))
        .willReturn(aResponse().withStatus(500))
    );
@y
  @Test
  void shouldReturnServerErrorWhenPhotoServiceCallFailed() {
    Long albumId = 2L;
    wireMock.stubFor(
      WireMock
        .get(urlMatching("/albums/" + albumId + "/photos"))
        .willReturn(aResponse().withStatus(500))
    );
@z

@x
    given()
      .contentType(ContentType.JSON)
      .when()
      .get("/api/albums/{albumId}", albumId)
      .then()
      .statusCode(500);
  }
}
```
@y
    given()
      .contentType(ContentType.JSON)
      .when()
      .get("/api/albums/{albumId}", albumId)
      .then()
      .statusCode(500);
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
- `@RegisterExtension` creates a `WireMockExtension` that starts WireMock on a
  dynamic port.
- `@DynamicPropertySource` overrides `photos.api.base-url` to point at the
  WireMock endpoint, so the application talks to WireMock instead of the real
  photo service.
- `shouldGetAlbumById()` configures a stub response for
  `/albums/{albumId}/photos`, sends a request to the application's
  `/api/albums/{albumId}` endpoint, and verifies the response body.
- `shouldReturnServerErrorWhenPhotoServiceCallFailed()` configures WireMock to
  return a 500 status and verifies that the application propagates that status to
  the caller.
@y
- `@SpringBootTest` starts the full application on a random port.
- `@RegisterExtension` creates a `WireMockExtension` that starts WireMock on a
  dynamic port.
- `@DynamicPropertySource` overrides `photos.api.base-url` to point at the
  WireMock endpoint, so the application talks to WireMock instead of the real
  photo service.
- `shouldGetAlbumById()` configures a stub response for
  `/albums/{albumId}/photos`, sends a request to the application's
  `/api/albums/{albumId}` endpoint, and verifies the response body.
- `shouldReturnServerErrorWhenPhotoServiceCallFailed()` configures WireMock to
  return a 500 status and verifies that the application propagates that status to
  the caller.
@z

@x
## Stub using JSON mapping files
@y
## Stub using JSON mapping files
@z

@x
Instead of using the WireMock Java API, you can configure stubs with JSON
mapping files. Create
`src/test/resources/wiremock/mappings/get-album-photos.json`:
@y
Instead of using the WireMock Java API, you can configure stubs with JSON
mapping files. Create
`src/test/resources/wiremock/mappings/get-album-photos.json`:
@z

@x
```json
{
  "mappings": [
    {
      "request": {
        "method": "GET",
        "urlPattern": "/albums/([0-9]+)/photos"
      },
      "response": {
        "status": 200,
        "headers": {
          "Content-Type": "application/json"
        },
        "bodyFileName": "album-photos-resp-200.json"
      }
    },
    {
      "request": {
        "method": "GET",
        "urlPattern": "/albums/2/photos"
      },
      "response": {
        "status": 500,
        "headers": {
          "Content-Type": "application/json"
        }
      }
    },
    {
      "request": {
        "method": "GET",
        "urlPattern": "/albums/3/photos"
      },
      "response": {
        "status": 200,
        "headers": {
          "Content-Type": "application/json"
        },
        "jsonBody": []
      }
    }
  ]
}
```
@y
```json
{
  "mappings": [
    {
      "request": {
        "method": "GET",
        "urlPattern": "/albums/([0-9]+)/photos"
      },
      "response": {
        "status": 200,
        "headers": {
          "Content-Type": "application/json"
        },
        "bodyFileName": "album-photos-resp-200.json"
      }
    },
    {
      "request": {
        "method": "GET",
        "urlPattern": "/albums/2/photos"
      },
      "response": {
        "status": 500,
        "headers": {
          "Content-Type": "application/json"
        }
      }
    },
    {
      "request": {
        "method": "GET",
        "urlPattern": "/albums/3/photos"
      },
      "response": {
        "status": 200,
        "headers": {
          "Content-Type": "application/json"
        },
        "jsonBody": []
      }
    }
  ]
}
```
@z

@x
Create the response body file at
`src/test/resources/wiremock/__files/album-photos-resp-200.json`:
@y
Create the response body file at
`src/test/resources/wiremock/__files/album-photos-resp-200.json`:
@z

@x
```json
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
```
@y
```json
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
```
@z

@x
Initialize WireMock to load stubs from the mapping files:
@y
Initialize WireMock to load stubs from the mapping files:
@z

@x
```java
@RegisterExtension
static WireMockExtension wireMockServer = WireMockExtension
  .newInstance()
  .options(
    wireMockConfig().dynamicPort().usingFilesUnderClasspath("wiremock")
  )
  .build();
```
@y
```java
@RegisterExtension
static WireMockExtension wireMockServer = WireMockExtension
  .newInstance()
  .options(
    wireMockConfig().dynamicPort().usingFilesUnderClasspath("wiremock")
  )
  .build();
```
@z

@x
With mapping-based stubs in place, create
`AlbumControllerWireMockMappingTests.java`:
@y
With mapping-based stubs in place, create
`AlbumControllerWireMockMappingTests.java`:
@z

@x
```java
package com.testcontainers.demo;
@y
```java
package com.testcontainers.demo;
@z

@x
import static com.github.tomakehurst.wiremock.core.WireMockConfiguration.wireMockConfig;
import static io.restassured.RestAssured.given;
import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.Matchers.hasSize;
import static org.springframework.boot.test.context.SpringBootTest.WebEnvironment.RANDOM_PORT;
@y
import static com.github.tomakehurst.wiremock.core.WireMockConfiguration.wireMockConfig;
import static io.restassured.RestAssured.given;
import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.Matchers.hasSize;
import static org.springframework.boot.test.context.SpringBootTest.WebEnvironment.RANDOM_PORT;
@z

@x
import com.github.tomakehurst.wiremock.junit5.WireMockExtension;
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.RegisterExtension;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;
@y
import com.github.tomakehurst.wiremock.junit5.WireMockExtension;
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.RegisterExtension;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;
@z

@x
@SpringBootTest(webEnvironment = RANDOM_PORT)
class AlbumControllerWireMockMappingTests {
@y
@SpringBootTest(webEnvironment = RANDOM_PORT)
class AlbumControllerWireMockMappingTests {
@z

@x
  @LocalServerPort
  private Integer port;
@y
  @LocalServerPort
  private Integer port;
@z

@x
  @RegisterExtension
  static WireMockExtension wireMockServer = WireMockExtension
    .newInstance()
    .options(
      wireMockConfig().dynamicPort().usingFilesUnderClasspath("wiremock")
    )
    .build();
@y
  @RegisterExtension
  static WireMockExtension wireMockServer = WireMockExtension
    .newInstance()
    .options(
      wireMockConfig().dynamicPort().usingFilesUnderClasspath("wiremock")
    )
    .build();
@z

@x
  @DynamicPropertySource
  static void configureProperties(DynamicPropertyRegistry registry) {
    registry.add("photos.api.base-url", wireMockServer::baseUrl);
  }
@y
  @DynamicPropertySource
  static void configureProperties(DynamicPropertyRegistry registry) {
    registry.add("photos.api.base-url", wireMockServer::baseUrl);
  }
@z

@x
  @BeforeEach
  void setUp() {
    RestAssured.port = port;
  }
@y
  @BeforeEach
  void setUp() {
    RestAssured.port = port;
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
    given()
      .contentType(ContentType.JSON)
      .when()
      .get("/api/albums/{albumId}", albumId)
      .then()
      .statusCode(200)
      .body("albumId", is(albumId.intValue()))
      .body("photos", hasSize(2));
  }
@y
    given()
      .contentType(ContentType.JSON)
      .when()
      .get("/api/albums/{albumId}", albumId)
      .then()
      .statusCode(200)
      .body("albumId", is(albumId.intValue()))
      .body("photos", hasSize(2));
  }
@z

@x
  @Test
  void shouldReturnServerErrorWhenPhotoServiceCallFailed() {
    Long albumId = 2L;
@y
  @Test
  void shouldReturnServerErrorWhenPhotoServiceCallFailed() {
    Long albumId = 2L;
@z

@x
    given()
      .contentType(ContentType.JSON)
      .when()
      .get("/api/albums/{albumId}", albumId)
      .then()
      .statusCode(500);
  }
@y
    given()
      .contentType(ContentType.JSON)
      .when()
      .get("/api/albums/{albumId}", albumId)
      .then()
      .statusCode(500);
  }
@z

@x
  @Test
  void shouldReturnEmptyPhotos() {
    Long albumId = 3L;
@y
  @Test
  void shouldReturnEmptyPhotos() {
    Long albumId = 3L;
@z

@x
    given()
      .contentType(ContentType.JSON)
      .when()
      .get("/api/albums/{albumId}", albumId)
      .then()
      .statusCode(200)
      .body("albumId", is(albumId.intValue()))
      .body("photos", hasSize(0));
  }
}
```
@y
    given()
      .contentType(ContentType.JSON)
      .when()
      .get("/api/albums/{albumId}", albumId)
      .then()
      .statusCode(200)
      .body("albumId", is(albumId.intValue()))
      .body("photos", hasSize(0));
  }
}
```
@z

@x
The tests don't need inline stub definitions because WireMock loads the mappings
automatically from the classpath.
@y
The tests don't need inline stub definitions because WireMock loads the mappings
automatically from the classpath.
@z

@x
## Test using the Testcontainers WireMock module
@y
## Test using the Testcontainers WireMock module
@z

@x
The [Testcontainers WireMock module](https://testcontainers.com/modules/wiremock/)
provisions WireMock as a standalone Docker container, based on
[WireMock Docker](https://github.com/wiremock/wiremock-docker). This approach is
useful when you want complete isolation between the test JVM and the mock server.
@y
The [Testcontainers WireMock module](https://testcontainers.com/modules/wiremock/)
provisions WireMock as a standalone Docker container, based on
[WireMock Docker](https://github.com/wiremock/wiremock-docker). This approach is
useful when you want complete isolation between the test JVM and the mock server.
@z

@x
Create a mock configuration file at
`src/test/resources/com/testcontainers/demo/AlbumControllerTestcontainersTests/mocks-config.json`:
@y
Create a mock configuration file at
`src/test/resources/com/testcontainers/demo/AlbumControllerTestcontainersTests/mocks-config.json`:
@z

@x
```json
{
  "mappings": [
    {
      "request": {
        "method": "GET",
        "urlPattern": "/albums/([0-9]+)/photos"
      },
      "response": {
        "status": 200,
        "headers": {
          "Content-Type": "application/json"
        },
        "bodyFileName": "album-photos-response.json"
      }
    },
    {
      "request": {
        "method": "GET",
        "urlPattern": "/albums/2/photos"
      },
      "response": {
        "status": 500,
        "headers": {
          "Content-Type": "application/json"
        }
      }
    },
    {
      "request": {
        "method": "GET",
        "urlPattern": "/albums/3/photos"
      },
      "response": {
        "status": 200,
        "headers": {
          "Content-Type": "application/json"
        },
        "jsonBody": []
      }
    }
  ]
}
```
@y
```json
{
  "mappings": [
    {
      "request": {
        "method": "GET",
        "urlPattern": "/albums/([0-9]+)/photos"
      },
      "response": {
        "status": 200,
        "headers": {
          "Content-Type": "application/json"
        },
        "bodyFileName": "album-photos-response.json"
      }
    },
    {
      "request": {
        "method": "GET",
        "urlPattern": "/albums/2/photos"
      },
      "response": {
        "status": 500,
        "headers": {
          "Content-Type": "application/json"
        }
      }
    },
    {
      "request": {
        "method": "GET",
        "urlPattern": "/albums/3/photos"
      },
      "response": {
        "status": 200,
        "headers": {
          "Content-Type": "application/json"
        },
        "jsonBody": []
      }
    }
  ]
}
```
@z

@x
Create the response body file at
`src/test/resources/com/testcontainers/demo/AlbumControllerTestcontainersTests/album-photos-response.json`:
@y
Create the response body file at
`src/test/resources/com/testcontainers/demo/AlbumControllerTestcontainersTests/album-photos-response.json`:
@z

@x
```json
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
```
@y
```json
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
```
@z

@x
Create `AlbumControllerTestcontainersTests.java`:
@y
Create `AlbumControllerTestcontainersTests.java`:
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
import static org.springframework.boot.test.context.SpringBootTest.WebEnvironment.RANDOM_PORT;
@y
import static io.restassured.RestAssured.given;
import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.Matchers.hasSize;
import static org.springframework.boot.test.context.SpringBootTest.WebEnvironment.RANDOM_PORT;
@z

@x
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;
import org.testcontainers.junit.jupiter.Container;
import org.testcontainers.junit.jupiter.Testcontainers;
import org.wiremock.integrations.testcontainers.WireMockContainer;
@y
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;
import org.testcontainers.junit.jupiter.Container;
import org.testcontainers.junit.jupiter.Testcontainers;
import org.wiremock.integrations.testcontainers.WireMockContainer;
@z

@x
@SpringBootTest(webEnvironment = RANDOM_PORT)
@Testcontainers
class AlbumControllerTestcontainersTests {
@y
@SpringBootTest(webEnvironment = RANDOM_PORT)
@Testcontainers
class AlbumControllerTestcontainersTests {
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
  static WireMockContainer wiremockServer = new WireMockContainer(
    "wiremock/wiremock:3.6.0"
  )
    .withMapping(
      "photos-by-album",
      AlbumControllerTestcontainersTests.class,
      "mocks-config.json"
    )
    .withFileFromResource(
      "album-photos-response.json",
      AlbumControllerTestcontainersTests.class,
      "album-photos-response.json"
    );
@y
  @Container
  static WireMockContainer wiremockServer = new WireMockContainer(
    "wiremock/wiremock:3.6.0"
  )
    .withMapping(
      "photos-by-album",
      AlbumControllerTestcontainersTests.class,
      "mocks-config.json"
    )
    .withFileFromResource(
      "album-photos-response.json",
      AlbumControllerTestcontainersTests.class,
      "album-photos-response.json"
    );
@z

@x
  @DynamicPropertySource
  static void configureProperties(DynamicPropertyRegistry registry) {
    registry.add("photos.api.base-url", wiremockServer::getBaseUrl);
  }
@y
  @DynamicPropertySource
  static void configureProperties(DynamicPropertyRegistry registry) {
    registry.add("photos.api.base-url", wiremockServer::getBaseUrl);
  }
@z

@x
  @BeforeEach
  void setUp() {
    RestAssured.port = port;
  }
@y
  @BeforeEach
  void setUp() {
    RestAssured.port = port;
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
    given()
      .contentType(ContentType.JSON)
      .when()
      .get("/api/albums/{albumId}", albumId)
      .then()
      .statusCode(200)
      .body("albumId", is(albumId.intValue()))
      .body("photos", hasSize(2));
  }
@y
    given()
      .contentType(ContentType.JSON)
      .when()
      .get("/api/albums/{albumId}", albumId)
      .then()
      .statusCode(200)
      .body("albumId", is(albumId.intValue()))
      .body("photos", hasSize(2));
  }
@z

@x
  @Test
  void shouldReturnServerErrorWhenPhotoServiceCallFailed() {
    Long albumId = 2L;
@y
  @Test
  void shouldReturnServerErrorWhenPhotoServiceCallFailed() {
    Long albumId = 2L;
@z

@x
    given()
      .contentType(ContentType.JSON)
      .when()
      .get("/api/albums/{albumId}", albumId)
      .then()
      .statusCode(500);
  }
@y
    given()
      .contentType(ContentType.JSON)
      .when()
      .get("/api/albums/{albumId}", albumId)
      .then()
      .statusCode(500);
  }
@z

@x
  @Test
  void shouldReturnEmptyPhotos() {
    Long albumId = 3L;
@y
  @Test
  void shouldReturnEmptyPhotos() {
    Long albumId = 3L;
@z

@x
    given()
      .contentType(ContentType.JSON)
      .when()
      .get("/api/albums/{albumId}", albumId)
      .then()
      .statusCode(200)
      .body("albumId", is(albumId.intValue()))
      .body("photos", hasSize(0));
  }
}
```
@y
    given()
      .contentType(ContentType.JSON)
      .when()
      .get("/api/albums/{albumId}", albumId)
      .then()
      .statusCode(200)
      .body("albumId", is(albumId.intValue()))
      .body("photos", hasSize(0));
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
- The `@Testcontainers` and `@Container` annotations start a
  `WireMockContainer` using the `wiremock/wiremock:3.6.0` Docker image.
- `withMapping()` loads stub mappings from `mocks-config.json`, and
  `withFileFromResource()` loads the response body file.
- `@DynamicPropertySource` overrides `photos.api.base-url` to point at the
  WireMock container's base URL.
- The tests don't contain inline stub definitions because WireMock loads them
  from the JSON configuration files.
@y
- The `@Testcontainers` and `@Container` annotations start a
  `WireMockContainer` using the `wiremock/wiremock:3.6.0` Docker image.
- `withMapping()` loads stub mappings from `mocks-config.json`, and
  `withFileFromResource()` loads the response body file.
- `@DynamicPropertySource` overrides `photos.api.base-url` to point at the
  WireMock container's base URL.
- The tests don't contain inline stub definitions because WireMock loads them
  from the JSON configuration files.
@z
