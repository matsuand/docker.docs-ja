%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker service scale
short: Scale one or multiple replicated services
long: |-
    The scale command enables you to scale one or more replicated services either up
    or down to the desired number of replicas. This command cannot be applied on
    services which are global mode. The command will return immediately, but the
    actual scaling of the service may take some time. To stop all replicas of a
    service while keeping the service active in the swarm you can set the scale to 0.
@y
command: docker service scale
short: Scale one or multiple replicated services
long: |-
    The scale command enables you to scale one or more replicated services either up
    or down to the desired number of replicas. This command cannot be applied on
    services which are global mode. The command will return immediately, but the
    actual scaling of the service may take some time. To stop all replicas of a
    service while keeping the service active in the swarm you can set the scale to 0.
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
usage: docker service scale SERVICE=REPLICAS [SERVICE=REPLICAS...]
@y
usage: docker service scale SERVICE=REPLICAS [SERVICE=REPLICAS...]
@z

% options:

@x detach
      description: Exit immediately instead of waiting for the service to converge
@y
      description: Exit immediately instead of waiting for the service to converge
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

@x
examples: |-
    ### Scale a single service
@y
examples: |-
    ### Scale a single service
@z

@x
    The following command scales the "frontend" service to 50 tasks.
@y
    The following command scales the "frontend" service to 50 tasks.
@z

% snip command...

@x
    The following command tries to scale a global service to 10 tasks and returns an error.
@y
    The following command tries to scale a global service to 10 tasks and returns an error.
@z

% snip command...

@x
    Directly afterwards, run `docker service ls`, to see the actual number of
    replicas.
@y
    Directly afterwards, run `docker service ls`, to see the actual number of
    replicas.
@z

% snip command...

@x
    You can also scale a service using the [`docker service update`](/reference/cli/docker/service/update/)
    command. The following commands are equivalent:
@y
    You can also scale a service using the [`docker service update`](__SUBDIR__/reference/cli/docker/service/update/)
    command. The following commands are equivalent:
@z

% snip command...

@x
    ### Scale multiple services
@y
    ### Scale multiple services
@z

@x
    The `docker service scale` command allows you to set the desired number of
    tasks for multiple services at once. The following example scales both the
    backend and frontend services:
@y
    The `docker service scale` command allows you to set the desired number of
    tasks for multiple services at once. The following example scales both the
    backend and frontend services:
@z

% snip command...
% snip directives...
