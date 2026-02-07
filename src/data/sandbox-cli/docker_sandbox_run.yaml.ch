%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker sandbox run
short: Run an agent in a sandbox
long: |-
    Run an agent in a sandbox. Create the sandbox if it does not exist.

    Pass agent arguments after the "--" separator.
@y
command: docker sandbox run
short: Run an agent in a sandbox
long: |-
    Run an agent in a sandbox. Create the sandbox if it does not exist.

    Pass agent arguments after the "--" separator.
@z

@x
usage: docker sandbox run SANDBOX [-- AGENT_ARGS...] | AGENT WORKSPACE [-- AGENT_ARGS...]
@y
usage: docker sandbox run SANDBOX [-- AGENT_ARGS...] | AGENT WORKSPACE [-- AGENT_ARGS...]
@z

% pname
% plink
% options

@x detached
      description: Return sandbox ID without running agent (hidden, for testing)
@y
      description: Return sandbox ID without running agent (hidden, for testing)
@z

@x load-local-template
      description: Load a locally built template image into the sandbox
@y
      description: Load a locally built template image into the sandbox
@z

@x name
      description: 'Name for the sandbox (default: <agent>-<workdir>)'
@y
      description: 'Name for the sandbox (default: <agent>-<workdir>)'
@z

@x template
      description: |
        Container image to use for the sandbox (default: agent-specific image)
@y
      description: |
        Container image to use for the sandbox (default: agent-specific image)
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
    ### Create and run Claude in the current directory
@y
examples: |-
    ### Create and run Claude in the current directory
@z

% snip command...

@x
    ### Run an existing sandbox
@y
    ### Run an existing sandbox
@z

% snip command...

@x
    ### Create and run with a specific workspace
@y
    ### Create and run with a specific workspace
@z

% snip command...

@x
    The workspace directory is mounted at the same absolute path inside the sandbox.
@y
    The workspace directory is mounted at the same absolute path inside the sandbox.
@z

@x
    ### Name the sandbox (--name) {#name}
@y
    ### Name the sandbox (--name) {#name}
@z

% snip code...

@x
    Assign a custom name when creating a sandbox:
@y
    Assign a custom name when creating a sandbox:
@z

% snip command...

@x
    ### Use a custom base image (-t, --template) {#template}
@y
    ### Use a custom base image (-t, --template) {#template}
@z

% snip code...

@x
    Specify a custom container image when creating a sandbox:
@y
    Specify a custom container image when creating a sandbox:
@z

% snip command...

@x
    By default, each agent uses a pre-configured image. The `--template` option
    lets you substitute a different image.
@y
    By default, each agent uses a pre-configured image. The `--template` option
    lets you substitute a different image.
@z

@x
    ### Pass arguments to the agent
@y
    ### Pass arguments to the agent
@z

@x
    Use `--` to separate sandbox options from agent arguments:
@y
    Use `--` to separate sandbox options from agent arguments:
@z

% snip command...

@x
    ### Run with locally built template
@y
    ### Run with locally built template
@z

@x
    Use `--load-local-template` to test local template changes:
@y
    Use `--load-local-template` to test local template changes:
@z

% snip command...

% snip directives...
