%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker image import
aliases: docker image import, docker import
short: Import the contents from a tarball to create a filesystem image
long: |-
    You can specify a `URL` or `-` (dash) to take data directly from `STDIN`. The
    `URL` can point to an archive (.tar, .tar.gz, .tgz, .bzip, .tar.xz, or .txz)
    containing a filesystem or to an individual file on the Docker host.  If you
    specify an archive, Docker untars it in the container relative to the `/`
    (root). If you specify an individual file, you must specify the full path within
    the host. To import from a remote location, specify a `URI` that begins with the
    `http://` or `https://` protocol.
@y
command: docker image import
aliases: docker image import, docker import
short: Import the contents from a tarball to create a filesystem image
long: |-
    You can specify a `URL` or `-` (dash) to take data directly from `STDIN`. The
    `URL` can point to an archive (.tar, .tar.gz, .tgz, .bzip, .tar.xz, or .txz)
    containing a filesystem or to an individual file on the Docker host.  If you
    specify an archive, Docker untars it in the container relative to the `/`
    (root). If you specify an individual file, you must specify the full path within
    the host. To import from a remote location, specify a `URI` that begins with the
    `http://` or `https://` protocol.
@z

@x
    The `--change` option applies `Dockerfile` instructions to the image that is
    created. Supported `Dockerfile` instructions:
    `CMD`|`ENTRYPOINT`|`ENV`|`EXPOSE`|`ONBUILD`|`USER`|`VOLUME`|`WORKDIR`
usage: docker image import [OPTIONS] file|URL|- [REPOSITORY[:TAG]]
pname: docker image
plink: docker_image.yaml
options:
    - option: change
      shorthand: c
      value_type: list
      description: Apply Dockerfile instruction to the created image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: message
      shorthand: m
      value_type: string
      description: Set commit message for imported image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: platform
      value_type: string
      description: Set platform if server is multi-platform capable
      deprecated: false
      hidden: false
      min_api_version: "1.32"
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
    ### Import from a remote location
@y
    The `--change` option applies `Dockerfile` instructions to the image that is
    created. Supported `Dockerfile` instructions:
    `CMD`|`ENTRYPOINT`|`ENV`|`EXPOSE`|`ONBUILD`|`USER`|`VOLUME`|`WORKDIR`
usage: docker image import [OPTIONS] file|URL|- [REPOSITORY[:TAG]]
pname: docker image
plink: docker_image.yaml
options:
    - option: change
      shorthand: c
      value_type: list
      description: Apply Dockerfile instruction to the created image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: message
      shorthand: m
      value_type: string
      description: Set commit message for imported image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: platform
      value_type: string
      description: Set platform if server is multi-platform capable
      deprecated: false
      hidden: false
      min_api_version: "1.32"
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
    ### Import from a remote location
@z

@x
    This creates a new untagged image.
@y
    This creates a new untagged image.
@z

@x
    ```console
    $ docker import https://example.com/exampleimage.tgz
    ```
@y
    ```console
    $ docker import https://example.com/exampleimage.tgz
    ```
@z

@x
    ### Import from a local file
@y
    ### Import from a local file
@z

@x
    Import to docker via pipe and `STDIN`.
@y
    Import to docker via pipe and `STDIN`.
@z

@x
    ```console
    $ cat exampleimage.tgz | docker import - exampleimagelocal:new
    ```
@y
    ```console
    $ cat exampleimage.tgz | docker import - exampleimagelocal:new
    ```
@z

@x
    Import with a commit message.
@y
    Import with a commit message.
@z

@x
    ```console
    $ cat exampleimage.tgz | docker import --message "New image imported from tarball" - exampleimagelocal:new
    ```
@y
    ```console
    $ cat exampleimage.tgz | docker import --message "New image imported from tarball" - exampleimagelocal:new
    ```
@z

@x
    Import to docker from a local archive.
@y
    Import to docker from a local archive.
@z

@x
    ```console
    $ docker import /path/to/exampleimage.tgz
    ```
@y
    ```console
    $ docker import /path/to/exampleimage.tgz
    ```
@z

@x
    ### Import from a local directory
@y
    ### Import from a local directory
@z

@x
    ```console
    $ sudo tar -c . | docker import - exampleimagedir
    ```
@y
    ```console
    $ sudo tar -c . | docker import - exampleimagedir
    ```
@z

@x
    ### Import from a local directory with new configurations
@y
    ### Import from a local directory with new configurations
@z

@x
    ```console
    $ sudo tar -c . | docker import --change "ENV DEBUG=true" - exampleimagedir
    ```
@y
    ```console
    $ sudo tar -c . | docker import --change "ENV DEBUG=true" - exampleimagedir
    ```
@z

@x
    Note the `sudo` in this example – you must preserve
    the ownership of the files (especially root ownership) during the
    archiving with tar. If you are not root (or the sudo command) when you
    tar, then the ownerships might not get preserved.
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    Note the `sudo` in this example – you must preserve
    the ownership of the files (especially root ownership) during the
    archiving with tar. If you are not root (or the sudo command) when you
    tar, then the ownerships might not get preserved.
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
