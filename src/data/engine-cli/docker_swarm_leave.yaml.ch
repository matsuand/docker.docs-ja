%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker swarm leave
short: Leave the swarm
long: |-
    When you run this command on a worker, that worker leaves the swarm.
@y
command: docker swarm leave
short: Leave the swarm
long: |-
    When you run this command on a worker, that worker leaves the swarm.
@z

@x
    You can use the `--force` option on a manager to remove it from the swarm.
    However, this does not reconfigure the swarm to ensure that there are enough
    managers to maintain a quorum in the swarm. The safe way to remove a manager
    from a swarm is to demote it to a worker and then direct it to leave the quorum
    without using `--force`. Only use `--force` in situations where the swarm will
    no longer be used after the manager leaves, such as in a single-node swarm.
usage: docker swarm leave [OPTIONS]
pname: docker swarm
plink: docker_swarm.yaml
options:
    - option: force
      shorthand: f
      value_type: bool
      default_value: "false"
      description: Force this node to leave the swarm, ignoring warnings
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
    Consider the following swarm, as seen from the manager:
@y
    You can use the `--force` option on a manager to remove it from the swarm.
    However, this does not reconfigure the swarm to ensure that there are enough
    managers to maintain a quorum in the swarm. The safe way to remove a manager
    from a swarm is to demote it to a worker and then direct it to leave the quorum
    without using `--force`. Only use `--force` in situations where the swarm will
    no longer be used after the manager leaves, such as in a single-node swarm.
usage: docker swarm leave [OPTIONS]
pname: docker swarm
plink: docker_swarm.yaml
options:
    - option: force
      shorthand: f
      value_type: bool
      default_value: "false"
      description: Force this node to leave the swarm, ignoring warnings
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
    Consider the following swarm, as seen from the manager:
@z

@x
    ```console
    $ docker node ls
@y
    ```console
    $ docker node ls
@z

@x
    ID                           HOSTNAME  STATUS  AVAILABILITY  MANAGER STATUS
    7ln70fl22uw2dvjn2ft53m3q5    worker2   Ready   Active
    dkp8vy1dq1kxleu9g4u78tlag    worker1   Ready   Active
    dvfxp4zseq4s0rih1selh0d20 *  manager1  Ready   Active        Leader
    ```
@y
    ID                           HOSTNAME  STATUS  AVAILABILITY  MANAGER STATUS
    7ln70fl22uw2dvjn2ft53m3q5    worker2   Ready   Active
    dkp8vy1dq1kxleu9g4u78tlag    worker1   Ready   Active
    dvfxp4zseq4s0rih1selh0d20 *  manager1  Ready   Active        Leader
    ```
@z

@x
    To remove `worker2`, issue the following command from `worker2` itself:
@y
    To remove `worker2`, issue the following command from `worker2` itself:
@z

@x
    ```console
    $ docker swarm leave
@y
    ```console
    $ docker swarm leave
@z

@x
    Node left the default swarm.
    ```
@y
    Node left the default swarm.
    ```
@z

@x
    The node will still appear in the node list, and marked as `down`. It no longer
    affects swarm operation, but a long list of `down` nodes can clutter the node
    list. To remove an inactive node from the list, use the [`node rm`](node_rm.md)
    command.
deprecated: false
min_api_version: "1.24"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@y
    The node will still appear in the node list, and marked as `down`. It no longer
    affects swarm operation, but a long list of `down` nodes can clutter the node
    list. To remove an inactive node from the list, use the [`node rm`](node_rm.md)
    command.
deprecated: false
min_api_version: "1.24"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@z
