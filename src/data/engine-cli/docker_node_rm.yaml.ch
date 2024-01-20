%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker node rm
aliases: docker node rm, docker node remove
short: Remove one or more nodes from the swarm
long: |-
    Removes the specified nodes from a swarm.
@y
command: docker node rm
aliases: docker node rm, docker node remove
short: Remove one or more nodes from the swarm
long: |-
    Removes the specified nodes from a swarm.
@z

@x
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
usage: docker node rm [OPTIONS] NODE [NODE...]
pname: docker node
plink: docker_node.yaml
options:
    - option: force
      shorthand: f
      value_type: bool
      default_value: "false"
      description: Force remove a node from the swarm
      details_url: '#force'
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
    ### Remove a stopped node from the swarm
@y
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
usage: docker node rm [OPTIONS] NODE [NODE...]
pname: docker node
plink: docker_node.yaml
options:
    - option: force
      shorthand: f
      value_type: bool
      default_value: "false"
      description: Force remove a node from the swarm
      details_url: '#force'
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
    ### Remove a stopped node from the swarm
@z

@x
    ```console
    $ docker node rm swarm-node-02
@y
    ```console
    $ docker node rm swarm-node-02
@z

@x
    Node swarm-node-02 removed from swarm
    ```
@y
    Node swarm-node-02 removed from swarm
    ```
@z

@x
    ### Attempt to remove a running node from a swarm
@y
    ### Attempt to remove a running node from a swarm
@z

@x
    Removes the specified nodes from the swarm, but only if the nodes are in the
    down state. If you attempt to remove an active node you will receive an error:
@y
    Removes the specified nodes from the swarm, but only if the nodes are in the
    down state. If you attempt to remove an active node you will receive an error:
@z

@x
    ```console
    $ docker node rm swarm-node-03
@y
    ```console
    $ docker node rm swarm-node-03
@z

@x
    Error response from daemon: rpc error: code = 9 desc = node swarm-node-03 is not
    down and can't be removed
    ```
@y
    Error response from daemon: rpc error: code = 9 desc = node swarm-node-03 is not
    down and can't be removed
    ```
@z

@x
    ### Forcibly remove an inaccessible node from a swarm (--force) {#force}
@y
    ### Forcibly remove an inaccessible node from a swarm (--force) {#force}
@z

@x
    If you lose access to a worker node or need to shut it down because it has been
    compromised or is not behaving as expected, you can use the `--force` option.
    This may cause transient errors or interruptions, depending on the type of task
    being run on the node.
@y
    If you lose access to a worker node or need to shut it down because it has been
    compromised or is not behaving as expected, you can use the `--force` option.
    This may cause transient errors or interruptions, depending on the type of task
    being run on the node.
@z

@x
    ```console
    $ docker node rm --force swarm-node-03
@y
    ```console
    $ docker node rm --force swarm-node-03
@z

@x
    Node swarm-node-03 removed from swarm
    ```
@y
    Node swarm-node-03 removed from swarm
    ```
@z

@x
    A manager node must be demoted to a worker node (using `docker node demote`)
    before you can remove it from the swarm.
deprecated: false
min_api_version: "1.24"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@y
    A manager node must be demoted to a worker node (using `docker node demote`)
    before you can remove it from the swarm.
deprecated: false
min_api_version: "1.24"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@z
