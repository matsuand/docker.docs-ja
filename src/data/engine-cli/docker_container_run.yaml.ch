%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker container run
aliases: docker container run, docker run
short: Create and run a new container from an image
long: |-
    The `docker run` command runs a command in a new container, pulling the image if needed and starting the container.
@y
command: docker container run
aliases: docker container run, docker run
short: Create and run a new container from an image
long: |-
    The `docker run` command runs a command in a new container, pulling the image if needed and starting the container.
@z

@x
    You can restart a stopped container with all its previous changes intact using `docker start`.
    Use `docker ps -a` to view a list of all containers, including those that are stopped.
usage: docker container run [OPTIONS] IMAGE [COMMAND] [ARG...]
pname: docker container
plink: docker_container.yaml
options:
    - option: add-host
      value_type: list
      description: Add a custom host-to-IP mapping (host:ip)
      details_url: '#add-host'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: annotation
      value_type: map
      default_value: map[]
      description: |
        Add an annotation to the container (passed through to the OCI runtime)
      deprecated: false
      hidden: false
      min_api_version: "1.43"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: attach
      shorthand: a
      value_type: list
      description: Attach to STDIN, STDOUT or STDERR
      details_url: '#attach'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: blkio-weight
      value_type: uint16
      default_value: "0"
      description: |
        Block IO (relative weight), between 10 and 1000, or 0 to disable (default 0)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: blkio-weight-device
      value_type: list
      default_value: '[]'
      description: Block IO weight (relative device weight)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cap-add
      value_type: list
      description: Add Linux capabilities
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cap-drop
      value_type: list
      description: Drop Linux capabilities
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cgroup-parent
      value_type: string
      description: Optional parent cgroup for the container
      details_url: '#cgroup-parent'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cgroupns
      value_type: string
      description: |-
        Cgroup namespace to use (host|private)
        'host':    Run the container in the Docker host's cgroup namespace
        'private': Run the container in its own private cgroup namespace
        '':        Use the cgroup namespace as configured by the
                   default-cgroupns-mode option on the daemon (default)
      deprecated: false
      hidden: false
      min_api_version: "1.41"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cidfile
      value_type: string
      description: Write the container ID to the file
      details_url: '#cidfile'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-count
      value_type: int64
      default_value: "0"
      description: CPU count (Windows only)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
      os_type: windows
    - option: cpu-percent
      value_type: int64
      default_value: "0"
      description: CPU percent (Windows only)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
      os_type: windows
    - option: cpu-period
      value_type: int64
      default_value: "0"
      description: Limit CPU CFS (Completely Fair Scheduler) period
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-quota
      value_type: int64
      default_value: "0"
      description: Limit CPU CFS (Completely Fair Scheduler) quota
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-rt-period
      value_type: int64
      default_value: "0"
      description: Limit CPU real-time period in microseconds
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-rt-runtime
      value_type: int64
      default_value: "0"
      description: Limit CPU real-time runtime in microseconds
      deprecated: false
      hidden: false
      min_api_version: "1.25"
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
    - option: cpus
      value_type: decimal
      description: Number of CPUs
      deprecated: false
      hidden: false
      min_api_version: "1.25"
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
    - option: detach
      shorthand: d
      value_type: bool
      default_value: "false"
      description: Run container in background and print container ID
      details_url: '#detach'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: detach-keys
      value_type: string
      description: Override the key sequence for detaching a container
      details_url: '#detach-keys'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: device
      value_type: list
      description: Add a host device to the container
      details_url: '#device'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: device-cgroup-rule
      value_type: list
      description: Add a rule to the cgroup allowed devices list
      details_url: '#device-cgroup-rule'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: device-read-bps
      value_type: list
      default_value: '[]'
      description: Limit read rate (bytes per second) from a device
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: device-read-iops
      value_type: list
      default_value: '[]'
      description: Limit read rate (IO per second) from a device
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: device-write-bps
      value_type: list
      default_value: '[]'
      description: Limit write rate (bytes per second) to a device
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: device-write-iops
      value_type: list
      default_value: '[]'
      description: Limit write rate (IO per second) to a device
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
    - option: dns
      value_type: list
      description: Set custom DNS servers
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: dns-opt
      value_type: list
      description: Set DNS options
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: dns-option
      value_type: list
      description: Set DNS options
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: dns-search
      value_type: list
      description: Set custom DNS search domains
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: domainname
      value_type: string
      description: Container NIS domain name
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: entrypoint
      value_type: string
      description: Overwrite the default ENTRYPOINT of the image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: env
      shorthand: e
      value_type: list
      description: Set environment variables
      details_url: '#env'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: env-file
      value_type: list
      description: Read in a file of environment variables
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: expose
      value_type: list
      description: Expose a port or a range of ports
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: gpus
      value_type: gpu-request
      description: GPU devices to add to the container ('all' to pass all GPUs)
      details_url: '#gpus'
      deprecated: false
      hidden: false
      min_api_version: "1.40"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: group-add
      value_type: list
      description: Add additional groups to join
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: health-cmd
      value_type: string
      description: Command to run to check health
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: health-interval
      value_type: duration
      default_value: 0s
      description: Time between running the check (ms|s|m|h) (default 0s)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: health-retries
      value_type: int
      default_value: "0"
      description: Consecutive failures needed to report unhealthy
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: health-start-interval
      value_type: duration
      default_value: 0s
      description: |
        Time between running the check during the start period (ms|s|m|h) (default 0s)
      deprecated: false
      hidden: false
      min_api_version: "1.44"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: health-start-period
      value_type: duration
      default_value: 0s
      description: |
        Start period for the container to initialize before starting health-retries countdown (ms|s|m|h) (default 0s)
      deprecated: false
      hidden: false
      min_api_version: "1.29"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: health-timeout
      value_type: duration
      default_value: 0s
      description: Maximum time to allow one check to run (ms|s|m|h) (default 0s)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: help
      value_type: bool
      default_value: "false"
      description: Print usage
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: hostname
      shorthand: h
      value_type: string
      description: Container host name
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: init
      value_type: bool
      default_value: "false"
      description: |
        Run an init inside the container that forwards signals and reaps processes
      details_url: '#init'
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: interactive
      shorthand: i
      value_type: bool
      default_value: "false"
      description: Keep STDIN open even if not attached
      details_url: '#interactive'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: io-maxbandwidth
      value_type: bytes
      default_value: "0"
      description: Maximum IO bandwidth limit for the system drive (Windows only)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
      os_type: windows
    - option: io-maxiops
      value_type: uint64
      default_value: "0"
      description: Maximum IOps limit for the system drive (Windows only)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
      os_type: windows
    - option: ip
      value_type: string
      description: IPv4 address (e.g., 172.30.100.104)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: ip6
      value_type: string
      description: IPv6 address (e.g., 2001:db8::33)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: ipc
      value_type: string
      description: IPC mode to use
      details_url: '#ipc'
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
    - option: kernel-memory
      value_type: bytes
      default_value: "0"
      description: Kernel memory limit
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: label
      shorthand: l
      value_type: list
      description: Set meta data on a container
      details_url: '#label'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: label-file
      value_type: list
      description: Read in a line delimited file of labels
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: link
      value_type: list
      description: Add link to another container
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: link-local-ip
      value_type: list
      description: Container IPv4/IPv6 link-local addresses
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: log-driver
      value_type: string
      description: Logging driver for the container
      details_url: '#log-driver'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: log-opt
      value_type: list
      description: Log driver options
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: mac-address
      value_type: string
      description: Container MAC address (e.g., 92:d0:c6:0a:29:33)
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
      details_url: '#memory'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: memory-reservation
      value_type: bytes
      default_value: "0"
      description: Memory soft limit
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: memory-swap
      value_type: bytes
      default_value: "0"
      description: |
        Swap limit equal to memory plus swap: '-1' to enable unlimited swap
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: memory-swappiness
      value_type: int64
      default_value: "-1"
      description: Tune container memory swappiness (0 to 100)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: mount
      value_type: mount
      description: Attach a filesystem mount to the container
      details_url: '#mount'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: name
      value_type: string
      description: Assign a name to the container
      details_url: '#name'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: net
      value_type: network
      description: Connect a container to a network
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: net-alias
      value_type: list
      description: Add network-scoped alias for the container
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: network
      value_type: network
      description: Connect a container to a network
      details_url: '#network'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: network-alias
      value_type: list
      description: Add network-scoped alias for the container
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-healthcheck
      value_type: bool
      default_value: "false"
      description: Disable any container-specified HEALTHCHECK
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: oom-kill-disable
      value_type: bool
      default_value: "false"
      description: Disable OOM Killer
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: oom-score-adj
      value_type: int
      default_value: "0"
      description: Tune host's OOM preferences (-1000 to 1000)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: pid
      value_type: string
      description: PID namespace to use
      details_url: '#pid'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: pids-limit
      value_type: int64
      default_value: "0"
      description: Tune container pids limit (set -1 for unlimited)
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
      min_api_version: "1.32"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: privileged
      value_type: bool
      default_value: "false"
      description: Give extended privileges to this container
      details_url: '#privileged'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: publish
      shorthand: p
      value_type: list
      description: Publish a container's port(s) to the host
      details_url: '#publish'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: publish-all
      shorthand: P
      value_type: bool
      default_value: "false"
      description: Publish all exposed ports to random ports
      details_url: '#publish-all'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: pull
      value_type: string
      default_value: missing
      description: Pull image before running (`always`, `missing`, `never`)
      details_url: '#pull'
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
      description: Suppress the pull output
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: read-only
      value_type: bool
      default_value: "false"
      description: Mount the container's root filesystem as read only
      details_url: '#read-only'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: restart
      value_type: string
      default_value: "no"
      description: Restart policy to apply when a container exits
      details_url: '#restart'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: rm
      value_type: bool
      default_value: "false"
      description: Automatically remove the container when it exits
      details_url: '#rm'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: runtime
      value_type: string
      description: Runtime to use for this container
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: security-opt
      value_type: list
      description: Security Options
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
      description: Size of /dev/shm
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: sig-proxy
      value_type: bool
      default_value: "true"
      description: Proxy received signals to the process
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: stop-signal
      value_type: string
      description: Signal to stop the container
      details_url: '#stop-signal'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: stop-timeout
      value_type: int
      default_value: "0"
      description: Timeout (in seconds) to stop a container
      details_url: '#stop-timeout'
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: storage-opt
      value_type: list
      description: Storage driver options for the container
      details_url: '#storage-opt'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: sysctl
      value_type: map
      default_value: map[]
      description: Sysctl options
      details_url: '#sysctl'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: tmpfs
      value_type: list
      description: Mount a tmpfs directory
      details_url: '#tmpfs'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: tty
      shorthand: t
      value_type: bool
      default_value: "false"
      description: Allocate a pseudo-TTY
      details_url: '#tty'
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
    - option: user
      shorthand: u
      value_type: string
      description: 'Username or UID (format: <name|uid>[:<group|gid>])'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: userns
      value_type: string
      description: User namespace to use
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: uts
      value_type: string
      description: UTS namespace to use
      details_url: '#uts'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: volume
      shorthand: v
      value_type: list
      description: Bind mount a volume
      details_url: '#volume'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: volume-driver
      value_type: string
      description: Optional volume driver for the container
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: volumes-from
      value_type: list
      description: Mount volumes from the specified container(s)
      details_url: '#volumes-from'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: workdir
      shorthand: w
      value_type: string
      description: Working directory inside the container
      details_url: '#workdir'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Assign name (--name) {#name}
@y
    You can restart a stopped container with all its previous changes intact using `docker start`.
    Use `docker ps -a` to view a list of all containers, including those that are stopped.
usage: docker container run [OPTIONS] IMAGE [COMMAND] [ARG...]
pname: docker container
plink: docker_container.yaml
options:
    - option: add-host
      value_type: list
      description: Add a custom host-to-IP mapping (host:ip)
      details_url: '#add-host'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: annotation
      value_type: map
      default_value: map[]
      description: |
        Add an annotation to the container (passed through to the OCI runtime)
      deprecated: false
      hidden: false
      min_api_version: "1.43"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: attach
      shorthand: a
      value_type: list
      description: Attach to STDIN, STDOUT or STDERR
      details_url: '#attach'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: blkio-weight
      value_type: uint16
      default_value: "0"
      description: |
        Block IO (relative weight), between 10 and 1000, or 0 to disable (default 0)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: blkio-weight-device
      value_type: list
      default_value: '[]'
      description: Block IO weight (relative device weight)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cap-add
      value_type: list
      description: Add Linux capabilities
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cap-drop
      value_type: list
      description: Drop Linux capabilities
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cgroup-parent
      value_type: string
      description: Optional parent cgroup for the container
      details_url: '#cgroup-parent'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cgroupns
      value_type: string
      description: |-
        Cgroup namespace to use (host|private)
        'host':    Run the container in the Docker host's cgroup namespace
        'private': Run the container in its own private cgroup namespace
        '':        Use the cgroup namespace as configured by the
                   default-cgroupns-mode option on the daemon (default)
      deprecated: false
      hidden: false
      min_api_version: "1.41"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cidfile
      value_type: string
      description: Write the container ID to the file
      details_url: '#cidfile'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-count
      value_type: int64
      default_value: "0"
      description: CPU count (Windows only)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
      os_type: windows
    - option: cpu-percent
      value_type: int64
      default_value: "0"
      description: CPU percent (Windows only)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
      os_type: windows
    - option: cpu-period
      value_type: int64
      default_value: "0"
      description: Limit CPU CFS (Completely Fair Scheduler) period
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-quota
      value_type: int64
      default_value: "0"
      description: Limit CPU CFS (Completely Fair Scheduler) quota
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-rt-period
      value_type: int64
      default_value: "0"
      description: Limit CPU real-time period in microseconds
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: cpu-rt-runtime
      value_type: int64
      default_value: "0"
      description: Limit CPU real-time runtime in microseconds
      deprecated: false
      hidden: false
      min_api_version: "1.25"
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
    - option: cpus
      value_type: decimal
      description: Number of CPUs
      deprecated: false
      hidden: false
      min_api_version: "1.25"
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
    - option: detach
      shorthand: d
      value_type: bool
      default_value: "false"
      description: Run container in background and print container ID
      details_url: '#detach'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: detach-keys
      value_type: string
      description: Override the key sequence for detaching a container
      details_url: '#detach-keys'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: device
      value_type: list
      description: Add a host device to the container
      details_url: '#device'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: device-cgroup-rule
      value_type: list
      description: Add a rule to the cgroup allowed devices list
      details_url: '#device-cgroup-rule'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: device-read-bps
      value_type: list
      default_value: '[]'
      description: Limit read rate (bytes per second) from a device
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: device-read-iops
      value_type: list
      default_value: '[]'
      description: Limit read rate (IO per second) from a device
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: device-write-bps
      value_type: list
      default_value: '[]'
      description: Limit write rate (bytes per second) to a device
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: device-write-iops
      value_type: list
      default_value: '[]'
      description: Limit write rate (IO per second) to a device
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
    - option: dns
      value_type: list
      description: Set custom DNS servers
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: dns-opt
      value_type: list
      description: Set DNS options
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: dns-option
      value_type: list
      description: Set DNS options
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: dns-search
      value_type: list
      description: Set custom DNS search domains
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: domainname
      value_type: string
      description: Container NIS domain name
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: entrypoint
      value_type: string
      description: Overwrite the default ENTRYPOINT of the image
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: env
      shorthand: e
      value_type: list
      description: Set environment variables
      details_url: '#env'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: env-file
      value_type: list
      description: Read in a file of environment variables
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: expose
      value_type: list
      description: Expose a port or a range of ports
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: gpus
      value_type: gpu-request
      description: GPU devices to add to the container ('all' to pass all GPUs)
      details_url: '#gpus'
      deprecated: false
      hidden: false
      min_api_version: "1.40"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: group-add
      value_type: list
      description: Add additional groups to join
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: health-cmd
      value_type: string
      description: Command to run to check health
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: health-interval
      value_type: duration
      default_value: 0s
      description: Time between running the check (ms|s|m|h) (default 0s)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: health-retries
      value_type: int
      default_value: "0"
      description: Consecutive failures needed to report unhealthy
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: health-start-interval
      value_type: duration
      default_value: 0s
      description: |
        Time between running the check during the start period (ms|s|m|h) (default 0s)
      deprecated: false
      hidden: false
      min_api_version: "1.44"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: health-start-period
      value_type: duration
      default_value: 0s
      description: |
        Start period for the container to initialize before starting health-retries countdown (ms|s|m|h) (default 0s)
      deprecated: false
      hidden: false
      min_api_version: "1.29"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: health-timeout
      value_type: duration
      default_value: 0s
      description: Maximum time to allow one check to run (ms|s|m|h) (default 0s)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: help
      value_type: bool
      default_value: "false"
      description: Print usage
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: hostname
      shorthand: h
      value_type: string
      description: Container host name
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: init
      value_type: bool
      default_value: "false"
      description: |
        Run an init inside the container that forwards signals and reaps processes
      details_url: '#init'
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: interactive
      shorthand: i
      value_type: bool
      default_value: "false"
      description: Keep STDIN open even if not attached
      details_url: '#interactive'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: io-maxbandwidth
      value_type: bytes
      default_value: "0"
      description: Maximum IO bandwidth limit for the system drive (Windows only)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
      os_type: windows
    - option: io-maxiops
      value_type: uint64
      default_value: "0"
      description: Maximum IOps limit for the system drive (Windows only)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
      os_type: windows
    - option: ip
      value_type: string
      description: IPv4 address (e.g., 172.30.100.104)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: ip6
      value_type: string
      description: IPv6 address (e.g., 2001:db8::33)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: ipc
      value_type: string
      description: IPC mode to use
      details_url: '#ipc'
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
    - option: kernel-memory
      value_type: bytes
      default_value: "0"
      description: Kernel memory limit
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: label
      shorthand: l
      value_type: list
      description: Set meta data on a container
      details_url: '#label'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: label-file
      value_type: list
      description: Read in a line delimited file of labels
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: link
      value_type: list
      description: Add link to another container
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: link-local-ip
      value_type: list
      description: Container IPv4/IPv6 link-local addresses
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: log-driver
      value_type: string
      description: Logging driver for the container
      details_url: '#log-driver'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: log-opt
      value_type: list
      description: Log driver options
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: mac-address
      value_type: string
      description: Container MAC address (e.g., 92:d0:c6:0a:29:33)
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
      details_url: '#memory'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: memory-reservation
      value_type: bytes
      default_value: "0"
      description: Memory soft limit
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: memory-swap
      value_type: bytes
      default_value: "0"
      description: |
        Swap limit equal to memory plus swap: '-1' to enable unlimited swap
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: memory-swappiness
      value_type: int64
      default_value: "-1"
      description: Tune container memory swappiness (0 to 100)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: mount
      value_type: mount
      description: Attach a filesystem mount to the container
      details_url: '#mount'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: name
      value_type: string
      description: Assign a name to the container
      details_url: '#name'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: net
      value_type: network
      description: Connect a container to a network
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: net-alias
      value_type: list
      description: Add network-scoped alias for the container
      deprecated: false
      hidden: true
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: network
      value_type: network
      description: Connect a container to a network
      details_url: '#network'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: network-alias
      value_type: list
      description: Add network-scoped alias for the container
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: no-healthcheck
      value_type: bool
      default_value: "false"
      description: Disable any container-specified HEALTHCHECK
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: oom-kill-disable
      value_type: bool
      default_value: "false"
      description: Disable OOM Killer
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: oom-score-adj
      value_type: int
      default_value: "0"
      description: Tune host's OOM preferences (-1000 to 1000)
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: pid
      value_type: string
      description: PID namespace to use
      details_url: '#pid'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: pids-limit
      value_type: int64
      default_value: "0"
      description: Tune container pids limit (set -1 for unlimited)
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
      min_api_version: "1.32"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: privileged
      value_type: bool
      default_value: "false"
      description: Give extended privileges to this container
      details_url: '#privileged'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: publish
      shorthand: p
      value_type: list
      description: Publish a container's port(s) to the host
      details_url: '#publish'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: publish-all
      shorthand: P
      value_type: bool
      default_value: "false"
      description: Publish all exposed ports to random ports
      details_url: '#publish-all'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: pull
      value_type: string
      default_value: missing
      description: Pull image before running (`always`, `missing`, `never`)
      details_url: '#pull'
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
      description: Suppress the pull output
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: read-only
      value_type: bool
      default_value: "false"
      description: Mount the container's root filesystem as read only
      details_url: '#read-only'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: restart
      value_type: string
      default_value: "no"
      description: Restart policy to apply when a container exits
      details_url: '#restart'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: rm
      value_type: bool
      default_value: "false"
      description: Automatically remove the container when it exits
      details_url: '#rm'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: runtime
      value_type: string
      description: Runtime to use for this container
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: security-opt
      value_type: list
      description: Security Options
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
      description: Size of /dev/shm
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: sig-proxy
      value_type: bool
      default_value: "true"
      description: Proxy received signals to the process
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: stop-signal
      value_type: string
      description: Signal to stop the container
      details_url: '#stop-signal'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: stop-timeout
      value_type: int
      default_value: "0"
      description: Timeout (in seconds) to stop a container
      details_url: '#stop-timeout'
      deprecated: false
      hidden: false
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: storage-opt
      value_type: list
      description: Storage driver options for the container
      details_url: '#storage-opt'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: sysctl
      value_type: map
      default_value: map[]
      description: Sysctl options
      details_url: '#sysctl'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: tmpfs
      value_type: list
      description: Mount a tmpfs directory
      details_url: '#tmpfs'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: tty
      shorthand: t
      value_type: bool
      default_value: "false"
      description: Allocate a pseudo-TTY
      details_url: '#tty'
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
    - option: user
      shorthand: u
      value_type: string
      description: 'Username or UID (format: <name|uid>[:<group|gid>])'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: userns
      value_type: string
      description: User namespace to use
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: uts
      value_type: string
      description: UTS namespace to use
      details_url: '#uts'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: volume
      shorthand: v
      value_type: list
      description: Bind mount a volume
      details_url: '#volume'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: volume-driver
      value_type: string
      description: Optional volume driver for the container
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: volumes-from
      value_type: list
      description: Mount volumes from the specified container(s)
      details_url: '#volumes-from'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: workdir
      shorthand: w
      value_type: string
      description: Working directory inside the container
      details_url: '#workdir'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
examples: |-
    ### Assign name (--name) {#name}
@z

@x
    The `--name` flag lets you specify a custom identifier for a container. The
    following example runs a container named `test` using the `nginx:alpine` image
    in [detached mode](#detach).
@y
    The `--name` flag lets you specify a custom identifier for a container. The
    following example runs a container named `test` using the `nginx:alpine` image
    in [detached mode](#detach).
@z

@x
    ```console
    $ docker run --name test -d nginx:alpine
    4bed76d3ad428b889c56c1ecc2bf2ed95cb08256db22dc5ef5863e1d03252a19
    $ docker ps
    CONTAINER ID   IMAGE          COMMAND                  CREATED        STATUS                  PORTS     NAMES
    4bed76d3ad42   nginx:alpine   "/docker-entrypoint.…"   1 second ago   Up Less than a second   80/tcp    test
    ```
@y
    ```console
    $ docker run --name test -d nginx:alpine
    4bed76d3ad428b889c56c1ecc2bf2ed95cb08256db22dc5ef5863e1d03252a19
    $ docker ps
    CONTAINER ID   IMAGE          COMMAND                  CREATED        STATUS                  PORTS     NAMES
    4bed76d3ad42   nginx:alpine   "/docker-entrypoint.…"   1 second ago   Up Less than a second   80/tcp    test
    ```
@z

@x
    You can reference the container by name with other commands. For example, the
    following commands stop and remove a container named `test`:
@y
    You can reference the container by name with other commands. For example, the
    following commands stop and remove a container named `test`:
@z

@x
    ```console
    $ docker stop test
    test
    $ docker rm test
    test
    ```
@y
    ```console
    $ docker stop test
    test
    $ docker rm test
    test
    ```
@z

@x
    If you don't specify a custom name using the `--name` flag, the daemon assigns
    a randomly generated name, such as `vibrant_cannon`, to the container. Using a
    custom-defined name provides the benefit of having an easy-to-remember ID for a
    container.
@y
    If you don't specify a custom name using the `--name` flag, the daemon assigns
    a randomly generated name, such as `vibrant_cannon`, to the container. Using a
    custom-defined name provides the benefit of having an easy-to-remember ID for a
    container.
@z

@x
    Moreover, if you connect the container to a user-defined bridge network, other
    containers on the same network can refer to the container by name via DNS.
@y
    Moreover, if you connect the container to a user-defined bridge network, other
    containers on the same network can refer to the container by name via DNS.
@z

@x
    ```console
    $ docker network create mynet
    cb79f45948d87e389e12013fa4d969689ed2c3316985dd832a43aaec9a0fe394
    $ docker run --name test --net mynet -d nginx:alpine
    58df6ecfbc2ad7c42d088ed028d367f9e22a5f834d7c74c66c0ab0485626c32a
    $ docker run --net mynet busybox:latest ping test
    PING test (172.18.0.2): 56 data bytes
    64 bytes from 172.18.0.2: seq=0 ttl=64 time=0.073 ms
    64 bytes from 172.18.0.2: seq=1 ttl=64 time=0.411 ms
    64 bytes from 172.18.0.2: seq=2 ttl=64 time=0.319 ms
    64 bytes from 172.18.0.2: seq=3 ttl=64 time=0.383 ms
    ...
    ```
@y
    ```console
    $ docker network create mynet
    cb79f45948d87e389e12013fa4d969689ed2c3316985dd832a43aaec9a0fe394
    $ docker run --name test --net mynet -d nginx:alpine
    58df6ecfbc2ad7c42d088ed028d367f9e22a5f834d7c74c66c0ab0485626c32a
    $ docker run --net mynet busybox:latest ping test
    PING test (172.18.0.2): 56 data bytes
    64 bytes from 172.18.0.2: seq=0 ttl=64 time=0.073 ms
    64 bytes from 172.18.0.2: seq=1 ttl=64 time=0.411 ms
    64 bytes from 172.18.0.2: seq=2 ttl=64 time=0.319 ms
    64 bytes from 172.18.0.2: seq=3 ttl=64 time=0.383 ms
    ...
    ```
@z

@x
    ### Capture container ID (--cidfile) {#cidfile}
@y
    ### Capture container ID (--cidfile) {#cidfile}
@z

@x
    To help with automation, you can have Docker write the container ID out to a
    file of your choosing. This is similar to how some programs might write out
    their process ID to a file (you might've seen them as PID files):
@y
    To help with automation, you can have Docker write the container ID out to a
    file of your choosing. This is similar to how some programs might write out
    their process ID to a file (you might've seen them as PID files):
@z

@x
    ```console
    $ docker run --cidfile /tmp/docker_test.cid ubuntu echo "test"
    ```
@y
    ```console
    $ docker run --cidfile /tmp/docker_test.cid ubuntu echo "test"
    ```
@z

@x
    This creates a container and prints `test` to the console. The `cidfile`
    flag makes Docker attempt to create a new file and write the container ID to it.
    If the file exists already, Docker returns an error. Docker closes this
    file when `docker run` exits.
@y
    This creates a container and prints `test` to the console. The `cidfile`
    flag makes Docker attempt to create a new file and write the container ID to it.
    If the file exists already, Docker returns an error. Docker closes this
    file when `docker run` exits.
@z

@x
    ### PID settings (--pid) {#pid}
@y
    ### PID settings (--pid) {#pid}
@z

@x
    ```text
    --pid=""  : Set the PID (Process) Namespace mode for the container,
                 'container:<name|id>': joins another container's PID namespace
                 'host': use the host's PID namespace inside the container
    ```
@y
    ```text
    --pid=""  : Set the PID (Process) Namespace mode for the container,
                 'container:<name|id>': joins another container's PID namespace
                 'host': use the host's PID namespace inside the container
    ```
@z

@x
    By default, all containers have the PID namespace enabled.
@y
    By default, all containers have the PID namespace enabled.
@z

@x
    PID namespace provides separation of processes. The PID Namespace removes the
    view of the system processes, and allows process ids to be reused including
    PID 1.
@y
    PID namespace provides separation of processes. The PID Namespace removes the
    view of the system processes, and allows process ids to be reused including
    PID 1.
@z

@x
    In certain cases you want your container to share the host's process namespace,
    allowing processes within the container to see all of the processes on the
    system. For example, you could build a container with debugging tools like
    `strace` or `gdb`, but want to use these tools when debugging processes within
    the container.
@y
    In certain cases you want your container to share the host's process namespace,
    allowing processes within the container to see all of the processes on the
    system. For example, you could build a container with debugging tools like
    `strace` or `gdb`, but want to use these tools when debugging processes within
    the container.
@z

@x
    #### Example: run htop inside a container
@y
    #### Example: run htop inside a container
@z

@x
    To run `htop` in a container that shares the process namespac of the host:
@y
    To run `htop` in a container that shares the process namespac of the host:
@z

@x
    1. Run an alpine container with the `--pid=host` option:
@y
    1. Run an alpine container with the `--pid=host` option:
@z

@x
       ```console
       $ docker run --rm -it --pid=host alpine
       ```
@y
       ```console
       $ docker run --rm -it --pid=host alpine
       ```
@z

@x
    2. Install `htop` in the container:
@y
    2. Install `htop` in the container:
@z

@x
       ```console
       / # apk add htop
       fetch https://dl-cdn.alpinelinux.org/alpine/v3.18/main/aarch64/APKINDEX.tar.gz
       fetch https://dl-cdn.alpinelinux.org/alpine/v3.18/community/aarch64/APKINDEX.tar.gz
       (1/3) Installing ncurses-terminfo-base (6.4_p20230506-r0)
       (2/3) Installing libncursesw (6.4_p20230506-r0)
       (3/3) Installing htop (3.2.2-r1)
       Executing busybox-1.36.1-r2.trigger
       OK: 9 MiB in 18 packages
       ```
@y
       ```console
       / # apk add htop
       fetch https://dl-cdn.alpinelinux.org/alpine/v3.18/main/aarch64/APKINDEX.tar.gz
       fetch https://dl-cdn.alpinelinux.org/alpine/v3.18/community/aarch64/APKINDEX.tar.gz
       (1/3) Installing ncurses-terminfo-base (6.4_p20230506-r0)
       (2/3) Installing libncursesw (6.4_p20230506-r0)
       (3/3) Installing htop (3.2.2-r1)
       Executing busybox-1.36.1-r2.trigger
       OK: 9 MiB in 18 packages
       ```
@z

@x
    3. Invoke the `htop` command.
@y
    3. Invoke the `htop` command.
@z

@x
       ```console
       / # htop
       ```
@y
       ```console
       / # htop
       ```
@z

@x
    #### Example, join another container's PID namespace
@y
    #### Example, join another container's PID namespace
@z

@x
    Joining another container's PID namespace can be useful for debugging that
    container.
@y
    Joining another container's PID namespace can be useful for debugging that
    container.
@z

@x
    1. Start a container running a Redis server:
@y
    1. Start a container running a Redis server:
@z

@x
       ```console
       $ docker run --rm --name my-nginx -d nginx:alpine
       ```
@y
       ```console
       $ docker run --rm --name my-nginx -d nginx:alpine
       ```
@z

@x
    2. Run an Alpine container that attaches the `--pid` namespace to the
       `my-nginx` container:
@y
    2. Run an Alpine container that attaches the `--pid` namespace to the
       `my-nginx` container:
@z

@x
       ```console
       $ docker run --rm -it --pid=container:my-nginx \
         --cap-add SYS_PTRACE \
         --security-opt seccomp=unconfined \
         alpine
       ```
@y
       ```console
       $ docker run --rm -it --pid=container:my-nginx \
         --cap-add SYS_PTRACE \
         --security-opt seccomp=unconfined \
         alpine
       ```
@z

@x
    3. Install `strace` in the Alpine container:
@y
    3. Install `strace` in the Alpine container:
@z

@x
       ```console
       / # apk add strace
       ```
@y
       ```console
       / # apk add strace
       ```
@z

@x
    4. Attach to process 1, the process ID of the `my-nginx` container:
@y
    4. Attach to process 1, the process ID of the `my-nginx` container:
@z

@x
       ```console
       / # strace -p 1
       strace: Process 1 attached
       ```
@y
       ```console
       / # strace -p 1
       strace: Process 1 attached
       ```
@z

@x
    ### UTS settings (--uts) {#uts}
@y
    ### UTS settings (--uts) {#uts}
@z

@x
    ```text
    --uts=""  : Set the UTS namespace mode for the container
                'host': use the host's UTS namespace inside the container
    ```
@y
    ```text
    --uts=""  : Set the UTS namespace mode for the container
                'host': use the host's UTS namespace inside the container
    ```
@z

@x
    The UTS namespace is for setting the hostname and the domain that's visible to
    running processes in that namespace. By default, all containers, including
    those with `--network=host`, have their own UTS namespace. Setting `--uts` to
    `host` results in the container using the same UTS namespace as the host.
@y
    The UTS namespace is for setting the hostname and the domain that's visible to
    running processes in that namespace. By default, all containers, including
    those with `--network=host`, have their own UTS namespace. Setting `--uts` to
    `host` results in the container using the same UTS namespace as the host.
@z

@x
    > **Note**
    >
    > Docker disallows combining the `--hostname` and `--domainname` flags with
    > `--uts=host`. This is to prevent containers running in the host's UTS
    > namespace from attempting to change the hosts' configuration.
@y
    > **Note**
    >
    > Docker disallows combining the `--hostname` and `--domainname` flags with
    > `--uts=host`. This is to prevent containers running in the host's UTS
    > namespace from attempting to change the hosts' configuration.
@z

@x
    You may wish to share the UTS namespace with the host if you would like the
    hostname of the container to change as the hostname of the host changes. A more
    advanced use case would be changing the host's hostname from a container.
@y
    You may wish to share the UTS namespace with the host if you would like the
    hostname of the container to change as the hostname of the host changes. A more
    advanced use case would be changing the host's hostname from a container.
@z

@x
    ### IPC settings (--ipc) {#ipc}
@y
    ### IPC settings (--ipc) {#ipc}
@z

@x
    ```text
    --ipc="MODE"  : Set the IPC mode for the container
    ```
@y
    ```text
    --ipc="MODE"  : Set the IPC mode for the container
    ```
@z

@x
    The `--ipc` flag accepts the following values:
@y
    The `--ipc` flag accepts the following values:
@z

@x
    | Value                      | Description                                                                       |
    |:---------------------------|:----------------------------------------------------------------------------------|
    | ""                         | Use daemon's default.                                                             |
    | "none"                     | Own private IPC namespace, with /dev/shm not mounted.                             |
    | "private"                  | Own private IPC namespace.                                                        |
    | "shareable"                | Own private IPC namespace, with a possibility to share it with other containers.  |
    | "container:<_name-or-ID_>" | Join another ("shareable") container's IPC namespace.                             |
    | "host"                     | Use the host system's IPC namespace.                                              |
@y
    | Value                      | Description                                                                       |
    |:---------------------------|:----------------------------------------------------------------------------------|
    | ""                         | Use daemon's default.                                                             |
    | "none"                     | Own private IPC namespace, with /dev/shm not mounted.                             |
    | "private"                  | Own private IPC namespace.                                                        |
    | "shareable"                | Own private IPC namespace, with a possibility to share it with other containers.  |
    | "container:<_name-or-ID_>" | Join another ("shareable") container's IPC namespace.                             |
    | "host"                     | Use the host system's IPC namespace.                                              |
@z

@x
    If not specified, daemon default is used, which can either be `"private"`
    or `"shareable"`, depending on the daemon version and configuration.
@y
    If not specified, daemon default is used, which can either be `"private"`
    or `"shareable"`, depending on the daemon version and configuration.
@z

@x
    [System V interprocess communication (IPC)](https://linux.die.net/man/5/ipc)
    namespaces provide separation of named shared memory segments, semaphores and
    message queues.
@y
    [System V interprocess communication (IPC)](https://linux.die.net/man/5/ipc)
    namespaces provide separation of named shared memory segments, semaphores and
    message queues.
@z

@x
    Shared memory segments are used to accelerate inter-process communication at
    memory speed, rather than through pipes or through the network stack. Shared
    memory is commonly used by databases and custom-built (typically C/OpenMPI,
    C++/using boost libraries) high performance applications for scientific
    computing and financial services industries. If these types of applications
    are broken into multiple containers, you might need to share the IPC mechanisms
    of the containers, using `"shareable"` mode for the main (i.e. "donor")
    container, and `"container:<donor-name-or-ID>"` for other containers.
@y
    Shared memory segments are used to accelerate inter-process communication at
    memory speed, rather than through pipes or through the network stack. Shared
    memory is commonly used by databases and custom-built (typically C/OpenMPI,
    C++/using boost libraries) high performance applications for scientific
    computing and financial services industries. If these types of applications
    are broken into multiple containers, you might need to share the IPC mechanisms
    of the containers, using `"shareable"` mode for the main (i.e. "donor")
    container, and `"container:<donor-name-or-ID>"` for other containers.
@z

@x
    ### Full container capabilities (--privileged) {#privileged}
@y
    ### Full container capabilities (--privileged) {#privileged}
@z

@x
    The following example doesn't work, because by default, Docker drops most
    potentially dangerous kernel capabilities, including `CAP_SYS_ADMIN ` (which is
    required to mount filesystems).
@y
    The following example doesn't work, because by default, Docker drops most
    potentially dangerous kernel capabilities, including `CAP_SYS_ADMIN ` (which is
    required to mount filesystems).
@z

@x
    ```console
    $ docker run -t -i --rm ubuntu bash
    root@bc338942ef20:/# mount -t tmpfs none /mnt
    mount: permission denied
    ```
@y
    ```console
    $ docker run -t -i --rm ubuntu bash
    root@bc338942ef20:/# mount -t tmpfs none /mnt
    mount: permission denied
    ```
@z

@x
    It works when you add the `--privileged` flag:
@y
    It works when you add the `--privileged` flag:
@z

@x
    ```console
    $ docker run -t -i --privileged ubuntu bash
    root@50e3f57e16e6:/# mount -t tmpfs none /mnt
    root@50e3f57e16e6:/# df -h
    Filesystem      Size  Used Avail Use% Mounted on
    none            1.9G     0  1.9G   0% /mnt
    ```
@y
    ```console
    $ docker run -t -i --privileged ubuntu bash
    root@50e3f57e16e6:/# mount -t tmpfs none /mnt
    root@50e3f57e16e6:/# df -h
    Filesystem      Size  Used Avail Use% Mounted on
    none            1.9G     0  1.9G   0% /mnt
    ```
@z

@x
    The `--privileged` flag gives all capabilities to the container, and it also
    lifts all the limitations enforced by the `device` cgroup controller. In other
    words, the container can then do almost everything that the host can do. This
    flag exists to allow special use-cases, like running Docker within Docker.
@y
    The `--privileged` flag gives all capabilities to the container, and it also
    lifts all the limitations enforced by the `device` cgroup controller. In other
    words, the container can then do almost everything that the host can do. This
    flag exists to allow special use-cases, like running Docker within Docker.
@z

@x
    ### Set working directory (-w, --workdir) {#workdir}
@y
    ### Set working directory (-w, --workdir) {#workdir}
@z

@x
    ```console
    $ docker run -w /path/to/dir/ -i -t ubuntu pwd
    ```
@y
    ```console
    $ docker run -w /path/to/dir/ -i -t ubuntu pwd
    ```
@z

@x
    The `-w` option runs the command executed inside the directory specified, in this example,
    `/path/to/dir/`. If the path doesn't exist, Docker creates it inside the container.
@y
    The `-w` option runs the command executed inside the directory specified, in this example,
    `/path/to/dir/`. If the path doesn't exist, Docker creates it inside the container.
@z

@x
    ### Set storage driver options per container (--storage-opt) {#storage-opt}
@y
    ### Set storage driver options per container (--storage-opt) {#storage-opt}
@z

@x
    ```console
    $ docker run -it --storage-opt size=120G fedora /bin/bash
    ```
@y
    ```console
    $ docker run -it --storage-opt size=120G fedora /bin/bash
    ```
@z

@x
    This (size) constraints the container filesystem size to 120G at creation time.
    This option is only available for the `btrfs`, `overlay2`, `windowsfilter`,
    and `zfs` storage drivers.
@y
    This (size) constraints the container filesystem size to 120G at creation time.
    This option is only available for the `btrfs`, `overlay2`, `windowsfilter`,
    and `zfs` storage drivers.
@z

@x
    For the `overlay2` storage driver, the size option is only available if the
    backing filesystem is `xfs` and mounted with the `pquota` mount option.
    Under these conditions, you can pass any size less than the backing filesystem size.
@y
    For the `overlay2` storage driver, the size option is only available if the
    backing filesystem is `xfs` and mounted with the `pquota` mount option.
    Under these conditions, you can pass any size less than the backing filesystem size.
@z

@x
    For the `windowsfilter`, `btrfs`, and `zfs` storage drivers, you cannot pass a
    size less than the Default BaseFS Size.
@y
    For the `windowsfilter`, `btrfs`, and `zfs` storage drivers, you cannot pass a
    size less than the Default BaseFS Size.
@z

@x
    ### Mount tmpfs (--tmpfs) {#tmpfs}
@y
    ### Mount tmpfs (--tmpfs) {#tmpfs}
@z

@x
    The `--tmpfs` flag lets you create a `tmpfs` mount.
@y
    The `--tmpfs` flag lets you create a `tmpfs` mount.
@z

@x
    The options that you can pass to `--tmpfs` are identical to the Linux `mount -t
    tmpfs -o` command. The following example mounts an empty `tmpfs` into the
    container with the `rw`, `noexec`, `nosuid`, `size=65536k` options.
@y
    The options that you can pass to `--tmpfs` are identical to the Linux `mount -t
    tmpfs -o` command. The following example mounts an empty `tmpfs` into the
    container with the `rw`, `noexec`, `nosuid`, `size=65536k` options.
@z

@x
    ```console
    $ docker run -d --tmpfs /run:rw,noexec,nosuid,size=65536k my_image
    ```
@y
    ```console
    $ docker run -d --tmpfs /run:rw,noexec,nosuid,size=65536k my_image
    ```
@z

@x
    For more information, see [tmpfs mounts](/storage/tmpfs/).
@y
    For more information, see [tmpfs mounts](/storage/tmpfs/).
@z

@x
    ### Mount volume (-v) {#volume}
@y
    ### Mount volume (-v) {#volume}
@z

@x
    ```console
    $ docker  run  -v $(pwd):$(pwd) -w $(pwd) -i -t  ubuntu pwd
    ```
@y
    ```console
    $ docker  run  -v $(pwd):$(pwd) -w $(pwd) -i -t  ubuntu pwd
    ```
@z

@x
    The example above mounts the current directory into the container at the same path
    using the `-v` flag, sets it as the working directory, and then runs the `pwd` command inside the container.
@y
    The example above mounts the current directory into the container at the same path
    using the `-v` flag, sets it as the working directory, and then runs the `pwd` command inside the container.
@z

@x
    As of Docker Engine version 23, you can use relative paths on the host.
@y
    As of Docker Engine version 23, you can use relative paths on the host.
@z

@x
    ```console
    $ docker  run  -v ./content:/content -w /content -i -t  ubuntu pwd
    ```
@y
    ```console
    $ docker  run  -v ./content:/content -w /content -i -t  ubuntu pwd
    ```
@z

@x
    The example above mounts the `content` directory in the current directory into the container at the
    `/content` path using the `-v` flag, sets it as the working directory, and then
    runs the `pwd` command inside the container.
@y
    The example above mounts the `content` directory in the current directory into the container at the
    `/content` path using the `-v` flag, sets it as the working directory, and then
    runs the `pwd` command inside the container.
@z

@x
    ```console
    $ docker run -v /doesnt/exist:/foo -w /foo -i -t ubuntu bash
    ```
@y
    ```console
    $ docker run -v /doesnt/exist:/foo -w /foo -i -t ubuntu bash
    ```
@z

@x
    When the host directory of a bind-mounted volume doesn't exist, Docker
    automatically creates this directory on the host for you. In the
    example above, Docker creates the `/doesnt/exist`
    folder before starting your container.
@y
    When the host directory of a bind-mounted volume doesn't exist, Docker
    automatically creates this directory on the host for you. In the
    example above, Docker creates the `/doesnt/exist`
    folder before starting your container.
@z

@x
    ### Mount volume read-only (--read-only) {#read-only}
@y
    ### Mount volume read-only (--read-only) {#read-only}
@z

@x
    ```console
    $ docker run --read-only -v /icanwrite busybox touch /icanwrite/here
    ```
@y
    ```console
    $ docker run --read-only -v /icanwrite busybox touch /icanwrite/here
    ```
@z

@x
    You can use volumes in combination with the `--read-only` flag to control where
    a container writes files. The `--read-only` flag mounts the container's root
    filesystem as read only prohibiting writes to locations other than the
    specified volumes for the container.
@y
    You can use volumes in combination with the `--read-only` flag to control where
    a container writes files. The `--read-only` flag mounts the container's root
    filesystem as read only prohibiting writes to locations other than the
    specified volumes for the container.
@z

@x
    ```console
    $ docker run -t -i -v /var/run/docker.sock:/var/run/docker.sock -v /path/to/static-docker-binary:/usr/bin/docker busybox sh
    ```
@y
    ```console
    $ docker run -t -i -v /var/run/docker.sock:/var/run/docker.sock -v /path/to/static-docker-binary:/usr/bin/docker busybox sh
    ```
@z

@x
    By bind-mounting the Docker Unix socket and statically linked Docker
    binary (refer to [get the Linux binary](/engine/install/binaries/#install-static-binaries)),
    you give the container the full access to create and manipulate the host's
    Docker daemon.
@y
    By bind-mounting the Docker Unix socket and statically linked Docker
    binary (refer to [get the Linux binary](/engine/install/binaries/#install-static-binaries)),
    you give the container the full access to create and manipulate the host's
    Docker daemon.
@z

@x
    On Windows, you must specify the paths using Windows-style path semantics.
@y
    On Windows, you must specify the paths using Windows-style path semantics.
@z

@x
    ```powershell
    PS C:\> docker run -v c:\foo:c:\dest microsoft/nanoserver cmd /s /c type c:\dest\somefile.txt
    Contents of file
@y
    ```powershell
    PS C:\> docker run -v c:\foo:c:\dest microsoft/nanoserver cmd /s /c type c:\dest\somefile.txt
    Contents of file
@z

@x
    PS C:\> docker run -v c:\foo:d: microsoft/nanoserver cmd /s /c type d:\somefile.txt
    Contents of file
    ```
@y
    PS C:\> docker run -v c:\foo:d: microsoft/nanoserver cmd /s /c type d:\somefile.txt
    Contents of file
    ```
@z

@x
    The following examples fails when using Windows-based containers, as the
    destination of a volume or bind mount inside the container must be one of:
    a non-existing or empty directory; or a drive other than `C:`. Further, the source
    of a bind mount must be a local directory, not a file.
@y
    The following examples fails when using Windows-based containers, as the
    destination of a volume or bind mount inside the container must be one of:
    a non-existing or empty directory; or a drive other than `C:`. Further, the source
    of a bind mount must be a local directory, not a file.
@z

@x
    ```powershell
    net use z: \\remotemachine\share
    docker run -v z:\foo:c:\dest ...
    docker run -v \\uncpath\to\directory:c:\dest ...
    docker run -v c:\foo\somefile.txt:c:\dest ...
    docker run -v c:\foo:c: ...
    docker run -v c:\foo:c:\existing-directory-with-contents ...
    ```
@y
    ```powershell
    net use z: \\remotemachine\share
    docker run -v z:\foo:c:\dest ...
    docker run -v \\uncpath\to\directory:c:\dest ...
    docker run -v c:\foo\somefile.txt:c:\dest ...
    docker run -v c:\foo:c: ...
    docker run -v c:\foo:c:\existing-directory-with-contents ...
    ```
@z

@x
    For in-depth information about volumes, refer to [manage data in containers](/storage/volumes/)
@y
    For in-depth information about volumes, refer to [manage data in containers](/storage/volumes/)
@z

@x
    ### Add bind mounts or volumes using the --mount flag {#mount}
@y
    ### Add bind mounts or volumes using the --mount flag {#mount}
@z

@x
    The `--mount` flag allows you to mount volumes, host-directories, and `tmpfs`
    mounts in a container.
@y
    The `--mount` flag allows you to mount volumes, host-directories, and `tmpfs`
    mounts in a container.
@z

@x
    The `--mount` flag supports most options supported by the `-v` or the
    `--volume` flag, but uses a different syntax. For in-depth information on the
    `--mount` flag, and a comparison between `--volume` and `--mount`, refer to
    [Bind mounts](/storage/bind-mounts/).
@y
    The `--mount` flag supports most options supported by the `-v` or the
    `--volume` flag, but uses a different syntax. For in-depth information on the
    `--mount` flag, and a comparison between `--volume` and `--mount`, refer to
    [Bind mounts](/storage/bind-mounts/).
@z

@x
    Even though there is no plan to deprecate `--volume`, usage of `--mount` is recommended.
@y
    Even though there is no plan to deprecate `--volume`, usage of `--mount` is recommended.
@z

@x
    Examples:
@y
    Examples:
@z

@x
    ```console
    $ docker run --read-only --mount type=volume,target=/icanwrite busybox touch /icanwrite/here
    ```
@y
    ```console
    $ docker run --read-only --mount type=volume,target=/icanwrite busybox touch /icanwrite/here
    ```
@z

@x
    ```console
    $ docker run -t -i --mount type=bind,src=/data,dst=/data busybox sh
    ```
@y
    ```console
    $ docker run -t -i --mount type=bind,src=/data,dst=/data busybox sh
    ```
@z

@x
    ### Publish or expose port (-p, --expose) {#publish}
@y
    ### Publish or expose port (-p, --expose) {#publish}
@z

@x
    ```console
    $ docker run -p 127.0.0.1:80:8080/tcp nginx:alpine
    ```
@y
    ```console
    $ docker run -p 127.0.0.1:80:8080/tcp nginx:alpine
    ```
@z

@x
    This binds port `8080` of the container to TCP port `80` on `127.0.0.1` of the
    host. You can also specify `udp` and `sctp` ports. The [Networking overview
    page](/network/) explains in detail how to publish ports
    with Docker.
@y
    This binds port `8080` of the container to TCP port `80` on `127.0.0.1` of the
    host. You can also specify `udp` and `sctp` ports. The [Networking overview
    page](/network/) explains in detail how to publish ports
    with Docker.
@z

@x
    > **Note**
    >
    > If you don't specify an IP address (i.e., `-p 80:80` instead of `-p
    > 127.0.0.1:80:80`) when publishing a container's ports, Docker publishes the
    > port on all interfaces (address `0.0.0.0`) by default. These ports are
    > externally accessible. This also applies if you configured UFW to block this
    > specific port, as Docker manages its own iptables rules. [Read
    > more](/network/packet-filtering-firewalls/)
@y
    > **Note**
    >
    > If you don't specify an IP address (i.e., `-p 80:80` instead of `-p
    > 127.0.0.1:80:80`) when publishing a container's ports, Docker publishes the
    > port on all interfaces (address `0.0.0.0`) by default. These ports are
    > externally accessible. This also applies if you configured UFW to block this
    > specific port, as Docker manages its own iptables rules. [Read
    > more](/network/packet-filtering-firewalls/)
@z

@x
    ```console
    $ docker run --expose 80 nginx:alpine
    ```
@y
    ```console
    $ docker run --expose 80 nginx:alpine
    ```
@z

@x
    This exposes port `80` of the container without publishing the port to the host
    system's interfaces.
@y
    This exposes port `80` of the container without publishing the port to the host
    system's interfaces.
@z

@x
    ### Publish all exposed ports (-P, --publish-all) {#publish-all}
@y
    ### Publish all exposed ports (-P, --publish-all) {#publish-all}
@z

@x
    ```console
    $ docker run -P nginx:alpine
    ```
@y
    ```console
    $ docker run -P nginx:alpine
    ```
@z

@x
    The `-P`, or `--publish-all`, flag publishes all the exposed ports to the host.
    Docker binds each exposed port to a random port on the host.
@y
    The `-P`, or `--publish-all`, flag publishes all the exposed ports to the host.
    Docker binds each exposed port to a random port on the host.
@z

@x
    The `-P` flag only publishes port numbers that are explicitly flagged as
    exposed, either using the Dockerfile `EXPOSE` instruction or the `--expose`
    flag for the `docker run` command.
@y
    The `-P` flag only publishes port numbers that are explicitly flagged as
    exposed, either using the Dockerfile `EXPOSE` instruction or the `--expose`
    flag for the `docker run` command.
@z

@x
    The range of ports are within an *ephemeral port range* defined by
    `/proc/sys/net/ipv4/ip_local_port_range`. Use the `-p` flag to explicitly map a
    single port or range of ports.
@y
    The range of ports are within an *ephemeral port range* defined by
    `/proc/sys/net/ipv4/ip_local_port_range`. Use the `-p` flag to explicitly map a
    single port or range of ports.
@z

@x
    ### Set the pull policy (--pull) {#pull}
@y
    ### Set the pull policy (--pull) {#pull}
@z

@x
    Use the `--pull` flag to set the image pull policy when creating (and running)
    the container.
@y
    Use the `--pull` flag to set the image pull policy when creating (and running)
    the container.
@z

@x
    The `--pull` flag can take one of these values:
@y
    The `--pull` flag can take one of these values:
@z

@x
    | Value               | Description                                                                                                       |
    |:--------------------|:------------------------------------------------------------------------------------------------------------------|
    | `missing` (default) | Pull the image if it was not found in the image cache, or use the cached image otherwise.                         |
    | `never`             | Do not pull the image, even if it's missing, and produce an error if the image does not exist in the image cache. |
    | `always`            | Always perform a pull before creating the container.                                                              |
@y
    | Value               | Description                                                                                                       |
    |:--------------------|:------------------------------------------------------------------------------------------------------------------|
    | `missing` (default) | Pull the image if it was not found in the image cache, or use the cached image otherwise.                         |
    | `never`             | Do not pull the image, even if it's missing, and produce an error if the image does not exist in the image cache. |
    | `always`            | Always perform a pull before creating the container.                                                              |
@z

@x
    When creating (and running) a container from an image, the daemon checks if the
    image exists in the local image cache. If the image is missing, an error is
    returned to the CLI, allowing it to initiate a pull.
@y
    When creating (and running) a container from an image, the daemon checks if the
    image exists in the local image cache. If the image is missing, an error is
    returned to the CLI, allowing it to initiate a pull.
@z

@x
    The default (`missing`) is to only pull the image if it's not present in the
    daemon's image cache. This default allows you to run images that only exist
    locally (for example, images you built from a Dockerfile, but that have not
    been pushed to a registry), and reduces networking.
@y
    The default (`missing`) is to only pull the image if it's not present in the
    daemon's image cache. This default allows you to run images that only exist
    locally (for example, images you built from a Dockerfile, but that have not
    been pushed to a registry), and reduces networking.
@z

@x
    The `always` option always initiates a pull before creating the container. This
    option makes sure the image is up-to-date, and prevents you from using outdated
    images, but may not be suitable in situations where you want to test a locally
    built image before pushing (as pulling the image overwrites the existing image
    in the image cache).
@y
    The `always` option always initiates a pull before creating the container. This
    option makes sure the image is up-to-date, and prevents you from using outdated
    images, but may not be suitable in situations where you want to test a locally
    built image before pushing (as pulling the image overwrites the existing image
    in the image cache).
@z

@x
    The `never` option disables (implicit) pulling images when creating containers,
    and only uses images that are available in the image cache. If the specified
    image is not found, an error is produced, and the container is not created.
    This option is useful in situations where networking is not available, or to
    prevent images from being pulled implicitly when creating containers.
@y
    The `never` option disables (implicit) pulling images when creating containers,
    and only uses images that are available in the image cache. If the specified
    image is not found, an error is produced, and the container is not created.
    This option is useful in situations where networking is not available, or to
    prevent images from being pulled implicitly when creating containers.
@z

@x
    The following example shows `docker run` with the `--pull=never` option set,
    which produces en error as the image is missing in the image-cache:
@y
    The following example shows `docker run` with the `--pull=never` option set,
    which produces en error as the image is missing in the image-cache:
@z

@x
    ```console
    $ docker run --pull=never hello-world
    docker: Error response from daemon: No such image: hello-world:latest.
    ```
@y
    ```console
    $ docker run --pull=never hello-world
    docker: Error response from daemon: No such image: hello-world:latest.
    ```
@z

@x
    ### Set environment variables (-e, --env, --env-file) {#env}
@y
    ### Set environment variables (-e, --env, --env-file) {#env}
@z

@x
    ```console
    $ docker run -e MYVAR1 --env MYVAR2=foo --env-file ./env.list ubuntu bash
    ```
@y
    ```console
    $ docker run -e MYVAR1 --env MYVAR2=foo --env-file ./env.list ubuntu bash
    ```
@z

@x
    Use the `-e`, `--env`, and `--env-file` flags to set simple (non-array)
    environment variables in the container you're running, or overwrite variables
    defined in the Dockerfile of the image you're running.
@y
    Use the `-e`, `--env`, and `--env-file` flags to set simple (non-array)
    environment variables in the container you're running, or overwrite variables
    defined in the Dockerfile of the image you're running.
@z

@x
    You can define the variable and its value when running the container:
@y
    You can define the variable and its value when running the container:
@z

@x
    ```console
    $ docker run --env VAR1=value1 --env VAR2=value2 ubuntu env | grep VAR
    VAR1=value1
    VAR2=value2
    ```
@y
    ```console
    $ docker run --env VAR1=value1 --env VAR2=value2 ubuntu env | grep VAR
    VAR1=value1
    VAR2=value2
    ```
@z

@x
    You can also use variables exported to your local environment:
@y
    You can also use variables exported to your local environment:
@z

@x
    ```console
    export VAR1=value1
    export VAR2=value2
@y
    ```console
    export VAR1=value1
    export VAR2=value2
@z

@x
    $ docker run --env VAR1 --env VAR2 ubuntu env | grep VAR
    VAR1=value1
    VAR2=value2
    ```
@y
    $ docker run --env VAR1 --env VAR2 ubuntu env | grep VAR
    VAR1=value1
    VAR2=value2
    ```
@z

@x
    When running the command, the Docker CLI client checks the value the variable
    has in your local environment and passes it to the container.
    If no `=` is provided and that variable isn't exported in your local
    environment, the variable is unset in the container.
@y
    When running the command, the Docker CLI client checks the value the variable
    has in your local environment and passes it to the container.
    If no `=` is provided and that variable isn't exported in your local
    environment, the variable is unset in the container.
@z

@x
    You can also load the environment variables from a file. This file should use
    the syntax `<variable>=value` (which sets the variable to the given value) or
    `<variable>` (which takes the value from the local environment), and `#` for
    comments. Lines beginning with `#` are treated as line comments and are
    ignored, whereas a `#` appearing anywhere else in a line is treated as part of
    the variable value.
@y
    You can also load the environment variables from a file. This file should use
    the syntax `<variable>=value` (which sets the variable to the given value) or
    `<variable>` (which takes the value from the local environment), and `#` for
    comments. Lines beginning with `#` are treated as line comments and are
    ignored, whereas a `#` appearing anywhere else in a line is treated as part of
    the variable value.
@z

@x
    ```console
    $ cat env.list
    # This is a comment
    VAR1=value1
    VAR2=value2
    USER
@y
    ```console
    $ cat env.list
    # This is a comment
    VAR1=value1
    VAR2=value2
    USER
@z

@x
    $ docker run --env-file env.list ubuntu env | grep -E 'VAR|USER'
    VAR1=value1
    VAR2=value2
    USER=jonzeolla
    ```
@y
    $ docker run --env-file env.list ubuntu env | grep -E 'VAR|USER'
    VAR1=value1
    VAR2=value2
    USER=jonzeolla
    ```
@z

@x
    ### Set metadata on container (-l, --label, --label-file) {#label}
@y
    ### Set metadata on container (-l, --label, --label-file) {#label}
@z

@x
    A label is a `key=value` pair that applies metadata to a container. To label a container with two labels:
@y
    A label is a `key=value` pair that applies metadata to a container. To label a container with two labels:
@z

@x
    ```console
    $ docker run -l my-label --label com.example.foo=bar ubuntu bash
    ```
@y
    ```console
    $ docker run -l my-label --label com.example.foo=bar ubuntu bash
    ```
@z

@x
    The `my-label` key doesn't specify a value so the label defaults to an empty
    string (`""`). To add multiple labels, repeat the label flag (`-l` or `--label`).
@y
    The `my-label` key doesn't specify a value so the label defaults to an empty
    string (`""`). To add multiple labels, repeat the label flag (`-l` or `--label`).
@z

@x
    The `key=value` must be unique to avoid overwriting the label value. If you
    specify labels with identical keys but different values, each subsequent value
    overwrites the previous. Docker uses the last `key=value` you supply.
@y
    The `key=value` must be unique to avoid overwriting the label value. If you
    specify labels with identical keys but different values, each subsequent value
    overwrites the previous. Docker uses the last `key=value` you supply.
@z

@x
    Use the `--label-file` flag to load multiple labels from a file. Delimit each
    label in the file with an EOL mark. The example below loads labels from a
    labels file in the current directory:
@y
    Use the `--label-file` flag to load multiple labels from a file. Delimit each
    label in the file with an EOL mark. The example below loads labels from a
    labels file in the current directory:
@z

@x
    ```console
    $ docker run --label-file ./labels ubuntu bash
    ```
@y
    ```console
    $ docker run --label-file ./labels ubuntu bash
    ```
@z

@x
    The label-file format is similar to the format for loading environment
    variables. (Unlike environment variables, labels are not visible to processes
    running inside a container.) The following example shows a label-file
    format:
@y
    The label-file format is similar to the format for loading environment
    variables. (Unlike environment variables, labels are not visible to processes
    running inside a container.) The following example shows a label-file
    format:
@z

@x
    ```console
    com.example.label1="a label"
@y
    ```console
    com.example.label1="a label"
@z

@x
    # this is a comment
    com.example.label2=another\ label
    com.example.label3
    ```
@y
    # this is a comment
    com.example.label2=another\ label
    com.example.label3
    ```
@z

@x
    You can load multiple label-files by supplying multiple  `--label-file` flags.
@y
    You can load multiple label-files by supplying multiple  `--label-file` flags.
@z

@x
    For additional information on working with labels, see
    [Labels](/config/labels-custom-metadata/).
@y
    For additional information on working with labels, see
    [Labels](/config/labels-custom-metadata/).
@z

@x
    ### Connect a container to a network (--network) {#network}
@y
    ### Connect a container to a network (--network) {#network}
@z

@x
    To start a container and connect it to a network, use the `--network` option.
@y
    To start a container and connect it to a network, use the `--network` option.
@z

@x
    The following commands create a network named `my-net` and adds a `busybox` container
    to the `my-net` network.
@y
    The following commands create a network named `my-net` and adds a `busybox` container
    to the `my-net` network.
@z

@x
    ```console
    $ docker network create my-net
    $ docker run -itd --network=my-net busybox
    ```
@y
    ```console
    $ docker network create my-net
    $ docker run -itd --network=my-net busybox
    ```
@z

@x
    You can also choose the IP addresses for the container with `--ip` and `--ip6`
    flags when you start the container on a user-defined network. To assign a
    static IP to containers, you must specify subnet block for the network.
@y
    You can also choose the IP addresses for the container with `--ip` and `--ip6`
    flags when you start the container on a user-defined network. To assign a
    static IP to containers, you must specify subnet block for the network.
@z

@x
    ```console
    $ docker network create --subnet 192.0.2.0/24 my-net
    $ docker run -itd --network=my-net --ip=192.0.2.69 busybox
    ```
@y
    ```console
    $ docker network create --subnet 192.0.2.0/24 my-net
    $ docker run -itd --network=my-net --ip=192.0.2.69 busybox
    ```
@z

@x
    If you want to add a running container to a network use the `docker network connect` subcommand.
@y
    If you want to add a running container to a network use the `docker network connect` subcommand.
@z

@x
    You can connect multiple containers to the same network. Once connected, the
    containers can communicate using only another container's IP address
    or name. For `overlay` networks or custom plugins that support multi-host
    connectivity, containers connected to the same multi-host network but launched
    from different Engines can also communicate in this way.
@y
    You can connect multiple containers to the same network. Once connected, the
    containers can communicate using only another container's IP address
    or name. For `overlay` networks or custom plugins that support multi-host
    connectivity, containers connected to the same multi-host network but launched
    from different Engines can also communicate in this way.
@z

@x
    > **Note**
    >
    > The default bridge network only allow containers to communicate with each other using
    > internal IP addresses. User-created bridge networks provide DNS resolution between
    > containers using container names.
@y
    > **Note**
    >
    > The default bridge network only allow containers to communicate with each other using
    > internal IP addresses. User-created bridge networks provide DNS resolution between
    > containers using container names.
@z

@x
    You can disconnect a container from a network using the `docker network
    disconnect` command.
@y
    You can disconnect a container from a network using the `docker network
    disconnect` command.
@z

@x
    For more information on connecting a container to a network when using the `run` command, see the ["*Docker network overview*"](/network/).
@y
    For more information on connecting a container to a network when using the `run` command, see the ["*Docker network overview*"](/network/).
@z

@x
    ### Mount volumes from container (--volumes-from) {#volumes-from}
@y
    ### Mount volumes from container (--volumes-from) {#volumes-from}
@z

@x
    ```console
    $ docker run --volumes-from 777f7dc92da7 --volumes-from ba8c0c54f0f2:ro -i -t ubuntu pwd
    ```
@y
    ```console
    $ docker run --volumes-from 777f7dc92da7 --volumes-from ba8c0c54f0f2:ro -i -t ubuntu pwd
    ```
@z

@x
    The `--volumes-from` flag mounts all the defined volumes from the referenced
    containers. You can specify more than one container by repetitions of the `--volumes-from`
    argument. The container ID may be optionally suffixed with `:ro` or `:rw` to
    mount the volumes in read-only or read-write mode, respectively. By default,
    Docker mounts the volumes in the same mode (read write or read only) as
    the reference container.
@y
    The `--volumes-from` flag mounts all the defined volumes from the referenced
    containers. You can specify more than one container by repetitions of the `--volumes-from`
    argument. The container ID may be optionally suffixed with `:ro` or `:rw` to
    mount the volumes in read-only or read-write mode, respectively. By default,
    Docker mounts the volumes in the same mode (read write or read only) as
    the reference container.
@z

@x
    Labeling systems like SELinux require placing proper labels on volume
    content mounted into a container. Without a label, the security system might
    prevent the processes running inside the container from using the content. By
    default, Docker does not change the labels set by the OS.
@y
    Labeling systems like SELinux require placing proper labels on volume
    content mounted into a container. Without a label, the security system might
    prevent the processes running inside the container from using the content. By
    default, Docker does not change the labels set by the OS.
@z

@x
    To change the label in the container context, you can add either of two suffixes
    `:z` or `:Z` to the volume mount. These suffixes tell Docker to relabel file
    objects on the shared volumes. The `z` option tells Docker that two containers
    share the volume content. As a result, Docker labels the content with a shared
    content label. Shared volume labels allow all containers to read/write content.
    The `Z` option tells Docker to label the content with a private unshared label.
    Only the current container can use a private volume.
@y
    To change the label in the container context, you can add either of two suffixes
    `:z` or `:Z` to the volume mount. These suffixes tell Docker to relabel file
    objects on the shared volumes. The `z` option tells Docker that two containers
    share the volume content. As a result, Docker labels the content with a shared
    content label. Shared volume labels allow all containers to read/write content.
    The `Z` option tells Docker to label the content with a private unshared label.
    Only the current container can use a private volume.
@z

@x
    ### Detached mode (-d, --detach) {#detach}
@y
    ### Detached mode (-d, --detach) {#detach}
@z

@x
    The `--detach` (or `-d`) flag starts a container as a background process that
    doesn't occupy your terminal window. By design, containers started in detached
    mode exit when the root process used to run the container exits, unless you
    also specify the `--rm` option. If you use `-d` with `--rm`, the container is
    removed when it exits or when the daemon exits, whichever happens first.
@y
    The `--detach` (or `-d`) flag starts a container as a background process that
    doesn't occupy your terminal window. By design, containers started in detached
    mode exit when the root process used to run the container exits, unless you
    also specify the `--rm` option. If you use `-d` with `--rm`, the container is
    removed when it exits or when the daemon exits, whichever happens first.
@z

@x
    Don't pass a `service x start` command to a detached container. For example,
    this command attempts to start the `nginx` service.
@y
    Don't pass a `service x start` command to a detached container. For example,
    this command attempts to start the `nginx` service.
@z

@x
    ```console
    $ docker run -d -p 80:80 my_image service nginx start
    ```
@y
    ```console
    $ docker run -d -p 80:80 my_image service nginx start
    ```
@z

@x
    This succeeds in starting the `nginx` service inside the container. However, it
    fails the detached container paradigm in that, the root process (`service nginx
    start`) returns and the detached container stops as designed. As a result, the
    `nginx` service starts but can't be used. Instead, to start a process such as
    the `nginx` web server do the following:
@y
    This succeeds in starting the `nginx` service inside the container. However, it
    fails the detached container paradigm in that, the root process (`service nginx
    start`) returns and the detached container stops as designed. As a result, the
    `nginx` service starts but can't be used. Instead, to start a process such as
    the `nginx` web server do the following:
@z

@x
    ```console
    $ docker run -d -p 80:80 my_image nginx -g 'daemon off;'
    ```
@y
    ```console
    $ docker run -d -p 80:80 my_image nginx -g 'daemon off;'
    ```
@z

@x
    To do input/output with a detached container use network connections or shared
    volumes. These are required because the container is no longer listening to the
    command line where `docker run` was run.
@y
    To do input/output with a detached container use network connections or shared
    volumes. These are required because the container is no longer listening to the
    command line where `docker run` was run.
@z

@x
    ### Override the detach sequence (--detach-keys) {#detach-keys}
@y
    ### Override the detach sequence (--detach-keys) {#detach-keys}
@z

@x
    Use the `--detach-keys` option to override the Docker key sequence for detach.
    This is useful if the Docker default sequence conflicts with key sequence you
    use for other applications. There are two ways to define your own detach key
    sequence, as a per-container override or as a configuration property on  your
    entire configuration.
@y
    Use the `--detach-keys` option to override the Docker key sequence for detach.
    This is useful if the Docker default sequence conflicts with key sequence you
    use for other applications. There are two ways to define your own detach key
    sequence, as a per-container override or as a configuration property on  your
    entire configuration.
@z

@x
    To override the sequence for an individual container, use the
    `--detach-keys="<sequence>"` flag with the `docker attach` command. The format of
    the `<sequence>` is either a letter [a-Z], or the `ctrl-` combined with any of
    the following:
@y
    To override the sequence for an individual container, use the
    `--detach-keys="<sequence>"` flag with the `docker attach` command. The format of
    the `<sequence>` is either a letter [a-Z], or the `ctrl-` combined with any of
    the following:
@z

@x
    * `a-z` (a single lowercase alpha character )
    * `@` (at sign)
    * `[` (left bracket)
    * `\\` (two backward slashes)
    *  `_` (underscore)
    * `^` (caret)
@y
    * `a-z` (a single lowercase alpha character )
    * `@` (at sign)
    * `[` (left bracket)
    * `\\` (two backward slashes)
    *  `_` (underscore)
    * `^` (caret)
@z

@x
    These `a`, `ctrl-a`, `X`, or `ctrl-\\` values are all examples of valid key
    sequences. To configure a different configuration default key sequence for all
    containers, see [**Configuration file** section](cli.md#configuration-files).
@y
    These `a`, `ctrl-a`, `X`, or `ctrl-\\` values are all examples of valid key
    sequences. To configure a different configuration default key sequence for all
    containers, see [**Configuration file** section](cli.md#configuration-files).
@z

@x
    ### Add host device to container (--device) {#device}
@y
    ### Add host device to container (--device) {#device}
@z

@x
    ```console
    $ docker run -it --rm \
        --device=/dev/sdc:/dev/xvdc \
        --device=/dev/sdd \
        --device=/dev/zero:/dev/foobar \
        ubuntu ls -l /dev/{xvdc,sdd,foobar}
@y
    ```console
    $ docker run -it --rm \
        --device=/dev/sdc:/dev/xvdc \
        --device=/dev/sdd \
        --device=/dev/zero:/dev/foobar \
        ubuntu ls -l /dev/{xvdc,sdd,foobar}
@z

@x
    brw-rw---- 1 root disk 8, 2 Feb  9 16:05 /dev/xvdc
    brw-rw---- 1 root disk 8, 3 Feb  9 16:05 /dev/sdd
    crw-rw-rw- 1 root root 1, 5 Feb  9 16:05 /dev/foobar
    ```
@y
    brw-rw---- 1 root disk 8, 2 Feb  9 16:05 /dev/xvdc
    brw-rw---- 1 root disk 8, 3 Feb  9 16:05 /dev/sdd
    crw-rw-rw- 1 root root 1, 5 Feb  9 16:05 /dev/foobar
    ```
@z

@x
    It's often necessary to directly expose devices to a container. The `--device`
    option enables that. For example, adding a specific block storage device or loop
    device or audio device to an otherwise unprivileged container
    (without the `--privileged` flag) and have the application directly access it.
@y
    It's often necessary to directly expose devices to a container. The `--device`
    option enables that. For example, adding a specific block storage device or loop
    device or audio device to an otherwise unprivileged container
    (without the `--privileged` flag) and have the application directly access it.
@z

@x
    By default, the container is able to `read`, `write` and `mknod` these devices.
    This can be overridden using a third `:rwm` set of options to each `--device`
    flag. If the container is running in privileged mode, then Docker ignores the
    specified permissions.
@y
    By default, the container is able to `read`, `write` and `mknod` these devices.
    This can be overridden using a third `:rwm` set of options to each `--device`
    flag. If the container is running in privileged mode, then Docker ignores the
    specified permissions.
@z

@x
    ```console
    $ docker run --device=/dev/sda:/dev/xvdc --rm -it ubuntu fdisk  /dev/xvdc
@y
    ```console
    $ docker run --device=/dev/sda:/dev/xvdc --rm -it ubuntu fdisk  /dev/xvdc
@z

@x
    Command (m for help): q
    $ docker run --device=/dev/sda:/dev/xvdc:r --rm -it ubuntu fdisk  /dev/xvdc
    You will not be able to write the partition table.
@y
    Command (m for help): q
    $ docker run --device=/dev/sda:/dev/xvdc:r --rm -it ubuntu fdisk  /dev/xvdc
    You will not be able to write the partition table.
@z

@x
    Command (m for help): q
@y
    Command (m for help): q
@z

@x
    $ docker run --device=/dev/sda:/dev/xvdc:rw --rm -it ubuntu fdisk  /dev/xvdc
@y
    $ docker run --device=/dev/sda:/dev/xvdc:rw --rm -it ubuntu fdisk  /dev/xvdc
@z

@x
    Command (m for help): q
@y
    Command (m for help): q
@z

@x
    $ docker run --device=/dev/sda:/dev/xvdc:m --rm -it ubuntu fdisk  /dev/xvdc
    fdisk: unable to open /dev/xvdc: Operation not permitted
    ```
@y
    $ docker run --device=/dev/sda:/dev/xvdc:m --rm -it ubuntu fdisk  /dev/xvdc
    fdisk: unable to open /dev/xvdc: Operation not permitted
    ```
@z

@x
    > **Note**
    >
    > The `--device` option cannot be safely used with ephemeral devices. You shouldn't
    > add block devices that may be removed to untrusted containers with `--device`.
@y
    > **Note**
    >
    > The `--device` option cannot be safely used with ephemeral devices. You shouldn't
    > add block devices that may be removed to untrusted containers with `--device`.
@z

@x
    For Windows, the format of the string passed to the `--device` option is in
    the form of `--device=<IdType>/<Id>`. Beginning with Windows Server 2019
    and Windows 10 October 2018 Update, Windows only supports an IdType of
    `class` and the Id as a [device interface class
    GUID](https://docs.microsoft.com/en-us/windows-hardware/drivers/install/overview-of-device-interface-classes).
    Refer to the table defined in the [Windows container
    docs](https://docs.microsoft.com/en-us/virtualization/windowscontainers/deploy-containers/hardware-devices-in-containers)
    for a list of container-supported device interface class GUIDs.
@y
    For Windows, the format of the string passed to the `--device` option is in
    the form of `--device=<IdType>/<Id>`. Beginning with Windows Server 2019
    and Windows 10 October 2018 Update, Windows only supports an IdType of
    `class` and the Id as a [device interface class
    GUID](https://docs.microsoft.com/en-us/windows-hardware/drivers/install/overview-of-device-interface-classes).
    Refer to the table defined in the [Windows container
    docs](https://docs.microsoft.com/en-us/virtualization/windowscontainers/deploy-containers/hardware-devices-in-containers)
    for a list of container-supported device interface class GUIDs.
@z

@x
    If you specify this option for a process-isolated Windows container, Docker makes
    _all_ devices that implement the requested device interface class GUID
    available in the container. For example, the command below makes all COM
    ports on the host visible in the container.
@y
    If you specify this option for a process-isolated Windows container, Docker makes
    _all_ devices that implement the requested device interface class GUID
    available in the container. For example, the command below makes all COM
    ports on the host visible in the container.
@z

@x
    ```powershell
    PS C:\> docker run --device=class/86E0D1E0-8089-11D0-9CE4-08003E301F73 mcr.microsoft.com/windows/servercore:ltsc2019
    ```
@y
    ```powershell
    PS C:\> docker run --device=class/86E0D1E0-8089-11D0-9CE4-08003E301F73 mcr.microsoft.com/windows/servercore:ltsc2019
    ```
@z

@x
    > **Note**
    >
    > The `--device` option is only supported on process-isolated Windows containers,
    > and produces an error if the container isolation is `hyperv`.
@y
    > **Note**
    >
    > The `--device` option is only supported on process-isolated Windows containers,
    > and produces an error if the container isolation is `hyperv`.
@z

@x
    #### CDI devices
@y
    #### CDI devices
@z

@x
    > **Note**
    >
    > This is experimental feature and as such doesn't represent a stable API.
@y
    > **Note**
    >
    > This is experimental feature and as such doesn't represent a stable API.
@z

@x
    Container Device Interface (CDI) is a
    [standardized](https://github.com/cncf-tags/container-device-interface/blob/main/SPEC.md)
    mechanism for container runtimes to create containers which are able to
    interact with third party devices.
@y
    Container Device Interface (CDI) is a
    [standardized](https://github.com/cncf-tags/container-device-interface/blob/main/SPEC.md)
    mechanism for container runtimes to create containers which are able to
    interact with third party devices.
@z

@x
    With CDI, device configurations are defined using a JSON file. In addition to
    enabling the container to interact with the device node, it also lets you
    specify additional configuration for the device, such as kernel modules, host
    libraries, and environment variables.
@y
    With CDI, device configurations are defined using a JSON file. In addition to
    enabling the container to interact with the device node, it also lets you
    specify additional configuration for the device, such as kernel modules, host
    libraries, and environment variables.
@z

@x
    You can reference a CDI device with the `--device` flag using the
    fully-qualified name of the device, as shown in the following example:
@y
    You can reference a CDI device with the `--device` flag using the
    fully-qualified name of the device, as shown in the following example:
@z

@x
    ```console
    $ docker run --device=vendor.com/class=device-name --rm -it ubuntu
    ```
@y
    ```console
    $ docker run --device=vendor.com/class=device-name --rm -it ubuntu
    ```
@z

@x
    This starts an `ubuntu` container with access to the specified CDI device,
    `vendor.com/class=device-name`, assuming that:
@y
    This starts an `ubuntu` container with access to the specified CDI device,
    `vendor.com/class=device-name`, assuming that:
@z

@x
    - A valid CDI specification (JSON file) for the requested device is available
      on the system running the daemon, in one of the configured CDI specification
      directories.
    - The CDI feature has been enabled on the daemon side, see [Enable CDI
      devices](dockerd.md#enable-cdi-devices).
@y
    - A valid CDI specification (JSON file) for the requested device is available
      on the system running the daemon, in one of the configured CDI specification
      directories.
    - The CDI feature has been enabled on the daemon side, see [Enable CDI
      devices](dockerd.md#enable-cdi-devices).
@z

@x
    ### Attach to STDIN/STDOUT/STDERR (-a, --attach) {#attach}
@y
    ### Attach to STDIN/STDOUT/STDERR (-a, --attach) {#attach}
@z

@x
    The `--attach` (or `-a`) flag tells `docker run` to bind to the container's
    `STDIN`, `STDOUT` or `STDERR`. This makes it possible to manipulate the output
    and input as needed. You can specify to which of the three standard streams
    (`STDIN`, `STDOUT`, `STDERR`) you'd like to connect instead, as in:
@y
    The `--attach` (or `-a`) flag tells `docker run` to bind to the container's
    `STDIN`, `STDOUT` or `STDERR`. This makes it possible to manipulate the output
    and input as needed. You can specify to which of the three standard streams
    (`STDIN`, `STDOUT`, `STDERR`) you'd like to connect instead, as in:
@z

@x
    ```console
    $ docker run -a stdin -a stdout -i -t ubuntu /bin/bash
    ```
@y
    ```console
    $ docker run -a stdin -a stdout -i -t ubuntu /bin/bash
    ```
@z

@x
    The following example pipes data into a container and prints the container's ID
    by attaching only to the container's `STDIN`.
@y
    The following example pipes data into a container and prints the container's ID
    by attaching only to the container's `STDIN`.
@z

@x
    ```console
    $ echo "test" | docker run -i -a stdin ubuntu cat -
    ```
@y
    ```console
    $ echo "test" | docker run -i -a stdin ubuntu cat -
    ```
@z

@x
    The following example doesn't print anything to the console unless there's an
    error because output is only attached to the `STDERR` of the container. The
    container's logs still store what's written to `STDERR` and `STDOUT`.
@y
    The following example doesn't print anything to the console unless there's an
    error because output is only attached to the `STDERR` of the container. The
    container's logs still store what's written to `STDERR` and `STDOUT`.
@z

@x
    ```console
    $ docker run -a stderr ubuntu echo test
    ```
@y
    ```console
    $ docker run -a stderr ubuntu echo test
    ```
@z

@x
    The following example shows a way of using `--attach` to pipe a file into a
    container. The command prints the container's ID after the build completes and
    you can retrieve the build logs using `docker logs`. This is useful if you need
    to pipe a file or something else into a container and retrieve the container's
    ID once the container has finished running.
@y
    The following example shows a way of using `--attach` to pipe a file into a
    container. The command prints the container's ID after the build completes and
    you can retrieve the build logs using `docker logs`. This is useful if you need
    to pipe a file or something else into a container and retrieve the container's
    ID once the container has finished running.
@z

@x
    ```console
    $ cat somefile | docker run -i -a stdin mybuilder dobuild
    ```
@y
    ```console
    $ cat somefile | docker run -i -a stdin mybuilder dobuild
    ```
@z

@x
    > **Note**
    >
    > A process running as PID 1 inside a container is treated specially by
    > Linux: it ignores any signal with the default action. So, the process
    > doesn't terminate on `SIGINT` or `SIGTERM` unless it's coded to do so.
@y
    > **Note**
    >
    > A process running as PID 1 inside a container is treated specially by
    > Linux: it ignores any signal with the default action. So, the process
    > doesn't terminate on `SIGINT` or `SIGTERM` unless it's coded to do so.
@z

@x
    See also [the `docker cp` command](container_cp.md).
@y
    See also [the `docker cp` command](container_cp.md).
@z

@x
    ### Keep STDIN open (-i, --interactive) {#interactive}
@y
    ### Keep STDIN open (-i, --interactive) {#interactive}
@z

@x
    The `--interactive` (or `-i`) flag keeps the container's `STDIN` open, and lets
    you send input to the container through standard input.
@y
    The `--interactive` (or `-i`) flag keeps the container's `STDIN` open, and lets
    you send input to the container through standard input.
@z

@x
    ```console
    $ echo hello | docker run --rm -i busybox cat
    hello
    ```
@y
    ```console
    $ echo hello | docker run --rm -i busybox cat
    hello
    ```
@z

@x
    The `-i` flag is most often used together with the `--tty` flag to bind the I/O
    streams of the container to a pseudo terminal, creating an interactive terminal
    session for the container. See [Allocate a pseudo-TTY](#tty) for more examples.
@y
    The `-i` flag is most often used together with the `--tty` flag to bind the I/O
    streams of the container to a pseudo terminal, creating an interactive terminal
    session for the container. See [Allocate a pseudo-TTY](#tty) for more examples.
@z

@x
    ```console
    $ docker run -it debian
    root@10a3e71492b0:/# factor 90
    90: 2 3 3 5
    root@10a3e71492b0:/# exit
    exit
    ```
@y
    ```console
    $ docker run -it debian
    root@10a3e71492b0:/# factor 90
    90: 2 3 3 5
    root@10a3e71492b0:/# exit
    exit
    ```
@z

@x
    Using the `-i` flag on its own allows for composition, such as piping input to
    containers:
@y
    Using the `-i` flag on its own allows for composition, such as piping input to
    containers:
@z

@x
    ```console
    $ docker run --rm -i busybox echo "foo bar baz" \
      | docker run --rm -i busybox awk '{ print $2 }' \
      | docker run --rm -i busybox rev
    rab
    ```
@y
    ```console
    $ docker run --rm -i busybox echo "foo bar baz" \
      | docker run --rm -i busybox awk '{ print $2 }' \
      | docker run --rm -i busybox rev
    rab
    ```
@z

@x
    ### Specify an init process {#init}
@y
    ### Specify an init process {#init}
@z

@x
    You can use the `--init` flag to indicate that an init process should be used as
    the PID 1 in the container. Specifying an init process ensures the usual
    responsibilities of an init system, such as reaping zombie processes, are
    performed inside the created container.
@y
    You can use the `--init` flag to indicate that an init process should be used as
    the PID 1 in the container. Specifying an init process ensures the usual
    responsibilities of an init system, such as reaping zombie processes, are
    performed inside the created container.
@z

@x
    The default init process used is the first `docker-init` executable found in the
    system path of the Docker daemon process. This `docker-init` binary, included in
    the default installation, is backed by [tini](https://github.com/krallin/tini).
@y
    The default init process used is the first `docker-init` executable found in the
    system path of the Docker daemon process. This `docker-init` binary, included in
    the default installation, is backed by [tini](https://github.com/krallin/tini).
@z

@x
    ### Allocate a pseudo-TTY (-t, --tty) {#tty}
@y
    ### Allocate a pseudo-TTY (-t, --tty) {#tty}
@z

@x
    The `--tty` (or `-t`) flag attaches a pseudo-TTY to the container, connecting
    your terminal to the I/O streams of the container. Allocating a pseudo-TTY to
    the container means that you get access to input and output feature that TTY
    devices provide.
@y
    The `--tty` (or `-t`) flag attaches a pseudo-TTY to the container, connecting
    your terminal to the I/O streams of the container. Allocating a pseudo-TTY to
    the container means that you get access to input and output feature that TTY
    devices provide.
@z

@x
    For example, the following command runs the `passwd` command in a `debian`
    container, to set a new password for the `root` user.
@y
    For example, the following command runs the `passwd` command in a `debian`
    container, to set a new password for the `root` user.
@z

@x
    ```console
    $ docker run -i debian passwd root
    New password: karjalanpiirakka9
    Retype new password: karjalanpiirakka9
    passwd: password updated successfully
    ```
@y
    ```console
    $ docker run -i debian passwd root
    New password: karjalanpiirakka9
    Retype new password: karjalanpiirakka9
    passwd: password updated successfully
    ```
@z

@x
    If you run this command with only the `-i` flag (which lets you send text to
    `STDIN` of the container), the `passwd` prompt displays the password in plain
    text. However, if you try the same thing but also adding the `-t` flag, the
    password is hidden:
@y
    If you run this command with only the `-i` flag (which lets you send text to
    `STDIN` of the container), the `passwd` prompt displays the password in plain
    text. However, if you try the same thing but also adding the `-t` flag, the
    password is hidden:
@z

@x
    ```console
    $ docker run -i debian passwd root
    New password:
    Retype new password:
    passwd: password updated successfully
    ```
@y
    ```console
    $ docker run -i debian passwd root
    New password:
    Retype new password:
    passwd: password updated successfully
    ```
@z

@x
    This is because `passwd` can suppress the output of characters to the terminal
    using the echo-off TTY feature.
@y
    This is because `passwd` can suppress the output of characters to the terminal
    using the echo-off TTY feature.
@z

@x
    You can use the `-t` flag without `-i` flag. This still allocates a pseudo-TTY
    to the container, but with no way of writing to `STDIN`. The only time this
    might be useful is if the output of the container requires a TTY environment.
@y
    You can use the `-t` flag without `-i` flag. This still allocates a pseudo-TTY
    to the container, but with no way of writing to `STDIN`. The only time this
    might be useful is if the output of the container requires a TTY environment.
@z

@x
    ### Specify custom cgroups {#cgroup-parent}
@y
    ### Specify custom cgroups {#cgroup-parent}
@z

@x
    Using the `--cgroup-parent` flag, you can pass a specific cgroup to run a
    container in. This allows you to create and manage cgroups on their own. You can
    define custom resources for those cgroups and put containers under a common
    parent group.
@y
    Using the `--cgroup-parent` flag, you can pass a specific cgroup to run a
    container in. This allows you to create and manage cgroups on their own. You can
    define custom resources for those cgroups and put containers under a common
    parent group.
@z

@x
    ### Using dynamically created devices (--device-cgroup-rule) {#device-cgroup-rule}
@y
    ### Using dynamically created devices (--device-cgroup-rule) {#device-cgroup-rule}
@z

@x
    Docker assigns devices available to a container at creation time. The
    assigned devices are added to the cgroup.allow file and
    created into the container when it runs. This poses a problem when
    you need to add a new device to running container.
@y
    Docker assigns devices available to a container at creation time. The
    assigned devices are added to the cgroup.allow file and
    created into the container when it runs. This poses a problem when
    you need to add a new device to running container.
@z

@x
    One solution is to add a more permissive rule to a container
    allowing it access to a wider range of devices. For example, supposing
    the container needs access to a character device with major `42` and
    any number of minor numbers (added as new devices appear), add the
    following rule:
@y
    One solution is to add a more permissive rule to a container
    allowing it access to a wider range of devices. For example, supposing
    the container needs access to a character device with major `42` and
    any number of minor numbers (added as new devices appear), add the
    following rule:
@z

@x
    ```console
    $ docker run -d --device-cgroup-rule='c 42:* rmw' --name my-container my-image
    ```
@y
    ```console
    $ docker run -d --device-cgroup-rule='c 42:* rmw' --name my-container my-image
    ```
@z

@x
    Then, a user could ask `udev` to execute a script that would `docker exec my-container mknod newDevX c 42 <minor>`
    the required device when it is added.
@y
    Then, a user could ask `udev` to execute a script that would `docker exec my-container mknod newDevX c 42 <minor>`
    the required device when it is added.
@z

@x
    > **Note**: You still need to explicitly add initially present devices to the
    > `docker run` / `docker create` command.
@y
    > **Note**: You still need to explicitly add initially present devices to the
    > `docker run` / `docker create` command.
@z

@x
    ### Access an NVIDIA GPU {#gpus}
@y
    ### Access an NVIDIA GPU {#gpus}
@z

@x
    The `--gpus` flag allows you to access NVIDIA GPU resources. First you need to
    install the [nvidia-container-runtime](https://nvidia.github.io/nvidia-container-runtime/).
@y
    The `--gpus` flag allows you to access NVIDIA GPU resources. First you need to
    install the [nvidia-container-runtime](https://nvidia.github.io/nvidia-container-runtime/).
@z

@x
    > **Note**
    >
    > You can also specify a GPU as a CDI device with the `--device` flag, see
    > [CDI devices](#cdi-devices).
@y
    > **Note**
    >
    > You can also specify a GPU as a CDI device with the `--device` flag, see
    > [CDI devices](#cdi-devices).
@z

@x
    Read [Specify a container's resources](/config/containers/resource_constraints/)
    for more information.
@y
    Read [Specify a container's resources](/config/containers/resource_constraints/)
    for more information.
@z

@x
    To use `--gpus`, specify which GPUs (or all) to use. If you provide no value, Docker uses all
    available GPUs. The example below exposes all available GPUs.
@y
    To use `--gpus`, specify which GPUs (or all) to use. If you provide no value, Docker uses all
    available GPUs. The example below exposes all available GPUs.
@z

@x
    ```console
    $ docker run -it --rm --gpus all ubuntu nvidia-smi
    ```
@y
    ```console
    $ docker run -it --rm --gpus all ubuntu nvidia-smi
    ```
@z

@x
    Use the `device` option to specify GPUs. The example below exposes a specific
    GPU.
@y
    Use the `device` option to specify GPUs. The example below exposes a specific
    GPU.
@z

@x
    ```console
    $ docker run -it --rm --gpus device=GPU-3a23c669-1f69-c64e-cf85-44e9b07e7a2a ubuntu nvidia-smi
    ```
@y
    ```console
    $ docker run -it --rm --gpus device=GPU-3a23c669-1f69-c64e-cf85-44e9b07e7a2a ubuntu nvidia-smi
    ```
@z

@x
    The example below exposes the first and third GPUs.
@y
    The example below exposes the first and third GPUs.
@z

@x
    ```console
    $ docker run -it --rm --gpus '"device=0,2"' ubuntu nvidia-smi
    ```
@y
    ```console
    $ docker run -it --rm --gpus '"device=0,2"' ubuntu nvidia-smi
    ```
@z

@x
    ### Restart policies (--restart) {#restart}
@y
    ### Restart policies (--restart) {#restart}
@z

@x
    Use the `--restart` flag to specify a container's *restart policy*. A restart
    policy controls whether the Docker daemon restarts a container after exit.
    Docker supports the following restart policies:
@y
    Use the `--restart` flag to specify a container's *restart policy*. A restart
    policy controls whether the Docker daemon restarts a container after exit.
    Docker supports the following restart policies:
@z

@x
    | Policy                     | Result                                                                                                                                                                                                                                                           |
    |:---------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
    | `no`                       | Do not automatically restart the container when it exits. This is the default.                                                                                                                                                                                   |
    | `on-failure[:max-retries]` | Restart only if the container exits with a non-zero exit status. Optionally, limit the number of restart retries the Docker daemon attempts.                                                                                                                     |
    | `unless-stopped`           | Restart the container unless it's explicitly stopped or Docker itself is stopped or restarted.                                                                                                                                                                  |
    | `always`                   | Always restart the container regardless of the exit status. When you specify always, the Docker daemon tries to restart the container indefinitely. The container always starts on daemon startup, regardless of the current state of the container. |
@y
    | Policy                     | Result                                                                                                                                                                                                                                                           |
    |:---------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
    | `no`                       | Do not automatically restart the container when it exits. This is the default.                                                                                                                                                                                   |
    | `on-failure[:max-retries]` | Restart only if the container exits with a non-zero exit status. Optionally, limit the number of restart retries the Docker daemon attempts.                                                                                                                     |
    | `unless-stopped`           | Restart the container unless it's explicitly stopped or Docker itself is stopped or restarted.                                                                                                                                                                  |
    | `always`                   | Always restart the container regardless of the exit status. When you specify always, the Docker daemon tries to restart the container indefinitely. The container always starts on daemon startup, regardless of the current state of the container. |
@z

@x
    ```console
    $ docker run --restart=always redis
    ```
@y
    ```console
    $ docker run --restart=always redis
    ```
@z

@x
    This runs the `redis` container with a restart policy of **always**.
    If the container exits, Docker restarts it.
@y
    This runs the `redis` container with a restart policy of **always**.
    If the container exits, Docker restarts it.
@z

@x
    When a restart policy is active on a container, it shows as either `Up` or
    `Restarting` in [`docker ps`](container_ls.md). It can also be useful to use
    [`docker events`](system_events.md) to see the restart policy in effect.
@y
    When a restart policy is active on a container, it shows as either `Up` or
    `Restarting` in [`docker ps`](container_ls.md). It can also be useful to use
    [`docker events`](system_events.md) to see the restart policy in effect.
@z

@x
    An increasing delay (double the previous delay, starting at 100 milliseconds)
    is added before each restart to prevent flooding the server. This means the
    daemon waits for 100 ms, then 200 ms, 400, 800, 1600, and so on until either
    the `on-failure` limit, the maximum delay of 1 minute is hit, or when you
    `docker stop` or `docker rm -f` the container.
@y
    An increasing delay (double the previous delay, starting at 100 milliseconds)
    is added before each restart to prevent flooding the server. This means the
    daemon waits for 100 ms, then 200 ms, 400, 800, 1600, and so on until either
    the `on-failure` limit, the maximum delay of 1 minute is hit, or when you
    `docker stop` or `docker rm -f` the container.
@z

@x
    If a container is successfully restarted (the container is started and runs
    for at least 10 seconds), the delay is reset to its default value of 100 ms.
@y
    If a container is successfully restarted (the container is started and runs
    for at least 10 seconds), the delay is reset to its default value of 100 ms.
@z

@x
    #### Specify a limit for restart attempts
@y
    #### Specify a limit for restart attempts
@z

@x
    You can specify the maximum amount of times Docker attempts to restart the
    container when using the **on-failure** policy. By default, Docker never stops
    attempting to restart the container.
@y
    You can specify the maximum amount of times Docker attempts to restart the
    container when using the **on-failure** policy. By default, Docker never stops
    attempting to restart the container.
@z

@x
    The following example runs the `redis` container with a restart policy of
    **on-failure** and a maximum restart count of 10.
@y
    The following example runs the `redis` container with a restart policy of
    **on-failure** and a maximum restart count of 10.
@z

@x
    ```console
    $ docker run --restart=on-failure:10 redis
    ```
@y
    ```console
    $ docker run --restart=on-failure:10 redis
    ```
@z

@x
    If the `redis` container exits with a non-zero exit status more than 10 times
    in a row, Docker stops trying to restart the container. Providing a maximum
    restart limit is only valid for the **on-failure** policy.
@y
    If the `redis` container exits with a non-zero exit status more than 10 times
    in a row, Docker stops trying to restart the container. Providing a maximum
    restart limit is only valid for the **on-failure** policy.
@z

@x
    #### Inspect container restarts
@y
    #### Inspect container restarts
@z

@x
    The number of (attempted) restarts for a container can be obtained using the
    [`docker inspect`](inspect.md) command. For example, to get the number of
    restarts for container "my-container";
@y
    The number of (attempted) restarts for a container can be obtained using the
    [`docker inspect`](inspect.md) command. For example, to get the number of
    restarts for container "my-container";
@z

@x
    ```console
    $ docker inspect -f "{{ .RestartCount }}" my-container
    2
    ```
@y
    ```console
    $ docker inspect -f "{{ .RestartCount }}" my-container
    2
    ```
@z

@x
    Or, to get the last time the container was (re)started;
@y
    Or, to get the last time the container was (re)started;
@z

@x
    ```console
    $ docker inspect -f "{{ .State.StartedAt }}" my-container
    2015-03-04T23:47:07.691840179Z
    ```
@y
    ```console
    $ docker inspect -f "{{ .State.StartedAt }}" my-container
    2015-03-04T23:47:07.691840179Z
    ```
@z

@x
    Combining `--restart` (restart policy) with the `--rm` (clean up) flag results
    in an error. On container restart, attached clients are disconnected.
@y
    Combining `--restart` (restart policy) with the `--rm` (clean up) flag results
    in an error. On container restart, attached clients are disconnected.
@z

@x
    ### Clean up (--rm) {#rm}
@y
    ### Clean up (--rm) {#rm}
@z

@x
    By default, a container's file system persists even after the container exits.
    This makes debugging a lot easier, since you can inspect the container's final
    state and you retain all your data.
@y
    By default, a container's file system persists even after the container exits.
    This makes debugging a lot easier, since you can inspect the container's final
    state and you retain all your data.
@z

@x
    If you are running short-term **foreground** processes, these container file
    systems can start to pile up. If you'd like Docker to automatically clean up
    the container and remove the file system when the container exits, use the
    `--rm` flag:
@y
    If you are running short-term **foreground** processes, these container file
    systems can start to pile up. If you'd like Docker to automatically clean up
    the container and remove the file system when the container exits, use the
    `--rm` flag:
@z

@x
    ```text
    --rm=false: Automatically remove the container when it exits
    ```
@y
    ```text
    --rm=false: Automatically remove the container when it exits
    ```
@z

@x
    > **Note**
    >
    > If you set the `--rm` flag, Docker also removes the anonymous volumes
    > associated with the container when the container is removed. This is similar
    > to running `docker rm -v my-container`. Only volumes that are specified
    > without a name are removed. For example, when running the following command,
    > volume `/foo` is removed, but not `/bar`:
    >
    > ```console
    > $ docker run --rm -v /foo -v awesome:/bar busybox top
    > ```
    >
    > Volumes inherited via `--volumes-from` are removed with the same logic:
    > if the original volume was specified with a name it isn't removed.
@y
    > **Note**
    >
    > If you set the `--rm` flag, Docker also removes the anonymous volumes
    > associated with the container when the container is removed. This is similar
    > to running `docker rm -v my-container`. Only volumes that are specified
    > without a name are removed. For example, when running the following command,
    > volume `/foo` is removed, but not `/bar`:
    >
    > ```console
    > $ docker run --rm -v /foo -v awesome:/bar busybox top
    > ```
    >
    > Volumes inherited via `--volumes-from` are removed with the same logic:
    > if the original volume was specified with a name it isn't removed.
@z

@x
    ### Add entries to container hosts file (--add-host) {#add-host}
@y
    ### Add entries to container hosts file (--add-host) {#add-host}
@z

@x
    You can add other hosts into a container's `/etc/hosts` file by using one or
    more `--add-host` flags. This example adds a static address for a host named
    `my-hostname`:
@y
    You can add other hosts into a container's `/etc/hosts` file by using one or
    more `--add-host` flags. This example adds a static address for a host named
    `my-hostname`:
@z

@x
    ```console
    $ docker run --add-host=my-hostname=8.8.8.8 --rm -it alpine
@y
    ```console
    $ docker run --add-host=my-hostname=8.8.8.8 --rm -it alpine
@z

@x
    / # ping my-hostname
    PING my-hostname (8.8.8.8): 56 data bytes
    64 bytes from 8.8.8.8: seq=0 ttl=37 time=93.052 ms
    64 bytes from 8.8.8.8: seq=1 ttl=37 time=92.467 ms
    64 bytes from 8.8.8.8: seq=2 ttl=37 time=92.252 ms
    ^C
    --- my-hostname ping statistics ---
    4 packets transmitted, 4 packets received, 0% packet loss
    round-trip min/avg/max = 92.209/92.495/93.052 ms
    ```
@y
    / # ping my-hostname
    PING my-hostname (8.8.8.8): 56 data bytes
    64 bytes from 8.8.8.8: seq=0 ttl=37 time=93.052 ms
    64 bytes from 8.8.8.8: seq=1 ttl=37 time=92.467 ms
    64 bytes from 8.8.8.8: seq=2 ttl=37 time=92.252 ms
    ^C
    --- my-hostname ping statistics ---
    4 packets transmitted, 4 packets received, 0% packet loss
    round-trip min/avg/max = 92.209/92.495/93.052 ms
    ```
@z

@x
    You can wrap an IPv6 address in square brackets:
@y
    You can wrap an IPv6 address in square brackets:
@z

@x
    ```console
    $ docker run --add-host my-hostname=[2001:db8::33] --rm -it alpine
    ```
@y
    ```console
    $ docker run --add-host my-hostname=[2001:db8::33] --rm -it alpine
    ```
@z

@x
    The `--add-host` flag supports a special `host-gateway` value that resolves to
    the internal IP address of the host. This is useful when you want containers to
    connect to services running on the host machine.
@y
    The `--add-host` flag supports a special `host-gateway` value that resolves to
    the internal IP address of the host. This is useful when you want containers to
    connect to services running on the host machine.
@z

@x
    It's conventional to use `host.docker.internal` as the hostname referring to
    `host-gateway`. Docker Desktop automatically resolves this hostname, see
    [Explore networking features](/desktop/networking/#i-want-to-connect-from-a-container-to-a-service-on-the-host).
@y
    It's conventional to use `host.docker.internal` as the hostname referring to
    `host-gateway`. Docker Desktop automatically resolves this hostname, see
    [Explore networking features](/desktop/networking/#i-want-to-connect-from-a-container-to-a-service-on-the-host).
@z

@x
    The following example shows how the special `host-gateway` value works. The
    example runs an HTTP server that serves a file from host to container over the
    `host.docker.internal` hostname, which resolves to the host's internal IP.
@y
    The following example shows how the special `host-gateway` value works. The
    example runs an HTTP server that serves a file from host to container over the
    `host.docker.internal` hostname, which resolves to the host's internal IP.
@z

@x
    ```console
    $ echo "hello from host!" > ./hello
    $ python3 -m http.server 8000
    Serving HTTP on 0.0.0.0 port 8000 (http://0.0.0.0:8000/) ...
    $ docker run \
      --add-host host.docker.internal=host-gateway \
      curlimages/curl -s host.docker.internal:8000/hello
    hello from host!
    ```
@y
    ```console
    $ echo "hello from host!" > ./hello
    $ python3 -m http.server 8000
    Serving HTTP on 0.0.0.0 port 8000 (http://0.0.0.0:8000/) ...
    $ docker run \
      --add-host host.docker.internal=host-gateway \
      curlimages/curl -s host.docker.internal:8000/hello
    hello from host!
    ```
@z

@x
    The `--add-host` flag also accepts a `:` separator, for example:
@y
    The `--add-host` flag also accepts a `:` separator, for example:
@z

@x
    ```console
    $ docker run --add-host=my-hostname:8.8.8.8 --rm -it alpine
    ```
@y
    ```console
    $ docker run --add-host=my-hostname:8.8.8.8 --rm -it alpine
    ```
@z

@x
    ### Logging drivers (--log-driver) {#log-driver}
@y
    ### Logging drivers (--log-driver) {#log-driver}
@z

@x
    The container can have a different logging driver than the Docker daemon. Use
    the `--log-driver=<DRIVER>` with the `docker run` command to configure the
    container's logging driver.
@y
    The container can have a different logging driver than the Docker daemon. Use
    the `--log-driver=<DRIVER>` with the `docker run` command to configure the
    container's logging driver.
@z

@x
    To learn about the supported logging drivers and how to use them, refer to
    [Configure logging drivers](/config/containers/logging/configure/).
@y
    To learn about the supported logging drivers and how to use them, refer to
    [Configure logging drivers](/config/containers/logging/configure/).
@z

@x
    To disable logging for a container, set the `--log-driver` flag to `none`:
@y
    To disable logging for a container, set the `--log-driver` flag to `none`:
@z

@x
    ```console
    $ docker run --log-driver=none -d nginx:alpine
    5101d3b7fe931c27c2ba0e65fd989654d297393ad65ae238f20b97a020e7295b
    $ docker logs 5101d3b
    Error response from daemon: configured logging driver does not support reading
    ```
@y
    ```console
    $ docker run --log-driver=none -d nginx:alpine
    5101d3b7fe931c27c2ba0e65fd989654d297393ad65ae238f20b97a020e7295b
    $ docker logs 5101d3b
    Error response from daemon: configured logging driver does not support reading
    ```
@z

@x
    ### Set ulimits in container (--ulimit) {#ulimit}
@y
    ### Set ulimits in container (--ulimit) {#ulimit}
@z

@x
    Since setting `ulimit` settings in a container requires extra privileges not
    available in the default container, you can set these using the `--ulimit` flag.
    Specify `--ulimit` with a soft and hard limit in the format
    `<type>=<soft limit>[:<hard limit>]`. For example:
@y
    Since setting `ulimit` settings in a container requires extra privileges not
    available in the default container, you can set these using the `--ulimit` flag.
    Specify `--ulimit` with a soft and hard limit in the format
    `<type>=<soft limit>[:<hard limit>]`. For example:
@z

@x
    ```console
    $ docker run --ulimit nofile=1024:1024 --rm debian sh -c "ulimit -n"
    1024
    ```
@y
    ```console
    $ docker run --ulimit nofile=1024:1024 --rm debian sh -c "ulimit -n"
    1024
    ```
@z

@x
    > **Note**
    >
    > If you don't provide a hard limit value, Docker uses the soft limit value
    > for both values. If you don't provide any values, they are inherited from
    > the default `ulimits` set on the daemon.
@y
    > **Note**
    >
    > If you don't provide a hard limit value, Docker uses the soft limit value
    > for both values. If you don't provide any values, they are inherited from
    > the default `ulimits` set on the daemon.
@z

@x
    > **Note**
    >
    > The `as` option is deprecated.
    > In other words, the following script is not supported:
    >
    > ```console
    > $ docker run -it --ulimit as=1024 fedora /bin/bash
    > ```
@y
    > **Note**
    >
    > The `as` option is deprecated.
    > In other words, the following script is not supported:
    >
    > ```console
    > $ docker run -it --ulimit as=1024 fedora /bin/bash
    > ```
@z

@x
    Docker sends the values to the appropriate OS `syscall` and doesn't perform any byte conversion.
    Take this into account when setting the values.
@y
    Docker sends the values to the appropriate OS `syscall` and doesn't perform any byte conversion.
    Take this into account when setting the values.
@z

@x
    #### For `nproc` usage
@y
    #### For `nproc` usage
@z

@x
    Be careful setting `nproc` with the `ulimit` flag as Linux uses `nproc` to set the
    maximum number of processes available to a user, not to a container. For example, start four
    containers with `daemon` user:
@y
    Be careful setting `nproc` with the `ulimit` flag as Linux uses `nproc` to set the
    maximum number of processes available to a user, not to a container. For example, start four
    containers with `daemon` user:
@z

@x
    ```console
    $ docker run -d -u daemon --ulimit nproc=3 busybox top
@y
    ```console
    $ docker run -d -u daemon --ulimit nproc=3 busybox top
@z

@x
    $ docker run -d -u daemon --ulimit nproc=3 busybox top
@y
    $ docker run -d -u daemon --ulimit nproc=3 busybox top
@z

@x
    $ docker run -d -u daemon --ulimit nproc=3 busybox top
@y
    $ docker run -d -u daemon --ulimit nproc=3 busybox top
@z

@x
    $ docker run -d -u daemon --ulimit nproc=3 busybox top
    ```
@y
    $ docker run -d -u daemon --ulimit nproc=3 busybox top
    ```
@z

@x
    The 4th container fails and reports a "[8] System error: resource temporarily unavailable" error.
    This fails because the caller set `nproc=3` resulting in the first three containers using up
    the three processes quota set for the `daemon` user.
@y
    The 4th container fails and reports a "[8] System error: resource temporarily unavailable" error.
    This fails because the caller set `nproc=3` resulting in the first three containers using up
    the three processes quota set for the `daemon` user.
@z

@x
    ### Stop container with signal (--stop-signal) {#stop-signal}
@y
    ### Stop container with signal (--stop-signal) {#stop-signal}
@z

@x
    The `--stop-signal` flag sends the system call signal to the
    container to exit. This signal can be a signal name in the format `SIG<NAME>`,
    for instance `SIGKILL`, or an unsigned number that matches a position in the
    kernel's syscall table, for instance `9`.
@y
    The `--stop-signal` flag sends the system call signal to the
    container to exit. This signal can be a signal name in the format `SIG<NAME>`,
    for instance `SIGKILL`, or an unsigned number that matches a position in the
    kernel's syscall table, for instance `9`.
@z

@x
    The default value is defined by [`STOPSIGNAL`](/engine/reference/builder/#stopsignal)
    in the image, or `SIGTERM` if the image has no `STOPSIGNAL` defined.
@y
    The default value is defined by [`STOPSIGNAL`](/engine/reference/builder/#stopsignal)
    in the image, or `SIGTERM` if the image has no `STOPSIGNAL` defined.
@z

@x
    ### Optional security options (--security-opt) {#security-opt}
@y
    ### Optional security options (--security-opt) {#security-opt}
@z

@x
    | Option                                    | Description                                                                                                                                                                                                      |
    |:------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
    | `--security-opt="label=user:USER"`        | Set the label user for the container                                                                                                                                                                             |
    | `--security-opt="label=role:ROLE"`        | Set the label role for the container                                                                                                                                                                             |
    | `--security-opt="label=type:TYPE"`        | Set the label type for the container                                                                                                                                                                             |
    | `--security-opt="label=level:LEVEL"`      | Set the label level for the container                                                                                                                                                                            |
    | `--security-opt="label=disable"`          | Turn off label confinement for the container                                                                                                                                                                     |
    | `--security-opt="apparmor=PROFILE"`       | Set the apparmor profile to be applied to the container                                                                                                                                                          |
    | `--security-opt="no-new-privileges=true"` | Disable container processes from gaining new privileges                                                                                                                                                          |
    | `--security-opt="seccomp=unconfined"`     | Turn off seccomp confinement for the container                                                                                                                                                                   |
    | `--security-opt="seccomp=builtin"`        | Use the default (built-in) seccomp profile for the container. This can be used to enable seccomp for a container running on a daemon with a custom default profile set, or with seccomp disabled ("unconfined"). |
    | `--security-opt="seccomp=profile.json"`   | White-listed syscalls seccomp Json file to be used as a seccomp filter                                                                                                                                           |
@y
    | Option                                    | Description                                                                                                                                                                                                      |
    |:------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
    | `--security-opt="label=user:USER"`        | Set the label user for the container                                                                                                                                                                             |
    | `--security-opt="label=role:ROLE"`        | Set the label role for the container                                                                                                                                                                             |
    | `--security-opt="label=type:TYPE"`        | Set the label type for the container                                                                                                                                                                             |
    | `--security-opt="label=level:LEVEL"`      | Set the label level for the container                                                                                                                                                                            |
    | `--security-opt="label=disable"`          | Turn off label confinement for the container                                                                                                                                                                     |
    | `--security-opt="apparmor=PROFILE"`       | Set the apparmor profile to be applied to the container                                                                                                                                                          |
    | `--security-opt="no-new-privileges=true"` | Disable container processes from gaining new privileges                                                                                                                                                          |
    | `--security-opt="seccomp=unconfined"`     | Turn off seccomp confinement for the container                                                                                                                                                                   |
    | `--security-opt="seccomp=builtin"`        | Use the default (built-in) seccomp profile for the container. This can be used to enable seccomp for a container running on a daemon with a custom default profile set, or with seccomp disabled ("unconfined"). |
    | `--security-opt="seccomp=profile.json"`   | White-listed syscalls seccomp Json file to be used as a seccomp filter                                                                                                                                           |
@z

@x
    The `--security-opt` flag lets you override the default labeling scheme for a
    container. Specifying the level in the following command allows you to share
    the same content between containers.
@y
    The `--security-opt` flag lets you override the default labeling scheme for a
    container. Specifying the level in the following command allows you to share
    the same content between containers.
@z

@x
    ```console
    $ docker run --security-opt label=level:s0:c100,c200 -it fedora bash
    ```
@y
    ```console
    $ docker run --security-opt label=level:s0:c100,c200 -it fedora bash
    ```
@z

@x
    > **Note**
    >
    > Automatic translation of MLS labels isn't supported.
@y
    > **Note**
    >
    > Automatic translation of MLS labels isn't supported.
@z

@x
    To disable the security labeling for a container entirely, you can use
    `label=disable`:
@y
    To disable the security labeling for a container entirely, you can use
    `label=disable`:
@z

@x
    ```console
    $ docker run --security-opt label=disable -it ubuntu bash
    ```
@y
    ```console
    $ docker run --security-opt label=disable -it ubuntu bash
    ```
@z

@x
    If you want a tighter security policy on the processes within a container, you
    can specify a custom `type` label. The following example runs a container
    that's only allowed to listen on Apache ports:
@y
    If you want a tighter security policy on the processes within a container, you
    can specify a custom `type` label. The following example runs a container
    that's only allowed to listen on Apache ports:
@z

@x
    ```console
    $ docker run --security-opt label=type:svirt_apache_t -it ubuntu bash
    ```
@y
    ```console
    $ docker run --security-opt label=type:svirt_apache_t -it ubuntu bash
    ```
@z

@x
    > **Note**
    >
    > You would have to write policy defining a `svirt_apache_t` type.
@y
    > **Note**
    >
    > You would have to write policy defining a `svirt_apache_t` type.
@z

@x
    To prevent your container processes from gaining additional privileges, you can
    use the following command:
@y
    To prevent your container processes from gaining additional privileges, you can
    use the following command:
@z

@x
    ```console
    $ docker run --security-opt no-new-privileges -it ubuntu bash
    ```
@y
    ```console
    $ docker run --security-opt no-new-privileges -it ubuntu bash
    ```
@z

@x
    This means that commands that raise privileges such as `su` or `sudo` no longer work.
    It also causes any seccomp filters to be applied later, after privileges have been dropped
    which may mean you can have a more restrictive set of filters.
    For more details, see the [kernel documentation](https://www.kernel.org/doc/Documentation/prctl/no_new_privs.txt).
@y
    This means that commands that raise privileges such as `su` or `sudo` no longer work.
    It also causes any seccomp filters to be applied later, after privileges have been dropped
    which may mean you can have a more restrictive set of filters.
    For more details, see the [kernel documentation](https://www.kernel.org/doc/Documentation/prctl/no_new_privs.txt).
@z

@x
    On Windows, you can use the `--security-opt` flag to specify the `credentialspec` option.
    The `credentialspec` must be in the format `file://spec.txt` or `registry://keyname`.
@y
    On Windows, you can use the `--security-opt` flag to specify the `credentialspec` option.
    The `credentialspec` must be in the format `file://spec.txt` or `registry://keyname`.
@z

@x
    ### Stop container with timeout (--stop-timeout) {#stop-timeout}
@y
    ### Stop container with timeout (--stop-timeout) {#stop-timeout}
@z

@x
    The `--stop-timeout` flag sets the number of seconds to wait for the container
    to stop after sending the pre-defined (see `--stop-signal`) system call signal.
    If the container does not exit after the timeout elapses, it's forcibly killed
    with a `SIGKILL` signal.
@y
    The `--stop-timeout` flag sets the number of seconds to wait for the container
    to stop after sending the pre-defined (see `--stop-signal`) system call signal.
    If the container does not exit after the timeout elapses, it's forcibly killed
    with a `SIGKILL` signal.
@z

@x
    If you set `--stop-timeout` to `-1`, no timeout is applied, and the daemon
    waits indefinitely for the container to exit.
@y
    If you set `--stop-timeout` to `-1`, no timeout is applied, and the daemon
    waits indefinitely for the container to exit.
@z

@x
    The Daemon determines the default, and is 10 seconds for Linux containers,
    and 30 seconds for Windows containers.
@y
    The Daemon determines the default, and is 10 seconds for Linux containers,
    and 30 seconds for Windows containers.
@z

@x
    ### Specify isolation technology for container (--isolation) {#isolation}
@y
    ### Specify isolation technology for container (--isolation) {#isolation}
@z

@x
    This option is useful in situations where you are running Docker containers on
    Windows. The `--isolation=<value>` option sets a container's isolation technology.
    On Linux, the only supported is the `default` option which uses Linux namespaces.
    These two commands are equivalent on Linux:
@y
    This option is useful in situations where you are running Docker containers on
    Windows. The `--isolation=<value>` option sets a container's isolation technology.
    On Linux, the only supported is the `default` option which uses Linux namespaces.
    These two commands are equivalent on Linux:
@z

@x
    ```console
    $ docker run -d busybox top
    $ docker run -d --isolation default busybox top
    ```
@y
    ```console
    $ docker run -d busybox top
    $ docker run -d --isolation default busybox top
    ```
@z

@x
    On Windows, `--isolation` can take one of these values:
@y
    On Windows, `--isolation` can take one of these values:
@z

@x
    | Value     | Description                                                                                |
    |:----------|:-------------------------------------------------------------------------------------------|
    | `default` | Use the value specified by the Docker daemon's `--exec-opt` or system default (see below). |
    | `process` | Shared-kernel namespace isolation.                                                         |
    | `hyperv`  | Hyper-V hypervisor partition-based isolation.                                              |
@y
    | Value     | Description                                                                                |
    |:----------|:-------------------------------------------------------------------------------------------|
    | `default` | Use the value specified by the Docker daemon's `--exec-opt` or system default (see below). |
    | `process` | Shared-kernel namespace isolation.                                                         |
    | `hyperv`  | Hyper-V hypervisor partition-based isolation.                                              |
@z

@x
    The default isolation on Windows server operating systems is `process`, and `hyperv`
    on Windows client operating systems, such as Windows 10. Process isolation has better
    performance, but requires that the image and host use the same kernel version.
@y
    The default isolation on Windows server operating systems is `process`, and `hyperv`
    on Windows client operating systems, such as Windows 10. Process isolation has better
    performance, but requires that the image and host use the same kernel version.
@z

@x
    On Windows server, assuming the default configuration, these commands are equivalent
    and result in `process` isolation:
@y
    On Windows server, assuming the default configuration, these commands are equivalent
    and result in `process` isolation:
@z

@x
    ```powershell
    PS C:\> docker run -d microsoft/nanoserver powershell echo process
    PS C:\> docker run -d --isolation default microsoft/nanoserver powershell echo process
    PS C:\> docker run -d --isolation process microsoft/nanoserver powershell echo process
    ```
@y
    ```powershell
    PS C:\> docker run -d microsoft/nanoserver powershell echo process
    PS C:\> docker run -d --isolation default microsoft/nanoserver powershell echo process
    PS C:\> docker run -d --isolation process microsoft/nanoserver powershell echo process
    ```
@z

@x
    If you have set the `--exec-opt isolation=hyperv` option on the Docker `daemon`, or
    are running against a Windows client-based daemon, these commands are equivalent and
    result in `hyperv` isolation:
@y
    If you have set the `--exec-opt isolation=hyperv` option on the Docker `daemon`, or
    are running against a Windows client-based daemon, these commands are equivalent and
    result in `hyperv` isolation:
@z

@x
    ```powershell
    PS C:\> docker run -d microsoft/nanoserver powershell echo hyperv
    PS C:\> docker run -d --isolation default microsoft/nanoserver powershell echo hyperv
    PS C:\> docker run -d --isolation hyperv microsoft/nanoserver powershell echo hyperv
    ```
@y
    ```powershell
    PS C:\> docker run -d microsoft/nanoserver powershell echo hyperv
    PS C:\> docker run -d --isolation default microsoft/nanoserver powershell echo hyperv
    PS C:\> docker run -d --isolation hyperv microsoft/nanoserver powershell echo hyperv
    ```
@z

@x
    ### Specify hard limits on memory available to containers (-m, --memory) {#memory}
@y
    ### Specify hard limits on memory available to containers (-m, --memory) {#memory}
@z

@x
    These parameters always set an upper limit on the memory available to the container. Linux sets this
    on the cgroup and applications in a container can query it at `/sys/fs/cgroup/memory/memory.limit_in_bytes`.
@y
    These parameters always set an upper limit on the memory available to the container. Linux sets this
    on the cgroup and applications in a container can query it at `/sys/fs/cgroup/memory/memory.limit_in_bytes`.
@z

@x
    On Windows, this affects containers differently depending on what type of isolation you use.
@y
    On Windows, this affects containers differently depending on what type of isolation you use.
@z

@x
    - With `process` isolation, Windows reports the full memory of the host system, not the limit to applications running inside the container
@y
    - With `process` isolation, Windows reports the full memory of the host system, not the limit to applications running inside the container
@z

@x
        ```powershell
        PS C:\> docker run -it -m 2GB --isolation=process microsoft/nanoserver powershell Get-ComputerInfo *memory*
@y
        ```powershell
        PS C:\> docker run -it -m 2GB --isolation=process microsoft/nanoserver powershell Get-ComputerInfo *memory*
@z

@x
        CsTotalPhysicalMemory      : 17064509440
        CsPhyicallyInstalledMemory : 16777216
        OsTotalVisibleMemorySize   : 16664560
        OsFreePhysicalMemory       : 14646720
        OsTotalVirtualMemorySize   : 19154928
        OsFreeVirtualMemory        : 17197440
        OsInUseVirtualMemory       : 1957488
        OsMaxProcessMemorySize     : 137438953344
        ```
@y
        CsTotalPhysicalMemory      : 17064509440
        CsPhyicallyInstalledMemory : 16777216
        OsTotalVisibleMemorySize   : 16664560
        OsFreePhysicalMemory       : 14646720
        OsTotalVirtualMemorySize   : 19154928
        OsFreeVirtualMemory        : 17197440
        OsInUseVirtualMemory       : 1957488
        OsMaxProcessMemorySize     : 137438953344
        ```
@z

@x
    - With `hyperv` isolation, Windows creates a utility VM that is big enough to hold the memory limit, plus the minimal OS needed to host the container. That size is reported as "Total Physical Memory."
@y
    - With `hyperv` isolation, Windows creates a utility VM that is big enough to hold the memory limit, plus the minimal OS needed to host the container. That size is reported as "Total Physical Memory."
@z

@x
        ```powershell
        PS C:\> docker run -it -m 2GB --isolation=hyperv microsoft/nanoserver powershell Get-ComputerInfo *memory*
@y
        ```powershell
        PS C:\> docker run -it -m 2GB --isolation=hyperv microsoft/nanoserver powershell Get-ComputerInfo *memory*
@z

@x
        CsTotalPhysicalMemory      : 2683355136
        CsPhyicallyInstalledMemory :
        OsTotalVisibleMemorySize   : 2620464
        OsFreePhysicalMemory       : 2306552
        OsTotalVirtualMemorySize   : 2620464
        OsFreeVirtualMemory        : 2356692
        OsInUseVirtualMemory       : 263772
        OsMaxProcessMemorySize     : 137438953344
        ```
@y
        CsTotalPhysicalMemory      : 2683355136
        CsPhyicallyInstalledMemory :
        OsTotalVisibleMemorySize   : 2620464
        OsFreePhysicalMemory       : 2306552
        OsTotalVirtualMemorySize   : 2620464
        OsFreeVirtualMemory        : 2356692
        OsInUseVirtualMemory       : 263772
        OsMaxProcessMemorySize     : 137438953344
        ```
@z

@x
    ### Configure namespaced kernel parameters (sysctls) at runtime (--sysctl) {#sysctl}
@y
    ### Configure namespaced kernel parameters (sysctls) at runtime (--sysctl) {#sysctl}
@z

@x
    The `--sysctl` sets namespaced kernel parameters (sysctls) in the
    container. For example, to turn on IP forwarding in the containers
    network namespace, run this command:
@y
    The `--sysctl` sets namespaced kernel parameters (sysctls) in the
    container. For example, to turn on IP forwarding in the containers
    network namespace, run this command:
@z

@x
    ```console
    $ docker run --sysctl net.ipv4.ip_forward=1 someimage
    ```
@y
    ```console
    $ docker run --sysctl net.ipv4.ip_forward=1 someimage
    ```
@z

@x
    > **Note**
    >
    > Not all sysctls are namespaced. Docker does not support changing sysctls
    > inside of a container that also modify the host system. As the kernel
    > evolves we expect to see more sysctls become namespaced.
@y
    > **Note**
    >
    > Not all sysctls are namespaced. Docker does not support changing sysctls
    > inside of a container that also modify the host system. As the kernel
    > evolves we expect to see more sysctls become namespaced.
@z

@x
    #### Currently supported sysctls
@y
    #### Currently supported sysctls
@z

@x
    IPC Namespace:
@y
    IPC Namespace:
@z

@x
    - `kernel.msgmax`, `kernel.msgmnb`, `kernel.msgmni`, `kernel.sem`,
      `kernel.shmall`, `kernel.shmmax`, `kernel.shmmni`, `kernel.shm_rmid_forced`.
    - Sysctls beginning with `fs.mqueue.*`
    - If you use the `--ipc=host` option these sysctls are not allowed.
@y
    - `kernel.msgmax`, `kernel.msgmnb`, `kernel.msgmni`, `kernel.sem`,
      `kernel.shmall`, `kernel.shmmax`, `kernel.shmmni`, `kernel.shm_rmid_forced`.
    - Sysctls beginning with `fs.mqueue.*`
    - If you use the `--ipc=host` option these sysctls are not allowed.
@z

@x
    Network Namespace:
@y
    Network Namespace:
@z

@x
    - Sysctls beginning with `net.*`
    - If you use the `--network=host` option using these sysctls are not allowed.
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    - Sysctls beginning with `net.*`
    - If you use the `--network=host` option using these sysctls are not allowed.
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
