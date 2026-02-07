%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker sandbox save
short: Save a snapshot of the sandbox as a template
long: |-
    Save a snapshot of the sandbox as a template.
@y
command: docker sandbox save
short: Save a snapshot of the sandbox as a template
long: |-
    Save a snapshot of the sandbox as a template.
@z

@x
    By default, the image is loaded into the host's Docker daemon (requires Docker to be running).
    Use --output to save the image to a tar file instead.
usage: docker sandbox save SANDBOX TAG
pname: docker sandbox
plink: docker_sandbox.yaml
options:
    - option: output
      shorthand: o
      value_type: string
      description: |
        Save image to specified tar file instead of loading into host Docker
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
    By default, the image is loaded into the host's Docker daemon (requires Docker to be running).
    Use --output to save the image to a tar file instead.
usage: docker sandbox save SANDBOX TAG
pname: docker sandbox
plink: docker_sandbox.yaml
options:
    - option: output
      shorthand: o
      value_type: string
      description: |
        Save image to specified tar file instead of loading into host Docker
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
