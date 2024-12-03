%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Install Compose standalone
description: How to install Docker Compose - Other Scenarios
keywords: compose, orchestration, install, installation, docker, documentation
@y
title: Compose のスタンドアローンインストール
description: Docker Compose のインストール - 別の手法
keywords: compose, orchestration, install, installation, docker, documentation
@z

@x
On this page you can find instructions on how to install Compose standalone on Linux or Windows Server, from the command line.
@y
このページでは Linux または Windows Server 上において、コマンドラインを使ってスタンドアローンの Compose をインストールする手順を示します。
@z

@x
### On Linux
@y
### Linux {#on-linux}
@z

@x
> [!WARNING]
>
> Note that Compose standalone uses the `-compose` syntax instead of the current standard syntax `compose`.  
>For example type `docker-compose up` when using Compose standalone, instead of `docker compose up`.
@y
> [!WARNING]
>
> スタンドアローンの Compose では、現時点の標準文法となっている `compose` ではなく `-compose` を利用します。
>たとえばスタンドアローンの Compose では `docker compose up` ではなく `docker-compose up` と入力してください。
@z

@x
1. To download and install Compose standalone, run:
@y
1. 以下を実行して、スタンドアローンの Compose をダウンロードしインストールします。
@z

% snip command...

@x
2. Apply executable permissions to the standalone binary in the target path for the installation.
@y
2. インストール先となっているパス内のスタンドアローンバイナリーに対して実行パーミッションを与えます。
@z

% snip command...

@x
3. Test and execute Compose commands using `docker-compose`.
@y
3. `docker-compose` を実行して Compose コマンドの実行を確認します。
@z

@x
   > [!TIP]
   >
   > If the command `docker-compose` fails after installation, check your path.
   > You can also create a symbolic link to `/usr/bin` or any other directory in your path.
   > For example:
   > ```console
   > $ sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
   > ```
@y
   > [!TIP]
   >
   > インストール後に `docker-compose` コマンドが失敗した場合は、インストールパスを確認してください。
   > また `/usr/bin` あるいはパスとしている別のディレクトリへのリンクを生成して対処することもできます。
   > たとえば以下のとおりです。
   > ```console
   > $ sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
   > ```
@z

@x
### On Windows Server
@y
### Windows Server {#on-windows-server}
@z

@x
Follow these instructions if you are running the Docker daemon and client directly
on Microsoft Windows Server and want to install Docker Compose.
@y
Microsoft Windows Server において Docker デーモンおよびクライアントを利用していて Docker Compose をインストールする場合は、以下の手順に従います。
@z

@x
1.  Run PowerShell as an administrator.
    When asked if you want to allow this app to make changes to your device, select **Yes** in order to proceed with the installation.
@y
1.  PowerShell を管理者権限で起動します。
    アプリからデバイスに対しての変更を許可するように問われたら、**はい** を選んでインストール作業を進めます。
@z

@x
2.  GitHub now requires TLS1.2. In PowerShell, run the following:
@y
2.  GitHub は現時点で TLS1.2 を必要とします。
    PowerShell において以下を実行します。
@z

% snip code...

@x
3. Run the following command to download the latest release of Compose ({{% param "compose_version" %}}):
@y
3. 以下のコマンドを実行して Compose の最新リリース ({{% param "compose_version" %}}) をダウンロードします。
@z

% snip code...

@x
    > [!NOTE]
    >
    > On Windows Server 2019 you can add the Compose executable to `$Env:ProgramFiles\Docker`.
     Because this directory is registered in the system `PATH`, you can run the `docker-compose --version` 
     command on the subsequent step with no additional configuration.
@y
    > [!NOTE]
    >
    > Windows Server 2019 においては、Compose 実行ファイルを `$Env:ProgramFiles\Docker` にインストールすることもできます。
    > このディレクトリはシステムの `PATH` に登録されているため、この後の手順においては、特になにも設定せずに `docker-compose --version` コマンドを実行することができます。
@z

@x
4.  Test the installation.
@y
4.  インストール結果を確認します。
@z

% snip command...
