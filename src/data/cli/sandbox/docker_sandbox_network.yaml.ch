%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker sandbox network
short: Manage sandbox networking
@y
command: docker sandbox network
short: Manage sandbox networking
@z

@x
long: |-
    > [!WARNING]
    > The Docker Desktop-integrated `docker sandbox` commands are deprecated and
    > replaced by the standalone [`sbx` CLI](/manuals/ai/sandboxes/_index.md).
    > This deprecation applies only to the Docker Desktop integration, not to Docker
    > Sandboxes.

    Manage sandbox networking
@y
long: |-
    > [!WARNING]
    > The Docker Desktop-integrated `docker sandbox` commands are deprecated and
    > replaced by the standalone [`sbx` CLI](manuals/ai/sandboxes/_index.md).
    > This deprecation applies only to the Docker Desktop integration, not to Docker
    > Sandboxes.

    Manage sandbox networking
@z

@x
usage: docker sandbox network
@y
usage: docker sandbox network
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
    ### View network logs
@y
examples: |-
    ### View network logs
@z

% snip command...

@x
    ### Configure proxy for a sandbox
@y
    ### Configure proxy for a sandbox
@z

% snip command...

@x
    See the subcommands for more details:
    - [`docker sandbox network log`](/reference/cli/docker/sandbox/network/log/) - Show network logs
    - [`docker sandbox network proxy`](/reference/cli/docker/sandbox/network/proxy/) - Manage proxy configuration
@y
    See the subcommands for more details:
    - [`docker sandbox network log`](/reference/cli/docker/sandbox/network/log/) - Show network logs
    - [`docker sandbox network proxy`](/reference/cli/docker/sandbox/network/proxy/) - Manage proxy configuration
@z

% snip directives...
