%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

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

% snip code...

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
> they are always enabled and automatically started.
@y
> [!TIP]
>
> The core services of your application shouldn't be assigned `profiles` so
> they are always enabled and automatically started.
@z

@x
## Start specific profiles
@y
## Start specific profiles
@z

@x
To start a specific profile supply the `--profile` [command-line option](/reference/cli/docker/compose.md) or
use the [`COMPOSE_PROFILES` environment variable](environment-variables/envvars.md#compose_profiles):
@y
To start a specific profile supply the `--profile` [command-line option](reference/cli/docker/compose.md) or
use the [`COMPOSE_PROFILES` environment variable](environment-variables/envvars.md#compose_profiles):
@z

% snip command...

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

% snip command...

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

% snip code...

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

% snip code...

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

% snip code...

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
## Stop specific profiles
@y
## Stop specific profiles
@z

@x
As with starting specific profiles, you can use the `--profile` [command-line option](/reference/cli/docker/compose.md#use--p-to-specify-a-project-name) or
use the [`COMPOSE_PROFILES` environment variable](environment-variables/envvars.md#compose_profiles):
@y
As with starting specific profiles, you can use the `--profile` [command-line option](reference/cli/docker/compose.md#use--p-to-specify-a-project-name) or
use the [`COMPOSE_PROFILES` environment variable](environment-variables/envvars.md#compose_profiles):
@z

% snip command...

@x
Both commands stop and remove services with the `debug` profile. In the following `compose.yaml` file, this stops the services `db` and `phpmyadmin`.
@y
Both commands stop and remove services with the `debug` profile. In the following `compose.yaml` file, this stops the services `db` and `phpmyadmin`.
@z

% snip code...

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
