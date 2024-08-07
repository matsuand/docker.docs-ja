%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker push
aliases: docker image push, docker push
short: Upload an image to a registry
long: Upload an image to a registry
usage: docker push [OPTIONS] NAME[:TAG]
pname: docker
plink: docker.yaml
options:
    - option: all-tags
      shorthand: a
      value_type: bool
      default_value: "false"
      description: Push all tags of an image to the repository
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: disable-content-trust
      value_type: bool
      default_value: "true"
      description: Skip image signing
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: platform
      value_type: string
      description: |-
        Push a platform-specific manifest as a single-platform image to the registry.
        'os[/arch[/variant]]': Explicit platform (eg. linux/amd64)
      deprecated: false
      hidden: false
      min_api_version: "1.46"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: quiet
      shorthand: q
      value_type: bool
      default_value: "false"
      description: Suppress verbose output
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
command: docker push
aliases: docker image push, docker push
short: Upload an image to a registry
long: Upload an image to a registry
usage: docker push [OPTIONS] NAME[:TAG]
pname: docker
plink: docker.yaml
options:
    - option: all-tags
      shorthand: a
      value_type: bool
      default_value: "false"
      description: Push all tags of an image to the repository
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: disable-content-trust
      value_type: bool
      default_value: "true"
      description: Skip image signing
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: platform
      value_type: string
      description: |-
        Push a platform-specific manifest as a single-platform image to the registry.
        'os[/arch[/variant]]': Explicit platform (eg. linux/amd64)
      deprecated: false
      hidden: false
      min_api_version: "1.46"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: quiet
      shorthand: q
      value_type: bool
      default_value: "false"
      description: Suppress verbose output
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
