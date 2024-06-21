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
short: 新規ビルダーインスタンスの生成
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
@y
    Builder instances are isolated environments where builds can be invoked. All
    Docker contexts also get the default builder instance.
@z

@x
usage: docker buildx create [OPTIONS] [CONTEXT|ENDPOINT]
@y
usage: docker buildx create [OPTIONS] [CONTEXT|ENDPOINT]
@z

% options:

@x append
      description: Append a node to builder instead of changing it
@y
      description: Append a node to builder instead of changing it
@z

@x bootstrap
      description: Boot builder after creation
@y
      description: Boot builder after creation
@z

% builder ?

@x buildkitd-flags
      description: BuildKit daemon flags
@y
      description: BuildKit daemon flags
@z

@x config
      description: BuildKit daemon config file
@y
      description: BuildKit daemon config file
@z

@x driver
      description: |
        Driver to use (available: `docker-container`, `kubernetes`, `remote`)
@y
      description: |
        Driver to use (available: `docker-container`, `kubernetes`, `remote`)
@z

@x driver-opt
      description: Options for the driver
@y
      description: Options for the driver
@z

@x leave
      description: Remove a node from builder instead of changing it
@y
      description: Remove a node from builder instead of changing it
@z

@x name
      description: Builder instance name
@y
      description: Builder instance name
@z

@x node
      description: Create/modify node with given name
@y
      description: Create/modify node with given name
@z

@x platform
      description: Fixed platforms for current node
@y
      description: Fixed platforms for current node
@z

@x use
      description: Set the current builder instance
@y
      description: Set the current builder instance
@z

@x
examples: |-
    ### Append a new node to an existing builder (--append) {#append}
@y
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

% snip command...

@x
    ### Specify a configuration file for the BuildKit daemon (--buildkitd-config) {#buildkitd-config}
@y
    ### Specify a configuration file for the BuildKit daemon (--buildkitd-config) {#buildkitd-config}
@z

% snip code...

@x
    Specifies the configuration file for the BuildKit daemon to use. The
    configuration can be overridden by [`--buildkitd-flags`](#buildkitd-flags).
    See an [example BuildKit daemon configuration file](https://github.com/moby/buildkit/blob/master/docs/buildkitd.toml.md).
@y
    Specifies the configuration file for the BuildKit daemon to use. The
    configuration can be overridden by [`--buildkitd-flags`](#buildkitd-flags).
    See an [example BuildKit daemon configuration file](https://github.com/moby/buildkit/blob/master/docs/buildkitd.toml.md).
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
    ### Specify options for the BuildKit daemon (--buildkitd-flags) {#buildkitd-flags}
@y
    ### Specify options for the BuildKit daemon (--buildkitd-flags) {#buildkitd-flags}
@z

% snip code...

@x
    Adds flags when starting the BuildKit daemon. They take precedence over the
    configuration file specified by [`--buildkitd-config`](#buildkitd-config). See
    `buildkitd --help` for the available flags.
@y
    Adds flags when starting the BuildKit daemon. They take precedence over the
    configuration file specified by [`--buildkitd-config`](#buildkitd-config). See
    `buildkitd --help` for the available flags.
@z

% snip code...

@x
    #### BuildKit daemon network mode
@y
    #### BuildKit daemon network mode
@z

@x
    You can specify the network mode for the BuildKit daemon with either the
    configuration file specified by [`--buildkitd-config`](#buildkitd-config) using the
    `worker.oci.networkMode` option or `--oci-worker-net` flag here. The default
    value is `auto` and can be one of `bridge`, `cni`, `host`:
@y
    You can specify the network mode for the BuildKit daemon with either the
    configuration file specified by [`--buildkitd-config`](#buildkitd-config) using the
    `worker.oci.networkMode` option or `--oci-worker-net` flag here. The default
    value is `auto` and can be one of `bridge`, `cni`, `host`:
@z

% snip code...

@x
    > **Note**
    >
    > Network mode "bridge" is supported since BuildKit v0.13 and will become the
    > default in next v0.14.
@y
    > **Note**
    >
    > Network mode "bridge" is supported since BuildKit v0.13 and will become the
    > default in next v0.14.
@z

@x
    ### Set the builder driver to use (--driver) {#driver}
@y
    ### Set the builder driver to use (--driver) {#driver}
@z

% snip code...

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
    Uses a remote instance of BuildKit daemon over an arbitrary connection. With
    this driver, you manually create and manage instances of buildkit yourself, and
    configure buildx to point at it.
@y
    Uses a remote instance of BuildKit daemon over an arbitrary connection. With
    this driver, you manually create and manage instances of buildkit yourself, and
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

% snip code...

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

% snip command...

@x
    ### Specify the name of the builder (--name) {#name}
@y
    ### Specify the name of the builder (--name) {#name}
@z

% snip code...

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

% snip code...

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

% snip code...

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

% snip command...

@x
    ### Automatically switch to the newly created builder (--use) {#use}
@y
    ### Automatically switch to the newly created builder (--use) {#use}
@z

@x
    The `--use` flag automatically switches the current builder to the newly created
    one. Equivalent to running `docker buildx use $(docker buildx create ...)`.
@y
    The `--use` flag automatically switches the current builder to the newly created
    one. Equivalent to running `docker buildx use $(docker buildx create ...)`.
@z

% snip directives...
