%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

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
@y
    - `image://` (default) use a local image, or fall back to a registry lookup
    - `local://` use an image from the local image store (don't do a registry lookup)
    - `registry://` use an image from a registry (don't use a local image)
    - `oci-dir://` use an OCI layout directory
    - `archive://` use a tarball archive, as created by `docker save`
    - `fs://` use a local directory or file
@z

@x
usage: docker scout sbom [IMAGE|DIRECTORY|ARCHIVE]
@y
usage: docker scout sbom [IMAGE|DIRECTORY|ARCHIVE]
@z

% options:

@x format
      description: |-
        Output format:
        - list: list of packages of the image
        - json: json representation of the SBOM
        - spdx: spdx representation of the SBOM
        - cyclonedx: cyclone dx representation of the SBOM
@y
      description: |-
        Output format:
        - list: list of packages of the image
        - json: json representation of the SBOM
        - spdx: spdx representation of the SBOM
        - cyclonedx: cyclone dx representation of the SBOM
@z

@x only-package-type
      description: |-
        Comma separated list of package types (like apk, deb, rpm, npm, pypi, golang, etc)
        Can only be used with --format list
@y
      description: |-
        Comma separated list of package types (like apk, deb, rpm, npm, pypi, golang, etc)
        Can only be used with --format list
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
    ### Display the list of packages
@y
examples: |-
    ### Display the list of packages
@z

% snip command...

@x
    ### Only display packages of a specific type
@y
    ### Only display packages of a specific type
@z

% snip command...

@x
    ### Display the full SBOM in JSON format
@y
    ### Display the full SBOM in JSON format
@z

% snip command...

@x
    ### Display the full SBOM of the most recently built image
@y
    ### Display the full SBOM of the most recently built image
@z

% snip command...

@x
    ### Write SBOM to a file
@y
    ### Write SBOM to a file
@z

% snip command...
% snip directives...
