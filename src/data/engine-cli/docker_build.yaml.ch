%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker build
aliases: docker image build, docker build, docker builder build
short: Build an image from a Dockerfile
long: Build an image from a Dockerfile
usage: docker build [OPTIONS] PATH | URL | -
@y
command: docker build
aliases: docker image build, docker build, docker builder build
short: Build an image from a Dockerfile
long: Build an image from a Dockerfile
usage: docker build [OPTIONS] PATH | URL | -
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

% snip directives...
