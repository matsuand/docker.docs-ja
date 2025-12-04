%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker compose publish
short: Publish compose application
long: Publish compose application
usage: docker compose publish [OPTIONS] REPOSITORY[:TAG]
@y
command: docker compose publish
short: Publish compose application
long: Publish compose application
usage: docker compose publish [OPTIONS] REPOSITORY[:TAG]
@z

% options:

@x app
      description: Published compose application (includes referenced images)
@y
      description: Published compose application (includes referenced images)
@z

@x oci-version
      description: |
        OCI image/artifact specification version (automatically determined by default)
@y
      description: |
        OCI image/artifact specification version (automatically determined by default)
@z

@x resolve-image-digests
      description: Pin image tags to digests
@y
      description: Pin image tags to digests
@z

@x with-env
      description: Include environment variables in the published OCI artifact
@y
      description: Include environment variables in the published OCI artifact
@z

@x "yes"
      description: Assume "yes" as answer to all prompts
@y
      description: Assume "yes" as answer to all prompts
@z

% inherited_options:

@x dry-run
      description: Execute command in dry run mode
@y
      description: Execute command in dry run mode
@z

% snip directives...
