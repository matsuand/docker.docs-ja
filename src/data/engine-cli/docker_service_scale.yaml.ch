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
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
usage: docker service scale SERVICE=REPLICAS [SERVICE=REPLICAS...]
pname: docker service
plink: docker_service.yaml
options:
    - option: detach
      shorthand: d
      value_type: bool
      default_value: "false"
      description: Exit immediately instead of waiting for the service to converge
      deprecated: false
      hidden: false
      min_api_version: "1.29"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: help
      value_type: bool
      default_value: "false"
      description: Print usage
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Scale a single service
@y
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](__SUBDIR__/engine/swarm/) in the
    > documentation.
usage: docker service scale SERVICE=REPLICAS [SERVICE=REPLICAS...]
pname: docker service
plink: docker_service.yaml
options:
    - option: detach
      shorthand: d
      value_type: bool
      default_value: "false"
      description: Exit immediately instead of waiting for the service to converge
      deprecated: false
      hidden: false
      min_api_version: "1.29"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: help
      value_type: bool
      default_value: "false"
      description: Print usage
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Scale a single service
@z

@x
    The following command scales the "frontend" service to 50 tasks.
@y
    The following command scales the "frontend" service to 50 tasks.
@z

@x
    ```console
    $ docker service scale frontend=50
@y
    ```console
    $ docker service scale frontend=50
@z

@x
    frontend scaled to 50
    ```
@y
    frontend scaled to 50
    ```
@z

@x
    The following command tries to scale a global service to 10 tasks and returns an error.
@y
    The following command tries to scale a global service to 10 tasks and returns an error.
@z

@x
    ```console
    $ docker service create --mode global --name backend backend:latest
@y
    ```console
    $ docker service create --mode global --name backend backend:latest
@z

@x
    b4g08uwuairexjub6ome6usqh
@y
    b4g08uwuairexjub6ome6usqh
@z

@x
    $ docker service scale backend=10
@y
    $ docker service scale backend=10
@z

@x
    backend: scale can only be used with replicated or replicated-job mode
    ```
@y
    backend: scale can only be used with replicated or replicated-job mode
    ```
@z

@x
    Directly afterwards, run `docker service ls`, to see the actual number of
    replicas.
@y
    Directly afterwards, run `docker service ls`, to see the actual number of
    replicas.
@z

@x
    ```console
    $ docker service ls --filter name=frontend
@y
    ```console
    $ docker service ls --filter name=frontend
@z

@x
    ID            NAME      MODE        REPLICAS  IMAGE
    3pr5mlvu3fh9  frontend  replicated  15/50     nginx:alpine
    ```
@y
    ID            NAME      MODE        REPLICAS  IMAGE
    3pr5mlvu3fh9  frontend  replicated  15/50     nginx:alpine
    ```
@z

@x
    You can also scale a service using the [`docker service update`](service_update.md)
    command. The following commands are equivalent:
@y
    You can also scale a service using the [`docker service update`](service_update.md)
    command. The following commands are equivalent:
@z

@x
    ```console
    $ docker service scale frontend=50
    $ docker service update --replicas=50 frontend
    ```
@y
    ```console
    $ docker service scale frontend=50
    $ docker service update --replicas=50 frontend
    ```
@z

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

@x
    ```console
    $ docker service scale backend=3 frontend=5
@y
    ```console
    $ docker service scale backend=3 frontend=5
@z

@x
    backend scaled to 3
    frontend scaled to 5
@y
    backend scaled to 3
    frontend scaled to 5
@z

@x
    $ docker service ls
@y
    $ docker service ls
@z

@x
    ID            NAME      MODE        REPLICAS  IMAGE
    3pr5mlvu3fh9  frontend  replicated  5/5       nginx:alpine
    74nzcxxjv6fq  backend   replicated  3/3       redis:3.0.6
    ```
deprecated: false
min_api_version: "1.24"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@y
    ID            NAME      MODE        REPLICAS  IMAGE
    3pr5mlvu3fh9  frontend  replicated  5/5       nginx:alpine
    74nzcxxjv6fq  backend   replicated  3/3       redis:3.0.6
    ```
deprecated: false
min_api_version: "1.24"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@z
