%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker node update
short: Update a node
long: |-
    Update metadata about a node, such as its availability, labels, or roles.
@y
command: docker node update
short: Update a node
long: |-
    Update metadata about a node, such as its availability, labels, or roles.
@z

@x
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
usage: docker node update [OPTIONS] NODE
pname: docker node
plink: docker_node.yaml
options:
    - option: availability
      value_type: string
      description: Availability of the node (`active`, `pause`, `drain`)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: label-add
      value_type: list
      description: Add or update a node label (`key=value`)
      details_url: '#label-add'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: label-rm
      value_type: list
      description: Remove a node label if exists
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: role
      value_type: string
      description: Role of the node (`worker`, `manager`)
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
    ### Add label metadata to a node (--label-add) {#label-add}
@y
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](__SUBDIR__/engine/swarm/) in the
    > documentation.
usage: docker node update [OPTIONS] NODE
pname: docker node
plink: docker_node.yaml
options:
    - option: availability
      value_type: string
      description: Availability of the node (`active`, `pause`, `drain`)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: label-add
      value_type: list
      description: Add or update a node label (`key=value`)
      details_url: '#label-add'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: label-rm
      value_type: list
      description: Remove a node label if exists
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: role
      value_type: string
      description: Role of the node (`worker`, `manager`)
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
    ### Add label metadata to a node (--label-add) {#label-add}
@z

@x
    Add metadata to a swarm node using node labels. You can specify a node label as
    a key with an empty value:
@y
    Add metadata to a swarm node using node labels. You can specify a node label as
    a key with an empty value:
@z

@x
    ``` bash
    $ docker node update --label-add foo worker1
    ```
@y
    ``` bash
    $ docker node update --label-add foo worker1
    ```
@z

@x
    To add multiple labels to a node, pass the `--label-add` flag for each label:
@y
    To add multiple labels to a node, pass the `--label-add` flag for each label:
@z

@x
    ```console
    $ docker node update --label-add foo --label-add bar worker1
    ```
@y
    ```console
    $ docker node update --label-add foo --label-add bar worker1
    ```
@z

@x
    When you [create a service](/reference/cli/docker/service/create/),
    you can use node labels as a constraint. A constraint limits the nodes where the
    scheduler deploys tasks for a service.
@y
    When you [create a service](__SUBDIR__/reference/cli/docker/service/create/),
    you can use node labels as a constraint. A constraint limits the nodes where the
    scheduler deploys tasks for a service.
@z

@x
    For example, to add a `type` label to identify nodes where the scheduler should
    deploy message queue service tasks:
@y
    For example, to add a `type` label to identify nodes where the scheduler should
    deploy message queue service tasks:
@z

@x
    ``` bash
    $ docker node update --label-add type=queue worker1
    ```
@y
    ``` bash
    $ docker node update --label-add type=queue worker1
    ```
@z

@x
    The labels you set for nodes using `docker node update` apply only to the node
    entity within the swarm. Do not confuse them with the docker daemon labels for
    [dockerd](/reference/cli/dockerd/).
@y
    The labels you set for nodes using `docker node update` apply only to the node
    entity within the swarm. Do not confuse them with the docker daemon labels for
    [dockerd](__SUBDIR__/reference/cli/dockerd/).
@z

@x
    For more information about labels, refer to [apply custom
    metadata](/engine/userguide/labels-custom-metadata/).
deprecated: false
hidden: false
min_api_version: "1.24"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@y
    For more information about labels, refer to [apply custom
    metadata](__SUBDIR__/engine/userguide/labels-custom-metadata/).
deprecated: false
hidden: false
min_api_version: "1.24"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@z
