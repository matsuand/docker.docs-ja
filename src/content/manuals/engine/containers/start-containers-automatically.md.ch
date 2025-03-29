%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% .md リンクへの (no slash) 対応

@x
description: How to start containers automatically
keywords: containers, restart, policies, automation, administration
title: Start containers automatically
@y
description: コンテナーの自動起動方法
keywords: containers, restart, policies, automation, administration
title: コンテナーの自動起動
@z

@x
Docker provides [restart policies](/manuals/engine/containers/run.md#restart-policies---restart)
to control whether your containers start automatically when they exit, or when
Docker restarts. Restart policies start linked containers in the correct order.
Docker recommends that you use restart policies, and avoid using process
managers to start containers.
@y
Docker では [リスタートポリシー](manuals/engine/containers/run.md#restart-policies---restart) というものを提供しています。
これはコンテナーが終了した際、あるいは Docker そのものが再起動した際に、自動的にコンテナーをリスタート (再起動) するかどうかを制御します。
リスタートポリシーはリンクづいているコンテナーを適切な順に再起動します。
Docker ではリスタートポリシーの利用を推奨しているため、プロセスマネージャーなどを用いてコンテナーを起動させることはやめてください。
@z

@x
Restart policies are different from the `--live-restore` flag of the `dockerd`
command. Using `--live-restore` lets you to keep your containers running during
a Docker upgrade, though networking and user input are interrupted.
@y
リスタートポリシーは、`dockerd` コマンドの `--live-restore` フラグとは異なります。
`--live-restore` は Docker がアップグレードしている最中に、ネットワークやユーザー入力が遮断された状態であっても、コンテナーを起動し続けるためのものです。
@z

@x
## Use a restart policy
@y
## リスタートポリシーの利用 {#use-a-restart-policy}
@z

@x
To configure the restart policy for a container, use the `--restart` flag
when using the `docker run` command. The value of the `--restart` flag can be
any of the following:
@y
コンテナーに対するリスタートポリシーの設定は、`docker run` コマンド実行時に `--restart` フラグを利用します。
`--restart` フラグには以下のいずれかの値を指定します。
@z

@x
| Flag                       | Description                                                                                                                                                                                                                                                                                                                                                           |
| :------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `no`                       | Don't automatically restart the container. (Default)                                                                                                                                                                                                                                                                                                                  |
| `on-failure[:max-retries]` | Restart the container if it exits due to an error, which manifests as a non-zero exit code. Optionally, limit the number of times the Docker daemon attempts to restart the container using the `:max-retries` option. The `on-failure` policy only prompts a restart if the container exits with a failure. It doesn't restart the container if the daemon restarts. |
| `always`                   | Always restart the container if it stops. If it's manually stopped, it's restarted only when Docker daemon restarts or the container itself is manually restarted. (See the second bullet listed in [restart policy details](#restart-policy-details))                                                                                                                |
| `unless-stopped`           | Similar to `always`, except that when the container is stopped (manually or otherwise), it isn't restarted even after Docker daemon restarts.                                                                                                                                                                                                                         |
@y
| フラグ                     | 内容説明                                                                                                                                                                                                                                                                                                                                                              |
| :------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `no`                       | コンテナーのリスタート (再起動) を自動的には行いません。(デフォルト)                                                                                                                                                                                                                                                                                                  |
| `on-failure[:max-retries]` | エラー発生によりコンテナーが終了した場合にリスタートします。マニフェストはゼロ以外のエラーコードです。任意指定として `:max-retries` オプションにより Docker デーモンがリスタートを繰り返す上限数を定めます。`on-failure` ポリシーはあくまでコンテナーがエラー終了したときに起動するものであって、デーモン再起動時には起動しません。                                   |
| `always`                   | コンテナーが終了した場合に常にリスタートします。手動操作による終了を行うなら、Docker デーモンの再起動時またはコンテナー自体の手動再起動時にのみリスタートします。([リスタートポリシーの詳細](#restart-policy-details) における 2 つめの中黒を参照してください。)                                                                                                      |
| `unless-stopped`           | `always` と同様。ただしコンテナーが (手動その他により) 終了した場合、あるいは Docker デーモンが再起動した場合にはリスタートしません。                                                                                                                                                                                                                                 |
@z

@x
The following command starts a Redis container and configures it to always
restart, unless the container is explicitly stopped, or the daemon restarts.
@y
以下のコマンドは Redis コンテナーを起動するものであり、常にリスタートするように設定しています。
ただしコンテナーが明示的に停止された場合やデーモンが再起動された場合は除きます。
@z

% snip command...

@x
The following command changes the restart policy for an already running
container named `redis`.
@y
以下のコマンドは実行中のコンテナー `redis` に対して、そのリスタートポリシーを変更するものです。
@z

% snip command...

@x
The following command ensures all running containers restart.
@y
以下のコマンドは全コンテナーをリスタートさせます。
@z

% snip command...

@x
### Restart policy details
@y
### リスタートポリシーの詳細 {#restart-policy-details}
@z

@x
Keep the following in mind when using restart policies:
@y
リスタートポリシーを利用するにあたっては以下をおさえておく必要があります。
@z

@x
- A restart policy only takes effect after a container starts successfully. In
  this case, starting successfully means that the container is up for at least
  10 seconds and Docker has started monitoring it. This prevents a container
  which doesn't start at all from going into a restart loop.
@y
- リスタートポリシーは、コンテナーが正常起動した場合にこそ有用なものです。
  この場合の正常起動とは、コンテナーが起動開始してから最低でも 10 秒が経過し、Docker がその監視をし始めたときを意味します。
  これは起動することができないコンテナーが、再起動のループには陥らないようにする目的があります。
@z

@x
- If you manually stop a container, the restart policy is ignored until the
  Docker daemon restarts or the container is manually restarted. This prevents
  a restart loop.
@y
- コンテナーを手動で終了した時点では、リスタートポリシーは無視され、Docker デーモンの再起動かコンテナーの手動による再起動のときに評価されます。
  これは再起動ループを避ける目的です。
@z

@x
- Restart policies only apply to containers. To configure restart policies for
  Swarm services, see
  [flags related to service restart](/reference/cli/docker/service/create.md).
@y
- リスタートポリシーはコンテナーにのみ適用されます。
  swarm サービスに対するリスタートポリシーを設定する場合は [サービスリスタート関連のフラグ](reference/cli/docker/service/create.md) を参照してください。
@z

@x
### Restarting foreground containers
@y
### フォアグラウンド実行中のコンテナーのリスタート {#restarting-foreground-containers}
@z

@x
When you run a container in the foreground, stopping a container causes the
attached CLI to exit as well, regardless of the restart policy of the
container. This behavior is illustrated in the following example.
@y
コンテナーをフォアグラウンドで実行している場合、そのコンテナーを終了すると、そこに接続していた CLI も同時に終了します。
これはコンテナーのリスタートポリシーがどのように設定されていても同じことです。
この動きは以下の例を通じて確認できます。
@z

@x
1. Create a Dockerfile that prints the numbers 1 to 5 and then exits.
@y
1. Dockerfile を生成して、1 から 5 の数値を出力した後に終了するものとします。
@z

% snip code...

@x
2. Build an image from the Dockerfile.
@y
2. Dockerfile からイメージをビルドします。
@z

% snip command...

@x
3. Run a container from the image, specifying `always` for its restart policy.
@y
3. そのイメージからコンテナーを実行します。
   リスタートポリシーは `always` を指定します。
@z

@x
   The container prints the numbers 1..5 to stdout, and then exits. This causes
   the attached CLI to exit as well.
@y
   コンテナーは数字の 1 から 5 を標準出力に表示し終了します。
   これに合わせて、接続していた CLI も終了します。
@z

% snip command...

@x
4. Running `docker ps` shows that is still running or restarting, thanks to the
   restart policy. The CLI session has already exited, however. It doesn't
   survive the initial container exit.
@y
4. `docker ps` を実行すると、リスタートポリシーのおかげでコンテナーは実行中、あるいは再起動が行われています。
   ただし CLI セッションは終了したままです。
   つまり最初のコンテナーとともに終了したということです。
@z

% snip command...

@x
5. You can re-attach your terminal to the container between restarts, using the
   `docker container attach` command. It's detached again the next time the
   container exits.
@y
5. 再起動後にそのコンテナーに対してターミナルを再度接続するには `docker container attach` コマンドを用います。
   これは次にもう一度コンテナーが終了すれば、再度切断されます。
@z

% snip command...

@x
## Use a process manager
@y
## プロセスマネージャーの利用 {#use-a-process-manager}
@z

@x
If restart policies don't suit your needs, such as when processes outside
Docker depend on Docker containers, you can use a process manager such as
[systemd](https://systemd.io/) or
[supervisor](http://supervisord.org/) instead.
@y
Docker 外のプロセスが Docker コンテナーに依存しているといった場合、リスタートポリシーの利用が適当ではないことがあります。
その場合は代わりに [systemd](https://systemd.io/) や [supervisor](http://supervisord.org/) といったプロセスマネージャーを用いることになります。
@z

@x
> [!WARNING]
>
> Don't combine Docker restart policies with host-level process managers,
> as this creates conflicts.
@y
> [!WARNING]
>
> Docker のリスタートポリシーとホストレベルのプロセスマネージャーを両方利用することは、衝突が発生するため避けてください。
@z

@x
To use a process manager, configure it to start your container or service using
the same `docker start` or `docker service` command you would normally use to
start the container manually. Consult the documentation for the specific
process manager for more details.
@y
プロセスマネージャーを用いる場合は、普段コンテナーを手動で起動する際に利用している `docker start` や `docker service` といったコマンドを用いて、そのコンテナーを起動するような設定を行います。
プロセスマネージャーの詳細については、個々のドキュメントを参照してください。
@z

@x
### Using a process manager inside containers
@y
### コンテナー内のプロセスマネージャーの利用 {#using-a-process-manager-inside-containers}
@z

@x
Process managers can also run within the container to check whether a process is
running and starts/restart it if not.
@y
プロセスマネージャーはコンテナー内部においても起動することができ、プロセスの起動確認や(再)起動を行うことができます。
@z

@x
> [!WARNING]
>
> These aren't Docker-aware, and only monitor operating system processes within
> the container. Docker doesn't recommend this approach, because it's
> platform-dependent and may differ between versions of a given Linux
> distribution.
@y
> [!WARNING]
>
> これは Docker が関与するものではありません。
> コンテナー内において稼働しているオペレーティングシステムのプロセスを監視するにすぎません。
> Docker ではこの利用をお勧めしません。
> それはプラットフォームに依存するものであり、Linux ディストリビューションのバージョンによっては異なるものかもしれないからです。
@z
