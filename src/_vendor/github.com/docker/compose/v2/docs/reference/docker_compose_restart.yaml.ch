%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker compose restart
short: Restart service containers
long: |-
    Restarts all stopped and running services, or the specified services only.
@y
command: docker compose restart
short: Restart service containers
long: |-
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
    [restart](https://github.com/compose-spec/compose-spec/blob/main/spec.md#restart)
    or [restart_policy](https://github.com/compose-spec/compose-spec/blob/main/deploy.md#restart_policy).
@y
    If you are looking to configure a service's restart policy, refer to
    [restart](https://github.com/compose-spec/compose-spec/blob/main/spec.md#restart)
    or [restart_policy](https://github.com/compose-spec/compose-spec/blob/main/deploy.md#restart_policy).
@z

@x
usage: docker compose restart [OPTIONS] [SERVICE...]
@y
usage: docker compose restart [OPTIONS] [SERVICE...]
@z

% options:

@x no-deps
      description: Don't restart dependent services
@y
      description: Don't restart dependent services
@z

@x timeout
      description: Specify a shutdown timeout in seconds
@y
      description: Specify a shutdown timeout in seconds
@z

% inherited_options:

@x dry-run
      description: Execute command in dry run mode
@y
      description: Execute command in dry run mode
@z

% snip directives...
