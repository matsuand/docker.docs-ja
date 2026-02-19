%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker sandbox create opencode
short: Create a sandbox for opencode
long: |-
    Create a sandbox with access to a host workspace for opencode.
@y
command: docker sandbox create opencode
short: Create a sandbox for opencode
long: |-
    Create a sandbox with access to a host workspace for opencode.
@z

@x
    The workspace path is required and will be exposed inside the sandbox at the same path as on the host.
    Additional workspaces can be provided as extra arguments. Append ":ro" to mount them read-only.
@y
    The workspace path is required and will be exposed inside the sandbox at the same path as on the host.
    Additional workspaces can be provided as extra arguments. Append ":ro" to mount them read-only.
@z

@x
    Use 'docker sandbox run SANDBOX' to start opencode after creation.
usage: docker sandbox create opencode WORKSPACE [EXTRA_WORKSPACE...]
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
examples: |-
    ### Create an OpenCode sandbox in the current directory
@y
    Use 'docker sandbox run SANDBOX' to start opencode after creation.
usage: docker sandbox create opencode WORKSPACE [EXTRA_WORKSPACE...]
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
examples: |-
    ### Create an OpenCode sandbox in the current directory
@z

@x
    ```console
    $ docker sandbox create opencode .
    ```
@y
    ```console
    $ docker sandbox create opencode .
    ```
@z

@x
    ### Create with an absolute path
@y
    ### Create with an absolute path
@z

@x
    ```console
    $ docker sandbox create opencode /home/user/my-project
    ```
@y
    ```console
    $ docker sandbox create opencode /home/user/my-project
    ```
@z

@x
    ### Create and then run
@y
    ### Create and then run
@z

@x
    ```console
    $ docker sandbox create --name my-opencode opencode ~/my-project
    $ docker sandbox run my-opencode
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    ```console
    $ docker sandbox create --name my-opencode opencode ~/my-project
    $ docker sandbox run my-opencode
    ```
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
