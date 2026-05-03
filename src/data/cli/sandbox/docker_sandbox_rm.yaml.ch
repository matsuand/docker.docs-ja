%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker sandbox rm
aliases: docker sandbox rm, docker sandbox remove
short: Remove one or more sandboxes
@y
command: docker sandbox rm
aliases: docker sandbox rm, docker sandbox remove
short: Remove one or more sandboxes
@z

@x
long: |-
    > [!WARNING]
    > The Docker Desktop-integrated `docker sandbox` commands are deprecated and
    > replaced by the standalone [`sbx` CLI](/manuals/ai/sandboxes/_index.md).
    > This deprecation applies only to the Docker Desktop integration, not to Docker
    > Sandboxes.
@y
long: |-
    > [!WARNING]
    > The Docker Desktop-integrated `docker sandbox` commands are deprecated and
    > replaced by the standalone [`sbx` CLI](/manuals/ai/sandboxes/_index.md).
    > This deprecation applies only to the Docker Desktop integration, not to Docker
    > Sandboxes.
@z

@x
    Remove one or more sandboxes and all their associated resources.

    This command will:
    - Check if the sandbox exists
    - Remove the sandbox and clean up its associated resources
@y
    Remove one or more sandboxes and all their associated resources.

    This command will:
    - Check if the sandbox exists
    - Remove the sandbox and clean up its associated resources
@z

@x
usage: docker sandbox rm SANDBOX [SANDBOX...]
@y
usage: docker sandbox rm SANDBOX [SANDBOX...]
@z

% inherited_options:

@x debug
      description: Enable debug logging
@y
      description: Enable debug logging
@z

@x socket
      description: |
        Connect to daemon at specific socket path (for development/debugging)
@y
      description: |
        Connect to daemon at specific socket path (for development/debugging)
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
