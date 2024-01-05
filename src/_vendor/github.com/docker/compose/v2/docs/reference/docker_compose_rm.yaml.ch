%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker compose rm
short: Removes stopped service containers
long: |-
    Removes stopped service containers.
@y
command: docker compose rm
short: Removes stopped service containers
long: |-
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
usage: docker compose rm [OPTIONS] [SERVICE...]
pname: docker compose
plink: docker_compose.yaml
options:
    - option: all
      shorthand: a
      value_type: bool
      default_value: "false"
      description: Deprecated - no effect
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: force
      shorthand: f
      value_type: bool
      default_value: "false"
      description: Don't ask to confirm removal
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: stop
      shorthand: s
      value_type: bool
      default_value: "false"
      description: Stop the containers, if required, before removing
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: volumes
      shorthand: v
      value_type: bool
      default_value: "false"
      description: Remove any anonymous volumes attached to containers
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
    ```console
    $ docker compose rm
    Going to remove djangoquickstart_web_run_1
    Are you sure? [yN] y
    Removing djangoquickstart_web_run_1 ... done
    ```
usage: docker compose rm [OPTIONS] [SERVICE...]
pname: docker compose
plink: docker_compose.yaml
options:
    - option: all
      shorthand: a
      value_type: bool
      default_value: "false"
      description: Deprecated - no effect
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: force
      shorthand: f
      value_type: bool
      default_value: "false"
      description: Don't ask to confirm removal
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: stop
      shorthand: s
      value_type: bool
      default_value: "false"
      description: Stop the containers, if required, before removing
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: volumes
      shorthand: v
      value_type: bool
      default_value: "false"
      description: Remove any anonymous volumes attached to containers
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
