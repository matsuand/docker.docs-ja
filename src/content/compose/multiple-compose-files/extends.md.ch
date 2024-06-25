%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: How to use Docker Compose's extends keyword to share configuration between
  files and projects
keywords: fig, composition, compose, docker, orchestration, documentation, docs
title: Extend your Compose file
aliases:
- /compose/extends/
---
@y
---
description: How to use Docker Compose's extends keyword to share configuration between
  files and projects
keywords: fig, composition, compose, docker, orchestration, documentation, docs
title: Extend your Compose file
aliases:
- /compose/extends/
---
@z

@x
Docker Compose's [`extends` attribute](../compose-file/05-services.md#extends)
lets you share common configurations among different files, or even different
projects entirely.
@y
Docker Compose's [`extends` attribute](../compose-file/05-services.md#extends)
lets you share common configurations among different files, or even different
projects entirely.
@z

@x
Extending services is useful if you have several services that reuse a common
set of configuration options. With `extends` you can define a common set of
service options in one place and refer to it from anywhere. You can refer to
another Compose file and select a service you want to also use in your own
application, with the ability to override some attributes for your own needs.
@y
Extending services is useful if you have several services that reuse a common
set of configuration options. With `extends` you can define a common set of
service options in one place and refer to it from anywhere. You can refer to
another Compose file and select a service you want to also use in your own
application, with the ability to override some attributes for your own needs.
@z

@x
> **Important**
>
> When you use multiple Compose files, you must make sure all paths in the files
are relative to the base Compose file (i.e. the Compose file in your main-project folder). This is required because extend files
need not be valid Compose files. Extend files can contain small fragments of
configuration. Tracking which fragment of a service is relative to which path is
difficult and confusing, so to keep paths easier to understand, all paths must
be defined relative to the base file. 
{ .important }
@y
> **Important**
>
> When you use multiple Compose files, you must make sure all paths in the files
are relative to the base Compose file (i.e. the Compose file in your main-project folder). This is required because extend files
need not be valid Compose files. Extend files can contain small fragments of
configuration. Tracking which fragment of a service is relative to which path is
difficult and confusing, so to keep paths easier to understand, all paths must
be defined relative to the base file. 
{ .important }
@z

@x
## How it works
@y
## How it works
@z

@x
### Extending services from another file
@y
### Extending services from another file
@z

@x
Take the following example:
@y
Take the following example:
@z

@x
```yaml
services:
  web:
    extends:
      file: common-services.yml
      service: webapp
```
@y
```yaml
services:
  web:
    extends:
      file: common-services.yml
      service: webapp
```
@z

@x
This instructs Compose to re-use only the properties of the `webapp` service
defined in the `common-services.yml` file. The `webapp` service itself is not part of the final project.
@y
This instructs Compose to re-use only the properties of the `webapp` service
defined in the `common-services.yml` file. The `webapp` service itself is not part of the final project.
@z

@x
If `common-services.yml`
looks like this:
@y
If `common-services.yml`
looks like this:
@z

@x
```yaml
services:
  webapp:
    build: .
    ports:
      - "8000:8000"
    volumes:
      - "/data"
```
You get exactly the same result as if you wrote
`docker-compose.yml` with the same `build`, `ports` and `volumes` configuration
values defined directly under `web`.
@y
```yaml
services:
  webapp:
    build: .
    ports:
      - "8000:8000"
    volumes:
      - "/data"
```
You get exactly the same result as if you wrote
`docker-compose.yml` with the same `build`, `ports` and `volumes` configuration
values defined directly under `web`.
@z

@x
To include the service `webapp` in the final project when extending services from another file, you need to explicitly include both services in your current Compose file. For example (note this is a non-normative example):
@y
To include the service `webapp` in the final project when extending services from another file, you need to explicitly include both services in your current Compose file. For example (note this is a non-normative example):
@z

@x
```yaml
services:
  web:
    build: alpine
    command: echo
    extends:
      file: common-services.yml
      service: webapp
  webapp:
    extends:
      file: common-services.yml
      service: webapp
```
@y
```yaml
services:
  web:
    build: alpine
    command: echo
    extends:
      file: common-services.yml
      service: webapp
  webapp:
    extends:
      file: common-services.yml
      service: webapp
```
@z

@x
Alternatively, you can use [include](include.md). 
@y
Alternatively, you can use [include](include.md). 
@z

@x
### Extending services within the same file 
@y
### Extending services within the same file 
@z

@x
If you define services in the same Compose file and extend one service from another, both the original service and the extended service will be part of your final configuration. For example:
@y
If you define services in the same Compose file and extend one service from another, both the original service and the extended service will be part of your final configuration. For example:
@z

@x
```yaml 
services:
  web:
    build: alpine
    extends: webapp
  webapp:
    environment:
      - DEBUG=1
```
@y
```yaml 
services:
  web:
    build: alpine
    extends: webapp
  webapp:
    environment:
      - DEBUG=1
```
@z

@x
### Extending services within the same file and from another file
@y
### Extending services within the same file and from another file
@z

@x
You can go further and define, or re-define, configuration locally in
`compose.yaml`:
@y
You can go further and define, or re-define, configuration locally in
`compose.yaml`:
@z

@x
```yaml
services:
  web:
    extends:
      file: common-services.yml
      service: webapp
    environment:
      - DEBUG=1
    cpu_shares: 5
@y
```yaml
services:
  web:
    extends:
      file: common-services.yml
      service: webapp
    environment:
      - DEBUG=1
    cpu_shares: 5
@z

@x
  important_web:
    extends: web
    cpu_shares: 10
```
@y
  important_web:
    extends: web
    cpu_shares: 10
```
@z

@x
## Additional example
@y
## Additional example
@z

@x
Extending an individual service is useful when you have multiple services that
have a common configuration. The example below is a Compose app with two
services, a web application and a queue worker. Both services use the same
codebase and share many configuration options.
@y
Extending an individual service is useful when you have multiple services that
have a common configuration. The example below is a Compose app with two
services, a web application and a queue worker. Both services use the same
codebase and share many configuration options.
@z

@x
The `common.yaml` file defines the common configuration:
@y
The `common.yaml` file defines the common configuration:
@z

@x
```yaml
services:
  app:
    build: .
    environment:
      CONFIG_FILE_PATH: /code/config
      API_KEY: xxxyyy
    cpu_shares: 5
```
@y
```yaml
services:
  app:
    build: .
    environment:
      CONFIG_FILE_PATH: /code/config
      API_KEY: xxxyyy
    cpu_shares: 5
```
@z

@x
The `docker-compose.yaml` defines the concrete services which use the common
configuration:
@y
The `docker-compose.yaml` defines the concrete services which use the common
configuration:
@z

@x
```yaml
services:
  webapp:
    extends:
      file: common.yaml
      service: app
    command: /code/run_web_app
    ports:
      - 8080:8080
    depends_on:
      - queue
      - db
@y
```yaml
services:
  webapp:
    extends:
      file: common.yaml
      service: app
    command: /code/run_web_app
    ports:
      - 8080:8080
    depends_on:
      - queue
      - db
@z

@x
  queue_worker:
    extends:
      file: common.yaml
      service: app
    command: /code/run_worker
    depends_on:
      - queue
```
@y
  queue_worker:
    extends:
      file: common.yaml
      service: app
    command: /code/run_worker
    depends_on:
      - queue
```
@z

@x
## Exceptions and limitations
@y
## Exceptions and limitations
@z

@x
`volumes_from` and `depends_on` are never shared between services using
`extends`. These exceptions exist to avoid implicit dependencies; you always
define `volumes_from` locally. This ensures dependencies between services are
clearly visible when reading the current file. Defining these locally also
ensures that changes to the referenced file don't break anything.
@y
`volumes_from` and `depends_on` are never shared between services using
`extends`. These exceptions exist to avoid implicit dependencies; you always
define `volumes_from` locally. This ensures dependencies between services are
clearly visible when reading the current file. Defining these locally also
ensures that changes to the referenced file don't break anything.
@z

@x
`extends` is useful if you only need a single service to be shared and you are
familiar with the file you're extending to, so you can to tweak the
configuration. But this isn’t an acceptable solution when you want to re-use
someone else's unfamiliar configurations and you don’t know about its own
dependencies.
@y
`extends` is useful if you only need a single service to be shared and you are
familiar with the file you're extending to, so you can to tweak the
configuration. But this isn’t an acceptable solution when you want to re-use
someone else's unfamiliar configurations and you don’t know about its own
dependencies.
@z

@x
## Relative paths
@y
## Relative paths
@z

@x
When using `extends` with a `file` attribute which points to another folder, relative paths 
declared by the service being extended are converted so they still point to the
same file when used by the extending service. This is illustrated in the following example:
@y
When using `extends` with a `file` attribute which points to another folder, relative paths 
declared by the service being extended are converted so they still point to the
same file when used by the extending service. This is illustrated in the following example:
@z

@x
Base Compose file:
```yaml
services:
  webapp:
    image: example
    extends:
      file: ../commons/compose.yaml
      service: base
```
@y
Base Compose file:
```yaml
services:
  webapp:
    image: example
    extends:
      file: ../commons/compose.yaml
      service: base
```
@z

@x
The `commons/compose.yaml` file:
```yaml
services:
  base:
    env_file: ./container.env
```
@y
The `commons/compose.yaml` file:
```yaml
services:
  base:
    env_file: ./container.env
```
@z

@x
The resulting service refers to the original `container.env` file
within the `commons` directory. This can be confirmed with `docker compose config`
which inspects the actual model:
```yaml
services:
  webapp:
    image: example
    env_file: 
      - ../commons/container.env
```
@y
The resulting service refers to the original `container.env` file
within the `commons` directory. This can be confirmed with `docker compose config`
which inspects the actual model:
```yaml
services:
  webapp:
    image: example
    env_file: 
      - ../commons/container.env
```
@z

@x
## Reference information
@y
## Reference information
@z

@x
- [`extends`](../compose-file/05-services.md#extends)
@y
- [`extends`](../compose-file/05-services.md#extends)
@z
