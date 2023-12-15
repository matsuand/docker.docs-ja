%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker kill
aliases: docker container kill, docker kill
short: Kill one or more running containers
long: |-
    The `docker kill` subcommand kills one or more containers. The main process
    inside the container is sent `SIGKILL` signal (default), or the signal that is
    specified with the `--signal` option. You can reference a container by its
    ID, ID-prefix, or name.
@y
command: docker kill
aliases: docker container kill, docker kill
short: Kill one or more running containers
long: |-
    The `docker kill` subcommand kills one or more containers. The main process
    inside the container is sent `SIGKILL` signal (default), or the signal that is
    specified with the `--signal` option. You can reference a container by its
    ID, ID-prefix, or name.
@z

@x
    The `--signal` flag sets the system call signal that is sent to the container.
    This signal can be a signal name in the format `SIG<NAME>`, for instance `SIGINT`,
    or an unsigned number that matches a position in the kernel's syscall table,
    for instance `2`.
@y
    The `--signal` flag sets the system call signal that is sent to the container.
    This signal can be a signal name in the format `SIG<NAME>`, for instance `SIGINT`,
    or an unsigned number that matches a position in the kernel's syscall table,
    for instance `2`.
@z

@x
    While the default (`SIGKILL`) signal will terminate the container, the signal
    set through `--signal` may be non-terminal, depending on the container's main
    process. For example, the `SIGHUP` signal in most cases will be non-terminal,
    and the container will continue running after receiving the signal.
@y
    While the default (`SIGKILL`) signal will terminate the container, the signal
    set through `--signal` may be non-terminal, depending on the container's main
    process. For example, the `SIGHUP` signal in most cases will be non-terminal,
    and the container will continue running after receiving the signal.
@z

@x
    > **Note**
    >
    > `ENTRYPOINT` and `CMD` in the *shell* form run as a child process of
    > `/bin/sh -c`, which does not pass signals. This means that the executable is
    > not the container’s PID 1 and does not receive Unix signals.
usage: docker kill [OPTIONS] CONTAINER [CONTAINER...]
pname: docker
plink: docker.yaml
options:
    - option: signal
      shorthand: s
      value_type: string
      description: Signal to send to the container
      details_url: '#signal'
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
    ### Send a KILL signal to a container
@y
    > **Note**
    >
    > `ENTRYPOINT` and `CMD` in the *shell* form run as a child process of
    > `/bin/sh -c`, which does not pass signals. This means that the executable is
    > not the container’s PID 1 and does not receive Unix signals.
usage: docker kill [OPTIONS] CONTAINER [CONTAINER...]
pname: docker
plink: docker.yaml
options:
    - option: signal
      shorthand: s
      value_type: string
      description: Signal to send to the container
      details_url: '#signal'
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
    ### Send a KILL signal to a container
@z

@x
    The following example sends the default `SIGKILL` signal to the container named
    `my_container`:
@y
    The following example sends the default `SIGKILL` signal to the container named
    `my_container`:
@z

@x
    ```console
    $ docker kill my_container
    ```
@y
    ```console
    $ docker kill my_container
    ```
@z

@x
    ### Send a custom signal to a container (--signal) {#signal}
@y
    ### Send a custom signal to a container (--signal) {#signal}
@z

@x
    The following example sends a `SIGHUP` signal to the container named
    `my_container`:
@y
    The following example sends a `SIGHUP` signal to the container named
    `my_container`:
@z

@x
    ```console
    $ docker kill --signal=SIGHUP  my_container
    ```
@y
    ```console
    $ docker kill --signal=SIGHUP  my_container
    ```
@z

@x
    You can specify a custom signal either by _name_, or _number_. The `SIG` prefix
    is optional, so the following examples are equivalent:
@y
    You can specify a custom signal either by _name_, or _number_. The `SIG` prefix
    is optional, so the following examples are equivalent:
@z

@x
    ```console
    $ docker kill --signal=SIGHUP my_container
    $ docker kill --signal=HUP my_container
    $ docker kill --signal=1 my_container
    ```
@y
    ```console
    $ docker kill --signal=SIGHUP my_container
    $ docker kill --signal=HUP my_container
    $ docker kill --signal=1 my_container
    ```
@z

@x
    Refer to the [`signal(7)`](https://man7.org/linux/man-pages/man7/signal.7.html)
    man-page for a list of standard Linux signals.
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@y
    Refer to the [`signal(7)`](https://man7.org/linux/man-pages/man7/signal.7.html)
    man-page for a list of standard Linux signals.
deprecated: false
experimental: false
experimentalcli: false
kubernetes: false
swarm: false
@z
