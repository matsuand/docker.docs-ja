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
pname: docker buildx
plink: docker_buildx.yaml
options:
    - option: all-inactive
      value_type: bool
      default_value: "false"
      description: Remove all inactive builders
      details_url: '#all-inactive'
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
      details_url: '#force'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: keep-daemon
      value_type: bool
      default_value: "false"
      description: Keep the buildkitd daemon running
      details_url: '#keep-daemon'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: keep-state
      value_type: bool
      default_value: "false"
      description: Keep BuildKit state
      details_url: '#keep-state'
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
    ### Remove all inactive builders (--all-inactive) {#all-inactive}
@y
command: docker buildx rm
short: Remove one or more builder instances
long: |-
    Removes the specified or current builder. It is a no-op attempting to remove the
    default builder.
usage: docker buildx rm [OPTIONS] [NAME] [NAME...]
pname: docker buildx
plink: docker_buildx.yaml
options:
    - option: all-inactive
      value_type: bool
      default_value: "false"
      description: Remove all inactive builders
      details_url: '#all-inactive'
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
      details_url: '#force'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: keep-daemon
      value_type: bool
      default_value: "false"
      description: Keep the buildkitd daemon running
      details_url: '#keep-daemon'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: keep-state
      value_type: bool
      default_value: "false"
      description: Keep BuildKit state
      details_url: '#keep-state'
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
    ### Remove all inactive builders (--all-inactive) {#all-inactive}
@z

@x
    Remove builders that are not in running state.
@y
    Remove builders that are not in running state.
@z

@x
    ```console
    $ docker buildx rm --all-inactive
    WARNING! This will remove all builders that are not in running state. Are you sure you want to continue? [y/N] y
    ```
@y
    ```console
    $ docker buildx rm --all-inactive
    WARNING! This will remove all builders that are not in running state. Are you sure you want to continue? [y/N] y
    ```
@z

@x
    ### Override the configured builder instance (--builder) {#builder}
@y
    ### Override the configured builder instance (--builder) {#builder}
@z

@x
    Same as [`buildx --builder`](buildx.md#builder).
@y
    Same as [`buildx --builder`](buildx.md#builder).
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

@x
    ```console
    $ docker buildx rm --all-inactive --force
    ```
@y
    ```console
    $ docker buildx rm --all-inactive --force
    ```
@z

@x
    ### Keep the buildkitd daemon running (--keep-daemon) {#keep-daemon}
@y
    ### Keep the buildkitd daemon running (--keep-daemon) {#keep-daemon}
@z

@x
    Keep the BuildKit daemon running after the buildx context is removed. This is
    useful when you manage buildkitd daemons and buildx contexts independently.
    Only supported by the
    [`docker-container`](/build/drivers/docker-container/)
    and [`kubernetes`](/build/drivers/kubernetes/) drivers.
@y
    Keep the BuildKit daemon running after the buildx context is removed. This is
    useful when you manage buildkitd daemons and buildx contexts independently.
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
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    Keep BuildKit state, so it can be reused by a new builder with the same name.
    Currently, only supported by the [`docker-container` driver](__SUBDIR__/build/drivers/docker-container/).
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
