%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker wait
aliases: docker container wait, docker wait
short: Block until one or more containers stop, then print their exit codes
long: Block until one or more containers stop, then print their exit codes
usage: docker wait CONTAINER [CONTAINER...]
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
    Start a container in the background.
@y
command: docker wait
aliases: docker container wait, docker wait
short: Block until one or more containers stop, then print their exit codes
long: Block until one or more containers stop, then print their exit codes
usage: docker wait CONTAINER [CONTAINER...]
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
    Start a container in the background.
@z

@x
    ```console
    $ docker run -dit --name=my_container ubuntu bash
    ```
@y
    ```console
    $ docker run -dit --name=my_container ubuntu bash
    ```
@z

@x
    Run `docker wait`, which should block until the container exits.
@y
    Run `docker wait`, which should block until the container exits.
@z

@x
    ```console
    $ docker wait my_container
    ```
@y
    ```console
    $ docker wait my_container
    ```
@z

@x
    In another terminal, stop the first container. The `docker wait` command above
    returns the exit code.
@y
    In another terminal, stop the first container. The `docker wait` command above
    returns the exit code.
@z

@x
    ```console
    $ docker stop my_container
    ```
@y
    ```console
    $ docker stop my_container
    ```
@z

@x
    This is the same `docker wait` command from above, but it now exits, returning
    `0`.
@y
    This is the same `docker wait` command from above, but it now exits, returning
    `0`.
@z

@x
    ```console
    $ docker wait my_container
@y
    ```console
    $ docker wait my_container
@z

@x
    0
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    0
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
