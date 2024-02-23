%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker load
aliases: docker image load, docker load
short: Load an image from a tar archive or STDIN
long: Load an image from a tar archive or STDIN
usage: docker load [OPTIONS]
pname: docker
plink: docker.yaml
options:
    - option: input
      shorthand: i
      value_type: string
      description: Read from tar archive file, instead of STDIN
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: quiet
      shorthand: q
      value_type: bool
      default_value: "false"
      description: Suppress the load output
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
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
command: docker load
aliases: docker image load, docker load
short: Load an image from a tar archive or STDIN
long: Load an image from a tar archive or STDIN
usage: docker load [OPTIONS]
pname: docker
plink: docker.yaml
options:
    - option: input
      shorthand: i
      value_type: string
      description: Read from tar archive file, instead of STDIN
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: quiet
      shorthand: q
      value_type: bool
      default_value: "false"
      description: Suppress the load output
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
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
