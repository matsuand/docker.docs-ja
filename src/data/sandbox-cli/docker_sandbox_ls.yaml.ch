%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker sandbox ls
aliases: docker sandbox ls, docker sandbox list
short: List sandboxes
@y
command: docker sandbox ls
aliases: docker sandbox ls, docker sandbox list
short: List sandboxes
@z

@x
long: |-
    List all sandboxes.

    This command lists all sandboxes using the Docker API.
@y
long: |-
    List all sandboxes.

    This command lists all sandboxes using the Docker API.
@z

@x
usage: docker sandbox ls
@y
usage: docker sandbox ls
@z

% options:

@x no-trunc
      description: Don't truncate output
@y
      description: Don't truncate output
@z

@x quiet
      description: Only display sandbox IDs
@y
      description: Only display sandbox IDs
@z

% inherited_options:

@x debug
      description: Enable debug logging
@y
      description: Enable debug logging
@z

@x
examples: |-
    ### List all sandboxes
@y
examples: |-
    ### List all sandboxes
@z

% snip command...

@x
    ### Show only sandbox IDs (--quiet) {#quiet}
@y
    ### Show only sandbox IDs (--quiet) {#quiet}
@z

% snip text...

@x
    Output only sandbox IDs:
@y
    Output only sandbox IDs:
@z

% snip command...

@x
    ### Don't truncate output (--no-trunc) {#no-trunc}
@y
    ### Don't truncate output (--no-trunc) {#no-trunc}
@z

% snip text...

@x
    By default, long sandbox IDs and workspace paths are truncated for readability. Use `--no-trunc` to display the full values:
@y
    By default, long sandbox IDs and workspace paths are truncated for readability. Use `--no-trunc` to display the full values:
@z

% snip command...
% snip directives...
