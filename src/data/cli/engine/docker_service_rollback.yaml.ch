%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker service rollback
short: Revert changes to a service's configuration
long: |-
    Roll back a specified service to its previous version from the swarm.
@y
command: docker service rollback
short: Revert changes to a service's configuration
long: |-
    Roll back a specified service to its previous version from the swarm.
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
usage: docker service rollback [OPTIONS] SERVICE
@y
usage: docker service rollback [OPTIONS] SERVICE
@z

% options:

@x detach
      description: Exit immediately instead of waiting for the service to converge
@y
      description: Exit immediately instead of waiting for the service to converge
@z

@x quiet
      description: Suppress progress output
@y
      description: Suppress progress output
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

@x
examples: |-
    ### Roll back to the previous version of a service
@y
examples: |-
    ### Roll back to the previous version of a service
@z

@x
    Use the `docker service rollback` command to roll back to the previous version
    of a service. After executing this command, the service is reverted to the
    configuration that was in place before the most recent `docker service update`
    command.
@y
    Use the `docker service rollback` command to roll back to the previous version
    of a service. After executing this command, the service is reverted to the
    configuration that was in place before the most recent `docker service update`
    command.
@z

@x
    The following example creates a service with a single replica, updates the
    service to use three replicas, and then rolls back the service to the
    previous version, having one replica.
@y
    The following example creates a service with a single replica, updates the
    service to use three replicas, and then rolls back the service to the
    previous version, having one replica.
@z

@x
    Create a service with a single replica:
@y
    Create a service with a single replica:
@z

% snip command...

@x
    Confirm that the service is running with a single replica:
@y
    Confirm that the service is running with a single replica:
@z

% snip command...

@x
    Update the service to use three replicas:
@y
    Update the service to use three replicas:
@z

% snip command...

@x
    Now roll back the service to its previous version, and confirm it is
    running a single replica again:
@y
    Now roll back the service to its previous version, and confirm it is
    running a single replica again:
@z

% snip command...
% snip directives...
