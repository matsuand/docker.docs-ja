%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

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
@y
    - The `--all` flag to allow clearing internal helper images and frontend images
      set using the `#syntax=` directive or the `BUILDKIT_SYNTAX` build argument.
@z

@x
usage: docker buildx prune
@y
usage: docker buildx prune
@z

% options:

@x all
      description: Include internal/frontend images
@y
      description: Include internal/frontend images
@z

@x filter
      description: Provide filter values (e.g., `until=24h`)
@y
      description: Provide filter values (e.g., `until=24h`)
@z

@x force
      description: Do not prompt for confirmation
@y
      description: Do not prompt for confirmation
@z

@x keep-storage
      description: Amount of disk space to keep for cache
@y
      description: Amount of disk space to keep for cache
@z

@x verbose
      description: Provide a more verbose output
@y
      description: Provide a more verbose output
@z

% inherited_options:

@x builder
      description: Override the configured builder instance
@y
      description: Override the configured builder instance
@z

@xexamples: |-
    ### Override the configured builder instance (--builder) {#builder}

    Same as [`buildx --builder`](/reference/cli/docker/buildx/#builder).
@y
examples: |-
    ### Override the configured builder instance (--builder) {#builder}

    Same as [`buildx --builder`](__SUBDIR__/reference/cli/docker/buildx/#builder).
@z

% snip directives...
