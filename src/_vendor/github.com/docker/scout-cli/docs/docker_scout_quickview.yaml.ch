%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

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
    - `sbom://` SPDX file or in-toto attestation file with SPDX predicate or `syft` json SBOM file
        In case of `sbom://` prefix, if the file is not defined then it will try to read it from the standard input.
@y
    - `image://` (default) use a local image, or fall back to a registry lookup
    - `local://` use an image from the local image store (don't do a registry lookup)
    - `registry://` use an image from a registry (don't use a local image)
    - `oci-dir://` use an OCI layout directory
    - `archive://` use a tarball archive, as created by `docker save`
    - `fs://` use a local directory or file
    - `sbom://` SPDX file or in-toto attestation file with SPDX predicate or `syft` json SBOM file
        In case of `sbom://` prefix, if the file is not defined then it will try to read it from the standard input.
@z

@x
usage: docker scout quickview [IMAGE|DIRECTORY|ARCHIVE]
@y
usage: docker scout quickview [IMAGE|DIRECTORY|ARCHIVE]
@z

% options:

@x env
      description: Name of the environment
@y
      description: Name of the environment
@z

@x latest
      description: Latest indexed image
@y
      description: Latest indexed image
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

@x stream
      description: Name of stream
@y
      description: Name of stream
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
    ### Quick overview of an image
@y
examples: |-
    ### Quick overview of an image
@z

% snip command...

@x
    ### Quick overview of the most recently built image
@y
    ### Quick overview of the most recently built image
@z

% snip command...

@x
    ### Quick overview from an SPDX file
@y
    ### Quick overview from an SPDX file
@z

% snip command...
% snip directives...
