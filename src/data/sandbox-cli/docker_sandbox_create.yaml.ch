%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker sandbox create
short: Create a sandbox for an agent
long: |-
    Create a sandbox with access to a host workspace for an agent.

    Available agents are provided as subcommands. Use "create AGENT --help" for agent-specific options.
@y
command: docker sandbox create
short: Create a sandbox for an agent
long: |-
    Create a sandbox with access to a host workspace for an agent.

    Available agents are provided as subcommands. Use "create AGENT --help" for agent-specific options.
@z

@x
usage: docker sandbox create [OPTIONS] AGENT WORKSPACE
@y
usage: docker sandbox create [OPTIONS] AGENT WORKSPACE
@z

% pname
% plink
% cname
% clink
% options

@x name
      description: |
        Name for the sandbox (default: <agent>-<workdir>, letters, numbers, hyphens, underscores, periods, plus signs and minus signs only)
@y
      description: |
        Name for the sandbox (default: <agent>-<workdir>, letters, numbers, hyphens, underscores, periods, plus signs and minus signs only)
@z

@x pull-template
      description: |
        Template image pull policy: always (always pull from registry), missing (pull only if not cached), never (use only cached images)
@y
      description: |
        Template image pull policy: always (always pull from registry), missing (pull only if not cached), never (use only cached images)
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
    ### Create a Claude sandbox
@y
examples: |-
    ### Create a Claude sandbox
@z

% snip command...

@x
    ### Create with a custom name
@y
    ### Create with a custom name
@z

% snip command...

@x
    ### Use a custom base image (-t, --template) {#template}
@y
    ### Use a custom base image (-t, --template) {#template}
@z

% snip code...

@x
    Specify a custom container image to use as the sandbox base:
@y
    Specify a custom container image to use as the sandbox base:
@z

% snip command...

@x
    By default, each agent uses a pre-configured image.
@y
    By default, each agent uses a pre-configured image.
@z

@x
    ### Create and run immediately
@y
    ### Create and run immediately
@z

@x
    After creating a sandbox, use `run` to start the agent:
@y
    After creating a sandbox, use `run` to start the agent:
@z

% snip command...

@x
    Or use `docker sandbox run` directly to create and run in one step:
@y
    Or use `docker sandbox run` directly to create and run in one step:
@z

% snip command...
% snip directives...
