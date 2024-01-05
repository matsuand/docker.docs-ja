%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker compose rm
@y
# docker compose rm
@z

@x
<!---MARKER_GEN_START-->
Removes stopped service containers
@y
<!---MARKER_GEN_START-->
Removes stopped service containers
@z

@x
By default, anonymous volumes attached to containers will not be removed. You
can override this with -v. To list all volumes, use "docker volume ls".
@y
By default, anonymous volumes attached to containers will not be removed. You
can override this with -v. To list all volumes, use "docker volume ls".
@z

@x
Any data which is not in a volume will be lost.
@y
Any data which is not in a volume will be lost.
@z

@x
### Options
@y
### Options
@z

@x
| Name              | Type | Default | Description                                         |
|:------------------|:-----|:--------|:----------------------------------------------------|
| `--dry-run`       |      |         | Execute command in dry run mode                     |
| `-f`, `--force`   |      |         | Don't ask to confirm removal                        |
| `-s`, `--stop`    |      |         | Stop the containers, if required, before removing   |
| `-v`, `--volumes` |      |         | Remove any anonymous volumes attached to containers |
@y
| Name              | Type | Default | Description                                         |
|:------------------|:-----|:--------|:----------------------------------------------------|
| `--dry-run`       |      |         | Execute command in dry run mode                     |
| `-f`, `--force`   |      |         | Don't ask to confirm removal                        |
| `-s`, `--stop`    |      |         | Stop the containers, if required, before removing   |
| `-v`, `--volumes` |      |         | Remove any anonymous volumes attached to containers |
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
Removes stopped service containers.
@y
Removes stopped service containers.
@z

@x
By default, anonymous volumes attached to containers are not removed. You can override this with `-v`. To list all
volumes, use `docker volume ls`.
@y
By default, anonymous volumes attached to containers are not removed. You can override this with `-v`. To list all
volumes, use `docker volume ls`.
@z

@x
Any data which is not in a volume is lost.
@y
Any data which is not in a volume is lost.
@z

@x
Running the command with no options also removes one-off containers created by `docker compose run`:
@y
Running the command with no options also removes one-off containers created by `docker compose run`:
@z

@x
```console
$ docker compose rm
Going to remove djangoquickstart_web_run_1
Are you sure? [yN] y
Removing djangoquickstart_web_run_1 ... done
```
@y
```console
$ docker compose rm
Going to remove djangoquickstart_web_run_1
Are you sure? [yN] y
Removing djangoquickstart_web_run_1 ... done
```
@z
