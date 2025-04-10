%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker buildx history logs
short: Print the logs of a build
long: Print the logs of a build
usage: docker buildx history logs [OPTIONS] [REF]
pname: docker buildx history
plink: docker_buildx_history.yaml
options:
    - option: progress
      value_type: string
      default_value: plain
      description: Set type of progress output (plain, rawjson, tty)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
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
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
command: docker buildx history logs
short: Print the logs of a build
long: Print the logs of a build
usage: docker buildx history logs [OPTIONS] [REF]
pname: docker buildx history
plink: docker_buildx_history.yaml
options:
    - option: progress
      value_type: string
      default_value: plain
      description: Set type of progress output (plain, rawjson, tty)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
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
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
