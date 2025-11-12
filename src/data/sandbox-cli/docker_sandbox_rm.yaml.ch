%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker sandbox rm
short: Remove one or more sandboxes
@y
command: docker sandbox rm
short: Remove one or more sandboxes
@z

@x
long: |-
    Remove one or more sandboxes by their IDs or names.

    This command removes the specified sandboxes. Each sandbox is identified by its unique ID or name.
@y
long: |-
    Remove one or more sandboxes by their IDs or names.

    This command removes the specified sandboxes. Each sandbox is identified by its unique ID or name.
@z

@x
usage: docker sandbox rm [OPTIONS] SANDBOX [SANDBOX...]
@y
usage: docker sandbox rm [OPTIONS] SANDBOX [SANDBOX...]
@z

% inherited_options:

@x debug
      description: Enable debug logging
@y
      description: Enable debug logging
@z

@x
examples: |-
    ### Remove a sandbox
@y
examples: |-
    ### Remove a sandbox
@z

% snip command...

@x
    ### Remove multiple sandboxes
@y
    ### Remove multiple sandboxes
@z

% snip command...

@x
    ### Remove all sandboxes
@y
    ### Remove all sandboxes
@z

% snip command...
% snip directives...
