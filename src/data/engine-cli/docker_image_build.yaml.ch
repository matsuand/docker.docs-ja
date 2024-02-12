%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker image build
aliases: docker image build, docker build, docker buildx build, docker builder build
short: Build an image from a Dockerfile
long: |-
    The `docker build` command builds Docker images from a Dockerfile and a
    "context". A build's context is the set of files located in the specified
    `PATH` or `URL`. The build process can refer to any of the files in the
    context. For example, your build can use a [*COPY*](/engine/reference/builder/#copy)
    instruction to reference a file in the context.
@y
command: docker image build
aliases: docker image build, docker build, docker buildx build, docker builder build
short: Build an image from a Dockerfile
long: |-
    The `docker build` command builds Docker images from a Dockerfile and a
    "context". A build's context is the set of files located in the specified
    `PATH` or `URL`. The build process can refer to any of the files in the
    context. For example, your build can use a [*COPY*](__SUBDIR__/engine/reference/builder/#copy)
    instruction to reference a file in the context.
@z

@x
    The `URL` parameter can refer to three kinds of resources: Git repositories,
    pre-packaged tarball contexts, and plain text files.
@y
    The `URL` parameter can refer to three kinds of resources: Git repositories,
    pre-packaged tarball contexts, and plain text files.
@z

@x
    ### Git repositories
@y
    ### Git repositories
@z

@x
    When the `URL` parameter points to the location of a Git repository, the
    repository acts as the build context. The system recursively fetches the
    repository and its submodules. The commit history isn't preserved. A
    repository is first pulled into a temporary directory on your local host. After
    that succeeds, the command sends the directory to the Docker daemon as the context.
    Local copy gives you the ability to access private repositories using local
    user credentials, VPNs, and so forth.
@y
    When the `URL` parameter points to the location of a Git repository, the
    repository acts as the build context. The system recursively fetches the
    repository and its submodules. The commit history isn't preserved. A
    repository is first pulled into a temporary directory on your local host. After
    that succeeds, the command sends the directory to the Docker daemon as the context.
    Local copy gives you the ability to access private repositories using local
    user credentials, VPNs, and so forth.
@z

@x
    > **Note**
    >
    > If the `URL` parameter contains a fragment the system recursively clones
    > the repository and its submodules using a `git clone --recursive` command.
@y
    > **Note**
    >
    > If the `URL` parameter contains a fragment the system recursively clones
    > the repository and its submodules using a `git clone --recursive` command.
@z

@x
    Git URLs accept context configuration in their fragment section, separated by a
    colon (`:`).  The first part represents the reference that Git checks out,
    and can be either a branch, a tag, or a remote reference. The second part
    represents a subdirectory inside the repository used as a build
    context.
@y
    Git URLs accept context configuration in their fragment section, separated by a
    colon (`:`).  The first part represents the reference that Git checks out,
    and can be either a branch, a tag, or a remote reference. The second part
    represents a subdirectory inside the repository used as a build
    context.
@z

@x
    For example, run this command to use a directory called `docker` in the branch
    `container`:
@y
    For example, run this command to use a directory called `docker` in the branch
    `container`:
@z

@x
    ```console
    $ docker build https://github.com/docker/rootfs.git#container:docker
    ```
@y
    ```console
    $ docker build https://github.com/docker/rootfs.git#container:docker
    ```
@z

@x
    The following table represents all the valid suffixes with their build
    contexts:
@y
    The following table represents all the valid suffixes with their build
    contexts:
@z

@x
    | Build Syntax Suffix            | Commit Used           | Build Context Used |
    |--------------------------------|-----------------------|--------------------|
    | `myrepo.git`                   | `refs/heads/master`   | `/`                |
    | `myrepo.git#mytag`             | `refs/tags/mytag`     | `/`                |
    | `myrepo.git#mybranch`          | `refs/heads/mybranch` | `/`                |
    | `myrepo.git#pull/42/head`      | `refs/pull/42/head`   | `/`                |
    | `myrepo.git#:myfolder`         | `refs/heads/master`   | `/myfolder`        |
    | `myrepo.git#master:myfolder`   | `refs/heads/master`   | `/myfolder`        |
    | `myrepo.git#mytag:myfolder`    | `refs/tags/mytag`     | `/myfolder`        |
    | `myrepo.git#mybranch:myfolder` | `refs/heads/mybranch` | `/myfolder`        |
@y
    | Build Syntax Suffix            | Commit Used           | Build Context Used |
    |--------------------------------|-----------------------|--------------------|
    | `myrepo.git`                   | `refs/heads/master`   | `/`                |
    | `myrepo.git#mytag`             | `refs/tags/mytag`     | `/`                |
    | `myrepo.git#mybranch`          | `refs/heads/mybranch` | `/`                |
    | `myrepo.git#pull/42/head`      | `refs/pull/42/head`   | `/`                |
    | `myrepo.git#:myfolder`         | `refs/heads/master`   | `/myfolder`        |
    | `myrepo.git#master:myfolder`   | `refs/heads/master`   | `/myfolder`        |
    | `myrepo.git#mytag:myfolder`    | `refs/tags/mytag`     | `/myfolder`        |
    | `myrepo.git#mybranch:myfolder` | `refs/heads/mybranch` | `/myfolder`        |
@z

@x
    ### Tarball contexts
@y
    ### Tarball contexts
@z

@x
    If you pass a URL to a remote tarball, the command sends the URL itself to the
    daemon:
@y
    If you pass a URL to a remote tarball, the command sends the URL itself to the
    daemon:
@z

@x
    ```console
    $ docker build http://server/context.tar.gz
    ```
@y
    ```console
    $ docker build http://server/context.tar.gz
    ```
@z

@x
    The host running the Docker daemon performs the download operation,
    which isn't necessarily the same host that issued the build command.
    The Docker daemon fetches `context.tar.gz` and uses it as the
    build context. Tarball contexts must be tar archives conforming to the standard
    `tar` Unix format and can be compressed with any one of the `xz`, `bzip2`,
    `gzip` or `identity` (no compression) formats.
@y
    The host running the Docker daemon performs the download operation,
    which isn't necessarily the same host that issued the build command.
    The Docker daemon fetches `context.tar.gz` and uses it as the
    build context. Tarball contexts must be tar archives conforming to the standard
    `tar` Unix format and can be compressed with any one of the `xz`, `bzip2`,
    `gzip` or `identity` (no compression) formats.
@z

@x
    ### Text files
@y
    ### Text files
@z

@x
    Instead of specifying a context, you can pass a single `Dockerfile` in the
    `URL` or pipe the file in via `STDIN`. To pipe a `Dockerfile` from `STDIN`:
@y
    Instead of specifying a context, you can pass a single `Dockerfile` in the
    `URL` or pipe the file in via `STDIN`. To pipe a `Dockerfile` from `STDIN`:
@z

@x
    ```console
    $ docker build - < Dockerfile
    ```
@y
    ```console
    $ docker build - < Dockerfile
    ```
@z

@x
    With PowerShell on Windows, you run:
@y
    With PowerShell on Windows, you run:
@z

@x
    ```powershell
    Get-Content Dockerfile | docker build -
    ```
@y
    ```powershell
    Get-Content Dockerfile | docker build -
    ```
@z

@x
    If you use `STDIN` or specify a `URL` pointing to a plain text file, the daemon
    places the contents into a `Dockerfile`, and ignores any `-f`, `--file`
    option. In this scenario, there is no context.
@y
    If you use `STDIN` or specify a `URL` pointing to a plain text file, the daemon
    places the contents into a `Dockerfile`, and ignores any `-f`, `--file`
    option. In this scenario, there is no context.
@z

@x
    By default the `docker build` command looks for a `Dockerfile` at the root
    of the build context. The `-f`, `--file`, option lets you specify the path to
    an alternative file to use instead. This is useful in cases that use the same
    set of files for multiple builds. The path must be to a file within the
    build context. Relative path are interpreted as relative to the root of the
    context.
@y
    By default the `docker build` command looks for a `Dockerfile` at the root
    of the build context. The `-f`, `--file`, option lets you specify the path to
    an alternative file to use instead. This is useful in cases that use the same
    set of files for multiple builds. The path must be to a file within the
    build context. Relative path are interpreted as relative to the root of the
    context.
@z

@x
    In most cases, it's best to put each Dockerfile in an empty directory. Then,
    add to that directory only the files needed for building the Dockerfile. To
    increase the build's performance, you can exclude files and directories by
    adding a `.dockerignore` file to that directory as well. For information on
    creating one, see the [.dockerignore file](/engine/reference/builder/#dockerignore-file).
@y
    In most cases, it's best to put each Dockerfile in an empty directory. Then,
    add to that directory only the files needed for building the Dockerfile. To
    increase the build's performance, you can exclude files and directories by
    adding a `.dockerignore` file to that directory as well. For information on
    creating one, see the [.dockerignore file](__SUBDIR__/engine/reference/builder/#dockerignore-file).
@z

@x
    If the Docker client loses connection to the daemon, it cancels the build.
    This happens if you interrupt the Docker client with `CTRL-c` or if the Docker
    client is killed for any reason. If the build initiated a pull which is still
    running at the time the build is cancelled, the client also cancels the pull.
usage: docker image build [OPTIONS] PATH | URL | -
pname: docker image
plink: docker_image.yaml
options:
    - option: add-host
      value_type: list
      description: Add a custom host-to-IP mapping (`host:ip`)
      details_url: '#add-host'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: build-arg
      value_type: list
      description: Set build-time variables
      details_url: '#build-arg'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cache-from
      value_type: stringSlice
      default_value: '[]'
      description: Images to consider as cache sources
      details_url: '#cache-from'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cgroup-parent
      value_type: string
      description: Set the parent cgroup for the `RUN` instructions during build
      details_url: '#cgroup-parent'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: compress
      value_type: bool
      default_value: "false"
      description: Compress the build context using gzip
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-period
      value_type: int64
      default_value: "0"
      description: Limit the CPU CFS (Completely Fair Scheduler) period
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-quota
      value_type: int64
      default_value: "0"
      description: Limit the CPU CFS (Completely Fair Scheduler) quota
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-shares
      shorthand: c
      value_type: int64
      default_value: "0"
      description: CPU shares (relative weight)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpuset-cpus
      value_type: string
      description: CPUs in which to allow execution (0-3, 0,1)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpuset-mems
      value_type: string
      description: MEMs in which to allow execution (0-3, 0,1)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: disable-content-trust
      value_type: bool
      default_value: "true"
      description: Skip image verification
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: file
      shorthand: f
      value_type: string
      description: Name of the Dockerfile (Default is `PATH/Dockerfile`)
      details_url: '#file'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: force-rm
      value_type: bool
      default_value: "false"
      description: Always remove intermediate containers
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: iidfile
      value_type: string
      description: Write the image ID to the file
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: isolation
      value_type: string
      description: Container isolation technology
      details_url: '#isolation'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: label
      value_type: list
      description: Set metadata for an image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: memory
      shorthand: m
      value_type: bytes
      default_value: "0"
      description: Memory limit
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: memory-swap
      value_type: bytes
      default_value: "0"
      description: 'Swap limit equal to memory plus swap: -1 to enable unlimited swap'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: network
      value_type: string
      default_value: default
      description: Set the networking mode for the RUN instructions during build
      details_url: '#network'
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-cache
      value_type: bool
      default_value: "false"
      description: Do not use cache when building the image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: platform
      value_type: string
      description: Set platform if server is multi-platform capable
      deprecated: false
      hidden: false
      min_api_version: "1.38"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: pull
      value_type: bool
      default_value: "false"
      description: Always attempt to pull a newer version of the image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: quiet
      shorthand: q
      value_type: bool
      default_value: "false"
      description: Suppress the build output and print image ID on success
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: rm
      value_type: bool
      default_value: "true"
      description: Remove intermediate containers after a successful build
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: security-opt
      value_type: stringSlice
      default_value: '[]'
      description: Security options
      details_url: '#security-opt'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: shm-size
      value_type: bytes
      default_value: "0"
      description: Size of `/dev/shm`
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: squash
      value_type: bool
      default_value: "false"
      description: Squash newly built layers into a single new layer
      details_url: '#squash'
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: true
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: tag
      shorthand: t
      value_type: list
      description: Name and optionally a tag in the `name:tag` format
      details_url: '#tag'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: target
      value_type: string
      description: Set the target build stage to build.
      details_url: '#target'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: ulimit
      value_type: ulimit
      default_value: '[]'
      description: Ulimit options
      details_url: '#ulimit'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: help
      value_type: bool
      default_value: "false"
      description: Print usage
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Build with PATH
@y
    If the Docker client loses connection to the daemon, it cancels the build.
    This happens if you interrupt the Docker client with `CTRL-c` or if the Docker
    client is killed for any reason. If the build initiated a pull which is still
    running at the time the build is cancelled, the client also cancels the pull.
usage: docker image build [OPTIONS] PATH | URL | -
pname: docker image
plink: docker_image.yaml
options:
    - option: add-host
      value_type: list
      description: Add a custom host-to-IP mapping (`host:ip`)
      details_url: '#add-host'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: build-arg
      value_type: list
      description: Set build-time variables
      details_url: '#build-arg'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cache-from
      value_type: stringSlice
      default_value: '[]'
      description: Images to consider as cache sources
      details_url: '#cache-from'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cgroup-parent
      value_type: string
      description: Set the parent cgroup for the `RUN` instructions during build
      details_url: '#cgroup-parent'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: compress
      value_type: bool
      default_value: "false"
      description: Compress the build context using gzip
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-period
      value_type: int64
      default_value: "0"
      description: Limit the CPU CFS (Completely Fair Scheduler) period
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-quota
      value_type: int64
      default_value: "0"
      description: Limit the CPU CFS (Completely Fair Scheduler) quota
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-shares
      shorthand: c
      value_type: int64
      default_value: "0"
      description: CPU shares (relative weight)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpuset-cpus
      value_type: string
      description: CPUs in which to allow execution (0-3, 0,1)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpuset-mems
      value_type: string
      description: MEMs in which to allow execution (0-3, 0,1)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: disable-content-trust
      value_type: bool
      default_value: "true"
      description: Skip image verification
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: file
      shorthand: f
      value_type: string
      description: Name of the Dockerfile (Default is `PATH/Dockerfile`)
      details_url: '#file'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: force-rm
      value_type: bool
      default_value: "false"
      description: Always remove intermediate containers
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: iidfile
      value_type: string
      description: Write the image ID to the file
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: isolation
      value_type: string
      description: Container isolation technology
      details_url: '#isolation'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: label
      value_type: list
      description: Set metadata for an image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: memory
      shorthand: m
      value_type: bytes
      default_value: "0"
      description: Memory limit
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: memory-swap
      value_type: bytes
      default_value: "0"
      description: 'Swap limit equal to memory plus swap: -1 to enable unlimited swap'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: network
      value_type: string
      default_value: default
      description: Set the networking mode for the RUN instructions during build
      details_url: '#network'
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-cache
      value_type: bool
      default_value: "false"
      description: Do not use cache when building the image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: platform
      value_type: string
      description: Set platform if server is multi-platform capable
      deprecated: false
      hidden: false
      min_api_version: "1.38"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: pull
      value_type: bool
      default_value: "false"
      description: Always attempt to pull a newer version of the image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: quiet
      shorthand: q
      value_type: bool
      default_value: "false"
      description: Suppress the build output and print image ID on success
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: rm
      value_type: bool
      default_value: "true"
      description: Remove intermediate containers after a successful build
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: security-opt
      value_type: stringSlice
      default_value: '[]'
      description: Security options
      details_url: '#security-opt'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: shm-size
      value_type: bytes
      default_value: "0"
      description: Size of `/dev/shm`
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: squash
      value_type: bool
      default_value: "false"
      description: Squash newly built layers into a single new layer
      details_url: '#squash'
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: true
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: tag
      shorthand: t
      value_type: list
      description: Name and optionally a tag in the `name:tag` format
      details_url: '#tag'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: target
      value_type: string
      description: Set the target build stage to build.
      details_url: '#target'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: ulimit
      value_type: ulimit
      default_value: '[]'
      description: Ulimit options
      details_url: '#ulimit'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
inherited_options:
    - option: help
      value_type: bool
      default_value: "false"
      description: Print usage
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Build with PATH
@z

@x
    ```console
    $ docker build .
@y
    ```console
    $ docker build .
@z

@x
    Uploading context 10240 bytes
    Step 1/3 : FROM busybox
    Pulling repository busybox
     ---> e9aa60c60128MB/2.284 MB (100%) endpoint: https://cdn-registry-1.docker.io/v1/
    Step 2/3 : RUN ls -lh /
     ---> Running in 9c9e81692ae9
    total 24
    drwxr-xr-x    2 root     root        4.0K Mar 12  2013 bin
    drwxr-xr-x    5 root     root        4.0K Oct 19 00:19 dev
    drwxr-xr-x    2 root     root        4.0K Oct 19 00:19 etc
    drwxr-xr-x    2 root     root        4.0K Nov 15 23:34 lib
    lrwxrwxrwx    1 root     root           3 Mar 12  2013 lib64 -> lib
    dr-xr-xr-x  116 root     root           0 Nov 15 23:34 proc
    lrwxrwxrwx    1 root     root           3 Mar 12  2013 sbin -> bin
    dr-xr-xr-x   13 root     root           0 Nov 15 23:34 sys
    drwxr-xr-x    2 root     root        4.0K Mar 12  2013 tmp
    drwxr-xr-x    2 root     root        4.0K Nov 15 23:34 usr
     ---> b35f4035db3f
    Step 3/3 : CMD echo Hello world
     ---> Running in 02071fceb21b
     ---> f52f38b7823e
    Successfully built f52f38b7823e
    Removing intermediate container 9c9e81692ae9
    Removing intermediate container 02071fceb21b
    ```
@y
    Uploading context 10240 bytes
    Step 1/3 : FROM busybox
    Pulling repository busybox
     ---> e9aa60c60128MB/2.284 MB (100%) endpoint: https://cdn-registry-1.docker.io/v1/
    Step 2/3 : RUN ls -lh /
     ---> Running in 9c9e81692ae9
    total 24
    drwxr-xr-x    2 root     root        4.0K Mar 12  2013 bin
    drwxr-xr-x    5 root     root        4.0K Oct 19 00:19 dev
    drwxr-xr-x    2 root     root        4.0K Oct 19 00:19 etc
    drwxr-xr-x    2 root     root        4.0K Nov 15 23:34 lib
    lrwxrwxrwx    1 root     root           3 Mar 12  2013 lib64 -> lib
    dr-xr-xr-x  116 root     root           0 Nov 15 23:34 proc
    lrwxrwxrwx    1 root     root           3 Mar 12  2013 sbin -> bin
    dr-xr-xr-x   13 root     root           0 Nov 15 23:34 sys
    drwxr-xr-x    2 root     root        4.0K Mar 12  2013 tmp
    drwxr-xr-x    2 root     root        4.0K Nov 15 23:34 usr
     ---> b35f4035db3f
    Step 3/3 : CMD echo Hello world
     ---> Running in 02071fceb21b
     ---> f52f38b7823e
    Successfully built f52f38b7823e
    Removing intermediate container 9c9e81692ae9
    Removing intermediate container 02071fceb21b
    ```
@z

@x
    This example specifies that the `PATH` is `.`, and so `tar`s all the files in the
    local directory and sends them to the Docker daemon. The `PATH` specifies
    where to find the files for the "context" of the build on the Docker daemon.
    Remember that the daemon could be running on a remote machine and that no
    parsing of the Dockerfile happens at the client side (where you're running
    `docker build`). That means that all the files at `PATH` are sent, not just
    the ones listed to [`ADD`](/engine/reference/builder/#add)
    in the Dockerfile.
@y
    This example specifies that the `PATH` is `.`, and so `tar`s all the files in the
    local directory and sends them to the Docker daemon. The `PATH` specifies
    where to find the files for the "context" of the build on the Docker daemon.
    Remember that the daemon could be running on a remote machine and that no
    parsing of the Dockerfile happens at the client side (where you're running
    `docker build`). That means that all the files at `PATH` are sent, not just
    the ones listed to [`ADD`](__SUBDIR__/engine/reference/builder/#add)
    in the Dockerfile.
@z

@x
    The transfer of context from the local machine to the Docker daemon is what the
    `docker` client means when you see the "Sending build context" message.
@y
    The transfer of context from the local machine to the Docker daemon is what the
    `docker` client means when you see the "Sending build context" message.
@z

@x
    If you wish to keep the intermediate containers after the build is complete,
    you must use `--rm=false`. This doesn't affect the build cache.
@y
    If you wish to keep the intermediate containers after the build is complete,
    you must use `--rm=false`. This doesn't affect the build cache.
@z

@x
    ### Build with URL
@y
    ### Build with URL
@z

@x
    ```console
    $ docker build github.com/creack/docker-firefox
    ```
@y
    ```console
    $ docker build github.com/creack/docker-firefox
    ```
@z

@x
    This clones the GitHub repository, using the cloned repository as context,
    and the Dockerfile at the root of the repository. You can
    specify an arbitrary Git repository by using the `git://` or `git@` scheme.
@y
    This clones the GitHub repository, using the cloned repository as context,
    and the Dockerfile at the root of the repository. You can
    specify an arbitrary Git repository by using the `git://` or `git@` scheme.
@z

@x
    ```console
    $ docker build -f ctx/Dockerfile http://server/ctx.tar.gz
@y
    ```console
    $ docker build -f ctx/Dockerfile http://server/ctx.tar.gz
@z

@x
    Downloading context: http://server/ctx.tar.gz [===================>]    240 B/240 B
    Step 1/3 : FROM busybox
     ---> 8c2e06607696
    Step 2/3 : ADD ctx/container.cfg /
     ---> e7829950cee3
    Removing intermediate container b35224abf821
    Step 3/3 : CMD /bin/ls
     ---> Running in fbc63d321d73
     ---> 3286931702ad
    Removing intermediate container fbc63d321d73
    Successfully built 377c409b35e4
    ```
@y
    Downloading context: http://server/ctx.tar.gz [===================>]    240 B/240 B
    Step 1/3 : FROM busybox
     ---> 8c2e06607696
    Step 2/3 : ADD ctx/container.cfg /
     ---> e7829950cee3
    Removing intermediate container b35224abf821
    Step 3/3 : CMD /bin/ls
     ---> Running in fbc63d321d73
     ---> 3286931702ad
    Removing intermediate container fbc63d321d73
    Successfully built 377c409b35e4
    ```
@z

@x
    This sends the URL `http://server/ctx.tar.gz` to the Docker daemon, which
    downloads and extracts the referenced tarball. The `-f ctx/Dockerfile`
    parameter specifies a path inside `ctx.tar.gz` to the `Dockerfile` used
    to build the image. Any `ADD` commands in that `Dockerfile` that refer to local
    paths must be relative to the root of the contents inside `ctx.tar.gz`. In the
    example above, the tarball contains a directory `ctx/`, so the `ADD
    ctx/container.cfg /` operation works as expected.
@y
    This sends the URL `http://server/ctx.tar.gz` to the Docker daemon, which
    downloads and extracts the referenced tarball. The `-f ctx/Dockerfile`
    parameter specifies a path inside `ctx.tar.gz` to the `Dockerfile` used
    to build the image. Any `ADD` commands in that `Dockerfile` that refer to local
    paths must be relative to the root of the contents inside `ctx.tar.gz`. In the
    example above, the tarball contains a directory `ctx/`, so the `ADD
    ctx/container.cfg /` operation works as expected.
@z

@x
    ### Build with `-`
@y
    ### Build with `-`
@z

@x
    ```console
    $ docker build - < Dockerfile
    ```
@y
    ```console
    $ docker build - < Dockerfile
    ```
@z

@x
    This example reads a Dockerfile from `STDIN` without context. Due to the lack of a
    context, the command doesn't send contents of any local directory to the Docker daemon.
    Since there is no context, a Dockerfile `ADD` only works if it refers to a
    remote URL.
@y
    This example reads a Dockerfile from `STDIN` without context. Due to the lack of a
    context, the command doesn't send contents of any local directory to the Docker daemon.
    Since there is no context, a Dockerfile `ADD` only works if it refers to a
    remote URL.
@z

@x
    ```console
    $ docker build - < context.tar.gz
    ```
@y
    ```console
    $ docker build - < context.tar.gz
    ```
@z

@x
    This example builds an image for a compressed context read from `STDIN`.
    Supported formats are: `bzip2`, `gzip` and `xz`.
@y
    This example builds an image for a compressed context read from `STDIN`.
    Supported formats are: `bzip2`, `gzip` and `xz`.
@z

@x
    ### Use a .dockerignore file
@y
    ### Use a .dockerignore file
@z

@x
    ```console
    $ docker build .
@y
    ```console
    $ docker build .
@z

@x
    Uploading context 18.829 MB
    Uploading context
    Step 1/2 : FROM busybox
     ---> 769b9341d937
    Step 2/2 : CMD echo Hello world
     ---> Using cache
     ---> 99cc1ad10469
    Successfully built 99cc1ad10469
    $ echo ".git" > .dockerignore
    $ docker build .
    Uploading context  6.76 MB
    Uploading context
    Step 1/2 : FROM busybox
     ---> 769b9341d937
    Step 2/2 : CMD echo Hello world
     ---> Using cache
     ---> 99cc1ad10469
    Successfully built 99cc1ad10469
    ```
@y
    Uploading context 18.829 MB
    Uploading context
    Step 1/2 : FROM busybox
     ---> 769b9341d937
    Step 2/2 : CMD echo Hello world
     ---> Using cache
     ---> 99cc1ad10469
    Successfully built 99cc1ad10469
    $ echo ".git" > .dockerignore
    $ docker build .
    Uploading context  6.76 MB
    Uploading context
    Step 1/2 : FROM busybox
     ---> 769b9341d937
    Step 2/2 : CMD echo Hello world
     ---> Using cache
     ---> 99cc1ad10469
    Successfully built 99cc1ad10469
    ```
@z

@x
    This example shows the use of the `.dockerignore` file to exclude the `.git`
    directory from the context. You can see its effect in the changed size of the
    uploaded context. The builder reference contains detailed information on
    [creating a .dockerignore file](/engine/reference/builder/#dockerignore-file).
@y
    This example shows the use of the `.dockerignore` file to exclude the `.git`
    directory from the context. You can see its effect in the changed size of the
    uploaded context. The builder reference contains detailed information on
    [creating a .dockerignore file](__SUBDIR__/engine/reference/builder/#dockerignore-file).
@z

@x
    When using the [BuildKit backend](/build/buildkit/),
    `docker build` searches for a `.dockerignore` file relative to the Dockerfile
    name. For example, running `docker build -f myapp.Dockerfile .` first looks
    for an ignore file named `myapp.Dockerfile.dockerignore`. If it can't find such a file,
    if present, it uses the `.dockerignore` file. Using a Dockerfile based
    `.dockerignore` is useful if a project contains multiple Dockerfiles that expect
    to ignore different sets of files.
@y
    When using the [BuildKit backend](__SUBDIR__/build/buildkit/),
    `docker build` searches for a `.dockerignore` file relative to the Dockerfile
    name. For example, running `docker build -f myapp.Dockerfile .` first looks
    for an ignore file named `myapp.Dockerfile.dockerignore`. If it can't find such a file,
    if present, it uses the `.dockerignore` file. Using a Dockerfile based
    `.dockerignore` is useful if a project contains multiple Dockerfiles that expect
    to ignore different sets of files.
@z

@x
    ### Tag an image (-t, --tag) {#tag}
@y
    ### Tag an image (-t, --tag) {#tag}
@z

@x
    ```console
    $ docker build -t vieux/apache:2.0 .
    ```
@y
    ```console
    $ docker build -t vieux/apache:2.0 .
    ```
@z

@x
    This examples builds in the same way as the previous example, but it then tags the resulting
    image. The repository name will be `vieux/apache` and the tag `2.0`.
@y
    This examples builds in the same way as the previous example, but it then tags the resulting
    image. The repository name will be `vieux/apache` and the tag `2.0`.
@z

@x
    [Read more about valid tags](image_tag.md).
@y
    [Read more about valid tags](image_tag.md).
@z

@x
    You can apply multiple tags to an image. For example, you can apply the `latest`
    tag to a newly built image and add another tag that references a specific
    version.
@y
    You can apply multiple tags to an image. For example, you can apply the `latest`
    tag to a newly built image and add another tag that references a specific
    version.
@z

@x
    For example, to tag an image both as `whenry/fedora-jboss:latest` and
    `whenry/fedora-jboss:v2.1`, use the following:
@y
    For example, to tag an image both as `whenry/fedora-jboss:latest` and
    `whenry/fedora-jboss:v2.1`, use the following:
@z

@x
    ```console
    $ docker build -t whenry/fedora-jboss:latest -t whenry/fedora-jboss:v2.1 .
    ```
@y
    ```console
    $ docker build -t whenry/fedora-jboss:latest -t whenry/fedora-jboss:v2.1 .
    ```
@z

@x
    ### Specify a Dockerfile (-f, --file) {#file}
@y
    ### Specify a Dockerfile (-f, --file) {#file}
@z

@x
    ```console
    $ docker build -f Dockerfile.debug .
    ```
@y
    ```console
    $ docker build -f Dockerfile.debug .
    ```
@z

@x
    This uses a file called `Dockerfile.debug` for the build instructions
    instead of `Dockerfile`.
@y
    This uses a file called `Dockerfile.debug` for the build instructions
    instead of `Dockerfile`.
@z

@x
    ```console
    $ curl example.com/remote/Dockerfile | docker build -f - .
    ```
@y
    ```console
    $ curl example.com/remote/Dockerfile | docker build -f - .
    ```
@z

@x
    The above command uses the current directory as the build context and reads
    a Dockerfile from stdin.
@y
    The above command uses the current directory as the build context and reads
    a Dockerfile from stdin.
@z

@x
    ```console
    $ docker build -f dockerfiles/Dockerfile.debug -t myapp_debug .
    $ docker build -f dockerfiles/Dockerfile.prod  -t myapp_prod .
    ```
@y
    ```console
    $ docker build -f dockerfiles/Dockerfile.debug -t myapp_debug .
    $ docker build -f dockerfiles/Dockerfile.prod  -t myapp_prod .
    ```
@z

@x
    The above commands build the current build context (as specified by the
    `.`) twice. Once using a debug version of a `Dockerfile` and once using a
    production version.
@y
    The above commands build the current build context (as specified by the
    `.`) twice. Once using a debug version of a `Dockerfile` and once using a
    production version.
@z

@x
    ```console
    $ cd /home/me/myapp/some/dir/really/deep
    $ docker build -f /home/me/myapp/dockerfiles/debug /home/me/myapp
    $ docker build -f ../../../../dockerfiles/debug /home/me/myapp
    ```
@y
    ```console
    $ cd /home/me/myapp/some/dir/really/deep
    $ docker build -f /home/me/myapp/dockerfiles/debug /home/me/myapp
    $ docker build -f ../../../../dockerfiles/debug /home/me/myapp
    ```
@z

@x
    These two `docker build` commands do the exact same thing. They both use the
    contents of the `debug` file instead of looking for a `Dockerfile` and use
    `/home/me/myapp` as the root of the build context. Note that `debug` is in the
    directory structure of the build context, regardless of how you refer to it on
    the command line.
@y
    These two `docker build` commands do the exact same thing. They both use the
    contents of the `debug` file instead of looking for a `Dockerfile` and use
    `/home/me/myapp` as the root of the build context. Note that `debug` is in the
    directory structure of the build context, regardless of how you refer to it on
    the command line.
@z

@x
    > **Note**
    >
    > `docker build` returns a `no such file or directory` error if the
    > file or directory doesn't exist in the uploaded context. This may
    > happen if there is no context, or if you specify a file that's
    > elsewhere on the Host system. The context is limited to the current
    > directory (and its children) for security reasons, and to ensure
    > repeatable builds on remote Docker hosts. This is also the reason why
    > `ADD ../file` doesn't work.
@y
    > **Note**
    >
    > `docker build` returns a `no such file or directory` error if the
    > file or directory doesn't exist in the uploaded context. This may
    > happen if there is no context, or if you specify a file that's
    > elsewhere on the Host system. The context is limited to the current
    > directory (and its children) for security reasons, and to ensure
    > repeatable builds on remote Docker hosts. This is also the reason why
    > `ADD ../file` doesn't work.
@z

@x
    ### Use a custom parent cgroup (--cgroup-parent) {#cgroup-parent}
@y
    ### Use a custom parent cgroup (--cgroup-parent) {#cgroup-parent}
@z

@x
    When you run `docker build` with the `--cgroup-parent` option, the daemon runs the containers
    used in the build with the [corresponding `docker run` flag](../run.md#specify-custom-cgroups).
@y
    When you run `docker build` with the `--cgroup-parent` option, the daemon runs the containers
    used in the build with the [corresponding `docker run` flag](../run.md#specify-custom-cgroups).
@z

@x
    ### Set ulimits in container (--ulimit) {#ulimit}
@y
    ### Set ulimits in container (--ulimit) {#ulimit}
@z

@x
    Using the `--ulimit` option with `docker build` causes the daemon to start each build step's
    container using those [`--ulimit` flag values](run.md#ulimit).
@y
    Using the `--ulimit` option with `docker build` causes the daemon to start each build step's
    container using those [`--ulimit` flag values](run.md#ulimit).
@z

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

@x
    ```console
    $ docker build --build-arg HTTP_PROXY=http://10.20.30.2:1234 --build-arg FTP_PROXY=http://40.50.60.5:4567 .
    ```
@y
    ```console
    $ docker build --build-arg HTTP_PROXY=http://10.20.30.2:1234 --build-arg FTP_PROXY=http://40.50.60.5:4567 .
    ```
@z

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
    [Dockerfile reference](/engine/reference/builder/).
@y
    For detailed information on using `ARG` and `ENV` instructions, see the
    [Dockerfile reference](__SUBDIR__/engine/reference/builder/).
@z

@x
    You can also use the `--build-arg` flag without a value, in which case the daemon
    propagates the value from the local environment into the Docker container it's building:
@y
    You can also use the `--build-arg` flag without a value, in which case the daemon
    propagates the value from the local environment into the Docker container it's building:
@z

@x
    ```console
    $ export HTTP_PROXY=http://10.20.30.2:1234
    $ docker build --build-arg HTTP_PROXY .
    ```
@y
    ```console
    $ export HTTP_PROXY=http://10.20.30.2:1234
    $ docker build --build-arg HTTP_PROXY .
    ```
@z

@x
    This example is similar to how `docker run -e` works. Refer to the [`docker run` documentation](run.md#env)
    for more information.
@y
    This example is similar to how `docker run -e` works. Refer to the [`docker run` documentation](run.md#env)
    for more information.
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
    ### Specify isolation technology for container (--isolation) {#isolation}
@y
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
    ### Add entries to container hosts file (--add-host) {#add-host}
@y
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

@x
    ```console
    $ docker build --add-host my_hostname=8.8.8.8 --add-host my_hostname_v6=2001:4860:4860::8888 .
    ```
@y
    ```console
    $ docker build --add-host my_hostname=8.8.8.8 --add-host my_hostname_v6=2001:4860:4860::8888 .
    ```
@z

@x
    If you need your build to connect to services running on the host, you can use
    the special `host-gateway` value for `--add-host`. In the following example,
    build containers resolve `host.docker.internal` to the host's gateway IP.
@y
    If you need your build to connect to services running on the host, you can use
    the special `host-gateway` value for `--add-host`. In the following example,
    build containers resolve `host.docker.internal` to the host's gateway IP.
@z

@x
    ```console
    $ docker build --add-host host.docker.internal=host-gateway .
    ```
@y
    ```console
    $ docker build --add-host host.docker.internal=host-gateway .
    ```
@z

@x
    You can wrap an IPv6 address in square brackets.
    `=` and `:` are both valid separators.
    Both formats in the following example are valid:
@y
    You can wrap an IPv6 address in square brackets.
    `=` and `:` are both valid separators.
    Both formats in the following example are valid:
@z

@x
    ```console
    $ docker build --add-host my-hostname:10.180.0.1 --add-host my-hostname_v6=[2001:4860:4860::8888] .
    ```
@y
    ```console
    $ docker build --add-host my-hostname:10.180.0.1 --add-host my-hostname_v6=[2001:4860:4860::8888] .
    ```
@z

@x
    ### Specifying target build stage (--target) {#target}
@y
    ### Specifying target build stage (--target) {#target}
@z

@x
    When building a Dockerfile with multiple build stages, you can use the `--target`
    option to specify an intermediate build stage by name as a final stage for the
    resulting image. The daemon skips commands after the target stage.
@y
    When building a Dockerfile with multiple build stages, you can use the `--target`
    option to specify an intermediate build stage by name as a final stage for the
    resulting image. The daemon skips commands after the target stage.
@z

@x
    ```dockerfile
    FROM debian AS build-env
    # ...
@y
    ```dockerfile
    FROM debian AS build-env
    # ...
@z

@x
    FROM alpine AS production-env
    # ...
    ```
@y
    FROM alpine AS production-env
    # ...
    ```
@z

@x
    ```console
    $ docker build -t mybuildimage --target build-env .
    ```
@y
    ```console
    $ docker build -t mybuildimage --target build-env .
    ```
@z

@x
    ### Custom build outputs (--output) {#output}
@y
    ### Custom build outputs (--output) {#output}
@z

@x
    > **Note**
    >
    > This feature requires the BuildKit backend. You can either
    > [enable BuildKit](/build/buildkit/#getting-started) or
    > use the [buildx](https://github.com/docker/buildx) plugin which provides more
    > output type options.
@y
    > **Note**
    >
    > This feature requires the BuildKit backend. You can either
    > [enable BuildKit](__SUBDIR__/build/buildkit/#getting-started) or
    > use the [buildx](https://github.com/docker/buildx) plugin which provides more
    > output type options.
@z

@x
    By default, a local container image is created from the build result. The
    `--output` (or `-o`) flag allows you to override this behavior, and specify a
    custom exporter. Custom exporters allow you to export the build
    artifacts as files on the local filesystem instead of a Docker image, which can
    be useful for generating local binaries, code generation etc.
@y
    By default, a local container image is created from the build result. The
    `--output` (or `-o`) flag allows you to override this behavior, and specify a
    custom exporter. Custom exporters allow you to export the build
    artifacts as files on the local filesystem instead of a Docker image, which can
    be useful for generating local binaries, code generation etc.
@z

@x
    The value for `--output` is a CSV-formatted string defining the exporter type
    and options that supports `local` and `tar` exporters.
@y
    The value for `--output` is a CSV-formatted string defining the exporter type
    and options that supports `local` and `tar` exporters.
@z

@x
    The `local` exporter writes the resulting build files to a directory on the client side. The
    `tar` exporter is similar but writes the files as a single tarball (`.tar`).
@y
    The `local` exporter writes the resulting build files to a directory on the client side. The
    `tar` exporter is similar but writes the files as a single tarball (`.tar`).
@z

@x
    If you specify no type, the value defaults to the output directory of the local
    exporter. Use a hyphen (`-`) to write the output tarball to standard output
    (`STDOUT`).
@y
    If you specify no type, the value defaults to the output directory of the local
    exporter. Use a hyphen (`-`) to write the output tarball to standard output
    (`STDOUT`).
@z

@x
    The following example builds an image using the current directory (`.`) as a build
    context, and exports the files to a directory named `out` in the current directory.
    If the directory does not exist, Docker creates the directory automatically:
@y
    The following example builds an image using the current directory (`.`) as a build
    context, and exports the files to a directory named `out` in the current directory.
    If the directory does not exist, Docker creates the directory automatically:
@z

@x
    ```console
    $ docker build -o out .
    ```
@y
    ```console
    $ docker build -o out .
    ```
@z

@x
    The example above uses the short-hand syntax, omitting the `type` options, and
    thus uses the default (`local`) exporter. The example below shows the equivalent
    using the long-hand CSV syntax, specifying both `type` and `dest` (destination
    path):
@y
    The example above uses the short-hand syntax, omitting the `type` options, and
    thus uses the default (`local`) exporter. The example below shows the equivalent
    using the long-hand CSV syntax, specifying both `type` and `dest` (destination
    path):
@z

@x
    ```console
    $ docker build --output type=local,dest=out .
    ```
@y
    ```console
    $ docker build --output type=local,dest=out .
    ```
@z

@x
    Use the `tar` type to export the files as a `.tar` archive:
@y
    Use the `tar` type to export the files as a `.tar` archive:
@z

@x
    ```console
    $ docker build --output type=tar,dest=out.tar .
    ```
@y
    ```console
    $ docker build --output type=tar,dest=out.tar .
    ```
@z

@x
    The example below shows the equivalent when using the short-hand syntax. In this
    case, `-` is specified as destination, which automatically selects the `tar` type,
    and writes the output tarball to standard output, which is then redirected to
    the `out.tar` file:
@y
    The example below shows the equivalent when using the short-hand syntax. In this
    case, `-` is specified as destination, which automatically selects the `tar` type,
    and writes the output tarball to standard output, which is then redirected to
    the `out.tar` file:
@z

@x
    ```console
    $ docker build -o - . > out.tar
    ```
@y
    ```console
    $ docker build -o - . > out.tar
    ```
@z

@x
    The `--output` option exports all files from the target stage. A common pattern
    for exporting only specific files is to do multi-stage builds and to copy the
    desired files to a new scratch stage with [`COPY --from`](/engine/reference/builder/#copy).
@y
    The `--output` option exports all files from the target stage. A common pattern
    for exporting only specific files is to do multi-stage builds and to copy the
    desired files to a new scratch stage with [`COPY --from`](__SUBDIR__/engine/reference/builder/#copy).
@z

@x
    The example, the `Dockerfile` below uses a separate stage to collect the
    build artifacts for exporting:
@y
    The example, the `Dockerfile` below uses a separate stage to collect the
    build artifacts for exporting:
@z

@x
    ```dockerfile
    FROM golang AS build-stage
    RUN go get -u github.com/LK4D4/vndr
@y
    ```dockerfile
    FROM golang AS build-stage
    RUN go get -u github.com/LK4D4/vndr
@z

@x
    FROM scratch AS export-stage
    COPY --from=build-stage /go/bin/vndr /
    ```
@y
    FROM scratch AS export-stage
    COPY --from=build-stage /go/bin/vndr /
    ```
@z

@x
    When building the Dockerfile with the `-o` option, the command only exports the files from the final
    stage to the `out` directory, in this case, the `vndr` binary:
@y
    When building the Dockerfile with the `-o` option, the command only exports the files from the final
    stage to the `out` directory, in this case, the `vndr` binary:
@z

@x
    ```console
    $ docker build -o out .
@y
    ```console
    $ docker build -o out .
@z

@x
    [+] Building 2.3s (7/7) FINISHED
     => [internal] load build definition from Dockerfile                                                                          0.1s
     => => transferring dockerfile: 176B                                                                                          0.0s
     => [internal] load .dockerignore                                                                                             0.0s
     => => transferring context: 2B                                                                                               0.0s
     => [internal] load metadata for docker.io/library/golang:latest                                                              1.6s
     => [build-stage 1/2] FROM docker.io/library/golang@sha256:2df96417dca0561bf1027742dcc5b446a18957cd28eba6aa79269f23f1846d3f   0.0s
     => => resolve docker.io/library/golang@sha256:2df96417dca0561bf1027742dcc5b446a18957cd28eba6aa79269f23f1846d3f               0.0s
     => CACHED [build-stage 2/2] RUN go get -u github.com/LK4D4/vndr                                                              0.0s
     => [export-stage 1/1] COPY --from=build-stage /go/bin/vndr /                                                                 0.2s
     => exporting to client                                                                                                       0.4s
     => => copying files 10.30MB                                                                                                  0.3s
@y
    [+] Building 2.3s (7/7) FINISHED
     => [internal] load build definition from Dockerfile                                                                          0.1s
     => => transferring dockerfile: 176B                                                                                          0.0s
     => [internal] load .dockerignore                                                                                             0.0s
     => => transferring context: 2B                                                                                               0.0s
     => [internal] load metadata for docker.io/library/golang:latest                                                              1.6s
     => [build-stage 1/2] FROM docker.io/library/golang@sha256:2df96417dca0561bf1027742dcc5b446a18957cd28eba6aa79269f23f1846d3f   0.0s
     => => resolve docker.io/library/golang@sha256:2df96417dca0561bf1027742dcc5b446a18957cd28eba6aa79269f23f1846d3f               0.0s
     => CACHED [build-stage 2/2] RUN go get -u github.com/LK4D4/vndr                                                              0.0s
     => [export-stage 1/1] COPY --from=build-stage /go/bin/vndr /                                                                 0.2s
     => exporting to client                                                                                                       0.4s
     => => copying files 10.30MB                                                                                                  0.3s
@z

@x
    $ ls ./out
    vndr
    ```
@y
    $ ls ./out
    vndr
    ```
@z

@x
    ### Specifying external cache sources (--cache-from) {#cache-from}
@y
    ### Specifying external cache sources (--cache-from) {#cache-from}
@z

@x
    > **Note**
    >
    > This feature requires the BuildKit backend. You can either
    > [enable BuildKit](/build/buildkit/#getting-started) or
    > use the [buildx](https://github.com/docker/buildx) plugin. The previous
    > builder has limited support for reusing cache from pre-pulled images.
@y
    > **Note**
    >
    > This feature requires the BuildKit backend. You can either
    > [enable BuildKit](__SUBDIR__/build/buildkit/#getting-started) or
    > use the [buildx](https://github.com/docker/buildx) plugin. The previous
    > builder has limited support for reusing cache from pre-pulled images.
@z

@x
    In addition to local build cache, the builder can reuse the cache generated from
    previous builds with the `--cache-from` flag pointing to an image in the registry.
@y
    In addition to local build cache, the builder can reuse the cache generated from
    previous builds with the `--cache-from` flag pointing to an image in the registry.
@z

@x
    To use an image as a cache source, cache metadata needs to be written into the
    image on creation. You can do this by setting `--build-arg BUILDKIT_INLINE_CACHE=1`
    when building the image. After that, you can use the built image as a cache source
    for subsequent builds.
@y
    To use an image as a cache source, cache metadata needs to be written into the
    image on creation. You can do this by setting `--build-arg BUILDKIT_INLINE_CACHE=1`
    when building the image. After that, you can use the built image as a cache source
    for subsequent builds.
@z

@x
    Upon importing the cache, the builder only pulls the JSON metadata from the
    registry and determine possible cache hits based on that information. If there
    is a cache hit, the builder pulls the matched layers into the local environment.
@y
    Upon importing the cache, the builder only pulls the JSON metadata from the
    registry and determine possible cache hits based on that information. If there
    is a cache hit, the builder pulls the matched layers into the local environment.
@z

@x
    In addition to images, the cache can also be pulled from special cache manifests
    generated by [`buildx`](https://github.com/docker/buildx) or the BuildKit CLI
    (`buildctl`). These manifests (when built with the `type=registry` and `mode=max`
    options) allow pulling layer data for intermediate stages in multi-stage builds.
@y
    In addition to images, the cache can also be pulled from special cache manifests
    generated by [`buildx`](https://github.com/docker/buildx) or the BuildKit CLI
    (`buildctl`). These manifests (when built with the `type=registry` and `mode=max`
    options) allow pulling layer data for intermediate stages in multi-stage builds.
@z

@x
    The following example builds an image with inline-cache metadata and pushes it
    to a registry, then uses the image as a cache source on another machine:
@y
    The following example builds an image with inline-cache metadata and pushes it
    to a registry, then uses the image as a cache source on another machine:
@z

@x
    ```console
    $ docker build -t myname/myapp --build-arg BUILDKIT_INLINE_CACHE=1 .
    $ docker push myname/myapp
    ```
@y
    ```console
    $ docker build -t myname/myapp --build-arg BUILDKIT_INLINE_CACHE=1 .
    $ docker push myname/myapp
    ```
@z

@x
    After pushing the image, the image is used as cache source on another machine.
    BuildKit automatically pulls the image from the registry if needed.
@y
    After pushing the image, the image is used as cache source on another machine.
    BuildKit automatically pulls the image from the registry if needed.
@z

@x
    On another machine:
@y
    On another machine:
@z

@x
    ```console
    $ docker build --cache-from myname/myapp .
    ```
@y
    ```console
    $ docker build --cache-from myname/myapp .
    ```
@z

@x
    ### Set the networking mode for the RUN instructions during build (--network) {#network}
@y
    ### Set the networking mode for the RUN instructions during build (--network) {#network}
@z

@x
    #### Overview
@y
    #### Overview
@z

@x
    Available options for the networking mode are:
@y
    Available options for the networking mode are:
@z

@x
    - `default` (default): Run in the default network.
    - `none`: Run with no network access.
    - `host`: Run in the host’s network environment.
@y
    - `default` (default): Run in the default network.
    - `none`: Run with no network access.
    - `host`: Run in the host’s network environment.
@z

@x
    Find more details in the [Dockerfile documentation](/engine/reference/builder/#run---network).
@y
    Find more details in the [Dockerfile documentation](__SUBDIR__/engine/reference/builder/#run---network).
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
    > **Note**
    > The `--squash` option is an experimental feature, and should not be considered
    > stable.
@y
    > **Note**
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

@x
    ```console
    Client: Docker Engine - Community
     Version:           23.0.3
     API version:       1.42
     Go version:        go1.19.7
     Git commit:        3e7cbfd
     Built:             Tue Apr  4 22:05:41 2023
     OS/Arch:           darwin/amd64
     Context:           default
@y
    ```console
    Client: Docker Engine - Community
     Version:           23.0.3
     API version:       1.42
     Go version:        go1.19.7
     Git commit:        3e7cbfd
     Built:             Tue Apr  4 22:05:41 2023
     OS/Arch:           darwin/amd64
     Context:           default
@z

@x
    Server: Docker Engine - Community
     Engine:
      Version:          23.0.3
      API version:      1.42 (minimum version 1.12)
      Go version:       go1.19.7
      Git commit:       59118bf
      Built:            Tue Apr  4 22:05:41 2023
      OS/Arch:          linux/amd64
      Experimental:     true
     [...]
    ```
@y
    Server: Docker Engine - Community
     Engine:
      Version:          23.0.3
      API version:      1.42 (minimum version 1.12)
      Go version:       go1.19.7
      Git commit:       59118bf
      Built:            Tue Apr  4 22:05:41 2023
      OS/Arch:          linux/amd64
      Experimental:     true
     [...]
    ```
@z

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

@x
    ```dockerfile
    FROM busybox
    RUN echo hello > /hello
    RUN echo world >> /hello
    RUN touch remove_me /remove_me
    ENV HELLO=world
    RUN rm /remove_me
    ```
@y
    ```dockerfile
    FROM busybox
    RUN echo hello > /hello
    RUN echo world >> /hello
    RUN touch remove_me /remove_me
    ENV HELLO=world
    RUN rm /remove_me
    ```
@z

@x
    Next, build an image named `test` using the `--squash` flag.
@y
    Next, build an image named `test` using the `--squash` flag.
@z

@x
    ```console
    $ docker build --squash -t test .
    ```
@y
    ```console
    $ docker build --squash -t test .
    ```
@z

@x
    After the build completes, the history looks like the below. The history could show that a layer's
    name is `<missing>`, and there is a new layer with COMMENT `merge`.
@y
    After the build completes, the history looks like the below. The history could show that a layer's
    name is `<missing>`, and there is a new layer with COMMENT `merge`.
@z

@x
    ```console
    $ docker history test
@y
    ```console
    $ docker history test
@z

@x
    IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
    4e10cb5b4cac        3 seconds ago                                                       12 B                merge sha256:88a7b0112a41826885df0e7072698006ee8f621c6ab99fca7fe9151d7b599702 to sha256:47bcc53f74dc94b1920f0b34f6036096526296767650f223433fe65c35f149eb
    <missing>           5 minutes ago       /bin/sh -c rm /remove_me                        0 B
    <missing>           5 minutes ago       /bin/sh -c #(nop) ENV HELLO=world               0 B
    <missing>           5 minutes ago       /bin/sh -c touch remove_me /remove_me           0 B
    <missing>           5 minutes ago       /bin/sh -c echo world >> /hello                 0 B
    <missing>           6 minutes ago       /bin/sh -c echo hello > /hello                  0 B
    <missing>           7 weeks ago         /bin/sh -c #(nop) CMD ["sh"]                    0 B
    <missing>           7 weeks ago         /bin/sh -c #(nop) ADD file:47ca6e777c36a4cfff   1.113 MB
    ```
@y
    IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
    4e10cb5b4cac        3 seconds ago                                                       12 B                merge sha256:88a7b0112a41826885df0e7072698006ee8f621c6ab99fca7fe9151d7b599702 to sha256:47bcc53f74dc94b1920f0b34f6036096526296767650f223433fe65c35f149eb
    <missing>           5 minutes ago       /bin/sh -c rm /remove_me                        0 B
    <missing>           5 minutes ago       /bin/sh -c #(nop) ENV HELLO=world               0 B
    <missing>           5 minutes ago       /bin/sh -c touch remove_me /remove_me           0 B
    <missing>           5 minutes ago       /bin/sh -c echo world >> /hello                 0 B
    <missing>           6 minutes ago       /bin/sh -c echo hello > /hello                  0 B
    <missing>           7 weeks ago         /bin/sh -c #(nop) CMD ["sh"]                    0 B
    <missing>           7 weeks ago         /bin/sh -c #(nop) ADD file:47ca6e777c36a4cfff   1.113 MB
    ```
@z

@x
    Test the image, check for `/remove_me` being gone, make sure `hello\nworld` is
    in `/hello`, make sure the `HELLO` environment variable's value is `world`.
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    Test the image, check for `/remove_me` being gone, make sure `hello\nworld` is
    in `/hello`, make sure the `HELLO` environment variable's value is `world`.
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
