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
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](/engine/swarm/) in the
    > documentation.
usage: docker service rollback [OPTIONS] SERVICE
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
    - option: quiet
      shorthand: q
      value_type: bool
      default_value: "false"
      description: Suppress progress output
      deprecated: false
      hidden: false
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
    ### Roll back to the previous version of a service
@y
    > **Note**
    >
    > This is a cluster management command, and must be executed on a swarm
    > manager node. To learn about managers and workers, refer to the
    > [Swarm mode section](__SUBDIR__/engine/swarm/) in the
    > documentation.
usage: docker service rollback [OPTIONS] SERVICE
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
    - option: quiet
      shorthand: q
      value_type: bool
      default_value: "false"
      description: Suppress progress output
      deprecated: false
      hidden: false
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

@x
    ```console
    $ docker service create --name my-service -p 8080:80 nginx:alpine
    ```
@y
    ```console
    $ docker service create --name my-service -p 8080:80 nginx:alpine
    ```
@z

@x
    Confirm that the service is running with a single replica:
@y
    Confirm that the service is running with a single replica:
@z

@x
    ```console
    $ docker service ls
@y
    ```console
    $ docker service ls
@z

@x
    ID                  NAME                MODE                REPLICAS            IMAGE               PORTS
    xbw728mf6q0d        my-service          replicated          1/1                 nginx:alpine        *:8080->80/tcp
    ```
@y
    ID                  NAME                MODE                REPLICAS            IMAGE               PORTS
    xbw728mf6q0d        my-service          replicated          1/1                 nginx:alpine        *:8080->80/tcp
    ```
@z

@x
    Update the service to use three replicas:
@y
    Update the service to use three replicas:
@z

@x
    ```console
    $ docker service update --replicas=3 my-service
@y
    ```console
    $ docker service update --replicas=3 my-service
@z

@x
    $ docker service ls
@y
    $ docker service ls
@z

@x
    ID                  NAME                MODE                REPLICAS            IMAGE               PORTS
    xbw728mf6q0d        my-service          replicated          3/3                 nginx:alpine        *:8080->80/tcp
    ```
@y
    ID                  NAME                MODE                REPLICAS            IMAGE               PORTS
    xbw728mf6q0d        my-service          replicated          3/3                 nginx:alpine        *:8080->80/tcp
    ```
@z

@x
    Now roll back the service to its previous version, and confirm it is
    running a single replica again:
@y
    Now roll back the service to its previous version, and confirm it is
    running a single replica again:
@z

@x
    ```console
    $ docker service rollback my-service
@y
    ```console
    $ docker service rollback my-service
@z

@x
    $ docker service ls
@y
    $ docker service ls
@z

@x
    ID                  NAME                MODE                REPLICAS            IMAGE               PORTS
    xbw728mf6q0d        my-service          replicated          1/1                 nginx:alpine        *:8080->80/tcp
    ```
deprecated: false
min_api_version: "1.31"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@y
    ID                  NAME                MODE                REPLICAS            IMAGE               PORTS
    xbw728mf6q0d        my-service          replicated          1/1                 nginx:alpine        *:8080->80/tcp
    ```
deprecated: false
min_api_version: "1.31"
experimental: false
experimentalcli: false
kubernetes: false
swarm: true
@z
