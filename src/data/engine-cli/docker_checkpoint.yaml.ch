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
short: チェックポイントを管理します。
long: |-
    チェックポイントとリストアは試験的な機能です。
    この機能を用いるとチェックポイントを指定して実行中コンテナーを一時停止させることができます。
    コンテナーの状態はディスク上の一連のファイルに変換されます。
    後にコンテナーは一時停止されたポイントから回復させることができます。
@z

@x
    This is accomplished using a tool called [CRIU](https://criu.org), which is an
    external dependency of this feature. A good overview of the history of
    checkpoint and restore in Docker is available in this
    [Kubernetes blog post](https://kubernetes.io/blog/2015/07/how-did-quake-demo-from-dockercon-work/).
@y
    この機能は [CRIU](https://criu.org) と呼ばれる外部依存ツールを使って実現しています。
    Docker におけるチェックポイントとリストアに関する開発経緯については [Kubernetes ブログポスト](https://kubernetes.io/blog/2015/07/how-did-quake-demo-from-dockercon-work/) にまとめられています。
@z

@x
    ### Installing CRIU
@y
    ### CRIU のインストール {#installing-criu}
@z

@x
    If you use a Debian system, you can add the CRIU PPA and install with `apt-get`
    [from the CRIU launchpad](https://launchpad.net/~criu/+archive/ubuntu/ppa).
@y
    Debian システムを利用している場合、CRIU PPA を追加することで [CRIU launchpad](https://launchpad.net/~criu/+archive/ubuntu/ppa) から `apt-get` を使ってインストールすることができます。
@z

@x
    Alternatively, you can [build CRIU from source](https://criu.org/Installation).
@y
    別の方法として [CRIU をソースからビルド](https://criu.org/Installation) することもできます。
@z

@x
    You need at least version 2.0 of CRIU to run checkpoint and restore in Docker.
@y
    Docker におけるチェックポイントとリストア機能を利用するには、CRIU のバージョンが最低でも 2.0 でなければなりません。
@z

@x
    ### Use cases for checkpoint and restore
@y
    ### チェックポイントとリストアのユースケース {#use-cases-for-checkpoint-and-restore}
@z

@x
    This feature is currently focused on single-host use cases for checkpoint and
    restore. Here are a few:
@y
    本機能は今のところ、単一のホストについてチェックポイントとリストアを行うことを想定しています。
    ユースケースとしていくつかをあげます。
@z

@x
    - Restarting the host machine without stopping/starting containers
    - Speeding up the start time of slow start applications
    - "Rewinding" processes to an earlier point in time
    - "Forensic debugging" of running processes
@y
    - コンテナーを停止/再起動することなく、ホストマシンを再起動できます。
    - 起動に時間がかかるアプリケーションの初動を早めることができます。
    - プロセスを以前の時点に「巻き戻す」ことができます。
    - 実行プロセスを「フォレンジックに (法的に) デバッグ」することができます。
@z

@x
    Another primary use case of checkpoint and restore outside of Docker is the live
    migration of a server from one machine to another. This is possible with the
    current implementation, but not currently a priority (and so the workflow is
    not optimized for the task).
@y
    チェックポイントとリストアについてよく見られるユースケースは、1 つのマシン上のサーバーを別のマシンにライブ移行することです。
    これは現時点の実装において可能ですが、ただし今のところ優先度は高く設定されていません (したがってこのタスクに対する作業は最適には行われていません)。
@z

@x
    ### Using checkpoint and restore
@y
    ### チェックポイントとリストアの利用 {#using-checkpoint-and-restore}
@z

@x
    A new top level command `docker checkpoint` is introduced, with three subcommands:
@y
    トップレベルコマンド `docker checkpoint` が導入されており、そこに 3 つのサブコマンドがあります。
@z

@x
    - `docker checkpoint create` (creates a new checkpoint)
    - `docker checkpoint ls` (lists existing checkpoints)
    - `docker checkpoint rm` (deletes an existing checkpoint)
@y
    - `docker checkpoint create` (新規チェックポイントの生成)
    - `docker checkpoint ls` (既存チェックポイントの一覧表示)
    - `docker checkpoint rm` (既存チェックポイントの削除)
@z

@x
    Additionally, a `--checkpoint` flag is added to the `docker container start` command.
@y
    さらに `docker container start` コマンドには `--checkpoint` フラグが加えられています。
@z

@x
    The options for `docker checkpoint create`:
@y
    `docker checkpoint create` のオプションは以下のとおりです。
@z

@x
    ```console
    Usage:  docker checkpoint create [OPTIONS] CONTAINER CHECKPOINT

    Create a checkpoint from a running container

      --leave-running=false    Leave the container running after checkpoint
      --checkpoint-dir         Use a custom checkpoint storage directory
    ```
@y
    ```console
    Usage:  docker checkpoint create [OPTIONS] CONTAINER CHECKPOINT

    Create a checkpoint from a running container

      --leave-running=false    Leave the container running after checkpoint
      --checkpoint-dir         Use a custom checkpoint storage directory
    ```
@z

@x
    And to restore a container:
@y
    コンテナーのリストアは以下のようにします。
@z

% snip command...

@x
    Example of using checkpoint and restore on a container:
@y
    コンテナーにおいてチェックポイントとリストアを行う例が以下です。
@z

% snip command...

@x
    This process just logs an incrementing counter to stdout. If you run `docker logs`
    in-between running/checkpoint/restoring, you should see that the counter
    increases while the process is running, stops while it's frozen, and
    resumes from the point it left off once you restore.
@y
    この処理プロセスでは、カウンターを加算して stdout にログ出力します。
    コンテナーの起動/チェックポイント設定/リストアの各タイミングで `docker logs` を実行すれば、コンテナー起動中はカウンターが加算され、停止中は加算がなく、そしてリストアを行った後は中断していた時点から再開する様子を見ることができます。
@z

@x
    ### Known limitations
@y
    ### 既知の制約 {#known-limitations}
@z

@x
    `seccomp` is only supported by CRIU in very up-to-date kernels.
@y
    `seccomp` が CRIU によりサポートされているのは、ごく最近のカーネルのみです。
@z

@x
    External terminals (i.e. `docker run -t ..`) aren't supported.
    If you try to create a checkpoint for a container with an external terminal,
    it fails:
@y
    外部端末 (つまり `docker run -t ..`) はサポートされません。
    外部端末を使ってコンテナーに対してチェックポイントを生成しようとすると、エラーが発生します。
@z

% snip command...

@x
usage: docker checkpoint
@y
usage: docker checkpoint
@z

% cname:
% clink:
% inherited_options:

@x help
      description: Print usage
@y
      description: 利用方法を表示します。
@z

% snip directives...
