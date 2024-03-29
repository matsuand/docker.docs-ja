%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker node demote
short: Demote one or more nodes from manager in the swarm
long: |-
    Demotes an existing manager so that it is no longer a manager.
@y
command: docker node demote
short: Demote one or more nodes from manager in the swarm
long: |-
    Demotes an existing manager so that it is no longer a manager.
@z

@x
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the [Swarm mode
    > section](/engine/swarm/) in the documentation.
usage: docker node demote NODE [NODE...]
pname: docker node
plink: docker_node.yaml
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
    $ docker node demote <node name>
    ```
deprecated: false
hidden: false
min_api_version: "1.24"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@y
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the [Swarm mode
    > section](__SUBDIR__/engine/swarm/) in the documentation.
usage: docker node demote NODE [NODE...]
pname: docker node
plink: docker_node.yaml
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
    $ docker node demote <node name>
    ```
deprecated: false
hidden: false
min_api_version: "1.24"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@z
