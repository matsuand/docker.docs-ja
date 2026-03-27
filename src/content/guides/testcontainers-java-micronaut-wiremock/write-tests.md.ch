%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Write tests with WireMock and Testcontainers
linkTitle: Write tests
description: Test external REST API integrations using WireMock and the Testcontainers WireMock module.
@y
title: Write tests with WireMock and Testcontainers
linkTitle: Write tests
description: Test external REST API integrations using WireMock and the Testcontainers WireMock module.
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
## Test with WireMock's JUnit 5 extension
@y
## Test with WireMock's JUnit 5 extension
@z

@x
The first approach uses WireMock's `WireMockExtension` to start an in-process
WireMock server on a dynamic port.
@y
The first approach uses WireMock's `WireMockExtension` to start an in-process
WireMock server on a dynamic port.
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
@y
import static com.github.tomakehurst.wiremock.client.WireMock.aResponse;
import static com.github.tomakehurst.wiremock.client.WireMock.urlMatching;
import static com.github.tomakehurst.wiremock.core.WireMockConfiguration.wireMockConfig;
import static io.restassured.RestAssured.given;
import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.Matchers.hasSize;
@z

@x
import com.github.tomakehurst.wiremock.client.WireMock;
import com.github.tomakehurst.wiremock.junit5.WireMockExtension;
import io.micronaut.context.ApplicationContext;
import io.micronaut.http.MediaType;
import io.micronaut.runtime.server.EmbeddedServer;
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import java.util.Collections;
import java.util.Map;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.RegisterExtension;
@y
import com.github.tomakehurst.wiremock.client.WireMock;
import com.github.tomakehurst.wiremock.junit5.WireMockExtension;
import io.micronaut.context.ApplicationContext;
import io.micronaut.http.MediaType;
import io.micronaut.runtime.server.EmbeddedServer;
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import java.util.Collections;
import java.util.Map;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.RegisterExtension;
@z

@x
class AlbumControllerTest {
@y
class AlbumControllerTest {
@z

@x
    @RegisterExtension
    static WireMockExtension wireMock = WireMockExtension.newInstance()
            .options(wireMockConfig().dynamicPort())
            .build();
@y
    @RegisterExtension
    static WireMockExtension wireMock = WireMockExtension.newInstance()
            .options(wireMockConfig().dynamicPort())
            .build();
@z

@x
    private Map<String, Object> getProperties() {
        return Collections.singletonMap("micronaut.http.services.photosapi.url", wireMock.baseUrl());
    }
@y
    private Map<String, Object> getProperties() {
        return Collections.singletonMap("micronaut.http.services.photosapi.url", wireMock.baseUrl());
    }
@z

@x
    @Test
    void shouldGetAlbumById() {
        try (EmbeddedServer server = ApplicationContext.run(EmbeddedServer.class, getProperties())) {
            RestAssured.port = server.getPort();
            Long albumId = 1L;
            String responseJson =
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
            """;
            wireMock.stubFor(WireMock.get(urlMatching("/albums/" + albumId + "/photos"))
                    .willReturn(aResponse()
                            .withHeader("Content-Type", MediaType.APPLICATION_JSON)
                            .withBody(responseJson)));
@y
    @Test
    void shouldGetAlbumById() {
        try (EmbeddedServer server = ApplicationContext.run(EmbeddedServer.class, getProperties())) {
            RestAssured.port = server.getPort();
            Long albumId = 1L;
            String responseJson =
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
            """;
            wireMock.stubFor(WireMock.get(urlMatching("/albums/" + albumId + "/photos"))
                    .willReturn(aResponse()
                            .withHeader("Content-Type", MediaType.APPLICATION_JSON)
                            .withBody(responseJson)));
@z

@x
            given().contentType(ContentType.JSON)
                    .when()
                    .get("/api/albums/{albumId}", albumId)
                    .then()
                    .statusCode(200)
                    .body("albumId", is(albumId.intValue()))
                    .body("photos", hasSize(2));
        }
    }
@y
            given().contentType(ContentType.JSON)
                    .when()
                    .get("/api/albums/{albumId}", albumId)
                    .then()
                    .statusCode(200)
                    .body("albumId", is(albumId.intValue()))
                    .body("photos", hasSize(2));
        }
    }
@z

@x
    @Test
    void shouldReturnServerErrorWhenPhotoServiceCallFailed() {
        try (EmbeddedServer server = ApplicationContext.run(EmbeddedServer.class, getProperties())) {
            RestAssured.port = server.getPort();
            Long albumId = 2L;
            wireMock.stubFor(WireMock.get(urlMatching("/albums/" + albumId + "/photos"))
                    .willReturn(aResponse().withStatus(500)));
@y
    @Test
    void shouldReturnServerErrorWhenPhotoServiceCallFailed() {
        try (EmbeddedServer server = ApplicationContext.run(EmbeddedServer.class, getProperties())) {
            RestAssured.port = server.getPort();
            Long albumId = 2L;
            wireMock.stubFor(WireMock.get(urlMatching("/albums/" + albumId + "/photos"))
                    .willReturn(aResponse().withStatus(500)));
@z

@x
            given().contentType(ContentType.JSON)
                    .when()
                    .get("/api/albums/{albumId}", albumId)
                    .then()
                    .statusCode(500);
        }
    }
}
```
@y
            given().contentType(ContentType.JSON)
                    .when()
                    .get("/api/albums/{albumId}", albumId)
                    .then()
                    .statusCode(500);
        }
    }
}
```
@z

@x
Here's what this test does:
@y
Here's what this test does:
@z

@x
- `WireMockExtension` starts a WireMock server on a dynamic port.
- The `getProperties()` method overrides `micronaut.http.services.photosapi.url`
  to point at the WireMock endpoint, so the application talks to WireMock
  instead of the real photo service.
- `shouldGetAlbumById()` configures a mock response for
  `/albums/{albumId}/photos`, sends a request to the application's
  `/api/albums/{albumId}` endpoint, and verifies the response body.
- `shouldReturnServerErrorWhenPhotoServiceCallFailed()` configures WireMock to
  return a 500 status and verifies the application propagates that error.
@y
- `WireMockExtension` starts a WireMock server on a dynamic port.
- The `getProperties()` method overrides `micronaut.http.services.photosapi.url`
  to point at the WireMock endpoint, so the application talks to WireMock
  instead of the real photo service.
- `shouldGetAlbumById()` configures a mock response for
  `/albums/{albumId}/photos`, sends a request to the application's
  `/api/albums/{albumId}` endpoint, and verifies the response body.
- `shouldReturnServerErrorWhenPhotoServiceCallFailed()` configures WireMock to
  return a 500 status and verifies the application propagates that error.
@z

@x
## Stub using JSON mapping files
@y
## Stub using JSON mapping files
@z

@x
Instead of stubbing with the WireMock Java API, you can use JSON mapping-based
configuration.
@y
Instead of stubbing with the WireMock Java API, you can use JSON mapping-based
configuration.
@z

@x
Create `src/test/resources/wiremock/mappings/get-album-photos.json`:
@y
Create `src/test/resources/wiremock/mappings/get-album-photos.json`:
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
Create `src/test/resources/wiremock/__files/album-photos-resp-200.json`:
@y
Create `src/test/resources/wiremock/__files/album-photos-resp-200.json`:
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
Then initialize WireMock to load stub mappings from these files:
@y
Then initialize WireMock to load stub mappings from these files:
@z

@x
```java
@RegisterExtension
static WireMockExtension wireMock = WireMockExtension.newInstance()
     .options(
         wireMockConfig()
            .dynamicPort()
            .usingFilesUnderClasspath("wiremock")
    )
    .build();
```
@y
```java
@RegisterExtension
static WireMockExtension wireMock = WireMockExtension.newInstance()
     .options(
         wireMockConfig()
            .dynamicPort()
            .usingFilesUnderClasspath("wiremock")
    )
    .build();
```
@z

@x
With mapping files-based stubbing in place, write tests without needing
programmatic stubs:
@y
With mapping files-based stubbing in place, write tests without needing
programmatic stubs:
@z

@x
```java
@Test
void shouldGetAlbumById() {
    Long albumId = 1L;
    try (EmbeddedServer server = ApplicationContext.run(EmbeddedServer.class, getProperties())) {
        RestAssured.port = server.getPort();
@y
```java
@Test
void shouldGetAlbumById() {
    Long albumId = 1L;
    try (EmbeddedServer server = ApplicationContext.run(EmbeddedServer.class, getProperties())) {
        RestAssured.port = server.getPort();
@z

@x
        given().contentType(ContentType.JSON)
                .when()
                .get("/api/albums/{albumId}", albumId)
                .then()
                .statusCode(200)
                .body("albumId", is(albumId.intValue()))
                .body("photos", hasSize(2));
    }
}
```
@y
        given().contentType(ContentType.JSON)
                .when()
                .get("/api/albums/{albumId}", albumId)
                .then()
                .statusCode(200)
                .body("albumId", is(albumId.intValue()))
                .body("photos", hasSize(2));
    }
}
```
@z

@x
## Use the Testcontainers WireMock module
@y
## Use the Testcontainers WireMock module
@z

@x
The [Testcontainers WireMock module](https://testcontainers.com/modules/wiremock/)
provisions a WireMock server as a standalone container within your tests, based
on [WireMock Docker](https://github.com/wiremock/wiremock-docker).
@y
The [Testcontainers WireMock module](https://testcontainers.com/modules/wiremock/)
provisions a WireMock server as a standalone container within your tests, based
on [WireMock Docker](https://github.com/wiremock/wiremock-docker).
@z

@x
Create `src/test/resources/mocks-config.json` with the stub mappings:
@y
Create `src/test/resources/mocks-config.json` with the stub mappings:
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
Create `src/test/resources/album-photos-response.json`:
@y
Create `src/test/resources/album-photos-response.json`:
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
import static org.hamcrest.Matchers.nullValue;
@y
import static io.restassured.RestAssured.given;
import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.Matchers.hasSize;
import static org.hamcrest.Matchers.nullValue;
@z

@x
import io.micronaut.context.ApplicationContext;
import io.micronaut.core.annotation.NonNull;
import io.micronaut.runtime.server.EmbeddedServer;
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import java.util.Collections;
import java.util.Map;
import org.junit.jupiter.api.Test;
import org.testcontainers.junit.jupiter.Container;
import org.testcontainers.junit.jupiter.Testcontainers;
import org.wiremock.integrations.testcontainers.WireMockContainer;
@y
import io.micronaut.context.ApplicationContext;
import io.micronaut.core.annotation.NonNull;
import io.micronaut.runtime.server.EmbeddedServer;
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import java.util.Collections;
import java.util.Map;
import org.junit.jupiter.api.Test;
import org.testcontainers.junit.jupiter.Container;
import org.testcontainers.junit.jupiter.Testcontainers;
import org.wiremock.integrations.testcontainers.WireMockContainer;
@z

@x
@Testcontainers(disabledWithoutDocker = true)
class AlbumControllerTestcontainersTests {
@y
@Testcontainers(disabledWithoutDocker = true)
class AlbumControllerTestcontainersTests {
@z

@x
    @Container
    static WireMockContainer wiremockServer = new WireMockContainer("wiremock/wiremock:2.35.0")
            .withMappingFromResource("mocks-config.json")
            .withFileFromResource("album-photos-response.json");
@y
    @Container
    static WireMockContainer wiremockServer = new WireMockContainer("wiremock/wiremock:2.35.0")
            .withMappingFromResource("mocks-config.json")
            .withFileFromResource("album-photos-response.json");
@z

@x
    @NonNull public Map<String, Object> getProperties() {
        return Collections.singletonMap("micronaut.http.services.photosapi.url", wiremockServer.getBaseUrl());
    }
@y
    @NonNull public Map<String, Object> getProperties() {
        return Collections.singletonMap("micronaut.http.services.photosapi.url", wiremockServer.getBaseUrl());
    }
@z

@x
    @Test
    void shouldGetAlbumById() {
        Long albumId = 1L;
        try (EmbeddedServer server = ApplicationContext.run(EmbeddedServer.class, getProperties())) {
            RestAssured.port = server.getPort();
@y
    @Test
    void shouldGetAlbumById() {
        Long albumId = 1L;
        try (EmbeddedServer server = ApplicationContext.run(EmbeddedServer.class, getProperties())) {
            RestAssured.port = server.getPort();
@z

@x
            given().contentType(ContentType.JSON)
                    .when()
                    .get("/api/albums/{albumId}", albumId)
                    .then()
                    .statusCode(200)
                    .body("albumId", is(albumId.intValue()))
                    .body("photos", hasSize(2));
        }
    }
@y
            given().contentType(ContentType.JSON)
                    .when()
                    .get("/api/albums/{albumId}", albumId)
                    .then()
                    .statusCode(200)
                    .body("albumId", is(albumId.intValue()))
                    .body("photos", hasSize(2));
        }
    }
@z

@x
    @Test
    void shouldReturnServerErrorWhenPhotoServiceCallFailed() {
        Long albumId = 2L;
        try (EmbeddedServer server = ApplicationContext.run(EmbeddedServer.class, getProperties())) {
            RestAssured.port = server.getPort();
            given().contentType(ContentType.JSON)
                    .when()
                    .get("/api/albums/{albumId}", albumId)
                    .then()
                    .statusCode(500);
        }
    }
@y
    @Test
    void shouldReturnServerErrorWhenPhotoServiceCallFailed() {
        Long albumId = 2L;
        try (EmbeddedServer server = ApplicationContext.run(EmbeddedServer.class, getProperties())) {
            RestAssured.port = server.getPort();
            given().contentType(ContentType.JSON)
                    .when()
                    .get("/api/albums/{albumId}", albumId)
                    .then()
                    .statusCode(500);
        }
    }
@z

@x
    @Test
    void shouldReturnEmptyPhotos() {
        Long albumId = 3L;
        try (EmbeddedServer server = ApplicationContext.run(EmbeddedServer.class, getProperties())) {
            RestAssured.port = server.getPort();
            given().contentType(ContentType.JSON)
                    .when()
                    .get("/api/albums/{albumId}", albumId)
                    .then()
                    .statusCode(200)
                    .body("albumId", is(albumId.intValue()))
                    .body("photos", nullValue());
        }
    }
}
```
@y
    @Test
    void shouldReturnEmptyPhotos() {
        Long albumId = 3L;
        try (EmbeddedServer server = ApplicationContext.run(EmbeddedServer.class, getProperties())) {
            RestAssured.port = server.getPort();
            given().contentType(ContentType.JSON)
                    .when()
                    .get("/api/albums/{albumId}", albumId)
                    .then()
                    .statusCode(200)
                    .body("albumId", is(albumId.intValue()))
                    .body("photos", nullValue());
        }
    }
}
```
@z

@x
Here's what this test does:
@y
Here's what this test does:
@z

@x
- `@Testcontainers` and `@Container` annotations start a `WireMockContainer`
  using the `wiremock/wiremock:2.35.0` Docker image.
- `withMappingFromResource("mocks-config.json")` loads stub mappings from the
  classpath resource.
- `withFileFromResource("album-photos-response.json")` makes the response body
  file available to WireMock.
- `getProperties()` overrides the photo service URL to point at the WireMock
  container's base URL.
- `shouldGetAlbumById()` verifies that the application returns the expected
  album with two photos.
- `shouldReturnServerErrorWhenPhotoServiceCallFailed()` verifies that a 500
  from the photo service propagates to the caller.
- `shouldReturnEmptyPhotos()` verifies the application handles an empty photo
  list.
@y
- `@Testcontainers` and `@Container` annotations start a `WireMockContainer`
  using the `wiremock/wiremock:2.35.0` Docker image.
- `withMappingFromResource("mocks-config.json")` loads stub mappings from the
  classpath resource.
- `withFileFromResource("album-photos-response.json")` makes the response body
  file available to WireMock.
- `getProperties()` overrides the photo service URL to point at the WireMock
  container's base URL.
- `shouldGetAlbumById()` verifies that the application returns the expected
  album with two photos.
- `shouldReturnServerErrorWhenPhotoServiceCallFailed()` verifies that a 500
  from the photo service propagates to the caller.
- `shouldReturnEmptyPhotos()` verifies the application handles an empty photo
  list.
@z
