%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker import
aliases: docker image import, docker import
short: Import the contents from a tarball to create a filesystem image
long: Import the contents from a tarball to create a filesystem image
usage: docker import [OPTIONS] file|URL|- [REPOSITORY[:TAG]]
pname: docker
plink: docker.yaml
options:
    - option: change
      shorthand: c
      value_type: list
      description: Apply Dockerfile instruction to the created image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: message
      shorthand: m
      value_type: string
      description: Set commit message for imported image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: platform
      value_type: string
      description: Set platform if server is multi-platform capable
      deprecated: false
      hidden: false
      min_api_version: "1.32"
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
command: docker import
aliases: docker image import, docker import
short: Import the contents from a tarball to create a filesystem image
long: Import the contents from a tarball to create a filesystem image
usage: docker import [OPTIONS] file|URL|- [REPOSITORY[:TAG]]
pname: docker
plink: docker.yaml
options:
    - option: change
      shorthand: c
      value_type: list
      description: Apply Dockerfile instruction to the created image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: message
      shorthand: m
      value_type: string
      description: Set commit message for imported image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: platform
      value_type: string
      description: Set platform if server is multi-platform capable
      deprecated: false
      hidden: false
      min_api_version: "1.32"
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
