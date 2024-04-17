%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker scout compare
aliases: docker scout compare, docker scout diff
short: Compare two images and display differences (experimental)
long: |-
    The `docker scout compare` command analyzes two images and displays a comparison.
@y
command: docker scout compare
aliases: docker scout compare, docker scout diff
short: Compare two images and display differences (experimental)
long: |-
    The `docker scout compare` command analyzes two images and displays a comparison.
@z

@x
    > This command is **experimental** and its behaviour might change in the future
@y
    > This command is **experimental** and its behaviour might change in the future
@z

@x
    The intended use of this command is to compare two versions of the same image.
    For instance, when a new image is built and compared to the version running in production.
@y
    The intended use of this command is to compare two versions of the same image.
    For instance, when a new image is built and compared to the version running in production.
@z

@x
    If no image is specified, the most recently built image is used
    as a comparison target.
@y
    If no image is specified, the most recently built image is used
    as a comparison target.
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
usage: docker scout compare --to IMAGE|DIRECTORY|ARCHIVE [IMAGE|DIRECTORY|ARCHIVE]
pname: docker scout
plink: docker_scout.yaml
options:
    - option: exit-code
      shorthand: e
      value_type: bool
      default_value: "false"
      description: Return exit code '2' if vulnerability changes are detected
      deprecated: true
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: exit-on
      shorthand: x
      value_type: stringSlice
      default_value: '[]'
      description: |
        Comma separated list of conditions to fail the action step if worse, options are: vulnerability, policy
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: format
      value_type: string
      default_value: text
      description: |-
        Output format of the generated vulnerability report:
        - text: default output, plain text with or without colors depending on the terminal
        - markdown: Markdown output
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: hide-policies
      value_type: bool
      default_value: "false"
      description: Hide policy status from the output
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: ignore-base
      value_type: bool
      default_value: "false"
      description: Filter out CVEs introduced from base image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: ignore-unchanged
      value_type: bool
      default_value: "false"
      description: Filter out unchanged packages
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: multi-stage
      value_type: bool
      default_value: "false"
      description: Show packages from multi-stage Docker builds
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-fixed
      value_type: bool
      default_value: "false"
      description: Filter to fixable CVEs
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-package-type
      value_type: stringSlice
      default_value: '[]'
      description: |
        Comma separated list of package types (like apk, deb, rpm, npm, pypi, golang, etc)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-severity
      value_type: stringSlice
      default_value: '[]'
      description: |
        Comma separated list of severities (critical, high, medium, low, unspecified) to filter CVEs by
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-stage
      value_type: stringSlice
      default_value: '[]'
      description: Comma separated list of multi-stage Docker build stage names
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-unfixed
      value_type: bool
      default_value: "false"
      description: Filter to unfixed CVEs
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
    - option: to
      value_type: string
      description: Image, directory, or archive to compare to
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: to-env
      value_type: string
      description: Name of environment to compare to
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: to-latest
      value_type: bool
      default_value: "false"
      description: Latest image processed to compare to
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: to-ref
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
    - option: to-stream
      value_type: string
      description: Name of stream to compare to
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
    ### Compare the most recently built image to the latest tag
@y
    - `image://` (default) use a local image, or fall back to a registry lookup
    - `local://` use an image from the local image store (don't do a registry lookup)
    - `registry://` use an image from a registry (don't use a local image)
    - `oci-dir://` use an OCI layout directory
    - `archive://` use a tarball archive, as created by `docker save`
    - `fs://` use a local directory or file
usage: docker scout compare --to IMAGE|DIRECTORY|ARCHIVE [IMAGE|DIRECTORY|ARCHIVE]
pname: docker scout
plink: docker_scout.yaml
options:
    - option: exit-code
      shorthand: e
      value_type: bool
      default_value: "false"
      description: Return exit code '2' if vulnerability changes are detected
      deprecated: true
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: exit-on
      shorthand: x
      value_type: stringSlice
      default_value: '[]'
      description: |
        Comma separated list of conditions to fail the action step if worse, options are: vulnerability, policy
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: format
      value_type: string
      default_value: text
      description: |-
        Output format of the generated vulnerability report:
        - text: default output, plain text with or without colors depending on the terminal
        - markdown: Markdown output
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: hide-policies
      value_type: bool
      default_value: "false"
      description: Hide policy status from the output
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: ignore-base
      value_type: bool
      default_value: "false"
      description: Filter out CVEs introduced from base image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: ignore-unchanged
      value_type: bool
      default_value: "false"
      description: Filter out unchanged packages
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: multi-stage
      value_type: bool
      default_value: "false"
      description: Show packages from multi-stage Docker builds
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-fixed
      value_type: bool
      default_value: "false"
      description: Filter to fixable CVEs
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-package-type
      value_type: stringSlice
      default_value: '[]'
      description: |
        Comma separated list of package types (like apk, deb, rpm, npm, pypi, golang, etc)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-severity
      value_type: stringSlice
      default_value: '[]'
      description: |
        Comma separated list of severities (critical, high, medium, low, unspecified) to filter CVEs by
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-stage
      value_type: stringSlice
      default_value: '[]'
      description: Comma separated list of multi-stage Docker build stage names
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: only-unfixed
      value_type: bool
      default_value: "false"
      description: Filter to unfixed CVEs
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
    - option: to
      value_type: string
      description: Image, directory, or archive to compare to
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: to-env
      value_type: string
      description: Name of environment to compare to
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: to-latest
      value_type: bool
      default_value: "false"
      description: Latest image processed to compare to
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: to-ref
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
    - option: to-stream
      value_type: string
      description: Name of stream to compare to
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
    ### Compare the most recently built image to the latest tag
@z

@x
    ```console
    $ docker scout compare --to namespace/repo:latest
    ```
@y
    ```console
    $ docker scout compare --to namespace/repo:latest
    ```
@z

@x
    ### Compare local build to the same tag from the registry
@y
    ### Compare local build to the same tag from the registry
@z

@x
    ```console
    $ docker scout compare local://namespace/repo:latest --to registry://namespace/repo:latest
    ```
@y
    ```console
    $ docker scout compare local://namespace/repo:latest --to registry://namespace/repo:latest
    ```
@z

@x
    ### Ignore base images
@y
    ### Ignore base images
@z

@x
    ```console
    $ docker scout compare --ignore-base --to namespace/repo:latest namespace/repo:v1.2.3-pre
    ```
@y
    ```console
    $ docker scout compare --ignore-base --to namespace/repo:latest namespace/repo:v1.2.3-pre
    ```
@z

@x
    ### Generate a markdown output
@y
    ### Generate a markdown output
@z

@x
    ```console
    $ docker scout compare --format markdown --to namespace/repo:latest namespace/repo:v1.2.3-pre
    ```
@y
    ```console
    $ docker scout compare --format markdown --to namespace/repo:latest namespace/repo:v1.2.3-pre
    ```
@z

@x
    ### Only compare maven packages and only display critical vulnerabilities for maven packages
@y
    ### Only compare maven packages and only display critical vulnerabilities for maven packages
@z

@x
    ```console
    $ docker scout compare --only-package-type maven --only-severity critical --to namespace/repo:latest namespace/repo:v1.2.3-pre
    ```
@y
    ```console
    $ docker scout compare --only-package-type maven --only-severity critical --to namespace/repo:latest namespace/repo:v1.2.3-pre
    ```
@z

@x
    ### Show all policy results for both images
@y
    ### Show all policy results for both images
@z

@x
    ```console
    docker scout compare --to namespace/repo:latest namespace/repo:v1.2.3-pre
    ```
deprecated: false
experimental: false
experimentalcli: true
kubernetes: false
swarm: false
@y
    ```console
    docker scout compare --to namespace/repo:latest namespace/repo:v1.2.3-pre
    ```
deprecated: false
experimental: false
experimentalcli: true
kubernetes: false
swarm: false
@z
