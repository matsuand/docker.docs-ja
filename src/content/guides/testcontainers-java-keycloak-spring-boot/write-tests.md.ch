%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Write tests with Testcontainers
linkTitle: Write tests
description: Test the secured Spring Boot API endpoints using Testcontainers Keycloak and PostgreSQL modules.
@y
title: Write tests with Testcontainers
linkTitle: Write tests
description: Test the secured Spring Boot API endpoints using Testcontainers Keycloak and PostgreSQL modules.
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
## Configure the test containers
@y
## Configure the test containers
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

% snip code...

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
## Write the test
@y
## Write the test
@z

@x
Create `ProductControllerTests.java`:
@y
Create `ProductControllerTests.java`:
@z

% snip code...

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
## Use Testcontainers for local development
@y
## Use Testcontainers for local development
@z

@x
Spring Boot's Testcontainers support also works for local development. Create
`TestApplication.java` under `src/test/java`:
@y
Spring Boot's Testcontainers support also works for local development. Create
`TestApplication.java` under `src/test/java`:
@z

% snip code...

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
