%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker sandbox ls
aliases: docker sandbox ls, docker sandbox list
short: List VMs
long: List all VMs managed by sandboxd with their sandboxes
usage: docker sandbox ls [OPTIONS]
@y
command: docker sandbox ls
aliases: docker sandbox ls, docker sandbox list
short: List VMs
long: List all VMs managed by sandboxd with their sandboxes
usage: docker sandbox ls [OPTIONS]
@z

% options:

@x json
      description: Output in JSON format
@y
      description: Output in JSON format
@z

@x no-trunc
      description: Don't truncate output
@y
      description: Don't truncate output
@z

@x quiet
      description: Only display VM names
@y
      description: Only display VM names
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
    ### List all VMs
@y
examples: |-
    ### List all VMs
@z

% snip command...

@x
    ### Show only VM names (--quiet) {#quiet}
@y
    ### Show only VM names (--quiet) {#quiet}
@z

% snip text...

@x
    Output only VM names:
@y
    Output only VM names:
@z

% snip command...

@x
    ### Don't truncate output (--no-trunc) {#no-trunc}
@y
    ### Don't truncate output (--no-trunc) {#no-trunc}
@z

% snip text...

@x
    By default, long VM IDs, workspace paths, and socket paths are truncated for readability. Use `--no-trunc` to display the full values:
@y
    By default, long VM IDs, workspace paths, and socket paths are truncated for readability. Use `--no-trunc` to display the full values:
@z

% snip command...

@x
    ### JSON output (--json)
@y
    ### JSON output (--json)
@z

% snip text...

@x
    Output detailed VM information in JSON format:
@y
    Output detailed VM information in JSON format:
@z

% snip command...
% snip directives...
