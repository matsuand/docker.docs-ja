%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker compose alpha watch
short: |
    Watch build context for service and rebuild/refresh containers when files are updated
long: |
    Watch build context for service and rebuild/refresh containers when files are updated
usage: docker compose alpha watch [SERVICE...]
pname: docker compose alpha
plink: docker_compose_alpha.yaml
options:
    - option: no-up
      value_type: bool
      default_value: "false"
      description: Do not build & start services before watching
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: quiet
      value_type: bool
      default_value: "false"
      description: hide build output
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
command: docker compose alpha watch
short: |
    Watch build context for service and rebuild/refresh containers when files are updated
long: |
    Watch build context for service and rebuild/refresh containers when files are updated
usage: docker compose alpha watch [SERVICE...]
pname: docker compose alpha
plink: docker_compose_alpha.yaml
options:
    - option: no-up
      value_type: bool
      default_value: "false"
      description: Do not build & start services before watching
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: quiet
      value_type: bool
      default_value: "false"
      description: hide build output
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
