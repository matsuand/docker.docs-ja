%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker sandbox stop
short: Stop one or more sandboxes without removing them
@y
command: docker sandbox stop
short: Stop one or more sandboxes without removing them
@z

@x
long: |
    > [!WARNING]
    > The Docker Desktop-integrated `docker sandbox` commands are deprecated and
    > replaced by the standalone [`sbx` CLI](/manuals/ai/sandboxes/_index.md).
    > This deprecation applies only to the Docker Desktop integration, not to Docker
    > Sandboxes.
@y
long: |
    > [!WARNING]
    > The Docker Desktop-integrated `docker sandbox` commands are deprecated and
    > replaced by the standalone [`sbx` CLI](/manuals/ai/sandboxes/_index.md).
    > This deprecation applies only to the Docker Desktop integration, not to Docker
    > Sandboxes.
@z

@x
    Stop one or more sandboxes without removing them. The sandboxes can be restarted later.
@y
    Stop one or more sandboxes without removing them. The sandboxes can be restarted later.
@z

@x
usage: docker sandbox stop SANDBOX [SANDBOX...]
@y
usage: docker sandbox stop SANDBOX [SANDBOX...]
@z

% inherited_options

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
    ### Stop a sandbox
@y
examples: |-
    ### Stop a sandbox
@z

% snip command...

@x
    ### Stop multiple sandboxes
@y
    ### Stop multiple sandboxes
@z

% snip command...

@x
    ### Stop all running sandboxes
@y
    ### Stop all running sandboxes
@z

% snip command...
% snip directives...
