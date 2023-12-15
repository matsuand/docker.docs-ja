%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker buildx prune
short: Remove build cache
long: |-
    Clears the build cache of the selected builder.
@y
command: docker buildx prune
short: Remove build cache
long: |-
    Clears the build cache of the selected builder.
@z

@x
    You can finely control what cache data is kept using:
@y
    You can finely control what cache data is kept using:
@z

@x
    - The `--filter=until=<duration>` flag to keep images that have been used in
      the last `<duration>` time.
@y
    - The `--filter=until=<duration>` flag to keep images that have been used in
      the last `<duration>` time.
@z

@x
      `<duration>` is a duration string, e.g. `24h` or `2h30m`, with allowable
      units of `(h)ours`, `(m)inutes` and `(s)econds`.
@y
      `<duration>` is a duration string, e.g. `24h` or `2h30m`, with allowable
      units of `(h)ours`, `(m)inutes` and `(s)econds`.
@z

@x
    - The `--keep-storage=<size>` flag to keep `<size>` bytes of data in the cache.
@y
    - The `--keep-storage=<size>` flag to keep `<size>` bytes of data in the cache.
@z

@x
      `<size>` is a human-readable memory string, e.g. `128mb`, `2gb`, etc. Units
      are case-insensitive.
@y
      `<size>` is a human-readable memory string, e.g. `128mb`, `2gb`, etc. Units
      are case-insensitive.
@z

@x
    - The `--all` flag to allow clearing internal helper images and frontend images
      set using the `#syntax=` directive or the `BUILDKIT_SYNTAX` build argument.
usage: docker buildx prune
pname: docker buildx
plink: docker_buildx.yaml
options:
    - option: all
      shorthand: a
      value_type: bool
      default_value: "false"
      description: Include internal/frontend images
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: filter
      value_type: filter
      description: Provide filter values (e.g., `until=24h`)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: force
      shorthand: f
      value_type: bool
      default_value: "false"
      description: Do not prompt for confirmation
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: keep-storage
      value_type: bytes
      default_value: "0"
      description: Amount of disk space to keep for cache
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: verbose
      value_type: bool
      default_value: "false"
      description: Provide a more verbose output
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
    - The `--all` flag to allow clearing internal helper images and frontend images
      set using the `#syntax=` directive or the `BUILDKIT_SYNTAX` build argument.
usage: docker buildx prune
pname: docker buildx
plink: docker_buildx.yaml
options:
    - option: all
      shorthand: a
      value_type: bool
      default_value: "false"
      description: Include internal/frontend images
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: filter
      value_type: filter
      description: Provide filter values (e.g., `until=24h`)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: force
      shorthand: f
      value_type: bool
      default_value: "false"
      description: Do not prompt for confirmation
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: keep-storage
      value_type: bytes
      default_value: "0"
      description: Amount of disk space to keep for cache
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: verbose
      value_type: bool
      default_value: "false"
      description: Provide a more verbose output
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
