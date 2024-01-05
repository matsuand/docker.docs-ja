%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker compose stop
short: Stop services
long: |
    Stops running containers without removing them. They can be started again with `docker compose start`.
usage: docker compose stop [OPTIONS] [SERVICE...]
pname: docker compose
plink: docker_compose.yaml
options:
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
command: docker compose stop
short: Stop services
long: |
    Stops running containers without removing them. They can be started again with `docker compose start`.
usage: docker compose stop [OPTIONS] [SERVICE...]
pname: docker compose
plink: docker_compose.yaml
options:
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
