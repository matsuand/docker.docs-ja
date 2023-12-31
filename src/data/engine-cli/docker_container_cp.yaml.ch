%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker container cp
aliases: docker container cp, docker cp
short: Copy files/folders between a container and the local filesystem
long: See [docker cp](cp.md) for more information.
usage: |-
    docker container cp [OPTIONS] CONTAINER:SRC_PATH DEST_PATH|-
    	docker cp [OPTIONS] SRC_PATH|- CONTAINER:DEST_PATH
pname: docker container
plink: docker_container.yaml
options:
    - option: archive
      shorthand: a
      value_type: bool
      default_value: "false"
      description: Archive mode (copy all uid/gid information)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: follow-link
      shorthand: L
      value_type: bool
      default_value: "false"
      description: Always follow symbol link in SRC_PATH
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: quiet
      shorthand: q
      value_type: bool
      default_value: "false"
      description: |
        Suppress progress output during copy. Progress output is automatically suppressed if no terminal is attached
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
command: docker container cp
aliases: docker container cp, docker cp
short: Copy files/folders between a container and the local filesystem
long: See [docker cp](cp.md) for more information.
usage: |-
    docker container cp [OPTIONS] CONTAINER:SRC_PATH DEST_PATH|-
    	docker cp [OPTIONS] SRC_PATH|- CONTAINER:DEST_PATH
pname: docker container
plink: docker_container.yaml
options:
    - option: archive
      shorthand: a
      value_type: bool
      default_value: "false"
      description: Archive mode (copy all uid/gid information)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: follow-link
      shorthand: L
      value_type: bool
      default_value: "false"
      description: Always follow symbol link in SRC_PATH
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: quiet
      shorthand: q
      value_type: bool
      default_value: "false"
      description: |
        Suppress progress output during copy. Progress output is automatically suppressed if no terminal is attached
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
