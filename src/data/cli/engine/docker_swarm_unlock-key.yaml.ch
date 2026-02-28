%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker swarm unlock-key
short: Manage the unlock key
long: |-
    An unlock key is a secret key needed to unlock a manager after its Docker daemon
    restarts. These keys are only used when the autolock feature is enabled for the
    swarm.
@y
command: docker swarm unlock-key
short: Manage the unlock key
long: |-
    An unlock key is a secret key needed to unlock a manager after its Docker daemon
    restarts. These keys are only used when the autolock feature is enabled for the
    swarm.
@z

@x
    You can view or rotate the unlock key using `swarm unlock-key`. To view the key,
    run the `docker swarm unlock-key` command without any arguments:
@y
    You can view or rotate the unlock key using `swarm unlock-key`. To view the key,
    run the `docker swarm unlock-key` command without any arguments:
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
usage: docker swarm unlock-key [OPTIONS]
@y
usage: docker swarm unlock-key [OPTIONS]
@z

% options:

@x quiet
      description: Only display token
@y
      description: Only display token
@z

@x rotate
      description: Rotate unlock key
@y
      description: Rotate unlock key
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

@x
    Use the `--rotate` flag to rotate the unlock key to a new, randomly-generated
    key:
@y
    Use the `--rotate` flag to rotate the unlock key to a new, randomly-generated
    key:
@z

% snip command...

@x
    The `-q` (or `--quiet`) flag only prints the key:
@y
    The `-q` (or `--quiet`) flag only prints the key:
@z

% snip command...

@x
    ### `--rotate` {#rotate}
@y
    ### `--rotate` {#rotate}
@z

@x
    This flag rotates the unlock key, replacing it with a new randomly-generated
    key. The old unlock key will no longer be accepted.
@y
    This flag rotates the unlock key, replacing it with a new randomly-generated
    key. The old unlock key will no longer be accepted.
@z

@x
    ### `--quiet` {#quiet}
@y
    ### `--quiet` {#quiet}
@z

@x
    Only print the unlock key, without instructions.
@y
    Only print the unlock key, without instructions.
@z

% snip directives...
