%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker buildx history ls
short: List build records
long: |-
    List completed builds recorded by the active builder. Each entry includes the
    build ID, name, status, timestamp, and duration.

    By default, only records for the current builder are shown. You can filter
    results using flags.
usage: docker buildx history ls [OPTIONS]
@y
command: docker buildx history ls
short: List build records
long: |-
    List completed builds recorded by the active builder. Each entry includes the
    build ID, name, status, timestamp, and duration.

    By default, only records for the current builder are shown. You can filter
    results using flags.
usage: docker buildx history ls [OPTIONS]
@z

% options:

@x format
      description: Format the output
@y
      description: Format the output
@z

@x no-trunc
      description: Don't truncate output
@y
      description: Don't truncate output
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

% snip directives...
