%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker sandbox reset
short: Reset all VM sandboxes and clean up state
long: |-
    Reset all VM sandboxes and permanently delete all VM data.
@y
command: docker sandbox reset
short: Reset all VM sandboxes and clean up state
long: |-
    Reset all VM sandboxes and permanently delete all VM data.
@z

@x
    This command will:
    - Stop all running VMs gracefully (30s timeout)
    - Delete all VM state directories in ~/.docker/sandboxes/vm/
    - Clear all internal registries
@y
    This command will:
    - Stop all running VMs gracefully (30s timeout)
    - Delete all VM state directories in ~/.docker/sandboxes/vm/
    - Clear all internal registries
@z

@x
    The daemon will continue running with fresh state after reset.
@y
    The daemon will continue running with fresh state after reset.
@z

@x
    ⚠️  WARNING: This is a destructive operation that cannot be undone!
    All running agents will be forcefully terminated and their work will be lost.
@y
    ⚠️  WARNING: This is a destructive operation that cannot be undone!
    All running agents will be forcefully terminated and their work will be lost.
@z

@x
    By default, you will be prompted to confirm (y/N).
    Use --force to skip the confirmation prompt.
usage: docker sandbox reset [OPTIONS]
pname: docker sandbox
plink: docker_sandbox.yaml
options:
    - option: force
      shorthand: f
      value_type: bool
      default_value: "false"
      description: Skip confirmation prompt
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: debug
      shorthand: D
      value_type: bool
      default_value: "false"
      description: Enable debug logging
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: socket
      value_type: string
      description: |
        Connect to daemon at specific socket path (for development/debugging)
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    By default, you will be prompted to confirm (y/N).
    Use --force to skip the confirmation prompt.
usage: docker sandbox reset [OPTIONS]
pname: docker sandbox
plink: docker_sandbox.yaml
options:
    - option: force
      shorthand: f
      value_type: bool
      default_value: "false"
      description: Skip confirmation prompt
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: debug
      shorthand: D
      value_type: bool
      default_value: "false"
      description: Enable debug logging
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: socket
      value_type: string
      description: |
        Connect to daemon at specific socket path (for development/debugging)
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
