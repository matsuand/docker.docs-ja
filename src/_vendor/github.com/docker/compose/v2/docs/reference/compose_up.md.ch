%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker compose up
@y
# docker compose up
@z

@x
<!---MARKER_GEN_START-->
Create and start containers
@y
<!---MARKER_GEN_START-->
Create and start containers
@z

@x
### Options
@y
### Options
@z

@x
| Name                           | Type          | Default  | Description                                                                                                                                         |
|:-------------------------------|:--------------|:---------|:----------------------------------------------------------------------------------------------------------------------------------------------------|
| `--abort-on-container-exit`    |               |          | Stops all containers if any container was stopped. Incompatible with -d                                                                             |
| `--abort-on-container-failure` |               |          | Stops all containers if any container exited with failure. Incompatible with -d                                                                     |
| `--always-recreate-deps`       |               |          | Recreate dependent containers. Incompatible with --no-recreate.                                                                                     |
| `--attach`                     | `stringArray` |          | Restrict attaching to the specified services. Incompatible with --attach-dependencies.                                                              |
| `--attach-dependencies`        |               |          | Automatically attach to log output of dependent services                                                                                            |
| `--build`                      |               |          | Build images before starting containers                                                                                                             |
| `-d`, `--detach`               |               |          | Detached mode: Run containers in the background                                                                                                     |
| `--dry-run`                    |               |          | Execute command in dry run mode                                                                                                                     |
| `--exit-code-from`             | `string`      |          | Return the exit code of the selected service container. Implies --abort-on-container-exit                                                           |
| `--force-recreate`             |               |          | Recreate containers even if their configuration and image haven't changed                                                                           |
| `--menu`                       |               |          | Enable interactive shortcuts when running attached. Incompatible with --detach. Can also be enable/disable by setting COMPOSE_MENU environment var. |
| `--no-attach`                  | `stringArray` |          | Do not attach (stream logs) to the specified services                                                                                               |
| `--no-build`                   |               |          | Don't build an image, even if it's policy                                                                                                           |
| `--no-color`                   |               |          | Produce monochrome output                                                                                                                           |
| `--no-deps`                    |               |          | Don't start linked services                                                                                                                         |
| `--no-log-prefix`              |               |          | Don't print prefix in logs                                                                                                                          |
| `--no-recreate`                |               |          | If containers already exist, don't recreate them. Incompatible with --force-recreate.                                                               |
| `--no-start`                   |               |          | Don't start the services after creating them                                                                                                        |
| `--pull`                       | `string`      | `policy` | Pull image before running ("always"\|"missing"\|"never")                                                                                            |
| `--quiet-pull`                 |               |          | Pull without printing progress information                                                                                                          |
| `--remove-orphans`             |               |          | Remove containers for services not defined in the Compose file                                                                                      |
| `-V`, `--renew-anon-volumes`   |               |          | Recreate anonymous volumes instead of retrieving data from the previous containers                                                                  |
| `--scale`                      | `stringArray` |          | Scale SERVICE to NUM instances. Overrides the `scale` setting in the Compose file if present.                                                       |
| `-t`, `--timeout`              | `int`         | `0`      | Use this timeout in seconds for container shutdown when attached or when containers are already running                                             |
| `--timestamps`                 |               |          | Show timestamps                                                                                                                                     |
| `--wait`                       |               |          | Wait for services to be running\|healthy. Implies detached mode.                                                                                    |
| `--wait-timeout`               | `int`         | `0`      | Maximum duration to wait for the project to be running\|healthy                                                                                     |
| `-w`, `--watch`                |               |          | Watch source code and rebuild/refresh containers when files are updated.                                                                            |
@y
| Name                           | Type          | Default  | Description                                                                                                                                         |
|:-------------------------------|:--------------|:---------|:----------------------------------------------------------------------------------------------------------------------------------------------------|
| `--abort-on-container-exit`    |               |          | Stops all containers if any container was stopped. Incompatible with -d                                                                             |
| `--abort-on-container-failure` |               |          | Stops all containers if any container exited with failure. Incompatible with -d                                                                     |
| `--always-recreate-deps`       |               |          | Recreate dependent containers. Incompatible with --no-recreate.                                                                                     |
| `--attach`                     | `stringArray` |          | Restrict attaching to the specified services. Incompatible with --attach-dependencies.                                                              |
| `--attach-dependencies`        |               |          | Automatically attach to log output of dependent services                                                                                            |
| `--build`                      |               |          | Build images before starting containers                                                                                                             |
| `-d`, `--detach`               |               |          | Detached mode: Run containers in the background                                                                                                     |
| `--dry-run`                    |               |          | Execute command in dry run mode                                                                                                                     |
| `--exit-code-from`             | `string`      |          | Return the exit code of the selected service container. Implies --abort-on-container-exit                                                           |
| `--force-recreate`             |               |          | Recreate containers even if their configuration and image haven't changed                                                                           |
| `--menu`                       |               |          | Enable interactive shortcuts when running attached. Incompatible with --detach. Can also be enable/disable by setting COMPOSE_MENU environment var. |
| `--no-attach`                  | `stringArray` |          | Do not attach (stream logs) to the specified services                                                                                               |
| `--no-build`                   |               |          | Don't build an image, even if it's policy                                                                                                           |
| `--no-color`                   |               |          | Produce monochrome output                                                                                                                           |
| `--no-deps`                    |               |          | Don't start linked services                                                                                                                         |
| `--no-log-prefix`              |               |          | Don't print prefix in logs                                                                                                                          |
| `--no-recreate`                |               |          | If containers already exist, don't recreate them. Incompatible with --force-recreate.                                                               |
| `--no-start`                   |               |          | Don't start the services after creating them                                                                                                        |
| `--pull`                       | `string`      | `policy` | Pull image before running ("always"\|"missing"\|"never")                                                                                            |
| `--quiet-pull`                 |               |          | Pull without printing progress information                                                                                                          |
| `--remove-orphans`             |               |          | Remove containers for services not defined in the Compose file                                                                                      |
| `-V`, `--renew-anon-volumes`   |               |          | Recreate anonymous volumes instead of retrieving data from the previous containers                                                                  |
| `--scale`                      | `stringArray` |          | Scale SERVICE to NUM instances. Overrides the `scale` setting in the Compose file if present.                                                       |
| `-t`, `--timeout`              | `int`         | `0`      | Use this timeout in seconds for container shutdown when attached or when containers are already running                                             |
| `--timestamps`                 |               |          | Show timestamps                                                                                                                                     |
| `--wait`                       |               |          | Wait for services to be running\|healthy. Implies detached mode.                                                                                    |
| `--wait-timeout`               | `int`         | `0`      | Maximum duration to wait for the project to be running\|healthy                                                                                     |
| `-w`, `--watch`                |               |          | Watch source code and rebuild/refresh containers when files are updated.                                                                            |
@z

@x
<!---MARKER_GEN_END-->
@y
<!---MARKER_GEN_END-->
@z

@x
## Description
@y
## Description
@z

@x
Builds, (re)creates, starts, and attaches to containers for a service.
@y
Builds, (re)creates, starts, and attaches to containers for a service.
@z

@x
Unless they are already running, this command also starts any linked services.
@y
Unless they are already running, this command also starts any linked services.
@z

@x
The `docker compose up` command aggregates the output of each container (like `docker compose logs --follow` does).
One can optionally select a subset of services to attach to using `--attach` flag, or exclude some services using 
`--no-attach` to prevent output to be flooded by some verbose services. 
@y
The `docker compose up` command aggregates the output of each container (like `docker compose logs --follow` does).
One can optionally select a subset of services to attach to using `--attach` flag, or exclude some services using 
`--no-attach` to prevent output to be flooded by some verbose services. 
@z

@x
When the command exits, all containers are stopped. Running `docker compose up --detach` starts the containers in the
background and leaves them running.
@y
When the command exits, all containers are stopped. Running `docker compose up --detach` starts the containers in the
background and leaves them running.
@z

@x
If there are existing containers for a service, and the service’s configuration or image was changed after the
container’s creation, `docker compose up` picks up the changes by stopping and recreating the containers
(preserving mounted volumes). To prevent Compose from picking up changes, use the `--no-recreate` flag.
@y
If there are existing containers for a service, and the service’s configuration or image was changed after the
container’s creation, `docker compose up` picks up the changes by stopping and recreating the containers
(preserving mounted volumes). To prevent Compose from picking up changes, use the `--no-recreate` flag.
@z

@x
If you want to force Compose to stop and recreate all containers, use the `--force-recreate` flag.
@y
If you want to force Compose to stop and recreate all containers, use the `--force-recreate` flag.
@z

@x
If the process encounters an error, the exit code for this command is `1`.
If the process is interrupted using `SIGINT` (ctrl + C) or `SIGTERM`, the containers are stopped, and the exit code is `0`.
@y
If the process encounters an error, the exit code for this command is `1`.
If the process is interrupted using `SIGINT` (ctrl + C) or `SIGTERM`, the containers are stopped, and the exit code is `0`.
@z
