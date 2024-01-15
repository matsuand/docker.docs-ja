%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Secrets top-level elements
description: Explore all the attributes the secrets top-level element can have.
keywords: compose, compose specification, secrets, compose file reference
---
@y
---
title: Secrets top-level elements
description: Explore all the attributes the secrets top-level element can have.
keywords: compose, compose specification, secrets, compose file reference
---
@z

@x
Secrets are a flavor of [Configs](08-configs.md) focusing on sensitive data, with specific constraint for this usage. 
@y
Secrets are a flavor of [Configs](08-configs.md) focusing on sensitive data, with specific constraint for this usage. 
@z

@x
Services can only access secrets when explicitly granted by a [`secrets`](05-services.md#secrets) attribute within the `services` top-level element.
@y
Services can only access secrets when explicitly granted by a [`secrets`](05-services.md#secrets) attribute within the `services` top-level element.
@z

@x
The top-level `secrets` declaration defines or references sensitive data that is granted to the services in your Compose
application. The source of the secret is either `file` or `environment`.
@y
The top-level `secrets` declaration defines or references sensitive data that is granted to the services in your Compose
application. The source of the secret is either `file` or `environment`.
@z

@x
- `file`: The secret is created with the contents of the file at the specified path.
- `environment`: The secret is created with the value of an environment variable.
- `external`: If set to true, `external` specifies that this secret has already been created. Compose does
  not attempt to create it, and if it does not exist, an error occurs.
- `name`: The name of the secret object in Docker. This field can be used to
  reference secrets that contain special characters. The name is used as is
  and isn't scoped with the project name.
@y
- `file`: The secret is created with the contents of the file at the specified path.
- `environment`: The secret is created with the value of an environment variable.
- `external`: If set to true, `external` specifies that this secret has already been created. Compose does
  not attempt to create it, and if it does not exist, an error occurs.
- `name`: The name of the secret object in Docker. This field can be used to
  reference secrets that contain special characters. The name is used as is
  and isn't scoped with the project name.
@z

@x
## Example 1
@y
## Example 1
@z

@x
`server-certificate` secret is created as `<project_name>_server-certificate` when the application is deployed,
by registering content of the `server.cert` as a platform secret.
@y
`server-certificate` secret is created as `<project_name>_server-certificate` when the application is deployed,
by registering content of the `server.cert` as a platform secret.
@z

@x
```yml
secrets:
  server-certificate:
    file: ./server.cert
```
@y
```yml
secrets:
  server-certificate:
    file: ./server.cert
```
@z

@x
## Example 2 
@y
## Example 2 
@z

@x
`token` secret  is created as `<project_name>_token` when the application is deployed,
by registering the content of the `OAUTH_TOKEN` environment variable as a platform secret.
@y
`token` secret  is created as `<project_name>_token` when the application is deployed,
by registering the content of the `OAUTH_TOKEN` environment variable as a platform secret.
@z

@x
```yml
secrets:
  token:
    environment: "OAUTH_TOKEN"
```
@y
```yml
secrets:
  token:
    environment: "OAUTH_TOKEN"
```
@z

@x
Alternatively, `server-certificate` can be declared as external. Compose looks up the `server-certificate` secret to expose to relevant services.
@y
Alternatively, `server-certificate` can be declared as external. Compose looks up the `server-certificate` secret to expose to relevant services.
@z

@x
```yml
secrets:
  server-certificate:
    external: true
```
@y
```yml
secrets:
  server-certificate:
    external: true
```
@z

@x
## Example 3
@y
## Example 3
@z

@x
External secrets lookup can also use a distinct key by specifying a `name`. 
@y
External secrets lookup can also use a distinct key by specifying a `name`. 
@z

@x
The following example modifies the previous example to look up a secret using the name `CERTIFICATE_KEY`. The actual lookup key is set at deployment time by the [interpolation](12-interpolation.md) of
variables, but exposed to containers as hard-coded ID `server-certificate`.
@y
The following example modifies the previous example to look up a secret using the name `CERTIFICATE_KEY`. The actual lookup key is set at deployment time by the [interpolation](12-interpolation.md) of
variables, but exposed to containers as hard-coded ID `server-certificate`.
@z

@x
```yml
secrets:
  server-certificate:
    external: true
    name: "${CERTIFICATE_KEY}"
```
@y
```yml
secrets:
  server-certificate:
    external: true
    name: "${CERTIFICATE_KEY}"
```
@z

@x
If `external` is set to `true`, all other attributes apart from `name` are irrelevant. If Compose detects any other attribute, it rejects the Compose file as invalid.
@y
If `external` is set to `true`, all other attributes apart from `name` are irrelevant. If Compose detects any other attribute, it rejects the Compose file as invalid.
@z

@x
Your Compose file needs to explicitly grant access to the secrets to relevant services in your application.
@y
Your Compose file needs to explicitly grant access to the secrets to relevant services in your application.
@z
