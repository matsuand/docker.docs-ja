%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

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
@y
    You can restart a stopped container with all its previous changes intact using `docker start`.
    Use `docker ps -a` to view a list of all containers, including those that are stopped.
@z

@x
usage: docker container run [OPTIONS] IMAGE [COMMAND] [ARG...]
@y
usage: docker container run [OPTIONS] IMAGE [COMMAND] [ARG...]
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
      description: Automatically remove the container when it exits
@y
      description: Automatically remove the container when it exits
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
    ### Assign name (--name) {#name}
@y
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

% snip command...

@x
    You can reference the container by name with other commands. For example, the
    following commands stop and remove a container named `test`:
@y
    You can reference the container by name with other commands. For example, the
    following commands stop and remove a container named `test`:
@z

% snip command...

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

% snip command...

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

% snip command...

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

% snip command...

@x
    2. Install `htop` in the container:
@y
    2. Install `htop` in the container:
@z

% snip command...

@x
    3. Invoke the `htop` command.
@y
    3. Invoke the `htop` command.
@z

% snip command...

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

% snip command...

@x
    2. Run an Alpine container that attaches the `--pid` namespace to the
       `my-nginx` container:
@y
    2. Run an Alpine container that attaches the `--pid` namespace to the
       `my-nginx` container:
@z

% snip command...

@x
    3. Install `strace` in the Alpine container:
@y
    3. Install `strace` in the Alpine container:
@z

% snip command...

@x
    4. Attach to process 1, the process ID of the `my-nginx` container:
@y
    4. Attach to process 1, the process ID of the `my-nginx` container:
@z

% snip command...

@x
    ### Disable namespace remapping for a container (--userns) {#userns}
@y
    ### Disable namespace remapping for a container (--userns) {#userns}
@z

@x
    If you enable user namespaces on the daemon,
    all containers are started with user namespaces enabled by default.
    To disable user namespace remapping for a specific container,
    you can set the `--userns` flag to `host`.
@y
    If you enable user namespaces on the daemon,
    all containers are started with user namespaces enabled by default.
    To disable user namespace remapping for a specific container,
    you can set the `--userns` flag to `host`.
@z

% snip command...

@x
    `host` is the only valid value for the `--userns` flag.
@y
    `host` is the only valid value for the `--userns` flag.
@z

@x
    For more information, refer to [Isolate containers with a user namespace](/engine/security/userns-remap/).
@y
    For more information, refer to [Isolate containers with a user namespace](__SUBDIR__/engine/security/userns-remap/).
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
    ### Escalate container privileges (--privileged) {#privileged}
@y
    ### Escalate container privileges (--privileged) {#privileged}
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

% snip command...

@x
    It works when you add the `--privileged` flag:
@y
    It works when you add the `--privileged` flag:
@z

% snip command...

@x
    ### Set working directory (-w, --workdir) {#workdir}
@y
    ### Set working directory (-w, --workdir) {#workdir}
@z

% snip command...

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

% snip command...

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

% snip command...

@x
    For more information, see [tmpfs mounts](/storage/tmpfs/).
@y
    For more information, see [tmpfs mounts](__SUBDIR__/storage/tmpfs/).
@z

@x
    ### Mount volume (-v) {#volume}
@y
    ### Mount volume (-v) {#volume}
@z

% snip command...

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

% snip command...

@x
    The example above mounts the `content` directory in the current directory into the container at the
    `/content` path using the `-v` flag, sets it as the working directory, and then
    runs the `pwd` command inside the container.
@y
    The example above mounts the `content` directory in the current directory into the container at the
    `/content` path using the `-v` flag, sets it as the working directory, and then
    runs the `pwd` command inside the container.
@z

% snip command...

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

% snip command...

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

% snip command...

@x
    By bind-mounting the Docker Unix socket and statically linked Docker
    binary (refer to [get the Linux binary](/engine/install/binaries/#install-static-binaries)),
    you give the container the full access to create and manipulate the host's
    Docker daemon.
@y
    By bind-mounting the Docker Unix socket and statically linked Docker
    binary (refer to [get the Linux binary](__SUBDIR__/engine/install/binaries/#install-static-binaries)),
    you give the container the full access to create and manipulate the host's
    Docker daemon.
@z

@x
    On Windows, you must specify the paths using Windows-style path semantics.
@y
    On Windows, you must specify the paths using Windows-style path semantics.
@z

% snip command...

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

% snip command...

@x
    For in-depth information about volumes, refer to [manage data in containers](/storage/volumes/)
@y
    For in-depth information about volumes, refer to [manage data in containers](__SUBDIR__/storage/volumes/)
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
    [Bind mounts](__SUBDIR__/storage/bind-mounts/).
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

% snip command...

@x
    ### Publish or expose port (-p, --expose) {#publish}
@y
    ### Publish or expose port (-p, --expose) {#publish}
@z

% snip command...

@x
    This binds port `8080` of the container to TCP port `80` on `127.0.0.1` of the
    host. You can also specify `udp` and `sctp` ports. The [Networking overview
    page](/network/) explains in detail how to publish ports
    with Docker.
@y
    This binds port `8080` of the container to TCP port `80` on `127.0.0.1` of the
    host. You can also specify `udp` and `sctp` ports. The [Networking overview
    page](__SUBDIR__/network/) explains in detail how to publish ports
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
    > more](__SUBDIR__/network/packet-filtering-firewalls/)
@z

% snip command...

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

% snip command...

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

% snip command...

@x
    ### Set environment variables (-e, --env, --env-file) {#env}
@y
    ### Set environment variables (-e, --env, --env-file) {#env}
@z

% snip command...

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

% snip command...

@x
    You can also use variables exported to your local environment:
@y
    You can also use variables exported to your local environment:
@z

% snip command...

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

% snip command...

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

% snip command...

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

% snip command...

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

% snip command...

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
    [Labels](__SUBDIR__/config/labels-custom-metadata/).
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

% snip command...

@x
    You can also choose the IP addresses for the container with `--ip` and `--ip6`
    flags when you start the container on a user-defined network. To assign a
    static IP to containers, you must specify subnet block for the network.
@y
    You can also choose the IP addresses for the container with `--ip` and `--ip6`
    flags when you start the container on a user-defined network. To assign a
    static IP to containers, you must specify subnet block for the network.
@z

% snip command...

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
    For more information on connecting a container to a network when using the `run` command, see the ["*Docker network overview*"](__SUBDIR__/network/).
@z

@x
    ### Mount volumes from container (--volumes-from) {#volumes-from}
@y
    ### Mount volumes from container (--volumes-from) {#volumes-from}
@z

% snip command...

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

% snip command...

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

% snip command...

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
    containers, see [**Configuration file** section](/engine/reference/commandline/cli/#configuration-files).
@y
    These `a`, `ctrl-a`, `X`, or `ctrl-\\` values are all examples of valid key
    sequences. To configure a different configuration default key sequence for all
    containers, see [**Configuration file** section](__SUBDIR__/engine/reference/commandline/cli/#configuration-files).
@z

@x
    ### Add host device to container (--device) {#device}
@y
    ### Add host device to container (--device) {#device}
@z

% snip command...

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

% snip command...

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

% snip command...

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

% snip command...

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
      devices](/reference/cli/dockerd/#enable-cdi-devices).
@y
    - A valid CDI specification (JSON file) for the requested device is available
      on the system running the daemon, in one of the configured CDI specification
      directories.
    - The CDI feature has been enabled on the daemon side, see [Enable CDI
      devices](__SUBDIR__/reference/cli/dockerd/#enable-cdi-devices).
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

% snip command...

@x
    The following example pipes data into a container and prints the container's ID
    by attaching only to the container's `STDIN`.
@y
    The following example pipes data into a container and prints the container's ID
    by attaching only to the container's `STDIN`.
@z

% snip command...

@x
    The following example doesn't print anything to the console unless there's an
    error because output is only attached to the `STDERR` of the container. The
    container's logs still store what's written to `STDERR` and `STDOUT`.
@y
    The following example doesn't print anything to the console unless there's an
    error because output is only attached to the `STDERR` of the container. The
    container's logs still store what's written to `STDERR` and `STDOUT`.
@z

% snip command...

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

% snip command...

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
    See also [the `docker cp` command](/reference/cli/docker/container/cp/).
@y
    See also [the `docker cp` command](__SUBDIR__/reference/cli/docker/container/cp/).
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

% snip command...

@x
    The `-i` flag is most often used together with the `--tty` flag to bind the I/O
    streams of the container to a pseudo terminal, creating an interactive terminal
    session for the container. See [Allocate a pseudo-TTY](#tty) for more examples.
@y
    The `-i` flag is most often used together with the `--tty` flag to bind the I/O
    streams of the container to a pseudo terminal, creating an interactive terminal
    session for the container. See [Allocate a pseudo-TTY](#tty) for more examples.
@z

% snip command...

@x
    Using the `-i` flag on its own allows for composition, such as piping input to
    containers:
@y
    Using the `-i` flag on its own allows for composition, such as piping input to
    containers:
@z

% snip command...

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

% snip command...

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

% snip command...

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

% snip command...

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
    Read [Specify a container's resources](__SUBDIR__/config/containers/resource_constraints/)
    for more information.
@z

@x
    To use `--gpus`, specify which GPUs (or all) to use. If you provide no value, Docker uses all
    available GPUs. The example below exposes all available GPUs.
@y
    To use `--gpus`, specify which GPUs (or all) to use. If you provide no value, Docker uses all
    available GPUs. The example below exposes all available GPUs.
@z

% snip command...

@x
    Use the `device` option to specify GPUs. The example below exposes a specific
    GPU.
@y
    Use the `device` option to specify GPUs. The example below exposes a specific
    GPU.
@z

% snip command...

@x
    The example below exposes the first and third GPUs.
@y
    The example below exposes the first and third GPUs.
@z

% snip command...

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

% snip command...

@x
    This runs the `redis` container with a restart policy of **always**.
    If the container exits, Docker restarts it.
@y
    This runs the `redis` container with a restart policy of **always**.
    If the container exits, Docker restarts it.
@z

@x
    When a restart policy is active on a container, it shows as either `Up` or
    `Restarting` in [`docker ps`](/reference/cli/docker/container/ls/). It can also be useful to use
    [`docker events`](/reference/cli/docker/system/events/) to see the restart policy in effect.
@y
    When a restart policy is active on a container, it shows as either `Up` or
    `Restarting` in [`docker ps`](__SUBDIR__/reference/cli/docker/container/ls/). It can also be useful to use
    [`docker events`](__SUBDIR__/reference/cli/docker/system/events/) to see the restart policy in effect.
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

% snip command...

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
    [`docker inspect`](/reference/cli/docker/inspect/) command. For example, to get the number of
    restarts for container "my-container";
@y
    The number of (attempted) restarts for a container can be obtained using the
    [`docker inspect`](__SUBDIR__/reference/cli/docker/inspect/) command. For example, to get the number of
    restarts for container "my-container";
@z

% snip command...

@x
    Or, to get the last time the container was (re)started;
@y
    Or, to get the last time the container was (re)started;
@z

% snip command...

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

% snip command...

@x
    You can wrap an IPv6 address in square brackets:
@y
    You can wrap an IPv6 address in square brackets:
@z

% snip command...

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
    [Explore networking features](__SUBDIR__/desktop/networking/#i-want-to-connect-from-a-container-to-a-service-on-the-host).
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

% snip command...

@x
    The `--add-host` flag also accepts a `:` separator, for example:
@y
    The `--add-host` flag also accepts a `:` separator, for example:
@z

% snip command...

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
    [Configure logging drivers](__SUBDIR__/config/containers/logging/configure/).
@z

@x
    To disable logging for a container, set the `--log-driver` flag to `none`:
@y
    To disable logging for a container, set the `--log-driver` flag to `none`:
@z

% snip command...

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

% snip command...

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

% snip command...

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
    The default value is defined by [`STOPSIGNAL`](/reference/dockerfile/#stopsignal)
    in the image, or `SIGTERM` if the image has no `STOPSIGNAL` defined.
@y
    The default value is defined by [`STOPSIGNAL`](__SUBDIR__/reference/dockerfile/#stopsignal)
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

% snip command...

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

% snip command...

@x
    If you want a tighter security policy on the processes within a container, you
    can specify a custom `type` label. The following example runs a container
    that's only allowed to listen on Apache ports:
@y
    If you want a tighter security policy on the processes within a container, you
    can specify a custom `type` label. The following example runs a container
    that's only allowed to listen on Apache ports:
@z

% snip command...

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

% snip command...

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

% snip command...

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

% snip command...

@x
    If you have set the `--exec-opt isolation=hyperv` option on the Docker `daemon`, or
    are running against a Windows client-based daemon, these commands are equivalent and
    result in `hyperv` isolation:
@y
    If you have set the `--exec-opt isolation=hyperv` option on the Docker `daemon`, or
    are running against a Windows client-based daemon, these commands are equivalent and
    result in `hyperv` isolation:
@z

% snip command...

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

% snip command...

@x
    - With `hyperv` isolation, Windows creates a utility VM that is big enough to hold the memory limit, plus the minimal OS needed to host the container. That size is reported as "Total Physical Memory."
@y
    - With `hyperv` isolation, Windows creates a utility VM that is big enough to hold the memory limit, plus the minimal OS needed to host the container. That size is reported as "Total Physical Memory."
@z

% snip command...

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

% snip command...

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
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    - Sysctls beginning with `net.*`
    - If you use the `--network=host` option using these sysctls are not allowed.
deprecated: false
hidden: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
