%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker compose wait
short: Block until containers of all (or specified) services stop.
long: Block until containers of all (or specified) services stop.
usage: docker compose wait SERVICE [SERVICE...] [OPTIONS]
pname: docker compose
plink: docker_compose.yaml
options:
    - option: down-project
      value_type: bool
      default_value: "false"
      description: Drops project when the first container stops
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
command: docker compose wait
short: Block until containers of all (or specified) services stop.
long: Block until containers of all (or specified) services stop.
usage: docker compose wait SERVICE [SERVICE...] [OPTIONS]
pname: docker compose
plink: docker_compose.yaml
options:
    - option: down-project
      value_type: bool
      default_value: "false"
      description: Drops project when the first container stops
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
