%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker rm
aliases: docker container rm, docker container remove, docker rm
short: Remove one or more containers
long: Remove one or more containers
usage: docker rm [OPTIONS] CONTAINER [CONTAINER...]
pname: docker
plink: docker.yaml
options:
    - option: force
      shorthand: f
      value_type: bool
      default_value: "false"
      description: Force the removal of a running container (uses SIGKILL)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: link
      shorthand: l
      value_type: bool
      default_value: "false"
      description: Remove the specified link
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
      description: Remove anonymous volumes associated with the container
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: help
      value_type: bool
      default_value: "false"
      description: Print usage
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
command: docker rm
aliases: docker container rm, docker container remove, docker rm
short: Remove one or more containers
long: Remove one or more containers
usage: docker rm [OPTIONS] CONTAINER [CONTAINER...]
pname: docker
plink: docker.yaml
options:
    - option: force
      shorthand: f
      value_type: bool
      default_value: "false"
      description: Force the removal of a running container (uses SIGKILL)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: link
      shorthand: l
      value_type: bool
      default_value: "false"
      description: Remove the specified link
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
      description: Remove anonymous volumes associated with the container
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: help
      value_type: bool
      default_value: "false"
      description: Print usage
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
