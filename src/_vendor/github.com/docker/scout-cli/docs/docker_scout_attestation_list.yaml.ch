%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker scout attestation list
aliases: docker scout attestation list, docker scout attest list
short: List attestations for image
long: The docker scout attestation list command lists attestations for images.
usage: docker scout attestation list OPTIONS IMAGE
@y
command: docker scout attestation list
aliases: docker scout attestation list, docker scout attest list
short: List attestations for image
long: The docker scout attestation list command lists attestations for images.
usage: docker scout attestation list OPTIONS IMAGE
@z

% options:

@x format
      description: |-
        Output format:
        - list: list of attestations of the image
        - json: json representation of the attestation list (default "json")
@y
      description: |-
        Output format:
        - list: list of attestations of the image
        - json: json representation of the attestation list (default "json")
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

@x predicate-type
      description: Predicate-type for attestations
@y
      description: Predicate-type for attestations
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

% snip directives...
