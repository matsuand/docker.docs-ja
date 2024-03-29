%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker manifest create
short: Create a local manifest list for annotating and pushing to a registry
long: Create a local manifest list for annotating and pushing to a registry
usage: docker manifest create MANIFEST_LIST MANIFEST [MANIFEST...]
pname: docker manifest
plink: docker_manifest.yaml
options:
    - option: amend
      shorthand: a
      value_type: bool
      default_value: "false"
      description: Amend an existing manifest list
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: insecure
      value_type: bool
      default_value: "false"
      description: Allow communication with an insecure registry
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
command: docker manifest create
short: Create a local manifest list for annotating and pushing to a registry
long: Create a local manifest list for annotating and pushing to a registry
usage: docker manifest create MANIFEST_LIST MANIFEST [MANIFEST...]
pname: docker manifest
plink: docker_manifest.yaml
options:
    - option: amend
      shorthand: a
      value_type: bool
      default_value: "false"
      description: Amend an existing manifest list
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: insecure
      value_type: bool
      default_value: "false"
      description: Allow communication with an insecure registry
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
