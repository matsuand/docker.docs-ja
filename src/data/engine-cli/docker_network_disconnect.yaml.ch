%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker network disconnect
short: Disconnect a container from a network
long: |-
    Disconnects a container from a network. The container must be running to
    disconnect it from the network.
usage: docker network disconnect [OPTIONS] NETWORK CONTAINER
pname: docker network
plink: docker_network.yaml
options:
    - option: force
      shorthand: f
      value_type: bool
      default_value: "false"
      description: Force the container to disconnect from a network
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
    $ docker network disconnect multi-host-network container1
    ```
deprecated: false
hidden: false
min_api_version: "1.21"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
command: docker network disconnect
short: Disconnect a container from a network
long: |-
    Disconnects a container from a network. The container must be running to
    disconnect it from the network.
usage: docker network disconnect [OPTIONS] NETWORK CONTAINER
pname: docker network
plink: docker_network.yaml
options:
    - option: force
      shorthand: f
      value_type: bool
      default_value: "false"
      description: Force the container to disconnect from a network
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
    $ docker network disconnect multi-host-network container1
    ```
deprecated: false
hidden: false
min_api_version: "1.21"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
