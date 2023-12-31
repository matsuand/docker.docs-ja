%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker image load
aliases: docker image load, docker load
short: Load an image from a tar archive or STDIN
long: See [docker load](load.md) for more information.
usage: docker image load [OPTIONS]
pname: docker image
plink: docker_image.yaml
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
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
command: docker image load
aliases: docker image load, docker load
short: Load an image from a tar archive or STDIN
long: See [docker load](load.md) for more information.
usage: docker image load [OPTIONS]
pname: docker image
plink: docker_image.yaml
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
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
