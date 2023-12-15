%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker volume rm
aliases: docker volume rm, docker volume remove
short: Remove one or more volumes
long: |
    Remove one or more volumes. You cannot remove a volume that is in use by a container.
usage: docker volume rm [OPTIONS] VOLUME [VOLUME...]
pname: docker volume
plink: docker_volume.yaml
options:
    - option: force
      shorthand: f
      value_type: bool
      default_value: "false"
      description: Force the removal of one or more volumes
      deprecated: false
      hidden: false
      min_api_version: "1.25"
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
    ```console
    $ docker volume rm hello
@y
command: docker volume rm
aliases: docker volume rm, docker volume remove
short: Remove one or more volumes
long: |
    Remove one or more volumes. You cannot remove a volume that is in use by a container.
usage: docker volume rm [OPTIONS] VOLUME [VOLUME...]
pname: docker volume
plink: docker_volume.yaml
options:
    - option: force
      shorthand: f
      value_type: bool
      default_value: "false"
      description: Force the removal of one or more volumes
      deprecated: false
      hidden: false
      min_api_version: "1.25"
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
    ```console
    $ docker volume rm hello
@z

@x
    hello
    ```
deprecated: false
min_api_version: "1.21"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    hello
    ```
deprecated: false
min_api_version: "1.21"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
