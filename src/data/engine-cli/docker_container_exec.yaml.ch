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
@y
    - This works: `docker exec -it my_container sh -c "echo a && echo b"`
    - This doesn't work: `docker exec -it my_container "echo a && echo b"`
@z

@x
usage: docker container exec [OPTIONS] CONTAINER COMMAND [ARG...]
@y
usage: docker container exec [OPTIONS] CONTAINER COMMAND [ARG...]
@z

% options:

@x detach
      description: 'Detached mode: run command in the background'
@y
      description: 'Detached mode: run command in the background'
@z

@x detach-keys
      description: Override the key sequence for detaching a container
@y
      description: Override the key sequence for detaching a container
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

@x interactive
      description: Keep STDIN open even if not attached
@y
      description: Keep STDIN open even if not attached
@z

@x privileged
      description: Give extended privileges to the command
@y
      description: Give extended privileges to the command
@z

@x tty
      description: Allocate a pseudo-TTY
@y
      description: Allocate a pseudo-TTY
@z

@x user
      description: 'Username or UID (format: `<name|uid>[:<group|gid>]`)'
@y
      description: 'Username or UID (format: `<name|uid>[:<group|gid>]`)'
@z

@x workdir
      description: Working directory inside the container
@y
      description: Working directory inside the container
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

@x
examples: |-
    ### Run `docker exec` on a running container
@y
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

% snip command...

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

% snip command...

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

% snip command...

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

% snip command...

@x
    You can specify an alternative working directory for the command to execute
    using the `--workdir` option (or the `-w` shorthand):
@y
    You can specify an alternative working directory for the command to execute
    using the `--workdir` option (or the `-w` shorthand):
@z

% snip command...

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

% snip command...
% snip directives...
