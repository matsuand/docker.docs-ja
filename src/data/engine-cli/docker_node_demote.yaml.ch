%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker node demote
short: Demote one or more nodes from manager in the swarm
long: |-
    Demotes an existing manager so that it is no longer a manager.
@y
command: docker node demote
short: Demote one or more nodes from manager in the swarm
long: |-
    Demotes an existing manager so that it is no longer a manager.
@z

@x
    > [!NOTE]
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the [Swarm mode
    > section](/engine/swarm/) in the documentation.
@y
    > [!NOTE]
    > これはクラスター管理コマンドであるため、Swarm のマネージャーノード上で実行する必要があります。
    > マネージャーノードとワーカーノードについては、本ドキュメントの [Swarm モード](__SUBDIR__/engine/swarm/) を参照してください。
@z

@x
usage: docker node demote NODE [NODE...]
@y
usage: docker node demote NODE [NODE...]
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
