%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker image rm
aliases: docker image rm, docker image remove, docker rmi
short: Remove one or more images
long: See [docker rmi](rmi.md) for more information.
usage: docker image rm [OPTIONS] IMAGE [IMAGE...]
pname: docker image
plink: docker_image.yaml
options:
    - option: force
      shorthand: f
      value_type: bool
      default_value: "false"
      description: Force removal of the image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-prune
      value_type: bool
      default_value: "false"
      description: Do not delete untagged parents
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
command: docker image rm
aliases: docker image rm, docker image remove, docker rmi
short: Remove one or more images
long: See [docker rmi](rmi.md) for more information.
usage: docker image rm [OPTIONS] IMAGE [IMAGE...]
pname: docker image
plink: docker_image.yaml
options:
    - option: force
      shorthand: f
      value_type: bool
      default_value: "false"
      description: Force removal of the image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-prune
      value_type: bool
      default_value: "false"
      description: Do not delete untagged parents
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
