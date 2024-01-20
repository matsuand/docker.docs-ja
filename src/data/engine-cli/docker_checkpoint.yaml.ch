%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker checkpoint
short: Manage checkpoints
long: |-
    Checkpoint and Restore is an experimental feature that allows you to freeze a running
    container by specifying a checkpoint, which turns the container state into a collection of files
    on disk. Later, the container can be restored from the point it was frozen.
@y
command: docker checkpoint
short: Manage checkpoints
long: |-
    Checkpoint and Restore is an experimental feature that allows you to freeze a running
    container by specifying a checkpoint, which turns the container state into a collection of files
    on disk. Later, the container can be restored from the point it was frozen.
@z

@x
    This is accomplished using a tool called [CRIU](https://criu.org), which is an
    external dependency of this feature. A good overview of the history of
    checkpoint and restore in Docker is available in this
    [Kubernetes blog post](https://kubernetes.io/blog/2015/07/how-did-quake-demo-from-dockercon-work/).
@y
    This is accomplished using a tool called [CRIU](https://criu.org), which is an
    external dependency of this feature. A good overview of the history of
    checkpoint and restore in Docker is available in this
    [Kubernetes blog post](https://kubernetes.io/blog/2015/07/how-did-quake-demo-from-dockercon-work/).
@z

@x
    ### Installing CRIU
@y
    ### Installing CRIU
@z

@x
    If you use a Debian system, you can add the CRIU PPA and install with `apt-get`
    [from the CRIU launchpad](https://launchpad.net/~criu/+archive/ubuntu/ppa).
@y
    If you use a Debian system, you can add the CRIU PPA and install with `apt-get`
    [from the CRIU launchpad](https://launchpad.net/~criu/+archive/ubuntu/ppa).
@z

@x
    Alternatively, you can [build CRIU from source](https://criu.org/Installation).
@y
    Alternatively, you can [build CRIU from source](https://criu.org/Installation).
@z

@x
    You need at least version 2.0 of CRIU to run checkpoint and restore in Docker.
@y
    You need at least version 2.0 of CRIU to run checkpoint and restore in Docker.
@z

@x
    ### Use cases for checkpoint and restore
@y
    ### Use cases for checkpoint and restore
@z

@x
    This feature is currently focused on single-host use cases for checkpoint and
    restore. Here are a few:
@y
    This feature is currently focused on single-host use cases for checkpoint and
    restore. Here are a few:
@z

@x
    - Restarting the host machine without stopping/starting containers
    - Speeding up the start time of slow start applications
    - "Rewinding" processes to an earlier point in time
    - "Forensic debugging" of running processes
@y
    - Restarting the host machine without stopping/starting containers
    - Speeding up the start time of slow start applications
    - "Rewinding" processes to an earlier point in time
    - "Forensic debugging" of running processes
@z

@x
    Another primary use case of checkpoint and restore outside of Docker is the live
    migration of a server from one machine to another. This is possible with the
    current implementation, but not currently a priority (and so the workflow is
    not optimized for the task).
@y
    Another primary use case of checkpoint and restore outside of Docker is the live
    migration of a server from one machine to another. This is possible with the
    current implementation, but not currently a priority (and so the workflow is
    not optimized for the task).
@z

@x
    ### Using checkpoint and restore
@y
    ### Using checkpoint and restore
@z

@x
    A new top level command `docker checkpoint` is introduced, with three subcommands:
@y
    A new top level command `docker checkpoint` is introduced, with three subcommands:
@z

@x
    - `docker checkpoint create` (creates a new checkpoint)
    - `docker checkpoint ls` (lists existing checkpoints)
    - `docker checkpoint rm` (deletes an existing checkpoint)
@y
    - `docker checkpoint create` (creates a new checkpoint)
    - `docker checkpoint ls` (lists existing checkpoints)
    - `docker checkpoint rm` (deletes an existing checkpoint)
@z

@x
    Additionally, a `--checkpoint` flag is added to the `docker container start` command.
@y
    Additionally, a `--checkpoint` flag is added to the `docker container start` command.
@z

@x
    The options for `docker checkpoint create`:
@y
    The options for `docker checkpoint create`:
@z

@x
    ```console
    Usage:  docker checkpoint create [OPTIONS] CONTAINER CHECKPOINT
@y
    ```console
    Usage:  docker checkpoint create [OPTIONS] CONTAINER CHECKPOINT
@z

@x
    Create a checkpoint from a running container
@y
    Create a checkpoint from a running container
@z

@x
      --leave-running=false    Leave the container running after checkpoint
      --checkpoint-dir         Use a custom checkpoint storage directory
    ```
@y
      --leave-running=false    Leave the container running after checkpoint
      --checkpoint-dir         Use a custom checkpoint storage directory
    ```
@z

@x
    And to restore a container:
@y
    And to restore a container:
@z

@x
    ```console
    Usage:  docker start --checkpoint CHECKPOINT_ID [OTHER OPTIONS] CONTAINER
    ```
@y
    ```console
    Usage:  docker start --checkpoint CHECKPOINT_ID [OTHER OPTIONS] CONTAINER
    ```
@z

@x
    Example of using checkpoint and restore on a container:
@y
    Example of using checkpoint and restore on a container:
@z

@x
    ```console
    $ docker run --security-opt=seccomp:unconfined --name cr -d busybox /bin/sh -c 'i=0; while true; do echo $i; i=$(expr $i + 1); sleep 1; done'
    abc0123
@y
    ```console
    $ docker run --security-opt=seccomp:unconfined --name cr -d busybox /bin/sh -c 'i=0; while true; do echo $i; i=$(expr $i + 1); sleep 1; done'
    abc0123
@z

@x
    $ docker checkpoint create cr checkpoint1
@y
    $ docker checkpoint create cr checkpoint1
@z

@x
    # <later>
    $ docker start --checkpoint checkpoint1 cr
    abc0123
    ```
@y
    # <later>
    $ docker start --checkpoint checkpoint1 cr
    abc0123
    ```
@z

@x
    This process just logs an incrementing counter to stdout. If you run `docker logs`
    in-between running/checkpoint/restoring, you should see that the counter
    increases while the process is running, stops while it's frozen, and
    resumes from the point it left off once you restore.
@y
    This process just logs an incrementing counter to stdout. If you run `docker logs`
    in-between running/checkpoint/restoring, you should see that the counter
    increases while the process is running, stops while it's frozen, and
    resumes from the point it left off once you restore.
@z

@x
    ### Known limitations
@y
    ### Known limitations
@z

@x
    `seccomp` is only supported by CRIU in very up-to-date kernels.
@y
    `seccomp` is only supported by CRIU in very up-to-date kernels.
@z

@x
    External terminals (i.e. `docker run -t ..`) aren't supported.
    If you try to create a checkpoint for a container with an external terminal,
    it fails:
@y
    External terminals (i.e. `docker run -t ..`) aren't supported.
    If you try to create a checkpoint for a container with an external terminal,
    it fails:
@z

@x
    ```console
    $ docker checkpoint create cr checkpoint1
    Error response from daemon: Cannot checkpoint container c1: rpc error: code = 2 desc = exit status 1: "criu failed: type NOTIFY errno 0\nlog file: /var/lib/docker/containers/eb62ebdbf237ce1a8736d2ae3c7d88601fc0a50235b0ba767b559a1f3c5a600b/checkpoints/checkpoint1/criu.work/dump.log\n"
@y
    ```console
    $ docker checkpoint create cr checkpoint1
    Error response from daemon: Cannot checkpoint container c1: rpc error: code = 2 desc = exit status 1: "criu failed: type NOTIFY errno 0\nlog file: /var/lib/docker/containers/eb62ebdbf237ce1a8736d2ae3c7d88601fc0a50235b0ba767b559a1f3c5a600b/checkpoints/checkpoint1/criu.work/dump.log\n"
@z

@x
    $ cat /var/lib/docker/containers/eb62ebdbf237ce1a8736d2ae3c7d88601fc0a50235b0ba767b559a1f3c5a600b/checkpoints/checkpoint1/criu.work/dump.log
    Error (mount.c:740): mnt: 126:./dev/console doesn't have a proper root mount
    ```
usage: docker checkpoint
pname: docker
plink: docker.yaml
cname:
    - docker checkpoint create
    - docker checkpoint ls
    - docker checkpoint rm
clink:
    - docker_checkpoint_create.yaml
    - docker_checkpoint_ls.yaml
    - docker_checkpoint_rm.yaml
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
deprecated: false
min_api_version: "1.25"
experimental: true
experimentalcli: false
kubernetes: false
swarm: false
os_type: linux
@y
    $ cat /var/lib/docker/containers/eb62ebdbf237ce1a8736d2ae3c7d88601fc0a50235b0ba767b559a1f3c5a600b/checkpoints/checkpoint1/criu.work/dump.log
    Error (mount.c:740): mnt: 126:./dev/console doesn't have a proper root mount
    ```
usage: docker checkpoint
pname: docker
plink: docker.yaml
cname:
    - docker checkpoint create
    - docker checkpoint ls
    - docker checkpoint rm
clink:
    - docker_checkpoint_create.yaml
    - docker_checkpoint_ls.yaml
    - docker_checkpoint_rm.yaml
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
deprecated: false
min_api_version: "1.25"
experimental: true
experimentalcli: false
kubernetes: false
swarm: false
os_type: linux
@z
