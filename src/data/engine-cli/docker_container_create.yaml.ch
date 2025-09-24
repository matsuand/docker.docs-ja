%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker container create
aliases: docker container create, docker create
short: Create a new container
long: |-
    The `docker container create` (or shorthand: `docker create`) command creates a
    new container from the specified image, without starting it.
@y
command: docker container create
aliases: docker container create, docker create
short: Create a new container
long: |-
    The `docker container create` (or shorthand: `docker create`) command creates a
    new container from the specified image, without starting it.
@z

@x
    When creating a container, the Docker daemon creates a writeable container layer
    over the specified image and prepares it for running the specified command. The
    container ID is then printed to `STDOUT`. This is similar to `docker run -d`
    except the container is never started. You can then use the `docker container start`
    (or shorthand: `docker start`) command to start the container at any point.
@y
    When creating a container, the Docker daemon creates a writeable container layer
    over the specified image and prepares it for running the specified command. The
    container ID is then printed to `STDOUT`. This is similar to `docker run -d`
    except the container is never started. You can then use the `docker container start`
    (or shorthand: `docker start`) command to start the container at any point.
@z

@x
    This is useful when you want to set up a container configuration ahead of time
    so that it's ready to start when you need it. The initial status of the
    new container is `created`.
@y
    This is useful when you want to set up a container configuration ahead of time
    so that it's ready to start when you need it. The initial status of the
    new container is `created`.
@z

@x
    The `docker create` command shares most of its options with the `docker run`
    command (which performs a `docker create` before starting it).
    Refer to the [`docker run` CLI reference](/reference/cli/docker/container/run/)
    for details on the available flags and options.
@y
    The `docker create` command shares most of its options with the `docker run`
    command (which performs a `docker create` before starting it).
    Refer to the [`docker run` CLI reference](/reference/cli/docker/container/run/)
    for details on the available flags and options.
@z

@x
usage: docker container create [OPTIONS] IMAGE [COMMAND] [ARG...]
@y
usage: docker container create [OPTIONS] IMAGE [COMMAND] [ARG...]
@z

% options:

@x add-host
      description: Add a custom host-to-IP mapping (host:ip)
@y
      description: Add a custom host-to-IP mapping (host:ip)
@z

@x annotation
      description: |
        Add an annotation to the container (passed through to the OCI runtime)
@y
      description: |
@z

@x attach
      description: Attach to STDIN, STDOUT or STDERR
@y
      description: Attach to STDIN, STDOUT or STDERR
@z

@x blkio-weight
      description: |
        Block IO (relative weight), between 10 and 1000, or 0 to disable (default 0)
@y
      description: |
@z

@x blkio-weight-device
      description: Block IO weight (relative device weight)
@y
      description: Block IO weight (relative device weight)
@z

@x cap-add
      description: Add Linux capabilities
@y
      description: Add Linux capabilities
@z

@x cap-drop
      description: Drop Linux capabilities
@y
      description: Drop Linux capabilities
@z

@x cgroup-parent
      description: Optional parent cgroup for the container
@y
      description: Optional parent cgroup for the container
@z

@x cgroupns
      description: |-
        Cgroup namespace to use (host|private)
        'host':    Run the container in the Docker host's cgroup namespace
        'private': Run the container in its own private cgroup namespace
        '':        Use the cgroup namespace as configured by the
                   default-cgroupns-mode option on the daemon (default)
@y
      description: |-
        Cgroup namespace to use (host|private)
        'host':    Run the container in the Docker host's cgroup namespace
        'private': Run the container in its own private cgroup namespace
        '':        Use the cgroup namespace as configured by the
                   default-cgroupns-mode option on the daemon (default)
@z

@x cidfile
      description: Write the container ID to the file
@y
      description: Write the container ID to the file
@z

@x cpu-count
      description: CPU count (Windows only)
@y
      description: CPU count (Windows only)
@z

@x cpu-percent
      description: CPU percent (Windows only)
@y
      description: CPU percent (Windows only)
@z

@x cpu-period
      description: Limit CPU CFS (Completely Fair Scheduler) period
@y
      description: Limit CPU CFS (Completely Fair Scheduler) period
@z

@x cpu-quota
      description: Limit CPU CFS (Completely Fair Scheduler) quota
@y
      description: Limit CPU CFS (Completely Fair Scheduler) quota
@z

@x cpu-rt-period
      description: Limit CPU real-time period in microseconds
@y
      description: Limit CPU real-time period in microseconds
@z

@x cpu-rt-runtime
      description: Limit CPU real-time runtime in microseconds
@y
      description: Limit CPU real-time runtime in microseconds
@z

@x cpu-shares
      description: CPU shares (relative weight)
@y
      description: CPU shares (relative weight)
@z

@x cpus
      description: Number of CPUs
@y
      description: Number of CPUs
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

@x device
      description: Add a host device to the container
@y
      description: Add a host device to the container
@z

@x device-cgroup-rule
      description: Add a rule to the cgroup allowed devices list
@y
      description: Add a rule to the cgroup allowed devices list
@z

@x device-read-bps
      description: Limit read rate (bytes per second) from a device
@y
      description: Limit read rate (bytes per second) from a device
@z

@x device-read-iops
      description: Limit read rate (IO per second) from a device
@y
      description: Limit read rate (IO per second) from a device
@z

@x device-write-bps
      description: Limit write rate (bytes per second) to a device
@y
      description: Limit write rate (bytes per second) to a device
@z

@x device-write-iops
      description: Limit write rate (IO per second) to a device
@y
      description: Limit write rate (IO per second) to a device
@z

@x disable-content-trust
      description: Skip image verification
@y
      description: Skip image verification
@z

@x dns
      description: Set custom DNS servers
@y
      description: Set custom DNS servers
@z

@x dns-opt
      description: Set DNS options
@y
      description: Set DNS options
@z

@x dns-option
      description: Set DNS options
@y
      description: Set DNS options
@z

@x dns-search
      description: Set custom DNS search domains
@y
      description: Set custom DNS search domains
@z

@x domainname
      description: Container NIS domain name
@y
      description: Container NIS domain name
@z

@x entrypoint
      description: Overwrite the default ENTRYPOINT of the image
@y
      description: Overwrite the default ENTRYPOINT of the image
@z

@x env
      description: Set environment variables
@y
      description: Set environment variables
@z

@x env-file
      description: Read in a file of environment variables
@y
      description: Read in a file of environment variables
@z

@x expose
      description: Expose a port or a range of ports
@y
      description: Expose a port or a range of ports
@z

@x gpus
      description: GPU devices to add to the container ('all' to pass all GPUs)
@y
      description: GPU devices to add to the container ('all' to pass all GPUs)
@z

@x group-add
      description: Add additional groups to join
@y
      description: Add additional groups to join
@z

@x health-cmd
      description: Command to run to check health
@y
      description: Command to run to check health
@z

@x health-interval
      description: Time between running the check (ms|s|m|h) (default 0s)
@y
      description: Time between running the check (ms|s|m|h) (default 0s)
@z

@x health-retries
      description: Consecutive failures needed to report unhealthy
@y
      description: Consecutive failures needed to report unhealthy
@z

@x health-start-interval
      description: |
        Time between running the check during the start period (ms|s|m|h) (default 0s)
@y
      description: |
        Time between running the check during the start period (ms|s|m|h) (default 0s)
@z

@x health-start-period
      description: |
        Start period for the container to initialize before starting health-retries countdown (ms|s|m|h) (default 0s)
@y
      description: |
        Start period for the container to initialize before starting health-retries countdown (ms|s|m|h) (default 0s)
@z

@x health-timeout
      description: Maximum time to allow one check to run (ms|s|m|h) (default 0s)
@y
      description: Maximum time to allow one check to run (ms|s|m|h) (default 0s)
@z

@x help
      description: Print usage
@y
      description: Print usage
@z

@x hostname
      description: Container host name
@y
      description: Container host name
@z

@x init
      description: |
        Run an init inside the container that forwards signals and reaps processes
@y
      description: |
        Run an init inside the container that forwards signals and reaps processes
@z

@x interactive
      description: Keep STDIN open even if not attached
@y
      description: Keep STDIN open even if not attached
@z

@x io-maxbandwidth
      description: Maximum IO bandwidth limit for the system drive (Windows only)
@y
      description: Maximum IO bandwidth limit for the system drive (Windows only)
@z

@x io-maxiops
      description: Maximum IOps limit for the system drive (Windows only)
@y
      description: Maximum IOps limit for the system drive (Windows only)
@z

@x ip
      description: IPv4 address (e.g., 172.30.100.104)
@y
      description: IPv4 address (e.g., 172.30.100.104)
@z

@x ip6
      description: IPv6 address (e.g., 2001:db8::33)
@y
      description: IPv6 address (e.g., 2001:db8::33)
@z

@x ipc
      description: IPC mode to use
@y
      description: IPC mode to use
@z

@x isolation
      description: Container isolation technology
@y
      description: Container isolation technology
@z

@x kernel-memory
      description: Kernel memory limit
@y
      description: Kernel memory limit
@z

@x label
      description: Set meta data on a container
@y
      description: Set meta data on a container
@z

@x label-file
      description: Read in a line delimited file of labels
@y
      description: Read in a line delimited file of labels
@z

@x link
      description: Add link to another container
@y
      description: Add link to another container
@z

@x link-local-ip
      description: Container IPv4/IPv6 link-local addresses
@y
      description: Container IPv4/IPv6 link-local addresses
@z

@x log-driver
      description: Logging driver for the container
@y
      description: Logging driver for the container
@z

@x log-opt
      description: Log driver options
@y
      description: Log driver options
@z

@x mac-address
      description: Container MAC address (e.g., 92:d0:c6:0a:29:33)
@y
      description: Container MAC address (e.g., 92:d0:c6:0a:29:33)
@z

@x memory
      description: Memory limit
@y
      description: Memory limit
@z

@x memory-reservation
      description: Memory soft limit
@y
      description: Memory soft limit
@z

@x memory-swap
      description: |
        Swap limit equal to memory plus swap: '-1' to enable unlimited swap
@y
      description: |
        Swap limit equal to memory plus swap: '-1' to enable unlimited swap
@z

@x memory-swappiness
      description: Tune container memory swappiness (0 to 100)
@y
      description: Tune container memory swappiness (0 to 100)
@z

@x mount
      description: Attach a filesystem mount to the container
@y
      description: Attach a filesystem mount to the container
@z

@x name
      description: Assign a name to the container
@y
      description: Assign a name to the container
@z

@x net
      description: Connect a container to a network
@y
      description: Connect a container to a network
@z

@x net-alias
      description: Add network-scoped alias for the container
@y
      description: Add network-scoped alias for the container
@z

@x network
      description: Connect a container to a network
@y
      description: Connect a container to a network
@z

@x network-alias
      description: Add network-scoped alias for the container
@y
      description: Add network-scoped alias for the container
@z

@x no-healthcheck
      description: Disable any container-specified HEALTHCHECK
@y
      description: Disable any container-specified HEALTHCHECK
@z

@x oom-kill-disable
      description: Disable OOM Killer
@y
      description: Disable OOM Killer
@z

@x oom-score-adj
      description: Tune host's OOM preferences (-1000 to 1000)
@y
      description: Tune host's OOM preferences (-1000 to 1000)
@z

@x pid
      description: PID namespace to use
@y
      description: PID namespace to use
@z

@x pids-limit
      description: Tune container pids limit (set -1 for unlimited)
@y
      description: Tune container pids limit (set -1 for unlimited)
@z

@x platform
      description: Set platform if server is multi-platform capable
@y
      description: Set platform if server is multi-platform capable
@z

@x privileged
      description: Give extended privileges to this container
@y
      description: Give extended privileges to this container
@z

@x publish
      description: Publish a container's port(s) to the host
@y
      description: Publish a container's port(s) to the host
@z

@x publish-all
      description: Publish all exposed ports to random ports
@y
      description: Publish all exposed ports to random ports
@z

@x pull
      description: Pull image before creating (`always`, `|missing`, `never`)
@y
      description: Pull image before creating (`always`, `|missing`, `never`)
@z

@x quiet
      description: Suppress the pull output
@y
      description: Suppress the pull output
@z

@x read-only
      description: Mount the container's root filesystem as read only
@y
      description: Mount the container's root filesystem as read only
@z

@x restart
      description: Restart policy to apply when a container exits
@y
      description: Restart policy to apply when a container exits
@z

@x rm
      description: |
        Automatically remove the container and its associated anonymous volumes when it exits
@y
      description: |
        Automatically remove the container and its associated anonymous volumes when it exits
@z

@x runtime
      description: Runtime to use for this container
@y
      description: Runtime to use for this container
@z

@x security-opt
      description: Security Options
@y
      description: Security Options
@z

@x shm-size
      description: Size of /dev/shm
@y
      description: Size of /dev/shm
@z

@x stop-signal
      description: Signal to stop the container
@y
      description: Signal to stop the container
@z

@x stop-timeout
      description: Timeout (in seconds) to stop a container
@y
      description: Timeout (in seconds) to stop a container
@z

@x storage-opt
      description: Storage driver options for the container
@y
      description: Storage driver options for the container
@z

@x sysctl
      description: Sysctl options
@y
      description: Sysctl options
@z

@x tmpfs
      description: Mount a tmpfs directory
@y
      description: Mount a tmpfs directory
@z

@x tty
      description: Allocate a pseudo-TTY
@y
      description: Allocate a pseudo-TTY
@z

@x ulimit
      description: Ulimit options
@y
      description: Ulimit options
@z

@x use-api-socket
      description: Bind mount Docker API socket and required auth
@y
      description: Bind mount Docker API socket and required auth
@z

@x user
      description: 'Username or UID (format: <name|uid>[:<group|gid>])'
@y
      description: 'Username or UID (format: <name|uid>[:<group|gid>])'
@z

@x userns
      description: User namespace to use
@y
      description: User namespace to use
@z

@x uts
      description: UTS namespace to use
@y
      description: UTS namespace to use
@z

@x volume
      description: Bind mount a volume
@y
      description: Bind mount a volume
@z

@x volume-driver
      description: Optional volume driver for the container
@y
      description: Optional volume driver for the container
@z

@x volumes-from
      description: Mount volumes from the specified container(s)
@y
      description: Mount volumes from the specified container(s)
@z

@x workdir
      description: Working directory inside the container
@y
      description: Working directory inside the container
@z

@x
examples: |-
    ### Create and start a container
@y
examples: |-
    ### Create and start a container
@z

@x
    The following example creates an interactive container with a pseudo-TTY attached,
    then starts the container and attaches to it:
@y
    The following example creates an interactive container with a pseudo-TTY attached,
    then starts the container and attaches to it:
@z

@x
    ```console
    $ docker container create -i -t --name mycontainer alpine
    6d8af538ec541dd581ebc2a24153a28329acb5268abe5ef868c1f1a261221752
@y
    ```console
    $ docker container create -i -t --name mycontainer alpine
    6d8af538ec541dd581ebc2a24153a28329acb5268abe5ef868c1f1a261221752
@z

@x
    $ docker container start --attach -i mycontainer
    / # echo hello world
    hello world
    ```
@y
    $ docker container start --attach -i mycontainer
    / # echo hello world
    hello world
    ```
@z

@x
    The above is the equivalent of a `docker run`:
@y
    The above is the equivalent of a `docker run`:
@z

@x
    ```console
    $ docker run -it --name mycontainer2 alpine
    / # echo hello world
    hello world
    ```
@y
    ```console
    $ docker run -it --name mycontainer2 alpine
    / # echo hello world
    hello world
    ```
@z

@x
    ### Initialize volumes
@y
    ### Initialize volumes
@z

@x
    Container volumes are initialized during the `docker create` phase
    (i.e., `docker run` too). For example, this allows you to `create` the `data`
    volume container, and then use it from another container:
@y
    Container volumes are initialized during the `docker create` phase
    (i.e., `docker run` too). For example, this allows you to `create` the `data`
    volume container, and then use it from another container:
@z

@x
    ```console
    $ docker create -v /data --name data ubuntu
@y
    ```console
    $ docker create -v /data --name data ubuntu
@z

@x
    240633dfbb98128fa77473d3d9018f6123b99c454b3251427ae190a7d951ad57
@y
    240633dfbb98128fa77473d3d9018f6123b99c454b3251427ae190a7d951ad57
@z

@x
    $ docker run --rm --volumes-from data ubuntu ls -la /data
@y
    $ docker run --rm --volumes-from data ubuntu ls -la /data
@z

@x
    total 8
    drwxr-xr-x  2 root root 4096 Dec  5 04:10 .
    drwxr-xr-x 48 root root 4096 Dec  5 04:11 ..
    ```
@y
    total 8
    drwxr-xr-x  2 root root 4096 Dec  5 04:10 .
    drwxr-xr-x 48 root root 4096 Dec  5 04:11 ..
    ```
@z

@x
    Similarly, `create` a host directory bind mounted volume container, which can
    then be used from the subsequent container:
@y
    Similarly, `create` a host directory bind mounted volume container, which can
    then be used from the subsequent container:
@z

@x
    ```console
    $ docker create -v /home/docker:/docker --name docker ubuntu
@y
    ```console
    $ docker create -v /home/docker:/docker --name docker ubuntu
@z

@x
    9aa88c08f319cd1e4515c3c46b0de7cc9aa75e878357b1e96f91e2c773029f03
@y
    9aa88c08f319cd1e4515c3c46b0de7cc9aa75e878357b1e96f91e2c773029f03
@z

@x
    $ docker run --rm --volumes-from docker ubuntu ls -la /docker
@y
    $ docker run --rm --volumes-from docker ubuntu ls -la /docker
@z

@x
    total 20
    drwxr-sr-x  5 1000 staff  180 Dec  5 04:00 .
    drwxr-xr-x 48 root root  4096 Dec  5 04:13 ..
    -rw-rw-r--  1 1000 staff 3833 Dec  5 04:01 .ash_history
    -rw-r--r--  1 1000 staff  446 Nov 28 11:51 .ashrc
    -rw-r--r--  1 1000 staff   25 Dec  5 04:00 .gitconfig
    drwxr-sr-x  3 1000 staff   60 Dec  1 03:28 .local
    -rw-r--r--  1 1000 staff  920 Nov 28 11:51 .profile
    drwx--S---  2 1000 staff  460 Dec  5 00:51 .ssh
    drwxr-xr-x 32 1000 staff 1140 Dec  5 04:01 docker
    ```
@y
    total 20
    drwxr-sr-x  5 1000 staff  180 Dec  5 04:00 .
    drwxr-xr-x 48 root root  4096 Dec  5 04:13 ..
    -rw-rw-r--  1 1000 staff 3833 Dec  5 04:01 .ash_history
    -rw-r--r--  1 1000 staff  446 Nov 28 11:51 .ashrc
    -rw-r--r--  1 1000 staff   25 Dec  5 04:00 .gitconfig
    drwxr-sr-x  3 1000 staff   60 Dec  1 03:28 .local
    -rw-r--r--  1 1000 staff  920 Nov 28 11:51 .profile
    drwx--S---  2 1000 staff  460 Dec  5 00:51 .ssh
    drwxr-xr-x 32 1000 staff 1140 Dec  5 04:01 docker
    ```
@z

% snip directives...
