%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker scout recommendations
short: Display available base image updates and remediation recommendations
long: |-
    The `docker scout recommendations` command display recommendations for base images updates.
    It analyzes the image and display recommendations to refresh or update the base image.
    For each recommendation it shows a list of benefits, such as
    fewer vulnerabilities or smaller image size.
@y
command: docker scout recommendations
short: Display available base image updates and remediation recommendations
long: |-
    The `docker scout recommendations` command display recommendations for base images updates.
    It analyzes the image and display recommendations to refresh or update the base image.
    For each recommendation it shows a list of benefits, such as
    fewer vulnerabilities or smaller image size.
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
usage: docker scout recommendations [IMAGE|DIRECTORY|ARCHIVE]
pname: docker scout
plink: docker_scout.yaml
options:
    - option: only-refresh
      value_type: bool
      default_value: "false"
      description: Only display base image refresh recommendations
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-update
      value_type: bool
      default_value: "false"
      description: Only display base image update recommendations
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
      description: Write the report to a file
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
        Can only be used with archive
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: tag
      value_type: string
      description: Specify tag
      deprecated: false
      hidden: false
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
    ### Display base image update recommendations
@y
    - `image://` (default) use a local image, or fall back to a registry lookup
    - `local://` use an image from the local image store (don't do a registry lookup)
    - `registry://` use an image from a registry (don't use a local image)
    - `oci-dir://` use an OCI layout directory
    - `archive://` use a tarball archive, as created by `docker save`
    - `fs://` use a local directory or file
usage: docker scout recommendations [IMAGE|DIRECTORY|ARCHIVE]
pname: docker scout
plink: docker_scout.yaml
options:
    - option: only-refresh
      value_type: bool
      default_value: "false"
      description: Only display base image refresh recommendations
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-update
      value_type: bool
      default_value: "false"
      description: Only display base image update recommendations
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
      description: Write the report to a file
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
        Can only be used with archive
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: tag
      value_type: string
      description: Specify tag
      deprecated: false
      hidden: false
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
    ### Display base image update recommendations
@z

@x
    ```console
    $ docker scout recommendations golang:1.19.4
    ```
@y
    ```console
    $ docker scout recommendations golang:1.19.4
    ```
@z

@x
    ### Display base image refresh only recommendations
@y
    ### Display base image refresh only recommendations
@z

@x
    ```console
    $ docker scout recommendations --only-refresh golang:1.19.4
    ```
@y
    ```console
    $ docker scout recommendations --only-refresh golang:1.19.4
    ```
@z

@x
    ### Display base image update only recommendations
@y
    ### Display base image update only recommendations
@z

@x
    ```console
    $ docker scout recommendations --only-update golang:1.19.4
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    ```console
    $ docker scout recommendations --only-update golang:1.19.4
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
