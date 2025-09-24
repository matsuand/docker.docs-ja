%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker run
aliases: docker container run, docker run
short: Create and run a new container from an image
long: Create and run a new container from an image
usage: docker run [OPTIONS] IMAGE [COMMAND] [ARG...]
@y
command: docker run
aliases: docker container run, docker run
short: Create and run a new container from an image
long: Create and run a new container from an image
usage: docker run [OPTIONS] IMAGE [COMMAND] [ARG...]
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
        Add an annotation to the container (passed through to the OCI runtime)
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
        Block IO (relative weight), between 10 and 1000, or 0 to disable (default 0)
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

@x detach
      description: Run container in background and print container ID
@y
      description: Run container in background and print container ID
@z

@x detach-keys
      description: Override the key sequence for detaching a container
@y
      description: Override the key sequence for detaching a container
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
      description: Pull image before running (`always`, `missing`, `never`)
@y
      description: Pull image before running (`always`, `missing`, `never`)
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

@x sig-proxy
      description: Proxy received signals to the process
@y
      description: Proxy received signals to the process
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

% snip directives...
