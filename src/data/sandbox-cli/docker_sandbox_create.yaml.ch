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

% options:

@x load-local-template
      description: |
        Load a locally built template image into the sandbox (useful for testing local changes)
@y
      description: |
        Load a locally built template image into the sandbox (useful for testing local changes)
@z

@x name
      description: |
        Name for the sandbox (default: <agent>-<workdir>, letters, numbers, hyphens, and underscores)
@y
      description: |
        Name for the sandbox (default: <agent>-<workdir>, letters, numbers, hyphens, and underscores)
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

% snip directives...
