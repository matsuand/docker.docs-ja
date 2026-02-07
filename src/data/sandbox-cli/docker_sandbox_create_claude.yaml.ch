%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker sandbox create claude
short: Create a sandbox for claude
long: |-
    Create a sandbox with access to a host workspace for claude.

    The workspace path is required and will be exposed inside the sandbox at the same path as on the host.

    Use 'docker sandbox run SANDBOX' to start claude after creation.
@y
command: docker sandbox create claude
short: Create a sandbox for claude
long: |-
    Create a sandbox with access to a host workspace for claude.

    The workspace path is required and will be exposed inside the sandbox at the same path as on the host.

    Use 'docker sandbox run SANDBOX' to start claude after creation.
@z

@x
usage: docker sandbox create claude WORKSPACE
@y
usage: docker sandbox create claude WORKSPACE
@z

% pname
% plink
% options:

@x patch-settings
      description: Intercept claude settings API call and patch payload
@y
      description: Intercept claude settings API call and patch payload
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
    ### Create a Claude sandbox in the current directory
@y
examples: |-
    ### Create a Claude sandbox in the current directory
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
