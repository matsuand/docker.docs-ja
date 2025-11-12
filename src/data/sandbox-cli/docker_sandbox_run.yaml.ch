%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker sandbox run
short: Run an AI agent inside a sandbox
@y
command: docker sandbox run
short: Run an AI agent inside a sandbox
@z

@x
long: |-
    Run an AI agent inside a sandbox with access to a host workspace.

    The agent argument must be one of: claude, gemini.
    Agent-specific options can be passed after the agent name.
    If no workspace is specified via the "--workspace" option, the current working directory is used.
    The workspace is exposed inside the sandbox at the same path as on the host.
@y
long: |-
    Run an AI agent inside a sandbox with access to a host workspace.

    The agent argument must be one of: claude, gemini.
    Agent-specific options can be passed after the agent name.
    If no workspace is specified via the "--workspace" option, the current working directory is used.
    The workspace is exposed inside the sandbox at the same path as on the host.
@z

@x
usage: docker sandbox run [options] <agent> [agent-options]
@y
usage: docker sandbox run [options] <agent> [agent-options]
@z

% options:

@x credentials
      description: Credentials source (host, sandbox, or none)
@y
      description: Credentials source (host, sandbox, or none)
@z

@x detached
      description: Create sandbox without running agent interactively
@y
      description: Create sandbox without running agent interactively
@z

@x env
      description: 'Set environment variables (format: KEY=VALUE)'
@y
      description: 'Set environment variables (format: KEY=VALUE)'
@z

@x mount-docker-socket
      description: Mount the host's Docker socket into the sandbox
@y
      description: Mount the host's Docker socket into the sandbox
@z

@x name
      description: Name for the sandbox
@y
      description: Name for the sandbox
@z

@x quiet
      description: Suppress verbose output
@y
      description: Suppress verbose output
@z

@x template
      description: |
        Container image to use for the sandbox (default: agent-specific image)
@y
      description: |
        Container image to use for the sandbox (default: agent-specific image)
@z

@x volume
      description: |
        Bind mount a volume or host file or directory into the sandbox (format: hostpath:sandboxpath[:readonly|:ro])
@y
      description: |
        Bind mount a volume or host file or directory into the sandbox (format: hostpath:sandboxpath[:readonly|:ro])
@z

@x workspace
      description: Workspace path
@y
      description: Workspace path
@z

% inherited_options:

@x debug
      description: Enable debug logging
@y
      description: Enable debug logging
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
    ### Configure credential access (--credentials) {#credentials}
@y
    ### Configure credential access (--credentials) {#credentials}
@z

% snip text...

@x
    Control how the agent accesses credentials. Valid modes are:
@y
    Control how the agent accesses credentials. Valid modes are:
@z

@x
    - `sandbox` (default): Authenticate once and share credentials across sandboxes
    - `host`: Share host credentials (~/.gitconfig, ~/.ssh, etc.)
    - `none`: Handle authentication manually
@y
    - `sandbox` (default): Authenticate once and share credentials across sandboxes
    - `host`: Share host credentials (~/.gitconfig, ~/.ssh, etc.)
    - `none`: Handle authentication manually
@z

% snip command...

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
