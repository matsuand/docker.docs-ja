%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker buildx history rm
short: Remove build records
long: |-
    Remove one or more build records from the current builder’s history. You can
    remove specific builds by ID or offset, or delete all records at once using
    the `--all` flag.
usage: docker buildx history rm [OPTIONS] [REF...]
@y
command: docker buildx history rm
short: Remove build records
long: |-
    Remove one or more build records from the current builder’s history. You can
    remove specific builds by ID or offset, or delete all records at once using
    the `--all` flag.
usage: docker buildx history rm [OPTIONS] [REF...]
@z

% options:

@x all
      description: Remove all build records
@y
      description: Remove all build records
@z

% inherited_options:

@x builder
      description: Override the configured builder instance
@y
      description: Override the configured builder instance
@z

@x debug
      description: Enable debug logging
@y
      description: Enable debug logging
@z

@x
examples: |-
    ### Remove a specific build
@y
examples: |-
    ### Remove a specific build
@z

@x within command
    # Using a build ID
@y
    # Using a build ID
@z
@x
    # Or using a relative offset
@y
    # Or using a relative offset
@z

@x
    ### Remove multiple builds
@y
    ### Remove multiple builds
@z

@x within command
    # Using build IDs
@y
    # Using build IDs
@z
@x
    # Or using relative offsets
@y
    # Or using relative offsets
@z

@x
    ### Remove all build records from the current builder (--all) {#all}
@y
    ### Remove all build records from the current builder (--all) {#all}
@z

% snip command...
% snip directives...
