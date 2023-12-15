%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker buildx use
short: Set the current builder instance
long: |-
    Switches the current builder instance. Build commands invoked after this command
    will run on a specified builder. Alternatively, a context name can be used to
    switch to the default builder of that context.
usage: docker buildx use [OPTIONS] NAME
pname: docker buildx
plink: docker_buildx.yaml
options:
    - option: default
      value_type: bool
      default_value: "false"
      description: Set builder as default for current context
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: global
      value_type: bool
      default_value: "false"
      description: Builder persists context changes
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
command: docker buildx use
short: Set the current builder instance
long: |-
    Switches the current builder instance. Build commands invoked after this command
    will run on a specified builder. Alternatively, a context name can be used to
    switch to the default builder of that context.
usage: docker buildx use [OPTIONS] NAME
pname: docker buildx
plink: docker_buildx.yaml
options:
    - option: default
      value_type: bool
      default_value: "false"
      description: Set builder as default for current context
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: global
      value_type: bool
      default_value: "false"
      description: Builder persists context changes
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
