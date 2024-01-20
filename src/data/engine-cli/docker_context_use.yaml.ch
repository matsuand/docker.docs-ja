%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker context use
short: Set the current docker context
long: |-
    Set the default context to use, when `DOCKER_HOST`, `DOCKER_CONTEXT` environment
    variables and `--host`, `--context` global options aren't set.
    To disable usage of contexts, you can use the special `default` context.
usage: docker context use CONTEXT
pname: docker context
plink: docker_context.yaml
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
command: docker context use
short: Set the current docker context
long: |-
    Set the default context to use, when `DOCKER_HOST`, `DOCKER_CONTEXT` environment
    variables and `--host`, `--context` global options aren't set.
    To disable usage of contexts, you can use the special `default` context.
usage: docker context use CONTEXT
pname: docker context
plink: docker_context.yaml
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
