%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker buildx stop
short: Stop builder instance
long: |-
    Stops the specified or current builder. This does not prevent buildx build to
    restart the builder. The implementation of stop depends on the driver.
usage: docker buildx stop [NAME]
pname: docker buildx
plink: docker_buildx.yaml
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
command: docker buildx stop
short: Stop builder instance
long: |-
    Stops the specified or current builder. This does not prevent buildx build to
    restart the builder. The implementation of stop depends on the driver.
usage: docker buildx stop [NAME]
pname: docker buildx
plink: docker_buildx.yaml
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
    Same as [`buildx --builder`](/reference/cli/docker/buildx/#builder).
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    Same as [`buildx --builder`](__SUBDIR__/reference/cli/docker/buildx/#builder).
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
