%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker buildx history logs
short: Print the logs of a build record
long: |-
    Print the logs for a completed build. The output appears in the same format as
    `--progress=plain`, showing the full logs for each step.
@y
command: docker buildx history logs
short: Print the logs of a build record
long: |-
    Print the logs for a completed build. The output appears in the same format as
    `--progress=plain`, showing the full logs for each step.
@z

@x
    By default, this shows logs for the most recent build on the current builder.
@y
    By default, this shows logs for the most recent build on the current builder.
@z

@x
    You can also specify an earlier build using an offset. For example:
@y
    You can also specify an earlier build using an offset. For example:
@z

@x
    - `^1` shows logs for the build before the most recent
    - `^2` shows logs for the build two steps back
@y
    - `^1` shows logs for the build before the most recent
    - `^2` shows logs for the build two steps back
@z

@x
usage: docker buildx history logs [OPTIONS] [REF]
@y
usage: docker buildx history logs [OPTIONS] [REF]
@z

% options:

@x progress
      description: Set type of progress output (plain, rawjson, tty)
@y
      description: Set type of progress output (plain, rawjson, tty)
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
    ### Print logs for the most recent build
@y
examples: |-
    ### Print logs for the most recent build
@z

% snip command...

@x
    By default, this shows logs for the most recent build on the current builder.
@y
    By default, this shows logs for the most recent build on the current builder.
@z

@x
    ### Print logs for a specific build
@y
    ### Print logs for a specific build
@z

@x
    To print logs for a specific build, use a build ID or offset:
@y
    To print logs for a specific build, use a build ID or offset:
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
    ### Set type of progress output (--progress) {#progress}
@y
    ### Set type of progress output (--progress) {#progress}
@z

% snip command...
% snip directives...
