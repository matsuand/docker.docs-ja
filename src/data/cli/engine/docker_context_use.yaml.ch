%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% snip 対応

@x
command: docker context use
short: Set the default docker context
long: |-
    The `docker context use` command sets the default context for the Docker CLI.
@y
command: docker context use
short: Set the default docker context
long: |-
    The `docker context use` command sets the default context for the Docker CLI.
@z

@x
    The `docker context use` command sets the Docker CLI’s default context by updating
    your CLI config (`~/.docker/config.json`). This change is persistent, affecting
    all shells and sessions that share that config, not just the current terminal.
@y
    The `docker context use` command sets the Docker CLI’s default context by updating
    your CLI config (`~/.docker/config.json`). This change is persistent, affecting
    all shells and sessions that share that config, not just the current terminal.
@z

@x
    For one-off commands or per-shell usage, use `--context` or the `DOCKER_CONTEXT`
    environment variable instead.
@y
    For one-off commands or per-shell usage, use `--context` or the `DOCKER_CONTEXT`
    environment variable instead.
@z

% inherited_options:

@x
      description: Print usage
@y
      description: 利用方法を表示します。
@z

@x
examples: |-
    ### Set the default (sticky) context
@y
examples: |-
    ### Set the default (sticky) context
@z

@x
    This updates the CLI configuration and applies to new terminal sessions:
@y
    This updates the CLI configuration and applies to new terminal sessions:
@z

% snip command...

@x
    ### Use a context for a single command
@y
    ### Use a context for a single command
@z

@x
    Use the global `--context` flag to avoid changing the default:
@y
    Use the global `--context` flag to avoid changing the default:
@z

% snip command...

@x
    ### Use a context for the current shell session
@y
    ### Use a context for the current shell session
@z

@x
    Set `DOCKER_CONTEXT` to override the configured default in the current shell:
@y
    Set `DOCKER_CONTEXT` to override the configured default in the current shell:
@z

% snip command...

@x
    To stop overriding:
@y
    To stop overriding:
@z

% snip command...

@x
    ### Switch back to the default context
@y
    ### Switch back to the default context
@z

% snip command...
% snip directives...
