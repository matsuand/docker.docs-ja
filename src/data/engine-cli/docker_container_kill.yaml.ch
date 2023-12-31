%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker container kill
aliases: docker container kill, docker kill
short: Kill one or more running containers
long: See [docker kill](kill.md) for more information.
usage: docker container kill [OPTIONS] CONTAINER [CONTAINER...]
pname: docker container
plink: docker_container.yaml
options:
    - option: signal
      shorthand: s
      value_type: string
      description: Signal to send to the container
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
command: docker container kill
aliases: docker container kill, docker kill
short: Kill one or more running containers
long: See [docker kill](kill.md) for more information.
usage: docker container kill [OPTIONS] CONTAINER [CONTAINER...]
pname: docker container
plink: docker_container.yaml
options:
    - option: signal
      shorthand: s
      value_type: string
      description: Signal to send to the container
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
