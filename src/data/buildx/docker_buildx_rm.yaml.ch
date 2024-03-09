%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker buildx rm
short: Remove one or more builder instances
long: |-
    Removes the specified or current builder. It is a no-op attempting to remove the
    default builder.
usage: docker buildx rm [OPTIONS] [NAME] [NAME...]
@y
command: docker buildx rm
short: Remove one or more builder instances
long: |-
    Removes the specified or current builder. It is a no-op attempting to remove the
    default builder.
usage: docker buildx rm [OPTIONS] [NAME] [NAME...]
@z

% options:

@x all-inactive
      description: Remove all inactive builders
@y
      description: Remove all inactive builders
@z

@x force
      description: Do not prompt for confirmation
@y
      description: Do not prompt for confirmation
@z

@x keep-daemon
      description: Keep the BuildKit daemon running
@y
      description: Keep the BuildKit daemon running
@z

@x keep-state
      description: Keep BuildKit state
@y
      description: Keep BuildKit state
@z

% inherited_options:

@x builder
      description: Override the configured builder instance
@y
      description: Override the configured builder instance
@z

@x
examples: |-
    ### Remove all inactive builders (--all-inactive) {#all-inactive}
@y
examples: |-
    ### Remove all inactive builders (--all-inactive) {#all-inactive}
@z

@x
    Remove builders that are not in running state.
@y
    Remove builders that are not in running state.
@z

% snip command...

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

@x
    ### Do not prompt for confirmation (--force) {#force}
@y
    ### Do not prompt for confirmation (--force) {#force}
@z

@x
    Do not prompt for confirmation before removing inactive builders.
@y
    Do not prompt for confirmation before removing inactive builders.
@z

% snip command...

@x
    ### Keep the BuildKit daemon running (--keep-daemon) {#keep-daemon}
@y
    ### Keep the BuildKit daemon running (--keep-daemon) {#keep-daemon}
@z

@x
    Keep the BuildKit daemon running after the buildx context is removed. This is
    useful when you manage BuildKit daemons and buildx contexts independently.
    Only supported by the
    [`docker-container`](/build/drivers/docker-container/)
    and [`kubernetes`](/build/drivers/kubernetes/) drivers.
@y
    Keep the BuildKit daemon running after the buildx context is removed. This is
    useful when you manage BuildKit daemons and buildx contexts independently.
    Only supported by the
    [`docker-container`](__SUBDIR__/build/drivers/docker-container/)
    and [`kubernetes`](__SUBDIR__/build/drivers/kubernetes/) drivers.
@z

@x
    ### Keep BuildKit state (--keep-state) {#keep-state}
@y
    ### Keep BuildKit state (--keep-state) {#keep-state}
@z

@x
    Keep BuildKit state, so it can be reused by a new builder with the same name.
    Currently, only supported by the [`docker-container` driver](/build/drivers/docker-container/).
@y
    Keep BuildKit state, so it can be reused by a new builder with the same name.
    Currently, only supported by the [`docker-container` driver](__SUBDIR__/build/drivers/docker-container/).
@z

% snip directives...
