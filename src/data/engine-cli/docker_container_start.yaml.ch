%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker container start
aliases: docker container start, docker start
short: Start one or more stopped containers
long: Start one or more stopped containers
usage: docker container start [OPTIONS] CONTAINER [CONTAINER...]
pname: docker container
plink: docker_container.yaml
options:
    - option: attach
      shorthand: a
      value_type: bool
      default_value: "false"
      description: Attach STDOUT/STDERR and forward signals
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: checkpoint
      value_type: string
      description: Restore from this checkpoint
      deprecated: false
      hidden: false
      experimental: true
      experimentalcli: false
      kubernetes: false
      swarm: false
      os_type: linux
    - option: checkpoint-dir
      value_type: string
      description: Use a custom checkpoint storage directory
      deprecated: false
      hidden: false
      experimental: true
      experimentalcli: false
      kubernetes: false
      swarm: false
      os_type: linux
    - option: detach-keys
      value_type: string
      description: Override the key sequence for detaching a container
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: interactive
      shorthand: i
      value_type: bool
      default_value: "false"
      description: Attach container's STDIN
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
examples: |-
    ```console
    $ docker start my_container
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
command: docker container start
aliases: docker container start, docker start
short: Start one or more stopped containers
long: Start one or more stopped containers
usage: docker container start [OPTIONS] CONTAINER [CONTAINER...]
pname: docker container
plink: docker_container.yaml
options:
    - option: attach
      shorthand: a
      value_type: bool
      default_value: "false"
      description: Attach STDOUT/STDERR and forward signals
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: checkpoint
      value_type: string
      description: Restore from this checkpoint
      deprecated: false
      hidden: false
      experimental: true
      experimentalcli: false
      kubernetes: false
      swarm: false
      os_type: linux
    - option: checkpoint-dir
      value_type: string
      description: Use a custom checkpoint storage directory
      deprecated: false
      hidden: false
      experimental: true
      experimentalcli: false
      kubernetes: false
      swarm: false
      os_type: linux
    - option: detach-keys
      value_type: string
      description: Override the key sequence for detaching a container
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: interactive
      shorthand: i
      value_type: bool
      default_value: "false"
      description: Attach container's STDIN
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
examples: |-
    ```console
    $ docker start my_container
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
