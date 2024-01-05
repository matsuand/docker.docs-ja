%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker scout repo list
short: List Docker Scout repositories
long: |-
    The docker scout repo list command shows all repositories in an organization.
@y
command: docker scout repo list
short: List Docker Scout repositories
long: |-
    The docker scout repo list command shows all repositories in an organization.
@z

@x
    If ORG is not provided the default configured organization will be used.
usage: docker scout repo list
pname: docker scout repo
plink: docker_scout_repo.yaml
options:
    - option: filter
      value_type: string
      description: Regular expression to filter repositories by name
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-disabled
      value_type: bool
      default_value: "false"
      description: Filter to disabled repositories only
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-enabled
      value_type: bool
      default_value: "false"
      description: Filter to enabled repositories only
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-registry
      value_type: string
      description: |-
        Filter to a specific registry only:
        - hub.docker.com
        - ecr (AWS ECR)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: org
      value_type: string
      description: Namespace of the Docker organization
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: debug
      value_type: bool
      default_value: "false"
      description: Debug messages
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: verbose-debug
      value_type: bool
      default_value: "false"
      description: Verbose debug
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    If ORG is not provided the default configured organization will be used.
usage: docker scout repo list
pname: docker scout repo
plink: docker_scout_repo.yaml
options:
    - option: filter
      value_type: string
      description: Regular expression to filter repositories by name
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-disabled
      value_type: bool
      default_value: "false"
      description: Filter to disabled repositories only
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-enabled
      value_type: bool
      default_value: "false"
      description: Filter to enabled repositories only
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-registry
      value_type: string
      description: |-
        Filter to a specific registry only:
        - hub.docker.com
        - ecr (AWS ECR)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: org
      value_type: string
      description: Namespace of the Docker organization
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: debug
      value_type: bool
      default_value: "false"
      description: Debug messages
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: verbose-debug
      value_type: bool
      default_value: "false"
      description: Verbose debug
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
