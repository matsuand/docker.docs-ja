%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker container cp
aliases: docker container cp, docker cp
short: Copy files/folders between a container and the local filesystem
long: |-
    The `docker cp` utility copies the contents of `SRC_PATH` to the `DEST_PATH`.
    You can copy from the container's file system to the local machine or the
    reverse, from the local filesystem to the container. If `-` is specified for
    either the `SRC_PATH` or `DEST_PATH`, you can also stream a tar archive from
    `STDIN` or to `STDOUT`. The `CONTAINER` can be a running or stopped container.
    The `SRC_PATH` or `DEST_PATH` can be a file or directory.
@y
command: docker container cp
aliases: docker container cp, docker cp
short: Copy files/folders between a container and the local filesystem
long: |-
    The `docker cp` utility copies the contents of `SRC_PATH` to the `DEST_PATH`.
    You can copy from the container's file system to the local machine or the
    reverse, from the local filesystem to the container. If `-` is specified for
    either the `SRC_PATH` or `DEST_PATH`, you can also stream a tar archive from
    `STDIN` or to `STDOUT`. The `CONTAINER` can be a running or stopped container.
    The `SRC_PATH` or `DEST_PATH` can be a file or directory.
@z

@x
    The `docker cp` command assumes container paths are relative to the container's
    `/` (root) directory. This means supplying the initial forward slash is optional;
    The command sees `compassionate_darwin:/tmp/foo/myfile.txt` and
    `compassionate_darwin:tmp/foo/myfile.txt` as identical. Local machine paths can
    be an absolute or relative value. The command interprets a local machine's
    relative paths as relative to the current working directory where `docker cp` is
    run.
@y
    The `docker cp` command assumes container paths are relative to the container's
    `/` (root) directory. This means supplying the initial forward slash is optional;
    The command sees `compassionate_darwin:/tmp/foo/myfile.txt` and
    `compassionate_darwin:tmp/foo/myfile.txt` as identical. Local machine paths can
    be an absolute or relative value. The command interprets a local machine's
    relative paths as relative to the current working directory where `docker cp` is
    run.
@z

@x
    The `cp` command behaves like the Unix `cp -a` command in that directories are
    copied recursively with permissions preserved if possible. Ownership is set to
    the user and primary group at the destination. For example, files copied to a
    container are created with `UID:GID` of the root user. Files copied to the local
    machine are created with the `UID:GID` of the user which invoked the `docker cp`
    command. However, if you specify the `-a` option, `docker cp` sets the ownership
    to the user and primary group at the source.
    If you specify the `-L` option, `docker cp` follows any symbolic link
    in the `SRC_PATH`.  `docker cp` doesn't create parent directories for
    `DEST_PATH` if they don't exist.
@y
    The `cp` command behaves like the Unix `cp -a` command in that directories are
    copied recursively with permissions preserved if possible. Ownership is set to
    the user and primary group at the destination. For example, files copied to a
    container are created with `UID:GID` of the root user. Files copied to the local
    machine are created with the `UID:GID` of the user which invoked the `docker cp`
    command. However, if you specify the `-a` option, `docker cp` sets the ownership
    to the user and primary group at the source.
    If you specify the `-L` option, `docker cp` follows any symbolic link
    in the `SRC_PATH`.  `docker cp` doesn't create parent directories for
    `DEST_PATH` if they don't exist.
@z

@x
    Assuming a path separator of `/`, a first argument of `SRC_PATH` and second
    argument of `DEST_PATH`, the behavior is as follows:
@y
    Assuming a path separator of `/`, a first argument of `SRC_PATH` and second
    argument of `DEST_PATH`, the behavior is as follows:
@z

@x
    - `SRC_PATH` specifies a file
        - `DEST_PATH` does not exist
            - the file is saved to a file created at `DEST_PATH`
        - `DEST_PATH` does not exist and ends with `/`
            - Error condition: the destination directory must exist.
        - `DEST_PATH` exists and is a file
            - the destination is overwritten with the source file's contents
        - `DEST_PATH` exists and is a directory
            - the file is copied into this directory using the basename from
              `SRC_PATH`
    - `SRC_PATH` specifies a directory
        - `DEST_PATH` does not exist
            - `DEST_PATH` is created as a directory and the *contents* of the source
               directory are copied into this directory
        - `DEST_PATH` exists and is a file
            - Error condition: cannot copy a directory to a file
        - `DEST_PATH` exists and is a directory
            - `SRC_PATH` does not end with `/.` (that is: _slash_ followed by _dot_)
                - the source directory is copied into this directory
            - `SRC_PATH` does end with `/.` (that is: _slash_ followed by _dot_)
                - the *content* of the source directory is copied into this
                  directory
@y
    - `SRC_PATH` specifies a file
        - `DEST_PATH` does not exist
            - the file is saved to a file created at `DEST_PATH`
        - `DEST_PATH` does not exist and ends with `/`
            - Error condition: the destination directory must exist.
        - `DEST_PATH` exists and is a file
            - the destination is overwritten with the source file's contents
        - `DEST_PATH` exists and is a directory
            - the file is copied into this directory using the basename from
              `SRC_PATH`
    - `SRC_PATH` specifies a directory
        - `DEST_PATH` does not exist
            - `DEST_PATH` is created as a directory and the *contents* of the source
               directory are copied into this directory
        - `DEST_PATH` exists and is a file
            - Error condition: cannot copy a directory to a file
        - `DEST_PATH` exists and is a directory
            - `SRC_PATH` does not end with `/.` (that is: _slash_ followed by _dot_)
                - the source directory is copied into this directory
            - `SRC_PATH` does end with `/.` (that is: _slash_ followed by _dot_)
                - the *content* of the source directory is copied into this
                  directory
@z

@x
    The command requires `SRC_PATH` and `DEST_PATH` to exist according to the above
    rules. If `SRC_PATH` is local and is a symbolic link, the symbolic link, not
    the target, is copied by default. To copy the link target and not the link, specify
    the `-L` option.
@y
    The command requires `SRC_PATH` and `DEST_PATH` to exist according to the above
    rules. If `SRC_PATH` is local and is a symbolic link, the symbolic link, not
    the target, is copied by default. To copy the link target and not the link, specify
    the `-L` option.
@z

@x
    A colon (`:`) is used as a delimiter between `CONTAINER` and its path. You can
    also use `:` when specifying paths to a `SRC_PATH` or `DEST_PATH` on a local
    machine, for example  `file:name.txt`. If you use a `:` in a local machine path,
    you must be explicit with a relative or absolute path, for example:
@y
    A colon (`:`) is used as a delimiter between `CONTAINER` and its path. You can
    also use `:` when specifying paths to a `SRC_PATH` or `DEST_PATH` on a local
    machine, for example  `file:name.txt`. If you use a `:` in a local machine path,
    you must be explicit with a relative or absolute path, for example:
@z

@x
        `/path/to/file:name.txt` or `./file:name.txt`
usage: |-
    docker container cp [OPTIONS] CONTAINER:SRC_PATH DEST_PATH|-
    	docker cp [OPTIONS] SRC_PATH|- CONTAINER:DEST_PATH
pname: docker container
plink: docker_container.yaml
options:
    - option: archive
      shorthand: a
      value_type: bool
      default_value: "false"
      description: Archive mode (copy all uid/gid information)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: follow-link
      shorthand: L
      value_type: bool
      default_value: "false"
      description: Always follow symbol link in SRC_PATH
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: quiet
      shorthand: q
      value_type: bool
      default_value: "false"
      description: |
        Suppress progress output during copy. Progress output is automatically suppressed if no terminal is attached
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
    Copy a local file into container
@y
        `/path/to/file:name.txt` or `./file:name.txt`
usage: |-
    docker container cp [OPTIONS] CONTAINER:SRC_PATH DEST_PATH|-
    	docker cp [OPTIONS] SRC_PATH|- CONTAINER:DEST_PATH
pname: docker container
plink: docker_container.yaml
options:
    - option: archive
      shorthand: a
      value_type: bool
      default_value: "false"
      description: Archive mode (copy all uid/gid information)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: follow-link
      shorthand: L
      value_type: bool
      default_value: "false"
      description: Always follow symbol link in SRC_PATH
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: quiet
      shorthand: q
      value_type: bool
      default_value: "false"
      description: |
        Suppress progress output during copy. Progress output is automatically suppressed if no terminal is attached
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
    Copy a local file into container
@z

@x
    ```console
    $ docker cp ./some_file CONTAINER:/work
    ```
@y
    ```console
    $ docker cp ./some_file CONTAINER:/work
    ```
@z

@x
    Copy files from container to local path
@y
    Copy files from container to local path
@z

@x
    ```console
    $ docker cp CONTAINER:/var/logs/ /tmp/app_logs
    ```
@y
    ```console
    $ docker cp CONTAINER:/var/logs/ /tmp/app_logs
    ```
@z

@x
    Copy a file from container to stdout. Note `cp` command produces a tar stream
@y
    Copy a file from container to stdout. Note `cp` command produces a tar stream
@z

@x
    ```console
    $ docker cp CONTAINER:/var/logs/app.log - | tar x -O | grep "ERROR"
    ```
@y
    ```console
    $ docker cp CONTAINER:/var/logs/app.log - | tar x -O | grep "ERROR"
    ```
@z

@x
    ### Corner cases
@y
    ### Corner cases
@z

@x
    It isn't possible to copy certain system files such as resources under
    `/proc`, `/sys`, `/dev`, [tmpfs](/reference/cli/docker/container/run/#tmpfs), and mounts created by
    the user in the container. However, you can still copy such files by manually
    running `tar` in `docker exec`. Both of the following examples do the same thing
    in different ways (consider `SRC_PATH` and `DEST_PATH` are directories):
@y
    It isn't possible to copy certain system files such as resources under
    `/proc`, `/sys`, `/dev`, [tmpfs](__SUBDIR__/reference/cli/docker/container/run/#tmpfs), and mounts created by
    the user in the container. However, you can still copy such files by manually
    running `tar` in `docker exec`. Both of the following examples do the same thing
    in different ways (consider `SRC_PATH` and `DEST_PATH` are directories):
@z

@x
    ```console
    $ docker exec CONTAINER tar Ccf $(dirname SRC_PATH) - $(basename SRC_PATH) | tar Cxf DEST_PATH -
    ```
@y
    ```console
    $ docker exec CONTAINER tar Ccf $(dirname SRC_PATH) - $(basename SRC_PATH) | tar Cxf DEST_PATH -
    ```
@z

@x
    ```console
    $ tar Ccf $(dirname SRC_PATH) - $(basename SRC_PATH) | docker exec -i CONTAINER tar Cxf DEST_PATH -
    ```
@y
    ```console
    $ tar Ccf $(dirname SRC_PATH) - $(basename SRC_PATH) | docker exec -i CONTAINER tar Cxf DEST_PATH -
    ```
@z

@x
    Using `-` as the `SRC_PATH` streams the contents of `STDIN` as a tar archive.
    The command extracts the content of the tar to the `DEST_PATH` in container's
    filesystem. In this case, `DEST_PATH` must specify a directory. Using `-` as
    the `DEST_PATH` streams the contents of the resource as a tar archive to `STDOUT`.
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    Using `-` as the `SRC_PATH` streams the contents of `STDIN` as a tar archive.
    The command extracts the content of the tar to the `DEST_PATH` in container's
    filesystem. In this case, `DEST_PATH` must specify a directory. Using `-` as
    the `DEST_PATH` streams the contents of the resource as a tar archive to `STDOUT`.
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
