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

@x within code
# Only start backend and db (no profiles involved)
@y
# Only start backend and db (no profiles involved)
@z

@x
# Run the db-migrations service without manually enabling the 'tools' profile
@y
# Run the db-migrations service without manually enabling the 'tools' profile
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
## Stop application and services with specific profiles
@y
## Stop application and services with specific profiles
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
Both commands stop and remove services with the `debug` profile and services without a profile. In the following `compose.yaml` file, this stops the services `db`, `backend` and `phpmyadmin`.
@y
Both commands stop and remove services with the `debug` profile and services without a profile. In the following `compose.yaml` file, this stops the services `db`, `backend` and `phpmyadmin`.
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
