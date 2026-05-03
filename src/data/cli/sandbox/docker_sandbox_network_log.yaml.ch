%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker sandbox network log
short: Show network logs
@y
command: docker sandbox network log
short: Show network logs
@z

@x
long: |-
    > [!WARNING]
    > The Docker Desktop-integrated `docker sandbox` commands are deprecated and
    > replaced by the standalone [`sbx` CLI](/manuals/ai/sandboxes/_index.md).
    > This deprecation applies only to the Docker Desktop integration, not to Docker
    > Sandboxes.

    Show network logs
@y
long: |-
    > [!WARNING]
    > The Docker Desktop-integrated `docker sandbox` commands are deprecated and
    > replaced by the standalone [`sbx` CLI](/manuals/ai/sandboxes/_index.md).
    > This deprecation applies only to the Docker Desktop integration, not to Docker
    > Sandboxes.

    Show network logs
@z

@x
usage: docker sandbox network log
@y
usage: docker sandbox network log
@z

% options

@x json
      description: Output in JSON format
@y
      description: Output in JSON format
@z

@x limit
      description: Maximum number of log entries to show
@y
      description: Maximum number of log entries to show
@z

@x quiet
      description: Only display log entries
@y
      description: Only display log entries
@z

% inherited_options

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
    ### Show network logs
@y
examples: |-
    ### Show network logs
@z

% snip command...

@x
    ### Show only log entries (--quiet) {#quiet}
@y
    ### Show only log entries (--quiet) {#quiet}
@z

% snip code...

@x
    Suppress headers and only show log entries:
@y
    Suppress headers and only show log entries:
@z

% snip command...

@x
    ### Limit number of entries (--limit) {#limit}
@y
    ### Limit number of entries (--limit) {#limit}
@z

% snip code...

@x
    Show only the last N log entries:
@y
    Show only the last N log entries:
@z

% snip command...

@x
    ### JSON output (--json) {#json}
@y
    ### JSON output (--json) {#json}
@z

@x
    Output logs in JSON format for parsing:
@y
    Output logs in JSON format for parsing:
@z

% snip command...
% snip directives...
