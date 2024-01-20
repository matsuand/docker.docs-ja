%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker buildx debug build
aliases: docker buildx debug build, docker buildx debug b
short: Start a build
long: Start a build
usage: docker buildx debug build [OPTIONS] PATH | URL | -
pname: docker buildx debug
plink: docker_buildx_debug.yaml
options:
    - option: add-host
      value_type: stringSlice
      default_value: '[]'
      description: 'Add a custom host-to-IP mapping (format: `host:ip`)'
      details_url: /engine/reference/commandline/image_build/#add-host
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: allow
      value_type: stringSlice
      default_value: '[]'
      description: |
        Allow extra privileged entitlement (e.g., `network.host`, `security.insecure`)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: annotation
      value_type: stringArray
      default_value: '[]'
      description: Add annotation to the image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: attest
      value_type: stringArray
      default_value: '[]'
      description: 'Attestation parameters (format: `type=sbom,generator=image`)'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: build-arg
      value_type: stringArray
      default_value: '[]'
      description: Set build-time variables
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: build-context
      value_type: stringArray
      default_value: '[]'
      description: Additional build contexts (e.g., name=path)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cache-from
      value_type: stringArray
      default_value: '[]'
      description: |
        External cache sources (e.g., `user/app:cache`, `type=local,src=path/to/dir`)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cache-to
      value_type: stringArray
      default_value: '[]'
      description: |
        Cache export destinations (e.g., `user/app:cache`, `type=local,dest=path/to/dir`)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cgroup-parent
      value_type: string
      description: Set the parent cgroup for the `RUN` instructions during build
      details_url: /engine/reference/commandline/image_build/#cgroup-parent
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: compress
      value_type: bool
      default_value: "false"
      description: Compress the build context using gzip
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-period
      value_type: int64
      default_value: "0"
      description: Limit the CPU CFS (Completely Fair Scheduler) period
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-quota
      value_type: int64
      default_value: "0"
      description: Limit the CPU CFS (Completely Fair Scheduler) quota
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-shares
      shorthand: c
      value_type: int64
      default_value: "0"
      description: CPU shares (relative weight)
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpuset-cpus
      value_type: string
      description: CPUs in which to allow execution (`0-3`, `0,1`)
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpuset-mems
      value_type: string
      description: MEMs in which to allow execution (`0-3`, `0,1`)
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: detach
      value_type: bool
      default_value: "false"
      description: Detach buildx server (supported only on linux)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: true
      kubernetes: false
      swarm: false
    - option: file
      shorthand: f
      value_type: string
      description: 'Name of the Dockerfile (default: `PATH/Dockerfile`)'
      details_url: /engine/reference/commandline/image_build/#file
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: force-rm
      value_type: bool
      default_value: "false"
      description: Always remove intermediate containers
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: iidfile
      value_type: string
      description: Write the image ID to the file
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: isolation
      value_type: string
      description: Container isolation technology
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: label
      value_type: stringArray
      default_value: '[]'
      description: Set metadata for an image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: load
      value_type: bool
      default_value: "false"
      description: Shorthand for `--output=type=docker`
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: memory
      shorthand: m
      value_type: string
      description: Memory limit
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: memory-swap
      value_type: string
      description: |
        Swap limit equal to memory plus swap: `-1` to enable unlimited swap
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: metadata-file
      value_type: string
      description: Write build result metadata to the file
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: network
      value_type: string
      default_value: default
      description: Set the networking mode for the `RUN` instructions during build
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
    - option: no-cache-filter
      value_type: stringArray
      default_value: '[]'
      description: Do not cache specified stages
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: output
      shorthand: o
      value_type: stringArray
      default_value: '[]'
      description: 'Output destination (format: `type=local,dest=path`)'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: platform
      value_type: stringArray
      default_value: '[]'
      description: Set target platform for build
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: print
      value_type: string
      description: Print result of information request (e.g., outline, targets)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: true
      kubernetes: false
      swarm: false
    - option: progress
      value_type: string
      default_value: auto
      description: |
        Set type of progress output (`auto`, `plain`, `tty`). Use plain to show container output
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: provenance
      value_type: string
      description: Shorthand for `--attest=type=provenance`
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: pull
      value_type: bool
      default_value: "false"
      description: Always attempt to pull all referenced images
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: push
      value_type: bool
      default_value: "false"
      description: Shorthand for `--output=type=registry`
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
      description: Suppress the build output and print image ID on success
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: rm
      value_type: bool
      default_value: "true"
      description: Remove intermediate containers after a successful build
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: root
      value_type: string
      description: Specify root directory of server to connect
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: true
      kubernetes: false
      swarm: false
    - option: sbom
      value_type: string
      description: Shorthand for `--attest=type=sbom`
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: secret
      value_type: stringArray
      default_value: '[]'
      description: |
        Secret to expose to the build (format: `id=mysecret[,src=/local/secret]`)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: security-opt
      value_type: stringSlice
      default_value: '[]'
      description: Security options
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: server-config
      value_type: string
      description: |
        Specify buildx server config file (used only when launching new server)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: true
      kubernetes: false
      swarm: false
    - option: shm-size
      value_type: bytes
      default_value: "0"
      description: Size of `/dev/shm`
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: squash
      value_type: bool
      default_value: "false"
      description: Squash newly built layers into a single new layer
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: true
      kubernetes: false
      swarm: false
    - option: ssh
      value_type: stringArray
      default_value: '[]'
      description: |
        SSH agent socket or keys to expose to the build (format: `default|<id>[=<socket>|<key>[,<key>]]`)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: tag
      shorthand: t
      value_type: stringArray
      default_value: '[]'
      description: 'Name and optionally a tag (format: `name:tag`)'
      details_url: /engine/reference/commandline/image_build/#tag
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: target
      value_type: string
      description: Set the target build stage to build
      details_url: /engine/reference/commandline/image_build/#target
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: ulimit
      value_type: ulimit
      default_value: '[]'
      description: Ulimit options
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
      deprecated: false
      hidden: false
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
command: docker buildx debug build
aliases: docker buildx debug build, docker buildx debug b
short: Start a build
long: Start a build
usage: docker buildx debug build [OPTIONS] PATH | URL | -
pname: docker buildx debug
plink: docker_buildx_debug.yaml
options:
    - option: add-host
      value_type: stringSlice
      default_value: '[]'
      description: 'Add a custom host-to-IP mapping (format: `host:ip`)'
      details_url: /engine/reference/commandline/image_build/#add-host
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: allow
      value_type: stringSlice
      default_value: '[]'
      description: |
        Allow extra privileged entitlement (e.g., `network.host`, `security.insecure`)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: annotation
      value_type: stringArray
      default_value: '[]'
      description: Add annotation to the image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: attest
      value_type: stringArray
      default_value: '[]'
      description: 'Attestation parameters (format: `type=sbom,generator=image`)'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: build-arg
      value_type: stringArray
      default_value: '[]'
      description: Set build-time variables
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: build-context
      value_type: stringArray
      default_value: '[]'
      description: Additional build contexts (e.g., name=path)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cache-from
      value_type: stringArray
      default_value: '[]'
      description: |
        External cache sources (e.g., `user/app:cache`, `type=local,src=path/to/dir`)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cache-to
      value_type: stringArray
      default_value: '[]'
      description: |
        Cache export destinations (e.g., `user/app:cache`, `type=local,dest=path/to/dir`)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cgroup-parent
      value_type: string
      description: Set the parent cgroup for the `RUN` instructions during build
      details_url: /engine/reference/commandline/image_build/#cgroup-parent
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: compress
      value_type: bool
      default_value: "false"
      description: Compress the build context using gzip
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-period
      value_type: int64
      default_value: "0"
      description: Limit the CPU CFS (Completely Fair Scheduler) period
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-quota
      value_type: int64
      default_value: "0"
      description: Limit the CPU CFS (Completely Fair Scheduler) quota
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-shares
      shorthand: c
      value_type: int64
      default_value: "0"
      description: CPU shares (relative weight)
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpuset-cpus
      value_type: string
      description: CPUs in which to allow execution (`0-3`, `0,1`)
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpuset-mems
      value_type: string
      description: MEMs in which to allow execution (`0-3`, `0,1`)
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: detach
      value_type: bool
      default_value: "false"
      description: Detach buildx server (supported only on linux)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: true
      kubernetes: false
      swarm: false
    - option: file
      shorthand: f
      value_type: string
      description: 'Name of the Dockerfile (default: `PATH/Dockerfile`)'
      details_url: /engine/reference/commandline/image_build/#file
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: force-rm
      value_type: bool
      default_value: "false"
      description: Always remove intermediate containers
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: iidfile
      value_type: string
      description: Write the image ID to the file
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: isolation
      value_type: string
      description: Container isolation technology
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: label
      value_type: stringArray
      default_value: '[]'
      description: Set metadata for an image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: load
      value_type: bool
      default_value: "false"
      description: Shorthand for `--output=type=docker`
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: memory
      shorthand: m
      value_type: string
      description: Memory limit
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: memory-swap
      value_type: string
      description: |
        Swap limit equal to memory plus swap: `-1` to enable unlimited swap
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: metadata-file
      value_type: string
      description: Write build result metadata to the file
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: network
      value_type: string
      default_value: default
      description: Set the networking mode for the `RUN` instructions during build
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
    - option: no-cache-filter
      value_type: stringArray
      default_value: '[]'
      description: Do not cache specified stages
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: output
      shorthand: o
      value_type: stringArray
      default_value: '[]'
      description: 'Output destination (format: `type=local,dest=path`)'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: platform
      value_type: stringArray
      default_value: '[]'
      description: Set target platform for build
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: print
      value_type: string
      description: Print result of information request (e.g., outline, targets)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: true
      kubernetes: false
      swarm: false
    - option: progress
      value_type: string
      default_value: auto
      description: |
        Set type of progress output (`auto`, `plain`, `tty`). Use plain to show container output
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: provenance
      value_type: string
      description: Shorthand for `--attest=type=provenance`
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: pull
      value_type: bool
      default_value: "false"
      description: Always attempt to pull all referenced images
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: push
      value_type: bool
      default_value: "false"
      description: Shorthand for `--output=type=registry`
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
      description: Suppress the build output and print image ID on success
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: rm
      value_type: bool
      default_value: "true"
      description: Remove intermediate containers after a successful build
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: root
      value_type: string
      description: Specify root directory of server to connect
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: true
      kubernetes: false
      swarm: false
    - option: sbom
      value_type: string
      description: Shorthand for `--attest=type=sbom`
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: secret
      value_type: stringArray
      default_value: '[]'
      description: |
        Secret to expose to the build (format: `id=mysecret[,src=/local/secret]`)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: security-opt
      value_type: stringSlice
      default_value: '[]'
      description: Security options
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: server-config
      value_type: string
      description: |
        Specify buildx server config file (used only when launching new server)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: true
      kubernetes: false
      swarm: false
    - option: shm-size
      value_type: bytes
      default_value: "0"
      description: Size of `/dev/shm`
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: squash
      value_type: bool
      default_value: "false"
      description: Squash newly built layers into a single new layer
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: true
      kubernetes: false
      swarm: false
    - option: ssh
      value_type: stringArray
      default_value: '[]'
      description: |
        SSH agent socket or keys to expose to the build (format: `default|<id>[=<socket>|<key>[,<key>]]`)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: tag
      shorthand: t
      value_type: stringArray
      default_value: '[]'
      description: 'Name and optionally a tag (format: `name:tag`)'
      details_url: /engine/reference/commandline/image_build/#tag
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: target
      value_type: string
      description: Set the target build stage to build
      details_url: /engine/reference/commandline/image_build/#target
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: ulimit
      value_type: ulimit
      default_value: '[]'
      description: Ulimit options
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
      deprecated: false
      hidden: false
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
