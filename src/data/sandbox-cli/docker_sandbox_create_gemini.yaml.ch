%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker sandbox create gemini
short: Create a sandbox for gemini
long: |-
    Create a sandbox with access to a host workspace for gemini.

    The workspace path is required and will be exposed inside the sandbox at the same path as on the host.

    Use 'docker sandbox run SANDBOX' to start gemini after creation.
@y
command: docker sandbox create gemini
short: Create a sandbox for gemini
long: |-
    Create a sandbox with access to a host workspace for gemini.

    The workspace path is required and will be exposed inside the sandbox at the same path as on the host.

    Use 'docker sandbox run SANDBOX' to start gemini after creation.
@z

@x
usage: docker sandbox create gemini WORKSPACE
@y
usage: docker sandbox create gemini WORKSPACE
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
    ### Create a Gemini sandbox in the current directory
@y
examples: |-
    ### Create a Gemini sandbox in the current directory
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
