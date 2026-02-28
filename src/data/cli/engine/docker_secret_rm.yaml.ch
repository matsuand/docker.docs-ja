%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker secret rm
aliases: docker secret rm, docker secret remove
short: Remove one or more secrets
long: |-
    Removes the specified secrets from the swarm.
@y
command: docker secret rm
aliases: docker secret rm, docker secret remove
short: Remove one or more secrets
long: |-
    Removes the specified secrets from the swarm.
@z

@x
    For detailed information about using secrets, refer to [manage sensitive data with Docker secrets](/engine/swarm/secrets/).
@y
    For detailed information about using secrets, refer to [manage sensitive data with Docker secrets](__SUBDIR__/engine/swarm/secrets/).
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
usage: docker secret rm SECRET [SECRET...]
@y
usage: docker secret rm SECRET [SECRET...]
@z

% inherited_options:

@x
      description: Print usage
@y
      description: Print usage
@z

@x
examples: |-
    This example removes a secret:
@y
examples: |-
    This example removes a secret:
@z

% snip command...

@x
    > [!WARNING]
    > Unlike `docker rm`, this command does not ask for confirmation before removing
    > a secret.
@y
    > [!WARNING]
    > Unlike `docker rm`, this command does not ask for confirmation before removing
    > a secret.
@z

% snip directives...
