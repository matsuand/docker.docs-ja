%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker buildx ls
short: List builder instances
long: |-
    Lists all builder instances and the nodes for each instance
@y
command: docker buildx ls
short: List builder instances
long: |-
    Lists all builder instances and the nodes for each instance
@z

@x
    ```console
    $ docker buildx ls
    NAME/NODE       DRIVER/ENDPOINT             STATUS  BUILDKIT PLATFORMS
    elated_tesla *  docker-container
      elated_tesla0 unix:///var/run/docker.sock running v0.10.3  linux/amd64
      elated_tesla1 ssh://ubuntu@1.2.3.4        running v0.10.3  linux/arm64*, linux/arm/v7, linux/arm/v6
    default         docker
      default       default                     running v0.8.2   linux/amd64
    ```
@y
    ```console
    $ docker buildx ls
    NAME/NODE       DRIVER/ENDPOINT             STATUS  BUILDKIT PLATFORMS
    elated_tesla *  docker-container
      elated_tesla0 unix:///var/run/docker.sock running v0.10.3  linux/amd64
      elated_tesla1 ssh://ubuntu@1.2.3.4        running v0.10.3  linux/arm64*, linux/arm/v7, linux/arm/v6
    default         docker
      default       default                     running v0.8.2   linux/amd64
    ```
@z

@x
    Each builder has one or more nodes associated with it. The current builder's
    name is marked with a `*` in `NAME/NODE` and explicit node to build against for
    the target platform marked with a `*` in the `PLATFORMS` column.
usage: docker buildx ls
pname: docker buildx
plink: docker_buildx.yaml
options:
    - option: builder
      value_type: string
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    Each builder has one or more nodes associated with it. The current builder's
    name is marked with a `*` in `NAME/NODE` and explicit node to build against for
    the target platform marked with a `*` in the `PLATFORMS` column.
usage: docker buildx ls
pname: docker buildx
plink: docker_buildx.yaml
options:
    - option: builder
      value_type: string
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
