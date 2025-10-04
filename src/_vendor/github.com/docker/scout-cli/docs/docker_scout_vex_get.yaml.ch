%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker scout vex get
short: Get VEX attestation for image
long: The docker scout vex get command gets a VEX attestation for images.
usage: docker scout vex get OPTIONS IMAGE
@y
command: docker scout vex get
short: Get VEX attestation for image
long: The docker scout vex get command gets a VEX attestation for images.
usage: docker scout vex get OPTIONS IMAGE
@z

% options:

@x key
      description: Signature key to use for verification
@y
      description: Signature key to use for verification
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

@x skip-tlog
      description: Skip signature verification against public transaction log
@y
      description: Skip signature verification against public transaction log
@z

@x verify
      description: Verify the signature on the attestation
@y
      description: Verify the signature on the attestation
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
