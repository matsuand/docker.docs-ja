%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker attach
aliases: docker container attach, docker attach
short: |
    Attach local standard input, output, and error streams to a running container
long: |
    Attach local standard input, output, and error streams to a running container
usage: docker attach [OPTIONS] CONTAINER
pname: docker
plink: docker.yaml
options:
    - option: detach-keys
      value_type: string
      description: Override the key sequence for detaching a container
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-stdin
      value_type: bool
      default_value: "false"
      description: Do not attach STDIN
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: sig-proxy
      value_type: bool
      default_value: "true"
      description: Proxy all received signals to the process
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: help
      value_type: bool
      default_value: "false"
      description: Print usage
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
command: docker attach
aliases: docker container attach, docker attach
short: |
    Attach local standard input, output, and error streams to a running container
long: |
    Attach local standard input, output, and error streams to a running container
usage: docker attach [OPTIONS] CONTAINER
pname: docker
plink: docker.yaml
options:
    - option: detach-keys
      value_type: string
      description: Override the key sequence for detaching a container
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-stdin
      value_type: bool
      default_value: "false"
      description: Do not attach STDIN
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: sig-proxy
      value_type: bool
      default_value: "true"
      description: Proxy all received signals to the process
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: help
      value_type: bool
      default_value: "false"
      description: Print usage
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
