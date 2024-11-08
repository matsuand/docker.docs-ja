%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応
% snip 対応

@x
command: docker image build
aliases: docker image build, docker build, docker builder build
short: Build an image from a Dockerfile
long: |-
    > [!IMPORTANT]
    > This page refers to the **legacy implementation** of `docker build`,
    > using the legacy (pre-BuildKit) build backend.
    > This configuration is only relevant if you're building Windows containers.
    >
    > For information about the default `docker build`, using Buildx,
    > see [`docker buildx build`](/reference/cli/docker/build/).
@y
command: docker image build
aliases: docker image build, docker build, docker builder build
short: Build an image from a Dockerfile
long: |-
    > [!IMPORTANT]
    > This page refers to the **legacy implementation** of `docker build`,
    > using the legacy (pre-BuildKit) build backend.
    > This configuration is only relevant if you're building Windows containers.
    >
    > For information about the default `docker build`, using Buildx,
    > see [`docker buildx build`](__SUBDIR__/reference/cli/docker/build/).
@z

@x
    When building with legacy builder, images are created from a Dockerfile by
    running a sequence of [commits](/reference/cli/docker/container/commit/). This process is
    inefficient and slow compared to using BuildKit, which is why this build
    strategy is deprecated for all use cases except for building Windows
    containers. It's still useful for building Windows containers because BuildKit
    doesn't yet have full feature parity for Windows.
@y
    When building with legacy builder, images are created from a Dockerfile by
    running a sequence of [commits](__SUBDIR__/reference/cli/docker/container/commit/). This process is
    inefficient and slow compared to using BuildKit, which is why this build
    strategy is deprecated for all use cases except for building Windows
    containers. It's still useful for building Windows containers because BuildKit
    doesn't yet have full feature parity for Windows.
@z

@x
    Builds invoked with `docker build` use Buildx (and BuildKit) by default, unless:
@y
    Builds invoked with `docker build` use Buildx (and BuildKit) by default, unless:
@z

@x
    - You're running Docker Engine in Windows container mode
    - You explicitly opt out of using BuildKit by setting the environment variable `DOCKER_BUILDKIT=0`.
@y
    - You're running Docker Engine in Windows container mode
    - You explicitly opt out of using BuildKit by setting the environment variable `DOCKER_BUILDKIT=0`.
@z

@x
    The descriptions on this page only covers information that's exclusive to the
    legacy builder, and cases where behavior in the legacy builder deviates from
    behavior in BuildKit. For information about features and flags that are common
    between the legacy builder and BuildKit, such as `--tag` and `--target`, refer
    to the documentation for [`docker buildx build`](/reference/cli/docker/buildx/build/).
@y
    The descriptions on this page only covers information that's exclusive to the
    legacy builder, and cases where behavior in the legacy builder deviates from
    behavior in BuildKit. For information about features and flags that are common
    between the legacy builder and BuildKit, such as `--tag` and `--target`, refer
    to the documentation for [`docker buildx build`](__SUBDIR__/reference/cli/docker/buildx/build/).
@z

@x
    ### Build context with the legacy builder
@y
    ### Build context with the legacy builder
@z

@x
    The build context is the positional argument you pass when invoking the build
    command. In the following example, the context is `.`, meaning current the
    working directory.
@y
    The build context is the positional argument you pass when invoking the build
    command. In the following example, the context is `.`, meaning current the
    working directory.
@z

% snip command...

@x
    When using the legacy builder, the build context is sent over to the daemon in
    its entirety. With BuildKit, only the files you use in your builds are
    transmitted. The legacy builder doesn't calculate which files it needs
    beforehand. This means that for builds with a large context, context transfer
    can take a long time, even if you're only using a subset of the files included
    in the context.
@y
    When using the legacy builder, the build context is sent over to the daemon in
    its entirety. With BuildKit, only the files you use in your builds are
    transmitted. The legacy builder doesn't calculate which files it needs
    beforehand. This means that for builds with a large context, context transfer
    can take a long time, even if you're only using a subset of the files included
    in the context.
@z

@x
    When using the legacy builder, it's therefore extra important that you
    carefully consider what files you include in the context you specify. Use a
    [`.dockerignore`](/build/concepts/context/#dockerignore-files)
    file to exclude files and directories that you don't require in your build from
    being sent as part of the build context.
@y
    When using the legacy builder, it's therefore extra important that you
    carefully consider what files you include in the context you specify. Use a
    [`.dockerignore`](__SUBDIR__/build/concepts/context/#dockerignore-files)
    file to exclude files and directories that you don't require in your build from
    being sent as part of the build context.
@z

@x
    #### Accessing paths outside the build context
@y
    #### Accessing paths outside the build context
@z

@x
    The legacy builder will error out if you try to access files outside of the
    build context using relative paths in your Dockerfile.
@y
    The legacy builder will error out if you try to access files outside of the
    build context using relative paths in your Dockerfile.
@z

% snip code...
% snip command...

@x
    BuildKit on the other hand strips leading relative paths that traverse outside
    of the build context. Re-using the previous example, the path `COPY
    ../../some-dir .` evaluates to `COPY some-dir .` with BuildKit.
@y
    BuildKit on the other hand strips leading relative paths that traverse outside
    of the build context. Re-using the previous example, the path `COPY
    ../../some-dir .` evaluates to `COPY some-dir .` with BuildKit.
@z

@x
usage: docker image build [OPTIONS] PATH | URL | -
pname: docker image
plink: docker_image.yaml
@y
usage: docker image build [OPTIONS] PATH | URL | -
pname: docker image
plink: docker_image.yaml
@z

% options:

@x add-host
      description: Add a custom host-to-IP mapping (`host:ip`)
@y
      description: Add a custom host-to-IP mapping (`host:ip`)
@z

@x build-arg
      description: Set build-time variables
@y
      description: Set build-time variables
@z

@x cache-from
      description: Images to consider as cache sources
@y
      description: Images to consider as cache sources
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
      description: CPUs in which to allow execution (0-3, 0,1)
@y
      description: CPUs in which to allow execution (0-3, 0,1)
@z

@x cpuset-mems
      description: MEMs in which to allow execution (0-3, 0,1)
@y
      description: MEMs in which to allow execution (0-3, 0,1)
@z

@x disable-content-trust
      description: Skip image verification
@y
      description: Skip image verification
@z

@x file
      description: Name of the Dockerfile (Default is `PATH/Dockerfile`)
@y
      description: Name of the Dockerfile (Default is `PATH/Dockerfile`)
@z

@x force-rm
      description: Always remove intermediate containers
@y
      description: Always remove intermediate containers
@z

@x iidfile
      description: Write the image ID to the file
@y
      description: Write the image ID to the file
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

@x memory
      description: Memory limit
@y
      description: Memory limit
@z

@x memory-swap
      description: 'Swap limit equal to memory plus swap: -1 to enable unlimited swap'
@y
      description: 'Swap limit equal to memory plus swap: -1 to enable unlimited swap'
@z

@x network
      description: Set the networking mode for the RUN instructions during build
@y
      description: Set the networking mode for the RUN instructions during build
@z

@x no-cache
      description: Do not use cache when building the image
@y
      description: Do not use cache when building the image
@z

@x platform
      description: Set platform if server is multi-platform capable
@y
      description: Set platform if server is multi-platform capable
@z

@x pull
      description: Always attempt to pull a newer version of the image
@y
      description: Always attempt to pull a newer version of the image
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

@x security-opt
      description: Security options
@y
      description: Security options
@z

@x shm-size
      description: Size of `/dev/shm`
@y
      description: Size of `/dev/shm`
@z

@x squash
      description: Squash newly built layers into a single new layer
@y
      description: Squash newly built layers into a single new layer
@z

@x tag
      description: Name and optionally a tag in the `name:tag` format
@y
      description: Name and optionally a tag in the `name:tag` format
@z

@x target
      description: Set the target build stage to build.
@y
      description: Set the target build stage to build.
@z

@x ulimit
      description: Ulimit options
@y
      description: Ulimit options
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

@x
examples: |-
    ### Specify isolation technology for container (--isolation) {#isolation}
@y
examples: |-
    ### Specify isolation technology for container (--isolation) {#isolation}
@z

@x
    This option is useful in situations where you are running Docker containers on
    Windows. The `--isolation=<value>` option sets a container's isolation
    technology. On Linux, the only supported is the `default` option which uses
    Linux namespaces. On Microsoft Windows, you can specify these values:
@y
    This option is useful in situations where you are running Docker containers on
    Windows. The `--isolation=<value>` option sets a container's isolation
    technology. On Linux, the only supported is the `default` option which uses
    Linux namespaces. On Microsoft Windows, you can specify these values:
@z

@x
    | Value     | Description                                                                                                                                                                    |
    |-----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
    | `default` | Use the value specified by the Docker daemon's `--exec-opt` . If the `daemon` does not specify an isolation technology, Microsoft Windows uses `process` as its default value. |
    | `process` | Namespace isolation only.                                                                                                                                                      |
    | `hyperv`  | Hyper-V hypervisor partition-based isolation.                                                                                                                                  |
@y
    | Value     | Description                                                                                                                                                                    |
    |-----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
    | `default` | Use the value specified by the Docker daemon's `--exec-opt` . If the `daemon` does not specify an isolation technology, Microsoft Windows uses `process` as its default value. |
    | `process` | Namespace isolation only.                                                                                                                                                      |
    | `hyperv`  | Hyper-V hypervisor partition-based isolation.                                                                                                                                  |
@z

@x
    Specifying the `--isolation` flag without a value is the same as setting `--isolation="default"`.
@y
    Specifying the `--isolation` flag without a value is the same as setting `--isolation="default"`.
@z

@x
    ### Optional security options (--security-opt) {#security-opt}
@y
    ### Optional security options (--security-opt) {#security-opt}
@z

@x
    This flag is only supported on a daemon running on Windows, and only supports
    the `credentialspec` option. The `credentialspec` must be in the format
    `file://spec.txt` or `registry://keyname`.
@y
    This flag is only supported on a daemon running on Windows, and only supports
    the `credentialspec` option. The `credentialspec` must be in the format
    `file://spec.txt` or `registry://keyname`.
@z

@x
    ### Squash an image's layers (--squash) (experimental) {#squash}
@y
    ### Squash an image's layers (--squash) (experimental) {#squash}
@z

@x
    #### Overview
@y
    #### Overview
@z

@x
    > [!NOTE]
    > The `--squash` option is an experimental feature, and should not be considered
    > stable.
@y
    > [!NOTE]
    > The `--squash` option is an experimental feature, and should not be considered
    > stable.
@z

@x
    Once the image is built, this flag squashes the new layers into a new image with
    a single new layer. Squashing doesn't destroy any existing image, rather it
    creates a new image with the content of the squashed layers. This effectively
    makes it look like all `Dockerfile` commands were created with a single layer.
    The `--squash` flag preserves the build cache.
@y
    Once the image is built, this flag squashes the new layers into a new image with
    a single new layer. Squashing doesn't destroy any existing image, rather it
    creates a new image with the content of the squashed layers. This effectively
    makes it look like all `Dockerfile` commands were created with a single layer.
    The `--squash` flag preserves the build cache.
@z

@x
    Squashing layers can be beneficial if your Dockerfile produces multiple layers
    modifying the same files. For example, files created in one step and
    removed in another step. For other use-cases, squashing images may actually have
    a negative impact on performance. When pulling an image consisting of multiple
    layers, the daemon can pull layers in parallel and allows sharing layers between
    images (saving space).
@y
    Squashing layers can be beneficial if your Dockerfile produces multiple layers
    modifying the same files. For example, files created in one step and
    removed in another step. For other use-cases, squashing images may actually have
    a negative impact on performance. When pulling an image consisting of multiple
    layers, the daemon can pull layers in parallel and allows sharing layers between
    images (saving space).
@z

@x
    For most use cases, multi-stage builds are a better alternative, as they give more
    fine-grained control over your build, and can take advantage of future
    optimizations in the builder. Refer to the [Multi-stage builds](/build/building/multi-stage/)
    section for more information.
@y
    For most use cases, multi-stage builds are a better alternative, as they give more
    fine-grained control over your build, and can take advantage of future
    optimizations in the builder. Refer to the [Multi-stage builds](__SUBDIR__/build/building/multi-stage/)
    section for more information.
@z

@x
    #### Known limitations
@y
    #### Known limitations
@z

@x
    The `--squash` option has a number of known limitations:
@y
    The `--squash` option has a number of known limitations:
@z

@x
    - When squashing layers, the resulting image can't take advantage of layer
      sharing with other images, and may use significantly more space. Sharing the
      base image is still supported.
    - When using this option you may see significantly more space used due to
      storing two copies of the image, one for the build cache with all the cache
      layers intact, and one for the squashed version.
    - While squashing layers may produce smaller images, it may have a negative
      impact on performance, as a single layer takes longer to extract, and
      you can't parallelize downloading a single layer.
    - When attempting to squash an image that doesn't make changes to the
      filesystem (for example, the Dockerfile only contains `ENV` instructions),
      the squash step will fail (see [issue #33823](https://github.com/moby/moby/issues/33823)).
@y
    - When squashing layers, the resulting image can't take advantage of layer
      sharing with other images, and may use significantly more space. Sharing the
      base image is still supported.
    - When using this option you may see significantly more space used due to
      storing two copies of the image, one for the build cache with all the cache
      layers intact, and one for the squashed version.
    - While squashing layers may produce smaller images, it may have a negative
      impact on performance, as a single layer takes longer to extract, and
      you can't parallelize downloading a single layer.
    - When attempting to squash an image that doesn't make changes to the
      filesystem (for example, the Dockerfile only contains `ENV` instructions),
      the squash step will fail (see [issue #33823](https://github.com/moby/moby/issues/33823)).
@z

@x
    #### Prerequisites
@y
    #### Prerequisites
@z

@x
    The example on this page is using experimental mode in Docker 23.03.
@y
    The example on this page is using experimental mode in Docker 23.03.
@z

@x
    You can enable experimental mode by using the `--experimental` flag when starting
    the Docker daemon or setting `experimental: true` in the `daemon.json` configuration
    file.
@y
    You can enable experimental mode by using the `--experimental` flag when starting
    the Docker daemon or setting `experimental: true` in the `daemon.json` configuration
    file.
@z

@x
    By default, experimental mode is disabled. To see the current configuration of
    the Docker daemon, use the `docker version` command and check the `Experimental`
    line in the `Engine` section:
@y
    By default, experimental mode is disabled. To see the current configuration of
    the Docker daemon, use the `docker version` command and check the `Experimental`
    line in the `Engine` section:
@z

% snip output...

@x
    #### Build an image with the `--squash` flag
@y
    #### Build an image with the `--squash` flag
@z

@x
    The following is an example of a build with the `--squash` flag.  Below is the
    `Dockerfile`:
@y
    The following is an example of a build with the `--squash` flag.  Below is the
    `Dockerfile`:
@z

% snip code...

@x
    Next, build an image named `test` using the `--squash` flag.
@y
    Next, build an image named `test` using the `--squash` flag.
@z

% snip command...

@x
    After the build completes, the history looks like the below. The history could show that a layer's
    name is `<missing>`, and there is a new layer with COMMENT `merge`.
@y
    After the build completes, the history looks like the below. The history could show that a layer's
    name is `<missing>`, and there is a new layer with COMMENT `merge`.
@z

% snip command...

@x
    Test the image, check for `/remove_me` being gone, make sure `hello\nworld` is
    in `/hello`, make sure the `HELLO` environment variable's value is `world`.
@y
    Test the image, check for `/remove_me` being gone, make sure `hello\nworld` is
    in `/hello`, make sure the `HELLO` environment variable's value is `world`.
@z

% snip directives...
