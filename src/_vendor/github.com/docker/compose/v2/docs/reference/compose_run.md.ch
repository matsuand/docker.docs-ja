%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker compose run
@y
# docker compose run
@z

@x
<!---MARKER_GEN_START-->
Run a one-off command on a service
@y
<!---MARKER_GEN_START-->
Run a one-off command on a service
@z

@x
### Options
@y
### Options
@z

@x
| Name                    | Type          | Default | Description                                                                      |
|:------------------------|:--------------|:--------|:---------------------------------------------------------------------------------|
| `--build`               |               |         | Build image before starting container                                            |
| `--cap-add`             | `list`        |         | Add Linux capabilities                                                           |
| `--cap-drop`            | `list`        |         | Drop Linux capabilities                                                          |
| `-d`, `--detach`        |               |         | Run container in background and print container ID                               |
| `--dry-run`             |               |         | Execute command in dry run mode                                                  |
| `--entrypoint`          | `string`      |         | Override the entrypoint of the image                                             |
| `-e`, `--env`           | `stringArray` |         | Set environment variables                                                        |
| `-i`, `--interactive`   |               |         | Keep STDIN open even if not attached                                             |
| `-l`, `--label`         | `stringArray` |         | Add or override a label                                                          |
| `--name`                | `string`      |         | Assign a name to the container                                                   |
| `-T`, `--no-TTY`        |               |         | Disable pseudo-TTY allocation (default: auto-detected)                           |
| `--no-deps`             |               |         | Don't start linked services                                                      |
| `-p`, `--publish`       | `stringArray` |         | Publish a container's port(s) to the host                                        |
| `--quiet-pull`          |               |         | Pull without printing progress information                                       |
| `--remove-orphans`      |               |         | Remove containers for services not defined in the Compose file                   |
| `--rm`                  |               |         | Automatically remove the container when it exits                                 |
| `-P`, `--service-ports` |               |         | Run command with all service's ports enabled and mapped to the host              |
| `--use-aliases`         |               |         | Use the service's network useAliases in the network(s) the container connects to |
| `-u`, `--user`          | `string`      |         | Run as specified username or uid                                                 |
| `-v`, `--volume`        | `stringArray` |         | Bind mount a volume                                                              |
| `-w`, `--workdir`       | `string`      |         | Working directory inside the container                                           |
@y
| Name                    | Type          | Default | Description                                                                      |
|:------------------------|:--------------|:--------|:---------------------------------------------------------------------------------|
| `--build`               |               |         | Build image before starting container                                            |
| `--cap-add`             | `list`        |         | Add Linux capabilities                                                           |
| `--cap-drop`            | `list`        |         | Drop Linux capabilities                                                          |
| `-d`, `--detach`        |               |         | Run container in background and print container ID                               |
| `--dry-run`             |               |         | Execute command in dry run mode                                                  |
| `--entrypoint`          | `string`      |         | Override the entrypoint of the image                                             |
| `-e`, `--env`           | `stringArray` |         | Set environment variables                                                        |
| `-i`, `--interactive`   |               |         | Keep STDIN open even if not attached                                             |
| `-l`, `--label`         | `stringArray` |         | Add or override a label                                                          |
| `--name`                | `string`      |         | Assign a name to the container                                                   |
| `-T`, `--no-TTY`        |               |         | Disable pseudo-TTY allocation (default: auto-detected)                           |
| `--no-deps`             |               |         | Don't start linked services                                                      |
| `-p`, `--publish`       | `stringArray` |         | Publish a container's port(s) to the host                                        |
| `--quiet-pull`          |               |         | Pull without printing progress information                                       |
| `--remove-orphans`      |               |         | Remove containers for services not defined in the Compose file                   |
| `--rm`                  |               |         | Automatically remove the container when it exits                                 |
| `-P`, `--service-ports` |               |         | Run command with all service's ports enabled and mapped to the host              |
| `--use-aliases`         |               |         | Use the service's network useAliases in the network(s) the container connects to |
| `-u`, `--user`          | `string`      |         | Run as specified username or uid                                                 |
| `-v`, `--volume`        | `stringArray` |         | Bind mount a volume                                                              |
| `-w`, `--workdir`       | `string`      |         | Working directory inside the container                                           |
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
Runs a one-time command against a service.
@y
Runs a one-time command against a service.
@z

@x
The following command starts the `web` service and runs `bash` as its command:
@y
The following command starts the `web` service and runs `bash` as its command:
@z

@x
```console
$ docker compose run web bash
```
@y
```console
$ docker compose run web bash
```
@z

@x
Commands you use with run start in new containers with configuration defined by that of the service,
including volumes, links, and other details. However, there are two important differences:
@y
Commands you use with run start in new containers with configuration defined by that of the service,
including volumes, links, and other details. However, there are two important differences:
@z

@x
First, the command passed by `run` overrides the command defined in the service configuration. For example, if the
`web` service configuration is started with `bash`, then `docker compose run web python app.py` overrides it with
`python app.py`.
@y
First, the command passed by `run` overrides the command defined in the service configuration. For example, if the
`web` service configuration is started with `bash`, then `docker compose run web python app.py` overrides it with
`python app.py`.
@z

@x
The second difference is that the `docker compose run` command does not create any of the ports specified in the
service configuration. This prevents port collisions with already-open ports. If you do want the service’s ports
to be created and mapped to the host, specify the `--service-ports`
@y
The second difference is that the `docker compose run` command does not create any of the ports specified in the
service configuration. This prevents port collisions with already-open ports. If you do want the service’s ports
to be created and mapped to the host, specify the `--service-ports`
@z

@x
```console
$ docker compose run --service-ports web python manage.py shell
```
@y
```console
$ docker compose run --service-ports web python manage.py shell
```
@z

@x
Alternatively, manual port mapping can be specified with the `--publish` or `-p` options, just as when using docker run:
@y
Alternatively, manual port mapping can be specified with the `--publish` or `-p` options, just as when using docker run:
@z

@x
```console
$ docker compose run --publish 8080:80 -p 2022:22 -p 127.0.0.1:2021:21 web python manage.py shell
```
@y
```console
$ docker compose run --publish 8080:80 -p 2022:22 -p 127.0.0.1:2021:21 web python manage.py shell
```
@z

@x
If you start a service configured with links, the run command first checks to see if the linked service is running
and starts the service if it is stopped. Once all the linked services are running, the run executes the command you
passed it. For example, you could run:
@y
If you start a service configured with links, the run command first checks to see if the linked service is running
and starts the service if it is stopped. Once all the linked services are running, the run executes the command you
passed it. For example, you could run:
@z

@x
```console
$ docker compose run db psql -h db -U docker
```
@y
```console
$ docker compose run db psql -h db -U docker
```
@z

@x
This opens an interactive PostgreSQL shell for the linked `db` container.
@y
This opens an interactive PostgreSQL shell for the linked `db` container.
@z

@x
If you do not want the run command to start linked containers, use the `--no-deps` flag:
@y
If you do not want the run command to start linked containers, use the `--no-deps` flag:
@z

@x
```console
$ docker compose run --no-deps web python manage.py shell
```
@y
```console
$ docker compose run --no-deps web python manage.py shell
```
@z

@x
If you want to remove the container after running while overriding the container’s restart policy, use the `--rm` flag:
@y
If you want to remove the container after running while overriding the container’s restart policy, use the `--rm` flag:
@z

@x
```console
$ docker compose run --rm web python manage.py db upgrade
```
@y
```console
$ docker compose run --rm web python manage.py db upgrade
```
@z

@x
This runs a database upgrade script, and removes the container when finished running, even if a restart policy is
specified in the service configuration.
@y
This runs a database upgrade script, and removes the container when finished running, even if a restart policy is
specified in the service configuration.
@z
