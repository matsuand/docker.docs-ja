%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker buildx use
short: Set the current builder instance
long: |-
    Switches the current builder instance. Build commands invoked after this command
    will run on a specified builder. Alternatively, a context name can be used to
    switch to the default builder of that context.
usage: docker buildx use [OPTIONS] NAME
@y
command: docker buildx use
short: Set the current builder instance
long: |-
    Switches the current builder instance. Build commands invoked after this command
    will run on a specified builder. Alternatively, a context name can be used to
    switch to the default builder of that context.
usage: docker buildx use [OPTIONS] NAME
@z

% options:

@x default
      description: Set builder as default for current context
@y
      description: Set builder as default for current context
@z

@x global
      description: Builder persists context changes
@y
      description: Builder persists context changes
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
