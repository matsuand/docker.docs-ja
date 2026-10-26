%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx env plan
synopsis: Show what an environment would change outside the sandbox
experimental: true
description: |-
    Read the environment file from PATH (default: current directory) and print
    everything applying it would set up: the host commands it runs, the credentials
    and bindings it provisions, the MCP servers it registers, the directories it
    creates, the ports it publishes, and the sandbox itself along with the variables
    it runs with.
@y
name: sbx env plan
synopsis: Show what an environment would change outside the sandbox
experimental: true
description: |-
    Read the environment file from PATH (default: current directory) and print
    everything applying it would set up: the host commands it runs, the credentials
    and bindings it provisions, the MCP servers it registers, the directories it
    creates, the ports it publishes, and the sandbox itself along with the variables
    it runs with.
@z

@x
    The plan is compared against what this environment last applied on this machine,
    against what was approved where nothing applied it, and against what is there
    now, so a second run shows only what moved. Nothing is applied, approved, or
    recorded: use "sbx env create" or "sbx env run" for that.
@y
    The plan is compared against what this environment last applied on this machine,
    against what was approved where nothing applied it, and against what is there
    now, so a second run shows only what moved. Nothing is applied, approved, or
    recorded: use "sbx env create" or "sbx env run" for that.
@z

@x
    Each PATH may be a directory (the file is <PATH>/sbxenv.yaml) or the
    path to the environment file itself. Passing more than one PATH deep-merges them
    in order, matching the other "sbx env" subcommands.
@y
    Each PATH may be a directory (the file is <PATH>/sbxenv.yaml) or the
    path to the environment file itself. Passing more than one PATH deep-merges them
    in order, matching the other "sbx env" subcommands.
@z

@x
    A directory PATH selects sbxenv.yaml; a file PATH selects that file.
    With no PATH, ~/.sbxenv.yaml supplies shared defaults when present.
    Explicit PATHs skip those defaults. Later files override earlier values;
    lists such as ports and mcp.servers are concatenated.
@y
    A directory PATH selects sbxenv.yaml; a file PATH selects that file.
    With no PATH, ~/.sbxenv.yaml supplies shared defaults when present.
    Explicit PATHs skip those defaults. Later files override earlier values;
    lists such as ports and mcp.servers are concatenated.
@z

@x
usage: sbx env plan [PATH...] [flags]
@y
usage: sbx env plan [PATH...] [flags]
@z

% options:

@x clone
      usage: |
        Override workspace.clone in sbxenv.yaml (see 'sbx create --clone')
@y
      usage: |
        Override workspace.clone in sbxenv.yaml (see 'sbx create --clone')
@z

@x env-arg
      usage: |
        Value for an argument the environment file declares, as name=value (can be repeated)
@y
      usage: |
        Value for an argument the environment file declares, as name=value (can be repeated)
@z

@x env-args-file
      usage: |
        File of name=value environment arguments, one per line (can be repeated); --env-arg overrides
@y
      usage: |
        File of name=value environment arguments, one per line (can be repeated); --env-arg overrides
@z

@x help
      usage: help for plan
@y
      usage: help for plan
@z

@x kit-arg
      usage: |
        Value for an argument a kit declares, as name=value for every kit or kit.name=value for one (can be repeated); overrides the args a kits: entry pins in sbxenv.yaml
@y
      usage: |
        Value for an argument a kit declares, as name=value for every kit or kit.name=value for one (can be repeated); overrides the args a kits: entry pins in sbxenv.yaml
@z

@x kit-args-file
      usage: |
        File of name=value kit arguments, one per line (can be repeated); --kit-arg overrides
@y
      usage: |
        File of name=value kit arguments, one per line (can be repeated); --kit-arg overrides
@z

@x name
      usage: |
        Name for the sandbox, overriding 'name:' in sbxenv.yaml and the derived <agent>-<directory> (every 'sbx env' command addressing this environment needs the same value)
@y
      usage: |
        Name for the sandbox, overriding 'name:' in sbxenv.yaml and the derived <agent>-<directory> (every 'sbx env' command addressing this environment needs the same value)
@z

@x skip-host-commands
      usage: |
        Plan without the host lifecycle commands the environment declares
@y
      usage: |
        Plan without the host lifecycle commands the environment declares
@z

% inherited_options:

@x cloud
      usage: |
        Dispatch to Docker Cloud Sandboxes API instead of local sandboxd (supported by a growing set of verbs — run 'sbx --cloud --help' for the current list)
@y
      usage: |
        Dispatch to Docker Cloud Sandboxes API instead of local sandboxd (supported by a growing set of verbs — run 'sbx --cloud --help' for the current list)
@z

@x debug
      usage: Enable debug logging
@y
      usage: Enable debug logging
@z

% see_also:

@x
    - sbx env - (Experimental) Manage sandboxes declaratively from an sbxenv.yaml file
@y
    - sbx env - (Experimental) Manage sandboxes declaratively from an sbxenv.yaml file
@z
