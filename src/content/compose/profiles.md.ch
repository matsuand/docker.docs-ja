%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: Using profiles with Compose
desription: How to use profiles with Docker Compose
keywords: cli, compose, profile, profiles reference
---
@y
---
title: Using profiles with Compose
desription: How to use profiles with Docker Compose
keywords: cli, compose, profile, profiles reference
---
@z

@x
Profiles help you adjust the Compose application model for various uses and
environments by selectively starting services.
This is achieved by assigning each service to zero or more profiles. If
unassigned, the service is always started but if assigned, it is only started
if the profile is activated.
@y
Profiles help you adjust the Compose application model for various uses and
environments by selectively starting services.
This is achieved by assigning each service to zero or more profiles. If
unassigned, the service is always started but if assigned, it is only started
if the profile is activated.
@z

@x
This allows you to define additional services in a single `compose.yml` file
that should only be started in specific scenarios, for example for debugging or
development tasks.
@y
This allows you to define additional services in a single `compose.yml` file
that should only be started in specific scenarios, for example for debugging or
development tasks.
@z

@x
## Assigning profiles to services
@y
## Assigning profiles to services
@z

@x
Services are associated with profiles through the
[`profiles` attribute](compose-file/05-services.md#profiles) which takes an
array of profile names:
@y
Services are associated with profiles through the
[`profiles` attribute](compose-file/05-services.md#profiles) which takes an
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
> **Tip**
>
> The core services of your application shouldn't be assigned `profiles` so
> they are always enabled and automatically started.
{ .tip }
@y
> **Tip**
>
> The core services of your application shouldn't be assigned `profiles` so
> they are always enabled and automatically started.
{ .tip }
@z

@x
## Start specific profiles
@y
## Start specific profiles
@z

@x
To start a specific profile supply the `--profile` [command-line option](reference/index.md) or
use the [`COMPOSE_PROFILES` environment variable](environment-variables/envvars.md#compose_profiles):
@y
To start a specific profile supply the `--profile` [command-line option](reference/index.md) or
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
The above commands would both start your application with the `debug` profile enabled.
In the example, `compose.yml` file above, this starts the services `backend`,
`db` and `phpmyadmin`.
@y
The above commands would both start your application with the `debug` profile enabled.
In the example, `compose.yml` file above, this starts the services `backend`,
`db` and `phpmyadmin`.
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
# Only start backend and db
$ docker compose up -d
@y
```sh
# Only start backend and db
$ docker compose up -d
@z

@x
# This runs db-migrations (and,if necessary, start db)
# by implicitly enabling the profiles `tools`
$ docker compose run db-migrations
```
@y
# This runs db-migrations (and,if necessary, start db)
# by implicitly enabling the profiles `tools`
$ docker compose run db-migrations
```
@z

@x
But keep in mind that `docker compose` only automatically starts the
profiles of the services on the command line and not of any dependencies. 
@y
But keep in mind that `docker compose` only automatically starts the
profiles of the services on the command line and not of any dependencies. 
@z

@x
This means that any other services the targeted service `depends_on` should either:
- Share a common profile 
- Always be started, by omitting `profiles` or having a matching profile started explicitly
@y
This means that any other services the targeted service `depends_on` should either:
- Share a common profile 
- Always be started, by omitting `profiles` or having a matching profile started explicitly
@z

@x
```yaml
services:
  web:
    image: web
@y
```yaml
services:
  web:
    image: web
@z

@x
  mock-backend:
    image: backend
    profiles: ["dev"]
    depends_on:
      - db
@y
  mock-backend:
    image: backend
    profiles: ["dev"]
    depends_on:
      - db
@z

@x
  db:
    image: mysql
    profiles: ["dev"]
@y
  db:
    image: mysql
    profiles: ["dev"]
@z

@x
  phpmyadmin:
    image: phpmyadmin
    profiles: ["debug"]
    depends_on:
      - db
```
@y
  phpmyadmin:
    image: phpmyadmin
    profiles: ["debug"]
    depends_on:
      - db
```
@z

@x
```sh
# Only start "web"
$ docker compose up -d
@y
```sh
# Only start "web"
$ docker compose up -d
@z

@x
# Start mock-backend (and, if necessary, db)
# by implicitly enabling profiles `dev`
$ docker compose up -d mock-backend
@y
# Start mock-backend (and, if necessary, db)
# by implicitly enabling profiles `dev`
$ docker compose up -d mock-backend
@z

@x
# This fails because profiles "dev" is not enabled
$ docker compose up phpmyadmin
```
@y
# This fails because profiles "dev" is not enabled
$ docker compose up phpmyadmin
```
@z

@x
Although targeting `phpmyadmin` automatically starts the profiles `debug`, it doesn't automatically start the profiles required by `db` which is `dev`. 
@y
Although targeting `phpmyadmin` automatically starts the profiles `debug`, it doesn't automatically start the profiles required by `db` which is `dev`. 
@z

@x
To fix this you either have to add the `debug` profile to the `db` service:
@y
To fix this you either have to add the `debug` profile to the `db` service:
@z

@x
```yaml
db:
  image: mysql
  profiles: ["debug", "dev"]
```
@y
```yaml
db:
  image: mysql
  profiles: ["debug", "dev"]
```
@z

@x
or start the `dev` profile explicitly:
@y
or start the `dev` profile explicitly:
@z

@x
```console
# Profiles "debug" is started automatically by targeting phpmyadmin
$ docker compose --profile dev up phpmyadmin
$ COMPOSE_PROFILES=dev docker compose up phpmyadmin
```
@y
```console
# Profiles "debug" is started automatically by targeting phpmyadmin
$ docker compose --profile dev up phpmyadmin
$ COMPOSE_PROFILES=dev docker compose up phpmyadmin
```
@z

@x
## Reference information
@y
## Reference information
@z

@x
[`profiles`](compose-file/05-services.md#profiles)
@y
[`profiles`](compose-file/05-services.md#profiles)
@z
