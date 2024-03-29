%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker manifest annotate
short: Add additional information to a local image manifest
long: Add additional information to a local image manifest
usage: docker manifest annotate [OPTIONS] MANIFEST_LIST MANIFEST
pname: docker manifest
plink: docker_manifest.yaml
options:
    - option: arch
      value_type: string
      description: Set architecture
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: os
      value_type: string
      description: Set operating system
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: os-features
      value_type: stringSlice
      default_value: '[]'
      description: Set operating system feature
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: os-version
      value_type: string
      description: Set operating system version
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: variant
      value_type: string
      description: Set architecture variant
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
experimentalcli: true
kubernetes: false
swarm: false
@y
command: docker manifest annotate
short: Add additional information to a local image manifest
long: Add additional information to a local image manifest
usage: docker manifest annotate [OPTIONS] MANIFEST_LIST MANIFEST
pname: docker manifest
plink: docker_manifest.yaml
options:
    - option: arch
      value_type: string
      description: Set architecture
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: os
      value_type: string
      description: Set operating system
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: os-features
      value_type: stringSlice
      default_value: '[]'
      description: Set operating system feature
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: os-version
      value_type: string
      description: Set operating system version
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: variant
      value_type: string
      description: Set architecture variant
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
experimentalcli: true
kubernetes: false
swarm: false
@z
