%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker sandbox run
short: Run an agent in a sandbox
long: |-
    Run an agent in a sandbox. Create the sandbox if it does not exist.
@y
command: docker sandbox run
short: Run an agent in a sandbox
long: |-
    Run an agent in a sandbox. Create the sandbox if it does not exist.
@z

@x
    Pass agent arguments after the "--" separator.
@y
    Pass agent arguments after the "--" separator.
@z

@x
    Examples:
      # Create and run a sandbox with claude in current directory
      docker sandbox run claude .
@y
    Examples:
      # Create and run a sandbox with claude in current directory
      docker sandbox run claude .
@z

@x
      # Run an existing sandbox
      docker sandbox run existing-sandbox
@y
      # Run an existing sandbox
      docker sandbox run existing-sandbox
@z

@x
      # Run a sandbox with agent arguments
      docker sandbox run claude . -- -p "What version are you running?"
@y
      # Run a sandbox with agent arguments
      docker sandbox run claude . -- -p "What version are you running?"
@z

@x
usage: docker sandbox run SANDBOX [-- AGENT_ARGS...] | AGENT WORKSPACE [-- AGENT_ARGS...]
@y
usage: docker sandbox run SANDBOX [-- AGENT_ARGS...] | AGENT WORKSPACE [-- AGENT_ARGS...]
@z

% pname:
% plink:
% options:

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
inherited_options:

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
    ### Run Claude in the current directory
@y
examples: |-
    ### Run Claude in the current directory
@z

% snip command...

@x
    ### Specify a workspace directory (-w, --workspace) {#workspace}
@y
    ### Specify a workspace directory (-w, --workspace) {#workspace}
@z

% snip text...

@x
    Run the agent in a specific directory:
@y
    Run the agent in a specific directory:
@z

% snip command...

@x
    The workspace directory is mounted at the same absolute path inside the sandbox.
@y
    The workspace directory is mounted at the same absolute path inside the sandbox.
@z

@x
    ### Enable Docker-in-Docker (--mount-docker-socket) {#mount-docker-socket}
@y
    ### Enable Docker-in-Docker (--mount-docker-socket) {#mount-docker-socket}
@z

% snip text...

@x
    Mount the host's Docker socket into the sandbox, giving the agent access to Docker commands:
@y
    Mount the host's Docker socket into the sandbox, giving the agent access to Docker commands:
@z

% snip command...

@x
    > [!CAUTION]
    > This grants the agent full access to your Docker daemon with root-level
    > privileges. Only use when you trust the code being executed.
@y
    > [!CAUTION]
    > This grants the agent full access to your Docker daemon with root-level
    > privileges. Only use when you trust the code being executed.
@z

@x
    The agent can now build images, run containers, and manage your Docker environment.
@y
    The agent can now build images, run containers, and manage your Docker environment.
@z

@x
    ### Set environment variables (-e, --env) {#env}
@y
    ### Set environment variables (-e, --env) {#env}
@z

% snip text...

@x
    Pass environment variables to the sandbox:
@y
    Pass environment variables to the sandbox:
@z

% snip command...

@x
    ### Mount additional volumes (-v, --volume) {#volume}
@y
    ### Mount additional volumes (-v, --volume) {#volume}
@z

% snip text...

@x
    Mount additional directories or files into the sandbox:
@y
    Mount additional directories or files into the sandbox:
@z

% snip command...

@x
    Use `:ro` or `:readonly` to make mounts read-only.
@y
    Use `:ro` or `:readonly` to make mounts read-only.
@z

@x
    ### Use a custom base image (-t, --template) {#template}
@y
    ### Use a custom base image (-t, --template) {#template}
@z

% snip text...

@x
    Specify a custom container image to use as the sandbox base:
@y
    Specify a custom container image to use as the sandbox base:
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
    ### Name the sandbox (--name) {#name}
@y
    ### Name the sandbox (--name) {#name}
@z

% snip text...

@x
    Assign a custom name to the sandbox for easier identification:
@y
    Assign a custom name to the sandbox for easier identification:
@z

% snip command...
% snip directives...
