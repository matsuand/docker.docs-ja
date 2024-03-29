%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker compose attach
short: |
    Attach local standard input, output, and error streams to a service's running container
long: |
    Attach local standard input, output, and error streams to a service's running container
usage: docker compose attach [OPTIONS] SERVICE
pname: docker compose
plink: docker_compose.yaml
options:
    - option: detach-keys
      value_type: string
      description: Override the key sequence for detaching from a container.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
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
    - option: no-stdin
      value_type: bool
      default_value: "false"
      description: Do not attach STDIN
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: sig-proxy
      value_type: bool
      default_value: "true"
      description: Proxy all received signals to the process
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
command: docker compose attach
short: |
    Attach local standard input, output, and error streams to a service's running container
long: |
    Attach local standard input, output, and error streams to a service's running container
usage: docker compose attach [OPTIONS] SERVICE
pname: docker compose
plink: docker_compose.yaml
options:
    - option: detach-keys
      value_type: string
      description: Override the key sequence for detaching from a container.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
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
    - option: no-stdin
      value_type: bool
      default_value: "false"
      description: Do not attach STDIN
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: sig-proxy
      value_type: bool
      default_value: "true"
      description: Proxy all received signals to the process
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
