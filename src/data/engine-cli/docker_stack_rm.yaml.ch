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
@y
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](__SUBDIR__/engine/swarm/) in the
    > documentation.
@z

@x
usage: docker stack rm [OPTIONS] STACK [STACK...]
@y
usage: docker stack rm [OPTIONS] STACK [STACK...]
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

@x orchestrator
      description: Orchestrator to use (swarm|all)
@y
      description: Orchestrator to use (swarm|all)
@z

@x
examples: |-
    ### Remove a stack
@y
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

% snip command...

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

% snip command...
% snip directives...
