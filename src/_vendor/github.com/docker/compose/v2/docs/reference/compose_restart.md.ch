%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
# docker compose restart
@y
# docker compose restart
@z

@x
<!---MARKER_GEN_START-->
Restarts all stopped and running services, or the specified services only.
@y
<!---MARKER_GEN_START-->
Restarts all stopped and running services, or the specified services only.
@z

@x
If you make changes to your `compose.yml` configuration, these changes are not reflected
after running this command. For example, changes to environment variables (which are added
after a container is built, but before the container's command is executed) are not updated
after restarting.
@y
If you make changes to your `compose.yml` configuration, these changes are not reflected
after running this command. For example, changes to environment variables (which are added
after a container is built, but before the container's command is executed) are not updated
after restarting.
@z

@x
If you are looking to configure a service's restart policy, refer to
[restart](https://github.com/compose-spec/compose-spec/blob/master/spec.md#restart)
or [restart_policy](https://github.com/compose-spec/compose-spec/blob/master/deploy.md#restart_policy).
@y
If you are looking to configure a service's restart policy, refer to
[restart](https://github.com/compose-spec/compose-spec/blob/master/spec.md#restart)
or [restart_policy](https://github.com/compose-spec/compose-spec/blob/master/deploy.md#restart_policy).
@z

@x
### Options
@y
### Options
@z

@x
| Name              | Type   | Default | Description                           |
|:------------------|:-------|:--------|:--------------------------------------|
| `--dry-run`       | `bool` |         | Execute command in dry run mode       |
| `--no-deps`       | `bool` |         | Don't restart dependent services      |
| `-t`, `--timeout` | `int`  | `0`     | Specify a shutdown timeout in seconds |
@y
| Name              | Type   | Default | Description                           |
|:------------------|:-------|:--------|:--------------------------------------|
| `--dry-run`       | `bool` |         | Execute command in dry run mode       |
| `--no-deps`       | `bool` |         | Don't restart dependent services      |
| `-t`, `--timeout` | `int`  | `0`     | Specify a shutdown timeout in seconds |
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
Restarts all stopped and running services, or the specified services only.
@y
Restarts all stopped and running services, or the specified services only.
@z

@x
If you make changes to your `compose.yml` configuration, these changes are not reflected
after running this command. For example, changes to environment variables (which are added
after a container is built, but before the container's command is executed) are not updated
after restarting.
@y
If you make changes to your `compose.yml` configuration, these changes are not reflected
after running this command. For example, changes to environment variables (which are added
after a container is built, but before the container's command is executed) are not updated
after restarting.
@z

@x
If you are looking to configure a service's restart policy, refer to
[restart](https://github.com/compose-spec/compose-spec/blob/master/spec.md#restart)
or [restart_policy](https://github.com/compose-spec/compose-spec/blob/master/deploy.md#restart_policy).
@y
If you are looking to configure a service's restart policy, refer to
[restart](https://github.com/compose-spec/compose-spec/blob/master/spec.md#restart)
or [restart_policy](https://github.com/compose-spec/compose-spec/blob/master/deploy.md#restart_policy).
@z
