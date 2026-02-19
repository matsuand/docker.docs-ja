%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker sandbox create kiro
short: Create a sandbox for kiro
long: |-
    Create a sandbox with access to a host workspace for kiro.

    The workspace path is required and will be exposed inside the sandbox at the same path as on the host.
    Additional workspaces can be provided as extra arguments. Append ":ro" to mount them read-only.

    Use 'docker sandbox run SANDBOX' to start kiro after creation.
@y
command: docker sandbox create kiro
short: Create a sandbox for kiro
long: |-
    Create a sandbox with access to a host workspace for kiro.

    The workspace path is required and will be exposed inside the sandbox at the same path as on the host.
    Additional workspaces can be provided as extra arguments. Append ":ro" to mount them read-only.

    Use 'docker sandbox run SANDBOX' to start kiro after creation.
@z

@x
usage: docker sandbox create kiro WORKSPACE [EXTRA_WORKSPACE...]
@y
usage: docker sandbox create kiro WORKSPACE [EXTRA_WORKSPACE...]
@z

% pname
% plink
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
    ### Create a Kiro sandbox in the current directory
@y
examples: |-
    ### Create a Kiro sandbox in the current directory
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
