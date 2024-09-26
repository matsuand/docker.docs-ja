%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker node promote
short: Promote one or more nodes to manager in the swarm
long: |-
    Promotes a node to manager. This command can only be executed on a manager node.
@y
command: docker node promote
short: Promote one or more nodes to manager in the swarm
long: |-
    Promotes a node to manager. This command can only be executed on a manager node.
@z

@x
    > [!NOTE]
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
@y
    > [!NOTE]
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](__SUBDIR__/engine/swarm/) in the
    > documentation.
@z

@x
usage: docker node promote NODE [NODE...]
@y
usage: docker node promote NODE [NODE...]
@z

% inherited_options:

@x
      description: Print usage
@y
      description: Print usage
@z

% examples:
% snip command...
% snip directives...
