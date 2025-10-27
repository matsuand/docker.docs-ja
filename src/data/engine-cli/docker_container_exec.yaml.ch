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
short: 実行中コンテナーにおいてコマンドを実行します。
long: |-
    `docker exec` コマンドは、実行中のコンテナー内において新たなコマンドを実行します。
@z

@x
    The command you specify with `docker exec` only runs while the container's
    primary process (`PID 1`) is running, and it isn't restarted if the container
    is restarted.
@y
    `docker exec` において指定したコマンドは、コンテナー内にプライマリープロセス (`PID 1`) が稼働中である場合にのみ実行されます。
    そしてコンテナーが再起動した際には再実行されません。
@z

@x
    The command runs in the default working directory of the container.
@y
    コマンドは、コンテナーのデフォルトワーキングディレクトリにおいて実行されます。
@z

@x
    The command must be an executable. A chained or a quoted command doesn't work.
@y
    コマンドは実行可能でなければなりません。
    複数コマンドが連結したものやクォートで囲まれたコマンドでは動作しません。
@z

@x
    - This works: `docker exec -it my_container sh -c "echo a && echo b"`
    - This doesn't work: `docker exec -it my_container "echo a && echo b"`
@y
    - 以下は動作します: `docker exec -it my_container sh -c "echo a && echo b"`
    - 以下は動作しません: `docker exec -it my_container "echo a && echo b"`
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
      description: 'デタッチモード。コマンドをバックグラウンドで実行します。'
@z

@x detach-keys
      description: Override the key sequence for detaching a container
@y
      description: コンテナーデタッチ時のキーシーケンスを上書きします。
@z

@x env
      description: Set environment variables
@y
      description: 環境変数を設定します。
@z

@x env-file
      description: Read in a file of environment variables
@y
      description: 環境変数ファイルを読み込みます。
@z

@x interactive
      description: Keep STDIN open even if not attached
@y
      description: アタッチされていなくても STDIN は開放し続けます。
@z

@x privileged
      description: Give extended privileges to the command
@y
      description: コマンドに拡張権限を付与します。
@z

@x tty
      description: Allocate a pseudo-TTY
@y
      description: 擬似 TTY を割り当てます。
@z

@x user
      description: 'Username or UID (format: `<name|uid>[:<group|gid>]`)'
@y
      description: 'ユーザー名または UID。(記述書式: `<name|uid>[:<group|gid>]`)'
@z

@x workdir
      description: Working directory inside the container
@y
      description: コンテナー内部のワーキングディレクトリ。
@z

% inherited_options:

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

@x
examples: |-
    ### Run `docker exec` on a running container
@y
examples: |-
    ### 実行中コンテナーでの `docker exec` 実行 {#run-docker-exec-on-a-running-container}
@z

@x
    First, start a container.
@y
    まずはコンテナーを起動します。
@z

% snip command...

@x
    This creates and starts a container named `mycontainer` from an `alpine` image
    with an `sh` shell as its main process. The `-d` option (shorthand for `--detach`)
    sets the container to run in the background, in detached mode, with a pseudo-TTY
    attached (`-t`). The `-i` option is set to keep `STDIN` attached (`-i`), which
    prevents the `sh` process from exiting immediately.
@y
    上のコマンドは `alpine` イメージから `mycontainer` という名前のコンテナーを生成し起動します。
    メインのプロセスとしてシェル `sh` を用います。
    `-d` オプション (`--detach` の短縮形) はコンテナーをデタッチモード、つまりバックグラウンドで実行します。
    また 疑似 TTY をアタッチします (`-t`)。
    `-i` オプションは `STDIN` のアタッチを継続するものです。
    これによって `sh` プロセスが即座に終了しないようにします。
@z

@x
    Next, execute a command on the container.
@y
    次にコンテナー内にてコマンドを実行します。
@z

% snip command...

@x
    This creates a new file `/tmp/execWorks` inside the running container
    `mycontainer`, in the background.
@y
    上のコマンドにより、バックグラウンドで実行中のコンテナー `mycontainer` 内に `/tmp/execWorks` というファイルを新規生成します。
@z

@x
    Next, execute an interactive `sh` shell on the container.
@y
    次に対話シェル `sh` をコンテナー上にて実行します。
@z

% snip command...

@x
    This starts a new shell session in the container `mycontainer`.
@y
    コンテナー `mycontainer` 内に新たなシェルセッションが起動します。
@z

@x
    ### Set environment variables for the exec process (--env, -e) {#env}
@y
    ### exec プロセスでの環境変数設定 (--env, -e) {#env}
@z

@x
    Next, set environment variables in the current bash session.
@y
    次は現在の bash セッション内において環境変数を設定します。
@z

@x
    The `docker exec` command inherits the environment variables that are set at the
    time the container is created. Use the `--env` (or the `-e` shorthand) to
    override global environment variables, or to set additional environment
    variables for the process started by `docker exec`.
@y
    `docker exec` コマンドは、コンテナーが生成された段階で設定される環境変数を受け継ぎます。
    `--env` (短縮形 `-e`) を使うとグローバルな環境変数を上書きします。
    あるいは `docker exec` によって起動したプロセスに対しては追加的に環境変数を設定できます。
@z

@x
    The following example creates a new shell session in the container `mycontainer`,
    with environment variables `$VAR_A` set to `1`, and `$VAR_B` set to `2`.
    These environment variables are only valid for the `sh` process started by that
    `docker exec` command, and aren't available to other processes running inside
    the container.
@y
    以下の例ではコンテナー `mycontainer` 内に新たなシェルセッションを生成し、環境変数 `$VAR_A` に `1`、`$VAR_B` `2` を設定します。
    この環境変数の値は `docker exec` コマンドを起動した `sh` プロセスにおいてのみ有効です。
    つまりコンテナー内で稼働する別プロセスではアクセスすることはできません。
@z

% snip command...

@x
    ### Escalate container privileges (--privileged) {#privileged}
@y
    ### コンテナー権限の昇格 (--privileged) {#privileged}
@z

@x
    See [`docker run --privileged`](/reference/cli/docker/container/run/#privileged).
@y
    [`docker run --privileged`](__SUBDIR__/reference/cli/docker/container/run/#privileged) を参照してください。
@z

@x
    ### Set the working directory for the exec process (--workdir, -w) {#workdir}
@y
    ### exec プロセスに対するワーキングディレクトリ設定 (--workdir, -w) {#workdir}
@z

@x
    By default `docker exec` command runs in the same working directory set when
    the container was created.
@y
    `docker exec` コマンドは、デフォルトでコンテナーが生成されたときと同じワークディレクトリにおいて実行されます。
@z

% snip command...

@x
    You can specify an alternative working directory for the command to execute
    using the `--workdir` option (or the `-w` shorthand):
@y
    ワーキングディレクトリを別の場所に指定したい場合は、このコマンドの実行時に `--workdir` オプション (短縮形 `-w`) を用います。
@z

% snip command...

@x
    ### Try to run `docker exec` on a paused container
@y
    ### 停止コンテナーに対する `docker exec` 実行 {#try-to-run-docker-exec-on-a-paused-container}
@z

@x
    If the container is paused, then the `docker exec` command fails with an error:
@y
    コンテナーが一時停止している場合、`docker exec` はエラー終了します。
@z

% snip command...
% snip directives...
