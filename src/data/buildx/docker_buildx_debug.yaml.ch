%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker buildx debug
short: Start debugger
long: Start debugger
usage: docker buildx debug
pname: docker buildx
plink: docker_buildx.yaml
cname:
    - docker buildx debug build
clink:
    - docker_buildx_debug_build.yaml
options:
    - option: detach
      value_type: bool
      default_value: "true"
      description: Detach buildx server for the monitor (supported only on linux)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: true
      kubernetes: false
      swarm: false
    - option: invoke
      value_type: string
      description: Launch a monitor with executing specified command
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: true
      kubernetes: false
      swarm: false
    - option: "on"
      value_type: string
      default_value: error
      description: When to launch the monitor ([always, error])
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: true
      kubernetes: false
      swarm: false
    - option: progress
      value_type: string
      default_value: auto
      description: |
        Set type of progress output (`auto`, `plain`, `tty`) for the monitor. Use plain to show container output
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: root
      value_type: string
      description: Specify root directory of server to connect for the monitor
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: true
      kubernetes: false
      swarm: false
    - option: server-config
      value_type: string
      description: |
        Specify buildx server config file for the monitor (used only when launching new server)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: true
      kubernetes: false
      swarm: false
inherited_options:
    - option: builder
      value_type: string
      description: Override the configured builder instance
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
deprecated: false
hidden: false
experimental: false
experimentalcli: true
kubernetes: false
swarm: false
@y
command: docker buildx debug
short: Start debugger
long: Start debugger
usage: docker buildx debug
pname: docker buildx
plink: docker_buildx.yaml
cname:
    - docker buildx debug build
clink:
    - docker_buildx_debug_build.yaml
options:
    - option: detach
      value_type: bool
      default_value: "true"
      description: Detach buildx server for the monitor (supported only on linux)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: true
      kubernetes: false
      swarm: false
    - option: invoke
      value_type: string
      description: Launch a monitor with executing specified command
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: true
      kubernetes: false
      swarm: false
    - option: "on"
      value_type: string
      default_value: error
      description: When to launch the monitor ([always, error])
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: true
      kubernetes: false
      swarm: false
    - option: progress
      value_type: string
      default_value: auto
      description: |
        Set type of progress output (`auto`, `plain`, `tty`) for the monitor. Use plain to show container output
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: root
      value_type: string
      description: Specify root directory of server to connect for the monitor
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: true
      kubernetes: false
      swarm: false
    - option: server-config
      value_type: string
      description: |
        Specify buildx server config file for the monitor (used only when launching new server)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: true
      kubernetes: false
      swarm: false
inherited_options:
    - option: builder
      value_type: string
      description: Override the configured builder instance
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
deprecated: false
hidden: false
experimental: false
experimentalcli: true
kubernetes: false
swarm: false
@z
