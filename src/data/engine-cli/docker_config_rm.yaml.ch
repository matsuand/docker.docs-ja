%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

@x
command: docker config rm
aliases: docker config rm, docker config remove
short: Remove one or more configs
long: |-
    Removes the specified configs from the Swarm.
@y
command: docker config rm
aliases: docker config rm, docker config remove
short: Remove one or more configs
long: |-
    Removes the specified configs from the Swarm.
@z

@x
    For detailed information about using configs, refer to [store configuration data using Docker Configs](/engine/swarm/configs/).
@y
    For detailed information about using configs, refer to [store configuration data using Docker Configs](__SUBDIR__/engine/swarm/configs/).
@z

@x
    > [!NOTE]
    > This is a cluster management command, and must be executed on a Swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
@y
    > [!NOTE]
    > これはクラスター管理コマンドであるため、Swarm のマネージャーノード上で実行する必要があります。
    > マネージャーノードとワーカーノードについては、本ドキュメントの [Swarm モード](__SUBDIR__/engine/swarm/) を参照してください。
@z

@x
usage: docker config rm CONFIG [CONFIG...]
@y
usage: docker config rm CONFIG [CONFIG...]
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

@x
examples: |-
    This example removes a config:
@y
examples: |-
    This example removes a config:
@z

% snip command...

@x
    > [!WARNING]
    > This command doesn't ask for confirmation before removing a config.
    { .warning }
@y
    > [!WARNING]
    > This command doesn't ask for confirmation before removing a config.
    { .warning }
@z

% snip directives...
