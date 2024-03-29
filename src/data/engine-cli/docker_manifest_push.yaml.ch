%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker manifest push
short: Push a manifest list to a repository
long: Push a manifest list to a repository
usage: docker manifest push [OPTIONS] MANIFEST_LIST
pname: docker manifest
plink: docker_manifest.yaml
options:
    - option: insecure
      value_type: bool
      default_value: "false"
      description: Allow push to an insecure registry
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: purge
      shorthand: p
      value_type: bool
      default_value: "false"
      description: Remove the local manifest list after push
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
command: docker manifest push
short: Push a manifest list to a repository
long: Push a manifest list to a repository
usage: docker manifest push [OPTIONS] MANIFEST_LIST
pname: docker manifest
plink: docker_manifest.yaml
options:
    - option: insecure
      value_type: bool
      default_value: "false"
      description: Allow push to an insecure registry
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: purge
      shorthand: p
      value_type: bool
      default_value: "false"
      description: Remove the local manifest list after push
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
