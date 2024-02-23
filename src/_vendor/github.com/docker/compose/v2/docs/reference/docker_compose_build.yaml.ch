%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker compose build
short: Build or rebuild services
long: |-
    Services are built once and then tagged, by default as `project_service`.
@y
command: docker compose build
short: Build or rebuild services
long: |-
    Services are built once and then tagged, by default as `project_service`.
@z

@x
    If the Compose file specifies an
    [image](https://github.com/compose-spec/compose-spec/blob/master/spec.md#image) name,
    the image is tagged with that name, substituting any variables beforehand. See
    [variable interpolation](https://github.com/compose-spec/compose-spec/blob/master/spec.md#interpolation).
@y
    If the Compose file specifies an
    [image](https://github.com/compose-spec/compose-spec/blob/master/spec.md#image) name,
    the image is tagged with that name, substituting any variables beforehand. See
    [variable interpolation](https://github.com/compose-spec/compose-spec/blob/master/spec.md#interpolation).
@z

@x
    If you change a service's `Dockerfile` or the contents of its build directory,
    run `docker compose build` to rebuild it.
usage: docker compose build [OPTIONS] [SERVICE...]
pname: docker compose
plink: docker_compose.yaml
options:
    - option: build-arg
      value_type: stringArray
      default_value: '[]'
      description: Set build-time variables for services
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: builder
      value_type: string
      description: Set builder to use
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: compress
      value_type: bool
      default_value: "true"
      description: Compress the build context using gzip. DEPRECATED
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: force-rm
      value_type: bool
      default_value: "true"
      description: Always remove intermediate containers. DEPRECATED
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: memory
      shorthand: m
      value_type: bytes
      default_value: "0"
      description: |
        Set memory limit for the build container. Not supported by BuildKit.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-cache
      value_type: bool
      default_value: "false"
      description: Do not use cache when building the image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-rm
      value_type: bool
      default_value: "false"
      description: |
        Do not remove intermediate containers after a successful build. DEPRECATED
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: parallel
      value_type: bool
      default_value: "true"
      description: Build images in parallel. DEPRECATED
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: progress
      value_type: string
      default_value: auto
      description: Set type of ui output (auto, tty, plain, quiet)
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: pull
      value_type: bool
      default_value: "false"
      description: Always attempt to pull a newer version of the image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: push
      value_type: bool
      default_value: "false"
      description: Push service images
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: quiet
      shorthand: q
      value_type: bool
      default_value: "false"
      description: Don't print anything to STDOUT
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: ssh
      value_type: string
      description: |
        Set SSH authentications used when building service images. (use 'default' for using your default SSH Agent)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: with-dependencies
      value_type: bool
      default_value: "false"
      description: Also build dependencies (transitively)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: dry-run
      value_type: bool
      default_value: "false"
      description: Execute command in dry run mode
      deprecated: false
      hidden: false
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
    If you change a service's `Dockerfile` or the contents of its build directory,
    run `docker compose build` to rebuild it.
usage: docker compose build [OPTIONS] [SERVICE...]
pname: docker compose
plink: docker_compose.yaml
options:
    - option: build-arg
      value_type: stringArray
      default_value: '[]'
      description: Set build-time variables for services
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: builder
      value_type: string
      description: Set builder to use
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: compress
      value_type: bool
      default_value: "true"
      description: Compress the build context using gzip. DEPRECATED
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: force-rm
      value_type: bool
      default_value: "true"
      description: Always remove intermediate containers. DEPRECATED
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: memory
      shorthand: m
      value_type: bytes
      default_value: "0"
      description: |
        Set memory limit for the build container. Not supported by BuildKit.
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-cache
      value_type: bool
      default_value: "false"
      description: Do not use cache when building the image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-rm
      value_type: bool
      default_value: "false"
      description: |
        Do not remove intermediate containers after a successful build. DEPRECATED
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: parallel
      value_type: bool
      default_value: "true"
      description: Build images in parallel. DEPRECATED
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: progress
      value_type: string
      default_value: auto
      description: Set type of ui output (auto, tty, plain, quiet)
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: pull
      value_type: bool
      default_value: "false"
      description: Always attempt to pull a newer version of the image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: push
      value_type: bool
      default_value: "false"
      description: Push service images
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: quiet
      shorthand: q
      value_type: bool
      default_value: "false"
      description: Don't print anything to STDOUT
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: ssh
      value_type: string
      description: |
        Set SSH authentications used when building service images. (use 'default' for using your default SSH Agent)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: with-dependencies
      value_type: bool
      default_value: "false"
      description: Also build dependencies (transitively)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: dry-run
      value_type: bool
      default_value: "false"
      description: Execute command in dry run mode
      deprecated: false
      hidden: false
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
