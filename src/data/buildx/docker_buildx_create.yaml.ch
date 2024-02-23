%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker buildx create
short: Create a new builder instance
long: |-
    Create makes a new builder instance pointing to a Docker context or endpoint,
    where context is the name of a context from `docker context ls` and endpoint is
    the address for Docker socket (eg. `DOCKER_HOST` value).
@y
command: docker buildx create
short: Create a new builder instance
long: |-
    Create makes a new builder instance pointing to a Docker context or endpoint,
    where context is the name of a context from `docker context ls` and endpoint is
    the address for Docker socket (eg. `DOCKER_HOST` value).
@z

@x
    By default, the current Docker configuration is used for determining the
    context/endpoint value.
@y
    By default, the current Docker configuration is used for determining the
    context/endpoint value.
@z

@x
    Builder instances are isolated environments where builds can be invoked. All
    Docker contexts also get the default builder instance.
usage: docker buildx create [OPTIONS] [CONTEXT|ENDPOINT]
pname: docker buildx
plink: docker_buildx.yaml
options:
    - option: append
      value_type: bool
      default_value: "false"
      description: Append a node to builder instead of changing it
      details_url: '#append'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: bootstrap
      value_type: bool
      default_value: "false"
      description: Boot builder after creation
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: builder
      value_type: string
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: buildkitd-flags
      value_type: string
      description: Flags for buildkitd daemon
      details_url: '#buildkitd-flags'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: config
      value_type: string
      description: BuildKit config file
      details_url: '#config'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: driver
      value_type: string
      description: |
        Driver to use (available: `docker-container`, `kubernetes`, `remote`)
      details_url: '#driver'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: driver-opt
      value_type: stringArray
      default_value: '[]'
      description: Options for the driver
      details_url: '#driver-opt'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: leave
      value_type: bool
      default_value: "false"
      description: Remove a node from builder instead of changing it
      details_url: '#leave'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: name
      value_type: string
      description: Builder instance name
      details_url: '#name'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: node
      value_type: string
      description: Create/modify node with given name
      details_url: '#node'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: platform
      value_type: stringArray
      default_value: '[]'
      description: Fixed platforms for current node
      details_url: '#platform'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: use
      value_type: bool
      default_value: "false"
      description: Set the current builder instance
      details_url: '#use'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Append a new node to an existing builder (--append) {#append}
@y
    Builder instances are isolated environments where builds can be invoked. All
    Docker contexts also get the default builder instance.
usage: docker buildx create [OPTIONS] [CONTEXT|ENDPOINT]
pname: docker buildx
plink: docker_buildx.yaml
options:
    - option: append
      value_type: bool
      default_value: "false"
      description: Append a node to builder instead of changing it
      details_url: '#append'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: bootstrap
      value_type: bool
      default_value: "false"
      description: Boot builder after creation
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: builder
      value_type: string
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: buildkitd-flags
      value_type: string
      description: Flags for buildkitd daemon
      details_url: '#buildkitd-flags'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: config
      value_type: string
      description: BuildKit config file
      details_url: '#config'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: driver
      value_type: string
      description: |
        Driver to use (available: `docker-container`, `kubernetes`, `remote`)
      details_url: '#driver'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: driver-opt
      value_type: stringArray
      default_value: '[]'
      description: Options for the driver
      details_url: '#driver-opt'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: leave
      value_type: bool
      default_value: "false"
      description: Remove a node from builder instead of changing it
      details_url: '#leave'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: name
      value_type: string
      description: Builder instance name
      details_url: '#name'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: node
      value_type: string
      description: Create/modify node with given name
      details_url: '#node'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: platform
      value_type: stringArray
      default_value: '[]'
      description: Fixed platforms for current node
      details_url: '#platform'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: use
      value_type: bool
      default_value: "false"
      description: Set the current builder instance
      details_url: '#use'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Append a new node to an existing builder (--append) {#append}
@z

@x
    The `--append` flag changes the action of the command to append a new node to an
    existing builder specified by `--name`. Buildx will choose an appropriate node
    for a build based on the platforms it supports.
@y
    The `--append` flag changes the action of the command to append a new node to an
    existing builder specified by `--name`. Buildx will choose an appropriate node
    for a build based on the platforms it supports.
@z

@x
    ```console
    $ docker buildx create mycontext1
    eager_beaver
@y
    ```console
    $ docker buildx create mycontext1
    eager_beaver
@z

@x
    $ docker buildx create --name eager_beaver --append mycontext2
    eager_beaver
    ```
@y
    $ docker buildx create --name eager_beaver --append mycontext2
    eager_beaver
    ```
@z

@x
    ### Specify options for the buildkitd daemon (--buildkitd-flags) {#buildkitd-flags}
@y
    ### Specify options for the buildkitd daemon (--buildkitd-flags) {#buildkitd-flags}
@z

@x
    ```text
    --buildkitd-flags FLAGS
    ```
@y
    ```text
    --buildkitd-flags FLAGS
    ```
@z

@x
    Adds flags when starting the buildkitd daemon. They take precedence over the
    configuration file specified by [`--config`](#config). See `buildkitd --help`
    for the available flags.
@y
    Adds flags when starting the buildkitd daemon. They take precedence over the
    configuration file specified by [`--config`](#config). See `buildkitd --help`
    for the available flags.
@z

@x
    ```text
    --buildkitd-flags '--debug --debugaddr 0.0.0.0:6666'
    ```
@y
    ```text
    --buildkitd-flags '--debug --debugaddr 0.0.0.0:6666'
    ```
@z

@x
    ### Specify a configuration file for the buildkitd daemon (--config) {#config}
@y
    ### Specify a configuration file for the buildkitd daemon (--config) {#config}
@z

@x
    ```text
    --config FILE
    ```
@y
    ```text
    --config FILE
    ```
@z

@x
    Specifies the configuration file for the buildkitd daemon to use. The configuration
    can be overridden by [`--buildkitd-flags`](#buildkitd-flags).
    See an [example buildkitd configuration file](https://github.com/moby/buildkit/blob/master/docs/buildkitd.toml.md).
@y
    Specifies the configuration file for the buildkitd daemon to use. The configuration
    can be overridden by [`--buildkitd-flags`](#buildkitd-flags).
    See an [example buildkitd configuration file](https://github.com/moby/buildkit/blob/master/docs/buildkitd.toml.md).
@z

@x
    If you don't specify a configuration file, Buildx looks for one by default in:
@y
    If you don't specify a configuration file, Buildx looks for one by default in:
@z

@x
    * `$BUILDX_CONFIG/buildkitd.default.toml`
    * `$DOCKER_CONFIG/buildx/buildkitd.default.toml`
    * `~/.docker/buildx/buildkitd.default.toml`
@y
    * `$BUILDX_CONFIG/buildkitd.default.toml`
    * `$DOCKER_CONFIG/buildx/buildkitd.default.toml`
    * `~/.docker/buildx/buildkitd.default.toml`
@z

@x
    Note that if you create a `docker-container` builder and have specified
    certificates for registries in the `buildkitd.toml` configuration, the files
    will be copied into the container under `/etc/buildkit/certs` and configuration
    will be updated to reflect that.
@y
    Note that if you create a `docker-container` builder and have specified
    certificates for registries in the `buildkitd.toml` configuration, the files
    will be copied into the container under `/etc/buildkit/certs` and configuration
    will be updated to reflect that.
@z

@x
    ### Set the builder driver to use (--driver) {#driver}
@y
    ### Set the builder driver to use (--driver) {#driver}
@z

@x
    ```text
    --driver DRIVER
    ```
@y
    ```text
    --driver DRIVER
    ```
@z

@x
    Sets the builder driver to be used. A driver is a configuration of a BuildKit
    backend. Buildx supports the following drivers:
@y
    Sets the builder driver to be used. A driver is a configuration of a BuildKit
    backend. Buildx supports the following drivers:
@z

@x
    * `docker` (default)
    * `docker-container`
    * `kubernetes`
    * `remote`
@y
    * `docker` (default)
    * `docker-container`
    * `kubernetes`
    * `remote`
@z

@x
    For more information about build drivers, see [here](/build/drivers/).
@y
    For more information about build drivers, see [here](__SUBDIR__/build/drivers/).
@z

@x
    #### `docker` driver
@y
    #### `docker` driver
@z

@x
    Uses the builder that is built into the Docker daemon. With this driver,
    the [`--load`](/reference/cli/docker/buildx/build/#load) flag is implied by default on
    `buildx build`. However, building multi-platform images or exporting cache is
    not currently supported.
@y
    Uses the builder that is built into the Docker daemon. With this driver,
    the [`--load`](__SUBDIR__/reference/cli/docker/buildx/build/#load) flag is implied by default on
    `buildx build`. However, building multi-platform images or exporting cache is
    not currently supported.
@z

@x
    #### `docker-container` driver
@y
    #### `docker-container` driver
@z

@x
    Uses a BuildKit container that will be spawned via Docker. With this driver,
    both building multi-platform images and exporting cache are supported.
@y
    Uses a BuildKit container that will be spawned via Docker. With this driver,
    both building multi-platform images and exporting cache are supported.
@z

@x
    Unlike `docker` driver, built images will not automatically appear in
    `docker images` and [`build --load`](/reference/cli/docker/buildx/build/#load) needs to be used
    to achieve that.
@y
    Unlike `docker` driver, built images will not automatically appear in
    `docker images` and [`build --load`](__SUBDIR__/reference/cli/docker/buildx/build/#load) needs to be used
    to achieve that.
@z

@x
    #### `kubernetes` driver
@y
    #### `kubernetes` driver
@z

@x
    Uses Kubernetes pods. With this driver, you can spin up pods with defined
    BuildKit container image to build your images.
@y
    Uses Kubernetes pods. With this driver, you can spin up pods with defined
    BuildKit container image to build your images.
@z

@x
    Unlike `docker` driver, built images will not automatically appear in
    `docker images` and [`build --load`](/reference/cli/docker/buildx/build/#load) needs to be used
    to achieve that.
@y
    Unlike `docker` driver, built images will not automatically appear in
    `docker images` and [`build --load`](__SUBDIR__/reference/cli/docker/buildx/build/#load) needs to be used
    to achieve that.
@z

@x
    #### `remote` driver
@y
    #### `remote` driver
@z

@x
    Uses a remote instance of buildkitd over an arbitrary connection. With this
    driver, you manually create and manage instances of buildkit yourself, and
    configure buildx to point at it.
@y
    Uses a remote instance of buildkitd over an arbitrary connection. With this
    driver, you manually create and manage instances of buildkit yourself, and
    configure buildx to point at it.
@z

@x
    Unlike `docker` driver, built images will not automatically appear in
    `docker images` and [`build --load`](/reference/cli/docker/buildx/build/#load) needs to be used
    to achieve that.
@y
    Unlike `docker` driver, built images will not automatically appear in
    `docker images` and [`build --load`](__SUBDIR__/reference/cli/docker/buildx/build/#load) needs to be used
    to achieve that.
@z

@x
    ### Set additional driver-specific options (--driver-opt) {#driver-opt}
@y
    ### Set additional driver-specific options (--driver-opt) {#driver-opt}
@z

@x
    ```text
    --driver-opt OPTIONS
    ```
@y
    ```text
    --driver-opt OPTIONS
    ```
@z

@x
    Passes additional driver-specific options.
    For information about available driver options, refer to the detailed
    documentation for the specific driver:
@y
    Passes additional driver-specific options.
    For information about available driver options, refer to the detailed
    documentation for the specific driver:
@z

@x
    * [`docker` driver](/build/drivers/docker/)
    * [`docker-container` driver](/build/drivers/docker-container/)
    * [`kubernetes` driver](/build/drivers/kubernetes/)
    * [`remote` driver](/build/drivers/remote/)
@y
    * [`docker` driver](__SUBDIR__/build/drivers/docker/)
    * [`docker-container` driver](__SUBDIR__/build/drivers/docker-container/)
    * [`kubernetes` driver](__SUBDIR__/build/drivers/kubernetes/)
    * [`remote` driver](__SUBDIR__/build/drivers/remote/)
@z

@x
    ### Remove a node from a builder (--leave) {#leave}
@y
    ### Remove a node from a builder (--leave) {#leave}
@z

@x
    The `--leave` flag changes the action of the command to remove a node from a
    builder. The builder needs to be specified with `--name` and node that is removed
    is set with `--node`.
@y
    The `--leave` flag changes the action of the command to remove a node from a
    builder. The builder needs to be specified with `--name` and node that is removed
    is set with `--node`.
@z

@x
    ```console
    $ docker buildx create --name mybuilder --node mybuilder0 --leave
    ```
@y
    ```console
    $ docker buildx create --name mybuilder --node mybuilder0 --leave
    ```
@z

@x
    ### Specify the name of the builder (--name) {#name}
@y
    ### Specify the name of the builder (--name) {#name}
@z

@x
    ```text
    --name NAME
    ```
@y
    ```text
    --name NAME
    ```
@z

@x
    The `--name` flag specifies the name of the builder to be created or modified.
    If none is specified, one will be automatically generated.
@y
    The `--name` flag specifies the name of the builder to be created or modified.
    If none is specified, one will be automatically generated.
@z

@x
    ### Specify the name of the node (--node) {#node}
@y
    ### Specify the name of the node (--node) {#node}
@z

@x
    ```text
    --node NODE
    ```
@y
    ```text
    --node NODE
    ```
@z

@x
    The `--node` flag specifies the name of the node to be created or modified. If
    you don't specify a name, the node name defaults to the name of the builder it
    belongs to, with an index number suffix.
@y
    The `--node` flag specifies the name of the node to be created or modified. If
    you don't specify a name, the node name defaults to the name of the builder it
    belongs to, with an index number suffix.
@z

@x
    ### Set the platforms supported by the node (--platform) {#platform}
@y
    ### Set the platforms supported by the node (--platform) {#platform}
@z

@x
    ```text
    --platform PLATFORMS
    ```
@y
    ```text
    --platform PLATFORMS
    ```
@z

@x
    The `--platform` flag sets the platforms supported by the node. It expects a
    comma-separated list of platforms of the form OS/architecture/variant. The node
    will also automatically detect the platforms it supports, but manual values take
    priority over the detected ones and can be used when multiple nodes support
    building for the same platform.
@y
    The `--platform` flag sets the platforms supported by the node. It expects a
    comma-separated list of platforms of the form OS/architecture/variant. The node
    will also automatically detect the platforms it supports, but manual values take
    priority over the detected ones and can be used when multiple nodes support
    building for the same platform.
@z

@x
    ```console
    $ docker buildx create --platform linux/amd64
    $ docker buildx create --platform linux/arm64,linux/arm/v7
    ```
@y
    ```console
    $ docker buildx create --platform linux/amd64
    $ docker buildx create --platform linux/arm64,linux/arm/v7
    ```
@z

@x
    ### Automatically switch to the newly created builder (--use) {#use}
@y
    ### Automatically switch to the newly created builder (--use) {#use}
@z

@x
    The `--use` flag automatically switches the current builder to the newly created
    one. Equivalent to running `docker buildx use $(docker buildx create ...)`.
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    The `--use` flag automatically switches the current builder to the newly created
    one. Equivalent to running `docker buildx use $(docker buildx create ...)`.
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
