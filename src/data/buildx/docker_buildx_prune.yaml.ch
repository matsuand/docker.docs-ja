%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker buildx prune
short: Remove build cache
long: Clears the build cache of the selected builder.
usage: docker buildx prune
@y
command: docker buildx prune
short: Remove build cache
long: Clears the build cache of the selected builder.
usage: docker buildx prune
@z

% options:

@x all
      description: Include internal/frontend images
@y
      description: Include internal/frontend images
@z

@x filter
      description: Provide filter values
@y
      description: Provide filter values
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

@x max-used-space
      description: Maximum amount of disk space allowed to keep for cache
@y
      description: Maximum amount of disk space allowed to keep for cache
@z

@x min-free-space
      description: Target amount of free disk space after pruning
@y
      description: Target amount of free disk space after pruning
@z

@x reserved-space
      description: Amount of disk space always allowed to keep for cache
@y
      description: Amount of disk space always allowed to keep for cache
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

@x debug
      description: Enable debug logging
@y
      description: Enable debug logging
@z

@x
examples: |-
    ### Include internal/frontend images (--all) {#all}
@y
examples: |-
    ### Include internal/frontend images (--all) {#all}
@z

@x
    The `--all` flag to allow clearing internal helper images and frontend images
    set using the `#syntax=` directive or the `BUILDKIT_SYNTAX` build argument.
@y
    The `--all` flag to allow clearing internal helper images and frontend images
    set using the `#syntax=` directive or the `BUILDKIT_SYNTAX` build argument.
@z

@x
    ### Provide filter values (--filter) {#filter}
@y
    ### Provide filter values (--filter) {#filter}
@z

@x
    You can finely control which cache records to delete using the `--filter` flag.
@y
    You can finely control which cache records to delete using the `--filter` flag.
@z

@x
    The filter format is in the form of `<key><op><value>`, known as selectors. All
    selectors must match the target object for the filter to be true. We define the
    operators `=` for equality, `!=` for not equal and `~=` for a regular
    expression.
@y
    The filter format is in the form of `<key><op><value>`, known as selectors. All
    selectors must match the target object for the filter to be true. We define the
    operators `=` for equality, `!=` for not equal and `~=` for a regular
    expression.
@z

@x
    Valid filter keys are:
    - `until` flag to keep records that have been used in the last duration time.
      Value is a duration string, e.g. `24h` or `2h30m`, with allowable units of
      `(h)ours`, `(m)inutes` and `(s)econds`.
    - `id` flag to target a specific image ID.
    - `parents` flag to target records that are parents of the
      specified image ID. Multiple parent IDs are separated by a semicolon (`;`).
    - `description` flag to target records whose description is the specified
      substring.
    - `inuse` flag to target records that are actively in use and therefore not
      reclaimable.
    - `mutable` flag to target records that are mutable.
    - `immutable` flag to target records that are immutable.
    - `shared` flag to target records that are shared with other resources,
      typically images.
    - `private` flag to target records that are not shared.
    - `type` flag to target records by type. Valid types are:
      - `internal`
      - `frontend`
      - `source.local`
      - `source.git.checkout`
      - `exec.cachemount`
      - `regular`
@y
    Valid filter keys are:
    - `until` flag to keep records that have been used in the last duration time.
      Value is a duration string, e.g. `24h` or `2h30m`, with allowable units of
      `(h)ours`, `(m)inutes` and `(s)econds`.
    - `id` flag to target a specific image ID.
    - `parents` flag to target records that are parents of the
      specified image ID. Multiple parent IDs are separated by a semicolon (`;`).
    - `description` flag to target records whose description is the specified
      substring.
    - `inuse` flag to target records that are actively in use and therefore not
      reclaimable.
    - `mutable` flag to target records that are mutable.
    - `immutable` flag to target records that are immutable.
    - `shared` flag to target records that are shared with other resources,
      typically images.
    - `private` flag to target records that are not shared.
    - `type` flag to target records by type. Valid types are:
      - `internal`
      - `frontend`
      - `source.local`
      - `source.git.checkout`
      - `exec.cachemount`
      - `regular`
@z

@x
    Examples:
@y
    Examples:
@z

@x
    ```console
    docker buildx prune --filter "until=24h"
    docker buildx prune --filter "description~=golang"
    docker buildx prune --filter "parents=dpetmoi6n0yqanxjqrbnofz9n;kgoj0q6g57i35gdyrv546alz7"
    docker buildx prune --filter "type=source.local"
    docker buildx prune --filter "type!=exec.cachemount"
    ```
@y
    ```console
    docker buildx prune --filter "until=24h"
    docker buildx prune --filter "description~=golang"
    docker buildx prune --filter "parents=dpetmoi6n0yqanxjqrbnofz9n;kgoj0q6g57i35gdyrv546alz7"
    docker buildx prune --filter "type=source.local"
    docker buildx prune --filter "type!=exec.cachemount"
    ```
@z

@x
    > [!NOTE]
    > Multiple `--filter` flags are ANDed together.
@y
    > [!NOTE]
    > Multiple `--filter` flags are ANDed together.
@z

@x
    ### Maximum amount of disk space allowed to keep for cache (--max-used-space) {#max-used-space}
@y
    ### Maximum amount of disk space allowed to keep for cache (--max-used-space) {#max-used-space}
@z

@x
    The `--max-used-space` flag allows setting a maximum amount of disk space
    that the build cache can use. If the cache is using more disk space than this
    value, the least recently used cache records are deleted until the total
    used space is less than or equal to the specified value.
@y
    The `--max-used-space` flag allows setting a maximum amount of disk space
    that the build cache can use. If the cache is using more disk space than this
    value, the least recently used cache records are deleted until the total
    used space is less than or equal to the specified value.
@z

@x
    The value is specified in bytes. You can use a human-readable memory string,
    e.g. `128mb`, `2gb`, etc. Units are case-insensitive.
@y
    The value is specified in bytes. You can use a human-readable memory string,
    e.g. `128mb`, `2gb`, etc. Units are case-insensitive.
@z

@x
    ### Target amount of free disk space after pruning (--min-free-space) {#min-free-space}
@y
    ### Target amount of free disk space after pruning (--min-free-space) {#min-free-space}
@z

@x
    The `--min-free-space` flag allows setting a target amount of free disk space
    that should be available after pruning. If the available disk space is less
    than this value, the least recently used cache records are deleted until
    the available free space is greater than or equal to the specified value.
@y
    The `--min-free-space` flag allows setting a target amount of free disk space
    that should be available after pruning. If the available disk space is less
    than this value, the least recently used cache records are deleted until
    the available free space is greater than or equal to the specified value.
@z

@x
    The value is specified in bytes. You can use a human-readable memory string,
    e.g. `128mb`, `2gb`, etc. Units are case-insensitive.
@y
    The value is specified in bytes. You can use a human-readable memory string,
    e.g. `128mb`, `2gb`, etc. Units are case-insensitive.
@z

@x
    ### Amount of disk space always allowed to keep for cache (--reserved-space) {#reserved-space}
@y
    ### Amount of disk space always allowed to keep for cache (--reserved-space) {#reserved-space}
@z

@x
    The `--reserved-space` flag allows setting an amount of disk space that
    should always be kept for the build cache. If the available disk space is less
    than this value, the least recently used cache records are deleted until
    the available free space is greater than or equal to the specified value.
@y
    The `--reserved-space` flag allows setting an amount of disk space that
    should always be kept for the build cache. If the available disk space is less
    than this value, the least recently used cache records are deleted until
    the available free space is greater than or equal to the specified value.
@z

@x
    The value is specified in bytes. You can use a human-readable memory string,
    e.g. `128mb`, `2gb`, etc. Units are case-insensitive.
@y
    The value is specified in bytes. You can use a human-readable memory string,
    e.g. `128mb`, `2gb`, etc. Units are case-insensitive.
@z

@x
    ### Override the configured builder instance (--builder) {#builder}
@y
    ### Override the configured builder instance (--builder) {#builder}
@z

@x
    Same as [`buildx --builder`](/reference/cli/docker/buildx/#builder).
@y
    Same as [`buildx --builder`](__SUBDIR__/reference/cli/docker/buildx/#builder).
@z

% snip directives...
