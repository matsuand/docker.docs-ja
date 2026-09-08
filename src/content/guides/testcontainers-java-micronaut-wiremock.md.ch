%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対魚

@x
title: Testing REST API integrations in Micronaut apps using WireMock
linkTitle: Micronaut WireMock
description: Learn how to test REST API integrations in a Micronaut application using the Testcontainers WireMock module.
keywords: testcontainers, java, micronaut, testing, wiremock, rest api
summary: |
  Learn how to create a Micronaut application that integrates with
  external REST APIs, then test those integrations using WireMock
  and the Testcontainers WireMock module.
@y
title: Testing REST API integrations in Micronaut apps using WireMock
linkTitle: Micronaut WireMock
description: Learn how to test REST API integrations in a Micronaut application using the Testcontainers WireMock module.
keywords: testcontainers, java, micronaut, testing, wiremock, rest api
summary: |
  Learn how to create a Micronaut application that integrates with
  external REST APIs, then test those integrations using WireMock
  and the Testcontainers WireMock module.
@z

@x
  time: 20 minutes
@y
  time: 20 分
@z

@x
<!-- Source: https://github.com/testcontainers/tc-guide-testing-rest-api-integrations-in-micronaut-apps-using-wiremock -->
@y
<!-- Source: https://github.com/testcontainers/tc-guide-testing-rest-api-integrations-in-micronaut-apps-using-wiremock -->
@z

@x
In this guide, you'll learn how to:
@y
In this guide, you'll learn how to:
@z

@x
- Create a Micronaut application that talks to external REST APIs
- Test external API integrations using WireMock
- Use the Testcontainers WireMock module to run WireMock as a Docker container
@y
- Create a Micronaut application that talks to external REST APIs
- Test external API integrations using WireMock
- Use the Testcontainers WireMock module to run WireMock as a Docker container
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
## Create the Micronaut project
@y
## Create the Micronaut project
@z

@x
### Set up the project
@y
### Set up the project
@z

@x
Create a Micronaut project from [Micronaut Launch](https://micronaut.io/launch)
by selecting the **http-client**, **micronaut-test-rest-assured**, and
**testcontainers** features.
@y
Create a Micronaut project from [Micronaut Launch](https://micronaut.io/launch)
by selecting the **http-client**, **micronaut-test-rest-assured**, and
**testcontainers** features.
@z

@x
Alternatively, clone the
[guide repository](https://github.com/testcontainers/tc-guide-testing-rest-api-integrations-in-micronaut-apps-using-wiremock).
@y
Alternatively, clone the
[guide repository](https://github.com/testcontainers/tc-guide-testing-rest-api-integrations-in-micronaut-apps-using-wiremock).
@z

@x
After generating the project, add the **WireMock** and **Testcontainers
WireMock** libraries as test dependencies. The key dependencies in `pom.xml`
are:
@y
After generating the project, add the **WireMock** and **Testcontainers
WireMock** libraries as test dependencies. The key dependencies in `pom.xml`
are:
@z

@x
```xml
<parent>
    <groupId>io.micronaut.platform</groupId>
    <artifactId>micronaut-parent</artifactId>
    <version>4.1.2</version>
</parent>
@y
```xml
<parent>
    <groupId>io.micronaut.platform</groupId>
    <artifactId>micronaut-parent</artifactId>
    <version>4.1.2</version>
</parent>
@z

@x
<properties>
    <jdk.version>17</jdk.version>
    <micronaut.version>4.1.2</micronaut.version>
    <micronaut.runtime>netty</micronaut.runtime>
</properties>
@y
<properties>
    <jdk.version>17</jdk.version>
    <micronaut.version>4.1.2</micronaut.version>
    <micronaut.runtime>netty</micronaut.runtime>
</properties>
@z

@x
<repositories>
    <repository>
        <id>jitpack.io</id>
        <url>https://jitpack.io</url>
    </repository>
</repositories>
@y
<repositories>
    <repository>
        <id>jitpack.io</id>
        <url>https://jitpack.io</url>
    </repository>
</repositories>
@z

@x
<dependencies>
    <dependency>
        <groupId>io.micronaut</groupId>
        <artifactId>micronaut-http-client</artifactId>
        <scope>compile</scope>
    </dependency>
    <dependency>
        <groupId>io.micronaut</groupId>
        <artifactId>micronaut-http-server-netty</artifactId>
        <scope>compile</scope>
    </dependency>
    <dependency>
        <groupId>io.micronaut.serde</groupId>
        <artifactId>micronaut-serde-jackson</artifactId>
        <scope>compile</scope>
    </dependency>
    <dependency>
        <groupId>io.micronaut.test</groupId>
        <artifactId>micronaut-test-junit5</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>io.micronaut.test</groupId>
        <artifactId>micronaut-test-rest-assured</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.testcontainers</groupId>
        <artifactId>testcontainers-junit-jupiter</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.testcontainers</groupId>
        <artifactId>testcontainers</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.wiremock</groupId>
        <artifactId>wiremock-standalone</artifactId>
        <version>3.2.0</version>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.wiremock.integrations.testcontainers</groupId>
        <artifactId>wiremock-testcontainers-module</artifactId>
        <version>1.0-alpha-13</version>
        <scope>test</scope>
    </dependency>
</dependencies>
```
@y
<dependencies>
    <dependency>
        <groupId>io.micronaut</groupId>
        <artifactId>micronaut-http-client</artifactId>
        <scope>compile</scope>
    </dependency>
    <dependency>
        <groupId>io.micronaut</groupId>
        <artifactId>micronaut-http-server-netty</artifactId>
        <scope>compile</scope>
    </dependency>
    <dependency>
        <groupId>io.micronaut.serde</groupId>
        <artifactId>micronaut-serde-jackson</artifactId>
        <scope>compile</scope>
    </dependency>
    <dependency>
        <groupId>io.micronaut.test</groupId>
        <artifactId>micronaut-test-junit5</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>io.micronaut.test</groupId>
        <artifactId>micronaut-test-rest-assured</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.testcontainers</groupId>
        <artifactId>testcontainers-junit-jupiter</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.testcontainers</groupId>
        <artifactId>testcontainers</artifactId>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.wiremock</groupId>
        <artifactId>wiremock-standalone</artifactId>
        <version>3.2.0</version>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.wiremock.integrations.testcontainers</groupId>
        <artifactId>wiremock-testcontainers-module</artifactId>
        <version>1.0-alpha-13</version>
        <scope>test</scope>
    </dependency>
</dependencies>
```
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
[WireMock](https://wiremock.org/) is a tool for building mock APIs.
Testcontainers provides a
[WireMock module](https://testcontainers.com/modules/wiremock/) that runs
WireMock as a Docker container.
@y
The application exposes a `GET /api/albums/{albumId}` endpoint that calls the
photo service to fetch photos for a given album.
[WireMock](https://wiremock.org/) is a tool for building mock APIs.
Testcontainers provides a
[WireMock module](https://testcontainers.com/modules/wiremock/) that runs
WireMock as a Docker container.
@z

@x
### Create the Album and Photo models
@y
### Create the Album and Photo models
@z

@x
Create `Album.java` using Java records. Annotate both records with `@Serdeable`
to allow serialization and deserialization:
@y
Create `Album.java` using Java records. Annotate both records with `@Serdeable`
to allow serialization and deserialization:
@z

@x
```java
package com.testcontainers.demo;
@y
```java
package com.testcontainers.demo;
@z

@x
import io.micronaut.serde.annotation.Serdeable;
import java.util.List;
@y
import io.micronaut.serde.annotation.Serdeable;
import java.util.List;
@z

@x
@Serdeable
public record Album(Long albumId, List<Photo> photos) {}
@y
@Serdeable
public record Album(Long albumId, List<Photo> photos) {}
@z

@x
@Serdeable
record Photo(Long id, String title, String url, String thumbnailUrl) {}
```
@y
@Serdeable
record Photo(Long id, String title, String url, String thumbnailUrl) {}
```
@z

@x
### Create the PhotoServiceClient
@y
### Create the PhotoServiceClient
@z

@x
Micronaut provides
[declarative HTTP client](https://docs.micronaut.io/latest/guide/#httpClient)
support. Create an interface with a method that fetches photos for a given album
ID:
@y
Micronaut provides
[declarative HTTP client](https://docs.micronaut.io/latest/guide/#httpClient)
support. Create an interface with a method that fetches photos for a given album
ID:
@z

@x
```java
package com.testcontainers.demo;
@y
```java
package com.testcontainers.demo;
@z

@x
import io.micronaut.http.annotation.Get;
import io.micronaut.http.annotation.PathVariable;
import io.micronaut.http.client.annotation.Client;
import java.util.List;
@y
import io.micronaut.http.annotation.Get;
import io.micronaut.http.annotation.PathVariable;
import io.micronaut.http.client.annotation.Client;
import java.util.List;
@z

@x
@Client(id = "photosapi")
interface PhotoServiceClient {
@y
@Client(id = "photosapi")
interface PhotoServiceClient {
@z

@x
    @Get("/albums/{albumId}/photos")
    List<Photo> getPhotos(@PathVariable Long albumId);
}
```
@y
    @Get("/albums/{albumId}/photos")
    List<Photo> getPhotos(@PathVariable Long albumId);
}
```
@z

@x
The `@Client(id = "photosapi")` annotation ties this client to a named
configuration. Add the following property to
`src/main/resources/application.properties` to set the base URL:
@y
The `@Client(id = "photosapi")` annotation ties this client to a named
configuration. Add the following property to
`src/main/resources/application.properties` to set the base URL:
@z

@x
```properties
micronaut.http.services.photosapi.url=https://jsonplaceholder.typicode.com
```
@y
```properties
micronaut.http.services.photosapi.url=https://jsonplaceholder.typicode.com
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
import static io.micronaut.scheduling.TaskExecutors.BLOCKING;
@y
import static io.micronaut.scheduling.TaskExecutors.BLOCKING;
@z

@x
import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;
import io.micronaut.http.annotation.PathVariable;
import io.micronaut.scheduling.annotation.ExecuteOn;
@y
import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;
import io.micronaut.http.annotation.PathVariable;
import io.micronaut.scheduling.annotation.ExecuteOn;
@z

@x
@Controller("/api")
class AlbumController {
@y
@Controller("/api")
class AlbumController {
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
    @ExecuteOn(BLOCKING)
    @Get("/albums/{albumId}")
    public Album getAlbumById(@PathVariable Long albumId) {
        return new Album(albumId, photoServiceClient.getPhotos(albumId));
    }
}
```
@y
    @ExecuteOn(BLOCKING)
    @Get("/albums/{albumId}")
    public Album getAlbumById(@PathVariable Long albumId) {
        return new Album(albumId, photoServiceClient.getPhotos(albumId));
    }
}
```
@z

@x
Here's what this controller does:
@y
Here's what this controller does:
@z

@x
- `@Controller("/api")` maps the controller to the `/api` path.
- Constructor injection provides a `PhotoServiceClient` bean.
- `@ExecuteOn(BLOCKING)` offloads blocking I/O to a separate thread pool so it
  doesn't block the event loop.
- `@Get("/albums/{albumId}")` maps the `getAlbumById()` method to an HTTP GET
  request.
@y
- `@Controller("/api")` maps the controller to the `/api` path.
- Constructor injection provides a `PhotoServiceClient` bean.
- `@ExecuteOn(BLOCKING)` offloads blocking I/O to a separate thread pool so it
  doesn't block the event loop.
- `@Get("/albums/{albumId}")` maps the `getAlbumById()` method to an HTTP GET
  request.
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
## Write tests with WireMock and Testcontainers
@y
## Write tests with WireMock and Testcontainers
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
### Test with WireMock's JUnit 5 extension
@y
### Test with WireMock's JUnit 5 extension
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
### Stub using JSON mapping files
@y
### Stub using JSON mapping files
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
### Use the Testcontainers WireMock module
@y
### Use the Testcontainers WireMock module
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
You should see the WireMock Docker container start in the console output. It
acts as the photo service, serving mock responses based on the configured
expectations. All tests should pass.
@y
You should see the WireMock Docker container start in the console output. It
acts as the photo service, serving mock responses based on the configured
expectations. All tests should pass.
@z

@x
### Summary
@y
### Summary
@z

@x
You built a Micronaut application that integrates with an external REST API
using declarative HTTP clients, then tested that integration using WireMock and
the Testcontainers WireMock module. Testing at the HTTP protocol level instead
of mocking Java methods lets you catch serialization issues and simulate
realistic failure scenarios.
@y
You built a Micronaut application that integrates with an external REST API
using declarative HTTP clients, then tested that integration using WireMock and
the Testcontainers WireMock module. Testing at the HTTP protocol level instead
of mocking Java methods lets you catch serialization issues and simulate
realistic failure scenarios.
@z

@x
> [!TIP]
> Testcontainers WireMock modules are available for Go and Python as well.
@y
> [!TIP]
> Testcontainers WireMock modules are available for Go and Python as well.
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
- [Testcontainers WireMock module](https://testcontainers.com/modules/wiremock/)
- [WireMock documentation](https://wiremock.org/docs/)
- [Testcontainers JUnit 5 quickstart](https://java.testcontainers.org/quickstart/junit_5_quickstart/)
- [Testing REST API integrations in Spring Boot using WireMock](/guides/testcontainers-java-wiremock/)
@y
- [Testcontainers WireMock module](https://testcontainers.com/modules/wiremock/)
- [WireMock documentation](https://wiremock.org/docs/)
- [Testcontainers JUnit 5 quickstart](https://java.testcontainers.org/quickstart/junit_5_quickstart/)
- [Testing REST API integrations in Spring Boot using WireMock](__SUBDIR__/guides/testcontainers-java-wiremock/)
@z
