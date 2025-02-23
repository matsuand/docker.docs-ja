%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker container restart
aliases: docker container restart, docker restart
short: Restart one or more containers
long: Restart one or more containers
@y
command: docker container restart
aliases: docker container restart, docker restart
short: Restart one or more containers
long: Restart one or more containers
@z

@x
usage: docker container restart [OPTIONS] CONTAINER [CONTAINER...]
@y
usage: docker container restart [OPTIONS] CONTAINER [CONTAINER...]
@z

% options:

@x signal
      description: Signal to send to the container
@y
      description: Signal to send to the container
@z

@x time
      description: Seconds to wait before killing the container
@y
      description: Seconds to wait before killing the container
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: Print usage
@z

@x
examples: |-
@y
examples: |-
@z

% snip command...

@x
    ### Stop container with signal (-s, --signal) {#signal}
@y
    ### Stop container with signal (-s, --signal) {#signal}
@z

@x
    The `--signal` flag sends the system call signal to the container to exit.
    This signal can be a signal name in the format `SIG<NAME>`, for instance
    `SIGKILL`, or an unsigned number that matches a position in the kernel's
    syscall table, for instance `9`. Refer to [signal(7)](https://man7.org/linux/man-pages/man7/signal.7.html)
    for available signals.
@y
    The `--signal` flag sends the system call signal to the container to exit.
    This signal can be a signal name in the format `SIG<NAME>`, for instance
    `SIGKILL`, or an unsigned number that matches a position in the kernel's
    syscall table, for instance `9`. Refer to [signal(7)](https://man7.org/linux/man-pages/man7/signal.7.html)
    for available signals.
@z

@x
    The default signal to use is defined by the image's [`StopSignal`](https://github.com/opencontainers/image-spec/blob/v1.1.0/config.md),
    which can be set through the [`STOPSIGNAL`](/reference/dockerfile/#stopsignal)
    Dockerfile instruction when building the image, or configured using the
    [`--stop-signal`](/reference/cli/docker/container/run/#stop-signal)
    option when creating the container. If no signal is configured for the
    container, `SIGTERM` is used as default.
@y
    The default signal to use is defined by the image's [`StopSignal`](https://github.com/opencontainers/image-spec/blob/v1.1.0/config.md),
    which can be set through the [`STOPSIGNAL`](__SUBDIR__/reference/dockerfile/#stopsignal)
    Dockerfile instruction when building the image, or configured using the
    [`--stop-signal`](__SUBDIR__/reference/cli/docker/container/run/#stop-signal)
    option when creating the container. If no signal is configured for the
    container, `SIGTERM` is used as default.
@z

@x
    ### Stop container with timeout (-t, --timeout) {#timeout}
@y
    ### Stop container with timeout (-t, --timeout) {#timeout}
@z

@x
    The `--timeout` flag sets the number of seconds to wait for the container
    to stop after sending the pre-defined (see [`--signal`]{#signal)) system call signal.
    If the container does not exit after the timeout elapses, it's forcibly killed
    with a `SIGKILL` signal.
@y
    The `--timeout` flag sets the number of seconds to wait for the container
    to stop after sending the pre-defined (see [`--signal`]{#signal)) system call signal.
    If the container does not exit after the timeout elapses, it's forcibly killed
    with a `SIGKILL` signal.
@z

@x
    If you set `--timeout` to `-1`, no timeout is applied, and the daemon
    waits indefinitely for the container to exit.
@y
    If you set `--timeout` to `-1`, no timeout is applied, and the daemon
    waits indefinitely for the container to exit.
@z

@x
    The default timeout can be specified using the [`--stop-timeout`](/reference/cli/docker/container/run/#stop-timeout)
    option when creating the container. If no default is configured for the container,
    the Daemon determines the default, and is 10 seconds for Linux containers, and
    30 seconds for Windows containers.
@y
    The default timeout can be specified using the [`--stop-timeout`](__SUBDIR__/reference/cli/docker/container/run/#stop-timeout)
    option when creating the container. If no default is configured for the container,
    the Daemon determines the default, and is 10 seconds for Linux containers, and
    30 seconds for Windows containers.
    30 seconds for Windows containers.
@z

% snip directives...
