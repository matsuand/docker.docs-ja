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
@y
    - `image://` (default) use a local image, or fall back to a registry lookup
    - `local://` use an image from the local image store (don't do a registry lookup)
    - `registry://` use an image from a registry (don't use a local image)
    - `oci-dir://` use an OCI layout directory
    - `archive://` use a tarball archive, as created by `docker save`
    - `fs://` use a local directory or file
@z

@x
usage: docker scout compare --to IMAGE|DIRECTORY|ARCHIVE [IMAGE|DIRECTORY|ARCHIVE]
pname: docker scout
plink: docker_scout.yaml
@y
usage: docker scout compare --to IMAGE|DIRECTORY|ARCHIVE [IMAGE|DIRECTORY|ARCHIVE]
pname: docker scout
plink: docker_scout.yaml
@z

% options:

@x exit-code
      description: Return exit code '2' if vulnerability changes are detected
@y
      description: Return exit code '2' if vulnerability changes are detected
@z

@x exit-on
      description: |
        Comma separated list of conditions to fail the action step if worse or changed, options are: vulnerability, policy, package
@y
      description: |
        Comma separated list of conditions to fail the action step if worse or changed, options are: vulnerability, policy, package
@z

@x format
      description: |-
        Output format of the generated vulnerability report:
        - text: default output, plain text with or without colors depending on the terminal
        - markdown: Markdown output
@y
      description: |-
        Output format of the generated vulnerability report:
        - text: default output, plain text with or without colors depending on the terminal
        - markdown: Markdown output
@z

@x hide-policies
      description: Hide policy status from the output
@y
      description: Hide policy status from the output
@z

@x ignore-base
      description: Filter out CVEs introduced from base image
@y
      description: Filter out CVEs introduced from base image
@z

@x ignore-suppressed
      description: |
        Filter CVEs found in Scout exceptions based on the specified exception scope
@y
      description: |
        Filter CVEs found in Scout exceptions based on the specified exception scope
@z

@x ignore-unchanged
      description: Filter out unchanged packages
@y
      description: Filter out unchanged packages
@z

@x multi-stage
      description: Show packages from multi-stage Docker builds
@y
      description: Show packages from multi-stage Docker builds
@z

@x only-fixed
      description: Filter to fixable CVEs
@y
      description: Filter to fixable CVEs
@z

@x only-package-type
      description: |
        Comma separated list of package types (like apk, deb, rpm, npm, pypi, golang, etc)
@y
      description: |
        Comma separated list of package types (like apk, deb, rpm, npm, pypi, golang, etc)
@z

@x only-severity
      description: |
        Comma separated list of severities (critical, high, medium, low, unspecified) to filter CVEs by
@y
      description: |
        Comma separated list of severities (critical, high, medium, low, unspecified) to filter CVEs by
@z

@x only-stage
      description: Comma separated list of multi-stage Docker build stage names
@y
      description: Comma separated list of multi-stage Docker build stage names
@z

@x only-unfixed
      description: Filter to unfixed CVEs
@y
      description: Filter to unfixed CVEs
@z

@x only-vex-affected
      description: Filter CVEs by VEX statements with status not affected
@y
      description: Filter CVEs by VEX statements with status not affected
@z

@x org
      description: Namespace of the Docker organization
@y
      description: Namespace of the Docker organization
@z

@x output
      description: Write the report to a file
@y
      description: Write the report to a file
@z

@x platform
      description: Platform of image to analyze
@y
      description: Platform of image to analyze
@z

@x ref
      description: |-
        Reference to use if the provided tarball contains multiple references.
        Can only be used with archive
@y
      description: |-
        Reference to use if the provided tarball contains multiple references.
        Can only be used with archive
@z

@x to
      description: Image, directory, or archive to compare to
@y
      description: Image, directory, or archive to compare to
@z

@x to-env
      description: Name of environment to compare to
@y
      description: Name of environment to compare to
@z

@x to-latest
      description: Latest image processed to compare to
@y
      description: Latest image processed to compare to
@z

@x to-ref
      description: |-
        Reference to use if the provided tarball contains multiple references.
        Can only be used with archive.
@y
      description: |-
        Reference to use if the provided tarball contains multiple references.
        Can only be used with archive.
@z

@x to-stream
      description: Name of stream to compare to
@y
      description: Name of stream to compare to
@z

@x vex
      description: Apply VEX statements to filter CVEs
@y
      description: Apply VEX statements to filter CVEs
@z

@x  vex-author
      description: List of VEX statement authors to accept
@y
      description: List of VEX statement authors to accept
@z

@x vex-location
      description: File location of directory or file containing VEX statements
@y
      description: File location of directory or file containing VEX statements
@z

% inherited_options:

@x debug
      description: Debug messages
@y
      description: Debug messages
@z

@x verbose-debug
      description: Verbose debug
@y
      description: Verbose debug
@z

@x
examples: |-
    ### Compare the most recently built image to the latest tag
@y
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
