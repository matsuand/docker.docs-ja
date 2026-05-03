%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker sandbox create opencode
short: Create a sandbox for opencode
@y
command: docker sandbox create opencode
short: Create a sandbox for opencode
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
    Create a sandbox with access to a host workspace for opencode.

    The workspace path is required and will be exposed inside the sandbox at the same path as on the host.
    Additional workspaces can be provided as extra arguments. Append ":ro" to mount them read-only.

    Use 'docker sandbox run SANDBOX' to start opencode after creation.
@y
    Create a sandbox with access to a host workspace for opencode.

    The workspace path is required and will be exposed inside the sandbox at the same path as on the host.
    Additional workspaces can be provided as extra arguments. Append ":ro" to mount them read-only.

    Use 'docker sandbox run SANDBOX' to start opencode after creation.
@z

@x
usage: docker sandbox create opencode WORKSPACE [EXTRA_WORKSPACE...]
@y
usage: docker sandbox create opencode WORKSPACE [EXTRA_WORKSPACE...]
@z

%inherited_options:

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
    ### Create an OpenCode sandbox in the current directory
@y
examples: |-
    ### Create an OpenCode sandbox in the current directory
@z

% snip command...

@x
    ### Create with an absolute path
@y
    ### Create with an absolute path
@z

% snip command...

@x
    ### Create and then run
@y
    ### Create and then run
@z

% snip command...
% snip directives...
