%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker compose top
@y
# docker compose top
@z

@x
<!---MARKER_GEN_START-->
Display the running processes
@y
<!---MARKER_GEN_START-->
Display the running processes
@z

@x
### Options
@y
### Options
@z

@x
| Name        | Type | Default | Description                     |
|:------------|:-----|:--------|:--------------------------------|
| `--dry-run` |      |         | Execute command in dry run mode |
@y
| Name        | Type | Default | Description                     |
|:------------|:-----|:--------|:--------------------------------|
| `--dry-run` |      |         | Execute command in dry run mode |
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
Displays the running processes.
@y
Displays the running processes.
@z

@x
## Examples
@y
## Examples
@z

@x
```console
$ docker compose top
example_foo_1
UID    PID      PPID     C    STIME   TTY   TIME       CMD
root   142353   142331   2    15:33   ?     00:00:00   ping localhost -c 5
```
@y
```console
$ docker compose top
example_foo_1
UID    PID      PPID     C    STIME   TTY   TIME       CMD
root   142353   142331   2    15:33   ?     00:00:00   ping localhost -c 5
```
@z
