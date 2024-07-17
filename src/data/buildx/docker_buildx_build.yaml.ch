%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker buildx build
aliases: docker build, docker builder build, docker image build, docker buildx b
short: Start a build
long: The `docker buildx build` command starts a build using BuildKit.
@y
command: docker buildx build
aliases: docker build, docker builder build, docker image build, docker buildx b
short: ビルドの開始
long: The `docker buildx build` command starts a build using BuildKit.
@z

@x
usage: docker buildx build [OPTIONS] PATH | URL | -
@y
usage: docker buildx build [OPTIONS] PATH | URL | -
@z

% options:

@x add-host
      description: 'Add a custom host-to-IP mapping (format: `host:ip`)'
@y
      description: 'Add a custom host-to-IP mapping (format: `host:ip`)'
@z

@x allow
      description: |
        Allow extra privileged entitlement (e.g., `network.host`, `security.insecure`)
@y
      description: |
        Allow extra privileged entitlement (e.g., `network.host`, `security.insecure`)
@z

@x annotation
      description: Add annotation to the image
@y
      description: Add annotation to the image
@z

@x attest
      description: 'Attestation parameters (format: `type=sbom,generator=image`)'
@y
      description: 'Attestation parameters (format: `type=sbom,generator=image`)'
@z

@x build-arg
      description: Set build-time variables
@y
      description: Set build-time variables
@z

@x build-context
      description: Additional build contexts (e.g., name=path)
@y
      description: Additional build contexts (e.g., name=path)
@z

@x cache-from
      description: |
        External cache sources (e.g., `user/app:cache`, `type=local,src=path/to/dir`)
@y
      description: |
        External cache sources (e.g., `user/app:cache`, `type=local,src=path/to/dir`)
@z

@x cache-to
      description: |
        Cache export destinations (e.g., `user/app:cache`, `type=local,dest=path/to/dir`)
@y
      description: |
        Cache export destinations (e.g., `user/app:cache`, `type=local,dest=path/to/dir`)
@z

@x cgroup-parent
      description: Set the parent cgroup for the `RUN` instructions during build
@y
      description: Set the parent cgroup for the `RUN` instructions during build
@z

@x compress
      description: Compress the build context using gzip
@y
      description: Compress the build context using gzip
@z

@x cpu-period
      description: Limit the CPU CFS (Completely Fair Scheduler) period
@y
      description: Limit the CPU CFS (Completely Fair Scheduler) period
@z

@x cpu-quota
      description: Limit the CPU CFS (Completely Fair Scheduler) quota
@y
      description: Limit the CPU CFS (Completely Fair Scheduler) quota
@z

@x cpu-shares
      description: CPU shares (relative weight)
@y
      description: CPU shares (relative weight)
@z

@x cpuset-cpus
      description: CPUs in which to allow execution (`0-3`, `0,1`)
@y
      description: CPUs in which to allow execution (`0-3`, `0,1`)
@z

@x cpuset-mems
      description: MEMs in which to allow execution (`0-3`, `0,1`)
@y
      description: MEMs in which to allow execution (`0-3`, `0,1`)
@z

@x detach
      description: Detach buildx server (supported only on linux)
@y
      description: Detach buildx server (supported only on linux)
@z

@x file
      description: 'Name of the Dockerfile (default: `PATH/Dockerfile`)'
@y
      description: 'Name of the Dockerfile (default: `PATH/Dockerfile`)'
@z

@x force-rm
      description: Always remove intermediate containers
@y
      description: Always remove intermediate containers
@z

@x iidfile
      description: Write the image ID to a file
@y
      description: Write the image ID to a file
@z

@x isolation
      description: Container isolation technology
@y
      description: Container isolation technology
@z

@x label
      description: Set metadata for an image
@y
      description: Set metadata for an image
@z

@x load
      description: Shorthand for `--output=type=docker`
@y
      description: Shorthand for `--output=type=docker`
@z

@x memory
      description: Memory limit
@y
      description: Memory limit
@z

@x memory-swap
      description: |
        Swap limit equal to memory plus swap: `-1` to enable unlimited swap
@y
      description: |
        Swap limit equal to memory plus swap: `-1` to enable unlimited swap
@z

@x metadata-file
      description: Write build result metadata to a file
@y
      description: Write build result metadata to a file
@z

@x network
      description: Set the networking mode for the `RUN` instructions during build
@y
      description: Set the networking mode for the `RUN` instructions during build
@z

@x no-cache
      description: Do not use cache when building the image
@y
      description: Do not use cache when building the image
@z

@x no-cache-filter
      description: Do not cache specified stages
@y
      description: Do not cache specified stages
@z

@x output
      description: 'Output destination (format: `type=local,dest=path`)'
@y
      description: 'Output destination (format: `type=local,dest=path`)'
@z

@x platform
      description: Set target platform for build
@y
      description: Set target platform for build
@z

@x print
      description: Print result of information request (e.g., outline, targets)
@y
      description: Print result of information request (e.g., outline, targets)
@z

@x progress
      description: |
        Set type of progress output (`auto`, `plain`, `tty`, `rawjson`). Use plain to show container output
@y
      description: |
        Set type of progress output (`auto`, `plain`, `tty`, `rawjson`). Use plain to show container output
@z

@x provenance
      description: Shorthand for `--attest=type=provenance`
@y
      description: Shorthand for `--attest=type=provenance`
@z

@x pull
      description: Always attempt to pull all referenced images
@y
      description: Always attempt to pull all referenced images
@z

@x push
      description: Shorthand for `--output=type=registry`
@y
      description: Shorthand for `--output=type=registry`
@z

@x quiet
      description: Suppress the build output and print image ID on success
@y
      description: Suppress the build output and print image ID on success
@z

@x rm
      description: Remove intermediate containers after a successful build
@y
      description: Remove intermediate containers after a successful build
@z

@x root
      description: Specify root directory of server to connect
@y
      description: Specify root directory of server to connect
@z

@x sbom
      description: Shorthand for `--attest=type=sbom`
@y
      description: Shorthand for `--attest=type=sbom`
@z

@x secret
      description: |
        Secret to expose to the build (format: `id=mysecret[,src=/local/secret]`)
@y
      description: |
        Secret to expose to the build (format: `id=mysecret[,src=/local/secret]`)
@z

@x security-opt
      description: Security options
@y
      description: Security options
@z

@x server-config
      description: |
        Specify buildx server config file (used only when launching new server)
@y
      description: |
        Specify buildx server config file (used only when launching new server)
@z

@x shm-size
      description: Shared memory size for build containers
@y
      description: Shared memory size for build containers
@z

@x squash
      description: Squash newly built layers into a single new layer
@y
      description: Squash newly built layers into a single new layer
@z

@x ssh
      description: |
        SSH agent socket or keys to expose to the build (format: `default|<id>[=<socket>|<key>[,<key>]]`)
@y
      description: |
        SSH agent socket or keys to expose to the build (format: `default|<id>[=<socket>|<key>[,<key>]]`)
@z

@x tag
      description: 'Name and optionally a tag (format: `name:tag`)'
@y
      description: 'Name and optionally a tag (format: `name:tag`)'
@z

@x target
      description: Set the target build stage to build
@y
      description: Set the target build stage to build
@z

@x ulimit
      description: Ulimit options
@y
      description: Ulimit options
@z

% inherited_options:

@x builder
      description: Override the configured builder instance
@y
      description: Override the configured builder instance
@z

@x
examples: |-
    ### Add entries to container hosts file (--add-host) {#add-host}
@y
examples: |-
    ### Add entries to container hosts file (--add-host) {#add-host}
@z

@x
    You can add other hosts into a build container's `/etc/hosts` file by using one
    or more `--add-host` flags. This example adds static addresses for hosts named
    `my-hostname` and `my_hostname_v6`:
@y
    You can add other hosts into a build container's `/etc/hosts` file by using one
    or more `--add-host` flags. This example adds static addresses for hosts named
    `my-hostname` and `my_hostname_v6`:
@z

% snip command...

@x
    If you need your build to connect to services running on the host, you can use
    the special `host-gateway` value for `--add-host`. In the following example,
    build containers resolve `host.docker.internal` to the host's gateway IP.
@y
    If you need your build to connect to services running on the host, you can use
    the special `host-gateway` value for `--add-host`. In the following example,
    build containers resolve `host.docker.internal` to the host's gateway IP.
@z

% snip command...

@x
    You can wrap an IPv6 address in square brackets.
    `=` and `:` are both valid separators.
    Both formats in the following example are valid:
@y
    You can wrap an IPv6 address in square brackets.
    `=` and `:` are both valid separators.
    Both formats in the following example are valid:
@z

% snip command...

@x
    ### Create annotations (--annotation) {#annotation}
@y
    ### Create annotations (--annotation) {#annotation}
@z

% snip text...

@x
    Add OCI annotations to the image index, manifest, or descriptor.
    The following example adds the `foo=bar` annotation to the image manifests:
@y
    Add OCI annotations to the image index, manifest, or descriptor.
    The following example adds the `foo=bar` annotation to the image manifests:
@z

% snip command...

@x
    You can optionally add a type prefix to specify the level of the annotation. By
    default, the image manifest is annotated. The following example adds the
    `foo=bar` annotation the image index instead of the manifests:
@y
    You can optionally add a type prefix to specify the level of the annotation. By
    default, the image manifest is annotated. The following example adds the
    `foo=bar` annotation the image index instead of the manifests:
@z

% snip command...

@x
    You can specify multiple types, separated by a comma (,) to add the annotation
    to multiple image components. The following example adds the `foo=bar`
    annotation to image index, descriptors, manifests:
@y
    You can specify multiple types, separated by a comma (,) to add the annotation
    to multiple image components. The following example adds the `foo=bar`
    annotation to image index, descriptors, manifests:
@z

% snip command...

@x
    You can also specify a platform qualifier in square brackets (`[os/arch]`) in
    the type prefix, to apply the annotation to a subset of manifests with the
    matching platform. The following example adds the `foo=bar` annotation only to
    the manifest with the `linux/amd64` platform:
@y
    You can also specify a platform qualifier in square brackets (`[os/arch]`) in
    the type prefix, to apply the annotation to a subset of manifests with the
    matching platform. The following example adds the `foo=bar` annotation only to
    the manifest with the `linux/amd64` platform:
@z

% snip command...

@x
    Wildcards are not supported in the platform qualifier; you can't specify a type
    prefix like `manifest[linux/*]` to add annotations only to manifests which has
    `linux` as the OS platform.
@y
    Wildcards are not supported in the platform qualifier; you can't specify a type
    prefix like `manifest[linux/*]` to add annotations only to manifests which has
    `linux` as the OS platform.
@z

@x
    For more information about annotations, see
    [Annotations](/build/building/annotations/).
@y
    For more information about annotations, see
    [Annotations](__SUBDIR__/build/building/annotations/).
@z

@x
    ### Create attestations (--attest) {#attest}
@y
    ### Create attestations (--attest) {#attest}
@z

% snip text...

@x
    Create [image attestations](/build/attestations/).
    BuildKit currently supports:
@y
    Create [image attestations](__SUBDIR__/build/attestations/).
    BuildKit currently supports:
@z

@x
    - `sbom` - Software Bill of Materials.
@y
    - `sbom` - Software Bill of Materials.
@z

@x
      Use `--attest=type=sbom` to generate an SBOM for an image at build-time.
      Alternatively, you can use the [`--sbom` shorthand](#sbom).
@y
      Use `--attest=type=sbom` to generate an SBOM for an image at build-time.
      Alternatively, you can use the [`--sbom` shorthand](#sbom).
@z

@x
      For more information, see [here](/build/attestations/sbom/).
@y
      For more information, see [here](__SUBDIR__/build/attestations/sbom/).
@z

@x
    - `provenance` - SLSA Provenance
@y
    - `provenance` - SLSA Provenance
@z

@x
      Use `--attest=type=provenance` to generate provenance for an image at
      build-time. Alternatively, you can use the [`--provenance` shorthand](#provenance).
@y
      Use `--attest=type=provenance` to generate provenance for an image at
      build-time. Alternatively, you can use the [`--provenance` shorthand](#provenance).
@z

@x
      By default, a minimal provenance attestation will be created for the build
      result, which will only be attached for images pushed to registries.
@y
      By default, a minimal provenance attestation will be created for the build
      result, which will only be attached for images pushed to registries.
@z

@x
      For more information, see [here](/build/attestations/slsa-provenance/).
@y
      For more information, see [here](__SUBDIR__/build/attestations/slsa-provenance/).
@z

@x
    ### Allow extra privileged entitlement (--allow) {#allow}
@y
    ### Allow extra privileged entitlement (--allow) {#allow}
@z

% snip text...

@x
    Allow extra privileged entitlement. List of entitlements:
@y
    Allow extra privileged entitlement. List of entitlements:
@z

@x
    - `network.host` - Allows executions with host networking.
    - `security.insecure` - Allows executions without sandbox. See
      [related Dockerfile extensions](/reference/dockerfile/#run---security).
@y
    - `network.host` - Allows executions with host networking.
    - `security.insecure` - Allows executions without sandbox. See
      [related Dockerfile extensions](__SUBDIR__/reference/dockerfile/#run---security).
@z

@x
    For entitlements to be enabled, the BuildKit daemon also needs to allow them
    with `--allow-insecure-entitlement` (see [`create --buildkitd-flags`](/reference/cli/docker/buildx/create/#buildkitd-flags)).
@y
    For entitlements to be enabled, the BuildKit daemon also needs to allow them
    with `--allow-insecure-entitlement` (see [`create --buildkitd-flags`](__SUBDIR__/reference/cli/docker/buildx/create/#buildkitd-flags)).
@z

% snip command...

@x
    ### Set build-time variables (--build-arg) {#build-arg}
@y
    ### Set build-time variables (--build-arg) {#build-arg}
@z

@x
    You can use `ENV` instructions in a Dockerfile to define variable values. These
    values persist in the built image. Often persistence isn't what you want. Users
    want to specify variables differently depending on which host they build an
    image on.
@y
    You can use `ENV` instructions in a Dockerfile to define variable values. These
    values persist in the built image. Often persistence isn't what you want. Users
    want to specify variables differently depending on which host they build an
    image on.
@z

@x
    A good example is `http_proxy` or source versions for pulling intermediate
    files. The `ARG` instruction lets Dockerfile authors define values that users
    can set at build-time using the  `--build-arg` flag:
@y
    A good example is `http_proxy` or source versions for pulling intermediate
    files. The `ARG` instruction lets Dockerfile authors define values that users
    can set at build-time using the  `--build-arg` flag:
@z

% snip command...

@x
    This flag allows you to pass the build-time variables that are
    accessed like regular environment variables in the `RUN` instruction of the
    Dockerfile. These values don't persist in the intermediate or final images
    like `ENV` values do. You must add `--build-arg` for each build argument.
@y
    This flag allows you to pass the build-time variables that are
    accessed like regular environment variables in the `RUN` instruction of the
    Dockerfile. These values don't persist in the intermediate or final images
    like `ENV` values do. You must add `--build-arg` for each build argument.
@z

@x
    Using this flag doesn't alter the output you see when the build process echoes the`ARG` lines from the
    Dockerfile.
@y
    Using this flag doesn't alter the output you see when the build process echoes the`ARG` lines from the
    Dockerfile.
@z

@x
    For detailed information on using `ARG` and `ENV` instructions, see the
    [Dockerfile reference](/reference/dockerfile/).
@y
    For detailed information on using `ARG` and `ENV` instructions, see the
    [Dockerfile reference](__SUBDIR__/reference/dockerfile/).
@z

@x
    You can also use the `--build-arg` flag without a value, in which case the daemon
    propagates the value from the local environment into the Docker container it's building:
@y
    You can also use the `--build-arg` flag without a value, in which case the daemon
    propagates the value from the local environment into the Docker container it's building:
@z

% snip command...

@x
    This example is similar to how `docker run -e` works. Refer to the [`docker run` documentation](/reference/cli/docker/container/run/#env)
    for more information.
@y
    This example is similar to how `docker run -e` works. Refer to the [`docker run` documentation](__SUBDIR__/reference/cli/docker/container/run/#env)
    for more information.
@z

@x
    There are also useful built-in build arguments, such as:
@y
    There are also useful built-in build arguments, such as:
@z

@x
    * `BUILDKIT_CONTEXT_KEEP_GIT_DIR=<bool>`: trigger git context to keep the `.git` directory
    * `BUILDKIT_INLINE_CACHE=<bool>`: inline cache metadata to image config or not
    * `BUILDKIT_MULTI_PLATFORM=<bool>`: opt into deterministic output regardless of multi-platform output or not
@y
    * `BUILDKIT_CONTEXT_KEEP_GIT_DIR=<bool>`: trigger git context to keep the `.git` directory
    * `BUILDKIT_INLINE_CACHE=<bool>`: inline cache metadata to image config or not
    * `BUILDKIT_MULTI_PLATFORM=<bool>`: opt into deterministic output regardless of multi-platform output or not
@z

% snip command...

@x
    Learn more about the built-in build arguments in the [Dockerfile reference docs](/reference/dockerfile/#buildkit-built-in-build-args).
@y
    Learn more about the built-in build arguments in the [Dockerfile reference docs](__SUBDIR__/reference/dockerfile/#buildkit-built-in-build-args).
@z

@x
    ### Additional build contexts (--build-context) {#build-context}
@y
    ### Additional build contexts (--build-context) {#build-context}
@z

% snip text...

@x
    Define additional build context with specified contents. In Dockerfile the context can be accessed when `FROM name` or `--from=name` is used.
    When Dockerfile defines a stage with the same name it is overwritten.
@y
    Define additional build context with specified contents. In Dockerfile the context can be accessed when `FROM name` or `--from=name` is used.
    When Dockerfile defines a stage with the same name it is overwritten.
@z

@x
    The value can be a local source directory, [local OCI layout compliant directory](https://github.com/opencontainers/image-spec/blob/main/image-layout.md), container image (with docker-image:// prefix), Git or HTTP URL.
@y
    The value can be a local source directory, [local OCI layout compliant directory](https://github.com/opencontainers/image-spec/blob/main/image-layout.md), container image (with docker-image:// prefix), Git or HTTP URL.
@z

@x
    Replace `alpine:latest` with a pinned one:
@y
    Replace `alpine:latest` with a pinned one:
@z

% snip command...

@x
    Expose a secondary local source directory:
@y
    Expose a secondary local source directory:
@z

% snip command...

% snip code...

@x
    #### Use an OCI layout directory as build context {#source-oci-layout}
@y
    #### Use an OCI layout directory as build context {#source-oci-layout}
@z

@x
    Source an image from a local [OCI layout compliant directory](https://github.com/opencontainers/image-spec/blob/main/image-layout.md),
    either by tag, or by digest:
@y
    Source an image from a local [OCI layout compliant directory](https://github.com/opencontainers/image-spec/blob/main/image-layout.md),
    either by tag, or by digest:
@z

% snip command...

% snip code...

@x
    The OCI layout directory must be compliant with the [OCI layout specification](https://github.com/opencontainers/image-spec/blob/main/image-layout.md).
    You can reference an image in the layout using either tags, or the exact digest.
@y
    The OCI layout directory must be compliant with the [OCI layout specification](https://github.com/opencontainers/image-spec/blob/main/image-layout.md).
    You can reference an image in the layout using either tags, or the exact digest.
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

@x
    ### Use an external cache source for a build (--cache-from) {#cache-from}
@y
    ### Use an external cache source for a build (--cache-from) {#cache-from}
@z

% snip text...

@x
    Use an external cache source for a build. Supported types are `registry`,
    `local`, `gha` and `s3`.
@y
    Use an external cache source for a build. Supported types are `registry`,
    `local`, `gha` and `s3`.
@z

@x
    - [`registry` source](https://github.com/moby/buildkit#registry-push-image-and-cache-separately)
      can import cache from a cache manifest or (special) image configuration on the
      registry.
    - [`local` source](https://github.com/moby/buildkit#local-directory-1) can
      import cache from local files previously exported with `--cache-to`.
    - [`gha` source](https://github.com/moby/buildkit#github-actions-cache-experimental)
      can import cache from a previously exported cache with `--cache-to` in your
      GitHub repository
    - [`s3` source](https://github.com/moby/buildkit#s3-cache-experimental)
      can import cache from a previously exported cache with `--cache-to` in your
      S3 bucket
@y
    - [`registry` source](https://github.com/moby/buildkit#registry-push-image-and-cache-separately)
      can import cache from a cache manifest or (special) image configuration on the
      registry.
    - [`local` source](https://github.com/moby/buildkit#local-directory-1) can
      import cache from local files previously exported with `--cache-to`.
    - [`gha` source](https://github.com/moby/buildkit#github-actions-cache-experimental)
      can import cache from a previously exported cache with `--cache-to` in your
      GitHub repository
    - [`s3` source](https://github.com/moby/buildkit#s3-cache-experimental)
      can import cache from a previously exported cache with `--cache-to` in your
      S3 bucket
@z

@x
    If no type is specified, `registry` exporter is used with a specified reference.
@y
    If no type is specified, `registry` exporter is used with a specified reference.
@z

@x
    `docker` driver currently only supports importing build cache from the registry.
@y
    `docker` driver currently only supports importing build cache from the registry.
@z

% snip command...

@x
    More info about cache exporters and available attributes: https://github.com/moby/buildkit#export-cache
@y
    More info about cache exporters and available attributes: https://github.com/moby/buildkit#export-cache
@z

@x
    ### Export build cache to an external cache destination (--cache-to) {#cache-to}
@y
    ### Export build cache to an external cache destination (--cache-to) {#cache-to}
@z

% snip text...

@x
    Export build cache to an external cache destination. Supported types are
    `registry`, `local`, `inline`, `gha` and `s3`.
@y
    Export build cache to an external cache destination. Supported types are
    `registry`, `local`, `inline`, `gha` and `s3`.
@z

@x
    - [`registry` type](https://github.com/moby/buildkit#registry-push-image-and-cache-separately) exports build cache to a cache manifest in the registry.
    - [`local` type](https://github.com/moby/buildkit#local-directory-1) exports
      cache to a local directory on the client.
    - [`inline` type](https://github.com/moby/buildkit#inline-push-image-and-cache-together)
      writes the cache metadata into the image configuration.
    - [`gha` type](https://github.com/moby/buildkit#github-actions-cache-experimental)
      exports cache through the [GitHub Actions Cache service API](https://github.com/tonistiigi/go-actions-cache/blob/master/api.md#authentication).
    - [`s3` type](https://github.com/moby/buildkit#s3-cache-experimental) exports
      cache to a S3 bucket.
@y
    - [`registry` type](https://github.com/moby/buildkit#registry-push-image-and-cache-separately) exports build cache to a cache manifest in the registry.
    - [`local` type](https://github.com/moby/buildkit#local-directory-1) exports
      cache to a local directory on the client.
    - [`inline` type](https://github.com/moby/buildkit#inline-push-image-and-cache-together)
      writes the cache metadata into the image configuration.
    - [`gha` type](https://github.com/moby/buildkit#github-actions-cache-experimental)
      exports cache through the [GitHub Actions Cache service API](https://github.com/tonistiigi/go-actions-cache/blob/master/api.md#authentication).
    - [`s3` type](https://github.com/moby/buildkit#s3-cache-experimental) exports
      cache to a S3 bucket.
@z

@x
    The `docker` driver only supports cache exports using the `inline` and `local`
    cache backends.
@y
    The `docker` driver only supports cache exports using the `inline` and `local`
    cache backends.
@z

@x
    Attribute key:
@y
    Attribute key:
@z

@x
    - `mode` - Specifies how many layers are exported with the cache. `min` on only
      exports layers already in the final build stage, `max` exports layers for
      all stages. Metadata is always exported for the whole build.
@y
    - `mode` - Specifies how many layers are exported with the cache. `min` on only
      exports layers already in the final build stage, `max` exports layers for
      all stages. Metadata is always exported for the whole build.
@z

% snip command...

@x
    More info about cache exporters and available attributes: https://github.com/moby/buildkit#export-cache
@y
    More info about cache exporters and available attributes: https://github.com/moby/buildkit#export-cache
@z

@x
    ### Load the single-platform build result to `docker images` (--load) {#load}
@y
    ### Load the single-platform build result to `docker images` (--load) {#load}
@z

@x
    Shorthand for [`--output=type=docker`](#docker). Will automatically load the
    single-platform build result to `docker images`.
@y
    Shorthand for [`--output=type=docker`](#docker). Will automatically load the
    single-platform build result to `docker images`.
@z

@x
    ### Write build result metadata to a file (--metadata-file) {#metadata-file}
@y
    ### Write build result metadata to a file (--metadata-file) {#metadata-file}
@z

@x
    To output build metadata such as the image digest, pass the `--metadata-file` flag.
    The metadata will be written as a JSON object to the specified file. The
    directory of the specified file must already exist and be writable.
@y
    To output build metadata such as the image digest, pass the `--metadata-file` flag.
    The metadata will be written as a JSON object to the specified file. The
    directory of the specified file must already exist and be writable.
@z

% snip command...
% snip code...

@x
    > **Note**
    >
    > Build record [provenance](/build/attestations/slsa-provenance/#provenance-attestation-example)
    > (`buildx.build.provenance`) includes minimal provenance by default. Set the
    > `BUILDX_METADATA_PROVENANCE` environment variable to customize this behavior:
@y
    > **Note**
    >
    > Build record [provenance](__SUBDIR__/build/attestations/slsa-provenance/#provenance-attestation-example)
    > (`buildx.build.provenance`) includes minimal provenance by default. Set the
    > `BUILDX_METADATA_PROVENANCE` environment variable to customize this behavior:
@z

@x
    > - `min` sets minimal provenance (default).
    > - `max` sets full provenance.
    > - `disabled`, `false` or `0` doesn't set any provenance.
@y
    > - `min` sets minimal provenance (default).
    > - `max` sets full provenance.
    > - `disabled`, `false` or `0` doesn't set any provenance.
@z

@x
    ### Ignore build cache for specific stages (--no-cache-filter) {#no-cache-filter}
@y
    ### Ignore build cache for specific stages (--no-cache-filter) {#no-cache-filter}
@z

@x
    The `--no-cache-filter` lets you specify one or more stages of a multi-stage
    Dockerfile for which build cache should be ignored. To specify multiple stages,
    use a comma-separated syntax:
@y
    The `--no-cache-filter` lets you specify one or more stages of a multi-stage
    Dockerfile for which build cache should be ignored. To specify multiple stages,
    use a comma-separated syntax:
@z

% snip command...

@x
    For example, the following Dockerfile contains four stages:
@y
    For example, the following Dockerfile contains four stages:
@z

@x
    - `base`
    - `install`
    - `test`
    - `release`
@y
    - `base`
    - `install`
    - `test`
    - `release`
@z

% snip code...

@x
    To ignore the cache for the `install` stage:
@y
    To ignore the cache for the `install` stage:
@z

% snip command...

@x
    To ignore the cache the `install` and `release` stages:
@y
    To ignore the cache the `install` and `release` stages:
@z

% snip command...

@x
    The arguments for the `--no-cache-filter` flag must be names of stages.
@y
    The arguments for the `--no-cache-filter` flag must be names of stages.
@z

@x
    ### Set the export action for the build result (-o, --output) {#output}
@y
    ### Set the export action for the build result (-o, --output) {#output}
@z

% snip code...

@x
    Sets the export action for the build result. The default output, when using the
    `docker` [build driver](/build/drivers/), is a container
    image exported to the local image store. The `--output` flag makes this step
    configurable allows export of results directly to the client's filesystem, an
    OCI image tarball, a registry, and more.
@y
    Sets the export action for the build result. The default output, when using the
    `docker` [build driver](__SUBDIR__/build/drivers/), is a container
    image exported to the local image store. The `--output` flag makes this step
    configurable allows export of results directly to the client's filesystem, an
    OCI image tarball, a registry, and more.
@z

@x
    Buildx with `docker` driver only supports the local, tarball, and image
    [exporters](/build/exporters/). The `docker-container`
    driver supports all exporters.
@y
    Buildx with `docker` driver only supports the local, tarball, and image
    [exporters](__SUBDIR__/build/exporters/). The `docker-container`
    driver supports all exporters.
@z

@x
    If you only specify a filepath as the argument to `--output`, Buildx uses the
    local exporter. If the value is `-`, Buildx uses the `tar` exporter and writes
    the output to stdout.
@y
    If you only specify a filepath as the argument to `--output`, Buildx uses the
    local exporter. If the value is `-`, Buildx uses the `tar` exporter and writes
    the output to stdout.
@z

% snip code...

@x
    Supported exported types are:
@y
    Supported exported types are:
@z

@x
    #### `local`
@y
    #### `local`
@z

@x
    The `local` export type writes all result files to a directory on the client. The
    new files will be owned by the current user. On multi-platform builds, all results
    will be put in subdirectories by their platform.
@y
    The `local` export type writes all result files to a directory on the client. The
    new files will be owned by the current user. On multi-platform builds, all results
    will be put in subdirectories by their platform.
@z

@x
    Attribute key:
@y
    Attribute key:
@z

@x
    - `dest` - destination directory where files will be written
@y
    - `dest` - destination directory where files will be written
@z

@x
    #### `tar`
@y
    #### `tar`
@z

@x
    The `tar` export type writes all result files as a single tarball on the client.
    On multi-platform builds all results will be put in subdirectories by their platform.
@y
    The `tar` export type writes all result files as a single tarball on the client.
    On multi-platform builds all results will be put in subdirectories by their platform.
@z

@x
    Attribute key:
@y
    Attribute key:
@z

@x
    - `dest` - destination path where tarball will be written. “-” writes to stdout.
@y
    - `dest` - destination path where tarball will be written. “-” writes to stdout.
@z

@x
    #### `oci`
@y
    #### `oci`
@z

@x
    The `oci` export type writes the result image or manifest list as an [OCI image
    layout](https://github.com/opencontainers/image-spec/blob/v1.0.1/image-layout.md)
    tarball on the client.
@y
    The `oci` export type writes the result image or manifest list as an [OCI image
    layout](https://github.com/opencontainers/image-spec/blob/v1.0.1/image-layout.md)
    tarball on the client.
@z

@x
    Attribute key:
@y
    Attribute key:
@z

@x
    - `dest` - destination path where tarball will be written. “-” writes to stdout.
@y
    - `dest` - destination path where tarball will be written. “-” writes to stdout.
@z

@x
    #### `docker`
@y
    #### `docker`
@z

@x
    The `docker` export type writes the single-platform result image as a [Docker image
    specification](https://github.com/docker/docker/blob/v20.10.2/image/spec/v1.2.md)
    tarball on the client. Tarballs created by this exporter are also OCI compatible.
@y
    The `docker` export type writes the single-platform result image as a [Docker image
    specification](https://github.com/docker/docker/blob/v20.10.2/image/spec/v1.2.md)
    tarball on the client. Tarballs created by this exporter are also OCI compatible.
@z

@x
    The default image store in Docker Engine doesn't support loading multi-platform
    images. You can enable the containerd image store, or push multi-platform images
    is to directly push to a registry, see [`registry`](#registry).
@y
    The default image store in Docker Engine doesn't support loading multi-platform
    images. You can enable the containerd image store, or push multi-platform images
    is to directly push to a registry, see [`registry`](#registry).
@z

@x
    Attribute keys:
@y
    Attribute keys:
@z

@x
    - `dest` - destination path where tarball will be written. If not specified,
      the tar will be loaded automatically to the local image store.
    - `context` - name for the Docker context where to import the result
@y
    - `dest` - destination path where tarball will be written. If not specified,
      the tar will be loaded automatically to the local image store.
    - `context` - name for the Docker context where to import the result
@z

@x
    #### `image`
@y
    #### `image`
@z

@x
    The `image` exporter writes the build result as an image or a manifest list. When
    using `docker` driver the image will appear in `docker images`. Optionally, image
    can be automatically pushed to a registry by specifying attributes.
@y
    The `image` exporter writes the build result as an image or a manifest list. When
    using `docker` driver the image will appear in `docker images`. Optionally, image
    can be automatically pushed to a registry by specifying attributes.
@z

@x
    Attribute keys:
@y
    Attribute keys:
@z

@x
    - `name` - name (references) for the new image.
    - `push` - Boolean to automatically push the image.
@y
    - `name` - name (references) for the new image.
    - `push` - Boolean to automatically push the image.
@z

@x
    #### `registry`
@y
    #### `registry`
@z

@x
    The `registry` exporter is a shortcut for `type=image,push=true`.
@y
    The `registry` exporter is a shortcut for `type=image,push=true`.
@z

@x
    ### Set the target platforms for the build (--platform) {#platform}
@y
    ### Set the target platforms for the build (--platform) {#platform}
@z

% snip text...

@x
    Set the target platform for the build. All `FROM` commands inside the Dockerfile
    without their own `--platform` flag will pull base images for this platform and
    this value will also be the platform of the resulting image.
@y
    Set the target platform for the build. All `FROM` commands inside the Dockerfile
    without their own `--platform` flag will pull base images for this platform and
    this value will also be the platform of the resulting image.
@z

@x
    The default value is the platform of the BuildKit daemon where the build runs.
    The value takes the form of `os/arch` or `os/arch/variant`. For example,
    `linux/amd64` or `linux/arm/v7`. Additionally, the `--platform` flag also supports
    a special `local` value, which tells BuildKit to use the platform of the BuildKit
    client that invokes the build.
@y
    The default value is the platform of the BuildKit daemon where the build runs.
    The value takes the form of `os/arch` or `os/arch/variant`. For example,
    `linux/amd64` or `linux/arm/v7`. Additionally, the `--platform` flag also supports
    a special `local` value, which tells BuildKit to use the platform of the BuildKit
    client that invokes the build.
@z

@x
    When using `docker-container` driver with `buildx`, this flag can accept multiple
    values as an input separated by a comma. With multiple values the result will be
    built for all of the specified platforms and joined together into a single manifest
    list.
@y
    When using `docker-container` driver with `buildx`, this flag can accept multiple
    values as an input separated by a comma. With multiple values the result will be
    built for all of the specified platforms and joined together into a single manifest
    list.
@z

@x
    If the `Dockerfile` needs to invoke the `RUN` command, the builder needs runtime
    support for the specified platform. In a clean setup, you can only execute `RUN`
    commands for your system architecture.
    If your kernel supports [`binfmt_misc`](https://en.wikipedia.org/wiki/Binfmt_misc)
    launchers for secondary architectures, buildx will pick them up automatically.
    Docker Desktop releases come with `binfmt_misc` automatically configured for `arm64`
    and `arm` architectures. You can see what runtime platforms your current builder
    instance supports by running `docker buildx inspect --bootstrap`.
@y
    If the `Dockerfile` needs to invoke the `RUN` command, the builder needs runtime
    support for the specified platform. In a clean setup, you can only execute `RUN`
    commands for your system architecture.
    If your kernel supports [`binfmt_misc`](https://en.wikipedia.org/wiki/Binfmt_misc)
    launchers for secondary architectures, buildx will pick them up automatically.
    Docker Desktop releases come with `binfmt_misc` automatically configured for `arm64`
    and `arm` architectures. You can see what runtime platforms your current builder
    instance supports by running `docker buildx inspect --bootstrap`.
@z

@x
    Inside a `Dockerfile`, you can access the current platform value through
    `TARGETPLATFORM` build argument. Refer to the [Dockerfile reference](/reference/dockerfile/#automatic-platform-args-in-the-global-scope)
    for the full description of automatic platform argument variants .
@y
    Inside a `Dockerfile`, you can access the current platform value through
    `TARGETPLATFORM` build argument. Refer to the [Dockerfile reference](__SUBDIR__/reference/dockerfile/#automatic-platform-args-in-the-global-scope)
    for the full description of automatic platform argument variants .
@z

@x
    You can find the formatting definition for the platform specifier in the
    [containerd source code](https://github.com/containerd/containerd/blob/v1.4.3/platforms/platforms.go#L63).
@y
    You can find the formatting definition for the platform specifier in the
    [containerd source code](https://github.com/containerd/containerd/blob/v1.4.3/platforms/platforms.go#L63).
@z

% snip command...

@x
    ### Set type of progress output (--progress) {#progress}
@y
    ### Set type of progress output (--progress) {#progress}
@z

% snip text...

@x
    Set type of progress output (`auto`, `plain`, `tty`, `rawjson`). Use `plain` to show container
    output (default `auto`).
@y
    Set type of progress output (`auto`, `plain`, `tty`, `rawjson`). Use `plain` to show container
    output (default `auto`).
@z

@x
    > **Note**
    >
    > You can also use the `BUILDKIT_PROGRESS` environment variable to set its value.
@y
    > **Note**
    >
    > You can also use the `BUILDKIT_PROGRESS` environment variable to set its value.
@z

@x
    The following example uses `plain` output during the build:
@y
    The following example uses `plain` output during the build:
@z

% snip command...

@x
    > **Note**
    >
    > Check also the [`BUILDKIT_COLORS`](/build/building/variables/#buildkit_colors)
    > environment variable for modifying the colors of the terminal output.
@y
    > **Note**
    >
    > Check also the [`BUILDKIT_COLORS`](__SUBDIR__/build/building/variables/#buildkit_colors)
    > environment variable for modifying the colors of the terminal output.
@z

@x
    The `rawjson` output marshals the solve status events from BuildKit to JSON lines.
    This mode is designed to be read by an external program.
@y
    The `rawjson` output marshals the solve status events from BuildKit to JSON lines.
    This mode is designed to be read by an external program.
@z

@x
    ### Create provenance attestations (--provenance) {#provenance}
@y
    ### Create provenance attestations (--provenance) {#provenance}
@z

@x
    Shorthand for [`--attest=type=provenance`](#attest), used to configure
    provenance attestations for the build result. For example,
    `--provenance=mode=max` can be used as an abbreviation for
    `--attest=type=provenance,mode=max`.
@y
    Shorthand for [`--attest=type=provenance`](#attest), used to configure
    provenance attestations for the build result. For example,
    `--provenance=mode=max` can be used as an abbreviation for
    `--attest=type=provenance,mode=max`.
@z

@x
    Additionally, `--provenance` can be used with Boolean values to enable or disable
    provenance attestations. For example, `--provenance=false` disables all provenance attestations,
    while `--provenance=true` enables all provenance attestations.
@y
    Additionally, `--provenance` can be used with Boolean values to enable or disable
    provenance attestations. For example, `--provenance=false` disables all provenance attestations,
    while `--provenance=true` enables all provenance attestations.
@z

@x
    By default, a minimal provenance attestation will be created for the build
    result. Note that the default image store in Docker Engine doesn't support
    attestations. Provenance attestations only persist for images pushed directly
    to a registry if you use the default image store. Alternatively, you can switch
    to using the containerd image store.
@y
    By default, a minimal provenance attestation will be created for the build
    result. Note that the default image store in Docker Engine doesn't support
    attestations. Provenance attestations only persist for images pushed directly
    to a registry if you use the default image store. Alternatively, you can switch
    to using the containerd image store.
@z

@x
    For more information about provenance attestations, see
    [here](/build/attestations/slsa-provenance/).
@y
    For more information about provenance attestations, see
    [here](__SUBDIR__/build/attestations/slsa-provenance/).
@z

@x
    ### Push the build result to a registry (--push) {#push}
@y
    ### Push the build result to a registry (--push) {#push}
@z

@x
    Shorthand for [`--output=type=registry`](#registry). Will automatically push the
    build result to registry.
@y
    Shorthand for [`--output=type=registry`](#registry). Will automatically push the
    build result to registry.
@z

@x
    ### Create SBOM attestations (--sbom) {#sbom}
@y
    ### Create SBOM attestations (--sbom) {#sbom}
@z

@x
    Shorthand for [`--attest=type=sbom`](#attest), used to configure SBOM
    attestations for the build result. For example,
    `--sbom=generator=<user>/<generator-image>` can be used as an abbreviation for
    `--attest=type=sbom,generator=<user>/<generator-image>`.
@y
    Shorthand for [`--attest=type=sbom`](#attest), used to configure SBOM
    attestations for the build result. For example,
    `--sbom=generator=<user>/<generator-image>` can be used as an abbreviation for
    `--attest=type=sbom,generator=<user>/<generator-image>`.
@z

@x
    Additionally, `--sbom` can be used with Boolean values to enable or disable
    SBOM attestations. For example, `--sbom=false` disables all SBOM attestations.
@y
    Additionally, `--sbom` can be used with Boolean values to enable or disable
    SBOM attestations. For example, `--sbom=false` disables all SBOM attestations.
@z

@x
    Note that the default image store in Docker Engine doesn't support
    attestations. Provenance attestations only persist for images pushed directly
    to a registry if you use the default image store. Alternatively, you can switch
    to using the containerd image store.
@y
    Note that the default image store in Docker Engine doesn't support
    attestations. Provenance attestations only persist for images pushed directly
    to a registry if you use the default image store. Alternatively, you can switch
    to using the containerd image store.
@z

@x
    For more information, see [here](/build/attestations/sbom/).
@y
    For more information, see [here](__SUBDIR__/build/attestations/sbom/).
@z

@x
    ### Secret to expose to the build (--secret) {#secret}
@y
    ### Secret to expose to the build (--secret) {#secret}
@z

% snip text...

@x
    Exposes secrets (authentication credentials, tokens) to the build.
    A secret can be mounted into the build using a `RUN --mount=type=secret` mount in the
    [Dockerfile](/reference/dockerfile/#run---mounttypesecret).
    For more information about how to use build secrets, see
    [Build secrets](/build/building/secrets/).
@y
    Exposes secrets (authentication credentials, tokens) to the build.
    A secret can be mounted into the build using a `RUN --mount=type=secret` mount in the
    [Dockerfile](__SUBDIR__/reference/dockerfile/#run---mounttypesecret).
    For more information about how to use build secrets, see
    [Build secrets](__SUBDIR__/build/building/secrets/).
@z

@x
    Supported types are:
@y
    Supported types are:
@z

@x
    - [`file`](#file)
    - [`env`](#env)
@y
    - [`file`](#file)
    - [`env`](#env)
@z

@x
    Buildx attempts to detect the `type` automatically if unset.
@y
    Buildx attempts to detect the `type` automatically if unset.
@z

@x
    #### `file`
@y
    #### `file`
@z

@x
    Attribute keys:
@y
    Attribute keys:
@z

@x
    - `id` - ID of the secret. Defaults to base name of the `src` path.
    - `src`, `source` - Secret filename. `id` used if unset.
@y
    - `id` - ID of the secret. Defaults to base name of the `src` path.
    - `src`, `source` - Secret filename. `id` used if unset.
@z

% snip code...

% snip command...

@x
    #### `env`
@y
    #### `env`
@z

@x
    Attribute keys:
@y
    Attribute keys:
@z

@x
    - `id` - ID of the secret. Defaults to `env` name.
    - `env` - Secret environment variable. `id` used if unset, otherwise will look for `src`, `source` if `id` unset.
@y
    - `id` - ID of the secret. Defaults to `env` name.
    - `env` - Secret environment variable. `id` used if unset, otherwise will look for `src`, `source` if `id` unset.
@z

% snip code...

% snip command...

@x
    ### Shared memory size for build containers (--shm-size) {#shm-size}
@y
    ### Shared memory size for build containers (--shm-size) {#shm-size}
@z

@x
    The format is `<number><unit>`. `number` must be greater than `0`. Unit is
    optional and can be `b` (bytes), `k` (kilobytes), `m` (megabytes), or `g`
    (gigabytes). If you omit the unit, the system uses bytes.
@y
    The format is `<number><unit>`. `number` must be greater than `0`. Unit is
    optional and can be `b` (bytes), `k` (kilobytes), `m` (megabytes), or `g`
    (gigabytes). If you omit the unit, the system uses bytes.
@z

@x
    ### SSH agent socket or keys to expose to the build (--ssh) {#ssh}
@y
    ### SSH agent socket or keys to expose to the build (--ssh) {#ssh}
@z

% snip text...

@x
    This can be useful when some commands in your Dockerfile need specific SSH
    authentication (e.g., cloning a private repository).
@y
    This can be useful when some commands in your Dockerfile need specific SSH
    authentication (e.g., cloning a private repository).
@z

@x
    `--ssh` exposes SSH agent socket or keys to the build and can be used with the
    [`RUN --mount=type=ssh` mount](/reference/dockerfile/#run---mounttypessh).
@y
    `--ssh` exposes SSH agent socket or keys to the build and can be used with the
    [`RUN --mount=type=ssh` mount](__SUBDIR__/reference/dockerfile/#run---mounttypessh).
@z

@x
    Example to access Gitlab using an SSH agent socket:
@y
    Example to access Gitlab using an SSH agent socket:
@z

% snip code...

% snip command...

@x
    ### Set ulimits (--ulimit) {#ulimit}
@y
    ### Set ulimits (--ulimit) {#ulimit}
@z

@x
    `--ulimit` overrides the default ulimits of build's containers when using `RUN`
    instructions and are specified with a soft and hard limit as such:
    `<type>=<soft limit>[:<hard limit>]`, for example:
@y
    `--ulimit` overrides the default ulimits of build's containers when using `RUN`
    instructions and are specified with a soft and hard limit as such:
    `<type>=<soft limit>[:<hard limit>]`, for example:
@z

% snip command...

@x
    > **Note**
    >
    > If you don't provide a `hard limit`, the `soft limit` is used
    > for both values. If no `ulimits` are set, they're inherited from
    > the default `ulimits` set on the daemon.
@y
    > **Note**
    >
    > If you don't provide a `hard limit`, the `soft limit` is used
    > for both values. If no `ulimits` are set, they're inherited from
    > the default `ulimits` set on the daemon.
@z

@x
    > **Note**
    >
    > In most cases, it is recommended to let the builder automatically determine
    > the appropriate configurations. Manual adjustments should only be considered
    > when specific performance tuning is required for complex build scenarios.
@y
    > **Note**
    >
    > In most cases, it is recommended to let the builder automatically determine
    > the appropriate configurations. Manual adjustments should only be considered
    > when specific performance tuning is required for complex build scenarios.
@z

% snip directives...
