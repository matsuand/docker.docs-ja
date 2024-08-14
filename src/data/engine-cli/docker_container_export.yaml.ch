%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker container export
aliases: docker container export, docker export
short: Export a container's filesystem as a tar archive
@y
command: docker container export
aliases: docker container export, docker export
short: Export a container's filesystem as a tar archive
@z

@x
long: |-
    The `docker export` command doesn't export the contents of volumes associated
    with the container. If a volume is mounted on top of an existing directory in
    the container, `docker export` exports the contents of the underlying
    directory, not the contents of the volume.
@y
long: |-
    The `docker export` command doesn't export the contents of volumes associated
    with the container. If a volume is mounted on top of an existing directory in
    the container, `docker export` exports the contents of the underlying
    directory, not the contents of the volume.
@z

@x
    Refer to [Backup, restore, or migrate data volumes](/engine/storage/volumes/#back-up-restore-or-migrate-data-volumes)
    in the user guide for examples on exporting data in a volume.
@y
    Refer to [Backup, restore, or migrate data volumes](__SUBDIR__/engine/storage/volumes/#back-up-restore-or-migrate-data-volumes)
    in the user guide for examples on exporting data in a volume.
@z

@x
usage: docker container export [OPTIONS] CONTAINER
@y
usage: docker container export [OPTIONS] CONTAINER
@z

% options:

@x output
      description: Write to a file, instead of STDOUT
@y
      description: Write to a file, instead of STDOUT
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

@x
examples: |-
    The following commands produce the same result.
@y
examples: |-
    The following commands produce the same result.
@z

% snip commands...
