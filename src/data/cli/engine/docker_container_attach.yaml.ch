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
    `docker attach` は端末の標準入力、標準出力、標準エラー出力のいずれか (あるいはそれら 3 つの組み合わせ) を実行コンテナーにアタッチします。
    アタッチはコンテナー ID またはコンテナー名を用いて指定されます。
    これを行うと、コマンド実行を端末内で行ったとしても、その出力確認や対話的制御を実現できます。
@z

@x
    > [!NOTE]
    > The `attach` command displays the output of the container's `ENTRYPOINT` and
    > `CMD` process. This can appear as if the attach command is hung when in fact
    > the process may simply not be writing any output at that time.
@y
    > [!NOTE]
    > `attach` コマンドはコンテナーの `ENTRYPOINT` または `CMD` プロセスの出力を表示します。
    > この際にそれらのプロセスは、実際には本当に何も出力していないことがあるため、このアタッチコマンドがハングしているかのように見える場合があります。
@z

@x
    You can attach to the same contained process multiple times simultaneously,
    from different sessions on the Docker host.
@y
    この操作は同一のコンテナープロセスに対して、Docker ホスト上の別セッションからであれば、同時に何個でもアタッチすることができます。
@z

@x
    To stop a container, use `CTRL-c`. This key sequence sends `SIGKILL` to the
    container. If `--sig-proxy` is true (the default),`CTRL-c` sends a `SIGINT` to
    the container. If the container was run with `-i` and `-t`, you can detach from
    a container and leave it running using the `CTRL-p CTRL-q` key sequence.
@y
    コンテナーを停止するには `CTRL-c` を入力します。
    このキーシーケンスはコンテナーに対して `SIGKILL` を送信します。
    `--sig-proxy` が true (デフォルト) の場合、`CTRL-c` はコンテナーに `SIGINT` を送信します。
    コンテナーの起動に `-i` および `-t` をつけて実行していた場合、キーシーケンス `CTRL-p CTRL-q` を入力すればコンテナーからデタッチされ、コンテナーは起動し続けます。
@z

@x
    > [!NOTE]
    > A process running as PID 1 inside a container is treated specially by
    > Linux: it ignores any signal with the default action. So, the process
    > doesn't terminate on `SIGINT` or `SIGTERM` unless it's coded to do so.
@y
    > [!NOTE]
    > コンテナー内部での PID 1 のプロセスは Linux 上では特別に扱われます。
    > デフォルト動作ではどんなシグナルであっても無視します。
    > したがってプログラミングがされていない限り、プロセスが `SIGINT` や `SIGTERM` によって停止することはありません。
@z

@x
    You can't redirect the standard input of a `docker attach` command while
    attaching to a TTY-enabled container (using the `-i` and `-t` options).
@y
    TTY を有効にしたコンテナー (`-i` および `-t` オプション利用時) へアタッチしている場合は、`docker attach` の標準入力をリダイレクトすることはできません。
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
    `docker attach` を使ってクライアントがコンテナーの `stdio` にアタッチした際には、Docker はそのアプリケーションのスループットを最大化するように、メモリバッファーを 1MB まで確保します。
    このバッファーがいっぱいになった場合、API 接続の速度に影響し、特に出力処理の書き込み速度を低減させます。
    このことは SSH のようなアプリケーションにおいても見られることです。
    したがって多くの出力を生成するフォアグラウンドアプリケーションであって、低速のクライアント接続を行うような場合には、パフォーマンスに影響を及ぼすことになるため、そういった利用はお勧めできません。
    その場合は `docker logs` コマンドを使ってログ出力を行ってください。
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
      description: コンテナーデタッチ時のキーシーケンスを上書きします。
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
    ### 実行コンテナーのアタッチとデタッチ {#attach-to-and-detach-from-a-running-container}
@z

@x
    The following example starts an Alpine container running `top` in detached mode,
    then attaches to the container;
@y
    以下の例は `top` を実行する Alpine コンテナーをデタッチモードで起動します。
    そしてそのコンテナーにアタッチします。
@z

% snip command...

@x
    As the container was started without the `-i`, and `-t` options, signals are
    forwarded to the attached process, which means that the default `CTRL-p CTRL-q`
    detach key sequence produces no effect, but pressing `CTRL-c` terminates the
    container:
@y
    コンテナーは `-i` や `-t` オプションを用いずに起動されているので、シグナルはアタッチされたプロセスに送信されます。
    このことからデフォルトのデタッチキーシーケンス `CTRL-p CTRL-q` は動作しません。
    `CTRL-c` を入力すればコンテナーを停止できます。
@z

% snip output...

@x
    Repeating the example above, but this time with the `-i` and `-t` options set;
@y
    上の例をもう一度実行します。
    ただし今回は `-i` と `-t` オプションをつけます。
@z

% snip command...

@x
    Now, when attaching to the container, and pressing the `CTRL-p CTRL-q` ("read
    escape sequence"), the Docker CLI is handling the detach sequence, and the
    `attach` command is detached from the container. Checking the container's status
    with `docker ps` shows that the container is still running in the background:
@y
    今度はコンテナーにアタッチして `CTRL-p CTRL-q` ("read escape sequence") を入力すると、Docker CLI はデタッチシーケンスを処理します。
    そして `attach` コマンドはコンテナーからデタッチされます。
    `docker ps` を使ってコンテナーのステータスを確認すると、コンテナーがまだバックグラウンドで実行していることがわかります。
@z

% snip command...

@x
    ### Get the exit code of the container's command
@y
    ### コンテナーコマンドの終了コード取得 {#get-the-exit-code-of-the-containers-command}
@z

@x
    And in this second example, you can see the exit code returned by the `bash`
    process is returned by the `docker attach` command to its caller too:
@y
    2 つめのこの例では `bash` プロセスによって返される終了コードを確認します。
    これは `docker attach` コマンドが呼び出し元に対して返すものです。
@z

% snip command...

@x
    ### Override the detach sequence (--detach-keys) {#detach-keys}
@y
    ### デタッチシーケンスの上書き (--detach-keys) {#detach-keys}
@z

@x
    Use the `--detach-keys` option to override the Docker key sequence for detach.
    This is useful if the Docker default sequence conflicts with key sequence you
    use for other applications. There are two ways to define your own detach key
    sequence, as a per-container override or as a configuration property on  your
    entire configuration.
@y
    `--detach-keys` オプションを使うと、Docker デタッチ用のキーシーケンスを上書きすることができます。
    これは Docker のデフォルトキーシーケンスが、アプリケーションにおいて利用するキーシーケンスと衝突する場合に活用することができます。
    デタッチキーシーケンスの定義方法は 2 つあります。
    設定を行うにあたって個々のコンテナーに対する上書きとするのか、設定プロパティとして上書きするのかです。
@z

@x
    To override the sequence for an individual container, use the
    `--detach-keys="<sequence>"` flag with the `docker attach` command. The format of
    the `<sequence>` is either a letter [a-Z], or the `ctrl-` combined with any of
    the following:
@y
    個別のコンテナーに対してのシーケンスを上書きするには、`docker attach` コマンドの `--detach-keys="<sequence>"` フラグを用います。
    `<sequence>` の書式は [a-Z] の 1 文字とするか、あるいは以下のいずれかと `ctrl-` を組み合わせるかです。
@z

@x
    * `a-z` (a single lowercase alpha character )
    * `@` (at sign)
    * `[` (left bracket)
    * `\\` (two backward slashes)
    *  `_` (underscore)
    * `^` (caret)
@y
    * `a-z` (単一の英小文字)
    * `@` (アットマーク)
    * `[` (左ブラケット)
    * `\\` (2 つのバックスラッシュ)
    *  `_` (アンダースコア)
    * `^` (キャレット)
@z

@x
    These `a`, `ctrl-a`, `X`, or `ctrl-\\` values are all examples of valid key
    sequences. To configure a different configuration default key sequence for all
    containers, see [**Configuration file** section](/reference/cli/docker/#configuration-files).
@y
    `a`、`ctrl-a`、`X`、`ctrl-\\` といった記述は、いずれもキーシーケンスとして正しいものです。
    コンテナーすべてについてデフォルトキーシーケンスを設定する別の方法としては、[**設定ファイル** の節](__SUBDIR__/reference/cli/docker/#configuration-files) を参照してください。
@z

% snip directives...
