%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker buildx stop
short: Stop builder instance
long: |-
    Stops the specified or current builder. This does not prevent buildx build to
    restart the builder. The implementation of stop depends on the driver.
usage: docker buildx stop [NAME]
@y
command: docker buildx stop
short: Stop builder instance
long: |-
    Stops the specified or current builder. This does not prevent buildx build to
    restart the builder. The implementation of stop depends on the driver.
usage: docker buildx stop [NAME]
@z

% inherited_options:

@x builder
      description: Override the configured builder instance
@y
      description: Override the configured builder instance
@z

@x
examples: |-
    ### Override the configured builder instance (--builder) {#builder}

    Same as [`buildx --builder`](/reference/cli/docker/buildx/#builder).
@y
examples: |-
    ### Override the configured builder instance (--builder) {#builder}

    Same as [`buildx --builder`](__SUBDIR__/reference/cli/docker/buildx/#builder).
@z

% snip directives...
