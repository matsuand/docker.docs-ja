%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker buildx dap build
short: Start a build
long: |-
    Start a debug session using the [debug adapter protocol](https://microsoft.github.io/debug-adapter-protocol/overview) to communicate with the debugger UI.

    Arguments are the same as the `build`
@y
command: docker buildx dap build
short: Start a build
long: |-
    Start a debug session using the [debug adapter protocol](https://microsoft.github.io/debug-adapter-protocol/overview) to communicate with the debugger UI.

    Arguments are the same as the `build`
@z

@x
    > [!NOTE]
    > `buildx dap build` command may receive backwards incompatible features in the future
    > if needed. We are looking for feedback on improving the command and extending
    > the functionality further.
@y
    > [!NOTE]
    > `buildx dap build` command may receive backwards incompatible features in the future
    > if needed. We are looking for feedback on improving the command and extending
    > the functionality further.
@z

@x
usage: docker buildx dap build [OPTIONS] PATH | URL | -
@y
usage: docker buildx dap build [OPTIONS] PATH | URL | -
@z

% options:

@x add-host
      description: 'Add a custom host-to-IP mapping (format: `host:ip`)'
@y
      description: 'Add a custom host-to-IP mapping (format: `host:ip`)'
@z

@x allow
      description: |
        Allow extra privileged entitlement (e.g., `network.host`, `security.insecure`, `device`)
@y
      description: |
        Allow extra privileged entitlement (e.g., `network.host`, `security.insecure`, `device`)
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

@x call
      description: Set method for evaluating build (`check`, `outline`, `targets`)
@y
      description: Set method for evaluating build (`check`, `outline`, `targets`)
@z

@x cgroup-parent
      description: Set the parent cgroup for the `RUN` instructions during build
@y
      description: Set the parent cgroup for the `RUN` instructions during build
@z

@x check
      description: Shorthand for `--call=check`
@y
      description: Shorthand for `--call=check`
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
        Set type of progress output (`auto`, `none`,  `plain`, `quiet`, `rawjson`, `tty`). Use plain to show container output
@y
      description: |
        Set type of progress output (`auto`, `none`,  `plain`, `quiet`, `rawjson`, `tty`). Use plain to show container output
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

@x debug
      description: Enable debug logging
@y
      description: Enable debug logging
@z

@x
examples: |-
    ### Launch request arguments {#launch-config}
@y
examples: |-
    ### Launch request arguments {#launch-config}
@z

@x
    The following [launch request arguments](https://microsoft.github.io/debug-adapter-protocol/specification#Requests_Launch) are supported. These are sent as a JSON body as part of the launch request.
@y
    The following [launch request arguments](https://microsoft.github.io/debug-adapter-protocol/specification#Requests_Launch) are supported. These are sent as a JSON body as part of the launch request.
@z

@x
    | Name                | Type          | Default      | Description                                                                  |
    |:--------------------|:--------------|:-------------|:-----------------------------------------------------------------------------|
    | `dockerfile`        | `string`      | `Dockerfile` | Name of the Dockerfile                                                       |
    | `contextPath`       | `string`      | `.`          | Set the context path for the build (normally the first positional argument)  |
    | `target`            | `string`      |              | Set the target build stage to build                                          |
    | `stopOnEntry`       | `boolean`     | `false`      | Stop on the first instruction                                                |
@y
    | Name                | Type          | Default      | Description                                                                  |
    |:--------------------|:--------------|:-------------|:-----------------------------------------------------------------------------|
    | `dockerfile`        | `string`      | `Dockerfile` | Name of the Dockerfile                                                       |
    | `contextPath`       | `string`      | `.`          | Set the context path for the build (normally the first positional argument)  |
    | `target`            | `string`      |              | Set the target build stage to build                                          |
    | `stopOnEntry`       | `boolean`     | `false`      | Stop on the first instruction                                                |
@z

@x
    ### Additional Arguments {#additional-args}
@y
    ### Additional Arguments {#additional-args}
@z

@x
    Command line arguments may be passed to the debug adapter the same way they would be passed to the normal build command and they will set the value.
    Launch request arguments that are set will override command line arguments if they are present.
@y
    Command line arguments may be passed to the debug adapter the same way they would be passed to the normal build command and they will set the value.
    Launch request arguments that are set will override command line arguments if they are present.
@z

@x
    A debug extension should include an `args` and `builder` entry in the launch configuration. These will modify the arguments passed to the binary for the tool invocation.
    `builder` will add `--builder <arg>` directly after the executable and `args` will append to the end of the tool invocation.
    For example, a launch configuration in Visual Studio Code with the following:
@y
    A debug extension should include an `args` and `builder` entry in the launch configuration. These will modify the arguments passed to the binary for the tool invocation.
    `builder` will add `--builder <arg>` directly after the executable and `args` will append to the end of the tool invocation.
    For example, a launch configuration in Visual Studio Code with the following:
@z

@x
    ```json
    {
        "args": ["--build-arg", "FOO=AAA"]
        "builder": ["mybuilder"]
    }
    ```
@y
    ```json
    {
        "args": ["--build-arg", "FOO=AAA"]
        "builder": ["mybuilder"]
    }
    ```
@z

@x
    This should cause the debug adapter to be invoked as `docker buildx --builder mybuilder dap build --build-arg FOO=AAA`.
deprecated: false
hidden: false
experimental: false
experimentalcli: true
kubernetes: false
swarm: false
@y
    This should cause the debug adapter to be invoked as `docker buildx --builder mybuilder dap build --build-arg FOO=AAA`.
deprecated: false
hidden: false
experimental: false
experimentalcli: true
kubernetes: false
swarm: false
@z
