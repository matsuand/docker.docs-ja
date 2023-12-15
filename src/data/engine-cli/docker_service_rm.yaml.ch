%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker service rm
aliases: docker service rm, docker service remove
short: Remove one or more services
long: |-
    Removes the specified services from the swarm.
@y
command: docker service rm
aliases: docker service rm, docker service remove
short: Remove one or more services
long: |-
    Removes the specified services from the swarm.
@z

@x
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
usage: docker service rm SERVICE [SERVICE...]
pname: docker service
plink: docker_service.yaml
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
    Remove the `redis` service:
@y
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
usage: docker service rm SERVICE [SERVICE...]
pname: docker service
plink: docker_service.yaml
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
    Remove the `redis` service:
@z

@x
    ```console
    $ docker service rm redis
@y
    ```console
    $ docker service rm redis
@z

@x
    redis
@y
    redis
@z

@x
    $ docker service ls
@y
    $ docker service ls
@z

@x
    ID  NAME  MODE  REPLICAS  IMAGE
    ```
@y
    ID  NAME  MODE  REPLICAS  IMAGE
    ```
@z

@x
    > **Warning**
    >
    > Unlike `docker rm`, this command does not ask for confirmation before removing
    > a running service.
deprecated: false
min_api_version: "1.24"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@y
    > **Warning**
    >
    > Unlike `docker rm`, this command does not ask for confirmation before removing
    > a running service.
deprecated: false
min_api_version: "1.24"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@z
