%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker sandbox create codex
short: Create a sandbox for codex
long: |-
    Create a sandbox with access to a host workspace for codex.
@y
command: docker sandbox create codex
short: Create a sandbox for codex
long: |-
    Create a sandbox with access to a host workspace for codex.
@z

@x
    The workspace path is required and will be exposed inside the sandbox at the same path as on the host.
@y
    The workspace path is required and will be exposed inside the sandbox at the same path as on the host.
@z

@x
    Use 'docker sandbox run SANDBOX' to start codex after creation.
usage: docker sandbox create codex WORKSPACE
pname: docker sandbox create
plink: docker_sandbox_create.yaml
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
    Use 'docker sandbox run SANDBOX' to start codex after creation.
usage: docker sandbox create codex WORKSPACE
pname: docker sandbox create
plink: docker_sandbox_create.yaml
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
