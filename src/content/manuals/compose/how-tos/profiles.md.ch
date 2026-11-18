%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応

@x
title: Using profiles with Compose
linkTitle: Use service profiles
@y
title: Using profiles with Compose
linkTitle: Use service profiles
@z

@x
description: How to use profiles with Docker Compose
keywords: cli, compose, profile, profiles reference
@y
description: How to use profiles with Docker Compose
keywords: cli, compose, profile, profiles reference
@z

@x
{{% include "compose/profiles.md" %}}
@y
{{% include "compose/profiles.md" %}}
@z

@x
## Assigning profiles to services
@y
## Assigning profiles to services
@z

@x
Services are associated with profiles through the
[`profiles` attribute](/reference/compose-file/services.md#profiles) which takes an
array of profile names:
@y
Services are associated with profiles through the
[`profiles` attribute](reference/compose-file/services.md#profiles) which takes an
array of profile names:
@z

@x
```yaml
services:
  frontend:
    image: frontend
    profiles: [frontend]
@y
```yaml
services:
  frontend:
    image: frontend
    profiles: [frontend]
@z

@x
  phpmyadmin:
    image: phpmyadmin
    depends_on: [db]
    profiles: [debug]
@y
  phpmyadmin:
    image: phpmyadmin
    depends_on: [db]
    profiles: [debug]
@z

@x
  backend:
    image: backend
@y
  backend:
    image: backend
@z

@x
  db:
    image: mysql
```
@y
  db:
    image: mysql
```
@z

@x
Here the services `frontend` and `phpmyadmin` are assigned to the profiles
`frontend` and `debug` respectively and as such are only started when their
respective profiles are enabled.
@y
Here the services `frontend` and `phpmyadmin` are assigned to the profiles
`frontend` and `debug` respectively and as such are only started when their
respective profiles are enabled.
@z

@x
Services without a `profiles` attribute are always enabled. In this
case running `docker compose up` would only start `backend` and `db`.
@y
Services without a `profiles` attribute are always enabled. In this
case running `docker compose up` would only start `backend` and `db`.
@z

@x
Valid profiles names follow the regex format of `[a-zA-Z0-9][a-zA-Z0-9_.-]+`.
@y
Valid profiles names follow the regex format of `[a-zA-Z0-9][a-zA-Z0-9_.-]+`.
@z

@x
> [!TIP]
>
> The core services of your application shouldn't be assigned `profiles` so
> they are always enabled and automatically started. Jobs also support the [`profiles` attribute](/reference/compose-file/jobs.md#profiles) and follow the same rules as services: a job with `profiles` is only active when one of its profiles is active, unless you target it with `docker compose run`.
@y
> [!TIP]
>
> The core services of your application shouldn't be assigned `profiles` so
> they are always enabled and automatically started. Jobs also support the [`profiles` attribute](reference/compose-file/jobs.md#profiles) and follow the same rules as services: a job with `profiles` is only active when one of its profiles is active, unless you target it with `docker compose run`.
@z

@x
## Start specific profiles
@y
## Start specific profiles
@z

@x
To start a specific profile supply the `--profile` [command-line option](/reference/cli/docker/compose/) or
use the [`COMPOSE_PROFILES` environment variable](environment-variables/envvars.md#compose_profiles):
@y
To start a specific profile supply the `--profile` [command-line option](__SUBDIR__/reference/cli/docker/compose/) or
use the [`COMPOSE_PROFILES` environment variable](environment-variables/envvars.md#compose_profiles):
@z

@x
```console
$ docker compose --profile debug up
```
```console
$ COMPOSE_PROFILES=debug docker compose up
```
@y
```console
$ docker compose --profile debug up
```
```console
$ COMPOSE_PROFILES=debug docker compose up
```
@z

@x
Both commands start the services with the `debug` profile enabled.
In the previous `compose.yaml` file, this starts the services
`db`, `backend` and `phpmyadmin`.
@y
Both commands start the services with the `debug` profile enabled.
In the previous `compose.yaml` file, this starts the services
`db`, `backend` and `phpmyadmin`.
@z

@x
### Start multiple profiles
@y
### Start multiple profiles
@z

@x
You can also enable
multiple profiles, e.g. with `docker compose --profile frontend --profile debug up`
the profiles `frontend` and `debug` will be enabled.
@y
You can also enable
multiple profiles, e.g. with `docker compose --profile frontend --profile debug up`
the profiles `frontend` and `debug` will be enabled.
@z

@x
Multiple profiles can be specified by passing multiple `--profile` flags or
a comma-separated list for the `COMPOSE_PROFILES` environment variable:
@y
Multiple profiles can be specified by passing multiple `--profile` flags or
a comma-separated list for the `COMPOSE_PROFILES` environment variable:
@z

@x
```console
$ docker compose --profile frontend --profile debug up
```
@y
```console
$ docker compose --profile frontend --profile debug up
```
@z

@x
```console
$ COMPOSE_PROFILES=frontend,debug docker compose up
```
@y
```console
$ COMPOSE_PROFILES=frontend,debug docker compose up
```
@z

@x
If you want to enable all profiles at the same time, you can run `docker compose --profile "*"`.
@y
If you want to enable all profiles at the same time, you can run `docker compose --profile "*"`.
@z

@x
## Auto-starting profiles and dependency resolution
@y
## Auto-starting profiles and dependency resolution
@z

@x
When you explicitly target a service on the command line that has one or more profiles assigned, you do not need to enable the profile manually as Compose runs that service regardless of whether its profile is activated. This is useful for running one-off services or debugging tools.
@y
When you explicitly target a service on the command line that has one or more profiles assigned, you do not need to enable the profile manually as Compose runs that service regardless of whether its profile is activated. This is useful for running one-off services or debugging tools.
@z

@x
Only the targeted service (and any of its declared dependencies via `depends_on`) is started. Other services that share the same profile will not be started unless:
- They are also explicitly targeted, or
- The profile is explicitly enabled using `--profile` or `COMPOSE_PROFILES`.
@y
Only the targeted service (and any of its declared dependencies via `depends_on`) is started. Other services that share the same profile will not be started unless:
- They are also explicitly targeted, or
- The profile is explicitly enabled using `--profile` or `COMPOSE_PROFILES`.
@z

@x
When a service with assigned `profiles` is explicitly targeted on the command
line its profiles are started automatically so you don't need to start them
manually. This can be used for one-off services and debugging tools.
As an example consider the following configuration:
@y
When a service with assigned `profiles` is explicitly targeted on the command
line its profiles are started automatically so you don't need to start them
manually. This can be used for one-off services and debugging tools.
As an example consider the following configuration:
@z

@x
```yaml
services:
  backend:
    image: backend
@y
```yaml
services:
  backend:
    image: backend
@z

@x
  db:
    image: mysql
@y
  db:
    image: mysql
@z

@x
  db-migrations:
    image: backend
    command: myapp migrate
    depends_on:
      - db
    profiles:
      - tools
```
@y
  db-migrations:
    image: backend
    command: myapp migrate
    depends_on:
      - db
    profiles:
      - tools
```
@z

@x
```sh
# Only start backend and db (no profiles involved)
$ docker compose up -d
@y
```sh
# Only start backend and db (no profiles involved)
$ docker compose up -d
@z

@x
# Run the db-migrations service without manually enabling the 'tools' profile
$ docker compose run db-migrations
```
@y
# Run the db-migrations service without manually enabling the 'tools' profile
$ docker compose run db-migrations
```
@z

@x
In this example, `db-migrations` runs even though it is assigned to the tools profile, because it was explicitly targeted. The `db` service is also started automatically because it is listed in `depends_on`.
@y
In this example, `db-migrations` runs even though it is assigned to the tools profile, because it was explicitly targeted. The `db` service is also started automatically because it is listed in `depends_on`.
@z

@x
If the targeted service has dependencies that are also gated behind a profile, you must ensure those dependencies are either: 
 - In the same profile
 - Started separately
 - Not assigned to any profile so are always enabled
@y
If the targeted service has dependencies that are also gated behind a profile, you must ensure those dependencies are either: 
 - In the same profile
 - Started separately
 - Not assigned to any profile so are always enabled
@z

@x
> [!TIP]
>
> A profiled service that you only ever start with `docker compose run`, such as `db-migrations` above, is often better expressed as a [job](jobs.md). Compose doesn't record whether that work succeeded once its container is removed, and nothing runs it on a schedule. A job keeps a run record with its exit code, and Docker Engine can fire it on a cron schedule. Jobs are experimental.
@y
> [!TIP]
>
> A profiled service that you only ever start with `docker compose run`, such as `db-migrations` above, is often better expressed as a [job](jobs.md). Compose doesn't record whether that work succeeded once its container is removed, and nothing runs it on a schedule. A job keeps a run record with its exit code, and Docker Engine can fire it on a cron schedule. Jobs are experimental.
@z

@x
## Stop application and services with specific profiles
@y
## Stop application and services with specific profiles
@z

@x
As with starting specific profiles, you can use the `--profile` [command-line option](/reference/cli/docker/compose/#use--p-to-specify-a-project-name) or
use the [`COMPOSE_PROFILES` environment variable](environment-variables/envvars.md#compose_profiles):
@y
As with starting specific profiles, you can use the `--profile` [command-line option](__SUBDIR__/reference/cli/docker/compose/#use--p-to-specify-a-project-name) or
use the [`COMPOSE_PROFILES` environment variable](environment-variables/envvars.md#compose_profiles):
@z

@x
```console
$ docker compose --profile debug down
```
```console
$ COMPOSE_PROFILES=debug docker compose down
```
@y
```console
$ docker compose --profile debug down
```
```console
$ COMPOSE_PROFILES=debug docker compose down
```
@z

@x
Both commands stop and remove services with the `debug` profile and services without a profile. In the following `compose.yaml` file, this stops the services `db`, `backend` and `phpmyadmin`.
@y
Both commands stop and remove services with the `debug` profile and services without a profile. In the following `compose.yaml` file, this stops the services `db`, `backend` and `phpmyadmin`.
@z

@x
```yaml
services:
  frontend:
    image: frontend
    profiles: [frontend]
@y
```yaml
services:
  frontend:
    image: frontend
    profiles: [frontend]
@z

@x
  phpmyadmin:
    image: phpmyadmin
    depends_on: [db]
    profiles: [debug]
@y
  phpmyadmin:
    image: phpmyadmin
    depends_on: [db]
    profiles: [debug]
@z

@x
  backend:
    image: backend
@y
  backend:
    image: backend
@z

@x
  db:
    image: mysql
```
@y
  db:
    image: mysql
```
@z

@x
if you only want to stop the `phpmyadmin` service, you can run 
@y
if you only want to stop the `phpmyadmin` service, you can run 
@z

@x
```console 
$ docker compose down phpmyadmin
``` 
or 
```console 
$ docker compose stop phpmyadmin
```
@y
```console 
$ docker compose down phpmyadmin
``` 
or 
```console 
$ docker compose stop phpmyadmin
```
@z

@x
> [!NOTE]
>
> Running `docker compose down` only stops `backend` and `db`.
@y
> [!NOTE]
>
> Running `docker compose down` only stops `backend` and `db`.
@z

@x
## Reference information
@y
## Reference information
@z

@x
[`profiles`](/reference/compose-file/services.md#profiles)
@y
[`profiles`](reference/compose-file/services.md#profiles)
@z
