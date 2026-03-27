%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Create the Micronaut project
linkTitle: Create the project
description: Set up a Micronaut project with an external REST API integration using declarative HTTP clients.
@y
title: Create the Micronaut project
linkTitle: Create the project
description: Set up a Micronaut project with an external REST API integration using declarative HTTP clients.
@z

@x
## Set up the project
@y
## Set up the project
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
## Create the Album and Photo models
@y
## Create the Album and Photo models
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
## Create the PhotoServiceClient
@y
## Create the PhotoServiceClient
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
## Create the REST API endpoint
@y
## Create the REST API endpoint
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
