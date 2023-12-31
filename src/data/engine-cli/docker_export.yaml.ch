%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker export
aliases: docker container export, docker export
short: Export a container's filesystem as a tar archive
long: |-
    The `docker export` command does not export the contents of volumes associated
    with the container. If a volume is mounted on top of an existing directory in
    the container, `docker export` will export the contents of the *underlying*
    directory, not the contents of the volume.
@y
command: docker export
aliases: docker container export, docker export
short: Export a container's filesystem as a tar archive
long: |-
    The `docker export` command does not export the contents of volumes associated
    with the container. If a volume is mounted on top of an existing directory in
    the container, `docker export` will export the contents of the *underlying*
    directory, not the contents of the volume.
@z

@x
    Refer to [Backup, restore, or migrate data volumes](/storage/volumes/#back-up-restore-or-migrate-data-volumes)
    in the user guide for examples on exporting data in a volume.
usage: docker export [OPTIONS] CONTAINER
pname: docker
plink: docker.yaml
options:
    - option: output
      shorthand: o
      value_type: string
      description: Write to a file, instead of STDOUT
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
    Each of these commands has the same result.
@y
    Refer to [Backup, restore, or migrate data volumes](/storage/volumes/#back-up-restore-or-migrate-data-volumes)
    in the user guide for examples on exporting data in a volume.
usage: docker export [OPTIONS] CONTAINER
pname: docker
plink: docker.yaml
options:
    - option: output
      shorthand: o
      value_type: string
      description: Write to a file, instead of STDOUT
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
    Each of these commands has the same result.
@z

@x
    ```console
    $ docker export red_panda > latest.tar
    ```
@y
    ```console
    $ docker export red_panda > latest.tar
    ```
@z

@x
    ```console
    $ docker export --output="latest.tar" red_panda
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    ```console
    $ docker export --output="latest.tar" red_panda
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
