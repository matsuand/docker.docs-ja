%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker container restart
aliases: docker container restart, docker restart
short: Restart one or more containers
long: Restart one or more containers
usage: docker container restart [OPTIONS] CONTAINER [CONTAINER...]
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
    - option: time
      shorthand: t
      value_type: int
      default_value: "0"
      description: Seconds to wait before killing the container
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
    $ docker restart my_container
    ```
@y
command: docker container restart
aliases: docker container restart, docker restart
short: Restart one or more containers
long: Restart one or more containers
usage: docker container restart [OPTIONS] CONTAINER [CONTAINER...]
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
    - option: time
      shorthand: t
      value_type: int
      default_value: "0"
      description: Seconds to wait before killing the container
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
    $ docker restart my_container
    ```
@z
