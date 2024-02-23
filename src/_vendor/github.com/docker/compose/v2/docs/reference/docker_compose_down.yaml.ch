%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker compose down
short: Stop and remove containers, networks
long: |-
    Stops containers and removes containers, networks, volumes, and images created by `up`.
@y
command: docker compose down
short: Stop and remove containers, networks
long: |-
    Stops containers and removes containers, networks, volumes, and images created by `up`.
@z

@x
    By default, the only things removed are:
@y
    By default, the only things removed are:
@z

@x
    - Containers for services defined in the Compose file.
    - Networks defined in the networks section of the Compose file.
    - The default network, if one is used.
@y
    - Containers for services defined in the Compose file.
    - Networks defined in the networks section of the Compose file.
    - The default network, if one is used.
@z

@x
    Networks and volumes defined as external are never removed.
@y
    Networks and volumes defined as external are never removed.
@z

@x
    Anonymous volumes are not removed by default. However, as they don’t have a stable name, they are not automatically
    mounted by a subsequent `up`. For data that needs to persist between updates, use explicit paths as bind mounts or
    named volumes.
usage: docker compose down [OPTIONS] [SERVICES]
pname: docker compose
plink: docker_compose.yaml
options:
    - option: remove-orphans
      value_type: bool
      default_value: "false"
      description: Remove containers for services not defined in the Compose file
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: rmi
      value_type: string
      description: |
        Remove images used by services. "local" remove only images that don't have a custom tag ("local"|"all")
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
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
    - option: volumes
      shorthand: v
      value_type: bool
      default_value: "false"
      description: |
        Remove named volumes declared in the "volumes" section of the Compose file and anonymous volumes attached to containers
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
    Anonymous volumes are not removed by default. However, as they don’t have a stable name, they are not automatically
    mounted by a subsequent `up`. For data that needs to persist between updates, use explicit paths as bind mounts or
    named volumes.
usage: docker compose down [OPTIONS] [SERVICES]
pname: docker compose
plink: docker_compose.yaml
options:
    - option: remove-orphans
      value_type: bool
      default_value: "false"
      description: Remove containers for services not defined in the Compose file
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: rmi
      value_type: string
      description: |
        Remove images used by services. "local" remove only images that don't have a custom tag ("local"|"all")
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
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
    - option: volumes
      shorthand: v
      value_type: bool
      default_value: "false"
      description: |
        Remove named volumes declared in the "volumes" section of the Compose file and anonymous volumes attached to containers
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
