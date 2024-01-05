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
    [restart](https://github.com/compose-spec/compose-spec/blob/master/spec.md#restart)
    or [restart_policy](https://github.com/compose-spec/compose-spec/blob/master/deploy.md#restart_policy).
usage: docker compose restart [OPTIONS] [SERVICE...]
pname: docker compose
plink: docker_compose.yaml
options:
    - option: no-deps
      value_type: bool
      default_value: "false"
      description: Don't restart dependent services.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: timeout
      shorthand: t
      value_type: int
      default_value: "0"
      description: Specify a shutdown timeout in seconds
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: dry-run
      value_type: bool
      default_value: "false"
      description: Execute command in dry run mode
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    If you are looking to configure a service's restart policy, refer to
    [restart](https://github.com/compose-spec/compose-spec/blob/master/spec.md#restart)
    or [restart_policy](https://github.com/compose-spec/compose-spec/blob/master/deploy.md#restart_policy).
usage: docker compose restart [OPTIONS] [SERVICE...]
pname: docker compose
plink: docker_compose.yaml
options:
    - option: no-deps
      value_type: bool
      default_value: "false"
      description: Don't restart dependent services.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: timeout
      shorthand: t
      value_type: int
      default_value: "0"
      description: Specify a shutdown timeout in seconds
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: dry-run
      value_type: bool
      default_value: "false"
      description: Execute command in dry run mode
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
