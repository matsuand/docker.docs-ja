%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker volume
short: Manage volumes
long: |-
    Manage volumes. You can use subcommands to create, inspect, list, remove, or
    prune volumes.
usage: docker volume COMMAND
pname: docker
plink: docker.yaml
cname:
    - docker volume create
    - docker volume inspect
    - docker volume ls
    - docker volume prune
    - docker volume rm
    - docker volume update
clink:
    - docker_volume_create.yaml
    - docker_volume_inspect.yaml
    - docker_volume_ls.yaml
    - docker_volume_prune.yaml
    - docker_volume_rm.yaml
    - docker_volume_update.yaml
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
min_api_version: "1.21"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
command: docker volume
short: Manage volumes
long: |-
    Manage volumes. You can use subcommands to create, inspect, list, remove, or
    prune volumes.
usage: docker volume COMMAND
pname: docker
plink: docker.yaml
cname:
    - docker volume create
    - docker volume inspect
    - docker volume ls
    - docker volume prune
    - docker volume rm
    - docker volume update
clink:
    - docker_volume_create.yaml
    - docker_volume_inspect.yaml
    - docker_volume_ls.yaml
    - docker_volume_prune.yaml
    - docker_volume_rm.yaml
    - docker_volume_update.yaml
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
min_api_version: "1.21"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
