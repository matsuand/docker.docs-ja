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
Docker Compose's [`extends` attribute](../compose-file/05-services.md#extends) lets you share common configurations
among different files, or even different projects entirely. 
@y
Docker Compose's [`extends` attribute](../compose-file/05-services.md#extends) lets you share common configurations
among different files, or even different projects entirely. 
@z

@x
Extending services
is useful if you have several services that reuse a common set of configuration
options. With `extends` you can define a common set of service options in one
place and refer to it from anywhere. You can refer to another Compose file and select a service you want to also use in your own application, with the ability to override some attributes for your own needs.
@y
Extending services
is useful if you have several services that reuse a common set of configuration
options. With `extends` you can define a common set of service options in one
place and refer to it from anywhere. You can refer to another Compose file and select a service you want to also use in your own application, with the ability to override some attributes for your own needs.
@z

@x
> **Important**
>
> When you use multiple Compose files, you must make sure all paths in the
files are relative to the base Compose file. This is required because extend files need not be valid
Compose files. Extend files can contain small fragments of configuration.
Tracking which fragment of a service is relative to which path is difficult and
confusing, so to keep paths easier to understand, all paths must be defined
relative to the base file.
{ .important }
@y
> **Important**
>
> When you use multiple Compose files, you must make sure all paths in the
files are relative to the base Compose file. This is required because extend files need not be valid
Compose files. Extend files can contain small fragments of configuration.
Tracking which fragment of a service is relative to which path is difficult and
confusing, so to keep paths easier to understand, all paths must be defined
relative to the base file.
{ .important }
@z

@x
## How it works
@y
## How it works
@z

@x
When defining any service in your `compose.yaml` file, you can declare that you are
extending another service:
@y
When defining any service in your `compose.yaml` file, you can declare that you are
extending another service:
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
This instructs Compose to re-use the configuration for the `webapp` service
defined in the `common-services.yaml` file. Suppose that `common-services.yaml`
looks like this:
@y
This instructs Compose to re-use the configuration for the `webapp` service
defined in the `common-services.yaml` file. Suppose that `common-services.yaml`
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
@z

@x
In this case, you get exactly the same result as if you wrote
`docker-compose.yml` with the same `build`, `ports` and `volumes` configuration
values defined directly under `web`.
@y
In this case, you get exactly the same result as if you wrote
`docker-compose.yml` with the same `build`, `ports` and `volumes` configuration
values defined directly under `web`.
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
You can also write other services and link your `web` service to them:
@y
You can also write other services and link your `web` service to them:
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
    depends_on:
      - db
  db:
    image: postgres
```
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
    depends_on:
      - db
  db:
    image: postgres
```
@z

@x
## Further examples
@y
## Further examples
@z

@x
### Example one
@y
### Example one
@z

@x
Extending an individual service is useful when you have multiple services that
have a common configuration. The example below is a Compose app with
two services, a web application and a queue worker. Both services use the same
codebase and share many configuration options.
@y
Extending an individual service is useful when you have multiple services that
have a common configuration. The example below is a Compose app with
two services, a web application and a queue worker. Both services use the same
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
The `docker-compose.yaml` defines the concrete services which use the
common configuration:
@y
The `docker-compose.yaml` defines the concrete services which use the
common configuration:
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
### Example two
@y
### Example two
@z

@x
Another common use case for `extends` is running one off or administrative tasks against one
or more services in a Compose app. This example demonstrates running a
database backup.
@y
Another common use case for `extends` is running one off or administrative tasks against one
or more services in a Compose app. This example demonstrates running a
database backup.
@z

@x
The `docker-compose.yml` defines the base configuration.
@y
The `docker-compose.yml` defines the base configuration.
@z

@x
```yaml
services:
  web:
    image: example/my_web_app:latest
    depends_on:
       db
@y
```yaml
services:
  web:
    image: example/my_web_app:latest
    depends_on:
       db
@z

@x
  db:
    image: postgres:latest
```
@y
  db:
    image: postgres:latest
```
@z

@x
`docker-compose.admin.yml` adds a new service to run the database
export or backup.
@y
`docker-compose.admin.yml` adds a new service to run the database
export or backup.
@z

@x
```yaml
services:
  dbadmin:
     build: database_admin/
     depends_on:
        - db
```
@y
```yaml
services:
  dbadmin:
     build: database_admin/
     depends_on:
        - db
```
@z

@x
To start a normal environment, run `docker compose up -d`. To run a database
backup, include the `docker-compose.admin.yml` as well.
@y
To start a normal environment, run `docker compose up -d`. To run a database
backup, include the `docker-compose.admin.yml` as well.
@z

@x
```console
$ docker compose -f docker-compose.yml -f docker-compose.admin.yml \
  run dbadmin db-backup
```
@y
```console
$ docker compose -f docker-compose.yml -f docker-compose.admin.yml \
  run dbadmin db-backup
```
@z

@x
Compose extends files in
the order they're specified on the command line.
@y
Compose extends files in
the order they're specified on the command line.
@z

@x
## Exceptions and limitations
@y
## Exceptions and limitations
@z

@x
`volumes_from` and `depends_on` are never shared between
services using `extends`. These exceptions exist to avoid implicit
dependencies; you always define `volumes_from` locally. This ensures
dependencies between services are clearly visible when reading the current file.
Defining these locally also ensures that changes to the referenced file don't
break anything.
@y
`volumes_from` and `depends_on` are never shared between
services using `extends`. These exceptions exist to avoid implicit
dependencies; you always define `volumes_from` locally. This ensures
dependencies between services are clearly visible when reading the current file.
Defining these locally also ensures that changes to the referenced file don't
break anything.
@z

@x
`extends` is useful if you only need a single service to be shared and you are familiar with the file you're extending to, so you can to tweak the configuration. But this isn’t an acceptable solution when you want to re-use someone else's unfamiliar configurations and you don’t know about its own dependencies.
@y
`extends` is useful if you only need a single service to be shared and you are familiar with the file you're extending to, so you can to tweak the configuration. But this isn’t an acceptable solution when you want to re-use someone else's unfamiliar configurations and you don’t know about its own dependencies.
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
