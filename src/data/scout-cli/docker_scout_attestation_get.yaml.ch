%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker scout attestation get
aliases: docker scout attestation get, docker scout attest get
short: Get attestation for image
long: The docker scout attestation get command gets attestations for images.
usage: docker scout attestation get OPTIONS IMAGE [DIGEST]
@y
command: docker scout attestation get
aliases: docker scout attestation get, docker scout attest get
short: Get attestation for image
long: The docker scout attestation get command gets attestations for images.
usage: docker scout attestation get OPTIONS IMAGE [DIGEST]
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

@x predicate
      description: Get in-toto predicate only dropping the subject
@y
      description: Get in-toto predicate only dropping the subject
@z

@x predicate-type
      description: Predicate-type for attestation
@y
      description: Predicate-type for attestation
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
