%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker compose alpha generate
short: EXPERIMENTAL - Generate a Compose file from existing containers
long: EXPERIMENTAL - Generate a Compose file from existing containers
usage: docker compose alpha generate [OPTIONS] [CONTAINERS...]
pname: docker compose alpha
plink: docker_compose_alpha.yaml
options:
    - option: format
      value_type: string
      default_value: yaml
      description: 'Format the output. Values: [yaml | json]'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: name
      value_type: string
      description: Project name to set in the Compose file
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: project-dir
      value_type: string
      description: Directory to use for the project
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
experimentalcli: true
kubernetes: false
swarm: false
@y
command: docker compose alpha generate
short: EXPERIMENTAL - Generate a Compose file from existing containers
long: EXPERIMENTAL - Generate a Compose file from existing containers
usage: docker compose alpha generate [OPTIONS] [CONTAINERS...]
pname: docker compose alpha
plink: docker_compose_alpha.yaml
options:
    - option: format
      value_type: string
      default_value: yaml
      description: 'Format the output. Values: [yaml | json]'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: name
      value_type: string
      description: Project name to set in the Compose file
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: project-dir
      value_type: string
      description: Directory to use for the project
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
experimentalcli: true
kubernetes: false
swarm: false
@z
