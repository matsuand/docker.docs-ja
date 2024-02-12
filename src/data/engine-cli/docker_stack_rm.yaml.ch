%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker stack rm
aliases: docker stack rm, docker stack remove, docker stack down
short: Remove one or more stacks
long: |-
    Remove the stack from the swarm.
@y
command: docker stack rm
aliases: docker stack rm, docker stack remove, docker stack down
short: Remove one or more stacks
long: |-
    Remove the stack from the swarm.
@z

@x
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
usage: docker stack rm [OPTIONS] STACK [STACK...]
pname: docker stack
plink: docker_stack.yaml
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
    - option: orchestrator
      value_type: string
      description: Orchestrator to use (swarm|all)
      deprecated: true
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Remove a stack
@y
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](__SUBDIR__/engine/swarm/) in the
    > documentation.
usage: docker stack rm [OPTIONS] STACK [STACK...]
pname: docker stack
plink: docker_stack.yaml
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
    - option: orchestrator
      value_type: string
      description: Orchestrator to use (swarm|all)
      deprecated: true
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Remove a stack
@z

@x
    This will remove the stack with the name `myapp`. Services, networks, and secrets
    associated with the stack will be removed.
@y
    This will remove the stack with the name `myapp`. Services, networks, and secrets
    associated with the stack will be removed.
@z

@x
    ```console
    $ docker stack rm myapp
@y
    ```console
    $ docker stack rm myapp
@z

@x
    Removing service myapp_redis
    Removing service myapp_web
    Removing service myapp_lb
    Removing network myapp_default
    Removing network myapp_frontend
    ```
@y
    Removing service myapp_redis
    Removing service myapp_web
    Removing service myapp_lb
    Removing network myapp_default
    Removing network myapp_frontend
    ```
@z

@x
    ### Remove multiple stacks
@y
    ### Remove multiple stacks
@z

@x
    This will remove all the specified stacks, `myapp` and `vossibility`. Services,
    networks, and secrets associated with all the specified stacks will be removed.
@y
    This will remove all the specified stacks, `myapp` and `vossibility`. Services,
    networks, and secrets associated with all the specified stacks will be removed.
@z

@x
    ```console
    $ docker stack rm myapp vossibility
@y
    ```console
    $ docker stack rm myapp vossibility
@z

@x
    Removing service myapp_redis
    Removing service myapp_web
    Removing service myapp_lb
    Removing network myapp_default
    Removing network myapp_frontend
    Removing service vossibility_nsqd
    Removing service vossibility_logstash
    Removing service vossibility_elasticsearch
    Removing service vossibility_kibana
    Removing service vossibility_ghollector
    Removing service vossibility_lookupd
    Removing network vossibility_default
    Removing network vossibility_vossibility
    ```
deprecated: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@y
    Removing service myapp_redis
    Removing service myapp_web
    Removing service myapp_lb
    Removing network myapp_default
    Removing network myapp_frontend
    Removing service vossibility_nsqd
    Removing service vossibility_logstash
    Removing service vossibility_elasticsearch
    Removing service vossibility_kibana
    Removing service vossibility_ghollector
    Removing service vossibility_lookupd
    Removing network vossibility_default
    Removing network vossibility_vossibility
    ```
deprecated: false
min_api_version: "1.25"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@z
