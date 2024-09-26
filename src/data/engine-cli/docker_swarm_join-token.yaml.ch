%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker swarm join-token
short: Manage join tokens
long: |-
    Join tokens are secrets that allow a node to join the swarm. There are two
    different join tokens available, one for the worker role and one for the manager
    role. You pass the token using the `--token` flag when you run
    [swarm join](/reference/cli/docker/swarm/join/). Nodes use the join token only when they join the
    swarm.
@y
command: docker swarm join-token
short: Manage join tokens
long: |-
    Join tokens are secrets that allow a node to join the swarm. There are two
    different join tokens available, one for the worker role and one for the manager
    role. You pass the token using the `--token` flag when you run
    [swarm join](__SUBDIR__/reference/cli/docker/swarm/join/). Nodes use the join token only when they join the
    swarm.
@z

@x
    > [!NOTE]
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
@y
    > [!NOTE]
    > これはクラスター管理コマンドであるため、Swarm のマネージャーノード上で実行する必要があります。
    > マネージャーノードとワーカーノードについては、本ドキュメントの [Swarm モード](__SUBDIR__/engine/swarm/) を参照してください。
@z

@x
usage: docker swarm join-token [OPTIONS] (worker|manager)
@y
usage: docker swarm join-token [OPTIONS] (worker|manager)
@z

% options:

@x quiet
      description: Only display token
@y
      description: Only display token
@z

@x rotate
      description: Rotate join token
@y
      description: Rotate join token
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

@x
examples: |-
    You can view or rotate the join tokens using `swarm join-token`.
@y
examples: |-
    You can view or rotate the join tokens using `swarm join-token`.
@z

@x
    As a convenience, you can pass `worker` or `manager` as an argument to
    `join-token` to print the full `docker swarm join` command to join a new node to
    the swarm:
@y
    As a convenience, you can pass `worker` or `manager` as an argument to
    `join-token` to print the full `docker swarm join` command to join a new node to
    the swarm:
@z

% snip command...

@x
    Use the `--rotate` flag to generate a new join token for the specified role:
@y
    Use the `--rotate` flag to generate a new join token for the specified role:
@z

% snip command...

@x
    After using `--rotate`, only the new token will be valid for joining with the specified role.
@y
    After using `--rotate`, only the new token will be valid for joining with the specified role.
@z

@x
    The `-q` (or `--quiet`) flag only prints the token:
@y
    The `-q` (or `--quiet`) flag only prints the token:
@z

% snip command...

@x
    ### `--rotate`
@y
    ### `--rotate`
@z

@x
    Because tokens allow new nodes to join the swarm, you should keep them secret.
    Be particularly careful with manager tokens since they allow new manager nodes
    to join the swarm. A rogue manager has the potential to disrupt the operation of
    your swarm.
@y
    Because tokens allow new nodes to join the swarm, you should keep them secret.
    Be particularly careful with manager tokens since they allow new manager nodes
    to join the swarm. A rogue manager has the potential to disrupt the operation of
    your swarm.
@z

@x
    Rotate your swarm's join token if a token gets checked-in to version control,
    stolen, or a node is compromised. You may also want to periodically rotate the
    token to ensure any unknown token leaks do not allow a rogue node to join
    the swarm.
@y
    Rotate your swarm's join token if a token gets checked-in to version control,
    stolen, or a node is compromised. You may also want to periodically rotate the
    token to ensure any unknown token leaks do not allow a rogue node to join
    the swarm.
@z

@x
    To rotate the join token and print the newly generated token, run
    `docker swarm join-token --rotate` and pass the role: `manager` or `worker`.
@y
    To rotate the join token and print the newly generated token, run
    `docker swarm join-token --rotate` and pass the role: `manager` or `worker`.
@z

@x
    Rotating a join-token means that no new nodes will be able to join the swarm
    using the old token. Rotation does not affect existing nodes in the swarm
    because the join token is only used for authorizing new nodes joining the swarm.
@y
    Rotating a join-token means that no new nodes will be able to join the swarm
    using the old token. Rotation does not affect existing nodes in the swarm
    because the join token is only used for authorizing new nodes joining the swarm.
@z

@x
    ### `--quiet`
@y
    ### `--quiet`
@z

@x
    Only print the token. Do not print a complete command for joining.
@y
    Only print the token. Do not print a complete command for joining.
@z

% snip directives...
