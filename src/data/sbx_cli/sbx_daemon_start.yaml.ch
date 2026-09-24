%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
name: sbx daemon start
synopsis: Start the sandboxd daemon
usage: sbx daemon start [flags]
@y
name: sbx daemon start
synopsis: Start the sandboxd daemon
usage: sbx daemon start [flags]
@z

% options:

@x detach
      usage: Run daemon in background
@y
      usage: Run daemon in background
@z

@x help
      usage: help for start
@y
      usage: help for start
@z

@x policy
      usage: |
        Initialize the global network policy: "allow-all", "balanced", or "deny-all"
@y
      usage: |
        Initialize the global network policy: "allow-all", "balanced", or "deny-all"
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
    - sbx daemon - Manage sandboxd daemon
@y
    - sbx daemon - Manage sandboxd daemon
@z
