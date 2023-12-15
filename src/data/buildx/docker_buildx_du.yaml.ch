%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker buildx du
short: Disk usage
long: Disk usage
usage: docker buildx du
pname: docker buildx
plink: docker_buildx.yaml
options:
    - option: filter
      value_type: filter
      description: Provide filter values
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: verbose
      value_type: bool
      default_value: "false"
      description: Provide a more verbose output
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
      details_url: '#builder'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Override the configured builder instance (--builder) {#builder}
@y
command: docker buildx du
short: Disk usage
long: Disk usage
usage: docker buildx du
pname: docker buildx
plink: docker_buildx.yaml
options:
    - option: filter
      value_type: filter
      description: Provide filter values
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: verbose
      value_type: bool
      default_value: "false"
      description: Provide a more verbose output
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
      details_url: '#builder'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Override the configured builder instance (--builder) {#builder}
@z

@x
    Same as [`buildx --builder`](buildx.md#builder).
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    Same as [`buildx --builder`](buildx.md#builder).
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
