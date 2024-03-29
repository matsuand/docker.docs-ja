%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker compose port
short: Print the public port for a port binding
long: Prints the public port for a port binding
usage: docker compose port [OPTIONS] SERVICE PRIVATE_PORT
pname: docker compose
plink: docker_compose.yaml
options:
    - option: index
      value_type: int
      default_value: "0"
      description: Index of the container if service has multiple replicas
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: protocol
      value_type: string
      default_value: tcp
      description: tcp or udp
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
command: docker compose port
short: Print the public port for a port binding
long: Prints the public port for a port binding
usage: docker compose port [OPTIONS] SERVICE PRIVATE_PORT
pname: docker compose
plink: docker_compose.yaml
options:
    - option: index
      value_type: int
      default_value: "0"
      description: Index of the container if service has multiple replicas
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: protocol
      value_type: string
      default_value: tcp
      description: tcp or udp
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
