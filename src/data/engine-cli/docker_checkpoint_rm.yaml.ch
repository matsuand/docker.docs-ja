%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker checkpoint rm
aliases: docker checkpoint rm, docker checkpoint remove
short: Remove a checkpoint
long: Remove a checkpoint
usage: docker checkpoint rm [OPTIONS] CONTAINER CHECKPOINT
pname: docker checkpoint
plink: docker_checkpoint.yaml
options:
    - option: checkpoint-dir
      value_type: string
      description: Use a custom checkpoint storage directory
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
min_api_version: "1.25"
experimental: true
experimentalcli: false
kubernetes: false
swarm: false
os_type: linux
@y
command: docker checkpoint rm
aliases: docker checkpoint rm, docker checkpoint remove
short: Remove a checkpoint
long: Remove a checkpoint
usage: docker checkpoint rm [OPTIONS] CONTAINER CHECKPOINT
pname: docker checkpoint
plink: docker_checkpoint.yaml
options:
    - option: checkpoint-dir
      value_type: string
      description: Use a custom checkpoint storage directory
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
min_api_version: "1.25"
experimental: true
experimentalcli: false
kubernetes: false
swarm: false
os_type: linux
@z
