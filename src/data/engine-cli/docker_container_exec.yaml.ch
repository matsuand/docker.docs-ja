%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker container exec
aliases: docker container exec, docker exec
short: Execute a command in a running container
long: |-
    The `docker exec` command runs a new command in a running container.
@y
command: docker container exec
aliases: docker container exec, docker exec
short: Execute a command in a running container
long: |-
    The `docker exec` command runs a new command in a running container.
@z

@x
    The command you specify with `docker exec` only runs while the container's
    primary process (`PID 1`) is running, and it isn't restarted if the container
    is restarted.
@y
    The command you specify with `docker exec` only runs while the container's
    primary process (`PID 1`) is running, and it isn't restarted if the container
    is restarted.
@z

@x
    The command runs in the default working directory of the container.
@y
    The command runs in the default working directory of the container.
@z

@x
    The command must be an executable. A chained or a quoted command doesn't work.
@y
    The command must be an executable. A chained or a quoted command doesn't work.
@z

@x
    - This works: `docker exec -it my_container sh -c "echo a && echo b"`
    - This doesn't work: `docker exec -it my_container "echo a && echo b"`
usage: docker container exec [OPTIONS] CONTAINER COMMAND [ARG...]
pname: docker container
plink: docker_container.yaml
options:
    - option: detach
      shorthand: d
      value_type: bool
      default_value: "false"
      description: 'Detached mode: run command in the background'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: detach-keys
      value_type: string
      description: Override the key sequence for detaching a container
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
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: env-file
      value_type: list
      description: Read in a file of environment variables
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
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: privileged
      value_type: bool
      default_value: "false"
      description: Give extended privileges to the command
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
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: user
      shorthand: u
      value_type: string
      description: 'Username or UID (format: `<name|uid>[:<group|gid>]`)'
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
      min_api_version: "1.35"
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
    ### Run `docker exec` on a running container
@y
    - This works: `docker exec -it my_container sh -c "echo a && echo b"`
    - This doesn't work: `docker exec -it my_container "echo a && echo b"`
usage: docker container exec [OPTIONS] CONTAINER COMMAND [ARG...]
pname: docker container
plink: docker_container.yaml
options:
    - option: detach
      shorthand: d
      value_type: bool
      default_value: "false"
      description: 'Detached mode: run command in the background'
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: detach-keys
      value_type: string
      description: Override the key sequence for detaching a container
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
      min_api_version: "1.25"
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: env-file
      value_type: list
      description: Read in a file of environment variables
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
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: privileged
      value_type: bool
      default_value: "false"
      description: Give extended privileges to the command
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
      deprecated: false
      hidden: false
      experimental: false
      experimentalcli: false
      kubernetes: false
      swarm: false
    - option: user
      shorthand: u
      value_type: string
      description: 'Username or UID (format: `<name|uid>[:<group|gid>]`)'
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
      min_api_version: "1.35"
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
    ### Run `docker exec` on a running container
@z

@x
    First, start a container.
@y
    First, start a container.
@z

@x
    ```console
    $ docker run --name mycontainer -d -i -t alpine /bin/sh
    ```
@y
    ```console
    $ docker run --name mycontainer -d -i -t alpine /bin/sh
    ```
@z

@x
    This creates and starts a container named `mycontainer` from an `alpine` image
    with an `sh` shell as its main process. The `-d` option (shorthand for `--detach`)
    sets the container to run in the background, in detached mode, with a pseudo-TTY
    attached (`-t`). The `-i` option is set to keep `STDIN` attached (`-i`), which
    prevents the `sh` process from exiting immediately.
@y
    This creates and starts a container named `mycontainer` from an `alpine` image
    with an `sh` shell as its main process. The `-d` option (shorthand for `--detach`)
    sets the container to run in the background, in detached mode, with a pseudo-TTY
    attached (`-t`). The `-i` option is set to keep `STDIN` attached (`-i`), which
    prevents the `sh` process from exiting immediately.
@z

@x
    Next, execute a command on the container.
@y
    Next, execute a command on the container.
@z

@x
    ```console
    $ docker exec -d mycontainer touch /tmp/execWorks
    ```
@y
    ```console
    $ docker exec -d mycontainer touch /tmp/execWorks
    ```
@z

@x
    This creates a new file `/tmp/execWorks` inside the running container
    `mycontainer`, in the background.
@y
    This creates a new file `/tmp/execWorks` inside the running container
    `mycontainer`, in the background.
@z

@x
    Next, execute an interactive `sh` shell on the container.
@y
    Next, execute an interactive `sh` shell on the container.
@z

@x
    ```console
    $ docker exec -it mycontainer sh
    ```
@y
    ```console
    $ docker exec -it mycontainer sh
    ```
@z

@x
    This starts a new shell session in the container `mycontainer`.
@y
    This starts a new shell session in the container `mycontainer`.
@z

@x
    ### Set environment variables for the exec process (--env, -e) {#env}
@y
    ### Set environment variables for the exec process (--env, -e) {#env}
@z

@x
    Next, set environment variables in the current bash session.
@y
    Next, set environment variables in the current bash session.
@z

@x
    The `docker exec` command inherits the environment variables that are set at the
    time the container is created. Use the `--env` (or the `-e` shorthand) to
    override global environment variables, or to set additional environment
    variables for the process started by `docker exec`.
@y
    The `docker exec` command inherits the environment variables that are set at the
    time the container is created. Use the `--env` (or the `-e` shorthand) to
    override global environment variables, or to set additional environment
    variables for the process started by `docker exec`.
@z

@x
    The following example creates a new shell session in the container `mycontainer`,
    with environment variables `$VAR_A` set to `1`, and `$VAR_B` set to `2`.
    These environment variables are only valid for the `sh` process started by that
    `docker exec` command, and aren't available to other processes running inside
    the container.
@y
    The following example creates a new shell session in the container `mycontainer`,
    with environment variables `$VAR_A` set to `1`, and `$VAR_B` set to `2`.
    These environment variables are only valid for the `sh` process started by that
    `docker exec` command, and aren't available to other processes running inside
    the container.
@z

@x
    ```console
    $ docker exec -e VAR_A=1 -e VAR_B=2 mycontainer env
    PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
    HOSTNAME=f64a4851eb71
    VAR_A=1
    VAR_B=2
    HOME=/root
    ```
@y
    ```console
    $ docker exec -e VAR_A=1 -e VAR_B=2 mycontainer env
    PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
    HOSTNAME=f64a4851eb71
    VAR_A=1
    VAR_B=2
    HOME=/root
    ```
@z

@x
    ### Set the working directory for the exec process (--workdir, -w) {#workdir}
@y
    ### Set the working directory for the exec process (--workdir, -w) {#workdir}
@z

@x
    By default `docker exec` command runs in the same working directory set when
    the container was created.
@y
    By default `docker exec` command runs in the same working directory set when
    the container was created.
@z

@x
    ```console
    $ docker exec -it mycontainer pwd
    /
    ```
@y
    ```console
    $ docker exec -it mycontainer pwd
    /
    ```
@z

@x
    You can specify an alternative working directory for the command to execute
    using the `--workdir` option (or the `-w` shorthand):
@y
    You can specify an alternative working directory for the command to execute
    using the `--workdir` option (or the `-w` shorthand):
@z

@x
    ```console
    $ docker exec -it -w /root mycontainer pwd
    /root
    ```
@y
    ```console
    $ docker exec -it -w /root mycontainer pwd
    /root
    ```
@z

@x
    ### Try to run `docker exec` on a paused container
@y
    ### Try to run `docker exec` on a paused container
@z

@x
    If the container is paused, then the `docker exec` command fails with an error:
@y
    If the container is paused, then the `docker exec` command fails with an error:
@z

@x
    ```console
    $ docker pause mycontainer
    mycontainer
@y
    ```console
    $ docker pause mycontainer
    mycontainer
@z

@x
    $ docker ps
@y
    $ docker ps
@z

@x
    CONTAINER ID   IMAGE     COMMAND     CREATED          STATUS                   PORTS     NAMES
    482efdf39fac   alpine    "/bin/sh"   17 seconds ago   Up 16 seconds (Paused)             mycontainer
@y
    CONTAINER ID   IMAGE     COMMAND     CREATED          STATUS                   PORTS     NAMES
    482efdf39fac   alpine    "/bin/sh"   17 seconds ago   Up 16 seconds (Paused)             mycontainer
@z

@x
    $ docker exec mycontainer sh
@y
    $ docker exec mycontainer sh
@z

@x
    Error response from daemon: Container mycontainer is paused, unpause the container before exec
@y
    Error response from daemon: Container mycontainer is paused, unpause the container before exec
@z

@x
    $ echo $?
    1
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    $ echo $?
    1
    ```
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
