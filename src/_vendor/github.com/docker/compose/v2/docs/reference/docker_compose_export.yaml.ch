%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker compose export
short: Export a service container's filesystem as a tar archive
long: Export a service container's filesystem as a tar archive
usage: docker compose export [OPTIONS] SERVICE
pname: docker compose
plink: docker_compose.yaml
options:
    - option: index
      value_type: int
      default_value: "0"
      description: index of the container if service has multiple replicas.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: output
      shorthand: o
      value_type: string
      description: Write to a file, instead of STDOUT
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
command: docker compose export
short: Export a service container's filesystem as a tar archive
long: Export a service container's filesystem as a tar archive
usage: docker compose export [OPTIONS] SERVICE
pname: docker compose
plink: docker_compose.yaml
options:
    - option: index
      value_type: int
      default_value: "0"
      description: index of the container if service has multiple replicas.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: output
      shorthand: o
      value_type: string
      description: Write to a file, instead of STDOUT
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
