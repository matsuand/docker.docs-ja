%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker sandbox create copilot
short: Create a sandbox for copilot
long: |-
    Create a sandbox with access to a host workspace for copilot.

    The workspace path is required and will be exposed inside the sandbox at the same path as on the host.
    Additional workspaces can be provided as extra arguments. Append ":ro" to mount them read-only.

    Use 'docker sandbox run SANDBOX' to start copilot after creation.
@y
command: docker sandbox create copilot
short: Create a sandbox for copilot
long: |-
    Create a sandbox with access to a host workspace for copilot.

    The workspace path is required and will be exposed inside the sandbox at the same path as on the host.
    Additional workspaces can be provided as extra arguments. Append ":ro" to mount them read-only.

    Use 'docker sandbox run SANDBOX' to start copilot after creation.
@z

@x
usage: docker sandbox create copilot WORKSPACE [EXTRA_WORKSPACE...]
@y
usage: docker sandbox create copilot WORKSPACE [EXTRA_WORKSPACE...]
@z

% pname
% plink
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

% snip directives...
