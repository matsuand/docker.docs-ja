%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker port
aliases: docker container port, docker port
short: List port mappings or a specific mapping for the container
long: List port mappings or a specific mapping for the container
usage: docker port CONTAINER [PRIVATE_PORT[/PROTO]]
pname: docker
plink: docker.yaml
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
    ### Show all mapped ports
@y
command: docker port
aliases: docker container port, docker port
short: List port mappings or a specific mapping for the container
long: List port mappings or a specific mapping for the container
usage: docker port CONTAINER [PRIVATE_PORT[/PROTO]]
pname: docker
plink: docker.yaml
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
    ### Show all mapped ports
@z

@x
    You can find out all the ports mapped by not specifying a `PRIVATE_PORT`, or
    just a specific mapping:
@y
    You can find out all the ports mapped by not specifying a `PRIVATE_PORT`, or
    just a specific mapping:
@z

@x
    ```console
    $ docker ps
@y
    ```console
    $ docker ps
@z

@x
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS                                            NAMES
    b650456536c7        busybox:latest      top                 54 minutes ago      Up 54 minutes       0.0.0.0:1234->9876/tcp, 0.0.0.0:4321->7890/tcp   test
@y
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS                                            NAMES
    b650456536c7        busybox:latest      top                 54 minutes ago      Up 54 minutes       0.0.0.0:1234->9876/tcp, 0.0.0.0:4321->7890/tcp   test
@z

@x
    $ docker port test
@y
    $ docker port test
@z

@x
    7890/tcp -> 0.0.0.0:4321
    9876/tcp -> 0.0.0.0:1234
@y
    7890/tcp -> 0.0.0.0:4321
    9876/tcp -> 0.0.0.0:1234
@z

@x
    $ docker port test 7890/tcp
@y
    $ docker port test 7890/tcp
@z

@x
    0.0.0.0:4321
@y
    0.0.0.0:4321
@z

@x
    $ docker port test 7890/udp
@y
    $ docker port test 7890/udp
@z

@x
    2014/06/24 11:53:36 Error: No public port '7890/udp' published for test
@y
    2014/06/24 11:53:36 Error: No public port '7890/udp' published for test
@z

@x
    $ docker port test 7890
@y
    $ docker port test 7890
@z

@x
    0.0.0.0:4321
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    0.0.0.0:4321
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
