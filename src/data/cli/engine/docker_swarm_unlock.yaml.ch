%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker swarm unlock
short: Unlock swarm
long: |-
    Unlocks a locked manager using a user-supplied unlock key. This command must be
    used to reactivate a manager after its Docker daemon restarts if the autolock
    setting is turned on. The unlock key is printed at the time when autolock is
    enabled, and is also available from the `docker swarm unlock-key` command.
@y
command: docker swarm unlock
short: Unlock swarm
long: |-
    Unlocks a locked manager using a user-supplied unlock key. This command must be
    used to reactivate a manager after its Docker daemon restarts if the autolock
    setting is turned on. The unlock key is printed at the time when autolock is
    enabled, and is also available from the `docker swarm unlock-key` command.
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
usage: docker swarm unlock
@y
usage: docker swarm unlock
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

@x
examples: |-
@y
examples: |-
@z

% snip command...
% snip directives...
