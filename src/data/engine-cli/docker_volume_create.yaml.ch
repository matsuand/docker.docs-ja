%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker volume create
short: Create a volume
long: |-
    Creates a new volume that containers can consume and store data in. If a name is
    not specified, Docker generates a random name.
usage: docker volume create [OPTIONS] [VOLUME]
pname: docker volume
plink: docker_volume.yaml
options:
    - option: availability
      value_type: string
      default_value: active
      description: Cluster Volume availability (`active`, `pause`, `drain`)
      deprecated: false
      hidden: false
      min_api_version: "1.42"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: true
    - option: driver
      shorthand: d
      value_type: string
      default_value: local
      description: Specify volume driver name
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: group
      value_type: string
      description: Cluster Volume group (cluster volumes)
      deprecated: false
      hidden: false
      min_api_version: "1.42"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: true
    - option: label
      value_type: list
      description: Set metadata for a volume
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: limit-bytes
      value_type: bytes
      default_value: "0"
      description: Minimum size of the Cluster Volume in bytes
      deprecated: false
      hidden: false
      min_api_version: "1.42"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: true
    - option: name
      value_type: string
      description: Specify volume name
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: opt
      shorthand: o
      value_type: map
      default_value: map[]
      description: Set driver specific options
      details_url: '#opt'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: required-bytes
      value_type: bytes
      default_value: "0"
      description: Maximum size of the Cluster Volume in bytes
      deprecated: false
      hidden: false
      min_api_version: "1.42"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: true
    - option: scope
      value_type: string
      default_value: single
      description: Cluster Volume access scope (`single`, `multi`)
      deprecated: false
      hidden: false
      min_api_version: "1.42"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: true
    - option: secret
      value_type: map
      default_value: map[]
      description: Cluster Volume secrets
      deprecated: false
      hidden: false
      min_api_version: "1.42"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: true
    - option: sharing
      value_type: string
      default_value: none
      description: |
        Cluster Volume access sharing (`none`, `readonly`, `onewriter`, `all`)
      deprecated: false
      hidden: false
      min_api_version: "1.42"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: true
    - option: topology-preferred
      value_type: list
      description: A topology that the Cluster Volume would be preferred in
      deprecated: false
      hidden: false
      min_api_version: "1.42"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: true
    - option: topology-required
      value_type: list
      description: A topology that the Cluster Volume must be accessible from
      deprecated: false
      hidden: false
      min_api_version: "1.42"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: true
    - option: type
      value_type: string
      default_value: block
      description: Cluster Volume access type (`mount`, `block`)
      deprecated: false
      hidden: false
      min_api_version: "1.42"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: true
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
    Create a volume and then configure the container to use it:
@y
command: docker volume create
short: Create a volume
long: |-
    Creates a new volume that containers can consume and store data in. If a name is
    not specified, Docker generates a random name.
usage: docker volume create [OPTIONS] [VOLUME]
pname: docker volume
plink: docker_volume.yaml
options:
    - option: availability
      value_type: string
      default_value: active
      description: Cluster Volume availability (`active`, `pause`, `drain`)
      deprecated: false
      hidden: false
      min_api_version: "1.42"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: true
    - option: driver
      shorthand: d
      value_type: string
      default_value: local
      description: Specify volume driver name
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: group
      value_type: string
      description: Cluster Volume group (cluster volumes)
      deprecated: false
      hidden: false
      min_api_version: "1.42"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: true
    - option: label
      value_type: list
      description: Set metadata for a volume
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: limit-bytes
      value_type: bytes
      default_value: "0"
      description: Minimum size of the Cluster Volume in bytes
      deprecated: false
      hidden: false
      min_api_version: "1.42"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: true
    - option: name
      value_type: string
      description: Specify volume name
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: opt
      shorthand: o
      value_type: map
      default_value: map[]
      description: Set driver specific options
      details_url: '#opt'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: required-bytes
      value_type: bytes
      default_value: "0"
      description: Maximum size of the Cluster Volume in bytes
      deprecated: false
      hidden: false
      min_api_version: "1.42"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: true
    - option: scope
      value_type: string
      default_value: single
      description: Cluster Volume access scope (`single`, `multi`)
      deprecated: false
      hidden: false
      min_api_version: "1.42"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: true
    - option: secret
      value_type: map
      default_value: map[]
      description: Cluster Volume secrets
      deprecated: false
      hidden: false
      min_api_version: "1.42"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: true
    - option: sharing
      value_type: string
      default_value: none
      description: |
        Cluster Volume access sharing (`none`, `readonly`, `onewriter`, `all`)
      deprecated: false
      hidden: false
      min_api_version: "1.42"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: true
    - option: topology-preferred
      value_type: list
      description: A topology that the Cluster Volume would be preferred in
      deprecated: false
      hidden: false
      min_api_version: "1.42"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: true
    - option: topology-required
      value_type: list
      description: A topology that the Cluster Volume must be accessible from
      deprecated: false
      hidden: false
      min_api_version: "1.42"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: true
    - option: type
      value_type: string
      default_value: block
      description: Cluster Volume access type (`mount`, `block`)
      deprecated: false
      hidden: false
      min_api_version: "1.42"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: true
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
    Create a volume and then configure the container to use it:
@z

@x
    ```console
    $ docker volume create hello
@y
    ```console
    $ docker volume create hello
@z

@x
    hello
@y
    hello
@z

@x
    $ docker run -d -v hello:/world busybox ls /world
    ```
@y
    $ docker run -d -v hello:/world busybox ls /world
    ```
@z

@x
    The mount is created inside the container's `/world` directory. Docker doesn't
    support relative paths for mount points inside the container.
@y
    The mount is created inside the container's `/world` directory. Docker doesn't
    support relative paths for mount points inside the container.
@z

@x
    Multiple containers can use the same volume. This is useful if two containers
    need access to shared data. For example, if one container writes and the other
    reads the data.
@y
    Multiple containers can use the same volume. This is useful if two containers
    need access to shared data. For example, if one container writes and the other
    reads the data.
@z

@x
    Volume names must be unique among drivers. This means you can't use the same
    volume name with two different drivers. Attempting to create two volumes with
    the same name results in an error:
@y
    Volume names must be unique among drivers. This means you can't use the same
    volume name with two different drivers. Attempting to create two volumes with
    the same name results in an error:
@z

@x
    ```console
    A volume named  "hello"  already exists with the "some-other" driver. Choose a different volume name.
    ```
@y
    ```console
    A volume named  "hello"  already exists with the "some-other" driver. Choose a different volume name.
    ```
@z

@x
    If you specify a volume name already in use on the current driver, Docker
    assumes you want to reuse the existing volume and doesn't return an error.
@y
    If you specify a volume name already in use on the current driver, Docker
    assumes you want to reuse the existing volume and doesn't return an error.
@z

@x
    ### Driver-specific options (-o, --opt) {#opt}
@y
    ### Driver-specific options (-o, --opt) {#opt}
@z

@x
    Some volume drivers may take options to customize the volume creation. Use the
    `-o` or `--opt` flags to pass driver options:
@y
    Some volume drivers may take options to customize the volume creation. Use the
    `-o` or `--opt` flags to pass driver options:
@z

@x
    ```console
    $ docker volume create --driver fake \
        --opt tardis=blue \
        --opt timey=wimey \
        foo
    ```
@y
    ```console
    $ docker volume create --driver fake \
        --opt tardis=blue \
        --opt timey=wimey \
        foo
    ```
@z

@x
    These options are passed directly to the volume driver. Options for
    different volume drivers may do different things (or nothing at all).
@y
    These options are passed directly to the volume driver. Options for
    different volume drivers may do different things (or nothing at all).
@z

@x
    The built-in `local` driver accepts no options on Windows. On Linux and with
    Docker Desktop, the `local` driver accepts options similar to the Linux `mount`
    command. You can provide multiple options by passing the `--opt` flag multiple
    times. Some `mount` options (such as the `o` option) can take a comma-separated
    list of options. Complete list of available mount options can be found
    [here](https://man7.org/linux/man-pages/man8/mount.8.html).
@y
    The built-in `local` driver accepts no options on Windows. On Linux and with
    Docker Desktop, the `local` driver accepts options similar to the Linux `mount`
    command. You can provide multiple options by passing the `--opt` flag multiple
    times. Some `mount` options (such as the `o` option) can take a comma-separated
    list of options. Complete list of available mount options can be found
    [here](https://man7.org/linux/man-pages/man8/mount.8.html).
@z

@x
    For example, the following creates a `tmpfs` volume called `foo` with a size of
    100 megabyte and `uid` of 1000.
@y
    For example, the following creates a `tmpfs` volume called `foo` with a size of
    100 megabyte and `uid` of 1000.
@z

@x
    ```console
    $ docker volume create --driver local \
        --opt type=tmpfs \
        --opt device=tmpfs \
        --opt o=size=100m,uid=1000 \
        foo
    ```
@y
    ```console
    $ docker volume create --driver local \
        --opt type=tmpfs \
        --opt device=tmpfs \
        --opt o=size=100m,uid=1000 \
        foo
    ```
@z

@x
    Another example that uses `btrfs`:
@y
    Another example that uses `btrfs`:
@z

@x
    ```console
    $ docker volume create --driver local \
        --opt type=btrfs \
        --opt device=/dev/sda2 \
        foo
    ```
@y
    ```console
    $ docker volume create --driver local \
        --opt type=btrfs \
        --opt device=/dev/sda2 \
        foo
    ```
@z

@x
    Another example that uses `nfs` to mount the `/path/to/dir` in `rw` mode from
    `192.168.1.1`:
@y
    Another example that uses `nfs` to mount the `/path/to/dir` in `rw` mode from
    `192.168.1.1`:
@z

@x
    ```console
    $ docker volume create --driver local \
        --opt type=nfs \
        --opt o=addr=192.168.1.1,rw \
        --opt device=:/path/to/dir \
        foo
    ```
deprecated: false
hidden: false
min_api_version: "1.21"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    ```console
    $ docker volume create --driver local \
        --opt type=nfs \
        --opt o=addr=192.168.1.1,rw \
        --opt device=:/path/to/dir \
        foo
    ```
deprecated: false
hidden: false
min_api_version: "1.21"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
