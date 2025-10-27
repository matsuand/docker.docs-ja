%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
command: docker container kill
aliases: docker container kill, docker kill
short: Kill one or more running containers
long: |-
    The `docker kill` subcommand kills one or more containers. The main process
    inside the container is sent `SIGKILL` signal (default), or the signal that is
    specified with the `--signal` option. You can reference a container by its
    ID, ID-prefix, or name.
@y
command: docker container kill
aliases: docker container kill, docker kill
short: 1 つまたは複数の実行コンテナーを kill します。
long: |-
    `docker kill` コマンドは 1 つまたは複数のコンテナーを kill します。
    コンテナー内のメインプロセスが (デフォルトでは) `SIGKILL` シグナルを送信します。
    `--signal` オプションが指定されていれば、そのシグナルが送信されます。
    コンテナーの指定には ID、ID プレフィックス、名前を用いることができます。
@z

@x
    The `--signal` flag sets the system call signal that is sent to the container.
    This signal can be a signal name in the format `SIG<NAME>`, for instance `SIGINT`,
    or an unsigned number that matches a position in the kernel's syscall table,
    for instance `2`.
@y
    `--signal` フラグには、コンテナーに送信するシステムコールシグナルを指定します。
    このシグナルは、たとえば `SIGINT` のように `SIG<NAME>` の書式に従ったシグナル名とします。
    または非負の数値、たとえば `2` のような、カーネルのシステムコールテーブルの定義位置にマッチする値を指定します。
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
    > [!NOTE]
    > `ENTRYPOINT` and `CMD` in the *shell* form run as a child process of
    > `/bin/sh -c`, which does not pass signals. This means that the executable is
    > not the container’s PID 1 and does not receive Unix signals.
@y
    > [!NOTE]
    > `ENTRYPOINT` and `CMD` in the *shell* form run as a child process of
    > `/bin/sh -c`, which does not pass signals. This means that the executable is
    > not the container’s PID 1 and does not receive Unix signals.
@z

@x
usage: docker container kill [OPTIONS] CONTAINER [CONTAINER...]
@y
usage: docker container kill [OPTIONS] CONTAINER [CONTAINER...]
@z

% options:

@x signal
      description: Signal to send to the container
@y
      description: コンテナーに送信するシグナル。
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

@x
examples: |-
    ### Send a KILL signal to a container
@y
examples: |-
    ### コンテナーへの KILL シグナルの送信 {#send-a-kill-signal-to-a-container}
@z

@x
    The following example sends the default `SIGKILL` signal to the container named
    `my_container`:
@y
    The following example sends the default `SIGKILL` signal to the container named
    `my_container`:
@z

% snip command...

@x
    ### Send a custom signal to a container (--signal) {#signal}
@y
    ### コンテナーへのカスタムシグナルの送信 (--signal) {#signal}
@z

@x
    The following example sends a `SIGHUP` signal to the container named
    `my_container`:
@y
    The following example sends a `SIGHUP` signal to the container named
    `my_container`:
@z

% snip command...

@x
    You can specify a custom signal either by _name_, or _number_. The `SIG` prefix
    is optional, so the following examples are equivalent:
@y
    You can specify a custom signal either by _name_, or _number_. The `SIG` prefix
    is optional, so the following examples are equivalent:
@z

% snip command...

@x
    Refer to the [`signal(7)`](https://man7.org/linux/man-pages/man7/signal.7.html)
    man-page for a list of standard Linux signals.
@y
    標準的な Linux シグナルの一覧については man ページ [`signal(7)`](https://man7.org/linux/man-pages/man7/signal.7.html) を参照してください。
@z

% snip directives...
