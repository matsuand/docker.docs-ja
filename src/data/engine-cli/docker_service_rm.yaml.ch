%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

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
usage: docker service rm SERVICE [SERVICE...]
@y
usage: docker service rm SERVICE [SERVICE...]
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

@x
examples: |-
    Remove the `redis` service:
@y
examples: |-
    Remove the `redis` service:
@z

% snip command...

@x
    > [!WARNING]
    > Unlike `docker rm`, this command does not ask for confirmation before removing
    > a running service.
@y
    > [!WARNING]
    > Unlike `docker rm`, this command does not ask for confirmation before removing
    > a running service.
@z

% snip directives...
