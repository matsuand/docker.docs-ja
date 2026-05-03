%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker sandbox ls
aliases: docker sandbox ls, docker sandbox list
short: List VMs
@y
command: docker sandbox ls
aliases: docker sandbox ls, docker sandbox list
short: List VMs
@z

@x
long: |-
    > [!WARNING]
    > The Docker Desktop-integrated `docker sandbox` commands are deprecated and
    > replaced by the standalone [`sbx` CLI](/manuals/ai/sandboxes/_index.md).
    > This deprecation applies only to the Docker Desktop integration, not to Docker
    > Sandboxes.

    List all VMs managed by sandboxd with their sandboxes
@y
long: |-
    > [!WARNING]
    > The Docker Desktop-integrated `docker sandbox` commands are deprecated and
    > replaced by the standalone [`sbx` CLI](/manuals/ai/sandboxes/_index.md).
    > This deprecation applies only to the Docker Desktop integration, not to Docker
    > Sandboxes.

    List all VMs managed by sandboxd with their sandboxes
@z

@x
usage: docker sandbox ls [OPTIONS]
@y
usage: docker sandbox ls [OPTIONS]
@z

% options:

@x json
      description: Output in JSON format
@y
      description: Output in JSON format
@z

@x quiet
      description: Only display VM names
@y
      description: Only display VM names
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
    ### List all VMs
@y
examples: |-
    ### List all VMs
@z

% snip command...

@x
    ### Show only VM names (--quiet) {#quiet}
@y
    ### Show only VM names (--quiet) {#quiet}
@z

% snip text...

@x
    Output only VM names:
@y
    Output only VM names:
@z

% snip command...

@x
    ### JSON output (--json)
@y
    ### JSON output (--json)
@z

% snip text...

@x
    Output detailed VM information in JSON format:
@y
    Output detailed VM information in JSON format:
@z

% snip command...
% snip directives...
