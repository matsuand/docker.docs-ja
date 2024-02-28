%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応

@x
command: docker container attach
aliases: docker container attach, docker attach
short: |
    Attach local standard input, output, and error streams to a running container
long: |-
    Use `docker attach` to attach your terminal's standard input, output, and error
    (or any combination of the three) to a running container using the container's
    ID or name. This lets you view its output or control it interactively, as
    though the commands were running directly in your terminal.
@y
command: docker container attach
aliases: docker container attach, docker attach
short: |
    ローカルの標準入出力やエラー出力を実行中のコンテナーにアタッチします。
long: |-
    Use `docker attach` to attach your terminal's standard input, output, and error
    (or any combination of the three) to a running container using the container's
    ID or name. This lets you view its output or control it interactively, as
    though the commands were running directly in your terminal.
@z

@x
    > **Note**
    >
    > The `attach` command displays the output of the container's `ENTRYPOINT` and
    > `CMD` process. This can appear as if the attach command is hung when in fact
    > the process may simply not be writing any output at that time.
@y
    > **Note**
    >
    > The `attach` command displays the output of the container's `ENTRYPOINT` and
    > `CMD` process. This can appear as if the attach command is hung when in fact
    > the process may simply not be writing any output at that time.
@z

@x
    You can attach to the same contained process multiple times simultaneously,
    from different sessions on the Docker host.
@y
    You can attach to the same contained process multiple times simultaneously,
    from different sessions on the Docker host.
@z

@x
    To stop a container, use `CTRL-c`. This key sequence sends `SIGKILL` to the
    container. If `--sig-proxy` is true (the default),`CTRL-c` sends a `SIGINT` to
    the container. If the container was run with `-i` and `-t`, you can detach from
    a container and leave it running using the `CTRL-p CTRL-q` key sequence.
@y
    To stop a container, use `CTRL-c`. This key sequence sends `SIGKILL` to the
    container. If `--sig-proxy` is true (the default),`CTRL-c` sends a `SIGINT` to
    the container. If the container was run with `-i` and `-t`, you can detach from
    a container and leave it running using the `CTRL-p CTRL-q` key sequence.
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
    You can't redirect the standard input of a `docker attach` command while
    attaching to a TTY-enabled container (using the `-i` and `-t` options).
@y
    You can't redirect the standard input of a `docker attach` command while
    attaching to a TTY-enabled container (using the `-i` and `-t` options).
@z

@x
    While a client is connected to container's `stdio` using `docker attach`,
    Docker uses a ~1MB memory buffer to maximize the throughput of the application.
    Once this buffer is full, the speed of the API connection is affected, and so
    this impacts the output process' writing speed. This is similar to other
    applications like SSH. Because of this, it isn't recommended to run
    performance-critical applications that generate a lot of output in the
    foreground over a slow client connection. Instead, use the `docker logs`
    command to get access to the logs.
@y
    While a client is connected to container's `stdio` using `docker attach`,
    Docker uses a ~1MB memory buffer to maximize the throughput of the application.
    Once this buffer is full, the speed of the API connection is affected, and so
    this impacts the output process' writing speed. This is similar to other
    applications like SSH. Because of this, it isn't recommended to run
    performance-critical applications that generate a lot of output in the
    foreground over a slow client connection. Instead, use the `docker logs`
    command to get access to the logs.
@z

@x
usage: docker container attach [OPTIONS] CONTAINER
@y
usage: docker container attach [OPTIONS] CONTAINER
@z

% options:

@x detach-keys
      description: Override the key sequence for detaching a container
@y
      description: コンテナーデタッチ時のキーシーケンスをオーバーライドします。
@z

@x no-stdin
      description: Do not attach STDIN
@y
      description: STDIN をアタッチしません。
@z

@x sig-proxy
      description: Proxy all received signals to the process
@y
      description: 受信シグナルのすべてをプロセスにプロキシーします。
@z

% inherited_options:

@x
      description: Print usage
@y
      description: 利用方法を表示します。
@z

@x
examples: |-
    ### Attach to and detach from a running container
@y
examples: |-
    ### Attach to and detach from a running container
@z

@x
    The following example starts an Alpine container running `top` in detached mode,
    then attaches to the container;
@y
    The following example starts an Alpine container running `top` in detached mode,
    then attaches to the container;
@z

% snip command...

@x
    As the container was started without the `-i`, and `-t` options, signals are
    forwarded to the attached process, which means that the default `CTRL-p CTRL-q`
    detach key sequence produces no effect, but pressing `CTRL-c` terminates the
    container:
@y
    As the container was started without the `-i`, and `-t` options, signals are
    forwarded to the attached process, which means that the default `CTRL-p CTRL-q`
    detach key sequence produces no effect, but pressing `CTRL-c` terminates the
    container:
@z

% snip output...

@x
    Repeating the example above, but this time with the `-i` and `-t` options set;
@y
    Repeating the example above, but this time with the `-i` and `-t` options set;
@z

% snip command...

@x
    Now, when attaching to the container, and pressing the `CTRL-p CTRL-q` ("read
    escape sequence"), the Docker CLI is handling the detach sequence, and the
    `attach` command is detached from the container. Checking the container's status
    with `docker ps` shows that the container is still running in the background:
@y
    Now, when attaching to the container, and pressing the `CTRL-p CTRL-q` ("read
    escape sequence"), the Docker CLI is handling the detach sequence, and the
    `attach` command is detached from the container. Checking the container's status
    with `docker ps` shows that the container is still running in the background:
@z

% snip command...

@x
    ### Get the exit code of the container's command
@y
    ### Get the exit code of the container's command
@z

@x
    And in this second example, you can see the exit code returned by the `bash`
    process is returned by the `docker attach` command to its caller too:
@y
    And in this second example, you can see the exit code returned by the `bash`
    process is returned by the `docker attach` command to its caller too:
@z

% snip command...

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

% snip directives...
