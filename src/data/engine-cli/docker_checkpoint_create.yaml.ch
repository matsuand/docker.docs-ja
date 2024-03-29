%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker checkpoint create
short: Create a checkpoint from a running container
long: Create a checkpoint from a running container
usage: docker checkpoint create [OPTIONS] CONTAINER CHECKPOINT
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
    - option: leave-running
      value_type: bool
      default_value: "false"
      description: Leave the container running after checkpoint
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
command: docker checkpoint create
short: Create a checkpoint from a running container
long: Create a checkpoint from a running container
usage: docker checkpoint create [OPTIONS] CONTAINER CHECKPOINT
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
    - option: leave-running
      value_type: bool
      default_value: "false"
      description: Leave the container running after checkpoint
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
