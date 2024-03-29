%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker builder prune
short: Remove build cache
long: Remove build cache
usage: docker builder prune
pname: docker builder
plink: docker_builder.yaml
options:
    - option: all
      shorthand: a
      value_type: bool
      default_value: "false"
      description: Remove all unused build cache, not just dangling ones
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: filter
      value_type: filter
      description: Provide filter values (e.g. `until=24h`)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: force
      shorthand: f
      value_type: bool
      default_value: "false"
      description: Do not prompt for confirmation
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: keep-storage
      value_type: bytes
      default_value: "0"
      description: Amount of disk space to keep for cache
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
min_api_version: "1.39"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
command: docker builder prune
short: Remove build cache
long: Remove build cache
usage: docker builder prune
pname: docker builder
plink: docker_builder.yaml
options:
    - option: all
      shorthand: a
      value_type: bool
      default_value: "false"
      description: Remove all unused build cache, not just dangling ones
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: filter
      value_type: filter
      description: Provide filter values (e.g. `until=24h`)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: force
      shorthand: f
      value_type: bool
      default_value: "false"
      description: Do not prompt for confirmation
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: keep-storage
      value_type: bytes
      default_value: "0"
      description: Amount of disk space to keep for cache
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
min_api_version: "1.39"
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
