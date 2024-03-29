%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker checkpoint ls
aliases: docker checkpoint ls, docker checkpoint list
short: List checkpoints for a container
long: List checkpoints for a container
usage: docker checkpoint ls [OPTIONS] CONTAINER
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
hidden: false
min_api_version: "1.25"
experimental: true
experimentalcli: false
kubernetes: false
swarm: false
os_type: linux
@y
command: docker checkpoint ls
aliases: docker checkpoint ls, docker checkpoint list
short: List checkpoints for a container
long: List checkpoints for a container
usage: docker checkpoint ls [OPTIONS] CONTAINER
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
hidden: false
min_api_version: "1.25"
experimental: true
experimentalcli: false
kubernetes: false
swarm: false
os_type: linux
@z
