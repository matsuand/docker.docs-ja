%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker unpause
aliases: docker container unpause, docker unpause
short: Unpause all processes within one or more containers
long: |-
    The `docker unpause` command un-suspends all processes in the specified containers.
    On Linux, it does this using the freezer cgroup.
@y
command: docker unpause
aliases: docker container unpause, docker unpause
short: Unpause all processes within one or more containers
long: |-
    The `docker unpause` command un-suspends all processes in the specified containers.
    On Linux, it does this using the freezer cgroup.
@z

@x
    See the
    [freezer cgroup documentation](https://www.kernel.org/doc/Documentation/cgroup-v1/freezer-subsystem.txt)
    for further details.
usage: docker unpause CONTAINER [CONTAINER...]
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
    ```console
    $ docker unpause my_container
    my_container
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    See the
    [freezer cgroup documentation](https://www.kernel.org/doc/Documentation/cgroup-v1/freezer-subsystem.txt)
    for further details.
usage: docker unpause CONTAINER [CONTAINER...]
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
    ```console
    $ docker unpause my_container
    my_container
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
