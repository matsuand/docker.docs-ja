%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Create the Spring Boot project
linkTitle: Create the project
description: Set up a Spring Boot project with an external REST API integration using WireMock and Testcontainers.
@y
title: Create the Spring Boot project
linkTitle: Create the project
description: Set up a Spring Boot project with an external REST API integration using WireMock and Testcontainers.
@z

@x
## Set up the project
@y
## Set up the project
@z

@x
Create a Spring Boot project from [Spring Initializr](https://start.spring.io)
by selecting the **Spring Web** and **Testcontainers** starters.
@y
Create a Spring Boot project from [Spring Initializr](https://start.spring.io)
by selecting the **Spring Web** and **Testcontainers** starters.
@z

@x
Alternatively, clone the
[guide repository](https://github.com/testcontainers/tc-guide-testing-rest-api-integrations-using-wiremock).
@y
Alternatively, clone the
[guide repository](https://github.com/testcontainers/tc-guide-testing-rest-api-integrations-using-wiremock).
@z

@x
After generating the project, add the **REST Assured**, **WireMock**, and
**WireMock Testcontainers module** libraries as test dependencies. The key
dependencies in `pom.xml` are:
@y
After generating the project, add the **REST Assured**, **WireMock**, and
**WireMock Testcontainers module** libraries as test dependencies. The key
dependencies in `pom.xml` are:
@z

@x
```xml
<properties>
    <java.version>17</java.version>
    <testcontainers.version>2.0.4</testcontainers.version>
    <wiremock-testcontainers.version>1.0-alpha-13</wiremock-testcontainers.version>
</properties>
<dependencies>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-web</artifactId>
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
        <groupId>org.wiremock</groupId>
        <artifactId>wiremock-standalone</artifactId>
        <version>3.6.0</version>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.wiremock.integrations.testcontainers</groupId>
        <artifactId>wiremock-testcontainers-module</artifactId>
        <version>${wiremock-testcontainers.version}</version>
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
    <wiremock-testcontainers.version>1.0-alpha-13</wiremock-testcontainers.version>
</properties>
<dependencies>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-web</artifactId>
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
        <groupId>org.wiremock</groupId>
        <artifactId>wiremock-standalone</artifactId>
        <version>3.6.0</version>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.wiremock.integrations.testcontainers</groupId>
        <artifactId>wiremock-testcontainers-module</artifactId>
        <version>${wiremock-testcontainers.version}</version>
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
## Create the PhotoServiceClient
@y
## Create the PhotoServiceClient
@z

@x
Create `PhotoServiceClient.java`, which uses `RestTemplate` to fetch photos for
a given album ID:
@y
Create `PhotoServiceClient.java`, which uses `RestTemplate` to fetch photos for
a given album ID:
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
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
@y
import java.util.List;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
@z

@x
@Service
class PhotoServiceClient {
@y
@Service
class PhotoServiceClient {
@z

@x
  private final String baseUrl;
  private final RestTemplate restTemplate;
@y
  private final String baseUrl;
  private final RestTemplate restTemplate;
@z

@x
  PhotoServiceClient(
    @Value("${photos.api.base-url}") String baseUrl,
    RestTemplateBuilder builder
  ) {
    this.baseUrl = baseUrl;
    this.restTemplate = builder.build();
  }
@y
  PhotoServiceClient(
    @Value("${photos.api.base-url}") String baseUrl,
    RestTemplateBuilder builder
  ) {
    this.baseUrl = baseUrl;
    this.restTemplate = builder.build();
  }
@z

@x
  List<Photo> getPhotos(Long albumId) {
    String url = baseUrl + "/albums/{albumId}/photos";
    ResponseEntity<List<Photo>> response = restTemplate.exchange(
      url,
      HttpMethod.GET,
      null,
      new ParameterizedTypeReference<>() {},
      albumId
    );
    return response.getBody();
  }
}
```
@y
  List<Photo> getPhotos(Long albumId) {
    String url = baseUrl + "/albums/{albumId}/photos";
    ResponseEntity<List<Photo>> response = restTemplate.exchange(
      url,
      HttpMethod.GET,
      null,
      new ParameterizedTypeReference<>() {},
      albumId
    );
    return response.getBody();
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
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestClientResponseException;
@y
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestClientResponseException;
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
    } catch (RestClientResponseException e) {
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
    } catch (RestClientResponseException e) {
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
