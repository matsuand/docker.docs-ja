%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker swarm update
short: Update the swarm
long: |-
    Updates a swarm with new parameter values.
@y
command: docker swarm update
short: Update the swarm
long: |-
    Updates a swarm with new parameter values.
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
usage: docker swarm update [OPTIONS]
@y
usage: docker swarm update [OPTIONS]
@z

% options:

@x autolock
      description: Change manager autolocking setting (true|false)
@y
      description: Change manager autolocking setting (true|false)
@z

@x cert-expiry
      description: Validity period for node certificates (ns|us|ms|s|m|h)
@y
      description: Validity period for node certificates (ns|us|ms|s|m|h)
@z

@x dispatcher-heartbeat
      description: Dispatcher heartbeat period (ns|us|ms|s|m|h)
@y
      description: Dispatcher heartbeat period (ns|us|ms|s|m|h)
@z

@x external-ca
      description: Specifications of one or more certificate signing endpoints
@y
      description: Specifications of one or more certificate signing endpoints
@z

@x max-snapshots
      description: Number of additional Raft snapshots to retain
@y
      description: Number of additional Raft snapshots to retain
@z

@x snapshot-interval
      description: Number of log entries between Raft snapshots
@y
      description: Number of log entries between Raft snapshots
@z

@x task-history-limit
      description: Task history retention limit
@y
      description: Task history retention limit
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
