%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker network rm
aliases: docker network rm, docker network remove
short: Remove one or more networks
long: |-
    Removes one or more networks by name or identifier. To remove a network,
    you must first disconnect any containers connected to it.
usage: docker network rm NETWORK [NETWORK...]
pname: docker network
plink: docker_network.yaml
options:
    - option: force
      shorthand: f
      value_type: bool
      default_value: "false"
      description: Do not error if the network does not exist
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
    ### Remove a network
@y
command: docker network rm
aliases: docker network rm, docker network remove
short: Remove one or more networks
long: |-
    Removes one or more networks by name or identifier. To remove a network,
    you must first disconnect any containers connected to it.
usage: docker network rm NETWORK [NETWORK...]
pname: docker network
plink: docker_network.yaml
options:
    - option: force
      shorthand: f
      value_type: bool
      default_value: "false"
      description: Do not error if the network does not exist
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
    ### Remove a network
@z

@x
    To remove the network named 'my-network':
@y
    To remove the network named 'my-network':
@z

@x
    ```console
    $ docker network rm my-network
    ```
@y
    ```console
    $ docker network rm my-network
    ```
@z

@x
    ### Remove multiple networks
@y
    ### Remove multiple networks
@z

@x
    To delete multiple networks in a single `docker network rm` command, provide
    multiple network names or ids. The following example deletes a network with id
    `3695c422697f` and a network named `my-network`:
@y
    To delete multiple networks in a single `docker network rm` command, provide
    multiple network names or ids. The following example deletes a network with id
    `3695c422697f` and a network named `my-network`:
@z

@x
    ```console
    $ docker network rm 3695c422697f my-network
    ```
@y
    ```console
    $ docker network rm 3695c422697f my-network
    ```
@z

@x
    When you specify multiple networks, the command attempts to delete each in turn.
    If the deletion of one network fails, the command continues to the next on the
    list and tries to delete that. The command reports success or failure for each
    deletion.
deprecated: false
min_api_version: "1.21"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    When you specify multiple networks, the command attempts to delete each in turn.
    If the deletion of one network fails, the command continues to the next on the
    list and tries to delete that. The command reports success or failure for each
    deletion.
deprecated: false
min_api_version: "1.21"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
