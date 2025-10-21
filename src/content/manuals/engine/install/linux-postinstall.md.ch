%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

% __SUBDIR__ 対応 / .md リンクへの (no slash) 対応
% snip 対応

@x
description: Find the recommended Docker Engine post-installation steps for Linux
  users, including how to run Docker as a non-root user and more.
keywords: run docker without sudo, docker running as root, docker post install, docker
  post installation, run docker as non root, docker non root user, how to run docker
  in linux, how to run docker linux, how to start docker in linux, run docker on linux
title: Linux post-installation steps for Docker Engine
linkTitle: Post-installation steps
@y
description: Find the recommended Docker Engine post-installation steps for Linux
  users, including how to run Docker as a non-root user and more.
keywords: run docker without sudo, docker running as root, docker post install, docker
  post installation, run docker as non root, docker non root user, how to run docker
  in linux, how to run docker linux, how to start docker in linux, run docker on linux
title: Linux における Docker Engine インストール後の作業
linkTitle: インストール後の作業
@z

@x
These optional post-installation procedures describe how to configure your
Linux host machine to work better with Docker.
@y
ここに示すインストール後の手順は任意の作業であって、ホストマシンに Linux を用いている場合に Docker をより効率よく動作させる方法について説明しています。
@z

@x
## Manage Docker as a non-root user
@y
## root ユーザー以外での Docker 管理 {#manage-docker-as-a-non-root-user}
@z

@x
The Docker daemon binds to a Unix socket, not a TCP port. By default it's the
`root` user that owns the Unix socket, and other users can only access it using
`sudo`. The Docker daemon always runs as the `root` user.
@y
Docker デーモンは TCP ポートではなく Unix ソケットにバインドされます。
デフォルトでその所有者は `root` ユーザーであるため、他のユーザーは `sudo` を使ってアクセスすることになります。
Docker デーモンは常に `root` ユーザーが起動しています。
@z

@x
If you don't want to preface the `docker` command with `sudo`, create a Unix
group called `docker` and add users to it. When the Docker daemon starts, it
creates a Unix socket accessible by members of the `docker` group. On some Linux
distributions, the system automatically creates this group when installing
Docker Engine using a package manager. In that case, there is no need for you to
manually create the group.
@y
`docker` コマンドの実行にあたって `sudo` を用いたくない場合は、`docker` という Unix グループを生成してユーザーをそのグループに加えます。
Docker デーモンが起動したときに生成される Unix ソケットは、`docker` グループに所属するユーザーであればアクセスすることが可能です。
Linux ディストリビューションの中には、パッケージマネージャーを通じて Docker Engine をインストールする際に、そのグループを自動的に生成するものがあります。
その場合は、手動でこのグループを生成する必要はありません。
@z

@x
> [!WARNING]
>
> The `docker` group grants root-level privileges to the user. For
> details on how this impacts security in your system, see
> [Docker Daemon Attack Surface](../security/_index.md#docker-daemon-attack-surface).
@y
> [!WARNING]
>
> `docker` グループは、そのユーザーに対してルートレベルの権限を付与します。
> このことがシステムセキュリティ上でどのような意味を持つのかについては [*Docker Daemon Attack Surface*](../security/index.md#docker-daemon-attack-surface) を参照してください。
@z

@x
> [!NOTE]
>
> To run Docker without root privileges, see
> [Run the Docker daemon as a non-root user (Rootless mode)](../security/rootless.md).
@y
> [!NOTE]
>
> ルート権限なしに Docker をインストールする場合は [非ルートユーザーとして Docker デーモンを起動する (rootless モード)](../security/rootless.md) を参照してください。
@z

@x
To create the `docker` group and add your user:
@y
`docker` グループを生成してユーザーを追加します。
@z

@x
1. Create the `docker` group.
@y
1. `docker` グループを生成します。
@z

% snip command...

@x
2. Add your user to the `docker` group.
@y
2. ユーザーを `docker` グループに追加します。
@z

% snip command...

@x
3. Log out and log back in so that your group membership is re-evaluated.
@y
3. いったんログアウトしてからログインし直してください。
   グループに属することが認識されるようにするためです。
@z

@x
   > If you're running Linux in a virtual machine, it may be necessary to
   > restart the virtual machine for changes to take effect.
@y
   > 仮想マシン上で Linux を稼働させている場合、仮想マシンを再起動して設定を有効にする必要があるかもしれません。
@z

@x
   You can also run the following command to activate the changes to groups:
@y
   グループ変更を有効にするために、以下のコマンドを実行することもできます。
@z

% snip command...

@x
4. Verify that you can run `docker` commands without `sudo`.
@y
4. `sudo` がなくても `docker` コマンドが実行できることを確認します。
@z

% snip command...

@x
   This command downloads a test image and runs it in a container. When the
   container runs, it prints a message and exits.
@y
   このコマンドはテストイメージをダウンロードして、コンテナー内で実行します。
   コンテナーが起動すると、メッセージを表示して終了します。
@z

@x
   If you initially ran Docker CLI commands using `sudo` before adding your user
   to the `docker` group, you may see the following error:
@y
   `docker` グループへのユーザー追加を行わずに `sudo` を使って Docker CLI コマンドを実行していたときは、以下のエラーが出ていたかも知れません。
@z

% snip output...

@x
   This error indicates that the permission settings for the `~/.docker/`
   directory are incorrect, due to having used the `sudo` command earlier.
@y
   このエラーは `~/.docker/` ディレクトリのパーミッションが不適切であることを示しています。
   これは上において `sudo` コマンドを用いていたからです。
@z

@x
   To fix this problem, either remove the `~/.docker/` directory (it's recreated
   automatically, but any custom settings are lost), or change its ownership and
   permissions using the following commands:
@y
   この問題を解消するには、1 つには `~/.docker/` ディレクトリをいったん削除することです。
   （このディレクトリは自動的に再作成されます。ただし追加設定している内容は失われます。）
   あるいは以下のコマンドのようにして、所有者とパーミッションを変更することです。
@z

% snip command...

@x
## Configure Docker to start on boot with systemd
@y
## ブート時の Docker 起動設定 {#configure-docker-to-start-on-boot-with-systemd}
@z

@x
Many modern Linux distributions use [systemd](https://systemd.io/) to
manage which services start when the system boots. On Debian and Ubuntu, the
Docker service starts on boot by default. To automatically start Docker and
containerd on boot for other Linux distributions using systemd, run the
following commands:
@y
最近の Linux ディストリビューションでは [systemd](https://systemd.io/) を使ってシステムブート時のサービス起動の管理を行っています。
Debian や Ubuntu では、デフォルトで Docker サービスがブート時に起動するように設定されています。
他のディストリビューションにおいて Docker や Containerd をブート起動するには、以下のコマンドを用います。
@z

% snip command...

@x
To stop this behavior, use `disable` instead.
@y
この動作を停止させるには、逆に `disable` を用います。
@z

% snip command...

@x
You can use systemd unit files to configure the Docker service on startup,
for example to add an HTTP proxy, set a different directory or partition for the
Docker runtime files, or other customizations. For an example, see
[Configure the daemon to use a proxy](/manuals/engine/daemon/proxy.md#systemd-unit-file).
@y
systemd におけるユニットファイルを使って Docker サービスの自動起動を設定します。
そこではたとえば HTTP プロキシーを設定したり、Docker ランタイムファイル群が別ディレクトリや別パーティションにある場合にはそれを指定するなど、カスタマイズ状況に応じて設定を行います。
具体的な例は [プロキシーを利用するデーモン設定](manuals/engine/daemon/proxy.md#systemd-unit-file) を参照してください。
@z

@x
## Configure default logging driver
@y
## デフォルトのログドライバー設定 {#configure-default-logging-driver}
@z

@x
Docker provides [logging drivers](/manuals/engine/logging/_index.md) for
collecting and viewing log data from all containers running on a host. The
default logging driver, `json-file`, writes log data to JSON-formatted files on
the host filesystem. Over time, these log files expand in size, leading to
potential exhaustion of disk resources.
@y
Docker では [ログドライバー](manuals/engine/logging/_index.md) を通じて、ホスト上に稼動するすべてのコンテナーからログを収集して参照する機能が提供されています。
デフォルトのログドライバーは`json-file`であり、ホスト上のファイルシステム内に JSON 形式のファイルとしてログデータを保存します。
時間の経過とともにログファイルはサイズが増大するため、気づかないうちにディスクリソースを浪費することにつながります。
@z

@x
To avoid issues with overusing disk for log data, consider one of the following
options:
@y
ログデータによりディスクが浪費されるこの問題を解消するには、以下のいずれかを検討してください。
@z

@x
- Configure the `json-file` logging driver to turn on
  [log rotation](/manuals/engine/logging/drivers/json-file.md).
- Use an
  [alternative logging driver](/manuals/engine/logging/configure.md#configure-the-default-logging-driver)
  such as the ["local" logging driver](/manuals/engine/logging/drivers/local.md)
  that performs log rotation by default.
- Use a logging driver that sends logs to a remote logging aggregator.
@y
- ログドライバー `json-file` において [ログローテーション](manuals/engine/logging/drivers/json-file.md) 機能を有効にします。
- ["ローカルの" ログドライバー](manuals/engine/logging/drivers/local.md) などの [別ドライバー](manuals/engine/logging/configure.md#configure-the-default-logging-driver) を利用することで、デフォルトで実現しているログローテーションの機能を利用します。
- ログ出力をリモートのログ収集サーバーへ転送できるようなログドライバーを利用します。
@z

@x
## Next steps
@y
## 次のステップ {#next-steps}
@z

@x
- Take a look at the [Docker workshop](/get-started/workshop/_index.md) to learn how to build an image and run it as a containerized application.
@y
- [Docker ワークショップ](get-started/workshop/_index.md) を確認してみてください。
  そこではイメージのビルド方法や、コンテナー化アプリケーションとしてそれを実行する方法について説明しています。
@z
