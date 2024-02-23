%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker buildx imagetools
short: Commands to work on images in registry
long: |-
    The `imagetools` commands contains subcommands for working with manifest lists
    in container registries. These commands are useful for inspecting manifests
    to check multi-platform configuration and attestations.
pname: docker buildx
plink: docker_buildx.yaml
cname:
    - docker buildx imagetools create
    - docker buildx imagetools inspect
clink:
    - docker_buildx_imagetools_create.yaml
    - docker_buildx_imagetools_inspect.yaml
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
command: docker buildx imagetools
short: Commands to work on images in registry
long: |-
    The `imagetools` commands contains subcommands for working with manifest lists
    in container registries. These commands are useful for inspecting manifests
    to check multi-platform configuration and attestations.
pname: docker buildx
plink: docker_buildx.yaml
cname:
    - docker buildx imagetools create
    - docker buildx imagetools inspect
clink:
    - docker_buildx_imagetools_create.yaml
    - docker_buildx_imagetools_inspect.yaml
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
