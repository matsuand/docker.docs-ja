%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
title: Secrets top-level elements
description: Explore all the attributes the secrets top-level element can have.
keywords: compose, compose specification, secrets, compose file reference
@y
title: Secrets top-level elements
description: Explore all the attributes the secrets top-level element can have.
keywords: compose, compose specification, secrets, compose file reference
@z

@x
Secrets are a flavor of [Configs](configs.md) focusing on sensitive data, with specific constraint for this usage. 
@y
Secrets are a flavor of [Configs](configs.md) focusing on sensitive data, with specific constraint for this usage. 
@z

@x
Services can only access secrets when explicitly granted by a [`secrets` attribute](services.md#secrets) within the `services` top-level element.
@y
Services can only access secrets when explicitly granted by a [`secrets` attribute](services.md#secrets) within the `services` top-level element.
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
- `environment`: The secret is created with the value of an environment variable on the host.
@y
- `file`: The secret is created with the contents of the file at the specified path.
- `environment`: The secret is created with the value of an environment variable on the host.
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
## Additional resources
@y
## Additional resources
@z

@x
For more information, see [How to use secrets in Compose](/manuals/compose/how-tos/use-secrets.md).
@y
For more information, see [How to use secrets in Compose](manuals/compose/how-tos/use-secrets.md).
@z
