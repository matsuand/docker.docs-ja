%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker buildx
short: Docker Buildx
long: Extended build capabilities with BuildKit
pname: docker
plink: docker.yaml
cname:
    - docker buildx bake
    - docker buildx build
    - docker buildx create
    - docker buildx debug
    - docker buildx du
    - docker buildx imagetools
    - docker buildx inspect
    - docker buildx ls
    - docker buildx prune
    - docker buildx rm
    - docker buildx stop
    - docker buildx use
    - docker buildx version
clink:
    - docker_buildx_bake.yaml
    - docker_buildx_build.yaml
    - docker_buildx_create.yaml
    - docker_buildx_debug.yaml
    - docker_buildx_du.yaml
    - docker_buildx_imagetools.yaml
    - docker_buildx_inspect.yaml
    - docker_buildx_ls.yaml
    - docker_buildx_prune.yaml
    - docker_buildx_rm.yaml
    - docker_buildx_stop.yaml
    - docker_buildx_use.yaml
    - docker_buildx_version.yaml
options:
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
command: docker buildx
short: Docker Buildx
long: Extended build capabilities with BuildKit
pname: docker
plink: docker.yaml
cname:
    - docker buildx bake
    - docker buildx build
    - docker buildx create
    - docker buildx debug
    - docker buildx du
    - docker buildx imagetools
    - docker buildx inspect
    - docker buildx ls
    - docker buildx prune
    - docker buildx rm
    - docker buildx stop
    - docker buildx use
    - docker buildx version
clink:
    - docker_buildx_bake.yaml
    - docker_buildx_build.yaml
    - docker_buildx_create.yaml
    - docker_buildx_debug.yaml
    - docker_buildx_du.yaml
    - docker_buildx_imagetools.yaml
    - docker_buildx_inspect.yaml
    - docker_buildx_ls.yaml
    - docker_buildx_prune.yaml
    - docker_buildx_rm.yaml
    - docker_buildx_stop.yaml
    - docker_buildx_use.yaml
    - docker_buildx_version.yaml
options:
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
    You can also use the `BUILDX_BUILDER` environment variable.
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    You can also use the `BUILDX_BUILDER` environment variable.
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
