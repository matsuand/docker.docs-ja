%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker sandbox reset
short: Reset all VM sandboxes and clean up state
@y
command: docker sandbox reset
short: Reset all VM sandboxes and clean up state
@z

@x
long: |-
    Reset all VM sandboxes and permanently delete all VM data.

    This command will:
    - Stop all running VMs gracefully (30s timeout)
    - Delete all VM state directories in ~/.docker/sandboxes/vm/
    - Clear all internal registries

    The daemon will continue running with fresh state after reset.

    ⚠️  WARNING: This is a destructive operation that cannot be undone!
    All running agents will be forcefully terminated and their work will be lost.

    By default, you will be prompted to confirm (y/N).
    Use --force to skip the confirmation prompt.
@y
long: |-
    Reset all VM sandboxes and permanently delete all VM data.

    This command will:
    - Stop all running VMs gracefully (30s timeout)
    - Delete all VM state directories in ~/.docker/sandboxes/vm/
    - Clear all internal registries

    The daemon will continue running with fresh state after reset.

    ⚠️  WARNING: This is a destructive operation that cannot be undone!
    All running agents will be forcefully terminated and their work will be lost.

    By default, you will be prompted to confirm (y/N).
    Use --force to skip the confirmation prompt.
@z

@x
usage: docker sandbox reset [OPTIONS]
@y
usage: docker sandbox reset [OPTIONS]
@z

% pname
% plink
% options

@x force
      description: Skip confirmation prompt
@y
      description: Skip confirmation prompt
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
    ### Reset with confirmation prompt
@y
examples: |-
    ### Reset with confirmation prompt
@z

% snip command...

@x
    ### Force reset without confirmation (-f, --force) {#force}
@y
    ### Force reset without confirmation (-f, --force) {#force}
@z

@x
    Skip the confirmation prompt:
@y
    Skip the confirmation prompt:
@z

% snip command...

@x
    > [!CAUTION]
    > This is a destructive operation that cannot be undone!
    > All running agents will be terminated and their work will be lost.
@y
    > [!CAUTION]
    > This is a destructive operation that cannot be undone!
    > All running agents will be terminated and their work will be lost.
@z

% snip directives...
