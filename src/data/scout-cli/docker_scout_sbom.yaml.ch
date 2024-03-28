%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker scout sbom
short: Generate or display SBOM of an image
long: |-
    The `docker scout sbom` command analyzes a software artifact to generate a
    Software Bill Of Materials (SBOM).
@y
command: docker scout sbom
short: Generate or display SBOM of an image
long: |-
    The `docker scout sbom` command analyzes a software artifact to generate a
    Software Bill Of Materials (SBOM).
@z

@x
    The SBOM contains a list of all packages in the image.
    You can use the `--format` flag to filter the output of the command
    to display only packages of a specific type.
@y
    The SBOM contains a list of all packages in the image.
    You can use the `--format` flag to filter the output of the command
    to display only packages of a specific type.
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
usage: docker scout sbom [IMAGE|DIRECTORY|ARCHIVE]
pname: docker scout
plink: docker_scout.yaml
options:
    - option: format
      value_type: string
      default_value: json
      description: |-
        Output format:
        - list: list of packages of the image
        - json: json representation of the SBOM
        - spdx: spdx representation of the SBOM
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-package-type
      value_type: stringSlice
      default_value: '[]'
      description: |-
        Comma separated list of package types (like apk, deb, rpm, npm, pypi, golang, etc)
        Can only be used with --format list
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
    ### Display the list of packages
@y
    - `image://` (default) use a local image, or fall back to a registry lookup
    - `local://` use an image from the local image store (don't do a registry lookup)
    - `registry://` use an image from a registry (don't use a local image)
    - `oci-dir://` use an OCI layout directory
    - `archive://` use a tarball archive, as created by `docker save`
    - `fs://` use a local directory or file
usage: docker scout sbom [IMAGE|DIRECTORY|ARCHIVE]
pname: docker scout
plink: docker_scout.yaml
options:
    - option: format
      value_type: string
      default_value: json
      description: |-
        Output format:
        - list: list of packages of the image
        - json: json representation of the SBOM
        - spdx: spdx representation of the SBOM
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-package-type
      value_type: stringSlice
      default_value: '[]'
      description: |-
        Comma separated list of package types (like apk, deb, rpm, npm, pypi, golang, etc)
        Can only be used with --format list
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
    ### Display the list of packages
@z

@x
    ```console
    $ docker scout sbom --format list alpine
    ```
@y
    ```console
    $ docker scout sbom --format list alpine
    ```
@z

@x
    ### Only display packages of a specific type
@y
    ### Only display packages of a specific type
@z

@x
    ```console
     $ docker scout sbom --format list --only-package-type apk alpine
    ```
@y
    ```console
     $ docker scout sbom --format list --only-package-type apk alpine
    ```
@z

@x
    ### Display the full SBOM in JSON format
@y
    ### Display the full SBOM in JSON format
@z

@x
    ```console
    $ docker scout sbom alpine
    ```
@y
    ```console
    $ docker scout sbom alpine
    ```
@z

@x
    ### Display the full SBOM of the most recently built image
@y
    ### Display the full SBOM of the most recently built image
@z

@x
    ```console
    $ docker scout sbom
    ```
@y
    ```console
    $ docker scout sbom
    ```
@z

@x
    ### Write SBOM to a file
@y
    ### Write SBOM to a file
@z

@x
    ```console
    $ docker scout sbom --output alpine.sbom alpine
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    ```console
    $ docker scout sbom --output alpine.sbom alpine
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
