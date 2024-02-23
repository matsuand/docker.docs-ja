%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker compose images
short: List images used by the created containers
long: List images used by the created containers
usage: docker compose images [OPTIONS] [SERVICE...]
pname: docker compose
plink: docker_compose.yaml
options:
    - option: format
      value_type: string
      default_value: table
      description: 'Format the output. Values: [table | json]'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: quiet
      shorthand: q
      value_type: bool
      default_value: "false"
      description: Only display IDs
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
command: docker compose images
short: List images used by the created containers
long: List images used by the created containers
usage: docker compose images [OPTIONS] [SERVICE...]
pname: docker compose
plink: docker_compose.yaml
options:
    - option: format
      value_type: string
      default_value: table
      description: 'Format the output. Values: [table | json]'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: quiet
      shorthand: q
      value_type: bool
      default_value: "false"
      description: Only display IDs
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
