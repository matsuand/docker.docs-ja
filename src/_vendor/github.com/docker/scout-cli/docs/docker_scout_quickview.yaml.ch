%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker scout quickview
aliases: docker scout quickview, docker scout qv
short: Quick overview of an image
long: |-
    The `docker scout quickview` command displays a quick overview of an image.
    It displays a summary of the vulnerabilities in the specified image
    and vulnerabilities from the base image.
    If available, it also displays base image refresh and update recommendations.
@y
command: docker scout quickview
aliases: docker scout quickview, docker scout qv
short: Quick overview of an image
long: |-
    The `docker scout quickview` command displays a quick overview of an image.
    It displays a summary of the vulnerabilities in the specified image
    and vulnerabilities from the base image.
    If available, it also displays base image refresh and update recommendations.
@z

@x
    If no image is specified, the most recently built image is used.
@y
    If no image is specified, the most recently built image is used.
@z

@x
    The following artifact types are supported:
@y
    The following artifact types are supported:
@z

@x
    - Images
    - OCI layout directories
    - Tarball archives, as created by `docker save`
    - Local directory or file
@y
    - Images
    - OCI layout directories
    - Tarball archives, as created by `docker save`
    - Local directory or file
@z

@x
    By default, the tool expects an image reference, such as:
@y
    By default, the tool expects an image reference, such as:
@z

@x
    - `redis`
    - `curlimages/curl:7.87.0`
    - `mcr.microsoft.com/dotnet/runtime:7.0`
@y
    - `redis`
    - `curlimages/curl:7.87.0`
    - `mcr.microsoft.com/dotnet/runtime:7.0`
@z

@x
    If the artifact you want to analyze is an OCI directory, a tarball archive, a local file or directory,
    or if you want to control from where the image will be resolved, you must prefix the reference with one of the following:
@y
    If the artifact you want to analyze is an OCI directory, a tarball archive, a local file or directory,
    or if you want to control from where the image will be resolved, you must prefix the reference with one of the following:
@z

@x
    - `image://` (default) use a local image, or fall back to a registry lookup
    - `local://` use an image from the local image store (don't do a registry lookup)
    - `registry://` use an image from a registry (don't use a local image)
    - `oci-dir://` use an OCI layout directory
    - `archive://` use a tarball archive, as created by `docker save`
    - `fs://` use a local directory or file
usage: docker scout quickview [IMAGE|DIRECTORY|ARCHIVE]
pname: docker scout
plink: docker_scout.yaml
options:
    - option: env
      value_type: string
      description: Name of the environment
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: latest
      value_type: bool
      default_value: "false"
      description: Latest indexed image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: org
      value_type: string
      description: Namespace of the Docker organization
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: output
      shorthand: o
      value_type: string
      description: Write the report to a file.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: platform
      value_type: string
      description: Platform of image to analyze
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: ref
      value_type: string
      description: |-
        Reference to use if the provided tarball contains multiple references.
        Can only be used with archive.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: stream
      value_type: string
      description: Name of stream
      deprecated: true
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: debug
      value_type: bool
      default_value: "false"
      description: Debug messages
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: verbose-debug
      value_type: bool
      default_value: "false"
      description: Verbose debug
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Quick overview of an image
@y
    - `image://` (default) use a local image, or fall back to a registry lookup
    - `local://` use an image from the local image store (don't do a registry lookup)
    - `registry://` use an image from a registry (don't use a local image)
    - `oci-dir://` use an OCI layout directory
    - `archive://` use a tarball archive, as created by `docker save`
    - `fs://` use a local directory or file
usage: docker scout quickview [IMAGE|DIRECTORY|ARCHIVE]
pname: docker scout
plink: docker_scout.yaml
options:
    - option: env
      value_type: string
      description: Name of the environment
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: latest
      value_type: bool
      default_value: "false"
      description: Latest indexed image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: org
      value_type: string
      description: Namespace of the Docker organization
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: output
      shorthand: o
      value_type: string
      description: Write the report to a file.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: platform
      value_type: string
      description: Platform of image to analyze
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: ref
      value_type: string
      description: |-
        Reference to use if the provided tarball contains multiple references.
        Can only be used with archive.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: stream
      value_type: string
      description: Name of stream
      deprecated: true
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: debug
      value_type: bool
      default_value: "false"
      description: Debug messages
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: verbose-debug
      value_type: bool
      default_value: "false"
      description: Verbose debug
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Quick overview of an image
@z

@x
    ```console
    $ docker scout quickview golang:1.19.4
        ...Pulling
        ✓ Pulled
        ✓ SBOM of image already cached, 278 packages indexed
@y
    ```console
    $ docker scout quickview golang:1.19.4
        ...Pulling
        ✓ Pulled
        ✓ SBOM of image already cached, 278 packages indexed
@z

@x
      Your image  golang:1.19.4                          │    5C     3H     6M    63L
      Base image  buildpack-deps:bullseye-scm            │    5C     1H     3M    48L     6?
      Refreshed base image  buildpack-deps:bullseye-scm  │    0C     0H     0M    42L
                                                         │    -5     -1     -3     -6     -6
      Updated base image  buildpack-deps:sid-scm         │    0C     0H     1M    29L
                                                         │    -5     -1     -2    -19     -6
    ```
@y
      Your image  golang:1.19.4                          │    5C     3H     6M    63L
      Base image  buildpack-deps:bullseye-scm            │    5C     1H     3M    48L     6?
      Refreshed base image  buildpack-deps:bullseye-scm  │    0C     0H     0M    42L
                                                         │    -5     -1     -3     -6     -6
      Updated base image  buildpack-deps:sid-scm         │    0C     0H     1M    29L
                                                         │    -5     -1     -2    -19     -6
    ```
@z

@x
    ### Quick overview of the most recently built image
@y
    ### Quick overview of the most recently built image
@z

@x
    ```console
    $ docker scout qv
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    ```console
    $ docker scout qv
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
