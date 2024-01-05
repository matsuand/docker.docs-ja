%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker compose kill
short: Force stop service containers.
long: |-
    Forces running containers to stop by sending a `SIGKILL` signal. Optionally the signal can be passed, for example:
@y
command: docker compose kill
short: Force stop service containers.
long: |-
    Forces running containers to stop by sending a `SIGKILL` signal. Optionally the signal can be passed, for example:
@z

@x
    ```console
    $ docker-compose kill -s SIGINT
    ```
usage: docker compose kill [OPTIONS] [SERVICE...]
pname: docker compose
plink: docker_compose.yaml
options:
    - option: remove-orphans
      value_type: bool
      default_value: "false"
      description: Remove containers for services not defined in the Compose file.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: signal
      shorthand: s
      value_type: string
      default_value: SIGKILL
      description: SIGNAL to send to the container.
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
    $ docker-compose kill -s SIGINT
    ```
usage: docker compose kill [OPTIONS] [SERVICE...]
pname: docker compose
plink: docker_compose.yaml
options:
    - option: remove-orphans
      value_type: bool
      default_value: "false"
      description: Remove containers for services not defined in the Compose file.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: signal
      shorthand: s
      value_type: string
      default_value: SIGKILL
      description: SIGNAL to send to the container.
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
